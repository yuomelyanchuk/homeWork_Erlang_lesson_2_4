
-module(bs02).

%% API
-export([words/1]).


words(A) ->
  words(A,<<>>,[]).

words(<<>>,Acc,Rez)->p05:reverse([Acc|Rez]);
words(<<" ",Rest/binary>>,Acc,Rez)->
  words(Rest,<<>>,[Acc|Rez]);
words(<<N,Rest/binary>>,Acc,Rez)->
  words(Rest,<<Acc/binary,N>>,Rez).


-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
words_test_()->[
  ?_assert(words(<<"Some text">>)=:=[<<"Some">>,<<"text">>]),
  ?_assert(words(<<"Some">>)=:=[<<"Some">>]),
  ?_assert(words(<<"">>)=:=[<<"">>])

].
-endif.