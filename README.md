# Alphalens

<!-- Language Toggle -->
**Language / 语言:**
[![English](https://img.shields.io/badge/Language-English-blue)](#english) | [![中文](https://img.shields.io/badge/语言-中文-red)](#中文)

---

## English

### Overview

Alphalens is a Python library for performance analysis of predictive (alpha) stock factors. Originally developed by Quantopian, this enhanced version by cloudQuant provides improved functionality and better visualization capabilities for quantitative factor analysis.

**Key Features:**
- Comprehensive factor performance analysis
- Information Coefficient (IC) analysis  
- Quantile-based return analysis
- Turnover and alpha decay analysis
- Rich visualization and tear sheet generation
- Event study capabilities
- Cross-platform CI/CD pipeline

### Installation

#### Prerequisites
- Python 3.8+ (Python 3.11+ recommended for better performance)
- Required packages: numpy, pandas, scipy, matplotlib, seaborn, statsmodels, empyrical

#### Install from Source

```bash
# Clone the repository
git clone https://github.com/cloudQuant/alphalens.git  # International users
git clone https://gitee.com/yunjinqi/alphalens.git     # China users

# Install dependencies
pip install -r requirements.txt

# Install alphalens in development mode  
pip install -e .

# Verify installation
python -c "import alphalens; print(f'Alphalens {alphalens.__version__} installed successfully')"
```

#### Install from PyPI (when available)
```bash
pip install alphalens-reloaded
```

### Quick Start

```python
import alphalens
import pandas as pd
import numpy as np

# Prepare your data
# factor: DataFrame with DatetimeIndex and assets as columns
# prices: DataFrame with DatetimeIndex and assets as columns

# Example with synthetic data
dates = pd.date_range('2020-01-01', periods=252, freq='D')
assets = ['AAPL', 'GOOGL', 'MSFT', 'AMZN', 'TSLA']

# Create synthetic factor data
factor = pd.DataFrame(
    np.random.randn(252, 5),
    index=dates,
    columns=assets
)

# Create synthetic price data
prices = pd.DataFrame(
    np.random.randn(252, 5).cumsum() + 100,
    index=dates,
    columns=assets
)

# Clean and prepare factor data
factor_data = alphalens.utils.get_clean_factor_and_forward_returns(
    factor.stack(),
    prices,
    quantiles=5,
    periods=(1, 5, 10)
)

# Generate comprehensive tear sheet
alphalens.tears.create_full_tear_sheet(factor_data)
```

### Core Modules

#### 1. `alphalens.utils`
Data preparation and cleaning utilities:
- `get_clean_factor_and_forward_returns()`: Main data preparation function
- `quantize_factor()`: Convert factor values to quantiles
- Data validation and alignment functions

#### 2. `alphalens.performance` 
Performance metrics calculation:
- `factor_information_coefficient()`: Calculate IC between factors and returns
- `mean_return_by_quantile()`: Compute returns by factor quantiles
- `factor_returns()`: Calculate factor-weighted portfolio returns
- `factor_alpha_beta()`: Compute factor alpha and beta

#### 3. `alphalens.plotting`
Visualization functions:
- IC analysis plots
- Returns and cumulative returns plots  
- Turnover analysis charts
- Quantile-based performance visualizations

#### 4. `alphalens.tears`
Comprehensive analysis tear sheets:
- `create_full_tear_sheet()`: Complete factor analysis
- `create_returns_tear_sheet()`: Returns-focused analysis
- `create_information_tear_sheet()`: IC-focused analysis
- `create_event_study_tear_sheet()`: Event study analysis

### Development

#### Running Tests
```bash
# Run all tests
pytest tests/ -v

# Run tests with coverage
pytest tests/ --cov=alphalens --cov-report=term

# Run tests across Python versions
./test_python_versions_simple.sh    # Linux/Mac
test_python_versions_simple.bat     # Windows
```

#### Code Quality
```bash
# Linting
flake8 alphalens/ --exclude=versioneer.py,_version.py

# Build package
python -m build
```

### CI/CD Pipeline

The project includes comprehensive GitHub Actions workflows:
- **tests.yml**: Cross-platform testing (Ubuntu, Windows, macOS) across Python 3.8-3.13
- **publish.yml**: Automated PyPI publishing on releases
- **debug.yml**: Debugging workflow for CI issues

### Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Recent Improvements

- **Enhanced Visualizations**: Fixed returns plots to display all holding periods
- **Python Compatibility**: Updated deprecated pandas methods for modern versions
- **CI/CD Pipeline**: Added comprehensive testing and automated publishing
- **Documentation**: Improved examples and API documentation

### License

Licensed under the Apache License, Version 2.0. See [LICENSE](LICENSE) for details.

### Citation

If you use Alphalens in academic research, please cite:

```
@software{alphalens_reloaded,
  title={Alphalens: Performance analysis of predictive alpha factors},
  author={Quantopian Inc. and cloudQuant},
  url={https://github.com/cloudQuant/alphalens},
  year={2024}
}
```

---

## 中文

### 概述

Alphalens 是一个用于预测性（alpha）股票因子性能分析的 Python 库。本项目基于 Quantopian 开发的原始版本，由 cloudQuant 进行改进优化，为量化因子分析提供了增强的功能和更好的可视化能力。

**核心特性：**
- 全面的因子性能分析
- 信息系数（IC）分析
- 基于分位数的收益分析  
- 换手率和 alpha 衰减分析
- 丰富的可视化和分析报告
- 事件研究功能
- 跨平台 CI/CD 流水线

### 安装说明

#### 环境要求
- Python 3.8+（推荐 Python 3.11+ 以获得更好性能）
- 依赖包：numpy, pandas, scipy, matplotlib, seaborn, statsmodels, empyrical

#### 从源码安装

```bash
# 克隆仓库
git clone https://github.com/cloudQuant/alphalens.git  # 国外用户
git clone https://gitee.com/yunjinqi/alphalens.git     # 国内用户

# 安装依赖
pip install -r requirements.txt

# 以开发模式安装 alphalens
pip install -e .

# 验证安装
python -c "import alphalens; print(f'Alphalens {alphalens.__version__} 安装成功')"
```

#### 从 PyPI 安装（可用时）
```bash
pip install alphalens-reloaded
```

### 快速开始

```python
import alphalens
import pandas as pd
import numpy as np

# 准备数据
# factor: 以日期为索引、资产为列的 DataFrame
# prices: 以日期为索引、资产为列的 DataFrame

# 合成数据示例
dates = pd.date_range('2020-01-01', periods=252, freq='D')
assets = ['AAPL', 'GOOGL', 'MSFT', 'AMZN', 'TSLA']

# 创建合成因子数据
factor = pd.DataFrame(
    np.random.randn(252, 5),
    index=dates,
    columns=assets
)

# 创建合成价格数据
prices = pd.DataFrame(
    np.random.randn(252, 5).cumsum() + 100,
    index=dates,
    columns=assets
)

# 清理和准备因子数据
factor_data = alphalens.utils.get_clean_factor_and_forward_returns(
    factor.stack(),
    prices,
    quantiles=5,
    periods=(1, 5, 10)
)

# 生成综合分析报告
alphalens.tears.create_full_tear_sheet(factor_data)
```

### 核心模块

#### 1. `alphalens.utils`
数据准备和清理工具：
- `get_clean_factor_and_forward_returns()`: 主要数据准备函数
- `quantize_factor()`: 将因子值转换为分位数
- 数据验证和对齐函数

#### 2. `alphalens.performance`
性能指标计算：
- `factor_information_coefficient()`: 计算因子与收益的 IC
- `mean_return_by_quantile()`: 计算因子分位数收益
- `factor_returns()`: 计算因子加权组合收益
- `factor_alpha_beta()`: 计算因子 alpha 和 beta

#### 3. `alphalens.plotting`
可视化函数：
- IC 分析图表
- 收益和累积收益图表
- 换手率分析图表
- 基于分位数的性能可视化

#### 4. `alphalens.tears`
综合分析报告：
- `create_full_tear_sheet()`: 完整因子分析
- `create_returns_tear_sheet()`: 收益重点分析
- `create_information_tear_sheet()`: IC 重点分析
- `create_event_study_tear_sheet()`: 事件研究分析

### 开发指南

#### 运行测试
```bash
# 运行所有测试
pytest tests/ -v

# 运行测试并生成覆盖率报告
pytest tests/ --cov=alphalens --cov-report=term

# 跨 Python 版本测试
./test_python_versions_simple.sh    # Linux/Mac
test_python_versions_simple.bat     # Windows
```

#### 代码质量检查
```bash
# 代码规范检查
flake8 alphalens/ --exclude=versioneer.py,_version.py

# 构建包
python -m build
```

### CI/CD 流水线

项目包含完整的 GitHub Actions 工作流：
- **tests.yml**: 跨平台测试（Ubuntu、Windows、macOS），支持 Python 3.8-3.13
- **publish.yml**: 发布时自动推送到 PyPI
- **debug.yml**: CI 问题调试工作流

### 贡献指南

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交更改 (`git commit -m 'Add amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 创建 Pull Request

### 最近改进

- **增强可视化**: 修复收益图表以显示所有持有期间
- **Python 兼容性**: 更新已弃用的 pandas 方法以适配新版本
- **CI/CD 流水线**: 添加全面的测试和自动化发布
- **文档**: 改进示例和 API 文档

### 许可证

采用 Apache License 2.0 许可证。详见 [LICENSE](LICENSE) 文件。

### 引用

如果您在学术研究中使用 Alphalens，请引用：

```
@software{alphalens_reloaded,
  title={Alphalens: Performance analysis of predictive alpha factors},
  author={Quantopian Inc. and cloudQuant},
  url={https://github.com/cloudQuant/alphalens},
  year={2024}
}
```

---

<div align="center">

**[⬆ Back to Top](#alphalens) | [English](#english) | [中文](#中文)**

Made with ❤️ by [cloudQuant](https://github.com/cloudQuant)

</div>