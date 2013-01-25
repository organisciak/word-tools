getWordCount = (e, t, tokenizer=regexTokenizer) -> 
	responses = 0
	chrome.tabs.executeScript t.id, {
        code: '''chrome.extension.sendMessage({ loaded: document.getElementById('word-count-porganized')!==null });'''
    }
	
	# Listen for loading response
	chrome.extension.onMessage.addListener (req, sender, sendResponse) =>
		responses += 1
		text = e.selectionText
		words = tokenizer text
		msg  = "#{ if text.length is 0 then 'No' else words } word#{if words isnt 1 then 's' else ''} selected"

		if responses isnt 1
			return
		if req.loaded is false
			chrome.tabs.executeScript t.id, {file:"dialog.js"}, () =>
				chrome.tabs.sendMessage t.id, {message: msg}
			return
		else
			chrome.tabs.sendMessage t.id, {message: msg}
			return
	return
                            

chrome.contextMenus.create
	"title": "Count words"
	"contexts": ["selection"]
	"onclick": getWordCount
