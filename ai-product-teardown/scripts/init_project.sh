#!/bin/bash
# AI产品拆解项目初始化脚本
# 用法: bash init_project.sh "产品名称"

PRODUCT_NAME="$1"

if [ -z "$PRODUCT_NAME" ]; then
    echo "用法: bash init_project.sh \"产品名称\""
    exit 1
fi

PROJECT_DIR="$HOME/Desktop/${PRODUCT_NAME}_拆解"

if [ -d "$PROJECT_DIR" ]; then
    echo "⚠️  项目文件夹已存在：$PROJECT_DIR"
    echo "如需重新初始化，请先删除或重命名现有文件夹。"
    exit 1
fi

mkdir -p "$PROJECT_DIR"

echo "✅ 项目文件夹已创建：$PROJECT_DIR"
echo ""
echo "📁 文件结构："
echo "  ${PRODUCT_NAME}_拆解/"
echo "  ├── 00_拆解概览.md"
echo "  ├── 01_市场层.md       (待创建)"
echo "  ├── 02_商业层.md       (待创建)"
echo "  ├── 03_用户层.md       (待创建)"
echo "  ├── 04_技术层.md       (待创建)"
echo "  ├── 05_模型层.md       (待创建)"
echo "  ├── 06_基础层.md       (待创建)"
echo "  └── 07_总结与架构图.md  (待创建)"
