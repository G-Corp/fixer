% @hidden
-module(fixer_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, []).

init([]) ->
  {ok, {
     #{strategy => one_for_one,
       intensity => 1,
       period => 5},
     [
      #{id => fixer,
        start => {fixer, start_link, []},
        type => worker,
        shutdown => 5000}
     ]
    }}.
