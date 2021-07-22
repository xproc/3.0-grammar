#!/bin/bash

if [ "$CIRCLE_BRANCH" = "" ]; then
    # It appears that CircleCI doesn't set CIRCLE_BRANCH for tagged builds.
    # Assume we're doing them on the master branch, I guess.
    BRANCH=master
else
    BRANCH=$CIRCLE_BRANCH
fi

echo "Deploying website updates for $BRANCH branch"

if [ -z "${GIT_EMAIL}" -o -z "{$GIT_USER}" ]; then
    echo "No identity configured with GIT_USER/GIT_EMAIL"
    exit
fi

if [ -z "${GIT_PUB_REPO}" ]; then
    echo "No publication repository configured with GIT_PUB_REPO"
    exit
fi

#git config --global user.email ${GIT_EMAIL}
#git config --global user.name ${GIT_NAME}

echo "Publishing..."

# Switch to the gh-pages branch
git checkout --track origin/gh-pages

cp -Rf build/dist/x* ./relax-ng/
cp -Rf build/dist/core30.rng ./lib/
cp -Rf build/dist/library.xpl ./xproc-3.0/

git add --verbose -f ./relax-ng ./lib ./xproc-3.0
#git commit -m "Successful travis build $TRAVIS_BUILD_NUMBER"
#git push -fq origin gh-pages > /dev/null

echo -e "Published schemas to gh-pages.\n"
