
-module(p15).

%% API
-export([replicate/2]).


replicate([],_) ->[];
replicate(A,N)-> replicate(A,N,N,[]).

replicate([],_,_,Acc)->p05:reverse(Acc);
replicate([H|T],N,1,Acc)->replicate(T,N,N,[H|Acc]);
replicate([H|T],N,N2,Acc)->replicate([H|T],N,N2-1,[H|Acc]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
replicate_test_()->[
  ?_assert(replicate([a,b,c,c,d],2)=:=[a,a,b,b,c,c,c,c,d,d]),
  ?_assert(replicate([{1,a}],3)=:=[{1,a},{1,a},{1,a}]),
  ?_assert(replicate([],5)=:=[])

].
-endif.