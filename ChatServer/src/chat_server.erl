-module(chat_server).
-define(SERVER, chat_server).
-export([start/0, stop/0, loop/1, register/2, unregister/1, send_message/2, broadcast_message/1]).

start() ->
  Pid = spawn(chat_server, loop, [dict:new()]),
  erlang:register(?SERVER, Pid).

stop() ->
  ?SERVER ! terminate.

register(ClientName, ClientPid) ->
  ?SERVER ! {register_client, ClientName, ClientPid}.

unregister(ClientName) ->
  ?SERVER ! {unregister_client, ClientName}.

send_message(ClientName, MessageBody) ->
  ?SERVER ! {send_message, ClientName, MessageBody}.

broadcast_message(MessageBody) ->
  ?SERVER ! {broadcast, MessageBody}.

loop(Clients) ->
  receive
    {register_client, ClientName, ClientPid} ->
      loop(dict:store(ClientName, ClientPid, Clients));
    {unregister_client, ClientName} ->
      case dict:find(ClientName, Clients) of
        {ok, ClientPid} ->
          ClientPid ! stop,
          loop(dict:erase(ClientName, Clients));
        error ->
          io:format("Client ~p not found~n", [ClientName]),
          loop(Clients)
      end;
    {send_message, ClientName, MessageBody} ->
      case dict:find(ClientName, Clients) of
        {ok, ClientPid} -> ClientPid ! {recv_message, MessageBody};
        error -> io:format("Client ~p not found.~n", [ClientName])
      end,
      loop(Clients);
    {broadcast, MessageBody} ->
      send_to_all(MessageBody, dict:to_list(Clients)),
      loop(Clients);
    terminate ->
      ok;
    BadMessage ->
      io:format("Unrecognized message: ~p~n", [BadMessage]),
      loop(Clients)
  end.

send_to_all(_, []) -> ok;
send_to_all(MessageBody, [{_, ClientPid} | OtherClients]) ->
  ClientPid ! {recv_message, MessageBody},
  send_to_all(MessageBody, OtherClients).
