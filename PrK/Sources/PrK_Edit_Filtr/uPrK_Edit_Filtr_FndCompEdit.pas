unit uPrK_Edit_Filtr_FndCompEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,AArray;

type
  TFormPrK_Edit_Filtr_FndCompEdit = class(TForm)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelID: TcxLabel;
    cxTextEditID: TcxTextEdit;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    procedure cxTextEditIDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    DataVL :TAArray;
    IndLang: int64;
    procedure InicCaption;
  public
    constructor Create(aOwner: TComponent;aDataVL :TAArray);overload;
  end;

var
  FormPrK_Edit_Filtr_FndCompEdit: TFormPrK_Edit_Filtr_FndCompEdit;

implementation
uses
  uPrK_Resources,uConstants;
{$R *.dfm}

procedure TFormPrK_Edit_Filtr_FndCompEdit.cxTextEditIDKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

constructor TFormPrK_Edit_Filtr_FndCompEdit.Create(aOwner: TComponent;
  aDataVL: TAArray);
begin
  DataVL    :=aDataVL;
  IndLang   :=SelectLanguage;
  inherited Create(aOwner);
  inicCaption;
end;

procedure TFormPrK_Edit_Filtr_FndCompEdit.InicCaption;
begin
   cxLabelName.Caption      := nLabelName[IndLang];
   cxLabelID.Caption        := nLabelID[IndLang];

   ActionOK.Caption         :=nActiont_OK[IndLang];
   ActionCansel.Caption     :=nActiont_Cansel[IndLang];

   ActionOK.Hint            :=nHintActiont_OK[IndLang];
   ActionCansel.Hint        :=nHintActiont_Cansel[IndLang];
end;

procedure TFormPrK_Edit_Filtr_FndCompEdit.FormShow(Sender: TObject);
begin
                          {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLang]),KLF_ACTIVATE);
end;

procedure TFormPrK_Edit_Filtr_FndCompEdit.FormCreate(Sender: TObject);
begin
   cxTextEditName.Text      :=DataVL['Name'].AsString;
   cxTextEditID.Text        :=DataVL['ID'].AsString;
end;

procedure TFormPrK_Edit_Filtr_FndCompEdit.ActionCanselExecute(
  Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

procedure TFormPrK_Edit_Filtr_FndCompEdit.ActionOKExecute(Sender: TObject);
begin
   if trim(cxTextEditName.Text)='' then
   begin
     ShowMessage(nMsgEmptyName[IndLang]);
     cxTextEditName.SetFocus;
     exit;
   end;

   if trim(cxTextEditId.Text)='' then
   begin
     ShowMessage(nMsgEmptyId[IndLang]);
     cxTextEditId.SetFocus;
     exit;
   end;

   DataVL['Name'].AsString   :=cxTextEditName.Text;
   DataVL['ID'].AsString     :=cxTextEditId.Text;

   ModalResult:=mrOk;
end;

end.
