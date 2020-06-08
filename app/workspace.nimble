# Package

version       = "0.1.0"
author        = "Kazuya Watanabe"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
binDir        = "public"
bin           = @["main"]


# Dependencies

requires "nim >= 1.2.0"
requires "jester"
requires "dotenv"

# tasks
import strformat
import sequtils
task dev, "dev":
  let target = bin.mapIt(srcDir & "/" & it)
  exec(fmt"nim c --nimbleDir .nimble {target} --out public/main")
