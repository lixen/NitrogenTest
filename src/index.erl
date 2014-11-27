-module (index).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).

main() -> #template { file="./templates/grid.html" }.

title() -> "Sidan Since 2014".


layout() ->
    #container_12 { body=[
        #grid_12 { class=header, body=common:header(home) },
        #grid_clear {},
		 #grid_6 {prefix = 3, class=header, body=writer_empty() },
		#grid_clear {},

        #grid_10{prefix = 1,  omega=true, body=posts() },
        #grid_clear {},

        #grid_12 { body=common:footer() }
    ]}.

writer_empty() ->
	[#panel{id = writewrapper,body =[#button{postback=write,text="Skrivskit"}]}].

writer() ->
	[#panel{id = writewrapper, class=writer, body =
				[#textbox{id=nummer, placeholder="#", maxlength=2, size=2}, #br{},
			#radiogroup { id=myRadio, body=[
											#radio { id=myRadio1, text="1", value="1"},
											#radio { id=myRadio2, text="2", value="2"},
											#radio { id=myRadio3, text="3", value="3"},
											#radio { id=myRadio4, text="4", value="4"}
										   ]},
				 #textarea{id=nummer, columns=50, rows=3}, #br{},
				 #button{ id=writebutton, postback=write2,text="Post"}
		   ]}].

posts() ->
    [
        #p{ class="summary", body=[
            "<b>Nitrogen Web Framework</b> is the fastest way to
            develop interactive web applications in full-stack Erlang.
            "
        ]},
        #p { class="section_title", body=""},
        #p { class="section section_download", body=[
             "asdasdasd",
			#br{}
        ]},

        #p{ class=post, body= <<"Nitrogen 2.2.2 Released!asadsasd asdasdasdasdsadasdasd">>},
        #p{ class=post,         body=[<<"Nitrogen 2.2.2 Released!">>]},
        #p{ class=post,         body=[<<"Nitrogen 2.2.1 Released!">>]},
        #p{ class=post,         body=[<<"Nitrogen 2.2.0 Released!">>]},
        #p{ class=post, body="LATEST TWEETS" }
    ].

event(write) ->
    wf:replace(writewrapper, writer());

event(write2) ->
    wf:replace(writewrapper, writer_empty()).

nummer_validator(_Tag, Value) ->
	case string:to_integer(Value) of 
		{error,no_integer} -> false;
		_                  -> true
	end.



activate_validater() ->
    wf:wire(createButton, description,
	    #validate { validators=[
				    #is_required { text="Please describe your event" }
				   ]}),

    wf:wire(createButton, emailAddress,
	    #validate { validators=[
				    #is_email { text="Not a valid email address." }
				   ]}).
