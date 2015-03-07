unit uFraInfoPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, StdCtrls, SynEdit, SynMemo, GerneralFunc;

type
  TfraInfoPreview = class(TFrame)
    pnlHeader: TPanel;
    lblPerson: TLabel;
    txtPerson: TEdit;
    imgPerson: TImage;
    lblDate: TLabel;
    txtDate: TEdit;
    imgDate: TImage;
    txtContent: TSynMemo;
    procedure pnlHeaderResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
{    procedure ShowMessageDetail(sMsg: String = ''; sPhone: String ='';
      sContacts: String = '';  dDate: TDateTime = 0; bReceive: Boolean = False);}
    procedure ShowMessageDetail(AInternalID: Integer = 0; ABox: TCurrentView = cvNone);
  end;

implementation

uses StrUtils, UserInterfaces, ADODB;

{$R *.dfm}
{procedure TfraInfoPreview.ShowMessageDetail(sMsg: String = ''; sPhone: String ='';
  sContacts: String = ''; dDate: TDateTime = 0; bReceive: Boolean = False);
var
  slPhone: TStringList;
  slName: TStringList;
  i : Integer;
  sTmp: String;
begin
  slPhone := TStringList.Create;
  slName := TStringList.Create;

  if dDate = 0 then dDate := Now;
  txtDate.Text := DateTimeToStr(dDate);
  txtContent.Lines.Text := sMsg;

  slPhone.Text := sPhone;
  slName.Text := sContacts;

  txtPerson.Text := FormatContactsStr(slName, slPhone);
  lblPerson.Caption := IfThen(bReceive, '发件人', '收件人');
end;}

procedure TfraInfoPreview.ShowMessageDetail(AInternalID: Integer = 0; ABox: TCurrentView = cvNone);
var
  dbRecord: TADOQuery;
  slPhone: TStringList;
  slName: TStringList;
begin
  if (ABox = cvNone) or (AInternalID = 0) then
  begin
    txtDate.Text := '';
    txtPerson.Text := '';
    txtContent.Text := '';
  end
  else
  begin
    slPhone := TStringList.Create;
    slName := TStringList.Create;
    dbRecord := TADOQuery.Create(nil);
    dbRecord.Connection := frmMain.adoSMS;
    dbRecord.SQL.Text := GetSQLStr(AInternalID, ABox);
    dbRecord.Open;

    while not dbRecord.Eof do
    begin
      slName.Add(dbRecord.FieldByName('name').AsString);
      slPhone.Add(dbRecord.FieldByName('number').AsString);

      if dbRecord.Bof then
      begin
        txtDate.Text := DateTimeToStr(dbRecord.FieldByName('date').AsDateTime);
        txtContent.Text := dbRecord.FieldByName('content').AsString;
      end;

      dbRecord.Next;
    end;

    txtPerson.Text := FormatContactsStr(slName, slPhone, True);

    slPhone.Free;
    slName.Free;
    dbRecord.Close;
    dbRecord.Free;
  end;

end;

procedure TfraInfoPreview.pnlHeaderResize(Sender: TObject);
begin
  // 调整大小
  txtPerson.Width := pnlHeader.Width - 78;
  txtDate.Width := pnlHeader.Width - 78;
end;

end.
