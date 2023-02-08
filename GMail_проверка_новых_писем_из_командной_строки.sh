curl -u username:password --silent "https://mail.google.com/mail/feed/atom" | awk -F '<fullcount>|</fullcount>' '{for (i=2; i<=NF; i++) {print $i}}'



curl -u username:password --silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | wc -l


curl -u username:password --silent "https://mail.google.com/mail/feed/atom" | grep -c "<entry>"



curl -u username:password --silent "https://mail.google.com/mail/feed/atom" | tr -d '\n' | awk -F '<entry>' '{for (i=2; i<=NF; i++) {print $i}}' | perl -pe 's/^<title>(.*)<\/title>.*<name>(.*)<\/name>.*$/$2 - $1/'



