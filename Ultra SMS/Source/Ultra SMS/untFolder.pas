unit untFolder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, ToolWin;

type
  TfraFolder = class(TFrame)
    tbrFolder: TToolBar;
    ToolButton1: TToolButton;
    TreeView1: TTreeView;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
