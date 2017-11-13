import AShell.Data_Type_And_Struct.AShell_this;
import AShell.ValueProcess.AShellType;

public class CheckCursorType{
	static{
		System.load("C:\\Users\\jack8\\Desktop\\Ä¥¶¤¸}¥»\\CheckCursorType\\check_mouse_cursor_type.dll");
	}
	public static native boolean CheckCursorType(int type);
	public static AShellType getCheckCursorType(AShell_this AShthis,AShellType[] Args)throws Exception{
		return new AShellType(CheckCursorType((int)Args[0].to_java_long())); 
	}
}