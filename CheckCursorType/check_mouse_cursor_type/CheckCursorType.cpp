#include <windows.h> 
#include "CheckCursorType.h"


HCURSOR GetCurrentCursorHandle()
{
	POINT pt;
	HWND hWnd;
	DWORD dwThreadID, dwCurrentThreadID;
	HCURSOR hCursor = NULL;

	// Find out which window owns the cursor
	GetCursorPos(&pt);
	hWnd = WindowFromPoint(pt);

	// Get the thread ID for the cursor owner.
	dwThreadID = GetWindowThreadProcessId(hWnd, NULL);

	// Get the thread ID for the current thread
	dwCurrentThreadID = GetCurrentThreadId();

	// If the cursor owner is not us then we must attach to
	// the other thread in so that we can use GetCursor() to
	// return the correct hCursor
	if (dwCurrentThreadID != dwThreadID) {

		// Attach to the thread that owns the cursor
		if (AttachThreadInput(dwCurrentThreadID, dwThreadID, TRUE)) {

			// Get the handle to the cursor
			hCursor = GetCursor();

			// Detach from the thread that owns the cursor
			AttachThreadInput(dwCurrentThreadID, dwThreadID, FALSE);
		}
	}
	else
		hCursor = GetCursor();

	return hCursor;
}
LPCTSTR  typearray[]={IDC_APPSTARTING,IDC_ARROW,IDC_CROSS,IDC_HAND,IDC_HELP,IDC_IBEAM,IDC_ICON,
	IDC_NO,IDC_SIZE,IDC_SIZEALL,IDC_SIZENESW,IDC_SIZENS,IDC_SIZENWSE,IDC_SIZEWE,IDC_UPARROW,IDC_WAIT};
JNIEXPORT jboolean JNICALL Java_CheckCursorType_CheckCursorType(JNIEnv* env, jclass jcl, jint type) {
	return GetCurrentCursorHandle() == LoadCursor(HINSTANCE(), typearray[type]);
}
