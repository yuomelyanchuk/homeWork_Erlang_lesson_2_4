-module(p10).

%% API
-export([encode/1]).

encode([])->[];
encode([H|T]) -> encode(T,[H],1,[]).

encode([],[H|_],N,Rez)->p05:reverse([{N,H}|Rez]);
encode([H|T],[H|_],N,Rez)->
  encode(T,[H],N+1,Rez);
encode([H1|T1],[H2|_],N,Rez)->
  encode(T1,[H1],1,[{N,H2}|Rez]).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
encode_test_()->[
  ?_assert(encode([a,a,a,a,b,c,c,a,a,d,e,e,e,e])=:=[{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}]),
  ?_assert(encode([a])=:=[{1,a}]),
  ?_assert(encode([])=:=[])

].
-endif.