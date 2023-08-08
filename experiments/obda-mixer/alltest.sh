#!/bin/bash
echo "running the sc1"
bash -c "source tester.sh;sc1"
echo "running sc1 complete"

echo "running the sc2"
bash -c "source tester.sh;sc2"
echo "running sc2 complete"


echo "running the hom"
bash -c "source tester.sh;hom"
echo "running hom complete"

echo "running the het"
bash -c "source tester.sh;het"
echo "running het complete"

echo "running the homOpt"
bash -c "source tester.sh;homOpt"
echo "running homOpt complete"

echo "running the homOptMat"
bash -c "source tester.sh;homOptMat"
echo "running homOptMat complete"


echo "running the hetOpt"
bash -c "source tester.sh;hetOpt"
echo "running hetOpt complete"

echo "running the hetOptMat"
bash -c "source tester.sh;hetOptMat"
echo "running hetOptMat complete"