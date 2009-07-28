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

array() ->
    [<<"AAPL">>,<<"CSCO">>,<<"MSFT">>,<<"YHOO">>,<<"JNPR">>].

mixed_array() ->
    [string(), double(), true(), false(), integer(), ?MODULE:date()].

object() ->
    #amf_object{
	members = [{firstName, <<"Ruslan">>},
		   {lastName, <<"Babayev">>},
		   {age, 32}
		  ]}.

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

