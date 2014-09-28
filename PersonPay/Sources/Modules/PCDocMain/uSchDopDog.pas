unit uSchDopDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDropDownEdit, uMainPerem,
  ActnList, cxCheckBox;

type
  TDopDogForm = class(TForm)
    lbl1: TLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxSCH: TcxComboBox;
    actlst1: TActionList;
    act1: TAction;
    act2: TAction;
    CxCheck: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    procedure CxCheckPropertiesChange(Sender: TObject);
  private

  public
     is_close_db_ost:Integer;
    end;

var
  DopDogForm: TDopDogForm;

implementation

{$R *.dfm}

procedure TDopDogForm.FormShow(Sender: TObject);
var i:Integer;
begin
for i:=0 to Length(SCH_ARRAY)- 1 do
 CxSch.Properties.Items.Add(SCH_ARRAY[i][1]);
CxSch.ItemIndex:=0;
is_close_db_ost:=0;
end;

procedure TDopDogForm.act1Execute(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure TDopDogForm.act2Execute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TDopDogForm.CxCheckPropertiesChange(Sender: TObject);
begin
if CxCheck.Checked = True then is_close_db_ost:=1 else is_close_db_ost:=0;
end;

end.
