#This script will enable non-owner mailbox access auditing on every mailbox in our tenant

#Enable global audit logging for all User mailboxes
Get-Mailbox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailbox" -or RecipientTypeDetails -eq "SharedMailbox" -or RecipientTypeDetails -eq "RoomMailbox" -or RecipientTypeDetails -eq "DiscoveryMailbox"}| Set-Mailbox -AuditEnabled $true -AuditLogAgeLimit 365 -AuditOwner Create,HardDelete,MailboxLogin,MoveToDeletedItems,SoftDelete,Update

#View Results
Get-Mailbox -ResultSize Unlimited | Select Name, AuditEnabled, AuditLogAgeLimit | Out-Gridview