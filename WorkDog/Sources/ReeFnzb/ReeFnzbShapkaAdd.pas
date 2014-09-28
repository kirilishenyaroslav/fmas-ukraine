unit ReeFnzbShapkaAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar,DogLoaderUnit, LoadDogManedger, cxCheckBox;

type
  TfrmFnzbShapkaAdd = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cxDateEdit_urzb: TcxDateEdit;
    cxButtonEdit_name_un: TcxButtonEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxCheckBox1: TcxCheckBox;
    NumEdit: TcxTextEdit;
    Label3: TLabel;
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    id_rate_acc: Int64;
    { Public declarations }
  end;

var
  frmFnzbShapkaAdd: TfrmFnzbShapkaAdd;

implementation

uses ReeFnzbUnit;

{$R *.dfm}

procedure TfrmFnzbShapkaAdd.cxButtonEdit_name_unPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
 id_rate_acc := -1;

  ret := LoadDogManedger.WorkSpMfoRsch(self, (Owner as TfrmReeFnzb).WorkDatabase.Handle, fsNormal, 'get', id_rate_acc);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      id_rate_acc := ret[0][0];
      cxButtonEdit_name_un.Text := ret[0][3] + ' (' + ret[0][2] + ')';
    end;  
  end;

end;

procedure TfrmFnzbShapkaAdd.cxButton1Click(Sender: TObject);
begin
 ModalResult:=mrYes;
end;

procedure TfrmFnzbShapkaAdd.cxButton2Click(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TfrmFnzbShapkaAdd.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  NumEdit.Enabled := cxCheckBox1.Checked;
 if NumEdit.Enabled then NumEdit.Style.Color := clMoneyGreen else NumEdit.Style.Color := clSilver;
end;

end.
