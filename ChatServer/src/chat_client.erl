-module(chat_client).
-export([register_client/1, create_client/1, receive_message/1]).

register_client(ClientName) ->
  ClientPid = create_client(ClientName),
  chat_server:register(ClientName, ClientPid),
  ok.

create_client(ClientName) ->
  spawn(chat_client, receive_message, [ClientName]).

receive_message(ClientName) ->
  receive
    {recv_message, MessageBody} ->
      io:format("~p received: ~p~n", [ClientName, MessageBody]),
      receive_message(ClientName);
    stop ->
      ok
  end.

