#[
TODO:
test for `nim c` and `nim cpp`; it matters are some wrappers may make assumptions as to what language is used
]#
import std/[os,unittest,strformat]

import wrappers/[paths]

proc warnSkipped(cmd: string) =
  echo "CAUTION: test skipped: " & cmd

proc runCmdCheck(cmd: string) =
  ## calls `check`, ie on error, fail after all commands are run instead of immediately
  echo (runCmdCheck: cmd)
  let ret = execShellCmd(cmd)
  if ret != 0:
    echo "runCmdCheck failed: " & $(ret: ret, cmd: cmd)
    check false

test "wrappers exe":
  # note: `nimble build` should already build `repoExePath` (wrappers binary) but this makes `nimble test` standalone
  runCmdCheck &"nim c -o:{reopBuildDir()}/wrappers_temp -r {repoSrcDir()}/wrappers.nim -h"

test "import wrappers":
  #[
  An alternative is to import wrappers directly without
  running shell commands
  pros: simpler, faster
  cons: can't run the rest if some dependency for 1 test is missing
  ]#

  let cmd = &"nim c -r {formulasDir()}/soloud/demo.nim -h"
  if defined(OSX) or defined(Windows) or not existsEnv("TRAVIS"):
    runCmdCheck cmd
  else:
    #[
    travis ubuntu fails:
Error: execution of an external compiler program 'gcc -c  -w -I/home/travis/.nimble/pkgs/build/soloud/include -DWITH_OSS  -I/home/travis/.choosenim/toolchains/nim-0.19.2/lib -o /home/travis/.cache/nim/demo_d/soloud_wav.cpp.o /home/travis/.nimble/pkgs/build/soloud/src/audiosource/wav/soloud_wav.cpp' failed with exit code: 1
In file included from /home/travis/.nimble/pkgs/build/soloud/src/audiosource/wav/soloud_wav.cpp:34:0:
/home/travis/.nimble/pkgs/build/soloud/src/audiosource/wav/dr_flac.h:145:43: error: missing binary operator before token "("
 #elif (defined(__clang__) && __has_feature(attribute_deprecated))
                                           ^
    ]#
    warnSkipped cmd
