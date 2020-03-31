# home working

在家办公。

适用于Linux后台开发。

NOTE: 我已不再使用此工具，因我已找到更好的更专业的替代品：frp

# Why?

获得一个高效的远程办公环境，由于本人是后端开发，因此有一个shell即可拥有速度和体验。

问题在于怎么让家里的电脑能够连接到公司的内网机器。

# How?

使用ssh反向代理。

内网机器（工作电脑） <-> 公网机器（比如腾讯云） <-> 任意机器（家里笔记本）

## 环境需求：

1. Linux操作系统（我使用Ubuntu18.04）
2. 一台云主机（我使用腾讯云）
3. 所有系统安装好ssh服务，并添加好自己的密钥

## 步骤

1. 在公司内网机器，云主机，家里电脑上，拉取版本库，然后进入项目目录：

```bash
$ cd homeworking
```

然后修改配置文件：

```bash
$ cp detail/config.sh.tmp detail/config.sh
$ chmod +x detail/config.sh
$ vim detail/config.sh
```

2. 在公司内网机器上执行：

```bash
$ ./internal_agent_start.sh
$ ./save_internal_agent_backend.sh
```

3. 在云主机上执行：

```bash
$ ./public_agent_start.sh
$ ./save_connect_backend.sh
```

4. 在家里的电脑上执行：

```bash
$ ./connect_internal.sh
```

一切正常即可连接到内网机器。

# What's more?

## ssh config

为了更方便的ssh登录办公室的机器，可以为 ~/.ssh/config 文件添加一项配置，比如：

```ssh
Host office
        HostName 66.66.66.66 # 公网ip
        User diwen # 内网用户
        IdentityFile ~/.ssh/Identity_dev
        Port 7002 # 公网开放端口
        ServerAliveInterval 30
```

然后可以这样登录：

```bash
$ ssh office
```

## X server

启用X server，从而可以打开GUI应用程序：

```bash
$ ssh -X -C -c chacha20-poly1305@openssh.com office
```
-X 表示启用X11，-C表示压缩数据，-c指示压缩算法，压缩的目的是提高传输速度。

也可以直接加入ssh config:

```bash
Host office
        HostName 66.66.66.66 # 公网ip
        User diwen # 内网用户
        IdentityFile ~/.ssh/Identity_dev
        Port 7002 # 公网开放端口
        ServerAliveInterval 30
        ForwardX11 yes 
        Compression yes 
        Ciphers chacha20-poly1305@openssh.com
```

然后直接 ssh office

## vscode remote ssh

使用 vscode 的 Remote-SSH 插件，远程挂载一个内部机器的工作目录进行开发调试。

ctrl+shift+p, 键入 remote-ssh 。

see what happened, Enjoy~
