function GetRotations {
    param (
        [array]$saved_rotations
    )
    
    Write-Host "My saved rotations:`n"
    for ($i = 0; $i -lt $saved_rotations.Count; $i++) {
        Write-Host "$($i+1) - $($saved_rotations[$i].BaseName)" # Display rotations with an index number
    }
}


function CreateNewRotation {
    param (
        [string]$rotations_path
    )

    while ($true) {
        # Set rotation key and steps
        $rotation_key = Read-Host "Enter rotation key"
        $rotationInput = Read-Host "Enter rotation steps separated by space"
        $rotation = $rotationInput.Trim() -split ' '

        # Verify rotation key and steps
        Write-Host "`nRotation key set as: $rotation_key"
        Write-Host "Rotation Steps:"
        foreach ($step in $rotation) {
            Write-Host "- $step"
        }

        $save_new_rotation = Read-Host "`nSave this rotation? Type rotation name or press Enter to use during this session only. Press . to start over"
        $save_new_rotation = $save_new_rotation.Trim()

        if  ($save_new_rotation -eq ".") {
            Write-Host "Rotation not saved. Starting over`n"
        }
        elseif ($save_new_rotation -eq "") {
            Write-Host "Rotation not saved, but active for this session only.`n"
            break
        }
        else {
            Set-Content -Path "$rotations_path\$save_new_rotation.txt" -Value "$rotation_key,$rotation"
            Write-Host "Rotation saved as: $save_new_rotation`n"
            break
        }
    }

    return $rotation_key, $rotation
}


function LoadRotation {
    param (
        [array]$saved_rotations,
        [int]$selection
    )

    # Load the selected rotation
    $selectedRotation = $saved_rotations[$selection].FullName
    $rotationContent = Get-Content -Path $selectedRotation
    Write-Host "`n`----------------------------------`n`nLoaded Rotation: $($saved_rotations[$selection].BaseName)`n"
    $rotation = $rotationContent -split ','
    $rotation_key = $rotation[0]
    $rotation = $rotation[1]
    Write-Host "Rotation Hotkey: $rotation_key"
    Write-Host "Rotation Steps:"
    foreach ($step in $rotation -split ' ') {
        Write-Host "- $step"
    }
    Write-Host "`n----------------------------------`n"
    return $rotation_key, $rotation
}