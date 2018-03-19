
-module(p12).

%% API
-export([decode_modified/1]).


decode_modified([]) ->[];
decode_modified(A)->decode_modified(A,[]).


decode_modified([],Rez)->p05:reverse(Rez);
decode_modified([{1,B}|T],Rez)->
  decode_modified(T,[B|Rez]);
decode_modified([{A,B}|T],Rez)->
  decode_modified([{A-1,B}|T],[B|Rez]);
decode_modified([H|T],Rez)->
  decode_modified(T,[H|Rez]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
decode_modified_test_()->[
  ?_assert(decode_modified([{4,a},b,{2,c},{2,a},d,{4,e}])=:=[a,a,a,a,b,c,c,a,a,d,e,e,e,e]),
  ?_assert(decode_modified([a])=:=[a]),
  ?_assert(decode_modified([])=:=[])

].
-endif.