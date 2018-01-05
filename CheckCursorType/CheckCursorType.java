import java.io.File;
import java.io.IOException;
import AShell.Data_Type_And_Struct.AShell_this;
import AShell.ValueProcess.AShellType;

public class CheckCursorType{
	static{
		try{
			System.load(new File(CheckCursorType.class.getProtectionDomain().getCodeSource().getLocation().getPath()).getCanonicalPath()+"\\check_mouse_cursor_type.dll");
		}catch(IOException e){}
	}
	public static native boolean CheckCursorType(int type);
	public static AShellType getCheckCursorType(AShell_this AShthis,AShellType[] Args)throws Exception{
		return new AShellType(CheckCursorType((int)Args[0].to_java_long())); 
	}
}