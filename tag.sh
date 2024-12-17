#!/bin/bash

# 定义仓库地址作为变量
registry="your registry address"

# 输入镜像名称
echo "请输入镜像名称 (如: ubuntu): "
read imageName

# 输入镜像版本，如果为空则默认为 latest
echo "请输入镜像版本 (如: latest): "
read version
if [ -z "$version" ]; then
    version="latest"
    echo "未输入版本，使用默认版本: ${version}"
fi

# 输入目标registry的标签名，如果为空则默认为镜像名称
echo "请输入目标registry的标签名 (默认为 ${imageName}): "
read targetTag
if [ -z "$targetTag" ]; then
    targetTag="${imageName}"
    echo "未输入标签名，使用默认标签名: ${targetTag}"
fi

# 输入目标registry的版本号，如果为空则默认为最开始输入的版本号
echo "请输入目标registry的版本号 (默认为 ${version}): "
read targetVersion
if [ -z "$targetVersion" ]; then
    targetVersion="${version}"
    echo "未输入版本号，使用默认版本号: ${targetVersion}"
fi

# 第一步：通过 docker pull 下载镜像
echo "正在下载镜像 ${imageName}:${version} ..."
docker pull ${imageName}:${version}

# 第二步：将镜像重新打标签
finalImageTag="${registry}/${targetTag}:${targetVersion}"
echo "正在给镜像打标签为 ${finalImageTag} ..."
docker tag ${imageName}:${version} ${finalImageTag}

# 第三步：推送镜像到指定仓库
echo "正在推送镜像到 ${registry} ..."
docker push ${finalImageTag}

# 提示信息
echo "镜像推送完成！"
echo "你可以使用以下命令拉取镜像："
echo ""
echo "  docker pull ${finalImageTag}"
echo ""
