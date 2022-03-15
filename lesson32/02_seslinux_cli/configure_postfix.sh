sudo postconf -e "relayhost = [email-smtp.us-west-2.amazonaws.com]:587" \
"smtp_sasl_auth_enable = yes" \
"smtp_sasl_security_options = noanonymous" \
"smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd" \
"smtp_use_tls = yes" \
"smtp_tls_security_level = encrypt" \
"smtp_tls_note_starttls_offer = yes"

(replace us-west-2 with your region)

Edit /etc/postfix/master.cf and comment out the following:
-o smtp_fallback_relay=

Edit /etc/postfix/sasl_passwd and add the following:
[email-smtp.us-west-2.amazonaws.com]:587 SMTPUSERNAME:SMTPPASSWORD

replace the USER/PASS with the downloaded SMTP credentials
replace region with your region

sudo postmap hash:/etc/postfix/sasl_passwd

sudo chown root:root /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
sudo chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db

(Assuming Amazon linux:)
sudo postconf -e 'smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt'

sudo postfix start; sudo postfix reload
