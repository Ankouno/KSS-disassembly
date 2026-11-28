; Slowly bringing all of these labels over to the other file, which will be the main one going forward

; Save Data
SaveFile_Number        = $7F00     ; 00 for File 1, 01 for File 2, 02 for File 3
SaveFile_Offset        = $7AE3     ; 00 for File 1, 4F for File 2, 9E for File 3
SaveFile_Subgame       = $7F06     ; Subgame to be displayed on the file select screen
SaveFile_GamesFinished = $7F0A     ; The subgames that have been completed in the save file

SB_GCO_Boss_Status     = $7AE5

Kirby_Inv_Flash    = $75B1

Helper_Inv_Flash   = $75B3
Kirby_Speed        = $74C8
Helper_Speed       = $74CA

; Item Tracking 
RoMK_Cutscenes_Done    = $771D     ; Persists between rooms, 3 bytes large

; Timers
;Gourmet Race Timer (unsure)
Timer_Minutes      = $7A2D
Timer_Seconds      = $7A2C
Timer_Milliseconds = $7A2B

; Coordinates and Positions
Kirby_X_Pos            = $6988
Kirby_Y_Pos            = $6A02

Intangible_to_items    = $744B

;Milky Way Wishes 
MWW_Current_Planet         = $7A6D
MWW_Abilities_Saved        = $7B1B
MWW_Ability_Quantity       = $7B1E



Kirby_X_Respawn        = $330C
Kirby_Y_Respawn        = $3310

Room_Size_X            = $3366
Room_Bound_Offset_X    = $3364
Room_Size_Y            = $3362
Room_Bound_Offset_Y    = $3360

Kirby_Invincible   = $35F1
Helper_Invincible  = $35F3
Kirby_Inv_Time     = $35F5
Helper_Inv_Time    = $35F7

MWW_Last_Ability_Selected  = $36BC