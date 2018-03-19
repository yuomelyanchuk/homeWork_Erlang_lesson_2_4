
-module(p07).


%% API
-export([flatten/1]).

flatten(X)->
  flatten(X,[]).


flatten([], Acc) -> Acc;
flatten([H|T], Acc) ->
  flatten(H, flatten(T, Acc));
flatten(E, Acc) -> [E|Acc].


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
flatten_test_()->[
  ?_assert(flatten([a,[],[b,[c,d],e]])=:=[a,b,c,d,e]),
  ?_assert(flatten([a,[],[b,[cd],e]])=:=[a,b,cd,e]),
  ?_assert(flatten([])=:=[])

].

-endif.