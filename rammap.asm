; --== Work RAM ==--

ORG $000000

; === $7E0000 ===
; 2 bytes
; Fixed at 0x0000
; Used to identify code as running on the SNES by reading via $0000
; (The SA-1 would return 0xFFFF instead)
IdentifySNES: skip 2

; Unidentified
skip $7E000E-$7E0002

; === $7E000E ===
; 24 bytes
; SA-1 command wait loop, copied from $00818C
; When jumped to, waits until both a message is received from the chip (via $2130) and a negative value is stored at $300F,
;  at which point it jumps to the routine pointed to by $300C (24-bit).
; This routine should be RTL-ended; after completing execution, it will return back to the start of this routine.
RAM_CommandWaitLoop: skip 24

; === $7E0026 ===
; 14 bytes
; SA-1 response wait loop, copied from $0081A3
; When jumped to, waits until both a message is received from the chip (via $2300) and a positive 16-bit value is stored to $300A,
;  at which point it simply returns back to the caller.
; (Note: $300A is not automatically initialized) 
RAM_ResponseWaitLoop: skip 14

; Unidentified
skip 2

; === $7E0036 ===
; 2 bytes
; Timer tied to new inputs on controller 1
; If the input this frame differs from the previous, this address gets set to 0x14
; Else, it decrements by 1 per frame; if it reaches 0, it gets reset to 0x6.
; If this address gets reset, then $32CC will be set to the input on that frame.
; Else, $32CC will be clear.
P1_ResetRepeat: skip 2

; === $7E0038 ===
; 2 bytes
; Timer tied to new inputs on controller 2
; If the input this frame differs from the previous, this address gets set to 0x14
; Else, it decrements by 1 per frame; if it reaches 0, it gets reset to 0x6.
; If this address gets reset, then $32CE will be set to the input on that frame.
; Else, $32CC will be clear.
P2_ResetRepeat: skip 2

; Unidentified
skip 4

; === $7E003E ===
; 12 bytes
; Table used as part of an indirect HDMA to the screen brightness register ($2100), starting at scanline 0x9B.
; Specifically, it's used for the "fade to black" effect at the bottom of the level.
Table_BottomLevelFade: skip 12

; Unidentified
skip 25

; === $7E0063 ===
; 2 bytes 
; VWF text character width, in pixels.
; Setting this to 0xFFFF will have the characters use a dynamic width rather than monospace.
VWF_Width: skip 2

; === $7E0065 ===
; 1 byte
; VWF text colors for the current tile. Format: ----bbff
; ff - Foreground color
; bb - Background color
VWF_Color: skip 1

; Unidentified
skip 5

; === $7E006B ===
; 1 byte
; Flag for the VWF text to show the blinking cursor in the bottom right of the window.
VWF_ShowCursor: skip 1

; Unidentified
skip 1

; === $7E006D ===
; 1 byte
; Flag for the VWF text to include the secondary color of each character (e.g. the "shadow")
; 00 = no secondary color
; 01 = include secondary color
VWF_SecondaryColor: skip 1

; Unidentified
skip 21

; === $7E0083 ===
; 2 bytes
; Current index of the VWF text pointer stack at $0085
VWF_CurrentIndex: skip 2

; === $7E0085 ===
; 12 bytes
; Subtext pointer stack, with the current position at $0083.
; Whenever subtext is jumped to (with VWF command $0E), a 24-bit return address is written here.
; When that message ends (with VWF command $00), the last 24-bit value in the stack is pulled and the text pointer is set to there.
; Exact size of this table may be smaller than indicated currently.
VWF_Table: skip 12

; === $7E0091 ===
; 3 bytes
; 24-bit pointer to VWF text data. Although this is a 24-bit pointer, the bank byte is always 0xCB (bank 16).
VWF_DataPointer: skip 3

; Unused? Should be verified.
skip 1

; === $7E0095 ===
; 3 bytes
; 24-bit pointer to music data. 
; This pointer increments through the music data as it is being transferred to the SPC.
; Mostly used in the LoadToSPC routine at $00D104.
SPC_ReadAddress: skip 3

; $0099 : similar as above but with the SFX transfer?

; Unidentified
skip $A7-$98

; === $7E00A7 ===
; 2 bytes
; Amount of bytes to transfer when loading a music track.
; As the LoadToSPC subroutine steps through the music data, this value is decreased.
SPC_BytesLeft: skip 2

; Unidentified
skip $AA-$A9

; === $7E00AA ===
; 1 byte
; Currently loaded song. Valid values are 01-42.
CurrentLoadedMusic: skip 1 

; === $7E00AB ===
; 1 byte
; Currently loaded sample bank for the music. Valid values are 01-09.
CurrentLoadedSampleBank: skip 1

; === $7E00AC ===
; 1 byte
; Currently loaded SFXs. Valid values are 01-22.
CurrentLoadedSFXs: skip 1

; Unidentified
skip $B1-$AD

; === $7E00B1 ===
; 2 bytes
; If set to anything greater than zero, updates the status bar in VRAM
;  to match the WRAM mirror located at $7E1617
UpdateStatusBar: skip 2

; === $7E00B3 ===
; 2 bytes
; Which status bar menu is currently active. Values typically are:
; 00 - No partner, no boss 
; 02 - Has partner, no boss
; 04 - No partner, has boss 
; 06 - Has partner, has boss 
; 08 - Textbox (for Revenge of Meta Knight)
CurrentStatusBar: skip 2

; Unidentified
skip $B9-$B5

; === $7E00B9 ===
; 2 bytes
; Lives count to display on HUD.
; This is always updated to match the current lives number saved in $737A.
HUD_Lives: skip 2

; === $7E00BB ===
; 2 bytes
; Kirby HP count to display on HUD
; This isn't directly equal to the actual HP value in $737C as this is the value to represent in the HP meter.
HUD_KirbyHP: skip 2

; === $7E00BD ===
; 2 bytes
; Helper HP count to display on HUD
; This isn't directly equal to the actual HP value in $737E as this is the value to represent in the HP meter.
HUD_HelperHP: skip 2

; Unidentified
skip $CF-$BF

; === $7E00CF ===
; 2 bytes
; Timer for adjusting each unit in the HP bar
HUD_HealthUnitTimer: skip 2

; Unidentified
skip $100-$D1

; === $7E0100 ===
; 1024 bytes
; Circular VRAM upload buffer, emptied every frame (except during force-blank).
; The index to the start of the buffer is in $3015, while the end is in $3017.

; Each entry has 8 bytes, but depending on the first two, there are two different formats. 
; If the first two bytes are 0000, then it is a single entry write.
; In this case, bytes 2/3 are used as the destination VRAM address and 4/5 as values to write (6/7 are unused).
; Otherwise, all the bytes are used as settings for a DMA:
;  0 - Index (+3) to the table at $00869D for controlling the DMA.
;  1 - 16-bit size
;  2 - 24-bit source
;  6 - 16-bit destination VRAM address

; After writing either, update $3017. While writing the data, if it's about to overflow past $0500, just loop back to $0100.
VRAM_Upload_Buffer: skip 1024

; === $7E0500 ===
; 200 bytes
; Standard palette. All colors are stored in sequence and uploaded to CGRAM during NMI, unless one of the alternate palettes is being used, indicated by $23DC.
; Even if one of the alternative palettes is being used, the first 0x4 FG/BG colors ($0500-$0507) and the first 0x30 sprite colors ($0600-$065F) are still pulled from this table.
Standard_Palette: skip 200

; Unidentified
skip 320

; === $7E0708 ===
; 248 bytes
; Alternative FG/BG palette 0. This is written to colors $04-$7F.
Alternative_FGBG_Palette: skip 248

; Unidentified
skip 96

; === $7E0860 ===
; 160 bytes
; Alternative sprite palette 0. This is written to colors $B0-$FF.
Alternative_Sprite_Palette: skip 160

; === $7E0900 ===
; 160 bytes
; VRAM DMA queue; unlike $7E0100, this one is only emptied on non-lag frames; i.e. a true "end of frame".
; To use, first get the next index from $301F, then write 8 bytes for the DMA:
;  0 - Unused? (Always FF?)
;  1 - 16-bit size
;  3 - 24-bit source
;  6 - 16-bit destination VRAM address
; Finally, update $301F by adding 8 to it.
; Size of this table is uncertain; will need to adjust later.
VRAM_DMA_Queue: skip 168

; === $7E09A8 ===
; 512 bytes
; The list of objects that exist in the current room. The end of the list is denoted by $FFFF.
; Each object in the list constists of two bytes:
;  The low byte is the object type
;  The high byte is the object parameters, if it has any
ObjectSpawnList_Type: skip 512

; === $7E0BA8 ===
; 512 bytes
; The list of X position spawns which correlates to the object list.
ObjectSpawnList_XPos: skip 512

; === $7E0DA8 ===
; 512 bytes
; The list of Y position spawns which correlates to the object list.
ObjectSpawnList_YPos: skip 512

; Unidentified
skip $7E14C7-$7E0FA8

; $001338,X read from at $00D9BB

; === $7E14C7 ===
; 8 bytes
; Keeps track of collectables that won't respawn unless the console is reset or the subgame is left.
; Primarily used to keep track of lives collected
Permanent_Collectables: skip 8

; === $7E14CF ===
; 8 bytes
; Keeps track of collectables that will not respawn until leaving the level. 
; Primarily usedd to keep track of Maxim Tomatoes and Invincibility Candy collected
Level_Collectables: skip 8

; === $7E14D7 ===
; 8 bytes
; Keeps track of food items collected.
; Item statuses are cleared on room reload, so these items will always spawn when entering a room.
Room_Collectables: skip 8

; Unidentified
skip 64

; === $7E151F ===
; 248 bytes
; Palette for the status bar, written to colors $04-$7F (other colors are maintained for the level's actual palette).
; Due to an error, the 4 bytes after this table also end up written to colors $80 and $81.
StatusBar_Palette: skip 248

; === $7E1617 ===
; 224 bytes
; Tile numbers for the entire Layer 2 tilemap of the status bar.
StatusBar_TileMap: skip 224

; === $7E16F7 ===
; 224 bytes
; YXPCCCTT for the entire Layer 2 tilemap of the status bar.
StatusBar_YXPCCCTT: skip 224

; Unidentified
skip 1833

; === $7E1F00 ===
; 256 bytes
; SNES program stack. Allocated space may be larger or smaller than currently specified; ends at $1FFF.
SNES_Stack: skip 256

; === $7E2000 ===
; 24319 bytes
; Decompressed data buffer. Data gets decompressed to here as necessary for usage by DMAs.
; The index for where to write the next DMA can be found at $3012, which gets reset at the end of every frame.
DMA_Buffer: skip 24319


; 7EB000 cleared to all FF at $018E76?
; 7EB200 something written to it here: $01C126
; 7EB400 giant list of DMAs for animating background tiles:
; ?? ?? ?? (1 byte, Frame Count to Display DMA) (DMA TABLE FORMAT) (DMA DATA)
;      it is a large list of DMA tables with some other attributes
;      7EB402 is written to $7E0FC8 sometimes (at $01A233)
;      7EB404 is the start of a DMA table
;      7EB407 is fixed to 7EB40D? so data is right after the DMA table
;      DMAs are written to 2CA0 in VRAM
; The rest of this bank seems to be attributed to the DMA table list


ORG $7F0000

; === $7F0000 ===
; 8192 bytes
; The entire Layer 1 Map24 tilemap for the level, two bytes per tile.
; Tiles appear to be laid on in full strips from the left edge of the level to the right edge. 
; As such, the number of tiles per row varies depending on the size of the level.
; DEBUG: For the VRAM viewer, the first 0x1000 bytes of this are used as the raw tilemap to be uploaded into VRAM. 
Level_Tilemap: skip 8192

; === $7F2000 ===
; 4096 bytes
; Table of all tiles in the level that have been changed, i.e. bomb block broke tiles, etc.
; Each tile is one byte
Level_Tilemap_TilesChanged: skip 4096

; === $7F3000 ===
; 1440 bytes
; Table for each meta tile that denotes the first row and first column that each meta tile is using.
Level_Tile_Graphics_1: skip 1440

; === $7F35A0 ===
; 1440 bytes
; Table for each meta tile that denotes the first row and second column that each meta tile is using.
Level_Tile_Graphics_2: skip 1440

; === $7F3B40 ===
; 1440 bytes
; Table for each meta tile that denotes the first row and third column that each meta tile is using.
Level_Tile_Graphics_3: skip 1440

; === $7F40E0 ===
; 1440 bytes
; Table for each meta tile that denotes the second row and first column that each meta tile is using.
Level_Tile_Graphics_4: skip 1440

; === $7F4680 ===
; 1440 bytes
; Table for each meta tile that denotes the second row and second column that each meta tile is using.
Level_Tile_Graphics_5: skip 1440

; === $7F4C20 ===
; 1440 bytes
; Table for each meta tile that denotes the second row and third column that each meta tile is using.
Level_Tile_Graphics_6: skip 1440

; === $7F51C0 ===
; 1440 bytes
; Table for each meta tile that denotes the third row and first column that each meta tile is using.
Level_Tile_Graphics_7: skip 1440

; === $7F5760 ===
; 1440 bytes
; Table for each meta tile that denotes the third row and second column that each meta tile is using.
Level_Tile_Graphics_8: skip 1440

; === $7F5D00 ===
; 1440 bytes
; Table for each meta tile that denotes the third row and third column that each meta tile is using.
Level_Tile_Graphics_9: skip 1440

; === $7F62A0 ===
; 720 bytes
; Table for the attributes of each tile in the current room.
Level_Tile_Attributes: skip 720

; === $7F6570 ===
; 1024 bytes
; VWF text buffer, where each line of character data gets drawn into before being uploaded to VRAM.
; Consists of a 32x2 strip of 8x8 tiles.
VWF_Buffer: skip 1024

; === $7F6970 ===
; 131008 bytes?
; Some sort of table/buffer used at routine at $01E7E7.
; Unclear on what it actually represents.
; Size is probably not accurate, but it is the maximum allowable index given by the game's code.
;UnknownForRoutine01E7E7: skip 131008

; === $7F8800 ===
; 42303 bytes?
; Used as temp storage for loading helper graphics.
; However, this memory is also used initially to load other things before loading the helper graphics (could be the HUD or etc)


; --== SA-1 RAM ==--

ORG $003000

; === $003000 ===
; 2 bytes
; Fixed at 0xFFFF
; Used to identify code running on the SA-1 chip, by reading via $0000
; (The SNES would return 0x0000 instead)
IdentifySA1: skip 2

; Unidentified
skip 6

; === $003008 ===
; 3 bytes
; Used as a 24-bit pointer by the SNES to give the SA-1 chip a routine to execute.
; Controlled by $300A.
Execute_on_SNES: skip 3

; === $00300B ===
; 1 byte
; Flag to tell the SNES to run the pointer written in $3008. 
; If negative, the SA-1 will jump to the routine specified there (assuming it is not already busy).
; Set to 0x00 when the SA-1 finishes execution.
SNES_TriggerExecution: skip 1

; === $00300C ===
; 3 bytes
; Used as a 24-bit pointer by the SA-1 chip to give the SNES a routine to execute.
; Controlled by $300F.
Execute_on_SA1: skip 3

; === $00300F ===
; 1 byte
; Flag to tell the SA-1 to run the pointer written in $300C. 
; If negative, the SNES will jump to the routine specified there (assuming it is not already busy).
; Set to 0x00 when the SNES finishes execution.
SA1_TriggerExecution: skip 1

; === $003010 ===
; 1 byte
; Flag to wait for NMI
; Cleared by the SA-1 chip at the end of the frame, then set to 1 by the SNES after it finishes NMI.
Wait_for_NMI: skip 1

; Unidentified
skip 1 

; === $003012 ===
; 3 bytes
; 24-bit pointer for where to next write decompressed data in $7E2000.
DecompressedDataDest: skip 3

; === $003015 ===
; 2 bytes
; Starting index to the circular VRAM upload buffer at $7E0100.
VRAM_Buffer_StartIndex: skip 2

; === $003017 ===
; 2 bytes
; Ending index to the circular VRAM upload buffer at $7E0100.
VRAM_Buffer_EndIndex: skip 2

; === $003019 ===
; 2 bytes
; Current total NMI execution load.
; If this value exceeds the amount at $301B, a lag frame should be injected to empty pending DMAs.
Current_Total_NMI_Load: skip 2

; === $00301B ===
; 2 bytes
; Maximum NMI execution load, always static at 0x11C8.
; If $3019 is about to pass over this amount, a lag frame should be injected so that NMI doesn't overflow.
Max_NMI_Load: skip 2

; === $00301D ===
; 2 bytes
; Current NMI execution load for DMAs queued to $0900.
; After an injected lag frame, $3019 should be set to this value, as the $0900 buffer will not be emptied until a true end of frame.
Current_NMI_Load: skip 2

; === $00301F ===
; 1 byte
; Current length of the VRAM DMA queue at $0900.
VRAM_DMA_Queue_Length: skip 1

; Unidentified
skip $3037-$3020

; === $003037 ===
; 2 bytes
; Mirror of address $3350, which is the current camera X position.
; Used for calculating tile positions on screen.
CameraX_TileMirror: skip 2

; Unidentified
skip $303D-$3039

; === $00303D ===
; 2 bytes
; Mirror of address $3354, which is the current camera Y position.
; Used for calculating tile positions on screen.
CameraY_TileMirror: skip 2

; Unidentified
skip $304F-$303F

; === $00304F ===
; 2 bytes
; Layer 1 X position. Mirror of SNES register $210D.
Layer_1_X: skip 2

; === $003051 ===
; 2 bytes
; Layer 2 X position. Mirror of SNES register $210F.
Layer_2_X: skip 2

; === $003053 ===
; 2 bytes
; Layer 3 X position. Mirror of SNES register $2111.
Layer_3_X: skip 2

; === $003055 ===
; 2 bytes
; Layer 1 Y position. Mirror of SNES register $210E.
Layer_1_Y: skip 2

; === $003057 ===
; 2 bytes
; Layer 2 Y position. Mirror of SNES register $2110.
Layer_2_Y: skip 2

; === $003059 ===
; 2 bytes
; Layer 3 Y position. Mirror of SNES register $2112.
Layer_3_Y: skip 2

; Unidentified
skip 4

; === $00305F ===
; 1 byte
; Handles screen brightness and force blank. Format: f---bbbb.
; f = force blank flag
; bbbb = brightness setting
; Mirror of SNES register $2100
Screen_Brightness: skip 1

; === $003060 ===
; 1 byte
; Sprite tile size and graphical address in VRAM. Format: sssnnbbb
; sss = sprite tile sizes
; nn = distance between page 0 and page 1 (>>12)
; bbb = VRAM address pf page 0 (>>14)
; Mirror of SNES register $2101
Sprite_Tile_Size: skip 1

; === $003061 ===
; 1 byte
; Background mode. Format: 4321pmmm
; 4321 = Layer 1/2/3/4 uses 8x8 when clear, 16x16 tiles when set
; p = Layer 3 absolute priority (only in background mode 1)
; mmm = Background mode (0-7)
; Mirror of SNES register $2105
Background_Mode: skip 1

; === $003062 ===
; 1 byte
; Current mosaic pixel size. Mirror of SNES register $2106.
Mosaic_Pixel_Size: skip 1

; Tilemap VRAM address and size format: aaaaaayx
; aaaaaa = tilemap VRAM address (>>10)
; y = 2x height
; x = 2x width 

; === $003063 ===
; 1 byte
; Layer 1 tilemap VRAM address and size
; Mirror of SNES register $2107
Layer_1_TilemapVramAddrSize: skip 1

; === $003064 ===
; 1 byte
; Layer 2 tilemap VRAM address and size
; Mirror of SNES register $2108
Layer_2_TilemapVramAddrSize: skip 1

; === $003065 ===
; 1 byte
; Layer 3 tilemap VRAM address and size
; Mirror of SNES register $2109
Layer_3_TilemapVramAddrSize: skip 1

; === $003066 ===
; 1 byte
; Layer 4 tilemap VRAM address and size
; Mirror of SNES register $210A
Layer_4_TilemapVramAddrSize: skip 1

; === $003067 ===
; 1 byte 
; Base VRAM address for Layer 1/2 GFX files. Format: bbbbaaaa
; aaaa = address for Layer 1 (>>13)
; bbbb = address for Layer 2 (>>13)
; Mirror of SNES register $210B
Layer12_Base_VramAddr: skip 1

; === $003068 ===
; 1 byte 
; Base VRAM address for Layer 3/4 GFX files. Format: bbbbaaaa
; aaaa = address for Layer 3 (>>13)
; bbbb = address for Layer 4 (>>13)
; Mirror of SNES register $210C
Layer34_Base_VramAddr: skip 1

; === $003069 ===
; 1 byte
; Layer 1/2 window mask settings. Format: bbbbaaaa
; aaaa = Layer 1 window settings 
; bbbb = Layer 2 window settings
; Mirror of SNES register $2123
Layer12_WindowMask: skip 1 

; === $00306A ===
; 1 byte
; Layer 3/4 window mask settings. Format: bbbbaaaa
; aaaa = Layer 3 window settings 
; bbbb = Layer 4 window settings
; Mirror of SNES register $2124
Layer34_WindowMask: skip 1 

; === $00306B ===
; 1 byte
; Object and color window mask settings. Format: ffffeeee
; ffff = color window settings
; eeee = object window settings
; Mirror of SNES register $2125
Object_Color_WindowMask: skip 1

; === $00306C ===
; 1 byte
; Window 1 left position.
; Mirror of SNES register $2126
Window1_LeftPos: skip 1

; === $00306D ===
; 1 byte
; Window 1 right position.
; Mirror of SNES register $2127
Window1_RightPos: skip 1

; === $00306E ===
; 1 byte
; Window 2 left position.
; Mirror of SNES register $2128
Window2_LeftPos: skip 1

; === $00306F ===
; 1 byte
; Window 2 right position.
; Mirror of SNES register $2129
Window2_RightPos: skip 1

; === $003070 ===
; 1 byte
; Window mask logic for Layer 1/2/3/4. Format: 44332211
; Each layer has 4 possible values:
;  00 = OR
;  01 = AND
;  10 = XOR
;  11 = XNOR
; Mirror of SNES register $212A
Layer_WindowMaskLogic: skip 1

; === $003071 ===
; 1 byte
; Window mask logic for sprites/color. Format: ----ccoo
; cc = color ; oo = sprites (objects)
; Each layer has 4 possible values:
;  00 = OR
;  01 = AND
;  10 = XOR
;  11 = XNOR
; Mirror of SNES register $212A
ColorObj_WindowMaskLogic: skip 1

; === $003072 ===
; 1 byte
; Main screen designation. Format: ---o4321
; Mirror of SNES register $212C
MainScreenDesignation: skip 1

; === $003073 ===
; 1 byte
; Sub screen designation. Format: ---o4321
; Mirror of SNES register $212D
SubScreenDesignation: skip 1

; === $003074 ===
; 1 byte
; Window mask designation for the main screen. Format: ---o4321
; Mirror of SNES register $212E
MainScreenWindowMaskDesignation: skip 1

; === $003075 ===
; 1 byte
; Window mask designation for the sub screen. Format: ---o4321
; Mirror of SNES register $212F
SubScreenWindowMaskDesignation: skip 1

; === $003076 ===
; 1 byte
; Color addition settings. Format: ccmm--sd
; cc = where to clip colors to black
; mm = where to prevent math
; s = add subscreen rather than fixed color
; d = direct color mode for 8bpp backgrounds
; Mirror of SNES register $2130
ColorAddition_Settings: skip 1

; === $003077 ===
; 1 byte
; CGADSUB settings. Format: shbo4321
; s = add (0) or subtract (1)
; h = half-color enable
; bo4321 = affected layers (backdrop/sprites/4/3/2/1)
; Mirror of SNES register $2131.
CGADSUB_Settings: skip 1

; === $003078 ===
; 3 bytes
; Background color, as three mirrors of SNES register $2132.
; Note that the component bits (the top three bits, in the order bgr) also need to be included with this.
Background_Color: skip 3

; === $00307B ===
; 1 byte
; Mode 7 settings. Format: rc----yx
; r = field size (1024x1024 vs larger)
; c = empty space fill when using a larger field (0 = transparent, 1 = fill with 0), x/y = horz/vert mirroring
; Mirror of SNES register $211A.
Mode7_Settings: skip 1

; Unidentified
skip 7

; === $003083 ===
; 2 bytes
; Mode 7 matrix parameter A
; Mirror of SNES register $211B
Mode7_MatrixA: skip 2

; === $003085 ===
; 2 bytes
; Mode 7 matrix parameter B
; Mirror of SNES register $211C
Mode7_MatrixB: skip 2

; === $003087 ===
; 2 bytes
; Mode 7 matrix parameter C
; Mirror of SNES register $211D
Mode7_MatrixC: skip 2

; === $003089 ===
; 2 bytes
; Mode 7 matrix parameter D
; Mirror of SNES register $211E
Mode7_MatrixD: skip 2

; === $00308B ===
; 2 bytes
; Mode 7 center X position
; Mirror of SNES register $211F
Mode7_CenterX: skip 2

; === $00308D ===
; 2 bytes
; Mode 7 center Y position
; Mirror of SNES register $2120
Mode7_CenterY: skip 2

; Unidentified
skip 2

; === $003091 ===
; 1 byte
; Interrupt enable flags. Format: n-yx---a
; n = nmi
; y/x = irq (corresponding to $4209, $4207)
; a = auto-joypad read
; Mirror of SNES register $4200.
InterruptEnableFlags: skip 1

; === $003092 ===
; 1 byte
; HDMA channel enable. Masked out by $3093, then stored to SNES register $420C every frame.
HDMA_Enable: skip 1

; === $003093 ===
; HDMA channel mask. Any bits set to 0 here will have the corresponding HDMA channel completely disabled.
HDMA_Mask: skip 1

; Unidentified
skip 7

; === $00309B ===
; 3 bytes
; 24-bit pointer to the current IRQ routine to run. Known values are:
; $0084BB - No routine.
; $01EA1F - In-level status bar
; Unknown if any other values are used.
IRQ_Routine_Pointer: skip 3

; Unidentified (unused?)
skip 1

; === $00309F ===
; Some sort of flag to deal with the timing of SA-1 and SNES's NMI execution (for handling lag?).
; SA-1 sets this value to 1, while the SNES clears it.
; Needs further research.
SA1_SNES_NMI_Sync: skip 1

; Unidentified
skip 1

; === $0030A1 ===
; 1 byte
; Mirror of $305F, next frame (which is in turn a hardware mirror of $2100, the screen brightness).
; This address seems to get copied there each frame.
Screen_Brightness_Mirror_PrevFrame: skip 1

; === $0030A2 ===
; 1 byte
; Mirror of $305F, current frame (which is in turn a hardware mirror of $2100, the screen brightness).
Screen_Brightness_Mirror: skip 1

; === $0030A3 ===
; 1 byte
; Mirror of $3072, current frame (which is in turn a hardware mirror of $212C, the main screen designation).
MainScreenDesignation_Mirror: skip 1

; === $0030A4 ===
; 544 bytes
; OAM table; handles all sprite tiles on-screen.
; Each tile gets 4 bytes: xxxxxxxx yyyyyyyy tttttttt yxppccct
; $32A4-$32C3 handles the high X bit and size of each tile.
OAM_Table: skip 544

; Valid controller inputs:
!BTN_NONE   = $0000
!BTN_B      = $8000
!BTN_Y      = $4000
!BTN_SELECT = $2000
!BTN_START  = $1000
!BTN_UP     = $0800
!BTN_DOWN   = $0400
!BTN_LEFT   = $0200
!BTN_RIGHT  = $0100
!BTN_A      = $0080
!BTN_X      = $0040
!BTN_L      = $0020
!BTN_R      = $0010
!BTN_ALL    = $FFF0

; === $0032C4 ===
; 2 bytes
; Controller 1 input, held. Format (16-bit): byetUDLR axlr----
; a/b/x/y/l/r = respective buttons, e = select, t = start, UDLR = directional inputs
P1_Hold: skip 2

; === $0032C6 ===
; 2 bytes
; Controller 2 input, held. Format (16-bit): byetUDLR axlr----
; a/b/x/y/l/r = respective buttons, e = select, t = start, UDLR = directional inputs
P2_Hold: skip 2

; Unidentified
skip 4

; === $0032CC ===
; 2 bytes
; Mirror of $32C4 (controller 1 input), on frames when $7E0036 is reset.
; On any other frame, this address is 0x0000.
P1_Repeat: skip 2

; === $0032CE ===
; 2 bytes
; Mirror of $32C6 (controller 2 input), on frames when $7E0038 is reset.
; On any other frame, this address is 0x0000.
P2_Repeat: skip 2

; Unidentified
skip 4

; === $0032D4 ===
; 2 bytes
; Controller 1 input, first frame only. Format (16-bit): byetUDLR axlr----
; a/b/x/y/l/r = respective buttons, e = select, t = start, UDLR = directional inputs
P1_Frame: skip 2

; === $0032D6 ===
; 2 bytes
; Controller 2 input, first frame only. Format (16-bit): byetUDLR axlr----
; a/b/x/y/l/r = respective buttons, e = select, t = start, UDLR = directional inputs
P2_Frame: skip 2

; Unidentified
skip 4

; === $0032DC ===
; 1 byte
; Value to indicate which of the alternative palettes to use for the FG/BG/sprites.
; If negative (or 7), then the standard palette at $7E0500 is used.
; Else, it uses the corresponding alternative palettes.
; Generally, the alternative palettes are used for darker versions of the sprite palettes, in order to perform pseudo-color math on them.
; As such, you can effectively consider this address to be the brightness of the sprites on a scale of 0 (darkest) to 7 (brightest).
UseAltPalette: skip 1

; Unidentified
skip 1 

; === $0032DE ===
; 2 bytes
; If set to a positive value, used as an index to $0083E6, whose values are used to form an HDMA source address for channel 7.
; Only values 0 and 1 seem to be valid. Needs more research.
HDMA_Source_Index: skip 2

; Unidentified
skip 2

; === $0032E2 ===
; 2 bytes
; Something related to HDMA channel 7
; If non-zero, this value gets stored directly as its source address, and the HDMA channel is enabled.
; Needs more research.
Enable_HDMA_Channel7: skip 2

; Unidentified
skip 6

; === $0032EA ===
; 2 bytes
; Currently active subgame.
; Valid subgames:
!SUBGAME_SPRINGBREEZE   = 00
!SUBGAME_DYNABLADE      = 01
!SUBGAME_GOURMETRACE    = 02
!SUBGAME_GCO            = 03
!SUBGAME_ROMK           = 04
!SUBGAME_MWW            = 05
!SUBGAME_ARENA          = 06
!SUBGAME_SOUNDTEST      = 07
!SUBGAME_MEGATONSAMURAI = 08
Current_SubGame: skip 2

; === $0032EC ===
; 2 bytes
; Written as a double of $32EA whenever a room is being loaded
; Used to calculate offsets for loading room data
Current_SubGame_x2: skip 2

; === $0032EE ===
; 2 bytes
; Level number for Dyna Blade, Revenge of Meta Knight, and Milky Way Wishes.
; Milky Way Wishes planet IDs:
;  00 - Floria
;  01 - Hotbeat
;  02 - Skyhigh
;  03 - Cavios
;  04 - Aqualiss
;  05 - Mecheye
;  06 - Halfmoon
;  07 - [?]
;  08 - Nova
;  09 - [?] (unused duplicate?)
Current_Level: skip 2

; === $0032F0 ===
; 2 bytes
; Written as a double of $32EE whenever a room is being loaded
; Used to calculate offsets for loading room data
Current_Level_x2: skip 2

; === $0032F2 ===
; 2 bytes
; Room number to respawn into
; Room number is relative to subgame index
Current_Room: skip 2

; === $0032F4 ===
; 2 bytes
; Written as a quadruple of $32F2 whenever a room is being loaded
; Used to calculate offsets for loading room data
Current_Room_x4: skip 2

; === $0032F6 ===
; 4 bytes
; Long pointer to room data. 
; The address written here is read from the start of bank $FF.
skip 4

; 32FA - 3308 are all 4-byte-long pointers to data.

; 3312 respawn room
; 3314 x respawn
; 3316 y respawn 
; 3318 respawn ram offset position (but why)

; Unidentified
skip $3342-$32FA

; === $003342 - $003348 ===
; 2 bytes each
; Mirrors of Kirby's/Helper's X and Y position to assist with determining camera position.
; These values are offset so that 0,0 are at the center of the screen when at the most top-left position of the room.
CameraMirror_KirbyX: skip 2
CameraMirror_HelperX: skip 2
CameraMirror_KirbyY: skip 2
CameraMirror_HelperY: skip 2

; === $00334A - $00334C ===
; 2 bytes
; The X and Y positions that the camera will target.
; Determined using Kirby and Helper's X positions.
Camera_TargetX: skip 2
Camera_TargetY: skip 2

; === $00334E ===
; 2 bytes
; Influences the Camera Y position in some way.
; Usually set to zero? Is this a Y offset value?
skip 2

; === $003350 ===
; 2 bytes
; Current camera position X. Always tries to target the value at $334A.
Camera_CurrentPositionX: skip 2

; === $003352 ===
; 2 bytes
; Camera X offset so that camera doesn't abruptly stop in place when finished moving.
Camera_EasingX: skip 2

; === $003354 ===
; 2 bytes
; Current camera position Y
Current_CameraPositionY: skip 2

; === $003356 ===
; 2 bytes
; Camera Y offset so that camera doesn't abruptly stop in place when finished moving.
Camera_EasingY: skip 2

; === $003358 - $00335E ===
; 2 bytes
; Current X/Y position of the foreground/background tiles being drawn to the screen.
Camera_FGTilesDrawnX: skip 2
Camera_BGTilesDrawnX: skip 2
Camera_FGTilesDrawnY: skip 2
Camera_BGTilesDrawnY: skip 2

; === $003360 ===
; 2 bytes
; Offset of the top screen boundary that pushes Kirby down. Increasing this number moves the boundary lower.
CurrentRoom_BoundaryTop: skip 2

; === $003362 ===
; 2 bytes
; Essentially the current room's height. Specifically only used for determining if Kirby has fallen in a pit.
; This value is compared to Kirby's Y minus 0x0C, at $0290A0.
CurrentRoom_BoundaryBottom: skip 2

; === $003364 ===
; 2 bytes
; Offset of the left-most X boundary. Increasing this number moves the boundary right.
CurrentRoom_BoundaryLeft: skip 2

; === $003366 ===
; 2 bytes
; Essentially the current room's width. Increasing this number moves the boundary right.
CurrentRoom_BoundaryRight: skip 2

; Unidentified
skip $3372-$3368

; === $003372 ===
; 2 bytes
; Maximum X tile scroll of the given room?
skip 2

; Unidentified
skip $33CA-$3374

; 33C6 "cutscene loaded", set to 01 when a dialogue sequence is done.
; See $01E380, it is incremented here once text is finished.

; === $0033CA ===
; 1 byte
; Current music value mirrored from $7E00AA onto the SA-1
CurrentMusic_SA1: skip 1

; === $0033CB ===
; 1 byte
; Current SFX value mirrored from $7E00AB onto the SA-1
CurrentSFX_SA1: skip 1

; === $0033CC ===
; Current music volume. Updates on music or update or sound effect playing.
CurrentVolume: skip 1

; === $0033CD ===
; Whether or not Stereo or Mono is set.
CurrentStereoMono: skip 1

; === $0033CE ===
; 1 byte
; Internal timer A underflow flag. When an underflow occurs, gets set to 0xFF.
InternalTimerA_Underflow: skip 1

; === $0033CF ===
; 1 byte
; Internal timer B underflow flag. When an underflow occurs, gets set to 0xFF.
InternalTimerB_Underflow: skip 1

; === $0033D0 ===
; 1 byte
; Internal timer B underflow flag. When an underflow occurs, gets set to 0xFF.
InternalTimerC_Underflow: skip 1

; === $0033D1 ===
; 2 bytes
; Internal timer A; decrements once per frame, looping from 0000 to FFFF.
; When it reaches 0000, 0xFF is stored to $33CE.
InternalTimerA: skip 2

; === $0033D3 ===
; 2 bytes
; Internal timer B; decrements once per frame, looping from 0000 to FFFF.
; When it reaches 0000, 0xFF is stored to $33CF.
InternalTimerB: skip 2

; === $0033D5 ===
; 2 bytes
; Internal timer C; decrements once per frame, looping from 0000 to FFFF.
; When it reaches 0000, 0xFF is stored to $33D0.
InternalTimerC: skip 2

; === $0033D7 ===
; 2 bytes
; Varies the amount of damage to be received.
; Initializes at 0x1000, and ranges between 0x0A00 and 0x1600
; The lower the value, the more damage will be taken
; For more info: https://waddledx.hatenablog.jp/entry/20171113/1510499775
DamageModifier: skip 2

; Unidentified
skip 551

; === $003600 ===
; 32 bytes
; DEBUG: Temporary storage used for the "wrapped" palette when cycling palettes in the VRAM viewer.
;Debug_Temp_Palette_Wrap: skip 32

; === $003620 ===
; 2 bytes
; DEBUG: Current page number for the VRAM viewer.
;Debug_Current_VRAM_Page: skip 2

; === $003628 ===
; 2 bytes
; DEBUG: Current palette number for the VRAM viewer.
;Debug_Current_Palette: skip 2

; === $003600 - $003640 ===
; 64 bytes each
; Table of input history from the P1 controller and P2 controller.
; A new entry is written to this table every frame with the current inputs.
; Except when a Helper is spawned, the P2 list is blank? 
P1_InputHistory: skip 64
P2_InputHistory: skip 64

; === $003680 - $003682 ===
; 2 bytes each
; The current offset being written to in the list above.
; Except when a Helper is spawned, the offset is always 0x0000?
P1_InputHistoryOffset: skip 2
P2_InputHistoryOffset: skip 2

; Unused?
skip 12

; === $003690 - $003696 ===
; 2 bytes each
; The controller inputs used to control Kirby/Helper.
; These inputs are usually mirrors of the P1/P2 input values found in SaveRAM.
; But if computer-controlled, the inputs will be filled in by the game itself.
P1_Hold_Gameplay: skip 2
P1_Frame_Gameplay: skip 2
P2_Hold_Gameplay: skip 2
P2_Frame_Gameplay: skip 2

; === $003698 - $00369A ===
; 2 bytes each
; Tracks the last pressed D-Pad input from above, excluding up/down.
; Essentially, if 01, left was last pressed, if 02, right was last pressed.
P1_LastXDirectionalInput: skip 2
P2_LastXDirectionalInput: skip 2

; === $00369C - $00369E ===
; 2 bytes each
; Same as above, but the current real-time equivalent.
; If 01, left is being pressed, if 02, right is being pressed.
P1_CurrentXDirectionalInput: skip 2
P2_CurrentXDirectionalInput: skip 2

; === $0036A0 - $0036A2 ===
; 2 bytes
; Buttons designated to moving Kirby/Helper left and right
ButtonMap_P1MoveLR: skip 2
ButtonMap_P2MoveLR: skip 2

; === $0036A4 - $0036A6 ===
; 2 bytes
; Buttons designated to having Kirby/Helper crouch
ButtonMap_P1Crouch: skip 2
ButtonMap_P2Crouch: skip 2

; === $0036A8 - $0036AA ===
; 2 bytes
; Buttons designated to having Kirby/Helper shield
ButtonMap_P1Shield: skip 2
ButtonMap_P2Shield: skip 2

; === $0036AC - $0036AE ===
; 2 bytes
; Buttons designated to having Kirby/Helper attack
ButtonMap_P1Attack: skip 2
ButtonMap_P2Attack: skip 2

; === $0036B0 - $0036B2 ===
; 2 bytes
; Buttons designated to having Kirby/Helper jump
ButtonMap_P1Jump: skip 2
ButtonMap_P2Jump: skip 2

; === $0036B4 - $0036B6 ===
; 2 bytes
; Buttons designated to having Kirby summon a Helper / having Helper teleport to Kirby
ButtonMap_P1Summon: skip 2
ButtonMap_P2Summon: skip 2

; === $0036B8 - $0036BA ===
; 2 bytes
; Buttons designated to having Kirby/Helper select abilities in MWW
ButtonMap_P1SelectAbility: skip 2
ButtonMap_P2SelectAbility: skip 2

; 36BC & 36BE are Kirby and Helper's last obtained abilities?

; Unidentified
skip $36F8-$36BC

; === $0036F8 - $0036FA ===
; Kirby/Helper's states?
; More research required
skip 2
skip 2

; === $0036FC - $0036FE ===
; 2 bytes each
; Kirby's/Helper's current facing direction
; 0xC0 = facing left 
; 0x40 = facing right
; It seems like the only thing determining the facing angle is the upper-most bit out of the two bytes.
; These bytes are copied to their respective object slots in table $6DD0.
Kirby_FacingDirection: skip 2
Helper_FacingDirection: skip 2

; $003700 is the start of several temp RAM addresses that the SA-1 uses

; Unidentified
skip $3714-$3700

; === $003714 - $00371C ===
; 4 bytes each
; Scrap RAM for, in most use cases, indirect pointers to other tables.
SA1_ScrapPointer1: skip 4
SA1_ScrapPointer2: skip 4
SA1_ScrapPointer3: skip 4

; Unidentified
skip $3731-$3720

; === $003731 ===
; 8 bytes
; Used as temporary storage for data to be entered into the circular DMA buffer at $7E0100 or DMA queue at $7E0900.
; Specifically, intended for the routines at $00875A or $008CD0. Values are:
; $3731 - Index (+3) to the table at $00869D for controlling the DMA.
; $3732 - 16-bit size
; $3734 - 24-bit source
; $3737 - 16-bit destination VRAM address
DMA_Buffer_TempStorage: skip 8

; Undefined
skip 4

; 3739 is labeled as "Track" in the music debug text thing.

; === $00373D ===
; 3 bytes
; Current location of the program counter for executing ActionScript
AS_PC: skip 3

; Unidentified
skip 3

; === $003743 ===
; 2 bytes
; Current RNG seed for the routine at $008AC1.
Current_RNG: skip 2

; === $003745 ===
; 10 bytes
; Scratch RAM.
; $3749, $374B, and $374D are often used for storing arguments from A/X/Y passed into function calls.
SA1_Scratch_AXY: skip 10

; Unidentified
skip 57

; === $003780 ===
; SA-1 program stack
; Allocated space may be larger or smaller than currently specified; ends at $37FF
SA1_Stack: skip 128


; --== Save RAM ==--

ORG $006000

; The following are temporary RAM addresses used when creating new objects.
; These paramters are written here first before being written to the object queue in routine InitializeNewObject ($008E9E)

; === $006000 - $006008 ===
; 2 bytes each
; Temporary storage for the variables of the next object that is being spawned.
ObjVar0_Temp: skip 2
ObjVar1_Temp: skip 2
ObjVar2_Temp: skip 2
ObjVar3_Temp: skip 2
ObjVar4_Temp: skip 2

; === $00600A ===
; 2 bytes
; Unsure, reads from undocumented table $623C
skip 2

; === $00600C - $00600E ===
; 2 bytes each
; Temporary storage for the X and Y spawn positions of the next object that is being spawned.
ObjXPos_Temp: skip 2
ObjYPos_Temp: skip 2

; === $006010 - $006012 ===
; 2 bytes each
; Minimum and maximum slot to use when allocating a new object
; These could also be considered the slot offset and slot search limit for the specific object
ObjSlotMinimum: skip 2
ObjSlotMaximum: skip 2

; === $006014 ===
; 2 bytes
; Head of the object linked list.
; Always set to 0x007D when the object list is initialized
; This is also essentially the max object count * 2
; Max object count is always set to 61
;  In this case: 61 * 2 = 0x007A
ObjLinkedListStart: skip 2

; === $006016 ===
; 2 bytes
; Set to 0x007E on object initialization but never actually used??
skip 2

; === $006018 ===
; 2 bytes
; Next object to be processed (temp inside ProcessObjects: $008FF2)
ObjNext: skip 2

; Unidentified
skip $6028-$601A

; === $006028 ===
; 3 bytes
; Scratch RAM intended for 24-bit pointers.
; Used for the LongCall_6028 subroutine.
LongCallPointer: skip 3

; Unidentified
skip $603C-$602B

; The following are all tables for every object currently being executed.
; The size of each table is dependent on the maximum number of objects.
!Max_Obj_Count = 61

; === $00603C ===
; Next object in the linked list.
Obj_NextInList: skip !Max_Obj_Count*2
; 60b6  minimum obj slot address? 0x0002
skip 2
; 60b8  this number will point to another number in the list. This number also gets written to $6018 briefly
skip 2
; 60ba  always 0xFFFF? gets written to $601A
skip 2

; === $0060BC ===
; Undocumented table
Obj_Table60BC: skip !Max_Obj_Count*2
; 6136  ?
skip 2
; 6138  ?
skip 2
; 613A  ?
skip 2

; === $00613C ===
; Undocumented table
Obj_Table613C: skip !Max_Obj_Count*2
; 61B6  ?
skip 2
; 61B8  ?
skip 2
; 61BA  ?
skip 2

; === $0061BC ===
; Undocumented table
Obj_Table61BC: skip !Max_Obj_Count*2
; 6236  ?
skip 2
; 6238  ?
skip 2
; 623A  ?
skip 2

; === $00623C ===
; Undocumented table
; Part of the object variable pointer table at $008D6F
Obj_Table623C: skip !Max_Obj_Count*2
; 62B6  ?
skip 2
; 62B8  ?
skip 2
; 62BA  ?
skip 2

; === $0062BC ===
; Set to 8000 if object is invalid?
Obj_Table62BC: skip !Max_Obj_Count*2
; 6336  ?
skip 2
; 6338  ?
skip 2
; 633A  ?
skip 2

; === $00633C ===
; Tick callback address
Obj_TickCallbackAddr: skip !Max_Obj_Count*2

; === $0063B6 ===
; Tick callback bank
; Set to 8000 to disable the tick callback
Obj_TickCallbackBank: skip !Max_Obj_Count*2
; 6430  ?
skip 2
; 6432  ?
skip 2
; 6434  ?
skip 2

; === $006436 ===
; Object pose (aka animation frame)
Obj_Pose: skip !Max_Obj_Count*2
; These are always set to 0xFFFF(?):
; 64B0  ?
skip 2
; 64B2  ?
skip 2
; 64B4  ?
skip 2

; === $0064B6 ===
; Object Z-layering priority
; A lower number indicates a higher priority
Obj_ZLayer: skip !Max_Obj_Count*2
; 6530  ?
skip 2
; 6532  ?
skip 2
; 6534  ?
skip 2

; === $006536 ===
; Object spritemap address
; Setting as 8000 will make it so the object is no longer drawn
Obj_SpriteMapAddr: skip !Max_Obj_Count*2

; === $0065B0 ===
; Object spritemap bank
Obj_SpriteMapBank: skip !Max_Obj_Count*2
; 662A  ?
skip 2
; 662C  ?
skip 2
; 662E  ?
skip 2

; === $006630 ===
; Object draw callback
Obj_DrawCallback: skip !Max_Obj_Count*2

; === $0066AA ===
; Unknown callback. Move callback?
Obj_TickLoopCallback: skip !Max_Obj_Count*2

; === $006724 ===
; Script sleep timer
Obj_ScriptSleepTimer: skip !Max_Obj_Count*2

; === $00679E ===
; Script program counter
Obj_ScriptProgramCounter: skip !Max_Obj_Count*2

; === $006818 ===
; Script program bank
; Extra flags in high byte: 
; - 80: skip a bunch of processing
; - 40: "Script" is actually "native ASM" (directly calls routines to wait/yield, etc)
; - 20: ActionScript/ASM runs on the S-CPU
Obj_ScriptProgramBank: skip !Max_Obj_Count*2

; === $006892 ===
; Mirror of the Object X Position list which starts at $006986
; Unsure what the use case is?
Obj_XPositionMirror: skip !Max_Obj_Count*2
; Kirby is always in object slot 2, therefore Kirby's reference will always be located at $6894

; === $00690C ===
; Mirror of the Object Y Position list which starts at $006A00
; Unsure what the use case is?
Obj_YPositionMirror: skip !Max_Obj_Count*2
; Kirby is always in object slot 2, therefore Kirby's reference will always be located at $690E

; === $006986 ===
; Object X Position 
Obj_XPosition: skip !Max_Obj_Count*2
; Kirby is always in object slot 2, therefore Kirby's reference will always be located at $6988

; === $006A00 ===
; Object Y Position 
Obj_YPosition: skip !Max_Obj_Count*2
; Kirby is always in object slot 2, therefore Kirby's reference will always be located at $6A02

; === $006A7A ===
; Object X Position fraction (aka subpixels, 1/65536 units)
Obj_XPositionFraction: skip !Max_Obj_Count*2
; Kirby is always in object slot 2, therefore Kirby's reference will always be located at $6A7C

; === $006AF4 ===
; Object Y Position fraction (aka subpixels, 1/65536 units)
Obj_YPositionFraction: skip !Max_Obj_Count*2
; Kirby is always in object slot 2, therefore Kirby's reference will always be located at $6AF6

; === $006B6E ===
; Object X Speed
Obj_XSpeed: skip !Max_Obj_Count*2

; === $006BE8 ===
; Object Y Speed
Obj_YSpeed: skip !Max_Obj_Count*2

; === $006C62 ===
; Object X Acceleration
Obj_XAcceleration: skip !Max_Obj_Count*2

; === $006CDC ===
; Object Y Acceleration
Obj_YAcceleration: skip !Max_Obj_Count*2

; === $006D56 - $0071A0 ===
; All object variable tables
; == $006D56 ==
Obj_VAR0: skip !Max_Obj_Count*2
; == $006DD0 ==
; Used exclusively for determining facing direction of all objects.
; 0xC0 = facing left 
; 0x40 = facing right
Obj_VAR1: skip !Max_Obj_Count*2
; == $006E4A ==
; Animation timers/frames?
Obj_VAR2: skip !Max_Obj_Count*2
; == $006EC4 ==
Obj_VAR3: skip !Max_Obj_Count*2
; == $006F3E ==
Obj_VAR4: skip !Max_Obj_Count*2
; == $006FB8 ==
Obj_VAR5: skip !Max_Obj_Count*2
; == $007032 ==
Obj_VAR6: skip !Max_Obj_Count*2
; == $0070AC ==
Obj_VAR7: skip !Max_Obj_Count*2
; == $007126 ==
Obj_VAR8: skip !Max_Obj_Count*2
; == $0071A0 ==
Obj_VAR9: skip !Max_Obj_Count*2

; === $00721A ===
; Unidentified table?
skip 48

; === $00724A ===
Obj_ScriptWorkRegister: skip !Max_Obj_Count*2

; Unidentified
skip $7368-$72C4

; === $007368 ===
; 2 bytes
; Locks the camera in place if set to anything greater than 0x0000
CameraLock: skip 2

; Unidentified
skip $7376-$736A

; === $007376 ===
; 4 bytes
; Current score
PlayerScore: skip 4

; === $00737A ===
; 2 bytes
; Current lives count
Lives: skip 2

; === $00737C - $00737E ===
; 2 bytes each
; Kirby and Helper's HP
KirbyHP: skip 2
HelperHP: skip 2

; === $007380 - $007382 ===
; 2 bytes each
; Kirby and Helper's Max HP
KirbyMaxHP: skip 2
HelperMaxHP: skip 2

; === $007384 ===
; 1 byte
; Kirby's copy ability panel graphic
KirbyAbilityPanelGFX: skip 1

; === $007385 ===
; 1 byte
; Temporary graphic for Kirby's copy ability panel graphic
; i.e. Ouch!, Invincible, etc.
KirbyAbilityTempPanelGFX: skip 1

; === $007386 ===
; 1 byte
; Helper's copy ability panel graphic
HelperAbilityPanelGFX: skip 1

; === $007387 ===
; 1 byte
; Temporary graphic for Helper's copy ability panel graphic
; i.e. Ouch!, Invincible, etc.
HelperAbilityTempPanelGFX: skip 1

; === $007388 ===
; 1 byte
; The temporary graphic number displayed on Kirby's copy ability panel
; ($7384 is this value plus 0x20)
; 00 - Default
; 01 - クリア (Clear, unused)
; 02 - Mix
; 03 - Super
; 04 - Cannon
; 05 - Trolley
; 06 - ゴール (Goal, unused)
; 07 - Wheelie Rider
; 08 - Ouch
; 09 - I'm Hit.
; 0A - Let's Go
; 0B - 怒 (Anger, unused)
; 0C - No good!
; 0D - Warp Star
; 0E-FF - Blank
KirbyAbilityTempPanelIndex: skip 1

; === $007389 ===
; 1 byte
; Same as above, except written to a frame after $7388 has changed
KirbyAbilityTempPanelIndexUpdate: skip 1

; === $00738A ===
; 2 bytes
; The display time of the temporary graphics for Kirby's ability panel
KirbyAbilityTempPanelTimer: skip 2

; === $00738C ===
; 1 byte
; The temporary graphic number displayed on Helper's copy ability panel
; Anything greater than 00 will make the panel the "Help" graphic
; Otherwise it will be Default
HelperAbilityTempPanelIndex: skip 1

; === $00738D ===
; 1 byte
; Same as above, except written to a frame after $738C has changed
HelperAbilityTempPanelIndexUpdate: skip 1

; Unidentified
skip 2

; === $007390 ===
; 2 bytes
; Current game state.
; The game state can be one of the below values:
!GAMESTATE_TITLESCREEN             = 00
!GAMESTATE_CORKBOARD               = 01
!GAMESTATE_TUTORIAL                = 02
!GAMESTATE_MAINLEVEL               = 03
!GAMESTATE_GAMEOVER                = 04
!GAMESTATE_SUBGAMETITLE            = 05
!GAMESTATE_SUBGAMEMAP              = 06
!GAMESTATE_SUBGAMEOPENING          = 07
!GAMESTATE_SUBGAMECREDITS          = 08
!GAMESTATE_DYNAGOAL                = 09
!GAMESTATE_SOUNDTEST               = 0A
!GAMESTATE_MINIGAME                = 0B
!GAMESTATE_ARENA                   = 0C
!GAMESTATE_DYNASECRET              = 0D
!GAMESTATE_DYNAMAPFIGHT            = 0E
!GAMESTATE_TITLESUBGAMEPREVIEW     = 0F
!GAMESTATE_TITLEMINIGAMEPREVIEW    = 10
CurrentGameState: skip 2

; === $007392 ===
; 2 bytes
; Reloads the current room on the next frame if this value is set to anything greater than 0x0000
ReloadRoom: skip 2

; === $007394 ===
; 2 bytes
; A byte that is set to indicate if a warp will take you to a special area
; 01 - Dyna Blade map (regardless of subgame)
; 02 - Game Over
; 03 - Dyna/MWW Goal
; 04 - Clear Subgame
LoadSpecialWarpDest: skip 2

; === $007396 ===
; 2 bytes
; Set to 0x0000 to load back to Dyna/MWW map on unpause
ReloadMapOnUnpause: skip 2

; === $007398 ===
; 2 bytes
; The game state that the title screen demo is currently using
; This is not the same as the normal game state address
; 00 - Subgame Title
; 01 - Level
; 02 - Minigame
; 03 - Subgame Cutscene
TitleDemo_GameState: skip 2

; === $00739A ===
; 2 bytes
; Set to 0x0001 while the title screen demos play, otherwise set to 0x0000.
; If set to 0x0001:
;  Inputs are not read until the fade from black while loading a room has completed
;  Pressing any button on a subgame title screen will attempt to load the main title screen
TitleDemo_Flag: skip 2

; === $00739C ===
; 1 byte
; Current title screen demo
; Increases by 1 every time a title screen demo finishes
TitleDemo_CurrentDemo: skip 1

; === $00739D ===
; 1 byte
; 0x02 is written to this value but otherwise never used?
skip 1

; === $00739E ===
; 2 bytes
; Current index in the input list for Player 1
;  Player 2 is never used (It is always CPU-controlled)
TitleDemo_InputIndex: skip 2

; === $0073A0 ===
; 2 bytes
; Timer for Revenge of Meta Knight
RoMK_Timer: skip 2

; === $0073A2 ===
; 2 bytes
; Timer that keeps track of the main RoMK timer when it slows down.
; Main RoMK timer slows down once it is below 0x00BF as noted at $00C278.
RoMK_SlowTimer: skip 2

; 744B 2b state when you are intangible to items/cant fully pause the game
; 744D 2b state above but for helper

; Unidentified
skip $749D-$73A4

; === $00749D ===
; 2 bytes
; The starting address for the table which stores Kirby and Helper's abilities.
; This seems to be never written to directly, and is only used to reference the following two sets of bytes?
;  (Using either $749D,X or $749D,Y; with X/Y either being 0x02 or 0x04 but never zero)
AbilityTable: skip 2

; === $00749F ===
; 2 bytes
; Kirby's current ability
Kirby_Ability: skip 2

; === $0074A1 ===
; 2 bytes
; Helper's current ability
Helper_Ability: skip 2

; Unidentified
skip $7569-$74A3

; === $007569 ===
; 2 bytes
; Wheelie Rider state
; Set higher than 0x0000 to enter Wheelie Rider state
Wheelie_Rider: skip 2

; Unidentified
skip $7577-$756B

; === $007577 ===
; 2 bytes
; Shooting state (Nova section ability)
; Set higher than 0x0000 to enter Starship state
Shooting_State: skip 2

; Unidentified
skip $7735-$7579

; 757B: obtained an ability? (this doesn't increment/decrement in every circumstance though?)
; when this is set to 1 while an ability hat or ability star is in play, the hat/star will disappear
; (in mww, if you swallow an enemy with a hat in play, the hat will die)

; 75CD: 2byte if set higher than 0000 it breaks plasma somehow (particles dont spawn and you cant charge it)
; it also makes you go through enemies when you dash attack with yoyo?

; 75BB,X if set to D088, Kirby's sprite flashes in a similar way to shielding

; === $007735 ===
; 32 bytes
; Food acquisition flags for Gourmet Race
Gourmet_FoodCollected: skip 32

; Unidentified
skip $7A04-$7755

; Starting here are several tables related to enemy attributes
; However for some reason there are a lot of instances where objects share this address space for different functions
; See $D2D7E9 (object spawn routine?), $D363F9 (another object spawn routine?), $D03D08 (write HP value)
; Does every object have its own routine for spawning?

; === $0077A6 ===
; 64 bytes
; Table for object state? (such as GCO save platform)
;Obj_State: skip 64

; 774E: hardcoded value that increments whenever Crash is "used" (includes puffing with Crash). At $029894
;   Heavy lobster fight reads this hardcoded value once at $CF4E9A, then every frame at $CF4EA8
;   This seems to be the only circumstance this value is ever used?

; === $0077CE ===
; ?? bytes?
; Table for all object HP values
;Obj_HP: 

; === $0077F6 ===
; Start of another table? Unsure as this is also used for HP but sometimes data is indexed from that starting location.

; === $007838 ===
; object script action timer?? controls ninja enemy in gco wind room. Managed near code $D32E1F

; === $007A04 ===
; 1 byte
; Number of enemies to be defeated before the chance of rolling a random food drop
FoodDropCounter: skip 1

; Unidentified
skip $7A19-$7A05

; === $007A19 ===
; 2 bytes
; Current Boss Health
; This value is not for minibosses, only for actual main bosses.
BossHP: skip 2

; === $007A1B ===
; 2 bytes
; Boss HP Meter. This is shared between all bosses, including minibosses.
HUD_BossHP: skip 2

; === $007A1D ===
; 2 bytes
; Max HP for the Boss HP Meter. This is shared between all bosses, including minibosses.
HUD_BossMaxHP: skip 2

; 78AE: 2b i frames for reactor. probably a part of the aforementioned object tables (table starts at $7896)
; Reactor code: $D4BF90

; 7a19: 2b boss hp
; 7a1b: 2b boss max hp
; 7a1d: 2b current boss hp
; 7a1f: 2b boss hp meter
; 7a23: 1 byte, MetaKnight cutscene portrait (only used in RoMK). Next byte is frame copy
; 7a28: 1b controls the HUD visibility and layering
; 7a31: 38byte/48byte??? arena boss order, 2 bytes for each boss number
; 7a59: arena timer milliseconds
; 7a5B: arena timer seconds
; 7a5d: arena timer minutes
; 7a65: current dyna blade level (may be limited to map? double check)
; 7a69: 2b current romk chapter to load on subgame title

; 7a85: number of games unlocked
; 7a87: last frame subgame selection (used to trigger sfx)
; 7a91: current subgame selected
; 7a93: flags for which subgames have been cleared
; 7A97: 2b freeze cam if above 0000
; 7AA1: current arena round
; 7AA7: giant table of kirby's x coordinate history?
; 7AC0: table for helper AI?
; 7AC1: setting to 0000 makes 2P a CPU
; 7ACB: 2b ducking timer?
; 7AD1: 2b timer for shielding, or also holding up on the Dpad? (influenced by 7AC3: 08 shield, 05 up, )
; 7B0F: 4b treasure count
; 7B25: 2b subgame menu cursor option
; 7B27: 2b romk chapter to load when pressing continue (but this address could be used on other subgames, worth checking)
; 7B29: 2b subgame timer to start cutscene