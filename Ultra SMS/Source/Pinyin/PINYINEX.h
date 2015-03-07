#include <windows.h>

#ifndef __PYEXDLLEXPORTS
#define __PYEXDLLEXPORTS

#ifdef __cplusplus
extern "C" {
#endif
	
	DWORD WINAPI PYEX_GetCharacterPinyinA(LPCSTR lpInput, LPSTR lpBuffer, UINT lLength);
	DWORD WINAPI PYEX_IsSimpleSpellingMatchA(LPCSTR lpString, LPCSTR lpSimpleSpelling);
	DWORD WINAPI PYEX_IsSimpleSpellingMatchCaseInsensitiveA(LPCSTR lpString, LPCSTR lpSimpleSpelling);

#ifdef __cplusplus
}
#endif

#endif // __PYEXDLLEXPORTS
