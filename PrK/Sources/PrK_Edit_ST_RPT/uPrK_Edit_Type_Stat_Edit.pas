unit uPrK_Edit_Type_Stat_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,AArray;

type
  TFormPrK_Edit_Type_Stat_Edit = class(TForm)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxLabelKod: TcxLabel;
    cxTextEditKod: TcxTextEdit;
    cxLabelNPP: TcxLabel;
    cxTextEditNPP: TcxTextEdit;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    procedure cxTextEditKodKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
    DataVL :TAArray;
    IndLang: int64;
    procedure InicCaption;
  public
    constructor Create(aOwner: TComponent;aDataVL :TAArray);overload;
  end;

var
  FormPrK_Edit_Type_Stat_Edit: TFormPrK_Edit_Type_Stat_Edit;

implementation
uses
  uPrK_Resources,uConstants;
{$R *.dfm}

procedure TFormPrK_Edit_Type_Stat_Edit.cxTextEditKodKeyPress(
  Sender: TObject; var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFormPrK_Edit_Type_Stat_Edit.InicCaption;
begin
   cxLabelName.Caption      := nLabelName[IndLang];
   cxLabelShortName.Caption := nLabelShortName[IndLang];
   cxLabelKod.Caption       := nLabelKod[IndLang];
   cxLabelNPP.Caption       := nLabelNPP[IndLang];

   ActionOK.Caption         :=nActiont_OK[IndLang];
   ActionCansel.Caption     :=nActiont_Cansel[IndLang];

   ActionOK.Hint            :=nHintActiont_OK[IndLang];
   ActionCansel.Hint        :=nHintActiont_Cansel[IndLang];
end;

procedure TFormPrK_Edit_Type_Stat_Edit.FormShow(Sender: TObject);
begin
                                        {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLang]),KLF_ACTIVATE);
end;

constructor TFormPrK_Edit_Type_Stat_Edit.Create(aOwner: TComponent;
  aDataVL: TAArray);
begin
  DataVL    :=aDataVL;
  IndLang   :=SelectLanguage;
  inherited Create(aOwner);
  inicCaption;
end;

procedure TFormPrK_Edit_Type_Stat_Edit.FormCreate(Sender: TObject);
begin
   cxTextEditName.Text      :=DataVL['Name'].AsString;
   cxTextEditShortName.Text :=DataVL['Short_Name'].AsString;
   cxTextEditKod.Text       :=DataVL['Kod'].AsString;
   cxTextEditNPP.Text       :=DataVL['Npp'].AsString;
end;

procedure TFormPrK_Edit_Type_Stat_Edit.ActionOKExecute(Sender: TObject);
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


  if trim(cxTextEditKOD.Text)='' then
   begin
     ShowMessage(nMsgEmptyKOD[IndLang]);
     cxTextEditKod.SetFocus;
     exit;
   end;

   if trim(cxTextEditNpp.Text)='' then
   begin
     ShowMessage(nMsgEmptyNpp[IndLang]);
     cxTextEditNpp.SetFocus;
     exit;
   end;
                                                
   DataVL['Name'].AsString       :=cxTextEditName.Text;
   DataVL['Short_Name'].AsString :=cxTextEditShortName.Text;
   DataVL['Kod'].AsString        :=cxTextEditKod.Text;
   DataVL['Npp'].AsString        :=cxTextEditNPP.Text;

   ModalResult:=mrOk;
end;

procedure TFormPrK_Edit_Type_Stat_Edit.ActionCanselExecute(
  Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
