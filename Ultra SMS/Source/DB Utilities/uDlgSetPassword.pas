unit uDlgSetPassword;

//{$DEFINE NULLDEFAULTPASS}

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, uGeneral;

type
  TdlgSetPassword = class(TForm)
    lblOriginal: TLabel;
    txtOriginal: TEdit;
    txtNew: TEdit;
    lblNew: TLabel;
    txtConfirm: TEdit;
    lblConfirm: TLabel;
    bvlBottom: TBevel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    bvlTop: TBevel;
    shpTopBack: TShape;
    lblTitle: TLabel;
    lblTitleInfo: TLabel;
    imgTitle: TImage;
    lblDescription: TLabel;
    lblInfo2: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  ADODB, StrUtils, uFrmIntroPage, ComObj;

procedure TdlgSetPassword.btnCancelClick(Sender: TObject);
begin
  Close;
end;


procedure TdlgSetPassword.btnOKClick(Sender: TObject);
var
  conn: TADOConnection;
  sPass: String;
  sNew: String;
  i: Integer;
  sMsg: String;
begin
  // 检查密码的正确性
  if txtNew.Text <> txtConfirm.Text then
  begin
    MessageBox(Handle, '新密码和确认的新密码不相同，请重新输入。', 
      PChar(Application.Title), MB_OK + MB_ICONWARNING);
    txtConfirm.SetFocus;
    Exit;
  end;

  if txtNew.Text = txtOriginal.Text then
  begin
    MessageBox(Handle, '新密码和原始密码一样，请重新输入。',
      PChar(Application.Title), MB_OK + MB_ICONWARNING);
    txtNew.SetFocus;
    Exit;
  end;

  if Length(txtNew.Text) = 0 then
    if MessageBox(Handle,
      '新密码没有填写，此操作会取消数据库的密码，是否继续？',
      PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = IDNO then
    begin
      txtNew.SetFocus;
      Exit;
    end;

  // 开始修改密码
  if Length(txtOriginal.Text) = 0 then
  {$IFDEF NULLDEFAULTPASS}
    sPass := 'NULL'
  {$ELSE}
    sPass := '[' + FEncodePassword(sNullPassword) + ']'
  {$ENDIF}
  else
    sPass := '[' + FEncodePassword(txtOriginal.Text) + ']';

  if Length(txtNew.Text) = 0 then
  {$IFDEF NULLDEFAULTPASS}
    sNew := 'NULL'
  {$ELSE}
    sNew := '[' + FEncodePassword(sNullPassword) + ']'
  {$ENDIF}
  else
    sNew := '[' + FEncodePassword(txtNew.Text) + ']';

  try
    for i := 0 to DBPaths.Count - 1 do
    begin
      conn := TADOConnection.Create(nil);
      conn.Mode := cmShareExclusive;
      conn.ConnectionString :=
        'Provider=Microsoft.Jet.OLEDB.4.0;' +
        'Data Source=' + DBPaths[i] +
        ';Persist Security Info=False';
      if (sPass) <> 'NULL' then
        conn.ConnectionString := conn.ConnectionString
          + ';Jet OLEDB:Database Password=' + MidStr(sPass, 2, Length(sPass) - 2);
      conn.Open;
      conn.Execute('ALTER DATABASE PASSWORD ' + sNew + ' ' + sPass +';');
      conn.Close;
      conn.Free;
    end;
  except
    on E: Exception do
    begin
      if E is EOleException then
        if (E as EOleException).ErrorCode = -2147217843 then
        begin
          MessageBox(Handle,
            PChar('您输入你密码无效，请重新输入。'),
            PChar(Application.Title), MB_OK + MB_ICONSTOP);
          conn.Free;
          txtOriginal.SetFocus;
          Exit;
        end;

      conn.Free;
      sMSG := Format('无法连接数据库，请确认该数据库存在并且没有被其他程序所使用。%s%s', [#10#13, DBPaths[i]]);
      MessageBox(Handle, PChar(sMSG), PChar(self.Caption), MB_ICONSTOP);
      Exit;
    end;
  end;

  MessageBox(Handle, '设置新密码成功。', PChar(Application.Title), MB_OK + 
    MB_ICONINFORMATION);

  Close;  

end;

end.
