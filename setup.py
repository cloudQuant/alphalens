#!/usr/bin/env python
from setuptools import setup, find_packages
from alphalens import versioneer
import sys

long_description = ''

if 'upload' in sys.argv:
    with open('README.rst') as f:
        long_description = f.read()

install_reqs = [
    'matplotlib',
    'numpy',
    'pandas',
    'scipy',
    'seaborn',
    'statsmodels',
    'IPython',
    # Note: empyrical should be installed via git
    # pip install -U git+https://github.com/cloudQuant/empyrical.git
    'empyrical @ git+https://github.com/cloudQuant/empyrical.git',
]

extra_reqs = {
    'test': [
        "pytest>=6.0",
        "pytest-xdist>=2.0",
        "pytest-cov>=2.10",
        "pytest-sugar>=0.9",
        "pytest-benchmark>=3.4",
        "pytest-picked>=0.4",
        "parameterized>=0.7",
        "flake8>=3.7.9",
    ],
}

if __name__ == "__main__":
    setup(
        name='alphalens',
        version=versioneer.get_version(),
        cmdclass=versioneer.get_cmdclass(),
        description='Performance analysis of predictive (alpha) stock factors',
        author='Quantopian Inc. and cloudQuant',
        author_email='yunjinqi@gmail.com',
        packages=find_packages(include='alphalens.*'),
        package_data={
            'alphalens': ['examples/*'],
        },
        long_description=long_description,
        classifiers=[
            'Development Status :: 5 - Production/Stable',
            'Intended Audience :: Developers',
            'License :: OSI Approved :: Apache Software License',
            'Natural Language :: English',
            'Operating System :: OS Independent',
            'Programming Language :: Python :: 2.7',
            'Programming Language :: Python :: 3.4',
            'Programming Language :: Python :: 3.5',
            'Programming Language :: Python',
            'Topic :: Utilities',
            'Topic :: Office/Business :: Financial',
            'Topic :: Scientific/Engineering :: Information Analysis',
        ],
        url='https://gitee.com/yunjinqi/alphalens',
        install_requires=install_reqs,
        extras_require=extra_reqs,
    )
