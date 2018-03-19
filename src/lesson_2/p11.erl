
-module(p11).
%% API
-export([encode_modified/1]).


encode_modified([])->[];
encode_modified([H|T]) -> encode_modified(T,[H],1,[]).


encode_modified([],[H|_],1,Rez)->p05:reverse([H|Rez]);
encode_modified([],[H|_],N,Rez)->p05:reverse([{N,H}|Rez]);
encode_modified([H|T],[H|_],N,Rez)->
  encode_modified(T,[H],N+1,Rez);

encode_modified([H1|T1],[H2|_],1,Rez)->
  encode_modified(T1,[H1],1,[H2|Rez]);

encode_modified([H1|T1],[H2|_],N,Rez)->
  encode_modified(T1,[H1],1,[{N,H2}|Rez]).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
encode_modified_test_()->[
  ?_assert(encode_modified([a,a,a,a,b,c,c,a,a,d,e,e,e,e])=:=[{4,a},b,{2,c},{2,a},d,{4,e}]),
  ?_assert(encode_modified([a])=:=[a]),
  ?_assert(encode_modified([])=:=[])

].
-endif.