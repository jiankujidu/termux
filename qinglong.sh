set -x \
&& echo -e "\n\
export QL_DIR=/ql\n\
export QL_BRANCH=develop\n\
export LANG=zh_CN.UTF-8\n\
export TERMUX_APK_RELEASE=F-DROID\n\
export SHELL=/bin/bash\n\
export PNPM_HOME=~/.local/share/pnpm\n\
export PATH=$PATH:~/.local/share/pnpm:~/.local/share/pnpm/global/5/node_modules\n" \
>> /etc/profile.d/ql_env.sh \
&& source /etc/profile \
&& echo -e "nameserver 119.29.29.29\n\
nameserver 8.8.8.8" > /etc/resolv.conf \
&& sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&& apk update -f \
&& apk upgrade \
&& apk --no-cache add -f bash make nodejs npm \
coreutils moreutils git curl wget tzdata perl \
openssl nginx jq openssh python3 py3-pip \
&& rm -rf /var/cache/apk/* \
&& apk update \
&& ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone \
&& npm config set registry https://registry.npmmirror.com \
&& npm install -g pnpm \
&& pnpm add -g pm2 ts-node typescript tslib \
&& mkdir -p $QL_DIR \
&& git clone -b $QL_BRANCH https://ghproxy.com/https://github.com/whyour/qinglong.git $QL_DIR \
&& cd $QL_DIR \
&& cp -f .env.example .env \
&& chmod 777 $QL_DIR/shell/*.sh \
&& chmod 777 $QL_DIR/docker/*.sh \
&& pnpm install --production --loglevel error \
&& mkdir -p $QL_DIR/static \
&& git clone -b $QL_BRANCH https://ghproxy.com/https://github.com/whyour/qinglong-static.git $QL_DIR/static \
&& ln -s /ql/docker/docker-entrypoint.sh /usr/bin/qinglong \
&& qinglong