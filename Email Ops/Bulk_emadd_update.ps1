#Get a list of recipients.  Command may be further scoped as necessary to include only a subset of mailboxes.

$recipients=get-recipient –resultSize:UNLIMITED –recipientType:USERMAILBOX
#Iterate through the list of mailboxes

$recipients | foreach {

#Extract email addresses to a variable

$emailAddress = $_.emailAddresses

#Convert exist primary proxy address to a secondary email address

$newEmailAddress = $emailAddress.replace(“SMTP”,”smtp”)

#Construct the new email address, set it as primary, and add it to the list of existing email addresses.

#The use of SMTP: signifies primary email address.

#Substring is utilized to extract the first initial of the users first name.

$newEmailAddress=$newEmailAddress + (“SMTP:” + $_.firstName + “.” + $_.lastName + “@verge-solutions.com”)

#Commit the new set of email addresses to the mailbox.

set-mailbox –identity $_.alias –emailAddresses $newEmailAddress