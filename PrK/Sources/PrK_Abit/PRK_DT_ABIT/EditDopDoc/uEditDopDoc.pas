unit uEditDopDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uEditDocEducation, cxLookAndFeelPainters, DB, FIBDataSet,
  pFIBDataSet, ActnList, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxCalendar, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls,
  cxButtons, ExtCtrls,AArray;

type
  TFormEditDopDoc = class(TFormEditDocEducation)
    cxLabelName: TcxLabel;
    cxTextEditName: TcxTextEdit;
    cxLabelOcenka: TcxLabel;
    DataSetOcenka: TpFIBDataSet;
    DataSourceOcenka: TDataSource;
    cxLookupComboBoxOcenka: TcxLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEditTypeDocPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionOKExecute(Sender: TObject);
    procedure cxButtonEditOcenkaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEditOcenkaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButtonEditOcenkaKeyPress(Sender: TObject; var Key: Char);
  private
    DDLangEdit  :integer;
    isOcenka    :Boolean; //0 - нет оценки, 1 - оценка есть
    procedure   inicCaption;override;
  public
  end;

var
  FormEditDopDoc: TFormEditDopDoc;

implementation
uses
    uPrK_Resources,uConstants,uPRK_DT_ABIT,uPrK_Loader, uFrameVstup;
{$R *.dfm}

{ TFormEditDopDoc }

procedure TFormEditDopDoc.inicCaption;
begin
  inherited;
  cxLabelName.Caption   := nLabelName[DELangEdit];
  cxLabelOcenka.Caption := nLabelKOLVO_BALLOV[DELangEdit];
end;

procedure TFormEditDopDoc.FormCreate(Sender: TObject);
begin
  DataSetCopy.Active                         :=false;
  DataSetCopy.Database                       := TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT;
  DataSetCopy.Transaction                    := TFormPRK_DT_ABIT(self.Owner.Owner).TransactionReadPrK_ABIT;
  DataSetCopy.SelectSQL.Clear;
  DataSetCopy.SQLs.SelectSQL.Text            :='Select * from PRK_SP_IS_COPY_SELECT';
  DataSetCopy.CloseOpen(false);

  DataSetOcenka.Active                         :=false;
  DataSetOcenka.Database                       := TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT;
  DataSetOcenka.Transaction                    := TFormPRK_DT_ABIT(self.Owner.Owner).TransactionReadPrK_ABIT;
  DataSetOcenka.SelectSQL.Clear;
  DataSetOcenka.SQLs.SelectSQL.Text            :='Select * from PRK_SP_OCENKA_SELECT where ocenka_num <> 0 and is_spivbesida = 0';
  DataSetOcenka.CloseOpen(false);

  cxButtonEditTypeDoc.Text    :=DataDE['SHORT_NAME_TYPE_DOP_DOK'].asString;
  cxTextEditSeria.Text        :=DataDE['SERIA'].AsString;
  cxTextEditNomer.Text        :=DataDE['NOMER'].AsString;
  cxDateEditDATE_VIDACHI.Date :=DataDE['DATE_VIDACHI'].AsVariant;
  cxTextEditName.Text         :=DataDE['NAME'].asString;
  cxLookupComboBoxOcenka.Text :=IntToStr(DataDE['OCENKA_NUM'].AsInteger);
  cxLookupComboBoxCopy.Text   :=DataDE['SHORT_NAME_COPY'].asString;

  isOcenka := false;
  if DataDE['IS_OCENKA'].AsInteger=1
     then begin
            cxLookupComboBoxOcenka.Enabled:=true;
            isOcenka := true;
          end
     else cxLookupComboBoxOcenka.Enabled:=false;
end;

procedure TFormEditDopDoc.ActionOKExecute(Sender: TObject);
begin
   if trim(cxButtonEditTypeDoc.Text)='' then
   begin
     ShowMessage(nMsgEmptyTypeDoc[DELangEdit]);
     cxButtonEditTypeDoc.SetFocus;
     exit;
   end;

   if trim(cxDateEditDATE_VIDACHI.Text)='' then
     begin
       ShowMessage(nMsgEmptyCannotDate[DELangEdit]+CHR(13)+nMsgEmptyDATE_VIDACHI[DELangEdit]);
       cxDateEditDATE_VIDACHI.SetFocus;
       exit;
     end;

   if trim(cxLookupComboBoxCopy.Text)='' then
   begin
     ShowMessage(nMsgEmptyCopyOrig[DELangEdit]);
     cxLookupComboBoxCopy.SetFocus;
     exit;
   end;
   if isOcenka = true
   then begin
           if trim (cxLookupComboBoxOcenka.Text)=''
           then begin
                    ShowMessage(nMsgEmptyOcenkaDopDoc[DELangEdit]);
                    cxLookupComboBoxOcenka.SetFocus;
                    exit;
                end;
        end;

   DataDE['SERIA'].AsString         :=cxTextEditSeria.Text;
   DataDE['NOMER'].AsString         :=cxTextEditNomer.Text;
   DataDE['DATE_VIDACHI'].AsVariant :=cxDateEditDATE_VIDACHI.Date;

   DataDE['NAME'].asString          :=cxTextEditName.Text;
   DataDE['SHORT_NAME_COPY'].AsString  :=DataSetCopy.FieldValues['SHORT_NAME'];
   DataDE['ID_SP_IS_COPY'].AsInt64     :=DataSetCopy.FieldValues['ID_SP_IS_COPY'];
   if isOcenka = true
   then begin
            DataDE['OCENKA_NUM'].AsInteger      :=DataSetOcenka.FieldValues['OCENKA_NUM'];
            DataDE['ID_SP_OCENKA'].AsInteger    :=DataSetOcenka.FieldValues['ID_SP_OCENKA'];
        end
   else begin
            DataSetOcenka.Close;
            DataSetOcenka.SelectSQL.Clear;
            DataSetOcenka.SQLs.SelectSQL.Text   :='Select * from PRK_SP_OCENKA_SELECT where ocenka_num = 0';
            DataSetOcenka.CloseOpen(false);
            DataDE['OCENKA_NUM'].AsInteger      :=DataSetOcenka.FieldValues['OCENKA_NUM'];
            DataDE['ID_SP_OCENKA'].AsInteger    :=DataSetOcenka.FieldValues['ID_SP_OCENKA'];
        end;
   ModalResult:=mrOk;
end;

procedure TFormEditDopDoc.cxButtonEditTypeDocPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
    InOutParam :TAArray;
begin
   InOutParam :=TAArray.Create;
    InOutParam['Input']['ID_CN_SP_FORM_STUD'].AsInt64    :=TFormPRK_DT_ABIT(self.Owner.Owner).TFrameVstup1.DataSetFormStudy.FieldValues['ID_CN_SP_FORM_STUD'];
    InOutParam['Input']['ID_CN_SP_KAT_STUD'].AsInt64     :=TFormPRK_DT_ABIT(self.Owner.Owner).TFrameVstup1.DataSetKatStud.FieldValues['ID_CN_SP_KAT_STUD'];
    InOutParam['Input']['ID_CN_JN_FACUL_SPEC'].AsInt64   :=TFormPRK_DT_ABIT(self.Owner.Owner).TFrameVstup1.DataSetSpec.FieldValues['ID_CN_JN_FACUL_SPEC'];
    InOutParam['Input']['ID_SP_GOD_NABORA'].AsInt64      :=TFormPRK_DT_ABIT(self.Owner.Owner).ResultArray['Input']['GodNabora'].AsInt64;
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle,
                                    PrK_SP_TYPE_DOP_DOK,fsNormal,InOutParam);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataDE['ID_SP_TYPE_DOP_DOK'].AsInt64       := Res[0];
              DataDE['SHORT_NAME_TYPE_DOP_DOK'].AsString := Res[2];
              DataDE['IS_SPIVBESIDA'].AsInteger          :=InOutParam['Output']['IS_SPIVBESIDA'].AsInteger;
              DataDE['IS_ZALIK'].AsInteger               :=InOutParam['Output']['IS_ZALIK'].AsInteger;
              // параметр только нужен для PRK_DT_ABIT_DOP_DOK_CHANGE
                       // удалить DataDE['ID_SP_PREDM'].AsInt64              :=InOutParam['Output']['ID_SP_PREDM'].AsInt64;
              DataDE['IS_OCENKA'].AsInteger              :=InOutParam['Output']['IS_OCENKA'].AsInteger;
              cxButtonEditTypeDoc.Text                   := DataDE['SHORT_NAME_TYPE_DOP_DOK'].AsString;

              if DataDE['IS_OCENKA'].AsInteger=1
              then begin
                  cxLookupComboBoxOcenka.Enabled:=true;
                  isOcenka := true;
              end
              else cxLookupComboBoxOcenka.Enabled:=false;

              cxTextEditSeria.SetFocus;
          end;
    end;

   InOutParam.Free;
   InOutParam:=Nil;
end;

procedure TFormEditDopDoc.cxButtonEditOcenkaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res: Variant;
    InputParam :TAArray;
begin
    InputParam :=TAArray.Create;
     InputParam['Input']['IS_SPIVBESIDA'].AsInteger :={DataDE['IS_SPIVBESIDA'].AsInteger}0;
     InputParam['Input']['IS_ZALIK'].AsInteger      :=DataDE['IS_ZALIK'].AsInteger;
    res := uPrK_Loader.ShowPrkSprav(self,TFormPRK_DT_ABIT(self.Owner.Owner).DataBasePrK_ABIT.Handle,
                                    PrK_SP_OCENKA,fsNormal,InputParam);
    if VarArrayDimCount(res) > 0 then
    begin
          if res[0]<>NULL THEN
          begin
              DataDE['ID_SP_OCENKA'].AsInt64         := Res[0];
              DataDE['OCENKA_NUM'].AsString          := Res[2];
              cxLookupComboBoxOcenka.Text            := DataDE['OCENKA_NUM'].AsString;
              cxLookupComboBoxCopy.SetFocus;
          end;
    end;
end;

procedure TFormEditDopDoc.cxButtonEditOcenkaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if  Key=Vk_Delete
     then cxLookupComboBoxOcenka.Text:='';
end;

procedure TFormEditDopDoc.cxButtonEditOcenkaKeyPress(Sender: TObject;
  var Key: Char);
begin
   Key:=chr(0);
end;

end.
