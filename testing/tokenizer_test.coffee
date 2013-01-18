tokenizers = require('../src/tokenizers.js')
passages = [
	{
		text: 'This is a test.',
		count:4,
	},
	{
		text: 'Trying to count multiple      spaces.',
		count:5,
	},
	{
		text: 'What about unfinished sentences',
		count: 4,
	},
	{
		text: "Dr.Robert doesn't believe punctuation in words works.",
		count: 7
	},
	{
		text:"Jun 2, 2011 – Sum a list of numbers. Javascript (and CoffeeScript by extension) also has native map and reduce functions: [1..1000].reduce (t, s) -> t + s ...",
		count: 27
	}
]

test = (tokenizer) ->
	errors = 0
	error_margin = 0
	for passage in passages
		counted = tokenizer passage.text
		console.log "Returned #{counted} \tActual #{passage.count}"
		errors += if counted == passage.count then 0 else 1
		error_margin += Math.abs counted-passage.count
	console.log "Total Errors: #{errors} (error margin of #{error_margin})"


console.log("Testing simpleTokenizer")
test tokenizers.simpleTokenizer
console.log("Testing regexTokenizer")
test tokenizers.regexTokenizer
