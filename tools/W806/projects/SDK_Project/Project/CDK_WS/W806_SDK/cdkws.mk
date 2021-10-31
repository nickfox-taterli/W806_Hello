.PHONY: clean All Project_Title Project_Build Project_PostBuild

All: Project_Title Project_Build Project_PostBuild

Project_Title:
	@echo "----------Building project:[ W806_SDK - BuildSet ]----------"

Project_Build:
	@make -r -f W806_SDK.mk -j 8 -C  ./ 

Project_PostBuild:
	@echo Executing Post Build commands ...
	@export CDKPath="E:/C-Sky/CDK" CDK_VERSION="V2.8.7" ProjectPath="E:/W806/SDK/tools/W806/projects/SDK_Project/Project/CDK_WS/W806_SDK/" && ../../../../../../../tools/W806/utilities/build_fls.sh
	@echo Done


clean:
	@echo "----------Cleaning project:[ W806_SDK - BuildSet ]----------"

