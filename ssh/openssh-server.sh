#!/bin/bash
# 安装和启动ssh
echo "开始安装openssh-server"
yum install openssh-server
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bac
touch /etc/ssh/sshd_config
cat ./sshd_config > /etc/ssh/sshd_config
sudo service sshd start
ip addr
echo "开启ssh成功"