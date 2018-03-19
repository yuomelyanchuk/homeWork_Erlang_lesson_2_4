-module(p04).

%% API
-export([len/1]).

len(X)->len(X,0).

len([],N) ->N;
len([_H|T],N)->len(T,N+1).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
len_test_()->[
  ?_assert(len([a,b,c,d,e,f])=:=6),
  ?_assert(len([a,b,c,d,e])=:=5),
  ?_assert(len([])=:=0)

].

-endif.