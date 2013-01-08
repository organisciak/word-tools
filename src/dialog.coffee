dialog = (text) ->
	div = document.createElement 'div'
	div.style.width = "200px"
	div.style.position = "fixed"
	div.style.zIndex = 10000
	div.style.background = "rgba(10,10,10,0.6)"
	div.style.left = "50%"
	div.style.top = "50%"
	div.style.textAlign = "center"
	div.style.padding = "10px"
	div.style.borderRadius = "10px"
	div.style.color = "white"
	div.style.fontFamily = "sans-serif"
	div.innerText = text
	document.body.appendChild div