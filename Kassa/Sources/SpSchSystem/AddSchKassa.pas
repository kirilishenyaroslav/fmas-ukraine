unit AddSchKassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxMRUEdit,
  StdCtrls, cxButtons, ExtCtrls, MainSpSChClassKassa, MainSpSchFormKassa, Un_R_file_Alex,
  cxCheckBox, GlobalSPR;

type
  TfmAddModeSch = (AddSch , ChangeSch);

  TfmAddsch = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxButtonClose: TcxButton;
    cxMRUEditSch: TcxMRUEdit;
    cxDateBegin: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxButtonAdd: TcxButton;
    cxCheckBox1: TcxCheckBox;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxMRUEditSchPropertiesButtonClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
  private
    flag : TfmAddModeSch;
//    myform : TfmForm;
    id : int64;
  public
    myclass : TSpRazdClass;
    myform  : TfmForm;
    m       : TfmAddModeSch;
    AOwner  : TComponent;
//    procedure MyPr;
    constructor Create(AOwner: TComponent; mclass: TSpRazdClass; mform : TfmForm; m : TfmAddModeSch); reintroduce;
  end;

implementation


{$R *.dfm}

constructor TfmAddsch.Create(AOwner: TComponent; mclass: TSpRazdClass; mform : TfmForm; m : TfmAddModeSch);
begin
    inherited Create (AOwner);
    myclass    := mclass;
    flag       := m;
    myform     := mform;


    if m = AddSch then
    begin
         Caption             := Un_R_file_Alex.KASSA_ADDSCH_FORM;
         cxbuttonAdd.Caption := Un_R_file_Alex.MY_BUTTON_ADD;
         cxLabel1.Caption    := Un_R_file_Alex.KASSA_ADDSCH_FORM_SCH;
         cxLabel2.Caption    := Un_R_file_Alex.KASSA_ADDSCH_FORM_DATE_BEG;
         cxLabel3.Caption    := Un_R_file_Alex.KASSA_ADDSCH_FORM_DATE_END;
    end;
    if m = changeSch then
    begin
         Caption              := Un_R_file_Alex.KASSA_CHANGESCH_FORM;
         cxButtonAdd.Caption  := Un_R_file_Alex.MY_BUTTON_EDIT;
         cxLabel1.Caption     := Un_R_file_Alex.KASSA_CHANGESCH_FORM_SCH;
         cxLabel2.Caption     := Un_R_file_Alex.KASSA_CHANGESCH_FORM_DATE_BEG;
         cxLabel3.Caption     := Un_R_file_Alex.KASSA_CHANGESCH_FORM_DATE_END;
         cxDateBegin.Text     := myform.DataSetSch['DATE_BEGIN'];
         cxDateEnd.Text       := myform.DataSetSch['DATE_END'];
         cxMRUEditSch.Text    := myform.DataSetSch['SCH_TITLE'];
         id                   := myform.DataSetSch['ID_SCH'];
    end;
    cxButtonClose.Caption    := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
    cxCheckBox1.Properties.Caption := Un_R_file_Alex.KASSA_ADDSCH_FORM_FLAG;
end;

procedure TfmAddsch.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmAddsch.cxMRUEditSchPropertiesButtonClick(Sender: TObject);
var
    res : Variant;
begin
    res := GlobalSPR.LGetSprModal(self, myform.Database.Handle, fsNormal, date,  1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id := res[0][0];
            cxMRUEditSch.Text := res[0][1];
        end;
    end;
end;

procedure TfmAddsch.cxButtonAddClick(Sender: TObject);
begin
    if (cxMRUEditSch.Text = '') or (cxDateBegin.Text = '') or (cxDateEnd.Text = '') then
         ShowMessage(Un_R_file_Alex.N_AUTOKOD_ADD_VETKA_ERROR_MESS)
    else
    begin
        if Flag = AddSch then
        begin
            myclass.AddSch(cxDateBegin.Text, cxDateEnd.Text, myform.DataSetMain['ID_SP_KASS'] ,id);
            myform.ActionRefreshExecute(Sender);;
            myform.DataSetMain.Locate('ID_SP_KASS', myform.DataSetMain['ID_SP_KASS'], []);
            close;
        end;
        if Flag = ChangeSch then
        begin
            myclass.ChangeSch(cxDateBegin.Text, cxDateEnd.Text, myform.DataSetMain['ID_SP_KASS'] ,id);
            myform.ActionRefreshExecute(Sender);;
            myform.DataSetMain.Locate('ID_SP_KASS', myform.DataSetMain['ID_SP_KASS'], []);
            close;
        end;
    end;

end;

{procedure TfmAddsch.MyPr;
begin
//    myclass    := mclass;
    flag       := m;
//    myform     := mform;


    if m = AddSch then
    begin
         Caption             := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_BUTTON_ADD;
         cxbuttonAdd.Caption := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_BUTTON_ADD;
         cxLabel1.Caption    := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_LABLE_SHORT;
         cxLabel2.Caption    := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_LABLE_LONG;
    end;
    if m = changeSch then
    begin
         Caption              := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_CAPTION;
         cxButtonAdd.Caption  := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_BUTTON_ADD;
         cxLabel1.Caption     := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_LABLE_SHORT;
         cxLabel2.Caption     := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_LABLE_LONG;
         cxDateBegin.Text     := myform.DataSetSch['DATE_BEGIN'];
         cxDateEnd.Text       := myform.DataSetSch['DATE_END'];
         cxMRUEditSch.Text    := myform.DataSetSch['SCH_TITLE'];
         id                   := myform.DataSetSch['ID_SCH'];
    end;
    cxButtonClose.Caption    := Un_R_file_Alex.AUTOKOD_PROP_CAPTION_BUTTON_CLOSE;

end;
 }
end.
