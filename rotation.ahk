#Requires AutoHotkey v2.0

; Parse input
rotation_key := A_Args[1]
RemovedValue := A_Args.RemoveAt(1)
rotation := A_Args

index := 1

; Start rotation
Hotkey rotation_key, run_rotation
run_rotation(key)
{
	global rotation
	global index
    
    Send rotation.Get(index)
    index := MAX(1, MOD((index + 1) , rotation.Length + 1))
return
}

; Exit script
^esc::ExitApp
