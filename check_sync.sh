#!/bin/bash
# mem0 项目状态检查脚本

PROJECT_DIR="/home/amor/mem0"
cd "$PROJECT_DIR" || exit 1

echo "📊 mem0 项目状态检查"
echo "====================="
echo ""

# 检查 Git 状态
echo "🔍 Git 状态:"
git status -sb
echo ""

# 检查最新提交
echo "📝 最新提交:"
git log -1 --oneline
echo ""

# 检查远程连接
echo "🌐 远程仓库:"
git remote -v
echo ""

# 检查分支
echo "🌿 当前分支:"
git branch --show-current
echo ""

# 检查定时任务
echo "⏰ 定时任务:"
crontab -l | grep mem0
echo ""

# 显示同步日志（最近10行）
echo "📋 最近同步日志:"
if [ -f "sync.log" ]; then
    tail -10 sync.log
else
    echo "暂无同步日志"
fi

echo ""
echo "✅ 检查完成！"