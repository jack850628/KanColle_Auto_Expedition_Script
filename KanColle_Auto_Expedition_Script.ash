using Stdio
using Thread
using Threading
using Math
using System
using String
using Type
call Mouse/Mouse
call CheckCursorType/CheckCursorType
call config

System.system("echo �M�� > C:\\AShell\\debug.txt")#������

class Math2:Math
	function rand(i) = super.rand(i-1)
endcl

Math=Math2()
/*ĥ�����æ۰ʻ����}�� ����:8.3.1 ������2018/10/2 01:26*/
class KanColle_Script
	var su/**����y��**/
	var ktt2#�����ɶ����p��覡�G�����`���-((�����`���/60)*2)
	var Seas_Number/*����s���A�Ω󻷩��Y�N�^�䪺����*/
	var pages
	var switch
	
	
	function _inst_()
		Stdio.println("--------------------------------------------")
		Stdio.println("            ĥ�����æ۰ʻ����}��")
		for (var i=0;i<Config.title.size();i=i+1)
			Stdio.println(Config.title[i])
		endif
		Stdio.println("--------------------------------------------")
		do  
			Stdio.print("���:")
			switch=Stdio.inputNumber()
		dwhile ![0<switch<=Config.title.size()]
		
		su=/*�y��:*/{{Config.sea[switch-1][0][0]+Config.xy[0],Config.sea[switch-1][0][1]+Config.xy[1]},{Config.sea[switch-1][1][0]+Config.xy[0],Config.sea[switch-1][1][1]+Config.xy[1]},{Config.sea[switch-1][2][0]+Config.xy[0],Config.sea[switch-1][2][1]+Config.xy[1]}}
		ktt2=/*�ɶ�:*/{lose(Config.attackTime[switch-1][0])-40,lose(Config.attackTime[switch-1][1])-30,lose(Config.attackTime[switch-1][2])-30}
		Seas_Number=/*����:*/Config.seasNumber[switch-1]
		pages=Config.pages[switch-1]
		
		switch = Config.title[switch-1]
		#�����C��W�U���Z��30�ӹ����I�A�Ĥ@��Y=160
	endfu
	
	
	
	var ph={165+Config.xy[0],108+Config.xy[1]}/**�s��**/,mk={60+Config.xy[0],223+Config.xy[1]}/**����**/,sug={360+Config.xy[0],71+Config.xy[1]}/**������**/,pg={47+Config.xy[0],195+Config.xy[1]}/**�ɵ�**/
	var fs={110+Config.xy[0],112+Config.xy[1]}/**���o�u**/,hg={153+Config.xy[0],222+Config.xy[1]}/**�X��**/
	var gt={{168+Config.xy[0],112+Config.xy[1]},{198+Config.xy[0],112+Config.xy[1]},{228+Config.xy[0],112+Config.xy[1]}}/**ĥ���ɵ��y��**/,ng={591+Config.xy[0],147+Config.xy[1]}/**����**/
	var gt2={{415+Config.xy[0],106+Config.xy[1]}/**�ĤG#**/,{445+Config.xy[0],106+Config.xy[1]}/**�ĤT**/}/**����ĥ��**/,gtb={631+Config.xy[0],428+Config.xy[1]}/**�M�w�s**/
	var hgb={534+Config.xy[0],428+Config.xy[1]}/**�����}�l�s**//**,hsb={491+Config.xy[0],292+Config.xy[1]}�����s**/
	var fc={
			{112+Config.xy[0],431+Config.xy[1]},
			{154+Config.xy[0],431+Config.xy[1]},
			{195+Config.xy[0],431+Config.xy[1]},
			{236+Config.xy[0],431+Config.xy[1]},
			{278+Config.xy[0],431+Config.xy[1]},
			{319+Config.xy[0],431+Config.xy[1]},
			{360+Config.xy[0],431+Config.xy[1]}
		}/**�����s**/
	var _25s=2500,kancount=3#,delay=600/*�o�O�T�w������ɶ�*/
	var go=0,state="s"#�@�}�l�����i�]�w�e��
	var readKeyboardthreading=Threading(),threading=Threading()#���������
	var �T�{�����O�_�i�H�������y��={"x"=>739+Config.xy[0],"y"=>Config.xy[1]+29}
	var �T�{����ĥ���O�_�w�g�^�Ӯy��={"x"=>Config.xy[0]+195,"y"=>Config.xy[1]+258}
	var �h����x�y��={{"x"=>Config.xy[0]+380,"y"=>Config.xy[1]+213},{"x"=>Config.xy[0]+380,"y"=>Config.xy[1]+223}}
	var �P�_�O�_����x�y��={{"x"=>Config.xy[0]+184,"y"=>Config.xy[1]+10},{"x"=>mk[0],"y"=>mk[1]+47/*�[�W47�קK����ɵ���*/}}
	
	
	function lose(s) = s-(s//60)
	var ktt={{0,0,0},{0,0,0},{0,0,0}}#��,��,��
	#ktt[0]=ktt2[0],ktt[1]=ktt2[1],ktt[2]=ktt2[2]
	
	function checkCheckCursorType()#�T�{��в{�b�O�_���⪺�ϥ�
		do
			Thread.sleep(100)
		dwhile !CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
	endfu
	function checkKanIsBreak()#�T�{����ĥ���O�_�w�g�^��
		Mouse.mousem(�T�{����ĥ���O�_�w�g�^�Ӯy��["x"],�T�{����ĥ���O�_�w�g�^�Ӯy��["y"])
		do
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
				break
			endif
		dwhile true
		Mouse.mousem(�T�{�����O�_�i�H�������y��["x"],�T�{�����O�_�i�H�������y��["y"])
		Thread.sleep(100)
		return CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND) ? 1 : 2
	endfu
	/*function �h����x()
		do
			for (var i=0;i<�h����x�y��.size();i=i+1)
				Mouse.mousem(�h����x�y��[i]["x"],�h����x�y��[i]["y"])
				Thread.sleep(100)
				if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_ARROW)
					return
				endif
			endfo
		dwhile true
	endfu*/
	function �P�_�O�_����x()
		Mouse.mousem(�P�_�O�_����x�y��[0]["x"],�P�_�O�_����x�y��[0]["y"])
		Thread.sleep(100)
		if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_ARROW)
			return false
		endif
		do
			Mouse.mousem(�P�_�O�_����x�y��[1]["x"]+Math.rand(27)
						,�P�_�O�_����x�y��[1]["y"]+Math.rand(23))
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
				click()
			endif
			Thread.sleep(3000)
			Mouse.mousem(�P�_�O�_����x�y��[0]["x"],�P�_�O�_����x�y��[0]["y"])
			Thread.sleep(500)
			Mouse.mousem(�P�_�O�_����x�y��[0]["x"]+5,�P�_�O�_����x�y��[0]["y"])
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_ARROW)
				return true
			endif
		dwhile true
	endfu
	
	class Call_KanColle_Remind:Threading#�q���e���O
		var title,context,Audio
		function set_content_and_start(title,context,Audio)#�o�X�q��
			this.title=title
			this.context=context
			this.Audio=Audio
			start(run)
		endfu
		function run()
			System.system("KanColle_Remind.exe "+title+" "+context+" "+Audio)
		endfu
	endcl
	var CKR=Call_KanColle_Remind()#�q��
	
	function main()
		for (var i=0;i<3;i=i+1)
			ktt[i]=lose((((ktt[i][0]*60)+ktt[i][1])*60)+ktt[i][2])
		endfo
		readKeyboardthreading.start(Read)
		while true
			if state
				Stdio.print(ktt[0]+" "+ktt[1]+" "+ktt[2]+
						"\ns:�]�w���")
			endif
			for (var index=0;index<3;index=index+1)
				if ktt[index]>0
					if ktt[index]==60
						CKR.set_content_and_start("�`�N","�X���b��"+Seas_Number[index]+
									"���쪺����ĥ���A��"+(index+2)+
									"ĥ���Y�N�^��I","\".\\Inazuma07.mp3\"")
					endif
					ktt[index]=(ktt[index]-1)
				endif
			endfo
			/*for (var i=0;i<3&&!go&&state;i=i+1)
				if ktt[i]==0&&(ktt[(i+1)%3]>60||ktt[(i+1)%3]<=0)&&(ktt[(i+2)%3]>60||ktt[(i+2)%3]<=0)
					#���@��ĥ���������ɶ����s�F�B��L���ĥ�����ɶ����A1~60�������ϰ�A�o�˰��O���F����ĥ���w�g�^�Ӧ��ɶ��٨S�k�s�����p
					threading.start(to_Home)
					go=1
				endif
			endfo*/
			#���@��ĥ���������ɶ����s�F�B��L���ĥ�����ɶ����A1~60�������ϰ�A�o�˰��O���F����ĥ���w�g�^�Ӧ��ɶ��٨S�k�s�����p
			if !go&&state&&(ktt[0]>60||ktt[0]<1)&&(ktt[1]>60||ktt[1]<1)&&(ktt[2]>60||ktt[2]<1)
				if ktt[0]==0||ktt[1]==0||ktt[2]==0
					threading=Threading().start(to_Home)
					go=1
				endif
			endif
			Thread.sleep(1000)
			if state
				Stdio.clear()
			endif
			#Stdio.println()
		endwh
	endfu
	
	function to_Home()#�^����
		Mouse.mousem(ph[0]+Math.rand(64),ph[1]+Math.rand(58))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		if �P�_�O�_����x()
			threading=Threading().start(Supply)
			return
		endif
		Mouse.mousem(mk[0]+Math.rand(27),mk[1]+Math.rand(70))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		#�h����x()
		if !state
			recovery()
			return
		endif
		threading=Threading().start(Supply)
	endfu
	function KanBreak()
		for (var i=0;i<3;i=i+1)
			Mouse.mousem(sug[0]+Math.rand(437),sug[1]+Math.rand(354))
			if i!=0
				checkCheckCursorType()
			endif
			click()
			Thread.sleep(i==0?10000:500)
		endfo
	endfu
	function Supply()#���^ĥ���øɵ�
		for (var i=0;i<kancount;i=i+1)
			if ktt[i]==0
				ktt[i]=-1
				if checkKanIsBreak()==1#�p�G��������
					KanBreak()
				endif
			endif
		endfo
		#Thread.sleep(500)
		while checkKanIsBreak()==1
			KanBreak()
		endwh
		if !state
			recovery()
			return
		endif
		var s=1200
		Mouse.mousem(pg[0]+Math.rand(63),pg[1]+Math.rand(54))
		checkCheckCursorType()
		click()
		Thread.sleep(s)
		
		if �P�_�O�_����x()
			threading=Threading().start(Supply)
			return
		endif

		for (var i=0;i<kancount;i=i+1)
			if ktt[i]==-1
				Mouse.mousem(gt[i][0]+Math.rand(16),gt[i][1]+Math.rand(16))
				checkCheckCursorType()
				click()
				Thread.sleep(s)
				Mouse.mousem(fs[0]+Math.rand(15),fs[1]+Math.rand(15))
				click()
				Thread.sleep(s)
			endif
		endfo
		Mouse.mousem(mk[0]+Math.rand(30),mk[1]+Math.rand(72))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		#�h����x()
		if !state
			recovery()
			return
		endif
		if ktt[0]==0||ktt[1]==0||ktt[2]==0
			threading=Threading().start(Supply)
		else
			threading=Threading().start(Expedition)
		endif
	endfu
	
	function Expedition()#�e�X����
		var s=1000
		while checkKanIsBreak()==1#�p�G�������^�Ӫ�����
			KanBreak()
		endwh
		Mouse.mousem(hg[0]+Math.rand(88),hg[1]+Math.rand(80))
		checkCheckCursorType()
		click()
		Thread.sleep((s+100))
		if �P�_�O�_����x()
			threading=Threading().start(Expedition)
			return
		endif
		Mouse.mousem(ng[0]+Math.rand(108),ng[1]+Math.rand(193))
		checkCheckCursorType()
		click()
		Thread.sleep((s+1000))
		var nowPage=1
		for (var i=0;i<kancount;i=i+1)
			if ktt[i]==-1
					if pages[i]!=nowPage
						Mouse.mousem(fc[pages[i]-1][0]+Math.rand(35),fc[pages[i]-1][1]+Math.rand(19))
						checkCheckCursorType()
						click()
						nowPage=pages[i]
					endif
					Mouse.mousem(su[i][0]+Math.rand(231),su[i][1]+Math.rand(26))
					checkCheckCursorType()
					click()
					Thread.sleep(400)
					Mouse.mousem(gtb[0]+Math.rand(91),gtb[1]+Math.rand(30))
					checkCheckCursorType()
					click()
					Thread.sleep(s)
					if i>0
						Mouse.mousem(gt2[(i-1)][0]+Math.rand(16),gt2[(i-1)][1]+Math.rand(16))
						checkCheckCursorType()
						click()
						Thread.sleep(400)
					endif
					Mouse.mousem(hgb[0]+Math.rand(160),hgb[1]+Math.rand(35))
					checkCheckCursorType()
					click()
					ktt[i]=ktt2[i]
					/*if i!=0
						ktt[i]=ktt2[i]
					else
						ktt[i]=ktt2[i]+(delay+Math.rand(600)�o�̬O�B�ʦ�����ɶ�)
					endif*/
					Thread.sleep(5000)
					/*Mouse.mousem(hsb[0],hsb[1])
					checkCheckCursorType()
					click()
					Thread.sleep(500)*/
			endif
		endfo
		Mouse.mousem(mk[0]+Math.rand(30),mk[1]+Math.rand(72))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		#�h����x()
		if ktt[0]==0||ktt[1]==0||ktt[2]==0
			threading=Threading().start(Supply)
		else
			while checkKanIsBreak()==1#�p�G�������^�Ӫ�����
				KanBreak()
			endwh
			go=0
		endif 
	endfu
	
	function click()#�ƹ������I���@�U
		Mouse.mousep("l")
		Mouse.mouser("l")
	endfu

	function recovery()#ĥ���e�X�᪺���A�٭�
		for (var i=0;i<kancount;i=i+1)
			if ktt[i]==-1
				ktt[i]=0
			endif
		endfo
		go=0
	endfu
	
	function Read()#Ū���ϥΪ̿�J�����A
		function St()
			function PS()
				Stdio.printf("�Ҧ�:{0}�Aĥ����ƧַӡG{1} {2} {3}\n",{switch,ktt[0],ktt[1],ktt[2]})
				Stdio.println("--------���A�]�w--------")
				Stdio.println("1.�]�wĥ���X���Ѿl���")
				Stdio.println("e.�����}��")
				Stdio.println("q.���}�]�w")
				Stdio.println("------------------------")
			endfu
			Stdio.clear()
			PS()
			var inp
			while true
				Stdio.print(">>")
				inp=Stdio.scan()
				if inp=="1"
					Stdio.println("��Ƴ]�w�y�k:<ĥ���s��(2~4)> <��> <��> <��>\n�t�~�A�Y�n����ĥ���A�u�ݭn���ĥ���Ѿl��Ƴ]�w��-2�Y�i")
					try
						Stdio.print("?>>")
						var inparr=String.split(Stdio.scan()," "),temp=Type.toDigital(inparr[0])
						if temp>4||temp<2
							throw "ĥ���s�����~�C"
						elseif inparr.size()<4
							throw "�y�k���~�C"
						endif
						ktt[Type.toDigital(inparr[0])-2]=lose((((Type.toDigital(inparr[1])*60)+Type.toDigital(inparr[2]))*60)+Type.toDigital(inparr[3]))
						Stdio.clear()
						PS()
					catch e
						Stdio.println("�]�w���ѡI"..e)
					endtr
				elseif inp=="e"
					System.finish()
				elseif inp=="q"
					return
				endif
			endwh
		endfu
		while true
			if state=="s"
				state=0
				St()
				state=1
			endif
			state=Stdio.getch()
		endwh
	endfu
endcl
KanColle_Script().main()