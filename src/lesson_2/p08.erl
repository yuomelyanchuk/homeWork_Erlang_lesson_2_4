
-module(p08).

%% API
-export([compress/1]).


compress([])->[];
compress([H|T]) ->compress(T,[H]).

compress([],A)->p05:reverse(A);

compress([H|T1],[H|T2])->
  compress(T1,[H|T2]);
compress([H1|T1],[H2|T2])->
  compress(T1,[H1|[H2|T2]]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
compress_test_()->[
  ?_assert(compress([a,a,a,a,b,c,c,a,a,d,e,e,e,e])=:=[a,b,c,a,d,e]),
  ?_assert(compress([])=:=[])

].

-endif.

