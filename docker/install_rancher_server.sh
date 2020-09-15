#!/bin/bash

docker run -d --restart=unless-stopped -p 8080:80 -p 8443:443 -v /data/rancher/ranchermaster:/var/lib/rancher rancher/rancher:latest

#查看防火墙状态
firewall-cmd --state

#停止firewall
systemctl stop firewalld.service

#禁止firewall开机启动
systemctl disable firewalld.service