#!/bin/bash

# 初始化项目目录
path_lst=(commons conf models scripts services utils)

function init_django(){
    virtualenv venv -p python3
    source venv/bin/activate
    pip install django
    django-admin startproject $1
}

function mkdirs(){
    cd $1
    for path in ${path_lst[*]}
        do
            mkdir $path
    done
}

function help(){
    echo "userage: bash init.sh PROJECT_NAME"
}

function main(){
    if [ ! -d $1  ]
    then
        init_django $1
        mkdirs $1
    else
        echo "$1 is exist!"
    fi
}

if [ $1_ == "_" ]
then
    help
    exit 1
else
    main $1
fi
