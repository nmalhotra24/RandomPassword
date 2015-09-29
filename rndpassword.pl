#!/usr/bin/perl                                                                                              
# random password generator                                                                                  
                                                                                                                                                       

use lib '/home/student/malhotrn/csci265/Lab0';
use IO::Socket;

$sock = new IO::Socket::INET (
                              PeerAddr => 'Localhost',
                              PeerPort => '7071',
                              Proto => 'tcp'
                             );

#default values                                                                                              
$n = 8; # default for the length of the password 
$t = num; # default for the character type of password
$error = 1;
$i = 0;
$v = 0; # version of program 
$num_of_args = @ARGV;

for ($i = 0; $i < $num_of_args ; $i++) 
{
     if ($ARGV[$i] eq "-v") 
     {
         $v = 1;
     } elsif ($ARGV[$i] eq "-n") 
     {
         if (($i+1) == $num_of_args) 
         {
             $error = 0;
             print "Error: Invalid Length\n";
             last;
         }

         $n = $ARGV[++$i];
         if ($n < 2 || $n > 64)
         {
             $error = 0;
             print "Error: Invalid Length\n";
             last;
         }
     } elsif ($ARGV[$i] eq "-t") 
     {
         if (($i+1) == $num_of_args) 
         {
             $error = 0;
             print "Error: Invalid Type\n";
			 last;
         }

         $t = $ARGV[++$i];
         if ($t != "num" && $t != "alnum") 
         {
             $error = 0;
             print "Error: Invalid Type\n";
             last;
         }
     } else 
     {
         $error = 0;
         print "Error: Invalid Switch\n";
         last;
    }
}

if ($v eq 1) {
    print "Version: 0.1 \n";
}

print "Password: ";
print $sock "1:$t:$n\n";

while ($error eq 1) {
    $pass = <$sock>;
    chop $pass;
    last if $pass eq "CLOSE";
    print "$pass \n";
}



