window.initiated = false # Whether script has already been injected.

getWordCount = (e, t, tokenizer=simpleTokenizer) -> 
	text = e.selectionText
	words = tokenizer text
	if text.length is 0
		msg = "No words selected"
	else
		msg = "#{ words } word#{if words>1 then 's' else ''} selected"

	# Only add file when script is run, but only add once.
	if window.initiated is not true
		chrome.tabs.executeScript t.id, {file:"dialog.js"}, (e) =>
			window.initiated = true
			chrome.tabs.sendMessage t.id, {message: msg}
			return
	else 
		chrome.tabs.sendMessage t.id, {message: msg}
		return
		
	return
                           
simpleTokenizer = (text) -> text.split(" ").length

chrome.contextMenus.create
	"title": "Word Count"
	"contexts": ["selection"]
	"onclick": getWordCount