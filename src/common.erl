% vim: ts=4 sw=4 et
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
        #link { id=downloads, url='/downloads', text="ARRA" },
        #link { id=demos, url='/demos', text="DEMOS" },
        #link { id=docs, url='/doc/index.html', text="DOCUMENTATION" },
        #link { id=learn, url='/learn', text="LEARN MORE" },
        #link { id=community, url='/community', text="GET INVOLVED" }
    ]}.

footer() ->
    {Year,_,_} = date(),
    YearStr = integer_to_list(Year),
    #panel { class=credits, body=[
        "
        Copyright &copy; 2008-",YearStr,"
        Sidan by cl
        "
    ]}.

github_fork() ->   

    #link{
        style="position:absolute;top:0; left:0;",
        url="https://github.com/nitrogen",
		text="öligaste"
    }.
