
-module(p06).

%% API
-export([is_palindrome/1]).


is_palindrome([])->true;
is_palindrome(A) ->A==p05:reverse(A).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
is_palindrome_test_()->[
  ?_assert(is_palindrome([a,b,c,c,b,a])=:=true),
  ?_assert(is_palindrome([a,b,c,c,b,a,a])=:=false),
  ?_assert(is_palindrome([])=:=true)

].

-endif.