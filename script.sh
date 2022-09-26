#!/bin/bash
set -x
sudo certbot certificates > ~/file.txt
grep VALID ~/file.txt | awk 'BEGIN { FS = ":" } ; { print $6 }' | awk -F' ' '{print$1}'  > ~/file-num
while read -r num ; do
   if [ $num -lt 5 ] ; then
#      echo "certificate in `hostname`" | mail -s "valid till $num days" sudoers@squadio.com -A /home/marwa/file.txt
        #curl -X POST --data-urlencode "payload={\"channel\": \"#certificates\", \"username\": \"`hostname`\", \"text\": \"This certificate `grep -B1 "$num" ~/file.txt` \", \"icon_emoji\": \":ghost:\"}" https://hooks.slack.com/services/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
        curl -X POST --data-urlencode "payload={\"channel\": \"#certificates\", \"username\": \"`hostname`\", \"text\": \"This certificate `grep -B1 "$num" ~/file.txt` \"}" https://hooks.slack.com/services/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
   fi
done < ~/file-num
rm -f ~/file*

