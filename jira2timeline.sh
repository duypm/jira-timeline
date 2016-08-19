#!/bin/bash

# export your JIRA_BASE64 authentication in this file so it won't be tracked by git
source ./jira64.sh

curl -s -X GET \
  -H "Authorization: Basic $JIRA_BASE64" \
  -H "Content-Type: application/json" \
  "https://agile.qasymphony.com/rest/api/2/project/QTE/versions" \
  \
| jq -f jq_filter \
> timeline.json
