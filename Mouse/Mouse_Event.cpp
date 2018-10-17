#include<windows.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
/**
* 滑鼠控制程式，用來配合AShell寫的艦隊收藏自動遠征腳本 
**/
int main(int argc, char *argv[]){
	//printf("%d\n",type);
	if(argc==1){
		printf("請給予參數！\n");
		system("pause");
	}else{
		if(!strcmp(argv[1],"m"))
			SetCursorPos(atoi(argv[2]),atoi(argv[3]));//移動滑鼠，例如Mouse_Event m 100 100 
		else if(!strcmp(argv[1],"p")){//按下滑鼠，例如Mouse_Event p l 
			if(!strcmp(argv[2],"l"))//左鍵 
				mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
			else if(!strcmp(argv[2],"r"))//右鍵 
				mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
		}else if(!strcmp(argv[1],"r")){//放開滑鼠，例如Mouse_Event r l 
			if(!strcmp(argv[2],"l"))//左鍵 
				mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
			else if(!strcmp(argv[2],"r"))//右鍵 
				mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
		}
	}
	return 0;
}

