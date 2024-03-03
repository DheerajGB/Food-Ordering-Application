#!/bin/bash 
 
customer_login() { 
  
    customer_id=$(zenity --entry --title "Customer Login" --text "Customer ID:")     if [ $? -eq 0 ]; then         password=$(zenity --password --title "Customer Login" --text "Password:")         if [ $? -eq 0 ]; then 
            if [ "$customer_id" = "leo das" ] && [ "$password" = "badass" ]; then                 zenity --info --title="Login Successful" --text "Welcome, $customer_id!" --width=300 --height=50 
                        else 
                zenity --info --title="Login Failed" --text "Invalid customer ID or password. Please try 
again." --width=300 --height=50                 customer_login 
            fi         else 
            zenity --info --title="Login Canceled" --text "Login was canceled by the user." --
width=300 --height=50 
        fi     else 
        zenity --info --title="Login Canceled" --text "Login was canceled by the user." --width=300 
--height=50         customer_login     fi 
} 
 
 
Intro(){ 
zenity --info --title "Restaurant Management System" --text "WELCOME TO OUR 
RESTAURANT" --width=300 --height=50 
(     i=0 
    while [ $i -le 100 ]; do         sleep 0.5  # Simulate some work being done         echo $i         i=$((i + 10))     done 
) | zenity --progress --title="Resto*" --text="Loading..." --percentage=0 --auto-close 
 
selection=$(zenity --list --radiolist --title="Select Order Type" --text="Dine-in or Take-Away" \     --column="" --column="Type" \ 
    FALSE "Dine-in" \     FALSE "Take-Away") 
 
if [ $? -eq 0 ]; then 
    case "$selection" in 
        "Dine-in") 
            # Type 1 selected, do something             zenity --info --title="Resto*" --text="Preparing Order for a $selection" --width=300 --
height=50 
            ;; 
        "Take-Away") 
            # Type 2 selected, do something             zenity --info --title="Resto*" --text="Preparing Order for a $selection" --width=300 --
height=50 
            ;;     esac else     zenity --info --title="Order Canceled" --text="Order was canceled by the user." 
    Intro fi 
} 
 
# Initialize variables to store the quantity of each item 
vegburger_quantity=0 chickenburger_quantity=0 vegpizza_quantity=0 chickenpizza_quantity=0 frenchfries_quantity=0 coke_quantity=0 
coffee_quantity=0 
 
# Function to add an item to the total order value add_item_to_order() {     item_name="$1"     item_quantity="$2"     item_price="$3" 
    total_value=$(echo "scale=2; $item_quantity * $item_price" | bc)     zenity --info --title="$item_name Total Value" --text="Quantity: $item_quantity\n$item_name Value: Rs. $total_value" --width=300 --height=50 
} 
 
show_main_menu() { 
    choice=$(zenity --list --title "Restaurant Bill Management" --text "Select an option:" --
width=450 --height=350 \ 
        --column "Menu" --column "Description" \ 
        "VEG Burger"  "Rs.95" \ 
        "Chicken Burger"  "Rs.120" \ 
        "VEG Pizza"  "Rs.180" \ 
        "Chicken Pizza"  "Rs.210" \ 
        "French Fries"  "Rs.100" \ 
        "Coke"  "Rs.80" \ 
        "Coffee"  "Rs.50" \ 
        "Exit"  "Exit the program" \ 
        "Confirm to place your order") 
 
    case "$choice" in 
        "VEG Burger") vegburg ;; 
        "Chicken Burger") chickburg ;; 
        "VEG Pizza") vegpizza ;; 
        "Chicken Pizza") chickpizza ;;         
        "French Fries") fries ;; 
        "Coke") coke ;; 
        "Coffee") cofe ;; 
        "Exit") exit ;; 
        "Confirm to place your order") order ;; 
        *) show_main_menu ;;     esac 
} 
 
# Function for VEG Burger vegburg() { 
    additional_notes=$(zenity --entry --title "VEG Burger" --text "Enter Quantity:")     if [ $? -eq 0 ]; then 
        if [ "$additional_notes" -gt 0 ]; then             add_item_to_order "VEG Burger" "$additional_notes" 95             vegburger_quantity="$additional_notes"         else 
            zenity --info --title="Invalid Quantity" --text="Please enter a valid quantity (greater than 
0)" --width=300 --height=50         fi 
        show_main_menu     fi 
} 
 
# Function for Chicken Burger chickburg() { 
    additional_notes=$(zenity --entry --title "Chicken Burger" --text "Enter Quantity:")     if [ $? -eq 0 ]; then 
        if [ "$additional_notes" -gt 0 ]; then             add_item_to_order "Chicken Burger" "$additional_notes" 120             chickenburger_quantity="$additional_notes"         else { 
            zenity --info --title="Invalid Quantity" --text="Please enter a valid quantity (greater than 0)" --width=300 --height=50 
        } 
        show_main_menu 
    fi 
    show_main_menu     fi 
} 
 
# Function for VEG Pizza 
vegpizza() { 
    additional_notes=$(zenity --entry --title "VEG Pizza" --text "Enter Quantity:")     if [ $? -eq 0 ]; then 
        if [ "$additional_notes" -gt 0 ]; then             add_item_to_order "VEG Pizza" "$additional_notes" 180             vegpizza_quantity="$additional_notes"         else { 
            zenity --info --title="Invalid Quantity" --text="Please enter a valid quantity (greater than 0)" --width=300 --height=50 
        } 
        show_main_menu 
    fi 
    show_main_menu     fi 
} 
 
# Function for Chicken Pizza chickpizza() { 
    additional_notes=$(zenity --entry --title "Chicken Pizza" --text "Enter Quantity:")     if [ $? -eq 0 ]; then 
        if [ "$additional_notes" -gt 0 ]; then             add_item_to_order "Chicken Pizza" "$additional_notes" 210             chickenpizza_quantity="$additional_notes"         else { 
            zenity --info --title="Invalid Quantity" --text="Please enter a valid quantity (greater than 0)" --width=300 --height=50 
        } 
        show_main_menu 
    fi 
    show_main_menu     fi 
} 
 
# Function for French Fries fries() { 
    additional_notes=$(zenity --entry --title "French Fries" --text "Enter Quantity:")     if [ $? -eq 0 ]; then 
        if [ "$additional_notes" -gt 0 ]; then             add_item_to_order "French Fries" "$additional_notes" 100             frenchfries_quantity="$additional_notes"         else { 
            zenity --info --title="Invalid Quantity" --text="Please enter a valid quantity (greater than 0)" --width=300 --height=50 
        } 
        show_main_menu 
    fi 
    show_main_menu     fi 
} 
 
# Function for Coke coke() { 
    additional_notes=$(zenity --entry --title "Coke" --text "Enter Quantity:")     if [ $? -eq 0 ]; then 
        if [ "$additional_notes" -gt 0 ]; then             add_item_to_order "Coke" "$additional_notes" 80             coke_quantity="$additional_notes"         else { 
            zenity --info --title="Invalid Quantity" --text="Please enter a valid quantity (greater than 0)" --width=300 --height=50 
        } 
        show_main_menu 
    fi 
    show_main_menu     fi 
} 
 
# Function for Coffee cofe() { 
    additional_notes=$(zenity --entry --title "Coffee" --text "Enter Quantity:")     if [ $? -eq 0 ]; then 
        if [ "$additional_notes" -gt 0 ]; then             add_item_to_order "Coffee" "$additional_notes" 50             coffee_quantity="$additional_notes"         else { 
            zenity --info --title="Invalid Quantity" --text="Please enter a valid quantity (greater than 0)" --width=300 --height=50 
        } 
        show_main_menu 
    fi 
    show_main_menu     fi 
} 
 
# Function to calculate the final selected bill amount order() { 
    order_total=0 
 
    # Add each item's value to the total order     order_total=$((order_total + vegburger_quantity * 95))     order_total=$((order_total + chickenburger_quantity * 120))     order_total=$((order_total + vegpizza_quantity * 180))     order_total=$((order_total + chickenpizza_quantity * 210))     order_total=$((order_total + frenchfries_quantity * 100))     order_total=$((order_total + coke_quantity * 80))     order_total=$((order_total + coffee_quantity * 50)) 
 
    # Calculate discounts and tax (modify this based on your business logic) 
# For this example, we will add a 10% discount     order_total_discounted=$(echo "scale=2; $order_total * 0.9" | bc) 
 
    # Display the subtotal 
   zenity --info --title="Order Summary" --text="Your total bill is: Rs. $order_total /-" --
width=300 --height=100 
    zenity --info --title="Your Bill" --text="Pay the bill" 
     
    selection=$(zenity --list --radiolist --title="Select Payment Type" --text="e-POS or CASH" \     --column="" --column="Type" \ 
    FALSE "e-POS" \     FALSE "CASH") 
 
if [ $? -eq 0 ]; then     case "$selection" in 
        "e-POS") 
          
            zenity --info --title="Resto*" --text="Your total bill is: Rs. $order_total /-" --width=300 -height=50 
            ;; 
        "CASH") 
     
            zenity --info --title="Resto*" --text="Your total bill is: Rs. $order_total /-" --width=300 -height=50 
            ;;     esac else 
    zenity --info --title="Order Canceled" --text="Order was canceled by the user." --width=300 --
height=50 
fi  
 (     i=0 
    while [ $i -le 100 ]; do         sleep 0.5  # Simulate some work being done         echo $i         i=$((i + 10))     done 
) | zenity --progress --title="Status" --text="Order Processing..." --percentage=0 --auto-close     zenity --info --title="Status" --text "Order Received"     save_order_to_file     take_customer_review     zenity --info --title="Resto*" --text "Thank you...! Visit Again!" --width=200 --height=50 
     
} 
 
# Function to save order details to a text file 
save_order_to_file() { 
# Specify the path to the text file where you want to save the order details     order_file="/home/dheeru/Desktop/order_details.txt" 
 
    # Create a timestamp for the order 
    timestamp=$(date "+%Y-%m-%d %H:%M:%S") 
 
    # Append the order details to the text file     echo "Order Date and Time: $timestamp" >> "$order_file"     echo "------------Ordered Items---------------" >> "$order_file" 
 
    # Loop through each ordered item and append to the file 
    if [ $vegburger_quantity -gt 0 ]; then         echo "VEG Burger x $vegburger_quantity: Rs. $(($vegburger_quantity * 95))" >> 
"$order_file"     fi 
 
    if [ $chickenburger_quantity -gt 0 ]; then         echo "Chicken Burger x $chickenburger_quantity: Rs. $(($chickenburger_quantity * 120))" 
>> "$order_file"     fi 
 
    if [ $vegpizza_quantity -gt 0 ]; then         echo "VEG Pizza x $vegpizza_quantity: Rs. $(($vegpizza_quantity * 180))" >> 
"$order_file"     fi 
 
    if [ $chickenpizza_quantity -gt 0 ]; then         echo "Chicken Pizza x $chickenpizza_quantity: Rs. $(($chickenpizza_quantity * 210))" >> 
"$order_file"     fi 
 
    if [ $frenchfries_quantity -gt 0 ]; then         echo "French Fries x $frenchfries_quantity: Rs. $(($frenchfries_quantity * 100))" >> 
"$order_file"     fi 
 
    if [ $coke_quantity -gt 0 ]; then         echo "Coke x $coke_quantity: Rs. $(($coke_quantity * 80))" >> "$order_file"     fi 
 
    if [ $coffee_quantity -gt 0 ]; then         echo "Coffee x $coffee_quantity: Rs. $(($coffee_quantity * 50))" >> "$order_file"     fi 
 
    echo "---------------------------------------" >> "$order_file"     echo "Total Amount: Rs. $order_total" >> "$order_file"     echo "---------------------------------------" >> "$order_file" 
 
    # Notify the user that the order details have been saved 
zenity --info --title="Order Saved" --text="Bill got saved on your device Homescreen" --
width=300 --height=50 
} 
 
take_customer_review() {     review=$(zenity --entry --title "Customer Review" --text "Please provide your review:") 
     
    if [ $? -eq 0 ]; then 
        rating=$(zenity --scale --title "Rating" --text "Please rate your experience:" --min-value=1 -
-max-value=5 --value=3) 
        if [ $? -eq 0 ]; then 
            # Append the rating and review to a reviews file             review_file="/home/dheeru/Desktop/order_details.txt" 
         
            echo "Customer Rating: $rating stars" >> "$order_file"             echo "Customer Review: $review" >> "$order_file"             echo "__________________________________________________" >> "$order_file" 
 
            zenity --info --title="Review Submitted" --text "Thank you for your feedback! Your 
review and rating have been submitted." --width=300 --height=50         else 
            zenity --info --title="Review Canceled" --text "Review submission was canceled by the 
user." --width=300 --height=50         fi     else 
        zenity --info --title="Review Canceled" --text "Review submission was canceled by the 
user." --width=300 --height=50     fi 
} 
 
# Function to display ordered food items in a separate dialogue box display_ordered_items() { 
    # Prepare a list of ordered items (modify as per your needs)     ordered_items="Ordered Items:\n" 
     
    if [ $vegburger_quantity -gt 0 ]; then 
	        ordered_items+="VEG Burger 	: 	$vegburger_quantity 	x 	95 	= 
$(($vegburger_quantity*95)) \n"     fi 
 
    if [ $chickenburger_quantity -gt 0 ]; then 
	        ordered_items+="Chicken 	Burger: 	$chickenburger_quantity 	x 	120 	= 
$(($chickenburger_quantity*120))\n"     fi 
 
    if [ $vegpizza_quantity -gt 0 ]; then 
	        ordered_items+="VEG Pizza 	: 	$vegpizza_quantity 	x 	180 	= 
$(($vegpizza_quantity*180))\n"     fi 
 
    if [ $chickenpizza_quantity -gt 0 ]; then 
	        ordered_items+="Chicken 	Pizza 	: 	$chickenpizza_quantity 	x 	210 	= 
$(($chickenpizza_quantity*210))\n"     fi 
 
    if [ $frenchfries_quantity -gt 0 ]; then 
	        ordered_items+="French 	Fries 	: 	$frenchfries_quantity 	x 	100 	= 
$(($frenchfries_quantity*100))\n"     fi 
 
    if [ $coke_quantity -gt 0 ]; then         ordered_items+="Coke 	      : $coke_quantity x 80 = $(($coke_quantity*80))\n"     fi 
 
    if [ $coffee_quantity -gt 0 ]; then         ordered_items+="Coffee       : $coffee_quantity x 50 = $(($coffee_quantity*50))\n"     f  
    # Use Zenity to display the ordered items 
    zenity --info --title "Ordered Food Items" --text "$ordered_items \n" --width=300 --height=200 
} 
 
# Start the main menu customer_login Intro 
show_main_menu 
