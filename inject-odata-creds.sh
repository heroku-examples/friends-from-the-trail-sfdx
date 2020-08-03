#!/usr/bin/env /bin/bash

# set -x # debugging

usage()
{
  echo "Usage: inject-odata-creds.sh -e | --endpoint ENDPOINT \\
                             -u | --username USERNAME \\
                             -p | --password   PASSWORD   "
  exit 2
}

args=$(getopt --name inject-odata-creds --options e:u:p: --longoptions endpoint:,username:,password: -- "$@")
valid_args=$?

if [ "$valid_args" != "0" ]; then
  usage
fi

eval set -- "$args"
while :
do
  case "$1" in
    -e | --endpoint)  endpoint="$2" ; shift 2 ;;
    -u | --username)  username="$2" ; shift 2 ;;
    -p | --password)  password="$2" ; shift 2 ;;
    --) shift; break ;;
    *) echo "Unexpected option: $1 - this should not happen."
      usage ;;
  esac
done

if [[ -z "${endpoint}" ]] || [[ -z "${username}" ]] || [[ -z "${password}" ]]; then
  echo "Error: endpoint, username, and password arguments required"
  usage
  exit 1
fi

# echo "endpoint: $endpoint" # debugging
# echo "username: $username" # debugging
# echo "password: $password" # debugging

sed \
  -e "s#{{ endpoint }}#$endpoint#" \
  -e "s#{{ username }}#$username#" \
  -e "s#{{ password }}#$password#" \
  "./force-app/main/default/dataSources/Friends_From_the_Trail.dataSource-meta.xml.template" \
  > "./force-app/main/default/dataSources/Friends_From_the_Trail.dataSource-meta.xml"

