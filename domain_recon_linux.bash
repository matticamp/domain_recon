#!/bin/bash
# Bash script for reconnaissance on domains
# Created by Mattia Campagnano on Tue May 24 14:44:07 EDT 2018


echo "DOMAIN RECON"
echo "By Mattia Campagnano"
echo "-------------------"
echo -n "Please enter a domain: "
read domain

#Checks user input and throws an error if no domain was entered.

if [ -z $domain ]; then  echo -n "Please enter a domain "
  exit 1

#Otherwise executes the recon scripts and opens the website list found below

else
   echo "recon on $domain";
fi

read -p "Press <ENTER > to continue"

# Retrieves all IP addresses associated to the given domain

IPs=$(dig $domain | grep "$domain\." | awk '{print $5}')
echo "We found the following IP addresses $IPs associated to the $domain domain"
echo
echo
echo

# Optional: save associated IP addresses to an output file 
echo "Please enter a filepath for the output file: "
read output
echo $IPs > $output


# Open websites list used to check on the domain

firefox -new-tab http://intodns.com/$domain &
firefox -new-tab https://www.virustotal.com/#/domain/$domain &
firefox -new-tab http://viewdns.info/dnsreport/?domain=$domain &
firefox -new-tab https://www.whatsmydns.net/#A/$domain
firefox -new-tab https://safeweb.norton.com/report/show?url=$domain
firefox -new-tab http://www.reputationauthority.org/domain_lookup.php?ip=$domain&ipvalid=&Submit.x=20&Submit.y=16&Submit=Search &

firefox -new-tab https://otx.alienvault.com/browse/pulses?q=$domain &

firefox -new-tab https://sitecheck.sucuri.net/results/$domain &
firefox -new-tab https://www.threatminer.org/domain.php?q=$domain &

firefox -new-tab https://hashdd.com/i/$domain &

