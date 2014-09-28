unit uPrK_Edit_ST_RPT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGroupBox, cxSplitter,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Placemnt, dxBarExtItems, ActnList, ImgList, dxStatusBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxContainer, cxCheckBox,
  cxDBEdit,AArray,ibase,ib_externals;

type
  TFormPrK_Edit_ST_RPT = class(TForm)
    cxGridPrKTypeStat: TcxGrid;
    cxGridPrKTypeStatDBTableView1: TcxGridDBTableView;
    colTypeNAME: TcxGridDBColumn;
    colTypeSHORT_NAME: TcxGridDBColumn;
    colTypeKOD: TcxGridDBColumn;
    cxGridPrKTypeStatLevel1: TcxGridLevel;
    dxStatusBarVL: TdxStatusBar;
    ImageListPrK: TImageList;
    ActionListPrK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    ActionAddPrKStat: TAction;
    ActionChangePrKStat: TAction;
    ActionDelPrKStat: TAction;
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
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonAddPrKStat: TdxBarLargeButton;
    dxBarLargeButtonChangePrKStat: TdxBarLargeButton;
    dxBarLargeButtonDelPrKStat: TdxBarLargeButton;
    FormStoragePrK: TFormStorage;
    TransactionWritePrK: TpFIBTransaction;
    StoredProcPrK: TpFIBStoredProc;
    DataSetPrKTypeStat: TpFIBDataSet;
    TransactionReadPrK: TpFIBTransaction;
    DataBasePrK: TpFIBDatabase;
    DataSourcePrKTypeStat: TDataSource;
    cxSplitterNapr: TcxSplitter;
    cxGroupBoxPlanNabora: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    cxGridPrKStat: TcxGrid;
    cxGridPrKStatDBTableView1: TcxGridDBTableView;
    cxGridPrKStatLevel1: TcxGridLevel;
    DataSetPrKStat: TpFIBDataSet;
    DataSourcePrKStat: TDataSource;
    colTypeNPP: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxDBCheckBoxFak_center: TcxDBCheckBox;
    cxDBCheckBoxForm_obuch_kategory: TcxDBCheckBox;
    cxDBCheckBoxForm_stud: TcxDBCheckBox;
    cxDBCheckBoxCn_kat_stud: TcxDBCheckBox;
    cxDBCheckBoxType_kat_stud: TcxDBCheckBox;
    cxDBCheckBoxDerg_zakaz: TcxDBCheckBox;
    cxDBCheckBoxPotok: TcxDBCheckBox;
    colName: TcxGridDBColumn;
    colShort_name: TcxGridDBColumn;
    colMODULE_NAME: TcxGridDBColumn;
    cxEditStyleControllerPrK: TcxEditStyleController;
    procedure FormCreate(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionAddPrKStatExecute(Sender: TObject);
    procedure ActionChangePrKStatExecute(Sender: TObject);
    procedure ActionDelPrKStatExecute(Sender: TObject);
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    TextViewColor           :TColor;
    IndLang                 :integer;
    Layout: array[0.. KL_NAMELENGTH] of char;
    FSelectSQLTextPrKTypeStat: String;
    FSelectSQLTextPrKStat: String;
    procedure InicCaption;
    procedure SetSelectSQLTextPrKTypeStat(const Value: String);
    procedure SetSelectSQLTextPrKStat(const Value: String);
    procedure obnovitTypeStat(id_obnovit: int64);
    procedure obnovitStat(id_obnovit: int64);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLTextPrKTypeStat :String read FSelectSQLTextPrKTypeStat write SetSelectSQLTextPrKTypeStat;
    Property SelectSQLTextPrKStat     :String read FSelectSQLTextPrKStat write SetSelectSQLTextPrKStat;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_Edit_ST_RPT: TFormPrK_Edit_ST_RPT;

implementation
uses
  uPrK_Resources,uConstants,uPrK_Edit_Type_Stat_Edit,uPrK_Edit_Stat_Edit;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Edit_ST_RPT;
begin
   T:=TFormPrK_Edit_ST_RPT.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                  // T.ActionVibrat.Enabled:=true;
                  // T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
     fsMDIChild: begin
                 //  T.ActionVibrat.Enabled:=false;
                 //  T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;

{ TFormPrK_Edit_ST_RPT }

constructor TFormPrK_Edit_ST_RPT.Create(aOwner: TComponent;
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

procedure TFormPrK_Edit_ST_RPT.FormCreate(Sender: TObject);
begin
   iniccaption;
   SelectSQLTextPrKTypeStat  :='Select * from PRK_SP_TYPE_STAT_REPORTS_SELECT';
   SelectSQLTextPrKStat      :='Select * from PRK_SP_STAT_REPORTS_SELECT where ?Mas_id_sp_type_stat_reports=id_sp_type_stat_reports';
end;

procedure TFormPrK_Edit_ST_RPT.InicCaption;
begin
  TFormPrK_Edit_ST_RPT(self).Caption:='Справочник отчетов о ходе приемной кампании';

  colTypeNAME.Caption        :=nColName[IndLang];
  colTypeSHORT_NAME.Caption  :=nColShortName[IndLang];
  colTypeKOD.Caption         :=nColKod[IndLang];
  colTypeNPP.Caption         :=nColNpp[IndLang];

  colNAME.Caption            :=nColName[IndLang];
  colSHORT_NAME.Caption      :=nColShortName[IndLang];
  colMODULE_NAME.Caption     :=ncolMODULE_NAME[IndLang];

  cxDBCheckBoxFak_center.Properties.Caption           :=nLabelTypeDepart[IndLang];
  cxDBCheckBoxForm_obuch_kategory.Properties.Caption  :=nLabelNameObuchKat[IndLang];
  cxDBCheckBoxForm_stud.Properties.Caption            :=nLabelCnFormStud[IndLang];
  cxDBCheckBoxCn_kat_stud.Properties.Caption          :=nLabelCnKatStud[IndLang];
  cxDBCheckBoxType_kat_stud.Properties.Caption        :=nLabelTYP_KT_STD[IndLang];
  cxDBCheckBoxDerg_zakaz.Properties.Caption           :=nLabelDergZakaz[IndLang];
  cxDBCheckBoxPotok.Properties.Caption                :=nLabelPotok[IndLang];

    ActionADD.Caption                    :=nAction_Add[IndLang];
    ActionChange.Caption                 :=nAction_Change[IndLang];
    ActionDEL.Caption                    :=nAction_Del[IndLang];
    ActionView.Caption                   :=nAction_View[IndLang];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLang];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLang];
    ActionOtmena.Caption                 :=nAction_Exit[IndLang];

    ActionADD.Hint                       :=nHintAction_Add[IndLang];
    ActionChange.Hint                    :=nHintAction_Change[IndLang];
    ActionDEL.Hint                       :=nHintAction_Del[IndLang];
    ActionView.Hint                      :=nHintAction_View[IndLang];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLang];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLang];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLang];

    ActionAddPrKStat.Caption                    :=nAction_Add[IndLang];
    ActionChangePrKStat.Caption                 :=nAction_Change[IndLang];
    ActionDelPrKStat.Caption                    :=nAction_Del[IndLang];

    ActionAddPrKStat.Hint                       :=nHintAction_Add[IndLang];
    ActionChangePrKStat.Hint                    :=nHintAction_Change[IndLang];
    ActionDelPrKStat.Hint                       :=nHintAction_Del[IndLang];

end;

procedure TFormPrK_Edit_ST_RPT.SetSelectSQLTextPrKTypeStat(
  const Value: String);
begin
  FSelectSQLTextPrKTypeStat := Value;
    DataBasePrK.close;
    DataSetPrKTypeStat.Active                          :=false;
    DataBasePrK.Handle                                 :=DBHANDLE;
    DataBasePrK.DefaultTransaction                     := TransactionReadPrK;
    DataSetPrKTypeStat.Database                        := DataBasePrK;
    DataSetPrKTypeStat.Transaction                     := TransactionReadPrK;
    DataSetPrKTypeStat.SelectSQL.Clear;
    DataSetPrKTypeStat.SQLs.SelectSQL.Text             := FSelectSQLTextPrKTypeStat;
    DataSetPrKTypeStat.CloseOpen(false);
end;

procedure TFormPrK_Edit_ST_RPT.SetSelectSQLTextPrKStat(
  const Value: String);
begin
  FSelectSQLTextPrKStat := Value;
    DataSetPrKStat.Active                          :=false;
    DataSetPrKStat.Database                        := DataBasePrK;
    DataSetPrKStat.Transaction                     := TransactionReadPrK;
    DataSetPrKStat.SelectSQL.Clear;
    DataSetPrKStat.SQLs.SelectSQL.Text             := FSelectSQLTextPrKStat;
    DataSetPrKStat.CloseOpen(false);
end;

procedure TFormPrK_Edit_ST_RPT.obnovitTypeStat(id_obnovit: int64);
begin
   DataSetPrKTypeStat.CloseOpen(false);
   DataSetPrKTypeStat.Locate('id_sp_type_stat_reports',id_obnovit,[]);
end;

procedure TFormPrK_Edit_ST_RPT.obnovitStat(id_obnovit: int64);
begin
   DataSetPrKStat.CloseOpen(false);
   DataSetPrKStat.Locate('id_sp_stat_reports',id_obnovit,[]);
end;

procedure TFormPrK_Edit_ST_RPT.ActionObnovExecute(Sender: TObject);
var
  i,j:int64;
begin
    if DataSetPrKStat.FieldValues['id_sp_stat_reports']<> Null
     then j:= DataSetPrKStat.FieldValues['id_sp_stat_reports'];
    if DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']<>Null
     then i:= DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports'];
    obnovitTypeStat(i);  
    obnovitStat(j);
end;

procedure TFormPrK_Edit_ST_RPT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPrK_Edit_ST_RPT.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPrK_Edit_ST_RPT.ActionADDExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_Edit_Type_Stat_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['Name'].asString        :='' ;
   DataVLAdd['Short_Name'].AsString  :='' ;
   DataVLAdd['Kod'].AsString         :=IntToStr(DataSetPrKTypeStat.fbn('kod_max').AsInteger+1) ;
   DataVLAdd['Npp'].AsString         :=IntToStr(DataSetPrKTypeStat.fbn('npp_max').AsInteger+1) ;


   if DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']);

   T := TFormPrK_Edit_Type_Stat_Edit.Create(self,DataVLAdd);
   T.Caption :=nFormKlassSpravEdit_Add[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_TYPE_STAT_REPORTS_ADD';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('Name').AsString          :=DataVLAdd['Name'].AsString;
       StoredProcPrK.ParamByName('Short_Name').AsString    :=DataVLAdd['Short_Name'].AsString;
       StoredProcPrK.ParamByName('Kod').AsInteger          :=DataVLAdd['Kod'].AsInteger;
       StoredProcPrK.ParamByName('Npp').AsInteger          :=DataVLAdd['Npp'].AsInteger;
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

   obnovitTypeStat(DataVLAdd['ID'].AsInt64);
   DataSetPrKStat.CloseOpen(false);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionADDExecute(Sender);
end;

procedure TFormPrK_Edit_ST_RPT.ActionChangeExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_Edit_Type_Stat_Edit;
   TryAgain :boolean;
   i:int64;
begin
   if DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']<>Null
     then begin
        TryAgain:=false;
        DataVLChange :=TAArray.Create;
        DataVLChange['ID'].AsInt64           :=StrToInt64(DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']);
        DataVLChange['Name'].asString        :=DataSetPrKTypeStat.Fbn('Name').asString;
        DataVLChange['Short_Name'].AsString  :=DataSetPrKTypeStat.Fbn('Short_Name').asString;
        DataVLChange['Kod'].AsInteger        :=DataSetPrKTypeStat.fbn('Kod').AsInteger;
        DataVLChange['Npp'].AsInteger        :=DataSetPrKTypeStat.fbn('Npp').AsInteger;


        T := TFormPrK_Edit_Type_Stat_Edit.Create(self,DataVLChange);
        T.Caption :=nFormKlassSpravEdit_Change[IndLang];

        if T.ShowModal=MrOk then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_TYPE_STAT_REPORTS_CHANGE';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('id_sp_type_stat_reports').AsInt64  :=DataVLChange['ID'].AsInt64;
            StoredProcPrK.ParamByName('Name').AsString                    :=DataVLChange['Name'].AsString;
            StoredProcPrK.ParamByName('Short_Name').AsString              :=DataVLChange['Short_Name'].AsString;
            StoredProcPrK.ParamByName('Kod').AsInteger                    :=DataVLChange['Kod'].AsInteger;
            StoredProcPrK.ParamByName('Npp').AsInteger                    :=DataVLChange['Npp'].AsInteger;
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

        if DataSetPrKStat.FieldValues['id_sp_stat_reports']<>null
          then i:=DataSetPrKStat.FieldValues['id_sp_stat_reports'];
        obnovitTypeStat(DataVLChange['ID'].AsInt64);
        obnovitStat(i);
        DataVLChange.Free;
        DataVLChange:=Nil;

        if TryAgain=true
           then ActionChangeExecute(Sender);
    end;
end;

procedure TFormPrK_Edit_ST_RPT.ActionDELExecute(Sender: TObject);
begin
    if DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_TYPE_STAT_REPORTS_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('id_sp_type_stat_reports').AsInt64:= DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports'];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKTypeStatDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         obnovitTypeStat(StrToInt64(DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']));
         DataSetPrKStat.CloseOpen(false);
     end;
end;

procedure TFormPrK_Edit_ST_RPT.ActionAddPrKStatExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPrK_Edit_Stat_Edit;
   TryAgain :boolean;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;
   DataVLAdd['Name'].asString         :='' ;
   DataVLAdd['Short_Name'].AsString   :='' ;
   DataVLAdd['Module_Name'].AsString  :='' ;
   DataVLAdd['is_fak_center'].AsInteger              :=0 ;
   DataVLAdd['is_sp_form_obuch_kategory'].AsInteger  :=0 ;
   DataVLAdd['is_cn_sp_form_stud'].AsInteger         :=0 ;
   DataVLAdd['is_cn_sp_kat_stud'].AsInteger          :=0 ;
   DataVLAdd['is_sp_type_kat_stud'].AsInteger        :=0 ;
   DataVLAdd['is_sp_derg_zakaz'].AsInteger           :=0 ;
   DataVLAdd['is_sp_potok'].AsInteger                :=0 ;

   if DataSetPrKStat.FieldValues['id_sp_stat_reports']<>Null
      then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPrKStat.FieldValues['id_sp_stat_reports']);

   T := TFormPrK_Edit_Stat_Edit.Create(self,DataVLAdd);
   T.Caption :=nFormKlassSpravEdit_Add[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:='PRK_SP_STAT_REPORTS_ADD';
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('id_sp_type_stat_reports').AsInt64      :=StrToInt64(DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']);
       StoredProcPrK.ParamByName('Name').AsString          :=DataVLAdd['Name'].AsString;
       StoredProcPrK.ParamByName('Short_Name').AsString    :=DataVLAdd['Short_Name'].AsString;
       StoredProcPrK.ParamByName('Module_Name').AsString   :=DataVLAdd['Module_Name'].AsString;
       StoredProcPrK.ParamByName('is_fak_center').AsInteger              :=DataVLAdd['is_fak_center'].AsInteger;
       StoredProcPrK.ParamByName('is_sp_form_obuch_kategory').AsInteger  :=DataVLAdd['is_sp_form_obuch_kategory'].AsInteger;
       StoredProcPrK.ParamByName('is_cn_sp_form_stud').AsInteger         :=DataVLAdd['is_cn_sp_form_stud'].AsInteger;
       StoredProcPrK.ParamByName('is_cn_sp_kat_stud').AsInteger          :=DataVLAdd['is_cn_sp_kat_stud'].AsInteger;
       StoredProcPrK.ParamByName('is_sp_type_kat_stud').AsInteger        :=DataVLAdd['is_sp_type_kat_stud'].AsInteger;
       StoredProcPrK.ParamByName('is_sp_derg_zakaz').AsInteger           :=DataVLAdd['is_sp_derg_zakaz'].AsInteger;
       StoredProcPrK.ParamByName('is_sp_potok').AsInteger                :=DataVLAdd['is_sp_potok'].AsInteger;
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
   obnovitStat(DataVLAdd['ID'].AsInt64);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionAddPrKStatExecute(Sender);
end;

procedure TFormPrK_Edit_ST_RPT.ActionChangePrKStatExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPrK_Edit_Stat_Edit;
   TryAgain :boolean;
begin
   if DataSetPrKStat.FieldValues['id_sp_stat_reports']<>Null then
   begin
      TryAgain:=false;
      DataVLChange :=TAArray.Create;
      DataVLChange['ID'].AsInt64           :=StrToInt64(DataSetPrKStat.FieldValues['id_sp_stat_reports']);
      DataVLChange['Name'].asString        :=DataSetPrKStat.fbn('Name').asString;
      DataVLChange['Short_Name'].AsString  :=DataSetPrKStat.fbn('Short_Name').asString; ;
      DataVLChange['Module_Name'].AsString :=DataSetPrKStat.fbn('Module_Name').asString; ;
      DataVLChange['is_fak_center'].AsInteger              :=DataSetPrKStat.fbn('is_fak_center').AsInteger;
      DataVLChange['is_sp_form_obuch_kategory'].AsInteger  :=DataSetPrKStat.fbn('is_sp_form_obuch_kategory').AsInteger;
      DataVLChange['is_cn_sp_form_stud'].AsInteger         :=DataSetPrKStat.fbn('is_cn_sp_form_stud').AsInteger;
      DataVLChange['is_cn_sp_kat_stud'].AsInteger          :=DataSetPrKStat.fbn('is_cn_sp_kat_stud').AsInteger;
      DataVLChange['is_sp_type_kat_stud'].AsInteger        :=DataSetPrKStat.fbn('is_sp_type_kat_stud').AsInteger;
      DataVLChange['is_sp_derg_zakaz'].AsInteger           :=DataSetPrKStat.fbn('is_sp_derg_zakaz').AsInteger;
      DataVLChange['is_sp_potok'].AsInteger                :=DataSetPrKStat.fbn('is_sp_potok').AsInteger;


      T := TFormPrK_Edit_Stat_Edit.Create(self,DataVLChange);
      T.Caption :=nFormKlassSpravEdit_Change[IndLang];

      if T.ShowModal=MrOk then
       begin
          StoredProcPrK.Transaction.StartTransaction;
          StoredProcPrK.StoredProcName:='PRK_SP_STAT_REPORTS_CHANGE';
          StoredProcPrK.Prepare;
          StoredProcPrK.ParamByName('id_sp_stat_reports').AsInt64           :=DataVLChange['ID'].AsInt64;
          StoredProcPrK.ParamByName('id_sp_type_stat_reports').AsInt64      :=StrToInt64(DataSetPrKTypeStat.FieldValues['id_sp_type_stat_reports']);
          StoredProcPrK.ParamByName('Name').AsString          :=DataVLChange['Name'].AsString;
          StoredProcPrK.ParamByName('Short_Name').AsString    :=DataVLChange['Short_Name'].AsString;
          StoredProcPrK.ParamByName('Module_Name').AsString   :=DataVLChange['Module_Name'].AsString;
          StoredProcPrK.ParamByName('is_fak_center').AsInteger              :=DataVLChange['is_fak_center'].AsInteger;
          StoredProcPrK.ParamByName('is_sp_form_obuch_kategory').AsInteger  :=DataVLChange['is_sp_form_obuch_kategory'].AsInteger;
          StoredProcPrK.ParamByName('is_cn_sp_form_stud').AsInteger         :=DataVLChange['is_cn_sp_form_stud'].AsInteger;
          StoredProcPrK.ParamByName('is_cn_sp_kat_stud').AsInteger          :=DataVLChange['is_cn_sp_kat_stud'].AsInteger;
          StoredProcPrK.ParamByName('is_sp_type_kat_stud').AsInteger        :=DataVLChange['is_sp_type_kat_stud'].AsInteger;
          StoredProcPrK.ParamByName('is_sp_derg_zakaz').AsInteger           :=DataVLChange['is_sp_derg_zakaz'].AsInteger;
          StoredProcPrK.ParamByName('is_sp_potok').AsInteger                :=DataVLChange['is_sp_potok'].AsInteger;
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
      obnovitStat(DataVLChange['ID'].AsInt64);
      DataVLChange.Free;
      DataVLChange:=Nil;

      if TryAgain=true
         then ActionChangePrKStatExecute(Sender);
   end;
end;

procedure TFormPrK_Edit_ST_RPT.ActionDelPrKStatExecute(Sender: TObject);
begin
     if DataSetPrKStat.FieldValues['id_sp_stat_reports']<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_SP_STAT_REPORTS_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName('id_sp_stat_reports').AsInt64:= DataSetPrKStat.FieldValues['id_sp_stat_reports'];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKStatDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
         obnovitStat(StrToInt64(DataSetPrKStat.FieldValues['id_sp_stat_reports']));
         DataSetPrKStat.CloseOpen(false);
     end;
end;

end.
