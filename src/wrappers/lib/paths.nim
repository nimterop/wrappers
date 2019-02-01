import os

# TODO: make all these const instead of procs (easier to use); only downside: can't be relocated; but maybe not needed

proc repoRoot*(): string =
  # TODO: check whether nim/nimble has a syntax for that eg: "$projectDir/../src" (that one is different though; also, that probably can't be used to return a string?)
  currentSourcePath.parentDir.parentDir.parentDir.parentDir

proc repoBuildDir*(): string =
  ## all generated files go under here (gitignored)
  repoRoot() / "build"

proc repoSrcDir*(): string =
  repoRoot() / "src"

proc wrappersDir*(): string =
  repoSrcDir() / "wrappers"

proc formulasDir*(): string =
  # wrappersDir() / "formulas"
  wrappersDir()

proc libDir*(): string =
  wrappersDir() / "lib"

proc repoExeSrcPath*(): string = # rename
   libDir() / "nimwrap.nim"

proc repoExePath*(): string =
  # TODO: keep in sync with nimble bin
  # TODO: find a way for nimble to output binary where we want, eg in repoBuildDir() / "nimwrap"
  repoBuildDir() / "wrappers" / "lib" / ("nimwrap".addFileExt ExeExt)
