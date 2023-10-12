# GPG

[tutorial](https://www.devdungeon.com/content/gpg-tutorial)

    gpg --edit-key 6A349802CE04AC5938B8EBAAA695F6D49054E917
    passwd
    save
    
    gpg --output revocation-certificate.asc --gen-revoke 6A349802CE04AC5938B8EBAAA695F6D49054E917

## key management

    gpg --list-keys
    gpg --list-secret-keys
    
    gpg --gen-key                           # make a new key
    gpg --export-secret-keys --armor 6A349802CE04AC5938B8EBAAA695F6D49054E917 > ./my-priv-gpg-key.asc
    gpg --import ./my-priv-gpg-key.asc
    gpg --edit-key <KEY_ID>
    gpg> trust
    
    gpg --keyserver hkp://pgp.mit.edu --send-keys 6A349802CE04AC5938B8EBAAA695F6D49054E917
    
## encryption & decryption

    gpg --armor --symmetric message.txt     # symmetric, armor (=ASCII output)
    gpg --version                           # get cypher algos
    gpg --sign --symmetric message.txt      # encrypt + sign
    
    # asymmetric. first find and import key, then encrypt
    gpg --keyserver pgp.mit.edu --search-keys uzak@mailbox.org
    gpg --armor --encrypt --recipient uzak@mailbox.org message.txt
    
    gpg -d message.txt.asc                  # decrypt

## sign

    gpg --clearsign message.txt             # for plaintext
    gpg --sign message.txt                  # generates binary output
    
    gpg --verify message.txt.asc            
    gpg --decrypt message.txt.asc           # also verifies signature
    
    # asymmetric encrypt and sign
    gpg --sign --encrypt --recipient uzak@mailbox.org message.txt

### detached signatures

    gpg --detach-sign message.txt
    gpg --verify message.txt.sig
    gpg --verify message.txt.sig message.txt    # explicit message filename
    
    
