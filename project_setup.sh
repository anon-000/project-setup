#!/bin/bash 


# Created by Auro on 25th October at 1:17AM
# Dussehra ta chalichy au mu basiki aeya karuchy .. kan kariba au .. 
# vabideichy taw karibaku padiba au ... au smt re a bala corona ... 
# pura flop kridela dussehra maja ...
# chada au ... Lets hope for the best ... Vagawan nku etiki pratharna...
# Please ae project ta atleast complete hbaku diyaaaaaaaaaaaaaaaaaaaaaaaaaa....
# Toh Chaliyeeeee Shuru Karte hein ...  


#variables
REPO_NAME="sample name"
PACKAGE_NAME=''
APP_NAME=''
REPO_URL=''

# gets boilerplate code and process it
get_code_and_rename(){
    #git clone https://gitlab.com/e-commerce-basic/e-commerce-flutter.git
    oldFolderName=`ls | grep e-commerce-flutter | awk '{print $1;}'`
    echo $oldFolderName
    mv $oldFolderName "$REPO_NAME"
    cd "${REPO_NAME}"
}

change_package_name(){
    pass
}

change_app_name(){
    pass
}


# project details as user input
#take_project_details(){}


echo ----------start------------

get_code_and_rename

echo ----------end------------