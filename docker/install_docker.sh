#!/bin/bash
yum remove -y docker docker-common docker-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum -y install docker-ce-18.06.2.ce-3.el7
systemctl enable docker
systemctl start docker
docker version

sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{ "registry-mirrors": ["https://rclwwcvz.mirror.aliyuncs.com"] }
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

yum -y install ntp
systemctl enable ntpd
systemctl start ntpd
timedatectl set-ntp yes
ntpdate -u cn.pool.ntp.org
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime  
watch -n 1 'date'