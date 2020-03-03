defmodule MailboxTest do
  use ExUnit.Case
  doctest Mailbox

  test "greets the world" do
    assert Mailbox.hello() == :world
  end
end
