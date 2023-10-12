# Encryption

## salt 

Random data for one-way function to protect passwords against brute force attacks.

Different users, same password. Different salts, different hashes. 
In practice, we store the salt in cleartext along with the hash in our database.

Generate a unique salt upon creation of each stored credential (not just per user or system-wide).

## Symmetric

[openssl, gnupg, ccrypt](http://dev.lab427.net/symmetric-encryption.html)
