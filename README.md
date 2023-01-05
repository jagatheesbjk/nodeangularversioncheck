# nodeangularversioncheck
Node Angular Version Checking
*This script is used for check node, npm, angular version and send server started mail also, for this you need to install postfix with mail and configure it with gmail app password.*
## Mail Installation and Configuration with gmail app password in Linux

### Centos:

- Install packages
  ```RPM Packages
  sudo yum update
  sudo yum install postfix cyrus-sasl-plain mailx
  sudo systemctl status postfix
  sudo systemctl restart postfix
  sudo systemctl enable postfix
  ```

- Postfix Configuration
  ```Conf Edit
  edit /etc/postfix/main.cf file
  vi /etc/postfix/main.cf
  edit add in row relayhost = [smtp.gmail.com]:587
  ```
  *at the end of line add below content:*
  ```Conf add
  smtp_use_tls = yes
  smtp_sasl_auth_enable = yes
  smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
  smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
  smtp_sasl_security_options = noanonymous
  smtp_sasl_tls_security_options = noanonymous
  ```
- Gmail App Password creation
  - Login to gmail and go to `Manage your Google Account`
  - Go to `Security` in Left side panel
  - First we need to enable `2-step Verfication` to generate App Password
  - After creating a `2-step Verfication` next `App passwords`
  - Then click app select anyone of menu, for this choose `other`
  - Given anyname and click `Generate` button to generate app password.
  - Once password create copy and note down any of location, once click done then can't view anymore so carefully copy it to any location don't miss it.
  
- Postfix & Gmail Credential Configuration
  - Create sasl passwd file for authentication in location `/etc/postfix/sasl_passwd`
   ```Mail Config
   [smtp.gmail.com]:587 <Gmail-id>:<AppPassword>
   ```
  - Once complete save it
  - Give command `postmap /etc/postfix/sasl_passwd`

- Once complete give below mentioned.
  ```mail command
  mail -s "<Subject>" <mail-id to send>
  Ex:
  echo "This is test mail to check" | mail -s "Alert Mail" abcdef@gmail.com
  ```

### Ubuntu
- Install packages
  ```RPM Packages
  sudo apt install libsasl2-modules postfix mailutils
  ```
  - In that installation it ask menu give option `Internet site`
  - Next menu enter and verify fully qualifed domain name of your host you can see in by give command `hostname -f`
  - And then check with given command after installation `cat /etc/postfix/main.cf | grep ^myhostname`
  
  *Generate Google App Password that step already mentioned above.*

- Postfix & Gmail Credential Configuration
  - Create sasl passwd file for authentication in location `/etc/postfix/sasl_passwd`
   ```Mail Config
   [smtp.gmail.com]:587 <Gmail-id>:<AppPassword>
   ```
  - Once complete save it
  - Give command `postmap /etc/postfix/sasl_passwd`

- Postfix Configuration
  ```Conf Edit
  edit /etc/postfix/main.cf file
  vi /etc/postfix/main.cf
  edit add in row relayhost = [smtp.gmail.com]:587
  ```
  *at the end of line add below content:*
  ```Conf add
  smtp_sasl_auth_enable = yes
  smtp_sasl_security_options = noanonymous
  smtp_sasl_password_maps = hash:/etc/postfix/sasl/sasl_passwd
  smtp_tls_security_level = encrypt
  smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
  ```
  - sudo systemctl restart postfix
  
- Once complete give below mentioned.
  ```mail command
  mail -s "<Subject>" <mail-id to send>
  Ex:
  echo "This is test mail to check" | mail -s "Alert Mail" abcdef@gmail.com
  ```

- Finally run this script as mention below
  ```Bash Script
  chmod +x nodeangularversioncheck.sh
  ./nodeangularversioncheck.sh
  ```

- Adding cron job for every week mention below
  ```cron job
  crontab -e
  0 0 * * 1 /<mention-with-full-path-of-you-location-script>/nodeangularversioncheck.sh
  Ex:
  0 0 * * 1 /home/ubuntu/nodeangularversioncheck.sh
  ```
  *This script will trigger mail at every monday*