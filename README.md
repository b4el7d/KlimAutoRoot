![HMV](https://user-images.githubusercontent.com/88251142/127750374-1784427f-5597-4e8d-a40a-1410de3ea777.png)

# My WriteUp of KLIM (medium) of https://hackmyvm.eu/
## This is an autoroot written in bash.

### Is required to have installed:
```
Stegbrute
curl
wget
ssh
xterm
```
### Process:
1. Download image
2. BruteForce password and data extraction
3. Extract password from extracted data
4. RCE + LPE
5. SCP download RSA Public Key
6. CVE-2008-0166
7. SSH
