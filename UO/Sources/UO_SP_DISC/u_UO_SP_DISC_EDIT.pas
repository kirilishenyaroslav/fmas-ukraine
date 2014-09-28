unit u_UO_SP_DISC_EDIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxMaskEdit,
  cxSpinEdit, cxButtonEdit, AArray, ibase, ib_externals;

type
  Tfm_UO_SP_DISC_EDIT = class(TForm)
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
    cxLabelFullName: TcxLabel;
    cxTextEditFullName: TcxTextEdit;
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEditTypeDiscPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxSpinEditKodKeyPress(Sender: TObject; var Key: Char);
    procedure cxSpinEditNPPKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  fm_UO_SP_DISC_EDIT: Tfm_UO_SP_DISC_EDIT;

implementation
uses  u_UO_SP_DISC, uUO_Loader;
{$R *.dfm}




procedure Tfm_UO_SP_DISC_EDIT.ActionOKExecute(Sender: TObject);
begin
    if trim(cxTextEditFullName.Text)='' then
    begin
        ShowMessage('Çàïîâí³òü ïîâíó íàçâó!');
        cxTextEditFullName.SetFocus;
        exit;
    end;
    if trim(cxTextEditName.Text)='' then
    begin
        ShowMessage('Çàïîâí³òü íàçâó!');
        cxTextEditName.SetFocus;
        exit;
    end;
    if trim(cxTextEditShortName.Text)='' then
    begin
        ShowMessage('Çàïîâí³òü êîğîòêó íàçâó!');
        cxTextEditShortName.SetFocus;
        exit;
    end;
    if trim(cxSpinEditKod.Value)='' then
    begin
        ShowMessage('Çàïîâí³òü êîä!');
        cxSpinEditKod.SetFocus;
        exit;
    end;
    if trim(cxSpinEditNPP.Value)='' then
    begin
        ShowMessage('Çàïîâí³òü íîìåğ!');
        cxSpinEditNPP.SetFocus;
        exit;
    end;
    if trim(cxButtonEditTypeDisc.Text)='' then
    begin
        ShowMessage('Çàïîâí³òü òèï äèñöèïë³í!');
        cxTextEditName.SetFocus;
        exit;
    end;
    ModalResult:=mrOk;
end;

procedure Tfm_UO_SP_DISC_EDIT.ActionCanselExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure Tfm_UO_SP_DISC_EDIT.FormCreate(Sender: TObject);
begin
   if Tfm_UO_SP_DISC(self.Owner).cap=0 then
        Caption:='Äîäàòè';
    if Tfm_UO_SP_DISC(self.Owner).cap=1 then
        Caption:='Çì³íèòè';
    if Tfm_UO_SP_DISC(self.Owner).cap=2 then
        Caption:='Ïåğåãëÿä';

    ActionOK.Caption:='Ïğèéíÿòè';
    ActionCansel.Caption:='Â³äì³íà';

    ActionOK.Hint:='Ïğèéíÿòè';
    ActionCansel.Hint:='Â³äì³íà';

    cxLabelFullName.Caption :='Ïîâíà íàçâà';
    cxLabelName.Caption :='Íàçâà';
    cxLabelShortName.Caption :='Êîğîòêà íàçâà';
    cxLabelKod.Caption :='Êîä';
    cxLabelNPP.Caption :='Íîìåğ';
    cxLabelTypeDisc.Caption :='Òèï äèñöèïë³íè';

end;

procedure Tfm_UO_SP_DISC_EDIT.cxButtonEditTypeDiscPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_DISC.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(Tfm_UO_SP_DISC(self.Owner).DataBase_uo__sp_type.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
//    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
//    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
    uUO_Loader.ShowAllUOBpl(self, InputParam);


    Tfm_UO_SP_DISC(self.Owner).id_type_disc_sp_disc:=InputParam['output']['ID_SP_TYPE_DISC'].AsInt64;
    cxButtonEditTypeDisc.Text:=InputParam['output']['SHORT_NAME'].AsString;

end;

procedure Tfm_UO_SP_DISC_EDIT.cxSpinEditKodKeyPress(Sender: TObject;
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

procedure Tfm_UO_SP_DISC_EDIT.cxSpinEditNPPKeyPress(Sender: TObject;
  var Key: Char);
var
    x: Integer;
begin
    if not (key in ['0'..'9', #8]) then
        key := #0;
    x:= Length(INTTOSTR(cxSpinEditNPP.Value))+1;
    if ( x>9)then  key := #0;
end;

end.
