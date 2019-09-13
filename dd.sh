#!/bin/bash
export LANG="en_US-UTF.8"

echo "是否需要安装youtube-dl，下载填写true，否则填写false"
read download

if [ $download = true ]
then
    echo "下载youtube-dl..."
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
    echo "youtube-dl已安装"
elif [ $download = false ]
then
    echo "已跳过"
fi

echo "填写想要下载视频的vtuber名称，用于创建目录:"
read name

echo "填写该vtuber的频道地址:"
read url

echo "填写代理地址，无需代理则留空:"
read proxyurl

echo "是否需要下载缩略图，下载填写true，否则填写false:"
read option

mkdir $name
cd $name

if [ $option = true ]
then
    youtube-dl -o "[%(upload_date)s] %(title)s" --write-all-thumbnails --proxy "$proxyurl" "$url"
elif [ $option = false ]
then
    youtube-dl -o "[%(upload_date)s] %(title)s" --proxy "$proxyurl" "$url"
fi

echo "下载完成"
