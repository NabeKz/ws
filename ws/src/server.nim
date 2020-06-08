import asyncnet, asyncdispatch, strformat
import redis

var clients{.threadvar.}: seq[AsyncSocket]

proc serve() {.async.} =
  clients = @[]  # nim1.0以降なら不要なはず
  let server = newAsyncSocket()
  server.setSockOpt(OptReuseAddr, true)
  server.bindAddr(Port(12345))
  server.listen()

  while true:
    let client = await server.accept() # 新しいsocket接続を待つ
    echo "client add"
    clients.add client


proc `$`(msg: RedisMessage): string = fmt"ch: {msg.channel} msg: {msg.message}"

proc broadCast(subMsg: RedisMessage) {.async.} =
  echo fmt"broad cast! {subMsg}"
  for c in clients:
    await c.send($subMsg & "\c\L")

# Redisと接続
proc newRedisConnection(channel: string) {.async.} =
  let client = await openAsync(host = "redis")
  
  await client.subscribe(channel) # 購読チャンネルの登録
  
  while true:
    let msg = await client.nextMessage()
    echo fmt"message received! from ch: {msg.channel}"
    await broadCast(msg)

# asyncCheck = {.async.}の関数に使うdiscard
asyncCheck serve()
asyncCheck newRedisConnection("ch01")
runForever()