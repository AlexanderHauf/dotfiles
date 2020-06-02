#! /bin/sh

# deploy a autoupdate script for apt

if [ -f /home/"$(logname)"/.update.sh ]; then  # logname prevents root as the username
  echo; echo "--- .update.sh exists already - please check and remove the script and then try again ---"; echo
else
  [ -z "$(dpkg -l | grep 'xclip')" ] && sudo apt install xclip -y

  echo "#! /bin/sh

  sudo apt update -y
  sudo apt upgrade -y
  sudo flatpak update" > /home/"$(logname)"/.update.sh

  sudo chmod +x /home/"$(logname)"/.update.sh

  echo "@reboot /bin/sh /home/"$(logname)"/.update.sh
  1 */5 * * * /bin/sh /home/"$(logname)"/.update.sh" | xclip -selection c

  echo; echo ">>> please go to a new tab and execute 'sudo crontab -e' and paste new crontabs in >>>
  and then continue with ENTER"; echo
  read yn; echo
fi
