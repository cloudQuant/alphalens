# GitHub Actions Workflows

This directory contains the CI/CD workflows for the alphalens project.

## Workflows

### 1. tests.yml - Continuous Integration
- **Triggers**: Push to master/main/develop, Pull Requests, Manual dispatch
- **Jobs**:
  - `test`: Runs tests across multiple OS (Ubuntu, Windows, macOS) and Python versions (3.8-3.13)
  - `test-minimal`: Quick smoke test on Ubuntu with Python 3.11
  - `coverage`: Generates test coverage reports and uploads to Codecov
  - `lint`: Runs flake8 linting checks
  - `build`: Builds the package and validates it

### 2. publish.yml - Package Publishing
- **Triggers**: GitHub releases, Manual dispatch
- **Jobs**:
  - `build`: Creates distribution packages
  - `test-pypi`: Publishes to Test PyPI (optional)
  - `pypi`: Publishes to PyPI

### 3. debug.yml - Debugging
- **Triggers**: Manual dispatch, Push to debug-* branches
- **Purpose**: Debug CI issues with verbose output

## Setup Requirements

For publishing to PyPI, you need to set up the following repository secrets:
- `PYPI_API_TOKEN`: PyPI API token for publishing
- `TEST_PYPI_API_TOKEN`: Test PyPI API token (optional)

## Testing Locally

To run the same tests locally:

```bash
# Install test dependencies
pip install -r requirements-test.txt

# Run tests
pytest tests/ -v

# Run with coverage
pytest tests/ --cov=alphalens --cov-report=term

# Run linting
flake8 alphalens/ --exclude=versioneer.py,_version.py
```