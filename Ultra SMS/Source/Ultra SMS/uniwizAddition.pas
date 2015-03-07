unit uniwizAddition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls;

type
  TfraAdditionTask = class(TFrame)
    chkPhoneBook: TCheckBox;
    chkSMS: TCheckBox;
    chkEnablePreset: TCheckBox;
    lblCategory: TLabel;
    cboCategory: TComboBox;
    cboModel: TComboBox;
    lblModel: TLabel;
    procedure chkEnablePresetClick(Sender: TObject);
    procedure cboCategorySelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshCategory;
  end;

implementation

{$R *.dfm}

uses
  Configuration;

procedure TfraAdditionTask.chkEnablePresetClick(Sender: TObject);
begin
  lblCategory.Enabled := chkEnablePreset.Checked;
  cboCategory.Enabled := chkEnablePreset.Checked;
  cboModel.Enabled := chkEnablePreset.Checked;
  lblModel.Enabled := chkEnablePreset.Checked;
end;

procedure TfraAdditionTask.RefreshCategory;
var
  config: TConfig;
begin
  cboCategory.Clear;
  cboModel.Clear;

  // ¶ÁÈ¡Ô¤ÉèÅäÖÃ
  config := TConfig.Create;
  config.SaveConfiguration('(Internal)', '(Current)');
  cboCategory.Items.Assign(config.EnumCategory);

  if cboCategory.Items.Count > 0 then
  begin
    cboCategory.ItemIndex := 0;
    cboCategorySelect(nil);
    chkEnablePreset.Enabled := True;
  end
  else
    chkEnablePreset.Enabled := False;

  config.Free;
end;

procedure TfraAdditionTask.cboCategorySelect(Sender: TObject);
var
  config: TConfig;
begin
  config := TConfig.Create;
  cboModel.Items.Assign(config.EnumModel(cboCategory.Text));
  if cboModel.Items.Count > 0 then
    cboModel.ItemIndex := 0;
  config.Free;
end;

end.
