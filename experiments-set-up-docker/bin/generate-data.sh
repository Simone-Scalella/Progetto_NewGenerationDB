#!/bin/bash
set -e

DIR="$(dirname "$(readlink -f "$0")")"
mkdir -p $DIR/../data
cd $DIR/../data

for scale in 20000 ; do
  echo -e "\n=== Generating data for $scale products ===\n"
  rm -Rf dataset td_data $scale
  java -jar ../bin/bsbmtools.jar -fc -pc $scale -s csv=product:nr:2,productfeatureproduct:product:2,producttypeproduct:product:2,review:product:2
  mv dataset $scale
  rm -Rf td_data
  echo
done
