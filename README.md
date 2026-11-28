# Kirby Super Star Disassembly
This is a work in progress disassembly of the US version of Kirby Super Star. The purpose of this disassembly is to gain a general understanding of how the game operates for research purposes, as well as to make it easier to make modifications to the game. There will also be focus on code readability and recreating many of the scripting utilities that HAL used while developing KSS.

# How to Assemble
Since this is currently a work in progress disassembly, you will need an original US Kirby Super Star ROM to fill in the blanks until the assembly is in a complete state.
1. Clone the repository (click the big green button at the top)
2. Compile [asar 2.0](https://github.com/RPGHacker/asar/tree/asar_2_beta) and place it in the project folder.
3. Place an original US ROM of Kirby Super Star in the folder and name it "Kirby Super Star (USA).sfc".
4. Run make_test_file.bat.
5. You should now have "out.sfc" which is the assembled file. The batch file will notify if the assembled ROM matches.

# Status
Banks 00, 01, and BE are "complete", though still need proper labelling in several areas. Bank 16 is complete, though can use more labelling for better readability. The rest of the banks have yet to be disassembled.

# Contribution
Anyone can contribute to this project. Most of this disassembly is being done through [DiztinGUIsh](https://github.com/DizTools/DiztinGUIsh) and Mesen's CDL, though any other disassembly tools are permitted.

There are no plans to use LLMs or generative AI to assist in the process of this disassembly in any form.