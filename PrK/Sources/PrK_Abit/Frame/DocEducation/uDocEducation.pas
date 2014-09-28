unit uDocEducation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RxMemDS, cxGroupBox, cxContainer, cxTextEdit,
  cxDBEdit, cxLabel,AArray, cxMaskEdit, cxCheckBox,uPrK_Resources,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TFrameDocEducation = class(TFrame)
    cxGridPrKDocEducation: TcxGrid;
    cxGridPrKDocEducationDBTableView1: TcxGridDBTableView;
    cxGridPrKDocEducationLevel1: TcxGridLevel;
    DataSourceDocEducation: TDataSource;
    RxMemoryDataDocEducation: TRxMemoryData;
    cxGroupBoxDocEducation: TcxGroupBox;
    colNAME_DOK_OBR: TcxGridDBColumn;
    colSERIA: TcxGridDBColumn;
    colNOMER: TcxGridDBColumn;
    colDATE_VIDACHI: TcxGridDBColumn;
    colNAME_TYPE_UCHZ: TcxGridDBColumn;
    colIS_MAIN_BOOK: TcxGridDBColumn;
    colNAME_IS_COPY: TcxGridDBColumn;
    cxDBTextEditUCHZ: TcxDBTextEdit;
    cxLabelUCHZ: TcxLabel;
    cxLabelAdressUchz: TcxLabel;
    cxDBTextEditAdressUchz: TcxDBTextEdit;
    colIS_ACTIVE: TcxGridDBColumn;
    DataSetDocEducation: TpFIBDataSet;
    cxLabelOTR_SPEC: TcxLabel;
    cxDBTextEditOTR_SPEC: TcxDBTextEdit;
    procedure cxGridPrKDocEducationDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure colIS_MAIN_BOOKCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    StopExecProc    :Boolean;
    DELang          :integer;
    DEViewColor     :TColor;
    CountRecordOnDE :integer;
    FSelectTextFrameDocEducation: boolean;
    FSelectSQLTextDocEducation: string;
    procedure SetSelectSQLTextDocEducation(const Value: string);
    procedure SetSelectTextFrameDocEducation(const Value: boolean);
    procedure DelDocFromBase(id: int64);
    procedure ChangeDocInBase;
    procedure AddDocInBase;
  public
    procedure InicCaptionFrame;
    procedure InicDataFrame(rejim :RejimPrK);
    procedure ADDDocEduc;
    procedure ChangeDocEduc;overload;
    procedure ChangeDocEduc(aDataDEChange :TAArray);overload;
    procedure ViewDocEduc;
    procedure DelDocEduc;
    procedure SaveDocEduc;
    function  ProverkaOnExists       :integer;
    function  OnMainDocObrIsNotDovidka  :integer;
    property  SelectTextFrameDocEducation :boolean read FSelectTextFrameDocEducation write SetSelectTextFrameDocEducation;
    property  SelectSQLTextDocEducation :string read FSelectSQLTextDocEducation write SetSelectSQLTextDocEducation;
  end;

implementation
uses
    uPRK_DT_ABIT,uConstants,uEditDocEducation;
{$R *.dfm}

{ TFrameDocEducation }

procedure TFrameDocEducation.InicCaptionFrame;
begin
   DELang     :=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
   DEViewColor:=TFormPRK_DT_ABIT(self.Owner).TextViewColor;
   colNAME_DOK_OBR.Caption     :=ncolNAME_DOK_OBR[DELang];
   colSERIA.Caption            :=ncolSERIA[DELang];
   colNOMER.Caption            :=ncolNOMER[DELang];
   colDATE_VIDACHI.Caption     :=ncolDATE_VIDACHI[DELang];
   colNAME_TYPE_UCHZ.Caption   :=ncolTYPE_UCHZ[DELang];
   colIS_MAIN_BOOK.Caption     :=ncolIS_MAIN_BOOK[DELang];
   colNAME_IS_COPY.Caption     :=ncolNAME_IS_COPY[DELang];
   cxLabelUCHZ.Caption         :=nLabelUchz[DELang];
   cxLabelAdressUchz.Caption   :=nLabelAdressUchz[DELang];
   cxLabelOTR_SPEC.Caption     :=nLabelOTR_SPEC[DELang];
end;

procedure TFrameDocEducation.ADDDocEduc;
var
   DataDEAdd :TAArray;
   T:TFormEditDocEducation;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataDEAdd :=TAArray.Create;
   DataDEAdd['SHORT_NAME_TYPE_DOK'].asString  :='';
   DataDEAdd['SERIA'].AsString                :='';
   DataDEAdd['NOMER'].AsString                :='';
   DataDEAdd['DATE_VIDACHI'].AsVariant        :=date;
   DataDEAdd['NAME_TYPE_EDUCORG'].asString    :='';
   DataDEAdd['NAME_SHORT_EDUCORG'].asString   :='';
   DataDEAdd['NAME_PLACE'].asString           :='';
   DataDEAdd['IS_MAIN_DOK'].AsInteger         :=0;
   DataDEAdd['IS_ACTIVE'].AsInteger           :=1;
   DataDEAdd['IS_DOVIDKA'].AsInteger          :=0;
   DataDEAdd['OTR_SPEC'].asString             :='';

   T := TFormEditDocEducation.Create(self,DataDEAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[DELang];
   T.cxButtonEditUCHZ.Enabled   :=false; 

   if T.ShowModal=MrOk then
    begin
       RxMemoryDataDocEducation.Open;
         // главным должен быть только один дркумент
         // ПРИМЕЧАНИЕ: Поле в Rx назыв. IS_MAIN_DOK, а колонка в Gride IS_MAIN_BOOK
       if DataDEAdd['IS_MAIN_DOK'].AsInteger=1 then
       begin
         RxMemoryDataDocEducation.First;
         while not RxMemoryDataDocEducation.Eof do
         begin
            RxMemoryDataDocEducation.Edit;
            RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value:=0;
            RxMemoryDataDocEducation.Next;
         end;
       end;

       RxMemoryDataDocEducation.Insert;
       // нижнее поле надо будет заменить на на возвращаемый ID
       RxMemoryDataDocEducation.FieldByName('ID_DT_FIZL_DOK_OBR').Value   :=-999;// сделано для отличия от существующих записей в базе
       RxMemoryDataDocEducation.FieldByName('ID_SP_TYPE_DOK_OBR').Value   :=DataDEAdd['ID_SP_TYPE_DOK_OBR'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('SHORT_NAME_TYPE_DOK').Value  :=DataDEAdd['SHORT_NAME_TYPE_DOK'].AsString;
       RxMemoryDataDocEducation.FieldByName('SERIA').Value                :=VarToStr(DataDEAdd['SERIA'].AsString);
       RxMemoryDataDocEducation.FieldByName('NOMER').Value                :=VarToStr(DataDEAdd['NOMER'].AsString);
       RxMemoryDataDocEducation.FieldByName('DATE_VIDACHI').Value         :=DataDEAdd['DATE_VIDACHI'].AsVariant;
       RxMemoryDataDocEducation.FieldByName('ID_TYPE_EDUCORG').Value      :=DataDEAdd['ID_TYPE_EDUCORG'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('NAME_TYPE_EDUCORG').Value    :=DataDEAdd['NAME_TYPE_EDUCORG'].AsString;
       RxMemoryDataDocEducation.FieldByName('ID_SP_EDUCORG').Value        :=DataDEAdd['ID_SP_EDUCORG'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('NAME_SHORT_EDUCORG').Value   :=DataDEAdd['NAME_SHORT_EDUCORG'].AsString;
       RxMemoryDataDocEducation.FieldByName('IS_VUZ').Value               :=DataDEAdd['IS_VUZ'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('ID_PLACE_EDUCORG').Value     :=DataDEAdd['ID_PLACE_EDUCORG'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('NAME_PLACE').Value           :=DataDEAdd['NAME_PLACE'].AsString;
       RxMemoryDataDocEducation.FieldByName('ID_SP_IS_COPY').Value        :=DataDEAdd['ID_SP_IS_COPY'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('SHORT_NAME_IS_COPY').Value   :=DataDEAdd['NAME_IS_COPY'].AsString;
       RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value          :=DataDEAdd['IS_MAIN_DOK'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('IS_ACTIVE').Value            :=DataDEAdd['IS_ACTIVE'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('IS_DOVIDKA').Value           :=DataDEAdd['IS_DOVIDKA'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('OTR_SPEC').Value             :=VarToStr(DataDEAdd['OTR_SPEC'].asString);
       try
          RxMemoryDataDocEducation.Post;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                        nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
             RxMemoryDataDocEducation.Cancel;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
  // Obnovit(DataVLAdd['ID'].AsInt64);
   DataDEAdd.Free;
   DataDEAdd:=Nil;
   if TryAgain=true
      then ADDDocEduc;
end;

procedure TFrameDocEducation.ChangeDocEduc;
var
   DataDEChange :TAArray;
   T:TFormEditDocEducation;
   TryAgain :boolean;
begin  
   TryAgain     :=true;
   DataDEChange :=TAArray.Create;
   DataDEChange['ID_SP_TYPE_DOK_OBR'].AsInt64    :=RxMemoryDataDocEducation.FieldByName('ID_SP_TYPE_DOK_OBR').Value;
   DataDEChange['SHORT_NAME_TYPE_DOK'].asString  :=RxMemoryDataDocEducation.FieldByName('SHORT_NAME_TYPE_DOK').Value;
   DataDEChange['SERIA'].AsString                :=VarToStr(RxMemoryDataDocEducation.FieldByName('SERIA').Value);
   DataDEChange['NOMER'].AsString                :=VarToStr(RxMemoryDataDocEducation.FieldByName('NOMER').Value);
   DataDEChange['DATE_VIDACHI'].AsVariant        :=RxMemoryDataDocEducation.FieldByName('DATE_VIDACHI').Value;
   DataDEChange['ID_TYPE_EDUCORG'].AsInt64       :=RxMemoryDataDocEducation.FieldByName('ID_TYPE_EDUCORG').Value;
   DataDEChange['NAME_TYPE_EDUCORG'].asString    :=RxMemoryDataDocEducation.FieldByName('NAME_TYPE_EDUCORG').Value;
   DataDEChange['ID_SP_EDUCORG'].AsInt64         :=RxMemoryDataDocEducation.FieldByName('ID_SP_EDUCORG').Value;
   DataDEChange['NAME_SHORT_EDUCORG'].asString   :=RxMemoryDataDocEducation.FieldByName('NAME_SHORT_EDUCORG').Value;
   DataDEChange['IS_VUZ'].AsInteger              :=RxMemoryDataDocEducation.FieldByName('IS_VUZ').Value;
   DataDEChange['ID_PLACE_EDUCORG'].AsInt64      :=RxMemoryDataDocEducation.FieldByName('ID_PLACE_EDUCORG').Value;
   DataDEChange['NAME_PLACE'].asString           :=RxMemoryDataDocEducation.FieldByName('NAME_PLACE').Value;
   DataDEChange['ID_SP_IS_COPY'].AsInt64         :=RxMemoryDataDocEducation.FieldByName('ID_SP_IS_COPY').Value;
   DataDEChange['SHORT_NAME_IS_COPY'].asString   :=RxMemoryDataDocEducation.FieldByName('SHORT_NAME_IS_COPY').Value;
   DataDEChange['IS_MAIN_DOK'].AsInteger         :=RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value;
   DataDEChange['IS_ACTIVE'].AsInteger           :=RxMemoryDataDocEducation.FieldByName('IS_ACTIVE').Value;
   DataDEChange['IS_DOVIDKA'].AsInteger          :=RxMemoryDataDocEducation.FieldByName('IS_DOVIDKA').Value;
   DataDEChange['OTR_SPEC'].asString             :=VarToStr(RxMemoryDataDocEducation.FieldByName('OTR_SPEC').Value);

   T := TFormEditDocEducation.Create(self,DataDEChange);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[DELang];

   if T.ShowModal=MrOk then
    begin
       RxMemoryDataDocEducation.Open;
         // главным должен быть только один дркумент
       if ((DataDEChange['IS_MAIN_DOK'].AsInteger=1)and
           (StrToInt(RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value)<>1))  then
       begin
         RxMemoryDataDocEducation.Edit;
         RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value:=2; // для отличия от уже сущ-го главного
         RxMemoryDataDocEducation.First;
         while not RxMemoryDataDocEducation.Eof do
         begin
            if StrToInt(RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value)<>2 then
             begin
               RxMemoryDataDocEducation.Edit;
               RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value:=0;
             end
             else
            ChangeDocEduc(DataDEChange);
            RxMemoryDataDocEducation.Next;
         end;
       end
       else
        ChangeDocEduc(DataDEChange);
       try
          RxMemoryDataDocEducation.Edit;
          RxMemoryDataDocEducation.Post;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                        nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
             RxMemoryDataDocEducation.Cancel;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
  // Obnovit(DataVLAdd['ID'].AsInt64);
   DataDEChange.Free;
   DataDEChange:=Nil;
   {if TryAgain=true
      then ChangeDocEduc;} // отменено потому что при возникновении ошибки не возможно с позицироваться из-за проверок
end;

procedure TFrameDocEducation.ChangeDocEduc(aDataDEChange: TAArray);
begin
       RxMemoryDataDocEducation.Edit;
       RxMemoryDataDocEducation.FieldByName('ID_SP_TYPE_DOK_OBR').Value   :=aDataDEChange['ID_SP_TYPE_DOK_OBR'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('SHORT_NAME_TYPE_DOK').Value  :=aDataDEChange['SHORT_NAME_TYPE_DOK'].AsString;
       RxMemoryDataDocEducation.FieldByName('SERIA').Value                :=VarToStr(aDataDEChange['SERIA'].AsString);
       RxMemoryDataDocEducation.FieldByName('NOMER').Value                :=VarToStr(aDataDEChange['NOMER'].AsString);
       RxMemoryDataDocEducation.FieldByName('DATE_VIDACHI').Value         :=aDataDEChange['DATE_VIDACHI'].AsVariant;
       RxMemoryDataDocEducation.FieldByName('ID_TYPE_EDUCORG').Value      :=aDataDEChange['ID_TYPE_EDUCORG'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('NAME_TYPE_EDUCORG').Value    :=aDataDEChange['NAME_TYPE_EDUCORG'].AsString;
       RxMemoryDataDocEducation.FieldByName('ID_SP_EDUCORG').Value        :=aDataDEChange['ID_SP_EDUCORG'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('NAME_SHORT_EDUCORG').Value   :=aDataDEChange['NAME_SHORT_EDUCORG'].AsString;
       RxMemoryDataDocEducation.FieldByName('IS_VUZ').Value               :=aDataDEChange['IS_VUZ'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('ID_PLACE_EDUCORG').Value     :=aDataDEChange['ID_PLACE_EDUCORG'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('NAME_PLACE').Value           :=aDataDEChange['NAME_PLACE'].AsString;
       RxMemoryDataDocEducation.FieldByName('ID_SP_IS_COPY').Value        :=aDataDEChange['ID_SP_IS_COPY'].AsInt64;
       RxMemoryDataDocEducation.FieldByName('SHORT_NAME_IS_COPY').Value   :=aDataDEChange['NAME_IS_COPY'].AsString;
       RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value          :=aDataDEChange['IS_MAIN_DOK'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('IS_ACTIVE').Value            :=aDataDEChange['IS_ACTIVE'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('IS_DOVIDKA').Value           :=aDataDEChange['IS_DOVIDKA'].AsInteger;
       RxMemoryDataDocEducation.FieldByName('OTR_SPEC').Value             :=VarToStr(aDataDEChange['OTR_SPEC'].asString);
end;

procedure TFrameDocEducation.ViewDocEduc;
var
   DataDEView :TAArray;
   T:TFormEditDocEducation;
begin
       DataDEView :=TAArray.Create;
       DataDEView['SHORT_NAME_TYPE_DOK'].asString  :=RxMemoryDataDocEducation.FieldByName('SHORT_NAME_TYPE_DOK').Value;
       DataDEView['SERIA'].AsString                :=VarToStr(RxMemoryDataDocEducation.FieldByName('SERIA').Value);
       DataDEView['NOMER'].AsString                :=VarToStr(RxMemoryDataDocEducation.FieldByName('NOMER').Value);
       DataDEView['DATE_VIDACHI'].AsVariant        :=RxMemoryDataDocEducation.FieldByName('DATE_VIDACHI').Value;
       DataDEView['NAME_TYPE_EDUCORG'].asString    :=RxMemoryDataDocEducation.FieldByName('NAME_TYPE_EDUCORG').Value;
       DataDEView['NAME_SHORT_EDUCORG'].asString   :=RxMemoryDataDocEducation.FieldByName('NAME_SHORT_EDUCORG').Value;
       DataDEView['NAME_PLACE'].asString           :=RxMemoryDataDocEducation.FieldByName('NAME_PLACE').Value;
       DataDEView['SHORT_NAME_IS_COPY'].asString   :=RxMemoryDataDocEducation.FieldByName('SHORT_NAME_IS_COPY').Value;
       DataDEView['IS_MAIN_DOK'].AsInteger         :=RxMemoryDataDocEducation.FieldByName('IS_MAIN_DOK').Value;
       DataDEView['IS_ACTIVE'].AsInteger           :=RxMemoryDataDocEducation.FieldByName('IS_ACTIVE').Value;
       DataDEView['IS_DOVIDKA'].AsInteger          :=RxMemoryDataDocEducation.FieldByName('IS_DOVIDKA').Value;
       DataDEView['OTR_SPEC'].asString             :=VarToStr(RxMemoryDataDocEducation.FieldByName('OTR_SPEC').Value);
       T:=TFormEditDocEducation.Create(self,DataDEView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[DELang];
       T.cxButtonEditTypeDoc.Properties.ReadOnly    :=true;
       T.cxButtonEditTypeDoc.Properties.Buttons[0].Visible    :=false;
       T.cxButtonEditTypeUchz.Properties.ReadOnly   :=true;
       T.cxButtonEditTypeUchz.Properties.Buttons[0].Visible   :=false;
       T.cxButtonEditUCHZ.Properties.ReadOnly       :=true;
       T.cxButtonEditUCHZ.Properties.Buttons[0].Visible       :=false;
       T.cxButtonEditAdressUchz.Properties.ReadOnly :=true;
       T.cxButtonEditAdressUchz.Properties.Buttons[0].Visible :=false;
       T.cxCheckBoxIS_MAIN_BOOK.Properties.ReadOnly :=true;
       T.cxCheckBoxIS_ACTIVE.Properties.ReadOnly    :=true;

       T.cxTextEditSeria.Properties.ReadOnly        :=true;
       T.cxTextEditNomer.Properties.ReadOnly        :=true;
       T.cxDateEditDATE_VIDACHI.Properties.ReadOnly :=true;
       T.cxLookupComboBoxCopy.Properties.ReadOnly   :=true;
       T.cxTextEditOTR_SPEC.Properties.ReadOnly     :=true;


       T.cxButtonEditTypeDoc.Style.Color            :=DEViewColor;
       T.cxButtonEditTypeUchz.Style.Color           :=DEViewColor;
       T.cxButtonEditUCHZ.Style.Color               :=DEViewColor;
       T.cxButtonEditAdressUchz.Style.Color         :=DEViewColor;
       T.cxTextEditSeria.Style.Color                :=DEViewColor;
       T.cxTextEditNomer.Style.Color                :=DEViewColor;
       T.cxDateEditDATE_VIDACHI.Style.Color         :=DEViewColor;
       T.cxLookupComboBoxCopy.Style.Color           :=DEViewColor;
       T.cxCheckBoxIS_MAIN_BOOK.Style.Color         :=DEViewColor;
       T.cxCheckBoxIS_ACTIVE.Style.Color            :=DEViewColor;
       T.cxTextEditOTR_SPEC.Style.Color             :=DEViewColor;

       T.cxCheckBoxIS_MAIN_BOOK.Enabled    :=false;
       T.cxCheckBoxIS_ACTIVE.Enabled       :=false; 

       T.ShowModal;
       T.Free;
       T:=nil;
       DataDEView.Free;
       DataDEView:=nil;
end;

procedure TFrameDocEducation.DelDocEduc;
begin
   if prkMessageDlg(nMsgBoxTitle[DELang],nMsgDel[DELang],
                    mtInformation,mbOKCancel,DELang)=mrOK
    then RxMemoryDataDocEducation.Delete;
end;

procedure TFrameDocEducation.cxGridPrKDocEducationDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if AViewInfo.GridRecord.Values[cxGridPrKDocEducationDBTableView1.IndexOfItem(cxGridPrKDocEducationDBTableView1.FindItemByName('colIS_ACTIVE'))] = 0 then
   begin
     ADone := false;
     ACanvas.Font.Color  := clGrayText;
     //ACanvas.Brush.Color := clGray;
   end;
end;

procedure TFrameDocEducation.InicDataFrame(rejim: RejimPrK);
begin
   if rejim=ViewPrK then
   begin
       TFormPRK_DT_ABIT(self.Owner).ActionADDDE.Enabled       :=false;
       TFormPRK_DT_ABIT(self.Owner).ActionChangeDE.Enabled    :=false;
       TFormPRK_DT_ABIT(self.Owner).ActionDELDE.Enabled       :=false;
   end;
end;

procedure TFrameDocEducation.colIS_MAIN_BOOKCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if (AviewInfo.GridRecord.Values[cxGridPrKDocEducationDBTableView1.IndexOfItem(
          cxGridPrKDocEducationDBTableView1.FindItemByName('colIS_MAIN_BOOK'))]) = 1 then
   begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(TFormPRK_DT_ABIT(self.Owner).ImageListVuzLicense, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 0);
            ADone := True;
    end
    else begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ADone := True;
    end;
end;

procedure TFrameDocEducation.SetSelectTextFrameDocEducation(
  const Value: boolean);
begin
  FSelectTextFrameDocEducation := Value;
  if  FSelectTextFrameDocEducation=true then
   begin
      SelectSQLTextDocEducation  :='Select * from PRK_DT_DOK_OBR_SELECT(:ID_MAN,:ID_DT_ABIT_IN)';
   end;
end;

procedure TFrameDocEducation.SetSelectSQLTextDocEducation(
  const Value: string);
begin
  FSelectSQLTextDocEducation := Value;
  RxMemoryDataDocEducation.Close;
  DataSetDocEducation.Active                         :=false;
    DataSetDocEducation.Database                       := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetDocEducation.Transaction                    := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetDocEducation.SelectSQL.Clear;
    DataSetDocEducation.SQLs.SelectSQL.Text            := FSelectSQLTextDocEducation;
    DataSetDocEducation.ParamByName('ID_MAN').AsInt64  :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
    DataSetDocEducation.ParamByName('ID_DT_ABIT_IN').AsInt64  := -TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
   // ShowMessage(VarToStr(TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64));
    DataSetDocEducation.CloseOpen(false);
    DataSetDocEducation.FetchAll;
    RxMemoryDataDocEducation.LoadFromDataSet(DataSetDocEducation,DataSetDocEducation.RecordCount,lmCopy);
end;

procedure TFrameDocEducation.SaveDocEduc;
var
  CanDelDoc: Boolean;
begin
  StopExecProc:=false;
//----------------Удаление&Редактирование--------------------\\
  DataSetDocEducation.first;
  while not  DataSetDocEducation.Eof do
  begin
    CanDelDoc:=true;
    // нужно считать отдельно потому-что(возможно) сбивается курсор 
    CountRecordOnDE:= RxMemoryDataDocEducation.RecordCount;
    RxMemoryDataDocEducation.First;
    while not  RxMemoryDataDocEducation.Eof do
    begin
      if  DataSetDocEducation.FieldValues['ID_DT_FIZL_DOK_OBR']=RxMemoryDataDocEducation.FieldValues['ID_DT_FIZL_DOK_OBR']
          then begin
           CanDelDoc:=false;
           ChangeDocInBase;
            // Проверка на ошибку выполнения транзакции
           if StopExecProc=true then
            begin
             TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
             exit;
            end;
          end;
      RxMemoryDataDocEducation.Next;
    end;
    if CanDelDoc=true
       then DelDocFromBase(DataSetDocEducation.FieldValues['ID_DT_FIZL_DOK_OBR']);
     // Проверка на ошибку выполнения транзакции
    if StopExecProc=true then
      begin
       TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
       exit;
      end;
    DataSetDocEducation.Next;
  end;
//----------------Добавление--------------------\\
  CountRecordOnDE:= RxMemoryDataDocEducation.RecordCount; // нужно считать отдельно потому-что(возможно) сбивается курсор
  RxMemoryDataDocEducation.First;
    while not  RxMemoryDataDocEducation.Eof do
    begin
      if RxMemoryDataDocEducation.FieldValues['ID_DT_FIZL_DOK_OBR']=-999
          then  AddDocInBase;
      // Проверка на ошибку выполнения транзакции
      if StopExecProc=true then
        begin
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         exit;
        end;
      RxMemoryDataDocEducation.Next;
    end;

end;

procedure TFrameDocEducation.DelDocFromBase(id: int64);
begin
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_DOK_OBR_DEL';
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_FIZL_DOK_OBR').AsInt64   :=id;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64              :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
   try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                    nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         Exit;
      end;
   end;
end;

procedure TFrameDocEducation.ChangeDocInBase;
begin
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_DOK_OBR_CHANGE';
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_FIZL_DOK_OBR').AsInt64   :=RxMemoryDataDocEducation.FieldValues['ID_DT_FIZL_DOK_OBR'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT_DOK_OBR').AsInt64   :=RxMemoryDataDocEducation.FieldValues['ID_DT_ABIT_DOK_OBR'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_MAN').AsInt64               :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_TYPE_DOK_OBR').AsInt64   :=RxMemoryDataDocEducation.FieldValues['ID_SP_TYPE_DOK_OBR'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_EDUCORG').AsInt64        :=RxMemoryDataDocEducation.FieldValues['ID_SP_EDUCORG'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('SERIA').AsString               :=VarToStr(RxMemoryDataDocEducation.FieldValues['SERIA']);
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('NOMER').AsString               :=VarToStr(RxMemoryDataDocEducation.FieldValues['NOMER']);
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('DATE_VIDACHI').AsDate          :=RxMemoryDataDocEducation.FieldValues['DATE_VIDACHI'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_VUZ').AsInteger             :=RxMemoryDataDocEducation.FieldValues['IS_VUZ'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64           :=TFormPRK_DT_ABIT(self.Owner).ID_ABIT_OUT;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_IS_COPY').AsInt64        :=RxMemoryDataDocEducation.FieldValues['ID_SP_IS_COPY'];
  if CountRecordOnDE=1
   then TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_MAIN_DOK').AsInteger   :=1
   else TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_MAIN_DOK').AsInteger   :=RxMemoryDataDocEducation.FieldValues['IS_MAIN_DOK'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_ACTIVE').AsInteger          :=RxMemoryDataDocEducation.FieldValues['IS_ACTIVE'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64              :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('OTR_SPEC').AsString            :=VarToStr(RxMemoryDataDocEducation.FieldByName('OTR_SPEC').Value);
   try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                    nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         Exit;
      end;
   end;
end;

procedure TFrameDocEducation.AddDocInBase;
begin
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_DOK_OBR_ADD';
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_MAN').AsInt64               :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_TYPE_DOK_OBR').AsInt64   :=RxMemoryDataDocEducation.FieldValues['ID_SP_TYPE_DOK_OBR'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_EDUCORG').AsInt64        :=RxMemoryDataDocEducation.FieldValues['ID_SP_EDUCORG'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('SERIA').AsString               :=VarToStr(RxMemoryDataDocEducation.FieldValues['SERIA']);
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('NOMER').AsString               :=VarToStr(RxMemoryDataDocEducation.FieldValues['NOMER']);
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('DATE_VIDACHI').AsDate          :=RxMemoryDataDocEducation.FieldValues['DATE_VIDACHI'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_VUZ').AsInteger             :=RxMemoryDataDocEducation.FieldValues['IS_VUZ'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64           :=TFormPRK_DT_ABIT(self.Owner).ID_ABIT_OUT;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_IS_COPY').AsInt64        :=RxMemoryDataDocEducation.FieldValues['ID_SP_IS_COPY'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('OTR_SPEC').AsString            :=VarToStr(RxMemoryDataDocEducation.FieldByName('OTR_SPEC').Value);
  if CountRecordOnDE=1
   then TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_MAIN_DOK').AsInteger   :=1
   else TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('IS_MAIN_DOK').AsInteger   :=RxMemoryDataDocEducation.FieldValues['IS_MAIN_DOK'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64              :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
   try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
      { 2007-02-01 }
       RxMemoryDataDocEducation.Edit;
       RxMemoryDataDocEducation.FieldByName('ID_DT_FIZL_DOK_OBR').Value :=TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.FieldByName('ID_DT_FIZL_DOK_OBR_OUT').AsInt64;
      { 2007-02-01 }
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[DELang]+chr(13)+
                    nMsgTryAgain[DELang]+nMsgOr[DELang]+nMsgToAdmin[DELang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[DELang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         { 2007-02-01 }
         RxMemoryDataDocEducation.Cancel;
         { 2007-02-01 }
         Exit;
      end;
   end;
end;

function TFrameDocEducation.ProverkaOnExists: integer;
var
   IsMainDocOnExist :integer;
begin
  RxMemoryDataDocEducation.First;
  if RxMemoryDataDocEducation.Eof then
   begin
     ShowMessage(nMsgEmptyDataDocEducation[DELang]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetDocEducation.Show;
     result:=1;
     exit;
   end;


   if RxMemoryDataDocEducation.RecordCount>1 then
   begin
     IsMainDocOnExist:=0;
     RxMemoryDataDocEducation.First;
     while not  RxMemoryDataDocEducation.Eof do
      begin
        if RxMemoryDataDocEducation.FieldValues['IS_MAIN_DOK']=1
         then IsMainDocOnExist:=1;
        RxMemoryDataDocEducation.Next;
      end;
      if IsMainDocOnExist=0 then
      begin
        ShowMessage(nMsgEmptyMainDoc[DELang]);
        TFormPRK_DT_ABIT(self.Owner).TabSheetDocEducation.Show;
        result:=1;
        exit;
      end;
   end;


  result:=0;
end;

function TFrameDocEducation.OnMainDocObrIsNotDovidka: integer;
begin
   if RxMemoryDataDocEducation.RecordCount>1 then
   begin
      RxMemoryDataDocEducation.First;
       while not  RxMemoryDataDocEducation.Eof do
        begin
          if ( (RxMemoryDataDocEducation.FieldValues['IS_MAIN_DOK']=1) and
               (RxMemoryDataDocEducation.FieldValues['IS_DOVIDKA']<>1)    )then
           begin
            result:=1;
            exit;
           end;
          RxMemoryDataDocEducation.Next;
        end;
   end
   else begin
          if RxMemoryDataDocEducation.FieldValues['IS_DOVIDKA']<>1 then
           begin
            result:=1;
            exit;
           end;
   end;

   result:=0;
end;

end.
