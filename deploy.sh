#!/bin/bash
npm --prefix ./calculator/ run build
sed -i -e 's/\/calculator\///g' ./calculator/build/index.html
aws s3 sync ./calculator/build/ s3://calc.jefersonsilva.in --profile jef --acl public-read 
