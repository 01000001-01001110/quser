<#
Today we query devices to determine login methods. 
This is how I would do it. 

#>



#To start I want to always get the most current computer name list from Active Directory. 


#This command asks the AD Module in PS to get all computers information, do not filter anything. 

#Now I like that I get all the data, but we only need the names. 

$ComputerNames = (Get-ADComputer -Filter *).Name
#This puts the entire command's output into the array $ComputerNames. We only need the names. This is how we do this. 

#Now we need to go through this list. With a loop. I like foreach for this. 

foreach ($c in $ComputerNames) {

    #Now we need a spiffy command to find the logged in users method of logggin in, and if they are active or not. 

    quser /server:c$

    <#
    This is what your output should look like per device 

    USERNAME              SESSIONNAME        ID  STATE   IDLE TIME  LOGON TIME
    USER1                                   2  Disc           19  11/23/2021 11:44 AM
    USER1               rdp-tcp#3           3  Active          .  11/23/2021 1:09 PM
    #>

}
