import os

proc repoRoot*(): string =
  # TODO: check whether nim/nimble has a syntax for that eg: "$projectDir/../src" (that one is different though; also, that probably can't be used to return a string?)
  currentSourcePath.parentDir.parentDir.parentDir

proc reopBuildDir*(): string =
  ## all generated files go under here (gitignored)
  repoRoot() / "build"

proc repoSrcDir*(): string =
  repoRoot() / "src"

proc formulasDir*(): string =
  repoSrcDir() / "wrappers" / "formulas"

proc repoExeSrcPath*(): string =
  repoSrcDir() / "wrappers" / "nimwrap.nim"

proc repoExePath*(): string =
  # TODO: keep in sync with nimble bin
  reopBuildDir() / "wrappers" / ("nimwrap".addFileExt ExeExt)
