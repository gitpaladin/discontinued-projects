unit uFraFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ComCtrls, Buttons, dximctrl, ImgList, uDlgSelContacts;

type
  TfraFilter = class(TFrame)
    chkEnable: TCheckBox;
    gbTimeFiter: TGroupBox;
    optTimeOneHour: TRadioButton;
    optTimeToday: TRadioButton;
    optTimeYesterday: TRadioButton;
    optTimeBeforeYesterday: TRadioButton;
    optTimeThisWeek: TRadioButton;
    optTimeThisMonth: TRadioButton;
    optTimeThisYear: TRadioButton;
    optTimeDisable: TRadioButton;
    optTimeCutsom: TRadioButton;
    chkTimeFrom: TCheckBox;
    dtpTimeFrom: TDateTimePicker;
    chkTimeTo: TCheckBox;
    dtpTimeTo: TDateTimePicker;
    gbName: TGroupBox;
    chkNameEnable: TCheckBox;
    lstName: TdxImageListBox;
    btnNameAdd: TBitBtn;
    btnNameDel: TBitBtn;
    btnNameClear: TBitBtn;
    iltNames: TImageList;
    chkNameNoName: TCheckBox;
    btnRefresh: TBitBtn;
    procedure SetEnabledStatus(Sender: TObject);
    procedure lstNameClick(Sender: TObject);
    procedure btnNameAddClick(Sender: TObject);
    procedure btnNameDelClick(Sender: TObject);
    procedure btnNameClearClick(Sender: TObject);
    procedure optTimeOneHourClick(Sender: TObject);
    procedure optTimeTodayClick(Sender: TObject);
    procedure optTimeYesterdayClick(Sender: TObject);
    procedure optTimeBeforeYesterdayClick(Sender: TObject);
    procedure optTimeThisWeekClick(Sender: TObject);
    procedure optTimeThisMonthClick(Sender: TObject);
    procedure optTimeThisYearClick(Sender: TObject);
    procedure optTimeCutsomClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DTimeFrom: TDateTime;
    DTimeTo: TDateTime;
    BTimeFrom: Boolean;
    BTimeTo: Boolean;
    BName: Boolean;
    BNoName: Boolean;

    procedure AddNames(const SelNames: TStringList);
  end;

implementation

uses DateUtils, UserInterfaces;

{$R *.dfm}

procedure TfraFilter.SetEnabledStatus(Sender: TObject);
begin
  // 时间选项
  optTimeOneHour.Enabled := chkEnable.Checked;
  optTimeToday.Enabled := chkEnable.Checked;
  optTimeYesterday.Enabled := chkEnable.Checked;
  optTimeBeforeYesterday.Enabled := chkEnable.Checked;
  optTimeThisWeek.Enabled := chkEnable.Checked;
  optTimeThisMonth.Enabled := chkEnable.Checked;
  optTimeThisYear.Enabled := chkEnable.Checked;
  optTimeDisable.Enabled := chkEnable.Checked;
  optTimeCutsom.Enabled := chkEnable.Checked;
  chkTimeFrom.Enabled := chkEnable.Checked and optTimeCutsom.Checked;
  chkTimeTo.Enabled := chkEnable.Checked and optTimeCutsom.Checked;
  dtpTimeFrom.Enabled := chkEnable.Checked and optTimeCutsom.Checked and chkTimeFrom.Checked;
  dtpTimeTo.Enabled := chkEnable.Checked and optTimeCutsom.Checked and chkTimeTo.Checked;

  chkNameEnable.Enabled := chkEnable.Checked;
  btnNameAdd.Enabled := chkEnable.Checked and chkNameEnable.Checked;
  btnNameDel.Enabled := chkEnable.Checked and chkNameEnable.Checked and (lstName.SelCount > 0);
  btnNameClear.Enabled := chkEnable.Checked and chkNameEnable.Checked and (lstName.Count > 0);
  lstName.Enabled := chkEnable.Checked and chkNameEnable.Checked;
  chkNameNoName.Enabled := chkEnable.Checked and chkNameEnable.Checked;

  //btnRefresh.Enabled := chkEnable.Checked;

  // 表示内容
  BTimeFrom := chkEnable.Checked and (not optTimeDisable.Checked);
  BTimeFrom := BTimeFrom and ((not optTimeCutsom.Checked) or
    (optTimeCutsom.Checked and chkTimeFrom.Checked));
  BTimeTo := chkEnable.Checked and (optTimeYesterday.Checked or
    optTimeBeforeYesterday.Checked or (optTimeCutsom.Checked and
    chkTimeTo.Checked));
  BName := chkEnable.Checked and chkNameEnable.Checked;
  BNoName := chkEnable.Checked and chkNameEnable.Checked and chkNameNoName.Checked;

  frmMain.dxmnuEditFilterEnabled.Down := chkEnable.Checked;
end;

procedure TfraFilter.lstNameClick(Sender: TObject);
begin
  SetEnabledStatus(nil);
end;

procedure TfraFilter.btnNameAddClick(Sender: TObject);
begin
  // 添加项目
  with TdlgSelContacts.Create(nil) do
  begin
    ExcludeList.Assign(Self.lstName.Items);
    lvwCategory.Items[0].Selected := True;
    ShowModal;
    if not Canceled then
      AddNames(SelNames);
    Free;
  end;
end;

procedure TfraFilter.btnNameDelClick(Sender: TObject);
begin
  lstName.DeleteSelected;
end;

procedure TfraFilter.btnNameClearClick(Sender: TObject);
begin
  lstName.Clear;
end;

procedure TfraFilter.optTimeOneHourClick(Sender: TObject);
begin
  // 一个小时之内
  DTimeFrom := RecodeMinute(Now, 0);
  DTimeFrom := RecodeSecond(DTimeFrom, 0);
  SetEnabledStatus(nil);
end;

procedure TfraFilter.optTimeTodayClick(Sender: TObject);
begin
  // 今天
  DTimeFrom := Today;
  SetEnabledStatus(nil);
end;

procedure TfraFilter.optTimeYesterdayClick(Sender: TObject);
begin
  // 昨天
  DTimeFrom := Yesterday;
  DTimeTo := EndOfTheDay(Yesterday);
  SetEnabledStatus(nil);
end;

procedure TfraFilter.optTimeBeforeYesterdayClick(Sender: TObject);
begin
  // 前天
  DTimeFrom := Date - 2;
  DTimeTo := EndOfTheDay(Date - 2);
  SetEnabledStatus(nil);
end;

procedure TfraFilter.optTimeThisWeekClick(Sender: TObject);
begin
  // 本周
  DTimeFrom := StartOfTheWeek(Now);
  SetEnabledStatus(nil);
end;

procedure TfraFilter.optTimeThisMonthClick(Sender: TObject);
begin
  // 本月
  DTimeFrom := StartOfTheMonth(Now);
  SetEnabledStatus(nil);
end;

procedure TfraFilter.optTimeThisYearClick(Sender: TObject);
begin
  // 今年
  DTimeFrom := StartOfTheYear(Now);
  SetEnabledStatus(nil);
end;

procedure TfraFilter.optTimeCutsomClick(Sender: TObject);
begin
  DTimeFrom := dtpTimeFrom.Date;
  DTimeTo := EndOfTheDay(dtpTimeTo.Date);
  SetEnabledStatus(nil);
end;

procedure TfraFilter.btnRefreshClick(Sender: TObject);
begin
  frmMain.RefreshView;
end;

procedure TfraFilter.AddNames(const SelNames: TStringList);
var
  i: Integer;
  iMatchID: Integer;
  iOldCount: Integer;
begin
  lstName.ClearSelection;
  iOldCount := lstName.Items.Count;

  for i := 0 to SelNames.Count - 1 do
  begin
    iMatchID := Self.lstName.Items.IndexOf(SelNames[i]);

    if iMatchID = -1 then
      iMatchID := Self.lstName.Items.Add(SelNames[i]);

    lstName.Selected[iMatchID] := True;
  end;

  for i := iOldCount - 1 to lstName.Items.Count - i do
    lstName.ImageIndexes[i] := 0;

  SetEnabledStatus(nil);
end;

end.
