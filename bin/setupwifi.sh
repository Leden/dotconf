#!/bin/env bash

CBOLD='\033[1m'
CITALIC='\033[3m'
CRED2='\033[91m'
CGREEN2='\033[92m'
CEND='\033[0m'

wifi_interface="wlan0" #change that to your personal needs (output of 'ip -a')

ssid="xxxx" #personal settings for default connection
passwd="xxxx"

if [ -z $1 ]; then
	echo -n "setting up wifi..."
	out=$(nmcli device wifi connect "$ssid" password "$passwd")
	echo -n -e "${CGREEN2}${CBOLD}done!${CEND}\n"
	echo $out
	exit
elif [ "$1" == "-c" -o "$1" == "--custom" ]; then
	echo Choose ssid name:
	nmcli device wifi list && echo -n "> "
	read ssid_name
	echo "Insert password: (if no password, leaf empty)"
	read password
	echo -n "connecting..."
	if [ -z "$password" ]; then #if no password needed
		out=$(nmcli device wifi connect "$ssid_name")
		if [ ! $? == 0 ]; then #if command fails
			echo -n -e "${CRED2}${CBOLD}connecting failed!${CEND}\n"
			exit
		else #if command succeed
			echo -n -e "${CGREEN2}${CBOLD}done!${CEND}\n"
			echo $out
			exit
		fi
		exit

	else #if passoword is given
		out=$(nmcli device wifi connect "$ssid_name" password "$password")
		if [ ! $? == 0 ]; then #if command fails
			echo -n -e "${CRED2}${CBOLD}connecting failed!${CEND}\n"
			exit
		else #if command succeed
			echo -n -e "${CGREEN2}${CBOLD}done!${CEND}\n"
			echo $out
			exit
		fi
		exit
	fi

elif [ "$1" == "-d" -o "$1" == "--disconnect" ]; then
	echo -n "disconnecting..."
	out=$(nmcli device disconnect "${wifi_interface}")
	if [ ! $? == 0 ]; then #if command fails
		echo -n -e "${CRED2}${CBOLD}disconnect failed!${CEND}\n"
		exit
	else #if command succeed
		echo -n -e "${CGREEN2}${CBOLD}done!${CEND}\n"
		echo $out
		exit
	fi
	exit

elif [ "$1" == "-h" -o "$1" == "--help" ]; then
	echo -n -e "\n${CITALIC}Simple wrapper for nmcli!${CEND}\n\n"
	echo -n -e "${CBOLD}USAGE:${CEND}\n"
	echo -e "setupwifi [OPTIONS]\n\n"
	echo -n -e "${CBOLD}Options:${CEND}\n"
	echo "-h / --help		Print this help dialog."
	echo "-c / --custom		Specify custom ssid and password."
	echo "-d / --disconnect	Disconnect from current network."
	echo
	echo -e "${CITALIC}By default, personal Profile is used!${CEND}\n"
	exit
fi

## LICENCE

# MIT License

# Copyright (c) 2019 TheCoder777

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
