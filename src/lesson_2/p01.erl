
-module(p01).
%% API
-export([last/1]).


last([H|[]]) ->H;
last([_H|T])->last(T).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
last_test_()->[
  ?_assert(last([a,b,c,d,e,f])=:=f),
  ?_assertException(error,function_clause,last([]))
].

-endif.