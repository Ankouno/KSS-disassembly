; Bank 00/01
; Determine how large the in-game status bar is on the screen.
; This height is measured in scanlines.
; Default statusbar start is at scanline A8 (the value set at $01E994 for IRQ)

!BottomLevelFade_Size   = $0C
!StatusBar_Start        = $A8


; Bank 15
; Below are variables that will modify the X and Y positions of each corkboard panel
; The coordinates indicate the top-left corner of the subgame panel
;  (with 0,0 being the top-left of the entire screen and 31,27 being the bottom-right)
;  Height/Width is total number of pixels that span the sprite (so the minimum is 1)

!SpringBreeze_X_Location    #= 3
!SpringBreeze_Y_Location    #= 2
!SpringBreeze_Height        #= 8
!SpringBreeze_Width         #= 9

!DynaBlade_X_Location       #= 2
!DynaBlade_Y_Location       #= 10
!DynaBlade_Height           #= 10
!DynaBlade_Width            #= 8

!Gourmet_X_Location         #= 11
!Gourmet_Y_Location         #= 1
!Gourmet_Height             #= 7
!Gourmet_Width              #= 11

!GCO_X_Location             #= 9
!GCO_Y_Location             #= 9
!GCO_Height                 #= 9
!GCO_Width                  #= 9

!RoMK_X_Location            #= 16
!RoMK_Y_Location            #= 8
!RoMK_Height                #= 9
!RoMK_Width                 #= 10

!MWW_X_Location             #= 22
!MWW_Y_Location             #= 2
!MWW_Height                 #= 10
!MWW_Width                  #= 8

!Arena_X_Location           #= 24
!Arena_Y_Location           #= 16
!Arena_Height               #= 7
!Arena_Width                #= 7

!SoundTest_X_Location       #= 14
!SoundTest_Y_Location       #= 20
!SoundTest_Height           #= 4
!SoundTest_Width            #= 4
