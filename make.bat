@ECHO OFF

SET "out_folder=%~dp0\output"
SET "clean_rom=rom\Zelda II - The Adventure of Link (USA).nes"
SET "patched_rom=%out_folder%\Zelda2_Redux.nes"
SET "asm_file=code\main.asm"

IF NOT EXIST "%out_folder%" MKDIR "%out_folder%"
IF EXIST "%patched_rom%" DEL "%patched_rom%"

COPY "%clean_rom%" "%patched_rom%"

bin\xkas.exe -o "%patched_rom%" "%asm_file%"
bin\flips.exe --create --ips "%clean_rom%" "%patched_rom%" "%out_folder%\Zelda2_Redux.ips"

PAUSE
