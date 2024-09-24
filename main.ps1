Import-Module ".\utils.psm1"-Force

Write-Host "`n`n>>> Welcome to the MMORPG One Button Rotation <<<`n`n"

# Check if rotations folder exists and make one if it doesn't
$rotations_path = ".\rotations"
if (-not (Test-Path -Path $rotations_path)) {
    New-Item -Path $rotations_path -ItemType Directory | Out-Null
}

$saved_rotations = Get-ChildItem -Path $rotations_path -Filter *.txt 

if ($saved_rotations.Count -gt 0) { # Check if user already has saved rotations
    
    GetRotations -saved_rotations $saved_rotations # Display saved rotations

    while($true){
        # Ask the user to select a file by index
        $selection = Read-Host "`nEnter the number of the rotation you want to load, or press 0 to create a new rotation"

        # Convert the user input to an integer and check if it's valid
        if ($selection -ge 1 -and $selection -le $saved_rotations.Count) {
            $rotation_key, $rotation = LoadRotation -saved_rotations $saved_rotations -selection $($selection-1)
            break
        }
        elseif ($selection -eq 0){
            $rotation_key, $rotation = CreateNewRotation -rotations_path $rotations_path
            break
        }
        else {
            Write-Host "Invalid selection. Please try again.`n"
            GetRotations -saved_rotations $saved_rotations # Display saved rotations
        }
    }

}
else {
    Write-Host "No saved rotations found. Creating new rotation."
    $rotation_key, $rotation = CreateNewRotation -rotations_path $rotations_path
}

# Start rotation
Write-Host "Starting rotation... Press 'Ctrl + ESC' to terminate."
Start-Process ".\rotation.ahk" -ArgumentList "$rotation_key", "$rotation"