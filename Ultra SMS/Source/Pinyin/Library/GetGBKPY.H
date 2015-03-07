#include <windows.h>

#ifndef __GETPYHEADER
#define __GETPYHEADER

#ifdef __cplusplus
extern "C" {
#endif

	DWORD WINAPI GetPY(DWORD dCharacter, LPCSTR lpBuffer, DWORD lLength);

#ifdef __cplusplus
}
#endif

#endif // __GETPYHEADER
