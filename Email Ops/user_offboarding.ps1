#This script disables logon on a user account, forwards their e-mail and sets up an Out of Office reply

#Get user name and date

$User = Read-Host -Prompt 'Please enter the name of the user to be disabled'
$Date = Get-Date

#Block user logon

Set-MSolUser -displayName '$User' -BlockCredential $True

#Get Forwarding info

$FwdUser = Read-Host -Prompt 'Who will '$User' email be forwarded to?'
$FwdAdd =  Read-Host -Prompt 'What is the forwarding e-mail address?'

#Forward E-mail to internal address

Set-Mailbox <Identity> -ForwardingAddress '$FwdAdd' -DeliverToMailboxAndForward $False

#Set Auto-Reply

Set-MailboxAutoReplyConfiguration -Identity $User -AutoReplyState Enabled -InternalMessage " '$User' is no longer employed with Verge Solutions. Your message is very important to us and we look forward to hearing from you. Please contact '$FwdUser' at '$FwdAdd'. Thank you."-ExternalMessage " '$User' is no longer employed with Verge Solutions. Your message is very important to us and we look forward to hearing from you. Please contact '$FwdUser' at '$FwdAdd'. Thank you"

#Confirmation Message

Write-Host "Access to the account for '$User' will be blocked on '$Date'. 
