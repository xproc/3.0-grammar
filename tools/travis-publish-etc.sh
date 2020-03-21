#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
    echo "Cannot publish pull requests."
    exit
fi

if [ "$GIT_PUB_REPO" != "" ]; then
    echo "Preparing to publish to $GIT_PUB_REPO..."
    cd $HOME
    git config --global user.email ${GIT_EMAIL}
    git config --global user.name ${GIT_NAME}

    if [ "$GH_TOKEN" != "" ]; then
        echo "Publishing..."

        git clone --quiet --branch=gh-pages \
            https://${GH_TOKEN}@github.com/${GIT_PUB_REPO} gh-pages > /dev/null

        cd gh-pages
        cp -Rf $TRAVIS_BUILD_DIR/build/dist/x* ./relax-ng/
        cp -Rf $TRAVIS_BUILD_DIR/build/dist/core30.rng ./lib/
        cp -Rf $TRAVIS_BUILD_DIR/build/dist/library.xpl ./xproc-3.0/

        git add --verbose -f .
        git commit -m "Successful travis build $TRAVIS_BUILD_NUMBER"
        git push -fq origin gh-pages > /dev/null

        echo -e "Published schemas to gh-pages.\n"
    else
        echo -e "Publication skipped; no token.\n"
    fi
fi
