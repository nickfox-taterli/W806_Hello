#!/bin/sh

# 脚本目的 : 生成fls文件!

cp ./Obj/W806.elf ./W806.elf
csky-elfabiv2-objcopy -O binary ./W806.elf ./W806.bin
../../../../../../../tools/W806/wm_tool.exe -b ./W806.bin -o ./W806 -it 1 -fc 0 -ra 8010400 -ih 8010000 -ua 8010000 -nh 0  -un 0
mkdir -p ../../../../../../../bin/W806
mv ./W806.img ../../../../../../../bin/W806/W806.img
../../../../../../../tools/W806/wm_tool.exe -b ../../../../../../../tools/W806/W806_secboot.bin -o ../../../../../../../tools/W806/W806_secboot -it 0 -fc 0 -ra 8002400 -ih 8002000 -ua 8010000 -nh 8010000  -un 0  
cat ../../../../../../../tools/W806/W806_secboot.img ../../../../../../../bin/W806/W806.img > ../../../../../../../bin/W806/W806.fls