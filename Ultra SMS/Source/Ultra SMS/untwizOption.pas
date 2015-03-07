unit untwizOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ImgList;

type
  TfrawizOption = class(TFrame)
    lblBaudRate: TStaticText;
    lvwBaudRate: TListView;
    rgByteSize: TRadioGroup;
    rgStopBits: TRadioGroup;
    rgParityCheck: TRadioGroup;
    iltBaudRate: TImageList;
    chkSaveToLocal: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetBaudrateList(sList: TStringList);
  end;

implementation

{$R *.dfm}
procedure TfrawizOption.SetBaudrateList(sList: TStringList);
var
  i: Integer;
begin
  lvwBaudRate.Clear;
  if (sList = nil) or (sList.Count = 0) then
  begin
    lvwBaudRate.AddItem('300', nil);
    lvwBaudRate.AddItem('1200', nil);
    lvwBaudRate.AddItem('2400', nil);
    lvwBaudRate.AddItem('4800', nil);
    lvwBaudRate.AddItem('9600', nil);
    lvwBaudRate.AddItem('19200', nil);
    lvwBaudRate.AddItem('38400', nil);
    lvwBaudRate.AddItem('57600', nil);
    lvwBaudRate.AddItem('115200', nil);
    lvwBaudRate.AddItem('230400', nil);
    lvwBaudRate.Items[4].Selected := True;
  end
  else
  begin
    for i := 0 to sList.Count - 1 do
      if sList[i] <> '0' then
        lvwBaudRate.AddItem(sList[i], nil);
    lvwBaudRate.Items[lvwBaudRate.Items.Count - 1].Selected := True;
  end;
end;

end.
