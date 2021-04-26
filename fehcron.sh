#!/bin/bash
kill -9 $(pgrep -f ${BASH_SOURCE[0]} | grep -v $$);
{
while true;do
  feh --bg-scale --randomize /home/hallowdance/pictures/wallpaper/art/*
  sleep 60m;
done 
} &

