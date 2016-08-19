#!/bin/bash

# export your JIRA_BASE64 authentication in this file so it won't be tracked by git
source ./jira64.sh

curl -D- -X GET \
  -H "Authorization: Basic $JIRA_BASE64" \
  -H "Content-Type: application/json" \
  "https://agile.qasymphony.com/rest/api/2/project/QTE/versions" \
  \
| jq '{events: [ .[] | { text: .name, start_date: { year: .releaseDate | strptime("%Y-%m-%d") | .[0], month: .releaseDate | strptime("%Y-%m-%d") | .[1], day: .releaseDate | strptime("%Y-%m-%d") | .[2] } }]}' \
  \
| tee timeline.json