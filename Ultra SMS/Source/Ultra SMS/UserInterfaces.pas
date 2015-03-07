unit UserInterfaces;

//{$DEFINE BETA}

interface

uses
  Windows, ShellAPI , Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, SMSJob, cxGraphics, Buttons, SPComm, XPMan,
  dxDockControl, ImgList, dxBarExtItems, dxBar, dxDockPanel, cxControls,
  dxStatusBar, GSMChar, OleCtrls, ActnList, ExtCtrls, ToolWin, GerneralFunc,
  ADODB, DB, untConnect, VirtualTrees, uFraInfoPreview, {mxarrays,} uFrmWriteSMS,
  uFrmReadSMS, uDlgPrint, Contnrs, Clipbrd, CoolTrayIcon, uFrmNotification, Menus,
  uFraFilter, uDlgAddFolder, uDlgFolderProperty, uDlgMoveSMS, uDlgAddContact,
  uFraFind, SMSFind, SynEditActions, SHDocVw, CryptoAPI, HTMLHELP_Decl,
  AppEvnts, cxHint, HotKeyManager, uDlgExport, TextTrayIcon, 
  cxClasses, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinSilver, dxSkinStardust, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinsdxStatusBarPainter,
  dxSkinsdxBarPainter, dxSkinsdxDockControlPainter;

const
  WM_MSG_CLOSEWND = WM_USER + 461;
  WM_UPDATE_PHONEBOOK = WM_USER + 462;
  WM_ACTIVATE_MAINWND = WM_USER + 463;

var
  sBuffers: TStringList;      // 用于接收端口的数据
  sBuffer: String;
  Connected: Boolean;
  StaticIcon: Integer;
  JobThread: TJobThread;
  MessageWnd: TNotices;
  AutoReceive: Boolean;
  AFindSession: TSMSFind;
//  ConnectionLost: Boolean;

type
  NTranferStatus = (tsInfo, tsUpload, tsDownload, tsError);
  TIntegerDynArray = array of Integer;
  TTriBoolean = (tbTrue, tbFalse, tbUnchange);

  TfrmMain = class(TForm)
    stbMain: TdxStatusBar;
    dxbmMain: TdxBarManager;
    dxmnuFile: TdxBarSubItem;
    dxmnuFileOpen: TdxBarButton;
    dxmnuFileSave: TdxBarButton;
    dxmnuFileConnect: TdxBarButton;
    dxmnuFileConnectSettings: TdxBarButton;
    dxmnuFileExit: TdxBarButton;
    dxmnuFilePrintSetting: TdxBarButton;
    dxmnuFilePrint: TdxBarButton;
    dxmnuFileExportTXT: TdxBarButton;
    dxmnuFileExportHTML: TdxBarButton;
    dxmnuFileWord: TdxBarButton;
    dxmnuFilePassword: TdxBarButton;
    dxmnuFileDisconnect: TdxBarButton;
    dxmnuFileConnectWizard: TdxBarButton;
    dxmnuEdit: TdxBarSubItem;
    dxmnuEditCopy: TdxBarButton;
    dxmnuEditFind: TdxBarButton;
    dxmnuEditFilter: TdxBarButton;
    dxmnuEditMoveTo: TdxBarButton;
    dxmnuEditSelRev: TdxBarButton;
    dxmnuEditSelNone: TdxBarButton;
    dxmnuEditSelAll: TdxBarButton;
    dxmnuEditDelete: TdxBarButton;
    dxmnuView: TdxBarSubItem;
    dxmnuViewToolbar: TdxBarButton;
    dxmnuViewJob: TdxBarButton;
    dxmnuViewFilter: TdxBarButton;
    dxmnuViewFolder: TdxBarButton;
    dxmnuViewPhone: TdxBarButton;
    dxmnuViewModem: TdxBarButton;
    dxmnuViewPreview: TdxBarButton;
    dxmnuViewFind: TdxBarButton;
    dxmnuViewPhonebook: TdxBarButton;
    dxmnuViewStatusbar: TdxBarButton;
    dxmnuViewCustom: TdxBarButton;
    dxmnuSMS: TdxBarSubItem;
    dxmnuSMSNew: TdxBarButton;
    dxmnuSMSUnread: TdxBarButton;
    dxmnuSMSRead: TdxBarButton;
    dxmnuSMSSender: TdxBarButton;
    dxmnuSMSResend: TdxBarButton;
    dxmnuSMSTransmit: TdxBarButton;
    dxmnuSMSReplaySel: TdxBarButton;
    dxmnuSMSReplay: TdxBarButton;
    dxmnuSMSProperty: TdxBarButton;
    dxmnuSMSSend: TdxBarButton;
    dxmnuSMSReceive: TdxBarButton;
    dxmnuFolder: TdxBarSubItem;
    dxmnuFolderNew: TdxBarButton;
    dxmnuFolderRule: TdxBarButton;
    dxmnuFolderProperty: TdxBarButton;
    dxmnuFolderDel: TdxBarButton;
    dxmnuPBook: TdxBarSubItem;
    dxmnuPBookAdd: TdxBarButton;
    dxmnuPBookExport: TdxBarButton;
    dxmnuPBookInput: TdxBarButton;
    dxmnuPBookMove: TdxBarButton;
    dxmnuPBookPhone: TdxBarButton;
    dxmnuPBookInfo: TdxBarButton;
    dxmnuPBookDelete: TdxBarButton;
    dxmnuTool: TdxBarSubItem;
    dxmnuToolTemplate: TdxBarButton;
    dxmnuToolExport: TdxBarButton;
    dxmnuToolProgram: TdxBarButton;
    dxmnuToolImport: TdxBarButton;
    dxmnuToolDesktop: TdxBarButton;
    dxmnuToolOption: TdxBarButton;
    dxmnuHelp: TdxBarSubItem;
    dxmnuHelpTopic: TdxBarButton;
    dxmnuHelpIndex: TdxBarButton;
    dxmnuHelpFlydragon: TdxBarButton;
    dxmnuHelpBookmark: TdxBarButton;
    dxmnuHelpSearch: TdxBarButton;
    dxmnuHelpSMS: TdxBarButton;
    dxmnuHelpMail: TdxBarButton;
    dxmnuHelpSoft: TdxBarButton;
    dxmnuHelpAbout: TdxBarButton;
    dxmnuHelpWebsite: TdxBarButton;
    dxbtnReceive: TdxBarLargeButton;
    dxmnuSMSAutoReceive: TdxBarButton;
    iltToolbar: TImageList;
    dxbtnSend: TdxBarLargeButton;
    dxdmFloatWindows: TdxDockingManager;
    dxdsClient: TdxDockSite;
    dxdpFolder: TdxDockPanel;
    dxdpPhonebook: TdxDockPanel;
    dxdpFilter: TdxDockPanel;
    dxdpFind: TdxDockPanel;
    dxTabContainerDockSite2: TdxTabContainerDockSite;
    dxldsRightWnd: TdxLayoutDockSite;
    dxVertContainerDockSite1: TdxVertContainerDockSite;
    dxdpMsgPreview: TdxDockPanel;
    dxldsMainClient: TdxLayoutDockSite;
    dxdpCellphone: TdxDockPanel;
    dxtcdsInfo: TdxTabContainerDockSite;
    dxdpModem: TdxDockPanel;
    dxdpJob: TdxDockPanel;
    dxdpMainPart: TdxDockPanel;
    dxldsMainPart: TdxLayoutDockSite;
    cmModem: TComm;
    lvwModem: TListView;
    iltModem: TImageList;
    dxbtnNewSMS: TdxBarLargeButton;
    dxbtnReply: TdxBarLargeButton;
    dxbtnTransmit: TdxBarLargeButton;
    dxbtnDeleteSMS: TdxBarLargeButton;
    dxbtnSync: TdxBarLargeButton;
    dxbtnAutoReceive: TdxBarLargeButton;
    dxbtnNewFolder: TdxBarLargeButton;
    dxbtnDelete: TdxBarLargeButton;
    dxbtnProperty: TdxBarLargeButton;
    dxbtnConnect: TdxBarLargeButton;
    tvwFolder: TTreeView;
    cbeCategory: TComboBoxEx;
    lvwPhonebook: TListView;
    iltDock: TImageList;
    adoSettings: TADOConnection;
    adoSMS: TADOConnection;
    adoContacts: TADOConnection;
    lvwPhoneInfo: TListView;
    iltPhoneInfo: TImageList;
    iltStatusBar: TImageList;
    iltPhoneBook: TImageList;
    lvwJob: TListView;
    iltJob: TImageList;
    vstSMS: TVirtualStringTree;
    iltHeader: TImageList;
    iltFolder: TImageList;
    iltSMS: TImageList;
    fraInfoPreview: TfraInfoPreview;
    tmrReadInfo: TTimer;
    dxdpWindow: TdxDockPanel;
    lvwWindow: TListView;
    dxmnuViewWnd: TdxBarButton;
    iltWindow: TImageList;
    tmrHidePopHit: TTimer;
    dxmnuSMSSendSel: TdxBarButton;
    ctiMain: TCoolTrayIcon;
    dxmnuSMSTransmitted: TdxBarButton;
    dxmnuSMSUntransmitted: TdxBarButton;
    dxmnuSMSReplied: TdxBarButton;
    dxmnuSMSUnreplied: TdxBarButton;
    popSysTray: TPopupMenu;
    popTrayShow: TMenuItem;
    popTraySep1: TMenuItem;
    popTrayDisconnect: TMenuItem;
    popTrayConnect: TMenuItem;
    popTraySep2: TMenuItem;
    popTrayReceive: TMenuItem;
    popTraySend: TMenuItem;
    popTraySnycPhoneBook: TMenuItem;
    popTrayNewMSG: TMenuItem;
    popTraySep3: TMenuItem;
    popTrayExit: TMenuItem;
    iltTrayReceive: TImageList;
    iltTraySend: TImageList;
    iltTrayPBook: TImageList;
    iltTrayNormal: TImageList;
    pdPrint: TPrintDialog;
    fraFilter: TfraFilter;
    sdExport: TSaveDialog;
    iltMenu: TImageList;
    wbIntro: TWebBrowser;
    popFolder: TdxBarPopupMenu;
    dxmnuToolSaveModem: TdxBarButton;
    dxmnuToolSaveToFile: TdxBarButton;
    dxmnuPBookNewCategory: TdxBarButton;
    dxmnuPBookDelCategory: TdxBarButton;
    dxmnuPBookEditCategory: TdxBarButton;
    popCategory: TdxBarPopupMenu;
    popPBook: TdxBarPopupMenu;
    popSMS: TdxBarPopupMenu;
    popModem: TdxBarPopupMenu;
    dxmnuToolClearModem: TdxBarButton;
    aeDefault: TApplicationEvents;
    hkmDefault: THotKeyManager;
    popOpenUnread: TMenuItem;
    popTraySep5: TMenuItem;
    popReplayUnread: TMenuItem;
    dxmnuToolHotKey: TdxBarButton;
    iltTrayConnected: TImageList;
    iltTrayDisconncted: TImageList;
    bdcFolder: TdxBarDockControl;
    bdcPBook: TdxBarDockControl;
    bdcModem: TdxBarDockControl;
    bdcWindow: TdxBarDockControl;
    btnShow: TdxBarButton;
    btnClose: TdxBarButton;
    btnMinimized: TdxBarButton;
    btnMaximized: TdxBarButton;
    dxmnuJob: TdxBarSubItem;
    dxmnuJobCancelCurrent: TdxBarButton;
    dxmnuJobCancelQueue: TdxBarButton;
    dxmnuJobCancelDulp: TdxBarButton;
    dxmnuJobCancelSel: TdxBarButton;
    dxmnuJobTop: TdxBarButton;
    dxmnuJobPromote: TdxBarButton;
    dxmnuJobDegrade: TdxBarButton;
    dxmnuJobBottom: TdxBarButton;
    bdcJob: TdxBarDockControl;
    dxmnuViewTBRFolder: TdxBarButton;
    dxmnuViewTBRPBokk: TdxBarButton;
    dxmnuViewTBRModem: TdxBarButton;
    dxmnuViewTBRJob: TdxBarButton;
    dxmnuViewTBRWindow: TdxBarButton;
    tmrReginfo: TTimer;
    dxmnuHelpRegister: TdxBarButton;
    dxmnuHelpShowReg: TdxBarButton;
    dxmnuToolDB: TdxBarButton;
    qrySMS: TADOQuery;
    dxmnuViewFirstPage: TdxBarButton;
    dxmnuViewPreviousPage: TdxBarButton;
    dxmnuViewNextPage: TdxBarButton;
    dxmnuViewLastPage: TdxBarButton;
    dxmnuViewRefresh: TdxBarButton;
    dxmnuSortAscending: TdxBarButton;
    dxmnuSortDescending: TdxBarButton;
    dxmnuSortName: TdxBarButton;
    dxmnuSortNumber: TdxBarButton;
    dxmnuSortDate: TdxBarButton;
    dxmnuViewSplitPage: TdxBarButton;
    dxicbCurrentPage: TdxBarImageCombo;
    dxmnuViewSplit: TdxBarButton;
    dxmnuPage: TdxBarSubItem;
    dxmnuSMSDelPhone: TdxBarButton;
    dxmnuToolPhoneState: TdxBarButton;
    tmrQueryState: TTimer;
    tmrReconnect: TTimer;
    dxmnuFileRestart: TdxBarButton;
    dxmnuPBookShowInfo: TdxBarButton;
    ctiNewMessage: TCoolTrayIcon;
    dxmnuPBookSetFilter: TdxBarButton;
    dxmnuPbookAddFilter: TdxBarButton;
    dxmnuEditFilterEnabled: TdxBarButton;
    dxmnuToolTime: TdxBarButton;
    iltSMSNew: TImageList;
    dxtxtModemCmd: TdxBarCombo;
    dxmnuSMSRemoveSMS: TdxBarButton;
    dxmnuSMSCycleNew: TdxBarButton;
    tmrQueryNewSMS: TTimer;
    imgBigIcon: TImage;
    fraFind: TfraFind;
    dxmnuPbookSync: TdxBarButton;
    txtPinyin: TEdit;
    SpeedButton1: TSpeedButton;
    procedure CreateParams(var Params: TCreateParams);override;
    procedure cmModemReceiveData(Sender: TObject; Buffer: Pointer;
      BufferLength: Word);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxmnuFileConnectWizardClick(Sender: TObject);
    procedure dxmnuFileConnectClick(Sender: TObject);
    procedure dxmnuFileDisconnectClick(Sender: TObject);
    procedure dxbtnConnectClick(Sender: TObject);
    procedure cbeCategorySelect(Sender: TObject);
    procedure dxmnuFileExitClick(Sender: TObject);
    procedure lvwJobCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure dxmnuPBookPhoneClick(Sender: TObject);
    procedure dxmnuSMSReceiveClick(Sender: TObject);
    procedure tvwFolderChange(Sender: TObject; Node: TTreeNode);
    procedure vstSMSGetText(Sender: TBaseVirtualTree; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType;
      var CellText: WideString);
    procedure vstSMSGetImageIndexEx(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
      var Ghosted: Boolean; var ImageIndex: Integer;
      var ImageList: TCustomImageList);
    procedure vstSMSCompareNodes(Sender: TBaseVirtualTree; Node1,
      Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
    procedure vstSMSPaintText(Sender: TBaseVirtualTree;
      const TargetCanvas: TCanvas; Node: PVirtualNode;
      Column: TColumnIndex; TextType: TVSTTextType);
    procedure vstSMSFocusChanged(Sender: TBaseVirtualTree;
      Node: PVirtualNode; Column: TColumnIndex);
    procedure tmrReadInfoTimer(Sender: TObject);
    procedure dxmnuSMSNewClick(Sender: TObject);
    procedure dxmnuViewToolbarClick(Sender: TObject);
    procedure dxmnuViewStatusbarClick(Sender: TObject);
    procedure dxmnuViewFolderClick(Sender: TObject);
    procedure dxmnuViewPhonebookClick(Sender: TObject);
    procedure dxmnuViewFilterClick(Sender: TObject);
    procedure dxmnuViewFindClick(Sender: TObject);
    procedure dxmnuViewPreviewClick(Sender: TObject);
    procedure dxmnuViewPhoneClick(Sender: TObject);
    procedure dxmnuViewModemClick(Sender: TObject);
    procedure dxmnuViewJobClick(Sender: TObject);
    procedure dxmnuViewWndClick(Sender: TObject);
    procedure dxdpFolderActivate(Sender: TdxCustomDockControl;
      Active: Boolean);
    procedure dxdpFolderClose(Sender: TdxCustomDockControl);
    procedure lvwWindowSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure lvwWindowDblClick(Sender: TObject);
    procedure btnShowClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnMinimizedClick(Sender: TObject);
    procedure btnMaximizedClick(Sender: TObject);
    procedure vstSMSDblClick(Sender: TObject);
    procedure dxmnuSMSReplayClick(Sender: TObject);
    procedure dxmnuSMSTransmitClick(Sender: TObject);
    procedure tmrHidePopHitTimer(Sender: TObject);
    procedure dxbtnAutoReceiveClick(Sender: TObject);
    procedure dxmnuEditDeleteClick(Sender: TObject);
    procedure dxmnuEditCopyClick(Sender: TObject);
    procedure dxmnuEditSelAllClick(Sender: TObject);
    procedure dxmnuEditSelNoneClick(Sender: TObject);
    procedure dxmnuEditSelRevClick(Sender: TObject);
    procedure dxmnuSMSReplaySelClick(Sender: TObject);
    procedure dxmnuSMSSendClick(Sender: TObject);
    procedure dxmnuSMSSendSelClick(Sender: TObject);
    procedure ctiMainClick(Sender: TObject);
    procedure ctiMainMinimizeToTray(Sender: TObject);
    procedure dxmnuSMSResendClick(Sender: TObject);
    procedure dxmnuSMSReadClick(Sender: TObject);
    procedure dxmnuSMSUnreadClick(Sender: TObject);
    procedure dxmnuSMSRepliedClick(Sender: TObject);
    procedure dxmnuSMSUnrepliedClick(Sender: TObject);
    procedure dxmnuSMSTransmittedClick(Sender: TObject);
    procedure dxmnuSMSUntransmittedClick(Sender: TObject);
    procedure lvwPhonebookDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dxmnuFilePrintClick(Sender: TObject);
    procedure dxmnuFilePrintSettingClick(Sender: TObject);
    procedure dxmnuFolderNewClick(Sender: TObject);
    procedure dxmnuFolderDelClick(Sender: TObject);
    procedure dxmnuFolderPropertyClick(Sender: TObject);
    procedure dxmnuFolderRuleClick(Sender: TObject);
    procedure dxmnuEditMoveToClick(Sender: TObject);
    procedure dxmnuToolDesktopClick(Sender: TObject);
    procedure dxmnuToolProgramClick(Sender: TObject);
    procedure dxmnuPBookAddClick(Sender: TObject);
    procedure dxmnuPBookDeleteClick(Sender: TObject);
    procedure dxmnuPBookMoveClick(Sender: TObject);
    procedure tvwFolderKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvwPhonebookKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure vstSMSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvwPhonebookInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
    procedure dxmnuSMSSenderClick(Sender: TObject);
    procedure fraFilterbtnRefreshClick(Sender: TObject);
    procedure dxmnuPBookInfoClick(Sender: TObject);
    procedure dxmnuFileSaveClick(Sender: TObject);
    procedure dxmnuPBookExportClick(Sender: TObject);
    procedure wbIntroBeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure dxmnuFilePasswordClick(Sender: TObject);
    procedure dxmnuViewCustomClick(Sender: TObject);
    procedure dxmnuToolOptionClick(Sender: TObject);
    procedure dxmnuHelpMailClick(Sender: TObject);
    procedure dxmnuHelpSMSClick(Sender: TObject);
    procedure dxmnuHelpTopicClick(Sender: TObject);
    procedure dxmnuHelpIndexClick(Sender: TObject);
    procedure dxmnuHelpSearchClick(Sender: TObject);
    procedure dxmnuHelpFlydragonClick(Sender: TObject);
    procedure dxmnuHelpSoftClick(Sender: TObject);
    procedure dxmnuHelpWebsiteClick(Sender: TObject);
    procedure dxmnuFileConnectSettingsClick(Sender: TObject);
    procedure dxmnuPBookNewCategoryClick(Sender: TObject);
    procedure dxmnuPBookEditCategoryClick(Sender: TObject);
    procedure cbeCategoryContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure tvwFolderContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lvwPhonebookContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure vstSMSContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lvwModemContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure dxmnuPBookDelCategoryClick(Sender: TObject);
    procedure dxmnuToolSaveModemClick(Sender: TObject);
    procedure dxmnuToolClearModemClick(Sender: TObject);
    procedure dxmnuToolSaveToFileClick(Sender: TObject);
    procedure dxmnuHelpAboutClick(Sender: TObject);
    procedure aeDefaultActivate(Sender: TObject);
    procedure popOpenUnreadClick(Sender: TObject);
    procedure popReplayUnreadClick(Sender: TObject);
    procedure hkmDefaultHotKeyPressed(HotKey: Cardinal; Index: Word);
    procedure dxmnuToolHotKeyClick(Sender: TObject);
    procedure dxmnuJobCancelCurrentClick(Sender: TObject);
    procedure lvwJobChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
{$IFNDEF DEBUG}
    procedure aeDefaultException(Sender: TObject; E: Exception);
{$ENDIF}
    procedure dxmnuJobCancelQueueClick(Sender: TObject);
    procedure dxmnuJobCancelDulpClick(Sender: TObject);
    procedure dxmnuJobCancelSelClick(Sender: TObject);
    procedure dxmnuJobTopClick(Sender: TObject);
    procedure dxmnuJobPromoteClick(Sender: TObject);
    procedure dxmnuJobDegradeClick(Sender: TObject);
    procedure dxmnuJobBottomClick(Sender: TObject);
    procedure dxmnuViewTBRFolderClick(Sender: TObject);
    procedure dxmnuViewTBRPBokkClick(Sender: TObject);
    procedure dxmnuViewTBRModemClick(Sender: TObject);
    procedure dxmnuViewTBRJobClick(Sender: TObject);
    procedure dxmnuViewTBRWindowClick(Sender: TObject);
    procedure dxbmMainBarVisibleChange(Sender: TdxBarManager;
      ABar: TdxBar);
    procedure dxmnuFileWordClick(Sender: TObject);
    procedure dxmnuFileExportHTMLClick(Sender: TObject);
    procedure dxmnuFileExportTXTClick(Sender: TObject);
    procedure dxtxtModemCmdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tmrReginfoTimer(Sender: TObject);
    procedure lvwJobKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvwModemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxmnuHelpShowRegClick(Sender: TObject);
    procedure dxmnuHelpRegisterClick(Sender: TObject);
    procedure dxmnuToolDBClick(Sender: TObject);
    procedure dxmnuViewSplitPageClick(Sender: TObject);
    procedure dxmnuSortAscendingClick(Sender: TObject);
    procedure dxmnuViewRefreshClick(Sender: TObject);
    procedure dxmnuViewFirstPageClick(Sender: TObject);
    procedure dxmnuViewPreviousPageClick(Sender: TObject);
    procedure dxmnuViewNextPageClick(Sender: TObject);
    procedure dxmnuViewLastPageClick(Sender: TObject);
    procedure dxicbCurrentPageChange(Sender: TObject);
    procedure dxmnuSMSDelPhoneClick(Sender: TObject);
    procedure dxmnuSMSPropertyClick(Sender: TObject);
    procedure dxmnuToolPhoneStateClick(Sender: TObject);
    procedure tmrQueryStateTimer(Sender: TObject);
    procedure dxmnuViewSplitClick(Sender: TObject);
    procedure tmrReconnectTimer(Sender: TObject);
    procedure ctiNewMessageClick(Sender: TObject);
    procedure ctiNewMessageDblClick(Sender: TObject);
    procedure dxmnuEditFilterEnabledClick(Sender: TObject);
    procedure dxmnuPBookSetFilterClick(Sender: TObject);
    procedure dxmnuToolTimeClick(Sender: TObject);
    procedure dxmnuFileRestartClick(Sender: TObject);
//    procedure vstSMSBeforeCellPaint(Sender: TBaseVirtualTree;
//      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
//      CellRect: TRect);
    procedure dxmnuSMSRemoveSMSClick(Sender: TObject);
    procedure vstSMSBeforeCellPaint(Sender: TBaseVirtualTree;
      TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
      CellPaintMode: TVTCellPaintMode; CellRect: TRect;
      var ContentRect: TRect);
    procedure dxmnuSMSCycleNewClick(Sender: TObject);
    procedure tmrQueryNewSMSTimer(Sender: TObject);
    procedure aeDefaultMinimize(Sender: TObject);
    procedure aeDefaultMessage(var Msg: tagMSG; var Handled: Boolean);
    procedure WMSyscommand(var msg: TMessage); message WM_SYSCOMMAND;
    procedure WMExitWindows(var msg: TMessage); message WM_QUERYENDSESSION;
    procedure WMUpdatePBook(var msg: TMessage); message WM_UPDATE_PHONEBOOK;
    procedure WMWindowPosChanged(var Message: TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;
    procedure WMActivateMainWindow(var Message: TWMWindowPosChanged); message WM_ACTIVATE_MAINWND;
    procedure dxmnuPbookSyncClick(Sender: TObject);
    procedure txtPinyinKeyPress(Sender: TObject; var Key: Char);
    procedure txtPinyinKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure txtPinyinChange(Sender: TObject);
    procedure vstSMSHeaderClick(Sender: TVTHeader; HitInfo: TVTHeaderHitInfo);
    procedure lvwModemCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
    FMinimized: Boolean;
    FLastStatus: TWindowState;
    FShowHit: Boolean;
    FInitialized: Boolean;
    FInternalEvent: Boolean;

    FSPRecFirst: Integer;
    FSPRecEnd: Integer;
    FSPCurPage: Integer;
    FSPCntPage: Integer;

    sPass: String;
    function FDockShowing(ADockPanel: TdxDockPanel): Boolean;
    procedure FShowDockPanel(ADockPanel: TdxDockPanel);
    procedure FUpdateViewMenu;
    procedure FAPICloseWindow(var Message: TMessage); message WM_MSG_CLOSEWND;
    procedure FCalcCount;
    procedure FConnectDB(TryCount: Integer = 0; ALastPass: string = '');
    procedure PrepareForExpert(DLG: TdlgExport);
    procedure ShowExitMesaage(const Message: String);
  public
    { Public declarations }
    FPrintPropDef: TPntDlgProperty;
    CurrentView: TCurrentView;
    procedure UpdateView;
    procedure SortSMSList;
    procedure UpdateWndCaption(hWindow: HWND);
    procedure UpdateWndID(hWindow: HWND; InternalID: Integer);
    procedure DeleteWnd(hWindow: HWND);
    function QueryWindow(ABox: String; InternalID: String; ShowFound: Boolean = True; CloseFound: Boolean = False): Boolean;
    procedure RefreshView; overload;
    procedure RefreshView(InternalID: Integer); overload;
    procedure RefreshView(isSelection: TList); overload;
    procedure UpdateMark(InternalIDs: TIntegerDynArray; AReadMark: TTriBoolean =
      tbUnchange; AReplyMark: TTriBoolean = tbUnchange; ASendMark: TTriBoolean =
      tbUnchange; BReceiveBox: Boolean = True);
    procedure RefreshPage(isSelection: TList); overload;
    procedure RefreshPage(iPage: Integer; isSelection: TList); overload;
    procedure ShowTrayAnimation(Animation: Boolean = False; AStatus: TJobKind = jkSend);
    procedure ShowPopHit(Title, Content: String; AlwaysShow: Boolean = False);
    procedure RefreshCategory(CurCategory: String = ''; ASelection: String = '');
    procedure RefreshHotKey;
    procedure RefreshJobMenuState;
    procedure CancelQueue(Index: Integer);
    procedure RefreshJobListNumber;
    procedure RefreshIMEI(const IMEI: String);
    procedure RefreshNewTray;
    procedure NewSmsReport(PDU: String);
    procedure AddContact(Phone: String);
    procedure ReplaceContact(Phone: String);
    procedure LoadConnectionSettings;
    procedure SaveConnectionSettings;
  end;

  // 用于 VirtualTreeView 的条目数据
  TShortMessageEntry = record
    InternalID: Integer;
    DateTime: TDateTime;
    Sender: String;
    PhoneNumber: String;
    Content: String;
    Replied: Boolean;
    Read: Boolean;
    Transmitted: Boolean;
    MessageCount: Cardinal;
    PhoneClient: Boolean;
    MessageReport: Boolean;
  end;

  PShortMessageEntry = ^TShortMessageEntry;


// 公有的过程和函数
procedure AddModemStaus(Status: NTranferStatus; sInfo: string; ShowBoolean: Boolean = False; Title: String = '');
procedure SendCommand(sCommand: string; bAddCr: Boolean = True);
function WaitingForMessage(MsgCount: Cardinal = 1; TimeOut: Cardinal = 5000): Boolean;
function WaitingForReturnValue(OriginalCmd: String; var ReturnVal: String; TimeOut: Cardinal = 5000): Boolean;
function WaitingForReturn(TimeOut: Cardinal = 5000): Boolean;
function WaitingForInput(TimeOut: Cardinal = 5000): Boolean;
function OpenPort(Port: String = ''): Boolean;
function OpenPortDef: Boolean;
function ClosePort(SuspendJob: Boolean = True): Boolean;

// 全局变量
var
  frmMain: TfrmMain;
  varLastCommResult: TLastActionResult;

implementation

uses
  StrUtils, ListActns, Math, DateUtils, ShlObj, uFfmContact, uDlgContactInfo,
  ComObj, uDlgPassword, uFrmSplash, uDlgOptions, uDlgConnect, uDlgCategory,
  uDlgAbout, uDlgHotKey, uDlgRegister, uFrmTime, DES, AES, Registry, uVersion,
  uFrmRemoveSMS, DGL_Integer, IniFiles, uFrmSyncPhonebook, uDlgTest, GetGBKPY_imp,
  UxTheme;

{$R *.dfm}
// ***************************************
// 向 Modem 交换信息窗口中添加的过程
// 参数：[in]Status 类型
//       [in]sInfo  信息
// ***************************************
procedure AddModemStaus(Status: NTranferStatus; sInfo: string; ShowBoolean: Boolean = False; Title: String = '');
var
  xItem: TListItem;
  tNow: TSystemTime;
begin
  if frmMain.lvwModem.Items.Count > 10000 then
    frmMain.lvwModem.Clear;

  xItem := frmMain.lvwModem.Items.Add;
  GetLocalTime(tNow);

  case Status of
  tsInfo :
  begin
    xItem.Caption := '信息';
    xItem.ImageIndex := 0;
  end;
  tsUpload :
  begin
    xItem.Caption := '发送';
    xItem.ImageIndex := 1;
  end;
  tsDownload :
  begin
    xItem.Caption := '接收';
    xItem.ImageIndex := 2;
  end;
  tsError :
  begin
    xItem.Caption := '错误';
    xItem.ImageIndex := 3;
  end;
  end;

  xItem.SubItems.Add(Format('%4d-%2.2d-%2.2d %2.2d:%2.2d:%2.2d.%3.3d',
    [tNow.wYear, tNow.wMonth, tNow.wDay, tNow.wHour, tNow.wMinute,
    tNow.wSecond, tNow.wMilliseconds]));
  xItem.SubItems.Add(sInfo);
  xItem.MakeVisible(False);

  if ShowBoolean then
    frmMain.ShowPopHit(Title, sInfo);
end;

// **********************************************************************
// 向 Modem 中发送信息
// 参数：[in]sCommand 类型
//       [in]sInfo    信息
// **********************************************************************
procedure SendCommand(sCommand: string; bAddCr: Boolean = True);
begin
  if Connected then
  begin
    AddModemStaus(tsUpload, sCommand);
    if bAddCr then sCommand := sCommand + #13;
    frmMain.cmModem.WriteCommData(PAnsiChar(sCommand), Length(sCommand));
  end;
end;

// **********************************************************************
// 等待端口的信息返回
// [in]     TimeOut 等待时间
// [return] 是否成功
// **********************************************************************
function WaitingForMessage(MsgCount: Cardinal = 1; TimeOut: Cardinal = 5000): Boolean;
var
  OriIndex: Integer;
begin
  OriIndex := sBuffers.Count;
  Result := False;

  if not Connected then
    Exit;

  while TimeOut > 1 do
  begin
    Application.ProcessMessages;
    if sBuffers.Count >= OriIndex + Integer(MsgCount) then
    begin
      Result := True;
      Break;
    end;
    Sleep(50);
    Dec(TimeOut, 50);
  end;
end;

function WaitingForReturnValue(OriginalCmd: String; var ReturnVal: String; TimeOut: Cardinal = 5000): Boolean;
var
  j: Integer;
begin
  Result := False;

  if not WaitingForReturn(TimeOut) then
  begin
    Exit;
  end;

  if Pos(OriginalCmd, sBuffers.Text) = 0 then
    Result := False
  else
  begin
    for j := 0 to sBuffers.Count - 1 do
      if AnsiStartsStr(OriginalCmd, sBuffers[j]) then
      begin
        Result := True;
        sBuffer := sBuffers[j];
        Break;
      end;

    ReturnVal := ExtractParameter(sBuffer);
  end;
end;


// **********************************************************************
// 等待端口的信息返回 OK 或 ERROR
// [in]     TimeOut 等待时间
// [return] 是否成功
// **********************************************************************
function WaitingForReturn(TimeOut: Cardinal = 5000): Boolean;
var
  strCurrent: String;
begin
  Result := False;

  if not Connected then
    Exit;

  while TimeOut > 1 do
  begin
    Application.ProcessMessages;

    if sBuffers.Count > 0 then
      strCurrent := sBuffers[sBuffers.Count - 1];

    if (strCurrent = 'OK') then
    begin
      Result := True;
//      ConnectionLost := False;
      varLastCommResult.ResultType := lartSuccess;
      Exit;
    end
    else if (strCurrent = 'ERROR') then
    begin
//      ConnectionLost := False;
      AddModemStaus(tsError, '有错误发生 (Modem 返回 ERROR)');
      varLastCommResult.ResultType := lartError;
      Exit;
    end
    else if (AnsiStartsStr('+CMS ERROR:', strCurrent)) then
    begin
//      ConnectionLost := False;
      AddModemStaus(tsError, '有错误发生 (网关返回 CMS ERROR)');
      varLastCommResult.ResultType := lartCMSError;
      Exit;
    end;

    Sleep(50);
    Dec(TimeOut, 50);
  end;

//  ConnectionLost := True;
  varLastCommResult.ResultType := lartTimeout;
  varLastCommResult.TimeOutcounter := TimeOut;
end;

function WaitingForInput(TimeOut: Cardinal = 5000): Boolean;
begin
  Result := False;

  if not Connected then
    Exit;

  while TimeOut > 1 do
  begin
    Application.ProcessMessages;

    if LeftStr(sBuffer, 1) = '>' then
    begin
      Result := True;
      Exit;
    end;  

    Sleep(50);
    Dec(TimeOut, 50);
  end;
end;

{// **********************************************************************
// 是否端口已经连接
// [return] 是否成功
// **********************************************************************
function Connected: Boolean;
begin
  Result := (frmMain.stbMain.Panels[2].PanelStyle as TdxStatusBarTextPanelStyle).ImageIndex = 9;
end;}

// **********************************************************************
// 打开端口
// [return] 是否成功
// **********************************************************************
function OpenPort(Port: String = ''): Boolean;
begin
  try
    if Connected then frmMain.cmModem.StopComm;
    AddModemStaus(tsInfo, '尝试打开端口 ' + Port);
    if Length(Port) > 0 then frmMain.cmModem.CommName := Port;
    sBuffers.Clear;
    sBuffer := '';
    frmMain.cmModem.StartComm;
    Result := True;
    Connected := True;
    StaticIcon := 1;
    frmMain.dxbtnReceive.Enabled := True;
    frmMain.dxbtnSend.Enabled := True;
    frmMain.dxbtnSync.Enabled := True;
    frmMain.dxmnuFileConnect.Enabled := False;
    frmMain.dxmnuFileDisconnect.Enabled := True;
    frmMain.dxmnuSMSReceive.Enabled := True;
    frmMain.dxmnuSMSCycleNew.Enabled := True;
    frmMain.dxmnuSMSSend.Enabled := True;
    frmMain.dxmnuPBookPhone.Enabled := True;
    frmMain.dxmnuSMSAutoReceive.Enabled := True;
    frmMain.dxmnuSMSSendSel.Enabled := (frmMain.CurrentView = cvSend)
      and (frmMain.vstSMS.SelectedCount > 0);
    frmMain.dxbtnAutoReceive.Enabled := True;
    frmMain.popTrayDisconnect.Enabled := True;
    frmMain.popTrayConnect.Enabled := False;
    frmMain.popTrayReceive.Enabled := True;
    frmMain.popTraySend.Enabled := True;
    frmMain.popTraySnycPhoneBook.Enabled := True;
    frmMain.dxmnuSMSDelPhone.Enabled := True;
    frmMain.dxmnuSMSRemoveSMS.Enabled := True;
    frmMain.dxmnuToolPhoneState.Enabled := True;
    frmMain.dxmnuToolTime.Enabled := True;
    frmMain.ctiMain.Hint := Application.Title + ' (已连接)';
    frmMain.stbMain.Panels[2].Text := Port + ' 已打开';
    (frmMain.stbMain.Panels[2].PanelStyle as TdxStatusBarTextPanelStyle).ImageIndex := 9;
    AddModemStaus(tsInfo, '成功打开端口 ' + Port);
    Sleep(opConnectWating);
    if JobThread.JobContent.Count > 0 then JobThread.Suspended := False;
  except
    AddModemStaus(tsError, '打开端口 ' + Port + ' 失败');
    Result := False;
    Connected := False;
    StaticIcon := 0;
  end;
end;

// **********************************************************************
// 打开端口默认
// [return] 是否成功
// **********************************************************************
function OpenPortDef: Boolean;
var
  Port: String;
  IMEI: String;
begin
  try
    Port := PortList.PortList[PortList.Index];
    frmMain.cmModem.CommName := Port;
    if Connected then frmMain.cmModem.StopComm;
    frmMain.cmModem.StartComm;
    Connected := True;
    AddModemStaus(tsInfo, '尝试打开端口 ' + Port);

    Sleep(opConnectWating);

    // 测试连接状态
    sBuffers.Clear;
    SendCommand('ATE0');
    if not WaitingForReturn then
    begin
      AddModemStaus(tsError, '打开端口 ' + Port + ' 失败');
      frmMain.cmModem.StopComm;
      Result := False;
      Connected := False;
      StaticIcon := 0;

      if PortList.PortList.Count >= 2 then
        PortList.Index := (PortList.Index + 1) mod (Cardinal(PortList.PortList.Count));

      Exit;
    end;  

    // 测试 IMEI
    sBuffers.Clear;
    SendCommand('AT+CGSN');
    if not WaitingForReturn then
    begin
      AddModemStaus(tsError, '获取 IMEI 失败');
      frmMain.cmModem.StopComm;
      Result := False;
      Connected := False;
      StaticIcon := 0;

      if PortList.PortList.Count >= 2 then
        PortList.Index := (PortList.Index + 1) mod (Cardinal(PortList.PortList.Count));

      Exit;
    end;

    IMEI := ExtractPhoneNumber(ExtractParameter(sBuffers[0]));

//    {$I Encode_Start.inc}
    frmMain.RefreshIMEI(IMEI);
//    {$I Encode_End.inc}    

    frmMain.dxbtnReceive.Enabled := True;
    frmMain.dxbtnSend.Enabled := True;
    frmMain.dxbtnSync.Enabled := True;
    frmMain.dxmnuFileConnect.Enabled := False;
    frmMain.dxmnuFileDisconnect.Enabled := True;
    frmMain.dxmnuSMSReceive.Enabled := True;
    frmMain.dxmnuSMSCycleNew.Enabled := True;
    frmMain.dxmnuSMSSend.Enabled := True;
    frmMain.dxmnuPBookPhone.Enabled := True;
    frmMain.dxmnuSMSAutoReceive.Enabled := True;
    frmMain.dxbtnAutoReceive.Enabled := True;
    frmMain.dxmnuSMSSendSel.Enabled := (frmMain.CurrentView = cvSend)
      and (frmMain.vstSMS.SelectedCount > 0);
    frmMain.popTrayDisconnect.Enabled := True;
    frmMain.popTrayConnect.Enabled := False;
    frmMain.popTrayReceive.Enabled := True;
    frmMain.popTraySend.Enabled := True;
    frmMain.popTraySnycPhoneBook.Enabled := True;
    frmMain.dxmnuSMSDelPhone.Enabled := True;
    frmMain.dxmnuSMSRemoveSMS.Enabled := True;
    frmMain.stbMain.Panels[2].Text := Port + ' 已打开';
    (frmMain.stbMain.Panels[2].PanelStyle as TdxStatusBarTextPanelStyle).ImageIndex := 9;
    frmMain.ctiMain.Hint := Application.Title + ' (已连接)';
    frmMain.dxmnuToolPhoneState.Enabled := True;
    frmMain.dxmnuToolTime.Enabled := True;
    AddModemStaus(tsInfo, '成功打开端口 ' + Port);
    if JobThread.JobContent.Count > 0 then JobThread.Suspended := False;

    if AutoReceive then
    begin
      AutoReceive := False;
      frmMain.dxbtnAutoReceiveClick(nil);
    end;

    if opQSAutoQueryState then
    begin
      frmMain.dxmnuToolPhoneState.Click;
      frmMain.tmrQueryState.Enabled := True;
    end;

    Result := True;
    StaticIcon := 1;
  except
    AddModemStaus(tsError, '打开端口 ' + Port + ' 失败');
    Result := False;
    Connected := False;
    StaticIcon := 0;

    if PortList.PortList.Count >= 2 then
      PortList.Index := (PortList.Index + 1) mod (Cardinal(PortList.PortList.Count));
  end;
end;

// **********************************************************************
// 关闭端口
// [return] 是否成功
// **********************************************************************
function ClosePort(SuspendJob: Boolean = True): Boolean;
begin
  try
    if Connected then
      frmMain.cmModem.StopComm;
    frmMain.stbMain.Panels[2].Text := frmMain.cmModem.CommName + ' 已关闭';
    (frmMain.stbMain.Panels[2].PanelStyle as TdxStatusBarTextPanelStyle).ImageIndex := 10;
    AddModemStaus(tsInfo, '成功关闭端口 ' + frmMain.cmModem.CommName);
    Result := True;
    frmMain.dxbtnReceive.Enabled := False;
    frmMain.dxbtnSend.Enabled := False;
    frmMain.dxbtnSync.Enabled := False;
    frmMain.dxmnuFileConnect.Enabled := True;
    frmMain.dxmnuFileDisconnect.Enabled := False;
    frmMain.dxmnuSMSReceive.Enabled := False;
    frmMain.dxmnuSMSCycleNew.Enabled := False;
    frmMain.dxmnuSMSSend.Enabled := False;
    frmMain.dxmnuPBookPhone.Enabled := False;
    frmMain.dxmnuSMSAutoReceive.Enabled := False;
    frmMain.dxbtnAutoReceive.Enabled := False;
    frmMain.dxmnuSMSAutoReceive.Down := False;
    frmMain.dxbtnAutoReceive.Down := False;
    frmMain.dxmnuSMSSendSel.Enabled := False;
    frmMain.popTrayDisconnect.Enabled := False;
    frmMain.popTrayConnect.Enabled := True;
    frmMain.popTrayReceive.Enabled := False;
    frmMain.popTraySend.Enabled := False;
    frmMain.popTraySnycPhoneBook.Enabled := False;
    frmMain.dxmnuSMSDelPhone.Enabled := False;
    frmMain.dxmnuSMSRemoveSMS.Enabled := False;
    frmMain.dxmnuToolPhoneState.Enabled := False;
    frmMain.dxmnuToolTime.Enabled := False;
    frmMain.tmrQueryNewSMS.Enabled := False;
    frmMain.tmrQueryState.Enabled := False;
    Connected := False;
    StaticIcon := 0;
    frmMain.ctiMain.Hint := Application.Title + ' (未连接)';
    frmMain.ShowTrayAnimation(False, jkSend);
    if SuspendJob then JobThread.Suspended := True;    
  except
    Result := False;
  end;
end;

procedure TfrmMain.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

procedure TfrmMain.cmModemReceiveData(Sender: TObject; Buffer: Pointer;
  BufferLength: Word);
var
  str :string;
  iPos: Cardinal;
  jbQueryNew: TSMSJob;
  params: TStringList;
begin
  //获得一些内容
  SetLength(Str,BufferLength);
  move(buffer^,pchar(@Str[1])^,bufferlength);
  sBuffer := sBuffer + str;

  // 分析受到的数据
  iPos := Pos(#13#10, sBuffer);

  while iPos > 0 do
  begin
    if iPos > 1 then
    begin
      str := LeftStr(sBuffer, iPos - 1);
      //sBuffers.Add(str);
      AddModemStaus(tsDownload, str);

      // 分析自动接收的信息
      if cmModem.Tag = 1 then
      begin
        cmModem.Tag := 0;
        NewSmsReport(str);
      end
      else if AnsiStartsText('+CMTI:', str) then
      begin
        params := ExtractAllParameter(str);
        jbQueryNew := JobThread.JobContent.AddTop(jkQueryNew);
        jbQueryNew.QueryID := StrToInt(params[1]);
        jbQueryNew.Destination := params[0];
        JobThread.Suspended := False;
        params.Free;
      end
      else if AnsiStartsText('+CDS', str) then
        cmModem.Tag := 1
      else
        sBuffers.Add(str);
    end;

    Delete(sBuffer, 1, iPos + 1);
    iPos := Pos(#13#10, sBuffer);
  end;
end;

procedure TfrmMain.FConnectDB(TryCount: Integer = 0; ALastPass: string = '');
var
  ADlgPassword: TPasswordDlg;
  sFileName, sMSG: String;
begin
  sPass := ALastPass;

  try
    sFileName := AppendPath(sPath, 'settings.mdb');
    adoSettings.Close;
    adoSettings.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Data Source=' + sFileName +
      ';Persist Security Info=False';
    if Length(sPass) > 0 then
      adoSettings.ConnectionString := adoSettings.ConnectionString
        + ';Jet OLEDB:Database Password=' + sPass;
    adoSettings.Open;

    sFileName := AppendPath(sPath, 'contact.mdb');
    adoContacts.Close;
    adoContacts.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Data Source=' + sFileName +
      ';Persist Security Info=False';
    if Length(sPass) > 0 then
      adoContacts.ConnectionString := adoContacts.ConnectionString
        + ';Jet OLEDB:Database Password=' + sPass;
    adoContacts.Open;

    sFileName := AppendPath(sPath, 'sms.mdb');
    adoSMS.Close;
    adoSMS.ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Data Source=' + sFileName +
      ';Persist Security Info=False';
    if Length(sPass) > 0 then
      adoSMS.ConnectionString := adoSMS.ConnectionString
        + ';Jet OLEDB:Database Password=' + sPass;
    adoContacts.Open;
  except
    on E: Exception do
    begin
      if E is EOleException then
        if (E as EOleException).ErrorCode = -2147217843 then
        begin
          Inc(TryCount);

          if TryCount > 1 then
            MessageBox(Handle,
              PChar(Format('您输入你密码无效，您最多还有 ' +
              IntToStr(6 - TryCount) + ' 次机会输入密码。',
              [])), PChar(Forms.Application.Title), MB_OK + MB_ICONSTOP);

          if TryCount = 5 then
            TerminateProcess(GetCurrentProcess, 0);

          ADlgPassword := TPasswordDlg.Create(nil);
          if ADlgPassword.GetPassword(sPass) then
          begin
            FConnectDB(TryCount, sPass);
            Exit;
          end
          else
          begin
            TerminateProcess(GetCurrentProcess, 0);
            Exit;
          end;
        end;

      sMSG := Format('无法连接数据库，请确认该数据库存在并且没有被其他程序所使用。%s%s', [#10#13, sFileName]);
      MessageBox(Handle, PChar(sMSG), PChar(self.Caption), MB_ICONSTOP);
      TerminateProcess(GetCurrentProcess, 0);
      Exit;
    end;
  end;
end;
// **********************************************************************
//  初始化窗体并现在启动欢迎界面
// **********************************************************************
procedure TfrmMain.FormCreate(Sender: TObject);
const
  KEY_CRYPTO_FILE:String = #$C3#$92#$3B#$DC#$10#$7C#$14#$5E +
                           #$AA#$35#$CD#$85#$6B#$0B#$FD#$29 +
                           #$0C#$10#$1A#$CD#$F4#$1E#$37#$C3 +
                           #$FA#$7F#$09#$98#$CD#$EC#$83#$A9;
  KEY_CRYPTO_FILEITEM:String = #$FF#$C5#$B7#$E5#$FE#$BB#$C8;
  KEY_CRYPTO_REGISTRY:String = #$83#$93#$F4#$AF#$57#$02#$B4#$FD +
                               #$C6#$C0#$33#$25#$E9#$C8#$97#$DD +
                               #$B0#$4A#$18#$A1#$48#$E0#$2A#$46 +
                               #$8B#$F6#$2D#$29#$45#$2E#$94#$80;
var
  sBarLayout: String;
  sBarStream: TStream;
  tbTable: TADOTable;
  //dQuery: TADOQuery;
  i: Integer;
  xItem: TListItem;
  sStrings: TStringList;
  frmSplash: TfrmSplash;
  bFirst: Boolean;
{$IFDEF REGISTERED}
  sFileItem: String;
  sFileSplitPos: Integer;
  slFileList: TStringList;
  sMemory: TMemoryStream;
  sCsumFile: TFileStream;
  sFileName, sFileMD5, sFileActMD5: string;
{$ENDIF}  
  tvwSelIdx: Integer;
  adoTest: TADOTable;
begin
  SetWindowIcon(Handle, IDI_BMAINFORM, IDI_SMAINFORM);

{$IFNDEF REGISTERED}
  //dxconRegStatue.Visible := ivNever;
  dxmnuHelpShowReg.Visible := ivNever;
{$ENDIF}

  MessageReference := 0;
  MsgRefIDMap := DGL_Integer.TIntMap.Create;

  {$IFDEF BETA}
  if Now > EncodeDate(2009, 1, 1) then
  begin
    MessageBox(Handle, '这个程序的试用期已过，请下载新版本。',
      PChar(Application.Title), MB_OK + MB_ICONINFORMATION);
    dxmnuHelpWebsite.Click;
    TerminateProcess(GetCurrentProcess, 0);
  end;
{$ENDIF}  

{$IFNDEF DEBUG}
  Forms.Application.OnException := aeDefaultException;
{$ELSE}
  Self.Caption := Self.Caption + ' (Debug Version)';
{$ENDIF}

  frmSplash := TfrmSplash.Create(Self);
  if not FindCmdLineSwitch('NOSPLASH') then
    frmSplash.Show;

  // 创建一些变量
  frmSplash.UpdateProgress('创建内部变量');
  sBuffers := TStringList.Create;
  MessageWnd := TNotices.Create;
  vstSMS.NodeDataSize := SizeOf(TShortMessageEntry);

  // 开始作业线程
  JobThread := TJobThread.Create(True);
  AFindSession := TSMSFind.Create(True);

  // 添加到窗口列表中
  xItem := lvwWindow.Items.Add;
  xItem.ImageIndex := 0;
  xItem.Data := Pointer(Handle);
  xItem.Caption := Caption;

  // 分析路径
  sPath := ExtractFilePath(ParamStr(0));

{$IFDEF REGISTERED}
{$IFNDEF DEBUG}  
{$IFNDEF BETA}
  // 检查文件校验
  {$I CodeReplace_Start.inc}

  if FileExists(AppendPath(sPath, 'file.db')) and 
    FileExists(AppendPath(sPath, 'reginfo.db')) then
  begin
    slFileList := TStringList.Create;
    sMemory := TMemoryStream.Create;
    sCsumFile := TFileStream.Create(AppendPath(sPath, 'file.db'), fmOpenRead);

    // 解码 file.db
    AES.DecryptStream(sCsumFile, KEY_CRYPTO_FILE, TStream(sMemory), kb256);
    slFileList.LoadFromStream(sMemory);

    // 如果没有条目就表示不正常
    if slFileList.Count < 3 then
      ShowExitMesaage('校验文件没有正常的条目。')
    else
      // 校验每一个条目
      for i := 0 to slFileList.Count - 1 do
      begin
        sFileItem := DES.DecryStrHex(slFileList[i], KEY_CRYPTO_FILEITEM);

        sFileSplitPos := Pos('|', sFileItem);
        sFileName := LeftStr(sFileItem, sFileSplitPos - 1);
        sFileMD5 := RightStr(sFileItem, Length(sFileItem) - sFileSplitPos);

        // 校验 MD5
        HashFile(HASH_MD5, AppendPath(sPath, sFileName), sFileActMD5);

        if not SameText(sFileActMD5, sFileMD5) then
          ShowExitMesaage('文件校验错误: ' + sFileName);
      end;

    // 删除证据
    slFileList.Free;
    sMemory.Free;
    sCsumFile.Free;
  end
  else
    ShowExitMesaage('必要的文件校验文件不存在，请确认所下载的是完整的文件。');

  {$I CodeReplace_End.inc}  
{$ENDIF}
{$ENDIF}

  if Application.Terminated = True then Exit;
{$ENDIF}  

  // 加载界面方案
  frmSplash.UpdateProgress('加载界面元素');
  sBarLayout := AppendPath(sPath, 'ultrasms.bar');

  msWriteSMS := TMemoryStream.Create;
  msReadSMS := TMemoryStream.Create;
  msPrintDlg := TMemoryStream.Create;
//  msWriteDocking := TMemoryStream.Create;

  if FileExists(AppendPath(sPath, 'writesms.bar')) then
    msWriteSMS.LoadFromFile(AppendPath(sPath, 'writesms.bar'));

  if FileExists(AppendPath(sPath, 'readsms.bar')) then
    msReadSMS.LoadFromFile(AppendPath(sPath, 'readsms.bar'));

  if FileExists(AppendPath(sPath, 'prntprw.bar')) then
    msPrintDlg.LoadFromFile(AppendPath(sPath, 'prntprw.bar'));

//  if FileExists(AppendPath(sPath, 'writesms.dck')) then
//    msWriteDocking.LoadFromFile(AppendPath(sPath, 'writesms.dck'));

  if FileExists(sBarLayout) then
  begin
    sBarStream := TFileStream.Create(sBarLayout, fmOpenRead);
    dxbmMain.LoadFromStream(sBarStream);
    dxmnuViewToolbar.Down := dxbmMain.BarByOldName('Toolbar').Visible;
    dxmnuViewStatusbar.Down := stbMain.Visible;
    dxmnuViewTBRFolder.Down := dxbmMain.BarByOldName('FolderToolbar').Visible;
    dxmnuViewTBRPBokk.Down := dxbmMain.BarByOldName('PBookToolbar').Visible;
    dxmnuViewTBRModem.Down := dxbmMain.BarByOldName('ModemToolbar').Visible;
    dxmnuViewTBRJob.Down := dxbmMain.BarByOldName('JobToolbar').Visible;
    dxmnuViewTBRWindow.Down := dxbmMain.BarByOldName('WindowToolbar').Visible;
    dxmnuViewSplit.Down := dxbmMain.BarByOldName('SplitView').Visible;
    sBarStream.Free;
  end;

  dxbmMain.BarByOldName('ModemCmd').Visible := FindCmdLineSwitch('MODEMCMD');

  sBarLayout := AppendPath(sPath, 'ultrasms.dck');
  if FileExists(sBarLayout) then
  begin
    sBarStream := TFileStream.Create(sBarLayout, fmOpenRead);
    dxdmFloatWindows.LoadLayoutFromStream(sBarStream);
    FUpdateViewMenu;
    sBarStream.Free;
  end;

  // 如果没有数据库则创建数据库
  if not (FileExists(AppendPath(sPath, 'settings.mdb')) and
    FileExists(AppendPath(sPath, 'contact.mdb')) and
    FileExists(AppendPath(sPath, 'sms.mdb'))) then
  begin
    frmSplash.UpdateProgress('创建数据库');
    RunAppTillEnd(AppendPath('"' + sPath, 'DBUTLY.EXE" /SKIPINTROPAGE /QUIET /CREATEDATABASE'));
  end;

{$IFDEF REGISTERED}
  // 写入注册表信息
//  {$I CodeReplace_Start.inc}
  GlobalRegStatus := GRS_UNKNOWN;
  CreateRegInfo(KEY_CRYPTO_REGISTRY);
//  {$I CodeReplace_End.inc}
{$ENDIF}  

  // 创建电话的信息的条目
  for i := 0 to 4 do
  begin
    lvwPhoneInfo.Items.Add;
    lvwPhoneInfo.Items[i].ImageIndex := i;
    lvwPhoneInfo.Items[i].SubItems.Add('');
  end;

  lvwPhoneInfo.Items[0].Caption := '手机国际标识符(IMEI)';
  lvwPhoneInfo.Items[1].Caption := '移动用户识别码(IMSI)';
  lvwPhoneInfo.Items[2].Caption := '手机软件';
  lvwPhoneInfo.Items[3].Caption := '短信中心号码';
  lvwPhoneInfo.Items[4].Caption := '本机号码';

  // 打开设置数据库
  frmSplash.UpdateProgress('打开数据库');
  FConnectDB(0, EncodePassword(sNullPassword));

  // 是否需要更新数据库
  adoTest := TADOTable.Create(nil);
  adoTest.Connection := adoSMS;
  adoTest.TableName := 'receive';
  adoTest.Open;

  if adoTest.FindField('hash') = nil then
  begin
    adoTest.Close;
    adoTest.Free;
    frmSplash.UpdateProgress('更新数据库');
    RunAppTillEnd(AppendPath('"' + sPath, 'DBUTLY.EXE" ' + sPass + ' /SKIPINTROPAGE /UPDATEDB'));
  end
  else
  begin
    adoTest.Close;
    adoTest.Free;
  end;

  sPass := '';

  frmSplash.UpdateProgress('读取用户设置');
  tbTable := TADOTable.Create(nil);
  tbTable.Connection := adoSettings;
  tbTable.TableName := 'interface';
  tbTable.Open;

  if StrToBool(GetProperty(tbTable, 'MainMaximized' , '0')) then
    WindowState := wsMaximized
  else
    SetWindowPos(Handle, 0,
      StrToInt(GetProperty(tbTable, 'MainLeft', '100')),
      StrToInt(GetProperty(tbTable, 'MainTop', '100')),
      StrToInt(GetProperty(tbTable, 'MainWidth', '775')),
      StrToInt(GetProperty(tbTable, 'MainHeight', '640')), 0);

  FLastStatus := WindowState;

  // 读取关于设置的变量
  opAutoReconnect := StrToBool(GetProperty(tbTable, 'AutoReconnect', '1'));
  opCallbackInterval := StrToInt(GetProperty(tbTable, 'CallbackInterval', '2000'));
  opConnectWating := StrToInt(GetProperty(tbTable, 'ConnectWating', '1000'));
  opConnnectTimeout := StrToInt(GetProperty(tbTable, 'ConnnectTimeout', '10000'));
  opStartConnect := StrToBool(GetProperty(tbTable, 'StartConnect', '0'));
  opTaskInterval := StrToInt(GetProperty(tbTable, 'TaskInterval', '2000'));
  opAutoRead := StrToInt(GetProperty(tbTable, 'AutoRead', '5000'));
  opGlobalHotKey := StrToBool(GetProperty(tbTable, 'GlobalHotKey', '0'));
  opShowNewMSG := StrToBool(GetProperty(tbTable, 'ShowNewMSG', '1'));
  opShowReg := StrToBool(GetProperty(tbTable, 'ShowReg', '1'));
  opShowNoFullScreen := StrToBool(GetProperty(tbTable, 'ShowNoFullScreen', '0'));
  opShowFocus := StrToBool(GetProperty(tbTable, 'ShowFocus', '0'));
  opDelMessage := StrToBool(GetProperty(tbTable, 'DelMessage', '0'));
  opDelDraft := StrToBool(GetProperty(tbTable, 'DelDraft', '0'));
  opRepliedReceive := StrToBool(GetProperty(tbTable, 'RepliedReceive', '0'));
  opValidityPeriod := StrToInt(GetProperty(tbTable, 'ValidityPeriod', '255'));
  opSplittedPage :=  StrToBool(GetProperty(tbTable, 'SplittedPage', '1'));
  opSPSortAsc :=  StrToBool(GetProperty(tbTable, 'SPSortAsc', '0'));
  opSPSortType :=  StrToInt(GetProperty(tbTable, 'SPSortType', '2'));
  opSPItemCount :=  StrToInt(GetProperty(tbTable, 'SPItemCount', '100'));
  opQSAutoQueryState :=  StrToBool(GetProperty(tbTable, 'QSAutoQueryState', '1'));
  opQSAutoDisconnect :=  StrToBool(GetProperty(tbTable, 'QSAutoDisconnect', '1'));
  opQSBattery :=  StrToBool(GetProperty(tbTable, 'QSBattery', '1'));
  opQSSignal :=  StrToBool(GetProperty(tbTable, 'QSSignal', '1'));
  opQSInterval :=  StrToInt(GetProperty(tbTable, 'QSInterval', '60'));
  opQSAlert := StrToInt(GetProperty(tbTable, 'QSAlert', '10'));
  opDCRestart :=  StrToBool(GetProperty(tbTable, 'QSRestart', '0'));
  opDCReconnect :=  StrToBool(GetProperty(tbTable, 'DCReconnect', '1'));
  opDCReconTime :=  StrToInt(GetProperty(tbTable, 'DCReconTime', '10'));
  opDCReconInterval :=  StrToInt(GetProperty(tbTable, 'DCReconInterval', '5000'));
  opIScmgl :=  StrToInt(GetProperty(tbTable, 'IScmgl', '0'));
  opShowTrayIcon :=  StrToBool(GetProperty(tbTable, 'ShowTrayIcon', '1'));
  opFromPhonebook := StrToBool(GetProperty(tbTable, 'FromPhonebook', '1'));
  opLocalTime := StrToBool(GetProperty(tbTable, 'LocalTime', '1'));
  opReceiveReportOnlyNew := StrToBool(GetProperty(tbTable, 'ReceiveReportOnlyNew', '1'));
  opQueryNewModel := StrToInt(GetProperty(tbTable, 'QueryNewModel', '1'));
  opDeleteReport := StrToBool(GetProperty(tbTable, 'DeleteReport', '1'));
  tmrQueryState.Interval := opQSInterval * 1000;
  TemplateFolder := GetProperty(tbTable, 'TemplateFolder', AppendPath(sPath, 'Template'));

  opRMKeepType := StrToInt(GetProperty(tbTable, 'RMKeepType', '0'));
  opRMKeepNumber := StrToInt(GetProperty(tbTable, 'RMKeepNumber', '30'));
  opRMKeepPercent := StrToInt(GetProperty(tbTable, 'RMKeepPercent', '50'));
  opRMKeepDay := StrToInt(GetProperty(tbTable, 'RMKeepDay', '7'));
  opRMKeepDate := StrToDateDef(GetProperty(tbTable, 'RMKeepDate', '2008-01-01'), Date);
  opRMHandleUNREAD := StrToBool(GetProperty(tbTable, 'RMHandleUNREAD', '0'));
  opRMHandleREAD := StrToBool(GetProperty(tbTable, 'RMHandleREAD', '1'));
  opRMHandleDraft := StrToBool(GetProperty(tbTable, 'RMHandleDraft', '0'));
  opRMHandleSent := StrToBool(GetProperty(tbTable, 'RMHandleSent', '1'));

  opLongSMS :=  StrToBool(GetProperty(tbTable, 'LongSMS', '0'));
  opSEPhoneBookUCS2 := StrToBool(GetProperty(tbTable, 'SEPhoneBookUCS2', '0'));
  opSEPhoneBookSuffix := StrToBool(GetProperty(tbTable, 'SEPhoneBookSuffix', '0'));
  opWritePhoneMemoy := StrToBool(GetProperty(tbTable, 'WritePhoneMemoy', '0'));

  opNWAlphaBlend := StrToBool(GetProperty(tbTable, 'NWAlphaBlend', '1'));
  opNWAlphaValue := StrToInt(GetProperty(tbTable, 'NWAlphaValue', '190'));

  rsWindowLeft := StrToInt(GetProperty(tbTable, 'rsWindowLeft', '325'));
  rsWindowTop := StrToInt(GetProperty(tbTable, 'rsWindowTop', '73'));
  rsWindowWidth := StrToInt(GetProperty(tbTable, 'rsWindowWidth', '700'));
  rsWindowHeight := StrToInt(GetProperty(tbTable, 'rsWindowHeight', '641'));
  rsWsMaximized := StrToBool(GetProperty(tbTable, 'rsMaximized', '0'));
  spWindowLeft := StrToInt(GetProperty(tbTable, 'spWindowLeft', '325'));
  spWindowTop := StrToInt(GetProperty(tbTable, 'spWindowTop', '73'));
  spWindowWidth := StrToInt(GetProperty(tbTable, 'spWindowWidth', '700'));
  spWindowHeight := StrToInt(GetProperty(tbTable, 'spWindowHeight', '641'));
  spWsMaximized := StrToBool(GetProperty(tbTable, 'spMaximized', '0'));
  wsWindowLeft := StrToInt(GetProperty(tbTable, 'wsWindowLeft', '325'));
  wsWindowTop := StrToInt(GetProperty(tbTable, 'wsWindowTop', '73'));
  wsWindowWidth := StrToInt(GetProperty(tbTable, 'wsWindowWidth', '700'));
  wsWindowHeight := StrToInt(GetProperty(tbTable, 'wsWindowHeight', '641'));
  wsWsMaximized := StrToBool(GetProperty(tbTable, 'wsMaximized', '0'));
  wsReport := StrToBool(GetProperty(tbTable, 'wsReport', '0'));
  wsAutoPrefix := StrToBool(GetProperty(tbTable, 'wsAutoPrefix', '1'));
  WndPercent := StrToFloat(GetProperty(tbTable, 'WndPercent', '0.5'));

  dxmnuViewSplitPage.Down := opSplittedPage;
  dxmnuSortAscending.Down := opSPSortAsc;
  dxmnuSortDescending.Down := not opSPSortAsc;
  dxmnuSortName.Down := opSPSortType = 0;
  dxmnuSortNumber.Down := opSPSortType = 1;
  dxmnuSortDate.Down := opSPSortType = 2;

  dxmnuPBookShowInfo.Down := StrToBool(GetProperty(tbTable, 'AutoShowContactInfo', '1'));

  // 读取各个热键的内容
  for i := 0 to HotKeyNumber do
    HotKeyList[i] := StrToInt(GetProperty(tbTable, 'GlobalHotKey' + IntToStr(i), '0'));
                 
  // 创建热键的消息
  RefreshHotKey;    

  // 界面 Dock 的设置
  if StrToBool(GetProperty(tbTable, 'DockFolder', '1')) then FShowDockPanel(dxdpFolder);
  if StrToBool(GetProperty(tbTable, 'DockPBook', '1')) then FShowDockPanel(dxdpPhonebook); 
  if StrToBool(GetProperty(tbTable, 'DockFilter', '0')) then FShowDockPanel(dxdpFilter);
  if StrToBool(GetProperty(tbTable, 'Dockfind', '0')) then FShowDockPanel(dxdpFind);
  if StrToBool(GetProperty(tbTable, 'DockPreview', '1')) then FShowDockPanel(dxdpMsgPreview);
  if StrToBool(GetProperty(tbTable, 'DockInfo', '0')) then FShowDockPanel(dxdpCellphone);
  if StrToBool(GetProperty(tbTable, 'DockModem', '0')) then FShowDockPanel(dxdpModem);
  if StrToBool(GetProperty(tbTable, 'DockJob', '0')) then FShowDockPanel(dxdpJob);
  if StrToBool(GetProperty(tbTable, 'DockWindow', '0')) then FShowDockPanel(dxdpWindow);

  // 表示从数据库中读取关于 Modem 的相关设置
  cmModem.BaudRate := StrToInt(GetProperty(tbTable, 'BaudRate', '9600'));
  cmModem.CommName := GetProperty(tbTable, 'CommName', 'NONE');
  cmModem.ByteSize := TByteSize(StrToInt(GetProperty(tbTable, 'ByteSize', '3')));
  cmModem.StopBits := TStopBits(StrToInt(GetProperty(tbTable, 'StopBits', '0')));
  cmModem.RtsControl := TRtsControl(StrToInt(GetProperty(tbTable, 'RtsControl', '1')));

  // 读取本机设置
  LoadConnectionSettings;

  // 设定 Port 集合
  PortList.Index := 0;
  PortList.PortList := SplitString(cmModem.CommName, STPortDelimiter, 0, True);

  stbMain.Panels[2].Text := cmModem.CommName + ' 已关闭';

  // 添加 ListView 标题栏的条目
  lvwPhonebook.Column[0].Width := StrToInt(GetProperty(tbTable, 'PhonebookCol0', '70'));
  lvwPhonebook.Column[1].Width := StrToInt(GetProperty(tbTable, 'PhonebookCol1', '95'));
  lvwPhoneInfo.Column[0].Width := StrToInt(GetProperty(tbTable, 'PhoneInfoCol0', '200'));
  lvwPhoneInfo.Column[1].Width := StrToInt(GetProperty(tbTable, 'PhoneInfoCol1', '340'));
  lvwModem.Column[0].Width := StrToInt(GetProperty(tbTable, 'ModemCol0', '75'));
  lvwModem.Column[1].Width := StrToInt(GetProperty(tbTable, 'ModemCol1', '150'));
  lvwModem.Column[2].Width := StrToInt(GetProperty(tbTable, 'ModemCol2', '250'));
  vstSMS.Header.Columns.Items[3].Width := StrToInt(GetProperty(tbTable, 'SMSCol3', '80'));
  vstSMS.Header.Columns.Items[4].Width := StrToInt(GetProperty(tbTable, 'SMSCol4', '80'));
  vstSMS.Header.Columns.Items[5].Width := StrToInt(GetProperty(tbTable, 'SMSCol5', '140'));
  vstSMS.Header.Columns.Items[6].Width := StrToInt(GetProperty(tbTable, 'SMSCol6', '180'));
  vstSMS.Header.SortColumn := StrToInt(GetProperty(tbTable, 'SMSSortColumn', '5'));
  vstSMS.Header.SortDirection := TSortDirection(StrToInt(GetProperty(tbTable, 'SMSSortDirection', '1')));
  SortSMSList;

  // 切换当前的视图
  AutoReceive := StrToBool(GetProperty(tbTable, 'AutoReceive', '1'));
  tvwSelIdx := StrToInt(GetProperty(tbTable, 'CurrentView', '0'));
  
  // 获得电话的信息
  tbTable.Close;
  tbTable.TableName := 'modem';
  tbTable.Open;
  lvwPhoneInfo.Items[0].SubItems[0] := GetProperty(tbTable, 'IMEI');
  lvwPhoneInfo.Items[1].SubItems[0] := GetProperty(tbTable, 'IMSI');
  lvwPhoneInfo.Items[2].SubItems[0] := GetProperty(tbTable, 'Software');
  lvwPhoneInfo.Items[3].SubItems[0] := GetProperty(tbTable, 'InfoCenter');
  lvwPhoneInfo.Items[4].SubItems[0] := GetProperty(tbTable, 'PhoneNumber');
  JobThread.InfoCenter := GetProperty(tbTable, 'InfoCenter');
  bFirst := Length(GetProperty(tbTable, 'IMEI')) = 0;
  tbTable.Close;

  // 获得打印预览窗体的默认属性
  tbTable.TableName := 'wnd_print';
  tbTable.Open;
  FPrintPropDef.FaceFont := GetPropertyFont(tbTable, 'Face');
  FPrintPropDef.ScaleMode := StrToInt(GetProperty(tbTable, 'ScaleMode', '1'));
  FPrintPropDef.ScalePercent := StrToInt(GetProperty(tbTable, 'ScalePercent', '100'));
  FPrintPropDef.ToolbarVisible := StrToBool(GetProperty(tbTable, 'ToolbarVisible', '-1'));
  FPrintPropDef.FormatbarVisible := StrToBool(GetProperty(tbTable, 'FormatbarVisible', '-1'));
  FPrintPropDef.StatusBarVisible := StrToBool(GetProperty(tbTable, 'StatusBarVisible', '-1'));
  FPrintPropDef.PrintContent := StrToInt(GetProperty(tbTable, 'PrintContent', '127'));

  FPrintPropDef.PageSetup.HeaderFont := GetPropertyFont(tbTable, 'Header');
  FPrintPropDef.PageSetup.HeaderFrame := StrToInt(GetProperty(tbTable, 'HeaderFrame', '1'));
  FPrintPropDef.PageSetup.HeaderMirror := StrToBool(GetProperty(tbTable, 'HeaderMirror', '-1'));
  FPrintPropDef.PageSetup.HeaderRoman := StrToBool(GetProperty(tbTable, 'HeaderRoman', '-1'));
  FPrintPropDef.PageSetup.HeaderLineColor := StrToInt(GetProperty(tbTable, 'HeaderLineColor', '0'));
  FPrintPropDef.PageSetup.HeaderShadeColor := StrToInt(GetProperty(tbTable, 'HeaderShadeColor', '$C0C0C0'));
  FPrintPropDef.PageSetup.Header := GetProperty(tbTable, 'Header', '');

  FPrintPropDef.PageSetup.FooterFont := GetPropertyFont(tbTable, 'Footer');
  FPrintPropDef.PageSetup.FooterFrame := StrToInt(GetProperty(tbTable, 'FooterFrame', '1'));
  FPrintPropDef.PageSetup.FooterMirror := StrToBool(GetProperty(tbTable, 'FooterMirror', '-1'));
  FPrintPropDef.PageSetup.FooterRoman := StrToBool(GetProperty(tbTable, 'FooterRoman', '-1'));
  FPrintPropDef.PageSetup.FooterLineColor := StrToInt(GetProperty(tbTable, 'FooterLineColor', '0'));
  FPrintPropDef.PageSetup.FooterShadeColor := StrToInt(GetProperty(tbTable, 'FooterShadeColor', '$C0C0C0'));
  FPrintPropDef.PageSetup.Footer := GetProperty(tbTable, 'Footer', '');

  FPrintPropDef.PageSetup.LineInMargin := StrToBool(GetProperty(tbTable, 'LineInMargin', '0'));
  FPrintPropDef.PageSetup.MarginBottom := StrToFloat(GetProperty(tbTable, 'MarginBottom', '25'));
  FPrintPropDef.PageSetup.MarginFooter := StrToFloat(GetProperty(tbTable, 'MarginFooter', '15'));
  FPrintPropDef.PageSetup.MarginGutter := StrToFloat(GetProperty(tbTable, 'MarginGutter', '0'));
  FPrintPropDef.PageSetup.MarginHeader := StrToFloat(GetProperty(tbTable, 'MarginHeader', '15'));
  FPrintPropDef.PageSetup.MarginHFInternal := StrToFloat(GetProperty(tbTable, 'MarginHFInternal', '0.5'));
  FPrintPropDef.PageSetup.MarginLeft := StrToFloat(GetProperty(tbTable, 'MarginLeft', '25'));
  FPrintPropDef.PageSetup.MarginLeftHFText := StrToFloat(GetProperty(tbTable, 'MarginLeftHFText', '2'));
  FPrintPropDef.PageSetup.MarginMirror := StrToBool(GetProperty(tbTable, 'MarginMirror', '0'));
  FPrintPropDef.PageSetup.MarginRight := StrToFloat(GetProperty(tbTable, 'MarginRight', '25'));
  FPrintPropDef.PageSetup.MarginRightHFText := StrToFloat(GetProperty(tbTable, 'MarginRightHFText', '2'));
  FPrintPropDef.PageSetup.MarginTop := StrToFloat(GetProperty(tbTable, 'MarginTop', '25'));
  FPrintPropDef.PageSetup.MarginUnit := StrToInt(GetProperty(tbTable, 'MarginUnit', '3'));

  FPrintPropDef.WndMaximized := StrToBool(GetProperty(tbTable, 'WndMaximized', '0'));
  FPrintPropDef.WndLeft := StrToInt(GetProperty(tbTable, 'WndLeft', '20'));
  FPrintPropDef.WndTop := StrToInt(GetProperty(tbTable, 'WndTop', '20'));
  FPrintPropDef.WndWidth := StrToInt(GetProperty(tbTable, 'WndWidth', '870'));
  FPrintPropDef.WndHeight := StrToInt(GetProperty(tbTable, 'WndHeight', '674'));

  tbTable.Close;

  // 读取筛选数据
  tbTable.TableName := 'filter';
  tbTable.Open;

  fraFilter.chkEnable.Checked := StrToBool(GetProperty(tbTable, 'Enabled', '0'));
  fraFilter.chkTimeFrom.Checked := StrToBool(GetProperty(tbTable, 'TimeFrom', '-1'));
  fraFilter.chkTimeTo.Checked := StrToBool(GetProperty(tbTable, 'TimeTo', '-1'));
  fraFilter.chkNameEnable.Checked := StrToBool(GetProperty(tbTable, 'NameEnable', '0'));
  fraFilter.chkNameNoName.Checked := StrToBool(GetProperty(tbTable, 'NameNoName', '0'));

  dxmnuEditFilterEnabled.Down := fraFilter.chkEnable.Checked;

  fraFilter.dtpTimeFrom.DateTime := Yesterday;
  fraFilter.dtpTimeTo.DateTime := Date;

  case StrToInt(GetProperty(tbTable, 'TimeSelect', '3')) of
    1: fraFilter.optTimeDisable.Checked := True;
    2: fraFilter.optTimeOneHour.Checked := True;
    3: fraFilter.optTimeToday.Checked := True;
    4: fraFilter.optTimeYesterday.Checked := True;
    5: fraFilter.optTimeBeforeYesterday.Checked := True;
    6: fraFilter.optTimeThisWeek.Checked := True;
    7: fraFilter.optTimeThisMonth.Checked := True;
    8: fraFilter.optTimeThisYear.Checked := True;
    9: fraFilter.optTimeCutsom.Checked := True;
  end;

  sStrings := TStringList.Create;
  sStrings.Text := GetProperty(tbTable, 'Names', '');

  tbTable.Close;

  for i := 0 to sStrings.Count - 1 do
  begin
    if Length(sStrings[i]) > 0 then
      fraFilter.lstName.AddItem(sStrings[i], 0);
  end;

  sStrings.Free;

//  fraFilter.Align := alClient;
  fraFilter.SetEnabledStatus(nil);
  fraFind.Align := alClient;
  fraFind.icbLocation.ItemIndex := 0;
  fraFind.dtpTimeAfter.DateTime := IncMonth(Now, -1); 

  // 读取联系人类别
  frmSplash.UpdateProgress('读取地址簿');
  RefreshCategory;

  // 版本控制
  VersionRoutine;

  // 打开自定义文件夹
  frmSplash.UpdateProgress('读取自定义文件夹');
  tbTable.Connection := adoSMS;
  tbTable.TableName := 'folder';
  tbTable.Open;

  while not tbTable.Eof do
  begin
    with tvwFolder.Items.AddChild(tvwFolder.Items[5], tbTable.FieldByName('folder').AsString) do
    begin
      //Caption := tbTable.FieldByName('folder').AsString;
    end;
    tbTable.Next;
  end;

  tvwFolder.Items[0].Expanded := True;
  tvwFolder.Items[5].Expanded := True;
  tvwFolder.Items[0].Selected := True;

  {dQuery.Close;
  dQuery.Free;}
  tbTable.Close;
  tbTable.Free;

  // 如果可能 连接手机
  if (opStartConnect or FindCmdLineSwitch('AUTOCONNECT')) and (not bFirst) then
  begin
    frmSplash.UpdateProgress('正在连接移动设备');
    OpenPortDef;
  end;

  if opShowTrayIcon then
    RefreshNewTray;

  ctiMain.IconVisible := True;
  FInitialized := True;
  FInternalEvent := False;
  frmSplash.Done;

  // 更新上次的位置
  if tvwFolder.Items.Count > tvwSelIdx then
    tvwFolder.Items[tvwSelIdx].Selected := True;
  RefreshView(nil);

  SetListViewStyleVista(lvwPhoneInfo);
  SetListViewStyleVista(lvwModem);
  SetListViewStyleVista(lvwJob);

  // 如果可能 提示连接手机
  if bFirst then
  begin
    if MessageBox(Handle,
      '您现在还没有成功连接过手机，是否现在打开连接向导？',
      PChar(Forms.Application.Title), MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      dxmnuFileConnectWizard.Click;
    end;
  end
  else
    RefreshIMEI(lvwPhoneInfo.Items[0].SubItems[0]);

  // 帮助的支持
  if FileExists(AppendPath(sPath, 'ultrasms.chm')) then
    Forms.Application.HelpFile := AppendPath(sPath, 'ultrasms.chm')
  else
  begin
    dxmnuHelpTopic.Enabled := False;
    dxmnuHelpIndex.Enabled := False;
    dxmnuHelpSearch.Enabled := False;
    dxmnuHelpBookmark.Enabled := False;
  end;

{$IFDEF REGISTERED}
  // 开始计时
  LastTickCount := GetTickCount div 1000;
{$ENDIF}    
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  // 释放内存
  sBuffers.Free;
  MsgRefIDMap.Free;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  sBarStream: TStream;
  sBarFile: String;
  tbTable: TADOTable;
  i: Integer;
  hWindow: HWND;
begin
  // 取消进程
  dxmnuJobCancelQueue.Click;
//  dxmnuJobCancelCurrent.Click;

  // 关闭线程
  JobThread.FreeOnTerminate := True;
  JobThread.Terminate;
//  JobThread.Free;
  AFindSession.Free;

  // 关闭端口
  if Connected = True then
    ClosePort(False);

  // 关闭其他窗口
  for i := 1 to lvwWindow.Items.Count - 1 do
  begin
    hWindow := LongWord(lvwWindow.Items[i].Data);
    Windows.PostMessage(hWindow, WM_MSG_CLOSEWND, 0, 0);
  end;

  // 保存数据到数据库中
  tbTable := TADOTable.Create(nil);
  tbTable.Connection := adoSettings;
  tbTable.TableName := 'interface';
  tbTable.Open;

  if (WindowState = wsMaximized) or ((FLastStatus = wsMaximized) and (WindowState = wsMinimized)) then
    SetProperty(tbTable, 'MainMaximized', BoolToStr(True))
  else
  begin
    SetProperty(tbTable, 'MainTop', IntToStr(Top));
    SetProperty(tbTable, 'MainLeft', IntToStr(Left));
    SetProperty(tbTable, 'MainWidth', IntToStr(Width));
    SetProperty(tbTable, 'MainHeight', IntToStr(Height));
    SetProperty(tbTable, 'MainMaximized', BoolToStr(False));
  end;

  Hide;

  // 保存用户数据
  sBarFile := AppendPath(sPath, 'ultrasms.bar');
  sBarStream := TFileStream.Create(sBarFile, fmCreate);
  dxbmMain.SaveToStream(sBarStream);
  sBarStream.Free;
  sBarFile := AppendPath(sPath, 'ultrasms.dck');
  sBarStream := TFileStream.Create(sBarFile, fmCreate);
  dxdmFloatWindows.SaveLayoutToStream(sBarStream);
  sBarStream.Free;

  msWriteSMS.SaveToFile(AppendPath(sPath, 'writesms.bar'));
  msReadSMS.SaveToFile(AppendPath(sPath, 'readsms.bar'));
  msPrintDlg.SaveToFile(AppendPath(sPath, 'prntprw.bar'));
//  msWriteDocking.SaveToFile(AppendPath(sPath, 'writesms.dck'));

  msWriteSMS.Free;
  msReadSMS.Free;
  msPrintDlg.Free;
//  msWriteDocking.Free;

  // 保存其他数据
  SetProperty(tbTable, 'AutoReconnect', BoolToStr(opAutoReconnect));
  SetProperty(tbTable, 'CallbackInterval', IntToStr(opCallbackInterval));
  SetProperty(tbTable, 'ConnnectTimeout', IntToStr(opConnnectTimeout));
  SetProperty(tbTable, 'ConnectWating', IntToStr(opConnectWating));
  SetProperty(tbTable, 'StartConnect', BoolToStr(opStartConnect));
  SetProperty(tbTable, 'TaskInterval', IntToStr(opTaskInterval));
  SetProperty(tbTable, 'AutoRead', IntToStr(opAutoRead));
  SetProperty(tbTable, 'GlobalHotKey', BoolToStr(opGlobalHotKey));
  SetProperty(tbTable, 'ShowNewMSG', BoolToStr(opShowNewMSG));
  SetProperty(tbTable, 'ShowFocus', BoolToStr(opShowFocus));
  SetProperty(tbTable, 'ShowReg', BoolToStr(opShowReg));
  SetProperty(tbTable, 'ShowNoFullScreen', BoolToStr(opShowNoFullScreen));
  SetProperty(tbTable, 'DelMessage', BoolToStr(opDelMessage));
  SetProperty(tbTable, 'DelDraft', BoolToStr(opDelDraft));
  SetProperty(tbTable, 'ValidityPeriod', IntToStr(opValidityPeriod));
  SetProperty(tbTable, 'SplittedPage', BoolToStr(opSplittedPage));
  SetProperty(tbTable, 'SPSortAsc', BoolToStr(opSPSortAsc));
  SetProperty(tbTable, 'SPSortType', IntToStr(opSPSortType));
  SetProperty(tbTable, 'QSAutoQueryState', BoolToStr(opQSAutoQueryState));
  SetProperty(tbTable, 'QSAutoDisconnect', BoolToStr(opQSAutoDisconnect));
  SetProperty(tbTable, 'QSBattery', BoolToStr(opQSBattery));
  SetProperty(tbTable, 'QSSignal', BoolToStr(opQSSignal));
  SetProperty(tbTable, 'QSInterval', IntToStr(opQSInterval));
  SetProperty(tbTable, 'QSAlert', IntToStr(opQSAlert));
  SetProperty(tbTable, 'DCReconTime', IntToStr(opDCReconTime));
  SetProperty(tbTable, 'DCReconInterval', IntToStr(opDCReconInterval));
  SetProperty(tbTable, 'DCRestart', BoolToStr(opDCRestart));
  SetProperty(tbTable, 'DCReconnect', BoolToStr(opDCReconnect));
  SetProperty(tbTable, 'IScmgl', IntToStr(opIScmgl));
  SetProperty(tbTable, 'TemplateFolder', TemplateFolder);
  SetProperty(tbTable, 'AutoShowContactInfo', BoolToStr(dxmnuPBookShowInfo.Down));
  SetProperty(tbTable, 'ShowTrayIcon', BoolToStr(opShowTrayIcon));
  SetProperty(tbTable, 'FromPhonebook', BoolToStr(opFromPhonebook));
  SetProperty(tbTable, 'LocalTime', BoolToStr(opLocalTime));
  SetProperty(tbTable, 'ReceiveReportOnlyNew', BoolToStr(opReceiveReportOnlyNew));
  SetProperty(tbTable, 'QueryNewModel', IntToStr(opQueryNewModel));
  SetProperty(tbTable, 'DeleteReport', BoolToStr(opDeleteReport));
  SetProperty(tbTable, 'RepliedReceive', BoolToStr(opRepliedReceive));

  SetProperty(tbTable, 'RMKeepType', IntToStr(opRMKeepType));
  SetProperty(tbTable, 'RMKeepNumber', IntToStr(opRMKeepNumber));
  SetProperty(tbTable, 'RMKeepPercent', IntToStr(opRMKeepPercent));
  SetProperty(tbTable, 'RMKeepDay', IntToStr(opRMKeepDay));
  SetProperty(tbTable, 'RMKeepDate', DateToStr(opRMKeepDate));
  SetProperty(tbTable, 'RMHandleUNREAD', BoolToStr(opRMHandleUNREAD));
  SetProperty(tbTable, 'RMHandleREAD', BoolToStr(opRMHandleREAD));
  SetProperty(tbTable, 'RMHandleDraft', BoolToStr(opRMHandleDraft));
  SetProperty(tbTable, 'RMHandleSent', BoolToStr(opRMHandleSent));

  SetProperty(tbTable, 'LongSMS', BoolToStr(opLongSMS));
  SetProperty(tbTable, 'SEPhoneBookUCS2', BoolToStr(opSEPhoneBookUCS2));
  SetProperty(tbTable, 'SEPhoneBookSuffix', BoolToStr(opSEPhoneBookSuffix));
  SetProperty(tbTable, 'WritePhoneMemoy', BoolToStr(opWritePhoneMemoy));

  SetProperty(tbTable, 'NWAlphaBlend', BoolToStr(opNWAlphaBlend));
  SetProperty(tbTable, 'NWAlphaValue', IntToStr(opNWAlphaValue));

  SetProperty(tbTable, 'rsWindowLeft', IntToStr(rsWindowLeft));
  SetProperty(tbTable, 'rsWindowTop', IntToStr(rsWindowTop));
  SetProperty(tbTable, 'rsWindowWidth', IntToStr(rsWindowWidth));
  SetProperty(tbTable, 'rsWindowHeight', IntToStr(rsWindowHeight));
  SetProperty(tbTable, 'rsWsMaximized', BoolToStr(rsWsMaximized));
  SetProperty(tbTable, 'spWindowLeft', IntToStr(spWindowLeft));
  SetProperty(tbTable, 'spWindowTop', IntToStr(spWindowTop));
  SetProperty(tbTable, 'spWindowWidth', IntToStr(spWindowWidth));
  SetProperty(tbTable, 'spWindowHeight', IntToStr(spWindowHeight));
  SetProperty(tbTable, 'spWsMaximized', BoolToStr(spWsMaximized));
  SetProperty(tbTable, 'wsWindowLeft', IntToStr(wsWindowLeft));
  SetProperty(tbTable, 'wsWindowTop', IntToStr(wsWindowTop));
  SetProperty(tbTable, 'wsWindowWidth', IntToStr(wsWindowWidth));
  SetProperty(tbTable, 'wsWindowHeight', IntToStr(wsWindowHeight));
  SetProperty(tbTable, 'wsWsMaximized', BoolToStr(wsWsMaximized));
  SetProperty(tbTable, 'wsReport', BoolToStr(wsReport));
  SetProperty(tbTable, 'wsAutoPrefix', BoolToStr(wsAutoPrefix));
  SetProperty(tbTable, 'WndPercent', FloatToStr(WndPercent));

  for i := 0 to HotKeyNumber do
    SetProperty(tbTable, 'GlobalHotKey' + IntToStr(i), IntToStr(HotKeyList[i]));

  SetProperty(tbTable, 'BaudRate', IntToStr(cmModem.BaudRate));
  SetProperty(tbTable, 'CommName', JoinStrings(PortList.PortList, STPortDelimiter));
  SetProperty(tbTable, 'ByteSize', IntToStr(Integer(cmModem.ByteSize)));
  SetProperty(tbTable, 'StopBits', IntToStr(Integer(cmModem.StopBits)));
  SetProperty(tbTable, 'RtsControl', IntToStr(Integer(cmModem.RtsControl)));

  SetProperty(tbTable, 'PhonebookCol0', IntToStr(lvwPhonebook.Column[0].Width));
  SetProperty(tbTable, 'PhonebookCol1', IntToStr(lvwPhonebook.Column[1].Width));
  SetProperty(tbTable, 'PhoneInfoCol0', IntToStr(lvwPhoneInfo.Column[0].Width));
  SetProperty(tbTable, 'PhoneInfoCol1', IntToStr(lvwPhoneInfo.Column[1].Width));
  SetProperty(tbTable, 'ModemCol0', IntToStr(lvwModem.Column[0].Width));
  SetProperty(tbTable, 'ModemCol1', IntToStr(lvwModem.Column[1].Width));
  SetProperty(tbTable, 'ModemCol2', IntToStr(lvwModem.Column[2].Width));
  SetProperty(tbTable, 'SMSCol3', IntToStr(vstSMS.Header.Columns.Items[3].Width));
  SetProperty(tbTable, 'SMSCol4', IntToStr(vstSMS.Header.Columns.Items[4].Width));
  SetProperty(tbTable, 'SMSCol5', IntToStr(vstSMS.Header.Columns.Items[5].Width));
  SetProperty(tbTable, 'SMSCol6', IntToStr(vstSMS.Header.Columns.Items[6].Width));
  SetProperty(tbTable, 'SMSSortColumn', IntToStr(vstSMS.Header.SortColumn));
  SetProperty(tbTable, 'SMSSortDirection', IntToStr(Integer(vstSMS.Header.SortDirection)));
  SetProperty(tbTable, 'AutoReceive', BoolToStr(AutoReceive));
  SetProperty(tbTable, 'DockFolder', BoolToStr(FDockShowing(dxdpFolder)));
  SetProperty(tbTable, 'DockPBook', BoolToStr(FDockShowing(dxdpPhonebook)));
  SetProperty(tbTable, 'DockFilter', BoolToStr(FDockShowing(dxdpFilter)));
  SetProperty(tbTable, 'Dockfind', BoolToStr(FDockShowing(dxdpFind)));
  SetProperty(tbTable, 'DockPreview', BoolToStr(FDockShowing(dxdpMsgPreview)));
  SetProperty(tbTable, 'DockInfo', BoolToStr(FDockShowing(dxdpCellphone)));
  SetProperty(tbTable, 'DockModem', BoolToStr(FDockShowing(dxdpModem)));
  SetProperty(tbTable, 'DockJob', BoolToStr(FDockShowing(dxdpJob)));
  SetProperty(tbTable, 'DockWindow', BoolToStr(FDockShowing(dxdpWindow)));

  if Assigned(tvwFolder.Selected) then
    SetProperty(tbTable, 'CurrentView', IntToStr(tvwFolder.Selected.AbsoluteIndex))
  else
    SetProperty(tbTable, 'CurrentView', IntToStr(0));

  tbTable.Close;

  // 保存 Modem 的信息
  tbTable.TableName := 'modem';
  tbTable.Open;
  SetProperty(tbTable, 'IMEI', lvwPhoneInfo.Items[0].SubItems[0]);
  SetProperty(tbTable, 'IMSI', lvwPhoneInfo.Items[1].SubItems[0]);
  SetProperty(tbTable, 'Software', lvwPhoneInfo.Items[2].SubItems[0]);
  SetProperty(tbTable, 'InfoCenter', lvwPhoneInfo.Items[3].SubItems[0]);
  SetProperty(tbTable, 'PhoneNumber', lvwPhoneInfo.Items[4].SubItems[0]);
  SetProperty(tbTable, 'BaudRate', IntToStr(cmModem.BaudRate));
  SetProperty(tbTable, 'CommName', cmModem.CommName);
  SetProperty(tbTable, 'ByteSize', IntToStr(Integer(cmModem.ByteSize)));
  SetProperty(tbTable, 'StopBits', IntToStr(Integer(cmModem.StopBits)));
  SetProperty(tbTable, 'RtsControl', IntToStr(Integer(cmModem.RtsControl)));
  tbTable.Close;

  // 设置打印预览窗体的默认属性
  tbTable.TableName := 'wnd_print';
  tbTable.Open;

  SetPropertyFont(tbTable, 'Face', FPrintPropDef.FaceFont);
  SetProperty(tbTable, 'ScaleMode', IntToStr(FPrintPropDef.ScaleMode));
  SetProperty(tbTable, 'ScalePercent', IntToStr(FPrintPropDef.ScalePercent));
  SetProperty(tbTable, 'ToolbarVisible', BoolToStr(FPrintPropDef.ToolbarVisible));
  SetProperty(tbTable, 'FormatbarVisible', BoolToStr(FPrintPropDef.FormatbarVisible));
  SetProperty(tbTable, 'StatusBarVisible', BoolToStr(FPrintPropDef.StatusBarVisible));
  SetProperty(tbTable, 'PrintContent', IntToStr(FPrintPropDef.PrintContent));

  SetPropertyFont(tbTable, 'Header', FPrintPropDef.PageSetup.HeaderFont);
  SetProperty(tbTable, 'HeaderFrame', IntToStr(FPrintPropDef.PageSetup.HeaderFrame));
  SetProperty(tbTable, 'HeaderMirror', BoolToStr(FPrintPropDef.PageSetup.HeaderMirror));
  SetProperty(tbTable, 'HeaderRoman', BoolToStr(FPrintPropDef.PageSetup.HeaderRoman));
  SetProperty(tbTable, 'HeaderLineColor', IntToStr(FPrintPropDef.PageSetup.HeaderLineColor));
  SetProperty(tbTable, 'HeaderShadeColor', IntToStr(FPrintPropDef.PageSetup.HeaderShadeColor));
  SetProperty(tbTable, 'Header', FPrintPropDef.PageSetup.Header);

  SetPropertyFont(tbTable, 'Footer', FPrintPropDef.PageSetup.FooterFont);
  SetProperty(tbTable, 'FooterFrame', IntToStr(FPrintPropDef.PageSetup.FooterFrame));
  SetProperty(tbTable, 'FooterMirror', BoolToStr(FPrintPropDef.PageSetup.FooterMirror));
  SetProperty(tbTable, 'FooterRoman', BoolToStr(FPrintPropDef.PageSetup.FooterRoman));
  SetProperty(tbTable, 'FooterLineColor', IntToStr(FPrintPropDef.PageSetup.FooterLineColor));
  SetProperty(tbTable, 'FooterShadeColor', IntToStr(FPrintPropDef.PageSetup.FooterShadeColor));
  SetProperty(tbTable, 'Footer', FPrintPropDef.PageSetup.Footer);

  SetProperty(tbTable, 'LineInMargin', BoolToStr(FPrintPropDef.PageSetup.LineInMargin));
  SetProperty(tbTable, 'MarginBottom', FloatToStr(FPrintPropDef.PageSetup.MarginBottom));
  SetProperty(tbTable, 'MarginFooter', FloatToStr(FPrintPropDef.PageSetup.MarginFooter));
  SetProperty(tbTable, 'MarginGutter', FloatToStr(FPrintPropDef.PageSetup.MarginGutter));
  SetProperty(tbTable, 'MarginHeader', FloatToStr(FPrintPropDef.PageSetup.MarginHeader));
  SetProperty(tbTable, 'MarginHFInternal', FloatToStr(FPrintPropDef.PageSetup.MarginHFInternal));
  SetProperty(tbTable, 'MarginLeft', FloatToStr(FPrintPropDef.PageSetup.MarginLeft));
  SetProperty(tbTable, 'MarginLeftHFText', FloatToStr(FPrintPropDef.PageSetup.MarginLeftHFText));
  SetProperty(tbTable, 'MarginMirror', BoolToStr(FPrintPropDef.PageSetup.MarginMirror));
  SetProperty(tbTable, 'MarginRight', FloatToStr(FPrintPropDef.PageSetup.MarginRight));
  SetProperty(tbTable, 'MarginRightHFText', FloatToStr(FPrintPropDef.PageSetup.MarginRightHFText));
  SetProperty(tbTable, 'MarginTop', FloatToStr(FPrintPropDef.PageSetup.MarginTop));
  SetProperty(tbTable, 'MarginUnit', IntToStr(FPrintPropDef.PageSetup.MarginUnit));

  SetProperty(tbTable, 'WndMaximized', BoolToStr(FPrintPropDef.WndMaximized));
  SetProperty(tbTable, 'WndLeft', IntToStr(FPrintPropDef.WndLeft));
  SetProperty(tbTable, 'WndTop', IntToStr(FPrintPropDef.WndTop));
  SetProperty(tbTable, 'WndWidth', IntToStr(FPrintPropDef.WndWidth));
  SetProperty(tbTable, 'WndHeight', IntToStr(FPrintPropDef.WndHeight));

  tbTable.Close;

  // 保存筛选记录
  tbTable.TableName := 'filter';
  tbTable.Open;   

  SetProperty(tbTable, 'Enabled', BoolToStr(fraFilter.chkEnable.Checked));
  SetProperty(tbTable, 'TimeFrom', BoolToStr(fraFilter.chkTimeFrom.Checked));
  SetProperty(tbTable, 'TimeTo', BoolToStr(fraFilter.chkTimeTo.Checked));
  SetProperty(tbTable, 'NameEnable', BoolToStr(fraFilter.chkNameEnable.Checked));
  SetProperty(tbTable, 'NameNoName', BoolToStr(fraFilter.chkNameNoName.Checked));

  SetProperty(tbTable, 'Names', fraFilter.lstName.Items.Text);

  if fraFilter.optTimeDisable.Checked then SetProperty(tbTable, 'TimeSelect', '1');
  if fraFilter.optTimeOneHour.Checked then SetProperty(tbTable, 'TimeSelect', '2');
  if fraFilter.optTimeToday.Checked then SetProperty(tbTable, 'TimeSelect', '3');
  if fraFilter.optTimeYesterday.Checked then SetProperty(tbTable, 'TimeSelect', '4');
  if fraFilter.optTimeBeforeYesterday.Checked then SetProperty(tbTable, 'TimeSelect', '5');
  if fraFilter.optTimeThisWeek.Checked then SetProperty(tbTable, 'TimeSelect', '6');
  if fraFilter.optTimeThisMonth.Checked then SetProperty(tbTable, 'TimeSelect', '7');
  if fraFilter.optTimeThisYear.Checked then SetProperty(tbTable, 'TimeSelect', '8');
  if fraFilter.optTimeCutsom.Checked then SetProperty(tbTable, 'TimeSelect', '9');

  tbTable.Free;

  // 删除临时文件
  if FileExists(IntroPath) then
    DeleteFile(IntroPath);

{$IFDEF REGISTERED}
  // 保存注册信息
  SetTodayTime;
{$ENDIF}

  // 终止进程
  ctiMain.IconVisible := False;
  ctiNewMessage.IconVisible := False;

  adoSettings.Close;
  adoContacts.Close;
  adoSMS.Close;

  TerminateProcess(GetCurrentProcess, 0);
end;

procedure TfrmMain.dxmnuFileConnectWizardClick(Sender: TObject);
begin
  if Connected = True then
    if MessageBox(Handle, 
      '在您更改连接设置之前必须先断开连接，是否现在断开连接？',
      PChar(Forms.Application.Title), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) =
      IDYES then
      ClosePort
    else
      Exit;


  // 开始连接向导
  with TwizConnect.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.dxmnuFileConnectClick(Sender: TObject);
var
  i: Cardinal;
begin
  tmrReconnect.Enabled := False;
  if (not SameText(cmModem.CommName, 'NONE')) and (PortList.PortList.Count > 0) then
  begin
    PortList.Index := 0;
    i := PortList.PortList.Count;

    while i > 0 do
      if OpenPortDef then
        Break
      else
        Dec(i);
  end
  else
    case MessageBox(Handle, '您好像还没有设置过连接参数，是否现在打开连接向导？' + 
      #13#10#13#10 + '* 选择“是”，打开连向导' + #13#10 +
      '* 选择“否”，直接打开连接设置' + #13#10 + '* 选择“取消”，取消连接', 
      PChar(Caption), MB_YESNOCANCEL + MB_ICONINFORMATION) of
      IDYES: dxmnuFileConnectWizard.Click;
      IDNO: dxmnuFileConnectSettings.Click;
    end;
      
end;

procedure TfrmMain.dxmnuFileDisconnectClick(Sender: TObject);
begin
  if JobThread.JobContent.Count > 0 then
    if MessageBox(Handle, '正在有作业进行，您确实要断开吗？', 'Ultra SMS',
      MB_YESNO or MB_ICONQUESTION	or MB_DEFBUTTON2) = IDNO then
      Exit;
//  tmrQueryNew.Enabled := False;
  tmrReconnect.Enabled := False;
  ClosePort;
end;

procedure TfrmMain.dxbtnConnectClick(Sender: TObject);
begin
  if Connected = True then
    dxmnuFileDisconnectClick(nil)
  else
    dxmnuFileConnectClick(nil);
end;

procedure TfrmMain.cbeCategorySelect(Sender: TObject);
var
  dQuery: TADOQuery;
  xItem: TListItem;
  sPinyin: String;
  bPinyinEnabled: Boolean;
  sName: String;
begin
  // 打开电话簿
  lvwPhonebook.Clear;
  sPinyin := txtPinyin.Text;
  bPinyinEnabled := Length(sPinyin) <> 0;
  dQuery := TADOQuery.Create(nil);
  dQuery.Connection := adoContacts;
  dQuery.SQL.Add('SELECT [contact].[name], [contact].[phonenumber]');
  dQuery.SQL.Add('FROM [contact]');

  if cbeCategory.ItemsEx[cbeCategory.ItemIndex].ImageIndex = 1 then
    dQuery.SQL.Add('WHERE ((([contact].[category]) IS NULL))')
  else if cbeCategory.ItemsEx[cbeCategory.ItemIndex].ImageIndex = 0 then
    dQuery.SQL.Add(Format('WHERE ((([contact].[category])=%s))',
      [QuotedStr(cbeCategory.Items[cbeCategory.ItemIndex])]));

  dQuery.SQL.Add('ORDER BY [name] ASC;');
  dQuery.Open;

  lvwPhonebook.Items.BeginUpdate;

  while not dQuery.Eof do
  begin
    sName := dQuery.FieldByName('name').AsString;

    if (not bPinyinEnabled) or
      (IsSimpleSpellingMatchCaseInsensitive(PAnsiChar(sName), PAnsiChar(sPinyin)) <> 0) then
    begin
      xItem := lvwPhonebook.Items.Add;
      xItem.Caption := dQuery.FieldByName('name').AsString;
      xItem.SubItems.Add(dQuery.FieldByName('phonenumber').AsString);
      xItem.ImageIndex := 2;
    end;

    dQuery.Next;
  end;

  lvwPhonebook.Items.EndUpdate;

  if lvwPhonebook.Items.Count > 0 then
    lvwPhonebook.Items[0].Selected := True;

  dQuery.Close;
  dQuery.Free;

  dxmnuPBookDelCategory.Enabled := cbeCategory.ItemsEx[cbeCategory.ItemIndex].ImageIndex = 0;
  dxmnuPBookEditCategory.Enabled := cbeCategory.ItemsEx[cbeCategory.ItemIndex].ImageIndex = 0;
end;

procedure TfrmMain.dxmnuFileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.lvwJobCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  i: Integer;
begin
  // 绘制背景颜色
  if (Item <> nil) and (Word(State) > 0) then
  begin
    i := Item.ImageIndex;

    if i = 1 then
      Sender.Canvas.Brush.Color := $00C4FCFC
    else
      Sender.Canvas.Brush.Color := $FFFFFF;

    Sender.Canvas.FillRect(Item.DisplayRect(drBounds));
  end;
end;

procedure TfrmMain.dxmnuPBookPhoneClick(Sender: TObject);
{$IFDEF REGISTERED}
var
  bExiting: Boolean;
{$ENDIF}  
begin
{$IFDEF REGISTERED}
  bExiting := False;

//  {$I Encode_Start.inc}
  if SameText(GlobalRegStatus, GRS_EXCEEDED) then
  begin
    MessageBox(Handle, '您的 Ultra SMS 的程序试用期已过，不能读取电话簿。',
      PChar(Caption), MB_OK + MB_ICONWARNING);
    bExiting := True;
  end;
//  {$I Encode_End.inc}

  if bExiting then Exit;
{$ENDIF}  

  // 读取联系人
  JobThread.JobContent.AddReadPhonebBook;
  if JobThread.Suspended then JobThread.Suspended := False;
end;

procedure TfrmMain.dxmnuSMSReceiveClick(Sender: TObject);
var
  bExiting: Boolean;
begin
  bExiting := False;

{$IFDEF REGISTERED}
  // 接收已读取的信息
//  {$I Encode_Start.inc}
  if (SameText(GlobalRegStatus, GRS_UNREGISTERED)) and (GetAllCount(adoSMS) > 400) then
  begin
    MessageBox(Handle,
      '您的 Ultra SMS 的程序是试用期版本或者已经过期，数据库容量为400条。',
      PChar(Caption), MB_OK + MB_ICONWARNING);
    bExiting := True;
  end
  else if SameText(GlobalRegStatus, GRS_EXCEEDED) then
    begin
      MessageBox(Handle,
        '您的 Ultra SMS 的程序试用期已过，不过不能读取手机中的短信。',
        PChar(Caption), MB_OK + MB_ICONWARNING);
      bExiting := True;
    end;
//  {$I Encode_End.inc}
{$ENDIF}

  if bExiting then
    Exit;

  JobThread.JobContent.AddReceiveJob;
  if JobThread.Suspended then JobThread.Suspended := False;
end;

procedure TfrmMain.tvwFolderChange(Sender: TObject; Node: TTreeNode);
begin
  if FInitialized then
  begin
    RefreshView(nil);
    UpdateView;
    FCalcCount;
  end;
end;

procedure TfrmMain.vstSMSGetText(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType;
  var CellText: WideString);
var
  pData: PShortMessageEntry;
begin
  // 获取文本的地方
  pData := Sender.GetNodeData(Node);

  case Column of
    3: CellText := pData.Sender;
    4: CellText := pData.PhoneNumber;
    5: CellText := DateTimeToStr(pData.DateTime);
    6: CellText := pData.Content;
  end;

  if (Column = 3) or (Column = 4) then
    if pData.MessageCount > 1 then
      CellText := '<多方发送>'
    else if pData.MessageCount = 0 then
      CellText := '<未指定>';

  if (Column = 6) and (CurrentView = cvReceive) then
    if pData.MessageReport then
      CellText := '<消息报告>';
end;

procedure TfrmMain.vstSMSHeaderClick(Sender: TVTHeader;
  HitInfo: TVTHeaderHitInfo);
begin
  // 排序
  if (hhiOnColumn in HitInfo.HitPosition) and (HitInfo.Column > -1) then
  begin
    if vstSMS.Header.SortColumn = HitInfo.Column then
      if vstSMS.Header.SortDirection = sdAscending then
         vstSMS.Header.SortDirection := sdDescending
      else
         vstSMS.Header.SortDirection := sdAscending
    else
      vstSMS.Header.SortColumn := HitInfo.Column;

    SortSMSList;
  end;    
end;

procedure TfrmMain.vstSMSGetImageIndexEx(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Kind: TVTImageKind; Column: TColumnIndex;
  var Ghosted: Boolean; var ImageIndex: Integer;
  var ImageList: TCustomImageList);
var
  pData: PShortMessageEntry;
begin
  // 获取图片
  pData := Sender.GetNodeData(Node);

  if Column = 7 then
    ImageList := iltSMSNew
  else
    ImageList := iltSMS;

  case Column of
    0: ImageIndex := IfThen(pData.Read, 1, 0);
    1: ImageIndex := IfThen(pData.Replied, 2, -1);
    2: ImageIndex := IfThen(pData.Transmitted, 3, -1);
    7: ImageIndex := IfThen(pData.PhoneClient, 1, 0);
  end;
end;

procedure TfrmMain.vstSMSCompareNodes(Sender: TBaseVirtualTree; Node1,
  Node2: PVirtualNode; Column: TColumnIndex; var Result: Integer);
var
  pData1: PShortMessageEntry;
  pData2: PShortMessageEntry;
begin
  // 比较大小
  pData1 := Sender.GetNodeData(Node1);
  pData2 := Sender.GetNodeData(Node2);

  case Column of
    3: Result := AnsiCompareText(pData1.Sender, pData2.Sender);
    4: Result := AnsiCompareText(pData1.PhoneNumber, pData2.PhoneNumber);
    5:
      if pData1.DateTime > pData2.DateTime then
        Result := 1
      else if pData1.DateTime > pData2.DateTime then
        Result := 0
      else
        Result := -1;
    6: Result := AnsiCompareText(pData1.Content, pData2.Content);
  end;
end;

procedure TfrmMain.vstSMSPaintText(Sender: TBaseVirtualTree;
  const TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  TextType: TVSTTextType);
var
  xData: PShortMessageEntry;
begin
  // 如果是未读的信息 就要粗体绘制
  xData := Sender.GetNodeData(Node);

  if xData.Read = False then
    TargetCanvas.Font.Style := TargetCanvas.Font.Style + [fsBold]
  else
    TargetCanvas.Font.Style := TargetCanvas.Font.Style - [fsBold];

  // 如果是很多人发送就是显示多方发送
  if (Column = 3) or (Column = 4) then
    if xData.MessageCount <> 1 then
      TargetCanvas.Font.Color := clGrayText;

  // 如果是消息报告则绘制绿色字体
  if (xData.MessageReport) and (CurrentView = cvReceive) then
  begin
    TargetCanvas.Font.Color := IfThen((vsSelected in Node.States) and (vstSMS.Focused), $00FFEBCB, $00DB8700);
  end;
end;

procedure TfrmMain.vstSMSFocusChanged(Sender: TBaseVirtualTree;
  Node: PVirtualNode; Column: TColumnIndex);
var
  pData: PShortMessageEntry;
begin
  // 现实预览
  pData := Sender.GetNodeData(Node);
  if not Assigned(pData) then Exit;

  // 如果是多行的数据就从数据库中读取相关的信息
  fraInfoPreview.ShowMessageDetail(pData.InternalID, CurrentView);

  // 如果是未读的
  tmrReadInfo.Interval := 0;

  if pData.Read = False then
  begin
    tmrReadInfo.Tag := Integer(pData);
    tmrReadInfo.Interval := opAutoRead;
  end;

  // 更是视图
  UpdateView;
  FCalcCount;
  dxmnuFileOpen.Enabled := True;
end;

procedure TfrmMain.SortSMSList;
begin
  vstSMS.Header.Columns[3].ImageIndex := -1;
  vstSMS.Header.Columns[4].ImageIndex := -1;
  vstSMS.Header.Columns[5].ImageIndex := -1;
  vstSMS.Header.Columns[6].ImageIndex := -1;
  vstSMS.Header.Columns[3].Color := clWindow;
  vstSMS.Header.Columns[4].Color := clWindow;
  vstSMS.Header.Columns[5].Color := clWindow;
  vstSMS.Header.Columns[6].Color := clWindow;
  vstSMS.Header.Columns[vstSMS.Header.SortColumn].Color := $00F7F7F7;

  if vstSMS.Header.SortDirection = sdAscending then
    vstSMS.Header.Columns[vstSMS.Header.SortColumn].ImageIndex := 0
  else
    vstSMS.Header.Columns[vstSMS.Header.SortColumn].ImageIndex := 1;

  vstSMS.SortTree(vstSMS.Header.SortColumn, vstSMS.Header.SortDirection, False);
end;
procedure TfrmMain.tmrReadInfoTimer(Sender: TObject);
var
  dbReceive: TADOTable;
  pData: PShortMessageEntry;
begin
  pData := Pointer(tmrReadInfo.Tag);
  dbReceive := TADOTable.Create(nil);

  try
    dbReceive.Connection := adoSMS;
    dbReceive.TableName := 'receive';
    dbReceive.Open;

    try
      if dbReceive.Locate('receivedate;sendernumber', VarArrayOf([pData.DateTime, pData.PhoneNumber]), []) then
      begin
        dbReceive.Edit;
        dbReceive.FieldByName('read').AsBoolean := True;
        dbReceive.Post;
      end;
    except
      ;
    end;

    dbReceive.Close;

  finally
    dbReceive.Free;
    pData.Read := True;
    vstSMS.RepaintNode(vstSMS.FocusedNode);    
  end;

  tmrReadInfo.Interval := 0;

  if opShowTrayIcon then
    RefreshNewTray;

end;

procedure TfrmMain.dxmnuSMSNewClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // 创建一个新的撰写短信的窗口
  wWriteSMSWnd := TfrmWriteSMS.Create(nil);
  xItem := lvwWindow.Items.Add;
  xItem.ImageIndex := 1;
  xItem.Data := Pointer(wWriteSMSWnd.Handle);
  xItem.SubItems.Add('draft');
  xItem.SubItems.Add('0');
  xItem.Caption := '撰写短信';
  wWriteSMSWnd.NewSMS;
//  wWriteSMSWnd.BringToFront;
  SetForegroundWindow(wWriteSMSWnd.Handle);
end;                                                

procedure TfrmMain.dxmnuViewToolbarClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('Toolbar').Visible := dxmnuViewToolbar.Down;
end;

procedure TfrmMain.dxmnuViewStatusbarClick(Sender: TObject);
begin
  stbMain.Visible := dxmnuViewStatusbar.Down;
end;

procedure TfrmMain.dxmnuViewFolderClick(Sender: TObject);
begin
  FShowDockPanel(dxdpFolder);
end;

procedure TfrmMain.dxmnuViewPhonebookClick(Sender: TObject);
begin
  FShowDockPanel(dxdpPhonebook);
end;

procedure TfrmMain.dxmnuViewFilterClick(Sender: TObject);
begin
  FShowDockPanel(dxdpFilter);
end;

procedure TfrmMain.dxmnuViewFindClick(Sender: TObject);
begin
  FShowDockPanel(dxdpFind);
end;

procedure TfrmMain.dxmnuViewPreviewClick(Sender: TObject);
begin
  FShowDockPanel(dxdpMsgPreview);
end;

// 判断浮动窗口是否在显示
function TfrmMain.FDockShowing(ADockPanel: TdxDockPanel): Boolean;
begin
  if Assigned(ADockPanel.TabContainer) then
    Result := (ADockPanel.TabContainer.ActiveChild = ADockPanel)
      and ADockPanel.Visible
  else
    Result := ADockPanel.Visible;
end;

// 显示浮动的窗口
procedure TfrmMain.FShowDockPanel(ADockPanel: TdxDockPanel);
begin
  {ADockPanel.Visible := True;
  if Assigned(ADockPanel.TabContainer) then
    ADockPanel.TabContainer.ActiveChild := ADockPanel;}
  ADockPanel.Activate;
  FUpdateViewMenu;
end;

// 根据不同的窗口看看更新菜单
procedure TfrmMain.FUpdateViewMenu;
begin
  dxmnuViewFolder.Down := FDockShowing(dxdpFolder);
  dxmnuViewPhonebook.Down := FDockShowing(dxdpPhonebook);
  dxmnuViewFind.Down := FDockShowing(dxdpFind);
  dxmnuViewFilter.Down := FDockShowing(dxdpFilter);
  dxmnuViewPreview.Down := FDockShowing(dxdpMsgPreview);
  dxmnuViewPhone.Down := FDockShowing(dxdpCellphone);
  dxmnuViewModem.Down := FDockShowing(dxdpModem);
  dxmnuViewJob.Down := FDockShowing(dxdpJob);
  dxmnuViewWnd.Down := FDockShowing(dxdpWindow);
end;
procedure TfrmMain.dxmnuViewPhoneClick(Sender: TObject);
begin
  FShowDockPanel(dxdpCellphone);
end;

procedure TfrmMain.dxmnuViewModemClick(Sender: TObject);
begin
  FShowDockPanel(dxdpModem);
end;

procedure TfrmMain.dxmnuViewJobClick(Sender: TObject);
begin
  FShowDockPanel(dxdpJob);
end;

procedure TfrmMain.dxmnuViewWndClick(Sender: TObject);
begin
  FShowDockPanel(dxdpWindow);
end;

procedure TfrmMain.dxdpFolderActivate(Sender: TdxCustomDockControl;
  Active: Boolean);
begin
  FUpdateViewMenu;
end;

procedure TfrmMain.dxdpFolderClose(Sender: TdxCustomDockControl);
begin
  FUpdateViewMenu;
end;

procedure TfrmMain.lvwWindowSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  // 查看选择项目
  if lvwWindow.SelCount = 0 then
  begin
    btnShow.Enabled := Item.ImageIndex > 0;
    btnClose.Enabled := False;
    btnMinimized.Enabled := False;
    btnMaximized.Enabled := False;
  end
  else
  begin
    btnShow.Enabled := True;
    btnClose.Enabled := True;
    btnMinimized.Enabled := True;
    btnMaximized.Enabled := True;
  end;

end;

procedure TfrmMain.lvwWindowDblClick(Sender: TObject);
begin
  if lvwWindow.SelCount > 0 then btnShow.Click;
end;

procedure TfrmMain.btnShowClick(Sender: TObject);
var
  hWindow: HWND;
  i: Integer;
begin
  for i := 0 to lvwWindow.Items.Count - 1 do
    if (lvwWindow.Items[i].Selected = True) and (lvwWindow.Items[i].ImageIndex > 0) then
    begin
      hWindow := Integer(lvwWindow.Items[i].Data);

      if IsIconic(hWindow) then
        Windows.ShowWindow(hWindow, SW_RESTORE)
      else
        SetForegroundWindow(hWindow);
        
      Windows.SetFocus(hWindow);
    end;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
var
  hWindow: HWND;
  i: Integer;
begin
  for i := 0 to lvwWindow.Items.Count - 1 do
    if (lvwWindow.Items[i].Selected = True) then
    begin
      hWindow := Integer(lvwWindow.Items[i].Data);
      //Windows.PostMessage(hWindow, WM_MSG_CLOSEWND, 0, 0);
      Windows.PostMessage(hWindow, WM_CLOSE, 0, 0);
      if lvwWindow.Items[i].ImageIndex = 0 then break;
    end;
end;

procedure TfrmMain.btnMinimizedClick(Sender: TObject);
var
  hWindow: HWND;
  i: Integer;
begin
  for i := 0 to lvwWindow.Items.Count - 1 do
    if lvwWindow.Items[i].Selected = True then
    begin
//      if lvwWindow.Items[i].ImageIndex = 0 then
//        Application.Minimize
//      else
      begin
        hWindow := Integer(lvwWindow.Items[i].Data);
        PostMessage(hWindow, WM_SYSCOMMAND, SC_MINIMIZE, 0);
      end;
    end;
end;

procedure TfrmMain.btnMaximizedClick(Sender: TObject);
var
  hWindow: HWND;
  i: Integer;
begin
  for i := 0 to lvwWindow.Items.Count - 1 do
    if (lvwWindow.Items[i].Selected = True) and (lvwWindow.Items[i].ImageIndex < 4) then
    begin
      hWindow := Integer(lvwWindow.Items[i].Data);
      Windows.ShowWindow(hWindow, SW_SHOWMAXIMIZED);
    end;
end;

procedure TfrmMain.FAPICloseWindow(var Message: TMessage);
begin
  Close;
end;

procedure TfrmMain.UpdateWndCaption(hWindow: HWND);
var
  i: Integer;
  TextBuf: String;
begin
  for i := 0 to lvwWindow.Items.Count - 1 do
  begin
    if LongWord(lvwWindow.Items[i].Data) = hWindow then
    begin
      SetLength(TextBuf, 1024);
      if Windows.GetWindowText(hWindow, PChar(TextBuf), 1024) > 0 then
        lvwWindow.Items[i].Caption := TextBuf;
      break;
    end;
  end;
end;

procedure TfrmMain.UpdateWndID(hWindow: HWND; InternalID: Integer);
var
  i: Integer;
begin
  for i := 0 to lvwWindow.Items.Count - 1 do
  begin
    if LongWord(lvwWindow.Items[i].Data) = hWindow then
    begin
      lvwWindow.Items[i].SubItems[1] := IntToStr(InternalID);
      break;
    end;
  end;
end;

procedure TfrmMain.DeleteWnd(hWindow: HWND);
var
  i: Integer;
begin
  for i := 0 to lvwWindow.Items.Count - 1 do
  begin
    if LongWord(lvwWindow.Items[i].Data) = hWindow then
    begin
      lvwWindow.Items.Delete(i);
      break;
    end;
  end;
end;

procedure TfrmMain.UpdateView;
var
  bSelItem: Boolean;
begin
  bSelItem := vstSMS.SelectedCount > 0;

  case CurrentView of
    cvReceive:
    begin
      dxmnuFilePrint.Enabled := bSelItem;
      dxmnuEditCopy.Enabled := bSelItem;
      dxmnuEditDelete.Enabled := bSelItem;
      dxmnuEditMoveTo.Enabled := bSelItem;
      dxmnuSMSReplay.Enabled := bSelItem;
      dxmnuSMSReplaySel.Enabled := bSelItem;
      dxmnuSMSTransmit.Enabled := bSelItem;
      dxmnuSMSResend.Enabled := False;
      dxmnuSMSSender.Enabled := bSelItem;
      dxmnuSMSRead.Enabled := bSelItem;
      dxmnuSMSUnread.Enabled := bSelItem;
      dxmnuSMSProperty.Enabled := bSelItem;
      dxmnuSMSSendSel.Enabled := False;
      dxmnuSMSUntransmitted.Enabled := bSelItem;
      dxmnuSMSTransmitted.Enabled := bSelItem;
      dxmnuSMSReplied.Enabled := bSelItem;
      dxmnuSMSUnreplied.Enabled := bSelItem;

      dxbtnReply.Enabled := bSelItem;
      dxbtnTransmit.Enabled := bSelItem;
      dxbtnDeleteSMS.Enabled := bSelItem;
    end;
    cvSend:
    begin
      dxmnuFilePrint.Enabled := bSelItem;
      dxmnuEditCopy.Enabled := bSelItem;
      dxmnuEditDelete.Enabled := bSelItem;
      dxmnuEditMoveTo.Enabled := False;
      dxmnuSMSReplay.Enabled := False;
      dxmnuSMSReplaySel.Enabled := False;
      dxmnuSMSTransmit.Enabled := False;
      dxmnuSMSResend.Enabled := False;
      dxmnuSMSSender.Enabled := bSelItem;
      dxmnuSMSRead.Enabled := False;
      dxmnuSMSUnread.Enabled := False;
      dxmnuSMSProperty.Enabled := bSelItem;
      dxmnuSMSSendSel.Enabled := bSelItem and Connected;
      dxmnuSMSUntransmitted.Enabled := False;
      dxmnuSMSTransmitted.Enabled := False;
      dxmnuSMSReplied.Enabled := False;
      dxmnuSMSUnreplied.Enabled := False;

      dxbtnReply.Enabled := False;
      dxbtnTransmit.Enabled := False;
      dxbtnDeleteSMS.Enabled := bSelItem;
    end;
    cvFinish:
    begin
      dxmnuFilePrint.Enabled := bSelItem;
      dxmnuEditCopy.Enabled := bSelItem;
      dxmnuEditDelete.Enabled := bSelItem;
      dxmnuEditMoveTo.Enabled := False;
      dxmnuSMSReplay.Enabled := False;
      dxmnuSMSReplaySel.Enabled := False;
      dxmnuSMSTransmit.Enabled := bSelItem;
      dxmnuSMSResend.Enabled := False;
      dxmnuSMSSender.Enabled := bSelItem;
      dxmnuSMSRead.Enabled := False;
      dxmnuSMSUnread.Enabled := False;
      dxmnuSMSProperty.Enabled := bSelItem;
      dxmnuSMSSendSel.Enabled := False;
      dxmnuSMSUntransmitted.Enabled := bSelItem;
      dxmnuSMSTransmitted.Enabled := bSelItem;
      dxmnuSMSReplied.Enabled := False;
      dxmnuSMSUnreplied.Enabled := False;

      dxbtnReply.Enabled := False;
      dxbtnTransmit.Enabled := bSelItem;
      dxbtnDeleteSMS.Enabled := bSelItem;
    end;
    cvDraft:
    begin
      dxmnuFilePrint.Enabled := bSelItem;
      dxmnuEditCopy.Enabled := bSelItem;
      dxmnuEditDelete.Enabled := bSelItem;
      dxmnuEditMoveTo.Enabled := False;
      dxmnuSMSReplay.Enabled := False;
      dxmnuSMSReplaySel.Enabled := False;
      dxmnuSMSTransmit.Enabled := False;
      dxmnuSMSResend.Enabled := False;
      dxmnuSMSSender.Enabled := False;
      dxmnuSMSRead.Enabled := False;
      dxmnuSMSUnread.Enabled := False;
      dxmnuSMSProperty.Enabled := bSelItem;
      dxmnuSMSSendSel.Enabled := False;
      dxmnuSMSUntransmitted.Enabled := False;
      dxmnuSMSTransmitted.Enabled := False;
      dxmnuSMSReplied.Enabled := False;
      dxmnuSMSUnreplied.Enabled := False;

      dxbtnReply.Enabled := False;
      dxbtnTransmit.Enabled := False;
      dxbtnDeleteSMS.Enabled := bSelItem;
    end;
    cvNone:
    begin
      dxmnuFilePrint.Enabled := False;
      dxmnuEditCopy.Enabled := False;
      dxmnuEditDelete.Enabled := False;
      dxmnuEditMoveTo.Enabled := False;
      dxmnuSMSReplay.Enabled := False;
      dxmnuSMSReplaySel.Enabled := False;
      dxmnuSMSTransmit.Enabled := False;
      dxmnuSMSResend.Enabled := False;
      dxmnuSMSSender.Enabled := False;
      dxmnuSMSRead.Enabled := False;
      dxmnuSMSUnread.Enabled := False;
      dxmnuSMSProperty.Enabled := False;
      dxmnuSMSSendSel.Enabled := False;
      dxmnuSMSUntransmitted.Enabled := False;
      dxmnuSMSTransmitted.Enabled := False;
      dxmnuSMSReplied.Enabled := False;
      dxmnuSMSUnreplied.Enabled := False;

      dxbtnReply.Enabled := False;
      dxbtnTransmit.Enabled := False;
      dxbtnDeleteSMS.Enabled := False;
    end;
  end;

  if CurrentView <> cvNone then
  begin  
    dxmnuViewSplitPage.Enabled := True;
    dxmnuViewFirstPage.Enabled := opSplittedPage and (FSPCurPage > 1);
    dxmnuViewPreviousPage.Enabled := opSplittedPage and (FSPCurPage > 1);
    dxicbCurrentPage.Enabled := opSplittedPage;
    dxmnuViewNextPage.Enabled := opSplittedPage and (FSPCurPage < FSPCntPage);
    dxmnuViewLastPage.Enabled := opSplittedPage and (FSPCurPage < FSPCntPage);
    dxmnuSortAscending.Enabled := opSplittedPage;
    dxmnuSortDescending.Enabled := opSplittedPage;
    dxmnuSortName.Enabled:= opSplittedPage;
    dxmnuSortNumber.Enabled:= opSplittedPage;
    dxmnuSortDate.Enabled := opSplittedPage;
  end
  else
  begin
    dxmnuViewSplitPage.Enabled := False;
    dxmnuViewFirstPage.Enabled := False;
    dxmnuViewPreviousPage.Enabled := False;
    dxicbCurrentPage.Enabled := False;
    dxmnuViewNextPage.Enabled := False;
    dxmnuViewLastPage.Enabled := False;
    dxmnuSortAscending.Enabled := False;
    dxmnuSortDescending.Enabled := False;
    dxmnuSortName.Enabled:= False;
    dxmnuSortNumber.Enabled:= False;
    dxmnuSortDate.Enabled := False;
  end;  

end;

procedure TfrmMain.vstSMSDblClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  wReadSMSWnd: TfrmReadSMS;
  xItem: TListItem;
  pData: PShortMessageEntry;
begin
  // 打开特定的窗口
  case CurrentView of
    cvDraft:
    begin
      pData := vstSMS.GetNodeData(vstSMS.GetFirstSelected);

      if QueryWindow('draft', IntToStr(pData.InternalID)) then
        Exit;

      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '撰写短信';

      // 填充一些信息
      wWriteSMSWnd.ShowDraft(pData.InternalID);
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(pData.InternalID));
    end;
    cvReceive:
    begin
      pData := vstSMS.GetNodeData(vstSMS.GetFirstSelected);

      if QueryWindow('receive', IntToStr(pData.InternalID)) then
        Exit;

      // 打开收件箱
      wReadSMSWnd := TfrmReadSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 2;
      xItem.Data := Pointer(wReadSMSWnd.Handle);
      xItem.Caption := '阅读短信 (收件箱)';

      // 填充一些信息
      wReadSMSWnd.OpenSMS(bReceive, pData.InternalID);
      wReadSMSWnd.Show;
      xItem.SubItems.Add('receive');
      xItem.SubItems.Add(IntToStr(pData.InternalID));
    end;
    cvSend:
    begin
      pData := vstSMS.GetNodeData(vstSMS.GetFirstSelected);

      if QueryWindow('send', IntToStr(pData.InternalID)) then
        Exit;

      // 打开发件箱
      wReadSMSWnd := TfrmReadSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 2;
      xItem.Data := Pointer(wReadSMSWnd.Handle);
      xItem.Caption := '阅读短信 (发件箱)';

      // 填充一些信息
      wReadSMSWnd.OpenSMS(bSend, pData.InternalID);
      wReadSMSWnd.Show;
      xItem.SubItems.Add('send');
      xItem.SubItems.Add(IntToStr(pData.InternalID));
    end;
    cvFinish:
    begin
      pData := vstSMS.GetNodeData(vstSMS.GetFirstSelected);

      if QueryWindow('finish', IntToStr(pData.InternalID)) then
        Exit;

      // 打开草稿箱
      wReadSMSWnd := TfrmReadSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 2;
      xItem.Data := Pointer(wReadSMSWnd.Handle);
      xItem.Caption := '阅读短信 (已发送的短信)';

      // 填充一些信息
      wReadSMSWnd.OpenSMS(bFinish, pData.InternalID);
      wReadSMSWnd.Show;
      xItem.SubItems.Add('finish');
      xItem.SubItems.Add(IntToStr(pData.InternalID));
    end;
  end;
end;

procedure TfrmMain.dxmnuSMSReplayClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
  pData: PShortMessageEntry;
begin
  // 打开特定的窗口
  case CurrentView of
    cvReceive:
    begin
      pData := vstSMS.GetNodeData(vstSMS.GetFirstSelected);

      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '回复短信';

      // 填充一些信息
      wWriteSMSWnd.NewReply(pData.InternalID);
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(0));
    end;
  end;
end;

procedure TfrmMain.dxmnuSMSTransmitClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
  pData: PShortMessageEntry;
begin
  // 打开特定的窗口
  case CurrentView of
    cvReceive:
    begin
      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '转发短信';

      // 填充一些信息
      pData := vstSMS.GetNodeData(vstSMS.GetFirstSelected);
      wWriteSMSWnd.NewTransmit(pData.InternalID, 'receive');
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(0));
    end;
    cvFinish:
    begin
      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '转发短信';

      // 填充一些信息
      pData := vstSMS.GetNodeData(vstSMS.GetFirstSelected);
      wWriteSMSWnd.NewTransmit(pData.InternalID, 'finish');
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(0));
    end;
  end;
end;

// 查询特定窗口并打开
function TfrmMain.QueryWindow(ABox: String; InternalID: String; ShowFound: Boolean = True; CloseFound: Boolean = False): Boolean;
var
  i: Integer;
  hWindow: HWND;
begin
  Result := False;
  for i := 1 to lvwWindow.Items.Count - 1 do
    if (lvwWindow.Items[i].SubItems[0] = ABox) and
      (lvwWindow.Items[i].SubItems[1] = InternalID) then
    begin
      Result := True;

      if ShowFound then
      begin
        hWindow := Integer(lvwWindow.Items[i].Data);
        Windows.ShowWindow(hWindow, SW_SHOWNORMAL);
        Windows.SetFocus(hWindow);
      end;

      if CloseFound then
      begin
        hWindow := Integer(lvwWindow.Items[i].Data);
        Windows.PostMessage(hWindow, WM_MSG_CLOSEWND, 0, 0);
      end;

      Break;
    end;
end;

// 刷新视图
procedure TfrmMain.RefreshView;
var
  iSelCol: TList;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
begin
  pNode := vstSMS.GetFirstSelected;
  iSelCol := TList.Create;

  while Assigned(pNode) do
  begin
    pData := vstSMS.GetNodeData(pNode);
    iSelCol.Add(Pointer(pData.InternalID));
    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 重新选择项目
  if vstSMS.SelectedCount > 0 then
    RefreshView(iSelCol)
  else
    RefreshView(nil);
end;

procedure TfrmMain.RefreshView(InternalID: Integer);
var
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  bDeleted: Boolean;
  bViewExist: Boolean;
  // 设置更新模式
  // 0: 更新内容 1: 添加内容 2: 删除内容 3: 什么也不做
  iMode: Integer;
  pList: TList;
begin
  // 如果试图不用更新
  if CurrentView = cvNone then
  begin
    RefreshView;
    Exit;
  end;

  // 从数据库中查到条目
  qrySMS.Requery;
  bDeleted := not qrySMS.Locate('internalid', InternalID, []);

  // 列表中是否存在
  bViewExist := False;
  pNode := vstSMS.GetFirst;
  pData := nil;
  iMode := 0;

  while Assigned(pNode) do
  begin
    pData := vstSMS.GetNodeData(pNode);

    if pData.InternalID = InternalID then
    begin
      bViewExist := True;
      Break;
    end;

    pNode := vstSMS.GetNext(pNode);
  end;

  // 决定做什么操作
  if bViewExist and bDeleted then iMode := 2;
  if (not bViewExist) and (not bDeleted) then iMode := 1;
  if bViewExist and (not bDeleted) then iMode := 0;

  if opSplittedPage then
  begin
    // 如果启用了分页功能
    // 如果条目不在页面范围内就不用更新
    if not bDeleted then
    begin
      if not ((FSPRecFirst <= qrySMS.RecNo) and (FSPRecEnd >= qrySMS.RecNo)) then
        iMode := 4;
    end
    else
      if not bViewExist then
        iMode := 4;
  end;

  // 进行操作
  if iMode = 1 then
  begin
    pNode := vstSMS.InsertNode(vstSMS.GetFirst, amInsertBefore, nil);
    pData := vstSMS.GetNodeData(pNode);
  end;

  if (iMode = 0) or (iMode = 1) then
  begin
    case CurrentView of
      cvReceive:
      begin
        pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
        pData.DateTime := qrySMS.FieldByName('receivedate').AsDateTime;
        pData.Sender := qrySMS.FieldByName('sender').AsString;
        pData.PhoneNumber := qrySMS.FieldByName('sendernumber').AsString;
        pData.Content := qrySMS.FieldByName('content').AsString;
        pData.Replied := qrySMS.FieldByName('replied').AsBoolean;
        pData.Read := qrySMS.FieldByName('read').AsBoolean;
        pData.Transmitted := qrySMS.FieldByName('transmitted').AsBoolean;
        pData.PhoneClient := qrySMS.FieldByName('id').AsInteger > 0;
        pData.MessageCount := 1;
      end;
      cvSend:
      begin
        pData.DateTime := qrySMS.FieldByName('senderdate').AsDateTime;
        pData.Sender := qrySMS.FieldByName('sender').AsString;
        pData.PhoneNumber := qrySMS.FieldByName('number').AsString;
        pData.Content := qrySMS.FieldByName('content').AsString;
        pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
        pData.Read := True;
        pData.Transmitted := False;
        pData.PhoneClient := False;
        pData.MessageCount := 1;
      end;
      cvFinish:
      begin
        pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
        pData.DateTime := qrySMS.FieldByName('senderdate').AsDateTime;
        pData.Sender := qrySMS.FieldByName('name').AsString;;
        pData.PhoneNumber := qrySMS.FieldByName('number').AsString;
        pData.Content := qrySMS.FieldByName('content').AsString;
        pData.Read := True;
        pData.Transmitted := qrySMS.FieldByName('transmitted').AsBoolean;
        pData.MessageCount := qrySMS.FieldByName('count').AsInteger;
        pData.PhoneClient := qrySMS.FieldByName('id').AsInteger > 0;
      end;
      cvDraft:
      begin
        pData.DateTime := qrySMS.FieldByName('date').AsDateTime;
        pData.Sender := qrySMS.FieldByName('name').AsString;
        pData.PhoneNumber := qrySMS.FieldByName('number').AsString;
        pData.Content := qrySMS.FieldByName('content').AsString;
        pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
        pData.MessageCount := qrySMS.FieldByName('count').AsInteger;
        pData.Read := True;
        pData.PhoneClient := qrySMS.FieldByName('id').AsInteger > 0;
      end;
    end;

//    if iMode = 1 then
//    begin
//      vstSMS.RepaintNode(pNode);
//    end
//    else
      vstSMS.RepaintNode(pNode);
  end
  else
  begin
    pList := TList.Create;
    pNode := vstSMS.GetFirstSelected;

    if iMode = 2 then
      if vstSMS.TotalCount > 1 then
      begin
        if pNode = vstSMS.GetLast then
          pNode := pNode.PrevSibling
        else
          pNode := pNode.NextSibling;

        pData := vstSMS.GetNodeData(pNode);
        pList.Add(Pointer(pData.InternalID));
      end
    else
      while Assigned(pNode) do
      begin
        pData := vstSMS.GetNodeData(pNode);
        pList.Add(Pointer(pData.InternalID));
        pNode := vstSMS.GetNextSelected(pNode);
      end;

    RefreshPage(FSPCurPage, pList);
    pList.Free;
  end;

  // 如果超过了就要删除一个项目
  if vstSMS.TotalCount > Cardinal(opSPItemCount) then
    vstSMS.DeleteNode(vstSMS.GetLast);
end;

procedure TfrmMain.RefreshView(isSelection: TList);
var
  Node: TTreeNode;
  //dbSMS: TADOQuery;
  pItem: PVirtualNode;
  pData: PShortMessageEntry;
  bNoneSel: Boolean;
  SFilterForm: String;
  SFilterTo: String;
  SNameList: String;
  bFilterName: Boolean;
  SLNames: TStringList;
  i: Integer;
  sSortStr: String;
begin
  // 改变节点查询数据库
  //vstSMS.Clear;
  dxmnuFileOpen.Enabled := False;
  Node := tvwFolder.Selected;
  if not Assigned(Node) then Exit;

  tmrReadInfo.Interval :=0;

  Cursor := crHourGlass;
  vstSMS.Visible := False;
  wbIntro.Visible := False;

  if not Assigned(isSelection) then
  begin
    isSelection := TList.Create;
    bNoneSel := True;
  end
  else
    bNoneSel := False;

  qrySMS.Close;
  qrySMS.SQL.Clear;
  
  // 格式化日期
  SFilterForm := FormatDateTime('yyyy-MM-dd hh:mm:ss', fraFilter.DTimeFrom);
  SFilterTo := FormatDateTime('yyyy-MM-dd hh:mm:ss', fraFilter.DTimeTo);
  //fraFilter.BName := bFilterName;
  bFilterName := fraFilter.BName;
  SLNames := TStringList.Create;
  SLNames.AddStrings(fraFilter.lstName.Items);
  SNameList := GetQuotedCommaText(fraFilter.lstName.Items); 
  if fraFilter.BNoName then SLNames.Add('');

  dxmnuFolderRule.Enabled := Node.ImageIndex = 0;
  dxmnuFolderDel.Enabled := Node.ImageIndex = 0;
  dxmnuFolderProperty.Enabled := (Node.ImageIndex <> 1) and (Node.ImageIndex <> 7);
  dxbtnDelete.Enabled := Node.ImageIndex = 0;
  dxbtnProperty.Enabled := (Node.ImageIndex <> 1) and (Node.ImageIndex <> 7);

  case Node.ImageIndex of
    0, 2:
    begin
      // 收件箱
      CurrentView := cvReceive;
      qrySMS.SQL.Add('SELECT * FROM receive');

      if Node.ImageIndex = 0 then
        qrySMS.SQL.Add(Format('WHERE (receive.folder = %s)', [QuotedStr(Node.Text)]))
      else
        qrySMS.SQL.Add('WHERE (True)');

      // 添加姓名筛选
      if bFilterName then
      begin
        qrySMS.SQL.Add(' AND (receive.sender IN (' + SNameList + ')');

        if fraFilter.chkNameNoName.Checked then
          qrySMS.SQL.Add('     OR receive.sender IS NULL)')
        else
          qrySMS.SQL.Add(')')
      end;

      // 排序标志
      case opSPSortType of
        0: sSortStr := 'ORDER BY sender';
        1: sSortStr := 'ORDER BY sendernumber';
        2: sSortStr := 'ORDER BY receivedate';
      end;

      if opSPSortAsc then
        sSortStr := sSortStr + ' ASC;'
      else
        sSortStr := sSortStr + ' DESC;';

      qrySMS.SQL.Add(sSortStr);

      if fraFilter.BTimeFrom and fraFilter.BTimeTo then
        qrySMS.Filter := Format('(receivedate >= #%s#) and (receivedate <= #%s#)'
          , [SFilterForm, SFilterTo])
      else if fraFilter.BTimeFrom then
        qrySMS.Filter := Format('(receivedate >= #%s#)', [SFilterForm])
      else if fraFilter.BTimeTo then
        qrySMS.Filter := Format('(receivedate <= #%s#)', [SFilterTo]);

      qrySMS.Filtered := fraFilter.BTimeFrom or fraFilter.BTimeTo;
      qrySMS.Open;
      RefreshPage(isSelection);
    end;
    3:
    begin
      // 发件箱
      CurrentView := cvSend;
      qrySMS.SQL.Add('SELECT * FROM send');

      // 添加姓名筛选
      if bFilterName then
      begin
        qrySMS.SQL.Add('WHERE (send.addressee IN (' + SNameList + ')');

        if fraFilter.chkNameNoName.Checked then
          qrySMS.SQL.Add('     OR send.addressee IS NULL)')
        else
          qrySMS.SQL.Add(')')
      end;

      case opSPSortType of
        0: sSortStr := 'ORDER BY addressee';
        1: sSortStr := 'ORDER BY number';
        2: sSortStr := 'ORDER BY senderdate';
      end;

      if opSPSortAsc then
        sSortStr := sSortStr + ' ASC;'
      else
        sSortStr := sSortStr + ' DESC;';

      qrySMS.SQL.Add(sSortStr);

      if fraFilter.BTimeFrom and fraFilter.BTimeTo then
        qrySMS.Filter := Format('(senderdate >= #%s#) and (senderdate <= #%s#)'
          , [SFilterForm, SFilterTo])
      else if fraFilter.BTimeFrom then
        qrySMS.Filter := Format('(senderdate >= #%s#)', [SFilterForm])
      else if fraFilter.BTimeTo then
        qrySMS.Filter := Format('(senderdate <= #%s#)', [SFilterTo]);

      qrySMS.Filtered := fraFilter.BTimeFrom or fraFilter.BTimeTo;
      qrySMS.Open;
      RefreshPage(isSelection);
    end;
    4:
    begin
      // 已发送的短信
      CurrentView := cvFinish;
      qrySMS.SQL.Add('SELECT * FROM finish_detail');
      qrySMS.SQL.Add('WHERE (finish_detail.count > 0)');

      // 添加姓名筛选
      if bFilterName then
      begin
        qrySMS.SQL.Add('  AND finish_detail.internalid IN');
        qrySMS.SQL.Add('    (SELECT finish_item.associatedid');
        qrySMS.SQL.Add('     FROM finish_item');
        qrySMS.SQL.Add('     WHERE (finish_item.name IN (' + SNameList + '))');

        if fraFilter.chkNameNoName.Checked then
          qrySMS.SQL.Add('     OR finish_item.name IS NULL)')
        else
          qrySMS.SQL.Add(')')
      end;

      case opSPSortType of
        0: sSortStr := 'ORDER BY name';
        1: sSortStr := 'ORDER BY number';
        2: sSortStr := 'ORDER BY senderdate';
      end;

      if opSPSortAsc then
        sSortStr := sSortStr + ' ASC;'
      else
        sSortStr := sSortStr + ' DESC;';

      qrySMS.SQL.Add(sSortStr);

      if fraFilter.BTimeFrom and fraFilter.BTimeTo then
        qrySMS.Filter := Format('(senderdate >= #%s#) and (senderdate <= #%s#)'
          , [SFilterForm, SFilterTo])
      else if fraFilter.BTimeFrom then
        qrySMS.Filter := Format('(senderdate >= #%s#)', [SFilterForm])
      else if fraFilter.BTimeTo then
        qrySMS.Filter := Format('(senderdate <= #%s#)', [SFilterTo]);

      qrySMS.Filtered := fraFilter.BTimeFrom or fraFilter.BTimeTo;
      qrySMS.Open;
      RefreshPage(isSelection);
    end;
    5:
    begin
      // 草稿
      CurrentView := cvDraft;
      qrySMS.SQL.Add('SELECT * FROM draft_detail');

      // 添加姓名筛选
      if bFilterName then
      begin
        qrySMS.SQL.Add('WHERE draft_detail.internalid IN');
        qrySMS.SQL.Add('    (SELECT draft_item.associatedid');
        qrySMS.SQL.Add('     FROM draft_item');
        qrySMS.SQL.Add('     WHERE (draft_item.name IN (' + SNameList + '))');

        if fraFilter.chkNameNoName.Checked then
          qrySMS.SQL.Add('     OR draft_item.name IS NULL)')
        else
          qrySMS.SQL.Add(')')
      end;

      case opSPSortType of
        0: sSortStr := 'ORDER BY name';
        1: sSortStr := 'ORDER BY number';
        2: sSortStr := 'ORDER BY date';
      end;

      if opSPSortAsc then
        sSortStr := sSortStr + ' ASC;'
      else
        sSortStr := sSortStr + ' DESC;';

      qrySMS.SQL.Add(sSortStr);

      if fraFilter.BTimeFrom and fraFilter.BTimeTo then
        qrySMS.Filter := Format('(date >= #%s#) and (date <= #%s#)'
          , [SFilterForm, SFilterTo])
      else if fraFilter.BTimeFrom then
        qrySMS.Filter := Format('(date >= #%s#)', [SFilterForm])
      else if fraFilter.BTimeTo then
        qrySMS.Filter := Format('(date <= #%s#)', [SFilterTo]);

      qrySMS.Filtered := fraFilter.BTimeFrom or fraFilter.BTimeTo;
      qrySMS.Open;
      RefreshPage(isSelection);
    end;
    7:
    begin
      // 查找结果窗口
      CurrentView := AFindSession.Box;
      vstSMS.Clear;

      for i := 0 to AFindSession.Result.Count - 1 do
      begin
        pItem := vstSMS.AddChild(nil);
        pData := vstSMS.GetNodeData(pItem);
        CopyMemory(pData, AFindSession.Result.Items[i], SizeOf(TShortMessageEntry));
        pData.MessageReport := False;
      end;
    end;
    else
      CurrentView := cvNone;
  end;

  // 更新列表视图
  case CurrentView of
    cvNone:
    begin
      wbIntro.Navigate(UpdateIntroPage(adoSMS));
      wbIntro.Visible := True;
      wbIntro.BringToFront;
    end;
    cvReceive:
    begin
      vstSMS.Header.Columns[1].MaxWidth := 25;
      vstSMS.Header.Columns[1].MinWidth := 25;
      vstSMS.Header.Columns[1].Width := 25;
      vstSMS.Header.Columns[2].MaxWidth := 25;
      vstSMS.Header.Columns[2].MinWidth := 25;
      vstSMS.Header.Columns[2].Width := 25;
      vstSMS.Header.Columns[7].MaxWidth := 25;
      vstSMS.Header.Columns[7].MinWidth := 25;
      vstSMS.Header.Columns[7].Width := 25;
      vstSMS.Header.Columns[3].Text := '发件人';
      vstSMS.Visible := True;
      vstSMS.BringToFront;
    end;
    cvSend:
    begin
      vstSMS.Header.Columns[1].MaxWidth := 0;
      vstSMS.Header.Columns[1].MinWidth := 0;
      vstSMS.Header.Columns[1].Width := 0;
      vstSMS.Header.Columns[2].MaxWidth := 0;
      vstSMS.Header.Columns[2].MinWidth := 0;
      vstSMS.Header.Columns[2].Width := 0;
      vstSMS.Header.Columns[7].MaxWidth := 0;
      vstSMS.Header.Columns[7].MinWidth := 0;
      vstSMS.Header.Columns[7].Width := 0;
      vstSMS.Header.Columns[3].Text := '收件人';
      vstSMS.Visible := True;
      vstSMS.BringToFront;
    end;
    cvFinish:
    begin
      vstSMS.Header.Columns[1].MaxWidth := 0;
      vstSMS.Header.Columns[1].MinWidth := 0;
      vstSMS.Header.Columns[1].Width := 0;
      vstSMS.Header.Columns[2].MaxWidth := 25;
      vstSMS.Header.Columns[2].MinWidth := 25;
      vstSMS.Header.Columns[2].Width := 25;
      vstSMS.Header.Columns[7].MaxWidth := 25;
      vstSMS.Header.Columns[7].MinWidth := 25;
      vstSMS.Header.Columns[7].Width := 25;
      vstSMS.Header.Columns[3].Text := '收件人';
      vstSMS.Visible := True;
      vstSMS.BringToFront;
    end;
    cvDraft:
    begin
      vstSMS.Header.Columns[1].MaxWidth := 0;
      vstSMS.Header.Columns[1].MinWidth := 0;
      vstSMS.Header.Columns[1].Width := 0;
      vstSMS.Header.Columns[2].MaxWidth := 0;
      vstSMS.Header.Columns[2].MinWidth := 0;
      vstSMS.Header.Columns[2].Width := 0;
      vstSMS.Header.Columns[7].MaxWidth := 25;
      vstSMS.Header.Columns[7].MinWidth := 25;
      vstSMS.Header.Columns[7].Width := 25;
      vstSMS.Header.Columns[3].Text := '收件人';
      vstSMS.Visible := True;
      vstSMS.BringToFront;
    end;
  end;

  SortSMSList;

  if bNoneSel and (vstSMS.TotalCount > 0)then
  begin
    vstSMS.ClearSelection;
    vstSMS.Selected[vstSMS.GetFirst] := True;
  end;

  if vstSMS.SelectedCount > 0 then
  begin
    vstSMS.FocusedNode := vstSMS.GetFirstSelected;
    //vstSMSFocusChanged(vstSMS, vstSMS.GetFirstSelected, 0);
  end
  else
    fraInfoPreview.ShowMessageDetail;

  Cursor := crDefault;

  // 释放创建的内容
  if bNoneSel then
    isSelection.Free;
end;

procedure TfrmMain.tmrHidePopHitTimer(Sender: TObject);
begin
  // 添加查询工作
  ctiMain.HideBalloonHint;
  tmrHidePopHit.Enabled := False;
end;

procedure TfrmMain.dxbtnAutoReceiveClick(Sender: TObject);
{$IFDEF REGISTERED}
var
  bExiting: Boolean;
{$ENDIF}
begin

{$IFDEF REGISTERED}
  // 接收已读取的信息
//  {$I Encode_Start.inc}
  bExiting := False;
  
  if (not AutoReceive) and (not SameText(GlobalRegStatus, GRS_REGISTERED)) and (GetAllCount(adoSMS) > 400) then
  begin
    MessageBox(Handle,
      '您的 Ultra SMS 的程序是试用期版本或者已经过期，数据库容量为400条，不能启动自动接收。',
      PChar(Caption), MB_OK + MB_ICONWARNING);
    bExiting := True;
    dxbtnAutoReceive.Down := False;
    dxmnuSMSAutoReceive.Down := False;
    AutoReceive := False;
  end;
//  {$I Encode_End.inc}

  if bExiting then
    Exit;
{$ENDIF}

  // 自动接收
  tmrQueryNewSMS.Enabled := False;
  AutoReceive := not AutoReceive;
  JobThread.CycleQuery := (opQueryNewModel > 0) and AutoReceive;
  dxmnuSMSAutoReceive.Down := AutoReceive;
  dxbtnAutoReceive.Down := AutoReceive;

  JobThread.JobContent.AddTop(jkSetCALLBACK);
  JobThread.Suspended := False;
end;

procedure TfrmMain.dxmnuEditDeleteClick(Sender: TObject);
var
  bSipped: Boolean;
  bDelFinish: Boolean;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  dbTable: TADOTable;
  dbFinish: TADOTable;
  sTName: String;
  posOffset: TPoint;
begin
  // 删除所选的项目
  if vstSMS.SelectedCount = 0 then Exit;
  if MessageBox(Handle, PChar(Format('是否要删除 %d 个条目。该操作无法撤销。',
   [vstSMS.SelectedCount])), PChar(Forms.Application.Title), MB_YESNO	or
   MB_ICONQUESTION or MB_DEFBUTTON2) = IDNO	then Exit;

  bDelFinish := False;
  dbFinish := nil;
  posOffset := vstSMS.OffsetXY;

  // 打开数据库
  case CurrentView of
    cvReceive: sTName := 'receive';
    cvSend:
    begin
      sTName := 'send';
      dbFinish := TADOTable.Create(nil);
      dbFinish.Connection := adoSMS;
      dbFinish.TableName := 'finish';
      dbFinish.Open;
      bDelFinish := True;
    end;
    cvFinish: sTName := 'finish';
    cvDraft: sTName := 'draft';
    cvNone: Exit;
  end;

  dbTable := TADOTable.Create(nil);
  dbTable.Connection := adoSMS;
  dbTable.TableName := sTName;
  dbTable.Open;

  // 开始删除
  pNode := vstSMS.GetFirstSelected;
  pData := nil;
  bSipped := False;

  while Assigned(pNode) do
  begin
    pData := vstSMS.GetNodeData(pNode);
    if dbTable.Locate('internalid', pData.InternalID, []) and
      (not QueryWindow(sTName, IntToStr(pData.InternalID), False)) then
    begin
      if bDelFinish and Assigned(dbFinish) then
        if dbFinish.Locate('internalid',
          dbTable.FieldByName('finishid').AsInteger, []) then
        dbFinish.Delete;

      dbTable.Delete;
    end
    else
    begin
      vstSMS.Selected[pNode] := False;
      bSipped := True;
    end;

    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 刷新
  dbTable.Close;
  dbTable.Free;

  if bDelFinish then
  begin
    dbFinish.Close;
    dbFinish.Free;
  end;

  // 可能要刷新内容
  if opSplittedPage then
    RefreshView(pData.InternalID)
  else
    vstSMS.DeleteSelectedNodes;

  // 提示
  if bSipped then
    MessageBox(Handle, '有一些条目因为窗口已打开，所以没有删除。',
      PChar(Forms.Application.Title), MB_ICONINFORMATION);

  // 重新选择项目
  if ((vstSMS.TotalCount > 0) and (vstSMS.SelectedCount = 0)) then
  begin
    vstSMS.Selected[vstSMS.GetFirst] := True;
  end;

  vstSMS.OffsetXY := posOffset;

  if vstSMS.SelectedCount > 0 then
    vstSMSFocusChanged(vstSMS, vstSMS.GetFirstSelected, 0)
  else
  begin
    dxmnuFileOpen.Enabled := False;
    fraInfoPreview.ShowMessageDetail;
  end;

  if opShowTrayIcon then
    RefreshNewTray;

end;

procedure TfrmMain.dxmnuEditCopyClick(Sender: TObject);
var
  cBoard: TClipboard;
begin
  // 复制信息内容
  cBoard := Clipboard;

  if Length(fraInfoPreview.txtContent.Text) > 0 then
    cBoard.AsText := fraInfoPreview.txtContent.Text;
end;

procedure TfrmMain.dxmnuEditSelAllClick(Sender: TObject);
begin
  if vstSMS.Focused then
    vstSMS.SelectAll(False);
end;

procedure TfrmMain.dxmnuEditSelNoneClick(Sender: TObject);
begin
  if vstSMS.Focused then
    vstSMS.ClearSelection;
end;

procedure TfrmMain.dxmnuEditSelRevClick(Sender: TObject);
var
  pNode: PVirtualNode;
begin
  pNode := vstSMS.GetFirst;

  if vstSMS.Focused then
    while Assigned(pNode) do
    begin
      vstSMS.Selected[pNode] := not (vsSelected in pNode.States);
      pNode := vstSMS.GetNext(pNode);
    end;
end;

procedure TfrmMain.dxmnuSMSReplaySelClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
  pData: PShortMessageEntry;
  pNode: PVirtualNode;
begin
  if vstSMS.SelectedCount = 0 then Exit;
  if vstSMS.SelectedCount = 1 then
  begin
    dxmnuSMSReplayClick(nil);
    Exit;
  end;

  case CurrentView of
    cvReceive:
    begin
      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '回复短信';

      // 添加联系人
      pNode := vstSMS.GetFirstSelected;

      while Assigned(pNode) do
      begin
        pData := vstSMS.GetNodeData(pNode);
        wWriteSMSWnd.AppendOneContact(pData.Sender, pData.PhoneNumber);
        pNode := vstSMS.GetNextSelected(pNode);
      end;

      // 填充一些信息
      wWriteSMSWnd.NewSMS;
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(0));
    end;
  end;

end;

procedure TfrmMain.dxmnuSMSSendClick(Sender: TObject);
var
  dbSend: TADOTable;
  dbDelAll: TADOQuery;
  hWindow: HWND;
  i: Integer;
begin
  // 关闭所有的窗口
  for i := 1 to lvwWindow.Items.Count - 1 do
    if lvwWindow.Items[i].SubItems[0] = 'send' then
    begin
      hWindow := LongWord(lvwWindow.Items[i].SubItems[1]); 
      Windows.PostMessage(hWindow, WM_MSG_CLOSEWND, 0, 0);
    end;

  // 发送所有的条目
  dbSend := TADOTable.Create(nil);
  dbSend.Connection := adoSMS;
  dbSend.TableName := 'send';
  dbSend.Open;

  while not dbSend.Eof do
  begin
    JobThread.JobContent.AddSendJob(
      dbSend.FieldByName('number').AsString,
      dbSend.FieldByName('content').AsString,
      dbSend.FieldByName('addressee').AsString,
      dbSend.FieldByName('finishid').AsInteger);

    dbSend.Next;
  end;

  dbSend.Close;
  dbSend.Free;

  // 删除所以数据
  dbDelAll := TADOQuery.Create(nil);
  dbDelAll.Connection := adoSMS;
  dbDelAll.SQL.Text := 'DELETE * FROM send';
  dbDelAll.ExecSQL;
  dbDelAll.Close;
  dbDelAll.Free;

  // 更新列表
  if CurrentView = cvSend then
    RefreshView;

  // 开始工作
  JobThread.Suspended := False;
end;

procedure TfrmMain.dxmnuSMSSendSelClick(Sender: TObject);
var
  dbSend: TADOTable;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
begin
  // 发送所有的条目
  if CurrentView <> cvSend then Exit;

  dbSend := TADOTable.Create(nil);
  dbSend.Connection := adoSMS;
  dbSend.TableName := 'send';
  dbSend.Open;

  pNode := vstSMS.GetFirstSelected;

  while Assigned(pNode) do
  begin
    pData := vstSMS.GetNodeData(pNode);

    if dbSend.Locate('internalid', pData.InternalID, []) then
    begin
      JobThread.JobContent.AddSendJob(
        dbSend.FieldByName('number').AsString,
        dbSend.FieldByName('content').AsString,
        dbSend.FieldByName('addressee').AsString,
        dbSend.FieldByName('finishid').AsInteger);
      dbSend.Delete;
    end;

    pNode := vstSMS.GetNextSelected(pNode);
  end;

  dbSend.Close;
  dbSend.Free;

  // 更新列表
  vstSMS.DeleteSelectedNodes;

  // 开始工作
  JobThread.Suspended := False;
end;

procedure TfrmMain.ctiMainClick(Sender: TObject);
var
  msg: TMessage;
begin
  // 显示窗口
  if FMinimized then
  begin
    Visible := True;
    WindowState := FLastStatus;
    SetForegroundWindow(Forms.Application.MainForm.Handle);
    SetActiveWindow(Forms.Application.MainForm.Handle);
    FMinimized := False;
  end
  else
  begin
    msg.WParam := SC_MINIMIZE;
    WMSyscommand(msg);
  end;
end;

procedure TfrmMain.ctiMainMinimizeToTray(Sender: TObject);
begin
  if not FInitialized then Exit;

  FMinimized := True;

  if not FShowHit then
  begin
    ShowPopHit('最小化提示', '现在程序已经最小化，但仍在执行，您可以单机系统托盘图标恢复主程序。' +
      '当有信息的时候程序会以气泡方式提醒您。');
    FShowHit := True;
  end;
end;

procedure TfrmMain.dxmnuSMSResendClick(Sender: TObject);
var
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  slName: TStringList;
  slPhone: TStringList;
  i: Integer;
  iIndex: Integer;
  dbFinish: TADOTable;
begin
  // 重新发送短信
  pNode := vstSMS.GetFirstSelected;
  pData := vstSMS.GetNodeData(pNode);

  slPhone := TStringList.Create;
  slName := TStringList.Create;

  slPhone.Text := pData.PhoneNumber;
  slName.Text := pData.Sender;

  for i := slName.Count to slPhone.Count - 1 do
    slName.Add('');

  // 为发送成功作准备
  dbFinish := TADOTable.Create(nil);
  dbFinish.Connection := frmMain.adoSMS;
  dbFinish.TableName := 'finish';
  dbFinish.Open;
  dbFinish.Append;
  dbFinish.FieldByName('transmitted').AsBoolean := False;
  dbFinish.FieldByName('content').AsString := pData.Content;
  dbFinish.Post;
  iIndex := dbFinish.FieldByName('internalid').AsInteger;
  dbFinish.Close;
  dbFinish.Free;

  // 添加到工作列表
  for i := 0 to slPhone.Count - 1 do
    JobThread.JobContent.AddSendJob(slPhone[i], pData.Content, slName[i], iIndex);

  // 开始工作
  JobThread.Suspended := False;
end;

procedure TfrmMain.UpdateMark(InternalIDs: TIntegerDynArray; AReadMark: TTriBoolean =
  tbUnchange; AReplyMark: TTriBoolean = tbUnchange; ASendMark: TTriBoolean =
  tbUnchange; BReceiveBox: Boolean = True);
var
  i: Integer;
  REC: TADOTable;
begin
  // 更新标记
  REC := TADOTable.Create(nil);
  REC.Connection := adoSMS;

  if BReceiveBox then
    REC.TableName := 'receive'
  else
    REC.TableName := 'finish';

  REC.Open;

  for i := Low(InternalIDs) to High(InternalIDs) do
    if REC.Locate('internalid', InternalIDs[i], []) then
    begin
      REC.Edit;

      // 已读标记
      if (AReadMark = tbTrue) and BReceiveBox then
        REC.FieldByName('read').AsBoolean := True
      else if (AReadMark = tbFalse) and BReceiveBox then
        REC.FieldByName('read').AsBoolean := False;

      // 回复标记
      if (AReplyMark = tbTrue) and BReceiveBox then
        REC.FieldByName('replied').AsBoolean := True
      else if (AReplyMark = tbFalse) and BReceiveBox then
        REC.FieldByName('replied').AsBoolean := False;

      // 转发标记
      if ASendMark = tbTrue then
        REC.FieldByName('transmitted').AsBoolean := True
      else if ASendMark = tbFalse then
        REC.FieldByName('transmitted').AsBoolean := False;

      REC.Post;
    end;

  REC.Close;
  REC.Free;

  if AReadMark <> tbUnchange then
  begin
    if opShowTrayIcon then
      RefreshNewTray;
    qrySMS.Requery();
  end;

end;

procedure TfrmMain.dxmnuSMSReadClick(Sender: TObject);
var
  aSelItems: TIntegerDynArray;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  i: Integer;
begin
  // 获得选择的项目
  pNode := vstSMS.GetFirstSelected;
  SetLength(aSelItems, vstSMS.SelectedCount);

  for i := 0 to vstSMS.SelectedCount - 1 do
  begin
    pData := vstSMS.GetNodeData(pNode);
    aSelItems[i] := pData.InternalID;
    pData.Read := True;
    vstSMS.RepaintNode(pNode);    
    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 设置已读的标签
  UpdateMark(aSelItems, tbTrue, tbUnchange, tbUnchange, True);
end;

procedure TfrmMain.dxmnuSMSUnreadClick(Sender: TObject);
var
  aSelItems: TIntegerDynArray;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  i: Integer;
begin
  // 获得选择的项目
  pNode := vstSMS.GetFirstSelected;
  SetLength(aSelItems, vstSMS.SelectedCount);

  for i := 0 to vstSMS.SelectedCount - 1 do
  begin
    pData := vstSMS.GetNodeData(pNode);
    aSelItems[i] := pData.InternalID;
    pData.Read := False;
    vstSMS.RepaintNode(pNode);    
    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 设置已读的标签
  UpdateMark(aSelItems, tbFalse, tbUnchange, tbUnchange, True);
end;

procedure TfrmMain.dxmnuSMSRepliedClick(Sender: TObject);
var
  aSelItems: TIntegerDynArray;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  i: Integer;
begin
  // 获得选择的项目
  pNode := vstSMS.GetFirstSelected;
  SetLength(aSelItems, vstSMS.SelectedCount);

  for i := 0 to vstSMS.SelectedCount - 1 do
  begin
    pData := vstSMS.GetNodeData(pNode);
    aSelItems[i] := pData.InternalID;
    pData.Replied := True;
    vstSMS.RepaintNode(pNode);    
    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 设置已读的标签
  UpdateMark(aSelItems, tbUnchange, tbTrue, tbUnchange, True);
end;

procedure TfrmMain.dxmnuSMSUnrepliedClick(Sender: TObject);
var
  aSelItems: TIntegerDynArray;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  i: Integer;
begin
  // 获得选择的项目
  pNode := vstSMS.GetFirstSelected;
  SetLength(aSelItems, vstSMS.SelectedCount);

  for i := 0 to vstSMS.SelectedCount - 1 do
  begin
    pData := vstSMS.GetNodeData(pNode);
    aSelItems[i] := pData.InternalID;
    pData.Replied := False;
    vstSMS.RepaintNode(pNode);    
    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 设置已读的标签
  UpdateMark(aSelItems, tbUnchange, tbFalse, tbUnchange, True);
end;

procedure TfrmMain.dxmnuSMSTransmittedClick(Sender: TObject);
var
  aSelItems: TIntegerDynArray;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  i: Integer;
begin
  // 获得选择的项目
  pNode := vstSMS.GetFirstSelected;
  SetLength(aSelItems, vstSMS.SelectedCount);

  for i := 0 to vstSMS.SelectedCount - 1 do
  begin
    pData := vstSMS.GetNodeData(pNode);
    aSelItems[i] := pData.InternalID;
    pData.Transmitted := True;
    vstSMS.RepaintNode(pNode);    
    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 设置已读的标签
  UpdateMark(aSelItems, tbUnchange, tbUnchange, tbTrue, True);
end;

procedure TfrmMain.dxmnuSMSUntransmittedClick(Sender: TObject);
var
  aSelItems: TIntegerDynArray;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  i: Integer;
begin
  // 获得选择的项目
  pNode := vstSMS.GetFirstSelected;
  SetLength(aSelItems, vstSMS.SelectedCount);

  for i := 0 to vstSMS.SelectedCount - 1 do
  begin
    pData := vstSMS.GetNodeData(pNode);
    aSelItems[i] := pData.InternalID;
    pData.Transmitted := False;
    vstSMS.RepaintNode(pNode);    
    pNode := vstSMS.GetNextSelected(pNode);
  end;

  // 设置已读的标签
  UpdateMark(aSelItems, tbUnchange, tbUnchange, tbFalse, True);
end;

procedure TfrmMain.lvwPhonebookDblClick(Sender: TObject);
var
  PhoneNumber: WideString;
  Name: WideString;
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // 分析对象
  if lvwPhonebook.SelCount > 0 then
  begin
    PhoneNumber := lvwPhonebook.Selected.SubItems[0];
    Name := lvwPhonebook.Selected.Caption;
    if Name = '<未知>' then Name := '';

    // 窗口撰写短信窗口    
    wWriteSMSWnd := TfrmWriteSMS.Create(nil);
    xItem := frmMain.lvwWindow.Items.Add;
    xItem.ImageIndex := 1;
    xItem.Data := Pointer(wWriteSMSWnd.Handle);
    xItem.SubItems.Add('draft');
    xItem.SubItems.Add('0');
    wWriteSMSWnd.NewSMS;
    wWriteSMSWnd.AppendContact(Name, PhoneNumber);
    wWriteSMSWnd.Modified := False;
  end;
end;

procedure TfrmMain.FCalcCount;
var
  iTotal: Cardinal;
  iUnread: Cardinal;
//  iInvisible: Cardinal;
  iSel: Cardinal;
  pNode: PVirtualNode;
  pData: PShortMessageEntry;
  iRec: Cardinal;
//  fmtsettting: TFormatSettings;
begin
  iTotal := 0;
  iUnread := 0;
//  iInvisible := 0;
  iSel := 0;
  iRec := 0;

  pNode := vstSMS.GetFirst;

  while Assigned(pNode) do
  begin
    pData := vstSMS.GetNodeData(pNode);
    iTotal := iTotal + pData.MessageCount;

    if vsSelected in pNode.States then
      iSel := iSel + pData.MessageCount;

    if not pData.Read then
      iUnread := iUnread + pData.MessageCount;

//    if not (vsVisible in pNode.States) then
//      iInvisible := iInvisible + pData.MessageCount;
//
    pNode := pNode.NextSibling;
  end;

  if not (dsInactive = qrySMS.State) then
    iRec := qrySMS.RecordCount;

  // 更新显示
//  GetLocaleFormatSettings(2502, fmtsettting);
//  fmtsettting.ThousandSeparator := Char(',');

  if opSplittedPage then
    stbMain.Panels[0].Text := Format('本页 %.0n 短信, 一共 %.0n 短信, %.0n 条未读, ' +
      '选择了 %.0n 条短信',   [(iTotal * 1.0), (iRec * 1.0), (iUnread * 1.0), (iSel * 1.0)])
  else
    stbMain.Panels[0].Text := Format('一共 %.0n 短信, %.0n 条未读, ' +
      '选择了 %.0n 条短信',   [(iTotal * 1.0), (iUnread * 1.0), (iSel * 1.0)]);
end;

procedure TfrmMain.ShowTrayAnimation(Animation: Boolean = False; AStatus: TJobKind = jkSend);
begin
  ctiMain.CycleIcons := Animation;

  if Animation = True then
  begin
    case AStatus of
      jkSend: ctiMain.IconList := iltTraySend;
      jkReceive: ctiMain.IconList := iltTrayReceive;
      jkReadPhoneBook: ctiMain.IconList := iltTrayPBook;
      jkQueryNew: ctiMain.IconList := iltTrayReceive;
      jkSetCALLBACK: ctiMain.IconList := iltTrayNormal;
    end;
    ctiMain.IconIndex := 0;
  end
  else
    if not Connected then
      ctiMain.IconList := iltTrayDisconncted
    else
      ctiMain.IconList := iltTrayConnected;

end;

procedure TfrmMain.ShowPopHit(Title, Content: String; AlwaysShow: Boolean = False);
begin
  if AlwaysShow or FMinimized then
  begin
    frmMain.ctiMain.ShowBalloonHint(Title, Content, bitInfo, 10);
    tmrHidePopHit.Enabled := True;
  end;
end;

procedure TfrmMain.Button1Click(Sender: TObject);
var
  frmPrint: TdlgPrint;
begin
  frmPrint := TdlgPrint.Create(Self);
  frmPrint.ShowModal;
end;

procedure TfrmMain.dxmnuFilePrintClick(Sender: TObject);
var
  wPrintWnd: TDlgPrint;
  xPrintItem: TSMSEntry;
  xItem: TListItem;
  pNode: PVirtualNode;
  pEntry: PShortMessageEntry;
  bSelected: Boolean;
  rRtl: Integer;
  tbSMS: TADOTable;

  procedure FillNameAndPhones(DB: TADOTable; AInternalID: Integer;
    var sNames: TStringList; var sPhones: TStringList);
  begin
    sNames.Clear;
    sPhones.Clear;

    DB.Filtered := False;
    DB.Filter := '[associatedid] = ' + IntToStr(AInternalID);
    DB.Filtered := True;

    while not DB.Eof do
    begin
      sNames.Add(DB.FieldByName('name').AsString);
      sPhones.Add(DB.FieldByName('number').AsString);
      DB.Next;
    end;
  end;

begin
  rRtl := MessageBox(Handle, '您是否要打印所有条目？'#10#13#10#13 +
          '* 选择是，打印右边列表中的所有条目。'#10#13 +
          '* 选择否，打印右边列表中的所选择的条目。'#10#13 +
          '* 选择取消，取消打印。', PChar(Forms.Application.Title), MB_YESNOCANCEL or
          MB_ICONQUESTION	or MB_DEFBUTTON2);

  case rRtl of
    IDYES: bSelected := False;
    IDNO: bSelected := True;
    else Exit;
  end;


  // 创建窗口
  wPrintWnd := TDlgPrint.Create(nil);
  xItem := lvwWindow.Items.Add;
  xItem.ImageIndex := 3;
  xItem.Caption := '打印预览';
  xItem.Data := Pointer(wPrintWnd.Handle);

  // 填充一些信息
  if bSelected then
    pNode := vstSMS.GetFirstSelected
  else
    pNode := vstSMS.GetFirst;

  case CurrentView of
    cvReceive, cvSend:
    while Assigned(pNode) do
    begin
      pEntry := vstSMS.GetNodeData(pNode);
      xPrintItem := TSMSEntry.Create;
      xPrintItem.DateTime := pEntry.DateTime;
      xPrintItem.Receive := vstSMS.Header.Columns[1].MinWidth > 0;
      xPrintItem.Content := pEntry.Content;
      xPrintItem.Name.Text := pEntry.Sender;
      xPrintItem.Phone.Text := pEntry.PhoneNumber;
      wPrintWnd.MsgContent.Add(xPrintItem);

      if bSelected then
        pNode := vstSMS.GetNextSelected(pNode)
      else
        pNode := pNode.NextSibling;
    end;
    cvFinish, cvDraft:
    begin
      tbSMS := TADOTable.Create(nil);
      tbSMS.Connection := adoSMS;
      tbSMS.TableName := IfThen(CurrentView = cvFinish ,'finish_item', 'draft_item');
      tbSMS.Open;

      while Assigned(pNode) do
      begin
        pEntry := vstSMS.GetNodeData(pNode);
        xPrintItem := TSMSEntry.Create;
        xPrintItem.DateTime := pEntry.DateTime;
        xPrintItem.Receive := vstSMS.Header.Columns[1].MinWidth > 0;
        xPrintItem.Content := pEntry.Content;
        FillNameAndPhones(tbSMS, pEntry.InternalID, xPrintItem.Name, xPrintItem.Phone);
        wPrintWnd.MsgContent.Add(xPrintItem);

        if bSelected then
          pNode := vstSMS.GetNextSelected(pNode)
        else
          pNode := pNode.NextSibling;
      end;
    end;
  end;

  xItem.SubItems.Add('preview');
  xItem.SubItems.Add(IntToStr(0));

  // 打开窗口
  wPrintWnd.SplitMsgMode := False;
  wPrintWnd.RefreshPreview;
  wPrintWnd.Show;
end;

procedure TfrmMain.dxmnuFilePrintSettingClick(Sender: TObject);
begin
  pdPrint.Execute;
end;

procedure TfrmMain.dxmnuFolderNewClick(Sender: TObject);
var
  dlgAddFolder: TdlgAddFolder;
begin
  dlgAddFolder := TdlgAddFolder.Create(Self);
  SetWindowLong(dlgAddFolder.Handle, -8, Handle);
  dlgAddFolder.ShowModal;
  dlgAddFolder.Free;
end;

procedure TfrmMain.dxmnuFolderDelClick(Sender: TObject);
var
  dbQuery: TADOQuery;
  sFolder: String;
  iRtl: Integer;
begin
  // 删除文件夹
  sFolder := tvwFolder.Selected.Text;

  iRtl := MessageBox(Handle, PChar(Format('即将删除文件夹 %s，您是否删除删除该文' +
    '件夹下的所有短信'#13#10#13#10'* 选择是，删除该文件夹并且删除该文件夹中的所有短信。' +
    #13#10'* 选择否，删除该文件夹，移动短信到根文件夹中。' +
    #13#10'* 选择取消，取消该删除操作。', [sFolder])), PChar(Forms.Application.Title),
    MB_ICONQUESTION or MB_YESNOCANCEL or MB_DEFBUTTON3);

  // 用户选择了取消
  if iRtl = IDCANCEL then exit;

  // 删除文件夹表中的文件夹
  { ** SQL Content ***
  DELETE folder.folder
  FROM folder
  WHERE (((folder.folder)='高中同学'));
  }

  dbQuery := TADOQuery.Create(nil);
  dbQuery.Connection := adoSMS;
  dbQuery.SQL.Add('DELETE folder.folder');
  dbQuery.SQL.Add('FROM folder');
  dbQuery.SQL.Add(Format('WHERE (((folder.folder)=%s));', [QuotedStr(sFolder)]));
  dbQuery.ExecSQL;

  // 删除或修改短消息内容
  { ** SQL Content ***
  UPDATE receive SET receive.folder = Null
  WHERE (((receive.folder)="高中同学"));

  DELETE receive.folder
  FROM receive
  WHERE (((receive.folder)="高中同学"));
  }

  dbQuery.SQL.Clear;

  if iRtl = IDNO then
  begin
    dbQuery.SQL.Add('UPDATE receive SET receive.folder = Null');
    dbQuery.SQL.Add('WHERE (((receive.folder)=' + QuotedStr(sFolder) + '));');
  end
  else
  begin
    dbQuery.SQL.Add('DELETE receive.folder');
    dbQuery.SQL.Add('FROM receive');
    dbQuery.SQL.Add('WHERE (((receive.folder)=' + QuotedStr(sFolder) + '));');
  end;

  dbQuery.ExecSQL;

  // 取消关联
  dbQuery.Connection := adoContacts;
  dbQuery.SQL.Clear;
  dbQuery.SQL.Add('UPDATE contact SET contact.folder = Null');
  dbQuery.SQL.Add('WHERE (((contact.folder)=' + QuotedStr(sFolder) + '));');
  dbQuery.ExecSQL;

  // 删除节点
  tvwFolder.Selected.Delete;

  // 关闭查询
  dbQuery.Free;
end;

procedure TfrmMain.dxmnuFolderPropertyClick(Sender: TObject);
var
  FolderName: String;
  SMSCount: Integer;
  BeginDate: TDateTime;
  EndDate: TDateTime;
  dbQuery: TADOQuery;
begin
  // 显示文件夹属性
  dbQuery := TADOQuery.Create(nil);
  dbQuery.Connection := adoSMS;
  FolderName := tvwFolder.Selected.Text;

  case tvwFolder.Selected.ImageIndex of
    0: dbQuery.SQL.Text := 'SELECT [receive].[receivedate] AS [date] FROM [receive] WHERE [receive].[folder] = ' + QuotedStr(FolderName) + ' ORDER BY [receive].[receivedate] ASC;';
    2: dbQuery.SQL.Text := 'SELECT [receive].[receivedate] AS [date] FROM [receive] ORDER BY [receive].[receivedate] ASC;';
    3: dbQuery.SQL.Text := 'SELECT [send].[senderdate] AS [date] FROM [send] ORDER BY [send].[senderdate] ASC;';
    4: dbQuery.SQL.Text := 'SELECT [finish].[senderdate] AS [date] FROM [finish] ORDER BY [finish].[senderdate] ASC;';
    5: dbQuery.SQL.Text := 'SELECT [draft].[date] FROM [draft] ORDER BY [draft].[date] ASC;';
    6: dbQuery.SQL.Text := 'SELECT [receive].[receivedate] AS [date] FROM [receive] WHERE [receive].[folder] IS NOT NULL ORDER BY [receive].[receivedate] ASC;';
  end;

  // 读取数据库中的内容
  dbQuery.Open;
  SMSCount := dbQuery.RecordCount;

  BeginDate := Now;
  EndDate := Now;

  if (SMSCount > 0) and (tvwFolder.Selected.ImageIndex<>1) then
  begin
    dbQuery.First;
    BeginDate := dbQuery.FieldByName('date').AsDateTime;
    dbQuery.Last;
    EndDate := dbQuery.FieldByName('date').AsDateTime;
  end;

  dbQuery.Close;
  dbQuery.Free;

  if tvwFolder.Selected.ImageIndex = 0 then
    TdlgFolderProperty.Create(nil).ShowCustomFolder(FolderName, SMSCount, BeginDate, EndDate, False)
  else
    TdlgFolderProperty.Create(nil).ShowSysFolder(FolderName, SMSCount, BeginDate, EndDate);
end;

procedure TfrmMain.dxmnuFolderRuleClick(Sender: TObject);
var
  FolderName: String;
  SMSCount: Integer;
  BeginDate: TDateTime;
  EndDate: TDateTime;
  dbQuery: TADOQuery;
begin
  // 显示文件夹属性
  dbQuery := TADOQuery.Create(nil);
  dbQuery.Connection := adoSMS;
  FolderName := tvwFolder.Selected.Text;
  dbQuery.SQL.Text := 'SELECT [receive].[receivedate] AS [date] FROM [receive] WHERE [receive].[folder] = ' + QuotedStr(FolderName) + ' ORDER BY [receive].[receivedate] ASC;';

  // 读取数据库中的内容
  dbQuery.Open;
  SMSCount := dbQuery.RecordCount;
  BeginDate := Now;
  EndDate := Now;
  if (SMSCount > 0) then
  begin
    dbQuery.First;
    BeginDate := dbQuery.FieldByName('date').AsDateTime;
    dbQuery.Last;
    EndDate := dbQuery.FieldByName('date').AsDateTime;
  end;

  dbQuery.Close;
  dbQuery.Free;

  TdlgFolderProperty.Create(nil).ShowCustomFolder(FolderName, SMSCount, BeginDate, EndDate, True);
end;

procedure TfrmMain.dxmnuEditMoveToClick(Sender: TObject);
var
  sNewFolder: String;
  pNode: PVirtualNode;
  pEntry: PShortMessageEntry;
  iSMS: array of Integer;
  iSelCol: TList;
  i: Integer;
begin
  // 选择自定义文件夹
  iSelCol := TList.Create();

  with TdlgMoveSMS.Create(nil) do
  begin
    SetLength(iSMS, vstSMS.SelectedCount);

    pNode := vstSMS.GetFirstSelected;

    for i := 0 to High(iSMS) do
    begin
      pEntry := vstSMS.GetNodeData(pNode);
      iSMS[i] := pEntry.InternalID;
      iSelCol.Add(Pointer(pEntry.InternalID));
      pNode := vstSMS.GetNextSelected(pNode);
    end;

    sNewFolder := ShowBox(iSMS);

    if Length(sNewFolder) = 0 then
    begin
      // 没有具体的文件夹制定
      tvwFolder.Items[1].Selected := True;
      RefreshView(iSelCol);
    end
    else if sNewFolder <> '#CANCELED#' then
    begin
      // 选择子文件夹
      for i := 0 to tvwFolder.Items.Count - 1 do
        if (tvwFolder.Items[i].Text = sNewFolder) and (tvwFolder.Items[i].ImageIndex = 0) then
        begin
          tvwFolder.Items[i].Selected := True;
          RefreshView(iSelCol);
        end;
    end;
  end;

  iSelCol.Free;
end;

procedure TfrmMain.dxmnuToolDesktopClick(Sender: TObject);
var
  FName: String;
begin
  FName := AppendPath(GetSpecialFolderDir(CSIDL_DESKTOP), 'Ultra SMS.LNK');
  if FileExists(FName) then
    MessageBox(Handle, '快捷方式已经存在，无法创建。', PChar(Forms.Application.Title), MB_ICONWARNING)
  else
  begin
    CreateLink(ParamStr(0), '', FName, 'Ultra SMS - GSM Mobile SMS Management Software');
    MessageBox(Handle, '快捷方式创建成功。', PChar(Forms.Application.Title), MB_ICONINFORMATION);
  end;
end;

procedure TfrmMain.dxmnuToolProgramClick(Sender: TObject);
var
  FName: String;
begin
  FName := AppendPath(GetSpecialFolderDir(CSIDL_PROGRAMS), 'Ultra SMS.LNK');
  if FileExists(FName) then
    MessageBox(Handle, '快捷方式已经存在，无法创建。', PChar(Forms.Application.Title), MB_ICONWARNING)
  else
  begin
    CreateLink(ParamStr(0), '', FName, 'Ultra SMS - GSM Mobile SMS Management Software');
    MessageBox(Handle, '快捷方式创建成功。', PChar(Forms.Application.Title), MB_ICONINFORMATION);
  end;
end;

procedure TfrmMain.dxmnuPBookAddClick(Sender: TObject);
begin
  AddContact('');
end;

procedure TfrmMain.dxmnuPBookDeleteClick(Sender: TObject);
var
  sNames, sPhones: TStringList;
  i: Integer;
  sql: TADOQuery;
begin
  // 删除联系人

  sNames := TStringList.Create;
  sPhones := TStringList.Create;

  for i := 0 to lvwPhonebook.Items.Count - 1 do
    if lvwPhonebook.Items[i].Selected then
    begin
      sNames.Add(lvwPhonebook.Items[i].Caption);
      sPhones.Add(lvwPhonebook.Items[i].SubItems[0]);
    end;

  //提示
  if MessageBox(Handle, PChar('即将删除以下的联系人，是否继续？'#13#10#13#10
    + FormatContactsStr(sNames, sPhones)), PChar(Forms.Application.Title),
    MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = IDYES then
  begin
    sql := TADOQuery.Create(nil);
    sql.Connection := adoContacts;

    for i := 0 to sPhones.Count - 1 do
    begin
      sql.SQL.Text := Format('DELETE FROM [contact] WHERE [contact].[phonenumber] = %s;', [QuotedStr(sPhones[i])]);
      sql.ExecSQL;
    end;
    
    sql.Free;

    lvwPhonebook.DeleteSelected;

    if Assigned(lvwPhonebook.ItemFocused) then
      lvwPhonebook.ItemFocused.Selected := True;
  end;

  // Free 对象
  sNames.Free;
  sPhones.Free;
end;

procedure TfrmMain.dxmnuPBookMoveClick(Sender: TObject);
var
  cName, cNumber, cCategory: String;
  sOriCategory: String;
begin
  // 添加联系人
  if lvwPhonebook.SelCount = 0 then exit;

  cName := lvwPhonebook.Selected.Caption;
  cNumber := lvwPhonebook.Selected.SubItems[0];
  if cbeCategory.ItemIndex <> 0 then cCategory := cbeCategory.Items[cbeCategory.ItemIndex];
  sOriCategory := cCategory;

  with TdlgAddContact.Create(nil) do
  begin
    if ShowEditContact(cName, cNumber, cCategory) then
    begin
      if (sOriCategory = cCategory) then
        with lvwPhonebook.Selected do
        begin
          lvwPhonebook.ClearSelection;
          Caption := cName;
          SubItems[0] := cNumber;
          ImageIndex := 2;
          Selected := True;
          Focused := True;
        end
      else
        RefreshCategory(cCategory, cNumber);
    end;

    Free;
  end;
end;

procedure TfrmMain.tvwFolderKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = []) and (dxmnuFolderDel.Enabled) then
    dxmnuFolderDelClick(Sender);

  if (Key = VK_RETURN) and (Shift = [ssAlt]) then
    dxmnuFolderProperty.Click;
end;

procedure TfrmMain.txtPinyinChange(Sender: TObject);
begin
  cbeCategorySelect(txtPinyin);  
end;

procedure TfrmMain.txtPinyinKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    txtPinyin.Text := '';

//  if (Key = VK_RETURN) and (Shift = []) then
//    lvwPhonebookDblClick(nil);

  if (not (Char(Key) in ['a'..'z', 'A'..'Z'])) and (Key <> VK_DELETE) then
    PostMessage(lvwPhonebook.Handle, WM_KEYDOWN, Key, 0);

end;

procedure TfrmMain.txtPinyinKeyPress(Sender: TObject; var Key: Char);
begin
  // 只允许输入字符
  case Key of
  'a'..'z': Inc(Key, - Ord('a') + Ord('A'));
  'A'..'Z': ;
  #8: ;
  else
    Key := #0;
  end;
end;

procedure TfrmMain.lvwPhonebookKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = []) and (dxmnuPBookDelete.Enabled) then
    dxmnuPBookDeleteClick(Sender);

  if (Key = VK_RETURN) and (Shift = []) then
    lvwPhonebookDblClick(nil);
end;

procedure TfrmMain.vstSMSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift = []) and (dxmnuEditDelete.Enabled) then
    dxmnuEditDeleteClick(Sender);

  if (Key = VK_RETURN) and (Shift = []) then
    dxmnuFileOpen.Click;
end;

procedure TfrmMain.lvwPhonebookInfoTip(Sender: TObject; Item: TListItem;
  var InfoTip: String);
begin
  // 显示联系人信息
  if dxmnuPBookShowInfo.Down then
  begin
    InfoTip := '';
    if not ffmContact.Visible then
    begin  
      ffmContact.ShowContactInfo(Item.Caption);
      SetFocus;
    end;
  end;        
end;

procedure TfrmMain.dxmnuSMSSenderClick(Sender: TObject);
var
  AInternalIDs: TStringList;
  pNode: PVirtualNode;
  pItem: PShortMessageEntry;
begin
  AInternalIDs := TStringList.Create;

  pNode := vstSMS.GetFirstSelected;

  while Assigned(pNode) do
  begin
    pItem := vstSMS.GetNodeData(pNode);
    AInternalIDs.Add(IntToStr(pItem.InternalID));
    pNode := vstSMS.GetNextSelected(pNode);
  end;  

  if AInternalIDs.Count > 0 then
    with TdlgContactInfo.Create(nil) do
    begin
      ShowContactInfo(AInternalIDs, CurrentView);
    end;

  AInternalIDs.Free;
end;

procedure TfrmMain.fraFilterbtnRefreshClick(Sender: TObject);
begin
  fraFilter.btnRefreshClick(Sender);
end;

procedure TfrmMain.dxmnuPBookInfoClick(Sender: TObject);
begin
  if (not ffmContact.Visible) and Assigned(lvwPhonebook.Selected) then
  begin
    ffmContact.ShowContactInfo(lvwPhonebook.Selected.Caption);
    SetFocus;
  end;
end;

procedure TfrmMain.dxmnuFileSaveClick(Sender: TObject);
begin
  sdExport.DefaultExt := 'TXT';
  sdExport.InitialDir := GetCurrentDir;
  sdExport.Filter := 'TXT - 文本文件|*.TXT|*.* - 全部文件|*.*';
  sdExport.FilterIndex := 0;
  sdExport.Title := '短信另存为';

  if sdExport.Execute then
    fraInfoPreview.txtContent.Lines.SaveToFile(sdExport.FileName);
end;

procedure TfrmMain.dxmnuPBookExportClick(Sender: TObject);
var
  db: TADOQuery;
  fs: TFileStream;
  swrite: string;
begin
  sdExport.DefaultExt := 'XML';
  sdExport.InitialDir := GetCurrentDir;
  sdExport.Filter := 'XML - eXtensible Markup Language|*.XML|' +
    'ADTG - Advanced Data Tablegram|*.ADTG|' +
    'CSV - Comma-Separated Variables|*.CSV|' +
    'TXT - Tab-Separated Text File|*.TXT|' +
    '*.* - 全部文件|*.*';
  sdExport.FilterIndex := 0;
  sdExport.Title := '导出电话簿';

  try
    if sdExport.Execute then
    begin
      db := TADOQuery.Create(nil);
      db.Connection := adoContacts;
      db.SQL.Text := 'SELECT * FROM contact ORDER BY name;';
      db.Open;

      case sdExport.FilterIndex of
        1: db.SaveToFile(sdExport.FileName, pfXML);
        2: db.SaveToFile(sdExport.FileName, pfADTG);
        3:
        begin
          fs := TFileStream.Create(sdExport.FileName, fmCreate);

          while not db.Eof do
          begin
            swrite := db.FieldByName('name').AsString + ',' +
              db.FieldByName('phonenumber').AsString + #13#10;
            fs.WriteBuffer(Pointer(swrite)^, Length(swrite));
            db.Next;
          end;

          fs.Free;
        end;
      else
        begin
          fs := TFileStream.Create(sdExport.FileName, fmCreate);

          while not db.Eof do
          begin
            swrite := db.FieldByName('name').AsString + #9 +
              db.FieldByName('phonenumber').AsString + #13#10;
            fs.WriteBuffer(Pointer(swrite)^, Length(swrite));
            db.Next;
          end;

          fs.Free;
        end;
      end;

      db.Close;
      db.Free;
    end;
  except
    on E: Exception do MessageBox(Handle, PChar(E.Message), 
      PChar(Forms.Application.Title), MB_OK + MB_ICONSTOP);
  end;          

end;

procedure TfrmMain.wbIntroBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  Cmd: String;
  wWriteSMSWnd: TfrmWriteSMS;
  wReadSMSWnd: TfrmReadSMS;
//  pData: PShortMessageEntry;
  iInternalID: Integer;
  xItem: TListItem;
begin
  // 处理命令
  if AnsiStartsText('ultrasms://', URL) then
  begin
    Cancel := True;
    Cmd := URL;

    if AnsiEndsText('/', Cmd) then
      Delete(Cmd, Length(Cmd), 1);

    Delete(Cmd, 1, 11);

    // 分析是不是 command 集合
    if AnsiStartsText('command.', Cmd) then
    begin
      Delete(Cmd, 1, 8);

      if (StrIComp(PChar(Cmd), 'connect') = 0) and (not Connected) then
        OpenPortDef
      else if (StrIComp(PChar(Cmd), 'connectwiz') = 0) then
        dxmnuFileConnectWizard.Click
      else if (StrIComp(PChar(Cmd), 'disconnect') = 0) and (Connected) then
        ClosePort
      else if (StrIComp(PChar(Cmd), 'writesms') = 0) then
        dxmnuSMSNew.Click
      else if (StrIComp(PChar(Cmd), 'sendsms') = 0) and (Connected) then
        dxmnuSMSSend.Click
      else if (StrIComp(PChar(Cmd), 'readpbook') = 0) and (Connected) then
        dxmnuPBookPhone.Click
      else if (StrIComp(PChar(Cmd), 'setpass') = 0) then
        dxmnuFilePassword.Click
      else if (StrIComp(PChar(Cmd), 'open_receive') = 0) then
      begin
        tvwFolder.ClearSelection(False);
        tvwFolder.Items[1].Selected := True;
        tvwFolderChange(nil, tvwFolder.Selected);
      end
      else if (StrIComp(PChar(Cmd), 'open_send') = 0) then
      begin
        tvwFolder.Items[2].Selected := True;
        tvwFolderChange(nil, tvwFolder.Selected);
      end
      else if (StrIComp(PChar(Cmd), 'open_finish') = 0) then
      begin
        tvwFolder.Items[3].Selected := True;
        tvwFolderChange(nil, tvwFolder.Selected);
      end
      else if (StrIComp(PChar(Cmd), 'open_draft') = 0) then
      begin
        tvwFolder.Items[4].Selected := True;
        tvwFolderChange(nil, tvwFolder.Selected);
      end;
    end
    else if AnsiStartsText('view_receive', Cmd) then
    begin
      Delete(Cmd, 1, 13);
      iInternalID := StrToIntDef(Cmd, 0);

      if QueryWindow('receive', IntToStr(iInternalID)) then
        Exit;

      // 打开(收件箱)
      wReadSMSWnd := TfrmReadSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 2;
      xItem.Data := Pointer(wReadSMSWnd.Handle);
      xItem.Caption := '阅读短信 (收件箱)';

      // 填充一些信息
      wReadSMSWnd.OpenSMS(bReceive, iInternalID);
      wReadSMSWnd.Show;
      xItem.SubItems.Add('receive');
      xItem.SubItems.Add(IntToStr(iInternalID));
    end
    else if AnsiStartsText('view_send', Cmd) then
    begin
      Delete(Cmd, 1, 10);
      iInternalID := StrToIntDef(Cmd, 0);

      if QueryWindow('send', IntToStr(iInternalID)) then
        Exit;

      // 打开发件箱
      wReadSMSWnd := TfrmReadSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 2;
      xItem.Data := Pointer(wReadSMSWnd.Handle);
      xItem.Caption := '阅读短信 (发件箱)';

      // 填充一些信息
      wReadSMSWnd.OpenSMS(bSend, iInternalID);
      wReadSMSWnd.Show;
      xItem.SubItems.Add('send');
      xItem.SubItems.Add(IntToStr(iInternalID));
    end
    else if AnsiStartsText('view_finish', Cmd) then
    begin
      Delete(Cmd, 1, 12);
      iInternalID := StrToIntDef(Cmd, 0);

      if QueryWindow('finish', IntToStr(iInternalID)) then
        Exit;

      // 打开草稿箱
      wReadSMSWnd := TfrmReadSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 2;
      xItem.Data := Pointer(wReadSMSWnd.Handle);
      xItem.Caption := '阅读短信 (已发送的短信)';

      // 填充一些信息
      wReadSMSWnd.OpenSMS(bFinish, iInternalID);
      wReadSMSWnd.Show;
      xItem.SubItems.Add('finish');
      xItem.SubItems.Add(IntToStr(iInternalID));
    end
    else if AnsiStartsText('view_draft', Cmd) then
    begin
      Delete(Cmd, 1, 11);
      iInternalID := StrToIntDef(Cmd, 0);

      if QueryWindow('draft', IntToStr(iInternalID)) then
        Exit;

      // 打开草稿箱
      wWriteSMSWnd := TfrmWriteSMS.Create(nil);
      xItem := lvwWindow.Items.Add;
      xItem.ImageIndex := 1;
      xItem.Data := Pointer(wWriteSMSWnd.Handle);
      xItem.Caption := '撰写短信';

      // 填充一些信息
      wWriteSMSWnd.ShowDraft(iInternalID);
      xItem.SubItems.Add('draft');
      xItem.SubItems.Add(IntToStr(iInternalID));
    end;
  end;
end;

procedure TfrmMain.dxmnuFilePasswordClick(Sender: TObject);
var
  Cmd: String;
  ARunThread: TRunCmd;
begin
  if MessageBox(Handle,
    '修改数据库必须关闭本程序，在数据库未使用的时候修改，您是否要立刻关闭本程序？',
    PChar(Forms.Application.Title), MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    Cmd := '"' + AppendPath(sPath, 'runafter.exe') + '" ';
    Cmd := Cmd + IntToStr(GetCurrentProcessId);
    Cmd := Cmd + ' -1 "' + AppendPath(sPath, 'dbutly.exe') + ' /SKIPINTROPAGE /RUNAPP /QUIET /ALTERPASSWORD"';
//    CreateProcess(nil, PChar(Cmd), nil, nil, False, 0, nil, PChar(sPath), sinfo, tmp);
    ARunThread := TRunCmd.Create(True);
    ARunThread.Cmd := Cmd;
    ARunThread.Suspended := False;
    Sleep(500);
    Close;
  end;
end;

procedure TfrmMain.dxmnuViewCustomClick(Sender: TObject);
begin
  dxbmMain.Customizing(True);
end;

procedure TfrmMain.dxmnuToolOptionClick(Sender: TObject);
var
  dlgOption: TdlgOption;
begin
  dlgOption := TdlgOption.Create(Self);
  dlgOption.ShowModal;
  dlgOption.Free;

end;

procedure TfrmMain.dxmnuHelpMailClick(Sender: TObject);
begin
  // 给作者发邮件
  ShellExecute(Handle, nil, 'mailto:chenminglong21cn@21cn.com' +
    '?subject=给 Ultra SMS 作者的一封信', nil, nil, SW_SHOW);
end;

procedure TfrmMain.dxmnuHelpSMSClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // 创建一个新的撰写短信的窗口
  wWriteSMSWnd := TfrmWriteSMS.Create(nil);
  xItem := lvwWindow.Items.Add;
  xItem.ImageIndex := 1;
  xItem.Data := Pointer(wWriteSMSWnd.Handle);
  xItem.SubItems.Add('draft');
  xItem.SubItems.Add('0');
  xItem.Caption := '撰写短信';
  wWriteSMSWnd.NewSMS;
  wWriteSMSWnd.AppendOneContact('陈明龙', '+8613237148643');
  wWriteSMSWnd.Modified := False;
end;

procedure TfrmMain.dxmnuHelpTopicClick(Sender: TObject);
begin
  HtmlHelp(Handle, Forms.Application.HelpFile, HH_DISPLAY_TOPIC, nil);
  HtmlHelp(Handle, Forms.Application.HelpFile, HH_DISPLAY_TOC, nil);
end;

procedure TfrmMain.dxmnuHelpIndexClick(Sender: TObject);
begin
  HtmlHelp(Handle, Forms.Application.HelpFile, HH_DISPLAY_TOPIC, nil);
  HtmlHelp(Handle, Forms.Application.HelpFile, HH_DISPLAY_INDEX, nil);
end;

procedure TfrmMain.dxmnuHelpSearchClick(Sender: TObject);
begin
  HtmlHelp(Handle, Forms.Application.HelpFile, HH_DISPLAY_TOPIC, nil);
  HtmlHelp(Handle, Forms.Application.HelpFile, HH_DISPLAY_SEARCH, nil);
end;

procedure TfrmMain.dxmnuHelpFlydragonClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://www.alexstudio.cn', nil, nil, SW_SHOW);
end;

procedure TfrmMain.dxmnuHelpSoftClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://alexanderchen.ys168.com', nil, nil, SW_SHOW);
end;

procedure TfrmMain.dxmnuHelpWebsiteClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://ultrasms.alexstudio.cn', nil, nil, SW_SHOW);
end;

procedure TfrmMain.dxmnuFileConnectSettingsClick(Sender: TObject);
begin
  if Connected = True then
    if MessageBox(Handle, 
      '在您更改连接设置之前必须先断开连接，是否现在断开连接？',
      PChar(Forms.Application.Title), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) =
      IDYES then
      ClosePort
    else
      Exit;


  // 开始连接向导
  with TdlgConnect.Create(nil) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

procedure TfrmMain.RefreshCategory(CurCategory: String = ''; ASelection: String = '');
var
  tbTable: TADOTable;
  i: Integer;
begin
  tbTable := TADOTable.Create(nil);
  tbTable.Connection := adoContacts;
  tbTable.TableName := 'category';
  tbTable.Open;

  cbeCategory.Clear;
  cbeCategory.AddItem('<所有联系人>', nil);
  cbeCategory.AddItem('<无类别>', nil);
  if Length(CurCategory) = 0 then cbeCategory.ItemIndex := 0;
  cbeCategory.ItemsEx[0].ImageIndex := 3;
  cbeCategory.ItemsEx[1].ImageIndex := 1;
  while not tbTable.Eof do
  begin
    if tbTable.FieldByName('category').AsString <> '' then
      with cbeCategory.ItemsEx.Add do
      begin
        Caption := tbTable.FieldByName('category').AsString;
        ImageIndex := 0;
        if CurCategory = Caption then
          cbeCategory.ItemIndex := Index;
      end;
    tbTable.Next;
  end;
  tbTable.Close;
  tbTable.Free;

  cbeCategorySelect(nil);

  if ASelection = '' then
    for i := 0 to lvwPhonebook.Items.Count - 1 do
      if lvwPhonebook.Items[i].SubItems[0] = ASelection then
      begin
        lvwPhonebook.Items[i].Selected := True;
        lvwPhonebook.Items[i].Focused := True;
        Break;
      end
  else
  begin
    lvwPhonebook.Items[0].Selected := True;
    lvwPhonebook.Items[0].Focused := True;
  end;


end;

procedure TfrmMain.dxmnuPBookNewCategoryClick(Sender: TObject);
var
  dlgCategory: TdlgCategory;
begin
  dlgCategory := TdlgCategory.Create(nil);
  dlgCategory.ShowNewCategory;
  dlgCategory.Free;
end;

procedure TfrmMain.dxmnuPBookEditCategoryClick(Sender: TObject);
var
  dlgCategory: TdlgCategory;
begin
  if cbeCategory.ItemsEx[cbeCategory.ItemIndex].ImageIndex = 0 then
  begin
    dlgCategory := TdlgCategory.Create(nil);
    dlgCategory.ShowEditCategory(cbeCategory.ItemsEx[cbeCategory.ItemIndex].Caption);
    dlgCategory.Free;
  end;
end;

procedure TfrmMain.cbeCategoryContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  popCategory.PopupFromCursorPos;
  Handled := True;
end;

procedure TfrmMain.tvwFolderContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  popFolder.PopupFromCursorPos;
  Handled := True;
end;

procedure TfrmMain.lvwPhonebookContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  popPBook.PopupFromCursorPos;
  Handled := True;
end;

procedure TfrmMain.vstSMSContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  popSMS.PopupFromCursorPos;
  Handled := True;
end;

procedure TfrmMain.lvwModemContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  popModem.PopupFromCursorPos;
  Handled := True;
end;

procedure TfrmMain.lvwModemCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
const
  cInfo: TColor = $00FFF2E0;
  cUpload: TColor = $00C4FCFC;
  cDownload: TColor = $00D3F7E0;
  cError: TColor = $00DAE0FF;
var
  cColor: array[0..3] of TColor;
  i: Integer;
begin
  cColor[0] := cInfo;
  cColor[1] := cUpload;
  cColor[2] := cDownload;
  cColor[3] := cError;

  // 绘制背景颜色
  if (Item <> nil) and (Word(State) > 0) then
  begin
    i := Item.ImageIndex;
    Sender.Canvas.Brush.Color := cColor[i];
    Sender.Canvas.FillRect(Item.DisplayRect(drBounds));
  end;
end;

procedure TfrmMain.dxmnuPBookDelCategoryClick(Sender: TObject);
var
//  bSelContacts: Boolean;
  sCategory: String;
  rlt: Integer;
  sql: TADOQuery;
begin
  // 删除一个类别
  if cbeCategory.ItemsEx[cbeCategory.ItemIndex].ImageIndex <> 0 then Exit;

  sCategory := cbeCategory.ItemsEx[cbeCategory.ItemIndex].Caption;

  rlt := MessageBox(Handle, PChar(Format('是否要删除“%s”类别下的所有联系人？' +
    #13#10#13#10 + '* 选择“是”，删除类别和类别下的所有联系人' + #13#10 +
    '* 选择“否”，删除类别并且移动到类别下联系人到“无类别”中' + #13#10 +
    '* 选择“取消”，取消删除类别', [sCategory])), PChar(Forms.Application.Title),
    MB_YESNOCANCEL + MB_ICONQUESTION + MB_DEFBUTTON3);

  if rlt = IDCANCEL then Exit;

  sql := TADOQuery.Create(nil);
  sql.Connection := adoContacts;
  sql.SQL.Add('DELETE FROM [category] WHERE [category].[category] = ' + QuotedStr(sCategory) + ';');
  sql.ExecSQL;

  sql.SQL.Clear;

  if rlt = IDYES then
    sql.SQL.Add('DELETE FROM [contact] WHERE [category] = ' + QuotedStr(sCategory) + ';')
  else
    sql.SQL.Add('UPDATE [contact] SET [category] = NULL WHERE [category] = ' + QuotedStr(sCategory) + ';');

  sql.ExecSQL;
  sql.Free;

  RefreshCategory;
end;

procedure TfrmMain.dxmnuToolSaveModemClick(Sender: TObject);
var
  slText: TStringList;
  i: Integer;
begin
  slText := TStringList.Create;

  slText.Add('事件   时间                      内容                   ');
  slText.Add('====   =======================   =======================');

  for i := 0 to lvwModem.Items.Count - 1 do
    slText.Add(lvwModem.Items[i].Caption + '   ' +
               lvwModem.Items[i].SubItems[0] + '   ' +
               lvwModem.Items[i].SubItems[1]);

  Clipboard.AsText := slText.Text;
  slText.Free;
end;

procedure TfrmMain.dxmnuToolClearModemClick(Sender: TObject);
begin
  lvwModem.Clear;
end;

procedure TfrmMain.dxmnuToolSaveToFileClick(Sender: TObject);
var
  slText: TStringList;
  sFile: String;
  i: Integer;
begin
  sdExport.Filter := 'TXT - 文本文件|*.txt|LOG - 记录文件|*.LOG|所有文件|*.*';
  if sdExport.Execute = False then Exit;
  sFile := sdExport.FileName;

  slText := TStringList.Create;

  slText.Add('事件   时间                      内容                   ');
  slText.Add('====   =======================   =======================');

  for i := 0 to lvwModem.Items.Count - 1 do
    slText.Add(lvwModem.Items[i].Caption + '   ' +
               lvwModem.Items[i].SubItems[0] + '   ' +
               lvwModem.Items[i].SubItems[1]);
  slText.SaveToFile(sFile);
  slText.Free;
end;

procedure TfrmMain.dxmnuHelpAboutClick(Sender: TObject);
var
  dlgAbout: TdlgAbout;
begin
  dlgAbout := TdlgAbout.Create(Self);
  dlgAbout.ShowModal;
  dlgAbout.Free;
end;

procedure TfrmMain.aeDefaultActivate(Sender: TObject);
begin
  if not FMinimized then
    ctiMain.ShowMainForm;
end;

procedure TfrmMain.popOpenUnreadClick(Sender: TObject);
var
  sql: TADOQuery;
  wReadSMSWnd: TfrmReadSMS;
  xItem: TListItem;
begin
  // 查询数据库
  sql := TADOQuery.Create(nil);
  sql.Connection := adoSMS;
  sql.SQL.Add('SELECT TOP 1 [receive].[internalid]');
  sql.SQL.Add('FROM [receive]');
  sql.SQL.Add('WHERE [receive].[read] = False');
  sql.SQL.Add('ORDER BY [receive].[receivedate] DESC;');
  sql.Open;

  if not ((sql.Eof = True) and (sql.Bof = True)) then
  begin
    // 打开收件箱
    wReadSMSWnd := TfrmReadSMS.Create(nil);
    xItem := lvwWindow.Items.Add;
    xItem.ImageIndex := 2;
    xItem.Data := Pointer(wReadSMSWnd.Handle);
    xItem.Caption := '阅读短信 (收件箱)';

    // 填充一些信息
    wReadSMSWnd.OpenSMS(bReceive, sql.FieldByName('internalid').AsInteger);
    wReadSMSWnd.Show;
//    wReadSMSWnd.BringToFront;
    SetForegroundWindow(wReadSMSWnd.Handle);
    xItem.SubItems.Add('receive');
    xItem.SubItems.Add(IntToStr(sql.FieldByName('internalid').AsInteger));
  end
  else
    MessageBeep(MB_ICONASTERISK);

  sql.Close;
  sql.Free;
end;

procedure TfrmMain.popReplayUnreadClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
  sql: TADOQuery;
begin
  // 查询数据库
  sql := TADOQuery.Create(nil);
  sql.Connection := adoSMS;
  sql.SQL.Add('SELECT TOP 1 [receive].[internalid]');
  sql.SQL.Add('FROM [receive]');
  sql.SQL.Add('WHERE [receive].[read] = False');
  sql.SQL.Add('ORDER BY [receive].[receivedate] DESC;');
  sql.Open;

  if not ((sql.Eof = True) and (sql.Bof = True)) then
  begin
    // 打开草稿箱
    wWriteSMSWnd := TfrmWriteSMS.Create(nil);
    xItem := lvwWindow.Items.Add;
    xItem.ImageIndex := 1;
    xItem.Data := Pointer(wWriteSMSWnd.Handle);
    xItem.Caption := '回复短信';

    // 填充一些信息
    wWriteSMSWnd.NewReply(sql.FieldByName('internalid').AsInteger);
    xItem.SubItems.Add('draft');
    xItem.SubItems.Add(IntToStr(0));
//    wWriteSMSWnd.BringToFront;
    SetForegroundWindow(wWriteSMSWnd.Handle);
  end
  else
    MessageBeep(MB_ICONASTERISK);

  sql.Close;
  sql.Free;
end;

procedure TfrmMain.RefreshHotKey;
var
  i: Word;
begin
  // 更新热键的内容
  hkmDefault.ClearHotKeys;

  // 添加热键
  if opGlobalHotKey then
    for i := 0 to HotKeyNumber do
      if HotKeyList[i] <> 0 then
        if hkmDefault.AddHotKey(HotKeyList[i]) = 0 then
          MessageBox(Handle, PChar(Format('“%s”热键冲突，注册热键失败。',
            [HotKeyToText(HotKeyList[i], True)])), PChar(Caption), MB_OK + MB_ICONWARNING);
end;

procedure TfrmMain.hkmDefaultHotKeyPressed(HotKey: Cardinal; Index: Word);
var
  i: Integer;
begin
  // 查找热键的内容
  for i := 0 to HotKeyNumber do
    if HotKeyList[i] = HotKey then
      case i of
        0: popTrayNewMSG.Click;
        1: popTrayShow.Click;
        2: dxmnuSMSProperty.Click;// popTrayExit.Click;
        3: popOpenUnread.Click;
        4: popReplayUnread.Click;
        5: dxmnuFileConnectWizard.Click;
        6: dxbtnConnect.Click;
        7: popTrayReceive.Click;
        8: popTraySend.Click;
        9: popTraySnycPhoneBook.Click;
      end;
end;

procedure TfrmMain.LoadConnectionSettings;
var
  ini: TIniFile;
  fn: String;
  ComputerName: String;
  rtl: Cardinal;
begin
  fn := AppendPath(sPath, 'Connections.INI');

  if FileExists(fn) then
  begin
    ini := TIniFile.Create(fn);
    SetLength(ComputerName, MAX_PATH);
    rtl := MAX_PATH;
    GetComputerName(@ComputerName[1], rtl);
    ComputerName := LeftStr(ComputerName, rtl);
    
    if ini.SectionExists(ComputerName) then
    begin
      cmModem.BaudRate := ini.ReadInteger(ComputerName, 'BaudRate', cmModem.BaudRate);
      cmModem.ByteSize := TByteSize(ini.ReadInteger(ComputerName, 'ByteSize', 0));
      cmModem.Parity := TParity(ini.ReadInteger(ComputerName, 'Parity', 0));
      cmModem.ParityCheck := ini.ReadBool(ComputerName, 'ParityCheck', False);
      cmModem.StopBits := TStopBits(ini.ReadInteger(ComputerName, 'StopBits', 0));
      cmModem.CommName := ini.ReadString(ComputerName, 'CommName', cmModem.CommName);
    end;
  end;
end;

procedure TfrmMain.dxmnuToolHotKeyClick(Sender: TObject);
var
  dlgHotKey: TdlgHotKey;
begin
  dlgHotKey := TdlgHotKey.Create(Self);

  if Assigned(dlgHotKey) then
    dlgHotKey.ShowModal;

  dlgHotKey.Free;
end;

procedure TfrmMain.RefreshJobMenuState;
begin
  if JobThread.JobContent.Count = 0 then
  begin
    dxmnuJobCancelCurrent.Enabled := False;
    dxmnuJobCancelQueue.Enabled := False;
    dxmnuJobCancelDulp.Enabled := False;
    dxmnuJobCancelSel.Enabled := False;
  end
  else
  begin
    dxmnuJobCancelCurrent.Enabled := lvwJob.Items[0].ImageIndex = 1;
    dxmnuJobCancelQueue.Enabled := JobThread.JobContent.Count > 1;
    dxmnuJobCancelDulp.Enabled := dxmnuJobCancelQueue.Enabled;
    dxmnuJobCancelSel.Enabled := lvwJob.SelCount > 0;
  end;

  if lvwJob.SelCount = 0 then
  begin
    dxmnuJobTop.Enabled := False;
    dxmnuJobPromote.Enabled := False;
    dxmnuJobDegrade.Enabled := False;
    dxmnuJobBottom.Enabled := False;
  end
  else
  begin
    dxmnuJobTop.Enabled := lvwJob.Selected.Index > 1;
    dxmnuJobPromote.Enabled := dxmnuJobTop.Enabled;
    dxmnuJobDegrade.Enabled := lvwJob.Selected.Index < lvwJob.Items.Count - 1;
    dxmnuJobBottom.Enabled := dxmnuJobDegrade.Enabled;
  end;    
end;

procedure TfrmMain.dxmnuJobCancelCurrentClick(Sender: TObject);
begin
  JobThread.Abortion := True;
end;

procedure TfrmMain.lvwJobChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  RefreshJobMenuState;
end;

{$IFNDEF DEBUG}
procedure TfrmMain.aeDefaultException(Sender: TObject; E: Exception);
begin
  AddModemStaus(tsError, '发生内部错误: ' + E.Message);
end;
{$ENDIF}

procedure TfrmMain.CancelQueue(Index: Integer);
var
  SQL: TADOQuery;
  AJob: TSMSJob;
begin
  // 如果是发送的任务要回存到发件箱里面
  if JobThread.JobContent.Items[Index].JobKind = jkSend then
  begin
    AJob := JobThread.JobContent.Items[Index];
    SQL := TADOQuery.Create(nil);
    SQL.Connection := adoSMS;
    SQL.SQL.Add('INSERT INTO send ([senderdate], [addressee], [number], [content], [finishid])');
    SQL.SQL.Add(Format('VALUES ("%s", "%s", "%s", "%s", %d);',
      [DateTimeToStr(Now), AJob.Name, AJob.Destination, AJob.Content, AJob.FinishID]));
    SQL.ExecSQL;
    SQL.Free;
  end;

  lvwJob.Items.Delete(Index);
  JobThread.JobContent.Delete(Index);
end;

procedure TfrmMain.dxmnuJobCancelQueueClick(Sender: TObject);
var
  i: Integer;
begin
  // 取消正在排队的作业
  if JobThread.JobContent.Count > 1 then
  begin
    i := 1;
    while not (i > JobThread.JobContent.Count - 1) do
      CancelQueue(i);
  end;
end;

procedure TfrmMain.dxmnuJobCancelDulpClick(Sender: TObject);
var
  i: Integer;
  bQueryNew, bReceive, bPBook: Boolean;
begin
  if JobThread.JobContent.Count > 0 then
  begin
    bQueryNew := JobThread.JobContent.Items[0].JobKind = jkQueryNew;
    bReceive := JobThread.JobContent.Items[0].JobKind = jkReceive;
    bPBook := JobThread.JobContent.Items[0].JobKind = jkReadPhoneBook;
  end
  else
    Exit;    

  // 取消重复的任务
  if JobThread.JobContent.Count > 1 then
  begin
    i := 1;
    while not (i > JobThread.JobContent.Count - 1) do
      case JobThread.JobContent.Items[i].JobKind of
        jkReceive:
        begin
          if bReceive then CancelQueue(i) else Inc(i);
          bReceive := True;
        end;
        jkQueryNew:
        begin
          if bQueryNew then CancelQueue(i) else Inc(i);
          bQueryNew := True;
        end;
        jkReadPhoneBook:
        begin
          if bPBook then CancelQueue(i) else Inc(i);
          bPBook := True;
        end;
        else
          Inc(i);
      end;

    RefreshJobListNumber;
  end;
end;

procedure TfrmMain.dxmnuJobCancelSelClick(Sender: TObject);
begin
  if lvwJob.Selected.Index = 0 then
    JobThread.Abortion := True
  else
  begin
    CancelQueue(lvwJob.Selected.Index);
    RefreshJobListNumber;
  end;
end;

procedure TfrmMain.RefreshJobListNumber;
var
  i: Integer;
begin
    for i := 0 to frmMain.lvwJob.Items.Count - 1 do
      frmMain.lvwJob.Items[i].Caption := IntToStr(i + 1);
end;

procedure TfrmMain.dxmnuJobTopClick(Sender: TObject);
var
  i: Integer;
begin
  i := lvwJob.Selected.Index;

  if (JobThread.JobContent.Count > 2) and (i > 1) then
  begin
    SetCollectionItemIndex(lvwJob.Items, lvwJob.Selected, 1);
    SetCollectionItemIndex(JobThread.JobContent, JobThread.JobContent.Items[i], 1);
    lvwJob.Items[1].Selected := True;
    RefreshJobListNumber;
  end;
end;

procedure TfrmMain.dxmnuJobPromoteClick(Sender: TObject);
var
  i: Integer;
begin
  i := lvwJob.Selected.Index;

  if (JobThread.JobContent.Count > 2) and (i > 1) then
  begin
    SetCollectionItemIndex(lvwJob.Items, lvwJob.Selected, i - 1);
    SetCollectionItemIndex(JobThread.JobContent, JobThread.JobContent.Items[i], i - 1);
    lvwJob.Items[i - 1].Selected := True;
    RefreshJobListNumber;
  end;
end;

procedure TfrmMain.dxmnuJobDegradeClick(Sender: TObject);
var
  i: Integer;
begin
  i := lvwJob.Selected.Index;

  if (JobThread.JobContent.Count > 2) and (i > 0) and (i < JobThread.JobContent.Count - 1) then
  begin
    SetCollectionItemIndex(lvwJob.Items, lvwJob.Selected, i + 1);
    SetCollectionItemIndex(JobThread.JobContent, JobThread.JobContent.Items[i], i + 1);
    lvwJob.Items[i + 1].Selected := True;
    RefreshJobListNumber;
  end;
end;

procedure TfrmMain.dxmnuJobBottomClick(Sender: TObject);
var
  i: Integer;
begin
  i := lvwJob.Selected.Index;

  if (JobThread.JobContent.Count > 2) and (i > 0) and (i < JobThread.JobContent.Count - 1) then
  begin
    SetCollectionItemIndex(lvwJob.Items, lvwJob.Selected, JobThread.JobContent.Count - 1);
    SetCollectionItemIndex(JobThread.JobContent, JobThread.JobContent.Items[i], JobThread.JobContent.Count - 1);
    lvwJob.Items[JobThread.JobContent.Count - 1].Selected := True;
    RefreshJobListNumber;
  end;
end;

procedure TfrmMain.dxmnuViewTBRFolderClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('FolderToolbar').Visible := dxmnuViewTBRFolder.Down;
end;

procedure TfrmMain.dxmnuViewTBRPBokkClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('PBookToolbar').Visible := dxmnuViewTBRPBokk.Down;
end;

procedure TfrmMain.dxmnuViewTBRModemClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('ModemToolbar').Visible := dxmnuViewTBRModem.Down;
end;

procedure TfrmMain.dxmnuViewTBRJobClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('JobToolbar').Visible := dxmnuViewTBRJob.Down;
end;

procedure TfrmMain.dxmnuViewTBRWindowClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('WindowToolbar').Visible := dxmnuViewTBRWindow.Down;
end;

procedure TfrmMain.dxbmMainBarVisibleChange(Sender: TdxBarManager;
  ABar: TdxBar);
begin
  case ABar.Index of
    1: dxmnuViewToolbar.Down := ABar.Visible;
    2: dxmnuViewTBRFolder.Down := ABar.Visible;
    3: dxmnuViewTBRPBokk.Down := ABar.Visible;
    4: dxmnuViewTBRModem.Down := ABar.Visible;
    6: dxmnuViewTBRJob.Down := ABar.Visible;
    5: dxmnuViewTBRWindow.Down := ABar.Visible;
  end;
end;

procedure TfrmMain.PrepareForExpert(DLG: TdlgExport);
var
  PNode: PVirtualNode;
  PSMS: PShortMessageEntry;
begin
  // 获得 相关项目的 数据
  if CurrentView <> cvNone then
  begin
    PNode := vstSMS.GetFirst;

    while Assigned(PNode) do
    begin
      PSMS := vstSMS.GetNodeData(PNode);
      DLG.AllInternalIDs.Add(Pointer(PSMS.InternalID));
      if vsSelected in PNode.States then
        DLG.SelInternalIDs.Add(Pointer(PSMS.InternalID));
      PNode := vstSMS.GetNext(PNode);
    end;  
  end;  
end;  

procedure TfrmMain.dxmnuFileWordClick(Sender: TObject);
var
  dlgExport: TdlgExport;
begin
  // 打开导出文件对话框
  dlgExport := TdlgExport.Create(Self, 2);
  PrepareForExpert(dlgExport);
  dlgExport.ShowModal;
  dlgExport.Free;
end;

procedure TfrmMain.dxmnuFileExportHTMLClick(Sender: TObject);
var
  dlgExport: TdlgExport;
begin
  // 打开导出文件对话框
  dlgExport := TdlgExport.Create(Self, 3);
  PrepareForExpert(dlgExport);
  dlgExport.ShowModal;
  dlgExport.Free;
end;

procedure TfrmMain.dxmnuFileExportTXTClick(Sender: TObject);
var
  dlgExport: TdlgExport;
begin
  // 打开导出文件对话框
  dlgExport := TdlgExport.Create(Self, 1);
  PrepareForExpert(dlgExport);
  dlgExport.ShowModal;
  dlgExport.Free;
end;

procedure TfrmMain.dxtxtModemCmdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CMD, SavedText: String;
//  testDLG: TdlgTest;
begin
  if Key = VK_RETURN then
  begin  
    CMD := dxtxtModemCmd.CurText;
    SavedText := CMD;

    if SameText('$connect', CMD) then
      OpenPortDef
    else if AnsiStartsText('$connect', CMD) then
    begin
      Delete(CMD, 1, 9);
      if Length(CMD) = 0 then
        OpenPortDef
      else
        OpenPort(CMD);
    end
    else if SameText('$disconnect', CMD) then
      ClosePort
    else if SameText('$codingtest', CMD) then
    begin
      TdlgTest.Create(self).Show;
    end
    else if AnsiStartsText('$decodegsm', CMD) then
    begin
      Delete(CMD, 1, 11);

      ShowMessage(Decode7Bit(CMD));
    end
    else if AnsiStartsText('$encodegsm', CMD) then
    begin
      Delete(CMD, 1, 11);

      ShowMessage(Encode7bit(CMD));
    end
    else if AnsiStartsText('$setcsca', CMD) then
    begin
      Delete(CMD, 1, 9);
      JobThread.InfoCenter := CMD;
      lvwPhoneInfo.Items[3].SubItems[0] := CMD;
    end
    else
    begin
      SendCommand(CMD);
      sBuffers.Clear;
    end;      

    dxtxtModemCmd.Items.Add(SavedText);
    dxtxtModemCmd.Text := '';
    dxtxtModemCmd.SetFocus(False);
  end;
    
end;

procedure TfrmMain.SaveConnectionSettings;
var
  ini: TIniFile;
  fn: String;
  ComputerName: String;
  rtl: Cardinal;
begin
  fn := AppendPath(sPath, 'Connections.INI');

  ini := TIniFile.Create(fn);
  SetLength(ComputerName, MAX_PATH);
  rtl := MAX_PATH;
  GetComputerName(@ComputerName[1], rtl);
  ComputerName := LeftStr(ComputerName, rtl);

  ini.WriteInteger(ComputerName, 'BaudRate', cmModem.BaudRate);
  ini.WriteInteger(ComputerName, 'ByteSize', Ord(cmModem.ByteSize));
  ini.WriteInteger(ComputerName, 'Parity', Ord(cmModem.Parity));
  ini.WriteBool(ComputerName, 'ParityCheck', cmModem.ParityCheck);
  ini.WriteInteger(ComputerName, 'StopBits', Ord(cmModem.StopBits));
  ini.WriteString(ComputerName, 'CommName', JoinStrings(PortList.PortList, STPortDelimiter));

  ini.UpdateFile;
end;

procedure TfrmMain.ShowExitMesaage(const Message: String);
var
  Cmd: String;
  ARunThread: TRunCmd;
begin
  Cmd := '"' + AppendPath(sPath, 'runafter.exe') + '" ';
  Cmd := Cmd + IntToStr(GetCurrentProcessId);
  Cmd := Cmd + ' 0 "' + Message + '"';
  ARunThread := TRunCmd.Create(True);
  ARunThread.Cmd := Cmd;
  ARunThread.Suspended := False;
  Sleep(500);
  Forms.Application.Terminate;
  Forms.Application.ProcessMessages;
end;

procedure TfrmMain.tmrReginfoTimer(Sender: TObject);
begin
//  {$I Encode_Start.inc}
  tmrReginfo.Tag := tmrReginfo.Tag - 1;
//  lblRegStatus.Caption := '注册状态: 已过期(' + IntToStr(tmrReginfo.Tag) + ' 秒后退出)';
//  lblRegStatus.Font.Color := clRed;

  if tmrReginfo.Tag = 0 then
    ShowExitMesaage('这个程序的试用期已过，如果您觉得喜欢请购买。');
//  {$I Encode_End.inc}   
end;

procedure TfrmMain.RefreshIMEI(const IMEI: String);
begin
{$IFDEF REGISTERED}
  {$I Encode_Start.inc}
  ChangeIMEI(IMEI, tmrReginfo);

  if SameText(GlobalRegStatus, GRS_UNKNOWN) then
    lblRegStatus.Caption := '注册状态: 未知'
  else if SameText(GlobalRegStatus, GRS_UNREGISTERED) then
    lblRegStatus.Caption := '注册状态: 未注册(剩余 ' + IntToStr(tmrReginfo.Tag) + ' 天)'
  else if SameText(GlobalRegStatus, GRS_EXCEEDED) then
  begin
    lblRegStatus.Caption := '注册状态: 已过期';
    MessageBox(Handle, PChar('这个程序的试用期已过。超过使用期后，您每天只能使用' +
      IntToStr(REG_DAILY_SECOND) + '秒，今天剩余时间 '+ IntToStr(tmrReginfo.Tag - 1) + ' 秒。'), PChar(Caption), MB_ICONWARNING);
  end
  else if SameText(GlobalRegStatus, GRS_REGISTERED) then
    lblRegStatus.Caption := '注册状态: 已注册';
{$ENDIF}    

  lvwPhoneInfo.Items[0].SubItems[0] := IMEI;

{$IFDEF REGISTERED}
  // 显示菜单
  if SameText(GlobalRegStatus, GRS_REGISTERED) then
  begin
    dxmnuHelpRegister.Enabled := not SameText(GlobalRegStatus, GRS_UNKNOWN);
    dxmnuHelpShowReg.Enabled := True;
    dxmnuHelpShowReg.Down := opShowReg;
    dxmnuHelpRegister.Enabled := False;
  end
  else
  begin
    dxmnuHelpRegister.Enabled := True;
    dxmnuHelpShowReg.Enabled := False;
    dxmnuHelpShowReg.Down := True;
  end;  

  if dxmnuHelpShowReg.Down then
    dxconRegStatue.Visible := ivAlways
  else
    dxconRegStatue.Visible := ivNever;
  {$I Encode_End.inc}
{$ENDIF}
end;

procedure TfrmMain.lvwJobKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DELETE) and (Shift  = []) then
    dxmnuJobCancelSel.Click;

  if (Key = VK_DELETE) and (Shift = [ssShift]) then
    dxmnuJobCancelDulp.Click;
end;

procedure TfrmMain.lvwModemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = Ord('C')) and (Shift = [ssCtrl]) then
    dxmnuToolSaveModem.Click;
end;

procedure TfrmMain.dxmnuHelpShowRegClick(Sender: TObject);
begin
//  if dxmnuHelpShowReg.Down then
//    dxconRegStatue.Visible := ivAlways
//  else
//    dxconRegStatue.Visible := ivNever;
//
  opShowReg := dxmnuHelpShowReg.Down;
end;

procedure TfrmMain.dxmnuHelpRegisterClick(Sender: TObject);
const
  KEY_CRYPTO_IMEI:String = #$75#$F6#$31#$04#$3A#$E6#$53;
var
  dlgRegister: TdlgRegister;
  sMCode: string;
begin
  HashStr(HASH_CRC32,  lvwPhoneInfo.Items[0].SubItems[0], sMCode);
  sMCode := DES.EncryStrHex(sMCode, KEY_CRYPTO_IMEI);
  
  dlgRegister := TdlgRegister.Create(nil);
  dlgRegister.txtMachineCode.Text := sMCode;
  dlgRegister.ShowModal;
  dlgRegister.Free;
end;

procedure TfrmMain.dxmnuToolDBClick(Sender: TObject);
var
  Cmd: String;
  ARunThread: TRunCmd;
begin
  if MessageBox(Handle,
    '使用数据库实用工具必须关闭本程序，您是否要立刻关闭本程序？',
    PChar(Forms.Application.Title), MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    Cmd := '"' + AppendPath(sPath, 'runafter.exe') + '" ';
    Cmd := Cmd + IntToStr(GetCurrentProcessId);
    Cmd := Cmd + ' -1 "' + AppendPath(sPath, 'dbutly.exe') + ' /RUNAPP"';
//    CreateProcess(nil, PChar(Cmd), nil, nil, False, 0, nil, PChar(sPath), sinfo, tmp);
    ARunThread := TRunCmd.Create(True);
    ARunThread.Cmd := Cmd;
    ARunThread.Suspended := False;
    Sleep(500);
    Close;
  end;
end;

procedure TfrmMain.dxmnuViewSplitPageClick(Sender: TObject);
begin
  opSplittedPage := dxmnuViewSplitPage.Down;
  RefreshView; 
end;

procedure TfrmMain.dxmnuSortAscendingClick(Sender: TObject);
begin
  opSPSortAsc := dxmnuSortAscending.Down;
  if dxmnuSortName.Down then opSPSortType := 0
  else if dxmnuSortNumber.Down then opSPSortType := 1
  else opSPSortType := 2;
  RefreshView(nil);
end;

procedure TfrmMain.dxmnuViewRefreshClick(Sender: TObject);
begin
  RefreshView;
end;

procedure TfrmMain.RefreshPage(isSelection: TList);
var
  InternalID: Integer;
  i: Integer;
begin
  // 查看记录数目
  if opSplittedPage then
    FSPCntPage := qrySMS.RecordCount div opSPItemCount + 1
  else
    FSPCntPage := 1;

  // 打开第一个数据集合
  FSPCurPage := 1;

  if opSplittedPage and Assigned(isSelection) and (isSelection.Count > 1 ) then
  begin
    InternalID := Integer(isSelection[0]);
    if qrySMS.Locate('internalid', InternalID, []) then
      FSPCurPage := qrySMS.RecNo div opSPItemCount + 1;
  end;

  // 重新设置页面数目
  FInternalEvent := True;
  dxicbCurrentPage.Items.Clear;

  for i :=1 to FSPCntPage do
  begin
    dxicbCurrentPage.Items.Add(IntToStr(i));
    dxicbCurrentPage.ImageIndexes[i - 1] := 87;
  end;

  FInternalEvent := False;

  // 打开试图
  RefreshPage(FSPCurPage, isSelection);
end;

procedure TfrmMain.RefreshPage(iPage: Integer; isSelection: TList);
var
  pItem: PVirtualNode;
  pData: PShortMessageEntry;
begin
  vstSMS.Clear;

  FInternalEvent := True;
  dxicbCurrentPage.ItemIndex := iPage - 1;
  FInternalEvent := False;
  if qrySMS.RecordCount = 0 then Exit;

  FSPRecFirst := (iPage - 1) * opSPItemCount + 1;
  qrySMS.RecNo := FSPRecFirst;

  if opSplittedPage then
    FSPRecEnd := iPage * opSPItemCount
  else
    FSPRecEnd := qrySMS.RecordCount;

  if FSPRecEnd > qrySMS.RecordCount then
    FSPRecEnd := qrySMS.RecordCount;

  if not Assigned(isSelection) then
    isSelection := TList.Create;

  // 显示表格内容
  case tvwFolder.Selected.ImageIndex of
    0, 2:
    while (qrySMS.RecNo <= FSPRecEnd) and (not qrySMS.Eof) do
    begin
      pItem := vstSMS.AddChild(nil);
      pData := vstSMS.GetNodeData(pItem);
      pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
      pData.DateTime := qrySMS.FieldByName('receivedate').AsDateTime;
      pData.Sender := qrySMS.FieldByName('sender').AsString;
      pData.PhoneNumber := qrySMS.FieldByName('sendernumber').AsString;
      pData.Content := qrySMS.FieldByName('content').AsString;
      pData.Replied := qrySMS.FieldByName('replied').AsBoolean;
      pData.Read := qrySMS.FieldByName('read').AsBoolean;
      pData.Transmitted := qrySMS.FieldByName('transmitted').AsBoolean;
      pData.PhoneClient := qrySMS.FieldByName('id').AsInteger > 0;
      pData.MessageCount := 1;
      pData.MessageReport := qrySMS.FieldByName('content').IsNull; //or (qrySMS.FieldByName('content').AsString[1] = #0);

      if Assigned(isSelection) and (isSelection.IndexOf(Pointer(pData.InternalID)) <> -1) then
        vstSMS.Selected[pItem] := True;

      qrySMS.Next;
    end;
    3:
    while (qrySMS.RecNo <= FSPRecEnd) and (not qrySMS.Eof) do
    begin
      pItem := vstSMS.AddChild(nil);
      pData := vstSMS.GetNodeData(pItem);
      pData.DateTime := qrySMS.FieldByName('senderdate').AsDateTime;
      pData.Sender := qrySMS.FieldByName('addressee').AsString;
      pData.PhoneNumber := qrySMS.FieldByName('number').AsString;
      pData.Content := qrySMS.FieldByName('content').AsString;
      pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
      pData.Read := True;
      pData.Transmitted := False;
      pData.PhoneClient := False;
      pData.MessageCount := 1;

      if Assigned(isSelection) and (isSelection.IndexOf(Pointer(pData.InternalID)) <> -1) then
        vstSMS.Selected[pItem] := True;

      qrySMS.Next;
    end;
    4:
    while (qrySMS.RecNo <= FSPRecEnd) and (not qrySMS.Eof) do
    begin
      pItem := vstSMS.AddChild(nil);
      pData := vstSMS.GetNodeData(pItem);
      pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
      pData.DateTime := qrySMS.FieldByName('senderdate').AsDateTime;
      pData.Sender := qrySMS.FieldByName('name').AsString;;
      pData.PhoneNumber := qrySMS.FieldByName('number').AsString;
      pData.Content := qrySMS.FieldByName('content').AsString;
      pData.Read := True;
      pData.Transmitted := qrySMS.FieldByName('transmitted').AsBoolean;
      pData.MessageCount := qrySMS.FieldByName('count').AsInteger;
      pData.PhoneClient := qrySMS.FieldByName('id').AsInteger > 0;

      if Assigned(isSelection) and (isSelection.IndexOf(Pointer(pData.InternalID)) <> -1) then
        vstSMS.Selected[pItem] := True;

      qrySMS.Next;
    end;
    5:
    while (qrySMS.RecNo <= FSPRecEnd) and (not qrySMS.Eof) do
    begin
      pItem := vstSMS.AddChild(nil);
      pData := vstSMS.GetNodeData(pItem);
      pData.DateTime := qrySMS.FieldByName('date').AsDateTime;
      pData.Sender := qrySMS.FieldByName('name').AsString;
      pData.PhoneNumber := qrySMS.FieldByName('number').AsString;
      pData.Content := qrySMS.FieldByName('content').AsString;
      pData.InternalID := qrySMS.FieldByName('internalid').AsInteger;
      pData.MessageCount := qrySMS.FieldByName('count').AsInteger;
      pData.Read := True;
      pData.PhoneClient := qrySMS.FieldByName('id').AsInteger > 0;

      if Assigned(isSelection) and (isSelection.IndexOf(Pointer(pData.InternalID)) <> -1) then
        vstSMS.Selected[pItem] := True;

      qrySMS.Next;
    end;
  end;

  if (vstSMS.SelectedCount = 0) and (vstSMS.GetFirst <> nil) then
    vstSMS.Selected[vstSMS.GetFirst] := True;

  if vstSMS.GetFirstSelected <> nil then
    vstSMS.FocusedNode := vstSMS.GetFirstSelected;

  FSPCurPage := iPage;
  SortSMSList;
end;

procedure TfrmMain.dxmnuViewFirstPageClick(Sender: TObject);
begin
  RefreshPage(1, nil);
  UpdateView;

  if vstSMS.TotalCount <> 0 then
    vstSMS.Selected[vstSMS.GetFirst] := True;
end;

procedure TfrmMain.dxmnuViewPreviousPageClick(Sender: TObject);
begin
  RefreshPage(FSPCurPage - 1, nil);
  UpdateView;

  if vstSMS.TotalCount <> 0 then
    vstSMS.Selected[vstSMS.GetFirst] := True;
end;

procedure TfrmMain.dxmnuViewNextPageClick(Sender: TObject);
begin
  RefreshPage(FSPCurPage + 1, nil);
  UpdateView;

  if vstSMS.TotalCount <> 0 then
    vstSMS.Selected[vstSMS.GetFirst] := True;
end;

procedure TfrmMain.dxmnuViewLastPageClick(Sender: TObject);
begin
  RefreshPage(FSPCntPage, nil);
  UpdateView;

  if vstSMS.TotalCount <> 0 then
    vstSMS.Selected[vstSMS.GetFirst] := True;
end;

procedure TfrmMain.dxicbCurrentPageChange(Sender: TObject);
begin
  if not FInternalEvent then
  begin
    RefreshPage(dxicbCurrentPage.ItemIndex + 1, nil);
    UpdateView;

    if vstSMS.TotalCount <> 0 then
      vstSMS.Selected[vstSMS.GetFirst] := True;
  end;      
end;

procedure TfrmMain.dxmnuSMSDelPhoneClick(Sender: TObject);
begin
  // 读取联系人
  JobThread.JobContent.Add(jkClearSMS);
  if JobThread.Suspended then JobThread.Suspended := False;
end;

procedure TfrmMain.dxmnuSMSPropertyClick(Sender: TObject);
var
  noticewnd: TNotice;
begin
//  if IsShowPopup then
    try
      noticewnd := MessageWnd.Add;
      noticewnd.FormItem.InternalID := 0;
      noticewnd.FormItem.ReceiveDate := Now;
      noticewnd.FormItem.SenderString := 'test';
      noticewnd.FormItem.ShowWindow;
    finally
      ;
    end;
end;

procedure TfrmMain.dxmnuToolPhoneStateClick(Sender: TObject);
begin
  JobThread.JobContent.AddTop(jkQueryInfo);
  if JobThread.Suspended then JobThread.Suspended := False;
end;

procedure TfrmMain.tmrQueryStateTimer(Sender: TObject);
var
  bQueryState: Boolean;
  i: Integer;
begin
  if Connected = True then
  begin
    bQueryState := False;

    for i := 0 to JobThread.JobContent.Count - 1 do
      if JobThread.JobContent.Items[i].JobKind = jkQueryInfo then
      begin
        bQueryState := True;
        Break;
      end;

    if not bQueryState then
      dxmnuToolPhoneState.Click;
  end;
end;

procedure TfrmMain.dxmnuViewSplitClick(Sender: TObject);
begin
  dxbmMain.BarByOldName('SplitView').Visible := dxmnuViewSplit.Down;
end;

procedure TfrmMain.tmrReconnectTimer(Sender: TObject);
begin
  if not Connected then
  begin
    if (opDCReconTime = 0) or (tmrReconnect.Tag <= opDCReconTime)  then
    begin
      AddModemStaus(tsInfo, '正在尝试重新连接');

      if OpenPortDef then
      begin
        frmMain.ShowPopHit('连接成功', 'Ultra SMS 成功重新连接', True);
        tmrReconnect.Enabled := False;
      end
      else
      begin
        AddModemStaus(tsError, '连接失败，等待 ' + IntToStr(opDCReconInterval) +
          ' 毫秒重试');
        tmrReconnect.Tag := tmrReconnect.Tag + 1;
      end;
    end
    else if opDCRestart then
      dxmnuFileRestart.Click;
  end
  else
    tmrReconnect.Enabled := False;
end;

procedure TfrmMain.RefreshNewTray;
var
  sql: TADOQuery;
begin
  // 查询数据库
  sql := TADOQuery.Create(nil);
  sql.Connection := adoSMS;
  sql.SQL.Add('SELECT TOP 1 [receive].[internalid]');
  sql.SQL.Add('FROM [receive]');
  sql.SQL.Add('WHERE [receive].[read] = False');
  sql.SQL.Add('ORDER BY [receive].[receivedate] DESC;');
  sql.Open;

  if not ((sql.Eof = True) and (sql.Bof = True)) then
    ctiNewMessage.IconVisible := True
  else
    ctiNewMessage.IconVisible := False;

  sql.Close;
  sql.Free;
end;

procedure TfrmMain.ctiNewMessageClick(Sender: TObject);
begin
  popOpenUnread.Click;
end;

procedure TfrmMain.ctiNewMessageDblClick(Sender: TObject);
begin
  popReplayUnread.Click;
end;

procedure TfrmMain.dxmnuEditFilterEnabledClick(Sender: TObject);
begin
  // 启用或禁用筛选
  dxmnuEditFilterEnabled.Down := not dxmnuEditFilterEnabled.Down;
  fraFilter.chkEnable.Checked := not fraFilter.chkEnable.Checked;
  frmMain.RefreshView(nil);
end;

procedure TfrmMain.dxmnuPBookSetFilterClick(Sender: TObject);
var
  i: Integer;
  slNames: TStringList;
  pData: PShortMessageEntry;
  pNode: PVirtualNode;
begin
  // 设置过滤项目
  slNames := TStringList.Create;

  if Self.ActiveControl = lvwPhonebook then
  begin
    for i := 0 to lvwPhonebook.Items.Count - 1 do
      if lvwPhonebook.Items[i].Selected then
        slNames.Add(lvwPhonebook.Items[i].Caption);
  end
  else
  begin
    pNode := vstSMS.GetFirstSelected;
    while Assigned(pNode) do
    begin
      pData := vstSMS.GetNodeData(pNode);
      slNames.Add(pData.Sender);
      pNode := vstSMS.GetNextSelected(pNode);
    end;
  end;          

  if (Sender as TComponent).Name = 'dxmnuPBookSetFilter' then
    fraFilter.lstName.Clear;

  fraFilter.AddNames(slNames);
  slNames.Free;

  if fraFilter.chkEnable.Checked then
    RefreshView(nil)
  else
    dxmnuEditFilterEnabled.Click;
end;

procedure TfrmMain.dxmnuPbookSyncClick(Sender: TObject);
var
  wSyncPB: TfrmSyncPhonebook;
  xItem: TListItem;
begin
  if QueryWindow('syncpb', '0') then
    Exit;

  // 打开草稿箱
  wSyncPB := TfrmSyncPhonebook.Create(nil);
  xItem := lvwWindow.Items.Add;
  xItem.ImageIndex := 5;
  xItem.Data := Pointer(wSyncPB.Handle);
  xItem.Caption := '同步电话簿';

  // 填充一些信息
  xItem.SubItems.Add('syncpb');
  xItem.SubItems.Add('0');
  wSyncPB.Show;
end;

procedure TfrmMain.dxmnuToolTimeClick(Sender: TObject);
var
  wSnycTime: TfrmTime;
  xItem: TListItem;
begin
  if QueryWindow('synctime', '0') then
    Exit;

  // 打开草稿箱
  wSnycTime := TfrmTime.Create(nil);
  xItem := lvwWindow.Items.Add;
  xItem.ImageIndex := 4;
  xItem.Data := Pointer(wSnycTime.Handle);
  xItem.Caption := '同步日期时间';

  // 填充一些信息
  xItem.SubItems.Add('synctime');
  xItem.SubItems.Add('0');
  wSnycTime.Show;
end;

procedure TfrmMain.dxmnuFileRestartClick(Sender: TObject);
var
  Cmd: String;
  ARunThread: TRunCmd;
begin
  Cmd := '"' + AppendPath(sPath, 'runafter.exe') + '" ';
  Cmd := Cmd + IntToStr(GetCurrentProcessId);
  Cmd := Cmd + ' -1 "' + AppendPath(sPath, 'ultrasms.exe"');
//    CreateProcess(nil, PChar(Cmd), nil, nil, False, 0, nil, PChar(sPath), sinfo, tmp);
  ARunThread := TRunCmd.Create(True);
  ARunThread.Cmd := Cmd;
  ARunThread.Suspended := False;
  Sleep(500);
  Close;
end;

//procedure TfrmMain.vstSMSBeforeCellPaint(Sender: TBaseVirtualTree;
//  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
//  CellRect: TRect);
//var
//  xData: PShortMessageEntry;
//begin
//  if Assigned(Node) and (not (vsSelected in Node.States)) and (CurrentView = cvReceive) then
//  begin
//    xData := Sender.GetNodeData(Node);
//
//    if xData.MessageReport then
//    begin
//      TargetCanvas.Brush.Color := $00FFF7EA;
//      TargetCanvas.FillRect(CellRect);
//    end;
//  end;
//end;

procedure TfrmMain.dxmnuSMSRemoveSMSClick(Sender: TObject);
var
  wRemoveSMS: TfrmRemoveSMS;
  xItem: TListItem;
begin
  if QueryWindow('removesms', '0') then
    Exit;

  // 创建窗口
  wRemoveSMS := TfrmRemoveSMS.Create(nil);
  xItem := lvwWindow.Items.Add;
  xItem.ImageIndex := 5;
  xItem.Data := Pointer(wRemoveSMS.Handle);
  xItem.Caption := '整理短信';

  // 填充一些信息
  xItem.SubItems.Add('removesms');
  xItem.SubItems.Add('0');
  wRemoveSMS.Show;
end;

procedure TfrmMain.vstSMSBeforeCellPaint(Sender: TBaseVirtualTree;
  TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex;
  CellPaintMode: TVTCellPaintMode; CellRect: TRect;
  var ContentRect: TRect);
var
  xData: PShortMessageEntry;
begin
  if (CellPaintMode = cpmPaint) and Assigned(Node) and
    (not (vsSelected in Node.States)) and (CurrentView = cvReceive) then
  begin
    xData := Sender.GetNodeData(Node);

    if xData.MessageReport then
    begin
      TargetCanvas.Brush.Color := $00FFF7EA;
      TargetCanvas.FillRect(CellRect);
    end;
  end;
end;

procedure TfrmMain.dxmnuSMSCycleNewClick(Sender: TObject);
begin
  JobThread.JobContent.Add(jkCycleQuery);
  JobThread.Suspended := False;
end;

procedure TfrmMain.tmrQueryNewSMSTimer(Sender: TObject);
var
  bQueryState: Boolean;
  i: Integer;
begin
  if Connected = True then
  begin
    bQueryState := False;

    for i := 0 to JobThread.JobContent.Count - 1 do
      if JobThread.JobContent.Items[i].JobKind = jkCycleQuery  then
      begin
        bQueryState := True;
        Break;
      end;

    if not bQueryState then
      dxmnuSMSCycleNew.Click;
  end;
end;

procedure TfrmMain.aeDefaultMinimize(Sender: TObject);
begin
  FMinimized := True;
end;

procedure TfrmMain.aeDefaultMessage(var Msg: tagMSG; var Handled: Boolean);
begin
  case Msg.message of
  WM_QUIT:
  begin
    dxmnuFileDisconnect.Click;
    Close;
  end;
  end;
end;

procedure TfrmMain.WMSyscommand(var msg: TMessage);
begin
  case msg.WParam of
  SC_MINIMIZE:
  begin
    FMinimized := True;
    Self.WindowState := wsMinimized;
    FMinimized := True;
    ctiMain.HideMainForm;
    Exit;
  end;
  SC_MAXIMIZE: FLastStatus := wsMaximized;
  SC_RESTORE: FLastStatus := wsNormal;
  end;

  inherited;
end;

procedure TfrmMain.WMActivateMainWindow(var Message: TWMWindowPosChanged);
begin
  if FMinimized then
    ctiMainClick(nil)
  else
    Self.Activate;
end;

procedure TfrmMain.WMExitWindows(var msg: TMessage);
var
  AAction: TCloseAction;
begin
  // 解决无法关机的问题
//  ShowMessage(IntToStr(msg.Result));
  ClosePort;
  FormClose(nil, AAction);
  msg.Result := 1;
end;

procedure TfrmMain.WMUpdatePBook(var msg: TMessage);
begin
  cbeCategorySelect(nil);
end;

//procedure TfrmMain.WMWINDOWPOSCHANGED(var msg: TMessage);
//var
//  winpos: PWindowPos;
//begin
//  // 窗口变小了
//  winpos := PWindowPos(msg.LParam);
//end;

procedure TfrmMain.WMWindowPosChanged(var Message: TWMWindowPosChanged);
begin
  if (Message.WindowPos.x < -30000) and (Message.WindowPos.y < -30000) and (not FMinimized) then
  begin
    FMinimized := True;
    if WindowState <> wsMinimized then
      FLastStatus := WindowState;
    Self.WindowState := wsMinimized;
    ctiMain.HideMainForm;
  end
  else
    inherited;
end;

// 添加一个新的消息报告
procedure TfrmMain.NewSmsReport(PDU: String);
var
  sNumber: String;
  sDateTime: TDateTime;
  bRef: Byte;
  dbContact, dbSMS: TADOTable;
  hash, sFolder: string;
  noticewnd: TNotice;
begin
  ParseSMSReport(PDU, sNumber, sDateTime, bRef);

  // 打开数据库
  dbContact := TADOTable.Create(nil);
  dbContact.Connection := adoContacts;
  dbContact.TableName := 'contact';
  dbContact.Open;

  dbSMS := TADOTable.Create(nil);
  dbSMS.Connection := adoSMS;
  dbSMS.TableName := 'receive';
  dbSMS.Open;

  HashStr(HASH_MD5, sNumber + #13#10#13#10, hash);

  // 添加到数据库
  dbSMS.Append;
  if opLocalTime then
    dbSMS.FieldByName('receivedate').AsDateTime := Now
  else
    dbSMS.FieldByName('receivedate').AsDateTime := sDateTime;
  dbSMS.FieldByName('sender').AsString := JobThread.QuestName(dbContact, sNumber, sFolder);
  dbSMS.FieldByName('sendernumber').AsString := sNumber;
  dbSMS.FieldByName('read').AsBoolean := False;
  dbSMS.FieldByName('content').Clear;
  // 负数表示关联的消息编号
  try
    dbSMS.FieldByName('id').AsInteger := -MsgRefIDMap.Items[bRef];
    MsgRefIDMap.EraseKey(bRef);
  except
    dbSMS.FieldByName('id').AsInteger := 0;
  end;          
  if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
  dbSMS.FieldByName('hash').AsString := hash;
  dbSMS.Post;

  // 显示弹出对话框
  if IsShowPopup then
    try
      noticewnd := MessageWnd.Add;
      noticewnd.FormItem.WndType := ntMsgReport;
      noticewnd.FormItem.InternalID := dbSMS.FieldByName('internalid').AsInteger;
      noticewnd.FormItem.ReceiveDate := sDateTime;
      if Length(dbSMS.FieldByName('sender').AsString) = 0 then
        noticewnd.FormItem.SenderString := sNumber
      else
        noticewnd.FormItem.SenderString := dbSMS.FieldByName('sender').AsString;
      noticewnd.FormItem.ShowWindow;
    finally
      ;
    end;

  // 关闭数据库
  dbSMS.Close;
  dbContact.Close;

  if opShowTrayIcon then
    frmMain.RefreshNewTray;

  if frmMain.CurrentView = cvReceive then
    frmMain.RefreshView;
end;

procedure TfrmMain.AddContact(Phone: String);
var
  cName, cNumber, cCategory: String;
begin
  // 添加联系人
  cNumber := Phone;
  with TdlgAddContact.Create(nil) do
  begin
    if ShowAddContact(cName, cNumber, cCategory) then
    begin
      if ((cbeCategory.ItemIndex = 0) and (cCategory = '')) or
         ((cbeCategory.ItemIndex > 0) and (cCategory <> '')) then
        with lvwPhonebook.Items.Add do
        begin
          lvwPhonebook.ClearSelection;
          Caption := cName;
          SubItems.Add(cNumber);
          ImageIndex := 2;
          Selected := True;
          Focused := True;
        end;
    end;

    Free;
  end;
end;

procedure TfrmMain.ReplaceContact(Phone: String);
var
  cName, cNumber, cCategory: String;
  sOriCategory: String;
begin
  // 替换联系人
  cNumber := Phone;

  with TdlgAddContact.Create(nil) do
  begin
    if ShowReplaceContact(cName, cNumber, cCategory) then
    begin
      if (sOriCategory = cCategory) then
        with lvwPhonebook.Selected do
        begin
          lvwPhonebook.ClearSelection;
          Caption := cName;
          SubItems[0] := cNumber;
          ImageIndex := 2;
          Selected := True;
          Focused := True;
        end
      else
        RefreshCategory(cCategory, cNumber);
    end;

    Free;
  end;
end;

end.
