#ifndef __PYEXHEADER
#define __PYEXHEADER

#ifdef __cplusplus
extern "C" {
#endif

#define PYLEN 32

int GetCharacterPinyin(const char *lpInput, char *lpBuffer, unsigned int lLength);
int IsSimpleSpellingMatch(const char *lpString, const char *lpSimpleSpelling);
int IsSimpleSpellingMatchCaseInsensitive(const char *lpString, const char *lpSimpleSpelling);

#ifdef __cplusplus
}
#endif
#endif