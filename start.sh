#!/bin/bash

#postconf -e mynetworks_style=class
postconf -e myhostname=apiway.io
#postconf -e relayhost=[smtp.gmail.com]:587
#postconf -e smtp_sasl_auth_enable=yes
#postconf -e smtp_sasl_password_maps=hash:/etc/postfix/sasl_passwd
#postconf -e smtp_sasl_security_options=noanonymous
postconf -e smtp_tls_CAfile=/etc/ssl/certs/ca-certificates.crt
postconf -e smtp_use_tls=yes

postconf -e mynetworks_style=subnet
#postmap /etc/postfix/sasl_passwd
#chmod 400 /etc/postfix/sasl_passwd.db


# Actually run Postfix
rm -f /var/run/rsyslogd.pid
/usr/lib/postfix/master &
rsyslogd -n

cp /etc/postfix/alases /etc
newaliases
