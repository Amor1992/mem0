# mem0 项目

## 📝 项目描述
mem0 记忆管理和AI对话项目 - 专注于记忆提取、存储和智能管理系统

## 🎯 项目目标
- 🧠 记忆管理系统开发
- 💬 AI对话历史存储
- 🤖 mem0 集成和优化
- 📊 数据分析和可视化
- 🔄 自动化备份和同步

## 🚀 快速开始

### 项目结构
```
mem0/
├── README.md          # 项目说明
├── auto_sync.sh       # 自动同步脚本
├── check_sync.sh      # 状态检查脚本
└── sync.log          # 同步日志
```

### 功能特性
- ✅ Git 版本控制
- ✅ 自动化 GitHub 同步
- ✅ 定时任务调度
- ✅ 状态监控脚本

## ⏰ 自动同步配置

### 定时任务
- **频率**: 每天晚上 7:00
- **任务**: 自动同步到 GitHub
- **分支**: main
- **仓库**: https://github.com/Amor1992/mem0

### 使用方法

#### 手动同步
```bash
cd /home/amor/mem0
./auto_sync.sh
```

#### 检查状态
```bash
cd /home/amor/mem0
./check_sync.sh
```

#### 查看同步日志
```bash
cat /home/amor/mem0/sync.log
```

## 🔧 技术栈

### 当前配置
- **版本控制**: Git + GitHub
- **自动化**: Shell Scripts + Cron
- **数据库**: SQLite (用于记忆存储)
- **AI 集成**: mem0 (计划中)

### 开发环境
- **操作系统**: Ubuntu 22.04.5 LTS
- **Shell**: Bash
- **Git 用户**: Amor Liu (414235438@qq.com)

## 📅 项目日志

### 2026-03-07
- ✅ 创建 GitHub 仓库
- ✅ 配置 Git 版本控制
- ✅ 设置自动同步脚本
- ✅ 配置定时任务 (每天 19:00)
- ✅ 添加状态监控功能

## 🔄 维护说明

### 定时任务管理
```bash
# 查看定时任务
crontab -l

# 编辑定时任务
crontab -e

# 删除定时任务
crontab -r
```

### Git 操作
```bash
# 查看状态
git status

# 查看日志
git log --oneline

# 远程操作
git remote -v
git push origin main
```

## 📊 监控和日志

### 同步日志位置
- `/home/amor/mem0/sync.log`

### 日志内容
- 同步开始时间
- Git 操作详情
- 推送结果状态
- 错误信息（如有）

## 🛠️ 故障排除

### 同步失败
1. 检查网络连接
2. 验证 GitHub 凭据
3. 查看同步日志
4. 手动运行同步脚本测试

### 定时任务不执行
1. 检查 crontab 配置
2. 确认脚本权限
3. 查看 cron 服务状态
4. 检查系统日志

## 📞 联系方式

- **GitHub**: [@Amor1992](https://github.com/Amor1992)
- **Email**: 414235438@qq.com

## 📜 许可证

本项目采用开源许可证，具体信息 TBD。

---

**创建时间**: 2026-03-07
**最后更新**: 2026-03-07
**维护者**: Amor Liu
**仓库**: https://github.com/Amor1992/mem0