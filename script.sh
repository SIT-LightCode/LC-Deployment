#!/bin/bash
export MYSQL_ROOT_PASSWORD= $MYSQL_ROOT_PASSWORD
sshpass -p $PROD_PWD ssh -tt -o StrictHostKeyChecking=no $PROD_ADMIN@$PROD_HOSTNAME << EOF
    cd ~/LC-Deployment
    envsubst < mysql.env.tmpl > mysql.env
    envsubst < backend.env.tmpl > backend.env
    docker login ghcr.io -u $TUS_GH_USER -p $GHCR_PAT
    git pull
    docker-compose pull
    docker-compose up -d
    exit
EOF