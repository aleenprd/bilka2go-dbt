# Use an official slim Python runtime as a parent image
FROM python:3.12-slim

# Environment variables
ENV USR_NAME=appuser 
ENV USR_GRPN=appgroup 
ENV USR_GRPID=1024 
ENV USER_HOME=/usr/local/${USR_NAME}

# Install git
RUN apt-get update && apt-get -y install --no-install-recommends git && rm -rf /var/lib/apt/lists/* && pip install uv

# Install Python dependencies
COPY ./pyproject.toml /pyproject.toml
COPY ./uv.lock /uv.lock
RUN uv export --no-hashes --format requirements-txt > requirements.txt && \
    pip install --no-cache-dir -r requirements.txt

# Copy required files and folders
COPY bilka2godbt ${USER_HOME}
COPY /.dbt ${USER_HOME}/.dbt

# Create a non-root user in the 1024 group
RUN addgroup --gid ${USR_GRPID} ${USR_GRPN} && \
    useradd -ms /bin/bash -d ${USER_HOME} -g ${USR_GRPN} ${USR_NAME} 

# Set the actual working directory as src
WORKDIR ${USER_HOME}

# Install DBT dependencies
RUN dbt deps

# Finally execute the DBT code
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
