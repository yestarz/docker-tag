# docker-tag
本项目是一个快速给docker镜像打标签，并推送到指定docker仓库的脚本

# 由来
国内网络环境通过docker拉取镜像非常吃力，要么通过第三方的镜像加速器进行加速，要么使用魔法。前一段时间使用CF的Worker白嫖了一段时间，最近CF开始对这种行为进行管控了，所以估计迟早也要凉。正好手里有一台闲置的美国服务器，那么就可以通过这台服务器push想要的镜像，然后再推送到国内的阿里云docker仓库中

# 使用前提

1. 拥有一台能够自由拉取docker镜像的服务器，可以是国外的VPS，或者是任意能够畅联docker hub的服务器
2. 拥有阿里云的账号，其他的也可以，替换一下脚本的`registry`变量的内容就好

# 使用步骤

1. 在VPS服务器上登录到阿里云docker hub，注意下面替换以下你的用户名和你的registry地址，然后输入密码，提示登录成功即可

```bash
docker login --username=xxx registry.cn-chengdu.aliyuncs.com
```

2. 下载本项目，得到`tag.sh`文件

3. 修改`tag.sh`文件的`registry`为你的

4. 赋予权限

```bash
chmod +x tag.sh
```

5. 执行命令，根据提示进行操作即可

6. 最后成功后，可以在国内的机器上拉取阿里云的镜像就好了

# 结语
本项目的脚本通过ChatGPT生成
