unit MultiSMS;

// ************************************************************************ //
// 描述
// ----
//     这个模块是用于集联短信的支持
// ************************************************************************ //

interface

uses
  Classes;

type
  TMultiSMSStorageItem = class(TCollectionItem)
  public
    MessageContents: TStringList;
    MessageReference: Integer;
    MessageKnownTotal: Integer;
  end;

  TMultiSMSStorage = class(TCollection)
  private
    function FGetCount: Integer;
    function FGetItem(Index: Integer): TMultiSMSStorageItem;
    function FAdd: TMultiSMSStorageItem;
    procedure FSetItem(Index: Integer; Value: TMultiSMSStorageItem);
  public
    function AddMessagePiece(MessageReference: Integer; PieceTotal: Integer;
      PieceNo: Integer; MessagePiece: String; var WholeMessage: string): Boolean;
    constructor Create; virtual;
  end;

var
  AMultiSMSStorage: TMultiSMSStorage;

implementation

{ TMultiSMSStorage }

{*******************************************************************************
  过程名:    TMultiSMSStorage.AddMessagePiece
  作者:      Administrator
  日期:      2009.01.27
  参数:      MessageReference, PieceTotal, PieceNo: Integer; var WholeMessage
  返回值:    Boolean

  说明:
 -------
  添加一个消息片段，MessageReference, PieceTotal, PieceNo 是消息片段的参考值、
  片段总数，片段编号

  WholeMessage： 如果添加之后可以拼接成一个完整的消息，这个我返回值，且返回True,
  否则返回False;
*******************************************************************************}
function TMultiSMSStorage.AddMessagePiece(MessageReference, PieceTotal,
  PieceNo: Integer; MessagePiece: String; var WholeMessage: string): Boolean;
var
  AMsgItem: TMultiSMSStorageItem;
  i: Integer;
begin
  AMsgItem := nil;

  // 查找数据中是不是有相关的参考值的数据
  for i := 0 to Count - 1 do
    if FGetItem(i).MessageReference = MessageReference then
      AMsgItem := FGetItem(i);

  // 如果没有相同的消息参考就添加一个
  if not Assigned(AMsgItem) then
  begin
    AMsgItem := FAdd;
    AMsgItem.MessageReference := MessageReference;
    AMsgItem.MessageKnownTotal := 0;
    AMsgItem.MessageContents := TStringList.Create;
    for i := 0 to PieceTotal - 1 do
      AMsgItem.MessageContents.Add('');
  end;

  // 添加到消息参考相关的条目中
  AMsgItem.MessageContents[PieceNo] := MessagePiece;
  Inc(AMsgItem.MessageKnownTotal);

  // 组装
  if AMsgItem.MessageKnownTotal = PieceTotal then
  begin
    WholeMessage := '';
    Result := True;

    for i := 0 to PieceTotal - 1 do
      WholeMessage := WholeMessage + AMsgItem.MessageContents[i];

    // 删除这个消息参考
    inherited Delete(AMsgItem.Index);
  end
  else
    Result := False;  
end;

constructor TMultiSMSStorage.Create;
begin
  inherited Create(TMultiSMSStorageItem);
end;

function TMultiSMSStorage.FAdd: TMultiSMSStorageItem;
begin
  Result := TMultiSMSStorageItem(inherited Add);
end;

function TMultiSMSStorage.FGetCount: Integer;
begin
  Result := inherited Count;
end;

function TMultiSMSStorage.FGetItem(Index: Integer): TMultiSMSStorageItem;
begin
  Result := TMultiSMSStorageItem(inherited GetItem(Index));
end;

procedure TMultiSMSStorage.FSetItem(Index: Integer;
  Value: TMultiSMSStorageItem);
begin
  inherited SetItem(Index, Value);
end;

end.
