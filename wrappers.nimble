# Package

version       = "0.1.0"
author        = "nimterop org"
description   = "Wrappers based on nimterop"
license       = "MIT"

srcDir        = "src"

bin = @["wrappers/lib/nimwrap"]
binDir = "build"

installExt    = @["nim", "nims", "cfg"]

# Dependencies
requires "nim >= 0.19.2", "cligen >= 0.9.17", "nimterop >= 0.1.0"

# commenting this out will use nimble's default logic for running tests
# task test, "Test":
#   echo "ok1"

# TODO: add `task docs`
