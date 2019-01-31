#[
Tool to help manage wrappers, eg:
* upgrade wrappers
* generate individual nimble pacakges
]#

import wrapperspkg/submodule

proc main() =
  echo(getWelcomeMessage())

when isMainModule:
  import cligen
  dispatch(main)

