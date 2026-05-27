// Minimal HTTP server using node's built-in http module. Listens on
// the port from $PORT (default 3000) and replies with a single
// greeting line for any request.

import { createServer } from "node:http";

const port = Number.parseInt(process.env.PORT ?? "3000", 10);

const server = createServer((_req, res) => {
  res.statusCode = 200;
  res.setHeader("content-type", "text/plain; charset=utf-8");
  res.end("hello from node-server-example\n");
});

server.listen(port, () => {
  console.log(`node-server-example listening on http://localhost:${port}/`);
});
