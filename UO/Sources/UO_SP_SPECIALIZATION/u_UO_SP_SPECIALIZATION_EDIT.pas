unit u_UO_SP_SPECIALIZATION_EDIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxButtonEdit, AArray, ibase, ib_externals;

type
  Tfm_UO_SP_SPECIALIZATION_EDIT = class(TForm)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxLabelKod: TcxLabel;
    cxSpinEditKod: TcxSpinEdit;
    cxLabelNPP: TcxLabel;
    cxSpinEditNPP: TcxSpinEdit;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxLabelTypeDisc: TcxLabel;
    cxButtonEditTypeDisc: TcxButtonEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxSpinEditNPPKeyPress(Sender: TObject; var Key: Char);
    procedure cxSpinEditKodKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditTypeDiscPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  fm_UO_SP_SPECIALIZATION_EDIT: Tfm_UO_SP_SPECIALIZATION_EDIT;

implementation

uses u_UO_SP_SPECIALIZATION,
     uUO_Loader,
     uSpecKlassSprav;
     {cn_Common_Loader,}
     {cn_Common_Types;}

{$R *.dfm}



procedure Tfm_UO_SP_SPECIALIZATION_EDIT.ActionOKExecute(Sender: TObject);
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
      if trim(cxButtonEditTypeDisc.Text)='' then
   begin
     ShowMessage('Заповніть спеціальність!');
     cxTextEditName.SetFocus;
     exit;
   end;
   /////////////TIMES
   //////////////////////

   ModalResult:=mrOk;
end;

procedure Tfm_UO_SP_SPECIALIZATION_EDIT.ActionCanselExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure Tfm_UO_SP_SPECIALIZATION_EDIT.FormCreate(Sender: TObject);
begin
    if Tfm_UO_SP_SPECIALIZATION(self.Owner).cap=0 then
        Caption:='Додати';
    if Tfm_UO_SP_SPECIALIZATION(self.Owner).cap=1 then
        Caption:='Змінити';
    if Tfm_UO_SP_SPECIALIZATION(self.Owner).cap=2 then
        Caption:='Перегляд';

    ActionOK.Caption:='Прийняти';
    ActionCansel.Caption:='Відміна';

    ActionOK.Hint:='Прийняти';
    ActionCansel.Hint:='Відміна';

    cxLabelName.Caption :='Назва';
    cxLabelShortName.Caption :='Коротка назва';
    cxLabelKod.Caption :='Код';
    cxLabelNPP.Caption :='Номер';
    cxLabelTypeDisc.Caption :='Спеціальність';
end;

procedure Tfm_UO_SP_SPECIALIZATION_EDIT.cxSpinEditNPPKeyPress(Sender: TObject;
  var Key: Char);
var
x: Integer;
begin
  if not (key in ['0'..'9', #8]) then
    key := #0;
  x:= Length(INTTOSTR(cxSpinEditNPP.Value))+1;
  if ( x>9)then  key := #0;
end;

procedure Tfm_UO_SP_SPECIALIZATION_EDIT.cxSpinEditKodKeyPress(Sender: TObject;
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

procedure Tfm_UO_SP_SPECIALIZATION_EDIT.cxButtonEditTypeDiscPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
//    AParameter : TcnSimpleParams;
    Res        : variant;
begin
{    AParameter                := TcnSimpleParams.Create;
    AParameter.Owner          := self;
    AParameter.Db_Handle      := Tfm_UO_SP_SPECIALIZATION(self.Owner).DataBase_uo__sp_type.Handle;
    AParameter.Formstyle      := fsNormal;
    AParameter.WaitPakageOwner:= self;

    AParameter.DontShowGroups := True;
    Res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
    AParameter.Free;
    if VarArrayDimCount(res) > 0 then
    begin
        if ((Res[0]<>Null) and (Res[1]<>Null))  then
        begin
            Tfm_UO_SP_SPECIALIZATION(self.Owner).id_SPEC_SP_SPECIALIZATION := StrToInt64(VarToStr(Res[1]));   // id_spec;
            cxButtonEditTypeDisc.Text                                      := Res[3] + '/' + Res[4];
        end;
    end;}
    res := uSpecKlassSprav.ShowSprav(Self, Tfm_UO_SP_SPECIALIZATION(self.Owner).DataBase_uo__sp_type.Handle, PUB_SP_USPEC, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        Tfm_UO_SP_SPECIALIZATION(self.Owner).id_SPEC_SP_SPECIALIZATION    := Res[0];
        cxButtonEditTypeDisc.Text                                         := VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';
    end;

end;

end.
