
-module(bs03).
-export([split/2]).
%%length
len(A) ->
  len(A,0).
len(<<"">>,N)->N;
len(<<_X,Rest/binary>>,N)->
  len(Rest,N+1).

split(Str, Spl) ->
  split(Str,list_to_binary(Spl),<<>>,[]).

split(<<>>,_,Acc,Rez)->p05:reverse([Acc|Rez]);
split(A,Spl,Acc,Rez)->
  L=len(Spl),
  <<"",X:L/binary,Rest/binary>>=A,
  LX=len(<<X/binary,Rest/binary>>),
  if
    LX=<L, X /= Spl, Rest/=Spl ->   split(<<>>,Spl,<<Acc/binary,X/binary,Rest/binary>>,Rez);
    X == Spl->split(Rest,Spl,<<>>,[Acc|Rez]);
    true -> <<N,Rest2/binary>>=X,
      split(<<Rest2/binary,Rest/binary>>,Spl,<<Acc/binary,N>>,Rez)
  end.

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
words_test_()->[
  ?_assert(split(<<"Some text">>," ")=:=[<<"Some">>,<<"text">>]),
  ?_assert(split(<<"Some">>,"-:-")=:=[<<"Some">>]),
  ?_assert(split(<<"">>,"-:-")=:=[<<"">>]),
  ?_assert(split(<<"Col1-:-Col2-:-Col3-:-Col4-:-Col5">>, "-:-")=:=[<<"Col1">>,<<"Col2">>,<<"Col3">>,<<"Col4">>,<<"Col5">>]),
  ?_assert(split(<<"Col1-:--:-Col2-:-">>,"-:-")=:=[<<"Col1">>,<<>>,<<"Col2">>,<<>>])
].
-endif.


