unit uDlgUpdateDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, ComCtrls;

type
  TdlgUpdateDB = class(TForm)
    pbTable: TProgressBar;
    lblTable: TLabel;
    pbTotal: TProgressBar;
    lblTotal: TLabel;
  private
    { Private declarations }
    procedure CreateHashField(const sTBLName: String; var conDb: TADOConnection);
  public
    { Public declarations }
    procedure UpdateDatabase(const Password, dbPath: String);
  end;

implementation

{$R *.dfm}

uses
  DB, uGeneral, CryptoAPI;

procedure TdlgUpdateDB.UpdateDatabase(const Password, dbPath: String);
var
  dbSMS: TADOTable;
  dbSMSItem: TADOTable;
  conSMS: TADOConnection;
  sHash: String;
  slContent: TStringList;
  iMax: Integer;
  iMaxs: array[0..3] of Integer;
  dbQuery: TADOQuery;
begin
  Show;
  Application.ProcessMessages;

  dbSMS := TADOTable.Create(nil);
  dbSMSItem := TADOTable.Create(nil);
  conSMS := TADOConnection.Create(nil);
  slContent := TStringList.Create;

  conSMS.ConnectionString := GetConnectionStr(dbPath, Password, False);
  conSMS.Connected := True;
  dbSMS.Connection := conSMS;
  dbSMSItem.Connection := conSMS;

  iMaxs[0] := GetTableRecCount(dbSMS, 'draft');
  iMaxs[1] := GetTableRecCount(dbSMS, 'finish');
  iMaxs[2] := GetTableRecCount(dbSMS, 'receive');
  iMaxs[3] := GetTableRecCount(dbSMS, 'send');
  pbTotal.Max := iMaxs[0] + iMaxs[1] + iMaxs[2] + iMaxs[3];

  // 改变表结构
  dbQuery := TADOQuery.Create(nil);
  dbQuery.Connection := conSMS;
  dbQuery.SQL.Text := 'ALTER TABLE [receive] ALTER COLUMN [content] MEMO;';
  dbQuery.ExecSQL;
  dbQuery.SQL.Text := 'ALTER TABLE [draft] ALTER COLUMN [content] MEMO;';
  dbQuery.ExecSQL;
  dbQuery.SQL.Text := 'ALTER TABLE [finish] ALTER COLUMN [content] MEMO;';
  dbQuery.ExecSQL;
  dbQuery.SQL.Text := 'ALTER TABLE [send] ALTER COLUMN [content] MEMO;';
  dbQuery.ExecSQL;
  dbQuery.Free;

  // 添加 draft 表
  CreateHashField('draft', conSMS);
  dbSMS.TableName := 'draft';
  dbSMSItem.TableName := 'draft_item';

  dbSMS.Open;
  dbSMSItem.Open;

  if iMaxs[0] <> 0 then
  begin
    pbTable.Position := 0;
    pbTable.Max := iMaxs[0];
    lblTotal.Caption := '正在转换草稿...';
    iMax := 0;
  end;

  while not dbSMS.Eof do
  begin
    slContent.Clear;
    dbSMSItem.Filtered := False;
    dbSMSItem.Filter := 'associatedid = ' + IntToStr(dbSMS.FieldByName('internalid').AsInteger);
    dbSMSItem.Filtered := True;

    while not dbSMSItem.Eof do
    begin
      slContent.Add(dbSMSItem.FieldByName('number').AsString);
      dbSMSItem.Next;
    end;

    slContent.Sort;
    slContent.Add(dbSMS.FieldByName('content').AsString);
    HashStr(HASH_MD5, slContent.Text, sHash);
    dbSMS.Edit;
    dbSMS.FieldByName('hash').AsString := sHash;
    dbSMS.Post;
    dbSMS.Next;

    pbTable.StepIt;
    pbTotal.StepIt;
    Inc(iMax);
    lblTable.Caption := IntToStr(iMax) + '/' + IntToStr(iMaxs[0]);
    Application.ProcessMessages;
  end;

  dbSMS.Close;
  dbSMSItem.Close;

  // 添加 finish 表
  CreateHashField('finish', conSMS);
  dbSMS.TableName := 'finish';
  dbSMSItem.TableName := 'finish_item';

  dbSMS.Open;
  dbSMSItem.Open;

  if iMaxs[1] <> 0 then
  begin
    pbTable.Position := 0;
    pbTable.Max := iMaxs[1];
    lblTotal.Caption := '正在转换已发送...';
    iMax := 0;
  end;

  while not dbSMS.Eof do
  begin
    slContent.Clear;
    dbSMSItem.Filtered := False;
    dbSMSItem.Filter := 'associatedid = ' + IntToStr(dbSMS.FieldByName('internalid').AsInteger);
    dbSMSItem.Filtered := True;

    while not dbSMSItem.Eof do
    begin
      slContent.Add(dbSMSItem.FieldByName('number').AsString);
      dbSMSItem.Next;
    end;

    slContent.Sort;
    slContent.Add(dbSMS.FieldByName('content').AsString);
    HashStr(HASH_MD5, slContent.Text, sHash);
    dbSMS.Edit;
    dbSMS.FieldByName('hash').AsString := sHash;
    dbSMS.Post;
    dbSMS.Next;

    pbTable.StepIt;
    pbTotal.StepIt;
    Inc(iMax);
    lblTable.Caption := IntToStr(iMax) + '/' + IntToStr(iMaxs[1]);
    Application.ProcessMessages;
  end;

  dbSMS.Close;
  dbSMSItem.Close;

  // 添加 Receive 表
  CreateHashField('receive', conSMS);
  dbSMS.TableName := 'receive';
  dbSMS.Open;

  if iMaxs[2] <> 0 then
  begin
    pbTable.Position := 0;
    pbTable.Max := iMaxs[2];
    lblTotal.Caption := '正在转换已接收...';
    iMax := 0;
  end;

  while not dbSMS.Eof do
  begin
    slContent.Clear;
    slContent.Add(dbSMS.FieldByName('sendernumber').AsString);
    slContent.Add(dbSMS.FieldByName('content').AsString);
    HashStr(HASH_MD5, slContent.Text, sHash);
    dbSMS.Edit;
    dbSMS.FieldByName('hash').AsString := sHash;
    dbSMS.Post;
    dbSMS.Next;

    pbTable.StepIt;
    pbTotal.StepIt;
    Inc(iMax);
    lblTable.Caption := IntToStr(iMax) + '/' + IntToStr(iMaxs[2]);
    Application.ProcessMessages;
  end;

  dbSMS.Close;

  // 添加 Send 表
  CreateHashField('send', conSMS);
  dbSMS.TableName := 'send';
  dbSMS.Open;

  if iMaxs[3] <> 0 then
  begin
    pbTable.Position := 0;
    pbTable.Max := iMaxs[3];
    lblTotal.Caption := '正在转换发件箱...';
    iMax := 0;
  end;

  while not dbSMS.Eof do
  begin
    slContent.Clear;
    slContent.Add(dbSMS.FieldByName('number').AsString);
    slContent.Add(dbSMS.FieldByName('content').AsString);
    HashStr(HASH_MD5, slContent.Text, sHash);
    dbSMS.Edit;
    dbSMS.FieldByName('hash').AsString := sHash;
    dbSMS.Post;
    dbSMS.Next;

    pbTable.StepIt;
    pbTotal.StepIt;
    Inc(iMax);
    lblTable.Caption := IntToStr(iMax) + '/' + IntToStr(iMaxs[3]);
    Application.ProcessMessages;
  end;

  dbSMS.Close;

  // 释放空间
  dbSMS.Free;
  dbSMSItem.Free;
  conSMS.Free;
  slContent.Free;
end;

procedure TdlgUpdateDB.CreateHashField(const sTBLName: String; var conDb: TADOConnection);
var
  dbQuery: TADOQuery;
begin
  try
    dbQuery := TADOQuery.Create(nil);
    dbQuery.Connection := conDb;
    dbQuery.SQL.Text := Format('ALTER TABLE [%s] ADD COLUMN [hash] TEXT(64);', [sTBLName]);
    dbQuery.ExecSQL;
    dbQuery.SQL.Text := Format('CREATE INDEX [hash] ON [%S]([hash] ASC);', [sTBLName]);
    dbQuery.ExecSQL;
  except
    ;
  end;

  dbQuery.Free;
end;

end.
