unit uEditDocEducation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxControls, cxContainer,
  cxEdit, cxLabel, StdCtrls, cxButtons, ExtCtrls, AArray, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxDropDownEdit, cxCalendar, cxCheckBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB, FIBDataSet,
  pFIBDataSet;

type
  TFormEditDocEducation = class(TForm)
    ImageSpravEdit: TImage;
    cxButtonOK: TcxButton;
    cxButtonCansel: TcxButton;
    cxLabelFormCaption: TcxLabel;
    cxButtonCloseForm: TcxButton;
    ActionListKlassSpravEdit: TActionList;
    ActionOK: TAction;
    ActionCansel: TAction;
    cxLabelTypeDoc: TcxLabel;
    cxButtonEditTypeDoc: TcxButtonEdit;
    cxTextEditSeria: TcxTextEdit;
    cxLabelSeria: TcxLabel;
    cxLabelNomer: TcxLabel;
    cxTextEditNomer: TcxTextEdit;
    cxLabelDATE_VIDACHI: TcxLabel;
    cxDateEditDATE_VIDACHI: TcxDateEdit;
    cxLabelTypeUchz: TcxLabel;
    cxButtonEditTypeUchz: TcxButtonEdit;
    cxLabelAdressUchz: TcxLabel;
    cxButtonEditAdressUchz: TcxButtonEdit;
    cxCheckBoxIS_MAIN_BOOK: TcxCheckBox;
    cxLabelIS_MAIN_BOOK: TcxLabel;
    cxLabelIS_COPY: TcxLabel;
    DataSetCopy: TpFIBDataSet;
    DataSourceCopy: TDataSource;
    cxLookupComboBoxCopy: TcxLookupComboBox;
    cxLabelUCHZ: TcxLabel;
    cxButtonEditUCHZ: TcxButtonEdit;
    cxCheckBoxIS_ACTIVE: TcxCheckBox;
    cxLabelIS_ACTIVE: TcxLabel;
    cxLabelOTR_SPEC: TcxLabel;
    cxTextEditOTR_SPEC: TcxTextEdit;
    procedure FormShow(Sender: TObject);
    procedure cxLabelFormCaptionMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ActionCanselExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditTypeDocPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditTypeUchzPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditAdressUchzPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditUCHZPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditTypeDocKeyPress(Sender: TObject; var Key: Char);
    procedure cxButtonEditTypeUchzKeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEditNomerKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckBoxIS_MAIN_BOOKPropertiesChange(Sender: TObject);
  private
    Layout: array[0.. KL_NAMELENGTH] of char;
  public
    DELangEdit    :integer;
    DataDE: TAArray;
    procedure inicCaption;virtual;
    constructor Create(aOwner: TComponent;aDataDE :TAArray);overload;
  end;

var
  FormEditDocEducation: TFormEditDocEducation;

implementation
uses
    uPrK_Resources,uConstants,uPRK_DT_ABIT,uPrK_Loader,
    uCommonSp;
{$R *.dfm}

{ TFormEditDocEducation }

constructor TFormEditDocEducation.Create(aOwner: TComponent;
  aDataDE: TAArray);
begin
  DataDE    :=aDataDE;
  DELangEdit:=SelectLanguage;
  inherited Create(aOwner);

  cxLabelFormCaption.Top   :=0;
  inicCaption;
end;

procedure TFormEditDocEducation.inicCaption;
begin
   ActionOK.Caption         :=nActiont_OK[DELangEdit];
   ActionCansel.Caption     :=nActiont_Cansel[DELangEdit];

   ActionOK.Hint            :=nHintActiont_OK[DELangEdit];
   ActionCansel.Hint        :=nHintActiont_Cansel[DELangEdit];

   cxLabelTypeDoc.Caption      :=nLabelTypeDoc[DELangEdit];
   cxLabelSeria.Caption        :=nLabelSeria[DELangEdit];
   cxLabelNomer.Caption        :=nLabelNomer[DELangEdit];
   cxLabelDATE_VIDACHI.Caption :=nLabelDATE_VIDACHI[DELangEdit];
   cxLabelTypeUchz.Caption     :=nLabelTypeUchz[DELangEdit];
   cxLabelUCHZ.Caption         :=nLabelUchz[DELangEdit];
   cxLabelAdressUchz.Caption   :=nLabelAdressUchz[DELangEdit];
   cxLabelIS_COPY.Caption      :=nLabelIS_COPY[DELangEdit];
   cxLabelIS_MAIN_BOOK.Caption :=nLabelIS_MAIN_BOOK[DELangEdit];
   cxLabelIS_ACTIVE.Caption    :=nLabelIS_ACTIVE[DELangEdit];
   cxLabelOTR_SPEC.Caption     :=nLabelOTR_SPEC[DELangEdit];
end;

procedure TFormEditDocEducation.FormShow(Sender: TObject);
begin
                                     {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[DELangEdit]),KLF_ACTIVATE);
end;

procedure TFormEditDocEducation.cxLabelFormCaptionMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const  SC_DragMove = $F012;
begin
  ReleaseCapture;
  perform(WM_SysCommand, SC_DragMove, 0);
end;

procedure TFormEditDocEducation.ActionCanselExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure TFormEditDocEducation.FormCreate(Sender: TObject);
begin
  DataSetCopy.Active                         :=false;
  DataSetCopy.Database                       := TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT;
  DataSetCopy.Transaction                    := TFormPRK_DT_ABIT(self.Owner.Owner).TransactionReadPrK_ABIT;
  DataSetCopy.SelectSQL.Clear;
  DataSetCopy.SQLs.SelectSQL.Text            :='Select * from PRK_SP_IS_COPY_SELECT';
  DataSetCopy.CloseOpen(false);

  cxButtonEditTypeDoc.Text    :=DataDE['SHORT_NAME_TYPE_DOK'].asString;
  cxTextEditSeria.Text        :=DataDE['SERIA'].AsString;
  cxTextEditNomer.Text        :=DataDE['NOMER'].AsString;
  cxDateEditDATE_VIDACHI.Date :=DataDE['DATE_VIDACHI'].AsVariant;
  cxButtonEditTypeUchz.Text   :=DataDE['NAME_TYPE_EDUCORG'].asString;
  cxButtonEditUCHZ.Text       :=DataDE['NAME_SHORT_EDUCORG'].asString;
  cxButtonEditAdressUchz.Text :=DataDE['NAME_PLACE'].asString;
  cxLookupComboBoxCopy.Text   :=DataDE['SHORT_NAME_IS_COPY'].asString;
  cxTextEditOTR_SPEC.Text     :=DataDE['OTR_SPEC'].asString;

  if DataDE['IS_MAIN_DOK'].asInteger=1
   then  begin
     cxCheckBoxIS_MAIN_BOOK.Checked :=true;
     cxCheckBoxIS_MAIN_BOOK.Enabled :=false;
     cxCheckBoxIS_ACTIVE.Checked    :=true;
     cxCheckBoxIS_ACTIVE.Enabled    :=false;
   end
   else  cxCheckBoxIS_MAIN_BOOK.Checked:=false;
  if DataDE['IS_ACTIVE'].asInteger=1
   then cxCheckBoxIS_ACTIVE.Checked:=true
   else cxCheckBoxIS_ACTIVE.Checked:=false;
end;

procedure TFormEditDocEducation.ActionOKExecute(Sender: TObject);
begin
   if trim(cxButtonEditTypeDoc.Text)='' then
   begin
     ShowMessage(nMsgEmptyTypeDoc[DELangEdit]);
     cxButtonEditTypeDoc.SetFocus;
     exit;
   end;

   if  DataDE['IS_DOVIDKA'].AsInteger<>1 then
   begin
     if trim(cxTextEditSeria.Text)='' then
     begin
       ShowMessage(nMsgEmptySeria[DELangEdit]);
       cxTextEditSeria.SetFocus;
       exit;
     end;

     if trim(cxTextEditNomer.Text)='' then
     begin
       ShowMessage(nMsgEmptyNomer[DELangEdit]);
       cxTextEditNomer.SetFocus;
       exit;
     end;
   end;

   if trim(cxDateEditDATE_VIDACHI.Text)='' then
     begin
       ShowMessage(nMsgEmptyDATE_VIDACHI[DELangEdit]);
       cxDateEditDATE_VIDACHI.SetFocus;
       exit;
     end;

   if trim(cxButtonEditTypeUchz.Text)='' then
   begin
     ShowMessage(nMsgEmptyTypeUchz[DELangEdit]);
     cxButtonEditTypeUchz.SetFocus;
     exit;
   end;

   if trim(cxButtonEditAdressUchz.Text)='' then
   begin
     ShowMessage(nMsgEmptyAdressUchz[DELangEdit]);
     cxButtonEditAdressUchz.SetFocus;
     exit;
   end;

   if trim(cxButtonEditUCHZ.Text)='' then
   begin
     ShowMessage(nMsgEmptyUCHZ[DELangEdit]);
     cxButtonEditUCHZ.SetFocus;
     exit;
   end;

   if trim(cxLookupComboBoxCopy.Text)='' then
   begin
     ShowMessage(nMsgEmptyCopyOrig[DELangEdit]);
     cxLookupComboBoxCopy.SetFocus;
     exit;
   end;

 {  if cxTextEditSeria.Text=''
    then DataDE['SERIA'].AsString         :=' ' // если будет просто '',то преобразовывает к Null
    else DataDE['SERIA'].AsString         :=cxTextEditSeria.Text;
   if cxTextEditNomer.Text=''
    then DataDE['NOMER'].AsString         :=' ' // если будет просто '',то преобразовывает к Null
    else DataDE['NOMER'].AsString         :=cxTextEditNomer.Text;      }

   DataDE['SERIA'].AsString         :=cxTextEditSeria.Text;
   DataDE['NOMER'].AsString         :=cxTextEditNomer.Text;

   DataDE['DATE_VIDACHI'].AsVariant :=cxDateEditDATE_VIDACHI.Date;
   DataDE['NAME_IS_COPY'].AsString  :=DataSetCopy.FieldValues['SHORT_NAME'];
   DataDE['ID_SP_IS_COPY'].AsInt64  :=DataSetCopy.FieldValues['ID_SP_IS_COPY'];
   DataDE['OTR_SPEC'].asString      :=cxTextEditOTR_SPEC.Text;

   if cxCheckBoxIS_MAIN_BOOK.Checked=true
    then DataDE['IS_MAIN_DOK'].AsInteger:=1
    else DataDE['IS_MAIN_DOK'].AsInteger:=0;

   if cxCheckBoxIS_ACTIVE.Checked=true
    then DataDE['IS_ACTIVE'].AsInteger:=1
    else DataDE['IS_ACTIVE'].AsInteger:=0; 

   ModalResult:=mrOk;
end;

procedure TFormEditDocEducation.cxButtonEditTypeDocPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle,
                                    PrK_SP_TYPE_DOK_OBR,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataDE['ID_SP_TYPE_DOK_OBR'].AsInt64      := Res[0];
              DataDE['SHORT_NAME_TYPE_DOK'].AsString    := Res[2];
              DataDE['IS_DOVIDKA'].AsInteger            := Res[5];
              cxButtonEditTypeDoc.Text                  := DataDE['SHORT_NAME_TYPE_DOK'].AsString;
              cxTextEditSeria.SetFocus;
          end;
    end;
end;

procedure TFormEditDocEducation.cxButtonEditTypeUchzPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle,
                                    PrK_SP_TYPE_UCHZ,fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataDE['ID_TYPE_EDUCORG'].AsInt64        := Res[0];
              DataDE['NAME_TYPE_EDUCORG'].AsString     := Res[2];
              cxButtonEditTypeUchz.Text                := DataDE['NAME_TYPE_EDUCORG'].AsString;
              if trim(cxButtonEditAdressUchz.Text)<>'' then
              begin
                cxButtonEditUCHZ.Enabled:=true;
                cxButtonEditUCHZ.SetFocus;
              end
              else cxButtonEditAdressUchz.SetFocus;
          end;
    end;
end;

procedure TFormEditDocEducation.cxButtonEditUCHZPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  InOutParam :TAArray;
begin
  InOutParam :=TAArray.Create;
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle);
    InOutParam['Input']['aNamePrKVuzLicense'].AsVariant := PRK_SP_EDUCORG;
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InOutParam['Input']['ID_PLACE_IN'].AsInt64          := DataDE['ID_PLACE_EDUCORG'].AsInt64;
    InOutParam['Input']['ID_TYPE_IN'].AsInt64           := DataDE['ID_TYPE_EDUCORG'].AsInt64;
  uPrK_Loader.ShowVuzLicense(self,InOutParam);
  if  InOutParam['OutPut']['ID_ORG'].AsVariant<>Null then
  begin
      DataDE['ID_SP_EDUCORG'].AsInt64       :=InOutParam['OutPut']['ID_ORG'].AsInt64;
      DataDE['NAME_SHORT_EDUCORG'].AsString :=InOutParam['OutPut']['NAME_SHORT'].AsString;
      DataDE['IS_VUZ'].AsInteger            :=InOutParam['OutPut']['IS_READ_ONLY'].AsInteger;
      cxButtonEditUCHZ.Text                 :=DataDE['NAME_SHORT_EDUCORG'].AsString;
      cxLookupComboBoxCopy.SetFocus;
  end;
  InOutParam.Free;
  InOutParam:=nil;
end;

procedure TFormEditDocEducation.cxButtonEditAdressUchzPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AdressesSp:TSprav;
begin
    AdressesSp:=GetSprav('Adresses');
    if (AdressesSp<>nil) then
    begin
        with AdressesSp.Input do
        begin
            Edit;
            FieldValues['Id_Adress']    :=DataDE['ID_PLACE_EDUCORG'].AsInt64;
            FieldValues['DbHandle']     :=Integer(TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle);
            FieldValues['Select']       :=1;
            FieldValues['ShowStyle']    :=5;
            Post;
        end;

        AdressesSp.Show;

        if (not VarIsNull(AdressesSp.Output['Id_Adress']))
        then begin
                      //ShowMessage(VarTostr(AdressesSp.Output['Id_Adress']));
                    DataDE['NAME_PLACE'].AsString      :=AdressesSp.Output['Name_Adr'];
                    cxButtonEditAdressUchz.Text        :=DataDE['NAME_PLACE'].AsString;
                    DataDE['ID_PLACE_EDUCORG'].AsInt64 :=AdressesSp.Output['Id_Adress']; // подразумевается id_place
                    if trim(cxButtonEditTypeUchz.Text)<>'' then
                    begin
                     cxButtonEditUCHZ.Enabled:=true;
                     cxButtonEditUCHZ.SetFocus;
                    end
                    else cxButtonEditTypeUchz.SetFocus;
        end;
   end;
end;                              

procedure TFormEditDocEducation.cxButtonEditTypeDocKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key := Chr(0);
end;

procedure TFormEditDocEducation.cxButtonEditTypeUchzKeyPress(
  Sender: TObject; var Key: Char);
begin
   Key := Chr(0);
end;

procedure TFormEditDocEducation.cxTextEditNomerKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

procedure TFormEditDocEducation.cxCheckBoxIS_MAIN_BOOKPropertiesChange(
  Sender: TObject);
begin
   if cxCheckBoxIS_MAIN_BOOK.Checked=true then
    begin
      cxCheckBoxIS_ACTIVE.Checked:=true;
      cxCheckBoxIS_ACTIVE.Enabled:=false;
    end
    else
       cxCheckBoxIS_ACTIVE.Enabled:=true;
end;

end.
