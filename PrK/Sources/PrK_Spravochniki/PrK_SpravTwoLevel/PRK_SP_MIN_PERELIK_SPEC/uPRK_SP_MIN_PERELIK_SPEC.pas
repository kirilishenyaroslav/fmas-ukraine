unit uPRK_SP_MIN_PERELIK_SPEC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uPrK_SpravTwoLevel, cxGraphics, dxBar, dxBarExtItems, DB,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ImgList, ActnList, cxStyles, cxControls,
  dxStatusBar, cxCustomData, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL,
  cxTLData,uPrK_Resources, cxLabel, cxTextEdit, cxSplitter, cxGroupBox,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid;

type
  TFormPRK_SP_MIN_PERELIK_SPEC = class(TFormPrK_SpravTwoLevel)
    cxGroupBoxNapr: TcxGroupBox;
    cxDBTreeListPrKSpravTwoLevelNAPR: TcxDBTreeList;
    colNAME: TcxDBTreeListColumn;
    colSHORT_NAME: TcxDBTreeListColumn;
    colSHIFR: TcxDBTreeListColumn;
    colKOD: TcxDBTreeListColumn;
    colNPP: TcxDBTreeListColumn;
    cxSplitterNapr: TcxSplitter;
    cxGroupBoxSpec: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    cxGridPrKSpravSpec: TcxGrid;
    cxGridPrKSpravSpecDBTableView1: TcxGridDBTableView;
    colNAME_SPEC: TcxGridDBColumn;
    colSHORT_NAME_SPEC: TcxGridDBColumn;
    colKOD_SPEC: TcxGridDBColumn;
    colNPP_SPEC: TcxGridDBColumn;
    cxGridPrKSpravSpecLevel1: TcxGridLevel;
    dxBarLargeButtonAddSpec: TdxBarLargeButton;
    ActionAddSpec: TAction;
    DataSetSpec: TpFIBDataSet;
    DataSourceSpec: TDataSource;
    colSHORT_NAME_PRIM: TcxGridDBColumn;
    ActionChangeSpec: TAction;
    ActionDelSpec: TAction;
    ActionViewSpec: TAction;
    dxBarLargeButtonChangeSpec: TdxBarLargeButton;
    dxBarLargeButtonDelSpec: TdxBarLargeButton;
    dxBarLargeButtonViewSpec: TdxBarLargeButton;
    DataSetSpecForAdd: TpFIBDataSet;
    procedure FormCreate(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure cxDBTreeListPrKSpravTwoLevelNAPRDblClick(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionAddSpecExecute(Sender: TObject);
    procedure ActionChangeSpecExecute(Sender: TObject);
    procedure ActionViewSpecExecute(Sender: TObject);
    procedure ActionDelSpecExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure DataSetPrKSpravAfterScroll(DataSet: TDataSet);
    procedure DataSetSpecAfterScroll(DataSet: TDataSet);
    procedure cxGridPrKSpravSpecDBTableView1DblClick(Sender: TObject);
  private
    StoredProcAddNameSPEC     : String;
    StoredProcChangeNameSPEC  : String;
    StoredProcDelNameSPEC     : String;
    ID_NAME_MIN_PERELIK_SPEC  : String;
    FSelectSQLTextSpec: String;
    procedure InicCaption; override;
    procedure AddSecLevFormShow;
    procedure ObnovitSPEC(id_obnovit: int64);
    procedure SetSelectSQLTextSpec(const Value: String);
  public
    Property SelectSQLTextSpec  :String read FSelectSQLTextSpec write SetSelectSQLTextSpec;
  end;

type
  TDataPrKSpravMinNapr=class(TDataPrKSprav)
  private
    FSHIFR: string;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer;aNpp: Integer;
                       aSHIFR :String);overload;
    procedure SetSHIFR(const Value: string);
  public
    property SHIFR :string read FSHIFR write SetSHIFR;
  end;

type
  TDataPrKSpravMinPerelikSpec=class(TDataPrKSprav)
  private
    FIdMinPerelikPRIM: Int64;
    FShortNamePRIM: String;
    constructor Create(aKodMax: Integer;aNppMax: Integer);overload;override;
    constructor Create(aId:int64; aName:String; aShortName:String;
                       aKod:Integer; aNpp: Integer;
                       aIdMinPerelikPRIM : Int64; aShortNamePRIM:String);overload;
    procedure SetIdMinPerelikPRIM(const Value: Int64);
    procedure SetShortNamePRIM(const Value: String);
  public
    property IdMinPerelikPRIM :Int64 read FIdMinPerelikPRIM write SetIdMinPerelikPRIM;
    property ShortNamePRIM    :String read FShortNamePRIM write SetShortNamePRIM;
  end;

var
  FormPRK_SP_MIN_PERELIK_SPEC: TFormPRK_SP_MIN_PERELIK_SPEC;

implementation
uses uConstants,uPrKKlassSprav,uPrKSpravEditMIN_TYPE_NAPR,
     uPrKSpravEditMIN_TYPE_NAPR_ForAdd,uPrKSpravEditMIN_PERELIK_SPEC;
{$R *.dfm}

procedure TFormPRK_SP_MIN_PERELIK_SPEC.FormCreate(Sender: TObject);
begin
  {Используется другая спецификация названий для объектов формы,
   т.к. в для двухуровневого справ. используются объекты базы данных с
   суффиксом NAPR, объекты формы относящиеся к SPEC должны быть поименованы с другой
   спецификацией}
  inherited;
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME                  :='KEY_FIELD';
  ID_NAME_FIRST_LEVEL      :='ID_SP_MIN_TYPE_NAPR';
  ID_NAME_SECOND_LEVEL     :='ID_SP_MIN_NAPR';
  ID_NAME_MIN_PERELIK_SPEC :='ID_SP_MIN_PERELIK_SPEC';
  ShowNpp              := false;
  StoredProcAddNameFirstLevel     :='PRK_SP_MIN_TYPE_NAPR_ADD';
  StoredProcChangeNameFirstLevel  :='PRK_SP_MIN_TYPE_NAPR_CHANGE';
  StoredProcDelNameFirstLevel     :='PRK_SP_MIN_TYPE_NAPR_DEL';
  StoredProcAddNameSecondLevel    :='PRK_SP_MIN_NAPR_ADD';
  StoredProcChangeNameSecondLevel :='PRK_SP_MIN_NAPR_CHANGE';
  StoredProcDelNameSecondLevel    :='PRK_SP_MIN_NAPR_DEL';

  StoredProcAddNameSPEC          :='PRK_SP_MIN_PERELIK_SPEC_ADD';
  StoredProcChangeNameSPEC       :='PRK_SP_MIN_PERELIK_SPEC_CHANGE';
  StoredProcDelNameSPEC          :='PRK_SP_MIN_PERELIK_SPEC_DEL';

  CaptionFirstLevel    :=nCaptionFirstLevelNapr[IndexLanguage];
  CaptionSecondLevel   :=nCaptionSecondLevelNapr[IndexLanguage];

  SelectSQLText        :='Select * from PRK_SP_MIN_NAPR_TREE_SELECT';
  SelectSQLTextSpec    :='Select * from PRK_SP_MIN_PERELIK_SPEC_SELECT where ?Mas_ID_SP_MIN_NAPR=ID_SP_MIN_NAPR';

  NamePrKSpravEdit     := PrKSpravEditFobProt;// возможно это не надо будет

  InicFormCaption      := nFormPRK_SP_MIN_PERELIK_SPEC_Caption[IndexLanguage];

  DataSetSpecForAdd.Active :=false;
  DataSetSpecForAdd.Database             := DataBasePrKSprav;
  DataSetSpecForAdd.Transaction          := TransactionReadPrKSprav;
  DataSetSpecForAdd.SelectSQL.Clear;
  DataSetSpecForAdd.SQLs.SelectSQL.Text  :='Select * from PRK_SP_MIN_PERELIK_SPEC_SELECT';
  DataSetSpecForAdd.CloseOpen(false);

  dxBarLargeButtonPrint.Visible :=ivNever;
  ActionPrint.Enabled           :=false;
  ActionPrint.Visible           :=false;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.InicCaption;
begin
    inherited;
    if ShowNpp=true then colNPP.Visible:=true;
    colNAME.Caption.Text        :=nColName[IndexLanguage];
    colSHORT_NAME.Caption.Text  :=nColShortName[IndexLanguage];
    colKOD.Caption.Text         :=nColKod[IndexLanguage];
    colNPP.Caption.Text         :=nColNpp[IndexLanguage];
    colSHIFR.Caption.Text       :=ncolSHIFR[IndexLanguage];

    colNAME_SPEC.Caption        :=nColName[IndexLanguage];
    colSHORT_NAME_SPEC.Caption  :=nColShortName[IndexLanguage];
    colSHORT_NAME_PRIM.Caption  :=nColSHORT_NAME_PRIM[IndexLanguage];
    colKOD_SPEC.Caption         :=nColKod[IndexLanguage];
    colNPP_SPEC.Caption         :=nColNpp[IndexLanguage];

    ActionAddSpec.Caption       :=nAction_Add[IndexLanguage];
    ActionChangeSpec.Caption    :=nAction_Change[IndexLanguage];
    ActionDelSpec.Caption       :=nAction_Del[IndexLanguage];
    ActionViewSpec.Caption      :=nAction_View[IndexLanguage];

    ActionAddSpec.Hint          :=nHintAction_Add[IndexLanguage];
    ActionChangeSpec.Hint       :=nHintAction_Change[IndexLanguage];
    ActionDelSpec.Hint          :=nHintAction_Del[IndexLanguage];
    ActionViewSpec.Hint         :=nHintAction_View[IndexLanguage];

    cxGroupBoxNapr.Caption      :=ncxGroupBoxNapr[IndexLanguage];
    cxGroupBoxSpec.Caption      :=ncxGroupBoxSpec[IndexLanguage];


end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionADDExecute(Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravMinNapr;
   T:TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd;
   TryAgain      :boolean;
   Parent_Id     :Int64;
begin
  if StoredProcAddName=StoredProcAddNameFirstLevel then
   begin
       TryAgain      :=false;
       DataPrKSpravAdd:=TDataPrKSpravMinNapr.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                                    StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
       if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
          then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

       T := TFormPrKSpravEditMIN_TYPE_NAPR_ForAdd.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage]+CaptionEditForm;
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible          :=true;
          T.cxTextEditNPP.Visible       :=true;
          T.cxLabelNPPSecLev.Visible    :=true;
          T.cxTextEditNppSecLev.Visible :=true;
        end;
       T.cxTextEditKodSecLev.Text := DataSetPrKSprav.FieldValues['KOD_MAX_TWO_LEVEL']+1;
       T.cxTextEditNppSecLev.Text := DataSetPrKSprav.FieldValues['NPP_MAX_TWO_LEVEL']+1;
       if T.ShowModal=MrOk then
        begin
           StoredProcPrKSprav.Transaction.StartTransaction;
           StoredProcPrKSprav.StoredProcName:=StoredProcAddNameFirstLevel;
           StoredProcPrKSprav.Prepare;
           StoredProcPrKSprav.ParamByName('NAME').AsString       :=DataPrKSpravAdd.Name;
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString :=DataPrKSpravAdd.ShortName;
           StoredProcPrKSprav.ParamByName('KOD').AsInteger       :=DataPrKSpravAdd.Kod;
           StoredProcPrKSprav.ParamByName('NPP').AsInteger       :=DataPrKSpravAdd.Npp;
           StoredProcPrKSprav.ParamByName('SHIFR').AsString      :=DataPrKSpravAdd.SHIFR;
           try
              StoredProcPrKSprav.ExecProc;
              Parent_Id:=StoredProcPrKSprav.FieldByName('ID_OUT').AsInt64;
              DataPrKSpravAdd.Id:=Parent_Id;
              StoredProcPrKSprav.StoredProcName:=StoredProcAddNameSecondLevel;
              StoredProcPrKSprav.ParamByName('NAME').AsString            :=T.cxTextEditNameSecLev.Text;
              StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString      :=T.cxTextEditShortNameSecLev.Text;
              StoredProcPrKSprav.ParamByName('KOD').AsInteger            :=StrToInt(T.cxTextEditKodSecLev.Text);
              StoredProcPrKSprav.ParamByName('NPP').AsInteger            :=StrToInt(T.cxTextEditNppSecLev.Text);
              StoredProcPrKSprav.ParamByName('SHIFR').AsString           :=T.cxTextEditSHIFRSecLev.Text;
              StoredProcPrKSprav.ParamByName(ID_NAME_FIRST_LEVEL).AsInt64:=Parent_Id;
              try
                StoredProcPrKSprav.ExecProc;
                StoredProcPrKSprav.Transaction.commit;
                except on e: Exception do
                 begin
                   MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                              nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                              e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                   StoredProcPrKSprav.Transaction.Rollback;
                   TryAgain:=true;
                 end;
              end;
            except on e: Exception do
             begin
               MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                          nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                          e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
               StoredProcPrKSprav.Transaction.Rollback;
               TryAgain:=true;
             end;
           end;
        end
        else begin
          if StoredProcPrKSprav.Transaction.Active=true
            then StoredProcPrKSprav.Transaction.Rollback;
        end;
       T.Free;
       T:=nil;
       Obnovit(DataPrKSpravAdd.Id);
       DataSetSpec.CloseOpen(false);
       DataPrKSpravAdd.Free;
       DataPrKSpravAdd:=nil;
       if TryAgain=true
          then ActionADDExecute(Sender);
   end
   else AddSecLevFormShow;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.AddSecLevFormShow;
var
   DataPrKSpravAdd :TDataPrKSpravMinNapr;
   T:TFormPrKSpravEditMIN_TYPE_NAPR;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataPrKSpravAdd:=TDataPrKSpravMinNapr.Create(StrToInt(DataSetPrKSprav.FieldValues['KOD_MAX']),
                                         StrToInt(DataSetPrKSprav.FieldValues['NPP_MAX']));
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]);

   T := TFormPrKSpravEditMIN_TYPE_NAPR.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage]+CaptionEditForm;
   if ShowNpp=true then
    begin
      T.cxLabelNPP.Visible    :=true;
      T.cxTextEditNPP.Visible :=true;
    end;
   if T.ShowModal=MrOk then
    begin
       StoredProcPrKSprav.Transaction.StartTransaction;
       StoredProcPrKSprav.StoredProcName:=StoredProcAddName;
       StoredProcPrKSprav.Prepare;
       StoredProcPrKSprav.ParamByName('NAME').AsString       :=DataPrKSpravAdd.Name;
       StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString :=DataPrKSpravAdd.ShortName;
       StoredProcPrKSprav.ParamByName('KOD').AsInteger       :=DataPrKSpravAdd.Kod;
       StoredProcPrKSprav.ParamByName('NPP').AsInteger       :=DataPrKSpravAdd.Npp;
       StoredProcPrKSprav.ParamByName('SHIFR').AsString      :=DataPrKSpravAdd.SHIFR;
       StoredAddPar;
       try
          StoredProcPrKSprav.ExecProc;
          StoredProcPrKSprav.Transaction.commit;
          DataPrKSpravAdd.Id:=StoredProcPrKSprav.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
             StoredProcPrKSprav.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;
   Obnovit(DataPrKSpravAdd.Id);

   DataSetSpec.CloseOpen(false);
   DataPrKSpravAdd.Free;
   DataPrKSpravAdd:=nil;
   if TryAgain=true
      then AddSecLevFormShow;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionChangeExecute(
  Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravMinNapr;
   T:TFormPrKSpravEditMIN_TYPE_NAPR;
   TryAgain :boolean;
begin
     TryAgain:=false;
     if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
      begin
         DataPrKSpravChange:=TDataPrKSpravMinNapr.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                                DataSetPrKSprav.FieldValues['NAME'],
                                                DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                                StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                                StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                                DataSetPrKSprav.FieldValues['SHIFR']);

         T:=TFormPrKSpravEditMIN_TYPE_NAPR.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

         T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndexLanguage]+CaptionEditForm;
         if ShowNpp=true then
          begin
            T.cxLabelNPP.Visible    :=true;
            T.cxTextEditNPP.Visible :=true;
          end;
         if T.ShowModal=MrOk then
          begin
             StoredProcPrKSprav.Transaction.StartTransaction;
             StoredProcPrKSprav.StoredProcName:=StoredProcChangeName;
             StoredProcPrKSprav.Prepare;
             StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64         :=DataPrKSpravChange.Id;
             StoredProcPrKSprav.ParamByName('NAME').AsString         :=DataPrKSpravChange.Name;
             StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString   :=DataPrKSpravChange.ShortName;
             StoredProcPrKSprav.ParamByName('KOD').AsInteger         :=DataPrKSpravChange.Kod;
             StoredProcPrKSprav.ParamByName('NPP').AsInteger         :=DataPrKSpravChange.Npp;
             StoredProcPrKSprav.ParamByName('SHIFR').AsString        :=DataPrKSpravChange.SHIFR;
             StoredAddPar;
             try
                StoredProcPrKSprav.ExecProc;
                StoredProcPrKSprav.Transaction.Commit;
             except on e: Exception do
                begin
                   MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                          nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                          e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                   StoredProcPrKSprav.Transaction.Rollback;
                   TryAgain:=true;
                end;
             end;
          end;

         T.Free;
         T:=nil;
         Obnovit(DataPrKSpravChange.Id);
         DataSetSpec.CloseOpen(false);
         DataPrKSpravChange.Free;
         DataPrKSpravChange:=nil;
     end;
     if TryAgain=true
      then ActionChangeExecute(sender);
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionVibratExecute(
  Sender: TObject);
begin
  if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]<>NULL then
  begin
    ResultArray    :=VarArrayCreate([0,15], varVariant);
    ResultArray[0] :=DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC];
    ResultArray[1] :=DataSetSpec.FieldValues['NAME'];
    ResultArray[2] :=DataSetSpec.FieldValues['SHORT_NAME'];
    ResultArray[3] :=DataSetSpec.FieldValues['KOD'];
    ResultArray[4] :=DataSetSpec.FieldValues['NPP'];

    ResultArray[5] :=DataSetSpec.FieldValues['ID_SP_MIN_PERELIK_PRIM'];
    ResultArray[6] :=DataSetSpec.FieldValues['NAME_PRIM'];
    ResultArray[7] :=DataSetSpec.FieldValues['SHORT_NAME_PRIM'];
    ResultArray[8] :=DataSetSpec.FieldValues['KOD_PRIM'];
    ResultArray[9] :=DataSetSpec.FieldValues['NPP_PRIM'];

                    // данные из табл PRK_SP_MIN_NAPR
    ResultArray[10] :=DataSetPrKSprav.FieldValues[ID_NAME];
    ResultArray[11] :=DataSetPrKSprav.FieldValues['NAME'];
    ResultArray[12] :=DataSetPrKSprav.FieldValues['SHORT_NAME'];
    ResultArray[13] :=DataSetPrKSprav.FieldValues['KOD'];
    ResultArray[14] :=DataSetPrKSprav.FieldValues['NPP'];

    ResultArray[15] :=DataSetPrKSprav.FieldValues['PARENT_FIELD'];
    close;
  end;   
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionDELExecute(Sender: TObject);
begin
   if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDel[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
         begin
            if StrToInt(DataSetPrKSprav.FieldValues['GRID_LEVEL'])=2
               then  begin
                  DataSetLevel.Active  :=false;
                  DataSetLevel.SelectSQL.Clear;
                  DataSetLevel.SQLs.SelectSQL.Text :='Select * from PRK_SP_MIN_NAPR_SELECT where ID_SP_MIN_TYPE_NAPR=:ID_NAME_FIRST_LEVEL';
                  DataSetLevel.ParamByName('ID_NAME_FIRST_LEVEL').AsInt64 :=DataSetPrKSprav.FieldValues['PARENT_FIELD'];
                  DataSetLevel.CloseOpen(false);
                  DataSetLevel.FetchAll;  // Возвращает все записи с сервера на клиент, если без него то DataSetLevel.RecordCount вернет 1
                  if DataSetLevel.RecordCount=1
                   then begin
                    ShowMessage(nMsgCannotDelSecLevel[IndexLanguage]);
                    Exit;
                   end;
               end;
            StoredProcPrKSprav.Transaction.StartTransaction;
            StoredProcPrKSprav.StoredProcName:=StoredProcDelName;
            StoredProcPrKSprav.Prepare;
            StoredProcPrKSprav.ParamByName(ID_NAME).AsInt64:= DataSetPrKSprav.FieldValues[ID_NAME];
            try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
              cxDBTreeListPrKSpravTwoLevelNAPR.GotoPrev;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
               end;
            end;
         end;
         inherited Obnovit(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]));
         DataSetSpec.CloseOpen(false);
     end;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.cxDBTreeListPrKSpravTwoLevelNAPRDblClick(
  Sender: TObject);
begin
   dxBarLargeButtonChange.Click;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionViewExecute(Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravMinNapr;
   T:TFormPrKSpravEditMIN_TYPE_NAPR;
begin
       if DataSetPrKSprav.FieldValues[ID_NAME]<>Null then
        begin
           DataPrKSpravView:=TDataPrKSpravMinNapr.Create(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]),
                                                    DataSetPrKSprav.FieldValues['NAME'],
                                                    DataSetPrKSprav.FieldValues['SHORT_NAME'],
                                                    StrToInt(DataSetPrKSprav.FieldValues['KOD']),
                                                    StrToInt(DataSetPrKSprav.FieldValues['NPP']),
                                                    DataSetPrKSprav.FieldValues['SHIFR']);

           T:=TFormPrKSpravEditMIN_TYPE_NAPR.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
           if ShowNpp=true then
            begin
              T.cxLabelNPP.Visible    :=true;
              T.cxTextEditNPP.Visible :=true;
            end;
           T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage]+CaptionEditForm;
           T.cxTextEditName.Properties.ReadOnly      :=true;
           T.cxTextEditShortName.Properties.ReadOnly :=true;
           T.cxTextEditKod.Properties.ReadOnly       :=true;
           T.cxTextEditNpp.Properties.ReadOnly       :=true;
           T.cxTextEditSHIFR.Properties.ReadOnly     :=true;

           T.cxTextEditName.Style.Color      :=TextViewColor;
           T.cxTextEditShortName.Style.Color :=TextViewColor;
           T.cxTextEditKod.Style.Color       :=TextViewColor;
           T.cxTextEditNpp.Style.Color       :=TextViewColor;
           T.cxTextEditSHIFR.Style.Color     :=TextViewColor;
           T.ShowModal;
           T.Free;
           T:=nil;
           DataPrKSpravView.Free;
           DataPrKSpravView:=nil;
        end;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.SetSelectSQLTextSpec(
  const Value: String);
begin
  FSelectSQLTextSpec := Value;
  DataSetSpec.Active :=false;
  DataSetSpec.Database             := DataBasePrKSprav;
  DataSetSpec.Transaction          := TransactionReadPrKSprav;
  DataSetSpec.SelectSQL.Clear;
  DataSetSpec.SQLs.SelectSQL.Text  :=FSelectSQLTextSpec;
  DataSetSpec.CloseOpen(false);
end;

{ TDataPrKSpravMinPerelikSpec }

constructor TDataPrKSpravMinNapr.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aSHIFR: String);
begin
    Create(aId, aName, aShortName,aKod,aNpp);
    SHIFR:=aSHIFR;
end;

constructor TDataPrKSpravMinNApr.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  SHIFR:='';
end;

procedure TDataPrKSpravMinNapr.SetSHIFR(const Value: string);
begin
  FSHIFR := Value;
end;

{ TDataPrKSpravMinPerelikSpec }

constructor TDataPrKSpravMinPerelikSpec.Create(aId: int64; aName,
  aShortName: String; aKod, aNpp: Integer; aIdMinPerelikPRIM: Int64;
  aShortNamePRIM: String);
begin
  Create(aId, aName, aShortName,aKod,aNpp);
  IdMinPerelikPRIM :=aIdMinPerelikPRIM;
  ShortNamePRIM    :=aShortNamePRIM;
end;

constructor TDataPrKSpravMinPerelikSpec.Create(aKodMax, aNppMax: Integer);
begin
  inherited;
  IdMinPerelikPRIM :=0;
  ShortNamePRIM    :='';
end;

procedure TDataPrKSpravMinPerelikSpec.SetIdMinPerelikPRIM(
  const Value: Int64);
begin
  FIdMinPerelikPRIM := Value;
end;

procedure TDataPrKSpravMinPerelikSpec.SetShortNamePRIM(
  const Value: String);
begin
  FShortNamePRIM := Value;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionAddSpecExecute(
  Sender: TObject);
var
   DataPrKSpravAdd :TDataPrKSpravMinPerelikSpec;
   T:TFormPrKSpravEditMIN_PERELIK_SPEC;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetSpec.FieldValues['KOD_MAX']=NULL
      then begin
           DataSetSpecForAdd.CloseOpen(false);
           DataPrKSpravAdd:=TDataPrKSpravMinPerelikSpec.Create(StrToInt(DataSetSpecForAdd.FieldValues['KOD_MAX']),
                                                               StrToInt(DataSetSpecForAdd.FieldValues['NPP_MAX']));
      end
      else DataPrKSpravAdd:=TDataPrKSpravMinPerelikSpec.Create(StrToInt(DataSetSpec.FieldValues['KOD_MAX']),
                                                               StrToInt(DataSetSpec.FieldValues['NPP_MAX']));
                                                               
   if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]<>Null
      then DataPrKSpravAdd.Id:=StrToInt64(DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]);

   T := TFormPrKSpravEditMIN_PERELIK_SPEC.Create(self,DataPrKSpravAdd,AllDataKods,AllDataNpps);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndexLanguage];
   if ShowNpp=true then
    begin
      T.cxLabelNPP.Visible    :=true;
      T.cxTextEditNPP.Visible :=true;
    end;
   if T.ShowModal=MrOk then
    begin
       StoredProcPrKSprav.Transaction.StartTransaction;
       StoredProcPrKSprav.StoredProcName:=StoredProcAddNameSPEC;
       StoredProcPrKSprav.Prepare;
       StoredProcPrKSprav.ParamByName('NAME').AsString        :=DataPrKSpravAdd.Name;
       StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString  :=DataPrKSpravAdd.ShortName;
       StoredProcPrKSprav.ParamByName('KOD').AsInteger        :=DataPrKSpravAdd.Kod;
       StoredProcPrKSprav.ParamByName('NPP').AsInteger        :=DataPrKSpravAdd.Npp;
       StoredProcPrKSprav.ParamByName('ID_SP_MIN_PERELIK_PRIM').AsInt64 :=DataPrKSpravAdd.IdMinPerelikPRIM;
       StoredProcPrKSprav.ParamByName('ID_SP_MIN_NAPR').AsInt64         :=DataSetPrKSprav.FieldValues[ID_NAME_SECOND_LEVEL];
       try
          StoredProcPrKSprav.ExecProc;
          StoredProcPrKSprav.Transaction.commit;
          DataPrKSpravAdd.Id:=StoredProcPrKSprav.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
             StoredProcPrKSprav.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;

   Obnovit(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]));
   ObnovitSPEC(DataPrKSpravAdd.Id);
   DataPrKSpravAdd.Free;
   DataPrKSpravAdd:=nil;

   if TryAgain=true
      then ActionAddSpecExecute(Sender);
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionChangeSpecExecute(
  Sender: TObject);
var
   DataPrKSpravChange :TDataPrKSpravMinPerelikSpec;
   T:TFormPrKSpravEditMIN_PERELIK_SPEC;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]<>Null then
    begin
       DataPrKSpravChange:=TDataPrKSpravMinPerelikSpec.Create(StrToInt64(DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]),
                                              DataSetSpec.FieldValues['NAME'],
                                              DataSetSpec.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetSpec.FieldValues['KOD']),
                                              StrToInt(DataSetSpec.FieldValues['NPP']),
                                              StrToInt64(DataSetSpec.FieldValues['ID_SP_MIN_PERELIK_PRIM']),
                                              DataSetSpec.FieldValues['SHORT_NAME_PRIM']);
       T:=TFormPrKSpravEditMIN_PERELIK_SPEC.Create(self,DataPrKSpravChange,AllDataKods,AllDataNpps);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndexLanguage];
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       if T.ShowModal=MrOk then
        begin
           StoredProcPrKSprav.Transaction.StartTransaction;
           StoredProcPrKSprav.StoredProcName:=StoredProcChangeNameSPEC;
           StoredProcPrKSprav.Prepare;
           StoredProcPrKSprav.ParamByName(ID_NAME_MIN_PERELIK_SPEC).AsInt64 :=DataPrKSpravChange.Id;
           StoredProcPrKSprav.ParamByName('NAME').AsString                  :=DataPrKSpravChange.Name;
           StoredProcPrKSprav.ParamByName('SHORT_NAME').AsString            :=DataPrKSpravChange.ShortName;
           StoredProcPrKSprav.ParamByName('KOD').AsInteger                  :=DataPrKSpravChange.Kod;
           StoredProcPrKSprav.ParamByName('NPP').AsInteger                  :=DataPrKSpravChange.Npp;
           StoredProcPrKSprav.ParamByName('ID_SP_MIN_PERELIK_PRIM').AsInt64 :=DataPrKSpravChange.IdMinPerelikPRIM;
           StoredProcPrKSprav.ParamByName('ID_SP_MIN_NAPR').AsInt64         :=DataSetSpec.FieldValues['ID_SP_MIN_NAPR'];
           try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
       Obnovit(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]));
       ObnovitSPEC(DataPrKSpravChange.Id);
       DataPrKSpravChange.Free;
       DataPrKSpravChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeSpecExecute(sender);
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionViewSpecExecute(
  Sender: TObject);
var
   DataPrKSpravView :TDataPrKSpravMinPerelikSpec;
   T:TFormPrKSpravEditMIN_PERELIK_SPEC;
begin
   if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]<>Null then
    begin
       DataPrKSpravView:=TDataPrKSpravMinPerelikSpec.Create(StrToInt64(DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]),
                                              DataSetSpec.FieldValues['NAME'],
                                              DataSetSpec.FieldValues['SHORT_NAME'],
                                              StrToInt(DataSetSpec.FieldValues['KOD']),
                                              StrToInt(DataSetSpec.FieldValues['NPP']),
                                              StrToInt64(DataSetSpec.FieldValues['ID_SP_MIN_PERELIK_PRIM']),
                                              DataSetSpec.FieldValues['SHORT_NAME_PRIM']);

       T:=TFormPrKSpravEditMIN_PERELIK_SPEC.Create(self,DataPrKSpravView,AllDataKods,AllDataNpps);
       if ShowNpp=true then
        begin
          T.cxLabelNPP.Visible    :=true;
          T.cxTextEditNPP.Visible :=true;
        end;
       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndexLanguage];
       T.cxTextEditName.Properties.ReadOnly      :=true;
       T.cxTextEditShortName.Properties.ReadOnly :=true;
       T.cxTextEditKod.Properties.ReadOnly       :=true;
       T.cxTextEditNpp.Properties.ReadOnly       :=true;
       T.cxButtonEditMinPerelikPrim.Properties.ReadOnly   :=true;
       T.cxButtonEditMinPerelikPrim.Properties.Buttons[0].Visible:=false;
       T.cxTextEditName.Style.Color      :=TextViewColor;
       T.cxTextEditShortName.Style.Color :=TextViewColor;
       T.cxTextEditKod.Style.Color       :=TextViewColor;
       T.cxTextEditNpp.Style.Color       :=TextViewColor;
       T.cxButtonEditMinPerelikPrim.Style.Color           :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataPrKSpravView.Free;
       DataPrKSpravView:=nil;
    end;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionDelSpecExecute(
  Sender: TObject);
var
   id_SpecObnov : int64;
begin
   if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndexLanguage],nMsgDel[IndexLanguage],
                        mtInformation,mbOKCancel,IndexLanguage)=mrOK then
         begin
            StoredProcPrKSprav.Transaction.StartTransaction;
            StoredProcPrKSprav.StoredProcName:=StoredProcDelNameSPEC;
            StoredProcPrKSprav.Prepare;
            StoredProcPrKSprav.ParamByName(ID_NAME_MIN_PERELIK_SPEC).AsInt64:=DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC];
            try
              StoredProcPrKSprav.ExecProc;
              StoredProcPrKSprav.Transaction.Commit;
              cxGridPrKSpravSpecDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndexLanguage]+chr(13)+
                        nMsgTryAgain[IndexLanguage]+nMsgOr[IndexLanguage]+nMsgToAdmin[IndexLanguage]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndexLanguage]),MB_OK or MB_ICONWARNING);
                 StoredProcPrKSprav.Transaction.Rollback;
               end;
            end;
         end;
          id_SpecObnov:=StrToInt64(DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]);
          inherited Obnovit(StrToInt64(DataSetPrKSprav.FieldValues[ID_NAME]));
          ObnovitSPEC(id_SpecObnov);
     end;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ObnovitSPEC(id_obnovit: int64);
begin
   DataSetSpec.CloseOpen(false);
   DataSetSpec.Locate(ID_NAME_MIN_PERELIK_SPEC,id_obnovit,[]);
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.ActionObnovExecute(Sender: TObject);
var
  id_Spec :int64;
begin
  if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]<>null
   then id_Spec := DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC];
  inherited;
  ObnovitSPEC(id_Spec);
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.DataSetPrKSpravAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if DataSetSpec.Active =true
   then if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]=null
           then ActionVibrat.Enabled:=false
           else  if FormStyle=fsNormal then ActionVibrat.Enabled:=true;
           
   if ID_NAME=ID_NAME_SECOND_LEVEL
     then begin
       ActionAddSpec.Enabled    :=true;
       ActionChangeSpec.Enabled :=true;
       ActionDelSpec.Enabled    :=true;
       ActionViewSpec.Enabled   :=true;
     end
     else begin
       ActionAddSpec.Enabled    :=false;
       ActionChangeSpec.Enabled :=false;
       ActionDelSpec.Enabled    :=false;
       ActionViewSpec.Enabled   :=false;
     end; 
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.DataSetSpecAfterScroll(
  DataSet: TDataSet);
begin
  if DataSetSpec.FieldValues[ID_NAME_MIN_PERELIK_SPEC]=null
     then ActionVibrat.Enabled:=false
     else if FormStyle=fsNormal then ActionVibrat.Enabled:=true;
end;

procedure TFormPRK_SP_MIN_PERELIK_SPEC.cxGridPrKSpravSpecDBTableView1DblClick(
  Sender: TObject);
begin
  if FormStyle = fsNormal
   then dxBarLargeButtonVibrat.Click
   else dxBarLargeButtonChangeSpec.Click
end;

end.
