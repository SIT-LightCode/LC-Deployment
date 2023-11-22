#!/bin/bash

sshpass -p "${{ secrets.PROD_PWD }}" ssh -tt -o StrictHostKeyChecking=no ${{ secrets.PROD_ADMIN }}@${{ secrets.PROD_HOSTNAME }} << EOF
    cd ~/LC-Deployment
    export MYSQL_ROOT_PASSWORD=${{ secrets.MYSQL_PASSWD }}
    export MYSQL_DATABASE=${{secrets.MYSQL_DATABASE}}
    export MYSQL_USER=${{secrets.MYSQL_USER}}
    export MYSQL_PASSWORD=${{secrets.MYSQL_PASSWORD}}
    envsubst < mysql.env.tmpl > mysql.env
    envsubst < backend.env.tmpl > backend.env
    docker login ghcr.io -u ${{ secrets.TUS_GH_USER }} -p ${{ secrets.GHCR_PAT }}
    git pull
    docker-compose pull
    docker-compose up -d
    exit
EOF