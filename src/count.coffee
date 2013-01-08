dfdgetWordCount = (e, t, tokenizer=simpleTokenizer) -> 
	text = e.selectionText
	words = tokenizer text
	if text.length is 0
		console.log "No words selected"
	else
		console.log "#{ words } word#{if words>1 then 's' else ''} selected"
		
simpleTokenizer = (text) -> text.split(" ").length

chrome.contextMenus.create
	"title": "Word Count"
	"contexts": ["selection"]
	"onclick": getWordCount