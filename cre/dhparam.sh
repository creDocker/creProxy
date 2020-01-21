cp /cre/dhparam.pem.default /etc/letsencrypt/openssl/dhparam.pem
echo "Generate new dhparam.pem"
openssl dhparam -out /etc/letsencrypt/openssl/dhparam.new.pem 4096 
mv -f /etc/letsencrypt/openssl/dhparam.new.pem /etc/letsencrypt/openssl/dhparam.pem
