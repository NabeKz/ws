import jester
import dotenv, os
import strutils
import asyncnet

let env = if defined(DEV): initDotEnv(): else: initDotEnv()
env.load()

router router:
  get "/":
    resp("hello!")
  get "/home":
    resp("welcome my Home")

proc main() =
  let 
    port = Port(getEnv("APP_PORT").parseUInt)
    settings = newSettings(port = port)
  var
    jester = initJester(router, settings = settings)
  jester.serve()

when isMainModule:
  main()