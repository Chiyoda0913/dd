#!/bin/bash

echo "是否需要安装youtube-dl，下载填写true，否则填写false"
read download

if [ $download = true ]
then
    echo "下载youtube-dl..."
    sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
    sudo chmod a+rx /usr/local/bin/youtube-dl
elif [ $download = false ]
then
    echo "已跳过"
fi

echo "填写想要下载视频的vtuber名称，用于创建目录:"
read name

echo "填写该vtuber的频道地址:"
read url

echo "填写需要下载的视频格式"
read format

echo "是否需要下载缩略图，下载填写true，否则填写false"
read option

mkdir $name
cd $name

if [ $option = true ]
then
    youtube-dl -o "[%(upload_date)s] %(title)s -【%(uploader)s】" --write-all-thumbnails -f $format $url
elif [ $option = false ]
then
    youtube-dl -o "[%(upload_date)s] %(title)s -【%(uploader)s】" -f $format $url
fi

echo "下载完成"
