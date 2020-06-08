# Package

version       = "0.1.0"
author        = "Kazuya Watanabe"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
binDir        = "bin"
bin           = @["server", "client"]



# Dependencies

requires "nim >= 1.2.0"
requires "redis"
