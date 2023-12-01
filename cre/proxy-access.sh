#!/bin/sh 

CRE_PROXY_ROOT="www/proxy"

#https://geekflare.com/monitor-analyze-access-logs-goaccess/


#Country: 3MB
## https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-Country&license_key=YOUR_LICENSE_KEY&suffix=tar.gz
# City: 30MB
## https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-City&license_key=YOUR_LICENSE_KEY&suffix=tar.gz

## https://download.maxmind.com/app/geoip_download?edition_id=GeoLite2-ASN&license_key=YOUR_LICENSE_KEY&suffix=tar.gz

## if [ /var/log/nginx/access.log -nt /cre/$CRE_PROXY_ROOT/access.html ] ; then
if [ -f /var/log/nginx/access.log ]; then
  if [ $(echo " $CRE_VERSION < 2020.0" | bc) -eq 1 ] ; then
    ## goaccess -f /var/log/nginx/access.log   --log-format="%h %^[%d:%^] \"%r\" %s %b \"%R\" \"%u\"" --date-format=%d/%b/%Y --time-format=%T --log-format=COMBINED > /cre/$CRE_PROXY_ROOT/access.html
    echo "goaccess not working as expected"
    echo "<html><body><h1>goaccess not working</h1></body></html>" > /cre/$CRE_PROXY_ROOT/access.html
  else
    goaccess /var/log/nginx/access.log -o /cre/$CRE_PROXY_ROOT/access.html --anonymize-ip --log-format=COMBINED
  fi

  mkdir -p /cre/$CRE_PROXY_ROOT/access
  cp -f /cre/$CRE_PROXY_ROOT/access.html /cre/$CRE_PROXY_ROOT/access/access_w$(date +"%V").html 

fi

#https://www.learn2torials.com/a/how-to-rotate-nginx-logs
# /etc/logrotate.conf  'su root syslog' -> 'su root adm'   



