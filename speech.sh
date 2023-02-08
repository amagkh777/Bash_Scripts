#!/bin/bash
text=$1
id=$2
key=`cat /var/lib/asterisk/agi-bin/token`
final=`curl -X POST -H "Authorization: Bearer $key" https://tts.api.cloud.yandex.net/speech/v1/tts:synthesize -o /tmp/text/$id.raw --data-urlencode "text=$text" -d "voice=alena&emotion=good&folderId=b1gcid9j08ahpj15s6pl&format=lpcm&sampleRateHertz=8000"`
echo "SET VARIABLE digium $final"
sox -r 8000 -b 16 -e signed-integer -c 1 /tmp/text/$id.raw /tmp/text/$id.wav
rm -Rf /tmp/text/$id.raw

