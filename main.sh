#!/bin/bash
php -f /var/practic/crud/db.php

echo "This data getting from db.php ^^"
echo $row
echo "*********************"
echo "****Login To CRUD****"
echo "*********************"

read -p "Enter The Username: " username
unset password
prompt="Enter Password: "

while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]];     then
        break
    fi
    if [[ $char == $'\177' ]];  then
        prompt=$'\b \b'
        password="${password%?}"
    else
        prompt='*'
        password+="$char"
    fi
done

if [[ ( $username == "admin" && $password == "123" ) ]]; then
	echo -e "\nSuccessfully Login"
sh ./crud.sh
else
echo -e "\nInvalid Input"
fi
