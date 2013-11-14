#!/bin/bash

echo "$c2            _                                   "
echo "$c2           (_)                                  "
echo "$c2  _ __ ___  _ _ __   ___ _ __   ___  ___  _ __  "
echo "$c2 |  _   _ \| |  _ \ / _ \  _ \ / _ \/ _ \|  _ \ "
echo "$c2 | | | | | | | | | |  __/ |_) |  __/ (_) | | | |"
echo "$c2 |_| |_| |_|_|_| |_|\___|  __/ \___|\___/|_| |_|"
echo "$c2                        | |                     "
echo "$c2                        |_| LCDStats Plugin     "
echo "$c2                            by Henry W. (tk1337)"
echo
echo "This will install the LCDStats plugin for MinePeon."
echo "It will require sudo access to install the service and ask"
echo "you for your password."
echo
echo "** This works with a specific LCD, AIDA64 LCD for more information"
echo "about where to buy the LCD & more, check the README.md file **"
echo

read -p "Continue installation of LCDStats plugin? [y/n]" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

  echo
  echo "[OPTIONAL] Enter default which miner to use as default:"
  echo "[1] CGMiner"
  echo "[2] BFGMiner"
  read miner
  echo
  echo "[OPTIONAL] Enter which exchange to use as default for ticker:"
  echo "[1] Mt.Gox"
  echo "[2] Bitstamp"
  read exchange
  echo
  
  cp -rf LCDStats /opt/minepeon/plugin/
  
  # Install service
  sudo cp service/lcdstats.service /usr/lib/systemd/system/
  sudo systemctl daemon-reload
  sudo systemctl start lcdstats.service
  sudo systemctl enable lcdstats.service
  
  echo
  echo
  echo "If no errors appeared, installation was successful!"
  echo 
fi
