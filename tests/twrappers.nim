import std/[os,unittest,strformat]

import wrapperspkg/[paths]

proc runCmdCheck(cmd: string) =
  ## calls `check`, ie on error, fail after all commands are run instead of immediately
  echo (runCmdCheck: cmd)
  let ret = execShellCmd(cmd)
  if ret != 0:
    echo "runCmdCheck failed: " & $(ret: ret, cmd: cmd)
    check false

test "wrappers exe":
  runCmdCheck &"nim c -r {repoSrcDir()}/wrappers.nim -h"

test "import wrappers":
  #[
  An alternative is to import wrappers directly without
  running shell commands
  pros: simpler, faster
  cons: can't run the rest if some dependency for 1 test is missing
  ]#
  runCmdCheck &"nim c -r {wrappersDir()}/soloud/demo.nim -h"
