# tail2telegram
By this project on bash you can send log information to your telegram account or in group via proxy socks5.

# How to use
sender.sh wait text on stdin 

Ex:
echo test | ./sender.sh

You should specify a time to check and file.


Ex:
./time.sh -s 2 -f /var/log/auth.log

And time.sh send to stdin sender.sh

