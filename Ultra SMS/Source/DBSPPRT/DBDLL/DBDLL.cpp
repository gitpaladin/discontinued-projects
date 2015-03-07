// DBDLL.cpp : 定义 DLL 的初始化例程。
//

#include "stdafx.h"
#include "DBDLL.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

void CompressDB(CString DBName, CString NewDBName, CString Password);
bool FileExists(LPCTSTR lpFileName);
CString AppendPath(CString Path1, CString Path2);

//
//	注意！
//
//		如果此 DLL 动态链接到 MFC
//		DLL，从此 DLL 导出并
//		调入 MFC 的任何函数在函数的最前面
//		都必须添加 AFX_MANAGE_STATE 宏。
//
//		例如:
//
//		extern "C" BOOL PASCAL EXPORT ExportedFunction()
//		{
//			AFX_MANAGE_STATE(AfxGetStaticModuleState());
//			// 此处为普通函数体
//		}
//
//		此宏先于任何 MFC 调用
//		出现在每个函数中十分重要。这意味着
//		它必须作为函数中的第一个语句
//		出现，甚至先于所有对象变量声明，
//		这是因为它们的构造函数可能生成 MFC
//		DLL 调用。
//
//		有关其他详细信息，
//		请参阅 MFC 技术说明 33 和 58。
//

// CDBDLLApp

BEGIN_MESSAGE_MAP(CDBDLLApp, CWinApp)
END_MESSAGE_MAP()


// CDBDLLApp 构造

CDBDLLApp::CDBDLLApp()
{
	// TODO: 在此处添加构造代码，
	// 将所有重要的初始化放置在 InitInstance 中
}


// 唯一的一个 CDBDLLApp 对象

CDBDLLApp theApp;


// CDBDLLApp 初始化

BOOL CDBDLLApp::InitInstance()
{
	CWinApp::InitInstance();

	return TRUE;
}

void CompressDB(CString DBName, CString NewDBName, CString Password)
{
	// 使用 DAO 压缩数据库
	CDaoWorkspace *DBWKS = new CDaoWorkspace;
	
	if (FileExists(NewDBName))
		DeleteFile(NewDBName);
	
	if (Password.IsEmpty())
		DBWKS->CompactDatabase(DBName, NewDBName, _T(""),  0, _T(""));
	else
		DBWKS->CompactDatabase(DBName, NewDBName, _T(""),  0, _T(";pwd=") + Password);

	delete DBWKS;
}

bool FileExists(LPCTSTR lpFileName)
{
	CFileFind ff;

	if (ff.FindFile(lpFileName))
	{
		ff.Close();
		return true;
	}
	else
		return false;
}

CString AppendPath(CString Path1, CString Path2)
{
	if (Path1.Right(1) == _T("\\"))
		return Path1 + Path2;
	else
		return Path1 + _T("\\") + Path2;
}


void WINAPI DBCompress(LPCTSTR lpSrc, LPCTSTR lpDest, LPCTSTR lpPassword)
{
	// 压缩数据库的函数
	char *TmpDir, *TmpFile;

	if (FileExists(lpSrc))
	{	
		if (strlen(lpDest))
			CompressDB(lpSrc, lpDest, lpPassword);
		else
		{
			TmpDir = new char[MAX_PATH];
			TmpFile = new char[MAX_PATH];

			GetTempPath(MAX_PATH, TmpDir);
			GetTempFileName(TmpDir, _T("db"), 0, TmpFile);

			if (strlen(TmpFile))
				CompressDB(lpSrc, TmpFile, lpPassword);

			CopyFile(TmpFile, lpSrc, 0);
			DeleteFile(TmpFile);

			delete [] TmpDir;
			delete [] TmpFile;
		}
	}
}

void WINAPI DBCreate(LPCTSTR lpSrcPath)
{
	CDaoDatabase *db = new CDaoDatabase;
	CDaoQueryDef *sql;

	// ===================
	//  创建 settings.mdb
	// ===================
	DeleteFile(AppendPath(lpSrcPath, _T("settings.mdb")));
	db->Create(AppendPath(lpSrcPath, _T("settings.mdb")));
	db->Execute(_T("CREATE TABLE filter ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Execute(_T("CREATE TABLE interface ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Execute(_T("CREATE TABLE modem ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Execute(_T("CREATE TABLE wnd_print ([name] VARCHAR(50) PRIMARY KEY, [value] MEMO);"));
	db->Close();
	delete db;
	
	// ==================
	//  创建 contact.mdb
	// ==================

	DeleteFile(AppendPath(lpSrcPath, _T("contact.mdb")));

	db = new CDaoDatabase;
	db->Create(AppendPath(lpSrcPath, _T("contact.mdb")));

	// 创建 category 表
	db->Execute(_T(
		"CREATE TABLE [category]\n \
		(\n \
		  [category] VARCHAR(50) PRIMARY KEY\n \
		);"
		));


	// 创建 contact 表
	//			CONSTRAINT [pk_cate] FOREIGN KEY ([category]) REFERENCES [category]([category]) ON UPDATE CASCADE ON DELETE CASCADE \

	db->Execute(_T(" \
		CREATE TABLE contact \
		( \
			[id]          LONG NOT NULL, \
			[name]        VARCHAR(14), \
			[category]    VARCHAR(50), \
			[phonenumber] VARCHAR(50) PRIMARY KEY, \
			[folder]      VARCHAR(50) \
		);" 
		));

	// 创建索引
	db->Execute(_T("CREATE INDEX [id] ON [contact]([id] ASC);"));

	// 创建关系
	db->CreateRelation(_T("fk_contact"), 
		_T("category"), 
		_T("contact"), 
		dbRelationUpdateCascade | dbRelationDeleteCascade, 
		_T("category"),
		_T("category"));

	db->Close();

	delete db;

	// ==============
	//  创建 sms.mdb
	// ==============
	DeleteFile(AppendPath(lpSrcPath, _T("sms.mdb")));
	db = new CDaoDatabase;
	db->Create(AppendPath(lpSrcPath, _T("sms.mdb")));

	// 创建 draft 表
	db->Execute(_T(" \
		CREATE TABLE [draft] \
			( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[content]       MEMO, \
			[date]          DATETIME, \
			[drafttype]     LONG, \
			[associatedbox] VARCHAR(20), \
			[associatedid]  LONG, \
			[hash]			VARCHAR(32) \
		); "
		));

	// 创建 draft 表的索引
	db->Execute(_T("CREATE INDEX [id] ON [draft]([id] ASC);"));
	db->Execute(_T("CREATE INDEX [internalid] ON [draft]([internalid] ASC);"));
	db->Execute(_T("CREATE INDEX [date] ON [draft]([date] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [draft]([hash] ASC);"));

	// 创建 draft_item 表
	db->Execute(_T(" \
		CREATE TABLE [draft_item] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[associatedid]  LONG, \
			[name]          VARCHAR(50), \
			[number]        VARCHAR(50) \
		);"));

	// 创建 draft_item 索引
	db->Execute(_T("CREATE INDEX [associatedid] ON [draft_item]([associatedid] ASC);"));

	// 创建 draft_item 和 draft 关系
	db->CreateRelation(_T("fk_draft"), 
		_T("draft"), 
		_T("draft_item"), 
		dbRelationUpdateCascade | dbRelationDeleteCascade, 
		_T("internalid"),
		_T("associatedid"));

	// 创建 finish 表
	db->Execute(_T(" \
		CREATE TABLE [finish] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[senderdate]    DATETIME, \
			[transmitted]   BIT, \
			[content]       MEMO, \
			[hash]			VARCHAR(32) \
		);"));

	// 创建 finish 索引
	db->Execute(_T("CREATE INDEX [senderdate] ON [finish]([senderdate] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [finish]([hash] ASC);"));

	// 创建 finish_item 表
	db->Execute(_T(" \
		CREATE TABLE [finish_item] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[associatedid]  LONG, \
			[name]          VARCHAR(50), \
			[number]        VARCHAR(50) \
		);"));

	// 创建 finish_item 索引
	db->Execute(_T("CREATE INDEX [associatedid] ON [finish_item]([associatedid] ASC);"));
	db->Execute(_T("CREATE INDEX [number] ON [finish_item]([number] ASC);"));

	// 创建 finish_item 和 finish 关系
	db->CreateRelation(_T("fk_finish"), 
		_T("finish"), 
		_T("finish_item"), 
		dbRelationUpdateCascade | dbRelationDeleteCascade, 
		_T("internalid"),
		_T("associatedid"));

	// 创建 folder 表
	db->Execute(_T(" \
		CREATE TABLE [folder] \
		( \
			[folder]        VARCHAR(50) PRIMARY KEY \
		);"));
	
	// 创建 receive 表
	db->Execute(_T(" \
		CREATE TABLE [receive] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[receivedate]   DATETIME, \
			[sender]        VARCHAR(14), \
			[sendernumber]  VARCHAR(50), \
			[replied]       BIT, \
			[read]          BIT, \
			[transmitted]   BIT, \
			[content]       MEMO, \
			[folder]        VARCHAR(50), \
			[hash]			VARCHAR(32) \
		);"));

	// 创建 receive 表索引
	db->Execute(_T("CREATE INDEX [receivedate] ON [receive]([receivedate] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [receive]([hash] ASC);"));

	// 创建 send 表
	db->Execute(_T(" \
		CREATE TABLE [send] \
		( \
			[internalid]    AUTOINCREMENT PRIMARY KEY, \
			[id]            LONG, \
			[senderdate]    DATETIME, \
			[addressee]     VARCHAR(14), \
			[number]        VARCHAR(50), \
			[content]       MEMO, \
			[finishid]      LONG, \
			[hash]			VARCHAR(32) \
		);"));
	
	// 创建 send 表索引
	db->Execute(_T("CREATE INDEX [senderdate] ON [send]([senderdate] ASC);"));
	db->Execute(_T("CREATE INDEX [finishid] ON [send]([finishid] ASC);"));
	db->Execute(_T("CREATE INDEX [hash] ON [send]([hash] ASC);"));

	// 创建 draft_count 查询
	sql = new CDaoQueryDef(db);
	sql->Create(_T("draft_count"), _T(" \
		SELECT draft_item.associatedid AS internalid, count(draft_item.number) AS [count], first(draft_item.name) AS name, first(draft_item.number) AS [number] \
		FROM draft_item \
		GROUP BY draft_item.associatedid;"
		));
	sql->Append();
	sql->Close();
	delete sql;

	// 创建 draft_detail 查询
	sql = new CDaoQueryDef(db);
	sql->Create(_T("draft_detail"), _T(" \
		SELECT draft.internalid, draft.id, draft.content, draft.date, draft.drafttype, draft.associatedbox, draft.associatedid, draft_count.count, draft_count.name, draft_count.number \
		FROM draft_count INNER JOIN draft ON draft_count.internalid = draft.internalid; "
		));
	sql->Append();
	sql->Close();
	delete sql;

	// 创建 finish_count 查询
	sql = new CDaoQueryDef(db);
	sql->Create(_T("finish_count"), _T(" \
		SELECT finish_item.associatedid AS internalid, Count(*) AS [count], First(finish_item.name) AS name, First(finish_item.number) AS [number] \
		FROM finish_item \
		GROUP BY finish_item.associatedid; "
		));
	sql->Append();
	sql->Close();
	delete sql;

	// 创建 finish_detail 查询
	sql = new CDaoQueryDef(db);
	sql->Create(_T("finish_detail"), _T(" \
		SELECT finish.internalid, finish.id, finish.senderdate, finish.transmitted, finish.content, finish_count.count, finish_count.name, finish_count.number \
		FROM finish_count INNER JOIN finish ON finish_count.internalid = finish.internalid; "
		));
	sql->Append();
	sql->Close();
	delete sql;

	// 退出
	db->Close();
	delete db;
}