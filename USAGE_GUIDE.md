# mem0 项目使用指南

## 🎯 项目概览

**仓库名称**: mem0
**GitHub地址**: https://github.com/Amor1992/mem0
**本地路径**: /home/amor/mem0
**分支**: main

## ⏰ 自动同步功能

### 定时任务配置
- **执行时间**: 每天晚上 19:00
- **同步目标**: GitHub main 分支
- **自动提交**: 有变更时自动提交并推送

### 工作流程
1. **19:00** - Cron 触发自动同步脚本
2. **拉取更新** - 从 GitHub 拉取最新代码
3. **添加变更** - 将本地变更添加到暂存区
4. **自动提交** - 生成带时间戳的提交信息
5. **推送到GitHub** - 推送到 main 分支

## 🚀 常用命令

### 项目管理
```bash
# 进入项目目录
cd /home/amor/mem0

# 查看项目状态
./check_sync.sh

# 手动同步到GitHub
./auto_sync.sh

# 查看同步日志
cat sync.log
```

### Git 操作
```bash
# 查看Git状态
git status

# 查看提交历史
git log --oneline

# 查看远程仓库信息
git remote -v

# 手动推送
git push origin main

# 拉取最新代码
git pull origin main
```

### 定时任务管理
```bash
# 查看当前定时任务
crontab -l

# 编辑定时任务
crontab -e

# 验证cron服务状态
systemctl status cron

# 重启cron服务
sudo systemctl restart cron
```

## 📊 监控和维护

### 检查同步状态
```bash
# 运行状态检查脚本
cd /home/amor/mem0
./check_sync.sh
```

状态检查包含：
- Git 状态
- 最新提交信息
- 远程仓库连接
- 当前分支
- 定时任务配置
- 最近同步日志

### 查看同步日志
```bash
# 查看完整日志
cat /home/amor/mem0/sync.log

# 查看最近10行
tail -10 /home/amor/mem0/sync.log

# 实时监控日志
tail -f /home/amor/mem0/sync.log
```

### 同步日志格式
```
[时间戳] === 开始同步 mem0 项目 ===
[时间戳] 拉取远程更新...
[时间戳] 添加文件到暂存区...
[时间戳] 提交更改...
[时间戳] 推送到GitHub...
[时间戳] ✅ 同步成功！
[时间戳] === 同步完成 ===
```

## 🔧 脚本说明

### auto_sync.sh - 自动同步脚本
**功能**: 自动执行 Git 同步操作
**调用**: 定时任务或手动执行
**日志**: 记录到 sync.log

**主要步骤**:
1. 切换到项目目录
2. 拉取远程更新
3. 添加所有变更
4. 提交变更（带时间戳）
5. 推送到 GitHub

### check_sync.sh - 状态检查脚本
**功能**: 显示项目当前状态
**调用**: 手动执行
**输出**: 终端显示

**检查内容**:
- Git 工作区状态
- 最新提交信息
- 远程仓库配置
- 当前分支信息
- 定时任务配置
- 最近同步日志

## 🛠️ 故障排除

### 同步失败常见原因

#### 1. 网络连接问题
**症状**: 无法连接到 GitHub
**解决**:
```bash
# 测试网络连接
ping github.com

# 检查GitHub服务状态
curl https://status.github.com/api/status.json
```

#### 2. 认证问题
**症状**: 推送时提示权限不足
**解决**:
```bash
# 重新配置Git认证
gh auth setup-git

# 验证GitHub登录状态
gh auth status
```

#### 3. 文件权限问题
**症状**: 脚本无法执行
**解决**:
```bash
# 添加执行权限
chmod +x /home/amor/mem0/auto_sync.sh
chmod +x /home/amor/mem0/check_sync.sh
```

#### 4. 定时任务不执行
**症状**: 19:00 没有自动同步
**解决**:
```bash
# 检查cron服务
systemctl status cron

# 查看cron日志
sudo tail -f /var/log/syslog | grep CRON

# 手动测试脚本
cd /home/amor/mem0 && ./auto_sync.sh
```

### 紧急恢复步骤

#### Git 出问题时
```bash
# 1. 备份当前状态
cp -r /home/amor/mem0 /home/amor/mem0_backup

# 2. 重新克隆仓库
cd /home/amor
rm -rf mem0
gh repo clone Amor1992/mem0

# 3. 恢复脚本
# （从备份中恢复 auto_sync.sh 和 check_sync.sh）
```

#### 需要手动同步时
```bash
# 1. 进入项目目录
cd /home/amor/mem0

# 2. 查看当前状态
git status

# 3. 手动处理冲突（如有）
git mergetool

# 4. 强制同步（谨慎使用）
git push origin main --force
```

## 📈 性能优化

### 减少同步频率
如需调整同步时间，编辑定时任务：
```bash
crontab -e

# 改为每天晚上9点
0 21 * * * /home/amor/mem0/auto_sync.sh

# 改为每6小时一次
0 */6 * * * /home/amor/mem0/auto_sync.sh
```

### 日志管理
```bash
# 清理旧日志（保留最近100行）
tail -100 /home/amor/mem0/sync.log > /home/amor/mem0/sync.log.tmp
mv /home/amor/mem0/sync.log.tmp /home/amor/mem0/sync.log

# 或者设置日志轮转
# 在 auto_sync.sh 中添加日志大小检查
```

## 🔄 更新和维护

### 更新项目配置
1. 修改相应文件
2. 提交变更: `git add . && git commit -m "更新说明"`
3. 推送到GitHub: `git push origin main`

### 添加新功能
1. 创建新的脚本文件
2. 添加执行权限: `chmod +x new_script.sh`
3. 测试脚本功能
4. 提交到版本控制

## 📞 获取帮助

- **GitHub Issues**: https://github.com/Amor1992/mem0/issues
- **项目文档**: https://github.com/Amor1992/mem0/blob/main/README.md
- **本地日志**: /home/amor/mem0/sync.log

---

**最后更新**: 2026-03-07
**维护者**: Amor Liu