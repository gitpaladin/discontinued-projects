unit uDlgPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEditPrintPreview, SynEditPrint, SynEdit, SynMemo, SynEditor,
  SynEditHighlighter, SynHighlighterProgress, SynHighlighterCpp,
  dxDockControl, dxBar, cxGraphics, cxControls, dxStatusBar, dxBarExtItems,
  ImgList, SynEditActions, ActnList, SynEditPrintTypes, Contnrs, cxClasses;

const
  WM_MSG_CLOSEWND = WM_USER + 461;

type
  TPntContent = (pcDate, pcTime, pcName, pcPhone, pcFlag, pcHeader, pcFooter,
    pcLineNumber);

  TPntSet = set of TPntContent;

  TPntSettings = record
    HeaderFont: TFont;
    HeaderFrame: Integer;
    HeaderMirror: Boolean;
    HeaderRoman: Boolean;
    HeaderLineColor: TColor;
    HeaderShadeColor: TColor;
    Header: String;

    FooterFont: TFont;
    FooterFrame: Integer;
    FooterMirror: Boolean;
    FooterRoman: Boolean;
    FooterLineColor: TColor;
    FooterShadeColor: TColor;
    Footer: String;

    LineInMargin: Boolean;

    MarginBottom: Real;
    MarginFooter: Real;
    MarginGutter: Real;
    MarginHeader: Real;
    MarginHFInternal: Real;
    MarginLeft: Real;
    MarginLeftHFText: Real;
    MarginMirror: Boolean;
    MarginRight: Real;
    MarginRightHFText: Real;
    MarginTop: Real;
    MarginUnit: Integer;
  end;

  TPntDlgProperty = record
    FaceFont: TFont;
    ScaleMode: Integer;
    ScalePercent: Integer;
    ToolbarVisible: Boolean;
    FormatbarVisible: Boolean;
    StatusBarVisible: Boolean;
    PrintContent: Integer;
    PageSetup: TPntSettings;

    WndMaximized: Boolean;
    WndLeft: Integer;
    WndTop: Integer;
    WndWidth: Integer;
    WndHeight: Integer;
  end;

  TdlgPrint = class(TForm)
    sepPrint: TSynEditPrint;
    txtPrint: TSynEditor;
    dxbmPrint: TdxBarManager;
    mnuFile: TdxBarSubItem;
    mnuFileSaveAs: TdxBarButton;
    mnuFileExit: TdxBarButton;
    mnuFilePageSetup: TdxBarButton;
    mnuFilePrintSettings: TdxBarButton;
    mnuFilePrint: TdxBarButton;
    mnuPage: TdxBarSubItem;
    mnuFileCopy: TdxBarButton;
    mnuPageGo: TdxBarButton;
    mnuPagePrevious: TdxBarButton;
    mnuPageNext: TdxBarButton;
    mnuPageFirst: TdxBarButton;
    mnuPageLast: TdxBarButton;
    mnuZoom: TdxBarSubItem;
    mnuZoomIn: TdxBarButton;
    mnuZoomOut: TdxBarButton;
    mnuZoomFitPage: TdxBarButton;
    mnuZoomFitWidth: TdxBarButton;
    mnuZoom25: TdxBarButton;
    mnuZoom50: TdxBarButton;
    mnuZoom75: TdxBarButton;
    mnuZoom100: TdxBarButton;
    mnuZoom150: TdxBarButton;
    mnuZoom200: TdxBarButton;
    mnuZoom500: TdxBarButton;
    mnuContent: TdxBarSubItem;
    mnuContentTime: TdxBarButton;
    mnuContentName: TdxBarButton;
    mnuContentPhoneNumber: TdxBarButton;
    mnuContentSign: TdxBarButton;
    mnuContentDate: TdxBarButton;
    mnuContentHeader: TdxBarButton;
    mnuContentFooter: TdxBarButton;
    stbPrint: TdxStatusBar;
    dxlbFirst: TdxBarLargeButton;
    dxlbPrevious: TdxBarLargeButton;
    dxlbNext: TdxBarLargeButton;
    dxlbLast: TdxBarLargeButton;
    dxlbPageWidth: TdxBarLargeButton;
    dxlbWholePage: TdxBarLargeButton;
    dxlbActual: TdxBarLargeButton;
    dxlbZoom: TdxBarLargeButton;
    popZoom: TdxBarPopupMenu;
    dxlbZoomIn: TdxBarLargeButton;
    dxlbZoomOut: TdxBarLargeButton;
    dxlbPrint: TdxBarLargeButton;
    dxlbSettings: TdxBarLargeButton;
    dxlbClose: TdxBarLargeButton;
    mnuFormatFontName: TdxBarFontNameCombo;
    mnuFormatSize: TdxBarCombo;
    mnuContentLineNum: TdxBarButton;
    mnuContentSpace: TdxBarButton;
    mnuFormat: TdxBarSubItem;
    mnuFormatFont: TdxBarButton;
    mnuFormatBold: TdxBarButton;
    mnuFormatItalic: TdxBarButton;
    mnuFormatUnderline: TdxBarButton;
    mnuFormatStrikeout: TdxBarButton;
    mnuView: TdxBarSubItem;
    mnuViewToolbar: TdxBarButton;
    mnuViewFormat: TdxBarButton;
    mnuViewStatusbar: TdxBarButton;
    iltMenu: TImageList;
    mnuFilePrintEx: TdxBarButton;
    dxlbPageSetup: TdxBarLargeButton;
    mnuZoomCustom: TdxBarButton;
    iltLarge: TImageList;
    alPrint: TActionList;
    aSynSaveAs: TaSynSaveAs;
    aSynPageSetup: TaSynPageSetup;
    pdPrint: TPrintDialog;
    iltStatusBar: TImageList;
    fdFont: TFontDialog;
    seppPreview: TSynEditPrintPreview;
    procedure CreateParams(var Params: TCreateParams);override;
    procedure FormCreate(Sender: TObject);
    procedure mnuFileCopyClick(Sender: TObject);
    procedure mnuFilePageSetupClick(Sender: TObject);
    procedure mnuFilePrintSettingsClick(Sender: TObject);
    procedure mnuFilePrintExClick(Sender: TObject);
    procedure mnuFilePrintClick(Sender: TObject);
    procedure mnuFileExitClick(Sender: TObject);
    procedure mnuViewToolbarClick(Sender: TObject);
    procedure mnuViewFormatClick(Sender: TObject);
    procedure mnuViewStatusbarClick(Sender: TObject);
    procedure mnuPagePreviousClick(Sender: TObject);
    procedure mnuPageNextClick(Sender: TObject);
    procedure mnuPageFirstClick(Sender: TObject);
    procedure mnuPageLastClick(Sender: TObject);
    procedure mnuPageGoClick(Sender: TObject);
    procedure mnuZoom25Click(Sender: TObject);
    procedure mnuZoom50Click(Sender: TObject);
    procedure mnuZoom75Click(Sender: TObject);
    procedure mnuZoom100Click(Sender: TObject);
    procedure mnuZoom150Click(Sender: TObject);
    procedure mnuZoom200Click(Sender: TObject);
    procedure mnuZoom500Click(Sender: TObject);
    procedure mnuZoomFitPageClick(Sender: TObject);
    procedure mnuZoomFitWidthClick(Sender: TObject);
    procedure seppPreviewPreviewPage(Sender: TObject; PageNumber: Integer);
    procedure mnuZoomInClick(Sender: TObject);
    procedure seppPreviewScaleChange(Sender: TObject);
    procedure mnuZoomOutClick(Sender: TObject);
    procedure mnuZoomCustomClick(Sender: TObject);
    procedure mnuFormatFontNameChange(Sender: TObject);
    procedure mnuFormatSizeChange(Sender: TObject);
    procedure mnuFormatBoldClick(Sender: TObject);
    procedure mnuFormatItalicClick(Sender: TObject);
    procedure mnuFormatUnderlineClick(Sender: TObject);
    procedure mnuFormatStrikeoutClick(Sender: TObject);
    procedure mnuFormatFontClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mnuContentDateClick(Sender: TObject);
    procedure pdPrintClose(Sender: TObject);
    procedure mnuContentSpaceClick(Sender: TObject);
    procedure mnuContentLineNumClick(Sender: TObject);
  private
    { Private declarations }
    FScaleValue: array[0..7] of Integer;
    FPrintContent: TPntSet;
    FInternal: Boolean;
    procedure FApplySettings;
    procedure FSaveSettings;
    procedure FAPICloseWindow(var Message: TMessage); message WM_MSG_CLOSEWND;
  public
    { Public declarations }
    SplitMsgMode: Boolean;
    PageSetting: TPntDlgProperty;
    MsgContent: TObjectList;
    procedure RefreshPreview;
    procedure PrintDoc;
  end;

  TSMSEntry = class(TObject)
  public
    DateTime: TDateTime;
    Name: TStringList;
    Phone: TStringList;
    Receive: Boolean;
    Content: String;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

uses
  ClipBrd, Math, DateUtils, StrUtils, GerneralFunc, UserInterfaces,
  SynEditPrintMargins, Printers, ConvUtils, StdConvs;

constructor TSMSEntry.Create;
begin
  Name := TStringList.Create;
  Phone := TStringList.Create;
end;

destructor TSMSEntry.Destroy;
begin
  Name.Free;
  Phone.Free;
  inherited Destroy;
end;

procedure TdlgPrint.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := GetDesktopWindow;
end;

procedure TdlgPrint.FormCreate(Sender: TObject);
begin
//  dxbmPrint.LoadFromIniFile(AppendPath(sPath, 'prntprw.bar'));
  SetWindowIcon(Handle, IDI_BPREVIEW, IDI_SPREVIEW);
  msPrintDlg.Seek(0, soFromBeginning);
  dxbmPrint.LoadFromStream(msPrintDlg);

  MsgContent := TObjectList.Create;

  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;

  FScaleValue[0] := 10;
  FScaleValue[1] := 25;
  FScaleValue[2] := 50;
  FScaleValue[3] := 75;
  FScaleValue[4] := 100;
  FScaleValue[5] := 150;
  FScaleValue[6] := 200;
  FScaleValue[7] := 500;

  // 读取设置
  PageSetting := frmMain.FPrintPropDef;
  FApplySettings;

  // 填充项目
  mnuFormatFontName.Text := txtPrint.Font.Name;
  mnuFormatSize.Text := IntToStr(txtPrint.Font.Size);
  mnuFormatBold.Down := fsBold in txtPrint.Font.Style;
  mnuFormatItalic.Down := fsItalic in txtPrint.Font.Style;
  mnuFormatUnderline.Down := fsUnderline in txtPrint.Font.Style;
  mnuFormatStrikeout.Down := fsStrikeOut in txtPrint.Font.Style;

  // 查看设置
  pdPrintClose(nil);
end;

procedure TdlgPrint.mnuFileCopyClick(Sender: TObject);
var
  cpBoard: TClipboard;
begin
  // 复制内容
  cpBoard := Clipboard;
  cpBoard.AsText := txtPrint.Text;
end;

procedure TdlgPrint.mnuFilePageSetupClick(Sender: TObject);
begin
  if aSynPageSetup.Execute then
    seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuFilePrintSettingsClick(Sender: TObject);
begin
  if pdPrint.Execute then
    seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuFilePrintExClick(Sender: TObject);
begin
  if pdPrint.Execute then
  begin
    seppPreview.UpdatePreview;
    sepPrint.Print;
  end;
end;

procedure TdlgPrint.mnuFilePrintClick(Sender: TObject);
begin
  sepPrint.Print;
end;

procedure TdlgPrint.mnuFileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgPrint.mnuViewToolbarClick(Sender: TObject);
begin
  dxbmPrint.BarByOldName('Toolbar').Visible := mnuViewToolbar.Down;
end;

procedure TdlgPrint.mnuViewFormatClick(Sender: TObject);
begin
  dxbmPrint.BarByOldName('Format').Visible := mnuViewFormat.Down;
end;

procedure TdlgPrint.mnuViewStatusbarClick(Sender: TObject);
begin
  stbPrint.Visible := mnuViewStatusbar.Down;
end;

procedure TdlgPrint.mnuPagePreviousClick(Sender: TObject);
begin
  seppPreview.PreviousPage;
end;

procedure TdlgPrint.mnuPageNextClick(Sender: TObject);
begin
  seppPreview.NextPage;
end;

procedure TdlgPrint.mnuPageFirstClick(Sender: TObject);
begin
  seppPreview.FirstPage;
end;

procedure TdlgPrint.mnuPageLastClick(Sender: TObject);
begin
  seppPreview.LastPage;
end;

procedure TdlgPrint.mnuPageGoClick(Sender: TObject);
begin
//  seppPreview.;
end;

procedure TdlgPrint.mnuZoom25Click(Sender: TObject);
begin
  seppPreview.ScaleMode := pscUserScaled;
  seppPreview.ScalePercent := 25;
end;

procedure TdlgPrint.mnuZoom50Click(Sender: TObject);
begin
  seppPreview.ScaleMode := pscUserScaled;
  seppPreview.ScalePercent := 50;

end;

procedure TdlgPrint.mnuZoom75Click(Sender: TObject);
begin
  seppPreview.ScaleMode := pscUserScaled;
  seppPreview.ScalePercent := 75;

end;

procedure TdlgPrint.mnuZoom100Click(Sender: TObject);
begin
  seppPreview.ScaleMode := pscUserScaled;
  seppPreview.ScalePercent := 100;

end;

procedure TdlgPrint.mnuZoom150Click(Sender: TObject);
begin
  seppPreview.ScaleMode := pscUserScaled;
  seppPreview.ScalePercent := 150;

end;

procedure TdlgPrint.mnuZoom200Click(Sender: TObject);
begin
  seppPreview.ScaleMode := pscUserScaled;
  seppPreview.ScalePercent := 200;

end;

procedure TdlgPrint.mnuZoom500Click(Sender: TObject);
begin
  seppPreview.ScaleMode := pscUserScaled;
  seppPreview.ScalePercent := 500;

end;

procedure TdlgPrint.mnuZoomFitPageClick(Sender: TObject);
begin
  seppPreview.ScaleMode := pscWholePage;
end;

procedure TdlgPrint.mnuZoomFitWidthClick(Sender: TObject);
begin
  seppPreview.ScaleMode := pscPageWidth;
end;

procedure TdlgPrint.seppPreviewPreviewPage(Sender: TObject;
  PageNumber: Integer);
begin
  // 显示页面
  if PageNumber = 1 then
  begin
    // 第一页
    mnuPageFirst.Enabled := False;
    mnuPagePrevious.Enabled := False;
    dxlbFirst.Enabled := False;
    dxlbPrevious.Enabled := False;
  end
  else
  begin
    mnuPageFirst.Enabled := True;
    mnuPagePrevious.Enabled := True;
    dxlbFirst.Enabled := True;
    dxlbPrevious.Enabled := True;
  end;

  if PageNumber = seppPreview.PageCount then
  begin
    // 最后一页
    mnuPageNext.Enabled := False;
    mnuPageLast.Enabled := False;
    dxlbNext.Enabled := False;
    dxlbLast.Enabled := False;
  end
  else
  begin
    mnuPageNext.Enabled := True;
    mnuPageLast.Enabled := True;
    dxlbNext.Enabled := True;
    dxlbLast.Enabled := True;
  end;

  // 更新状态栏
  stbPrint.Panels[2].Text := IntToStr(PageNumber) + '\' + IntToStr(seppPreview.PageCount);
end;

procedure TdlgPrint.mnuZoomInClick(Sender: TObject);
var
  i: Integer;
  iCur: Integer;
begin
  // 放大
  seppPreview.ScaleMode := pscUserScaled;
  iCur := seppPreview.ScalePercent;
  for i := 0 to 6 do
    if (iCur >= FScaleValue[i]) and (iCur < FScaleValue[Succ(i)]) then
      seppPreview.ScalePercent := FScaleValue[Succ(i)];
end;

procedure TdlgPrint.seppPreviewScaleChange(Sender: TObject);
var
  iCur: Integer;
begin
  // 显示当前的显示状态
  iCur := seppPreview.ScalePercent;

  if iCur <= FScaleValue[0] then
  begin
    mnuZoomOut.Enabled := False;
    dxlbZoomOut.Enabled := False;
    mnuZoomIn.Enabled := True;
    dxlbZoomIn.Enabled := True;
  end
  else if iCur >= FScaleValue[7] then
  begin
    mnuZoomOut.Enabled := True;
    dxlbZoomOut.Enabled := True;
    mnuZoomIn.Enabled := False;
    dxlbZoomIn.Enabled := False;
  end
  else
  begin
    mnuZoomOut.Enabled := True;
    dxlbZoomOut.Enabled := True;
    mnuZoomIn.Enabled := True;
    dxlbZoomIn.Enabled := True;
  end;

  // 更新状态栏
  case seppPreview.ScaleMode of
    pscWholePage: stbPrint.Panels[3].Text := IntToStr(iCur) + '% (自动: 整页)';
    pscPageWidth: stbPrint.Panels[3].Text := IntToStr(iCur) + '% (自动: 页宽)';
    pscUserScaled: stbPrint.Panels[3].Text := IntToStr(iCur) + '% (固定)';
  end;
end;

procedure TdlgPrint.mnuZoomOutClick(Sender: TObject);
var
  i: Integer;
  iCur: Integer;
begin
  // 缩小
  seppPreview.ScaleMode := pscUserScaled;
  iCur := seppPreview.ScalePercent;
  for i := 0 to 6 do
    if (iCur > FScaleValue[i]) and (iCur <= FScaleValue[Succ(i)]) then
      seppPreview.ScalePercent := FScaleValue[i];
end;

procedure TdlgPrint.mnuZoomCustomClick(Sender: TObject);
var
  NewScale: Integer;
begin
  // 自定义缩放
  //NewScale := QDialogs.InputBox(Application.Title, '请输入要缩放的比例:', seppPreview.ScalePercent, FScaleValue[0], FScaleValue[7], 10);

  if NewScale = seppPreview.ScalePercent then
  begin
    seppPreview.ScaleMode := pscUserScaled;
    seppPreview.ScalePercent := NewScale;
  end;
end;

procedure TdlgPrint.FSaveSettings;
begin
  // 保存设置
  with PageSetting do
  begin
    FaceFont.Assign(txtPrint.Font);
    ScaleMode := Integer(seppPreview.ScaleMode);
    ScalePercent := seppPreview.ScalePercent;
    ToolbarVisible := dxbmPrint.BarByOldName('Toolbar').Visible;
    FormatbarVisible := dxbmPrint.BarByOldName('Format').Visible;
    StatusBarVisible := stbPrint.Visible;

    PageSetup.HeaderFont.Assign(sepPrint.Header.DefaultFont);
    PageSetup.HeaderMirror := sepPrint.Header.MirrorPosition;
    PageSetup.HeaderRoman := sepPrint.Header.RomanNumbers;
    PageSetup.HeaderLineColor := sepPrint.Header.LineColor;
    PageSetup.HeaderShadeColor := sepPrint.Header.ShadedColor;
    PageSetup.Header := sepPrint.Header.AsString;

    PageSetup.FooterFont.Assign(sepPrint.Footer.DefaultFont);
    PageSetup.FooterMirror := sepPrint.Footer.MirrorPosition;
    PageSetup.FooterRoman := sepPrint.Footer.RomanNumbers;
    PageSetup.FooterLineColor := sepPrint.Footer.LineColor;
    PageSetup.FooterShadeColor := sepPrint.Footer.ShadedColor;
    PageSetup.Footer := sepPrint.Footer.AsString;

    if ftLine in sepPrint.Header.FrameTypes then PageSetup.HeaderFrame := PageSetup.HeaderFrame + 1;
    if ftBox in sepPrint.Header.FrameTypes then PageSetup.HeaderFrame := PageSetup.HeaderFrame + 2;
    if ftShaded in sepPrint.Header.FrameTypes then PageSetup.HeaderFrame := PageSetup.HeaderFrame + 4;

    if ftLine in sepPrint.Footer.FrameTypes then PageSetup.FooterFrame := PageSetup.FooterFrame + 1;
    if ftBox in sepPrint.Footer.FrameTypes then PageSetup.FooterFrame := PageSetup.FooterFrame + 2;
    if ftShaded in sepPrint.Footer.FrameTypes then PageSetup.FooterFrame := PageSetup.FooterFrame + 4;

    PageSetup.LineInMargin := mnuContentSpace.Down;
    PageSetup.MarginBottom := sepPrint.Margins.Bottom;
    PageSetup.MarginFooter := sepPrint.Margins.Footer;
    PageSetup.MarginGutter := sepPrint.Margins.Gutter;
    PageSetup.MarginHeader := sepPrint.Margins.Header;
    PageSetup.MarginHFInternal := sepPrint.Margins.HFInternalMargin;
    PageSetup.MarginLeft := sepPrint.Margins.Left;
    PageSetup.MarginLeftHFText := sepPrint.Margins.LeftHFTextIndent;
    PageSetup.MarginMirror := sepPrint.Margins.MirrorMargins;
    PageSetup.MarginRight := sepPrint.Margins.Right;
    PageSetup.MarginRightHFText := sepPrint.Margins.RightHFTextIndent;
    PageSetup.MarginTop := sepPrint.Margins.Top;
    PageSetup.MarginUnit := Integer(sepPrint.Margins.UnitSystem);

    PrintContent := 0;
    if pcDate in FPrintContent then PrintContent := PrintContent + 1;
    if pcTime in FPrintContent then PrintContent := PrintContent + 2;
    if pcName in FPrintContent then PrintContent := PrintContent + 4;
    if pcPhone in FPrintContent then PrintContent := PrintContent + 8;
    if pcFlag in FPrintContent then PrintContent := PrintContent + 16;
    if pcHeader in FPrintContent then PrintContent := PrintContent + 32;
    if pcFooter in FPrintContent then PrintContent := PrintContent + 64;
    if pcLineNumber in FPrintContent then PrintContent := PrintContent + 128;

    if WindowState = wsMaximized then
      WndMaximized := True
    else
    begin
      WndMaximized := False;
      WndLeft := Left;
      WndTop := Top;
      WndWidth := Width;
      WndHeight := Height;
    end;


  end;
end;

procedure TdlgPrint.FApplySettings;
begin
  // 应用设置
  FInternal := True;

  with PageSetting do
  begin
    txtPrint.Font.Assign(FaceFont);
    seppPreview.ScalePercent := ScalePercent;
    seppPreview.ScaleMode := TSynPreviewScale(ScaleMode);
    dxbmPrint.BarByOldName('Toolbar').Visible := ToolbarVisible;
    dxbmPrint.BarByOldName('Format').Visible := FormatbarVisible;
    stbPrint.Visible := StatusBarVisible;

    sepPrint.Header.DefaultFont.Assign(PageSetup.HeaderFont);
    sepPrint.Header.MirrorPosition := PageSetup.HeaderMirror;
    sepPrint.Header.RomanNumbers := PageSetup.HeaderRoman;
    sepPrint.Header.LineColor := PageSetup.HeaderLineColor;
    sepPrint.Header.ShadedColor := PageSetup.HeaderShadeColor;
    sepPrint.Header.AsString := PageSetup.Header;

    sepPrint.Footer.DefaultFont.Assign(PageSetup.FooterFont);
    sepPrint.Footer.MirrorPosition := PageSetup.FooterMirror;
    sepPrint.Footer.RomanNumbers := PageSetup.FooterRoman;
    sepPrint.Footer.LineColor := PageSetup.FooterLineColor;
    sepPrint.Footer.ShadedColor := PageSetup.FooterShadeColor;
    sepPrint.Footer.AsString := PageSetup.Footer;

    sepPrint.Header.FrameTypes := [];
    if (PageSetup.HeaderFrame and 1) > 0 then sepPrint.Header.FrameTypes := sepPrint.Header.FrameTypes + [ftLine];
    if (PageSetup.HeaderFrame and 2) > 0 then sepPrint.Header.FrameTypes := sepPrint.Header.FrameTypes + [ftBox];
    if (PageSetup.HeaderFrame and 4) > 0 then sepPrint.Header.FrameTypes := sepPrint.Header.FrameTypes + [ftShaded];

    sepPrint.Footer.FrameTypes := [];
    if (PageSetup.FooterFrame and 1) > 0 then sepPrint.Footer.FrameTypes := sepPrint.Footer.FrameTypes + [ftLine];
    if (PageSetup.FooterFrame and 2) > 0 then sepPrint.Footer.FrameTypes := sepPrint.Footer.FrameTypes + [ftBox];
    if (PageSetup.FooterFrame and 4) > 0 then sepPrint.Footer.FrameTypes := sepPrint.Footer.FrameTypes + [ftShaded];

    mnuContentSpace.Down := PageSetup.LineInMargin;
    sepPrint.Margins.Bottom := PageSetup.MarginBottom;
    sepPrint.Margins.Footer := PageSetup.MarginFooter;
    sepPrint.Margins.Gutter := PageSetup.MarginGutter;
    sepPrint.Margins.Header := PageSetup.MarginHeader;
    sepPrint.Margins.HFInternalMargin := PageSetup.MarginHFInternal;
    sepPrint.Margins.Left := PageSetup.MarginLeft;
    sepPrint.Margins.LeftHFTextIndent := PageSetup.MarginLeftHFText;
    sepPrint.Margins.MirrorMargins := PageSetup.MarginMirror;
    sepPrint.Margins.Right := PageSetup.MarginRight;
    sepPrint.Margins.RightHFTextIndent := PageSetup.MarginRightHFText;
    sepPrint.Margins.Top := PageSetup.MarginTop;
    sepPrint.Margins.UnitSystem := TUnitSystem(PageSetup.MarginUnit);

    FPrintContent := [];
    if (PrintContent and 1) > 0 then Include(FPrintContent, pcDate);
    if (PrintContent and 2) > 0 then Include(FPrintContent, pcTime);
    if (PrintContent and 4) > 0 then Include(FPrintContent, pcName);
    if (PrintContent and 8) > 0 then Include(FPrintContent, pcPhone);
    if (PrintContent and 16) > 0 then Include(FPrintContent, pcFlag);
    if (PrintContent and 32) > 0 then Include(FPrintContent, pcHeader);
    if (PrintContent and 64) > 0 then Include(FPrintContent, pcFooter);
    if (PrintContent and 128) > 0 then Include(FPrintContent, pcLineNumber);

    // 设置界面
    mnuContentDate.Down := pcDate in FPrintContent;
    mnuContentTime.Down := pcTime in FPrintContent;
    mnuContentName.Down := pcName in FPrintContent;
    mnuContentPhoneNumber.Down := pcPhone in FPrintContent;
    mnuContentSign.Down := pcFlag in FPrintContent;
    mnuContentHeader.Down := pcHeader in FPrintContent;
    mnuContentFooter.Down := pcFooter in FPrintContent;
    mnuContentLineNum.Down := pcLineNumber in FPrintContent;
    mnuContentSpace.Down := sepPrint.LineNumbersInMargin;

    // 工具栏
    mnuFormatFontName.Text := FaceFont.Name;
    mnuFormatSize.Text := IntToStr(FaceFont.Size);
    mnuFormatBold.Down := fsBold in FaceFont.Style;
    mnuFormatItalic.Down := fsItalic in FaceFont.Style;
    mnuFormatUnderline.Down := fsUnderline in FaceFont.Style;
    mnuFormatStrikeout.Down := fsStrikeOut in FaceFont.Style;

    // 位置与大小
    if WndMaximized then
      WindowState := wsMaximized
    else
    begin
      Left := WndLeft;
      Top := WndTop;
      Width := WndWidth;
      Height := WndHeight;
    end;

    // 设置缩放
  end;

  FInternal := False;
end;

procedure TdlgPrint.mnuFormatFontNameChange(Sender: TObject);
begin
  // 更新字体
  if FInternal then exit;
  txtPrint.Font.Name := mnuFormatFontName.Text;
  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuFormatSizeChange(Sender: TObject);
var
  FontSize: Cardinal;
  ErrCode: Integer;
begin
  if FInternal then exit;
  Val(mnuFormatSize.Text, FontSize, ErrCode);
  mnuFormatSize.Text := IntToStr(FontSize);
  txtPrint.Font.Size := FontSize;
  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuFormatBoldClick(Sender: TObject);
begin
  if mnuFormatBold.Down then
    txtPrint.Font.Style := txtPrint.Font.Style + [fsBold]
  else
    txtPrint.Font.Style := txtPrint.Font.Style - [fsBold];

  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuFormatItalicClick(Sender: TObject);
begin
  if mnuFormatItalic.Down then
    txtPrint.Font.Style := txtPrint.Font.Style + [fsItalic]
  else
    txtPrint.Font.Style := txtPrint.Font.Style - [fsItalic];

  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;

end;

procedure TdlgPrint.mnuFormatUnderlineClick(Sender: TObject);
begin
  if mnuFormatUnderline.Down then
    txtPrint.Font.Style := txtPrint.Font.Style + [fsUnderline]
  else
    txtPrint.Font.Style := txtPrint.Font.Style - [fsUnderline];

  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuFormatStrikeoutClick(Sender: TObject);
begin
  if mnuFormatStrikeout.Down then
    txtPrint.Font.Style := txtPrint.Font.Style + [fsStrikeOut]
  else
    txtPrint.Font.Style := txtPrint.Font.Style - [fsStrikeOut];

  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuFormatFontClick(Sender: TObject);
begin
  // 设置字体
  fdFont.Font := txtPrint.Font;
  if fdFont.Execute then
  begin
    txtPrint.Font;
    seppPreview.UpdatePreview;
  end;
end;

procedure TdlgPrint.RefreshPreview;
var
  i: Integer;
  xMsg: TSMSEntry;
  dCurDate: TDateTime;
  sBuffer: String;
begin
  txtPrint.Lines.Clear;

  // 设置显示的内容
  for i := 0 to MsgContent.Count - 1 do
  begin
    xMsg := MsgContent.Items[i] as TSMSEntry;

    // 是否需要打印日期头
    if (pcDate in FPrintContent) and (CompareDate(dCurDate, xMsg.DateTime) <> 0) then
    begin
      if i > 0 then txtPrint.Lines.Add('');
      sBuffer := FormatDateTime(' yyyy年mm月dd日 ', xMsg.DateTime);
      txtPrint.Lines.Add(sBuffer);
      txtPrint.Lines.Add(StringOfChar('=', Length(sBuffer)));
      dCurDate := xMsg.DateTime;
    end;

    // 输出正文
    if pcFlag in FPrintContent then
      sBuffer := IfThen(xMsg.Receive, '(接收)', '(发送)')
    else
      sBuffer := '';

    if pcTime in FPrintContent then
      sBuffer := sBuffer + TimeToStr(xMsg.DateTime) + '|';

    if (pcPhone in FPrintContent) and (pcName in FPrintContent) then
      sBuffer := sBuffer + FormatContactsStr(xMsg.Name, xMsg.Phone, True)
    else if (pcPhone in FPrintContent) and (not (pcName in FPrintContent)) then
      sBuffer := sBuffer + StringReplace(xMsg.Phone.Text, #10#13, ', ', [rfReplaceAll])
    else if (not (pcPhone in FPrintContent)) and (pcName in FPrintContent) then
      sBuffer := sBuffer + FormatContactsStr(xMsg.Name, xMsg.Phone, False);

    sBuffer := Trim(sBuffer); 

    if SplitMsgMode then
    begin
      txtPrint.Lines.Add(sBuffer);
      txtPrint.Lines.Add('    ' + xMsg.Content);
    end
    else
    begin
      sBuffer := sBuffer + ': ' + StringReplace(xMsg.Content, #10#13, ', ', [rfReplaceAll]);
      txtPrint.Lines.Add(sBuffer);
    end;
  end;

  if pcHeader in FPrintContent then
    sepPrint.Header.AsString := PageSetting.PageSetup.Header
  else
    sepPrint.Header.Clear;

  if pcFooter in FPrintContent then
    sepPrint.Header.AsString := PageSetting.PageSetup.Footer
  else
    sepPrint.Header.Clear;

  sepPrint.LineNumbers := pcLineNumber in FPrintContent;

  // 更新纸张
  sepPrint.SynEdit := txtPrint;
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // dxbmPrint.SaveToIniFile(AppendPath(sPath, 'prntprw.bar'));
  msPrintDlg.Seek(0, soFromBeginning);
  dxbmPrint.SaveToStream(msPrintDlg);
  FSaveSettings;
  frmMain.FPrintPropDef := PageSetting;
  frmMain.DeleteWnd(Handle);
  Self.Release;
end;

procedure TdlgPrint.FAPICloseWindow(var Message: TMessage);
begin
  close;
end;

procedure TdlgPrint.mnuContentDateClick(Sender: TObject);
begin
  FPrintContent := [];

  if mnuContentTime.Down then FPrintContent := FPrintContent + [pcTime];
  if mnuContentName.Down then FPrintContent := FPrintContent + [pcName];
  if mnuContentPhoneNumber.Down then FPrintContent := FPrintContent + [pcPhone];
  if mnuContentSign.Down then FPrintContent := FPrintContent + [pcFlag];
  if mnuContentDate.Down then FPrintContent := FPrintContent + [pcDate];
  if mnuContentHeader.Down then FPrintContent := FPrintContent + [pcHeader];
  if mnuContentFooter.Down then FPrintContent := FPrintContent + [pcFooter];
  if mnuContentLineNum.Down then FPrintContent := FPrintContent + [pcLineNumber];

  RefreshPreview;
end;

procedure TdlgPrint.pdPrintClose(Sender: TObject);
begin
  // 更新打印机的信息
  stbPrint.Panels[0].Text := Printer.Printers[Printer.PrinterIndex];
  stbPrint.Panels[1].Text := Format('%dmm * %dmm', [
    Trunc(Convert(sepPrint.PrinterInfo.PhysicalWidth, duInches, duMillimeters)),
    Trunc(Convert(sepPrint.PrinterInfo.PhysicalHeight, duInches, duMillimeters))]);
end;

procedure TdlgPrint.mnuContentSpaceClick(Sender: TObject);
begin
  sepPrint.LineNumbersInMargin := mnuContentSpace.Down;
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.mnuContentLineNumClick(Sender: TObject);
begin
  if mnuContentLineNum.Down then
    FPrintContent := FPrintContent + [pcLineNumber]
  else
    FPrintContent := FPrintContent - [pcLineNumber];

  sepPrint.LineNumbers := pcLineNumber in FPrintContent;

  // 更新纸张
  seppPreview.UpdatePreview;
end;

procedure TdlgPrint.PrintDoc;
begin
  sepPrint.Print;
end;

end.
