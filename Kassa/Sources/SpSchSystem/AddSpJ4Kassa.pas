unit AddSpJ4Kassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, StdCtrls, cxButtons,
  cxCheckBox, cxMaskEdit, cxDropDownEdit, cxCalendar, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, MainSpSChClassKassa, MainSpSchFormKassa, Un_R_file_Alex;

type
  TfmAddMode = (Add , Change);

  TfmSpAdd = class(TForm)
    cxEditShortName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxEditLongName: TcxTextEdit;
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
    constructor Create(AOwner: TComponent; mclass: TSpRazdClass; mform : TfmForm; m : TfmAddMode); reintroduce; 
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
//    cxTextEditKod.Text   := '';
    cxDateEditBegin.Text := '';

    if m = Add then
    begin
         Caption             := Un_R_file_Alex.KASSA_ADD_KASSA_FORM;
         cxbuttonAdd.Caption := Un_R_file_Alex.MY_BUTTON_ADD;
         cxLabel1.Caption    := Un_R_file_Alex.KASSA_ADD_KASSA_FORM_SHORT;
         cxLabel2.Caption    := Un_R_file_Alex.KASSA_ADD_KASSA_FORM_FULL;
    end;
    if m = change then
    begin
         Caption              := Un_R_file_Alex.KASSA_CHANGE_KASSA_FORM;
         cxButtonAdd.Caption  := Un_R_file_Alex.MY_BUTTON_EDIT;
         cxLabel1.Caption     := Un_R_file_Alex.KASSA_CHANGE_KASSA_FORM_SHORT;
         cxLabel2.Caption     := Un_R_file_Alex.KASSA_CHANGE_KASSA_FORM_FULL;
         cxEditShortName.Text := myform.DataSetMain['SHORT_NAME'];
         cxEditLongName.Text  := myform.DataSetMain['FULL_NAME'];
//         cxTextEditKod.Text   := myform.DataSetMain['KOD'];
         cxDateEditBegin.Text := myform.DataSetMain['DATE_OPEN'];
         if myform.DataSetMain['SYSTEM_OPEN'] = 1 then cxCheckBoxOpen.Checked;
         if myform.DataSetMain['DATE_CLOSE'] = '31.12.2999'
            then cxDateEditBegin.Text := ''
            else cxDateEditBegin.Text := myform.DataSetMain['DATE_CLOSE'];
    end;
    cxLabel5.Caption    := Un_R_file_Alex.KASSA_ADD_KASSA_FORM_DATE_CLOSE;
    cxButtonClose.Caption    := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
end;

procedure TfmSpAdd.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmSpAdd.cxButtonAddClick(Sender: TObject);
var
    j : int64;
    sys_open : smallint;
    dates : string;
begin
    if (cxEditShortName.Text = '') or (cxEditLongName.Text = '')  then
         ShowMessage(Un_R_file_Alex.N_AUTOKOD_ADD_VETKA_ERROR_MESS)
    else
    begin
        if cxCheckBoxOpen.Checked
            then sys_open := 1
            else sys_open := 0;
        if Flag = Add then
        begin
            if cxDateEditBegin.Text = '' then dates := '31.12.2999';
            j := myclass.AddVetka(cxEditLongName.Text, cxEditShortName.Text, dates);
            If j > 0 then
            begin
                myform.ActionRefreshExecute(Sender);
                myform.DataSetMain.Locate('ID_SP_KASS', j, []);
            end;
            close;
        end;
        if Flag = Change then
        begin
            if cxDateEditBegin.Text = '' then dates := '31.12.2999';
            myclass.ChangeVetka(cxEditLongName.Text, cxEditShortName.Text, dates, cxDateEditBegin.Text, sys_open, myform.DataSetMain['ID_J4_SP_JO']);
            myform.ActionRefreshExecute(Sender);
            myform.DataSetMain.Locate('ID_SP_KASS', myform.DataSetMain['ID_SP_KASS'], []);
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
