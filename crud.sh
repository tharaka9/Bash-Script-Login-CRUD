#!/bin/bash

while true; do

main (){
echo ........"Simple CRUD Dashboard........"
echo "1 -> Show Table Data"
echo "2 -> Insert Data To Table"
echo "3 -> Update Table Data"
echo "4 -> Delete Table Data"
}
selecta (){
echo "Select Number: "
read n
}

case $n in
1)
mysql -h localhost -u root -prrass98 -e "use bash_crud; select * from employee"
;;
2)
#add data to database
echo "Enter First Name: "
read fname
echo "Enter Last Name: "
read lname
echo "Enter Phone Number: "
read phone

mysql -h localhost -u root -prrass98 -e "use bash_crud; INSERT INTO employee (fname, lname, phone) VALUES ('$fname', '$lname', $phone)
"
echo "Data Inserted Successfully"
;;
3)
#update data
echo "All Employee Data......"

mysql -h localhost -u root -prrass98 -e "use bash_crud; select * from employee"

echo "Select Id Number To Update Data: " 
read id

echo "Enter Details To Update..."
echo "Enter First Name: "
read fname
echo "Enter Last Name: "
read lname
echo "Enter Phone Number: "
read phone

mysql -h localhost -u root -prrass98 -e "use bash_crud; update employee set fname = '$fname', lname = '$lname', phone = $phone where id = $id"

echo "Data Update Successfully"
;;
4)
echo "All Employee Data......"

mysql -h localhost -u root -prrass98 -e "use bash_crud; select * from employee"

echo "Select Id Number To Delete Data: "
read id

mysql -h localhost -u root -prrass98 -e "use bash_crud; delete from employee where id = $id;"

echo "Data Delete Successfully"
;;
esac

    for i in {1..2}; do
        echo "*"
        sleep 1
    done

    main
    selecta
done
