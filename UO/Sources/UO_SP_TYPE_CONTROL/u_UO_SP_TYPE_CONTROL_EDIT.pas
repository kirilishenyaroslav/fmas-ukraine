unit u_UO_SP_TYPE_CONTROL_EDIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxButtonEdit, cxCheckBox, AArray, uUO_Loader;

type
  Tfm_UO_SP_TYPE_CONTROL_EDIT = class(TForm)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelKod: TcxLabel;
    cxSpinEditKod: TcxSpinEdit;
    cxLabelNPP: TcxLabel;
    cxSpinEditNPP: TcxSpinEdit;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSpinEditNPPKeyPress(Sender: TObject; var Key: Char);
    procedure cxSpinEditKodKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    procedure inicCaption;
  public
    id_robit : int64;
  end;

var
  fm_UO_SP_TYPE_CONTROL_EDIT: Tfm_UO_SP_TYPE_CONTROL_EDIT;

implementation

uses  u_UO_SP_TYPE_CONTROL;

{$R *.dfm}
procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.inicCaption;
begin
 {  ActionOK.Caption         :=nActiont_OK[LangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[LangEdit];
   ActionOK.Hint            :=nHintActiont_OK[LangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[LangEdit];

   cxLabelFIO.Caption         :=nLabelFIO[LangEdit];
   cxLabelDOLJNOST.Caption    :=nLabelDOLJNOST[LangEdit];
   cxLabelPRIM.Caption        :=nLabelPRIM[LangEdit];   }
end;


procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.ActionOKExecute(Sender: TObject);
begin

   if trim(cxTextEditName.Text)='' then
   begin
     ShowMessage('Заповніть назву!');
     cxTextEditName.SetFocus;
     exit;
   end;

   if trim(cxTextEditShortName.Text)='' then
   begin
     ShowMessage('Заповніть коротку назву!');
     cxTextEditShortName.SetFocus;
     exit;
   end;
   if trim(cxSpinEditKod.Value)='' then
   begin
     ShowMessage('Заповніть код!');
     cxSpinEditKod.SetFocus;
     exit;
   end;

   if trim(cxSpinEditNPP.Value)='' then
   begin
     ShowMessage('Заповніть номер!');
     cxSpinEditNPP.SetFocus;
     exit;
   end;

   if id_robit <= 0 then
   begin
       ShowMessage('Виберіть вид навчальних робіт!');
       cxButtonEdit1.SetFocus;
       exit;
   end;

  ModalResult:=mrOk;
end;

procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.FormCreate(Sender: TObject);
begin
    if Tfm_UO_SP_TYPE_CONTROL(self.Owner).cap=0 then
        Caption:='Додати';
    if Tfm_UO_SP_TYPE_CONTROL(self.Owner).cap=1 then
        Caption:='Змінити';
    if Tfm_UO_SP_TYPE_CONTROL(self.Owner).cap=2 then
        Caption:='Перегляд';

    ActionOK.Caption:='Прийняти';
    ActionCansel.Caption:='Відміна';

    ActionOK.Hint:='Прийняти';
    ActionCansel.Hint:='Відміна';

    cxLabelName.Caption :='Назва';
    cxLabelShortName.Caption :='Коротка назва';
    cxLabelKod.Caption :='Код';
    cxLabelNPP.Caption :='Номер';
    cxLabel1.Caption   :='Види навчальних робіт';
end;

procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.cxSpinEditNPPKeyPress(Sender: TObject;
  var Key: Char);
var
x: Integer;
begin
  if not (key in ['0'..'9', #8]) then
    key := #0;
  x:= Length(INTTOSTR(cxSpinEditNPP.Value))+1;
  if ( x>9)then  key := #0;
end;

procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.cxSpinEditKodKeyPress(Sender: TObject;
  var Key: Char);
var
x : Integer;
begin
  if not (key in ['0'..'9',#8]) then
    key := #0;
  x:=Length(IntToSTR(cxSpinEditKod.Value))+1;
  if (x>9)then
            key := #0;
end;

procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if (key > '9') or (key < '0') then key := chr(0);
end;

procedure Tfm_UO_SP_TYPE_CONTROL_EDIT.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SpVidNavichRobit.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Tfm_UO_SP_TYPE_CONTROL(self.Owner).DataBase_uo__sp_type.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    uUO_Loader.ShowAllUOBpl(self, InputParam);

    id_robit          := InputParam['OutPut']['ID_SP_VID_NAVCH_ROBIT'].AsInt64;
    if id_robit > 0 then
    begin
        cxButtonEdit1.Text := InputParam['OutPut']['NAME'].AsString;
    end;
    InputParam.Free;

end;

end.
