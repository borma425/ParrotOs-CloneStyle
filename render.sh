#!/bin/bash


# About ParrotOS-CloneStyle

: << 'AAA'

Free Tool `Work smart` based to Control And Restore Linux[ Parrot os] Desktop System Settings Using `Dconf` packge

Author info {

name     : "Yehia Elborma",

version  : 1.0.0,

Title    : "Borma",

Link     : "https://twitter.com/borma425",

TestedOn : [" Parrot Home Edition "," Parrot Security Edition "]

}

Keyboard Layout Support : [ "Arabic" , "English" , " Frensh > Morocco " ]



AAA




stylesPath="./styles/";
fileExtensions="conf";
recommendedStyle="${stylesPath}recommended.${fileExtensions}";
digitalStyle="${stylesPath}digital.${fileExtensions}";
oldStyle="${stylesPath}old.old.${fileExtensions}";
SideMenu_favourites="$(grep -Po '^.*\b(favourites)\b.*$' $oldStyle)"






addStyle() {


# sudo /usr/bin/update-desktop-database;

sleep 0.1


if [[ $SideMenu_favourites ]]; then

favouritesList=( $recommendedStyle $digitalStyle  )

for file in "${favouritesList[@]}"
do



sed -i "2a\\$SideMenu_favourites" $file



sleep 0.2

done

else

echo "No favourites";

fi


sleep 0.4

dconf reset -f /;

sleep 0.9

dconf load / < $1;

sleep 0.2


}



saveStyle() {

if [ -s $oldStyle ]; then

# The file is not-empty.



addStyle $1



else

sudo apt install dconf*;
dconf dump / > $oldStyle;




sleep 0.7
addStyle $1

fi

}








if  [[ $1 = "-digital" ]]; then

# Digital Style
saveStyle $digitalStyle

elif [[ $1 = "-rec" ]]; then

# Recommendation Style
: << 'AAA'

The best way to abbreviate Recommendation or Recommend is REC or sometimes just R.

AAA


saveStyle $recommendedStyle


elif [[ $1 = "-old" ]]; then

# Your Old Style

saveStyle $oldStyle

elif [[ $1 = "-save" ]]; then

# Save Your Current Style

dconf dump / > ParrotStyle-$RANDOM


elif [[ $1 = "-help" ]]; then


cat <<EOF
$(tput setaf 3)
--------------

Hey $USER  !

$(tput setaf 6)
These commands will help you :
$(tput setaf 11)

-rec :
        To choose a style, we have recommended it to you and it is simple



-digital :
        To Choose a modern, sophisticated style with animated elements


-old :
        To choose your old style before you install this tool


-save :
        To Save the current style you are using


-help :
        You are already using it :D



------------

EOF




echo


else

echo "Use another arguments"



fi

