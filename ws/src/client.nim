import asyncdispatch, asyncnet

proc newClient(socket: AsyncSocket, serverAddr: string) {.async.} =
  echo("Connecting to ", serverAddr)
  await socket.connect(serverAddr, Port(12345))
  echo("Connected!")
  while true:
    let line = await socket.recvLine()
    echo line


var socket = newAsyncSocket()
asyncCheck newClient(socket, "localhost")

while true:
  asyncdispatch.poll()