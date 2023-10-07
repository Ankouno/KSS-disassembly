; This bank contains mainly text data.
; Although this bank is technically mapped at $168000, the Super MMC maps it to the lower half of bank CB.
;  As KSS always references it in this way, all address values will be treated as such.
table CharMaps/vwf.map
org $CB0000

; VWF placement info format:
; 00 - Layer 3 GFX VRAM address
; 02 - Layer 3 tilemap VRAM address
; 04 - X position to start writing at (divided by 8)
; 05 - Y position to start writing at (divided by 8)
; 06 - Width of the text (in 8x8s)
; 07 - Height of the text (in 8x8s)
DATA_CB0000:						;$CB0000	| Table of VWF placement info. 8 bytes per option, see above for details.
	dw $4000,$5000 : db $04,$06,$18,$0A			; 00
	dw $4000,$5000 : db $04,$0E,$18,$0C			; 01 - "Is this your first time" dialogue
	dw $4000,$5000 : db $06,$0C,$14,$04			; 02
	dw $4000,$5000 : db $00,$00,$02,$02			; 03
	dw $4000,$5000 : db $04,$0C,$18,$06			; 04
	dw $4000,$5000 : db $04,$03,$18,$08			; 05 - Beginner's Show (guide)
	dw $4000,$5000 : db $04,$15,$18,$06			; 06 - End of Beginner's Show?
	dw $4000,$5000 : db $04,$13,$18,$06			; 07 - Game tutorial scene
	dw $2000,$2800 : db $06,$06,$16,$08			; 08 - Spring Breeze intro
	dw $4000,$5800 : db $05,$14,$15,$06			; 09
	dw $4000,$1800 : db $09,$00,$10,$20			; 0A
	dw $4000,$4C00 : db $02,$14,$19,$08			; 0B - Revenge of Meta-Knight intro
	dw $4000,$5800 : db $08,$12,$0E,$06			; 0C
	dw $4000,$5800 : db $04,$13,$18,$06			; 0D - Milky Way Wishes intro
	dw $5000,$4000 : db $04,$15,$18,$06			; 0E
	dw $4000,$7C00 : db $08,$00,$18,$20			; 0F
	dw $4000,$5000 : db $02,$02,$1C,$20			; 10
	dw $4000,$5000 : db $0A,$06,$0F,$06			; 11
	dw $4000,$5000 : db $07,$06,$12,$04			; 12
	dw $4000,$5000 : db $06,$17,$18,$04			; 13 - Meta-Knight textbox
	dw $4000,$5000 : db $02,$04,$1C,$12			; 14 - Startup error screens
	dw $3000,$2C00 : db $02,$04,$10,$02			; 15
	dw $4000,$5C00 : db $06,$0B,$13,$08			; 16
	dw $4000,$5C00 : db $04,$0B,$18,$07			; 17
	dw $4000,$5000 : db $05,$02,$17,$04			; 18 - Computer Virus
	dw $4000,$5000 : db $01,$14,$16,$06			; 19 - Talk with Nova
	dw $5000,$5800 : db $08,$08,$11,$0E			; 1A
	dw $4000,$5C00 : db $02,$17,$1C,$02			; 1B

DATA_CB00E0:						;$CB00E0	| 2bpp values used to initialize the VWF text buffer with the base background color defined by $0065.
	dw $0000,$00FF,$FF00,$FFFF
	
	; TODO: $CB00E8 to $CB0F17


; some of the labels on these are at the wrong index, need to fix them at some point

DATA_CB0F18:						;$CB0F18	| Pointers to the text data for each message. Bank byte is 0xCB (0x16)
	dw DATA_CB15BC					; 000 - ???
	dw DATA_CB15D1					; 002 - ???
	dw DATA_CB15E6					; 004 - ???
	dw DATA_CB15FB					; 006 - ???
	dw DATA_CB1601					; 008 - ???
	dw DATA_CB1607					; 00A - ???
	dw DATA_CB160D					; 00C - ???
	dw DATA_CB1613					; 00E - ???
	dw DATA_CB1619					; 010 - 
	dw DATA_CB1622					; 012 - 
	dw DATA_CB1630					; 014 - 
	dw DATA_CB163E					; 016 - 
	dw DATA_CB164C					; 018 - 
	dw DATA_CB165A					; 01A - 
	dw DATA_CB1668					; 01C - 
	dw DATA_CB167D					; 01E - Yes       No
	dw DATA_CB168D					; 020 - 
	dw DATA_CB169D					; 022 - 
	dw DATA_CB16AD					; 024 - Is this your first time playing? Yes No
	dw DATA_CB16D7					; 026 - Shall we explain "copy"?
	dw DATA_CB16F9					; 028 - Welcome to "The Beginner's Show!"
	dw DATA_CB1724					; 02A - For all you first time players
	dw DATA_CB174F					; 02C - here's how we play.
	dw DATA_CB176C					; 02E - This is the controller.
	dw DATA_CB178D					; 030 - It's that gray thing with the purple buttons.
	dw DATA_CB17C4					; 032 - This is Kirby, our hero!
	dw DATA_CB17E6					; 034 - He's a jolly fellow!
	dw DATA_CB1804					; 036 - Move Kirby left and right by pressing < and > on the + Control Pad.
	dw DATA_CB184D					; 038 - C'mon! Give it a try!
	dw DATA_CB1868					; 03A - You won't accomplish anything just sitting there.
	dw DATA_CB18A3					; 03C - When you see a door...
	dw DATA_CB18C3					; 03E - Push ^ on the + Control Pad. This will take you to the next area.
	dw DATA_CB190A					; 040 - Let's try. Move Kirby to the door and push ^ on the Control Pad.
	dw DATA_CB1952					; 042 - Jump by pushing B.
	dw DATA_CB196E					; 044 - Jump over enemies and obstacles.
	dw DATA_CB1998					; 046 - Now, let's take the food off the obstacle.
	dw DATA_CB19D0					; 048 - Jump by pushing B.
	dw DATA_CB1A2D					; 04A - Use the + Control Pad to jump & take the food. Give it a try!
	dw DATA_CB1A58					; 04C - WOW! You can fly as well as jump!
	dw DATA_CB1ADE					; 04E - To make Kirby fly, press B repeatedly while Kirby is in the air.
	dw DATA_CB1B07					; 050 - Kirby flies higher and higher as you continue to push B.
	dw DATA_CB1B26					; 052 - Let's move on to the next step.
	dw DATA_CB1B50					; 054 - Food restores energy.
	dw DATA_CB1B94					; 056 - Whenever you find food, take it.
	dw DATA_CB1BAC					; 058 - There is food up in the sky.
	dw DATA_CB1BE6					; 05A - Fly up and get it.
	dw DATA_CB1C14					; 05C - How to jump
	dw DATA_CB1C2D					; 05E - To make Kirby fly,push B while he is in the air.
	dw DATA_CB1C74					; 060 - Take the food by continually pressing B.
	dw DATA_CB1C9D					; 062 - Good job!
	dw DATA_CB1CEC					; 064 - Use the fly function when Kirby is about to fall off a cliff.
	dw DATA_CB1D30					; 066 - Let's move on to the next step.
	dw DATA_CB1D83					; 068 - Move Kirby to the door and push ^ on the + Control Pad so we can move on.
	dw DATA_CB1DC9					; 06A - Kirby loses some energy every time he bumps into an enemy.
	dw DATA_CB1E19					; 06C - It's OK to jump over an enemy, but you might want to defeat them instead.
	dw DATA_CB1E45					; 06E - By pushing Y, Kirby will inhale enemies and attack by spitting out what he's inhaled.
	dw DATA_CB1E5C					; 070 - Now, let's practice inhaling an enemy.
	dw DATA_CB1E80					; 072 - Push Y to inhale.
	dw DATA_CB1EB1					; 074 - Ouch! That hurt! Try it again!
	dw DATA_CB1ED0					; 076 - Stand here and inhale an enemy. Be careful.
	dw DATA_CB1EF0					; 078 - You're not listening!
	dw DATA_CB1F05					; 07A - Push Y to inhale an enemy.
	dw DATA_CB1F3E					; 07C - You did it!
	dw DATA_CB1F6E					; 07E - Push Y to spit out a star. This is your attack.
	dw DATA_CB1F91					; 080 - Destroy the target by spitting out a star.
	dw DATA_CB1FDA					; 082 - Push Y to spit out the enemy.
	dw DATA_CB200C					; 084 - Pushing A or V on the + Control Pad swallows an inhaled object.
	dw DATA_CB2021					; 086 - Focus on the target carefully. Try it again.
	dw DATA_CB204A					; 088 - Nice job!
	dw DATA_CB2081					; 08A - This time could be a bit difficult.
	dw DATA_CB20B0					; 08C - Jump and spit out a star. Push B, then Y quickly.
	dw DATA_CB20FA					; 08E - That's all for "The Beginner's Show!"
	dw DATA_CB213A					; 090 - You'll be fine as long as you remember the things you practiced.
	dw DATA_CB215B					; 092 - To start playing Spring Breeze, jump onto the Warp Star.
	dw DATA_CB217D					; 094 - Good luck and have fun!
	dw DATA_CB21B3					; 096 - Shall we explain "copy"?
	dw DATA_CB21F5					; 098 - Congratulations on clearing "Spring Breeze."
	dw DATA_CB2228					; 09A - However, this is only beginning. More fun is on the way!
	
	dw DATA_CB225A					; 09C - Let's learn how to use the copy function.
	dw DATA_CB228A					; 09E - Hello! Welcome to "The Beginner's Show."
	dw DATA_CB22B3					; 0A0 - Have you mastered inhaling and flying?
	dw DATA_CB22DF					; 0A2 - Enemies attack in various ways.
	dw DATA_CB2314					; 0A4 - This enemy is called "Waddle Doo."
	dw DATA_CB233D					; 0A6 - When Kirby inhales an enemy, push A to swallow.
	dw DATA_CB237D					; 0A8 - Press Y to inhale and A to swallow.
	dw DATA_CB23BE					; 0AA - Again, push A to swallow an enemy that you've inhaled.
	dw DATA_CB23FA					; 0AC - Stop goofing around! Push Y to inhale and A to swallow.
	dw DATA_CB2444					; 0AE - Amazing! You can use the energy beam by pushing Y.
	dw DATA_CB2483					; 0B0 - There are some enemies that WILL NOT give you a special ability.
	dw DATA_CB24B9					; 0B2 - Enemies with abilities will flash. Take a close look.
	dw DATA_CB2511					; 0B4 - Here are a few other abilities you can copy.
	dw DATA_CB2557					; 0B6 - You can review the copy explanation anytime during the game by pressing START.
	dw DATA_CB2570					; 0B8 - Some abilities have limited uses. Kirby will not wear a cap.
	dw DATA_CB25AF					; 0BA - There's more.
	dw DATA_CB25E8					; 0BC - Two, yes, two people can play at the same time. Wow !
	dw DATA_CB262B					; 0BE - When Kirby is wearing an "ability cap", push A.
	dw DATA_CB2644					; 0C0 - Then, if the copied character is thrown away, it's ready.
	dw DATA_CB2656					; 0C2 - Push A again...
	dw DATA_CB2682					; 0C4 - ...and...
	dw DATA_CB26CC					; 0C6 - ...a second character will appear.
	dw DATA_CB2716					; 0C8 - This character is called a helper. He'll be a big help to Kirby.
	dw DATA_CB2762					; 0CA - Normally, the helper will act by himself. He can defeat enemies.
	dw DATA_CB27A1					; 0CC - When the helper is present, push any button on the 2nd controller.
	dw DATA_CB27F3					; 0CE - The helper will then be controlled by the 2nd player.
	dw DATA_CB282B					; 0D0 - It's a little confusing at first, but give it a try and you'll catch on!
	dw DATA_CB2859					; 0D2 - Practice with your friend and double the fun!
	dw DATA_CB2895					; 0D4 - FIRE   Spit out some nasty fireballs...
	dw DATA_CB28BA					; 0D6 - STONE   Turn into a stone and do some heavy damage/
	dw DATA_CB28E0					; 0D8 - SWORD   The King of weapons
	dw DATA_CB28FE					; 0DA - There are more techniques..
	dw DATA_CB2929					; 0DC - Throw off the cape...
	dw DATA_CB2973					; 0DE - ...and the helper will put it on.
	dw DATA_CB29A0					; 0E0 - Push A one more time and the helper will become the ability cap.
	dw DATA_CB29CD					; 0E2 - And you can copy the ability again.
	dw DATA_CB2A22					; 0E4 - Here are some special instructions.
	dw DATA_CB2A67					; 0E6 - To dash   Push < or > twice. Kirby will move quickly and increase attack power.
	dw DATA_CB2AAC					; 0E8 - To slide   Push V and B together. You can attack while sliding.
	dw DATA_CB2AEF					; 0EA - To guard   Push L or R. It can reduce the enemy's attack power.
	dw DATA_CB2B12					; 0EC - For further details, please refer to the instruction manual.
	dw DATA_CB2B65					; 0EE - Now, let's play "DYNA BLADE!"
	dw DATA_CB2B8B					; 0F0 - Practice, practice, practice and master "copy" and "helper!" Good luck!
	dw DATA_CB2BC2					; 0F2 - Now, let's play "Spring Breeze!"
	
	dw DATA_CB2CD3					; 0F4 - Is this your first time playing GOURMET RACE?
	dw DATA_CB2D16					; 0F6 - Kirby and King Dedede race through the obstacle course to the finish!
	dw DATA_CB2D43					; 0F8 - Kirby must eat more food and reach the goal before King Dedede.
	dw DATA_CB2D63					; 0FA - There are no enemies to fight.
	dw DATA_CB2D9F					; 0FC - Try to get the highest score!
	dw DATA_CB2DDE					; 0FE - Increase your skill level and become the champion!
	
	dw DATA_CB2E11					; 100 - Is this your first time playing The Great Cave Offensive?
	dw DATA_CB2E52					; 102 - Find treasures throughout the cave.
	dw DATA_CB2EA3					; 104 - It's fun and exciting!
	dw DATA_CB2EBA					; 106 - You must find as many hidden treasures as you can!
	dw DATA_CB2EF5					; 108 - If you find a treasure, move Kirby to it and press ^.
	dw DATA_CB2F2E					; 10A - Push X to see the treasures you've found.
	dw DATA_CB2F64					; 10C - There are lots of treasures hidden in various places.
	dw DATA_CB2F92					; 10E - There are a total of 60 treasures. How many can you find? Let's see...
	dw DATA_CB2FE8					; 110 - ...whoops!
	
	dw DATA_CB3026					; 112 - Is this your first time playing MILKY WAY WISHES?
	dw DATA_CB3074					; 114 - You can't copy enemies' abilities in this game.
	dw DATA_CB30D0					; 116 - Don't worry. There is a better way to do it!
	dw DATA_CB3132					; 118 - It's called the Deluxe copy ability.
	dw DATA_CB3159					; 11A - By touching the Deluxe copy cahracters, Kirby aquires the ability FOREVER!
	dw DATA_CB3183					; 11C - You can select acquired abilities by presssing START.
	dw DATA_CB31B3					; 11E - There is no limit for using abilities.
	dw DATA_CB31DD					; 120 - Use them as much as you want.
	dw DATA_CB3201					; 122 - You can select different abilities during play. Press X (or L and R) to cycle through.
	dw DATA_CB322B					; 124 - If you come to a dead end and can't break trhough, you must find another hidden ability.
	dw DATA_CB324E					; 126 - Now this is the final game...
	dw DATA_CB328A					; 128 - ... so concentrate and do your best!
	dw DATA_CB32D9					; 12A - Y button makes kirby suck up an enemy,
	dw DATA_CB3300					; 12C - Attack an enemy by spitting it out!
	dw DATA_CB333B					; 12E - B button makes kirby jump,
	dw DATA_CB335F					; 130 - Continue to push, kirby can fly!
	dw DATA_CB338E					; 132 - Push Y to inhale enemies.
	dw DATA_CB33C6					; 134 - Push A to swallow enemies with special abilities.
	dw DATA_CB33FE					; 136 - The A button will also create a helper who can use Kirby's abilities!
	dw DATA_CB3414					; 138 - Beat King Dedede to the goal!
	dw DATA_CB3446					; 13A - Collect points by eating as much food as you can!
	dw DATA_CB3462					; 13C - Look for hidden treasures!
	dw DATA_CB3478					; 13E - Save your progress in the log cabins!
	dw DATA_CB347C					; 140 - Find the Deluxe copy ability characters and...
	dw DATA_CB3480					; 142 - you'll be able to use those abilities FOREVER!
	dw DATA_CB3484					; 144 - 
	dw DATA_CB3488					; 146 - 
	dw DATA_CB34B5					; 148 - 
	dw DATA_CB34BA					; 14A - 
	dw DATA_CB34CA					; 14C - 
	dw DATA_CB34D0					; 14E - 
	dw DATA_CB34D9					; 150 - 
	dw DATA_CB34DE					; 152 - 
	dw DATA_CB34EA					; 154 - 
	dw DATA_CB34F7					; 156 - 
	dw DATA_CB3503					; 158 - 
	dw DATA_CB3510					; 15A - 
	dw DATA_CB351F					; 15C - 
	dw DATA_CB3529					; 15E - 
	dw DATA_CB3536					; 160 - 
	dw DATA_CB3543					; 162 - 
	dw DATA_CB3550					; 164 - 
	dw DATA_CB3557					; 166 - 
	dw DATA_CB3561					; 168 - 
	dw DATA_CB356C					; 16A - 
	dw DATA_CB3579					; 16C - 
	dw DATA_CB357D					; 16E - 
	dw DATA_CB3589					; 170 - 
	dw DATA_CB3596					; 172 - 
	dw DATA_CB35A1					; 174 - 
	dw DATA_CB35AF					; 176 - 
	dw DATA_CB35B9					; 178 - 
	dw DATA_CB35C0					; 17A - 
	dw DATA_CB35CB					; 17C - 
	dw DATA_CB35D6					; 17E - 
	dw DATA_CB35E4					; 180 - 
	dw DATA_CB35F1					; 182 - 
	dw DATA_CB3600					; 184 - 
	dw DATA_CB3609					; 186 - 
	dw DATA_CB360F					; 188 - 
	dw DATA_CB361A					; 18A - 
	dw DATA_CB3627					; 18C - 
	dw DATA_CB3634					; 18E - 
	dw DATA_CB3643					; 190 - 
	dw DATA_CB364E					; 192 - 
	dw DATA_CB3659					; 194 - 
	dw DATA_CB3664					; 196 - 
	dw DATA_CB366F					; 198 - 
	dw DATA_CB367D					; 19A - 
	dw DATA_CB3688					; 19C - 
	dw DATA_CB3691					; 19E - 
	dw DATA_CB369C					; 1A0 - 
	dw DATA_CB36A6					; 1A2 - 
	dw DATA_CB36B4					; 1A4 - 
	dw DATA_CB36C1					; 1A6 - 
	dw DATA_CB36C6					; 1A8 - 
	dw DATA_CB36D4					; 1AA - 
	dw DATA_CB36E2					; 1AC - 
	dw DATA_CB36ED					; 1AE - 
	dw DATA_CB36F3					; 1B0 - 
	dw DATA_CB36FE					; 1B2 - 
	dw DATA_CB3707					; 1B4 - 
	dw DATA_CB3712					; 1B6 - 
	dw DATA_CB3719					; 1B8 - 
	dw DATA_CB3726					; 1BA - 
	dw DATA_CB372F					; 1BC - 
	dw DATA_CB3739					; 1BE - 
	dw DATA_CB3743					; 1C0 - 
	dw DATA_CB3750					; 1C2 - 
	dw DATA_CB375D					; 1C4 - 
	dw DATA_CB376A					; 1C6 - 
	dw DATA_CB3777					; 1C8 - 
	dw DATA_CB3784					; 1CA - 
	dw DATA_CB3791					; 1CC - 
	dw DATA_CB379E					; 1CE - 
	dw DATA_CB37AB					; 1D0 - 
	dw DATA_CB37B8					; 1D2 - 
	dw DATA_CB37C5					; 1D4 - 
	dw DATA_CB37D2					; 1D6 - 
	dw DATA_CB37DF					; 1D8 - 
	dw DATA_CB37EC					; 1DA - 
	dw DATA_CB37F9					; 1DC - 
	dw DATA_CB3806					; 1DE - 
	dw DATA_CB3813					; 1E0 - 
	dw DATA_CB3820					; 1E2 - 
	dw DATA_CB382D					; 1E4 - 
	dw DATA_CB383A					; 1E6 - 
	dw DATA_CB3847					; 1E8 - 
	dw DATA_CB3854					; 1EA - 
	dw DATA_CB3861					; 1EC - 
	dw DATA_CB386E					; 1EE - 
	dw DATA_CB387B					; 1F0 - 
	dw DATA_CB3888					; 1F2 - 
	dw DATA_CB3895					; 1F4 - 
	dw DATA_CB38A2					; 1F6 - 
	dw DATA_CB38AF					; 1F8 - 
	dw DATA_CB38BC					; 1FA - 
	dw DATA_CB38C9					; 1FC - 
	dw DATA_CB38D6					; 1FE - 
	dw DATA_CB38E3					; 200 - 
	dw DATA_CB38F0					; 202 - 
	dw DATA_CB38FD					; 204 - 
	dw DATA_CB390A					; 206 - 
	dw DATA_CB3917					; 208 - 
	dw DATA_CB3924					; 20A - 
	dw DATA_CB3931					; 20C - 
	dw DATA_CB393E					; 20E - 
	dw DATA_CB394B					; 210 - 
	dw DATA_CB3958					; 212 - 
	dw DATA_CB3965					; 214 - 
	dw DATA_CB3972					; 216 - 
	dw DATA_CB397F					; 218 - 
	dw DATA_CB398C					; 21A - 
	dw DATA_CB3999					; 21C - 
	dw DATA_CB39A6					; 21E - 
	dw DATA_CB39B3					; 220 - 
	dw DATA_CB39C0					; 222 - 
	dw DATA_CB39CD					; 224 - 
	dw DATA_CB39DA					; 226 - 
	dw DATA_CB39E7					; 228 - 
	dw DATA_CB39F4					; 22A - 
	dw DATA_CB3A01					; 22C - 
	dw DATA_CB3A0E					; 22E - 
	dw DATA_CB3A1B					; 230 - 
	dw DATA_CB3A28					; 232 - 
	dw DATA_CB3A35					; 234 - 
	dw DATA_CB3A42					; 236 - 
	dw DATA_CB3A4F					; 238 - 
	dw DATA_CB3A56					; 23A - 
	dw DATA_CB3A64					; 23C - 
	dw DATA_CB3A71					; 23E - 
	dw DATA_CB3A7E					; 240 - 
	dw DATA_CB3A8B					; 242 - 
	dw DATA_CB3A98					; 244 - 
	dw DATA_CB3AA5					; 246 - 
	dw DATA_CB3AB2					; 248 - 
	dw DATA_CB3ABF					; 24A - 
	dw DATA_CB3ACC					; 24C - 
	dw DATA_CB3AD9					; 24E - 
	dw DATA_CB3AE6					; 250 - 
	dw DATA_CB3AF3					; 252 - 
	dw DATA_CB3B00					; 254 - 
	dw DATA_CB3B0D					; 256 - 
	dw DATA_CB3B1A					; 258 - 
	dw DATA_CB3B27					; 25A - 
	dw DATA_CB3B34					; 25C - 
	dw DATA_CB3B41					; 25E - 
	dw DATA_CB3B4E					; 260 - 
	dw DATA_CB3B5B					; 262 - 
	dw DATA_CB3B68					; 264 - 
	dw DATA_CB3B75					; 266 - 
	dw DATA_CB3B82					; 268 - 
	dw DATA_CB3B8F					; 26A - 
	dw DATA_CB3B9C					; 26C - 
	dw DATA_CB3BA9					; 26E - 
	dw DATA_CB3BB6					; 270 - 
	dw DATA_CB3BC3					; 272 - 
	dw DATA_CB3BD0					; 274 - 
	dw DATA_CB3BDD					; 276 - 
	dw DATA_CB3BEA					; 278 - 
	dw DATA_CB3BF7					; 27A - 
	dw DATA_CB3C04					; 27C - 
	dw DATA_CB3C11					; 27E - 
	dw DATA_CB3C1E					; 280 - 
	dw DATA_CB3C2B					; 282 - 
	dw DATA_CB3C38					; 284 - 
	dw DATA_CB3C45					; 286 - 
	dw DATA_CB3C52					; 288 - 
	dw DATA_CB3C5F					; 28A - 
	dw DATA_CB3C6C					; 28C - 
	dw DATA_CB3C79					; 28E - 
	dw DATA_CB3C86					; 290 - 
	dw DATA_CB3C93					; 292 - 
	dw DATA_CB3CA0					; 294 - 
	dw DATA_CB3CAD					; 296 - 
	dw DATA_CB3CBA					; 298 - 
	dw DATA_CB3CC7					; 29A - 
	dw DATA_CB3CD4					; 29C - 
	dw DATA_CB3CE1					; 29E - 
	dw DATA_CB3CEE					; 2A0 - 
	dw DATA_CB3CFB					; 2A2 - 
	dw DATA_CB3D08					; 2A4 - 
	dw DATA_CB3D15					; 2A6 - 
	dw DATA_CB3D22					; 2A8 - 
	dw DATA_CB3D2F					; 2AA - 
	dw DATA_CB3D3C					; 2AC - 
	dw DATA_CB3D49					; 2AE - 
	dw DATA_CB3D56					; 2B0 - 
	dw DATA_CB3D63					; 2B2 - 
	dw DATA_CB3D70					; 2B4 - 
	dw DATA_CB3D7C					; 2B6 - 
	dw DATA_CB3D9B					; 2B8 - 
	dw DATA_CB3DB4					; 2BA - 
	dw DATA_CB3DC1					; 2BC - 
	dw DATA_CB3DCC					; 2BE - 
	dw DATA_CB3DD7					; 2C0 - 
	dw DATA_CB3DE2					; 2C2 - 
	dw DATA_CB3DED					; 2C4 - 
	dw DATA_CB3DF8					; 2C6 - 
	dw DATA_CB3E03					; 2C8 - 
	dw DATA_CB3E0E					; 2CA - 
	dw DATA_CB3E19					; 2CC - 
	dw DATA_CB3E24					; 2CE - 
	dw DATA_CB3E2F					; 2D0 - 
	dw DATA_CB3E3A					; 2D2 - 
	dw DATA_CB3E45					; 2D4 - 
	dw DATA_CB3E50					; 2D6 - 
	dw DATA_CB3E5B					; 2D8 - 
	dw DATA_CB3E66					; 2DA - 
	dw DATA_CB3E71					; 2DC - 
	dw DATA_CB3E7C					; 2DE - 
	dw DATA_CB3E87					; 2E0 - 
	dw DATA_CB3E92					; 2E2 - 
	dw DATA_CB3E9D					; 2E4 - 
	dw DATA_CB3EA8					; 2E6 - 
	dw DATA_CB3EB3					; 2E8 - 
	dw DATA_CB3EBE					; 2EA - 
	dw DATA_CB3EC9					; 2EC - 
	dw DATA_CB3ED4					; 2EE - 
	dw DATA_CB3EDF					; 2F0 - 
	dw DATA_CB3EEA					; 2F2 - 
	dw DATA_CB3EF5					; 2F4 - 
	dw DATA_CB3F00					; 2F6 - 
	dw DATA_CB3F0B					; 2F8 - 
	dw DATA_CB3F16					; 2FA - 
	dw DATA_CB3F21					; 2FC - 
	dw DATA_CB3F2C					; 2FE - 
	dw DATA_CB3F37					; 300 - 
	dw DATA_CB3F42					; 302 - 
	dw DATA_CB3F4D					; 304 - 
	dw DATA_CB3F58					; 306 - 
	dw DATA_CB3F63					; 308 - 
	dw DATA_CB3F6E					; 30A - 
	dw DATA_CB3F79					; 30C - 
	dw DATA_CB3F84					; 30E - 
	dw DATA_CB3F8F					; 310 - 
	dw DATA_CB3F9A					; 312 - 
	dw DATA_CB3FA5					; 314 - 
	dw DATA_CB3FB0					; 316 - 
	dw DATA_CB3FBB					; 318 - 
	dw DATA_CB3FC6					; 31A - 
	dw DATA_CB3FD1					; 31C - 
	dw DATA_CB3FDC					; 31E - 
	dw DATA_CB3FE7					; 320 - 
	dw DATA_CB3FF2					; 322 - 
	dw DATA_CB3FFD					; 324 - 
	dw DATA_CB4008					; 326 - 
	dw DATA_CB4013					; 328 - 
	dw DATA_CB401E					; 32A - 
	dw DATA_CB4029					; 32C - 
	dw DATA_CB4034					; 32E - 
	dw DATA_CB403F					; 330 - 
	dw DATA_CB404A					; 332 - 
	dw DATA_CB4055					; 334 - 
	dw DATA_CB4072					; 336 - 
	dw DATA_CB4076					; 338 - 
	dw DATA_CB408D					; 33A - 
	dw DATA_CB4093					; 33C - 
	dw DATA_CB409A					; 33E - 
	dw DATA_CB40A7					; 340 - 
	dw DATA_CB40AF					; 342 - 
	dw DATA_CB40B6					; 344 - 
	dw DATA_CB40BD					; 346 - 
	dw DATA_CB40CA					; 348 - 
	dw DATA_CB40D1					; 34A - 
	dw DATA_CB40D8					; 34C - 
	dw DATA_CB40DF					; 34E - 
	dw DATA_CB40E6					; 350 - 
	dw DATA_CB40ED					; 352 - 
	dw DATA_CB40F4					; 354 - 
	dw DATA_CB40FB					; 356 - 
	dw DATA_CB4102					; 358 - 
	dw DATA_CB4109					; 35A - 
	dw DATA_CB4110					; 35C - 
	dw DATA_CB4117					; 35E - 
	dw DATA_CB411E					; 360 - 
	dw DATA_CB4125					; 362 - 
	dw DATA_CB412C					; 364 - 
	dw DATA_CB4133					; 366 - 
	dw DATA_CB413A					; 368 - 
	dw DATA_CB4189					; 36A - 
	dw DATA_CB41DE					; 36C - 
	dw DATA_CB4237					; 36E - 
	dw DATA_CB42B7					; 370 - 
	dw DATA_CB43C1					; 372 - 
	dw DATA_CB4424					; 374 - 
	dw DATA_CB44BC					; 376 - 
	dw DATA_CB4576					; 378 - 
	dw DATA_CB45FD					; 37A - 
	dw DATA_CB4677					; 37C - 
	dw DATA_CB472F					; 37E - 
	dw DATA_CB478E					; 380 - 
	dw DATA_CB47F7					; 382 - 
	dw DATA_CB48B0					; 384 - 
	dw DATA_CB48F5					; 386 - 
	dw DATA_CB4981					; 388 - 
	dw DATA_CB4A32					; 38A - 
	dw DATA_CB4AC9					; 38C - 
	dw DATA_CB4B20					; 38E - 
	dw DATA_CB4BE0					; 390 - 
	dw DATA_CB4C76					; 392 - 
	dw DATA_CB4D1F					; 394 - 
	dw DATA_CB4DDB					; 396 - 
	dw DATA_CB4E63					; 398 - 
	dw DATA_CB4F4B					; 39A - 
	dw DATA_CB503A					; 39C - 
	dw DATA_CB50B9					; 39E - 
	dw DATA_CB5143					; 3A0 - 
	dw DATA_CB5238					; 3A2 - 
	dw DATA_CB535E					; 3A4 - 
	dw DATA_CB53B3					; 3A6 - 
	dw DATA_CB5409					; 3A8 - 
	dw DATA_CB5451					; 3AA - 
	dw DATA_CB5479					; 3AC - 
	dw DATA_CB5494					; 3AE - 
	dw DATA_CB54AF					; 3B0 - 
	dw DATA_CB54B9					; 3B2 - 
	dw DATA_CB54C3					; 3B4 - 
	dw DATA_CB54CD					; 3B6 - 
	dw DATA_CB54D8					; 3B8 - 
	dw DATA_CB54E9					; 3BA - 
	dw DATA_CB54FA					; 3BC - 
	dw DATA_CB5509					; 3BE - 
	dw DATA_CB5517					; 3C0 - 
	dw DATA_CB5524					; 3C2 - 
	dw DATA_CB5532					; 3C4 - 
	dw DATA_CB5543					; 3C6 - 
	dw DATA_CB5553					; 3C8 - 
	dw DATA_CB555F					; 3CA - 
	dw DATA_CB556E					; 3CC - 
	dw DATA_CB557F					; 3CE - 
	dw DATA_CB558E					; 3D0 - 
	dw DATA_CB559D					; 3D2 - 
	dw DATA_CB55A8					; 3D4 - 
	dw DATA_CB55BA					; 3D6 - 
	dw DATA_CB55C5					; 3D8 - 
	dw DATA_CB55D5					; 3DA - 
	dw DATA_CB55E7					; 3DC - 
	dw DATA_CB55F7					; 3DE - 
	dw DATA_CB5608					; 3E0 - 
	dw DATA_CB561B					; 3E2 - 
	dw DATA_CB562D					; 3E4 - 
	dw DATA_CB563A					; 3E6 - 
	dw DATA_CB5647					; 3E8 - 
	dw DATA_CB565A					; 3EA - 
	dw DATA_CB5668					; 3EC - 
	dw DATA_CB5675					; 3EE - 
	dw DATA_CB5686					; 3F0 - 
	dw DATA_CB5695					; 3F2 - 
	dw DATA_CB56A8					; 3F4 - 
	dw DATA_CB56B7					; 3F6 - 
	dw DATA_CB56C5					; 3F8 - 
	dw DATA_CB56D6					; 3FA - 
	dw DATA_CB56E4					; 3FC - 
	dw DATA_CB56F6					; 3FE - 
	dw DATA_CB5705					; 400 - 
	dw DATA_CB5714					; 402 - 
	dw DATA_CB5723					; 404 - 
	dw DATA_CB5737					; 406 - 
	dw DATA_CB5743					; 408 - 
	dw DATA_CB574F					; 40A - 
	dw DATA_CB575F					; 40C - 
	dw DATA_CB5776					; 40E - 
	dw DATA_CB5783					; 410 - 
	dw DATA_CB5797					; 412 - 
	dw DATA_CB57A4					; 414 - 
	dw DATA_CB57B9					; 416 - 
	dw DATA_CB57C8					; 418 - 
	dw DATA_CB57DB					; 41A - 
	dw DATA_CB57E8					; 41C - 
	dw DATA_CB57F8					; 41E - 
	dw DATA_CB580B					; 420 - 
	dw DATA_CB5816					; 422 - 
	dw DATA_CB5822					; 424 - 
	dw DATA_CB5835					; 426 - 
	dw DATA_CB5A5E					; 428 - 
	dw DATA_CB5D5E					; 42A - 
	dw DATA_CB5D73					; 42C - 
	dw DATA_CB5D98					; 42E - 
	dw DATA_CB5DBC					; 430 - 
	dw DATA_CB5DEA					; 432 - 
	dw DATA_CB5E2B					; 434 - 
	
	;$CB134E - Substrings for the computer battle text.
	dw DATA_CB5E48					; 436 - ???
	dw DATA_CB5E66					; 438 - ???
	dw DATA_CB5E6C					; 43A - ???
	dw DATA_CB5E72					; 43C - Slime
	dw DATA_CB5E7C					; 43E - Dancing Doll
	dw DATA_CB5E8D					; 440 - Witch
	dw DATA_CB5E97					; 442 - Evil Knight
	dw DATA_CB5EA7					; 444 - Red Dragon
	dw DATA_CB5EB6					; 446 - Kirby
	dw DATA_CB5EC0					; 448 - Kirby & Co.
	dw DATA_CB5ED0					; 44A - SirKibble
	dw DATA_CB5EDE					; 44C - Waddle Doo
	dw DATA_CB5EED					; 44E - Gim
	dw DATA_CB5EF5					; 450 - Bio Spark
	dw DATA_CB5F03					; 452 - Knuckle Joe
	dw DATA_CB5F13					; 454 - Burnin Leo
	dw DATA_CB5F22					; 456 - Birdon
	dw DATA_CB5F2D					; 458 - Blade Knight
	dw DATA_CB5F3E					; 45A - Capsule J
	dw DATA_CB5F4C					; 45C - Plasma wisp
	dw DATA_CB5F5C					; 45E - Poppy bros.Jr.
	dw DATA_CB5F6F					; 460 - Wheelie
	dw DATA_CB5F7B					; 462 - Bugzzy
	dw DATA_CB5F86					; 464 - Rocky
	dw DATA_CB5F90					; 466 - Parasol Waddle Dee
	dw DATA_CB5FA7					; 468 - Bonker
	dw DATA_CB5FB3					; 46A - Chilly
	dw DATA_CB5FBE					; 46C - Simirror
	dw DATA_CB5FCB					; 46E - T.A.C.
	dw DATA_CB5FD6					; 470 - Cutter
	dw DATA_CB5FDD					; 472 - Beam
	dw DATA_CB5FE2					; 474 - Yoyo
	dw DATA_CB5FE7					; 476 - Ninja
	dw DATA_CB5FED					; 478 - Fighter
	dw DATA_CB5FF5					; 47A - Fire
	dw DATA_CB5FFA					; 47C - Wing
	dw DATA_CB5FFF					; 47E - Sword
	dw DATA_CB6005					; 480 - Jet
	dw DATA_CB6009					; 482 - Plasma
	dw DATA_CB6010					; 484 - Bomb
	dw DATA_CB6015					; 486 - Wheel
	dw DATA_CB601B					; 488 - Suplex
	dw DATA_CB6022					; 48A - Stone
	dw DATA_CB6028					; 48C - Parasol
	dw DATA_CB6030					; 48E - Hammer
	dw DATA_CB6037					; 490 - Ice
	dw DATA_CB603B					; 492 - Mirror
	dw DATA_CB6042					; 494 - Copy
	dw DATA_CB6047					; 496 - _appears!
	dw DATA_CB6051					; 498 - _attacks!
	dw DATA_CB605B					; 49A - avoids the attack!
	dw DATA_CB606E					; 49C - 's hurt!
	dw DATA_CB6077					; 49E - _are hurt!
	dw DATA_CB6082					; 4A0 - ???
	dw DATA_CB609F					; 4A2 - _is defeated!
	dw DATA_CB60AD					; 4A4 - _ability.
	dw DATA_CB60B7					; 4A6 - But,  nothing happens.
	dw DATA_CB60CE					; 4A8 - First attack by_
	dw DATA_CB60DF					; 4AA - _attack!
	dw DATA_CB60E8					; 4AC - avoid the attack!
	dw DATA_CB60FA					; 4AE - are hurt!/???
	dw DATA_CB6104					; 4B0 - ???
	dw DATA_CB6108					; 4B2 - ???
	dw DATA_CB610C					; 4B4 - ???
	dw DATA_CB6110					; 4B6 - ???
	dw DATA_CB6114					; 4B8 - ???
	dw DATA_CB6118					; 4BA - ???
	dw DATA_CB611C					; 4BC - ???
	dw DATA_CB6120					; 4BE - ???
	dw DATA_CB6124					; 4C0 - ???
	dw DATA_CB6128					; 4C2 - You earned ??
	dw DATA_CB6139					; 4C4 - defeats all enemies!
	dw DATA_CB614E					; 4C6 - defeat all enemies!

	;$CB13E0 - Primary Computer Virus battle text.
	dw DATA_CB6162					; 4C8 - Slime appears!
	dw DATA_CB6173					; 4CA - Dancing Doll appears!
	dw DATA_CB6184					; 4CC - Witch appears!
	dw DATA_CB6195					; 4CE - Evil Knight appears!
	dw DATA_CB61A6					; 4D0 - Red Dragon appears!
	dw DATA_CB61B7					; 4D2 - First attack by Slime!
	dw DATA_CB61CA					; 4D4 - First attack by Dancing Doll!
	dw DATA_CB61DE					; 4D6 - First attack by Witch!
	dw DATA_CB61F1					; 4D8 - First attack by Evil Knight!
	dw DATA_CB6205					; 4DA - First attack by Red Dragon!
	dw DATA_CB6219					; 4DC - Slime attacks!
	dw DATA_CB622A					; 4DE - Dancing Doll attacks!
	dw DATA_CB623B					; 4E0 - Witch attacks!
	dw DATA_CB624C					; 4E2 - Evil Knight attacks!
	dw DATA_CB625D					; 4E4 - Red Dragon attacks!
	dw DATA_CB626E					; 4E6 - Kirby attacks!
	dw DATA_CB627F					; 4E8 - Kirby & Co. attack!
	dw DATA_CB6290					; 4EA - Kirby avoids the attack!
	dw DATA_CB62A2					; 4EC - Kirby & Co. avoid the attack!
	dw DATA_CB62B4					; 4EE - Kirby regains his power!
	dw DATA_CB62D5					; 4F0 - Kirby & Co. regain their power!
	dw DATA_CB62F7					; 4F2 - Kirby's hurt!
	dw DATA_CB6308					; 4F4 - SirKibble's hurt!
	dw DATA_CB6319					; 4F6 - Waddle Doo's hurt!
	dw DATA_CB632A					; 4F8 - Gim's hurt!
	dw DATA_CB633B					; 4FA - Bio Spark's hurt!
	dw DATA_CB634C					; 4FC - Knuckle Joe's hurt!
	dw DATA_CB635D					; 4FE - Burnin Leo's hurt!
	dw DATA_CB636E					; 500 - Birdon's hurt!
	dw DATA_CB637F					; 502 - Blade Knight's hurt!
	dw DATA_CB6390					; 504 - Capsule J's hurt!
	dw DATA_CB63A1					; 506 - Plasma wisp's hurt!
	dw DATA_CB63B2					; 508 - Poppy bros.Jr.'s hurt!
	dw DATA_CB63C3					; 50A - Wheelie's hurt!
	dw DATA_CB63D4					; 50C - Bugzzy's hurt!
	dw DATA_CB63E5					; 50E - Rocky's hurt!
	dw DATA_CB63F6					; 510 - Parasol Waddle Dee's hurt!
	dw DATA_CB640C					; 512 - Bonker's hurt!
	dw DATA_CB641D					; 514 - Chilly's hurt!
	dw DATA_CB642E					; 516 - Simirror's hurt!
	dw DATA_CB643F					; 518 - T.A.C.'s hurt!
	dw DATA_CB6450					; 51A - Helper has disappeared!
	dw DATA_CB6470					; 51C - Kirby & SirKibble are hurt!
	dw DATA_CB6489					; 51E - Kirby & Waddle Doo are hurt!
	dw DATA_CB64A2					; 520 - Kirby & Gim are hurt!
	dw DATA_CB64BB					; 522 - Kirby & Bio Spark are hurt!
	dw DATA_CB64D4					; 524 - Kirby & Knuckle Joe are hurt!
	dw DATA_CB64ED					; 526 - Kirby & Burnin Leo are hurt!
	dw DATA_CB6506					; 528 - Kirby & Birdon are hurt!
	dw DATA_CB651F					; 52A - Kirby & Blade Knight are hurt!
	dw DATA_CB6538					; 52C - Kirby & Capsule J are hurt!
	dw DATA_CB6551					; 52E - Kirby & Plasma wisp are hurt!
	dw DATA_CB656A					; 530 - Kirby & Poppy bros.Jr. are hurt!
	dw DATA_CB6583					; 532 - Kirby & Wheelie are hurt!
	dw DATA_CB659C					; 534 - Kirby & Bugzzy are hurt!
	dw DATA_CB65B5					; 536 - Kirby & Rocky are hurt!
	dw DATA_CB65CE					; 538 - Kirby & Parasol Waddle Dee are hurt!
	dw DATA_CB65F9					; 53A - Kirby & Bonkers are hurt!
	dw DATA_CB6612					; 53C - Kirby & Chilly are hurt!
	dw DATA_CB662B					; 53E - Kirby & Simirror are hurt!
	dw DATA_CB6644					; 540 - Kirby & T.A.C. are hurt!
	dw DATA_CB665D					; 542 - Slime is defeated!
	dw DATA_CB666E					; 544 - Dancing Doll is defeated!
	dw DATA_CB667F					; 546 - Witch is defeated!
	dw DATA_CB6690					; 548 - Evil Knight is defeated!
	dw DATA_CB66A1					; 54A - Red Dragon is defeated!
	dw DATA_CB66B2					; 54C - Kirby defeats all enemies!
	dw DATA_CB66C4					; 54E - Kirby & [Co.] defeat all enemies!
	dw DATA_CB66D6					; 550 - You earned X Courage points!
	dw DATA_CB66F2					; 552 - You earned X Greediness points!
	dw DATA_CB6711					; 554 - You earned X Humor points!
	dw DATA_CB672B					; 556 - You earned X Exam score points!
	dw DATA_CB674A					; 558 - You earned X Ambition points!
	dw DATA_CB6767					; 55A - You earned X Appetite points!
	dw DATA_CB6784					; 55C - You earned X Fever points!
	dw DATA_CB679E					; 55E - You earned X Tenderness points!
	dw DATA_CB67BD					; 560 - You earned 2 Beauty points!
	dw DATA_CB67D8					; 562 - You earned 2 Honesty points!
	dw DATA_CB67F4					; 564 - You earned 2 Happy Smile points!
	dw DATA_CB6814					; 566 - You earned 3 Love points!
	dw DATA_CB682D					; 568 - You earned 3 Friendship points!
	dw DATA_CB684C					; 56A - You earned X experience points.
	dw DATA_CB6878					; 56C - Kirby takes a "time-out!"
	dw DATA_CB6899					; 56E - Kirby gets Cutter ability.
	dw DATA_CB68B5					; 570 - Kirby gets Beam ability.
	dw DATA_CB68D0					; 572 - Kirby gets Yoyo ability.
	dw DATA_CB68EB					; 574 - Kirby becames a Ninja!
	dw DATA_CB6909					; 576 - Kirby gets Fighter ability.
	dw DATA_CB6925					; 578 - Kirby gets Fire ability.
	dw DATA_CB6940					; 57A - Kirby gets Wing ability.
	dw DATA_CB695B					; 57C - Kirby gets Sword ability.
	dw DATA_CB6977					; 57E - Kirby gets Jet ability.
	dw DATA_CB6992					; 580 - Kirby gets Plasma ability.
	dw DATA_CB69AE					; 582 - Kirby gets Bomb ability.
	dw DATA_CB69C9					; 584 - Kirby gets Wheel ability.
	dw DATA_CB69E5					; 586 - Kirby learns Suplex!
	dw DATA_CB6A00					; 588 - Kirby gets Stone ability.
	dw DATA_CB6A1C					; 58A - Kirby holds a Parasol!
	dw DATA_CB6A38					; 58C - Kirby holds a Hammer!
	dw DATA_CB6A53					; 58E - Kirby gets Ice ability.
	dw DATA_CB6A6E					; 590 - Kirby gets Mirror ability.
	dw DATA_CB6A8A					; 592 - Kirby gets Copy ability.
	dw DATA_CB6AA5					; 594 - X damage points given to Slime!
	dw DATA_CB6AB8					; 596 - X damage points given to Dancing Doll!
	dw DATA_CB6ACB					; 598 - X damage points given to Witch!
	dw DATA_CB6ADE					; 59A - X damage points given to Evil Knight!
	dw DATA_CB6AF1					; 59C - X damage points given to Red Dragon!
	dw DATA_CB6B04					; 59E - Slime attacks!
	dw DATA_CB6B15					; 5A0 - Slime's sleeping...
	dw DATA_CB6B31					; 5A2 - Slime tries to escape. [beat] But, nothing happens.
	dw DATA_CB6B59					; 5A4 - Slime calls his gang! [beat] But, nothing happens.
	dw DATA_CB6B80					; 5A6 - Slime trips.
	dw DATA_CB6B95					; 5A8 - Dancing Doll attacks!
	dw DATA_CB6BA6					; 5AA - Dancing Doll's very proud! [beat] But, nothing happens.
	dw DATA_CB6BCC					; 5AC - Dancing Doll's dancing... [beat] But, nothing happens.
	dw DATA_CB6BF0					; 5AE - Dancing Doll's running around... [beat] But, nothing happens.
	dw DATA_CB6C1B					; 5B0 - Dancing Doll casts a spell! [beat] But, nothing happens.
	dw DATA_CB6C42					; 5B2 - Dancing Doll's crying! [beat] But, nothing happens.
	dw DATA_CB6C63					; 5B4 - Dancing Doll flips a nuclear missile switch! [beat] But, nothing happens.
	dw DATA_CB6C9C					; 5B6 - Dancing Doll's sleeping... [beat] But, nothing happens.
	dw DATA_CB6CC1					; 5B8 - Dancing Doll trips. [beat] But, nothing happens.
	dw DATA_CB6CDF					; 5BA - Witch attacks!
	dw DATA_CB6CF0					; 5BC - Witch casts a "fire spell!"
	dw DATA_CB6D13					; 5BE - Witch casts an "ice spell!"
	dw DATA_CB6D37					; 5C0 - Witch retreats.
	dw DATA_CB6D4E					; 5C2 - Evil Knight attacks!
	dw DATA_CB6D5F					; 5C4 - Evil Knight swings an axe!
	dw DATA_CB6D7B					; 5C6 - Evil Knight throws knives!
	dw DATA_CB6D97					; 5C8 - Evil Knight's eyes gleam!
	dw DATA_CB6DB2					; 5CA - Evil Knight stores energy! [beat] Attack power increases!
	dw DATA_CB6DEF					; 5CC - Evil Knight retreats.
	dw DATA_CB6E06					; 5CE - Red Dragon attacks!
	dw DATA_CB6E17					; 5D0 - Red Dragon blows flames!
	dw DATA_CB6E33					; 5D2 - Red Dragon scratches!
	dw DATA_CB6E4C					; 5D4 - Red Dragon flaps his wings!
	dw DATA_CB6E6B					; 5D6 - Red Dragon retreats.
	;$1694F0 - Computer Virus ends.
	dw DATA_CB6E82					; 5D8 - 
	dw DATA_CB6E99					; 5DA - 
	dw DATA_CB6E9E					; 5DC - 
	dw DATA_CB6EA1					; 5DE - 
	dw DATA_CB6EBC					; 5E0 - 
	dw DATA_CB6EC2					; 5E2 - 
	dw DATA_CB6EC6					; 5E4 - 
	dw DATA_CB6F10					; 5E6 - 
	dw DATA_CB6F97					; 5E8 - 
	dw DATA_CB7010					; 5EA - 
	dw DATA_CB704B					; 5EC - 
	dw DATA_CB7079					; 5EE - 
	dw DATA_CB7084					; 5F0 - 
	dw DATA_CB709E					; 5F2 - 
	dw DATA_CB70C8					; 5F4 - 
	dw DATA_CB70FB					; 5F6 - 
	dw DATA_CB7123					; 5F8 - 
	dw DATA_CB71ED					; 5FA - 
	dw DATA_CB720C					; 5FC - 
	dw DATA_CB7221					; 5FE - 
	dw DATA_CB7228					; 600 - 
	dw DATA_CB722D					; 602 - 
	dw DATA_CB7232					; 604 - 
	dw DATA_CB7238					; 606 - 
	dw DATA_CB7240					; 608 - 
	dw DATA_CB7245					; 60A - 
	dw DATA_CB724A					; 60C - 
	dw DATA_CB7250					; 60E - 
	dw DATA_CB7254					; 610 - 
	dw DATA_CB725B					; 612 - 
	dw DATA_CB7260					; 614 - 
	dw DATA_CB7266					; 616 - 
	dw DATA_CB726D					; 618 - 
	dw DATA_CB7273					; 61A - 
	dw DATA_CB727B					; 61C - 
	dw DATA_CB7282					; 61E - 
	dw DATA_CB7286					; 620 - 
	dw DATA_CB728D					; 622 - 
	dw DATA_CB7292					; 624 - 
	dw DATA_CB7297					; 626 - 
	dw DATA_CB729D					; 628 - 
	dw DATA_CB72A3					; 62A - 
	dw DATA_CB72A9					; 62C - 
	dw DATA_CB72AE					; 62E - 
	dw DATA_CB72BB					; 630 - 
	dw DATA_CB72C5					; 632 - 
	dw DATA_CB72D0					; 634 - 
	dw DATA_CB72D4					; 636 - 
	dw DATA_CB72DE					; 638 - 
	dw DATA_CB72EA					; 63A - 
	dw DATA_CB72F5					; 63C - 
	dw DATA_CB72FC					; 63E - 
	dw DATA_CB7309					; 640 - 
	dw DATA_CB7313					; 642 - 
	dw DATA_CB731F					; 644 - 
	dw DATA_CB732E					; 646 - 
	dw DATA_CB7336					; 648 - 
	dw DATA_CB733D					; 64A - 
	dw DATA_CB7343					; 64C - 
	dw DATA_CB735E					; 64E - 
	dw DATA_CB7366					; 650 - 
	dw DATA_CB736D					; 652 - 
	dw DATA_CB7376					; 654 - 
	dw DATA_CB737A					; 656 - 
	dw DATA_CB738F					; 658 - 
	dw DATA_CB73A4					; 65A - 
	dw DATA_CB73B6					; 65C - 
	dw DATA_CB73C8					; 65E - 
	dw DATA_CB73DA					; 660 - 
	dw DATA_CB73EF					; 662 - 
	dw DATA_CB7404					; 664 - 
	dw DATA_CB7416					; 666 - 
	dw DATA_CB7428					; 668 - 
	dw DATA_CB743A					; 66A - 
	dw DATA_CB744C					; 66C - 
	dw DATA_CB745E					; 66E - 
	dw DATA_CB7473					; 670 - 
	dw DATA_CB7485					; 672 - 
	dw DATA_CB7493					; 674 - 
	dw DATA_CB74A8					; 676 - 
	dw DATA_CB74BD					; 678 - 
	dw DATA_CB74CF					; 67A - 
	dw DATA_CB74E4					; 67C - 
	dw DATA_CB74F9					; 67E - 
	dw DATA_CB753C					; 680 - 
	dw DATA_CB7589					; 682 - 
	dw DATA_CB75AF					; 684 - 
	dw DATA_CB75D6					; 686 - 
	dw DATA_CB75FC					; 688 - 
	dw DATA_CB7625					; 68A - 
	dw DATA_CB764D					; 68C - 
	dw DATA_CB7677					; 68E - 
	dw DATA_CB7698					; 690 - 
	dw DATA_CB76B8					; 692 - 
	dw DATA_CB76CD					; 694 - 
	dw DATA_CB7710					; 696 - 
	dw DATA_CB7751					; 698 - 
	dw DATA_CB7795					; 69A - 
	dw DATA_CB77AA					; 69C - 
	dw DATA_CB781C					; 69E - 
	dw DATA_CB7831					; 6A0 - 
	dw DATA_CB78CB					; 6A2 - 
	
	
	
;- Actual text data begins -----------------------------------------------------------

DATA_CB15BC:						;$CB15BC	|
	db $11 : dl $000502 : dw $7FFF
	db $11 : dl $000506 : dw $0000
	db $08,$01
	db $05,$FF
	db $06,$00,$00
	db $01
	db $00

DATA_CB15D1:						;$CB15D1	|
	db $11 : dl $000502 : dw $7FFF
	db $11 : dl $000506 : dw $22C0
	db $08,$01
	db $05,$FF
	db $06,$00,$02
	db $01
	db $00
	
DATA_CB15E6:						;$CB15E6	|
	db $11 : dl $000502 : dw $7FFF
	db $11 : dl $000506 : dw $7D60
	db $08,$01
	db $05,$FF
	db $06,$00,$02
	db $01
	db $00
	
DATA_CB15FB:						;$CB15FB	|
	db $0D,$F0
	db $1D,$00
	db $01
	db $00
	
DATA_CB1601:						;$CB1601	|
	db $0D,$1E
	db $1D,$00
	db $01
	db $00
	
DATA_CB1607:						;$CB1607	|
	db $0D,$78
	db $1D,$00
	db $01
	db $00
	
DATA_CB160D:						;$CB160D	|
	db $0D,$B4
	db $1D,$00
	db $01
	db $00
	
DATA_CB1613:						;$CB1613	|
	db $0D,$F0
	db $1D,$00
	db $01
	db $00
	
DATA_CB1619:						;$CB1619	|
	db $0D,$1E
	db $12
	db $0C,$C0,$C0
	db $13
	db $01
	db $00
	
DATA_CB1622:						;$CB1622	|
	db $0D,$1E
	db $12
	db $07 : dw $C0C0
	db $0D,$B4
	db $07 : dw $0000
	db $13
	db $01
	db $00
	
DATA_CB1630:						;$CB1630	|
	db $0D,$5A
	db $12
	db $07 : dw $C0C0
	db $0D,$96
	db $07 : dw $0000
	db $13
	db $01
	db $00
	
DATA_CB163E:						;$CB163E	|
	db $0D,$78
	db $12
	db $07 : dw $C0C0
	db $0D,$78
	db $13
	db $07 : dw $0000
	db $01
	db $00
	
DATA_CB164C:						;$CB164C	|
	db $0D,$96
	db $12
	db $07 : dw $C0C0
	db $0D,$5A
	db $07 : dw $0000
	db $13,$01
	db $00
	
DATA_CB165A:						;$CB165A	|
	db $0D,$B4
	db $12
	db $07 : dw $C0C0
	db $0D,$1E
	db $07 : dw $0000
	db $13,$01
	db $00
	
DATA_CB1668:						;$CB1668	| Palette for the "is this your first time playing?" prompt.
	db $11 : dl $000502 : dw $7FFF	; (white)
	db $11 : dl $000506 : dw $7D60	; (light blue)
	db $08,$01
	db $05,$FF
	db $06,$00,$00,$01
	db $00
	
DATA_CB167D:						;$CB167D	| Yes/no prompt for the "first time playing?" message.
	db $03,$32,$40
	db "Yes       No"
	db $00
	
DATA_CB168D:						;$CB168D	|
	db $10 : dl $003076 : db $00
	db $10 : dl $003077 : db $43
	db $10 : dl $002132 : db $E0	; set fixed color to black?
	db $00
	
DATA_CB169D:						;$CB169D	|
	db $10 : dl $003076 : db $00
	db $10 : dl $003077 : db $00
	db $10 : dl $002132 : db $00	; do nothing to the fixed color...?
	db $00

DATA_CB16AD:						;$CB16AD	| Is this your first time playing? Yes       No
	db $0E : dl DATA_CB1668
	db "Is this your first time"
	db $02
	db "playing?"
	db $02
	db $0E : dl DATA_CB167D
	db $00
	
DATA_CB16D7:						;$CB16D7	|
	db $0E
	db $68,$16,$CB,$5F,$6E,$67,$72,$72
	db $20,$7D,$6B,$20,$6B,$7E,$76,$72
	db $67,$6F,$74,$02,$4A,$69,$75,$76
	db $7F,$4B,$34,$02,$0E,$7D,$16,$CB
	db $00,$0E,$D1,$15,$CB,$63,$6B,$72
	db $69,$75,$73,$6B,$20,$7A,$75,$02
	db $4A,$60,$6E,$6B,$20,$4E,$6B,$6D
	db $6F,$74,$74,$6B,$78,$2D,$79,$20
	db $5F,$6E,$75,$7D,$33,$4B,$02,$0E
	db $22,$16,$CB,$00,$0E,$D1,$15,$CB
	db $52,$75,$78,$20,$67,$72,$72,$20
	db $7F,$75,$7B,$20,$6C,$6F,$78,$79
	db $7A,$20,$7A,$6F,$73,$6B,$02,$76
	db $72,$67,$7F,$6B,$78,$79,$2B,$2B
	db $2B,$02,$0E,$22,$16,$CB,$00,$0E
	db $D1,$15,$CB,$6E,$6B,$78,$6B,$2D
	db $79,$20,$6E,$75,$7D,$20,$7D,$6B
	db $20,$76,$72,$67,$7F,$2B,$02,$0E
	db $22,$16,$CB,$00,$0E,$D1,$15,$CB
	db $60,$6E,$6F,$79,$20,$6F,$79,$20
	db $7A,$6E,$6B,$20,$69,$75,$74,$7A
	db $78,$75,$72,$72,$6B,$78,$2B,$02
	db $0E,$22,$16,$CB,$00,$0E,$D1,$15
	db $CB,$55,$7A,$2D,$79,$20,$7A,$6E
	db $67,$7A,$20,$6D,$78,$67,$7F,$20
	db $7A,$6E,$6F,$74,$6D,$20,$7D,$6F
	db $7A,$6E,$02,$7A,$6E,$6B,$20,$76
	db $7B,$78,$76,$72,$6B,$20,$68,$7B
	db $7A,$7A,$75,$74,$79,$2B,$02,$0E
	db $22,$16,$CB,$00,$0E,$D1,$15,$CB
	db $60,$6E,$6F,$79,$20,$6F,$79,$20
	db $57,$6F,$78,$68,$7F,$2C,$20,$75
	db $7B,$78,$20,$6E,$6B,$78,$75,$33
	db $02,$0E,$3E,$16,$CB,$00,$0E,$D1
	db $15,$CB,$54,$6B,$2D,$79,$20,$67
	db $20,$70,$75,$72,$72,$7F,$20,$6C
	db $6B,$72,$72,$75,$7D,$33,$02,$0E
	db $22,$16,$CB,$00,$0E,$D1,$15,$CB
	db $59,$75,$7C,$6B,$20,$57,$6F,$78
	db $68,$7F,$20,$72,$6B,$6C,$7A,$20
	db $67,$74,$6A,$20,$78,$6F,$6D,$6E
	db $7A,$02,$68,$7F,$20,$76,$78,$6B
	db $79,$79,$6F,$74,$6D,$20,$45,$20
	db $67,$74,$6A,$20,$46,$20,$75,$74
	db $02,$7A,$6E,$6B,$20,$3F,$20,$4F
	db $75,$74,$7A,$78,$75,$72,$20,$5C
	db $67,$6A,$2B,$02,$00,$0E,$D1,$15
	db $CB,$4F,$2D,$73,$75,$74,$33,$20
	db $53,$6F,$7C,$6B,$20,$6F,$7A,$20
	db $67,$20,$7A,$78,$7F,$33,$02,$00
	db $0E,$D1,$15,$CB,$65,$75,$7B,$20
	db $7D,$75,$74,$2D,$7A,$20,$67,$69
	db $69,$75,$73,$76,$72,$6F,$79,$6E
	db $02,$67,$74,$7F,$7A,$6E,$6F,$74
	db $6D,$20,$70,$7B,$79,$7A,$20,$79
	db $6F,$7A,$7A,$6F,$74,$6D,$02,$7A
	db $6E,$6B,$78,$6B,$2B,$02,$0E,$07
	db $16,$CB,$00,$0E,$D1,$15,$CB,$63
	db $6E,$6B,$74,$20,$7F,$75,$7B,$20
	db $79,$6B,$6B,$20,$67,$20,$6A,$75
	db $75,$78,$2B,$2B,$2B,$02,$0E,$07
	db $16,$CB,$00,$0E,$D1,$15,$CB,$5C
	db $7B,$79,$6E,$20,$43,$20,$75,$74
	db $20,$7A,$6E,$6B,$20,$3F,$20,$4F
	db $75,$74,$7A,$78,$75,$72,$02,$5C
	db $67,$6A,$2B,$20,$60,$6E,$6F,$79
	db $20,$7D,$6F,$72,$72,$20,$7A,$67
	db $71,$6B,$20,$7F,$75,$7B,$02,$7A
	db $75,$20,$7A,$6E,$6B,$20,$74,$6B
	db $7E,$7A,$20,$67,$78,$6B,$67,$2B
	db $02,$00,$0E,$D1,$15,$CB,$58,$6B
	db $7A,$2D,$79,$20,$7A,$78,$7F,$2B
	db $20,$59,$75,$7C,$6B,$20,$57,$6F
	db $78,$68,$7F,$20,$7A,$75,$02,$7A
	db $6E,$6B,$20,$6A,$75,$75,$78,$20
	db $67,$74,$6A,$20,$76,$7B,$79,$6E
	db $20,$43,$20,$75,$74,$02,$7A,$6E
	db $6B,$20,$3F,$20,$4F,$75,$74,$7A
	db $78,$75,$72,$20,$5C,$67,$6A,$2B
	db $02,$00,$0E,$D1,$15,$CB,$56,$7B
	db $73,$76,$20,$68,$7F,$20,$76,$7B
	db $79,$6E,$6F,$74,$6D,$20,$4E,$2B
	db $02,$0E,$22,$16,$CB,$00,$0E,$D1
	db $15,$CB,$56,$7B,$73,$76,$20,$75
	db $7C,$6B,$78,$20,$6B,$74,$6B,$73
	db $6F,$6B,$79,$20,$67,$74,$6A,$02
	db $75,$68,$79,$7A,$67,$69,$72,$6B
	db $79,$2B,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$5A,$75,$7D,$2C
	db $20,$72,$6B,$7A,$2D,$79,$20,$7A
	db $67,$71,$6B,$20,$7A,$6E,$6B,$20
	db $6C,$75,$75,$6A,$02,$75,$6C,$6C
	db $20,$7A,$6E,$6B,$20,$75,$68,$79
	db $7A,$67,$69,$72,$6B,$2B,$2B,$2B
	db $02,$00,$20,$20,$20,$20,$20,$02
	db $0E,$D1,$15,$CB,$56,$7B,$73,$76
	db $20,$68,$7F,$20,$76,$7B,$79,$6E
	db $6F,$74,$6D,$20,$4E,$2B,$02,$0D
	db $78,$01,$61,$79,$6B,$20,$7A,$6E
	db $6B,$20,$3F,$20,$4F,$75,$74,$7A
	db $78,$75,$72,$20,$5C,$67,$6A,$20
	db $7A,$75,$02,$70,$7B,$73,$76,$20
	db $4C,$20,$7A,$67,$71,$6B,$20,$7A
	db $6E,$6B,$20,$6C,$75,$75,$6A,$2B
	db $02,$53,$6F,$7C,$6B,$20,$6F,$7A
	db $20,$67,$20,$7A,$78,$7F,$33,$02
	db $0E,$13,$16,$CB,$00,$0E,$D1,$15
	db $CB,$63,$5B,$63,$33,$02,$65,$75
	db $7B,$20,$69,$67,$74,$20,$6C,$72
	db $7F,$20,$67,$79,$20,$7D,$6B,$72
	db $72,$20,$67,$79,$02,$70,$7B,$73
	db $76,$33,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$60,$75,$20,$73
	db $67,$71,$6B,$20,$57,$6F,$78,$68
	db $7F,$20,$6C,$72,$7F,$2C,$02,$76
	db $78,$6B,$79,$79,$20,$4E,$20,$78
	db $6B,$76,$6B,$67,$7A,$6B,$6A,$72
	db $7F,$20,$7D,$6E,$6F,$72,$6B,$02
	db $57,$6F,$78,$68,$7F,$20,$6F,$79
	db $20,$6F,$74,$20,$7A,$6E,$6B,$20
	db $67,$6F,$78,$2B,$02,$0D,$78,$01
	db $57,$6F,$78,$68,$7F,$20,$6C,$72
	db $6F,$6B,$79,$20,$6E,$6F,$6D,$6E
	db $6B,$78,$20,$67,$74,$6A,$02,$6E
	db $6F,$6D,$6E,$6B,$78,$20,$67,$79
	db $20,$7F,$75,$7B,$20,$69,$75,$74
	db $7A,$6F,$74,$7B,$6B,$02,$7A,$75
	db $20,$76,$7B,$79,$6E,$20,$4E,$2B
	db $02,$0E,$07,$16,$CB,$00,$0E,$D1
	db $15,$CB,$58,$6B,$7A,$2D,$79,$20
	db $73,$75,$7C,$6B,$20,$75,$74,$20
	db $7A,$75,$20,$7A,$6E,$6B,$02,$74
	db $6B,$7E,$7A,$20,$79,$7A,$6B,$76
	db $2B,$02,$0E,$07,$16,$CB,$00,$0E
	db $D1,$15,$CB,$52,$75,$75,$6A,$20
	db $78,$6B,$79,$7A,$75,$78,$6B,$79
	db $20,$6B,$74,$6B,$78,$6D,$7F,$2B
	db $02,$0E,$22,$16,$CB,$00,$0E,$D1
	db $15,$CB,$63,$6E,$6B,$74,$6B,$7C
	db $6B,$78,$20,$7F,$75,$7B,$20,$6C
	db $6F,$74,$6A,$20,$6C,$75,$75,$6A
	db $2C,$02,$7A,$67,$71,$6B,$20,$6F
	db $7A,$2B,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$60,$6E,$6B,$78
	db $6B,$20,$6F,$79,$20,$6C,$75,$75
	db $6A,$20,$7B,$76,$20,$6F,$74,$20
	db $7A,$6E,$6B,$02,$79,$71,$7F,$2B
	db $02,$52,$72,$7F,$20,$7B,$76,$20
	db $67,$74,$6A,$20,$6D,$6B,$7A,$20
	db $6F,$7A,$2B,$02,$0E,$22,$16,$CB
	db $00,$20,$20,$20,$20,$20,$20,$20
	db $20,$20,$20,$02,$0E,$D1,$15,$CB
	db $54,$75,$7D,$20,$7A,$75,$20,$70
	db $7B,$73,$76,$2B,$2B,$2B,$02,$0E
	db $22,$16,$CB,$00,$0E,$D1,$15,$CB
	db $60,$75,$20,$73,$67,$71,$6B,$20
	db $57,$6F,$78,$68,$7F,$20,$6C,$72
	db $7F,$2C,$76,$7B,$79,$6E,$02,$4E
	db $20,$7D,$6E,$6F,$72,$6B,$20,$6E
	db $6B,$20,$6F,$79,$20,$6F,$74,$20
	db $7A,$6E,$6B,$20,$67,$6F,$78,$2B
	db $02,$0E,$22,$16,$CB,$00,$0E,$D1
	db $15,$CB,$60,$67,$71,$6B,$20,$7A
	db $6E,$6B,$20,$6C,$75,$75,$6A,$20
	db $68,$7F,$02,$69,$75,$74,$7A,$6F
	db $74,$7B,$67,$72,$72,$7F,$20,$76
	db $78,$6B,$79,$79,$6F,$74,$6D,$20
	db $4E,$2B,$02,$00,$0E,$D1,$15,$CB
	db $53,$75,$75,$6A,$20,$70,$75,$68
	db "!",$02,$0E,$07,$16,$CB,$00,$20
	db $20,$20,$20,$20,$02,$0E,$D1,$15
	db $CB,$61,$79,$6B,$20,$7A,$6E,$6B
	db $20,$6C,$72,$7F,$20,$6C,$7B,$74
	db $69,$7A,$6F,$75,$74,$20,$7D,$6E
	db $6B,$74,$02,$57,$6F,$78,$68,$7F
	db $20,$6F,$79,$20,$67,$68,$75,$7B
	db $7A,$20,$7A,$75,$20,$6C,$67,$72
	db $72,$20,$75,$6C,$6C,$02,$67,$20
	db $69,$72,$6F,$6C,$6C,$2B,$02,$0E
	db $FB,$15,$CB,$00,$0E,$D1,$15,$CB
	db $58,$6B,$7A,$2D,$79,$20,$73,$75
	db $7C,$6B,$20,$75,$74,$20,$7A,$75
	db $20,$7A,$6E,$6B,$02,$74,$6B,$7E
	db $7A,$20,$79,$7A,$6B,$76,$2B,$02
	db $0E,$FB,$15,$CB,$00,$0E,$D1,$15
	db $CB,$59,$75,$7C,$6B,$20,$57,$6F
	db $78,$68,$7F,$20,$7A,$75,$20,$7A
	db $6E,$6B,$20,$6A,$75,$75,$78,$02
	db $67,$74,$6A,$20,$76,$7B,$79,$6E
	db $20,$43,$20,$75,$74,$20,$7A,$6E
	db $6B,$02,$3F,$20,$4F,$75,$74,$7A
	db $78,$75,$72,$20,$5C,$67,$6A,$20
	db $79,$75,$20,$7D,$6B,$02,$69,$67
	db $74,$20,$73,$75,$7C,$6B,$20,$75
	db $74,$2B,$02,$00,$0E,$D1,$15,$CB
	db $57,$6F,$78,$68,$7F,$20,$72,$75
	db $79,$6B,$79,$20,$79,$75,$73,$6B
	db $20,$6B,$74,$6B,$78,$6D,$7F,$02
	db $6B,$7C,$6B,$78,$7F,$20,$7A,$6F
	db $73,$6B,$20,$6E,$6B,$20,$68,$7B
	db $73,$76,$79,$20,$6F,$74,$7A,$75
	db $02,$67,$74,$20,$6B,$74,$6B,$73
	db $7F,$2B,$02,$0E,$FB,$15,$CB,$00
	db $0E,$D1,$15,$CB,$55,$7A,$2D,$79
	db $20,$5B,$57,$20,$7A,$75,$20,$70
	db $7B,$73,$76,$20,$75,$7C,$6B,$78
	db $20,$67,$74,$02,$6B,$74,$6B,$73
	db $7F,$2C,$20,$68,$7B,$7A,$20,$7F
	db $75,$7B,$20,$73,$6F,$6D,$6E,$7A
	db $02,$7D,$67,$74,$7A,$20,$7A,$75
	db $20,$6A,$6B,$6C,$6B,$67,$7A,$20
	db $7A,$6E,$6B,$73,$02,$6F,$74,$79
	db $7A,$6B,$67,$6A,$2B,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$4E
	db $7F,$20,$76,$7B,$79,$6E,$6F,$74
	db $6D,$20,$65,$2C,$20,$57,$6F,$78
	db $68,$7F,$20,$7D,$6F,$72,$72,$02
	db $6F,$74,$6E,$67,$72,$6B,$20,$67
	db $72,$73,$75,$79,$7A,$20,$67,$74
	db $7F,$7A,$6E,$6F,$74,$6D,$02,$6F
	db $74,$20,$6E,$6F,$79,$20,$76,$67
	db $7A,$6E,$2B,$02,$0E,$0D,$16,$CB
	db $00,$0E,$D1,$15,$CB,$57,$6F,$78
	db $68,$7F,$20,$69,$67,$74,$20,$6F
	db $74,$6E,$67,$72,$6B,$20,$6B,$74
	db $6B,$73,$6F,$6B,$79,$02,$67,$74
	db $6A,$20,$67,$7A,$7A,$67,$69,$71
	db $20,$68,$7F,$20,$79,$76,$6F,$7A
	db $7A,$6F,$74,$6D,$02,$75,$7B,$7A
	db $20,$7D,$6E,$67,$7A,$20,$6E,$6B
	db $2D,$79,$20,$6F,$74,$6E,$67,$72
	db $6B,$6A,$2B,$02,$0E,$22,$16,$CB
	db $00,$0E,$D1,$15,$CB,$5A,$75,$7D
	db $2C,$20,$72,$6B,$7A,$2D,$79,$20
	db $76,$78,$67,$69,$7A,$6F,$69,$6B
	db $02,$6F,$74,$6E,$67,$72,$6F,$74
	db $6D,$20,$67,$74,$20,$6B,$74,$6B
	db $73,$7F,$2B,$02,$00,$0E,$D1,$15
	db $CB,$5C,$7B,$79,$6E,$20,$65,$20
	db $7A,$75,$20,$6F,$74,$6E,$67,$72
	db $6B,$2B,$02,$00,$0E,$D1,$15,$CB
	db $5B,$7B,$69,$6E,$33,$02,$60,$6E
	db $67,$7A,$20,$6E,$7B,$78,$7A,$33
	db $20,$60,$78,$7F,$20,$6F,$7A,$20
	db $67,$6D,$67,$6F,$74,$33,$02,$00
	db $0E,$D1,$15,$CB,$5F,$7A,$67,$74
	db $6A,$20,$6E,$6B,$78,$6B,$20,$67
	db $74,$6A,$20,$6F,$74,$6E,$67,$72
	db $6B,$02,$67,$74,$20,$6B,$74,$6B
	db $73,$7F,$2B,$20,$4E,$6B,$20,$69
	db $67,$78,$6B,$6C,$7B,$72,$2B,$02
	db $00,$0E,$D1,$15,$CB,$65,$75,$7B
	db $2D,$78,$6B,$20,$74,$75,$7A,$20
	db $72,$6F,$79,$7A,$6B,$74,$6F,$74
	db $6D,$33,$02,$0E,$01,$16,$CB,$00
	db $0E,$D1,$15,$CB,$5C,$7B,$79,$6E
	db $20,$65,$20,$7A,$75,$20,$6F,$74
	db $6E,$67,$72,$6B,$20,$67,$74,$02
	db $6B,$74,$6B,$73,$7F,$2B,$02,$00
	db $0E,$D1,$15,$CB,$65,$75,$7B,$20
	db $6A,$6F,$6A,$20,$6F,$7A,$33,$02
	db $0E,$07,$16,$CB,$00,$0E,$D1,$15
	db $CB,$5C,$7B,$79,$6E,$20,$65,$20
	db $7A,$75,$20,$79,$76,$6F,$7A,$20
	db $75,$7B,$7A,$20,$67,$20,$79,$7A
	db $67,$78,$2B,$02,$60,$6E,$6F,$79
	db $20,$6F,$79,$20,$7F,$75,$7B,$78
	db $20,$67,$7A,$7A,$67,$69,$71,$2B
	db $02,$0E,$22,$16,$CB,$00,$0E,$D1
	db $15,$CB,$50,$6B,$79,$7A,$78,$75
	db $7F,$20,$7A,$6E,$6B,$20,$7A,$67
	db $78,$6D,$6B,$7A,$20,$68,$7F,$02
	db $79,$76,$6F,$7A,$7A,$6F,$74,$6D
	db $20,$75,$7B,$7A,$20,$67,$20,$79
	db $7A,$67,$78,$2B,$02,$00,$0E,$D1
	db $15,$CB,$5C,$7B,$79,$6E,$20,$65
	db $20,$7A,$75,$20,$79,$76,$6F,$7A
	db $20,$75,$7B,$7A,$02,$7A,$6E,$6B
	db $20,$6B,$74,$6B,$73,$7F,$2B,$02
	db $00,$0E,$D1,$15,$CB,$5C,$7B,$79
	db $6E,$6F,$74,$6D,$20,$4D,$20,$75
	db $78,$20,$44,$20,$75,$74,$20,$7A
	db $6E,$6B,$02,$3F,$20,$4F,$75,$74
	db $7A,$78,$75,$72,$20,$5C,$67,$6A
	db $20,$79,$7D,$67,$72,$72,$75,$7D
	db $79,$02,$67,$74,$20,$6F,$74,$6E
	db $67,$72,$6B,$6A,$20,$75,$68,$70
	db $6B,$69,$7A,$2B,$02,$0E,$22,$16
	db $CB,$00,$0E,$D1,$15,$CB,$52,$75
	db $69,$7B,$79,$20,$75,$74,$20,$7A
	db $6E,$6B,$20,$7A,$67,$78,$6D,$6B
	db $7A,$02,$69,$67,$78,$6B,$6C,$7B
	db $72,$72,$7F,$2B,$02,$60,$78,$7F
	db $20,$6F,$7A,$20,$67,$6D,$67,$6F
	db $74,$2B,$02,$00,$0E,$D1,$15,$CB
	db $5A,$6F,$69,$6B,$20,$70,$75,$68
	db "!",$02,$0E,$07,$16,$CB,$00,$20
	db $02,$0E,$D1,$15,$CB,$60,$6E,$6F
	db $79,$20,$7A,$6F,$73,$6B,$20,$69
	db $75,$7B,$72,$6A,$20,$68,$6B,$20
	db $67,$20,$68,$6F,$7A,$02,$6A,$6F
	db $6C,$6C,$6F,$69,$7B,$72,$7A,$2B
	db $02,$00,$0E,$D1,$15,$CB,$56,$7B
	db $73,$76,$20,$67,$74,$6A,$20,$79
	db $76,$6F,$7A,$20,$75,$7B,$7A,$20
	db $67,$20,$79,$7A,$67,$78,$2B,$02
	db $5C,$7B,$79,$6E,$20,$4E,$2C,$20
	db $7A,$6E,$6B,$74,$20,$65,$20,$77
	db $7B,$6F,$69,$71,$72,$7F,$2B,$02
	db $00,$0E,$D1,$15,$CB,$60,$6E,$67
	db $7A,$2D,$79,$20,$67,$72,$72,$20
	db $6C,$75,$78,$02,$4A,$60,$6E,$6B
	db $20,$4E,$6B,$6D,$6F,$74,$74,$6B
	db $78,$2D,$79,$20,$5F,$6E,$75,$7D
	db $33,$4B,$02,$0E,$07,$16,$CB,$00
	db $0E,$D1,$15,$CB,$65,$75,$7B,$2D
	db $72,$72,$20,$68,$6B,$20,$6C,$6F
	db $74,$6B,$20,$67,$79,$20,$72,$75
	db $74,$6D,$20,$67,$79,$02,$7F,$75
	db $7B,$20,$78,$6B,$73,$6B,$73,$68
	db $6B,$78,$20,$7A,$6E,$6B,$20,$7A
	db $6E,$6F,$74,$6D,$79,$02,$7F,$75
	db $7B,$20,$76,$78,$67,$69,$7A,$6F
	db $69,$6B,$6A,$2B,$02,$0E,$FB,$15
	db $CB,$00,$0E,$D1,$15,$CB,$60,$75
	db $20,$79,$7A,$67,$78,$7A,$20,$76
	db $72,$67,$7F,$6F,$74,$6D,$02,$4A
	db $5F,$76,$78,$6F,$74,$6D,$20,$4E
	db $78,$6B,$6B,$80,$6B,$2C,$4B,$20
	db $70,$7B,$73,$76,$02,$75,$74,$7A
	db $75,$20,$7A,$6E,$6B,$20,$63,$67
	db $78,$76,$20,$5F,$7A,$67,$78,$2B
	db $02,$00,$0E,$D1,$15,$CB,$53,$75
	db $75,$6A,$20,$72,$7B,$69,$71,$20
	db $67,$74,$6A,$20,$6E,$67,$7C,$6B
	db $20,$6C,$7B,$74,$33,$02,$0E,$FB
	db $15,$CB,$00,$0E,$68,$16,$CB,$5F
	db $6E,$67,$72,$72,$20,$7D,$6B,$20
	db $6B,$7E,$76,$72,$67,$6F,$74,$20
	db $4A,$69,$75,$76,$7F,$4B,$34,$02
	db $0E,$7D,$16,$CB,$00,$0E,$D1,$15
	db $CB,$4F,$75,$74,$6D,$78,$67,$7A
	db $7B,$72,$67,$7A,$6F,$75,$74,$79
	db $20,$75,$74,$02,$69,$72,$6B,$67
	db $78,$6F,$74,$6D,$02,$4A,$5F,$76
	db $78,$6F,$74,$6D,$20,$4E,$78,$6B
	db $6B,$80,$6B,$2B,$4B,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$54
	db $75,$7D,$6B,$7C,$6B,$78,$2C,$20
	db $7A,$6E,$6F,$79,$20,$6F,$79,$02
	db $75,$74,$72,$7F,$20,$68,$6B,$6D
	db $6F,$74,$74,$6F,$74,$6D,$2B,$02
	db $59,$75,$78,$6B,$20,$6C,$7B,$74
	db $20,$6F,$79,$20,$75,$74,$20,$7A
	db $6E,$6B,$20,$7D,$67,$7F,$33,$02
	db $0E,$22,$16,$CB,$00,$0E,$D1,$15
	db $CB,$58,$6B,$7A,$2D,$79,$20,$72
	db $6B,$67,$78,$74,$20,$6E,$75,$7D
	db $20,$7A,$75,$20,$7B,$79,$6B,$02
	db $7A,$6E,$6B,$20,$69,$75,$76,$7F
	db $20,$6C,$7B,$74,$69,$7A,$6F,$75
	db $74,$2B,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$54,$6B,$72,$72
	db $75,$33,$02,$63,$6B,$72,$69,$75
	db $73,$6B,$20,$7A,$75,$02,$4A,$60
	db $6E,$6B,$20,$4E,$6B,$6D,$6F,$74
	db $74,$6B,$78,$2D,$79,$20,$5F,$6E
	db $75,$7D,$2B,$4B,$02,$0E,$22,$16
	db $CB,$00,$0E,$D1,$15,$CB,$54,$67
	db $7C,$6B,$20,$7F,$75,$7B,$20,$73
	db $67,$79,$7A,$6B,$78,$6B,$6A,$02
	db $6F,$74,$6E,$67,$72,$6F,$74,$6D
	db $20,$67,$74,$6A,$20,$6C,$72,$7F
	db $6F,$74,$6D,$34,$02,$0E,$22,$16
	db $CB,$00,$0E,$D1,$15,$CB,$51,$74
	db $6B,$73,$6F,$6B,$79,$20,$67,$7A
	db $7A,$67,$69,$71,$20,$6F,$74,$20
	db $7C,$67,$78,$6F,$75,$7B,$79,$02
	db $7D,$67,$7F,$79,$2B,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$60
	db $6E,$6F,$79,$20,$6B,$74,$6B,$73
	db $7F,$20,$6F,$79,$20,$69,$67,$72
	db $72,$6B,$6A,$02,$4A,$63,$67,$6A
	db $6A,$72,$6B,$20,$50,$75,$75,$2B
	db $4B,$02,$0E,$22,$16,$CB,$00,$0E
	db $D1,$15,$CB,$63,$6E,$6B,$74,$20
	db $57,$6F,$78,$68,$7F,$20,$6F,$74
	db $6E,$67,$72,$6B,$79,$20,$67,$74
	db $02,$6B,$74,$6B,$73,$7F,$2C,$20
	db $76,$7B,$79,$6E,$20,$4D,$20,$7A
	db $75,$20,$79,$7D,$67,$72,$72,$75
	db $7D,$2B,$02,$00,$0E,$D1,$15,$CB
	db $5C,$78,$6B,$79,$79,$20,$65,$20
	db $7A,$75,$20,$6F,$74,$6E,$67,$72
	db $6B,$20,$67,$74,$6A,$02,$4D,$20
	db $7A,$75,$20,$79,$7D,$67,$72,$72
	db $75,$7D,$2B,$02,$00,$0E,$D1,$15
	db $CB,$4D,$6D,$67,$6F,$74,$2C,$20
	db $76,$7B,$79,$6E,$20,$4D,$20,$7A
	db $75,$20,$79,$7D,$67,$72,$72,$75
	db $7D,$02,$67,$74,$20,$6B,$74,$6B
	db $73,$7F,$20,$7A,$6E,$67,$7A,$20
	db $7F,$75,$7B,$2D,$7C,$6B,$02,$6F
	db $74,$6E,$67,$72,$6B,$6A,$2B,$02
	db $0E,$FB,$15,$CB,$00,$0E,$D1,$15
	db $CB,$5F,$7A,$75,$76,$20,$6D,$75
	db $75,$6C,$6F,$74,$6D,$20,$67,$78
	db $75,$7B,$74,$6A,$33,$02,$5C,$7B
	db $79,$6E,$20,$65,$20,$7A,$75,$20
	db $6F,$74,$6E,$67,$72,$6B,$20,$67
	db $74,$6A,$02,$4D,$20,$7A,$75,$20
	db $79,$7D,$67,$72,$72,$75,$7D,$2B
	db $02,$0E,$FB,$15,$CB,$00,$0E,$D1
	db $15,$CB,$4D,$73,$67,$80,$6F,$74
	db $6D,$33,$20,$65,$75,$7B,$20,$69
	db $67,$74,$20,$7B,$79,$6B,$02,$7A
	db $6E,$6B,$20,$6B,$74,$6B,$78,$6D
	db $7F,$20,$68,$6B,$67,$73,$20,$68
	db $7F,$02,$76,$7B,$79,$6E,$6F,$74
	db $6D,$20,$65,$2B,$02,$0E,$FB,$15
	db $CB,$00,$0E,$D1,$15,$CB,$60,$6E
	db $6B,$78,$6B,$20,$67,$78,$6B,$20
	db $79,$75,$73,$6B,$20,$6B,$74,$6B
	db $73,$6F,$6B,$79,$02,$7A,$6E,$67
	db $7A,$20,$63,$55,$58,$58,$20,$5A
	db $5B,$60,$20,$6D,$6F,$7C,$6B,$20
	db $7F,$75,$7B,$02,$67,$20,$79,$76
	db $6B,$69,$6F,$67,$72,$20,$67,$68
	db $6F,$72,$6F,$7A,$7F,$2B,$02,$0E
	db $FB,$15,$CB,$00,$0E,$D1,$15,$CB
	db $51,$74,$6B,$73,$6F,$6B,$79,$20
	db $7D,$6F,$7A,$6E,$20,$67,$68,$6F
	db $72,$6F,$7A,$6F,$6B,$79,$02,$7D
	db $6F,$72,$72,$20,$6C,$72,$67,$79
	db $6E,$2B,$02,$60,$67,$71,$6B,$20
	db $67,$20,$69,$72,$75,$79,$6B,$20
	db $72,$75,$75,$71,$2B,$02,$0E,$FB
	db $15,$CB,$00,$0E,$D1,$15,$CB,$54
	db $6B,$78,$6B,$20,$67,$78,$6B,$20
	db $67,$20,$6C,$6B,$7D,$20,$75,$7A
	db $6E,$6B,$78,$02,$67,$68,$6F,$72
	db $6F,$7A,$6F,$6B,$79,$20,$7F,$75
	db $7B,$20,$69,$67,$74,$20,$69,$75
	db $76,$7F,$2B,$02,$0E,$FB,$15,$CB
	db $00,$0E,$D1,$15,$CB,$65,$75,$7B
	db $20,$69,$67,$74,$20,$78,$6B,$7C
	db $6F,$6B,$7D,$20,$7A,$6E,$6B,$20
	db $69,$75,$76,$7F,$02,$6B,$7E,$76
	db $72,$67,$74,$67,$7A,$6F,$75,$74
	db $20,$67,$74,$7F,$7A,$6F,$73,$6B
	db $02,$6A,$7B,$78,$6F,$74,$6D,$20
	db $7A,$6E,$6B,$20,$6D,$67,$73,$6B
	db $20,$68,$7F,$02,$76,$78,$6B,$79
	db $79,$6F,$74,$6D,$20,$5F,$60,$4D
	db $5E,$60,$2B,$02,$0E,$22,$16,$CB
	db $00,$0E,$D1,$15,$CB,$5F,$75,$73
	db $6B,$20,$67,$68,$6F,$72,$6F,$7A
	db $6F,$6B,$79,$20,$6E,$67,$7C,$6B
	db $02,$72,$6F,$73,$6F,$7A,$6B,$6A
	db $20,$7B,$79,$6B,$79,$2B,$02,$57
	db $6F,$78,$68,$7F,$20,$7D,$6F,$72
	db $72,$20,$74,$75,$7A,$20,$7D,$6B
	db $67,$78,$20,$67,$20,$69,$67,$76
	db $2B,$02,$0E,$22,$16,$CB,$00,$0E
	db $D1,$15,$CB,$60,$6E,$6B,$78,$6B
	db $2D,$79,$20,$73,$75,$78,$6B,$2B
	db $2B,$2B,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$60,$7D,$75,$2C
	db $20,$7F,$6B,$79,$2C,$20,$7A,$7D
	db $75,$20,$76,$6B,$75,$76,$72,$6B
	db $20,$69,$67,$74,$02,$76,$72,$67
	db $7F,$20,$67,$7A,$20,$7A,$6E,$6B
	db $20,$79,$67,$73,$6B,$20,$7A,$6F
	db $73,$6B,$2B,$02,$63,$75,$7D,$20
	db "!",$02,$0E,$22,$16,$CB,$00,$0E
	db $D1,$15,$CB,$63,$6E,$6B,$74,$20
	db $57,$6F,$78,$68,$7F,$20,$6F,$79
	db $20,$7D,$6B,$67,$78,$6F,$74,$6D
	db $20,$67,$74,$02,$4A,$67,$68,$6F
	db $72,$6F,$7A,$7F,$20,$69,$67,$76
	db $2C,$4B,$20,$76,$7B,$79,$6E,$20
	db $4D,$2B,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$60,$6E,$6B,$74
	db $2C,$20,$6F,$6C,$20,$7A,$6E,$6B
	db $20,$69,$75,$76,$6F,$6B,$6A,$02
	db $69,$6E,$67,$78,$67,$69,$7A,$6B
	db $78,$20,$6F,$79,$20,$7A,$6E,$78
	db $75,$7D,$74,$02,$67,$7D,$67,$7F
	db $2C,$20,$6F,$7A,$2D,$79,$20,$78
	db $6B,$67,$6A,$7F,$2B,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$5C
	db $7B,$79,$6E,$20,$4D,$20,$67,$6D
	db $67,$6F,$74,$2B,$2B,$2B,$02,$0E
	db $22,$16,$CB,$00,$0E,$D1,$15,$CB
	db $2B,$2B,$2B,$67,$74,$6A,$2B,$2B
	db $2B,$02,$0D,$78,$01,$00,$0E,$D1
	db $15,$CB,$2B,$2B,$2B,$67,$20,$79
	db $6B,$69,$75,$74,$6A,$20,$69,$6E
	db $67,$78,$67,$69,$7A,$6B,$78,$20
	db $7D,$6F,$72,$72,$02,$67,$76,$76
	db $6B,$67,$78,$2B,$02,$0E,$3E,$16
	db $CB,$00,$0E,$D1,$15,$CB,$60,$6E
	db $6F,$79,$20,$69,$6E,$67,$78,$67
	db $69,$7A,$6B,$78,$20,$6F,$79,$20
	db $69,$67,$72,$72,$6B,$6A,$02,$67
	db $20,$6E,$6B,$72,$76,$6B,$78,$2B
	db $02,$54,$6B,$2D,$72,$72,$20,$68
	db $6B,$20,$67,$20,$68,$6F,$6D,$20
	db $6E,$6B,$72,$76,$20,$7A,$75,$02
	db $57,$6F,$78,$68,$7F,$2B,$02,$0E
	db $3E,$16,$CB,$00,$0E,$D1,$15,$CB
	db $5A,$75,$78,$73,$67,$72,$72,$7F
	db $2C,$20,$7A,$6E,$6B,$20,$6E,$6B
	db $72,$76,$6B,$78,$20,$7D,$6F,$72
	db $72,$02,$67,$69,$7A,$20,$68,$7F
	db $20,$6E,$6F,$73,$79,$6B,$72,$6C
	db $2B,$02,$54,$6B,$20,$69,$67,$74
	db $20,$6A,$6B,$6C,$6B,$67,$7A,$20
	db $6B,$74,$6B,$73,$6F,$6B,$79,$2B
	db $02,$0E,$FB,$15,$CB,$00,$0E,$D1
	db $15,$CB,$63,$6E,$6B,$74,$20,$7A
	db $6E,$6B,$20,$6E,$6B,$72,$76,$6B
	db $78,$20,$6F,$79,$02,$76,$78,$6B
	db $79,$6B,$74,$7A,$2C,$20,$76,$7B
	db $79,$6E,$20,$67,$74,$7F,$20,$68
	db $7B,$7A,$7A,$75,$74,$02,$75,$74
	db $20,$7A,$6E,$6B,$20,$23,$74,$6A
	db $20,$69,$75,$74,$7A,$78,$75,$72
	db $72,$6B,$78,$2B,$02,$0E,$22,$16
	db $CB,$00,$0E,$D1,$15,$CB,$60,$6E
	db $6B,$20,$6E,$6B,$72,$76,$6B,$78
	db $20,$7D,$6F,$72,$72,$20,$7A,$6E
	db $6B,$74,$20,$68,$6B,$02,$69,$75
	db $74,$7A,$78,$75,$72,$72,$6B,$6A
	db $20,$68,$7F,$20,$7A,$6E,$6B,$20
	db $23,$74,$6A,$02,$76,$72,$67,$7F
	db $6B,$78,$2B,$02,$0E,$22,$16,$CB
	db $00,$0E,$D1,$15,$CB,$55,$7A,$2D
	db $79,$20,$67,$20,$72,$6F,$7A,$7A
	db $72,$6B,$20,$69,$75,$74,$6C,$7B
	db $79,$6F,$74,$6D,$20,$67,$7A,$02
	db $6C,$6F,$78,$79,$7A,$2C,$20,$68
	db $7B,$7A,$20,$6D,$6F,$7C,$6B,$20
	db $6F,$7A,$20,$67,$20,$7A,$78,$7F
	db $02,$67,$74,$6A,$20,$7F,$75,$7B
	db $2D,$72,$72,$20,$69,$67,$7A,$69
	db $6E,$20,$75,$74,$33,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$5C
	db $78,$67,$69,$7A,$6F,$69,$6B,$20
	db $7D,$6F,$7A,$6E,$20,$7F,$75,$7B
	db $78,$02,$6C,$78,$6F,$6B,$74,$6A
	db $79,$20,$67,$74,$6A,$20,$6A,$75
	db $7B,$68,$72,$6B,$20,$7A,$6E,$6B
	db $02,$6C,$7B,$74,$33,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$52
	db $55,$5E,$51,$20,$2E,$02,$5F,$76
	db $6F,$7A,$20,$75,$7B,$7A,$20,$79
	db $75,$73,$6B,$20,$74,$67,$79,$7A
	db $7F,$02,$6C,$6F,$78,$6B,$68,$67
	db $72,$72,$79,$2B,$02,$0D,$B4,$01
	db $00,$0E,$D1,$15,$CB,$5F,$60,$5B
	db $5A,$51,$20,$2E,$02,$60,$7B,$78
	db $74,$20,$6F,$74,$7A,$75,$20,$67
	db $20,$79,$7A,$75,$74,$6B,$20,$67
	db $74,$6A,$20,$6A,$75,$02,$79,$75
	db $73,$6B,$20,$6E,$6B,$67,$7C,$7F
	db $20,$6A,$67,$73,$67,$6D,$6B,$2B
	db $02,$0D,$B4,$01,$00,$0E,$D1,$15
	db $CB,$5F,$63,$5B,$5E,$50,$20,$2E
	db $02,$60,$6E,$6B,$20,$57,$6F,$74
	db $6D,$20,$75,$6C,$20,$7D,$6B,$67
	db $76,$75,$74,$79,$2B,$02,$0D,$B4
	db $01,$00,$0E,$D1,$15,$CB,$60,$6E
	db $6B,$78,$6B,$20,$67,$78,$6B,$20
	db $73,$75,$78,$6B,$02,$7A,$6B,$69
	db $6E,$74,$6F,$77,$7B,$6B,$79,$2B
	db $2B,$2B,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$60,$6E,$78,$75
	db $7D,$20,$75,$6C,$6C,$20,$7A,$6E
	db $6B,$20,$69,$67,$76,$2B,$2B,$2B
	db $02,$0E,$3E,$16,$CB,$00,$0E,$D1
	db $15,$CB,$2B,$2B,$2B,$67,$74,$6A
	db $20,$7A,$6E,$6B,$20,$6E,$6B,$72
	db $76,$6B,$78,$20,$7D,$6F,$72,$72
	db $20,$76,$7B,$7A,$02,$6F,$7A,$20
	db $75,$74,$2B,$02,$0E,$3E,$16,$CB
	db $00,$0E,$D1,$15,$CB,$5C,$7B,$79
	db $6E,$20,$4D,$20,$75,$74,$6B,$20
	db $73,$75,$78,$6B,$20,$7A,$6F,$73
	db $6B,$20,$67,$74,$6A,$02,$7A,$6E
	db $6B,$20,$6E,$6B,$72,$76,$6B,$78
	db $20,$7D,$6F,$72,$72,$20,$68,$6B
	db $69,$75,$73,$6B,$20,$7A,$6E,$6B
	db $02,$67,$68,$6F,$72,$6F,$7A,$7F
	db $20,$69,$67,$76,$2B,$02,$0E,$3E
	db $16,$CB,$00,$0E,$D1,$15,$CB,$4D
	db $74,$6A,$20,$7F,$75,$7B,$20,$69
	db $67,$74,$20,$69,$75,$76,$7F,$20
	db $7A,$6E,$6B,$02,$67,$68,$6F,$72
	db $6F,$7A,$7F,$20,$67,$6D,$67,$6F
	db $74,$2B,$02,$0E,$3E,$16,$CB,$00
	db $0E,$D1,$15,$CB,$54,$6B,$78,$6B
	db $20,$67,$78,$6B,$20,$79,$75,$73
	db $6B,$20,$79,$76,$6B,$69,$6F,$67
	db $72,$02,$6F,$74,$79,$7A,$78,$7B
	db $69,$7A,$6F,$75,$74,$79,$2B,$02
	db $0E,$22,$16,$CB,$00,$0E,$D1,$15
	db $CB,$60,$75,$20,$6A,$67,$79,$6E
	db $2B,$2B,$2B,$5C,$7B,$79,$6E,$20
	db $45,$20,$75,$78,$20,$46,$02,$7A
	db $7D,$6F,$69,$6B,$2B,$20,$57,$6F
	db $78,$68,$7F,$20,$7D,$6F,$72,$72
	db $20,$73,$75,$7C,$6B,$02,$77,$7B
	db $6F,$69,$71,$72,$7F,$20,$67,$74
	db $6A,$20,$6F,$74,$69,$78,$6B,$67
	db $79,$6B,$02,$67,$7A,$7A,$67,$69
	db $71,$20,$76,$75,$7D,$6B,$78,$2B
	db $02,$00,$0E,$D1,$15,$CB,$60,$75
	db $20,$79,$72,$6F,$6A,$6B,$2B,$2B
	db $2B,$5C,$7B,$79,$6E,$20,$44,$20
	db $67,$74,$6A,$02,$4E,$20,$7A,$75
	db $6D,$6B,$7A,$6E,$6B,$78,$2B,$20
	db $65,$75,$7B,$20,$69,$67,$74,$02
	db $67,$7A,$7A,$67,$69,$71,$20,$7D
	db $6E,$6F,$72,$6B,$20,$79,$72,$6F
	db $6A,$6F,$74,$6D,$2B,$02,$00,$0E
	db $D1,$15,$CB,$60,$75,$20,$6D,$7B
	db $67,$78,$6A,$2B,$2B,$2B,$5C,$7B
	db $79,$6E,$20,$58,$20,$75,$78,$20
	db $5E,$2B,$02,$55,$7A,$20,$69,$67
	db $74,$20,$78,$6B,$6A,$7B,$69,$6B
	db $20,$7A,$6E,$6B,$20,$6B,$74,$6B
	db $73,$7F,$2D,$79,$02,$67,$7A,$7A
	db $67,$69,$71,$20,$76,$75,$7D,$6B
	db $78,$2B,$02,$00,$0E,$D1,$15,$CB
	db $52,$75,$78,$20,$73,$75,$78,$6B
	db $20,$6A,$6B,$7A,$67,$6F,$72,$79
	db $2C,$20,$76,$72,$6B,$67,$79,$6B
	db $02,$78,$6B,$6C,$6B,$78,$20,$7A
	db $75,$20,$7A,$6E,$6B,$20,$6F,$74
	db $79,$7A,$78,$7B,$69,$7A,$6F,$75
	db $74,$02,$73,$67,$74,$7B,$67,$72
	db $2B,$02,$0E,$07,$16,$CB,$00,$0E
	db $D1,$15,$CB,$5A,$75,$7D,$2C,$20
	db $72,$6B,$7A,$2D,$79,$20,$76,$72
	db $67,$7F,$02,$4A,$50,$65,$5A,$4D
	db $20,$4E,$58,$4D,$50,$51,$33,$4B
	db $02,$00,$0E,$D1,$15,$CB,$5C,$78
	db $67,$69,$7A,$6F,$69,$6B,$2C,$20
	db $76,$78,$67,$69,$7A,$6F,$69,$6B
	db $2C,$02,$76,$78,$67,$69,$7A,$6F
	db $69,$6B,$2B,$2B,$2B,$67,$74,$6A
	db $20,$73,$67,$79,$7A,$6B,$78,$02
	db $4A,$69,$75,$76,$7F,$4B,$20,$67
	db $74,$6A,$20,$4A,$6E,$6B,$72,$76
	db $6B,$78,$33,$4B,$02,$53,$75,$75
	db $6A,$20,$72,$7B,$69,$71,$33,$02
	db $0E,$FB,$15,$CB,$00,$0E,$D1,$15
	db $CB,$5A,$75,$7D,$2C,$20,$72,$6B
	db $7A,$2D,$79,$20,$76,$72,$67,$7F
	db $02,$4A,$5F,$76,$78,$6F,$74,$6D
	db $20,$4E,$78,$6B,$6B,$80,$6B,$33
	db $4B,$02,$00,$0E,$68,$16,$CB,$55
	db $79,$20,$7A,$6E,$6F,$79,$20,$7F
	db $75,$7B,$78,$20,$6C,$6F,$78,$79
	db $7A,$20,$7A,$6F,$73,$6B,$02,$76
	db $72,$67,$7F,$6F,$74,$6D,$20,$53
	db $5B,$61,$5E,$59,$51,$60,$20,$5E
	db $4D,$4F,$51,$34,$02,$0E,$7D,$16
	db $CB,$00,$0E,$D1,$15,$CB,$57,$6F
	db $78,$68,$7F,$20,$67,$74,$6A,$20
	db $57,$6F,$74,$6D,$20,$50,$6B,$6A
	db $6B,$6A,$6B,$02,$78,$67,$69,$6B
	db $20,$7A,$6E,$78,$75,$7B,$6D,$6E
	db $20,$7A,$6E,$6B,$20,$75,$68,$79
	db $7A,$67,$69,$72,$6B,$02,$69,$75
	db $7B,$78,$79,$6B,$20,$7A,$75,$20
	db $7A,$6E,$6B,$20,$6C,$6F,$74,$6F
	db $79,$6E,$33,$02,$0E,$22,$16,$CB
	db $57,$6F,$78,$68,$7F,$20,$73,$7B
	db $79,$7A,$20,$6B,$67,$7A,$20,$73
	db $75,$78,$6B,$02,$6C,$75,$75,$6A
	db $20,$67,$74,$6A,$20,$78,$6B,$67
	db $69,$6E,$20,$7A,$6E,$6B,$20,$6D
	db $75,$67,$72,$02,$68,$6B,$6C,$75
	db $78,$6B,$20,$57,$6F,$74,$6D,$20
	db $50,$6B,$6A,$6B,$6A,$6B,$2B,$02
	db $0E,$22,$16,$CB,$60,$6E,$6B,$78
	db $6B,$20,$67,$78,$6B,$20,$74,$75
	db $20,$6B,$74,$6B,$73,$6F,$6B,$79
	db $20,$7A,$75,$02,$6C,$6F,$6D,$6E
	db $7A,$2B,$02,$0E,$22,$16,$CB,$60
	db $78,$7F,$20,$7A,$75,$20,$6D,$6B
	db $7A,$20,$7A,$6E,$6B,$20,$6E,$6F
	db $6D,$6E,$6B,$79,$7A,$02,$79,$69
	db $75,$78,$6B,$33,$02,$0E,$22,$16
	db $CB,$55,$74,$69,$78,$6B,$67,$79
	db $6B,$20,$7F,$75,$7B,$78,$20,$79
	db $71,$6F,$72,$72,$20,$72,$6B,$7C
	db $6B,$72,$02,$67,$74,$6A,$20,$68
	db $6B,$69,$75,$73,$6B,$20,$7A,$6E
	db $6B,$20,$69,$6E,$67,$73,$76,$6F
	db $75,$74,$33,$02,$0E,$22,$16,$CB
	db $1D,$00,$00,$0E,$68,$16,$CB,$55
	db $79,$20,$7A,$6E,$6F,$79,$20,$7F
	db $75,$7B,$78,$20,$6C,$6F,$78,$79
	db $7A,$20,$7A,$6F,$73,$6B,$02,$76
	db $72,$67,$7F,$6F,$74,$6D,$20,$60
	db $6E,$6B,$20,$53,$78,$6B,$67,$7A
	db $20,$4F,$67,$7C,$6B,$02,$5B,$6C
	db $6C,$6B,$74,$79,$6F,$7C,$6B,$34
	db $02,$0E,$7D,$16,$CB,$00,$0E,$D1
	db $15,$CB,$52,$6F,$74,$6A,$20,$7A
	db $78,$6B,$67,$79,$7B,$78,$6B,$79
	db $02,$7A,$6E,$78,$75,$7B,$6D,$6E
	db $75,$7B,$7A,$20,$7A,$6E,$6B,$20
	db $69,$67,$7C,$6B,$2B,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$55
	db $7A,$2D,$79,$20,$6C,$7B,$74,$20
	db $67,$74,$6A,$20,$6B,$7E,$69,$6F
	db $7A,$6F,$74,$6D,$33,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$65
	db $75,$7B,$20,$73,$7B,$79,$7A,$20
	db $6C,$6F,$74,$6A,$20,$67,$79,$20
	db $73,$67,$74,$7F,$02,$6E,$6F,$6A
	db $6A,$6B,$74,$20,$7A,$78,$6B,$67
	db $79,$7B,$78,$6B,$79,$20,$67,$79
	db $20,$7F,$75,$7B,$02,$69,$67,$74
	db "!",$02,$0E,$22,$16,$CB,$00,$0E
	db $D1,$15,$CB,$55,$6C,$20,$7F,$75
	db $7B,$20,$6C,$6F,$74,$6A,$20,$67
	db $20,$7A,$78,$6B,$67,$79,$7B,$78
	db $6B,$2C,$02,$73,$75,$7C,$6B,$20
	db $57,$6F,$78,$68,$7F,$20,$7A,$75
	db $20,$6F,$7A,$20,$67,$74,$6A,$02
	db $76,$78,$6B,$79,$79,$20,$43,$2B
	db $02,$0E,$22,$16,$CB,$00,$0E,$D1
	db $15,$CB,$5C,$7B,$79,$6E,$20,$64
	db $20,$7A,$75,$20,$79,$6B,$6B,$20
	db $7A,$6E,$6B,$02,$7A,$78,$6B,$67
	db $79,$7B,$78,$6B,$79,$20,$7F,$75
	db $7B,$2D,$7C,$6B,$20,$6C,$75,$7B
	db $74,$6A,$2B,$02,$0E,$22,$16,$CB
	db $00,$0E,$D1,$15,$CB,$1D,$00,$60
	db $6E,$6B,$78,$6B,$20,$67,$78,$6B
	db $20,$72,$75,$7A,$79,$20,$75,$6C
	db $02,$7A,$78,$6B,$67,$79,$7B,$78
	db $6B,$79,$20,$6E,$6F,$6A,$6A,$6B
	db $74,$20,$6F,$74,$02,$7C,$67,$78
	db $6F,$75,$7B,$79,$20,$76,$72,$67
	db $69,$6B,$79,$2B,$02,$0E,$3E,$16
	db $CB,$00,$0E,$D1,$15,$CB,$60,$6E
	db $6B,$78,$6B,$20,$67,$78,$6B,$20
	db $67,$20,$7A,$75,$7A,$67,$72,$20
	db $75,$6C,$20,$27,$21,$02,$7A,$78
	db $6B,$67,$79,$7B,$78,$6B,$79,$2B
	db $20,$54,$75,$7D,$20,$73,$67,$74
	db $7F,$20,$69,$67,$74,$02,$7F,$75
	db $7B,$20,$6C,$6F,$74,$6A,$34,$20
	db $58,$6B,$7A,$2D,$79,$20,$79,$6B
	db $6B,$2B,$2B,$2B,$2B,$02,$0E,$22
	db $16,$CB,$00,$0E,$D1,$15,$CB,$2B
	db $2B,$2B,$2B,$7D,$6E,$75,$75,$76
	db $79,$33,$02,$0E,$22,$16,$CB,$1D
	db $00,$00,$0E,$68,$16,$CB,$55,$79
	db $20,$7A,$6E,$6F,$79,$20,$7F,$75
	db $7B,$78,$20,$6C,$6F,$78,$79,$7A
	db $20,$7A,$6F,$73,$6B,$02,$76,$72
	db $67,$7F,$6F,$74,$6D,$20,$59,$55
	db $58,$57,$65,$20,$63,$4D,$65,$02
	db $63,$55,$5F,$54,$51,$5F,$34,$02
	db $0E,$7D,$16,$CB,$00,$0E,$D1,$15
	db $CB,$65,$75,$7B,$20,$69,$67,$74
	db $2D,$7A,$20,$69,$75,$76,$7F,$20
	db $6B,$74,$6B,$73,$6F,$6B,$79,$2D
	db $02,$67,$68,$6F,$72,$6F,$7A,$6F
	db $6B,$79,$20,$6F,$74,$20,$7A,$6E
	db $6F,$79,$20,$6D,$67,$73,$6B,$2B
	db $02,$0E,$22,$16,$CB,$00,$0E,$D1
	db $15,$CB,$50,$75,$74,$2D,$7A,$20
	db $7D,$75,$78,$78,$7F,$2B,$02,$60
	db $6E,$6B,$78,$6B,$20,$6F,$79,$20
	db $67,$20,$68,$6B,$7A,$7A,$6B,$78
	db $20,$7D,$67,$7F,$02,$7A,$75,$20
	db $6A,$75,$20,$6F,$7A,$33,$02,$0E
	db $22,$16,$CB,$00,$0E,$D1,$15,$CB
	db $55,$7A,$2D,$79,$20,$69,$67,$72
	db $72,$6B,$6A,$20,$7A,$6E,$6B,$20
	db $50,$6B,$72,$7B,$7E,$6B,$20,$69
	db $75,$76,$7F,$02,$67,$68,$6F,$72
	db $6F,$7A,$7F,$2B,$02,$0E,$22,$16
	db $CB,$00,$0E,$D1,$15,$CB,$4E,$7F
	db $20,$7A,$75,$7B,$69,$6E,$6F,$74
	db $6D,$20,$7A,$6E,$6B,$20,$50,$6B
	db $72,$7B,$7E,$6B,$02,$69,$75,$76
	db $7F,$20,$69,$6E,$67,$78,$67,$69
	db $7A,$6B,$78,$79,$2C,$20,$57,$6F
	db $78,$68,$7F,$02,$67,$69,$77,$7B
	db $6F,$78,$6B,$79,$20,$7A,$6E,$67
	db $7A,$20,$67,$68,$6F,$72,$6F,$7A
	db $7F,$02,$52,$5B,$5E,$51,$62,$51
	db $5E,$33,$02,$0E,$22,$16,$CB,$00
	db $0E,$D1,$15,$CB,$65,$75,$7B,$20
	db $69,$67,$74,$20,$79,$6B,$72,$6B
	db $69,$7A,$20,$67,$69,$77,$7B,$6F
	db $78,$6B,$6A,$02,$67,$68,$6F,$72
	db $6F,$7A,$6F,$6B,$79,$20,$68,$7F
	db $20,$76,$78,$6B,$79,$79,$6F,$74
	db $6D,$02,$5F,$60,$4D,$5E,$60,$2B
	db $02,$0E,$22,$16,$CB,$00,$0E,$D1
	db $15,$CB,$60,$6E,$6B,$78,$6B,$20
	db $6F,$79,$20,$74,$75,$20,$72,$6F
	db $73,$6F,$7A,$20,$6C,$75,$78,$20
	db $7B,$79,$6F,$74,$6D,$02,$67,$68
	db $6F,$72,$6F,$7A,$6F,$6B,$79,$2B
	db $20,$61,$79,$6B,$20,$7A,$6E,$6B
	db $73,$20,$67,$79,$02,$73,$7B,$69
	db $6E,$20,$67,$79,$20,$7F,$75,$7B
	db $20,$7D,$67,$74,$7A,$2B,$02,$0E
	db $FB,$15,$CB,$00,$0E,$D1,$15,$CB
	db $65,$75,$7B,$20,$69,$67,$74,$20
	db $79,$6B,$72,$6B,$69,$7A,$20,$6A
	db $6F,$6C,$6C,$6B,$78,$6B,$74,$7A
	db $02,$67,$68,$6F,$72,$6F,$7A,$6F
	db $6B,$79,$20,$6A,$7B,$78,$6F,$74
	db $6D,$20,$76,$72,$67,$7F,$2B,$02
	db $5C,$78,$6B,$79,$79,$20,$64,$20
	db $35,$75,$78,$20,$45,$20,$67,$74
	db $6A,$20,$46,$36,$20,$7A,$75,$02
	db $69,$7F,$69,$72,$6B,$20,$7A,$6E
	db $78,$75,$7B,$6D,$6E,$2B,$02,$00
	db $0E,$D1,$15,$CB,$55,$6C,$20,$7F
	db $75,$7B,$20,$69,$75,$73,$6B,$20
	db $7A,$75,$20,$67,$20,$6A,$6B,$67
	db $6A,$02,$6B,$74,$6A,$20,$67,$74
	db $6A,$20,$69,$67,$74,$2D,$7A,$20
	db $68,$78,$6B,$67,$71,$02,$7A,$6E
	db $78,$75,$7B,$6D,$6E,$2C,$20,$7F
	db $75,$7B,$20,$73,$7B,$79,$7A,$20
	db $6C,$6F,$74,$6A,$02,$67,$74,$75
	db $7A,$6E,$6B,$78,$20,$6E,$6F,$6A
	db $6A,$6B,$74,$20,$67,$68,$6F,$72
	db $6F,$7A,$7F,$2B,$02,$0E,$FB,$15
	db $CB,$00,$0E,$D1,$15,$CB,$5A,$75
	db $7D,$20,$7A,$6E,$6F,$79,$20,$6F
	db $79,$20,$7A,$6E,$6B,$20,$6C,$6F
	db $74,$67,$72,$02,$6D,$67,$73,$6B
	db $2B,$2B,$2B,$02,$0E,$22,$16,$CB
	db $00,$0E,$D1,$15,$CB,$79,$75,$20
	db $69,$75,$74,$69,$6B,$74,$7A,$78
	db $67,$7A,$6B,$20,$67,$74,$6A,$20
	db $6A,$75,$02,$7F,$75,$7B,$78,$20
	db $68,$6B,$79,$7A,$33,$02,$0E,$FB
	db $15,$CB,$00,$0E,$E6,$15,$CB,$65
	db $20,$68,$7B,$7A,$7A,$75,$74,$20
	db $73,$67,$71,$6B,$79,$20,$71,$6F
	db $78,$68,$7F,$02,$79,$7B,$69,$71
	db $20,$7B,$76,$20,$67,$74,$20,$6B
	db $74,$6B,$73,$7F,$2C,$02,$0E,$FB
	db $15,$CB,$00,$0E,$E6,$15,$CB,$4D
	db $7A,$7A,$67,$69,$71,$20,$6B,$74
	db $6B,$73,$7F,$20,$68,$7F,$02,$79
	db $76,$6F,$7A,$7A,$6F,$74,$6D,$20
	db $6F,$7A,$20,$75,$7B,$7A,$33,$02
	db $0E,$FB,$15,$CB,$00,$0E,$E6,$15
	db $CB,$4E,$20,$68,$7B,$7A,$7A,$75
	db $74,$20,$73,$67,$71,$6B,$79,$02
	db $71,$6F,$78,$68,$7F,$20,$70,$7B
	db $73,$76,$2C,$02,$0E,$FB,$15,$CB
	db $00,$0E,$E6,$15,$CB,$4F,$75,$74
	db $7A,$6F,$74,$7B,$6B,$20,$7A,$75
	db $20,$76,$7B,$79,$6E,$2C,$02,$71
	db $6F,$78,$68,$7F,$20,$69,$67,$74
	db $20,$6C,$72,$7F,$33,$02,$0E,$FB
	db $15,$CB,$00,$0E,$E6,$15,$CB,$5C
	db $7B,$79,$6E,$20,$65,$20,$7A,$75
	db $20,$6F,$74,$6E,$67,$72,$6B,$20
	db $6B,$74,$6B,$73,$6F,$6B,$79,$2B
	db $02,$0E,$FB,$15,$CB,$00,$0E,$E6
	db $15,$CB,$5C,$78,$6B,$79,$79,$20
	db $4D,$20,$7A,$75,$20,$79,$7D,$67
	db $72,$72,$75,$7D,$02,$6B,$74,$6B
	db $73,$6F,$6B,$79,$20,$7D,$6F,$7A
	db $6E,$20,$79,$76,$6B,$69,$6F,$67
	db $72,$02,$67,$68,$6F,$72,$6F,$7A
	db $6F,$6B,$79,$2B,$02,$0E,$FB,$15
	db $CB,$00,$0E,$E6,$15,$CB,$60,$6E
	db $6B,$20,$4D,$20,$4E,$7B,$7A,$7A
	db $75,$74,$20,$7D,$6F,$72,$72,$20
	db $67,$72,$79,$75,$02,$69,$78,$6B
	db $67,$7A,$6B,$20,$67,$20,$6E,$6B
	db $72,$76,$6B,$78,$20,$7D,$6E,$75
	db $02,$69,$67,$74,$20,$7B,$79,$6B
	db $20,$57,$6F,$78,$68,$7F,$2D,$79
	db $20,$67,$68,$6F,$72,$6F,$7A,$6F
	db $6B,$79,$33,$02,$0E,$FB,$15,$CB
	db $00,$0E,$E6,$15,$CB,$4E,$6B,$67
	db $7A,$20,$57,$6F,$74,$6D,$20,$50
	db $6B,$6A,$6B,$6A,$6B,$20,$7A,$75
	db $20,$7A,$6E,$6B,$02,$6D,$75,$67
	db $72,$33,$02,$0E,$FB,$15,$CB,$00
	db $0E,$E6,$15,$CB,$4F,$75,$72,$72
	db $6B,$69,$7A,$20,$76,$75,$6F,$74
	db $7A,$79,$20,$68,$7F,$20,$6B,$67
	db $7A,$6F,$74,$6D,$02,$67,$79,$20
	db $73,$7B,$69,$6E,$20,$6C,$75,$75
	db $6A,$20,$67,$79,$20,$7F,$75,$7B
	db $20,$69,$67,$74,$33,$02,$0E,$FB
	db $15,$CB,$00,$0E,$E6,$15,$CB,$58
	db $75,$75,$71,$20,$6C,$75,$78,$20
	db $6E,$6F,$6A,$6A,$6B,$74,$02,$7A
	db $78,$6B,$67,$79,$7B,$78,$6B,$79
	db "!",$02,$0E,$FB,$15,$CB,$00,$0E
	db $E6,$15,$CB,$5F,$67,$7C,$6B,$20
	db $7F,$75,$7B,$78,$20,$76,$78,$75
	db $6D,$78,$6B,$79,$79,$20,$6F,$74
	db $02,$7A,$6E,$6B,$20,$72,$75,$6D
	db $20,$69,$67,$68,$6F,$74,$79,$33
	db $02,$0E,$FB,$15,$CB,$00,$0E,$E6
	db $15,$CB,$52,$6F,$74,$6A,$20,$7A
	db $6E,$6B,$20,$50,$6B,$72,$7B,$7E
	db $6B,$20,$69,$75,$76,$7F,$02,$67
	db $68,$6F,$72,$6F,$7A,$7F,$20,$69
	db $6E,$67,$78,$67,$69,$7A,$6B,$78
	db $79,$20,$67,$74,$6A,$2B,$2B,$2B
	db $02,$0E,$FB,$15,$CB,$00,$0E,$E6
	db $15,$CB,$7F,$75,$7B,$2D,$72,$72
	db $20,$68,$6B,$20,$67,$68,$72,$6B
	db $20,$7A,$75,$20,$7B,$79,$6B,$02
	db $7A,$6E,$75,$79,$6B,$20,$67,$68
	db $6F,$72,$6F,$7A,$6F,$6B,$79,$20
	db $52,$5B,$5E,$51,$62,$51,$5E,$33
	db $02,$0E,$FB,$15,$CB,$00,$11,$04
	db $05,$00,$FF,$43,$11,$06,$05,$00
	db $00,$01,$14,$08,$02,$05,$FF,$06
	db $01,$00,$01,$00,$11,$02,$05,$00
	db $FF,$7F,$11,$06,$05,$00,$00,$00
	db $08,$01,$02,$5B,$68,$7A,$67,$6F
	db $74,$6B,$6A,$33,$02,$11,$04,$05
	db $00,$F0,$43,$08,$02,$62,$67,$72
	db $7B,$6B,$20,$2E,$20,$0F,$11,$77
	db $00,$53,$02,$0D,$3C,$00,$11,$02
	db $05,$00,$FF,$7F,$11,$04,$05,$00
	db $00,$00,$11,$06,$05,$00,$28,$29
	db $15,$08,$02,$05,$FF,$06,$01,$00
	db $01,$00,$11,$02,$05,$00,$FF,$7F
	db $11,$06,$05,$00,$28,$29,$14,$08
	db $01,$05,$FF,$06,$00,$00,$01,$00
	db $03,$00,$00,$00,$03,$00,$40,$00
	db $03,$00,$80,$00,$03,$00,$C0,$00
	db $0E,$BC,$15,$CB,$11,$06,$05,$00
	db $28,$29,$5F,$67,$7C,$6B,$20,$7F
	db $75,$7B,$78,$20,$78,$6B,$69,$75
	db $78,$6A,$34,$02,$20,$20,$20,$20
	db $20,$20,$65,$6B,$79,$20,$20,$20
	db $20,$5A,$20,$75,$00,$50,$6F,$73
	db $6B,$00,$22,$21,$21,$20,$6A,$75
	db $72,$72,$67,$78,$20,$69,$75,$6F
	db $74,$00,$4F,$6E,$67,$78,$73,$00
	db $5F,$67,$7B,$69,$6B,$76,$67,$74
	db $00,$63,$6E,$6F,$76,$00,$57,$6F
	db $74,$6D,$2D,$79,$20,$4F,$67,$76
	db $6B,$00,$4E,$6B,$67,$79,$7A,$2D
	db $79,$20,$52,$67,$74,$6D,$00,$4D
	db $74,$69,$6F,$6B,$74,$7A,$20,$53
	db $6B,$73,$00,$60,$78,$7B,$7A,$6E
	db $20,$59,$6F,$78,$78,$75,$78,$00
	db $53,$72,$67,$79,$79,$20,$5F,$72
	db $6F,$76,$76,$6B,$78,$79,$00,$58
	db $7B,$69,$71,$7F,$20,$4F,$67,$7A
	db $00,$5E,$67,$69,$69,$75,$75,$74
	db $20,$50,$75,$72,$72,$00,$60,$78
	db $6B,$67,$79,$7B,$78,$6B,$20,$4E
	db $75,$7E,$00,$51,$69,$6E,$6F,$6D
	db $75,$20,$4F,$67,$74,$6A,$7F,$00
	db $57,$67,$7A,$67,$74,$67,$00,$5B
	db $78,$6F,$6E,$67,$72,$69,$75,$74
	db $00,$5F,$7A,$67,$78,$20,$5F,$7A
	db $75,$74,$6B,$00,$4F,$78,$7F,$79
	db $7A,$67,$72,$20,$4E,$67,$72,$72
	db $00,$50,$7B,$6A,$00,$52,$6F,$79
	db $6E,$20,$52,$75,$79,$79,$6F,$72
	db $00,$4E,$6B,$67,$79,$7A,$20,$52
	db $75,$79,$79,$6F,$72,$00,$4D,$73
	db $68,$6B,$78,$20,$5E,$75,$79,$6B
	db $00,$5C,$72,$67,$7A,$6F,$74,$7B
	db $73,$20,$5E,$6F,$74,$6D,$00,$53
	db $75,$72,$6A,$20,$4F,$75,$6F,$74
	db $00,$53,$75,$68,$72,$6B,$7A,$00
	db $60,$7B,$7A,$2D,$79,$20,$59,$67
	db $79,$71,$00,$66,$6B,$68,$78,$67
	db $20,$59,$67,$79,$71,$00,$5E,$67
	db $73,$6F,$67,$2D,$79,$20,$5F,$69
	db $67,$72,$6B,$00,$5C,$6B,$6D,$67
	db $79,$7B,$79,$20,$63,$6F,$74,$6D
	db $00,$63,$67,$78,$78,$6F,$75,$78
	db $20,$5F,$6E,$6F,$6B,$72,$6A,$00
	db $4E,$67,$74,$6A,$67,$74,$74,$67
	db $00,$4D,$78,$73,$75,$78,$00,$53
	db $75,$72,$6A,$20,$4F,$78,$75,$7D
	db $74,$00,$5F,$76,$6F,$78,$6F,$7A
	db $20,$4F,$6E,$67,$78,$73,$00,$5F
	db $6B,$6F,$78,$7F,$7B,$20,$5F,$7D
	db $75,$78,$6A,$00,$61,$74,$6F,$69
	db $75,$78,$74,$2D,$79,$20,$54,$75
	db $78,$74,$00,$5F,$76,$78,$6F,$74
	db $6D,$7A,$6F,$73,$6B,$00,$5F,$7B
	db $73,$73,$6B,$78,$7A,$6F,$73,$6B
	db $00,$4D,$7B,$7A,$7B,$73,$74,$7A
	db $6F,$73,$6B,$00,$63,$6F,$74,$7A
	db $6B,$78,$7A,$6F,$73,$6B,$00,$5F
	db $6E,$6B,$72,$72,$20,$63,$6E,$6F
	db $79,$7A,$72,$6B,$00,$5F,$7A,$67
	db $78,$20,$60,$6F,$67,$78,$67,$00
	db $5F,$7B,$74,$20,$5E,$6F,$74,$6D
	db $00,$59,$75,$6A,$6B,$72,$20,$5F
	db $6E,$6F,$76,$00,$59,$67,$74,$74
	db $6B,$77,$7B,$6F,$74,$00,$4E,$78
	db $67,$79,$79,$20,$57,$74,$7B,$69
	db $71,$72,$6B,$00,$60,$7B,$78,$7A
	db $72,$6B,$20,$5F,$6E,$6B,$72,$72
	db $00,$60,$6F,$78,$6B,$00,$52,$67
	db $72,$69,$75,$74,$20,$54,$6B,$72
	db $73,$6B,$7A,$00,$57,$75,$74,$6D
	db $2D,$79,$20,$4E,$67,$78,$78,$6B
	db $72,$00,$5F,$69,$78,$6B,$7D,$20
	db $4E,$67,$72,$72,$00,$5F,$7D,$75
	db $78,$6A,$00,$59,$78,$2B,$20,$5F
	db $67,$7A,$7B,$78,$74,$00,$60,$78
	db $6F,$6C,$75,$78,$69,$6B,$00,$53
	db $75,$72,$6A,$20,$59,$6B,$6A,$67
	db $72,$00,$4E,$7B,$69,$71,$6B,$7A
	db $00,$5F,$6E,$6F,$74,$7F,$20,$4E
	db $67,$73,$68,$75,$75,$00,$5A,$7B
	db $74,$69,$6E,$7B,$71,$79,$00,$5E
	db $6F,$69,$6B,$20,$4E,$75,$7D,$72
	db $00,$64,$73,$67,$79,$20,$60,$78
	db $6B,$6B,$00,$0E,$FE,$33,$CB,$0E
	db $B5,$34,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$BA,$34,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$CA,$34,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$D0
	db $34,$CB,$0E,$14,$34,$CB,$00,$0E
	db $FE,$33,$CB,$0E,$D9,$34,$CB,$0E
	db $14,$34,$CB,$00,$0E,$FE,$33,$CB
	db $0E,$DE,$34,$CB,$0E,$14,$34,$CB
	db $00,$0E,$FE,$33,$CB,$0E,$EA,$34
	db $CB,$0E,$14,$34,$CB,$00,$0E,$FE
	db $33,$CB,$0E,$F7,$34,$CB,$0E,$14
	db $34,$CB,$00,$0E,$FE,$33,$CB,$0E
	db $03,$35,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$10,$35,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$1F,$35,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$29
	db $35,$CB,$0E,$14,$34,$CB,$00,$0E
	db $FE,$33,$CB,$0E,$36,$35,$CB,$0E
	db $14,$34,$CB,$00,$0E,$FE,$33,$CB
	db $0E,$43,$35,$CB,$0E,$14,$34,$CB
	db $00,$0E,$FE,$33,$CB,$0E,$50,$35
	db $CB,$0E,$14,$34,$CB,$00,$0E,$FE
	db $33,$CB,$0E,$57,$35,$CB,$0E,$14
	db $34,$CB,$00,$0E,$FE,$33,$CB,$0E
	db $61,$35,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$6C,$35,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$79,$35,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$7D
	db $35,$CB,$0E,$14,$34,$CB,$00,$0E
	db $FE,$33,$CB,$0E,$89,$35,$CB,$0E
	db $14,$34,$CB,$00,$0E,$FE,$33,$CB
	db $0E,$96,$35,$CB,$0E,$14,$34,$CB
	db $00,$0E,$FE,$33,$CB,$0E,$A1,$35
	db $CB,$0E,$14,$34,$CB,$00,$0E,$FE
	db $33,$CB,$0E,$AF,$35,$CB,$0E,$14
	db $34,$CB,$00,$0E,$FE,$33,$CB,$0E
	db $B9,$35,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$C0,$35,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$CB,$35,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$D6
	db $35,$CB,$0E,$14,$34,$CB,$00,$0E
	db $FE,$33,$CB,$0E,$E4,$35,$CB,$0E
	db $14,$34,$CB,$00,$0E,$FE,$33,$CB
	db $0E,$F1,$35,$CB,$0E,$14,$34,$CB
	db $00,$0E,$FE,$33,$CB,$0E,$00,$36
	db $CB,$0E,$14,$34,$CB,$00,$0E,$FE
	db $33,$CB,$0E,$09,$36,$CB,$0E,$14
	db $34,$CB,$00,$0E,$FE,$33,$CB,$0E
	db $0F,$36,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$1A,$36,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$27,$36,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$34
	db $36,$CB,$0E,$14,$34,$CB,$00,$0E
	db $FE,$33,$CB,$0E,$43,$36,$CB,$0E
	db $14,$34,$CB,$00,$0E,$FE,$33,$CB
	db $0E,$4E,$36,$CB,$0E,$14,$34,$CB
	db $00,$0E,$FE,$33,$CB,$0E,$59,$36
	db $CB,$0E,$14,$34,$CB,$00,$0E,$FE
	db $33,$CB,$0E,$64,$36,$CB,$0E,$14
	db $34,$CB,$00,$0E,$FE,$33,$CB,$0E
	db $6F,$36,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$7D,$36,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$88,$36,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$91
	db $36,$CB,$0E,$14,$34,$CB,$00,$0E
	db $FE,$33,$CB,$0E,$9C,$36,$CB,$0E
	db $14,$34,$CB,$00,$0E,$FE,$33,$CB
	db $0E,$A6,$36,$CB,$0E,$14,$34,$CB
	db $00,$0E,$FE,$33,$CB,$0E,$B4,$36
	db $CB,$0E,$14,$34,$CB,$00,$0E,$FE
	db $33,$CB,$0E,$C1,$36,$CB,$0E,$14
	db $34,$CB,$00,$0E,$FE,$33,$CB,$0E
	db $C6,$36,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$D4,$36,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$E2,$36,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$ED
	db $36,$CB,$0E,$14,$34,$CB,$00,$0E
	db $FE,$33,$CB,$0E,$F3,$36,$CB,$0E
	db $14,$34,$CB,$00,$0E,$FE,$33,$CB
	db $0E,$FE,$36,$CB,$0E,$14,$34,$CB
	db $00,$0E,$FE,$33,$CB,$0E,$07,$37
	db $CB,$0E,$14,$34,$CB,$00,$0E,$FE
	db $33,$CB,$0E,$12,$37,$CB,$0E,$14
	db $34,$CB,$00,$0E,$FE,$33,$CB,$0E
	db $19,$37,$CB,$0E,$14,$34,$CB,$00
	db $0E,$FE,$33,$CB,$0E,$26,$37,$CB
	db $0E,$14,$34,$CB,$00,$0E,$FE,$33
	db $CB,$0E,$2F,$37,$CB,$0E,$14,$34
	db $CB,$00,$0E,$FE,$33,$CB,$0E,$39
	db $37,$CB,$0E,$14,$34,$CB,$00,$0F
	db $4D,$7B,$00,$2E,$20,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$51,$73
	db $76,$7A,$7F,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$B5,$34,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$BA,$34,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$CA
	db $34,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$D0,$34,$CB,$00
	db $0E,$46,$34,$CB,$0E,$4F,$3A,$CB
	db $0E,$D9,$34,$CB,$00,$0E,$46,$34
	db $CB,$0E,$4F,$3A,$CB,$0E,$DE,$34
	db $CB,$00,$0E,$46,$34,$CB,$0E,$4F
	db $3A,$CB,$0E,$EA,$34,$CB,$00,$0E
	db $46,$34,$CB,$0E,$4F,$3A,$CB,$0E
	db $F7,$34,$CB,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$03,$35,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$10,$35,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$1F
	db $35,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$29,$35,$CB,$00
	db $0E,$46,$34,$CB,$0E,$4F,$3A,$CB
	db $0E,$36,$35,$CB,$00,$0E,$46,$34
	db $CB,$0E,$4F,$3A,$CB,$0E,$43,$35
	db $CB,$00,$0E,$46,$34,$CB,$0E,$4F
	db $3A,$CB,$0E,$50,$35,$CB,$00,$0E
	db $46,$34,$CB,$0E,$4F,$3A,$CB,$0E
	db $57,$35,$CB,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$61,$35,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$6C,$35,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$79
	db $35,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$7D,$35,$CB,$00
	db $0E,$46,$34,$CB,$0E,$4F,$3A,$CB
	db $0E,$89,$35,$CB,$00,$0E,$46,$34
	db $CB,$0E,$4F,$3A,$CB,$0E,$96,$35
	db $CB,$00,$0E,$46,$34,$CB,$0E,$4F
	db $3A,$CB,$0E,$A1,$35,$CB,$00,$0E
	db $46,$34,$CB,$0E,$4F,$3A,$CB,$0E
	db $AF,$35,$CB,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$B9,$35,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$C0,$35,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$CB
	db $35,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$D6,$35,$CB,$00
	db $0E,$46,$34,$CB,$0E,$4F,$3A,$CB
	db $0E,$E4,$35,$CB,$00,$0E,$46,$34
	db $CB,$0E,$4F,$3A,$CB,$0E,$F1,$35
	db $CB,$00,$0E,$46,$34,$CB,$0E,$4F
	db $3A,$CB,$0E,$00,$36,$CB,$00,$0E
	db $46,$34,$CB,$0E,$4F,$3A,$CB,$0E
	db $09,$36,$CB,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$0F,$36,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$1A,$36,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$27
	db $36,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$34,$36,$CB,$00
	db $0E,$46,$34,$CB,$0E,$4F,$3A,$CB
	db $0E,$43,$36,$CB,$00,$0E,$46,$34
	db $CB,$0E,$4F,$3A,$CB,$0E,$4E,$36
	db $CB,$00,$0E,$46,$34,$CB,$0E,$4F
	db $3A,$CB,$0E,$59,$36,$CB,$00,$0E
	db $46,$34,$CB,$0E,$4F,$3A,$CB,$0E
	db $64,$36,$CB,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$6F,$36,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$7D,$36,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$88
	db $36,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$91,$36,$CB,$00
	db $0E,$46,$34,$CB,$0E,$4F,$3A,$CB
	db $0E,$9C,$36,$CB,$00,$0E,$46,$34
	db $CB,$0E,$4F,$3A,$CB,$0E,$A6,$36
	db $CB,$00,$0E,$46,$34,$CB,$0E,$4F
	db $3A,$CB,$0E,$B4,$36,$CB,$00,$0E
	db $46,$34,$CB,$0E,$4F,$3A,$CB,$0E
	db $C1,$36,$CB,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$C6,$36,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$D4,$36,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$E2
	db $36,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$ED,$36,$CB,$00
	db $0E,$46,$34,$CB,$0E,$4F,$3A,$CB
	db $0E,$F3,$36,$CB,$00,$0E,$46,$34
	db $CB,$0E,$4F,$3A,$CB,$0E,$FE,$36
	db $CB,$00,$0E,$46,$34,$CB,$0E,$4F
	db $3A,$CB,$0E,$07,$37,$CB,$00,$0E
	db $46,$34,$CB,$0E,$4F,$3A,$CB,$0E
	db $12,$37,$CB,$00,$0E,$46,$34,$CB
	db $0E,$4F,$3A,$CB,$0E,$19,$37,$CB
	db $00,$0E,$46,$34,$CB,$0E,$4F,$3A
	db $CB,$0E,$26,$37,$CB,$00,$0E,$46
	db $34,$CB,$0E,$4F,$3A,$CB,$0E,$2F
	db $37,$CB,$00,$0E,$46,$34,$CB,$0E
	db $4F,$3A,$CB,$0E,$39,$37,$CB,$00
	db $08,$00,$15,$6E,$67,$72,$02,$6E
	db $67,$72,$14,$00,$65,$75,$7B,$20
	db $6A,$6F,$6A,$74,$2D,$7A,$20,$6C
	db $6F,$74,$6A,$02,$67,$74,$7F,$20
	db $7A,$78,$6B,$67,$79,$7B,$78,$6B
	db $79,$2B,$00,$60,$78,$6B,$67,$79
	db $7B,$78,$6B,$79,$02,$6C,$75,$7B
	db $74,$6A,$2E,$20,$0F,$11,$77,$00
	db $39,$27,$21,$00,$60,$75,$7A,$67
	db $72,$2E,$02,$0F,$0F,$7B,$00,$53
	db $00,$0E,$B5,$34,$CB,$02,$0F,$5B
	db $4B,$CF,$53,$00,$0E,$BA,$34,$CB
	db $02,$0F,$92,$4B,$CF,$53,$00,$0E
	db $CA,$34,$CB,$02,$0F,$05,$4C,$CF
	db $53,$00,$0E,$D0,$34,$CB,$02,$0F
	db $6A,$4B,$CF,$53,$00,$0E,$D9,$34
	db $CB,$02,$0F,$24,$4B,$CF,$53,$00
	db $0E,$DE,$34,$CB,$02,$0F,$EC,$4B
	db $CF,$53,$00,$0E,$EA,$34,$CB,$02
	db $0F,$4C,$4B,$CF,$53,$00,$0E,$F7
	db $34,$CB,$02,$0F,$97,$4B,$CF,$53
	db $00,$0E,$03,$35,$CB,$02,$0F,$A6
	db $4B,$CF,$53,$00,$0E,$10,$35,$CB
	db $02,$0F,$60,$4B,$CF,$53,$00,$0E
	db $1F,$35,$CB,$02,$0F,$2E,$4B,$CF
	db $53,$00,$0E,$29,$35,$CB,$02,$0F
	db $2D,$4C,$CF,$53,$00,$0E,$36,$35
	db $CB,$02,$0F,$DD,$4B,$CF,$53,$00
	db $0E,$43,$35,$CB,$02,$0F,$3D,$4B
	db $CF,$53,$00,$0E,$50,$35,$CB,$02
	db $0F,$00,$4C,$CF,$53,$00,$0E,$57
	db $35,$CB,$02,$0F,$37,$4C,$CF,$53
	db $00,$0E,$61,$35,$CB,$02,$0F,$47
	db $4B,$CF,$53,$00,$0E,$6C,$35,$CB
	db $02,$0F,$29,$4B,$CF,$53,$00,$0E
	db $79,$35,$CB,$02,$0F,$A1,$4B,$CF
	db $53,$00,$0E,$7D,$35,$CB,$02,$0F
	db $79,$4B,$CF,$53,$00,$0E,$89,$35
	db $CB,$02,$0F,$7E,$4B,$CF,$53,$00
	db $0E,$96,$35,$CB,$02,$0F,$74,$4B
	db $CF,$53,$00,$0E,$A1,$35,$CB,$02
	db $0F,$3C,$4C,$CF,$53,$00,$0E,$AF
	db $35,$CB,$02,$0F,$1F,$4B,$CF,$53
	db $00,$0E,$B9,$35,$CB,$02,$0F,$65
	db $4B,$CF,$53,$00,$0E,$C0,$35,$CB
	db $02,$0F,$CE,$4B,$CF,$53,$00,$0E
	db $CB,$35,$CB,$02,$0F,$42,$4B,$CF
	db $53,$00,$0E,$D6,$35,$CB,$02,$0F
	db $14,$4C,$CF,$53,$00,$0E,$E4,$35
	db $CB,$02,$0F,$28,$4C,$CF,$53,$00
	db $0E,$F1,$35,$CB,$02,$0F,$BA,$4B
	db $CF,$53,$00,$0E,$00,$36,$CB,$02
	db $0F,$51,$4B,$CF,$53,$00,$0E,$09
	db $36,$CB,$02,$0F,$D8,$4B,$CF,$53
	db $00,$0E,$0F,$36,$CB,$02,$0F,$E7
	db $4B,$CF,$53,$00,$0E,$1A,$36,$CB
	db $02,$0F,$23,$4C,$CF,$53,$00,$0E
	db $27,$36,$CB,$02,$0F,$33,$4B,$CF
	db $53,$00,$0E,$34,$36,$CB,$02,$0F
	db $BF,$4B,$CF,$53,$00,$0E,$43,$36
	db $CB,$02,$0F,$56,$4B,$CF,$53,$00
	db $0E,$4E,$36,$CB,$02,$0F,$8D,$4B
	db $CF,$53,$00,$0E,$59,$36,$CB,$02
	db $0F,$C4,$4B,$CF,$53,$00,$0E,$64
	db $36,$CB,$02,$0F,$FB,$4B,$CF,$53
	db $00,$0E,$6F,$36,$CB,$02,$0F,$32
	db $4C,$CF,$53,$00,$0E,$7D,$36,$CB
	db $02,$0F,$AB,$4B,$CF,$53,$00,$0E
	db $88,$36,$CB,$02,$0F,$F6,$4B,$CF
	db $53,$00,$0E,$91,$36,$CB,$02,$0F
	db $F1,$4B,$CF,$53,$00,$0E,$9C,$36
	db $CB,$02,$0F,$E2,$4B,$CF,$53,$00
	db $0E,$A6,$36,$CB,$02,$0F,$6F,$4B
	db $CF,$53,$00,$0E,$B4,$36,$CB,$02
	db $0F,$B0,$4B,$CF,$53,$00,$0E,$C1
	db $36,$CB,$02,$0F,$1E,$4C,$CF,$53
	db $00,$0E,$C6,$36,$CB,$02,$0F,$9C
	db $4B,$CF,$53,$00,$0E,$D4,$36,$CB
	db $02,$0F,$0F,$4C,$CF,$53,$00,$0E
	db $E2,$36,$CB,$02,$0F,$38,$4B,$CF
	db $53,$00,$0E,$ED,$36,$CB,$02,$0F
	db $B5,$4B,$CF,$53,$00,$0E,$F3,$36
	db $CB,$02,$0F,$D3,$4B,$CF,$53,$00
	db $0E,$FE,$36,$CB,$02,$0F,$41,$4C
	db $CF,$53,$00,$0E,$07,$37,$CB,$02
	db $0F,$1A,$4B,$CF,$53,$00,$0E,$12
	db $37,$CB,$02,$0F,$88,$4B,$CF,$53
	db $00,$0E,$19,$37,$CB,$02,$0F,$19
	db $4C,$CF,$53,$00,$0E,$26,$37,$CB
	db $02,$0F,$83,$4B,$CF,$53,$00,$0E
	db $2F,$37,$CB,$02,$0F,$C9,$4B,$CF
	db $53,$00,$0E,$39,$37,$CB,$02,$0F
	db $0A,$4C,$CF,$53,$00,$11,$35,$7B
	db $00,$01,$00,$11,$02,$05,$00,$FF
	db $7F,$11,$06,$05,$00,$E0,$2F,$08
	db $01,$05,$FF,$06,$01,$01,$1D,$37
	db $01,$00,$0D,$F0,$01,$00,$11,$02
	db $05,$00,$FF,$7F,$11,$06,$05,$00
	db $00,$02,$08,$01,$05,$FF,$06,$01
	db $01,$1D,$37,$01,$00,$0D,$B4,$1D
	db $00,$01,$00,$0D,$10,$0C,$40,$C0
	db $01,$00,$0D,$10,$12,$07,$40,$C0
	db $0D,$F0,$07,$00,$00,$13,$00,$0D
	db $10,$12,$0C,$40,$C0,$13,$00,$13
	db $0D,$10,$0C,$40,$C0,$00,$01,$10
	db $23,$7A,$00,$10,$00,$01,$10,$23
	db $7A,$00,$FF,$11,$35,$7B,$00,$00
	db $00,$00,$01,$10,$23,$7A,$00,$00
	db $00,$01,$10,$23,$7A,$00,$01,$00
	db $01,$10,$23,$7A,$00,$02,$00,$01
	db $10,$23,$7A,$00,$03,$00,$01,$10
	db $23,$7A,$00,$04,$00,$01,$10,$23
	db $7A,$00,$05,$00,$01,$10,$23,$7A
	db $00,$06,$00,$01,$10,$23,$7A,$00
	db $07,$00,$01,$10,$23,$7A,$00,$0A
	db $00,$01,$10,$23,$7A,$00,$0D,$00
	db $01,$10,$23,$7A,$00,$0C,$00,$01
	db $10,$23,$7A,$00,$0F,$00,$01,$10
	db $23,$7A,$00,$0B,$00,$01,$10,$23
	db $7A,$00,$0E,$00,$01,$10,$23,$7A
	db $00,$08,$00,$01,$10,$23,$7A,$00
	db $09,$00,$0E,$76,$40,$CB,$0E,$CA
	db $40,$CB,$4A,$5E,$6B,$67,$69,$7A
	db $75,$78,$20,$22,$2C,$20,$75,$7B
	db $7A,$76,$7B,$7A,$20,$74,$75,$78
	db $73,$67,$72,$2B,$4B,$02,$4A,$4D
	db $6A,$70,$7B,$79,$7A,$20,$7A,$6E
	db $6B,$20,$68,$67,$72,$67,$74,$69
	db $6B,$78,$02,$7A,$75,$20,$2B,$2B
	db $2B,$21,$21,$21,$24,$33,$4B,$02
	db $0E,$8D,$40,$CB,$0E,$BD,$40,$CB
	db $00,$0E,$76,$40,$CB,$0E,$ED,$40
	db $CB,$4A,$58,$6B,$7A,$2D,$79,$20
	db $78,$67,$6F,$79,$6B,$20,$7A,$6E
	db $6B,$20,$67,$74,$69,$6E,$75,$78
	db $2B,$4B,$02,$4A,$4F,$6E,$6B,$69
	db $71,$20,$67,$74,$7A,$6F,$30,$6D
	db $78,$67,$7C,$6F,$7A,$7F,$02,$76
	db $72,$67,$74,$7A,$2B,$20,$20,$22
	db $2C,$20,$23,$2C,$20,$24,$20,$5B
	db $57,$33,$33,$4B,$02,$0E,$8D,$40
	db $CB,$0E,$BD,$40,$CB,$00,$0E,$76
	db $40,$CB,$0E,$D8,$40,$CB,$4A,$5E
	db $6B,$72,$6B,$67,$79,$6B,$20,$7A
	db $6E,$6B,$20,$79,$67,$6F,$72,$79
	db $2C,$20,$02,$79,$75,$72,$67,$78
	db $20,$72,$6B,$7C,$6B,$72,$20,$23
	db $29,$29,$33,$4B,$02,$0D,$B4,$0E
	db $02,$41,$CB,$4A,$4D,$72,$72,$20
	db $78,$6B,$67,$6A,$7F,$02,$6C,$75
	db $78,$20,$6A,$6B,$76,$67,$78,$7A
	db $7B,$78,$6B,$2B,$4B,$02,$0E,$8D
	db $40,$CB,$0E,$BD,$40,$CB,$00,$0E
	db $76,$40,$CB,$0E,$2C,$41,$CB,$4A
	db $60,$6E,$6B,$20,$7A,$6F,$73,$6B
	db $20,$6E,$67,$79,$20,$69,$75,$73
	db $6B,$2B,$02,$60,$6E,$6B,$20,$7A
	db $6F,$73,$6B,$20,$7A,$75,$20,$79
	db $6E,$75,$7D,$02,$75,$7B,$78,$20
	db $76,$75,$7D,$6B,$78,$33,$4B,$02
	db $0D,$B4,$0E,$33,$41,$CB,$4A,$50
	db $78,$6B,$67,$73,$20,$58,$67,$74
	db $6A,$2D,$79,$20,$72,$67,$80,$7F
	db $20,$02,$20,$72,$6F,$6C,$6B,$79
	db $7A,$7F,$72,$6B,$20,$7D,$6F,$72
	db $72,$20,$6B,$74,$6A,$33,$20,$02
	db $55,$20,$7D,$6F,$72,$72,$20,$78
	db $7B,$72,$6B,$33,$4B,$02,$0E,$8D
	db $40,$CB,$0E,$BD,$40,$CB,$00,$0E
	db $55,$40,$CB,$1E,$00,$0E,$DF,$40
	db $CB,$4A,$57,$2B,$2B,$2B,$57,$6F
	db $78,$68,$7F,$2D,$79,$20,$6E,$6B
	db $78,$6B,$33,$20,$20,$54,$6B,$2D
	db $79,$02,$20,$20,$6E,$6B,$67,$6A
	db $6F,$74,$6D,$20,$7A,$75,$7D,$67
	db $78,$6A,$79,$20,$7B,$79,$33,$4B
	db $02,$0E,$A7,$40,$CB,$0E,$D1,$40
	db $CB,$4A,$5B,$6E,$20,$73,$7F,$20
	db $6D,$75,$79,$6E,$33,$02,$20,$20
	db $63,$6E,$67,$7A,$20,$67,$78,$6B
	db $20,$7D,$6B,$20,$6D,$75,$74,$74
	db $67,$20,$6A,$75,$34,$4B,$02,$0E
	db $A7,$40,$CB,$0E,$F4,$40,$CB,$4A
	db $54,$6B,$2D,$72,$72,$20,$6D,$6B
	db $7A,$20,$6F,$74,$20,$7A,$6E,$6B
	db $20,$7D,$67,$7F,$2B,$02,$20,$20
	db $53,$6B,$7A,$20,$78,$6F,$6A,$20
	db $75,$6C,$20,$6E,$6F,$73,$33,$4B
	db $02,$0E,$A7,$40,$CB,$0E,$02,$41
	db $CB,$4A,$5F,$6F,$78,$20,$59,$6B
	db $7A,$67,$30,$57,$74,$6F,$6D,$6E
	db $7A,$2C,$02,$7D,$6E,$67,$7A,$20
	db $79,$6E,$67,$72,$72,$20,$7D,$6B
	db $20,$6A,$75,$34,$4B,$02,$0E,$A7
	db $40,$CB,$0E,$33,$41,$CB,$4A,$5F
	db $75,$72,$6A,$6F,$6B,$78,$79,$20
	db $74,$6B,$67,$78,$20,$7A,$6E,$6B
	db $20,$6A,$6B,$69,$71,$2C,$02,$20
	db $20,$67,$79,$79,$7B,$73,$6B,$20
	db $69,$75,$73,$68,$67,$7A,$20,$73
	db $75,$6A,$6B,$33,$4B,$02,$0E,$A7
	db $40,$CB,$0E,$BD,$40,$CB,$1E,$33
	db $00,$0E,$55,$40,$CB,$0E,$D8,$40
	db $CB,$4A,$57,$6F,$78,$68,$7F,$2D
	db $79,$20,$6F,$74,$20,$7A,$6E,$6B
	db $02,$78,$75,$69,$71,$6B,$7A,$20
	db $7C,$67,$72,$7C,$6B,$33,$4B,$02
	db $0E,$A7,$40,$CB,$0E,$17,$41,$CB
	db $4A,$5E,$6B,$72,$6B,$67,$79,$6B
	db $20,$54,$6B,$67,$7C,$7F,$20,$58
	db $75,$68,$79,$7A,$6B,$78,$33,$02
	db $5D,$7B,$6F,$69,$71,$72,$7F,$33
	db $20,$5D,$7B,$6F,$69,$71,$72,$7F
	db $33,$4B,$02,$0E,$AF,$40,$CB,$0E
	db $BD,$40,$CB,$00,$0E,$55,$40,$CB
	db $0E,$ED,$40,$CB,$4A,$57,$6F,$78
	db $68,$7F,$2D,$79,$20,$68,$6B,$6E
	db $6F,$74,$6A,$20,$7A,$6E,$6B,$02
	db $20,$74,$75,$80,$80,$72,$6B,$33
	db $20,$52,$6F,$7E,$20,$6E,$6F,$73
	db $33,$4B,$02,$0D,$C8,$0E,$2C,$41
	db $CB,$4A,$5C,$78,$6B,$76,$67,$78
	db $6B,$20,$7A,$75,$20,$7A,$67,$71
	db $6B,$20,$75,$6C,$6C,$33,$02,$4E
	db $72,$75,$7D,$20,$57,$6F,$78,$68
	db $7F,$20,$67,$7D,$67,$7F,$33,$4B
	db $02,$0D,$C8,$0E,$D8,$40,$CB,$4A
	db $5B,$57,$33,$02,$59,$67,$6F,$74
	db $20,$6B,$74,$6D,$6F,$74,$6B,$20
	db $6F,$6D,$74,$6F,$7A,$6F,$75,$74
	db $33,$4B,$02,$0D,$78,$0E,$17,$41
	db $CB,$4A,$60,$67,$71,$6B,$20,$75
	db $6C,$6C,$33,$4B,$02,$0D,$B4,$0E
	db $BD,$40,$CB,$00,$0E,$55,$40,$CB
	db $1E,$00,$0E,$D8,$40,$CB,$4A,$57
	db $6F,$78,$68,$7F,$2D,$79,$20,$68
	db $6B,$6B,$74,$20,$68,$72,$75,$7D
	db $74,$20,$7A,$75,$02,$7A,$6E,$6B
	db $20,$75,$69,$6B,$67,$74,$33,$4B
	db $02,$0E,$A7,$40,$CB,$0E,$ED,$40
	db $CB,$4A,$60,$6E,$67,$7A,$20,$7D
	db $67,$79,$20,$79,$7B,$78,$6B,$20
	db $69,$72,$75,$79,$6B,$2B,$4B,$02
	db $0E,$A7,$40,$CB,$0E,$02,$41,$CB
	db $4A,$55,$2D,$72,$72,$20,$69,$75
	db $74,$77,$7B,$6B,$78,$20,$50,$78
	db $6B,$67,$73,$20,$58,$67,$74,$6A
	db $20,$02,$7D,$6F,$7A,$6E,$20,$7A
	db $6E,$6B,$20,$54,$67,$72,$68,$6B
	db $78,$6A,$33,$4B,$02,$0E,$A7,$40
	db $CB,$0E,$2C,$41,$CB,$4A,$5B,$7B
	db $78,$20,$6C,$6F,$78,$79,$7A,$20
	db $7A,$67,$78,$6D,$6B,$7A,$2B,$2B
	db $2B,$02,$20,$20,$53,$78,$67,$76
	db $6B,$20,$53,$67,$78,$6A,$6B,$74
	db $33,$4B,$02,$0E,$AF,$40,$CB,$0E
	db $BD,$40,$CB,$1E,$03,$00,$0E,$55
	db $40,$CB,$0E,$DF,$40,$CB,$4A,$57
	db $6F,$78,$68,$7F,$20,$6F,$79,$20
	db $6C,$72,$7F,$6F,$74,$6D,$02,$20
	db $20,$68,$67,$69,$71,$20,$7A,$75
	db $7D,$67,$78,$6A,$20,$7B,$79,$33
	db $4B,$02,$0D,$78,$0E,$ED,$40,$CB
	db $4A,$59,$67,$6F,$74,$20,$69,$67
	db $74,$74,$75,$74,$2D,$79,$20,$78
	db $6B,$67,$6A,$7F,$2B,$02,$20,$20
	db $5F,$6E,$67,$72,$72,$20,$7D,$6B
	db $20,$68,$72,$67,$79,$7A,$20,$6E
	db $6F,$73,$34,$4B,$02,$0D,$8C,$0E
	db $1E,$41,$CB,$4A,$4D,$72,$72,$20
	db $78,$6F,$6D,$6E,$7A,$2B,$20,$20
	db $5F,$6E,$75,$75,$7A,$20,$6E,$6F
	db $73,$33,$4B,$02,$0E,$72,$40,$CB
	db $0E,$BD,$40,$CB,$00,$0E,$55,$40
	db $CB,$0E,$D8,$40,$CB,$4A,$63,$6B
	db $20,$6D,$75,$7A,$20,$6E,$6F,$73
	db "!",$02,$20,$20,$54,$6B,$20,$6C
	db $6B,$72,$72,$20,$6F,$74,$7A,$75
	db $20,$7A,$6E,$6B,$20,$6C,$75,$78
	db $6B,$79,$7A,$2B,$4B,$02,$0E,$A7
	db $40,$CB,$0E,$1E,$41,$CB,$4A,$53
	db $75,$75,$6A,$2B,$02,$20,$54,$6B
	db $20,$7D,$6F,$72,$72,$20,$74,$6B
	db $7C,$6B,$78,$20,$69,$67,$7A,$69
	db $6E,$20,$7B,$76,$2B,$4B,$02,$0E
	db $A7,$40,$CB,$0E,$CA,$40,$CB,$4A
	db $4D,$78,$6B,$20,$7F,$75,$7B,$20
	db $79,$7B,$78,$6B,$34,$4B,$0E,$A7
	db $40,$CB,$0E,$BD,$40,$CB,$00,$0E
	db $55,$40,$CB,$0E,$DF,$40,$CB,$4A
	db $63,$6B,$20,$79,$6E,$75,$7A,$20
	db $6A,$75,$7D,$74,$02,$20,$20,$50
	db $7F,$74,$67,$20,$4E,$72,$67,$6A
	db $6B,$33,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$F4,$40,$CB,$4A,$58,$75,$75
	db $71,$33,$20,$57,$6F,$78,$68,$7F
	db $2D,$79,$20,$78,$6B,$67,$69,$6E
	db $6B,$6A,$20,$02,$20,$7A,$6E,$6B
	db $20,$6A,$6B,$69,$71,$2B,$4B,$02
	db $0E,$A7,$40,$CB,$0E,$33,$41,$CB
	db $4A,$5E,$6B,$73,$67,$6F,$74,$20
	db $69,$67,$72,$73,$2B,$20,$58,$6B
	db $7A,$2D,$79,$20,$69,$75,$73,$6B
	db $02,$20,$20,$7B,$76,$20,$7D,$6F
	db $7A,$6E,$20,$67,$20,$76,$72,$67
	db $74,$2B,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$17,$41,$CB,$4A,$4D,$72,$72
	db $20,$79,$75,$72,$6A,$6F,$6B,$78
	db $79,$33,$02,$20,$20,$53,$6B,$7A
	db $20,$57,$6F,$78,$68,$7F,$2B,$20
	db $5A,$75,$7D,$33,$4B,$02,$0E,$A7
	db $40,$CB,$0E,$BD,$40,$CB,$00,$0E
	db $55,$40,$CB,$0E,$33,$41,$CB,$4A
	db $57,$6F,$78,$68,$7F,$33,$20,$53
	db $75,$7A,$20,$7F,$67,$33,$4B,$02
	db $0E,$A7,$40,$CB,$0E,$17,$41,$CB
	db $4A,$5A,$75,$7D,$20,$7F,$75,$7B
	db $20,$6D,$6B,$7A,$20,$67,$20,$7A
	db $67,$79,$7A,$6B,$02,$75,$6C,$20
	db $75,$7B,$78,$20,$76,$75,$7D,$6B
	db $78,$2B,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$CA,$40,$CB,$4A,$52,$6F,$6D
	db $6E,$7A,$33,$4B,$02,$0E,$A7,$40
	db $CB,$0E,$BD,$40,$CB,$00,$0E,$55
	db $40,$CB,$0E,$ED,$40,$CB,$4A,$57
	db $6F,$78,$68,$7F,$2D,$79,$20,$6D
	db $75,$74,$74,$67,$20,$78,$6B,$67
	db $69,$6E,$02,$20,$7A,$6E,$6B,$20
	db $6A,$6B,$69,$71,$33,$4B,$02,$0E
	db $A7,$40,$CB,$0E,$02,$41,$CB,$4A
	db $50,$6F,$78,$6B,$69,$7A,$20,$6E
	db $6F,$73,$20,$7A,$75,$20,$7A,$6E
	db $6B,$20,$6C,$78,$75,$74,$7A,$02
	db $20,$75,$6C,$20,$7A,$6E,$6B,$20
	db $7A,$7D,$6F,$74,$20,$69,$67,$74
	db $74,$75,$74,$2B,$4B,$02,$0E,$AF
	db $40,$CB,$0E,$BD,$40,$CB,$00,$0E
	db $55,$40,$CB,$0E,$D8,$40,$CB,$4A
	db $57,$6F,$78,$68,$7F,$20,$6F,$79
	db $20,$6D,$6B,$7A,$7A,$6F,$74,$6D
	db $20,$69,$72,$75,$79,$6B,$02,$7A
	db $75,$20,$7A,$6E,$6B,$20,$7A,$7D
	db $6F,$74,$20,$69,$67,$74,$74,$75
	db $74,$2B,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$1E,$41,$CB,$4A,$57,$6F,$78
	db $68,$7F,$20,$7D,$6F,$72,$72,$20
	db $68,$6B,$20,$7A,$75,$78,$69,$6E
	db $6B,$6A,$33,$02,$63,$67,$6E,$67
	db $6E,$67,$6E,$67,$6E,$67,$6E,$67
	db $6E,$67,$33,$4B,$02,$0E,$A7,$40
	db $CB,$0E,$CA,$40,$CB,$4A,$54,$67
	db $6E,$67,$6E,$67,$6E,$67,$6E,$67
	db $6E,$67,$33,$4B,$02,$0E,$A7,$40
	db $CB,$0E,$1E,$41,$CB,$4A,$63,$67
	db $6E,$67,$6E,$67,$6E,$67,$6E,$67
	db $6E,$67,$6E,$67,$33,$02,$53,$67
	db $6E,$67,$6E,$67,$6E,$67,$6E,$67
	db $6E,$67,$6E,$67,$6E,$67,$33,$20
	db $20,$54,$7B,$73,$2B,$4B,$02,$0E
	db $AF,$40,$CB,$0E,$BD,$40,$CB,$00
	db $0E,$55,$40,$CB,$0E,$25,$41,$CB
	db $4A,$5B,$6E,$20,$74,$75,$33,$20
	db $54,$6B,$20,$6C,$75,$7B,$74,$6A
	db $20,$6F,$7A,$2B,$4B,$02,$0E,$A7
	db $40,$CB,$0E,$ED,$40,$CB,$4A,$63
	db $6E,$67,$7A,$20,$6F,$79,$20,$7A
	db $6E,$6F,$79,$20,$76,$72,$67,$69
	db $6B,$34,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$BD,$40,$CB,$00,$0E,$55,$40
	db $CB,$0E,$F4,$40,$CB,$4A,$60,$6E
	db $6B,$20,$73,$67,$6F,$74,$20,$69
	db $67,$74,$74,$75,$74,$20,$6E,$67
	db $79,$02,$20,$20,$68,$6B,$6B,$74
	db $20,$6A,$6B,$79,$7A,$78,$75,$7F
	db $6B,$6A,$33,$4B,$02,$0D,$F0,$0E
	db $09,$41,$CB,$4A,$54,$75,$72,$7F
	db $20,$69,$75,$7D,$33,$02,$20,$20
	db $63,$6E,$67,$7A,$20,$6E,$67,$76
	db $76,$6B,$74,$6B,$6A,$34,$4B,$02
	db $0D,$F0,$0E,$D8,$40,$CB,$4A,$57
	db $6F,$78,$68,$7F,$20,$6F,$79,$20
	db $6E,$6B,$67,$6A,$6F,$74,$6D,$20
	db $02,$7A,$75,$7D,$67,$78,$6A,$20
	db $7A,$6E,$6B,$20,$72,$6B,$6C,$7A
	db $20,$7D,$6F,$74,$6D,$2B,$4B,$02
	db $0E,$72,$40,$CB,$0E,$BD,$40,$CB
	db $00,$0E,$55,$40,$CB,$0E,$DF,$40
	db $CB,$4A,$5F,$6B,$78,$6F,$75,$7B
	db $79,$20,$6A,$67,$73,$67,$6D,$6B
	db $20,$7A,$75,$20,$7A,$6E,$6B,$02
	db $20,$72,$6B,$6C,$7A,$20,$7D,$6F
	db $74,$6D,$33,$20,$4D,$76,$76,$78
	db $75,$7E,$2B,$28,$25,$42,$33,$4B
	db $02,$0E,$A7,$40,$CB,$0E,$09,$41
	db $CB,$4A,$53,$7B,$2B,$2B,$2B,$2B
	db $2B,$7B,$33,$33,$4B,$0E,$A7,$40
	db $CB,$0E,$F4,$40,$CB,$4A,$63,$6B
	db $2D,$78,$6B,$20,$6D,$75,$74,$74
	db $67,$02,$20,$20,$72,$75,$79,$6B
	db $20,$68,$67,$72,$67,$74,$69,$6B
	db $33,$4B,$02,$0E,$A7,$40,$CB,$0E
	db $33,$41,$CB,$4A,$58,$75,$7D,$6B
	db $78,$20,$7A,$6E,$6B,$20,$79,$67
	db $6F,$72,$33,$20,$55,$74,$69,$78
	db $6B,$67,$79,$6B,$20,$02,$78,$6F
	db $6D,$6E,$7A,$20,$7D,$6F,$74,$6D
	db $20,$76,$75,$7D,$6B,$78,$33,$4B
	db $02,$0E,$AF,$40,$CB,$0E,$BD,$40
	db $CB,$00,$0E,$55,$40,$CB,$0E,$D8
	db $40,$CB,$4A,$20,$57,$6F,$78,$68
	db $7F,$20,$6F,$79,$20,$73,$75,$7C
	db $6F,$74,$6D,$20,$6F,$74,$7A,$75
	db $02,$7A,$6E,$6B,$20,$6A,$7B,$69
	db $7A,$2B,$4B,$02,$0D,$F0,$0E,$02
	db $41,$CB,$4A,$63,$6E,$67,$7A,$20
	db $6F,$79,$20,$6E,$6B,$20,$7A,$78
	db $7F,$6F,$74,$6D,$20,$7A,$75,$20
	db $6A,$75,$34,$4B,$02,$0D,$F0,$0E
	db $CA,$40,$CB,$4A,$55,$79,$20,$6E
	db $6B,$20,$72,$75,$79,$7A,$34,$4B
	db $02,$0D,$F0,$0E,$25,$41,$CB,$4A
	db $63,$67,$6F,$7A,$2B,$2B,$2B,$2B
	db $55,$20,$6E,$67,$7C,$6B,$20,$67
	db $74,$20,$6F,$6A,$6B,$67,$2B,$02
	db $20,$20,$54,$6B,$6B,$20,$6E,$6B
	db $6B,$20,$6E,$6B,$6B,$2B,$4B,$02
	db $0E,$72,$40,$CB,$0E,$BD,$40,$CB
	db $00,$0E,$55,$40,$CB,$0E,$25,$41
	db $CB,$4A,$54,$6B,$20,$6D,$75,$7A
	db $20,$6F,$74,$7A,$75,$20,$7A,$6E
	db $6B,$20,$67,$78,$73,$75,$78,$7F
	db $2B,$4B,$02,$0E,$A7,$40,$CB,$0E
	db $ED,$40,$CB,$4A,$54,$6B,$2D,$72
	db $72,$20,$68,$6B,$20,$67,$68,$72
	db $6B,$20,$7A,$75,$02,$20,$20,$7A
	db $67,$71,$6B,$20,$4D,$5A,$65,$60
	db $54,$55,$5A,$53,$33,$4B,$02,$0E
	db $AF,$40,$CB,$0E,$BD,$40,$CB,$00
	db $0E,$55,$40,$CB,$0E,$02,$41,$CB
	db $4A,$5E,$6B,$67,$6A,$7F,$34,$4B
	db $0E,$A7,$40,$CB,$0E,$D8,$40,$CB
	db $4A,$55,$79,$20,$7A,$6E,$6F,$79
	db $20,$5B,$57,$2C,$20,$20,$5F,$6F
	db $78,$34,$4B,$0E,$A7,$40,$CB,$0E
	db $ED,$40,$CB,$4A,$4D,$78,$6B,$20
	db $7F,$75,$7B,$20,$76,$75,$79,$6F
	db $7A,$6F,$7C,$6B,$02,$20,$20,$67
	db $68,$75,$7B,$7A,$20,$7A,$6E,$6F
	db $79,$34,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$17,$41,$CB,$4A,$4E,$6B,$20
	db $77,$7B,$6F,$6B,$7A,$33,$20,$20
	db $60,$6E,$6F,$79,$20,$6F,$79,$02
	db $20,$20,$75,$7B,$78,$20,$75,$74
	db $72,$7F,$20,$69,$6E,$67,$74,$69
	db $6B,$33,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$09,$41,$CB,$4A,$50,$75,$74
	db $2D,$7A,$20,$6C,$67,$6F,$72,$20
	db $67,$6D,$67,$6F,$74,$33,$02,$5E
	db $6B,$72,$6B,$67,$79,$6B,$20,$54
	db $6B,$67,$7C,$7F,$20,$58,$75,$68
	db $79,$7A,$6B,$78,$33,$4B,$02,$0E
	db $AF,$40,$CB,$0E,$BD,$40,$CB,$00
	db $0E,$55,$40,$CB,$0E,$1E,$41,$CB
	db $4A,$54,$6B,$6B,$20,$6E,$6B,$6B
	db $20,$6E,$6B,$6B,$20,$6E,$6B,$6B
	db "!",$02,$20,$20,$53,$6B,$7A,$20
	db $57,$6F,$78,$68,$7F,$33,$4B,$02
	db $0D,$F0,$0E,$E6,$40,$CB,$4A,$5B
	db $6E,$20,$74,$75,$2C,$20,$75,$7B
	db $78,$20,$68,$67,$7A,$7A,$72,$6B
	db $79,$6E,$6F,$76,$20,$6F,$79,$02
	db $20,$20,$68,$6B,$6F,$74,$6D,$20
	db $6A,$6B,$79,$7A,$78,$75,$7F,$6B
	db $6A,$2B,$2B,$2B,$4B,$02,$0D,$F0
	db $0E,$1E,$41,$CB,$4A,$60,$6E,$67
	db $7A,$2D,$79,$20,$74,$75,$7A,$20
	db $6F,$73,$76,$75,$78,$7A,$67,$74
	db $7A,$02,$20,$20,$74,$75,$7D,$33
	db $20,$20,$53,$75,$20,$67,$6E,$6B
	db $67,$6A,$33,$4B,$02,$0E,$72,$40
	db $CB,$0E,$BD,$40,$CB,$00,$0E,$55
	db $40,$CB,$0E,$DF,$40,$CB,$4A,$5B
	db $6E,$20,$74,$75,$33,$02,$20,$20
	db $54,$6B,$67,$7C,$7F,$20,$58,$75
	db $68,$79,$7A,$6B,$78,$2D,$79,$20
	db $68,$72,$6F,$74,$6A,$33,$4B,$02
	db $0D,$F0,$0E,$09,$41,$CB,$4A,$63
	db $6E,$67,$7A,$34,$34,$20,$5C,$67
	db $6F,$74,$7A,$20,$67,$68,$6F,$72
	db $6F,$7A,$7F,$34,$4B,$02,$0D,$F0
	db $0E,$FB,$40,$CB,$4A,$55,$7A,$2D
	db $79,$20,$74,$75,$20,$6D,$75,$75
	db $6A,$2B,$02,$20,$20,$54,$6B,$20
	db $69,$67,$74,$2D,$7A,$20,$79,$6B
	db $6B,$20,$67,$7A,$20,$67,$72,$72
	db $33,$4B,$02,$0D,$F0,$0E,$17,$41
	db $CB,$4A,$61,$74,$68,$6B,$72,$6F
	db $6B,$7C,$67,$68,$72,$6B,$33,$02
	db $57,$6F,$78,$68,$7F,$2D,$79,$20
	db $79,$7A,$6F,$72,$72,$20,$67,$72
	db $6F,$7C,$6B,$33,$4B,$02,$0E,$72
	db $40,$CB,$0E,$BD,$40,$CB,$00,$0E
	db $55,$40,$CB,$0E,$F4,$40,$CB,$4A
	db $59,$67,$70,$75,$78,$20,$6A,$67
	db $73,$67,$6D,$6B,$20,$7A,$75,$02
	db $20,$20,$7A,$6E,$6B,$20,$78,$6F
	db $6D,$6E,$7A,$20,$7D,$6F,$74,$6D
	db $33,$4B,$02,$0E,$A7,$40,$CB,$0E
	db $25,$41,$CB,$4A,$50,$75,$74,$2D
	db $7A,$20,$7D,$75,$78,$78,$7F,$33
	db $20,$20,$63,$6B,$2D,$7C,$6B,$02
	db $20,$20,$78,$6B,$6D,$67,$6F,$74
	db $6B,$6A,$20,$75,$7B,$78,$20,$68
	db $67,$72,$67,$74,$69,$6B,$2B,$4B
	db $02,$0E,$A7,$40,$CB,$0E,$33,$41
	db $CB,$4A,$2B,$2B,$2B,$2B,$2B,$2B
	db $2B,$2B,$2B,$2B,$2B,$2B,$2B,$2B
	db $2B,$2B,$4B,$0E,$A7,$40,$CB,$0E
	db $D8,$40,$CB,$4A,$57,$6F,$78,$68
	db $7F,$2D,$79,$20,$75,$7B,$7A,$79
	db $6F,$6A,$6B,$33,$20,$54,$6B,$2D
	db $79,$02,$20,$6D,$75,$6F,$74,$6D
	db $20,$7B,$74,$6A,$6B,$78,$20,$7A
	db $6E,$6B,$20,$79,$6E,$6F,$76,$33
	db $4B,$02,$0E,$AF,$40,$CB,$0E,$BD
	db $40,$CB,$00,$0E,$55,$40,$CB,$0E
	db $F4,$40,$CB,$4A,$59,$73,$73,$33
	db $20,$55,$20,$6A,$75,$74,$2D,$7A
	db $20,$79,$6B,$6B,$20,$57,$6F,$78
	db $68,$7F,$02,$75,$74,$20,$7A,$6E
	db $6B,$20,$78,$67,$6A,$67,$78,$20
	db $79,$69,$78,$6B,$6B,$74,$2B,$4B
	db $02,$0E,$A7,$40,$CB,$0E,$09,$41
	db $CB,$4A,$53,$6B,$7A,$20,$57,$6F
	db $78,$68,$7F,$33,$20,$5A,$5B,$63
	db $33,$33,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$2C,$41,$CB,$4A,$54,$6B,$20
	db $73,$7B,$79,$7A,$20,$68,$6B,$20
	db $6E,$6F,$6A,$6F,$74,$6D,$02,$20
	db $6F,$74,$20,$7A,$6E,$6B,$20,$69
	db $72,$75,$7B,$6A,$79,$2B,$2B,$2B
	db $4B,$02,$0E,$AF,$40,$CB,$0E,$BD
	db $40,$CB,$00,$0E,$55,$40,$CB,$0E
	db $D8,$40,$CB,$4A,$57,$6F,$78,$68
	db $7F,$2D,$79,$20,$6B,$74,$7A,$6B
	db $78,$6B,$6A,$20,$6C,$78,$75,$73
	db $02,$20,$7B,$74,$6A,$6B,$78,$74
	db $6B,$67,$7A,$6E,$20,$7A,$6E,$6B
	db $20,$79,$6E,$6F,$76,$2B,$4B,$02
	db $0E,$A7,$40,$CB,$0E,$02,$41,$CB
	db $4A,$60,$6E,$6B,$20,$68,$75,$7A
	db $7A,$75,$73,$2D,$79,$20,$7D,$6B
	db $67,$71,$2B,$2B,$2B,$02,$20,$20
	db $7A,$6E,$6B,$20,$7D,$6F,$74,$6A
	db $20,$6F,$79,$20,$7A,$75,$75,$20
	db $79,$7A,$78,$75,$74,$6D,$2B,$4B
	db $02,$0E,$A7,$40,$CB,$0E,$CA,$40
	db $CB,$4A,$55,$7A,$2D,$79,$20,$7A
	db $75,$75,$20,$69,$75,$72,$6A,$2B
	db $4B,$0E,$A7,$40,$CB,$0E,$D8,$40
	db $CB,$4A,$55,$2D,$73,$20,$67,$6C
	db $78,$67,$6F,$6A,$20,$75,$6C,$20
	db $6E,$6B,$6F,$6D,$6E,$7A,$79,$33
	db $4B,$0E,$A7,$40,$CB,$0E,$FB,$40
	db $CB,$4A,$5A,$75,$20,$7D,$67,$7F
	db $33,$20,$55,$20,$67,$6F,$74,$2D
	db $7A,$20,$6D,$75,$6F,$74,$2D,$2B
	db $4B,$02,$0E,$A7,$40,$CB,$0E,$25
	db $41,$CB,$4A,$65,$75,$7B,$20,$69
	db $6E,$6F,$69,$71,$6B,$74,$79,$33
	db $4B,$02,$0E,$AF,$40,$CB,$0E,$BD
	db $40,$CB,$00,$0E,$55,$40,$CB,$0E
	db $DF,$40,$CB,$4A,$57,$6F,$78,$68
	db $7F,$20,$6F,$79,$20,$6E,$6B,$67
	db $6A,$6F,$74,$6D,$02,$7A,$75,$7D
	db $67,$78,$6A,$20,$7A,$6E,$6B,$20
	db $78,$6B,$67,$69,$7A,$75,$78,$33
	db $4B,$02,$0E,$A7,$40,$CB,$0E,$F4
	db $40,$CB,$4A,$55,$6C,$20,$7D,$6B
	db $20,$72,$75,$79,$6B,$20,$76,$75
	db $7D,$6B,$78,$2C,$02,$20,$20,$7D
	db $6B,$2D,$78,$6B,$20,$6A,$75,$75
	db $73,$6B,$6A,$33,$33,$4B,$02,$0E
	db $A7,$40,$CB,$0E,$02,$41,$CB,$4A
	db $5E,$6B,$72,$67,$7E,$2B,$20,$20
	db $60,$6E,$6B,$20,$78,$6B,$67,$69
	db $7A,$75,$78,$02,$20,$20,$69,$67
	db $74,$2D,$7A,$20,$68,$6B,$20,$6A
	db $6B,$6C,$6B,$67,$7A,$6B,$6A,$33
	db $4B,$02,$0E,$A7,$40,$CB,$0E,$CA
	db $40,$CB,$4A,$55,$20,$6E,$75,$76
	db $6B,$20,$74,$75,$20,$78,$6B,$6C
	db $72,$6B,$69,$7A,$20,$72,$67,$79
	db $6B,$78,$79,$02,$20,$20,$6E,$6F
	db $7A,$20,$7A,$6E,$6B,$20,$78,$6B
	db $67,$69,$7A,$75,$78,$33,$4B,$02
	db $0E,$A7,$40,$CB,$0E,$17,$41,$CB
	db $4A,$5F,$6E,$6E,$6E,$33,$20,$60
	db $6E,$67,$7A,$2D,$79,$20,$67,$20
	db $5F,$51,$4F,$5E,$51,$60,$33,$4B
	db $02,$0E,$AF,$40,$CB,$0E,$BD,$40
	db $CB,$00,$0E,$55,$40,$CB,$0E,$F4
	db $40,$CB,$4A,$5B,$6E,$20,$74,$75
	db $33,$20,$20,$60,$6E,$75,$79,$6B
	db $20,$67,$78,$6B,$20,$73,$7F,$02
	db $6E,$6F,$6A,$6A,$6B,$74,$20,$7A
	db $75,$73,$67,$7A,$75,$6B,$79,$33
	db $4B,$02,$0E,$9A,$40,$CB,$0E,$17
	db $41,$CB,$4A,$65,$75,$7B,$20,$6F
	db $6A,$6F,$75,$7A,$33,$02,$20,$20
	db $65,$75,$7B,$20,$6E,$6F,$6A,$20
	db $7A,$6E,$75,$79,$6B,$34,$4B,$02
	db $0E,$9A,$40,$CB,$0E,$CA,$40,$CB
	db $4A,$20,$60,$6E,$6B,$7F,$20,$72
	db $75,$75,$71,$20,$6A,$6B,$72,$6F
	db $69,$6F,$75,$7B,$79,$2B,$4B,$02
	db $0E,$9A,$40,$CB,$0E,$BD,$40,$CB
	db $00,$0E,$55,$40,$CB,$0E,$DF,$40
	db $CB,$4A,$4E,$67,$6A,$20,$74,$6B
	db $7D,$79,$33,$20,$20,$60,$6E,$6B
	db $20,$78,$6B,$67,$69,$7A,$75,$78
	db $2D,$79,$02,$20,$20,$68,$6B,$6B
	db $74,$20,$6A,$67,$73,$67,$6D,$6B
	db $6A,$33,$4B,$02,$0E,$9A,$40,$CB
	db $0E,$F4,$40,$CB,$4A,$60,$6E,$6B
	db $20,$63,$6E,$6B,$6B,$72,$6F,$6B
	db $79,$20,$67,$78,$6B,$20,$02,$67
	db $68,$67,$74,$6A,$75,$74,$6F,$74
	db $6D,$20,$79,$6E,$6F,$76,$33,$4B
	db $02,$0E,$9A,$40,$CB,$0E,$17,$41
	db $CB,$4A,$61,$78,$6D,$6D,$6D,$6E
	db $33,$20,$20,$50,$75,$20,$5F,$5B
	db $59,$51,$60,$54,$55,$5A,$53,$33
	db $4B,$02,$0E,$9A,$40,$CB,$0E,$BD
	db $40,$CB,$00,$0E,$55,$40,$CB,$0E
	db $E6,$40,$CB,$4A,$63,$6B,$20,$67
	db $78,$6B,$20,$72,$75,$79,$6F,$74
	db $6D,$20,$76,$75,$7D,$6B,$78,$33
	db $02,$51,$74,$6D,$6F,$74,$6B,$20
	db $5A,$75,$2B,$24,$33,$20,$51,$74
	db $6D,$6F,$74,$6B,$20,$5A,$75,$2B
	db $26,$33,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$FB,$40,$CB,$4A,$4D,$6F,$74
	db $2D,$7A,$20,$67,$74,$7F,$20,$76
	db $75,$7D,$6B,$78,$20,$72,$6B,$6C
	db $7A,$33,$02,$20,$20,$63,$6B,$20
	db $69,$67,$74,$2D,$7A,$20,$6C,$72
	db $7F,$33,$4B,$02,$0E,$A7,$40,$CB
	db $0E,$33,$41,$CB,$4A,$35,$63,$6B
	db $2D,$7C,$6B,$20,$6C,$67,$6F,$72
	db $6B,$6A,$2B,$2B,$2B,$02,$20,$20
	db $6F,$7A,$2D,$79,$20,$75,$7C,$6B
	db $78,$2B,$36,$4B,$02,$0E,$A7,$40
	db $CB,$0E,$2C,$41,$CB,$4A,$4D,$7A
	db $7A,$6B,$74,$7A,$6F,$75,$74,$20
	db $67,$72,$72,$20,$69,$78,$6B,$7D
	db "!",$02,$20,$20,$51,$7C,$67,$69
	db $7B,$67,$7A,$6B,$20,$79,$6E,$6F
	db $76,$33,$33,$4B,$02,$0E,$A7,$40
	db $CB,$0E,$10,$41,$CB,$4A,$63,$67
	db $67,$67,$6E,$33,$02,$20,$20,$60
	db $6E,$6B,$20,$79,$6E,$6F,$76,$2D
	db $79,$20,$6D,$75,$6F,$74,$6D,$20
	db $6A,$75,$7D,$74,$33,$4B,$02,$0E
	db $AF,$40,$CB,$0E,$BD,$40,$CB,$00
	db $0E,$55,$40,$CB,$0E,$25,$41,$CB
	db $4A,$55,$2D,$73,$20,$74,$75,$7A
	db $20,$79,$7A,$67,$7F,$6F,$74,$6D
	db $2B,$02,$20,$20,$55,$2D,$73,$20
	db $6B,$7C,$67,$69,$7B,$67,$7A,$6F
	db $74,$6D,$33,$33,$4B,$02,$0D,$F0
	db $0E,$B6,$40,$CB,$0D,$14,$1F,$26
	db $0D,$14,$0E,$2C,$41,$CB,$4A,$5A
	db $75,$7D,$2C,$20,$6F,$7A,$2D,$79
	db $20,$7F,$75,$7B,$78,$02,$20,$20
	db $7A,$7B,$78,$74,$20,$7A,$75,$20
	db $6B,$7C,$67,$69,$7B,$67,$7A,$6B
	db $2B,$4B,$02,$0D,$F0,$0E,$E6,$40
	db $CB,$4A,$5A,$75,$2C,$20,$55,$20
	db $7D,$67,$74,$7A,$20,$7A,$75,$20
	db $79,$7A,$67,$7F,$02,$20,$20,$7D
	db $6F,$7A,$6E,$20,$7F,$75,$7B,$2C
	db $20,$5F,$6F,$78,$33,$4B,$02,$0D
	db $F0,$0E,$FB,$40,$CB,$4A,$58,$6B
	db $7A,$2D,$79,$20,$7A,$78,$7F,$20
	db $75,$74,$6B,$20,$73,$75,$78,$6B
	db $20,$7A,$6F,$73,$6B,$02,$7A,$75
	db $20,$6D,$6B,$7A,$20,$57,$6F,$78
	db $68,$7F,$33,$4B,$02,$0D,$F0,$0E
	db $33,$41,$CB,$4A,$54,$73,$73,$73
	db $2B,$2B,$2B,$2B,$2B,$4B,$0D,$96
	db $0E,$33,$41,$CB,$4A,$2B,$2B,$2B
	db $2B,$2B,$20,$55,$7A,$2D,$79,$20
	db $6A,$67,$74,$6D,$6B,$78,$75,$7B
	db $79,$2C,$02,$20,$20,$68,$7B,$7A
	db $20,$6F,$7A,$2D,$79,$20,$7D,$75
	db $78,$7A,$6E,$20,$67,$20,$7A,$78
	db $7F,$33,$4B,$02,$0D,$F0,$0E,$2C
	db $41,$CB,$4A,$60,$6E,$67,$74,$71
	db $20,$7F,$75,$7B,$2C,$20,$6D,$7B
	db $7F,$79,$2B,$4B,$02,$0E,$8D,$40
	db $CB,$0E,$BD,$40,$CB,$00,$0E,$55
	db $40,$CB,$0E,$E6,$40,$CB,$4A,$5F
	db $6F,$78,$20,$59,$6B,$7A,$67,$30
	db $57,$74,$6F,$6D,$6E,$7A,$2C,$02
	db $7F,$75,$7B,$2D,$78,$6B,$20,$75
	db $74,$20,$7F,$75,$7B,$78,$20,$75
	db $7D,$74,$33,$4B,$02,$0E,$A7,$40
	db $CB,$01,$0E,$FB,$40,$CB,$4A,$63
	db $6B,$2D,$78,$6B,$20,$6B,$7C,$67
	db $69,$7B,$67,$7A,$6F,$74,$6D,$33
	db $4B,$02,$0E,$AF,$40,$CB,$0E,$BD
	db $40,$CB,$00,$0E,$55,$40,$CB,$0E
	db $33,$41,$CB,$4A,$57,$6F,$78,$68
	db $7F,$2C,$20,$7A,$6E,$6F,$79,$20
	db $6F,$79,$20,$6F,$7A,$33,$02,$20
	db $20,$5C,$78,$6B,$76,$67,$78,$6B
	db $20,$7A,$75,$20,$6A,$6F,$6B,$33
	db $4B,$02,$0E,$A7,$40,$CB,$0E,$D1
	db $40,$CB,$4A,$60,$6E,$30,$7A,$6E
	db $7B,$73,$76,$2B,$20,$60,$6E,$30
	db $7A,$6E,$7B,$73,$76,$2B,$4B,$02
	db $0E,$AF,$40,$CB,$0E,$BD,$40,$CB
	db $00,$0E,$55,$40,$CB,$0E,$D8,$40
	db $CB,$4A,$63,$67,$6F,$7A,$2C,$20
	db $57,$6F,$78,$68,$7F,$33,$33,$4B
	db $02,$0E,$A7,$40,$CB,$01,$0E,$FB
	db $40,$CB,$4A,$65,$75,$7B,$20,$69
	db $67,$74,$2D,$7A,$20,$6D,$75,$20
	db $67,$74,$7F,$02,$20,$20,$6C,$7B
	db $78,$7A,$6E,$6B,$78,$33,$4B,$02
	db $0E,$AF,$40,$CB,$0E,$BD,$40,$CB
	db $00,$0E,$55,$40,$CB,$0E,$33,$41
	db $CB,$4A,$65,$75,$7B,$2D,$72,$72
	db $20,$74,$6B,$7C,$6B,$78,$20,$6B
	db $79,$69,$67,$76,$6B,$33,$4B,$02
	db $0E,$72,$40,$CB,$0E,$BD,$40,$CB
	db $00,$11,$02,$05,$00,$FF,$7F,$11
	db $04,$05,$00,$EC,$03,$11,$06,$05
	db $00,$00,$02,$08,$01,$05,$FF,$06
	db $00,$00,$01,$00,$11,$02,$05,$00
	db $FF,$7F,$11,$04,$05,$00,$EC,$03
	db $11,$06,$05,$00,$00,$02,$08,$01
	db $05,$FF,$06,$00,$00,$01,$00,$0D
	db $3F,$08,$00,$15,$47,$08,$01,$14
	db $02,$0D,$3F,$08,$00,$15,$47,$08
	db $01,$14,$02,$0D,$3F,$08,$00,$15
	db $47,$08,$01,$14,$02,$0D,$3F,$08
	db $00,$15,$47,$08,$01,$14,$02,$00
	db $54,$6F,$78,$75,$79,$6E,$6F,$20
	db $65,$67,$73,$67,$7B,$69,$6E,$6F
	db $00,$5F,$6E,$6F,$6D,$6B,$78,$7B
	db $20,$59,$6F,$7F,$67,$73,$75,$7A
	db $75,$00,$57,$6B,$74,$79,$7B,$71
	db $6B,$20,$60,$67,$74,$67,$68,$6B
	db $00,$60,$67,$71,$67,$75,$20,$5F
	db $6E,$6F,$73,$6F,$80,$7B,$00,$5F
	db $67,$7A,$75,$78,$7B,$20,$55,$7D
	db $67,$7A,$67,$00,$5E,$7F,$7B,$71
	db $6F,$20,$57,$7B,$78,$67,$75,$71
	db $67,$00,$59,$67,$79,$67,$6E,$6F
	db $78,$75,$20,$5F,$67,$71,$7B,$78
	db $67,$6F,$00,$5F,$6E,$6F,$6D,$6B
	db $74,$75,$68,$7B,$20,$57,$67,$79
	db $67,$6F,$00,$60,$6B,$7A,$79,$7B
	db $7F,$67,$20,$4D,$68,$6B,$00,$56
	db $7B,$74,$6F,$69,$6E,$6F,$20,$4D
	db $75,$7F,$67,$6D,$6F,$00,$59,$67
	db $79,$67,$71,$67,$80,$7B,$20,$51
	db $68,$6F,$6E,$67,$78,$67,$00,$60
	db $6B,$78,$7B,$7F,$7B,$71,$6F,$20
	db $53,$7B,$74,$70,$6F,$00,$55,$79
	db $67,$75,$20,$60,$67,$71,$67,$6E
	db $67,$79,$6E,$6F,$00,$4D,$71,$6F
	db $75,$20,$54,$67,$74,$7F,$7B,$00
	db $60,$79,$7B,$7F,$75,$79,$6E,$6F
	db $20,$63,$67,$71,$67,$7F,$67,$73
	db $67,$00,$57,$67,$80,$7B,$20,$5B
	db $80,$67,$7D,$67,$00,$54,$6F,$78
	db $75,$75,$20,$60,$67,$71,$6B,$79
	db $6E,$6F,$7A,$67,$00,$60,$6B,$7A
	db $79,$7B,$7F,$67,$20,$59,$75,$69
	db $6E,$6F,$80,$7B,$71,$6F,$00,$54
	db $6F,$7A,$75,$79,$6E,$6F,$20,$57
	db $6F,$71,$71,$67,$7D,$67,$00,$60
	db $67,$7A,$79,$7B,$6E,$6F,$78,$75
	db $20,$60,$67,$74,$75,$7B,$6B,$00
	db $5F,$6E,$6F,$6D,$6B,$78,$7B,$20
	db $54,$67,$79,$6E,$6F,$6D,$7B,$69
	db $6E,$6F,$00,$60,$67,$6A,$67,$79
	db $6E,$6F,$20,$54,$67,$79,$6E,$6F
	db $71,$7B,$78,$67,$00,$56,$7B,$74
	db $20,$55,$79,$6E,$6F,$71,$67,$7D
	db $67,$00,$50,$67,$74,$20,$59,$6F
	db $7F,$67,$71,$67,$7D,$67,$00,$5F
	db $6E,$6F,$74,$6F,$69,$6E,$6F,$20
	db $5F,$6E,$6F,$73,$75,$73,$7B,$78
	db $67,$00,$60,$75,$73,$75,$73,$6F
	db $20,$59,$6F,$74,$67,$73,$6F,$00
	db $54,$6F,$78,$75,$67,$71,$6F,$20
	db $5F,$7B,$6D,$67,$00,$60,$6B,$7A
	db $79,$7B,$75,$20,$57,$7B,$70,$6F
	db $78,$67,$75,$71,$67,$00,$54,$6F
	db $6A,$6B,$7A,$75,$79,$6E,$6F,$20
	db $5F,$6B,$71,$6F,$00,$65,$75,$79
	db $6E,$6F,$67,$71,$6F,$20,$5F,$6E
	db $6F,$74,$75,$6E,$67,$78,$67,$00
	db $4D,$7A,$79,$7B,$79,$6E,$6F,$20
	db $57,$67,$71,$7B,$7A,$67,$00,$60
	db $67,$71,$67,$79,$6E,$6F,$20,$5F
	db $67,$6F,$7A,$75,$00,$5F,$6E,$6F
	db $6D,$6B,$78,$7B,$20,$54,$6F,$78
	db $67,$7F,$67,$73,$67,$00,$5F,$6B
	db $6F,$70,$6F,$20,$5B,$7A,$75,$6D
	db $7B,$78,$75,$00,$65,$75,$79,$6E
	db $6F,$73,$6F,$20,$60,$67,$71,$67
	db $6E,$67,$79,$6E,$6F,$00,$5F,$67
	db $7A,$75,$79,$6E,$6F,$20,$55,$79
	db $6E,$6F,$6A,$67,$00,$4F,$6E,$6F
	db $6B,$71,$75,$20,$5B,$68,$6F,$71
	db $67,$74,$6B,$00,$5A,$55,$5A,$60
	db $51,$5A,$50,$5B,$2B,$2C,$58,$7A
	db $6A,$2B,$00,$54,$4D,$58,$20,$58
	db $67,$68,$75,$78,$67,$7A,$75,$78
	db $7F,$2C,$55,$5A,$4F,$2B,$00,$54
	db $6F,$78,$75,$20,$65,$67,$73,$67
	db $6A,$67,$00,$56,$6F,$73,$20,$63
	db $75,$78,$74,$6B,$72,$72,$00,$57
	db $67,$7F,$75,$73,$6F,$20,$59,$69
	db $50,$75,$74,$67,$72,$6A,$00,$08
	db $02,$51,$7E,$6B,$69,$7B,$7A,$6F
	db $7C,$6B,$20,$5C,$78,$75,$6A,$7B
	db $69,$6B,$78,$08,$01,$00,$08,$02
	db $5C,$78,$75,$6A,$7B,$69,$6B,$78
	db $08,$01,$00,$08,$02,$5C,$78,$75
	db $70,$6B,$69,$7A,$20,$59,$67,$74
	db $67,$6D,$6B,$78,$08,$01,$00,$08
	db $02,$50,$6F,$78,$6B,$69,$7A,$75
	db $78,$08,$01,$00,$08,$02,$4F,$6E
	db $6F,$6B,$6C,$20,$5C,$78,$75,$6D
	db $78,$67,$73,$73,$6B,$78,$08,$01
	db $00,$08,$02,$5C,$78,$75,$6D,$78
	db $67,$73,$73,$6B,$78,$08,$01,$00
	db $08,$02,$4F,$6E,$6F,$6B,$6C,$20
	db $50,$6B,$79,$6F,$6D,$74,$6B,$78
	db $08,$01,$00,$08,$02,$50,$6B,$79
	db $6F,$6D,$74,$6B,$78,$08,$01,$00
	db $08,$02,$4F,$53,$20,$50,$6B,$79
	db $6F,$6D,$74,$6B,$78,$08,$01,$00
	db $08,$02,$5F,$75,$7B,$74,$6A,$20
	db $4F,$75,$73,$76,$75,$79,$6B,$78
	db $08,$01,$00,$08,$02,$59,$67,$76
	db $76,$6B,$78,$08,$01,$00,$08,$02
	db $4D,$6A,$7C,$6F,$79,$6B,$78,$08
	db $01,$00,$08,$02,$5F,$76,$6B,$69
	db $6F,$67,$72,$20,$60,$6E,$67,$74
	db $71,$79,$08,$01,$00,$0E,$79,$54
	db $CB,$30,$30,$30,$20,$5F,$7A,$67
	db $6C,$6C,$20,$30,$30,$30,$0D,$B4
	db $01,$0E,$97,$57,$CB,$02,$20,$0E
	db $32,$55,$CB,$0D,$14,$01,$0E,$B9
	db $57,$CB,$02,$20,$0E,$53,$55,$CB
	db $0D,$14,$01,$0E,$B9,$57,$CB,$02
	db $20,$0E,$5F,$55,$CB,$0D,$14,$01
	db $0E,$B9,$57,$CB,$02,$20,$0E,$6E
	db $55,$CB,$0D,$14,$01,$0E,$B9,$57
	db $CB,$02,$20,$0E,$7F,$55,$CB,$0D
	db $14,$01,$0E,$B9,$57,$CB,$02,$20
	db $0E,$8E,$55,$CB,$0D,$14,$01,$0E
	db $B9,$57,$CB,$02,$20,$0E,$9D,$55
	db $CB,$0D,$14,$01,$0E,$A4,$57,$CB
	db $02,$20,$0E,$43,$55,$CB,$0D,$14
	db $01,$0E,$DB,$57,$CB,$02,$20,$0E
	db $BA,$55,$CB,$0D,$14,$01,$0E,$DB
	db $57,$CB,$02,$20,$0E,$C5,$55,$CB
	db $0D,$14,$01,$0E,$DB,$57,$CB,$02
	db $20,$0E,$D5,$55,$CB,$0D,$14,$01
	db $0E,$E8,$57,$CB,$02,$20,$0E,$E7
	db $55,$CB,$0D,$14,$01,$0E,$E8,$57
	db $CB,$02,$20,$0E,$F7,$55,$CB,$0D
	db $14,$01,$0E,$E8,$57,$CB,$02,$20
	db $0E,$08,$56,$CB,$0D,$14,$01,$0E
	db $E8,$57,$CB,$02,$20,$0E,$1B,$56
	db $CB,$0D,$14,$01,$0E,$C8,$57,$CB
	db $02,$20,$0E,$A8,$55,$CB,$0D,$14
	db $01,$0E,$F8,$57,$CB,$02,$20,$0E
	db $2D,$56,$CB,$0D,$14,$01,$0E,$F8
	db $57,$CB,$02,$20,$0E,$3A,$56,$CB
	db $0D,$14,$01,$0E,$0B,$58,$CB,$02
	db $20,$0E,$47,$56,$CB,$0D,$14,$01
	db $0E,$0B,$58,$CB,$02,$20,$0E,$5A
	db $56,$CB,$0D,$14,$01,$0E,$22,$58
	db $CB,$02,$20,$0E,$68,$56,$CB,$0D
	db $14,$01,$0E,$22,$58,$CB,$02,$20
	db $0E,$75,$56,$CB,$0D,$14,$01,$0E
	db $22,$58,$CB,$02,$20,$0E,$86,$56
	db $CB,$0D,$14,$01,$0E,$22,$58,$CB
	db $02,$20,$0E,$95,$56,$CB,$0D,$14
	db $01,$0E,$22,$58,$CB,$02,$20,$0E
	db $C5,$56,$CB,$0D,$14,$01,$0E,$22
	db $58,$CB,$02,$20,$0E,$D6,$56,$CB
	db $0D,$14,$01,$0E,$22,$58,$CB,$02
	db $20,$0E,$A8,$56,$CB,$0D,$14,$01
	db $0E,$22,$58,$CB,$02,$20,$0E,$B7
	db $56,$CB,$0D,$14,$01,$0E,$22,$58
	db $CB,$02,$20,$0E,$E4,$56,$CB,$0D
	db $14,$01,$0E,$22,$58,$CB,$02,$20
	db $0E,$F6,$56,$CB,$0D,$14,$01,$0E
	db $22,$58,$CB,$02,$20,$0E,$05,$57
	db $CB,$0D,$14,$01,$0E,$22,$58,$CB
	db $02,$20,$0E,$37,$57,$CB,$0D,$14
	db $01,$0E,$22,$58,$CB,$02,$20,$0E
	db $43,$57,$CB,$0D,$14,$01,$0E,$22
	db $58,$CB,$02,$20,$0E,$4F,$57,$CB
	db $0D,$14,$01,$0E,$16,$58,$CB,$02
	db $20,$0E,$FA,$54,$CB,$0D,$14,$01
	db $0E,$16,$58,$CB,$02,$20,$0E,$09
	db $55,$CB,$0D,$14,$01,$0E,$83,$57
	db $CB,$02,$20,$0E,$24,$55,$CB,$0D
	db $14,$01,$0E,$76,$57,$CB,$02,$20
	db $0E,$17,$55,$CB,$0D,$14,$01,$0E
	db $76,$57,$CB,$02,$20,$0E,$E9,$54
	db $CB,$0D,$14,$01,$0E,$5F,$57,$CB
	db $02,$20,$0E,$D8,$54,$CB,$0D,$14
	db $01,$0E,$14,$57,$CB,$02,$0E,$23
	db $57,$CB,$0D,$F0,$01,$00,$0E,$94
	db $54,$CB,$20,$20,$20,$30,$30,$30
	db $20,$5F,$7A,$67,$6C,$6C,$20,$30
	db $30,$30,$0E,$C3,$54,$CB,$20,$20
	db $20,$0E,$97,$57,$CB,$0E,$C3,$54
	db $CB,$20,$20,$20,$20,$0E,$32,$55
	db $CB,$0E,$AF,$54,$CB,$20,$20,$20
	db $0E,$B9,$57,$CB,$0E,$C3,$54,$CB
	db $20,$20,$20,$20,$0E,$53,$55,$CB
	db $0E,$C3,$54,$CB,$20,$20,$20,$20
	db $0E,$5F,$55,$CB,$0E,$C3,$54,$CB
	db $20,$20,$20,$20,$0E,$6E,$55,$CB
	db $0E,$CD,$54,$CB,$03,$00,$00,$0D
	db $3F,$20,$20,$20,$20,$0E,$7F,$55
	db $CB,$0E,$C3,$54,$CB,$20,$20,$20
	db $20,$0E,$8E,$55,$CB,$0E,$C3,$54
	db $CB,$20,$20,$20,$20,$0E,$9D,$55
	db $CB,$0E,$C3,$54,$CB,$20,$20,$20
	db $0E,$A4,$57,$CB,$0E,$C3,$54,$CB
	db $20,$20,$20,$20,$0E,$43,$55,$CB
	db $0E,$AF,$54,$CB,$20,$20,$20,$0E
	db $DB,$57,$CB,$0E,$C3,$54,$CB,$20
	db $20,$20,$20,$0E,$BA,$55,$CB,$0E
	db $CD,$54,$CB,$08,$00,$15,$47,$08
	db $01,$14,$03,$00,$00,$0D,$3F,$20
	db $20,$20,$20,$0E,$C5,$55,$CB,$0E
	db $C3,$54,$CB,$20,$20,$20,$20,$0E
	db $D5,$55,$CB,$0E,$AF,$54,$CB,$20
	db $20,$20,$0E,$E8,$57,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$E7
	db $55,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$F7,$55,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$08
	db $56,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$1B,$56,$CB,$0E,$CD
	db $54,$CB,$08,$00,$15,$47,$08,$01
	db $14,$03,$00,$00,$0D,$3F,$20,$20
	db $20,$0E,$C8,$57,$CB,$0E,$C3,$54
	db $CB,$20,$20,$20,$20,$0E,$A8,$55
	db $CB,$0E,$AF,$54,$CB,$20,$20,$20
	db $0E,$F8,$57,$CB,$0E,$C3,$54,$CB
	db $20,$20,$20,$20,$0E,$2D,$56,$CB
	db $0E,$C3,$54,$CB,$20,$20,$20,$20
	db $0E,$3A,$56,$CB,$0E,$AF,$54,$CB
	db $20,$20,$20,$0E,$0B,$58,$CB,$0E
	db $CD,$54,$CB,$08,$00,$15,$47,$08
	db $01,$14,$03,$00,$00,$0D,$3F,$20
	db $20,$20,$20,$0E,$47,$56,$CB,$0E
	db $C3,$54,$CB,$20,$20,$20,$20,$0E
	db $5A,$56,$CB,$0E,$AF,$54,$CB,$20
	db $20,$20,$0E,$22,$58,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$68
	db $56,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$75,$56,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$86
	db $56,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$95,$56,$CB,$0E,$CD
	db $54,$CB,$08,$00,$15,$47,$08,$01
	db $14,$03,$00,$00,$0D,$3F,$20,$20
	db $20,$20,$0E,$C5,$56,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$D6
	db $56,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$A8,$56,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$B7
	db $56,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$E4,$56,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$F6
	db $56,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$05,$57,$CB,$0E,$C3
	db $54,$CB,$20,$20,$20,$20,$0E,$37
	db $57,$CB,$0E,$CD,$54,$CB,$08,$00
	db $15,$47,$08,$01,$14,$03,$00,$00
	db $0D,$3F,$20,$20,$20,$20,$0E,$43
	db $57,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$4F,$57,$CB,$0E,$AF
	db $54,$CB,$20,$20,$20,$0E,$16,$58
	db $CB,$0E,$C3,$54,$CB,$20,$20,$20
	db $20,$0E,$FA,$54,$CB,$0E,$C3,$54
	db $CB,$20,$20,$20,$20,$0E,$09,$55
	db $CB,$0E,$AF,$54,$CB,$20,$20,$20
	db $0E,$83,$57,$CB,$0E,$CD,$54,$CB
	db $08,$00,$15,$47,$08,$01,$14,$03
	db $00,$00,$0D,$3F,$20,$20,$20,$20
	db $0E,$24,$55,$CB,$0E,$AF,$54,$CB
	db $20,$20,$20,$0E,$76,$57,$CB,$0E
	db $C3,$54,$CB,$20,$20,$20,$20,$0E
	db $17,$55,$CB,$0E,$C3,$54,$CB,$20
	db $20,$20,$20,$0E,$E9,$54,$CB,$0E
	db $AF,$54,$CB,$20,$20,$20,$0E,$5F
	db $57,$CB,$0E,$C3,$54,$CB,$20,$20
	db $20,$20,$0E,$D8,$54,$CB,$0E,$CD
	db $54,$CB,$08,$00,$15,$47,$08,$01
	db $14,$03,$00,$00,$0D,$3F,$0E,$AF
	db $54,$CB,$0E,$CD,$54,$CB,$20,$20
	db $20,$0E,$14,$57,$CB,$0E,$C3,$54
	db $CB,$0E,$23,$57,$CB,$0E,$AF,$54
	db $CB,$0E,$AF,$54,$CB,$00,$11,$02
	db $05,$00,$FF,$7F,$11,$06,$05,$00
	db $00,$00,$08,$01,$05,$FF,$06,$01
	db $00,$01,$00,$0E,$5E,$5D,$CB,$60
	db $6E,$6B,$78,$6B,$2D,$79,$20,$7A
	db $78,$75,$7B,$68,$72,$6B,$20,$02
	db $6F,$74,$20,$50,$78,$6B,$67,$73
	db $20,$58,$67,$74,$6A,$33,$02,$00
	db $0E,$5E,$5D,$CB,$57,$6F,$74,$6D
	db $20,$50,$6B,$6A,$6B,$6A,$6B,$20
	db $67,$74,$6A,$20,$6E,$6F,$79,$20
	db $02,$79,$75,$72,$6A,$6F,$6B,$78
	db $79,$2C,$02,$00,$0E,$5E,$5D,$CB
	db $6E,$67,$7C,$6B,$20,$79,$7A,$75
	db $72,$6B,$74,$20,$4D,$58,$58,$20
	db $7A,$6E,$6B,$20,$02,$6C,$75,$75
	db $6A,$20,$6F,$74,$20,$50,$78,$6B
	db $67,$73,$20,$58,$67,$74,$6A,$33
	db $02,$00,$0E,$5E,$5D,$CB,$54,$6B
	db $78,$6B,$20,$69,$75,$73,$6B,$79
	db $20,$75,$7B,$78,$20,$6E,$6B,$78
	db $75,$2C,$20,$02,$57,$6F,$78,$68
	db $7F,$2C,$78,$6F,$6A,$6F,$74,$6D
	db $20,$6F,$74,$20,$75,$74,$20,$7A
	db $6E,$6B,$02,$79,$76,$78,$6F,$74
	db $6D,$20,$68,$78,$6B,$6B,$80,$6B
	db $2B,$02,$00,$0E,$5E,$5D,$CB,$58
	db $6B,$7A,$20,$7A,$6E,$6B,$20,$67
	db $6A,$7C,$6B,$74,$7A,$7B,$78,$6B
	db $02,$68,$6B,$6D,$6F,$74,$2B,$00

	
;- Computer Virus subtext begins -----------------------------------------------------------

DATA_CB5E48:						;$CB5E48	| Computer Virus subtext: ???
	db $11,$02,$05,$00,$FF,$7F,$11,$04
	db $05,$00,$7F,$7E,$11,$06,$05,$00
	db $FF,$7F,$15,$08,$01,$05,$FF,$06
	db $00,$02,$1D,$37,$01,$00
	
DATA_CB5E66:						;$CB5E66	| Computer Virus subtext: ???
	db $0D,$14,$1D,$00,$14,$00

DATA_CB5E6C:						;$CB5E6C	| Computer Virus subtext: ???
	db $0D,$1E
	db $1D,$00
	db $14
	db $00

DATA_CB5E72:						;$CB5E72	| Computer Virus subtext: Slime
	db $08,$02
	db "Slime"
	db $08,$01
	db $00

DATA_CB5E7C:						;$CB5E7C	| Computer Virus subtext: Dancing Doll
	db $08,$02
	db "Dancing Doll"
	db $08,$01
	db $00

DATA_CB5E8D:						;$CB5E8D	| Computer Virus subtext: Witch
	db $08,$02
	db "Witch"
	db $08,$01
	db $00

DATA_CB5E97:						;$CB5E97	| Computer Virus subtext: Evil Knight
	db $08,$02
	db "Evil Knight"
	db $08,$01
	db $00

DATA_CB5EA7:						;$CB5EA7	| Computer Virus subtext: Red Dragon
	db $08,$02
	db "Red Dragon"
	db $08,$01
	db $00

DATA_CB5EB6:						;$CB5EB6	| Computer Virus subtext: Kirby
	db $08,$02
	db "Kirby"
	db $08,$01
	db $00

DATA_CB5EC0:						;$CB5EC0	| Computer virus subtext: Kirby & Co.
	db $08,$02
	db "Kirby & Co."
	db $08,$01
	db $00


DATA_CB5ED0:						;$CB5ED0	| Computer Virus subtext: SirKibble
	db $08,$02
	db "SirKibble"
	db $08,$01
	db $00

DATA_CB5EDE:						;$CB5EDE	| Computer Virus subtext: Waddle Doo
	db $08,$02
	db "Waddle Doo"
	db $08,$01
	db $00

DATA_CB5EED:						;$CB5EED	| Computer Virus subtext: Gim
	db $08,$02
	db "Gim"
	db $08,$01
	db $00

DATA_CB5EF5:						;$CB5EF5	| Computer Virus subtext: Bio Spark
	db $08,$02
	db "Bio Spark"
	db $08,$01
	db $00

DATA_CB5F03:						;$CB5F03	| Computer Virus subtext: Knuckle Joe
	db $08,$02
	db "Knuckle Joe"
	db $08,$01
	db $00

DATA_CB5F13:						;$CB5F13	| Computer Virus subtext: Burnin Leo
	db $08,$02
	db "Burnin Leo"
	db $08,$01
	db $00

DATA_CB5F22:						;$CB5F22	| Computer Virus subtext: Birdon
	db $08,$02
	db "Birdon"
	db $08,$01
	db $00

DATA_CB5F2D:						;$CB5F2D	| Computer Virus subtext: Blade Knight
	db $08,$02
	db "Blade Knight"
	db $08,$01
	db $00

DATA_CB5F3E:						;$CB5F3E	| Computer Virus subtext: Capsule J
	db $08,$02
	db "Capsule J"
	db $08,$01
	db $00

DATA_CB5F4C:						;$CB5F4C	| Computer Virus subtext: Plasma wisp
	db $08,$02
	db "Plasma wisp"
	db $08,$01
	db $00

DATA_CB5F5C:						;$CB5F5C	| Computer Virus subtext: Poppy Bros.Jr.
	db $08,$02
	db "Poppy Bros.Jr."
	db $08,$01
	db $00

DATA_CB5F6F:						;$CB5F6F	| Computer Virus subtext: Wheelie
	db $08,$02
	db "Wheelie"
	db $08,$01
	db $00

DATA_CB5F7B:						;$CB5F7B	| Computer Virus subtext: Bugzzy
	db $08,$02
	db "Bugzzy"
	db $08,$01
	db $00

DATA_CB5F86:						;$CB5F86	| Computer Virus subtext: Rocky
	db $08,$02
	db "Rocky"
	db $08,$01
	db $00

DATA_CB5F90:						;$CB5F90	| Computer Virus subtext: Parasol Waddle Dee
	db $08,$02
	db "Parasol Waddle Dee"
	db $08,$01
	db $00

DATA_CB5FA7:						;$CB5FA7	| Computer Virus subtext: Bonkers
	db $08,$02
	db "Bonkers"
	db $08,$01
	db $00

DATA_CB5FB3:						;$CB5FB3	| Computer Virus subtext: Chilly
	db $08,$02
	db "Chilly"
	db $08,$01
	db $00

DATA_CB5FBE:						;$CB5FBE	| Computer Virus subtext: Simirror
	db $08,$02
	db "Simirror"
	db $08,$01
	db $00

DATA_CB5FCB:						;$CB5FCB	| Computer Virus subtext: T.A.C.
	db $08,$02
	db "T.A.C."
	db $08,$01
	db $00

DATA_CB5FD6:						;$CB5FD6	| Computer Virus subtext: Cutter
	db "Cutter",$00

DATA_CB5FDD:						;$CB5FDD	| Computer Virus subtext: Beam
	db "Beam",$00

DATA_CB5FE2:						;$CB5FE2	| Computer Virus subtext: Yoyo
	db "Yoyo",$00

DATA_CB5FE7:						;$CB5FE7	| Computer Virus subtext: Ninja
	db "Ninja",$00

DATA_CB5FED:						;$CB5FED	| Computer Virus subtext: Fighter
	db "Fighter",$00

DATA_CB5FF5:						;$CB5FF5	| Computer Virus subtext: Fire
	db "Fire",$00

DATA_CB5FFA:						;$CB5FFA	| Computer Virus subtext: Wing
	db "Wing",$00

DATA_CB5FFF:						;$CB5FFF	| Computer Virus subtext: Sword
	db "Sword",$00

DATA_CB6005:						;$CB6005	| Computer Virus subtext: Jet
	db "Jet",$00

DATA_CB6009:						;$CB6009	| Computer Virus subtext: Plasma
	db "Plasma",$00

DATA_CB6010:						;$CB6010	| Computer Virus subtext: Bomb
	db "Bomb",$00

DATA_CB6015:						;$CB6015	| Computer Virus subtext: Wheel
	db "Wheel",$00

DATA_CB601B:						;$CB601B	| Computer Virus subtext: Suplex
	db "Suplex",$00

DATA_CB6022:						;$CB6022	| Computer Virus subtext: Stone
	db "Stone",$00

DATA_CB6028:						;$CB6028	| Computer Virus subtext: Parasol
	db "Parasol",$00

DATA_CB6030:						;$CB6030	| Computer Virus subtext: Hammer
	db "Hammer",$00

DATA_CB6037:						;$CB6037	| Computer Virus subtext: Ice
	db "Ice",$00

DATA_CB603B:						;$CB603B	| Computer Virus subtext: Mirror
	db "Mirror",$00

DATA_CB6042:						;$CB6042	| Computer Virus subtext: Copy
	db "Copy",$00

DATA_CB6047:						;$CB6047	| Computer Virus subtext: _appears!
	db " appears!",$00

DATA_CB6051:						;$CB6051	| Computer Virus subtext: _attacks!
	db " attacks!",$00

DATA_CB605B:						;$CB605B	| Computer Virus subtext: avoids the attack!
	db "avoids the attack!",$00

DATA_CB606E:						;$CB606E	| Computer Virus subtext: 's hurt!
	db "'s hurt!",$00

DATA_CB6077:						;$CB6077	| Computer Virus subtext: _are hurt!
	db " are hurt!",$00

DATA_CB6082:						;$CB6082	| Computer Virus subtext: X damage points given/to_
	db $0F : dl $007711
	db " damage points given",$02,"to "
	db $00

DATA_CB609F:						;$CB609F	| Computer Virus subtext: _is defeated!
	db " is defeated!",$00

DATA_CB60AD:						;$CB60AD	| Computer Virus subtext: _ability.
	db " ability.",$00

DATA_CB60B7:						;$CB60B7	| Computer Virus subtext: But,  nothing happens.
	db "But,  nothing happens.",$00

DATA_CB60CE:						;$CB60CE	| Computer Virus subtext: First attack by_
	db "First attack by ",$00

DATA_CB60DF:						;$CB60DF	| Computer Virus subtext: _attack!
	db " attack!",$00

DATA_CB60E8:						;$CB60E8	| Computer Virus subtext: avoid the attack!
	db "avoid the attack!",$00

DATA_CB60FA:						;$CB60FA	| Computer Virus subtext: are hurt!
	db "are hurt!",$02
DATA_CB6104:						;$CB6104	| Computer Virus subtext: ???
	db $03,$0C,$10,$00
DATA_CB6108:						;$CB6104	| Computer Virus subtext: ???
	db $03,$18,$10,$00
DATA_CB610C:						;$CB6104	| Computer Virus subtext: ???
	db $03,$24,$10,$00
DATA_CB6110:						;$CB6104	| Computer Virus subtext: ???
	db $03,$30,$10,$00
DATA_CB6114:						;$CB6104	| Computer Virus subtext: ???
	db $03,$3C,$10,$00
DATA_CB6118:						;$CB6104	| Computer Virus subtext: ???
	db $03,$48,$10,$00
DATA_CB611C:						;$CB6104	| Computer Virus subtext: ???
	db $03,$54,$10,$00
DATA_CB6120:						;$CB6104	| Computer Virus subtext: ???
	db $03,$60,$10,$00
DATA_CB6124:						;$CB6104	| Computer Virus subtext: ???
	db $03,$6C,$10,$00

DATA_CB6128:						;$CB6128	| Computer Virus subtext: You earned ??
	db "You earned "
	db $0F : dl $007711
	db $02
	db $00

DATA_CB6139:						;$CB6139	| Computer Virus subtext: defeats all enemies!
	db "defeats all enemies!",$00

DATA_CB614E:						;$CB614E	| Computer Virus subtext: defeat all enemies!
	db "defeat all enemies!",$00


;- Computer Virus subtext ends, main text begins -------------------------------------------

DATA_CB6162:						;$CB6162	| Computer Virus text: Slime appears!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db $0E : dl DATA_CB6047
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6173:						;$CB6173	| Computer Virus text: Dancing Doll appears!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db $0E : dl DATA_CB6047
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6184:						;$CB6184	| Computer Virus text: Witch appears!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E8D
	db $0E : dl DATA_CB6047
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6195:						;$CB6195	| Computer Virus text: Evil Knight appears!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $0E : dl DATA_CB6047
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB61A6:						;$CB61A6	| Computer Virus text: Red Dragon appears!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $0E : dl DATA_CB6047
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB61B7:						;$CB61B7	| Computer Virus text: First attack by Slime!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB60CE
	db $0E : dl DATA_CB5E72
	db "!",$02
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB61CA:						;$CB61CA	| Computer Virus text: First attack by Dancing Doll!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB60CE
	db $02
	db $0E : dl DATA_CB5E7C
	db "!",$02
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB61DE:						;$CB61DE	| Computer Virus text: First attack by Witch!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB60CE
	db $0E : dl DATA_CB5E8D
	db "!",$02
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB61F1:						;$CB61F1	| Computer Virus text: First attack by Evil Knight!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB60CE
	db $02
	db $0E : dl DATA_CB5E97
	db "!",$02
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6205:						;$CB6205	| Computer Virus text: First attack by Red Dragon!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB60CE
	db $02
	db $0E : dl DATA_CB5EA7
	db "!",$02
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6219:						;$CB6219	| Computer Virus text: Slime attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB622A:						;$CB622A	| Computer Virus text: Dancing Doll attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB623B:						;$CB623B	| Computer Virus text: Witch attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E8D
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB624C:						;$CB624C	| Computer Virus text: Evil Knight attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB625D:						;$CB625D	| Computer Virus text: Red Dragon attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB626E:						;$CB626E	| Computer Virus text: Kirby attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB627F:						;$CB627F	| Computer Virus text: Kirby & Co. attack!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EC0
	db $0E : dl DATA_CB60DF
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6290:						;$CB6290	| Computer Virus text: Kirby avoids the attack!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db $02
	db $0E : dl DATA_CB605B
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB62A2:						;$CB62A2	| Computer Virus text: Kirby & Co. avoid the attack!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EC0
	db $02
	db $0E : dl DATA_CB60E8
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB62B4:						;$CB62B4	| Computer Virus text: Kirby regains his power!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " regains his power!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB62D5:						;$CB62D5	| Computer Virus text: Kirby & Co. regain their power!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EC0
	db $02,"regain their power!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB62F7:						;$CB62F7	| Computer Virus text: Kirby's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6308:						;$CB6308	| Computer Virus text: SirKibble's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5ED0
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6319:						;$CB6319	| Computer Virus text: Waddle Doo's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EDE
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB632A:						;$CB632A	| Computer Virus text: Gim's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EED
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB633B:						;$CB633B	| Computer Virus text: Bio Spark's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EF5
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB634C:						;$CB634C	| Computer Virus text: Knuckle Joe's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F03
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB635D:						;$CB635D	| Computer Virus text: Burnin Leo's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F13
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB636E:						;$CB636E	| Computer Virus text: Birdon's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F22
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB637F:						;$CB637F	| Computer Virus text: Blade Knight's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F2D
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6390:						;$CB6390	| Computer Virus text: Capusle J's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F3E
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB63A1:						;$CB63A1	| Computer Virus text: Plasma wisp's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F4C
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB63B2:						;$CB63B2	| Computer Virus text: Poppy bros.Jr.'s hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F5C
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB63C3:						;$CB63C3	| Computer Virus text: Wheelie's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F6F
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB63D4:						;$CB63D4	| Computer Virus text: Bugzzy's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F7B
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB63E5:						;$CB63E5	| Computer Virus text: Rocky's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F86
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB63F6:						;$CB63F6	| Computer Virus text: Parasol Waddle Dee's/hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5F90
	db "'s",$02,"hurt!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB640C:						;$CB640C	| Computer Virus text: Bonker's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5FA7
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB641D:						;$CB641D	| Computer Virus text: Chilly's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5FB3
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB642E:						;$CB642E	| Computer Virus text: Simirror's hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5FBE
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB643F:						;$CB643F	| Computer Virus text: T.A.C.'s hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5FCB
	db $0E : dl DATA_CB606E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6450:						;$CB6450	| Computer Virus text: Helper has disappeared!
	db $0E : dl DATA_CB5E48
	db "has disappeared!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6470:						;$CB6470	| Computer Virus text: Kirby & SirKibble are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5ED0
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6489:						;$CB6489	| Computer Virus text: Kirby & Waddle Doo are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5EDE
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB64A2:						;$CB64A2	| Computer Virus text: Kirby & Gim are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5EED
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB64BB:						;$CB64BB	| Computer Virus text: Kirby & Bio Spark are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5EF5
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB64D4:						;$CB64D4	| Computer Virus text: Kirby & Knuckle Joe are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F03
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB64ED:						;$CB64ED	| Computer Virus text: Kirby & Burnin Leo are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F13
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6506:						;$CB6506	| Computer Virus text: Kirby & Birdon are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F22
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB651F:						;$CB651F	| Computer Virus text: Kirby & Blade Knight are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F2D
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6538:						;$CB6538	| Computer Virus text: Kirby & Capusle J are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F3E
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6551:						;$CB6551	| Computer Virus text: Kirby & Plasma wisp are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F4C
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB656A:						;$CB656A	| Computer Virus text: Kirby & Poppy bros.Jr. are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F5C
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6583:						;$CB6583	| Computer Virus text: Kirby & Wheelie are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F6F
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB659C:						;$CB659C	| Computer Virus text: Kirby & Bugzzy are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F7B
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB65B5:						;$CB65B5	| Computer Virus text: Kirby & Rocky are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5F86
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB65CE:						;$CB65CE	| Computer Virus text: Kirby & Parasol\Waddle Dee are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $08,$02
	db "Parasol",$02,"Waddle Dee "
	db $08,$01
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB65F9:						;$CB65F9	| Computer Virus text: Kirby & Bonkers are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5FA7
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6612:						;$CB6612	| Computer Virus text: Kirby & Chilly are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5FB3
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB662B:						;$CB662B	| Computer Virus text: Kirby & Simirror are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5FBE
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6644:						;$CB6644	| Computer Virus text: Kirby & T.A.C. are hurt!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " & "
	db $0E : dl DATA_CB5FCB
	db $02
	db $0E : dl DATA_CB60FA
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB665D:						;$CB665D	| Computer Virus text: Slime is defeated!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db $0E : dl DATA_CB609F
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB666E:						;$CB666E	| Computer Virus text: Dancing Doll is defeated!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db $0E : dl DATA_CB609F
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB667F:						;$CB667F	| Computer Virus text: Witch is defeated!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E8D
	db $0E : dl DATA_CB609F
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6690:						;$CB6690	| Computer Virus text: Evil Knight is defeated!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $0E : dl DATA_CB609F
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB66A1:						;$CB66A1	| Computer Virus text: Red Dragon is defeated!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $0E : dl DATA_CB609F
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB66B2:						;$CB66B2	| Computer Virus text: Kirby defeats all enemies!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db $02
	db $0E : dl DATA_CB6139
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB66C4:						;$CB66C4	| Computer Virus text: Kirby & Co. defeat all enemies!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EC0
	db $02
	db $0E : dl DATA_CB614E
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB66D6:						;$CB66D6	| Computer Virus text: You earned X Courage points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Courage points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB66F2:						;$CB66F2	| Computer Virus text: You earned X Greediness points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Greediness points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6711:						;$CB6711	| Computer Virus text: You earned X Humor points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Humor points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB672B:						;$CB672B	| Computer Virus text: You earned X Exam score points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Excam score points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB674A:						;$CB674A	| Computer Virus text: You earned X Ambition points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Ambition points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6767:						;$CB6767	| Computer Virus text: You earned X Appetite points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Appetite points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6784:						;$CB6784	| Computer Virus text: You earned X Fever points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Fever points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB679E:						;$CB679E	| Computer Virus text: You earned X Tenderness points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Tenderness points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB67BD:						;$CB67BD	| Computer Virus text: You earned X Beauty points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Beauty points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB67D8:						;$CB67D8	| Computer Virus text: You earned X Honesty points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Honesty points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB67F4:						;$CB67F4	| Computer Virus text: You earned X Happy Smile points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Happy Smile points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6814:						;$CB6814	| Computer Virus text: You earned X Love points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Love points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB682D:						;$CB682D	| Computer Virus text: You earned X Friendship points!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6128
	db "Friendship points!"
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB684C:						;$CB684C	| Computer Virus text: You earned X experience points.
	db $0E : dl DATA_CB5E48
	db "You earned "
	db $0F : dl $007711
	db $02,"experience points. "
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6878:						;$CB6878	| Computer Virus text: Kirby takes a "time-out!"
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db "takes",$02,"a `time-out!"""
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6899:						;$CB6899	| Computer Virus text: Kirby gets Cutter ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets ",$02
	db $0E : dl DATA_CB5FD6
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB68B5:						;$CB68B5	| Computer Virus text: Kirby gets Beam ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB5FDD
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB68D9:						;$CB68D9	| Computer Virus text: Kirby gets Yoyo ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB5FE2
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB68EB:						;$CB68EB	| Computer Virus text: Kirby becames a Ninja!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " becomes a "
	db $0E : dl DATA_CB5FE7
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6909:						;$CB6909	| Computer Virus text: Kirby gets Fighter ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets ",$02
	db $0E : dl DATA_CB5FED
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6925:						;$CB6925	| Computer Virus text: Kirby gets Fire ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB5FF5
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6940:						;$CB6940	| Computer Virus text: Kirby gets Wing ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB5FFA
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB695B:						;$CB695B	| Computer Virus text: Kirby gets Sword ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets ",$02
	db $0E : dl DATA_CB5FFF
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6977:						;$CB6977	| Computer Virus text: Kirby gets Jet ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB6005
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6992:						;$CB6992	| Computer Virus text: Kirby gets Plasma ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets ",$02
	db $0E : dl DATA_CB6009
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB69AE:						;$CB69AE	| Computer Virus text: Kirby gets Bomb ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB6010
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB69C9:						;$CB69C9	| Computer Virus text: Kirby gets Wheel ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB6015
	db $02
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB69E5:						;$CB69E5	| Computer Virus text: Kirby learns Suplex!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " learns "
	db $0E : dl DATA_CB601B
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6A00:						;$CB6A00	| Computer Virus text: Kirby gets Stone ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB6022
	db $02
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6A1C:						;$CB6A1C	| Computer Virus text: Kirby holds a Parasol!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " holds a "
	db $0E : dl DATA_CB6028
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6A38:						;$CB6A38	| Computer Virus text: Kirby holds a Hammer!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " holds a "
	db $0E : dl DATA_CB6030
	db $33
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6A53:						;$CB6A53	| Computer Virus text: Kirby gets Ice ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB6037
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6A6E:						;$CB6A6E	| Computer Virus text: Kirby gets Mirror ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB603B
	db $02
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6A8A:						;$CB6A8A	| Computer Virus text: Kirby gets Copy ability.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EB6
	db " gets "
	db $0E : dl DATA_CB6042
	db $0E : dl DATA_CB60AD
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6AA5:						;$CB6AA5	| Computer Virus text: X damage points given to Slime!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6082
	db $0E : dl DATA_CB5E72
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6AB8:						;$CB6AB8	| Computer Virus text: X damage points given to Dancing Doll!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6082
	db $0E : dl DATA_CB5E7C
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6ACB:						;$CB6ACB	| Computer Virus text: X damage points given to Witch!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6082
	db $0E : dl DATA_CB5E8D
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6ADE:						;$CB6ADE	| Computer Virus text: X damage points given to Evil Knight!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6082
	db $0E : dl DATA_CB5E97
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6AF1:						;$CB6AF1	| Computer Virus text: X damage points given to Red Dragon!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB6082
	db $0E : dl DATA_CB5EA7
	db "!",$02
	db $0E : dl DATA_CB5E66
	db $00

DATA_CB6B04:						;$CB6B04	| Computer Virus text: Slime attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6B15:						;$CB6B14	| Computer Virus text: Slime's sleeping...
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db "'s sleeping...",$02
	db $0E : dl DATA_CB5E6C
	db $00

DATA_CB6B31:						;$CB6B31	| Computer Virus text: Slime tries to escape. [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db " tries to escape."
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6B59:						;$CB6B59	| Computer Virus text: Slime calls his gang! [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db " calls his gang!"
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6B80:						;$CB6B80	| Computer Virus text: Slime trips.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E72
	db " trips.",$02
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6B95:						;$CB6B95	| Computer Virus text: Dancing Doll attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6BA6:						;$CB6BA6	| Computer Virus text: Dancing Doll's very proud! [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db "'s very",$02,"proud!",$02
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6BCC:						;$CB6BCC	| Computer Virus text: Dancing Doll's dancing... [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db "'s dancing..."
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6BF0:						;$CB6BF0	| Computer Virus text: Dancing Doll's running around... [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db "'s running",$02,"around..."
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6C1B:						;$CB6C1B	| Computer Virus text: Dancing Doll casts a spell! [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db " casts",$02,"a spell! "
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6C42:						;$CB6C42	| Computer Virus text: Dancing Doll's crying! [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db "'s crying!"
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6C63:						;$CB6C63	| Computer Virus text: Dancing Doll flips a nuclear missile switch! [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db " flips",$02,"a nuclear missile switch!"
	db $02
	db " "
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6C9C:						;$CB6C9C	| Computer Virus text: Dancing Doll's sleeping... [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db $2D,$79,$20,$79,$72,$6B,$6B,$76
	db $6F,$74,$6D,$2B,$2B,$2B
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6CC1:						;$CB6CC1	| Computer Virus text: Dancing Doll trips. [beat] But, nothing happens.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E7C
	db $20,$7A,$78,$6F,$76,$79,$2B
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $0E : dl DATA_CB60B7
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6CDF:						;$CB6CDF	| Computer Virus text: Witch attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E8D
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6CF0:						;$CB6CF0	| Computer Virus text: Witch casts a "fire spell!"
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E8D
	db $20,$69,$67,$79,$7A,$79,$20,$67
	db $20,$4A,$6C,$6F,$78,$6B,$20,$79
	db $76,$6B,$72,$72,$33,$4B
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6D13:						;$CB6D13	| Computer Virus text: Witch casts an "ice spell!"
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E8D
	db $20,$69,$67,$79,$7A,$79,$02,$67
	db $74,$20,$4A,$6F,$69,$6B,$20,$79
	db $76,$6B,$72,$72,$33,$4B,$20
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6D37:						;$CB6D37	| Computer Virus text: Witch retreats.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E8D
	db $20,$78,$6B,$7A,$78,$6B,$67,$7A
	db $79,$2B
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6D4E:						;$CB6D4E	| Computer Virus text: Evil Knight attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6D5F:						;$CB6D5F	| Computer Virus text: Evil Knight swings an axe!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $20,$79,$7D,$6F,$74,$6D,$79,$02
	db $67,$74,$20,$67,$7E,$6B,$33
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6D7B:						;$CB6D7B	| Computer Virus text: Evil Knight throws knives!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $20,$7A,$6E,$78,$75,$7D,$79,$02
	db $71,$74,$6F,$7C,$6B,$79,$33
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6D97:						;$CB6D97	| Computer Virus text: Evil Knight's eyes gleam!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $2D,$79,$02,$6B,$7F,$6B,$79,$20
	db $6D,$72,$6B,$67,$73,$33
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6DB2:						;$CB6DB2	| Computer Virus text: Evil Knight stores energy! [beat] Attack power increases!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $20,$79,$7A,$75,$78,$6B,$79,$02
	db $6B,$74,$6B,$78,$6D,$7F,$33,$20
	db $02
	db $0E : dl DATA_CB5E6C
	db $01,$15
	db $4D,$7A,$7A,$67,$69,$71,$20,$76
	db $75,$7D,$6B,$78,$20,$6F,$74,$69
	db $78,$6B,$67,$79,$6B,$79,$33,$20
	db $20
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6DEF:						;$CB6DEF	| Computer Virus text: Evil Knight retreats.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5E97
	db $20,$78,$6B,$7A,$78,$6B,$67,$7A
	db $79,$2B
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6E06:						;$CB6E06	| Computer Virus text: Red Dragon attacks!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $0E : dl DATA_CB6051
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6E17:						;$CB6E17	| Computer Virus text: Red Dragon blows flames!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $20,$68,$72,$75,$7D,$79,$02,$6C
	db $72,$67,$73,$6B,$79,$33,$20
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6E33:						;$CB6E33	| Computer Virus text: Red Dragon scratches!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $20,$79,$69,$78,$67,$7A,$69,$6E
	db $6B,$79,$33,$20
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6E4C:						;$CB6E4C	| Computer Virus text: Red Dragon flaps his wings!
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $20,$6C,$72,$67,$76,$79,$20,$6E
	db $6F,$79,$02,$7D,$6F,$74,$6D,$79
	db $33,$20
	db $0E : dl DATA_CB5E6C
	db $00
	
DATA_CB6E6B:						;$CB6E6B	| Computer Virus text: Red Dragon retreats.
	db $0E : dl DATA_CB5E48
	db $0E : dl DATA_CB5EA7
	db $20,$78,$6B,$7A,$78,$6B,$67,$7A
	db $79,$2B
	db $0E : dl DATA_CB5E6C
	db $00


; TODO: $CB6E82 to $CB7830

DATA_CB7831:						;$CB7831	| Error message from an invalid controller.
	db $0E : dl DATA_CB781C
	db $20,$30,$30,$30,$30,$30,$30,$20			;[ ------ |
	db $35,$5C,$72,$6B,$67,$79,$6B,$20			;|(Please |
	db $5A,$75,$7A,$6B,$36,$20,$30,$30			;|Note) --|
	db $30,$30,$30,$30,$02,$20,$20,$20			;|----/   |
	db $20,$20,$55,$6C,$20,$7F,$75,$7B			;|  If you|
	db $20,$67,$78,$6B,$20,$7B,$79,$6F			;| are usi|
	db $74,$6D,$20,$7A,$6E,$6B,$02,$20			;|ng the/ |
	db $20,$20,$20,$20,$59,$75,$7B,$79			;|    Mous|
	db $6B,$2C,$20,$5F,$7B,$76,$6B,$78			;|e, Super|
	db $5F,$69,$75,$76,$6B,$20,$75,$78			;|Scope or|
	db $20,$02,$20,$20,$20,$20,$20,$59			;| /     M|
	db $7B,$72,$7A,$6F,$76,$72,$67,$7F			;|ultiplay|
	db $6B,$78,$20,$67,$6A,$67,$76,$7A			;|er adapt|
	db $6B,$78,$2C,$20,$02,$20,$20,$20			;|er, /   |
	db $20,$20,$79,$7D,$6F,$7A,$69,$6E			;|  switch|
	db $20,$7A,$75,$20,$4F,$75,$74,$7A			;| to Cont|
	db $78,$75,$72,$72,$6B,$78,$2B,$02			;|roller./|
	db $20,$02,$20,$20,$20,$20,$60,$6E			;| /    Th|
	db $67,$74,$71,$79,$33,$00					;|anks!]

DATA_CB78CB:						;$CB78CB	| Error message from an invalid console.
	db $0E : dl DATA_CB781C
	db $05,$0C
	db $20,$30,$30,$30,$35,$20,$63,$67			;[ ---( Wa|
	db $78,$74,$6F,$74,$6D,$20,$36,$30			;|rning )-|
	db $30,$30,$02,$20,$02,$20,$60,$6E			;|--/ / Th|
	db $6F,$79,$20,$6D,$67,$73,$6B,$20			;|is game |
	db $76,$67,$71,$20,$6F,$79,$20,$02			;|pak is /|
	db $20,$74,$75,$7A,$20,$6A,$6B,$79			;| not des|
	db $6F,$6D,$74,$6B,$6A,$20,$02,$20			;|igned / |
	db $6C,$75,$78,$20,$7F,$75,$7B,$78			;|for your|
	db $02,$20,$5F,$61,$5C,$51,$5E,$20			;|/ SUPER |
	db $52,$4D,$59,$55,$4F,$5B,$59,$20			;|FAMICOM |
	db $75,$78,$02,$20,$5F,$7B,$76,$6B			;|or/ Supe|
	db $78,$5A,$51,$5F,$2B,$02,$20,$02			;|rNES./ /|
	db $20,$5A,$6F,$74,$7A,$6B,$74,$6A			;| Nintend|
	db $75,$20,$4F,$5B,$2B,$2C,$58,$7A			;|o CO.,Lt|
	db $6A,$2B,$00								;|d.]
















