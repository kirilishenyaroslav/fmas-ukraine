unit uPRK_SP_PERELIK_ISPIT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxStatusBar, cxLabel, cxContainer,
  cxTextEdit, cxDBEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxBar, cxGroupBox, cxSplitter, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Placemnt, dxBarExtItems, ActnList, ImgList,
  AArray, ibase,ib_externals, cxCheckBox;

type
  TFormPRK_SP_PERELIK_ISPIT = class(TForm)
    ImageListPrk: TImageList;
    ActionListPrK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionAddPI: TAction;
    ActionChangePI: TAction;
    ActionDelPI: TAction;
    ActionViewPI: TAction;
    StyleRepositoryPrk: TcxStyleRepository;
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
    dxBarLargeButtonAddPi: TdxBarLargeButton;
    dxBarLargeButtonChangePi: TdxBarLargeButton;
    dxBarLargeButtonDelPi: TdxBarLargeButton;
    dxBarLargeButtonViewPi: TdxBarLargeButton;
    FormStoragePrK: TFormStorage;
    TransactionWritePrK: TpFIBTransaction;
    StoredProcPrK: TpFIBStoredProc;
    DataSetPiLeft: TpFIBDataSet;
    TransactionReadPrK: TpFIBTransaction;
    DataBasePrk: TpFIBDatabase;
    DataSourcePiLeft: TDataSource;
    cxSplitterNapr: TcxSplitter;
    cxGroupBoxPerIspit: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    cxGridPrKPi: TcxGrid;
    cxGridPrKPiDBTableView1: TcxGridDBTableView;
    colPREDM: TcxGridDBColumn;
    colEKZ_FORM: TcxGridDBColumn;
    colEKZ_ORDER: TcxGridDBColumn;
    colIS_ZALIK: TcxGridDBColumn;
    cxGridPrKPiLevel1: TcxGridLevel;
    cxGroupBoxPerIspitDopData: TcxGroupBox;
    DataSetPi: TpFIBDataSet;
    DataSourcePi: TDataSource;
    dxStatusBarPi: TdxStatusBar;
    cxGroupBoxPerIspitLeft: TcxGroupBox;
    cxGridPrK_PERELIK_ISP_LEFT: TcxGrid;
    cxGridPrK_PERELIK_ISP_LEFTDBTableView1: TcxGridDBTableView;
    cxGridPrK_PERELIK_ISP_LEFTLevel1: TcxGridLevel;
    colIS_PROF_PREDMET: TcxGridDBColumn;
    colIS_SPIVBESIDA: TcxGridDBColumn;
    colIS_KOLVO_BALLOV: TcxGridDBColumn;
    cxLabelEKZFORM_PRB: TcxLabel;
    cxDBTextEditEKZFORM_PRB: TcxDBTextEdit;
    colSpec: TcxGridDBColumn;
    cxEditStyleControllerPI: TcxEditStyleController;
    collS_PREDM_DOP_TO: TcxGridDBColumn;
    colTYPE_KAT_STUD: TcxGridDBColumn;
    colOBUCH_KATEGORY: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionAddPIExecute(Sender: TObject);
    procedure ActionChangePIExecute(Sender: TObject);
    procedure ActionViewPIExecute(Sender: TObject);
    procedure ActionDelPIExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionOtmenaExecute(Sender: TObject);
  private
     ID_NAME_PI              :String;
     ID_NAME_PI_Left         :String;
     God_nabora              :Int64;
     StoredProcAddPi         :String;
     StoredProcChangePi      :String;
     StoredProcDelPi         :String;
     ResultArray             :TAArray;
     DBHANDLE                :TISC_DB_HANDLE ;
     TextViewColor           :TColor;
     IndLang                 :integer;
    FSelectSQLTextPi: String;
    FSelectSQLTextPiLeft: String;
    FInicFormCaption: String;
    procedure SetSelectSQLTextPi(const Value: String);
    procedure SetSelectSQLTextPiLeft(const Value: String);
    procedure SetInicFormCaption(const Value: String);
    procedure Obnovit(id_obnovit: int64);
    procedure ObnovitPi(id_obnovit: int64);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
     Property SelectSQLTextPi     :String read FSelectSQLTextPi write SetSelectSQLTextPi;
     Property SelectSQLTextPiLeft :String read FSelectSQLTextPiLeft write SetSelectSQLTextPiLeft;
     Property InicFormCaption     :String read FInicFormCaption write SetInicFormCaption;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPRK_SP_PERELIK_ISPIT: TFormPRK_SP_PERELIK_ISPIT;

implementation
uses
  uPrK_Resources,uConstants,
  uPRK_SP_PERELIK_ISPIT_Edit;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPRK_SP_PERELIK_ISPIT;
begin
   T:=TFormPRK_SP_PERELIK_ISPIT.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
     fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;

{ TFormPRK_SP_PERELIK_ISPIT }

constructor TFormPRK_SP_PERELIK_ISPIT.Create(aOwner: TComponent;
  aParam: TAArray);
begin
  if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      God_nabora     :=aParam['Input']['ID_SP_GOD_NABORA'].AsInt64;
      ResultArray   :=aParam;
      IndLang       :=SelectLanguage;
      TextViewColor :=cl3DLight;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color     := $00EBC4A4;
          cxStyleInactive.Color               := $00F7EAD9;
          cxEditStyleControllerPI.Style.Color := $00EBC4A4;
       end;
   end
   else ShowMessage('ќшибка HANDLE`a Ѕазы');
end;



procedure TFormPRK_SP_PERELIK_ISPIT.FormCreate(Sender: TObject);
begin
    {ID_NAME должен сто€ть первым так как в SelectSQLText может делатьс€ CloseOpen}
  ID_NAME_PI      :='ID_SP_PERELIK_ISPIT';
  ID_NAME_PI_Left :='ID_CN_SP_SPEC';

  StoredProcAddPi          :='PRK_SP_PERELIK_ISPIT_ADD';
  StoredProcChangePi       :='PRK_SP_PERELIK_ISPIT_CHANGE';
  StoredProcDelPi          :='PRK_SP_PERELIK_ISPIT_DEL';

  SelectSQLTextPiLeft  :='Select * from PRK_SP_PERELIK_ISP_LEFT_SELECT';
  SelectSQLTextPi      :='Select * from PRK_SP_PERELIK_ISPIT_SELECT('+IntToStr(God_nabora)+') where ?Mas_ID_CN_SP_SPEC=ID_SP_SPEC and ?Mas_ID_CN_SP_FORM_STUD=ID_CN_SP_FORM_STUD and ?Mas_ID_CN_SP_KAT_STUD=ID_CN_SP_KAT_STUD';

  InicFormCaption      :=nFormPRK_SP_PERELIK_ISPIT_Caption[IndLang];

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPRK_SP_PERELIK_ISPIT.SetSelectSQLTextPiLeft(
  const Value: String);
begin
  FSelectSQLTextPiLeft := Value;
    DataBasePrk.close;
    DataSetPiLeft.Active                         :=false;
    DataBasePrk.Handle                           :=DBHANDLE;
    DataBasePrk.DefaultTransaction               := TransactionReadPrK;
    DataSetPiLeft.Database                       := DataBasePrk;
    DataSetPiLeft.Transaction                    := TransactionReadPrK;
    DataSetPiLeft.SelectSQL.Clear;
    DataSetPiLeft.SQLs.SelectSQL.Text            := FSelectSQLTextPiLeft;
    DataSetPiLeft.CloseOpen(false);
end;

procedure TFormPRK_SP_PERELIK_ISPIT.SetSelectSQLTextPi(
  const Value: String);
begin
  FSelectSQLTextPi := Value;
    DataSetPi.Active :=false;
    DataSetPi.Database             := DataBasePrk;
    DataSetPi.Transaction          := TransactionReadPrK;
    DataSetPi.SelectSQL.Clear;
    DataSetPi.SQLs.SelectSQL.Text  :=FSelectSQLTextPi;
    DataSetPi.CloseOpen(false);
end;

procedure TFormPRK_SP_PERELIK_ISPIT.SetInicFormCaption(
  const Value: String);
begin
  FInicFormCaption := Value;
    dxBarManagerPrk.CanCustomize           :=false;
    dxBarManagerPrk.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerPrk.Bars[0].ShowMark       :=false;
    dxBarManagerPrk.Bars[0].AllowClose     :=false;
    dxBarManagerPrk.Bars[0].AllowCustomizing    :=false;
    dxBarManagerPrk.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerPrk.Bars[0].AllowReset                :=false;

    dxBarManagerPrk.Bars[1].BorderStyle    :=bbsNone;
    dxBarManagerPrk.Bars[1].ShowMark       :=false;
    dxBarManagerPrk.Bars[1].AllowClose       :=false;
    dxBarManagerPrk.Bars[1].AllowCustomizing    :=false;
    dxBarManagerPrk.Bars[1].AllowQuickCustomizing  :=false;
    dxBarManagerPrk.Bars[1].AllowReset                :=false;



    TFormPRK_SP_PERELIK_ISPIT(self).Caption     :=FInicFormCaption;
    ActionADD.Caption                    :=nAction_Add[IndLang];
    ActionChange.Caption                 :=nAction_Change[IndLang];
    ActionDEL.Caption                    :=nAction_Del[IndLang];
    ActionView.Caption                   :=nAction_View[IndLang];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLang];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLang];
    ActionOtmena.Caption                 :=nAction_Exit[IndLang];

    ActionAddPI.Caption                   :=nAction_Add[IndLang];
    ActionChangePI.Caption                :=nAction_Change[IndLang];
    ActionDelPI.Caption                   :=nAction_Del[IndLang];
    ActionViewPI.Caption                  :=nAction_View[IndLang];

    ActionADD.Hint                       :=nHintAction_Add[IndLang];
    ActionChange.Hint                    :=nHintAction_Change[IndLang];
    ActionDEL.Hint                       :=nHintAction_Del[IndLang];
    ActionView.Hint                      :=nHintAction_View[IndLang];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLang];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLang];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLang];

    ActionAddPI.Hint                     :=nHintAction_Add[IndLang];
    ActionChangePI.Hint                  :=nHintAction_Change[IndLang];
    ActionDelPI.Hint                     :=nHintAction_Del[IndLang];
    ActionViewPI.Hint                    :=nHintAction_View[IndLang];

    dxStatusBarPi.Panels[0].Text         :=nStatBarAdd[IndLang];
    dxStatusBarPi.Panels[1].Text         :=nStatBarChange[IndLang];
    dxStatusBarPi.Panels[2].Text         :=nStatBarDel[IndLang];
    dxStatusBarPi.Panels[3].Text         :=nStatBarVibrat[IndLang];
    dxStatusBarPi.Panels[4].Text         :=nStatBarObnov[IndLang];
    dxStatusBarPi.Panels[5].Text         :=nStatBarExit[IndLang];

    cxGroupBoxPerIspit.Caption           :=ncxGroupBoxPerIspit[IndLang];

    colSpec.Caption                      :=ncolNAME_SPEC[IndLang];
    colTYPE_KAT_STUD.Caption             :=ncolNAME_STUD[IndLang];
    colOBUCH_KATEGORY.Caption            :=ncolSHORT_NAME_CN_FORM_STUD[IndLang];

    colPREDM.Caption                     :=ncolPREDM[IndLang];
    colEKZ_FORM.Caption                  :=ncolEKZ_FORM[IndLang];
    colEKZ_ORDER.Caption                 :=nColNpp[IndLang];
    colIS_ZALIK.Caption                  :=ncolIS_ZALIK[IndLang];
    colIS_SPIVBESIDA.Caption             :=ncolIS_SPIVBESIDA[IndLang];
    colIS_KOLVO_BALLOV.Caption           :=ncolIS_KOLVO_BALLOV[IndLang];
    colIS_PROF_PREDMET.Caption           :=ncolIS_PROF_PREDMET[IndLang];
    collS_PREDM_DOP_TO.Caption           :=ncolPREDM_DOP_TO[IndLang];
    cxLabelEKZFORM_PRB.Caption           :=nLabelEKZFORM_PRB[IndLang];


end;


procedure TFormPRK_SP_PERELIK_ISPIT.ActionObnovExecute(Sender: TObject);
var
  i_left:Int64;
  i     :Int64;
  exist_i:Boolean;
begin
     exist_i:=false;
     if DataSetPiLeft.FieldValues[ID_NAME_PI_Left]<>null
      then i_left:= StrToInt64(DataSetPiLeft.FieldValues[ID_NAME_PI_Left]);

     if DataSetPi.FieldValues[ID_NAME_PI]<>null
      then begin
       i:= StrToInt64(DataSetPi.FieldValues[ID_NAME_PI]);
       exist_i:=true;
      end;
   Obnovit(i_left);
   if exist_i=true
    then ObnovitPi(i)
    else DataSetPi.CloseOpen(false);
end;

procedure TFormPRK_SP_PERELIK_ISPIT.Obnovit(id_obnovit: int64);
begin
   DataSetPiLeft.CloseOpen(false);
   DataSetPiLeft.Locate(ID_NAME_PI_Left,id_obnovit,[]);
end;

procedure TFormPRK_SP_PERELIK_ISPIT.ObnovitPi(id_obnovit: int64);
begin
   DataSetPi.CloseOpen(false);
   DataSetPi.Locate(ID_NAME_PI,id_obnovit,[]);
end;

procedure TFormPRK_SP_PERELIK_ISPIT.ActionAddPIExecute(Sender: TObject);
var
   DataVLAdd :TAArray;
   T:TFormPRK_SP_PERELIK_ISPIT_Edit;
   TryAgain :boolean;
   i: integer;
begin
   TryAgain:=false;
   DataVLAdd :=TAArray.Create;

     if DataSetPi.FieldValues[ID_NAME_PI]<>Null
        then DataVLAdd['ID'].AsInt64:=StrToInt64(DataSetPi.FieldValues[ID_NAME_PI]);


   DataVLAdd['IS_SPIVBESIDA'].AsInteger         :=0;
   DataVLAdd['IS_ZALIK'].AsInteger              :=0;
   DataVLAdd['IS_KOLVO_BALLOV'].AsInteger       :=0;
   DataVLAdd['IS_PROF_PREDMET'].AsInteger       :=0;
   DataVLAdd['SHORT_NAME_PREDM'].AsString       :='';
   DataVLAdd['SHORT_NAME_EKZFORM'].AsString     :='';
   DataVLAdd['SHORT_NAME_EKZFORM_PRB'].AsString :='';
   DataVLAdd['ID_PREDM_DOP_TO'].AsInt64         :=-1;
   DataVLAdd['ID_SP_GOD_NABORA'].AsInt64        := GOD_NABORA;

   DataVLAdd['EKZ_ORDER'].AsInteger:=0;
   i:=0;
   DataSetPi.FetchAll;
   DataSetPi.First;
        while not DataSetPi.Eof do
        begin
           // подсчет кол-ва записей-1
            DataVLAdd['All_EKZ_ORDER'].AsInteger:=i;
           // загонка всех записе в массив
            DataVLAdd['All_EKZ_ORDER'][i].AsInteger:=StrToInt(DataSetPi.FieldValues['EKZ_ORDER']);
           // поиск максимального
            if  DataVLAdd['EKZ_ORDER'].AsInteger< DataVLAdd['All_EKZ_ORDER'][i].AsInteger
             then DataVLAdd['EKZ_ORDER'].AsInteger:=DataVLAdd['All_EKZ_ORDER'][i].AsInteger;
            // продолжение цикла
            DataSetPi.Next;
            i:=i+1;
        end;
        DataVLAdd['EKZ_ORDER'].AsInteger:=DataVLAdd['EKZ_ORDER'].AsInteger+1;
        if DataSetPi.RecordCount=0
         then  DataVLAdd['IS_PROF_PREDMET'].AsInteger:=1;


   T := TFormPRK_SP_PERELIK_ISPIT_Edit.Create(self,DataVLAdd);

   T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Add[IndLang];

   if T.ShowModal=MrOk then
    begin
       StoredProcPrK.Transaction.StartTransaction;
       StoredProcPrK.StoredProcName:=StoredProcAddPi;
       StoredProcPrK.Prepare;
       StoredProcPrK.ParamByName('ID_SP_PREDM').AsInt64               :=DataVLAdd['ID_SP_PREDM'].AsInt64;
       StoredProcPrK.ParamByName('ID_SP_EKZ_FORM').AsInt64            :=DataVLAdd['ID_SP_EKZ_FORM'].AsInt64;
       StoredProcPrK.ParamByName('EKZ_ORDER').AsInteger               :=DataVLAdd['EKZ_ORDER'].AsInteger;
       StoredProcPrK.ParamByName('ID_SP_EKZFORM_PRB').AsInt64         :=DataVLAdd['ID_SP_EKZFORM_PRB'].AsInteger;

       StoredProcPrK.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetPiLeft.FieldValues['ID_CN_SP_SPEC'];
       StoredProcPrK.ParamByName('ID_CN_SP_FORM_STUD').AsInt64 :=DataSetPiLeft.FieldValues['ID_CN_SP_FORM_STUD'];
       StoredProcPrK.ParamByName('ID_CN_SP_KAT_STUD').AsInt64       :=DataSetPiLeft.FieldValues['ID_CN_SP_KAT_STUD'];

       StoredProcPrK.ParamByName('IS_SPIVBESIDA').AsInteger           :=DataVLAdd['IS_SPIVBESIDA'].AsInteger;
       StoredProcPrK.ParamByName('IS_ZALIK').AsInteger                :=DataVLAdd['IS_ZALIK'].AsInteger;
       StoredProcPrK.ParamByName('IS_KOLVO_BALLOV').AsInteger         :=DataVLAdd['IS_KOLVO_BALLOV'].AsInteger;
       StoredProcPrK.ParamByName('IS_PROF_PREDMET').AsInteger         :=DataVLAdd['IS_PROF_PREDMET'].AsInteger;
       StoredProcPrK.ParamByName('ID_PREDM_DOP_TO').AsInt64           :=DataVLAdd['ID_PREDM_DOP_TO'].AsInt64;
       StoredProcPrK.ParamByName('ID_SP_GOD_NABORA').AsInt64          :=God_nabora;
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
   ObnovitPi(DataVLAdd['ID'].AsInt64);
   DataVLAdd.Free;
   DataVLAdd:=Nil;

   if TryAgain=true
      then ActionAddPIExecute(Sender);
end;

procedure TFormPRK_SP_PERELIK_ISPIT.ActionChangePIExecute(Sender: TObject);
var
   DataVLChange :TAArray;
   T:TFormPRK_SP_PERELIK_ISPIT_Edit;
   TryAgain :boolean;
   i: integer;
begin
   TryAgain:=false;
   if DataSetPi.FieldValues[ID_NAME_PI]<>Null then
    begin
       DataVLChange :=TAArray.Create;
       DataVLChange['ID'].AsInt64                      :=DataSetPi.FieldValues[ID_NAME_PI];
       DataVLChange['IS_SPIVBESIDA'].AsInteger         :=DataSetPi.FieldValues['IS_SPIVBESIDA'];
       DataVLChange['IS_ZALIK'].AsInteger              :=DataSetPi.FieldValues['IS_ZALIK'];
       DataVLChange['IS_KOLVO_BALLOV'].AsInteger       :=DataSetPi.FieldValues['IS_KOLVO_BALLOV'];
       DataVLChange['IS_PROF_PREDMET'].AsInteger       :=DataSetPi.FieldValues['IS_PROF_PREDMET'];
       DataVLChange['ID_SP_PREDM'].AsInt64             :=DataSetPi.FieldValues['ID_SP_PREDM'];
       DataVLChange['SHORT_NAME_PREDM'].AsString       :=DataSetPi.FieldValues['SHORT_NAME_PREDM'];
       DataVLChange['ID_SP_EKZ_FORM'].AsInt64          :=DataSetPi.FieldValues['ID_SP_EKZ_FORM'];
       DataVLChange['SHORT_NAME_EKZFORM'].AsString     :=DataSetPi.FieldValues['SHORT_NAME_EKZFORM'];
       DataVLChange['EKZ_ORDER'].AsInteger             :=DataSetPi.FieldValues['EKZ_ORDER'];
       DataVLChange['ID_SP_EKZFORM_PRB'].AsInt64       :=DataSetPi.FieldValues['ID_SP_EKZFORM_PRB'];
       DataVLChange['SHORT_NAME_EKZFORM_PRB'].AsString :=DataSetPi.FieldValues['SHORT_NAME_EKZFORM_PRB'];
       DataVLChange['ID_PREDM_DOP_TO'].AsInt64         :=DataSetPi.FieldValues['ID_PREDM_DOP_TO'];
       DataVLChange['ID_SP_GOD_NABORA'].AsInt64        := GOD_NABORA;

       i:=0;
       DataSetPi.FetchAll;
       DataSetPi.First;
        while not DataSetPi.Eof do
        begin
            DataVLChange['All_EKZ_ORDER'].AsInteger:=i;
            DataVLChange['All_EKZ_ORDER'][i].AsInteger:=StrToInt(DataSetPi.FieldValues['EKZ_ORDER']);
            DataSetPi.Next;
            i:=i+1;
        end;


       T:=TFormPRK_SP_PERELIK_ISPIT_Edit.Create(self,DataVLChange);

       T.cxLabelFormCaption.Caption :=nFormKlassSpravEdit_Change[IndLang];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrK.Transaction.StartTransaction;
           StoredProcPrK.StoredProcName:=StoredProcChangePi;
           StoredProcPrK.Prepare;
           StoredProcPrK.ParamByName(ID_NAME_PI).AsInt64                  :=DataVLChange['ID'].AsInt64;
           StoredProcPrK.ParamByName('ID_SP_PREDM').AsInt64               :=DataVLChange['ID_SP_PREDM'].AsInt64;
           StoredProcPrK.ParamByName('ID_SP_EKZ_FORM').AsInt64            :=DataVLChange['ID_SP_EKZ_FORM'].AsInt64;
           StoredProcPrK.ParamByName('EKZ_ORDER').AsInteger               :=DataVLChange['EKZ_ORDER'].AsInteger;
           StoredProcPrK.ParamByName('ID_SP_EKZFORM_PRB').AsInt64         :=DataVLChange['ID_SP_EKZFORM_PRB'].AsInteger;

           StoredProcPrK.ParamByName('ID_SP_SPEC').AsInt64                :=DataSetPiLeft.FieldValues['ID_CN_SP_SPEC'];
           StoredProcPrK.ParamByName('ID_CN_SP_FORM_STUD').AsInt64 :=DataSetPiLeft.FieldValues['ID_CN_SP_FORM_STUD'];
           StoredProcPrK.ParamByName('ID_CN_SP_KAT_STUD').AsInt64       :=DataSetPiLeft.FieldValues['ID_CN_SP_KAT_STUD'];

           StoredProcPrK.ParamByName('IS_SPIVBESIDA').AsInteger           :=DataVLChange['IS_SPIVBESIDA'].AsInteger;
           StoredProcPrK.ParamByName('IS_ZALIK').AsInteger                :=DataVLChange['IS_ZALIK'].AsInteger;
           StoredProcPrK.ParamByName('IS_KOLVO_BALLOV').AsInteger         :=DataVLChange['IS_KOLVO_BALLOV'].AsInteger;
           StoredProcPrK.ParamByName('IS_PROF_PREDMET').AsInteger         :=DataVLChange['IS_PROF_PREDMET'].AsInteger;
           StoredProcPrK.ParamByName('ID_PREDM_DOP_TO').AsInt64           :=DataVLChange['ID_PREDM_DOP_TO'].AsInt64;
           StoredProcPrK.ParamByName('ID_SP_GOD_NABORA').AsInt64          := God_Nabora;
           try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
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
       ObnovitPi(DataVLChange['ID'].AsInt64);
       DataVLChange.Free;
       DataVLChange:=nil;
   end;
   if TryAgain=true
    then ActionChangePIExecute(sender);
end;

procedure TFormPRK_SP_PERELIK_ISPIT.ActionViewPIExecute(Sender: TObject);
var
   DataVLView :TAArray;
   T:TFormPRK_SP_PERELIK_ISPIT_Edit;
begin
   if DataSetPi.FieldValues[ID_NAME_PI]<>Null then
    begin
       DataVLView :=TAArray.Create;
       DataVLView['IS_SPIVBESIDA'].AsInteger         :=DataSetPi.FieldValues['IS_SPIVBESIDA'];
       DataVLView['IS_ZALIK'].AsInteger              :=DataSetPi.FieldValues['IS_ZALIK'];
       DataVLView['IS_KOLVO_BALLOV'].AsInteger       :=DataSetPi.FieldValues['IS_KOLVO_BALLOV'];
       DataVLView['IS_PROF_PREDMET'].AsInteger       :=DataSetPi.FieldValues['IS_PROF_PREDMET'];
       DataVLView['SHORT_NAME_PREDM'].AsString       :=DataSetPi.FieldValues['SHORT_NAME_PREDM'];
       DataVLView['SHORT_NAME_EKZFORM'].AsString     :=DataSetPi.FieldValues['SHORT_NAME_EKZFORM'];
       DataVLView['EKZ_ORDER'].AsInteger             :=DataSetPi.FieldValues['EKZ_ORDER'];
       DataVLView['SHORT_NAME_EKZFORM_PRB'].AsString :=DataSetPi.FieldValues['SHORT_NAME_EKZFORM_PRB'];
       DataVLView['All_EKZ_ORDER'].AsInteger         :=-1;
       DataVLView['ID_PREDM_DOP_TO'].AsInt64         :=DataSetPi.FieldValues['ID_PREDM_DOP_TO'];
       DataVLView['ID_SP_GOD_NABORA'].AsInt64        := GOD_NABORA;

       T:=TFormPRK_SP_PERELIK_ISPIT_Edit.Create(self,DataVLView);

       T.cxLabelFormCaption.Caption  :=nFormKlassSpravEdit_View[IndLang];
       T.cxButtonEditNamePredm.Properties.ReadOnly    :=true;
       T.cxButtonEditNamePredm.Properties.Buttons[0].Visible    :=false;
       T.cxButtonEditEKZ_FORM.Properties.ReadOnly     :=true;
       T.cxButtonEditEKZ_FORM.Properties.Buttons[0].Visible     :=false;
       T.cxButtonEditlEKZFORM_PRB.Properties.ReadOnly :=true;
       T.cxButtonEditlEKZFORM_PRB.Properties.Buttons[0].Visible :=false;
       T.cxTextEditEKZ_FORM_ORDER.Properties.ReadOnly   :=true;
       T.cxCheckBoxIsSpivbesida.Properties.ReadOnly     :=true;
       T.cxCheckBoxIsZalik.Properties.ReadOnly          :=true;
       T.cxCheckBoxIS_KOLVO_BALLOV.Properties.ReadOnly  :=true;
       T.cxCheckBoxIS_PROF_PREDMET.Properties.ReadOnly  :=true;
       T.cxLookupComboBoxPREDM_DOP_TO.Properties.ReadOnly:=true;

       T.cxButtonEditNamePredm.Style.Color         :=TextViewColor;
       T.cxButtonEditEKZ_FORM.Style.Color          :=TextViewColor;
       T.cxButtonEditlEKZFORM_PRB.Style.Color      :=TextViewColor;
       T.cxTextEditEKZ_FORM_ORDER.Style.Color      :=TextViewColor;
       T.cxCheckBoxIsSpivbesida.Style.Color        :=TextViewColor;
       T.cxCheckBoxIsZalik.Style.Color             :=TextViewColor;
       T.cxCheckBoxIS_KOLVO_BALLOV.Style.Color     :=TextViewColor;
       T.cxCheckBoxIS_PROF_PREDMET.Style.Color     :=TextViewColor;
       T.cxLookupComboBoxPREDM_DOP_TO.Style.Color  :=TextViewColor;
       T.ShowModal;
       T.Free;
       T:=nil;
       DataVLView.Free;
       DataVLView:=nil;
    end;
end;

procedure TFormPRK_SP_PERELIK_ISPIT.ActionDelPIExecute(Sender: TObject);
var
   id_Pi : int64;
begin
   if DataSetPi.FieldValues[ID_NAME_PI]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            if  StrToInt(DataSetPi.FieldValues['IS_PROF_PREDMET'])=1 then
             begin
                MessageBox(Handle,Pchar(nMsgExistProfPredm[IndLang]),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONINFORMATION);
                exit;
             end;

            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:=StoredProcDelPi;
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName(ID_NAME_PI).AsInt64:=DataSetPi.FieldValues[ID_NAME_PI];
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKPiDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
         end;
          id_Pi:=StrToInt64(DataSetPi.FieldValues[ID_NAME_PI]);
          Obnovit(StrToInt64(DataSetPiLeft.FieldValues[ID_NAME_PI_Left]));
          ObnovitPi(id_Pi);
     end;
end;

procedure TFormPRK_SP_PERELIK_ISPIT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPRK_SP_PERELIK_ISPIT.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

end.
