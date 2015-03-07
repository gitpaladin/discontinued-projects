// PINYINEX.cpp : Defines the entry point for the DLL application.
//

#include "PINYINEX.h"
#include "PYExt.h"
#include <windows.h>

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    switch (ul_reason_for_call)
	{
		case DLL_PROCESS_ATTACH:
		case DLL_THREAD_ATTACH:
		case DLL_THREAD_DETACH:
		case DLL_PROCESS_DETACH:
			break;
    }
    return TRUE;
}

DWORD WINAPI PYEX_GetCharacterPinyinA(LPCSTR lpInput, LPSTR lpBuffer, UINT lLength)
{
	return GetCharacterPinyin(lpInput, lpBuffer, lLength);
}

DWORD WINAPI PYEX_IsSimpleSpellingMatchA(LPCSTR lpString, LPCSTR lpSimpleSpelling)
{
	return IsSimpleSpellingMatch(lpString, lpSimpleSpelling);
}

DWORD WINAPI PYEX_IsSimpleSpellingMatchCaseInsensitiveA(LPCSTR lpString, LPCSTR lpSimpleSpelling)
{
	return IsSimpleSpellingMatchCaseInsensitive(lpString, lpSimpleSpelling);
}