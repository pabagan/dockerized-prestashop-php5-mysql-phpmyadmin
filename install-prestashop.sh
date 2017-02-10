#!/bin/sh

# PrestaShop Version
PS_VERSION=1.7.0.4

if [ ! -f ./prestashop  ]; then
  # Get Prestashop
  if [ ! -f ./prestashop.zip  ]; then
    echo "\n* Getting PrestaShop";
    curl https://www.prestashop.com/download/old/prestashop_$PS_VERSION.zip > ./prestashop.zip
  fi
  
  # Extract shop files
  mkdir tmp && \
  unzip prestashop.zip  -d tmp/prestashop && \
  unzip tmp/prestashop/prestashop.zip  -d prestashop && \
  rm -R tmp && \
  rm -R prestashop.zip

else
  echo "\n* PrestaShop is already installed";
fi

# set permissions to create installations
sudo chown -R www-data:www-data prestashop

echo "\n* PrestaShop is ready!!";

