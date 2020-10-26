#!/bin/bash 

# Created by Auro on 25th October at 1:17AM
# Dussehra ta chalichy au mu basiki aeya karuchy .. kan kariba au .. 
# vabideichy taw karibaku padiba au ... au smt re a bala corona ... 
# pura flop kridela dussehra maja ...
# chada au ... Lets hope for the best ... Vagawan nku etiki pratharna...
# Please ae project ta atleast complete hbaku diyaaaaaaaaaaaaaaaaaaaaaaaaaa....
# Toh Chaliyeeeee Shuru Karte hein ...  
# bdw Happy Dussehra :)

# variables
REPO_NAME="pi-test"
PACKAGE_NAME='in.student.pitest'
APP_NAME='Pi Test'
REPO_URL=''
ROOT_PATH=''
BOILER_PKG_NAME='com.smarttersstudio.ecommerceapp'
GRADLE_PATH='android/app'
MANIFEST_PATH1='android/app/src/debug' #debug
MANIFEST_PATH2='android/app/src/main' #main
MANIFEST_PATH3='android/app/src/profile' #profile
PKG_FOLDER_PATH='android/app/src/main/kotlin' #ex - in/student/pitest
KT_PATH='android/app/src/main/kotlin/com/smarttersstudio/ecommerceapp'

# project details as user input
take_project_details(){
    pass
}

# gets boilerplate code and process it
get_code_and_rename(){
    #git clone https://gitlab.com/e-commerce-basic/e-commerce-flutter.git
    oldFolderName=`ls | grep e-commerce-flutter | awk '{print $1;}'`
    mv $oldFolderName "$REPO_NAME"
    cd "${REPO_NAME}"
    ROOT_PATH=`pwd`
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
    echo "...manifests update done"

    # update in Application.kt and MainActivity.kt
    echo "...kt files update starts"
    TEMP_PKG_NAME=$PACKAGE_NAME
    if [[ $TEMP_PKG_NAME =~ "in" ]]; then
        TEMP_PKG_NAME=${TEMP_PKG_NAME/in/\`in\`}
    fi
    sed -i .bak "s/${BOILER_PKG_NAME}/${TEMP_PKG_NAME}/" $KT_PATH\/Application.kt
    rm -rf $KT_PATH\/Application.kt.bak
    sed -i .bak "s/${BOILER_PKG_NAME}/${TEMP_PKG_NAME}/" $KT_PATH\/MainActivity.kt
    rm -rf $KT_PATH\/MainActivity.kt.bak
    echo "...kt files update done"

    NEW_F_NAMES=(${PACKAGE_NAME//./ })
    OLD_F_NAMES=(${BOILER_PKG_NAME//./ })

    # update kt folder names
    echo "...kt folder name update starts"
    mv $PKG_FOLDER_PATH\/${OLD_F_NAMES[0]}\/${OLD_F_NAMES[1]}\/${OLD_F_NAMES[2]} $PKG_FOLDER_PATH\/${OLD_F_NAMES[0]}\/${OLD_F_NAMES[1]}\/${NEW_F_NAMES[2]}
    mv $PKG_FOLDER_PATH\/${OLD_F_NAMES[0]}\/${OLD_F_NAMES[1]} $PKG_FOLDER_PATH\/${OLD_F_NAMES[0]}\/${NEW_F_NAMES[1]}
    mv $PKG_FOLDER_PATH\/${OLD_F_NAMES[0]} $PKG_FOLDER_PATH\/${NEW_F_NAMES[0]}
    echo "...kt folder name update done"
    
    # update pubspec.yaml
    echo "...pubspec update starts"
    sed -i .bak "s/${OLD_F_NAMES[2]}/${NEW_F_NAMES[2]}/" pubspec.yaml
    rm -rf pubspec.yaml.bak
    echo "...pubspec update done"

    # update main.dart
    echo "...main.dart update starts"
    sed -i .bak "s/"Flutter\ Demo"/${APP_NAME}/" lib\/main.dart
    rm -rf lib\/main.dart.bak
    echo "...main.dart update done"

    # update all imports
    echo "...imports update starts"
    find . -type f -name "*.dart" -exec sed -i .bak "s/${OLD_F_NAMES[2]}/${NEW_F_NAMES[2]}/" {} +
    find . -name "*.dart.bak" -type f -delete
    echo "...imports update done"

}



echo ----------start------------

get_code_and_rename

echo ----------end------------