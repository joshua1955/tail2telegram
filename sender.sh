
#!/bin/bash
txt=$(</dev/stdin)
#BotFather give you this token
TELEGRAM_AUTH="xxx:yyy"
#https://api.telegram.org/bot1084334485:AAEk6haJkEVFC3WufBxtx9thr0wMr1AYKcU/getUpdates 
#show you inf about your bot(also you find information about id)
TELEGRAM_CHAT="12345689" 
#ip or domain name:port user:pass from proxy
SOCKS5_PROXY_IP="proxy_ip"
SOCKS5_PROXY_PORT="12345 "
SOCKS5_PROXY_LOGIN="user"
SOCKS5_PROXY_PASSWORD="pass"
#--silent - don't show progress bar
#--show-error - show error
#--fail return error 22 - curl: (22) The requested URL returned error: 400 Bad Request
#-G - use HTTP GET 
# -o /dev/null  - curl always show output  -> show output to  /dev/null
#-d - specify data to request
# --data-urlencode 
TELEGRAM_CMD="curl --silent --show-error --fail  -G -o /dev/null  -x \
socks5://${SOCKS5_PROXY_IP}:${SOCKS5_PROXY_PORT} -U ${SOCKS5_PROXY_LOGIN}:${SOCKS5_PROXY_PASSWORD} \
https://api.telegram.org/bot${TELEGRAM_AUTH}/sendMessage -d chat_id=${TELEGRAM_CHAT}"
${TELEGRAM_CMD} --data-urlencode  "text=$txt"
