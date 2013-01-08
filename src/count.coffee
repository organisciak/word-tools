getWordCount = (e, t, tokenizer=simpleTokenizer) -> 
	text = e.selectionText
	words = tokenizer text
	if text.length is 0
		alert "No words selected"
	else
		alert "#{ words } word#{if words>1 then 's' else ''} selected"
		
simpleTokenizer = (text) -> text.split(" ").length

chrome.contextMenus.create
	"title": "Word Count"
	"contexts": ["selection"]
	"onclick": getWordCount