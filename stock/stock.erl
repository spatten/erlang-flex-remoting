-module(stock).
-compile(export_all).

-export([symbols/0, quote/1]).
-import(lists, [subtract/2]).

-include_lib("http/include/http.hrl").
-include_lib("amf/include/amf.hrl").

symbols() ->
    [<<"AAPL">>,<<"CSCO">>,<<"MSFT">>,<<"YHOO">>,<<"JNPR">>].

-define(GOOGLE_FINANCE, "http://www.google.com/finance/info?client=ig&q=").

quote(Symbol) ->
    URL = ?GOOGLE_FINANCE ++ binary_to_list(Symbol),
    #http_response{body = Body} = http_client:request(URL),
    % Fix Google JSON
    Fixed = subtract(subtract(binary_to_list(Body), "// [ "), "] "),
    {struct, Members} = mochijson2:decode(Fixed),
    [$$|LCur] = binary_to_list(proplists:get_value(<<"l_cur">>, Members)),
    list_to_float(LCur).
