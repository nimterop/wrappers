#[
Tool to help manage wrappers, eg:
* upgrade wrappers
* generate individual nimble pacakges
]#

import std/[os]
import wrapperspkg/paths

proc main() =
  var wrappers: seq[string]
  for kind, path in walkDir(wrappersDir(), relative = true):
    wrappers.add path
  echo wrappers

when isMainModule:
  import cligen
  dispatch(main)
