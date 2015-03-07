// DBDLL.h : DBDLL DLL 的主头文件
//

#pragma once

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// 主符号


// CDBDLLApp
// 有关此类实现的信息，请参阅 DBDLL.cpp
//

class CDBDLLApp : public CWinApp
{
public:
	CDBDLLApp();

// 重写
public:
	virtual BOOL InitInstance();

	DECLARE_MESSAGE_MAP()
};


// 导出的函数
#ifdef __cplusplus
extern "C"
{
#endif		// __cplusplus

// 输出的函数
void WINAPI DBCompress(LPCTSTR lpSrc, LPCTSTR lpDest, LPCTSTR lpPassword);
void WINAPI DBCreate(LPCTSTR lpSrcPath);

#ifdef __cplusplus
}
#endif		// __cplusplus