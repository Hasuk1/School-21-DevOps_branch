#!/bin/bash

BOT_TOKEN="6586264229:AAF7G95PeGwhtuykXPrbBVdRk_xep_Qc4dQ"
URL="https://api.telegram.org/bot$BOT_TOKEN/sendMessage"
ID="917956857"

if [[ $CI_JOB_STATUS = "success" ]]; then
    STATUS=✅
else
    STATUS=❌
fi

TEXT="Deploy stage: $1 $STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s -d "chat_id=$ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null