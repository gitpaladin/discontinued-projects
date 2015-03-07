unit uDragDropOLE;

{单元名称：uDragDropOLE
 单元说明：让TwinControl控件能接收外来的文本拖放
 其它声明：senfore收集修改,盒子首发：www.2ccc.com}

interface

uses ActiveX, Types, Classes, ComObj, Windows;

type

  TShellDragEvent = procedure(Sender: Tobject; DragText: string) of object;
  TDragAndDropOLE = class(TObject, IUnknown, IDropTarget)
  private
    FOwnerHandle: Thandle;
    CanDrop: HResult;
    fe: TFormatEtc;
    FRefCount: integer; 
    FOnShellDragDrop: TShellDragEvent;
    procedure SetOnShellDragDrop(const Value: TShellDragEvent);
  protected
   { Iunkown }
    function _AddRef: integer; stdcall;
    function _Release: integer; stdcall;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
   { IdropTarget }
    function DragEnter(const dataObj: IDataObject; grfKeyState: Longint;
      pt: TPoint; var dwEffect: Longint): HResult; stdcall;
    function DragOver(grfKeyState: Longint; pt: TPoint; var dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
  protected
    procedure DoShellDragDrop(DragText: string);
  published
    property OnShellDragDrop: TShellDragEvent read FOnShellDragDrop write SetOnShellDragDrop;
  public
    constructor Create(Aowner: Tcomponent);
    destructor Destroy; override;
  end; 


implementation

uses Controls, SysUtils, Messages;

{ TDragAndDropOLE }

constructor TDragAndDropOLE.Create(Aowner: Tcomponent);
begin
  FRefCount := 0;
  if not (Aowner is Twincontrol) then
  begin
    raise Exception.Create('The DragAndDropOLE''s Owner must be a TWinControl');
  end;
  FOwnerHandle := Twincontrol(Aowner).handle;
  RegisterDragDrop(FOwnerHandle, self);
end;

destructor TDragAndDropOLE.Destroy;
begin
  RevokeDragDrop(FOwnerHandle);
  inherited;
end;

procedure TDragAndDropOLE.DoShellDragDrop(DragText: string);
begin
  if Assigned(fonshellDragDrop) then
    fonshellDragDrop(Self, DragText);
end;

function TDragAndDropOLE.DragEnter(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
begin
  result := E_FAIL;
  CanDrop := E_Fail;
  if assigned(dataObj) then
  begin
    with fe do
    begin
      cfFormat := CF_TEXT;
      ptd := nil;
      dwAspect := DVASPECT_CONTENT;
      lindex := -1;
      tymed := TYMED_HGLOBAL;
    end; 
    CanDrop := dataObj.QueryGetData(fe);
    result := CanDrop;
    if not Failed(result) then
      dwEffect := DROPEFFECT_COPY
    else dwEffect := DROPEFFECT_NONE;

  end;
end;

function TDragAndDropOLE.DragLeave: HResult;
begin
  result := S_OK;
end;

function TDragAndDropOLE.DragOver(grfKeyState: Integer; pt: TPoint;
  var dwEffect: Integer): HResult;
begin
  result := S_OK;
end;

function TDragAndDropOLE.Drop(const dataObj: IDataObject; grfKeyState: Integer;
  pt: TPoint; var dwEffect: Integer): HResult;
var
  medium: stgMedium;
  hData: HGLOBAL;
begin
  result := E_Fail;
  if not Failed(CanDrop) then
  begin
    result := dataObj.GetData(fe, medium);
    hData := HGLOBAL(GlobalLock(medium.hGlobal));
    DoShellDragDrop(StrPas(pchar(hData)));
    GlobalUnlock(hData);
    GlobalFree(hData); 
  end;
end;

function TDragAndDropOLE.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    result := S_OK
  else result := E_NOINTERFACE;
end;

procedure TDragAndDropOLE.SetOnShellDragDrop(const Value: TShellDragEvent);
begin
  FOnShellDragDrop := Value;
end;

function TDragAndDropOLE._AddRef: integer;
begin
  result := InterLockedDecrement(FRefCount);
  if Result = 0 then Destroy;
end;

function TDragAndDropOLE._Release: integer;
begin
  result := InterLockedIncrement(FRefCount);
end;

end.
