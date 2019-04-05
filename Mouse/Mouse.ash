using System.ash
using Math
using Type
class Mouse
	static
		var before_xy = {"x"=>0,"y"=>0}#滑鼠上一個指定動作標
		var rate = 0.05#移動數率
		#滑鼠移動
		function mousem(x,y)
			var _x = before_xy["x"],_y = before_xy["y"]
			var len,px,py
			if Math.abs(x-_x) > Math.abs(y-_y)
				len = Type.toInteger(Math.abs(x-_x) * rate)
			else
				len = Type.toInteger(Math.abs(y-_y) * rate)
			endif
			if len == 0
				len = 1
				py = (y-_y)
				px = (x-_x)
			else
				py = (y-_y) / len
				px = (x-_x) / len
			endif
			for (var i=0,tx=_x,ty=_y;i<=len;i=i+1)
				#Stdio.println("Mouse\\Mouse_Event m "..Type.toInteger(tx).." "..Type.toInteger(ty))
				System.system("Mouse\\Mouse_Event m "..Type.toInteger(tx).." "..Type.toInteger(ty))
				tx = tx+px
				ty = ty+py
			endfo
			before_xy["x"] = x
			before_xy["y"] = y
		endfu
		#滑鼠按下
		function mousep(but)
			System.system("Mouse\\Mouse_Event p "..but)
		endfu
		#滑鼠放開
		function mouser(but)
			System.system("Mouse\\Mouse_Event r "..but)
		endfu 
	endst
endcl