
-module(p13).

%% API
-export([decode/1]).

decode(A)->decode(A,[]).

decode([],Rez)->p05:reverse(Rez);
decode([{1,B}|T],Rez)->
  decode(T,[B|Rez]);
decode([{A,B}|T],Rez)->
  decode([{A-1,B}|T],[B|Rez]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
decode_test_()->[
  ?_assert(decode([{4,a},{1,b},{2,c},{2,a},{1,d},{4,e}])=:=[a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
  ?_assert(decode([{1,a}])=:=[a]),
  ?_assert(decode([])=:=[])

].
-endif.