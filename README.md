# elm-mastodon-tooty

`elm-mastodon-tooty` is an Elm library for the [Mastodon](https://joinmastodon.org/) social-networking system. This library is used by [Tooty](https://github.com/n1k0/tooty), an alternative multi-accounts Web client for Mastodon.

# Dev

## Install `pre-commit`

Install [pre-commit](https://pre-commit.com/) and run:

    pre-commit install

## Install dependencies

    npm ci

## Run tests

    npm test

# Publish a new version

    elm bump
    git tag <tag_number>
    git push --tags origin main
    elm publish
