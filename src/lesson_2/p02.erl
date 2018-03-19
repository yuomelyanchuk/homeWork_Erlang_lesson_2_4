
-module(p02).
%% API
-export([but_last/1]).


but_last([H1|[H2|[]]]) ->[H1,H2];
but_last([_H1|[H2|T]]) ->but_last([H2|T]).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
but_last_test_()->[
  ?_assert(but_last([a,b,c,d,e,f])=:=[e,f]),
  ?_assertException(error,function_clause,but_last([]))
].

-endif.