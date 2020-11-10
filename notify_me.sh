#!/bin/bash
host_name=$(</proc/sys/kernel/hostname)

#Executing the command
start_time="$(date)"
$*
end_time="$(date)"

#Setting notification mail content
to_address="example@gmail.com"
subject="Notification: Job Done @$host_name"
mail_text="Subject: $subject

Your job is done!

Job: $*
Host: @$host_name
Start Time: $start_time
End Time: $end_time

Cheers!
"

#Sending the email
echo "$mail_text" > email.txt
sendmail $to_address < email.txt
rm email.txt
