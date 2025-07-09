# Bilka2Go DBT Project

A data transformation project for Bilka2Go using dbt (data build tool) with BigQuery.

## Project Overview

This project contains dbt models that transform raw data from the Bilka2Go e-commerce platform. The project is structured according to dbt best practices with staging models and intermediate models for different product categories like groceries, electronics, home goods, etc.

## Prerequisites

- Python 3.12+
- [UV](https://github.com/astral-sh/uv) - A fast Python package installer and resolver
- Google Cloud Platform account with BigQuery access
- Service account credentials with appropriate permissions

## Setup with UV

[UV](https://github.com/astral-sh/uv) is a modern Python package manager that's significantly faster than pip. This project uses UV for dependency management.

### Installing UV

If you don't have UV installed yet:

```bash
# Install UV using pip
pip install uv

# Or using curl
curl -sSf https://astral.sh/uv/install.sh | bash
```

### Creating a Virtual Environment with UV

```bash
# Navigate to the project directory
cd bilka2go-dbt

# Create a new virtual environment in .venv directory
uv venv

# Activate the virtual environment
source .venv/bin/activate
```

### Installing Dependencies with UV

```bash
# Install dependencies from uv.lock (recommended for exact versions)
uv sync
```

## Configuration

### Environment Variables

Use .env.example to build your environment variables.

### dbt Profile Setup

There is already a *.dbt/profiles.yaml* file which you need for your dbt connection. If can use a keyfile in JSON format or environment variables to authenticate with a service account. Alternatively, look into identity workload federation for best practices.

## Running dbt Commands

After setting up your environment and configuration:

```bash
# Install dbt packages
dbt deps

# Run dbt models
dbt run

# Build models (run + test)
dbt build 

# Run specific models
dbt run --select staging.stg_snapshot__groceries

# Generate documentation
dbt docs generate

# Serve documentation locally
dbt docs serve

# Run snapshots
dbt snapshot
```

## Project Structure

- `models/`: Contains SQL models organized in staging and intermediate directories
- `snapshots/`: Contains snapshot configurations for change data capture
- `macros/`: Contains reusable SQL macros
- `tests/`: Contains custom tests
- `seeds/`: Contains CSV files that can be loaded as tables
- `analyses/`: Contains one-off analyses

## Docker Support

This project includes Docker support. To build and run using Docker:

```bash
# Build the Docker image
docker build -t bilka2go-dbt .

# Run dbt commands in Docker; build the entire project for example
docker run bilka2go-dbt "dbt build"
```

## Development Workflow

1. Create or update snapshots in the `snapshots/` directory
2. Create staging models in `models/staging/` to clean and prepare the data
3. Create intermediate models in `models/intermediate/` for business logic transformations
4. Run tests to ensure data quality
5. Generate and review documentation

## Troubleshooting

If you encounter issues with BigQuery authentication:
- Check that environment variables are properly set
- Verify that your service account has the required permissions
- Make sure your `profiles.yml` is correctly configured

For any other issues, check the dbt logs in the `logs/` directory.

## Contributing

1. Create a new branch for your feature or bug fix
2. Make changes and test locally
3. Submit a pull request with a clear description of changes

## License

This project is licensed under the MIT License - see the LICENSE file for details.
