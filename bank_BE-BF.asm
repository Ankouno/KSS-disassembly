; This bank contains mainly pointers to level data and graphics.
; Although this bank is technically mapped at $BE, the Super MMC maps it to the lower half of bank FF.
; The Super MMC also maps $BF to the upper half of FF.

ORG $FF0000

    dw $009A,$0596,$089C,$013F    ;$FF0000 |    Unsure what this is for but it has to do with loading level graphics
    dw $0102,$0043,$0022,$002A    ;$FF0008 |
    dw $0038,$0040,$0044,$0056    ;$FF0010 |
    dw $0068,$006A,$006C,$0076    ;$FF0018 |
    dw $007C,$009A,$00B2,$00D6    ;$FF0020 |
    dw $00FA,$0106,$011E,$0146    ;$FF0028 |
    dw $016A,$0196,$01A2,$01A6    ;$FF0030 |
    dw $01AA,$01AE,$01B2,$01B6    ;$FF0038 |
    dw $01BA,$02FE,$0302,$030E    ;$FF0040 |
    dw $0322,$0342,$035E,$0366    ;$FF0048 |
    dw $0382,$0392,$039A,$03AE    ;$FF0050 |
    dw $03D2,$03EE,$0426,$043A    ;$FF0058 |
    dw $045E,$047A,$049A,$04A6    ;$FF0060 |
    dw $04B2,$050A,$050E,$051E    ;$FF0068 |
    dw $052A,$0532,$053A,$0542    ;$FF0070 |
    dw $0546,$054A,$054E,$0552    ;$FF0078 |
    dw $0556,$055A,$0562,$0566    ;$FF0080 |
    dw $056E,$0572,$057A,$057E    ;$FF0088 |
    dw $0582,$0586,$058A,$058E    ;$FF0090 |
    dw $0592                      ;$FF0098 |

LevelLayoutDataPointers:          ; Giant pointer table to level layout data.
    dd DATA8_F0DACE
    dd DATA8_F020EF
    dd DATA8_F081C4
    dd DATA8_F1E611
    dd DATA8_F1E020
    dd DATA8_F00DF8
    dd DATA8_F09AD3
    dd DATA8_F02972
    dd DATA8_F1CAB4
    dd DATA8_F089F1
    dd DATA8_F1F8F4
    dd DATA8_F07CB5
    dd DATA8_F0947C
    dd DATA8_F0980C
    dd DATA8_F1C633
    dd DATA8_F09A24
    dd DATA8_F1DC1F
    dd DATA8_F0225F
    dd DATA8_F06502
    dd DATA8_F15B14
    dd DATA8_F13D6F
    dd DATA8_F1D39A
    dd DATA8_F2A14B
    dd DATA8_F066ED
    dd DATA8_F0836C
    dd DATA8_F193F0
    dd DATA8_F05E14
    dd DATA8_F19E90
    dd DATA8_F01DFB
    dd DATA8_F103D8
    dd DATA8_F25394
    dd DATA8_F433A2
    dd DATA8_F06F58
    dd DATA8_F1A670
    dd DATA8_F0449B
    dd DATA8_F3C872
    dd DATA8_F04809
    dd DATA8_F1B0A7
    dd DATA8_F48BC3
    dd DATA8_F3482D
    dd DATA8_F258C8
    dd DATA8_F5FED2
    dd DATA8_F07D90
    dd DATA8_F2FB51
    dd DATA8_F09B82
    dd DATA8_F182C9
    dd DATA8_F170D4
    dd DATA8_F21CED
    dd DATA8_F330C3
    dd DATA8_F0399E
    dd DATA8_F1FAC8
    dd DATA8_F1AE23
    dd DATA8_F1549A
    dd DATA8_F3CE9E
    dd DATA8_F2632B
    dd DATA8_F365E2
    dd DATA8_F4479A
    dd DATA8_F12C61
    dd DATA8_F1B594
    dd DATA8_F03450
    dd DATA8_F06AB7
    dd DATA8_F09E23
    dd DATA8_F3F2F8
    dd DATA8_F00000
    dd DATA8_F06D81
    dd DATA8_F0DF63
    dd DATA8_F1BCD3
    dd DATA8_F1C876
    dd DATA8_F21749
    dd DATA8_F4518C
    dd DATA8_F63F60
    dd DATA8_F0B3B7
    dd DATA8_F05F14
    dd DATA8_F067E0
    dd DATA8_F16DCE
    dd DATA8_F26D64
    dd DATA8_F395D6
    dd DATA8_F072F3
    dd DATA8_F10000
    dd DATA8_F116AD
    dd DATA8_F0D0B4
    dd DATA8_F18B79
    dd DATA8_F15E50
    dd DATA8_F1969E
    dd DATA8_F176DC
    dd DATA8_F0055B
    dd DATA8_F2F39B
    dd DATA8_F4BA70
    dd DATA8_F40000
    dd DATA8_F07127
    dd DATA8_F48252
    dd DATA8_F2C7C0
    dd DATA8_F157D8
    dd DATA8_F036FB
    dd DATA8_F1B802
    dd DATA8_F03C39
    dd DATA8_F00395
    dd DATA8_F1EFAE
    dd DATA8_F035A6
    dd DATA8_F008D4
    dd DATA8_F12557
    dd DATA8_F2AE83
    dd DATA8_F02C39
    dd DATA8_F16AC0
    dd DATA8_F11A5B
    dd DATA8_F128F1
    dd DATA8_F1648E
    dd DATA8_F1D166
    dd DATA8_F1CF2E
    dd DATA8_F17CDF
    dd DATA8_F1FE69
    dd DATA8_F014C2
    dd DATA8_F1E41B
    dd DATA8_F055FD
    dd DATA8_F1C3E3
    dd DATA8_F046E5
    dd DATA8_F03D7D
    dd DATA8_F032FA
    dd DATA8_F026A3
    dd DATA8_F08B81
    dd DATA8_F08ABA
    dd DATA8_F065F8
    dd DATA8_F04927
    dd DATA8_F073D9
    dd DATA8_F074BF
    dd DATA8_F0165B
    dd DATA8_F08F55
    dd DATA8_F0D4A2
    dd DATA8_F085E1
    dd DATA8_F08D0F
    dd DATA8_F1C190
    dd DATA8_F2E3FD
    dd DATA8_F2EBDD
    dd DATA8_F017E6
    dd DATA8_F388B3
    dd DATA8_F031A3
    dd DATA8_F053ED
    dd DATA8_F023CD
    dd DATA8_F051D5
    dd DATA8_F1CCF2
    dd DATA8_F1F18F
    dd DATA8_F01AF6
    dd DATA8_F00FAE
    dd DATA8_F167AA
    dd DATA8_F36D0D
    dd DATA8_F1D5CA
    dd DATA8_F1F36E
    dd DATA8_F06211
    dd DATA8_F1EDCC
    dd DATA8_F0930A
    dd DATA8_F08C48
    dd DATA8_F06014
    dd DATA8_F0720D
    dd DATA8_F09193
    dd DATA8_F23343
    dd DATA8_F01162
    dd DATA8_F0384F
    dd DATA8_F16171
    dd DATA8_F39C4A
    dd DATA8_F49E93
    dd DATA8_F054F6
    dd DATA8_F1912A
    dd DATA8_F1F547
    dd DATA8_F4CC81
    dd DATA8_F248FC
    dd DATA8_F06C95
    dd DATA8_F40A7D
    dd DATA8_F00A8B
    dd DATA8_F01315
    dd DATA8_F0E034
    dd DATA8_F29CCB
    dd DATA8_F1E9F2
    dd DATA8_F107AF
    dd DATA8_F28A67
    dd DATA8_F069C5
    dd DATA8_F05702
    dd DATA8_F0D269
    dd DATA8_F28105
    dd DATA8_F4D547
    dd DATA8_F18E58
    dd DATA8_F1E21F
    dd DATA8_F2B2D0
    dd DATA8_F4654A
    dd DATA8_F06E6D
    dd DATA8_F08510
    dd Level_ReactorBoss
    dd DATA8_F27264
    dd DATA8_F20BC5
    dd DATA8_F086B2
    dd DATA8_F07AF1
    dd DATA8_F01970
    dd DATA8_F35E9F
    dd DATA8_F06BA7
    dd DATA8_F112F5
    dd DATA8_F03EBF
    dd DATA8_F0630E
    dd DATA8_F3D4C5
    dd DATA8_F10F3D
    dd DATA8_F2DFFC
    dd DATA8_F2EFBC
    dd DATA8_F21188
    dd DATA8_F0D01D
    dd DATA8_F08782
    dd DATA8_F0A0BA
    dd DATA8_F09C2C
    dd DATA8_F0A015
    dd DATA8_F3A2B2
    dd DATA8_F53CCF
    dd DATA8_F25DFA
    dd DATA8_F03FF7
    dd DATA8_F090D6
    dd DATA8_F0CF85
    dd DATA8_F09CD5
    dd DATA8_F1DA1C
    dd DATA8_F318E4
    dd DATA8_F04FB7
    dd DATA8_F04C77
    dd DATA8_F045C0
    dd DATA8_F050C7
    dd DATA8_F0424F
    dd DATA8_F04D8E
    dd DATA8_F04375
    dd DATA8_F04B5D
    dd DATA8_F2FF29
    dd DATA8_F05806
    dd DATA8_F04EA3
    dd DATA8_F052E3
    dd DATA8_F01C7A
    dd DATA8_F5A02C
    dd DATA8_F238C9
    dd DATA8_F07040
    dd DATA8_F0CEE8
    dd DATA8_F02AD8
    dd DATA8_F3ECF4
    dd DATA8_F2E7FD
    dd DATA8_F1EBE0
    dd DATA8_F34FC3
    dd DATA8_F06113
    dd DATA8_F09250
    dd DATA8_F1889A
    dd DATA8_F0D387
    dd DATA8_F02539
    dd DATA8_F338AC
    dd DATA8_F30000
    dd DATA8_F3DAD7
    dd DATA8_F1F71E
    dd DATA8_F0D9EA
    dd DATA8_F08852
    dd DATA8_F1D7F8
    dd DATA8_F2D7F3
    dd DATA8_F3408A
    dd DATA8_F243A4
    dd DATA8_F3F8EE
    dd DATA8_F8FF32
    dd DATA8_F08922
    dd DATA8_F09974
    dd DATA8_F001CD
    dd DATA8_F03AED
    dd DATA8_F0DB3B
    dd DATA8_F23E4C
    dd DATA8_F13338
    dd DATA8_F0DBA6
    dd DATA8_F7FE9C
    dd DATA8_F07F42
    dd DATA8_F09ECA
    dd DATA8_F00C42
    dd DATA8_F09F70
    dd DATA8_F093C3
    dd DATA8_F068D3
    dd DATA8_F06409
    dd DATA8_F0DC11
    dd DATA8_FAFF93
    dd DATA8_F0D1DA
    dd DATA8_F09D7C
    dd DATA8_F0D8EE
    dd DATA8_F0D2F8
    dd DATA8_F0DA5C
    dd DATA8_F0D149
    dd DATA8_F07E69
    dd DATA8_F136A1
    dd DATA8_F096A3
    dd DATA8_F098C0
    dd DATA8_F09758
    dd DATA8_F0DC7C
    dd DATA8_F0DFCC
    dd DATA8_F0D866
    dd DATA8_F0D52F
    dd DATA8_F0D646
    dd DATA8_F0DE8F
    dd DATA8_F0D756
    dd DATA8_F0D7DE
    dd DATA8_F0DCE7
    dd DATA8_F0D415
    dd DATA8_F0DE25
    dd DATA8_F04A43
    dd DATA8_F0DEF9
    dd DATA8_F0D6CE
    dd DATA8_F0DD51
    dd DATA8_F09016
    dd DATA8_F080EF
    dd DATA8_F0843E
    dd DATA8_F0E4DB
    dd DATA8_F0E53E
    dd DATA8_F0E5A1
    dd DATA8_F0E604
    dd DATA8_F0E667
    dd DATA8_F0E6CA
    dd DATA8_F0E72D
    dd DATA8_F0E09A
    dd DATA8_F0E0FD
    dd DATA8_F0E160
    dd DATA8_F0E1C3
    dd DATA8_F0E226
    dd DATA8_F0E289
    dd DATA8_F0E2EC
    dd DATA8_F0E34F
    dd DATA8_F0E3B2
    dd DATA8_F0E415
    dd DATA8_F0E478
    dl $000000

TilesetGraphicsDataPointers:
    dl DATA8_F43DA7               ;$FF0599 |	Pointers to compressed tileset graphics
    dl DATA8_FC37B6               ;$FF059C |
    dl DATA8_F78654               ;$FF059F |
    dl DATA8_FC0000               ;$FF05A2 |
    dl DATA8_FA0000               ;$FF05A5 |
    dl DATA8_F9E494               ;$FF05A8 |
    dl DATA8_F5DDE9               ;$FF05AB |
    dl DATA8_FCA5A8               ;$FF05AE |
    dl DATA8_FEB42C               ;$FF05B1 |
    dl DATA8_FE3CD7               ;$FF05B4 |
    dl DATA8_F6E1DD               ;$FF05B7 |
    dl DATA8_FD0000               ;$FF05BA |
    dl DATA8_F5BAB0               ;$FF05BD |
    dl GFX_Tileset_RoMK3          ;$FF05C0 |
    dl DATA8_FC6EF1               ;$FF05C3 |
    dl GFX_Tileset_FF88DB         ;$FF05C6 |
    dl DATA8_FE78B3               ;$FF05C9 |
    dl DATA8_F4DE0C               ;$FF05CC |
    dl DATA8_FB0000               ;$FF05CF |
    dl DATA8_FB6555               ;$FF05D2 |
    dl DATA8_F50F43               ;$FF05D5 |
    dl DATA8_FB3381               ;$FF05D8 |
    dl DATA8_FD7538               ;$FF05DB |
    dl DATA8_FD3AEA               ;$FF05DE |
    dl DATA8_FDAF73               ;$FF05E1 |
    dl DATA8_FA7A3A               ;$FF05E4 |
    dl DATA8_F90000               ;$FF05E7 |
    dl DATA8_FB921D               ;$FF05EA |
    dl GFX_Tileset_FF4989         ;$FF05ED |
    dl GFX_Tileset_RoMK1          ;$FF05F0 |
    dl DATA8_F80000               ;$FF05F3 |
    dl DATA8_FAA25D               ;$FF05F6 |
    dl DATA8_FAC681               ;$FF05F9 |
    dl DATA8_F69E7B               ;$FF05FC |
    dl DATA8_F5C6A4               ;$FF05FF |
    dl DATA8_F71BC1               ;$FF0602 |
    dl DATA8_F8AECA               ;$FF0605 |
    dl DATA8_FDE764               ;$FF0608 |
    dl DATA8_FAE912               ;$FF060B |
    dl DATA8_F6158E               ;$FF060E |
    dl DATA8_F83C76               ;$FF0611 |
    dl DATA8_F7E826               ;$FF0614 |
    dl DATA8_F7D064               ;$FF0617 |
    dl DATA8_F876EB               ;$FF061A |
    dl DATA8_F8E66D               ;$FF061D |
    dl DATA8_F67ADB               ;$FF0620 |
    dl DATA8_F892F0               ;$FF0623 |
    dl DATA8_FCDC46               ;$FF0626 |
    dl DATA8_F70000               ;$FF0629 |
    dl DATA8_F7517D               ;$FF062C |
    dl DATA8_FA51D7               ;$FF062F |
    dl DATA8_F51E80               ;$FF0632 |
    dl DATA8_F96612               ;$FF0635 |
    dl DATA8_F94463               ;$FF0638 |
    dl DATA8_F92243               ;$FF063B |
    dl DATA8_F9A613               ;$FF063E |
    dl DATA8_F0B783               ;$FF0641 |
    dl DATA8_F0EE74               ;$FF0644 |
    dl DATA8_F0BBF1               ;$FF0647 |
    dl DATA8_F0EED6               ;$FF064A |
    dl DATA8_F0F4A7               ;$FF064D |
    dl DATA8_F0EF9A               ;$FF0650 |
    dl DATA8_F0F56D               ;$FF0653 |
    dl DATA8_F0F184               ;$FF0656 |
    dl DATA8_F0F1E6               ;$FF0659 |
    dl DATA8_F0F2AA               ;$FF065C |
    dl DATA8_F0F30C               ;$FF065F |
    dl DATA8_F0E7F2               ;$FF0662 |
    dl DATA8_F0E854               ;$FF0665 |
    dl DATA8_F0E8B6               ;$FF0668 |
    dl DATA8_F0EB02               ;$FF066B |
    dl DATA8_F0F5F1               ;$FF066E |
    dl DATA8_F0EB64               ;$FF0671 |
    dl DATA8_F0F4E9               ;$FF0674 |
    dl DATA8_F0EBC6               ;$FF0677 |
    dl DATA8_F0EC28               ;$FF067A |
    dl DATA8_F0EC8A               ;$FF067D |
    dl DATA8_F0BC93               ;$FF0680 |
    dl DATA8_F0BDD7               ;$FF0683 |
    dl DATA8_F0BE79               ;$FF0686 |
    dl DATA8_F0F122               ;$FF0689 |
    dl DATA8_F0C611               ;$FF068C |
    dl DATA8_F0C755               ;$FF068F |
    dl DATA8_F0CDA9               ;$FF0692 |
    dl DATA8_F0F465               ;$FF0695 |
    dl DATA8_F0A66D               ;$FF0698 |
    dl DATA8_F0E790               ;$FF069B |
    dl DATA8_F0AFEB               ;$FF069E |
    dl DATA8_F0B08D               ;$FF06A1 |
    dl DATA8_F0B12F               ;$FF06A4 |
    dl DATA8_F0EAA0               ;$FF06A7 |
    dl DATA8_F0B273               ;$FF06AA |
    dl DATA8_F0B4FB               ;$FF06AD |
    dl DATA8_F0B59D               ;$FF06B0 |
    dl DATA8_F0B63F               ;$FF06B3 |
    dl DATA8_F6FFD4               ;$FF06B6 |
    dl DATA8_F0B6E1               ;$FF06B9 |
    dl DATA8_F0ECEC               ;$FF06BC |
    dl DATA8_F0ED4E               ;$FF06BF |
    dl DATA8_F0F5AF               ;$FF06C2 |
    dl DATA8_F08E93               ;$FF06C5 |
    dl DATA8_F0B825               ;$FF06C8 |
    dl DATA8_F0B8C7               ;$FF06CB |
    dl DATA8_F0B969               ;$FF06CE |
    dl DATA8_F0BA0B               ;$FF06D1 |
    dl DATA8_F0BAAD               ;$FF06D4 |
    dl DATA8_F0BB4F               ;$FF06D7 |
    dl DATA8_F075A5               ;$FF06DA |
    dl DATA8_F05C10               ;$FF06DD |
    dl DATA8_F0BD35               ;$FF06E0 |
    dl DATA8_F0F52B               ;$FF06E3 |
    dl DATA8_F07687               ;$FF06E6 |
    dl DATA8_F07769               ;$FF06E9 |
    dl DATA8_F0E97A               ;$FF06EC |
    dl DATA8_F0EA3E               ;$FF06EF |
    dl DATA8_F0BF1B               ;$FF06F2 |
    dl DATA8_F0BFBD               ;$FF06F5 |
    dl DATA8_F4FFC9               ;$FF06F8 |
    dl DATA8_F0F6B1               ;$FF06FB |
    dl DATA8_F0F6D3               ;$FF06FE |
    dl DATA8_F0F6F5               ;$FF0701 |
    dl DATA8_F0F739               ;$FF0704 |
    dl DATA8_F0F75B               ;$FF0707 |
    dl DATA8_F0C05F               ;$FF070A |
    dl DATA8_F0C101               ;$FF070D |
    dl DATA8_F0C1A3               ;$FF0710 |
    dl DATA8_F0C245               ;$FF0713 |
    dl DATA8_F0C2E7               ;$FF0716 |
    dl DATA8_F0C389               ;$FF0719 |
    dl DATA8_F0EE12               ;$FF071C |
    dl DATA8_F0C42B               ;$FF071F |
    dl DATA8_F0C4CD               ;$FF0722 |
    dl DATA8_F0EF38               ;$FF0725 |
    dl DATA8_F0C56F               ;$FF0728 |
    dl DATA8_F0F05E               ;$FF072B |
    dl DATA8_F0F0C0               ;$FF072E |
    dl DATA8_F05D12               ;$FF0731 |
    dl DATA8_F0C6B3               ;$FF0734 |
    dl DATA8_F05A0C               ;$FF0737 |
    dl DATA8_F0C7F7               ;$FF073A |
    dl DATA8_F0C899               ;$FF073D |
    dl DATA8_F0C93B               ;$FF0740 |
    dl DATA8_F0F717               ;$FF0743 |
    dl DATA8_F0C9DD               ;$FF0746 |
    dl DATA8_F0CA7F               ;$FF0749 |
    dl DATA8_F0CB21               ;$FF074C |
    dl DATA8_F0CBC3               ;$FF074F |
    dl DATA8_F0CC65               ;$FF0752 |
    dl DATA8_F0CD07               ;$FF0755 |
    dl DATA8_F05B0E               ;$FF0758 |
    dl DATA8_F0A15D               ;$FF075B |
    dl DATA8_F0A1FF               ;$FF075E |
    dl DATA8_F0A2A1               ;$FF0761 |
    dl DATA8_F0A343               ;$FF0764 |
    dl DATA8_F0A3E5               ;$FF0767 |
    dl DATA8_F0A487               ;$FF076A |
    dl DATA8_F0EDB0               ;$FF076D |
    dl DATA8_F0A529               ;$FF0770 |
    dl DATA8_F0A5CB               ;$FF0773 |
    dl DATA8_F08DD1               ;$FF0776 |
    dl DATA8_F0A70F               ;$FF0779 |
    dl DATA8_F0A7B1               ;$FF077C |
    dl DATA8_F0EFFC               ;$FF077F |
    dl DATA8_F0A853               ;$FF0782 |
    dl DATA8_F0A8F5               ;$FF0785 |
    dl DATA8_F0A997               ;$FF0788 |
    dl DATA8_F0AA39               ;$FF078B |
    dl DATA8_F0AADB               ;$FF078E |
    dl DATA8_F0F248               ;$FF0791 |
    dl DATA8_F0AB7D               ;$FF0794 |
    dl DATA8_F0AC1F               ;$FF0797 |
    dl DATA8_F0ACC1               ;$FF079A |
    dl DATA8_F0AD63               ;$FF079D |
    dl DATA8_F0AE05               ;$FF07A0 |
    dl DATA8_F0AEA7               ;$FF07A3 |
    dl DATA8_F0E918               ;$FF07A6 |
    dl DATA8_F0AF49               ;$FF07A9 |
    dl DATA8_F0E9DC               ;$FF07AC |
    dl DATA8_F0784B               ;$FF07AF |
    dl DATA8_F0792D               ;$FF07B2 |
    dl DATA8_F07A0F               ;$FF07B5 |
    dl DATA8_F0B1D1               ;$FF07B8 |
    dl DATA8_F07BD3               ;$FF07BB |
    dl DATA8_F0B315               ;$FF07BE |
    dl DATA8_F0B459               ;$FF07C1 |
    dl DATA8_FEFFE8               ;$FF07C4 |
    dl DATA8_F19BEB               ;$FF07C7 |
    dl DATA8_F14AC9               ;$FF07CA |
    dl DATA8_F4EF2F               ;$FF07CD |
    dl DATA8_F2CFE4               ;$FF07D0 |
    dl DATA8_F205E7               ;$FF07D3 |
    dl DATA8_F37406               ;$FF07D6 |
    dl DATA8_F0DDBB               ;$FF07D9 |
    dl DATA8_F14780               ;$FF07DC |
    dl DATA8_F414E1               ;$FF07DF |
    dl DATA8_F0071B               ;$FF07E2 |
    dl DATA8_F320DB               ;$FF07E5 |
    dl DATA8_FEEF2A               ;$FF07E8 |
    dl DATA8_F46F03               ;$FF07EB |
    dl DATA8_F2A5C7               ;$FF07EE |
    dl DATA8_F2D3EC               ;$FF07F1 |
    dl DATA8_F5E90F               ;$FF07F4 |
    dl DATA8_F13A0A               ;$FF07F7 |
    dl DATA8_F2684B               ;$FF07FA |
    dl DATA8_F310D6               ;$FF07FD |
    dl DATA8_F3BBFC               ;$FF0800 |
    dl DATA8_F3B5AD               ;$FF0803 |
    dl DATA8_F285C9               ;$FF0806 |
    dl DATA8_F29835               ;$FF0809 |
    dl DATA8_F22824               ;$FF080C |
    dl DATA8_F1515B               ;$FF080F |
    dl DATA8_F179DF               ;$FF0812 |
    dl DATA8_F2F776               ;$FF0815 |
    dl DATA8_F2CBD7               ;$FF0818 |
    dl DATA8_F2BB41               ;$FF081B |
    dl DATA8_F20000               ;$FF081E |
    dl DATA8_F38F62               ;$FF0821 |
    dl DATA8_F2228A               ;$FF0824 |
    dl DATA8_F173D8               ;$FF0827 |
    dl DATA8_F12FCF               ;$FF082A |
    dl DATA8_F2AA25               ;$FF082D |
    dl DATA8_F55A4E               ;$FF0830 |
    dl DATA8_F3C244               ;$FF0833 |
    dl DATA8_F45B73               ;$FF0836 |
    dl DATA8_F1BA6E               ;$FF0839 |
    dl DATA8_F11E06               ;$FF083C |
    dl DATA8_F24E4B               ;$FF083F |
    dl DATA8_F02EF1               ;$FF0842 |
    dl DATA8_F37AF6               ;$FF0845 |
    dl DATA8_FBE75C               ;$FF0848 |
    dl DATA8_F736CE               ;$FF084B |
    dl DATA8_F01F75               ;$FF084E |
    dl DATA8_F4F7B0               ;$FF0851 |
    dl DATA8_F76BEC               ;$FF0854 |
    dl DATA8_F62A7D               ;$FF0857 |
    dl DATA8_F2939E               ;$FF085A |
    dl DATA8_F7B890               ;$FF085D |
    dl DATA8_F6685A               ;$FF0860 |
    dl DATA8_F140D4               ;$FF0863 |
    dl DATA8_F60000               ;$FF0866 |
    dl DATA8_F6B000               ;$FF0869 |
    dl DATA8_FBBDF4               ;$FF086C |
    dl DATA8_F6F185               ;$FF086F |
    dl DATA8_F185B4               ;$FF0872 |
    dl DATA8_F859D6               ;$FF0875 |
    dl DATA8_F1A3D8               ;$FF0878 |
    dl DATA8_F35759               ;$FF087B |
    dl DATA8_F6C127               ;$FF087E |
    dl DATA8_F68CD1               ;$FF0881 |
    dl DATA8_F5852B               ;$FF0884 |
    dl DATA8_F9C5CD               ;$FF0887 |
    dl DATA8_FA28F5               ;$FF088A |
    dl DATA8_F98631               ;$FF088D |
    dl DATA8_F8CAA3               ;$FF0890 |
    dl DATA8_F81E92               ;$FF0893 |
    dl DATA8_F6D1C7               ;$FF0896 |
    dl DATA8_F41F3D               ;$FF0899 |
    dl $000000                    ;$FF089C |
    dl DATA8_F27762               ;$FF089F |
    dl DATA8_F0801A               ;$FF08A2 |
    dl DATA8_F04128               ;$FF08A5 |
    dl DATA8_FE0000               ;$FF08A8 |
    dl DATA8_F095EC               ;$FF08AB |
    dl DATA8_F0D973               ;$FF08AE |
    dl DATA8_F0F672               ;$FF08B1 |
    dl DATA8_F4C387               ;$FF08B4 |
    dl DATA8_F17FDD               ;$FF08B7 |
    dl DATA8_F52DAA               ;$FF08BA |
    dl DATA8_F5F3F4               ;$FF08BD |
    dl DATA8_F3A90F               ;$FF08C0 |
    dl DATA8_F568EE               ;$FF08C3 |
    dl DATA8_F19946               ;$FF08C6 |
    dl DATA8_F4B155               ;$FF08C9 |
    dl DATA8_F1E803               ;$FF08CC |
    dl DATA8_F0280C               ;$FF08CF |
    dl DATA8_F1A907               ;$FF08D2 |
    dl DATA8_F09535               ;$FF08D5 |
    dl DATA8_F2DBF9               ;$FF08D8 |
    dl DATA8_F3E0E5               ;$FF08DB |
    dl DATA8_F1BF32               ;$FF08DE |
    dl DATA8_F14E12               ;$FF08E1 |
    dl DATA8_F478B9               ;$FF08E4 |
    dl DATA8_F1FC9A               ;$FF08E7 |
    dl DATA8_F0F41A               ;$FF08EA |
    dl DATA8_F50000               ;$FF08ED |
    dl DATA8_F02D96               ;$FF08F0 |
    dl DATA8_F0CE4B               ;$FF08F3 |
    dl DATA8_F5770D               ;$FF08F6 |
    dl DATA8_F1A134               ;$FF08F9 |
    dl DATA8_F2B70B               ;$FF08FC |
    dl DATA8_F653EF               ;$FF08FF |
    dl DATA8_F3E6F0               ;$FF0902 |
    dl DATA8_F1DE21               ;$FF0905 |
    dl DATA8_F592BD               ;$FF0908 |
    dl DATA8_F5AD79               ;$FF090B |
    dl DATA8_F14431               ;$FF090E |
    dl DATA8_F121AF               ;$FF0911 |
    dl DATA8_F4A7F9               ;$FF0914 |
    dl DATA8_F0F633               ;$FF0917 |
    dl DATA8_F28F03               ;$FF091A |
    dl DATA8_F10B76               ;$FF091D |
    dl DATA8_F7A0A1               ;$FF0920 |
    dl DATA8_F08299               ;$FF0923 |
    dl DATA8_F3FEDF               ;$FF0926 |
    dl DATA8_F0304C               ;$FF0929 |
    dl DATA8_F54B93               ;$FF092C |
    dl DATA8_F4952C               ;$FF092F |
    dl DATA8_F1AB9C               ;$FF0932 |
    dl DATA8_F1B326               ;$FF0935 |
    dl DATA8_F0D5BB               ;$FF0938 |
    dl DATA8_F0F3CD               ;$FF093B |
    dl DATA8_F2BF72               ;$FF093E |
    dl DATA8_F5D28A               ;$FF0941 |
    dl DATA8_F2C399               ;$FF0944 |
    dl DATA8_F328D0               ;$FF0947 |
    dl DATA8_F22DBC               ;$FF094A |
    dl DATA8_F0F36E               ;$FF094D |
    dl DATA8_F05909               ;$FF0950 |
    dl DATA8_F3AF5E               ;$FF0953 |
    dl DATA8_F27C36               ;$FF0956 |
    dl DATA8_F381DC               ;$FF0959 |
    dl DATA8_F4E6A4               ;$FF095C |
    dl DATA8_F3087B               ;$FF095F |
    dl DATA8_F42993               ;$FF0962 |

; More compressed Graphics start at FF0965
; Seems to be a RoMK tileset, unsure which one it is
; I'm not totally sure how I will conventionally name all of these so they will be stupid for now
GFX_Tileset_RoMK1:
    incbin "Graphics/Tilesets/FF0965.bin"
GFX_Tileset_FF4989:
    incbin "Graphics/Tilesets/FF4989.bin"
GFX_Tileset_FF88DB:
    incbin "Graphics/Tilesets/FF88DB.bin"
GFX_Tileset_RoMK3:
    incbin "Graphics/Tilesets/FFC606.bin"

; Reactor level data
Level_ReactorBoss:
    incbin "Levels/Boss/Reactor (FFFF6E).bin"