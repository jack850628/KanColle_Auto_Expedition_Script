using Stdio
using Thread
using Threading
using Math
using System
using String
using Type
call Mouse/Mouse
call CheckCursorType/CheckCursorType

class Math2:Math
	function rand(i)
		return super.rand(i-1)
	endfu
endcl

Math=Math2()
/*ĥ�����æ۰ʻ����}�� ����:8.2 ������2017/10/12 17:29*/
class KanColle_Script
	var su/**����y��**/
	var ktt2#�����ɶ����p��覡�G�����`����-((�����`����/60)*2)
	var Seas_Number/*����s���A�Ω󻷩��Y�N�^�䪺����*/
	var switch
	
	
	function _inst_()
		Stdio.println("--------------------------------------------")
		Stdio.println("            ĥ�����æ۰ʻ����}��")
		Stdio.println("1:���o")
		Stdio.println("2:������")
		Stdio.println("3:���T&�a��c(�p)")
		Stdio.println("--------------------------------------------")
		do
			Stdio.print("���:")
			switch=Type.toDigital(Stdio.scan())
			if switch==1
				su=/*�y��:*/{{222+xy[0],220+xy[1]},{222+xy[0],280+xy[1]},{222+xy[0],160+xy[1]}} ,ktt2=/*�ɶ�:*/{lose(1200)-40,lose(5400)-30,lose(14400)-30} ,Seas_Number=/*���o�� ����:*/{3,5,9}
			elseif switch==2
				su=/*�y��:*/{{222+xy[0],190+xy[1]},{222+xy[0],250+xy[1]},{222+xy[0],190+xy[1]}} ,ktt2=/*�ɶ�:*/{lose(1800)-50,lose(3000)-40,lose(5400)-30} ,Seas_Number=/*�������� ����:*/{2,4,10}
			elseif switch==3
				su=/*�y��:*/{{222+xy[0],220+xy[1]},{222+xy[0],310+xy[1]},{222+xy[0],220+xy[1]}} ,ktt2=/*�ɶ�:*/{lose(1200)-50,lose(2400)-45,lose(18000)-30} ,Seas_Number=/*���T&�a��c(�p)�� ����:*/{3,6,11}
			endif
		dwhile ![0<switch<=3]
		#�����C��W�U���Z��30�ӹ����I�A�Ĥ@��Y=160
	endfu
	
	var xy={1040,166}#flash�C���إ��W�������b�ù��W���y��
	
	
	var ph={165+xy[0],108+xy[1]}/**�s��**/,mk={60+xy[0],223+xy[1]}/**����**/,sug={360+xy[0],71+xy[1]}/**������**/,pg={47+xy[0],195+xy[1]}/**�ɵ�**/
	var fs={110+xy[0],112+xy[1]}/**���o�u**/,hg={153+xy[0],222+xy[1]}/**�X��**/
	var gt={{168+xy[0],112+xy[1]},{198+xy[0],112+xy[1]},{228+xy[0],112+xy[1]}}/**ĥ���ɵ��y��**/,ng={591+xy[0],147+xy[1]}/**����**/
	var gt2={{415+xy[0],104+xy[1]}/**�ĤG#**/,{445+xy[0],104+xy[1]}/**�ĤT**/}/**����ĥ��**/,gtb={631+xy[0],428+xy[1]}/**�M�w�s**/
	var hgb={534+xy[0],428+xy[1]}/**�����}�l�s**/,hsb={491+xy[0],292+xy[1]}/**�����s**/,fc={184+xy[0],427+xy[1]}/**�����s**/
	var _25s=2500,kancount=3#,delay=600/*�o�O�T�w������ɶ�*/
	var go=0,state="s"#�@�}�l�����i�]�w�e��
	var threading=Threading()#���������
	var �T�{�����O�_�i�H�������y��={"x"=>739+xy[0],"y"=>xy[1]+29}
	var �T�{����ĥ���O�_�w�g�^�Ӯy��={"x"=>xy[0]+195,"y"=>xy[1]+258}
	var �h����x�y��={{"x"=>xy[0]+380,"y"=>xy[1]+213},{"x"=>xy[0]+380,"y"=>xy[1]+223}}
	var �P�_�O�_����x�y��={{"x"=>xy[0]+184,"y"=>xy[1]+10},{"x"=>mk[0],"y"=>mk[1]+47/*�[�W47�קK����ɵ���*/}}
	
	
	function lose(s)
		return s-(s//60)
	endfu
	var ktt={{0,0,0},{0,0,0},{0,0,0}}#��,��,��
	#ktt[0]=ktt2[0],ktt[1]=ktt2[1],ktt[2]=ktt2[2]
	
	function checkCheckCursorType()#�T�{��в{�b�O�_���⪺�ϥ�
		do
			Thread.sleep(100)
		dwhile !CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
	endfu
	function checkKanIsBreak()#�T�{����ĥ���O�_�w�g�^��
		do
			Mouse.mousem(�T�{�����O�_�i�H�������y��["x"],�T�{�����O�_�i�H�������y��["y"])
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
				return 1
			endif
			Mouse.mousem(�T�{����ĥ���O�_�w�g�^�Ӯy��["x"],�T�{����ĥ���O�_�w�g�^�Ӯy��["y"])
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
				return 2
			endif
		dwhile true
	endfu
	function �h����x()
		do
			for var i=0;i<�h����x�y��.size();i=i+1
				Mouse.mousem(�h����x�y��[i]["x"],�h����x�y��[i]["y"])
				Thread.sleep(100)
				if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_ARROW)
					return
				endif
			endfo
		dwhile true
	endfu
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
		for var i=0;i<3;i=i+1
			ktt[i]=lose((((ktt[i][0]*60)+ktt[i][1])*60)+ktt[i][2])
		endfo
		threading.start(Read)
		while true
			if state
				Stdio.print(ktt[0]+" "+ktt[1]+" "+ktt[2]+
						"\ns:�]�w���")
			endif
			for var index=0;index<3;index=index+1
				if ktt[index]>0
					if ktt[index]==60
						CKR.set_content_and_start("�`�N","�X���b��"+Seas_Number[index]+
									"���쪺����ĥ���A��"+(index+2)+
									"ĥ���Y�N�^��I","\".\\Inazuma07.mp3\"")
					endif
					ktt[index]=(ktt[index]-1)
				endif
			endfo
			/*for var i=0;i<3&&!go&&state;i=i+1
				if ktt[i]==0&&(ktt[(i+1)%3]>60||ktt[(i+1)%3]<=0)&&(ktt[(i+2)%3]>60||ktt[(i+2)%3]<=0)
					#�����@��ĥ���������ɶ����s�F�B��L���ĥ�����ɶ����A1~60�������ϰ�A�o�˰��O���F����ĥ���w�g�^�Ӧ��ɶ��٨S�k�s�����p
					threading.start(to_Home)
					go=1
				endif
			endfo*/
			#�����@��ĥ���������ɶ����s�F�B��L���ĥ�����ɶ����A1~60�������ϰ�A�o�˰��O���F����ĥ���w�g�^�Ӧ��ɶ��٨S�k�s�����p
			if !go&&state&&(ktt[0]>60||ktt[0]<1)&&(ktt[1]>60||ktt[1]<1)&&(ktt[2]>60||ktt[2]<1)
				if ktt[0]==0||ktt[1]==0||ktt[2]==0
					threading.start(to_Home)
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
			threading.start(Supply)
			return
		endif
		Mouse.mousem(mk[0]+Math.rand(27),mk[1]+Math.rand(70))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		�h����x()
		if !state
			recovery()
			return
		endif
		threading.start(Supply)
	endfu
	function KanBreak()
		for var i=0;i<3;i=i+1
			Mouse.mousem(sug[0]+Math.rand(437),sug[1]+Math.rand(354))
			if i!=0
				checkCheckCursorType()
			endif
			click()
			Thread.sleep(i==0?10000:500)
		endfo
	endfu
	function Supply()#���^ĥ���øɵ�
		for var i=0;i<kancount;i=i+1
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
			threading.start(Supply)
			return
		endif

		for var i=0;i<kancount;i=i+1
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
		�h����x()
		if !state
			recovery()
			return
		endif
		if ktt[0]==0||ktt[1]==0||ktt[2]==0
			threading.start(Supply)
		else
			threading.start(Expedition)
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
			threading.start(Expedition)
			return
		endif
		Mouse.mousem(ng[0]+Math.rand(108),ng[1]+Math.rand(193))
		checkCheckCursorType()
		click()
		Thread.sleep((s+1000))
		for var i=0;i<kancount;i=i+1
			if ktt[i]==-1
					if i==2
						Mouse.mousem(fc[0]+Math.rand(38),fc[1]+Math.rand(26))
						checkCheckCursorType()
						click()
					endif
					Mouse.mousem(su[i][0]+Math.rand(214),su[i][1]+Math.rand(28))
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
					Mouse.mousem(hsb[0],hsb[1])
					checkCheckCursorType()
					click()
					Thread.sleep(500)
			endif
		endfo
		Mouse.mousem(mk[0]+Math.rand(30),mk[1]+Math.rand(72))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		�h����x()
		if ktt[0]==0||ktt[1]==0||ktt[2]==0
			threading.start(Supply)
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
		for var i=0;i<kancount;i=i+1
			if ktt[i]==-1
				ktt[i]=0
			endif
		endfo
		go=0
	endfu
	
	function Read()#Ū���ϥΪ̿�J�����A
		function St()
			function PS()
				Stdio.printf("�Ҧ�:{0}�Aĥ�����ƧַӡG{1} {2} {3}\n",{switch,ktt[0],ktt[1],ktt[2]})
				Stdio.println("--------���A�]�w--------")
				Stdio.println("1.�]�w����")
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
					Stdio.println("���Ƴ]�w�y�k:<ĥ���s��(2~4)> <��> <��> <��>")
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