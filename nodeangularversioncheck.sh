#!/bin/bash

npmversion=$(npm --v)
ngversion=$(ng version | grep ^"Angular CLI" | cut -d ":" -f 2 | sed 's/ //')
nodeversion=$(node --version)

cat <<EOF | mail -s "Date: $(date) Report on $(hostname -f)" <mail-id>
NPM Version: $npmversion
Angular CLI Version: $ngversion
echo "Node Version: $nodeversion
EOF