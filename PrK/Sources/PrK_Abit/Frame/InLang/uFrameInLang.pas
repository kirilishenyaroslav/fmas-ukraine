unit uFrameInLang;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, RxMemDS,uPrK_Resources;

type
  TFrameInLang = class(TFrame)
    cxGridPrKInLang: TcxGrid;
    cxGridPrKInLangDBTableView1: TcxGridDBTableView;
    colNAME_IN_LANG: TcxGridDBColumn;
    colNAME_LEVEL_VLADEN: TcxGridDBColumn;
    cxGridPrKInLangLevel1: TcxGridLevel;
    DataSourceInLang: TDataSource;
    RxMemoryDataInLang: TRxMemoryData;
    DataSetInLang: TpFIBDataSet;
  private
    StopExecProc    :Boolean;
    ILLang          :integer;
    ILViewColor     :TColor;
    FSelectTextFrameInLang: boolean;
    FSelectSQLTextInLang: string;
    procedure SetSelectTextFrameInLang(const Value: boolean);
    procedure SetSelectSQLTextInLang(const Value: string);
    procedure ChangeInLangInBase;
    procedure DelInLangFromBase(id: int64);
    procedure AddInLangInBase;
  public
    procedure ADDInLAng;
    procedure ChangeInLAng;
    procedure ViewInLAng;
    procedure DELInLAng;
    procedure InicCaptionFrame;
    procedure InicDataFrame(rejim :RejimPrK);
    function  ProverkaOnExists       :integer;
    procedure SaveInLang;
    property  SelectTextFrameInLang :boolean read FSelectTextFrameInLang write SetSelectTextFrameInLang;
    property  SelectSQLTextInLang   :string read FSelectSQLTextInLang write SetSelectSQLTextInLang;
  end;

implementation
uses
    uPRK_DT_ABIT,uConstants, AArray,uEditInLang;
{$R *.dfm}

{ TFrameInLang }

procedure TFrameInLang.InicCaptionFrame;
begin
   ILLang     :=TFormPRK_DT_ABIT(self.Owner).IndLangAbit;
   ILViewColor:=TFormPRK_DT_ABIT(self.Owner).TextViewColor;

   colNAME_IN_LANG.Caption        :=ncolIN_LANG[ILLang];
   colNAME_LEVEL_VLADEN.Caption   :=ncolLEVEL_VLADEN[ILLang];
end;

procedure TFrameInLang.SetSelectTextFrameInLang(const Value: boolean);
begin
  FSelectTextFrameInLang := Value;
  if  FSelectTextFrameInLang=true then
   begin
      SelectSQLTextInLang  :='Select * from PRK_DT_IN_LANG_SELECT(:ID_MAN)';
   end;
end;

procedure TFrameInLang.SetSelectSQLTextInLang(const Value: string);
begin
  FSelectSQLTextInLang := Value;
  RxMemoryDataInLang.Close;
  DataSetInLang.Active                          :=false;
    DataSetInLang.Database                           := TFormPRK_DT_ABIT(self.Owner).DataBasePrK_ABIT;
    DataSetInLang.Transaction                        := TFormPRK_DT_ABIT(self.Owner).TransactionReadPrK_ABIT;
    DataSetInLang.SelectSQL.Clear;
    DataSetInLang.SQLs.SelectSQL.Text                := FSelectSQLTextInLang;
    DataSetInLang.ParamByName('ID_MAN').AsInt64      :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
    DataSetInLang.CloseOpen(false);
    DataSetInLang.FetchAll;
    RxMemoryDataInLang.LoadFromDataSet(DataSetInLang,DataSetInLang.RecordCount,lmCopy);
end;

procedure TFrameInLang.ADDInLAng;
var
   DataILAdd :TAArray;
   T:TFormEditInLang;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataILAdd :=TAArray.Create;

   DataILAdd['SHORT_NAME_IN_LANG'].asString       :='';
   DataILAdd['SHORT_NAME_LEVEL_VLADEN'].asString  :='';

   T := TFormEditInLang.Create(self,DataILAdd);

   T.Caption :=nFormKlassSpravEdit_Add[ILLang];
   
   if T.ShowModal=MrOk then
    begin
       RxMemoryDataInLang.Open;
       RxMemoryDataInLang.Insert;
       RxMemoryDataInLang.FieldByName('ID_DT_IN_LANG').Value             :=-1;// сделано для отличия от существующих записей в базе
       RxMemoryDataInLang.FieldByName('ID_SP_IN_LANG').Value             :=DataILAdd['ID_SP_IN_LANG'].AsInt64;
       RxMemoryDataInLang.FieldByName('SHORT_NAME_IN_LANG').Value        :=DataILAdd['SHORT_NAME_IN_LANG'].AsString;
       RxMemoryDataInLang.FieldByName('ID_SP_LEVEL_VLADEN').Value        :=DataILAdd['ID_SP_LEVEL_VLADEN'].AsInt64;
       RxMemoryDataInLang.FieldByName('SHORT_NAME_LEVEL_VLADEN').Value   :=DataILAdd['SHORT_NAME_LEVEL_VLADEN'].AsString;
       try
          RxMemoryDataInLang.Post;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[ILLang]+chr(13)+
                        nMsgTryAgain[ILLang]+nMsgOr[ILLang]+nMsgToAdmin[ILLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[ILLang]),MB_OK or MB_ICONWARNING);
             RxMemoryDataInLang.Cancel;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   DataILAdd.Free;
   DataILAdd:=Nil;
   if TryAgain=true
      then ADDInLAng;
end;

procedure TFrameInLang.ChangeInLAng;
var
   DataILChange :TAArray;
   T:TFormEditInLang;
   TryAgain :boolean;
begin  
   TryAgain     :=true;
   DataILChange :=TAArray.Create;
   DataILChange['ID_SP_IN_LANG'].AsInt64              :=RxMemoryDataInLang.FieldByName('ID_SP_IN_LANG').Value;
   DataILChange['SHORT_NAME_IN_LANG'].asString        :=RxMemoryDataInLang.FieldByName('SHORT_NAME_IN_LANG').Value;
   DataILChange['ID_SP_LEVEL_VLADEN'].AsInt64         :=RxMemoryDataInLang.FieldByName('ID_SP_LEVEL_VLADEN').Value;
   DataILChange['SHORT_NAME_LEVEL_VLADEN'].asString   :=RxMemoryDataInLang.FieldByName('SHORT_NAME_LEVEL_VLADEN').Value;

   T := TFormEditInLang.Create(self,DataILChange);

   T.Caption :=nFormKlassSpravEdit_Change[ILLang];

   if T.ShowModal=MrOk then
    begin
       RxMemoryDataInLang.Open;
       RxMemoryDataInLang.Edit;
       RxMemoryDataInLang.FieldByName('ID_DT_IN_LANG').Value             :=-1;// сделано для отличия от существующих записей в базе
       RxMemoryDataInLang.FieldByName('ID_SP_IN_LANG').Value             :=DataILChange['ID_SP_IN_LANG'].AsInt64;
       RxMemoryDataInLang.FieldByName('SHORT_NAME_IN_LANG').Value        :=DataILChange['SHORT_NAME_IN_LANG'].AsString;
       RxMemoryDataInLang.FieldByName('ID_SP_LEVEL_VLADEN').Value        :=DataILChange['ID_SP_LEVEL_VLADEN'].AsInt64;
       RxMemoryDataInLang.FieldByName('SHORT_NAME_LEVEL_VLADEN').Value   :=DataILChange['SHORT_NAME_LEVEL_VLADEN'].AsString;
       try
          RxMemoryDataInLang.Post;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[ILLang]+chr(13)+
                        nMsgTryAgain[ILLang]+nMsgOr[ILLang]+nMsgToAdmin[ILLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[ILLang]),MB_OK or MB_ICONWARNING);
             RxMemoryDataInLang.Cancel;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
  // Obnovit(DataVLAdd['ID'].AsInt64);
   DataILChange.Free;
   DataILChange:=Nil;
end;

procedure TFrameInLang.ViewInLAng;
var
   DataILView :TAArray;
   T:TFormEditInLang;
begin
       DataILView :=TAArray.Create;
       DataILView['SHORT_NAME_IN_LANG'].asString        :=RxMemoryDataInLang.FieldByName('SHORT_NAME_IN_LANG').Value;
       DataILView['SHORT_NAME_LEVEL_VLADEN'].asString   :=RxMemoryDataInLang.FieldByName('SHORT_NAME_LEVEL_VLADEN').Value;
       T:=TFormEditInLang.Create(self,DataILView);

       T.Caption  :=nFormKlassSpravEdit_View[IlLang];
       T.cxButtonEditIN_LANG.Properties.ReadOnly          :=true;
       T.cxButtonEditIN_LANG.Properties.Buttons[0].Visible         :=false;
       T.cxButtonEditLEVEL_VLADEN.Properties.ReadOnly     :=true;
       T.cxButtonEditLEVEL_VLADEN.Properties.Buttons[0].Visible    :=false;




       T.cxButtonEditIN_LANG.Style.Color            :=ILViewColor;
       T.cxButtonEditLEVEL_VLADEN.Style.Color       :=ILViewColor;


       T.ShowModal;
       T.Free;
       T:=nil;
       DataILView.Free;
       DataILView:=nil;
end;

procedure TFrameInLang.DELInLAng;
begin
   if prkMessageDlg(nMsgBoxTitle[ILLang],nMsgDel[ILLang],
                    mtInformation,mbOKCancel,ILLang)=mrOK
    then RxMemoryDataInLang.Delete;
end;

procedure TFrameInLang.SaveInLang;
var
  CanDelInLang: Boolean;
begin
  StopExecProc:=false;
//----------------Удаление&Редактирование--------------------\\
  DataSetInLang.first;
  while not  DataSetInLang.Eof do
  begin
    CanDelInLang:=true;
    RxMemoryDataInLang.First;
    while not  RxMemoryDataInLang.Eof do
    begin
      if  DataSetInLang.FieldValues['ID_DT_IN_LANG']=RxMemoryDataInLang.FieldValues['ID_DT_IN_LANG']
          then begin
           CanDelInLang:=false;
           ChangeInLangInBase;
            // Проверка на ошибку выполнения транзакции
           if StopExecProc=true then
            begin
             TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
             exit;
            end;
          end;
      RxMemoryDataInLang.Next;
    end;
    if CanDelInLang=true
       then DelInLangFromBase(DataSetInLang.FieldValues['ID_DT_IN_LANG']);
     // Проверка на ошибку выполнения транзакции
    if StopExecProc=true then
      begin
       TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
       exit;
      end;
    DataSetInLang.Next;
  end;

//----------------Добавление--------------------\\
  RxMemoryDataInLang.First;
    while not  RxMemoryDataInLang.Eof do
    begin
      if RxMemoryDataInLang.FieldValues['ID_DT_IN_LANG']=-1
          then  AddInLangInBase;
      // Проверка на ошибку выполнения транзакции
      if StopExecProc=true then
        begin
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         exit;
        end;
      RxMemoryDataInLang.Next;
    end;

end;

procedure TFrameInLang.DelInLangFromBase(id: int64);
begin
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_IN_LANG_DEL';
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_IN_LANG').AsInt64    :=id;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64          :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
   try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[ILLang]+chr(13)+
                    nMsgTryAgain[ILLang]+nMsgOr[ILLang]+nMsgToAdmin[ILLang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[ILLang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         Exit;
      end;
   end;
end;

procedure TFrameInLang.ChangeInLangInBase;
begin
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_IN_LANG_CHANGE';
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_DT_IN_LANG').AsInt64      :=RxMemoryDataInLang.FieldValues['ID_DT_IN_LANG'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_MAN').AsInt64             :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_IN_LANG').AsInt64      :=RxMemoryDataInLang.FieldValues['ID_SP_IN_LANG'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_LEVEL_VLADEN').AsInt64 :=RxMemoryDataInLang.FieldValues['ID_SP_LEVEL_VLADEN'];
  TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64            :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
   try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[ILLang]+chr(13)+
                    nMsgTryAgain[ILLang]+nMsgOr[ILLang]+nMsgToAdmin[ILLang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[ILLang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         Exit;
      end;
   end;
end;

procedure TFrameInLang.AddInLangInBase;
begin
   TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.StoredProcName:='PRK_DT_IN_LANG_ADD';
   TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Prepare;
   TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_MAN').AsInt64             :=TFormPRK_DT_ABIT(self.Owner).ResultArray['AbitData']['ID_MAN'].AsInt64;
   TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_IN_LANG').AsInt64      :=RxMemoryDataInLang.FieldValues['ID_SP_IN_LANG'];
   TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_SP_LEVEL_VLADEN').AsInt64 :=RxMemoryDataInLang.FieldValues['ID_SP_LEVEL_VLADEN'];
   TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ParamByName('ID_USER').AsInt64            :=TFormPRK_DT_ABIT(self.Owner).ID_USER_GLOBAL;
    try
      TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.ExecProc;
      { 2007-02-01 }
       RxMemoryDataInLang.Edit;
       RxMemoryDataInLang.FieldByName('ID_DT_IN_LANG').Value :=TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.FieldByName('ID_OUT').AsInt64;
      { 2007-02-01 }
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[ILLang]+chr(13)+
                    nMsgTryAgain[ILLang]+nMsgOr[ILLang]+nMsgToAdmin[ILLang]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[ILLang]),MB_OK or MB_ICONWARNING);
         TFormPRK_DT_ABIT(self.Owner).StoredProcPrK_ABIT.Transaction.Rollback;
         TFormPRK_DT_ABIT(self.Owner).CanCommitAbitTr:=false;
         StopExecProc:=true;
         { 2007-02-01 }
         RxMemoryDataInLang.Cancel;
         { 2007-02-01 }
         Exit;
      end;
   end;
end;

function TFrameInLang.ProverkaOnExists: integer;
begin
  RxMemoryDataInLang.First;
  if RxMemoryDataInLang.Eof then
   begin
     ShowMessage(nMsgEmptyDataInLang[ILLang]);
     TFormPRK_DT_ABIT(self.Owner).TabSheetOcenki.Show;
     result:=1;
     exit;
   end;

   result:=0;
end;

procedure TFrameInLang.InicDataFrame(rejim: RejimPrK);
begin
  if rejim=ViewPrK then
   begin
       TFormPRK_DT_ABIT(self.Owner).ActionADDIL.Enabled       :=false;
       TFormPRK_DT_ABIT(self.Owner).ActionChangeIL.Enabled    :=false;
       TFormPRK_DT_ABIT(self.Owner).ActionDELIL.Enabled       :=false;
   end;
end;

end.
