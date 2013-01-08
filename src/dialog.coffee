###
Non-Modal Dialog

This is a simple non-modal dialog. It is injected as a content script and
listens for sendMessage from elsewhere in the script.
###

dialog = (text) ->
	div = document.createElement 'div'
	div.style.width = "200px"
	div.style.margin = "-50px -105px 0 -105px"
	div.style.position = "fixed"
	div.style.zIndex = 10000
	div.style.background = "rgba(10,10,10,0.6)"
	div.style.left = "50%"
	div.style.top = "50%"
	div.style.textAlign = "center"
	div.style.padding = "30px 20px"
	div.style.borderRadius = "10px"
	div.style.color = "white"
	div.style.fontFamily = "sans-serif"
	div.style.fontSize = "13pt"
	div.innerText = text
	document.body.appendChild div
	
	x = document.createElement 'div'
	x.innerText = 'close'
	x.style.position = "absolute"
	x.style.right = "10px"
	x.style.fontSize = "10pt"
	x.style.top = "10px"
	x.style.cursor = "pointer"
	div.appendChild x
	
	x.onclick = () =>
		 x.parentNode.parentNode.removeChild x.parentNode

# When a message is send, show dialog
chrome.extension.onMessage.addListener (request, sender, sendResponse) =>
	dialog request.message
	
# Leave a little DOM marker to identify that we've been loaded
if document.getElementById("word-count-porganized") is null
	mark = document.createElement("div")
	mark.id = "word-count-porganized"
	document.body.appendChild mark