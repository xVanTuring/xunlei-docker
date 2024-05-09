# Docker版迅雷官方Linux版客户端

```
docker run -d \
--name xunlei \
-v xunlei_config:/config \ 
-v /Volumes/Local/09_Xunlei:/downloads \ 
-e GROUP_ID=20 \ 
-e USER_ID=501 \ 
-p 5800:5800 \ 
-p 5900:5900  \ 
-e ENABLE_CJK_FONT=1 \ 
-e VNC_PASSWORD=123456 \
xunlei-arm
```

等待初始化完成后，可以在浏览器端打开 `http://127.0.0.1:5800`。也可以使用任何VNC客户端连接`5900`端口。


查看自己的`USER_ID`和`GROUP_ID` :

```bash
id USERNAME
```
## Build
```bash
# amd64
docker build -t xunlei --platform linux/amd64 --build-arg ARCH=amd64 .
# arm64
docker build -t xunlei-arm --platform linux/arm64 --build-arg ARCH=arm64 .
```

此Docker基于`jlesage/baseimage-gui:debian-10`，其他详细参数可参考其[文档](https://github.com/jlesage/docker-baseimage-gui)。


[参考](https://github.com/KevinLADLee/baidunetdisk-docker)

