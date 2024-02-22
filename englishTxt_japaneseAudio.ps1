#englishTxt_japaneseAudio.ps1 
#APEX LEGENDS Japanese dub but English text

#apex file location:
$apexLegendLocation = "C:\Program Files (x86)\Steam\steamapps\common\Apex Legends\audio\ship"
Write-Host "---------------------------------------------------------------"
Write-Host "||    Apex Legends japanese audio but english text script    ||"
Write-Host "---------------------------------------------------------------"

#instruction
Write-Host "BEFORE SELECTING AN OPTION. "
Write-Host "On Apex Legends properties > General > Language, select Japanese and wait for the download to finish and then proceed to Option 1.`n"

Write-Host "Option 1: Rename files [R/r]"
Write-Host "Option 2: Rename files back to normal [N/n]"
Write-Host "Option 3: Exit [X/x]"
Write-Host "---------------------------------------------------------------------------------------------------------------"
$userInput = Read-Host "Enter your choice"

switch ($userInput) {
    'R' {
        #find 2 files 
        Write-Host "Searching files..."
        $files = Get-ChildItem -Path $apexLegendLocation -Recurse -File -Filter "general_japanese*"

        if ($files.Count -gt 0) {
            Write-Host "Found $($files.Count) files with the name 'general_japanese'"

            # Write-Host "Creating backup..."
                # $files | ForEach-Object {
                #     $backupPath = Join-Path -Path $backupLocation -ChildPath $_.Name
                #     Copy-Item -Path $_.FullName -Destination $backupPath
                # }
            #rename both files
                #general_japanese.mstr
                #general_japanese_patch_1
            Write-Host "Renaming files..."
            $files | ForEach-Object {
                $newName = "_$($_.Name)"
                Rename-Item -Path $_.FullName -NewName $newName
            }
            Write-Host "Rename files success"
            #list renamed files
                # Write-Host "Renamed files: "
                # $files | ForEach-Object {
                #     Write-Host $_.FullName  
                # }

            #instruction
            Write-Host "TODO Next: On Apex Legends properties > General > Language, select English"
            Write-Host "run the script again and this time choose Option 2.`n"

        } else {
            Write-Host "No files found with the name 'general_japanese'`n"
        }
    }
    'N' {

        $files = Get-ChildItem -Path $apexLegendLocation -Recurse -File -Filter "_general_japanese*"
        
        Write-Host "Renaming files...removing the '_' to the beginning of the file name`n"
        $files | ForEach-Object {
            $newName = $_.Name -replace '^_'
            Rename-Item -Path $_.FullName -NewName $newName
        }
        Write-Host "Rename success!`n"
        Write-Host "TODO Next: On Apex Legends properties > General > Launch options"
        Write-Host "enter this text '+miles_language japanese' "
        Write-Host "And you are good to go!"
    }
    'X' {
        Write-Host "Exiting..."
        Exit
    }
    default {
        Write-Host "Invalid option"
    }
}

#
#
#end of code