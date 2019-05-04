# home working

在家办公。

适用于Linux后台开发。

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

1. 在公司内网机器，云主机，家里电脑上，拉取版本库：

```bash
$ git clone git@github.com:demon90s/homeworking.git
$ cd homeworking
```

然后修改配置文件：

```bash
$ vim detail/config.sh
```

2. 在公司内网机器上执行：

```bash
$ ./internal_agent_start.sh
```

3. 在云主机上执行：

```bash
$ public_agent_start.sh
$ save_connect_backend.sh
```

4. 在家里的电脑上执行：

```bash
$ ./connect_internal.sh
```

一切正常即可连接到内网机器。
