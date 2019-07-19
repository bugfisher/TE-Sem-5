#!/bin/sh

createdb()
{
	   echo "\n Creating the address book"

		# Read the filename
		echo "\n Enter name of the new file : - "
		read filename
		echo "File Created Sucessfully"

}

viewall()
{
        echo "\nThe Address book is shown below"
        
		echo "\nNAME\tADDRESS\tCITY\tSTATE\tPINCODE\tPHONE NO" 
		# Show the sorted output
		
		cat $filename |	sort 

}

insertR()
{
		echo "\n Inserting a new Record"

		# Take input for new record
		echo "\n Enter the Name - "
		read name

		echo "\n Enter the Address - "
		read address
		
		echo "\n Enter The City - "
		read city
		
		echo "\n Enter The State - "
		read state
		
		echo "\n Enter Pin Code - "
		read pin
		
		while [ "1" ]
		do
		
			len=$(echo -n $pin| wc -m)
			if test $len -eq 6;then
				break
			else
				echo "Your number is not valid"
				read pin
			fi
		done
		 
		echo "\n Enter the Phone Number - "
		read phone
		while [ "1" ]
		do
		
			len=$(echo -n $phone| wc -m)
			if test $len -eq 10;then
				break
			else
				echo "Your number is not valid"
				read phone
			fi
		done
		
			
		# Write into file
		
		echo "$name\t$address\t$city\t$state\t$pin\t$phone" >> $filename
		echo "\n Record inserted successfully"
}

deleteR()
{
		 echo "\n Deleting a Record"
		 
		 echo "1. \nDelete By Phone No "
		 echo "2. \nDelete By Pin code "
		 echo "3. \nDelete By name "
		 
		 echo "\nEnter Your Choice : "
		 read ch
		 
		  case "$ch" in
		  
		  1)
	  		

			# Take the phone number to be deleted
		
			echo "\n Enter the Phone Number - "
			read sphone
			
			grep -v -i "$sphone" $filename > temp
			mv temp $filename
		
			echo "\n Record deleted successfully"
		;;
		
		2)
			echo "\n Enter the Pin Code - "
			read spin
			
			grep -v -i "$spin" $filename > temp
			mv temp $filename
		
			echo "\n Record deleted successfully"
		;;	
		
		3)
			echo "\n Enter the Name - "
			read sphone
			
			grep -v -i "$sname" $filename > temp
			mv temp $filename
		
			echo "\n Record deleted successfully"
		;;	
		
		*) echo "\n Invalid option"
    	;;
	esac

}

modify()
{
        echo "\n Modify a Record"

		# Take the phone number to be modified
				
		echo "\n Enter the phone number of the record to be modified- "
		read mphone
			

		# Fetch the whole record from  the file
		
		trecord=$(grep -w -i "$mphone" $filename)
		echo $trecord

		# Take input for modified record
		
		echo "\n Enter the new Record"
		
		echo "\n Enter the Name - "
		read nname
			
 		echo "\n Enter the Address - "
		read naddress
		
		echo "\n Enter The City -"
		read ncity
		
		echo "\n Enter The State -"
		read nstate
		
		echo "\n Enter The Pin Code -"
		read npin
			
		echo "\n Enter the Phone Number -"
		read nphone
			

		# Replace the record in place
		
		sed "s/$trecord/$nname\t$naddress\t$ncity\t$nstate\t$npin\t$nphone/g" $filename > temp
		mv temp $filename
		
		echo "\n Record Modified successfully"

}

searchR()
{	
	    echo "\n Search a Record"
	    echo "1. \nSearch By Phone No "
		echo "2. \nSearch By Pin code "
		echo "3. \nSearch By name "
		 
		 echo "\nEnter Your Choice : "
		 read ch1
		 
		case "$ch1" in
		1)
			# Take the phone number to be searched  
		
			echo "\n Enter the phone number of the record to be searched- \c"
			read sphone
			
			trecord=$(grep -w -i "$sphone" $filename)
		
			len=$(echo -n $trecord | wc -m)
		
			if test $len -eq 0; then
				echo "\n No record found"
			else
				echo "\nNAME\tADDRESS\tCITY\tSTATE\tPINCODE\tPHONE NO"
			echo $trecord	
			fi
		;;
		
		2)	
		
			# Take the pin code to be searched  
		
			echo "\n Enter the pin code of the record to be searched- "
			read spinc
			
			trecord=$(grep -w -i "$spinc" $filename)
		
			len=$(echo -n $trecord | wc -m)
		
			if test $len -eq 0; then
				echo "\n No record found"
			else
				echo "\nNAME\tADDRESS\tCITY\tSTATE\tPINCODE\tPHONE NO"
			echo $trecord	
			fi 
		;;
		3) 
			# Take the Name to be searched  
		
			echo "\n Enter the Name of the record to be searched- "
			read sname
			
			trecord=$(grep -w -i "$sname" $filename)
		
			len=$(echo -n $trecord | wc -m)
		
			if test $len -eq 0; then
				echo "\n No record found"
			else
				echo "\nNAME\tADDRESS\tCITY\tSTATE\tPINCODE\tPHONE NO"
			echo $trecord	
			fi
		;;
		*) echo "\n Invalid option"
    	;;
	esac
	
}


# Run the while loop infinitly

echo "WELCOME TO THE ADDRESS BOOK\n\n"

while(true) do   

	# Print the Menu
	echo "\n=================================="
	echo "            MENU                  "
	echo "===================================="
	echo " 1) Create Address Book          "
	echo " 2) View Address Book            "
	echo " 3) Insert a Record             "
	echo " 4) Delete a Record             "
	echo " 5) Modify a Record             "
	echo " 6) Search a Record             "
	echo " 7) Exit                        " 
	echo "=================================="
	echo "\nEnter your choice - \c"
	read choice

	# Switch case 
	case "$choice" in
	1) 
		createdb	
	;;

	2) 
		viewall
	;;

	3) 
		insertR
	;;

	4) 
		deleteR
	;;

	5) 
		modify
	;;
	6) 
		searchR
	;;
	7) exit
	;;
	*) echo "\n Invalid option"
	;;
	esac

done
