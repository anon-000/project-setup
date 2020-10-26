#!/bin/bash 

# Created by Auro on 25th October at 1:17AM
# Dussehra ta chalichy au mu basiki aeya karuchy .. kan kariba au .. 
# vabideichy taw karibaku padiba au ... au smt re a bala corona ... 
# pura flop kridela dussehra maja ...
# chada au ... Lets hope for the best ... Vagawan nku etiki pratharna...
# Please ae project ta atleast complete hbaku diyaaaaaaaaaaaaaaaaaaaaaaaaaa....
# Toh Chaliyeeeee Shuru Karte hein ...  
# bdw Happy Dussehra :)

#variables
REPO_NAME="sample name"
PACKAGE_NAME='in.student.pitest'
APP_NAME=''
REPO_URL=''
ROOT_PATH=''
BOILER_PKG_NAME='com.smarttersstudio.ecommerceapp'
GRADLE_PATH='android/app'
MANIFEST_PATH1='android/app/src/debug' #debug
MANIFEST_PATH2='android/app/src/main' #main
MANIFEST_PATH3='android/app/src/profile' #profile
PKG_FOLDER_PATH='android/app/src/main/kotlin' #ex - in/student/pitest
APP_KT_PATH='android/app/src/main/kotlin/com/smarttersstudio/ecommerceapp'
MAIN_KT_PATH='android/app/src/main/kotlin/com/smarttersstudio/ecommerceapp'


# project details as user input
take_project_details(){
    pass
}

# gets boilerplate code and process it
get_code_and_rename(){
    #git clone https://gitlab.com/e-commerce-basic/e-commerce-flutter.git
    oldFolderName=`ls | grep e-commerce-flutter | awk '{print $1;}'`
    echo $oldFolderName
    mv $oldFolderName "$REPO_NAME"
    cd "${REPO_NAME}"
    ROOT_PATH=`pwd`
    echo $ROOT_PATH
    change_package_name
}

# change package name everywhere 
# in all manifests, mainactivity.kt, application.kt, folder name in kotlin and all imports
change_package_name(){
    # update in build.gradle(android/app/build.gradle)
    echo "...gradle update starts"
    sed -i .bak "s/${BOILER_PKG_NAME}/${PACKAGE_NAME}/" $GRADLE_PATH\/build.gradle
    rm -rf $GRADLE_PATH\/build.gradle.bak
    echo "...gradle update done"
    # update in all manifests( debug | main | profile )
    echo "...manifests update starts"
    sed -i .bak "s/${BOILER_PKG_NAME}/${PACKAGE_NAME}/" $MANIFEST_PATH1\/AndroidManifest.xml
    rm -rf $MANIFEST_PATH1\/AndroidManifest.xml.bak
    sed -i .bak "s/${BOILER_PKG_NAME}/${PACKAGE_NAME}/" $MANIFEST_PATH2\/AndroidManifest.xml
    rm -rf $MANIFEST_PATH2\/AndroidManifest.xml.bak
    sed -i .bak "s/${BOILER_PKG_NAME}/${PACKAGE_NAME}/" $MANIFEST_PATH3\/AndroidManifest.xml
    rm -rf $MANIFEST_PATH3\/AndroidManifest.xml.bak
    echo "...manifests update ends"
    # update in Application.kt and MainActivity.kt
    TEMP_PKG_NAME=$PACKAGE_NAME
    
}

# change app name in main.dart and package name in pubspec.yaml
change_app_name(){
    pass
}




echo ----------start------------

get_code_and_rename

echo ----------end------------