-module(p05).

%% API
-export([reverse/1]).


reverse(H) ->reverse(H,[]).


reverse([],A)->A;
reverse([H|T],A)->reverse(T,[H|A]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
reverse_test_()->[
  ?_assert(reverse([a,b,c,d,e,f])=:=[f,e,d,c,b,a]),
  ?_assert(reverse([a,b,c,d,e])=:=[e,d,c,b,a]),
  ?_assert(reverse([])=:=[])

].

-endif.

