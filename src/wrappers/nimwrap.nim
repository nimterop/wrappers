#[
TODO:
* helpers to upgrade wrappers when new upstream library is released
* mabye: generate individual nimble packages (1 per wrapper)
]#

import std/[os]
import "."/paths

type Action = enum
  list,

proc main(action = list) =
  ##[
  Tool to help manage wrappers, for now:
  * list all wrappers
  ]##
  case action
  of list:
    var wrappers: seq[string]
    for kind, path in walkDir(formulasDir(), relative = true):
      wrappers.add path
    echo wrappers

when isMainModule:
  import cligen
  var ret: seq[string]
  for a in Action: ret.add $a
  # TODO: make this work
  # dispatch(main, help = {"action": $ret})
  dispatch(main, help = {"action": "see wrappers.Action"})
