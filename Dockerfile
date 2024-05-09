FROM jlesage/baseimage-gui:debian-10-v4


ENV DISPLAY=":1"
ENV ENABLE_CJK_FONT=1
ENV TZ=Asia/Shanghai

RUN apt-get update \
  && apt-get install -y --no-install-recommends wget curl  \
  ca-certificates \
  desktop-file-utils    \
  libasound2-dev        \
  locales               \
  fonts-wqy-zenhei      \   
  libgtk-3-0            \
  libnotify4            \
  libnss3               \
  libxss1               \
  libxtst6              \
  xdg-utils             \
  libatspi2.0-0         \
  libuuid1              \  
  libappindicator3-1    \
  libsecret-1-0         \
  libgtk2.0-0           \
  libdbus-glib-1-2      \
  libx11-xcb-dev



RUN \
  APP_ICON_URL='https://www.xunlei.com/main/logo.png' && \
  install_app_icon.sh "$APP_ICON_URL"

ARG VERSION=1.0.0.1
# amd64/arm64
ARG ARCH=arm64
ARG URI=http://archive.kylinos.cn/kylin/partner/pool/com.xunlei.download_${VERSION}_${ARCH}.deb
RUN curl -L ${URI} -o /defaults/xunlei.deb     \
  && apt-get install -y /defaults/xunlei.deb \
  && rm /defaults/xunlei.deb 

RUN rm -rf /var/lib/apt/lists/*

COPY rootfs/ /

ENV APP_NAME="Xunlei" \
  S6_KILL_GRACETIME=8000

WORKDIR /config

# Define mountable directories.
VOLUME ["/config"]
VOLUME ["/downloads"]
