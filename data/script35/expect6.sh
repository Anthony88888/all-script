#!/bin/bash
#
#********************************************************************
#Author:		wangxiaochun
#QQ: 			29308620
#Date: 			2019-01-14
#FileName：		expect5.sh
#URL: 			http://www.magedu.com
#Description：		The test script
#Copyright (C): 	2019 All rights reserved
#********************************************************************
while read ip user password  ;do
expect <<EOF
set timeout 20
spawn ssh $user@$ip
expect {
"yes/no" { send "yes\n";exp_continue }
"password" { send "$password\n" }
}
expect "]#" { send "useradd xixi\n" }
expect "]#" { send "echo magedu |passwd --stdin xixi\n" }
expect "]#" { send "exit\n" }
expect eof
EOF
done < host.txt
