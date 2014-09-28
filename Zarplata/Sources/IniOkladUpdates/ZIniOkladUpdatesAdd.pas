unit ZIniOkladUpdatesAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, cxClasses, cxStyles,
  cxGridTableView, cxMaskEdit, cxDropDownEdit, cxCalendar, ActnList;

type
  TfrmZIniOkladUpdatesAdd = class(TForm)
    cxLabel1: TcxLabel;
    cxBYES: TcxButton;
    cxBCancel: TcxButton;
    Styles: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxDateEdit1: TcxDateEdit;
    ActionList1: TActionList;
    act_OK: TAction;
    act_Esc: TAction;
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxBYESClick(Sender: TObject);
    procedure act_EscExecute(Sender: TObject);
    procedure act_OKExecute(Sender: TObject);
  private
  public
  end;

var
  frmZIniOkladUpdatesAdd: TfrmZIniOkladUpdatesAdd;

implementation

{$R *.dfm}


procedure TfrmZIniOkladUpdatesAdd.cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then
    begin
        Key := #0;
        Beep;
    end;
end;

procedure TfrmZIniOkladUpdatesAdd.cxBYESClick(Sender: TObject);
begin
    if cxDateEdit1.Text='' then ModalResult:=mrNo
    else                        ModalResult:=mrYes;
end;

procedure TfrmZIniOkladUpdatesAdd.act_EscExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmZIniOkladUpdatesAdd.act_OKExecute(Sender: TObject);
begin
    ModalResult := mrYes;
end;

end.
