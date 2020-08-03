# Friends from the Trail Salesforce App

## Pre-requisites

1. Deploy the [Heroku app](https://github.com/heroku-examples/friends-from-the-trail-demo) for this demo and configure Heroku Connect External Objects on that app so that you have `ENDPOINT`, `USERNAME`, and `PASSWORD` values
1. Install the [`sfdx` CLI](https://developer.salesforce.com/tools/sfdxcli) using that link or `npm install --global sfdx-cli`.

## Deploy to Scratch Org

1. git clone this repo
1. `./inject-odata-creds.sh --endpoint ENDPOINT --username USERNAME -password PASSWORD`
    1. `ENDPOINT`, `USERNAME`, and `PASSWORD` are generated during [Heroku deploy](https://github.com/heroku-examples/friends-from-the-trail-demo#readme).
1. Authenticate with your dev hub org if not already authenticated
1. `sfdx force:org:create -f config/project-scratch-def.json -a some_friendly_name -s`
1. `sfdx force:source:push`
1. `sfdx force:user:permset:assign -n Selfies`
1. `sfdx force:org:open --urlonly -p /lightning/n/Selfie_Stats` to get URL

## Deploy to Developer Edition Org

1. git clone this repo
1. `./inject-odata-creds.sh --endpoint ENDPOINT --username USERNAME -password PASSWORD`
    1. `ENDPOINT`, `USERNAME`, and `PASSWORD` are generated during [Heroku deploy](https://github.com/heroku-examples/friends-from-the-trail-demo#readme).
1. Authenticate with your Developer Edition org if not already authenticated, setting authenticated org as the default
1. `sfdx force:org:deploy`
1. `sfdx force:user:permset:assign -n Selfies`
1. `sfdx force:org:open --urlonly -p /lightning/n/Selfie_Stats` to get URL
