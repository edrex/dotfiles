Experiment: tools for propogating context across call boundaries
- between processes
- between devices

Contexts can fork like unix process environments, but can be shared between processes.

ContextReporter: Stream[Context]

Reporters could be shell scripts calling ctx cmd, browser plugin, mobile app, or system-level service.

Streams are signed and sync via hypercore.

## Use case examples

- What kind of directory am I in? A wiki or photo archive, or downloads folder? (load appropriate tools)
- What page is currently being viewed in the active window? (make a note)
- What is my user's location? (annotate note)
- What project am I part of? (provide contextual actions)

Processes can access context via environment variables.
  - Set env and call
  - Input: Caller's env
  - IPC/reload via direnv_dump/load mechanism.
  
Context can be sync'd/queried between process groups, and across-devices (hypercore).

Note there is no round-trip "query" interface to providers. Any data that's too big to store in env vars should be referenced somehow (eg IPFS, http)