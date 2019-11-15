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

System.system("echo 清空 > C:\\AShell\\debug.txt")#除錯用

class Math2:Math
	function rand(i) = super.rand(i-1)
endcl

Math=Math2()
/*艦隊收藏自動遠征腳本 版本:8.3.1 完成於2018/10/2 01:26*/
class KanColle_Script
	var su/**海域座標**/
	var ktt2#遠征時間的計算方式：遠征總秒數-((遠征總秒數/60)*2)
	var Seas_Number/*海域編號，用於遠征即將回港的提醒*/
	var pages
	var switch
	
	
	function _inst_()
		Stdio.println("--------------------------------------------")
		Stdio.println("            艦隊收藏自動遠征腳本")
		for (var i=0;i<Config.title.size();i=i+1)
			Stdio.println(Config.title[i])
		endif
		Stdio.println("--------------------------------------------")
		do  
			Stdio.print("選擇:")
			switch=Stdio.inputNumber()
		dwhile ![0<switch<=Config.title.size()]
		
		su=/*座標:*/{{Config.sea[switch-1][0][0]+Config.xy[0],Config.sea[switch-1][0][1]+Config.xy[1]},{Config.sea[switch-1][1][0]+Config.xy[0],Config.sea[switch-1][1][1]+Config.xy[1]},{Config.sea[switch-1][2][0]+Config.xy[0],Config.sea[switch-1][2][1]+Config.xy[1]}}
		ktt2=/*時間:*/{lose(Config.attackTime[switch-1][0])-40,lose(Config.attackTime[switch-1][1])-30,lose(Config.attackTime[switch-1][2])-30}
		Seas_Number=/*海域:*/Config.seasNumber[switch-1]
		pages=Config.pages[switch-1]
		
		switch = Config.title[switch-1]
		#遠征每格上下間距具30個像素點，第一格Y=160
	endfu
	
	
	
	var ph={165+Config.xy[0],108+Config.xy[1]}/**編成**/,mk={60+Config.xy[0],223+Config.xy[1]}/**母港**/,sug={360+Config.xy[0],71+Config.xy[1]}/**收遠征**/,pg={47+Config.xy[0],195+Config.xy[1]}/**補給**/
	var fs={110+Config.xy[0],112+Config.xy[1]}/**給油彈**/,hg={153+Config.xy[0],222+Config.xy[1]}/**出擊**/
	var gt={{168+Config.xy[0],112+Config.xy[1]},{198+Config.xy[0],112+Config.xy[1]},{228+Config.xy[0],112+Config.xy[1]}}/**艦隊補給座標**/,ng={591+Config.xy[0],147+Config.xy[1]}/**遠征**/
	var gt2={{415+Config.xy[0],106+Config.xy[1]}/**第二#**/,{445+Config.xy[0],106+Config.xy[1]}/**第三**/}/**遠征艦隊**/,gtb={631+Config.xy[0],428+Config.xy[1]}/**決定鈕**/
	var hgb={534+Config.xy[0],428+Config.xy[1]}/**遠征開始鈕**//**,hsb={491+Config.xy[0],292+Config.xy[1]}取消鈕**/
	var fc={
			{112+Config.xy[0],431+Config.xy[1]},
			{154+Config.xy[0],431+Config.xy[1]},
			{195+Config.xy[0],431+Config.xy[1]},
			{236+Config.xy[0],431+Config.xy[1]},
			{278+Config.xy[0],431+Config.xy[1]},
			{319+Config.xy[0],431+Config.xy[1]},
			{360+Config.xy[0],431+Config.xy[1]}
		}/**換頁鈕**/
	var _25s=2500,kancount=3#,delay=600/*這是固定的延遲時間*/
	var go=0,state="s"#一開始直接進設定畫面
	var readKeyboardthreading=Threading(),threading=Threading()#平行執行續
	var 確認遠征是否可以收遠征座標={"x"=>739+Config.xy[0],"y"=>Config.xy[1]+29}
	var 確認遠征艦隊是否已經回來座標={"x"=>Config.xy[0]+195,"y"=>Config.xy[1]+258}
	var 去除手掌座標={{"x"=>Config.xy[0]+380,"y"=>Config.xy[1]+213},{"x"=>Config.xy[0]+380,"y"=>Config.xy[1]+223}}
	var 判斷是否為手掌座標={{"x"=>Config.xy[0]+184,"y"=>Config.xy[1]+10},{"x"=>mk[0],"y"=>mk[1]+47/*加上47避免按到補給紐*/}}
	
	
	function lose(s) = s-(s//60)
	var ktt={{0,0,0},{0,0,0},{0,0,0}}#時,分,秒
	#ktt[0]=ktt2[0],ktt[1]=ktt2[1],ktt[2]=ktt2[2]
	
	function checkCheckCursorType()#確認游標現在是否為手的圖示
		do
			Thread.sleep(100)
		dwhile !CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
	endfu
	function checkKanIsBreak()#確認遠征艦隊是否已經回來
		Mouse.mousem(確認遠征艦隊是否已經回來座標["x"],確認遠征艦隊是否已經回來座標["y"])
		do
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
				break
			endif
		dwhile true
		Mouse.mousem(確認遠征是否可以收遠征座標["x"],確認遠征是否可以收遠征座標["y"])
		Thread.sleep(100)
		return CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND) ? 1 : 2
	endfu
	/*function 去除手掌()
		do
			for (var i=0;i<去除手掌座標.size();i=i+1)
				Mouse.mousem(去除手掌座標[i]["x"],去除手掌座標[i]["y"])
				Thread.sleep(100)
				if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_ARROW)
					return
				endif
			endfo
		dwhile true
	endfu*/
	function 判斷是否為手掌()
		Mouse.mousem(判斷是否為手掌座標[0]["x"],判斷是否為手掌座標[0]["y"])
		Thread.sleep(100)
		if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_ARROW)
			return false
		endif
		do
			Mouse.mousem(判斷是否為手掌座標[1]["x"]+Math.rand(27)
						,判斷是否為手掌座標[1]["y"]+Math.rand(23))
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_HAND)
				click()
			endif
			Thread.sleep(3000)
			Mouse.mousem(判斷是否為手掌座標[0]["x"],判斷是否為手掌座標[0]["y"])
			Thread.sleep(500)
			Mouse.mousem(判斷是否為手掌座標[0]["x"]+5,判斷是否為手掌座標[0]["y"])
			Thread.sleep(100)
			if CheckCursorType.getCheckCursorType(CheckCursorType.IDC_ARROW)
				return true
			endif
		dwhile true
	endfu
	
	class Call_KanColle_Remind:Threading#通知送類別
		var title,context,Audio
		function set_content_and_start(title,context,Audio)#發出通知
			this.title=title
			this.context=context
			this.Audio=Audio
			start(run)
		endfu
		function run()
			System.system("KanColle_Remind.exe "+title+" "+context+" "+Audio)
		endfu
	endcl
	var CKR=Call_KanColle_Remind()#通知
	
	function main()
		for (var i=0;i<3;i=i+1)
			ktt[i]=lose((((ktt[i][0]*60)+ktt[i][1])*60)+ktt[i][2])
		endfo
		readKeyboardthreading.start(Read)
		while true
			if state
				Stdio.print(ktt[0]+" "+ktt[1]+" "+ktt[2]+
						"\ns:設定選單")
			endif
			for (var index=0;index<3;index=index+1)
				if ktt[index]>0
					if ktt[index]==60
						CKR.set_content_and_start("注意","出擊在第"+Seas_Number[index]+
									"海域的遠征艦隊，第"+(index+2)+
									"艦隊即將回港！","\".\\Inazuma07.mp3\"")
					endif
					ktt[index]=(ktt[index]-1)
				endif
			endfo
			/*for (var i=0;i<3&&!go&&state;i=i+1)
				if ktt[i]==0&&(ktt[(i+1)%3]>60||ktt[(i+1)%3]<=0)&&(ktt[(i+2)%3]>60||ktt[(i+2)%3]<=0)
					#當有一個艦隊的遠征時間為零了且其他兩個艦隊的時間不再1~60之間的區域，這樣做是為了防止艦隊已經回來但時間還沒歸零的情況
					threading.start(to_Home)
					go=1
				endif
			endfo*/
			#當有一個艦隊的遠征時間為零了且其他兩個艦隊的時間不再1~60之間的區域，這樣做是為了防止艦隊已經回來但時間還沒歸零的情況
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
	
	function to_Home()#回首頁
		Mouse.mousem(ph[0]+Math.rand(64),ph[1]+Math.rand(58))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		if 判斷是否為手掌()
			threading=Threading().start(Supply)
			return
		endif
		Mouse.mousem(mk[0]+Math.rand(27),mk[1]+Math.rand(70))
		checkCheckCursorType()
		click()
		Thread.sleep(_25s)
		#去除手掌()
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
	function Supply()#接回艦隊並補給
		for (var i=0;i<kancount;i=i+1)
			if ktt[i]==0
				ktt[i]=-1
				if checkKanIsBreak()==1#如果有遠征收
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
		
		if 判斷是否為手掌()
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
		#去除手掌()
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
	
	function Expedition()#送出遠征
		var s=1000
		while checkKanIsBreak()==1#如果有提早回來的遠征
			KanBreak()
		endwh
		Mouse.mousem(hg[0]+Math.rand(88),hg[1]+Math.rand(80))
		checkCheckCursorType()
		click()
		Thread.sleep((s+100))
		if 判斷是否為手掌()
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
						ktt[i]=ktt2[i]+(delay+Math.rand(600)這裡是浮動式延遲時間)
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
		#去除手掌()
		if ktt[0]==0||ktt[1]==0||ktt[2]==0
			threading=Threading().start(Supply)
		else
			while checkKanIsBreak()==1#如果有提早回來的遠征
				KanBreak()
			endwh
			go=0
		endif 
	endfu
	
	function click()#滑鼠左鍵點擊一下
		Mouse.mousep("l")
		Mouse.mouser("l")
	endfu

	function recovery()#艦隊送出後的狀態還原
		for (var i=0;i<kancount;i=i+1)
			if ktt[i]==-1
				ktt[i]=0
			endif
		endfo
		go=0
	endfu
	
	function Read()#讀取使用者輸入的狀態
		function St()
			function PS()
				Stdio.printf("模式:{0}，艦隊秒數快照：{1} {2} {3}\n",{switch,ktt[0],ktt[1],ktt[2]})
				Stdio.println("--------狀態設定--------")
				Stdio.println("1.設定艦隊出擊剩餘秒數")
				Stdio.println("e.結束腳本")
				Stdio.println("q.離開設定")
				Stdio.println("------------------------")
			endfu
			Stdio.clear()
			PS()
			var inp
			while true
				Stdio.print(">>")
				inp=Stdio.scan()
				if inp=="1"
					Stdio.println("秒數設定語法:<艦隊編號(2~4)> <時> <分> <秒>\n另外，若要停用艦隊，只需要把該艦隊剩餘秒數設定成-2即可")
					try
						Stdio.print("?>>")
						var inparr=String.split(Stdio.scan()," "),temp=Type.toDigital(inparr[0])
						if temp>4||temp<2
							throw "艦隊編號錯誤。"
						elseif inparr.size()<4
							throw "語法錯誤。"
						endif
						ktt[Type.toDigital(inparr[0])-2]=lose((((Type.toDigital(inparr[1])*60)+Type.toDigital(inparr[2]))*60)+Type.toDigital(inparr[3]))
						Stdio.clear()
						PS()
					catch e
						Stdio.println("設定失敗！"..e)
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