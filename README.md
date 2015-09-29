# Description

This repository contains a random password generator implemented in Perl.

NORMAL BEHAVIOUR
1. The Server must contain:
-	Local Host 
-	Local Port 
-	Proto 
-	Listen
-	Reuse
2. If Client cannot connect to Server, the Server has to send out an error message stating, “Could not create a socket: $!\n”
3. Once the Server has listened for a connection from the Client, then the information is transferred to the Server and is ready to be generated.
4. Store the message from the Client in a variable and then split the message and store in an array.
5.Break up the message from the Client into three components where the first component is the number of passwords required from the Client, the second component is the character the character type, and the third component is the length of the password.
6. The Client can only receive 6 passwords at a time. 
7. If the first component is not stated, use 1 as the default.
8. If the second component is an integer, then the Socket will generate a random password containing numbers from 0...9, with the specific length size being taken into consideration. Else, output a random password containing both alphabets and numbers from 0…9 with the respective third component.
9. If the third component is not stated, then use the default number of 8.
10. Once the password specifications have been taken into account, store in a new component.
11. Looking at $pnum, generate the number of passwords required.
12. Print the passwords on a new line. 
13. If the passwords are successfully received to the Client send a message stating, “Send CLOSE to client”.
14. Close the connection.

ASSUMPTIONS:
•	The Local Host uses the IP address of your machine to make a connection. 
•	The Local Port must contain the exact same numbers for both the Client and Server for the network to connect.  
•	The Prototype being used here is a tcp. 
•	Listen will only take in 3 Client messages at once.
•	Resources can be reused after they have been dealt with.
•	The string to send the passwords will be in the format “6:num:12”.
•	All exception results in the immediate output of an error message and the termination of passServer.pl

EXCEPTIONS:
•	If a connection to the passClient is refused then output (on a new line) “Could not create socket \n”.
•	After the random passwords are sent to passClient, output (on a new line) “Send CLOSE to client \n”

