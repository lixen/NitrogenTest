-module (demos_qr).
-include_lib ("nitrogen_core/include/wf.hrl").
-compile(export_all).

main() -> #template { file="./templates/demos46.html" }.

title() -> "QR Codes".
headline() -> "QR Codes".

left() -> 
    [
        "
        <p>
		The <code>#qr{}</code> element lets you easily add a QR code to your
		page or application.  If no data is specified, the QR code will default
		to the current URL.",
        linecount:render()
    ].

right() -> [
    #h2{text="Big QR Code of current page" },
	#qr{size=300},

	#h2{text="QR Code of Nitrogen on Github"},
	#qr{data="https://github.com/nitrogen"},

	#h2{text="QR Code of some text"},
	#qr{data="What if I told you you could build a website without writing javascript?"}
].

event(_) -> ok.
