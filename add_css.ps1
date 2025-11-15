# Windows PowerShell version of add_css.sh
# Copies build.ts to index.ts and appends CSS embedding code


# Copy build.ts to index.ts
Copy-Item -Path "src/build.ts" -Destination "src/index.ts" -Force

# Read CSS, convert to single line, escape backticks and single quotes
$cssContent = Get-Content "src/themes/blueprint.css" -Raw
$cssContentSingleLine = $cssContent -replace "`r?`n", " " -replace "'", "\'" -replace "`"", "\`""

# Append the CSS embedding function
Add-Content -Path "src/index.ts" -Value "function initCSSTheme() {"
Add-Content -Path "src/index.ts" -Value "    css['blueprint'] = \"$cssContentSingleLine\";"
Add-Content -Path "src/index.ts" -Value "}"
