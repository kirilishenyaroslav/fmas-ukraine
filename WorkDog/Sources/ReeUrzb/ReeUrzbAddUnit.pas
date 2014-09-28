unit ReeUrzbAddUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, DogLoaderUnit, LoadDogManedger, DBCtrls, DB, FIBDataSet,
  pFIBDataSet, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox;

  resourcestring
  errNotDate = 'Виберіть дату.';
  errNotRsch = 'Виберіть рахунок.';

type
  TfrmUrzbAdd = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    cxDateEdit_urzb: TcxDateEdit;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    DataSource: TDataSource;
    pFIBDataSet: TpFIBDataSet;
    cxButtonEdit_name_un: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    NumEdit: TcxTextEdit;
    Label3: TLabel;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit_rschPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxLookupComboBox_rschClick(Sender: TObject);
    procedure cxButtonEdit_name_unPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
  id_rate_acc: Int64;
    { Public declarations }
  end;

var
  frmUrzbAdd: TfrmUrzbAdd;

implementation
uses
  ReeUrzbUnit, DateUtils;
{$R *.dfm}

procedure TfrmUrzbAdd.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmUrzbAdd.cxButton1Click(Sender: TObject);
begin
 if cxDateEdit_urzb.Text = '' then
 begin
   MessageDlg('Увага', errNotDate, mtError, [mbOk]);
   Exit;
 end;

 if cxButtonEdit_name_un.Text = '' then
 begin
   MessageDlg('Увага', errNotRsch, mtError, [mbOk]);
   Exit;
 end;

 ModalResult := mrYes;
end;

procedure TfrmUrzbAdd.cxButtonEdit_rschPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
//var
// ret: Variant;
begin
{  if VarIsClear(id_rate_acc) then id_rate_acc := -1;
  ret := LoadDogManedger.WorkSpMfoRsch(self, TfrmReeUrzb(self.Owner).WorkDatabase.Handle, fsNormal, 'get', id_rate_acc);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      id_rate_acc := ret[0][0];
      cxButtonEdit_rsch.Text := ret[0][3] + '(' +  ret[0][2] + ')';
    end;
  end;}
end;

procedure TfrmUrzbAdd.FormCreate(Sender: TObject);
begin
  pFIBDataSet.Active := false;
  pFIBDataSet.Active := true;
  cxDateEdit_urzb.Date := DateOf(Now);
end;

procedure TfrmUrzbAdd.cxLookupComboBox_rschClick(Sender: TObject);
begin
// id_rate_acc := cxLookupComboBox_rsch.EditValue;
end;

procedure TfrmUrzbAdd.cxButtonEdit_name_unPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  ret: Variant;
begin
  id_rate_acc := -1;

  ret := LoadDogManedger.WorkSpMfoRsch(self, (Owner as TfrmReeUrzb).WorkDatabase.Handle, fsNormal, 'get', id_rate_acc);
  if VarArrayDimCount(ret) > 0 then
  begin
    if ret[0][0] > 0 then
    begin
      id_rate_acc := ret[0][0];
      cxButtonEdit_name_un.Text := ret[0][3] + ' (' + ret[0][2] + ')';
    end;  
  end;

end;

procedure TfrmUrzbAdd.cxCheckBox1PropertiesChange(Sender: TObject);
begin
  NumEdit.Enabled := cxCheckBox1.Checked;
 if NumEdit.Enabled then NumEdit.Style.Color := clMoneyGreen else NumEdit.Style.Color := clSilver;

end;

end.
