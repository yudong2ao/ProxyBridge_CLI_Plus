# ProxyBridge 🚀

**ProxyBridge** 是一款 Windows 进程级透明代理与流量分流增强包。它可以让指定软件（如 Chrome、特定游戏或开发工具）的网络流量自动走代理，无需在软件内部单独配置。

---

## ✨ 亮点特色

- 🎯 **进程级分流**：按软件程序名自由指定是否走代理，简单高效。
- 🖥️ **网页可视化配置 (`ProfileMake.html`)**：双击网页即可编辑节点与规则，支持直接选择 `.exe` 程序追加分流。
- ⚡ **开机静默自启 (`一键配置自启.bat`)**：一键配置后台静默自启，开机即用，无弹窗打扰。
- 🔄 **无缝升级**：完全兼容官方配置格式，后续官方核心更新时直接替换相关文件即可升级。

---

## 📂 项目组成

```text
ProxyBridge/
├── ProfileMake.html       # 网页版配置文件生成器 (可视化编辑)
├── 一键配置自启.bat       # 开机静默自启一键配置脚本
├── Default.pbprofile      # 默认配置文件
├── ProxyBridge_CLI.exe    # 核心运行程序
├── ProxyBridgeCore.dll   # 核心动态链接库
├── WinDivert.dll          # 底层网络驱动库
└── WinDivert64.sys        # 底层网络驱动
```

---

## 🚀 使用说明

### 1. 修改配置
用浏览器打开 `ProfileMake.html`，可视化添加代理节点与分流规则，导出并覆盖 `Default.pbprofile`。

### 2. 运行与自启
- **开机自启（推荐）**：右键管理员运行 `一键配置自启.bat` 即可完成后台静默自启配置。
- **手动运行**：以管理员身份运行 `ProxyBridge_CLI.exe --profile "Default.pbprofile"`。

---

## 🤝 致谢与关于

本项目**基于官方开源项目 ProxyBridge** 提取了核心运行组件，并配套设计了可视化配置生成器与一键静默自启脚本，旨在提供更便携的使用体验。

在此特别感谢官方 **ProxyBridge** 项目及开源社区的贡献！
