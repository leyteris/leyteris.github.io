---
title:  "在bash和zsh配置环境变量path的几种方法"
date:   2017-12-20T10:47:00+08:00
categories: FD
---

## 参考文献

老习惯，列出本文**参考**或**引用**或**转载**的文档和博客，致以崇高的敬意，感兴趣的可以去看看
1.[http://postgresapp.com/](http://postgresapp.com/)
2.[http://postgresapp.com/documentation/cli-tools.html](http://postgresapp.com/documentation/cli-tools.html)
3.[http://www.yiibai.com/postgresql/2013080439.html](http://www.yiibai.com/postgresql/2013080439.html)
4.终极 Shell——ZSH： [https://zhuanlan.zhihu.com/p/19556676](https://zhuanlan.zhihu.com/p/19556676)
5.Zsh安装配置指南 [http://www.linuxidc.com/Linux/2013-09/90377.htm](http://www.linuxidc.com/Linux/2013-09/90377.htm)

## 1.简介

mac 一般使用bash作为默认shell
在 Linux 里执行这个命令和 Mac 略有不同，你会发现 Mac 多了一个 zsh，也就是说 OS X 系统预装了个 zsh，这是个神马 Shell 呢？
目前常用的 Linux 系统和 OS X 系统的默认 Shell 都是 bash，但是真正强大的 Shell 是深藏不露的 zsh， 这货绝对是马车中的跑车，跑车中的飞行车，史称『终极 Shell』，但是由于配置过于复杂，所以初期无人问津，很多人跑过来看看 zsh 的配置指南，什么都不说转身就走了。直到有一天，国外有个穷极无聊的程序员开发出了一个能够让你快速上手的zsh项目，叫做「oh my zsh」，Github 网址是：[https://github.com/robbyrussell/oh-my-zsh**](https://link.zhihu.com/?target=https://github.com/robbyrussell/oh-my-zsh)。

## 2.正文

### 2.1 bash中设置环境变量path的几种方法

Mac系统的环境变量，加载顺序为：

/etc/profile
/etc/paths
~/.bash_profile
~/.bash_login
~/.profile
~/.bashrc

当然/etc/profile和/etc/paths是系统级别的，系统启动就会加载，后面几个是当前用户级的环境变量。后面3个按照从前往后的顺序读取，如果~/.bash_profile文件存在，则后面的几个文件就会被忽略不读了，如果~/.bash_profile文件不存在，才会以此类推读取后面的文件。~/.bashrc没有上述规则，它是bash shell打开的时候载入的。

如果没特殊说明,设置PATH的语法都为：

```
#中间用冒号隔开
export PATH=$PATH:<PATH 1>:<PATH 2>:<PATH 3>:------:<PATH N>
```

### （一）全局设置

下面的几个文件设置是全局的，修改时需要root权限

1. /etc/paths （全局建议修改这个文件 ）

   编辑 paths，将环境变量添加到 paths文件中 ，一行一个路径
   Hint：输入环境变量时，不用一个一个地输入，只要拖动文件夹到 Terminal 里就可以了。

2. /etc/profile （建议不修改这个文件 ）

   全局（公有）配置，不管是哪个用户，登录时都会读取该文件。

3. etc/bashrc （一般在这个文件中添加系统级环境变量）

   全局（公有）配置，bash shell执行时，不管是何种方式，都会读取此文件。

4. ​

   1.创建一个文件：
   sudo touch /etc/paths.d/mysql
   2.用 vim 打开这个文件（如果是以 open -t 的方式打开，则不允许编辑）：
   sudo vim /etc/paths.d/mysql
   3.编辑该文件，键入路径并保存（关闭该 Terminal 窗口并重新打开一个，就能使用 mysql 命令了）
   /usr/local/mysql/bin
   据说，这样可以自己生成新的文件，不用把变量全都放到 paths 一个文件里，方便管理。

（二）单个用户设置

1）~/.bash_profile （任意一个文件中添加用户级环境变量）
（注：Linux 里面是 .bashrc 而 Mac 是 .bash_profile）
若bash shell是以login方式执行时，才会读取此文件。该文件仅仅执行一次!默认情况下,他设置一些环境变量
设置命令别名alias ll=’ls -la’
设置环境变量：

```
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
```

2）~/.bashrc 同上

如果想立刻生效，则可执行下面的语句：
$ source 相应的文件
一般环境变量更改后，重启后生效。

### 2.2 解决 Mac 下配置环境变量在 ZSH 中无效的问题

在配置 gradle 的时候, 发现在 /etc/profiles 中设置了环境变量后, 还是不能在 zsh 中使用. 但在 Terminal 中可以正常使用. 后来发现是因为没有在 .zshrc 中配置.

在终端中输入: cat ~/.zshrc 以此来查看 .zshrc 文件, 找到里面的 “ # User configuration “ 部分. 可以看到当前 zsh 支持的所有本地已配置环境变量.

在 export PATH=”XXXX” 里面追加一条想要配置的环境变量路径.

重启 item2 即可。
