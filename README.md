[//]: # (this is a hidden comment)

[![Chat on Gitter](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/nimgen/Lobby)

[![Build status](https://ci.appveyor.com/api/projects/status/ktoux8hl57k29uox/branch/master?svg=true)](https://ci.appveyor.com/project/genotrance/wrappers/branch/master)

[![Build Status](https://travis-ci.org/nimterop/nimterop.svg?branch=master)](https://travis-ci.org/nimterop/nimterop)

# Wrappers for Nim based on nimterop

## Note
* PR's welcome!
* Still in alpha, the API is subject to change.

## Goal
* repository of thin wrappers that are kept up to date with latest nimterop developments
* for analogy think `homebrew` but for Nim wrappers:
  - https://github.com/Homebrew/brew => https://github.com/nimterop/nimterop
  - https://github.com/Homebrew/homebrew-core => https://github.com/nimterop/wrappers
  - `brew` command => `wrappers` command

## Usage

From your project:
* add to your nimble file: `requires "wrappers"`
* import a wrapper (eg `soloud`) as follows:
```
import wrappers/formulas/soloud
```
