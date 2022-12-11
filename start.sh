#!/bin/bash
#一键启动脚本
#by 听雨
#2022.12.05 5:00


echo " "

echo "你好!"
echo "********************"
echo "欢迎使用听雨一键启动😊"
echo "********************"
echo "★★请选择相应序号启动★★"
echo " "
echo "-----------------------"
echo "1.启动傻妞交互模式  9.查看进程"
echo "--------------------------"
echo "2.启动傻妞静默挂机  10.升级傻妞"
echo "-----------------------"
echo "3.启动MaiARK"
echo "-----------------------"
echo "4.启动cqhttp登录QQ机器人"
echo "-----------------------"
echo "5.启动cqhttp静默挂机"
echo "-----------------------"
echo "6.启动QLTools(注‼️之前启动过的，需要划掉ZeroTermux后台再启动)"
echo "-----------------------"
echo "7.启动新版傻妞交互"
echo "-----------------------"
echo "8.启动傻妞静默挂机"
echo "-----------------------"
echo "😎退出本脚本Ctrl+C"
echo "-----------------------"
echo "输入其他字符或回车全部启动，注意事项同6"
echo " "
echo "-----------------------"
echo " "
read -p "请输入序号:" num

case $num in
       "3")
                 echo " "
                 echo "MaiARK启动中----++++----"
                 echo " "
                 sleep 1
                 nohup /root/MaiARK/MaiARK_arm &
                 sleep 1
                 echo ""
                 echo "启动完成😊"
                 /root/2.sh
                 ;;
       "2")
                 echo " "
                 echo "傻妞静默挂机中----++++----"
                 echo " "
                 sleep 1
                 /root/sillyGirl/sillyGirl -d
                 sleep 1
                 echo ""
                 echo "启动完成😊"
                 /root/2.sh
                 ;;
       "1")
                 echo " "
                 echo "傻妞交互中----++++----"
                 echo " "
                 sleep 1
                 /root/sillyGirl/sillyGirl -t
                 sleep 1
                 echo ""
                 echo "启动完成😊"
                 ;;
       "4")
                 echo " "
                 echo "正在登陆QQ机器----++++----"
                 echo " "
                 sleep 1
                 /root/go-cqhttp/go-cqhttp
                 sleep 1
                 echo ""
                 echo "启动完成😊"
                 ;;
       "5")
                 echo " "
                 echo "QQ机器人启动中----++++----"
                 echo " "
                 sleep 1
                 /root/go-cqhttp/go-cqhttp -d
                 sleep 1
                 echo ""
                 echo "启动完成😊" && /root/2.sh
                 ;;
       "6")
                 echo " "
                 echo "QLTools启动中----++++----"
                 echo " "
                 sleep 1
                 pm2 start /root/QLTools/QLTools-linux-arm64.bin
                 sleep 1
                 echo ""
                 echo "启动完成😊" && /root/2.sh
                 ;;
       "7")
                 echo " "
                 echo "新版傻妞交互中----++++----"
                 echo " "
                 sleep 1
                 /usr/local/sillyGirl/sillyGirl
                 sleep 1
                 echo ""
                 echo "启动完成😊"
                 ;;
       "8")      echo " "
                 echo "新版傻妞静默挂机中----++++----"
                 echo " "
                 sleep 1
                 /usr/local/sillyGirl/sillyGirl -d
                 sleep 1
                 echo ""
                 echo "启动完成😊" && /root/2.sh
                 ;;
        "9")
                 ps aux && /root/2.sh
                 ;;
       "10")
                 echo "good"
                 bash <(curl -sSL http://app.imdraw.com/install.sh) && /root/2.sh
                 ;; 
        *)
                 echo " "
                 echo "所有程序启动中----++++----"
                 echo " "
                 sleep 1
                 /root/sillyGirl/sillyGirl -d && (nohup /root/MaiARK/MaiARK_arm &) && pm2 start /root/QLTools/QLTools-linux-arm64.bin && /root/go-cqhttp/go-cqhttp -d
                 sleep 6
                 echo ""
                 echo "启动完成😊" && /root/2.sh
                 ;;
esac
