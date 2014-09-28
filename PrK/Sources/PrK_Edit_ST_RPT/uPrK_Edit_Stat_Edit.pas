unit uPrK_Edit_Stat_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxCheckBox, StdCtrls, cxButtons,
  ActnList, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,AArray;

type
  TFormPrK_Edit_Stat_Edit = class(TForm)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelModuleName: TcxLabel;
    cxTextEditModuleName: TcxTextEdit;
    cxCheckBoxFak_center: TcxCheckBox;
    cxCheckBoxForm_obuch_kategory: TcxCheckBox;
    cxCheckBoxForm_stud: TcxCheckBox;
    cxCheckBoxCn_kat_stud: TcxCheckBox;
    cxCheckBoxType_kat_stud: TcxCheckBox;
    cxCheckBoxDerg_zakaz: TcxCheckBox;
    cxCheckBoxPotok: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    DataVL :TAArray;
    IndLang: int64;
    procedure InicCaption;
  public
    constructor Create(aOwner: TComponent;aDataVL :TAArray);overload;
  end;

var
  FormPrK_Edit_Stat_Edit: TFormPrK_Edit_Stat_Edit;

implementation
uses
  uPrK_Resources,uConstants;
{$R *.dfm}

{ TFormPrK_Edit_Stat_Edit }

constructor TFormPrK_Edit_Stat_Edit.Create(aOwner: TComponent;
  aDataVL: TAArray);
begin
  DataVL    :=aDataVL;
  IndLang   :=SelectLanguage;
  inherited Create(aOwner);
  inicCaption;
end;

procedure TFormPrK_Edit_Stat_Edit.InicCaption;
begin
   cxLabelName.Caption       := nLabelName[IndLang];
   cxLabelShortName.Caption  := nLabelShortName[IndLang];
   cxLabelModuleName.Caption := nLabelModuleName[IndLang];

   cxCheckBoxFak_center.Properties.Caption           :=nLabelTypeDepart[IndLang];
   cxCheckBoxForm_obuch_kategory.Properties.Caption  :=nLabelNameObuchKat[IndLang];
   cxCheckBoxForm_stud.Properties.Caption            :=nLabelCnFormStud[IndLang];
   cxCheckBoxCn_kat_stud.Properties.Caption          :=nLabelCnKatStud[IndLang];
   cxCheckBoxType_kat_stud.Properties.Caption        :=nLabelTYP_KT_STD[IndLang];
   cxCheckBoxDerg_zakaz.Properties.Caption           :=nLabelDergZakaz[IndLang];
   cxCheckBoxPotok.Properties.Caption                :=nLabelPotok[IndLang];

   ActionOK.Caption         :=nActiont_OK[IndLang];
   ActionCansel.Caption     :=nActiont_Cansel[IndLang];
   ActionOK.Hint            :=nHintActiont_OK[IndLang];
   ActionCansel.Hint        :=nHintActiont_Cansel[IndLang];
end;

procedure TFormPrK_Edit_Stat_Edit.FormCreate(Sender: TObject);
begin
   cxTextEditName.Text       :=DataVL['Name'].AsString;
   cxTextEditShortName.Text  :=DataVL['Short_Name'].AsString;
   cxTextEditModuleName.Text :=DataVL['Module_Name'].AsString;

   cxCheckBoxFak_center.EditValue          := DataVL['is_fak_center'].AsInteger;
   cxCheckBoxForm_obuch_kategory.EditValue := DataVL['is_sp_form_obuch_kategory'].AsInteger;
   cxCheckBoxForm_stud.EditValue           := DataVL['is_cn_sp_form_stud'].AsInteger;
   cxCheckBoxCn_kat_stud.EditValue         := DataVL['is_cn_sp_kat_stud'].AsInteger;
   cxCheckBoxType_kat_stud.EditValue       := DataVL['is_sp_type_kat_stud'].AsInteger;
   cxCheckBoxDerg_zakaz.EditValue          := DataVL['is_sp_derg_zakaz'].AsInteger;
   cxCheckBoxPotok.EditValue               := DataVL['is_sp_potok'].AsInteger;
end;

procedure TFormPrK_Edit_Stat_Edit.FormShow(Sender: TObject);
begin
                                    {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLang]),KLF_ACTIVATE);
end;

procedure TFormPrK_Edit_Stat_Edit.ActionOKExecute(Sender: TObject);
begin
  if trim(cxTextEditName.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLang]);
     cxTextEditName.SetFocus;
     exit;
   end;

   if trim(cxTextEditShortName.Text)='' then
   begin
     ShowMessage(nMsgEmptyShortName[IndLang]);
     cxTextEditShortName.SetFocus;
     exit;
   end;

   if trim(cxTextEditModuleName.Text)='' then
   begin
     ShowMessage(nMsgEmptyModuleName[IndLang]);
     cxTextEditModuleName.SetFocus;
     exit;
   end;

   DataVL['Name'].AsString        :=cxTextEditName.Text;
   DataVL['Short_Name'].AsString  :=cxTextEditShortName.Text;
   DataVL['Module_Name'].AsString :=cxTextEditModuleName.Text;

  DataVL['is_fak_center'].AsInteger             :=  cxCheckBoxFak_center.EditValue;
  DataVL['is_sp_form_obuch_kategory'].AsInteger :=  cxCheckBoxForm_obuch_kategory.EditValue;
  DataVL['is_cn_sp_form_stud'].AsInteger        :=  cxCheckBoxForm_stud.EditValue;
  DataVL['is_cn_sp_kat_stud'].AsInteger         :=  cxCheckBoxCn_kat_stud.EditValue;
  DataVL['is_sp_type_kat_stud'].AsInteger       :=  cxCheckBoxType_kat_stud.EditValue;
  DataVL['is_sp_derg_zakaz'].AsInteger          :=  cxCheckBoxDerg_zakaz.EditValue;
  DataVL['is_sp_potok'].AsInteger               :=  cxCheckBoxPotok.EditValue;

   ModalResult:=mrOk;
end;

procedure TFormPrK_Edit_Stat_Edit.ActionCanselExecute(Sender: TObject);
begin
    close;
end;

end.
