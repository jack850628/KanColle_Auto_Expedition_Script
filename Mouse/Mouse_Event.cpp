#include<windows.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
/**
* �ƹ�����{���A�ΨӰt�XAShell�g��ĥ�����æ۰ʻ����}�� 
**/
int main(int argc, char *argv[]){
	//printf("%d\n",type);
	if(argc==1){
		printf("�е����ѼơI\n");
		system("pause");
	}else{
		if(!strcmp(argv[1],"m"))
			SetCursorPos(atoi(argv[2]),atoi(argv[3]));//���ʷƹ��A�ҦpMouse_Event m 100 100 
		else if(!strcmp(argv[1],"p")){//���U�ƹ��A�ҦpMouse_Event p l 
			if(!strcmp(argv[2],"l"))//���� 
				mouse_event(MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
			else if(!strcmp(argv[2],"r"))//�k�� 
				mouse_event(MOUSEEVENTF_RIGHTDOWN, 0, 0, 0, 0);
		}else if(!strcmp(argv[1],"r")){//��}�ƹ��A�ҦpMouse_Event r l 
			if(!strcmp(argv[2],"l"))//���� 
				mouse_event(MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
			else if(!strcmp(argv[2],"r"))//�k�� 
				mouse_event(MOUSEEVENTF_RIGHTUP, 0, 0, 0, 0);
		}
	}
	return 0;
}

