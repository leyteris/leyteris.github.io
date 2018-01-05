#!/bin/bash
# author:Leyteris
jekyll build
git st
git add .
git commit -m "md update"
git push origin master