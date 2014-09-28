unit uFrameDopDoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet, RxMemDS,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid,uPrK_Resources;

type
  TFrameDopDoc = class(TFrame)
    cxGridPrKDopDoc: TcxGrid;
    cxGridPrKDopDocDBTableView1: TcxGridDBTableView;
    colNAME_TYPE_DOP_DOK: TcxGridDBColumn;
    colSERIA: TcxGridDBColumn;
    colNOMER: TcxGridDBColumn;
    colDATE_VIDACHI: TcxGridDBColumn;
    colNAME_OCENKA: TcxGridDBColumn;
    cxGridPrKDopDocLevel1: TcxGridLevel;
    DataSourceDopDoc: TDataSource;
    RxMemoryDataDopDoc: TRxMemoryData;
    DataSetDopDoc: TpFIBDataSet;
    colNAME_COPY: TcxGridDBColumn;
    colNAME: TcxGridDBColumn;
  private
    StopExecProc    :Boolean;
    DDLang          :integer;
    DDViewColor     :TColor;
    FSelectTextFrameDopDoc: boolean;
    FSelectSQLTextDopDoc: string;
    procedure SetSelectSQLTextDopDoc(const Value: string);
    procedure SetSelectTextFrameDopDoc(const Value: boolean);
    procedure DelDopDocFromBase(id: int64);
    procedure AddChangeDocInBase;
  public
    procedure InicCaptionFrame;
    procedure InicDataFrame(rejim :RejimPrK);
    procedure ADDDopDoc;
    procedure ChangeDopDoc;
    procedure ViewDopDoc;
    procedure DelDopDoc;
    procedure SaveDopDoc;
    property  SelectTextFrameDopDoc :boolean read FSelectTextFrameDopDoc write SetSelectTextFrameDopDoc;
    property  SelectSQLTextDopDoc   :string read FSelectSQLTextDopDoc write SetSelectSQLTextDopDoc;
  end;

implementation
uses
    uPRK_DT_ABIT,uConstants,
    uEditDopDoc,AArray, uFrameVstup;
{$R *.dfm}

{ TFrameDopDoc }

procedure TFrameDopDoc.InicCaptionFrame;
begin
   DDLang     :=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
   DDViewColor:=TFormPRK_DT_ABIT(self.Owner).TextViewColor;

   colNAME_TYPE_DOP_DOK.Caption     :=ncolNAME_DOK_OBR[DDLang];
   colNAME.Caption                  :=ncolNAME[DDLang];
   colSERIA.Caption                 :=ncolSERIA[DDLang];
   colNOMER.Caption                 :=ncolNOMER[DDLang];
   colDATE_VIDACHI.Caption          :=ncolDATE_VIDACHI[DDLang];
   colNAME_OCENKA.Caption           :=ncolOCENKA_NUM[DDLang];
   colNAME_COPY.Caption             :=ncolNAME_IS_COPY[DDLang];
end;

procedure TFrameDopDoc.SetSelectTextFrameDopDoc(const Value: boolean);
begin
  FSelectTextFrameDopDoc := Value;
  if  FSelectTextFrameDopDoc=true then
   begin
      SelectSQLTextDopDoc  :='Select * from PRK_DT_ABIT_DOP_DOK_SELECT(:ID_DT_ABIT)';
   end;
end;

procedure TFrameDopDoc.SetSelectSQLTextDopDoc(const Value: string);
begin
  FSelectSQLTextDopDoc := Value;
  RxMemoryDataDopDoc.Close;
  DataSetDopDoc.Active                          :=false;
    DataSetDopDoc.Database                           := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetDopDoc.Transaction                        := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetDopDoc.SelectSQL.Clear;
    DataSetDopDoc.SQLs.SelectSQL.Text                := FSelectSQLTextDopDoc;
    DataSetDopDoc.ParamByName('ID_DT_ABIT').AsInt64  :=TFormPRK_DT_ABIT(self.Owner).ID_DT_ABIT_GLOBAL;
    DataSetDopDoc.CloseOpen(false);
    DataSetDopDoc.FetchAll;
    RxMemoryDataDopDoc.LoadFromDataSet(DataSetDopDoc,DataSetDopDoc.RecordCount,lmCopy);
end;

procedure TFrameDopDoc.ADDDopDoc;
var
   DataDDAdd :TAArray;
   T:TFormEditDopDoc;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataDDAdd :=TAArray.Create;
   
   DataDDAdd['SHORT_NAME_TYPE_DOP_DOK'].asString :='';
   DataDDAdd['SERIA'].AsString                   :='';
   DataDDAdd['NOMER'].AsString                   :='';
   DataDDAdd['DATE_VIDACHI'].AsVariant           :=date;
   DataDDAdd['NAME'].asString                    :='';
  // DataDDAdd['SHORT_NAME_OCENKA'].asString       :='';
   DataDDAdd['OCENKA_NUM'].AsInteger             :=0;            //***********
   // нужно чтобы выбор оценок был не активен при добавлении
   DataDDAdd['IS_OCENKA'].AsInteger              :=0;
   T := TFormEditDopDoc.Create(self,DataDDAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[DDLang];
   
   if T.ShowModal=MrOk then
    begin
       RxMemoryDataDopDoc.Open;
       RxMemoryDataDopDoc.Insert;
       RxMemoryDataDopDoc.FieldByName('ID_DT_ABIT_DOP_DOK').Value       :=-1;// сделано для отличия от существующих записей в базе
       RxMemoryDataDopDoc.FieldByName('ID_SP_TYPE_DOP_DOK').Value       :=DataDDAdd['ID_SP_TYPE_DOP_DOK'].AsInt64;
       RxMemoryDataDopDoc.FieldByName('SHORT_NAME_TYPE_DOP_DOK').Value  :=DataDDAdd['SHORT_NAME_TYPE_DOP_DOK'].AsString;
       RxMemoryDataDopDoc.FieldByName('SERIA').Value                    :=VarToStr(DataDDAdd['SERIA'].AsString);
       RxMemoryDataDopDoc.FieldByName('NOMER').Value                    :=VarToStr(DataDDAdd['NOMER'].AsString);
       RxMemoryDataDopDoc.FieldByName('DATE_VIDACHI').Value             :=DataDDAdd['DATE_VIDACHI'].AsVariant;
       RxMemoryDataDopDoc.FieldByName('NAME').Value                     :=DataDDAdd['NAME'].AsString;
       RxMemoryDataDopDoc.FieldByName('ID_SP_OCENKA').Value             :=DataDDAdd['ID_SP_OCENKA'].AsInt64;
      // RxMemoryDataDopDoc.FieldByName('SHORT_NAME_OCENKA').Value        :=DataDDAdd['SHORT_NAME_OCENKA'].AsString;
       RxMemoryDataDopDoc.FieldByName('OCENKA_NUM').Value               :=DataDDAdd['OCENKA_NUM'].AsInteger;
       RxMemoryDataDopDoc.FieldByName('ID_SP_IS_COPY').Value            :=DataDDAdd['ID_SP_IS_COPY'].AsInt64;
       RxMemoryDataDopDoc.FieldByName('SHORT_NAME_COPY').Value          :=DataDDAdd['SHORT_NAME_COPY'].AsString;
       RxMemoryDataDopDoc.FieldByName('IS_SPIVBESIDA').Value            :=DataDDAdd['IS_SPIVBESIDA'].AsString;
       RxMemoryDataDopDoc.FieldByName('IS_ZALIK').Value                 :=DataDDAdd['IS_ZALIK'].AsString;
       // ID_SP_PREDM нужен только для PRK_DT_ABIT_DOP_DOK_CHANGE
                 //удалить RxMemoryDataDopDoc.FieldByName('ID_SP_PREDM').Value              :=DataDDAdd['ID_SP_PREDM'].AsInt64;
       RxMemoryDataDopDoc.FieldByName('IS_OCENKA').Value                :=DataDDAdd['IS_OCENKA'].AsInteger;
       try
          RxMemoryDataDopDoc.Post;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[DDLang]+chr(13)+
                        nMsgTryAgain[DDLang]+nMsgOr[DDLang]+nMsgToAdmin[DDLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[DDLang]),MB_OK or MB_ICONWARNING);
             RxMemoryDataDopDoc.Cancel;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
  // Obnovit(DataVLAdd['ID'].AsInt64);
   DataDDAdd.Free;
   DataDDAdd:=Nil;
   if TryAgain=true
      then ADDDopDoc;
end;

procedure TFrameDopDoc.ChangeDopDoc;
var
   DataDDChange :TAArray;
   T:TFormEditDopDoc;
   TryAgain :boolean;
begin  
   TryAgain     :=true;
   DataDDChange :=TAArray.Create;
   DataDDChange['ID_SP_TYPE_DOP_DOK'].AsInt64       :=RxMemoryDataDopDoc.FieldByName('ID_SP_TYPE_DOP_DOK').Value;
   DataDDChange['SHORT_NAME_TYPE_DOP_DOK'].asString :=RxMemoryDataDopDoc.FieldByName('SHORT_NAME_TYPE_DOP_DOK').Value;
   DataDDChange['SERIA'].AsString                   :=VarToStr(RxMemoryDataDopDoc.FieldByName('SERIA').Value);
   DataDDChange['NOMER'].AsString                   :=VarToStr(RxMemoryDataDopDoc.FieldByName('NOMER').Value);
   DataDDChange['DATE_VIDACHI'].AsVariant           :=RxMemoryDataDopDoc.FieldByName('DATE_VIDACHI').Value;
   DataDDChange['NAME'].asString                    :=VarToStr(RxMemoryDataDopDoc.FieldByName('NAME').Value);
   DataDDChange['ID_SP_OCENKA'].AsInt64             :=RxMemoryDataDopDoc.FieldByName('ID_SP_OCENKA').Value;
  // DataDDChange['SHORT_NAME_OCENKA'].asString       :=VarToStr(RxMemoryDataDopDoc.FieldByName('SHORT_NAME_OCENKA').Value);
   DataDDChange['OCENKA_NUM'].AsInteger             :=RxMemoryDataDopDoc.FieldByName('OCENKA_NUM').Value;
   DataDDChange['ID_SP_IS_COPY'].AsInt64            :=RxMemoryDataDopDoc.FieldByName('ID_SP_IS_COPY').Value;
   DataDDChange['SHORT_NAME_COPY'].asString         :=RxMemoryDataDopDoc.FieldByName('SHORT_NAME_COPY').Value;
   // эти параметры нужны только для выбора из справ. Оценок
   DataDDChange['IS_SPIVBESIDA'].AsInteger          :=RxMemoryDataDopDoc.FieldByName('IS_SPIVBESIDA').Value;
   DataDDChange['IS_ZALIK'].AsInteger               :=RxMemoryDataDopDoc.FieldByName('IS_ZALIK').Value;
   // ID_SP_PREDM нужен только для PRK_DT_ABIT_DOP_DOK_CHANGE
             // удалить DataDDChange['ID_SP_PREDM'].AsInt64              :=RxMemoryDataDopDoc.FieldByName('ID_SP_PREDM').Value;
   DataDDChange['IS_OCENKA'].AsInteger              :=RxMemoryDataDopDoc.FieldByName('IS_OCENKA').Value;

   T := TFormEditDopDoc.Create(self,DataDDChange);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[DDLang];

   if T.ShowModal=MrOk then
    begin
       RxMemoryDataDopDoc.Open;
       RxMemoryDataDopDoc.Edit;
       RxMemoryDataDopDoc.FieldByName('ID_SP_TYPE_DOP_DOK').Value       :=DataDDChange['ID_SP_TYPE_DOP_DOK'].AsInt64;
       RxMemoryDataDopDoc.FieldByName('SHORT_NAME_TYPE_DOP_DOK').Value  :=DataDDChange['SHORT_NAME_TYPE_DOP_DOK'].AsString;
       RxMemoryDataDopDoc.FieldByName('SERIA').Value                    :=VarToStr(DataDDChange['SERIA'].AsString);
       RxMemoryDataDopDoc.FieldByName('NOMER').Value                    :=VarToStr(DataDDChange['NOMER'].AsString);
       RxMemoryDataDopDoc.FieldByName('DATE_VIDACHI').Value             :=DataDDChange['DATE_VIDACHI'].AsVariant;
       RxMemoryDataDopDoc.FieldByName('NAME').Value                     :=DataDDChange['NAME'].AsString;
       RxMemoryDataDopDoc.FieldByName('ID_SP_OCENKA').Value             :=DataDDChange['ID_SP_OCENKA'].AsInt64;
       RxMemoryDataDopDoc.FieldByName('OCENKA_NUM').Value               :=DataDDChange['OCENKA_NUM'].AsInteger;
       RxMemoryDataDopDoc.FieldByName('ID_SP_IS_COPY').Value            :=DataDDChange['ID_SP_IS_COPY'].AsInt64;
       RxMemoryDataDopDoc.FieldByName('SHORT_NAME_COPY').Value          :=DataDDChange['SHORT_NAME_COPY'].AsString;
       RxMemoryDataDopDoc.FieldByName('IS_SPIVBESIDA').Value            :=DataDDChange['IS_SPIVBESIDA'].AsString;
       RxMemoryDataDopDoc.FieldByName('IS_ZALIK').Value                 :=DataDDChange['IS_ZALIK'].AsString;
       // ID_SP_PREDM нужен только для PRK_DT_ABIT_DOP_DOK_CHANGE
               // удалить RxMemoryDataDopDoc.FieldByName('ID_SP_PREDM').Value              :=DataDDChange['ID_SP_PREDM'].AsInt64;
       RxMemoryDataDopDoc.FieldByName('IS_OCENKA').Value                :=DataDDChange['IS_OCENKA'].AsInteger;
       try
          RxMemoryDataDopDoc.Post;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[DDLang]+chr(13)+
                        nMsgTryAgain[DDLang]+nMsgOr[DDLang]+nMsgToAdmin[DDLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[DDLang]),MB_OK or MB_ICONWARNING);
             RxMemoryDataDopDoc.Cancel;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
  // Obnovit(DataVLAdd['ID'].AsInt64);
   DataDDChange.Free;
   DataDDChange:=Nil;
   {if TryAgain=true
      then ChangeDocEduc;} //{проверить это,т.к. это было в док. об обр.} отменено потому что при возникновении ошибки не возможно с позицироваться из-за проверок
end;

procedure TFrameDopDoc.ViewDopDoc;
var
   DataDDView :TAArray;
   T:TFormEditDopDoc;
begin
       DataDDView :=TAArray.Create;
       DataDDView['SHORT_NAME_TYPE_DOP_DOK'].asString :=RxMemoryDataDopDoc.FieldByName('SHORT_NAME_TYPE_DOP_DOK').Value;
       DataDDView['SERIA'].AsString                   :=VarToStr(RxMemoryDataDopDoc.FieldByName('SERIA').Value);
       DataDDView['NOMER'].AsString                   :=VarToStr(RxMemoryDataDopDoc.FieldByName('NOMER').Value);
       DataDDView['DATE_VIDACHI'].AsVariant           :=RxMemoryDataDopDoc.FieldByName('DATE_VIDACHI').Value;
       DataDDView['NAME'].asString                    :=VarToStr(RxMemoryDataDopDoc.FieldByName('NAME').Value);
       DataDDView['OCENKA_NUM'].AsInteger             :=RxMemoryDataDopDoc.FieldByName('OCENKA_NUM').Value;
       DataDDView['SHORT_NAME_COPY'].asString         :=RxMemoryDataDopDoc.FieldByName('SHORT_NAME_COPY').Value;
       DataDDView['IS_OCENKA'].AsInteger              :=RxMemoryDataDopDoc.FieldByName('IS_OCENKA').Value;
       T:=TFormEditDopDoc.Create(self,DataDDView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[DDLang];
       T.cxButtonEditTypeDoc.Properties.ReadOnly    :=true;
       T.cxButtonEditTypeDoc.Properties.Buttons[0].Visible   :=false;
       T.cxLookupComboBoxOcenka.Properties.ReadOnly     :=true;
      // T.cxLookupComboBoxOcenka.Properties..Buttons[0].Visible    :=false;

       T.cxTextEditSeria.Properties.ReadOnly        :=true;
       T.cxTextEditNomer.Properties.ReadOnly        :=true;
       T.cxDateEditDATE_VIDACHI.Properties.ReadOnly :=true;
       T.cxTextEditName.Properties.ReadOnly         :=true;
       T.cxLookupComboBoxCopy.Properties.ReadOnly   :=true;


       T.cxButtonEditTypeDoc.Style.Color            :=DDViewColor;
       T.cxLookupComboBoxOcenka.Style.Color             :=DDViewColor;
       T.cxTextEditSeria.Style.Color                :=DDViewColor;
       T.cxTextEditNomer.Style.Color                :=DDViewColor;
       T.cxDateEditDATE_VIDACHI.Style.Color         :=DDViewColor;
       T.cxTextEditName.Style.Color                 :=DDViewColor;
       T.cxLookupComboBoxCopy.Style.Color           :=DDViewColor;


       T.ShowModal;
       T.Free;
       T:=nil;
       DataDDView.Free;
       DataDDView:=nil;
end;

procedure TFrameDopDoc.DelDopDoc;
begin
  if prkMessageDlg(nMsgBoxTitle[DDLang],nMsgDel[DDLang],
                    mtInformation,mbOKCancel,DDLang)=mrOK
    then RxMemoryDataDopDoc.Delete;  
end;

procedure TFrameDopDoc.SaveDopDoc;
var
  CanDelDoc: Boolean;
begin
  StopExecProc:=false;
//----------------Удаление--------------------\\
  //if DataSetDopDoc.a
 if DataSetDopDoc.Active=true
  then DataSetDopDoc.first;
  
  while not  DataSetDopDoc.Eof do
  begin
    CanDelDoc:=true;
    RxMemoryDataDopDoc.First;
    while not  RxMemoryDataDopDoc.Eof do
    begin

      if  DataSetDopDoc.FieldValues['ID_DT_ABIT_DOP_DOK']=RxMemoryDataDopDoc.FieldValues['ID_DT_ABIT_DOP_DOK']
          then   CanDelDoc:=false;
      RxMemoryDataDopDoc.Next;
    end;
    if CanDelDoc=true
       then DelDopDocFromBase(DataSetDopDoc.FieldValues['ID_DT_ABIT_DOP_DOK']);
     // Проверка на ошибку выполнения транзакции
    if StopExecProc=true then
      begin
       TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
       exit;
      end;
    DataSetDopDoc.Next;
  end;

  //----------------Добавление&Редактирование--------------------\\
  if RxMemoryDataDopDoc.Active=true
   then RxMemoryDataDopDoc.First;
    while not  RxMemoryDataDopDoc.Eof do
    begin
       AddChangeDocInBase;  // Добавление и редактирование по -1 Id-шнику в хранимой процедуре  отличается
      // Проверка на ошибку выполнения транзакции
      if StopExecProc=true then
        begin
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         exit;
        end;
      RxMemoryDataDopDoc.Next;
    end;

end;

procedure TFrameDopDoc.DelDopDocFromBase(id: int64);
begin
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_DOP_DOK_DEL';
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT_DOP_DOK').AsInt64   :=id;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64              :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
   try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[DDLang]+chr(13)+
                    nMsgTryAgain[DDLang]+nMsgOr[DDLang]+nMsgToAdmin[DDLang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[DDLang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         Exit;
      end;
   end;
end;

procedure TFrameDopDoc.AddChangeDocInBase;
begin
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_ABIT_DOP_DOK_CHANGE';
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT').AsInt64           :=TFormPRK_DT_ABIT(self.Owner).ID_ABIT_OUT;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_ABIT_DOP_DOK').AsInt64   :=RxMemoryDataDopDoc.FieldValues['ID_DT_ABIT_DOP_DOK'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_TYPE_DOP_DOK').AsInt64   :=RxMemoryDataDopDoc.FieldValues['ID_SP_TYPE_DOP_DOK'];
           // удалить TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_PREDM').AsInt64          :=RxMemoryDataDopDoc.FieldValues['ID_SP_PREDM'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('SERIA').AsString               :=VarToStr(RxMemoryDataDopDoc.FieldValues['SERIA']);
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('NOMER').AsString               :=VarToStr(RxMemoryDataDopDoc.FieldValues['NOMER']);
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('DATE_VIDACHI').AsDate          :=RxMemoryDataDopDoc.FieldValues['DATE_VIDACHI'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('NAME').AsString                :=VarToStr(RxMemoryDataDopDoc.FieldValues['NAME']);
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_OCENKA').AsInt64         :=RxMemoryDataDopDoc.FieldValues['ID_SP_OCENKA'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_IS_COPY').AsInt64        :=RxMemoryDataDopDoc.FieldValues['ID_SP_IS_COPY'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64              :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
   try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
      { 2007-02-01 }
       RxMemoryDataDopDoc.Edit;
       RxMemoryDataDopDoc.FieldByName('ID_DT_ABIT_DOP_DOK').Value :=TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.FieldByName('ID_OUT').AsInt64;
      { 2007-02-01 }
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[DDLang]+chr(13)+
                    nMsgTryAgain[DDLang]+nMsgOr[DDLang]+nMsgToAdmin[DDLang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[DDLang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         { 2007-02-01 }
         RxMemoryDataDopDoc.Cancel;
         { 2007-02-01 }
         Exit;
      end;
   end;
end;

procedure TFrameDopDoc.InicDataFrame(rejim: RejimPrK);
begin
  if rejim=ViewPrK then
   begin
       TFormPRK_DT_ABIT(self.Owner).ActionADDDD.Enabled       :=false;
       TFormPRK_DT_ABIT(self.Owner).ActionChangeDD.Enabled    :=false;
       TFormPRK_DT_ABIT(self.Owner).ActionDELDD.Enabled       :=false;
   end;
end;

end.
