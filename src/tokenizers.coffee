simpleTokenizer = (text) -> text.split(" ").length

regexTokenizer = (text) -> 
	re = ///
	[\w\.]+? 		#At least one alphanumeric character
	([\.\']\w+?)?		#Optionally include a . or ', followed by more word chars
	(
		[\s\.',\):\]]+	#After word, match any number of spaces or various puctuation
		|		#or..
		$		#Match the end of the string
	)
	///gi
	
	text.match(re).length

#For Node.JS Unit Tests
#exports.simpleTokenizer = simpleTokenizer
#exports.regexTokenizer = regexTokenizer
