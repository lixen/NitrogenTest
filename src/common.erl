-module(common).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).

platform() ->
    UA = wf:header(user_agent),
    %% Below is a hack for quickstart so it diesn't rely on having the useragent dep.
    Parsed = case erlang:function_exported(useragent, parse, 1) of
        true -> useragent:parse(UA);
        false -> [{os, [{family, linux}]}]
    end,
    OS = proplists:get_value(os, Parsed, []),
    _Platform = proplists:get_value(family, OS).


header(Selected) ->
    wf:wire(Selected, #add_class { class=selected }),
    #panel { class=menu, body=[
        #link { id=home, url='/', text="SIDAN" },
        #link { id=arra, url='/arra', text="ARRA" },
        #link { id=demos, url='/demos', text="DEMOS" },
        #link { id=learn, url='/learn', text="LEARN MORE" }
    ]}.

footer() ->
    #panel { class=credits, body=["Copyright &copy; 2008-",integer_to_list(erlang:element(1, date())), " Sidan by cl"]}.