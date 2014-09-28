unit AddForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainForm, cxLookAndFeelPainters, cxControls, cxContainer,
  cxEdit, cxTextEdit, StdCtrls, cxButtons, cxLabel, cxCheckBox, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxMRUEdit, resources_unit, MainUnit;

type
  TfmModeADD = (Add, Edit);
  TfmAddForm = class(TForm)
    cxButtonClose: TcxButton;
    cxButtonAdd: TcxButton;
    cxTextEditName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxTextEditKod: TcxTextEdit;
    cxLabel2: TcxLabel;
    cxCheckBoxPrihod: TcxCheckBox;
    cxCheckBoxRashod: TcxCheckBox;
    cxCheckBoxFond: TcxCheckBox;
    cxCheckBoxSystem: TcxCheckBox;
    cxCheckBoxvisible: TcxCheckBox;
    cxMRUEdit1: TcxMRUEdit;
    cxMRUEdit2: TcxMRUEdit;
    cxMRUEdit3: TcxMRUEdit;
    cxMRUEdit4: TcxMRUEdit;
    cxMRUEdit5: TcxMRUEdit;
    Bevel1: TBevel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxTextEditKodKeyPress(Sender: TObject; var Key: Char);
  private
    flag : TfmModeADD;
    myclass : TSpOperetionClass;
    myform : TfmMainForm;
    id : int64;
    id_sch : int64;
    id_st : int64;
    id_sm : int64;
    id_razd : int64;
    id_kekv : int64;
  public
    constructor Create(AOwner: TComponent; mclass: TSpOperetionClass; mform : TfmMainForm; m : TfmModeADD); reintroduce; overload;
  end;


implementation

{$R *.dfm}

{ TfmAddForm }

constructor TfmAddForm.Create(AOwner: TComponent;
  mclass: TSpOperetionClass; mform : TfmMainForm; m: TfmModeADD);
begin
    inherited Create (AOwner);
    myclass := mclass;
    myform  := mform;
    flag    := m;




    if m = Add then
    begin
         Caption             := resources_unit.KASSA_ADD_KASSA_FORM;
         cxbuttonAdd.Caption := resources_unit.PUB_BUTTON_ADD;
         cxLabel1.Caption    := resources_unit.KASSA_ADD_KASSA_FORM_SHORT;
         cxLabel2.Caption    := resources_unit.KASSA_ADD_KASSA_FORM_FULL;
    end;
    if m = Edit then
    begin
         Caption              := resources_unit.KASSA_CHANGE_KASSA_FORM;
         cxButtonAdd.Caption  := resources_unit.PUB_BUTTON_EDIT;
         cxLabel1.Caption     := resources_unit.KASSA_CHANGE_KASSA_FORM_SHORT;
         cxLabel2.Caption     := resources_unit.KASSA_CHANGE_KASSA_FORM_FULL;
         cxTextEditName.Text  := myform.DataSetMain['NAME'];
         cxTextEditKod.Text   := myform.DataSetMain['KOD'];
//         cxEditLongName.Text  := myform.DataSetMain['FULL_NAME'];
//         cxTextEditKod.Text   := myform.DataSetMain['KOD'];
//         cxDateEditBegin.Text := myform.DataSetMain['DATE_OPEN'];
         id := myform.DataSetMain['ID_SP_OPERATION'];
         id_sch := myform.DataSetMain['ID_SCH'];
         id_sm := myform.DataSetMain['ID_SM'];
         id_razd := myform.DataSetMain['ID_RAZD'];
         id_st := myform.DataSetMain['ID_ST'];
         id_kekv := myform.DataSetMain['ID_KEKV'];
         if myform.DataSetMain['FLAG_PRIHOD'] = 1 then cxCheckBoxPrihod.Checked;
         if myform.DataSetMain['FLAG_RASHOD'] = 1 then cxCheckBoxRashod.Checked;
         if myform.DataSetMain['FLAG_FOND'] = 1 then cxCheckBoxFond.Checked;
         if myform.DataSetMain['FLAG_SYSTEM'] = 1 then cxCheckBoxSystem.Checked;
         if myform.DataSetMain['FLAG_VISIBLE'] = 1 then cxCheckBoxvisible.Checked;
    end;
    cxLabel3.Caption    := resources_unit.KASSA_ADD_KASSA_FORM_BLOCK_SALDO;
    cxLabel5.Caption    := resources_unit.KASSA_ADD_KASSA_FORM_DATE_CLOSE;

    cxButtonClose.Caption    := resources_unit.AUTOKOD_FORM_CANCLE;
end;

procedure TfmAddForm.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmAddForm.cxButtonAddClick(Sender: TObject);
var
    j : int64;
    prihod, rashod, fond, system, visible : integer;


begin
    if (cxTextEditName.Text = '') or (cxTextEditKod.Text = '') then
         ShowMessage(resources_unit.AUTOKOD_ADD_VETKA_ERROR_MESS)
    else
    begin
        if cxCheckBoxPrihod.Checked
            then prihod := 1
            else prihod := 0;
        if cxCheckBoxRashod.Checked
            then rashod := 1
            else rashod := 0;
        if cxCheckBoxFond.Checked
            then fond := 1
            else fond := 0;
        if cxCheckBoxSystem.Checked
            then system := 1
            else system := 0;
        if cxCheckBoxvisible.Checked
            then visible := 1
            else visible := 0;
        if Flag = Add then
        begin
            j := myclass.Add(cxTextEditName.Text, prihod, rashod, fond, system, visible, StrToInt(cxTextEditKod.text), id_sch, id_sm, id_razd, id_st, id_kekv);
            If j > 0 then
            begin
                myform.ActionRefreshExecute(Sender);;
                myform.DataSetMain.Locate('ID_SP_OPERATION', j, []);
            end;
            close;
        end;
        if Flag = Edit then
        begin
            J := myform.DataSetMain['ID_SP_OPERATION'];
            myclass.Change(cxTextEditName.Text, prihod, rashod, fond, system, visible, StrToInt(cxTextEditKod.text), id_sch, id_sm, id_razd, id_st, id_kekv, id);
            myform.ActionRefreshExecute(Sender);
            myform.DataSetMain.Locate('ID_SP_OPERATION', J, []);
            close;
        end;
    end;
end;

procedure TfmAddForm.cxTextEditKodKeyPress(Sender: TObject; var Key: Char);
begin
    if (key < '0') or (key >'9') then key:=chr(0);
end;

end.
