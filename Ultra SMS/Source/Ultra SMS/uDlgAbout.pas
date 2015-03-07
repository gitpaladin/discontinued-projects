unit uDlgAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, Buttons, ShellAPI;

type
  TdlgAbout = class(TForm)
    imgAbout: TImage;
    bvlAbout: TBevel;
    lblVersion: TLabel;
    lblRelease: TLabel;
    lblLanguage: TLabel;
    lblCompiler: TLabel;
    lblAuthor: TLabel;
    lblMail: TLabel;
    lblMailAddress: TLabel;
    lblWebsiteT: TLabel;
    lblWebsite: TLabel;
    lblDownloadT: TLabel;
    lblDownload: TLabel;
    lblOfficialSiteT: TLabel;
    lbllblOfficialSite: TLabel;
    lblWarning: TLabel;
    btnClose: TBitBtn;
    lblAd: TLabel;
    bvlBottom: TBevel;
    procedure lblMailAddressClick(Sender: TObject);
    procedure lblWebsiteClick(Sender: TObject);
    procedure lblDownloadClick(Sender: TObject);
    procedure lbllblOfficialSiteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TdlgAbout.lblMailAddressClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'mailto:chenminglong21cn@21cn.com' +
    '?subject=给 Ultra SMS 作者的一封信', nil, nil, SW_SHOW);
end;

procedure TdlgAbout.lblWebsiteClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://www.alexstudio.cn', nil, nil, SW_SHOW);
end;

procedure TdlgAbout.lblDownloadClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://alexanderchen.ys168.com', nil, nil, SW_SHOW);
end;

procedure TdlgAbout.lbllblOfficialSiteClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://www.alexstudio.cn/ultrasms', nil, nil, SW_SHOW);
end;

procedure TdlgAbout.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
