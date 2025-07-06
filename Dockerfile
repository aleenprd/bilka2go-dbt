# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Install basics and configure locale
RUN apt-get update && apt-get -y install sudo && \
    apt-get install -y locales && \
    sed -i -e 's/# da_DK.UTF-8 UTF-8/da_DK.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && apt-get -y install git

# Environment variables
ENV LANG=da_DK.UTF-8 
ENV LC_ALL=da_DK.UTF-8 
ENV USER_NAME=homerdbt 
ENV PROJECT_NAME=${USER_NAME}
ENV USER_HOME=/home/${USER_NAME}
ENV PROJECT_DIR=${USER_HOME}/${PROJECT_NAME}

# Create non-root user
RUN groupadd --system ${USER_NAME} --gid 1000 && \
    useradd --uid 1000 --system --gid ${USER_NAME} --home-dir \
    /home/${USER_NAME} --create-home --shell /sbin/nologin \
    --comment "Docker image user" ${USER_NAME} && \
    chown -R ${USER_NAME}:${USER_NAME} ${USER_HOME}

# Copy required files and folders
COPY ${PROJECT_NAME} ${USER_HOME}
COPY .dbt ${USER_HOME}/.dbt
COPY pyproject.toml ${USER_HOME}/pyproject.toml

# Set the actual working directory
WORKDIR ${USER_HOME}

# Upgrade pip and install Poetry
RUN pip install --upgrade pip && pip install --no-cache-dir poetry && \
    poetry self add poetry-plugin-export && \
    poetry lock && poetry export -f requirements.txt --output requirements.txt && \
    pip install --no-cache-dir -r requirements.txt

# Set user
USER ${USER_NAME}

# Finally execute the DBT code
ENTRYPOINT [ "/bin/bash", "-l", "-c" ]
