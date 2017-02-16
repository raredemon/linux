#!/bin/bash
export LC_ALL=C

URL="https://github.com/cloudipsp/all_banks_ips/raw/master/"
DLIST="/root/banks/domains.list"
FILE="acs_url.csv"
RESULTFILE="$1"
wget -c "$URL$FILE" &&  cat "$FILE" | grep ",\"ru\"," | cut -d "\"" -f2 | grep -v "^[[:space:]]*$" > domains.list

for domain in `cat domains.list`
do
 item=$(dig @8.8.8.8 "$domain" +short -4 )
 if [ -n "$item"  ] ;
 then
     printf "access-list 195 remark --- "$domain" ---\n"
     printf "access-list 195 permit ip any host %s\n" ${item[@]}
     printf "access-list 195 permit ip host %s any \n" ${item[@]}
 else
     echo "$domain" result is NULL > /dev/null
 fi
done
