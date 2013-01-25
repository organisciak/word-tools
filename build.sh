echo "Compiling coffeescript..."
coffee --join extension/count.js --compile src/tokenizers.coffee src/count.coffee
coffee --compile --output extension/ src/dialog.coffee

echo "Cleaning filesystem..."
rm -f extension/.DS_Store
rm -f extension/*~

echo "Compressing extension to word.zip..."
zip -r word extension/*

echo "Chrome extension compiled successfully to word.zip. Did you remember to update the version number in manifest.json?"
exit 0

