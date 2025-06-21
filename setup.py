#!/usr/bin/env python3
"""
One Stone Capital EAM (External Asset Manager) System
Setup script for ERPNext custom app
"""

from setuptools import setup, find_packages
import os

# Read the README file
def read_readme():
    readme_path = os.path.join(os.path.dirname(__file__), 'README.md')
    if os.path.exists(readme_path):
        with open(readme_path, 'r', encoding='utf-8') as f:
            return f.read()
    return "One Stone Capital EAM (External Asset Manager) System"

setup(
    name="onestone_eam",
    version="1.0.0",
    description="Wealth/EAM (External Asset Manager) system for One Stone Capital",
    long_description=read_readme(),
    long_description_content_type="text/markdown",
    author="One Stone Capital",
    author_email="admin@onestonecapital.com",
    url="https://onestonecapital.com",
    license="MIT",
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    classifiers=[
        "Development Status :: 4 - Beta",
        "Environment :: Web Environment",
        "Framework :: Frappe",
        "Intended Audience :: Financial and Insurance Industry",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Topic :: Office/Business :: Financial :: Investment",
    ],
    python_requires=">=3.8",
    install_requires=[
        "frappe>=15.0.0",
        "erpnext>=15.0.0",
    ],
    extras_require={
        "dev": [
            "pytest>=6.0",
            "pytest-cov>=2.0",
            "black>=21.0",
            "flake8>=3.8",
        ],
    }
) 