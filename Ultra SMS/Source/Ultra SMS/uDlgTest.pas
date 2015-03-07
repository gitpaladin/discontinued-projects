unit uDlgTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls;

type
  TdlgTest = class(TForm)
    pgcCodingtest: TPageControl;
    tsCharset: TTabSheet;
    mmoSource: TMemo;
    mmoResult: TMemo;
    btnEncodingbit: TButton;
    btnDecodingbit: TButton;
    btnDecodingUCS2: TButton;
    btnEncodeUCS2: TButton;
    btnCopyToSource: TButton;
    edit: TTabSheet;
    txtSource: TEdit;
    txtResult: TEdit;
    btnEncodingNumber: TButton;
    btnDecoding: TButton;
    btnCopytoSrc: TButton;
    chkInfoCenter: TCheckBox;
    tsPDU: TTabSheet;
    grpEncoding: TGroupBox;
    mmoSMS: TMemo;
    lblContent: TLabel;
    txtNumber: TLabeledEdit;
    txtInfoCenter: TLabeledEdit;
    txtMessageRef: TLabeledEdit;
    chkMsgReport: TCheckBox;
    chkCSMS: TCheckBox;
    chkUnicode: TCheckBox;
    mmoPDUResult: TMemo;
    grpDecoding: TGroupBox;
    mmoPDUSrc: TMemo;
    mmoPduDecResult: TMemo;
    btnPDUDecoding: TButton;
    btnPDUEncoding: TButton;
    tsControlTest: TTabSheet;
    procedure btnEncodingbitClick(Sender: TObject);
    procedure btnDecodingbitClick(Sender: TObject);
    procedure btnEncodeUCS2Click(Sender: TObject);
    procedure btnDecodingUCS2Click(Sender: TObject);
    procedure btnCopyToSourceClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEncodingNumberClick(Sender: TObject);
    procedure btnDecodingClick(Sender: TObject);
    procedure btnCopytoSrcClick(Sender: TObject);
    procedure mmoSMSChange(Sender: TObject);
    procedure btnPDUEncodingClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dlgTest: TdlgTest;

implementation

uses
  GSMChar, StrUtils;

{$R *.dfm}

procedure TdlgTest.btnCopyToSourceClick(Sender: TObject);
begin
  mmoSource.Text := mmoResult.Text;
end;

procedure TdlgTest.btnCopytoSrcClick(Sender: TObject);
begin
  txtSource.Text := txtResult.Text; 
end;

procedure TdlgTest.btnDecodingbitClick(Sender: TObject);
begin
  mmoResult.Text := GSMChar.Decode7bit(mmoSource.Text)
end;

procedure TdlgTest.btnDecodingClick(Sender: TObject);
var
  TrimedNumber: String;
begin
  TrimedNumber := txtSource.Text;
  Delete(TrimedNumber, 1, 2);  
  txtResult.Text := DecodeNumberString(TrimedNumber);
end;

procedure TdlgTest.btnDecodingUCS2Click(Sender: TObject);
begin
  mmoResult.Text := GSMChar.DecodeUnicodeBE(mmoSource.Text)
end;

procedure TdlgTest.btnEncodeUCS2Click(Sender: TObject);
begin
  mmoResult.Text := GSMChar.EncodeUnicodeBE(mmoSource.Text)
end;

procedure TdlgTest.btnEncodingbitClick(Sender: TObject);
begin
  mmoResult.Text := GSMChar.Encode7bit(mmoSource.Text)
end;

procedure TdlgTest.btnEncodingNumberClick(Sender: TObject);
begin
  txtResult.Text := EncodeNumberString(txtSource.Text, chkInfoCenter.Checked);
end;

procedure TdlgTest.btnPDUEncodingClick(Sender: TObject);
var
  iPdu, iMaxChar, iSMSReferenceNumber, i: Integer;
  SMS, sMsg, sCmd: String;
  bUnicode, bLongSMS: Boolean;
  slSeparated: TStringList;
  MessageReference: Integer;
begin
  //PDU 编码
  SMS := AnsiReplaceText(mmoSMS.Text, #$D#$A, #$D);

  // 准备一些事情
  bUnicode := chkUnicode.Checked;
  sMsg := WideString(SMS);
  MessageReference := StrToIntDef(txtMessageRef.Text, 0);
  mmoPDUResult.Lines.Clear;

  if bUnicode then
    iMaxChar := 70
  else
    iMaxChar := 160;

  // 长短信分割方式
  if chkCSMS.Checked and (Length(sMsg) > iMaxChar) then
  begin
    if bUnicode then
      iMaxChar := 67
    else
      iMaxChar := 153;

    bLongSMS := True;
    Randomize;
    iSMSReferenceNumber := Trunc(Random(256));
  end
  else
    bLongSMS := False;

  // 分割发送
  slSeparated := TStringList.Create;

  while Length(sMsg) > 0 do
  begin
    if Length(sMsg) > iMaxChar then
    begin
      slSeparated.Add(LeftStr(sMsg, iMaxChar));
      Delete(sMsg, 1, iMaxChar);
    end
    else
    begin
      slSeparated.Add(sMsg);
      sMsg := '';
    end;
  end;

  for i := 0 to slSeparated.Count - 1 do
  begin
    // PDU 编码
    Inc(MessageReference);
    
    if chkMsgReport.Checked then
      sCmd := PDUSendString(iPdu, txtInfoCenter.Text, txtNumber.Text, slSeparated[i], bUnicode, 17 + 32, MessageReference, 0, bLongSMS, slSeparated.Count, i, iSMSReferenceNumber)
    else
      sCmd := PDUSendString(iPdu, txtInfoCenter.Text, txtNumber.Text, slSeparated[i], bUnicode, 17, MessageReference, 0, bLongSMS, slSeparated.Count, i, iSMSReferenceNumber);  // +32 发送报告

    mmoPDUResult.Lines.Add('Length: ' + IntToStr(iPdu));
    mmoPDUResult.Lines.Add(sCmd); 
    mmoPDUResult.Lines.Add('');
  end;

  slSeparated.Free;
end;

procedure TdlgTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Release;
end;

procedure TdlgTest.mmoSMSChange(Sender: TObject);
begin
  if IsSpecificTest(mmoSMS.Text) then
  begin
    chkUnicode.Enabled := False;
    chkUnicode.Enabled := True;
  end
  else
    chkUnicode.Enabled := True;  
end;

end.
