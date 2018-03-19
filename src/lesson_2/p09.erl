-module(p09).
%% API
-export([pack/1]).


pack([])->[];
pack([H|T]) -> pack(T,[H],[]).


pack([],Acc,Rez)->p05:reverse([Acc|Rez]);
pack([H|T],[H|T1],Rez)->
  pack(T,[H|[H|T1]],Rez);
pack([H1|T1],[H2|T2],Rez)->
  pack(T1,[H1],[[H2|T2]|Rez]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
pack_test_()->[
  ?_assert(pack([a,a,a,a,b,c,c,a,a,d,e,e,e,e])=:=[[a,a,a,a],[b],[c,c],[a,a],[d],[e,e,e,e]]),
  ?_assert(pack([a])=:=[[a]]),
  ?_assert(pack([])=:=[])

].
-endif.