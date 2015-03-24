---
layout: post
title: "jekyll博客部署"
description: "Dumps decrypted mach-o files from encrypted app extensions to a file"
category: iOS
tags: [FD]
imagefeature: blog/bg.jpg
comments: true
mathjax: null
featured: false
published: true
---

https://github.com/jekyll/jekyll
http://jekyllrb.com/docs/installation/

##Install Homebrew
http://brew.sh/

	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

##install ruby
https://www.ruby-lang.org/en/documentation/installation/#homebrew

	$ brew install ruby

##sources change
http://ruby.taobao.org/

	$ gem sources --remove https://rubygems.org/
	$ gem sources -a https://ruby.taobao.org/
	$ gem sources -l
*** CURRENT SOURCES ***

https://ruby.taobao.org
# 请确保只有 ruby.taobao.org

The tag stylesheet in ./_layouts/base.html is not a recognized

##Download RubyGems
https://rubygems.org/pages/download

$ gem update --system

##配置多个 git 账号

https://help.github.com/articles/generating-ssh-keys/

	$ cat ~/.gitconfig  

	$ ls -al ~/.ssh

	$ ssh-keygen -t rsa -C "youremail@gmail.com"

	$ pbcopy < ~/.ssh/id_rsa.pub

	$ vi config

	git config user.name "用户名"
	git config user.email "邮箱"

\# gitlab
Host gitlab.com
    HostName gitlab.alibaba-inc.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa

\# github
Host github.com
    HostName github.com
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/id_rsa_github

	$ ssh -T git@github.com

http://riny.net/2014/git-ssh-key/


##bundle install
http://www.pchou.info/web-build/2014/07/04/build-github-blog-page-08.html

	$ gem install bundle
	$ gem install jekyll



>注意：
根目录的Gemfile文件加入
source 'http://ruby.taobao.org/'

	$ bundle install

>出现：
An error occurred while installing nokogiri (1.6.6.2), and Bundler cannot continue.
Make sure that `gem install nokogiri -v '1.6.6.2'` succeeds before bundling.
则需要执行
$ xcode-select --install

 * http://127.0.0.1:4000/


