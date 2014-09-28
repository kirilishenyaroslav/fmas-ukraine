unit AddSpJ4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, MainSpSChClass, MainSpSchForm, Un_R_file_Alex;

type
  TfmAddMode = (AddAvanceSystem, ChangeAvanceSystem);

  TfmSpAdd = class(TForm)
    cxEditShortName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxEditLongName: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxTextEditKod: TcxTextEdit;
    cxLabel5: TcxLabel;
    cxDateEditBegin: TcxDateEdit;
    cxCheckBoxOpen: TcxCheckBox;
    cxButtonAdd: TcxButton;
    cxButtonClose: TcxButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxTextEditKodKeyPress(Sender: TObject; var Key: Char);
  private
    flag : TfmAddMode;
    myform : TfmForm;
  public
    myclass : TSpRazdClass;
    constructor Create(AOwner: TComponent; mclass: TSpRazdClass; mform : TfmForm; m : TfmAddMode); reintroduce; overload;
  end;

implementation

{$R *.dfm}

constructor TfmSpAdd.Create(AOwner: TComponent; mclass: TSpRazdClass; mform : TfmForm; m : TfmAddMode);
begin
    inherited Create (AOwner);

    myclass    := mclass;
    flag       := m;
    myform     := mform;

    cxEditShortName.Text := '';
    cxEditLongName.Text  := '';
    cxTextEditKod.Text   := '';
    cxDateEditBegin.Date := date;

    if m = AddAvanceSystem then
    begin
         Caption             := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_BUTTON_ADD;
         cxbuttonAdd.Caption := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_BUTTON_ADD;
         cxLabel1.Caption    := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_LABLE_SHORT;
         cxLabel2.Caption    := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_LABLE_LONG;
    end;
    if m = ChangeAvanceSystem then
    begin
         Caption              := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_CAPTION;
         cxButtonAdd.Caption  := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_BUTTON_ADD;
         cxLabel1.Caption     := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_LABLE_SHORT;
         cxLabel2.Caption     := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_LABLE_LONG;
         cxEditShortName.Text := myform.DataSetMain['SHORT_NAME'];
         cxEditLongName.Text  := myform.DataSetMain['FULL_NAME'];
         cxTextEditKod.Text   := myform.DataSetMain['KOD'];
         cxDateEditBegin.Text := myform.DataSetMain['DATA_OPEN'];
         if myform.DataSetMain['SYSTEM_OPEN'] = 1 then cxCheckBoxOpen.Checked;
    end;
    cxButtonClose.Caption    := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;
end;

procedure TfmSpAdd.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmSpAdd.cxButtonAddClick(Sender: TObject);
var
    j : int64;
    sys_open : smallint;
begin
    if (cxEditShortName.Text = '') or (cxEditLongName.Text = '') or (cxTextEditKod.Text = '') or (cxDateEditBegin.Text = '') then
         ShowMessage(Un_R_file_Alex.J4_ADD_VETKA_ERROR_MESS)
    else
    begin
        if cxCheckBoxOpen.Checked
            then sys_open := 1
            else sys_open := 0;
        if Flag = AddAvanceSystem then
        begin
            j := myclass.AddVetka(cxEditLongName.Text, cxEditShortName.Text, cxTextEditKod.Text, cxDateEditBegin.Text, 1);
            If j > 0 then
            begin
                myform.ActionRefreshExecute(Sender);;
                myform.DataSetMain.Locate('ID_J4_SP_JO', j, []);
            end;
            close;
        end;
        if Flag = ChangeAvanceSystem then
        begin
            myclass.ChangeVetka(cxEditLongName.Text, cxEditShortName.Text, cxTextEditKod.Text, cxDateEditBegin.Text, sys_open, myform.DataSetMain['ID_J4_SP_JO']);
            myform.ActionRefreshExecute(Sender);
            myform.DataSetMain.Locate('ID_J4_SP_JO', myform.DataSetMain['ID_J4_SP_JO'], []);
            close;
        end;
    end;
end;

procedure TfmSpAdd.cxTextEditKodKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key < '0') or (key >'9') then key:=chr(0);
//    if not(key in ['0'..'9']) then key:=#0;
end;

end.
