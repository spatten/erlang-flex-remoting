-module(test).
-compile(export_all).

-include_lib("amf/include/amf.hrl").

undefined() ->
    undefined.

null() ->
    null.

false() ->
    false.

true() ->
    true.

integer() ->
    1234.

double() ->
    1234.5678.

string() ->
    <<"This is a string">>.

xmldoc() ->
    {xmldoc, <<"<tag>contents</tag>">>}.

date() ->
    {MegaSecs, Secs, MicroSecs} = erlang:now(),
    MilliSecs = (MegaSecs * 1000000 + Secs) * 1000 + MicroSecs / 1000,
    {date, MilliSecs, 0}.

bytearray() ->
    {bytearray, <<"THIS IS A BYTEARRAY">>}.

array() ->
    [<<"AAPL">>,<<"CSCO">>,<<"MSFT">>,<<"YHOO">>,<<"JNPR">>].

mixed_array() ->
    [string(), double(), {<<"key1">>, 5}, true(), {<<"key3">>, object()},
     false(), integer(), {<<"key2">>, <<"Value2">>}, ?MODULE:date()].

assoc_array() ->
    [{<<"key1">>, 1}, {<<"key2">>, <<"String">>}, {<<"key3">>, 12.23},
     {<<"key4">>, 4}, {<<"key5">>, 5}].

object() ->
    {object, <<"Person">>,
     [{firstName, <<"Ruslan">>},
      {lastName, <<"Babayev">>},
      {age, 32},
      {<<"occupation">>, <<"Software Engineer">>}]}.

%% @doc Returns true if credentials are valid and false otherwize.
%%      Right, now http_mod_amf doesn't really care if you return true or false.
%%      The authentication will be considered successful. Will be fixed in
%%      future releases.
%% @spec (binary(), binary()) -> true | false
my_auth_hook(Username, Password) when Username == Password ->
    error_logger:info_msg("Username and password are indeed the same: ~p",
			  [Username]),
    true;
my_auth_hook(Username, Password) ->
    error_logger:warning_msg("Invalid credentials: ~p:~p",
			     [Username, Password]),
    false.

