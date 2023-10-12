#  Security

    openssl rand -base64 14         # generate a password of 14 chars

## Cookies
1. auth the user -> server issues a random token w. a secret identifier for you
2. store the session ID in a cookie
3. on next visit the session ID will be passed to the server 

for additional security:
* make the session expire after some time
* check the IP

## HMAC 

*hash message authentication code* with a stored timestamp based on server-side
secret:

    h = HMAC(secret + timestamp + username) # sent by server
    h, username, timestamp                  # sent by client

[Explanation](https://security.stackexchange.com/q/72836): server takes the
username and timestamp. It recalculates h and compares it to the h provided by
the client. To make sure the timestamp is still valid and not too old.

## Lingo
* certificate = public key (decrypt, verify sign) + additional information
* key private key (encrypt, sign)
