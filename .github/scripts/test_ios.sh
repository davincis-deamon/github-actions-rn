#!/bin/bash


pm2 start ./.github/scripts/npm_start.sh
sleep 10
pm2 start ./.github/scripts/npm_appium_start.sh
sleep 10
npm run test:e2e:ios
pm2 stop ./.github/scripts/npm_start.sh
pm2 stop ./.github/scripts/npm_appium_start.sh
