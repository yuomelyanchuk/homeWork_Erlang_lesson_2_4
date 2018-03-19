
-module(p03).


%% API
-export([element_at/2]).



element_at([], _N) ->undefined;
element_at([H|_T], 1) ->H;
element_at([_H|T],N)->element_at(T,N-1).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
element_at_test_()->[
  ?_assert(element_at([a,b,c,d,e,f],4)=:=d),
  ?_assert(element_at([a,b,c,d,e,f],10)=:=undefined),
  ?_assert(element_at([a,b,c,d,e,f],-3)=:=undefined),
  ?_assert(element_at([],5)=:=undefined)
].

-endif.