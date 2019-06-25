while [ "1" ]
do 
 echo "1. Create Database "  
 echo "2. Display Records "  
 echo "3. Insert New Student Record"  
 echo "4. Delete Student Record "  
 echo "5. Modify Student Record "  
 echo "6. Show Student Record "  
 echo "7. Exit Database"  
 echo " Enter Your Choice "  
 read d  
 case $d in  
 1)  
    echo " Enter Roll Number of Student "  
   read rn  
   echo " Enter name of Student "  
   read nm  
   echo " enter marks in OS "  
   read sk  
   echo " enter marks in DBMS "  
   read eg  
   echo " enter marks in TOC "  
   read hn  
   record="$rn ------$nm-----$sk-----$eg-----$hn "  
   echo " "
   echo $record>stud
   echo " "
   echo "Database created Sucessfully"
   echo " "   
   ;;  
 2) if [ -s "stud" ]
    then
    echo " "
    echo "Showing Database of Student" 
    echo " "
    echo "Roll-----Name-----OS-----DBMS-----TOC"
    echo " "
    cat stud
    echo " "
    else
    echo " "
    echo "Database Empty!"
    echo " "
    fi
     ;;  
 3)   
   echo " enter roll number of student "  
   read rn  
   check=`grep  ^$rn stud | cut -c -2`
   if [ "$check" == "$rn" ]
   then
   echo " "
   echo "Roll number already Exists"
   echo " "
   else
   echo " Enter Name of Student "  
   read nm  
   echo " Enter Marks in OS "  
   read sk  
   echo " Enter Marks in DBMS "  
   read eg  
   echo " Enter Marks in TOC "  
   read hn  
   record="$rn ------$nm-----$sk-----$eg-----$hn "
   echo " " 
   echo $record>>stud
   echo " "
   echo "Record Added Sucessfully"
   echo " " 
   fi 
    ;;  
 4) echo " Enter Roll Number "  
   read rn  
   grep ^$rn stud  
   if [ $? -ne 0 ]; then  
   echo " "
   echo "Record Not Found.."
   echo " "  
   else  
   echo "Record Found"
   echo " "
   grep -v $rn stud>tmp  
   echo " "
   echo "Do you really want to delete Record [Y/N]"
   read choice
   if [ "$choice" == "Y" ]
   then
   cp tmp stud 
   echo " " 
   echo "deletion complete "
   echo " " 
   else
   echo " "
   echo "Operation Aborted.."
   echo " " 
   fi  
   fi
   ;;  
 5) echo " Enter Roll Number "  
   read rn1  
   grep ^$rn stud  
   if [ $? -ne 0 ]; then  
   echo " "
   echo "Record Not Found.."
   echo " "   
   else  
   echo " Enter Roll Number "  
   read rn  
   echo " Enter Name of Student "  
   read nm  
   echo " Enter Marks in OS "  
   read sk  
   echo " Enter Marks in DBMS "  
   read eg  
   echo " Enter Marks in TOC "  
   read hn  
   record="$rn ------$nm-----$sk-----$eg-----$hn "
   var=`grep -n ^$rn1 stud | cut -c 1`  
   echo $var  
   var1=`expr $var - 1`  
   head -$var1 stud>temp  
   echo $record>>temp  
   var3=`wc -l < stud`  
   var2=`expr $var3 - $var `  
   tail -$var2 stud>>temp  
   cp temp stud  
   echo " "
   echo "Modification Sucessfull!"
   echo " "
    fi  
 ;;  
 6) echo " Enter Roll number "  
   read rn  
   echo "Displaying Result "  
   grep ^$rn stud 
   echo " " 
 ;;  
 7)exit
    echo " "
    echo "Thank you"
    echo " " 
 ;;  
 * ) echo " "
  echo "Please Enter Right Choice"
  echo " "  
 esac
 done
