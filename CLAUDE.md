# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Alphalens is a performance analysis library for predictive (alpha) stock factors. It's a Python library originally developed by Quantopian and improved by cloudQuant, designed to help analyze the effectiveness of trading signals/factors.

## Key Commands

### Installation
```bash
# Install dependencies (empyrical from git repository)
pip install -r requirements.txt

# Or install empyrical manually first:
pip install -U git+https://github.com/cloudQuant/empyrical.git  # International
pip install -U git+https://gitee.com/yunjinqi/empyrical.git     # China

# Install alphalens in development mode
pip install -U -e .
```

### Running Tests
```bash
# Run all tests with parallel execution
pytest tests/ -n 4

# Run specific test file
pytest tests/test_utils.py
pytest tests/test_performance.py
pytest tests/test_tears.py

# Run with coverage
pytest tests/ --cov=alphalens

# Test across multiple Python versions (3.8-3.13)
./test_python_versions_simple.sh    # Linux/Mac
test_python_versions_simple.bat     # Windows
```

### Linting
```bash
flake8 alphalens/ --exclude=versioneer.py
```

### Git Workflow
```bash
# The repository is configured to push to both remotes simultaneously:
# - Gitee (primary): https://gitee.com/yunjinqi/alphalens.git  
# - GitHub (mirror): https://github.com/cloudQuant/alphalens.git

# Regular git push will push to both repositories
git push

# Check remote configuration
git remote -v
```

## CI/CD Pipeline

### GitHub Actions Workflows

The project includes comprehensive CI/CD automation:

1. **tests.yml** - Continuous Integration
   - Runs on push/PR to master/main/develop branches
   - Tests across multiple OS (Ubuntu, Windows, macOS) and Python versions (3.8-3.13)
   - Includes linting, coverage reporting, and package building
   - Uploads test artifacts on failures

2. **publish.yml** - Package Publishing
   - Triggers on GitHub releases or manual dispatch
   - Builds and publishes to PyPI/Test PyPI
   - Includes distribution validation

3. **debug.yml** - Debugging Support
   - Manual dispatch or debug-* branch pushes
   - Verbose output for troubleshooting CI issues

### Local Testing Commands
```bash
# Install test dependencies
pip install -r requirements-test.txt

# Run tests with coverage (warnings suppressed by pytest.ini)
pytest tests/ --cov=alphalens --cov-report=term

# Run specific test file
pytest tests/test_utils.py -v

# Run specific test class/method
pytest tests/test_performance.py::PerformanceTestCase::test_information_coefficient_0 -v

# Run linting
flake8 alphalens/ --exclude=versioneer.py,_version.py

# Build package
python -m build
```

### Pytest Configuration

The project includes an optimized `pytest.ini` that suppresses common warnings:
- pandas_datareader deprecation warnings
- setuptools deprecation warnings  
- pandas FutureWarnings for groupby operations
- matplotlib datetime and plotting warnings
- numpy calculation warnings (divide by zero, invalid values)
- pytest-benchmark warnings when using xdist

## Architecture Overview

### Core Modules

1. **alphalens/utils.py**: Core utilities for data processing
   - `get_clean_factor_and_forward_returns()`: Main entry point for factor data preparation
   - `quantize_factor()`: Converts factor values into quantiles
   - Factor data validation and cleaning functions

2. **alphalens/performance.py**: Performance metrics calculation
   - `factor_information_coefficient()`: Calculates IC between factor values and returns
   - `mean_return_by_quantile()`: Computes returns for each factor quantile
   - `factor_returns()`: Calculates factor-weighted portfolio returns
   - `factor_alpha_beta()`: Computes alpha and beta relative to benchmark

3. **alphalens/plotting.py**: Visualization functions
   - Individual plotting functions for IC, returns, turnover analysis
   - Matplotlib-based visualizations with seaborn styling
   - Supports both notebook and IDE environments

4. **alphalens/tears.py**: Tear sheet generation
   - `create_full_tear_sheet()`: Comprehensive factor analysis report
   - `create_returns_tear_sheet()`: Returns-focused analysis
   - `create_information_tear_sheet()`: IC-focused analysis
   - `create_event_study_tear_sheet()`: Event-driven analysis

### Data Structure

The core data structure is a MultiIndex DataFrame with:
- Index levels: (date, asset)
- Columns:
  - `factor`: The alpha factor values
  - `factor_quantile`: Factor quantile assignments
  - Forward returns columns (e.g., `1D`, `5D`, `10D`)
  - Optional: `group` for sector/industry analysis

### Key Workflows

1. **Factor Analysis Pipeline**:
   ```python
   factor_data = alphalens.utils.get_clean_factor_and_forward_returns(
       factor, prices, quantiles=5, periods=(1, 5, 10)
   )
   alphalens.tears.create_full_tear_sheet(factor_data)
   ```

2. **Custom Analysis**:
   - Use individual functions from `performance.py` for specific metrics
   - Create custom visualizations using `plotting.py` functions
   - Combine metrics for specialized tear sheets

## Testing Considerations

- Tests use synthetic data generation for reproducibility
- Matplotlib backend set to 'Agg' in tests to avoid display issues
- Some tests in test_tears.py may be commented out due to interactive plotting

## Documentation

The project includes comprehensive bilingual documentation:
- **README.md**: Complete project documentation with English/Chinese language toggle
- **CLAUDE.md**: Development guidance for Claude Code instances
- **Examples**: Jupyter notebooks demonstrating various analysis scenarios

## Recent Improvements

- **Enhanced Documentation**: Added comprehensive bilingual README with language toggle
- **CI/CD Pipeline**: Complete GitHub Actions workflows for testing and publishing
- **Cross-platform Testing**: Automated testing across Python 3.8-3.13 and multiple OS
- **Enhanced Visualizations**: Fixed returns plots to show all holding periods (not just 1-day)
- **Python Compatibility**: Updated deprecated pandas methods (`.get_values()` → `.to_numpy()`)
- **Dual Repository Support**: Configured to push simultaneously to GitHub and Gitee