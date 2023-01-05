# nodeangularversioncheck
Node Angular Version Checking
*This script is used for check node, npm, angular version and send server started mail also, for this you need to install postfix with mail and configure it with gmail app password.*
## Mail Installation and Configuration with gmail app password in Linux

Centos:

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
 -Postfix & Gmail Credential Confi
