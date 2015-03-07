#include <ctype.h>
#include <string.h>
#include <memory.h>
#include "Library\GetGBKPY.H"
#include "PYExt.h"

// 获得文字的拼音
int GetCharacterPinyin(const char *lpInput, char *lpBuffer, unsigned int lLength)
{
	DWORD HZ = 0;
	HZ = (DWORD)(*(unsigned char *)lpInput << 8) + (DWORD)(*(unsigned char *)(lpInput + 1));
	return GetPY(HZ, lpBuffer, lLength);
}

int IsAlphaEquals(char c1, char c2)
{
	return toupper(c1) == tolower(c2);
}

char*   toLowerString(char*   szSource)  
{  
	char*   szString   =   szSource;  
	while   (*szString)  
	{  
		if   (isupper(*szString))  
		{  
			*szString   =   tolower(*szString);  
		}  
		szString++;  
	}  
	return   szSource;  
}  

char*   toUpperString(char*   szSource)  
{  
	char*   szString   =   szSource;  
	while   (*szString)  
	{  
		if   (islower(*szString))  
		{  
			*szString   =   toupper(*szString);  
		}  
		szString++;  
	}  
	return   szSource;  
  }   

// 是否文字符合简拼
int IsSimpleSpellingMatch(const char *lpString, const char *lpSimpleSpelling)
{
	// 变量
	char uChar = 0;
	char bufSpelling[PYLEN];
	const char *itr, *firstpos;
	int TrySimpleSpelling = 1;
	int Mismatched = 0;
	
	// 如果简拼完成则返回真
	if (*lpSimpleSpelling == 0)
		return 1;
	
	// 查看第一个字
	uChar = *lpString;

	if (uChar == 0)
		// 如果没有字符串了，但还有简拼，返回否
		return 0;
	else if (isalpha(uChar))
	{
		// 是英文字母
		if (uChar == *lpSimpleSpelling)
			return IsSimpleSpellingMatch(++lpString, ++lpSimpleSpelling);
		else
			return 0;
	}
	else if (isdigit(uChar))
	{
		// 数字
		if (uChar == *lpSimpleSpelling)
			return IsSimpleSpellingMatch(++lpString, ++lpSimpleSpelling);
		else
			return 0;
	}
	else if (uChar & 0x80)
	{
		// 双字节编码，获得汉字的拼音
		if (GetCharacterPinyin(lpString, bufSpelling, PYLEN))
		{
			itr = bufSpelling;
			TrySimpleSpelling = 1;

			while (*itr)
			{
				firstpos = lpSimpleSpelling;

				if (TrySimpleSpelling)
				{
					// 尝试简拼
					if (*itr == *lpSimpleSpelling)
						if (IsSimpleSpellingMatch(lpString+2, ++firstpos))
							return 1;
				}
				else
				{
					// 尝试完整拼音
					Mismatched = 0;

					// 匹配拼音
					while ((*itr != ' ') && (*itr != 0) && (firstpos != 0))
					{
						if (*itr != *firstpos) 
						{
							Mismatched = 1;
							break;
						}

						itr++, firstpos++;
					}

					// 匹配是值此轮匹配失败或之后也不能匹配
					if (!Mismatched && IsSimpleSpellingMatch(lpString + 2, firstpos))
						return 1;
					else
						Mismatched = 1;
					
					// 如果不匹配就要将指针移到下一个拼音的位置
					itr++;
					while (Mismatched && (*itr != 0) && (*(itr-1) != ' '))
						itr++;
				}

				TrySimpleSpelling = !TrySimpleSpelling;
			}

			// 遍历之后都没有匹配的
			return 0;
		}
		else
			// 无法理解的字符，跳到下一个
			return IsSimpleSpellingMatch(lpString+2, lpSimpleSpelling);
	}
	else
	{
		// 无法理解的字符跳到下一字符
		return IsSimpleSpellingMatch(++lpString, lpSimpleSpelling);
	}
}

int IsSimpleSpellingMatchCaseInsensitive(const char *lpString, const char *lpSimpleSpelling)
{
	char *lpStringCopy;
	char *lpSimpleSpellingCopy;
	int result;

	lpStringCopy = malloc(512);
	lpSimpleSpellingCopy = malloc(512);

	strncpy(lpStringCopy, lpString, 512);
	strncpy(lpSimpleSpellingCopy, lpSimpleSpelling, 512);

	toLowerString(lpStringCopy);
	toLowerString(lpSimpleSpellingCopy);

	result = IsSimpleSpellingMatch(lpStringCopy, lpSimpleSpellingCopy);

	free(lpStringCopy);
	free(lpSimpleSpellingCopy);

	return result;
}