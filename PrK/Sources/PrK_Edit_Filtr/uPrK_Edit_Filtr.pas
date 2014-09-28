unit uPrK_Edit_Filtr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Placemnt, dxBar, dxBarExtItems, ActnList, ImgList,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxGroupBox, cxSplitter,
  dxStatusBar,AArray,ibase,ib_externals, cxTextEdit, cxDBEdit, cxLabel,
  cxMemo;

type
  TFormPrK_Edit_Filtr = class(TForm)
    dxStatusBarVL: TdxStatusBar;
    cxSplitterNapr: TcxSplitter;
    cxGroupBoxFndKomp: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    cxGridPrKFndKomp: TcxGrid;
    cxGridPrKFndKompDBTableView1: TcxGridDBTableView;
    colNameComp: TcxGridDBColumn;
    cxGridPrKFndKompLevel1: TcxGridLevel;
    ImageListPrK: TImageList;
    ActionListPrK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionObnov: TAction;
    ActionVibratFndComp: TAction;
    ActionOtmena: TAction;
    ActionAddPrKFndComp: TAction;
    ActionChangePrKFndComp: TAction;
    ActionDelPrKFndComp: TAction;
    StyleRepositoryPrK: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    dxBarManagerPrk: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonAddPrKFndComp: TdxBarLargeButton;
    dxBarLargeButtonChangePrKStat: TdxBarLargeButton;
    dxBarLargeButtonDelPrKStat: TdxBarLargeButton;
    FormStoragePrK: TFormStorage;
    TransactionWritePrK: TpFIBTransaction;
    StoredProcPrK: TpFIBStoredProc;
    DataSetPrKFndKat: TpFIBDataSet;
    TransactionReadPrK: TpFIBTransaction;
    DataBasePrK: TpFIBDatabase;
    DataSourcePrKFndKat: TDataSource;
    DataSetPrKFndKomp: TpFIBDataSet;
    DataSourcePrKFndKomp: TDataSource;
    cxEditStyleControllerPrK: TcxEditStyleController;
    cxGroupBoxFndKat: TcxGroupBox;
    cxGridPrKFndKat: TcxGrid;
    cxGridPrKFndKatDBTableView1: TcxGridDBTableView;
    colNAME: TcxGridDBColumn;
    colSHORT_NAME: TcxGridDBColumn;
    colKOD: TcxGridDBColumn;
    colNPP: TcxGridDBColumn;
    cxGridPrKFndKatLevel1: TcxGridLevel;
    dxBarDockControl2: TdxBarDockControl;
    colid_sp_fnd_component: TcxGridDBColumn;
    ActionObnovFndComp: TAction;
    dxBarLargeButtonObnovFndComp: TdxBarLargeButton;
    cxGroupBox1: TcxGroupBox;
    cxLabelComponent: TcxLabel;
    cxDBTextEditComponent: TcxDBTextEdit;
    cxLabelSELECT_STATEMENT: TcxLabel;
    cxLabelWHERE_STATEMENT: TcxLabel;
    cxDBTextEditWHERE_STATEMENT: TcxDBTextEdit;
    dxBarLargeButtonVIbratFndComp: TdxBarLargeButton;
    cxDBMemoSELECT_STATEMENT: TcxDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure ActionAddPrKFndCompExecute(Sender: TObject);
    procedure ActionObnovFndCompExecute(Sender: TObject);
    procedure ActionChangePrKFndCompExecute(Sender: TObject);
    procedure ActionDelPrKFndCompExecute(Sender: TObject);
    procedure ActionVibratFndCompExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGridPrKFndKompDBTableView1DblClick(Sender: TObject);
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    TextViewColor           :TColor;
    IndLang                 :integer;
    FSelectSQLTextPrKFndComp: String;
    FSelectSQLTextPrKFndKat: String;
    procedure SetSelectSQLTextPrKFndComp(const Value: String);
    procedure SetSelectSQLTextPrKFndKat(const Value: String);
    procedure InicCaption;
    procedure obnovitFndComp(id_obnov: int64);
    procedure obnovitFndKat (id_obnov: int64);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLTextPrKFndKat  :String read FSelectSQLTextPrKFndKat write SetSelectSQLTextPrKFndKat;
    Property SelectSQLTextPrKFndComp :String read FSelectSQLTextPrKFndComp write SetSelectSQLTextPrKFndComp;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_Edit_Filtr: TFormPrK_Edit_Filtr;

implementation
uses
  uPrK_Resources,uConstants,uPrK_Edit_Filtr_FndCompEdit,
  uPrK_Edit_Filtr_FndKatEdit;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Edit_Filtr;
begin
   T:=TFormPrK_Edit_Filtr.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   if aParam['Input']['aVibrat'].AsInteger=1 then
                     begin
                         T.cxGroupBoxFndKat.Visible              :=false;
                         T.cxSplitterNapr.Visible                :=false;
                         T.ActionVibratFndComp.Enabled           :=true;
                         T.ActionVibratFndComp.Visible           :=true;
                         T.dxBarLargeButtonVIbratFndComp.Visible :=ivAlways;
                     end;
                   T.ShowModal;
                 end;
     fsMDIChild: begin
                 //  T.ActionVibrat.Enabled:=false;
                 //  T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;    

{ TFormPrK_Edit_Filtr }

constructor TFormPrK_Edit_Filtr.Create(aOwner: TComponent;
  aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLang       :=SelectLanguage;
      TextViewColor :=cl3DLight;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
          cxEditStyleControllerPrK.Style.Color      := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_Edit_Filtr.FormCreate(Sender: TObject);
begin
   iniccaption;
   SelectSQLTextPrKFndKat  :='Select * from PRK_SP_FND_KATEGORY_SELECT';
   SelectSQLTextPrKFndComp :='Select * from PRK_SP_FND_COMPONENT_SELECT';
end;


procedure TFormPrK_Edit_Filtr.InicCaption;
begin
   TFormPrK_Edit_Filtr(self).Caption:='Настройка фильтра';

  colNAME.Caption                        :=nColName[IndLang];
  colSHORT_NAME.Caption                  :=nColShortName[IndLang];
  colKOD.Caption                         :=nColKod[IndLang];
  colNPP.Caption                         :=nColNpp[IndLang];
  cxLabelComponent.Caption               := nLabelComponentName[IndLang];
  cxLabelSELECT_STATEMENT.Caption        := nLabelSELECT_STATEMENT[IndLang];
  cxLabelWHERE_STATEMENT.Caption         := nLabelWHERE_STATEMENT[IndLang];

  colNameComp.Caption            :=nColName[IndLang];
  colid_sp_fnd_component.Caption :='Идентефикатор компонента'; 

    ActionADD.Caption                    :=nAction_Add[IndLang];
    ActionChange.Caption                 :=nAction_Change[IndLang];
    ActionDEL.Caption                    :=nAction_Del[IndLang];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLang];
    ActionOtmena.Caption                 :=nAction_Exit[IndLang];
    ActionADD.Hint                       :=nHintAction_Add[IndLang];
    ActionChange.Hint                    :=nHintAction_Change[IndLang];
    ActionDEL.Hint                       :=nHintAction_Del[IndLang];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLang];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLang];

    ActionAddPrKFndComp.Caption            :=nAction_Add[IndLang];
    ActionChangePrKFndComp.Caption         :=nAction_Change[IndLang];
    ActionDelPrKFndComp.Caption            :=nAction_Del[IndLang];
    ActionVibratFndComp.Caption            :=nAction_Vibrat[IndLang];
    ActionObnovFndComp.Caption             :=nActiont_Obnov[IndLang];
    ActionAddPrKFndComp.Hint               :=nHintAction_Add[IndLang];
    ActionChangePrKFndComp.Hint            :=nHintAction_Change[IndLang];
    ActionDelPrKFndComp.Hint               :=nHintAction_Del[IndLang];
    ActionVibratFndComp.Hint               :=nHintAction_Vibrat[IndLang];
    ActionObnovFndComp.Hint                :=nHintAction_Obnov[IndLang];
end;

procedure TFormPrK_Edit_Filtr.SetSelectSQLTextPrKFndKat(
  const Value: String);
begin
  FSelectSQLTextPrKFndComp := Value;
    DataBasePrK.close;
    DataSetPrKFndKat.Active                          :=false;
    DataBasePrK.Handle                               :=DBHANDLE;
    DataBasePrK.DefaultTransaction                   := TransactionReadPrK;
    DataSetPrKFndKat.Database                        := DataBasePrK;
    DataSetPrKFndKat.Transaction                     := TransactionReadPrK;
    DataSetPrKFndKat.SelectSQL.Clear;
    DataSetPrKFndKat.SQLs.SelectSQL.Text             := FSelectSQLTextPrKFndComp;
    DataSetPrKFndKat.CloseOpen(false);
end;

procedure TFormPrK_Edit_Filtr.SetSelectSQLTextPrKFndComp(
  const Value: String);
begin
  FSelectSQLTextPrKFndKat := Value;
    DataSetPrKFndKomp.Active                          :=false;
    DataSetPrKFndKomp.Database                        := DataBasePrK;
    DataSetPrKFndKomp.Transaction                     := TransactionReadPrK;
    DataSetPrKFndKomp.SelectSQL.Clear;
    DataSetPrKFndKomp.SQLs.SelectSQL.Text             := FSelectSQLTextPrKFndKat;
    DataSetPrKFndKomp.CloseOpen(false);
end;

procedure TFormPrK_Edit_Filtr.ActionAddPrKFndCompExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_Edit_Filtr_FndCompEdit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['Name'].asString        :='' ;
   DataVLAdd['ID'].AsString          :=IntToStr(DataSetPrKFndKomp.fbn('id_sp_fnd_component_max').AsInteger+1) ;

   T := TFormPrK_Edit_Filtr_FndCompEdit.Create(self,DataVLAdd);
   T.Caption :=nFormKlassSpravEdit_Add[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_FND_COMPONENT_ADD';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('id_sp_fnd_component').AsInt64   :=DataVLAdd['Id'].AsInt64;
       StoredProcPrK.ParamByName('Name').AsString                 :=DataVLAdd['Name'].AsString;
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;

   obnovitFndComp(DataVLAdd['ID'].AsInt64);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionAddPrKFndCompExecute(Sender);
end;

procedure TFormPrK_Edit_Filtr.obnovitFndComp(id_obnov: int64);
begin
    DataSetPrKFndKomp.CloseOpen(false);
    DataSetPrKFndKomp.Locate('id_sp_fnd_component',id_obnov,[]);
end;

procedure TFormPrK_Edit_Filtr.ActionObnovFndCompExecute(Sender: TObject);
var
  i:int64;
begin
     if DataSetPrKFndKomp.FieldValues['id_sp_fnd_component']<>Null
      then i:= DataSetPrKFndKomp.FieldValues['id_sp_fnd_component'];
     obnovitFndComp(i);
end;

procedure TFormPrK_Edit_Filtr.ActionChangePrKFndCompExecute(
  Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_Edit_Filtr_FndCompEdit;
   TryAgain :boolean;
   i:int64;
begin
   if DataSetPrKFndKomp.FieldValues['id_sp_fnd_component']<>Null
     then begin
        TryAgain:=false;
        DataVLChange :=TAArray.Create;
        DataVLChange['ID'].AsInt64           :=StrToInt64(DataSetPrKFndKomp.FieldValues['id_sp_fnd_component']);
        DataVLChange['Name'].asString        :=DataSetPrKFndKomp.Fbn('Name').asString;

        T := TFormPrK_Edit_Filtr_FndCompEdit.Create(self,DataVLChange);
        T.Caption :=nFormKlassSpravEdit_Change[IndLang];

        if T.ShowModal=MrOk then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_FND_COMPONENT_CHANGE';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('id_sp_fnd_component').AsInt64      :=DataVLChange['ID'].AsInt64;
            StoredProcPrK.ParamByName('Name').AsString                    :=DataVLChange['Name'].AsString;
            try
               StoredProcPrK.ExecProc;
               StoredProcPrK.Transaction.commit;
            except on e: Exception do
               begin
                  MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                             nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                             e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                  StoredProcPrK.Transaction.Rollback;
                  TryAgain:=true;
               end;
            end;
         end;
        T.Free;
        T:=nil;

        obnovitFndComp(i);
        DataVLChange.Free;
        DataVLChange:=Nil;

        if TryAgain=true
           then ActionChangePrKFndCompExecute(Sender);
    end;
end;

procedure TFormPrK_Edit_Filtr.ActionDelPrKFndCompExecute(Sender: TObject);
begin
     if DataSetPrKFndKomp.FieldValues['ID_SP_FND_COMPONENT']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_FND_COMPONENT_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('ID_SP_FND_COMPONENT').AsInt64:= DataSetPrKFndKomp.FieldValues['ID_SP_FND_COMPONENT'];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKFndKompDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         obnovitFndComp(StrToInt64(DataSetPrKFndKomp.FieldValues['ID_SP_FND_COMPONENT']));
     end;
end;

procedure TFormPrK_Edit_Filtr.ActionVibratFndCompExecute(Sender: TObject);
begin
    if DataSetPrKFndKomp.FieldValues['ID_SP_FND_COMPONENT']<>NULL then
    begin
      FillArrayFromDataSet(ResultArray['Output'],DataSetPrKFndKomp);
      close;
    end;
end;

procedure TFormPrK_Edit_Filtr.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPrK_Edit_Filtr.ActionADDExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_Edit_Filtr_FndKatEdit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['Name'].asString        :='' ;
   DataVLAdd['Short_Name'].AsString  :='' ;
   DataVLAdd['Kod'].AsString         :=IntToStr(DataSetPrKFndKat.fbn('kod_max').AsInteger+1) ;
   DataVLAdd['Npp'].AsString         :=IntToStr(DataSetPrKFndKat.fbn('npp_max').AsInteger+1) ;
   DataVLAdd['ID_SP_FND_COMPONENT'].AsInt64   :=-1;
   DataVLAdd['NAME_FND_COMPONENT'].AsString   :='';
   DataVLAdd['SELECT_STATEMANT'].AsString     :='';
   DataVLAdd['WHERE_STATEMANT'].AsString      :='';


   if DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY']<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY']);

   T := TFormPrK_Edit_Filtr_FndKatEdit.Create(self,DataVLAdd);
   T.Caption :=nFormKlassSpravEdit_Add[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_FND_KATEGORY_ADD';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('Name').AsString                 :=DataVLAdd['Name'].AsString;
       StoredProcPrK.ParamByName('Short_Name').AsString           :=DataVLAdd['Short_Name'].AsString;
       StoredProcPrK.ParamByName('Kod').AsInteger                 :=DataVLAdd['Kod'].AsInteger;
       StoredProcPrK.ParamByName('Npp').AsInteger                 :=DataVLAdd['Npp'].AsInteger;
       StoredProcPrK.ParamByName('ID_SP_FND_COMPONENT').AsInt64   :=DataVLAdd['ID_SP_FND_COMPONENT'].AsInt64;
       StoredProcPrK.ParamByName('SELECT_STATEMANT').AsString     :=DataVLAdd['SELECT_STATEMANT'].AsString;
       StoredProcPrK.ParamByName('WHERE_STATEMANT').AsString      :=DataVLAdd['WHERE_STATEMANT'].AsString;
       try
          StoredProcPrK.ExecProc;
          StoredProcPrK.Transaction.commit;
          DataVLAdd['ID'].AsInt64:=StoredProcPrK.FieldByName('ID_OUT').AsInt64;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
             StoredProcPrK.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
    end;
   T.Free;
   T:=nil;

   obnovitFndKat(DataVLAdd['ID'].AsInt64);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionADDExecute(Sender);
end;

procedure TFormPrK_Edit_Filtr.obnovitFndKat(id_obnov: int64);
begin
   DataSetPrKFndKat.CloseOpen(false);
   DataSetPrKFndKat.Locate('ID_SP_FND_KATEGORY',id_obnov,[]);
end;

procedure TFormPrK_Edit_Filtr.ActionObnovExecute(Sender: TObject);
var
  i:int64;
begin
   if DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY']<>Null
    then i:=DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY'];
   obnovitFndKat(i);
end;

procedure TFormPrK_Edit_Filtr.ActionChangeExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_Edit_Filtr_FndKatEdit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   if DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY']<>Null then
   begin
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64           :=StrToInt64(DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY']);
       DataVLChange['Name'].asString        :=DataSetPrKFndKat.FBN('Name').asString;
       DataVLChange['Short_Name'].AsString  :=DataSetPrKFndKat.FBN('Short_Name').asString;
       DataVLChange['Kod'].AsString         :=DataSetPrKFndKat.fbn('Kod').asString;
       DataVLChange['Npp'].AsString         :=DataSetPrKFndKat.fbn('Npp').asString;
       DataVLChange['ID_SP_FND_COMPONENT'].AsInt64   :=StrToInt64(DataSetPrKFndKat.FieldValues['ID_SP_FND_COMPONENT']);
       DataVLChange['NAME_FND_COMPONENT'].AsString   :=DataSetPrKFndKat.FBN('NAME_FND_COMPONENT').asString;
       DataVLChange['SELECT_STATEMANT'].AsString     :=DataSetPrKFndKat.FBN('SELECT_STATEMANT').asString;
       DataVLChange['WHERE_STATEMANT'].AsString      :=DataSetPrKFndKat.FBN('WHERE_STATEMANT').asString;


       T := TFormPrK_Edit_Filtr_FndKatEdit.Create(self,DataVLChange);
       T.Caption :=nFormKlassSpravEdit_Add[IndLang];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrK.Transaction.StartTransaction;
           StoredProcPrK.StoredProcName:='PRK_SP_FND_KATEGORY_CHANGE';
           StoredProcPrK.Prepare;
           StoredProcPrK.ParamByName('ID_SP_FND_KATEGORY').AsInt64    :=DataVLChange['ID'].AsInt64;
           StoredProcPrK.ParamByName('Name').AsString                 :=DataVLChange['Name'].AsString;
           StoredProcPrK.ParamByName('Short_Name').AsString           :=DataVLChange['Short_Name'].AsString;
           StoredProcPrK.ParamByName('Kod').AsInteger                 :=DataVLChange['Kod'].AsInteger;
           StoredProcPrK.ParamByName('Npp').AsInteger                 :=DataVLChange['Npp'].AsInteger;
           StoredProcPrK.ParamByName('ID_SP_FND_COMPONENT').AsInt64   :=DataVLChange['ID_SP_FND_COMPONENT'].AsInt64;
           StoredProcPrK.ParamByName('SELECT_STATEMANT').AsString     :=DataVLChange['SELECT_STATEMANT'].AsString;
           StoredProcPrK.ParamByName('WHERE_STATEMANT').AsString      :=DataVLChange['WHERE_STATEMANT'].AsString;
           try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                            nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;
       T.Free;
       T:=nil;

       obnovitFndKat(DataVLChange['ID'].AsInt64);
       DataVLChange.Free;
       DataVLChange:=Nil;

       if TryAgain=true
          then ActionChangePrKFndCompExecute(Sender);
   end;
end;

procedure TFormPrK_Edit_Filtr.ActionDELExecute(Sender: TObject);
begin
   if DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_FND_KATEGORY_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('ID_SP_FND_KATEGORY').AsInt64:= DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY'];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKFndKatDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         obnovitFndKat(StrToInt64(DataSetPrKFndKat.FieldValues['ID_SP_FND_KATEGORY']));
         DataSetPrKFndKat.CloseOpen(false);
     end;
end;

procedure TFormPrK_Edit_Filtr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPrK_Edit_Filtr.cxGridPrKFndKompDBTableView1DblClick(
  Sender: TObject);
begin
   if ResultArray['Input']['aVibrat'].AsInteger=1
      then ActionVibratFndCompExecute(sender);
end;

end.
