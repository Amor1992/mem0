#!/bin/bash
# mem0 项目自动同步脚本
# 每天晚上7点自动同步到GitHub

# 设置项目路径
PROJECT_DIR="/home/amor/mem0"
LOG_FILE="/home/amor/mem0/sync.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# 记录日志函数
log_message() {
    echo "[$DATE] $1" >> "$LOG_FILE"
}

log_message "=== 开始同步 mem0 项目 ==="

# 切换到项目目录
cd "$PROJECT_DIR" || {
    log_message "错误：无法切换到项目目录 $PROJECT_DIR"
    exit 1
}

# 拉取最新代码
log_message "拉取远程更新..."
git pull origin main >> "$LOG_FILE" 2>&1

# 添加所有更改
log_message "添加文件到暂存区..."
git add . >> "$LOG_FILE" 2>&1

# 检查是否有更改需要提交
if git diff --quiet --cached; then
    log_message "没有新的更改需要提交"
else
    # 提交更改
    log_message "提交更改..."
    git commit -m "自动同步: $(date '+%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE" 2>&1

    # 推送到远程仓库
    log_message "推送到GitHub..."
    git push origin main >> "$LOG_FILE" 2>&1

    if [ $? -eq 0 ]; then
        log_message "✅ 同步成功！"
    else
        log_message "❌ 同步失败！"
    fi
fi

log_message "=== 同步完成 ==="
echo "" >> "$LOG_FILE"