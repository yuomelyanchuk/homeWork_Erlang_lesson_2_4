
-module(p14).

%% API
-export([duplicate/1]).


duplicate([]) ->[];
duplicate(A)-> duplicate(A,[]).

duplicate([],Acc)->p05:reverse(Acc);
duplicate([H|T],Acc)->duplicate(T,[H|[H|Acc]]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
duplicate_test_()->[
  ?_assert(duplicate([a,b,c,c,d])=:=[a,a,b,b,c,c,c,c,d,d]),
  ?_assert(duplicate([{1,a}])=:=[{1,a},{1,a}]),
  ?_assert(duplicate([])=:=[])

].
-endif.
