// A generic onclick callback function.
function getWordCount(e) {
	var selectionText = e.selectionText,
	words = simpleTokenizer(selectionText);
	if (selectionText.length === 0) {
		alert("No words selected");
		return;
	} else {
		alert(words + " word"+(words>1 ? "s" : "") +" selected");
	};
}

function simpleTokenizer(text) {
	return text.split(" ").length;
}

chrome.contextMenus.create({	
	"title": "Word Count", 
	"contexts":["selection"],
    "onclick": getWordCount
});