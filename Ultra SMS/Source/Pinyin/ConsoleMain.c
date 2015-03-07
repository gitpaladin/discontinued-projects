#include <stdio.h>
#include <windows.h>
#include "PYExt.h"

int main()
{
	DWORD result = 0;
	DWORD HZ = 0;
	char character[PYLEN];
	char pinyin[PYLEN];

	gets(character);
	gets(pinyin);

	result = IsSimpleSpellingMatchCaseInsensitive(character, pinyin);

	printf("%d", result);
	return result;

}
