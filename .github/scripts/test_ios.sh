#!/bin/bash


pm2 start npm_start.sh
sleep 10
pm2 start npm_appium_start.sh
sleep 10
npm run test:e2e:ios
pm2 stop npm_start.sh
pm2 stop npm_appium_start.sh
