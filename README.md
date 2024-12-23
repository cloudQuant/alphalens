# alphalens

#### 介绍
基于quantopian的因子分析框架alphalens，进行改进优化

#### 安装方法
```bash
# 安装python3.11, python3.11有性能上的提升，并且很多包都已经支持，下面是anaconda的一些镜像，仅供参考
# win：https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2023.09-0-Windows-x86_64.exe
# mac m系列: https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2023.09-0-MacOSX-arm64.sh
# ubuntu:https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/Anaconda3-2023.09-0-Linux-x86_64.sh

# 克隆项目
git clone https://gitee.com/yunjinqi/alphalens.git   # 国内用户
git clone https://github.com/cloudQuant/alphalens.git  # 国外用户

# 安装依赖
pip install -r ./alphalens/requirements.txt

# 安装alphalens
pip install -U ./alphalens

# 测试, test_tears.py测试用例注释掉了，需要自己打开测试，运行pytest的时候需要把图片一个个关闭，太麻烦
pytest ./alphalens/tests/ -n 4

```



#### 改进计划
- [ ] 改进因子分析的过程中不合理的一些代码
- [ ] 改进图形显示只在notebook上显示比较好,在pycharm和vscode上显示不好的问题

#### alphalens改进

- [x] 2022-12-06 改进画出来收益率的时候只显示持仓一天的收益率图，修改过后显示所有持仓时间的收益率图
- [x] 2022-12-02 改进一些因为python包更新导致报警告信息
- [x] 2022-12-02 将tears.py中的get_values()函数改为to_numpy()

