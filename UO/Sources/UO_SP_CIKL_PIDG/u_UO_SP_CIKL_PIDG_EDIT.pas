unit u_UO_SP_CIKL_PIDG_EDIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxCheckBox, cxButtonEdit;

type
  Tfm_UO_SP_CIKL_PIDG_EDIT = class(TForm)
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
    cxCheckBoxIsSpec: TcxCheckBox;
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
  fm_UO_SP_CIKL_PIDG_EDIT: Tfm_UO_SP_CIKL_PIDG_EDIT;

implementation

uses u_UO_SP_CIKL_PIDG,
     AArray,
     uUO_Loader;

{$R *.dfm}



procedure Tfm_UO_SP_CIKL_PIDG_EDIT.ActionOKExecute(Sender: TObject);
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
    
    if trim(cxButtonEditTypeDisc.Text)='' then
    begin
        ShowMessage('Виберіть тип циклу підготовки!');
        cxButtonEditTypeDisc.SetFocus;
        exit;
    end;

    if trim(cxSpinEditNPP.Value)='' then
    begin
        ShowMessage('Заповніть номер!');
        cxSpinEditNPP.SetFocus;
        exit;
    end;
   
    ModalResult:=mrOk;
end;

procedure Tfm_UO_SP_CIKL_PIDG_EDIT.ActionCanselExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure Tfm_UO_SP_CIKL_PIDG_EDIT.FormCreate(Sender: TObject);
begin
    if Tfm_UO_SP_CIKL_PIDG(self.Owner).cap=0 then
        Caption:='Додати';
    if Tfm_UO_SP_CIKL_PIDG(self.Owner).cap=1 then
        Caption:='Змінити';
    if Tfm_UO_SP_CIKL_PIDG(self.Owner).cap=2 then
        Caption:='Перегляд';
    ActionOK.Caption:='Прийняти';
    ActionCansel.Caption:='Відміна';

    ActionOK.Hint:='Прийняти';
    ActionCansel.Hint:='Відміна';
    cxLabelName.Caption :='Назва';
    cxLabelShortName.Caption :='Коротка назва';
    cxLabelTypeDisc.Caption :='Тип циклу підготовки';
    cxLabelKod.Caption :='Код';
    cxLabelNPP.Caption :='Номер';
    cxCheckBoxIsSpec.Properties.Caption:='Чи існує позподіл по спеціалізаціях?';
end;

procedure Tfm_UO_SP_CIKL_PIDG_EDIT.cxSpinEditNPPKeyPress(Sender: TObject;
  var Key: Char);
var
    x: Integer;
begin
    if not (key in ['0'..'9', #8]) then
        key := #0;
    x:= Length(INTTOSTR(cxSpinEditNPP.Value))+1;
    if ( x>9)then  key := #0;
end;

procedure Tfm_UO_SP_CIKL_PIDG_EDIT.cxSpinEditKodKeyPress(Sender: TObject;
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

procedure Tfm_UO_SP_CIKL_PIDG_EDIT.cxButtonEditTypeDiscPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_CIKL_PIDG.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Tfm_UO_SP_CIKL_PIDG(self.Owner).DataBase_uo__sp_type.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    uUO_Loader.ShowAllUOBpl(self, InputParam);


    Tfm_UO_SP_CIKL_PIDG(self.Owner).id_type_cikl_pidg := InputParam['output']['ID_SP_TYPE_CIKL_PIDG'].AsInt64;
    cxButtonEditTypeDisc.Text:=InputParam['output']['SHORT_NAME'].AsString;
end;

end.
