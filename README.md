# Mailbox

This is an example of how `{:stop, reason, state}` in a GenServer, will flush
the state of the mailbox without handling each message on shutdown.
