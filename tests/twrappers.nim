#[
TODO:
test for `nim c` and `nim cpp`; it matters are some wrappers may make assumptions as to what language is used
]#
import std/[os,unittest,strformat]

import wrappers/lib/paths

proc warnSkipped(cmd: string) =
  echo "CAUTION: test skipped: " & cmd

proc runCmdCheck(cmd: string) =
  echo (runCmdCheck: cmd)
  let ret = execShellCmd(cmd)
  if ret != 0:
    echo "runCmdCheck failed: " & $(ret: ret, cmd: cmd)
    doAssert false
    # TODO: `check false` instead so that on error, fails after all commands are run instead of immediately
    # however, `check false` doesn't show stacktrace so std/unittest check needs to be fixed first

test "wrappers exe":
  # note: `nimble build` should already build `repoExePath` but this makes `nimble test` standalone and we can build with different settings (eg `nim cpp`)
  let exe = repoExePath()
  let (dir, name, ext) = splitFile(exe)
  let exe2 = dir / (name & ".temp1" & ext)
  runCmdCheck &"nim c -o:{exe2} -r {repoExeSrcPath()} -h"

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
