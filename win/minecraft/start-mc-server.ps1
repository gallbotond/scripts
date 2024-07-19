# Get the current folder
$currentFolder = Get-Location

# Specify the folder you want to check against
$specificFolder = "C:\Users\Administrator\server\"

# Check if the current folder is the specific folder
if ($currentFolder.Path -ne $specificFolder) {
    # If the current folder is not the specific folder, change to the specific folder
    Set-Location -Path $specificFolder
}

java -Xmx4G -Xms4G -jar .\paper-1.20.4-450.jar --nogui

