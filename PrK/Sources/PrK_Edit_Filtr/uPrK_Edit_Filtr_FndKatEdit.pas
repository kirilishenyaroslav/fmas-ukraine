unit uPrK_Edit_Filtr_FndKatEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxTextEdit, cxControls, cxContainer, cxEdit, cxLabel,AArray, cxMaskEdit,
  cxButtonEdit, cxMemo;

type
  TFormPrK_Edit_Filtr_FndKatEdit = class(TForm)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelShortName: TcxLabel;
    cxTextEditShortName: TcxTextEdit;
    cxLabelKod: TcxLabel;
    cxTextEditKod: TcxTextEdit;
    cxLabelNPP: TcxLabel;
    cxTextEditNPP: TcxTextEdit;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxLabelComponent: TcxLabel;
    cxLabelSELECT_STATEMENT: TcxLabel;
    cxLabelWHERE_STATEMENT: TcxLabel;
    cxTextEditWHERE_STATEMENT: TcxTextEdit;
    cxButtonEditComponent: TcxButtonEdit;
    cxMemoSELECT_STATEMENT: TcxMemo;
    procedure cxTextEditKodKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditComponentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
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
  FormPrK_Edit_Filtr_FndKatEdit: TFormPrK_Edit_Filtr_FndKatEdit;

implementation
uses
  uPrK_Resources,uConstants,uPrK_Edit_Filtr,
  uPrK_Loader;
{$R *.dfm}

{ TFormPrK_Edit_Filtr_FndKatEdit }

constructor TFormPrK_Edit_Filtr_FndKatEdit.Create(aOwner: TComponent;
  aDataVL: TAArray);
begin
  DataVL    :=aDataVL;
  IndLang   :=SelectLanguage;
  inherited Create(aOwner);
  inicCaption;
end;

procedure TFormPrK_Edit_Filtr_FndKatEdit.InicCaption;
begin
   cxLabelName.Caption             := nLabelName[IndLang];
   cxLabelShortName.Caption        := nLabelShortName[IndLang];
   cxLabelKod.Caption              := nLabelKod[IndLang];
   cxLabelNPP.Caption              := nLabelNPP[IndLang];
   cxLabelComponent.Caption        := nLabelComponentName[IndLang];
   cxLabelSELECT_STATEMENT.Caption := nLabelSELECT_STATEMENT[IndLang];
   cxLabelWHERE_STATEMENT.Caption  := nLabelWHERE_STATEMENT[IndLang];


   ActionOK.Caption         :=nActiont_OK[IndLang];
   ActionCansel.Caption     :=nActiont_Cansel[IndLang];

   ActionOK.Hint            :=nHintActiont_OK[IndLang];
   ActionCansel.Hint        :=nHintActiont_Cansel[IndLang];
end;

procedure TFormPrK_Edit_Filtr_FndKatEdit.cxTextEditKodKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFormPrK_Edit_Filtr_FndKatEdit.FormShow(Sender: TObject);
begin
                               {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLang]),KLF_ACTIVATE);
end;

procedure TFormPrK_Edit_Filtr_FndKatEdit.FormCreate(Sender: TObject);
begin
   cxTextEditName.Text              :=DataVL['Name'].AsString;
   cxTextEditShortName.Text         :=DataVL['Short_Name'].AsString;
   cxTextEditKod.Text               :=DataVL['Kod'].AsString;
   cxTextEditNPP.Text               :=DataVL['Npp'].AsString;
   cxButtonEditComponent.Text       :=DataVL['NAME_FND_COMPONENT'].AsString;
   cxMemoSELECT_STATEMENT.Text      :=DataVL['SELECT_STATEMANT'].AsString;
   cxTextEditWHERE_STATEMENT.Text   :=DataVL['WHERE_STATEMANT'].AsString;
end;

procedure TFormPrK_Edit_Filtr_FndKatEdit.ActionOKExecute(Sender: TObject);
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

   if trim(cxButtonEditComponent.Text)='' then
   begin
     ShowMessage(nMsgEmptyComponent[IndLang]);
     cxButtonEditComponent.SetFocus;
     exit;
   end;

  { if trim(cxTextEditSELECT_STATEMENT.Text)='' then
   begin
     ShowMessage(nMsgEmptySELECT_STATEMENT[IndLang]);
     cxTextEditSELECT_STATEMENT.SetFocus;
     exit;
   end;   }

   if trim(cxTextEditWHERE_STATEMENT.Text)='' then
   begin
     ShowMessage(nMsgEmptyWHERE_STATEMENT[IndLang]);
     cxTextEditWHERE_STATEMENT.SetFocus;
     exit;
   end;

   DataVL['Name'].AsString                 :=cxTextEditName.Text;
   DataVL['Short_Name'].AsString           :=cxTextEditShortName.Text;
   DataVL['Kod'].AsString                  :=cxTextEditKod.Text;
   DataVL['Npp'].AsString                  :=cxTextEditNPP.Text;
   DataVL['SELECT_STATEMANT'].AsString     :=cxMemoSELECT_STATEMENT.Text;
   DataVL['WHERE_STATEMANT'].AsString      :=cxTextEditWHERE_STATEMENT.Text;

   ModalResult:=mrOk;
end;

procedure TFormPrK_Edit_Filtr_FndKatEdit.cxButtonEditComponentPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  InOutParam :TAArray;
begin
  InOutParam :=TAArray.Create;
    InOutParam['Name_Bpl'].AsString                     := 'PrK_Edit_Filtr.bpl';
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPrK_Edit_Filtr(self.Owner).DataBasePrK.Handle);
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InOutParam['Input']['aVibrat'].AsInteger            := 1;
  uPrK_Loader.ShowAllPrkBpl(self,InOutParam);
  if  InOutParam['OutPut']['ID_SP_FND_COMPONENT'].AsVariant<>Null then
  begin
      DataVL['ID_SP_FND_COMPONENT'].AsInt64         :=InOutParam['OutPut']['ID_SP_FND_COMPONENT'].AsInt64;
      DataVL['NAME_FND_COMPONENT'].AsString         :=InOutParam['OutPut']['NAME'].AsString;
      cxButtonEditComponent.Text                    := DataVL['NAME_FND_COMPONENT'].AsString;
      cxMemoSELECT_STATEMENT.SetFocus;
      // ViewArray(self, InOutParam);
  end;
  InOutParam.Free;
  InOutParam:=Nil;
end;

procedure TFormPrK_Edit_Filtr_FndKatEdit.ActionCanselExecute(
  Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
