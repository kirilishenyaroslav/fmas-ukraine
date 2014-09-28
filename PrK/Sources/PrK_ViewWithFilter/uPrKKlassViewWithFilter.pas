unit uPrKKlassViewWithFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,FIBQuery, pFIBQuery, pFIBStoredProc, DB,  FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, dxBar, dxBarExtItems, cxStyles,
  ImgList, ActnList, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid,ibase,uPrK_Resources, Placemnt, dxStatusBar,
  cxGroupBox, cxSplitter, cxContainer, cxCheckBox, StdCtrls, cxRadioGroup,
  ExtCtrls, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, RxMemDS,AArray,
  ib_externals, cxLabel, cxImage, cxDBEdit;

type
  TFormPrKKlassViewWithFilter = class(TForm)
    ActionListViewWithFilter: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ImageListViewWithFilter: TImageList;
    StyleRepositoryViewWithFilter: TcxStyleRepository;
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
    dxBarManagerViewWithFilter: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    TransactionWritePrKViewWithFilter: TpFIBTransaction;
    TransactionReadPrKViewWithFilter: TpFIBTransaction;
    DataBasePrKViewWithFilter: TpFIBDatabase;
    DataSourcePrKViewWithFilter: TDataSource;
    DataSetPrKViewWithFilter: TpFIBDataSet;
    StoredProcPrKViewWithFilter: TpFIBStoredProc;
    cxGridPrKViewWithFilter: TcxGrid;
    cxGridPrKViewWithFilterDBTableView1: TcxGridDBTableView;
    colFIO: TcxGridDBColumn;
    colSHORT_NAME_FAK: TcxGridDBColumn;
    colSHORT_NAME_SPEC: TcxGridDBColumn;
    colSHORT_NAME_FORM_STUD: TcxGridDBColumn;
    cxGridPrKViewWithFilterLevel1: TcxGridLevel;
    FormStorageViewWithFilter: TFormStorage;
    dxStatusBarVWF: TdxStatusBar;
    cxSplitterAllFilter: TcxSplitter;
    cxGroupBoxAllFilter: TcxGroupBox;
    cxGroupBoxDate: TcxGroupBox;
    cxGroupBoxMainElement: TcxGroupBox;
    cxCheckBoxFiltrOnDate: TcxCheckBox;
    cxGroupBoxDatePeriod: TcxGroupBox;
    cxCheckBoxFrom: TcxCheckBox;
    cxDateEditFrom: TcxDateEdit;
    cxDateEditTo: TcxDateEdit;
    cxCheckBoxTo: TcxCheckBox;
    RxMemoryDataPrKViewWithFilter: TRxMemoryData;
    cxGroupBoxDateRadioBut: TcxGroupBox;
    cxRadioButtonToday: TcxRadioButton;
    cxRadioButtonPeriod: TcxRadioButton;
    cxEditStyleControllerVWF: TcxEditStyleController;
    cxLabelFiltrOnDate: TcxLabel;
    cxLabelFrom: TcxLabel;
    cxLabelTo: TcxLabel;
    colIS_LOCKED: TcxGridDBColumn;
    dxBarLargeButtonAddCN: TdxBarLargeButton;
    ActionAddCN: TAction;
    dxBarLargeButtonChangeCN: TdxBarLargeButton;
    dxBarLargeButtonDelCN: TdxBarLargeButton;
    ActionChangeCN: TAction;
    ActionDelCN: TAction;
    cxGroupBoxContracts: TcxGroupBox;
    cxGridPrKContracts: TcxGrid;
    cxGridPrKContractsDBTableView1: TcxGridDBTableView;
    colNUM_DOG: TcxGridDBColumn;
    cxGridPrKContractsLevel1: TcxGridLevel;
    cxSplitterContracts: TcxSplitter;
    dxBarDockControlContracts: TdxBarDockControl;
    cxGroupBoxDataDog: TcxGroupBox;
    DataSetContrakts: TpFIBDataSet;
    DataSourceContrakts: TDataSource;
    colDATE_DOG: TcxGridDBColumn;
    colSUMMA: TcxGridDBColumn;
    cxLabelNAME_DOG_STATUS: TcxLabel;
    cxDBTextEditNAME_DOG_STATUS: TcxDBTextEdit;
    cxDBTextEditNAME_DOG_TYPE: TcxDBTextEdit;
    cxLabelNAME_DOG_TYPE: TcxLabel;
    cxLabelMFO: TcxLabel;
    cxDBTextEditMFO: TcxDBTextEdit;
    cxLabelFIO_PAYER: TcxLabel;
    cxDBTextEditFIO_PAYER: TcxDBTextEdit;
    StoredProcContracts: TpFIBStoredProc;
    dxBarLargeButtonPrintCn: TdxBarLargeButton;
    ActionPrintCn: TAction;
    ActionChangeCN_Status: TAction;
    dxBarLargeButtonChangeCN_Status: TdxBarLargeButton;
    colNOMER_DELA: TcxGridDBColumn;
    colSHORT_NAME_KAT_STUD: TcxGridDBColumn;
    cxCheckBoxFiltrOnPerekl: TcxCheckBox;
    cxLabelFiltrOnPerekl: TcxLabel;
    colID_SP_TYPE_PEREKL: TcxGridDBColumn;
    cxLabelFiltrOnZach: TcxLabel;
    cxCheckBoxFiltrOnZach: TcxCheckBox;
    procedure ActionObnovExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxRadioButtonTodayClick(Sender: TObject);
    procedure cxRadioButtonPeriodClick(Sender: TObject);
    procedure cxCheckBoxFiltrOnDatePropertiesChange(Sender: TObject);
    procedure cxCheckBoxFromPropertiesChange(Sender: TObject);
    procedure cxCheckBoxToPropertiesChange(Sender: TObject);
    procedure cxDateEditFromExit(Sender: TObject);
    procedure cxDateEditToExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionAddCNExecute(Sender: TObject);
    procedure colIS_LOCKEDCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure RxMemoryDataPrKViewWithFilterAfterScroll(DataSet: TDataSet);
    procedure ActionChangeCNExecute(Sender: TObject);
    procedure ActionDelCNExecute(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionPrintCnExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionChangeCN_StatusExecute(Sender: TObject);
    procedure cxGridPrKViewWithFilterDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DataSetContraktsAfterOpen(DataSet: TDataSet);
  private
    CanAfterScroll   :Boolean;
    DBHANDLE         :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    FInicFormCaption: string;
    FSelectSQLText: String;
    FID_NAME: string;
    FDATE_TO: TDate;
    FDATE_FROM: TDate;
    FSelectSQLTextCN: String;
    procedure SetInicFormCaption(const Value: string);
    procedure SetSelectSQLText(const Value: String);
    procedure InicalisationDataSet;
    procedure SetID_NAME(const Value: string);
    procedure ChangeZaprosOnDate;
    procedure SetDATE_FROM(const Value: TDate);
    procedure SetDATE_TO(const Value: TDate);
    procedure SetSelectSQLTextCN(const Value: String);
  public
    IndLangVWF       :Integer;
    TextViewColorVWF :TColor;
    ID_User_Global   :Int64;
    User_Name_Global :String;
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    procedure InicCaption; virtual;
    procedure Obnovit(id_obnovit: int64);
    procedure ObnovitCn(id_obnovit: int64);
    procedure GetFilterParams;
    Property ID_NAME        :string read FID_NAME write SetID_NAME;
    Property SelectSQLText  :String read FSelectSQLText write SetSelectSQLText;
    Property SelectSQLTextCN:String read FSelectSQLTextCN write SetSelectSQLTextCN;
    Property InicFormCaption:string read FInicFormCaption write SetInicFormCaption;
    Property DATE_FROM      :TDate read FDATE_FROM write SetDATE_FROM;
    Property DATE_TO        :TDate read FDATE_TO write SetDATE_TO;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrKKlassViewWithFilter: TFormPrKKlassViewWithFilter;

implementation
uses
    uConstants, DateUtils,uPrK_Loader,
    cn_Common_Types,cn_Common_Loader;

{$R *.dfm}
procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
   T: TFormPrKKlassViewWithFilter;
begin
   T :=TFormPrKKlassViewWithFilter.Create(aOwner,aParam);
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

{ TFormPrKKlassViewWithFilter }

constructor TFormPrKKlassViewWithFilter.Create(aOwner: TComponent;
  aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLangVWF       :=SelectLanguage;
      TextViewColorVWF :=cl3DLight;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color     := $00EBC4A4;
          cxStyleInactive.Color               := $00F7EAD9;
          cxEditStyleControllerVWF.Style.Color := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrKKlassViewWithFilter.FormCreate(Sender: TObject);
begin
  ID_NAME              :='ID_DT_ABIT';

  DATE_FROM :=today;
  DATE_TO   :=today;
  cxDateEditFrom.Date :=DATE_FROM;
  cxDateEditTo.Date   :=DATE_TO;
  cxCheckBoxFiltrOnDate.Checked :=true;
  cxCheckBoxFiltrOnPerekl.Checked:=True;

  CanAfterScroll:=False;

  SelectSQLText        :='Select *  from PRK_DT_ABIT_LIST_SELECT(:ID_SP_GOD_NABORA) where 1=1';
  SelectSQLTextCN      :='Select * from PRK_ABIT_DOG_INFO_SELECT(:ID_DT_ABIT)';
  InicFormCaption      :=nFormPrKKlassViewWithFilter_Caption[IndLangVWF];

  ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
  User_Name_Global       :='Abityrient';
  {DATE_FROM :=today;
  DATE_TO   :=today;
  cxDateEditFrom.Date :=DATE_FROM;
  cxDateEditTo.Date   :=DATE_TO;
  cxCheckBoxFiltrOnDate.Checked :=true;  }

  CanAfterScroll      :=True;

end;

procedure TFormPrKKlassViewWithFilter.InicCaption;
begin
    dxBarManagerViewWithFilter.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerViewWithFilter.Bars[0].ShowMark       :=false;
    dxBarManagerViewWithFilter.CanCustomize           :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowClose       :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowCustomizing    :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerViewWithFilter.Bars[0].AllowReset                :=false;

    TFormPrKKlassViewWithFilter(self).Caption     :=InicFormCaption;
    ActionADD.Caption                    :=nAction_Add[IndLangVWF];
    ActionChange.Caption                 :=nAction_Change[IndLangVWF];
    ActionDEL.Caption                    :=nAction_Del[IndLangVWF];
    ActionView.Caption                   :=nAction_View[IndLangVWF];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLangVWF];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLangVWF];
    ActionOtmena.Caption                 :=nAction_Exit[IndLangVWF];

    ActionADD.Hint                       :=nHintAction_Add[IndLangVWF];
    ActionChange.Hint                    :=nHintAction_Change[IndLangVWF];
    ActionDEL.Hint                       :=nHintAction_Del[IndLangVWF];
    ActionView.Hint                      :=nHintAction_View[IndLangVWF];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLangVWF];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLangVWF];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLangVWF];

    dxStatusBarVWF.Panels[0].Text          :=nStatBarAdd[IndLangVWF];
    dxStatusBarVWF.Panels[1].Text          :=nStatBarChange[IndLangVWF];
    dxStatusBarVWF.Panels[2].Text          :=nStatBarDel[IndLangVWF];
    dxStatusBarVWF.Panels[3].Text          :=nStatBarVibrat[IndLangVWF];
    dxStatusBarVWF.Panels[4].Text          :=nStatBarObnov[IndLangVWF];
    dxStatusBarVWF.Panels[5].Text          :=nStatBarExit[IndLangVWF];

    colFIO.Caption                         :=ncolFIO[IndLangVWF];
    colNOMER_DELA.Caption                  :=ncolNOMER_DELA[IndLangVWF];
    colSHORT_NAME_FAK.Caption              :=ncolNAME_FAK[IndLangVWF];
    colSHORT_NAME_SPEC.Caption             :=ncolNAME_SPEC[IndLangVWF];
    colSHORT_NAME_FORM_STUD.Caption        :=ncolSHORT_NAME_CN_FORM_STUD[IndLangVWF];
    colSHORT_NAME_KAT_STUD.Caption         :=ncolSHORT_NAME_CN_KAT_STUD[IndLangVWF];
    colIS_LOCKED.Caption                   :=ncolIS_LOCKED[IndLangVWF];

    cxGroupBoxDate.Caption                 :=ncxGroupBoxDate[IndLangVWF];

    cxLabelFiltrOnDate.Caption             :=nLabelFiltrOnDate[IndLangVWF];
    cxLabelFiltrOnPerekl.Caption           :=nLabelFiltrOnPerekl[IndLangVWF];
    cxLabelFiltrOnZach.Caption             :=nLabelFiltrOnZach[IndLangVWF];
    cxLabelFrom.Caption                    :=nLabelFrom[IndLangVWF];
    cxLabelTo.Caption                      :=nLabelTo[IndLangVWF];
    cxRadioButtonToday.Caption             :=nLabelOnToday[IndLangVWF];
    cxRadioButtonPeriod.Caption            :=nLabelOnPeriod[IndLangVWF];

    ActionAddCN.Caption                    :=nActionAddCN[IndLangVWF];
    ActionChangeCN.Caption                 :=nActionChangeCN[IndLangVWF];
    ActionDelCN.Caption                    :=nActionDelCN[IndLangVWF];
    ActionPrintCn.Caption                  :=nActiontPrint[IndLangVWF];
    ActionChangeCN_Status.Caption          :=nActionChangeCN_Status[IndLangVWF];
    ActionAddCN.Hint                       :=nHintAction_Add[IndLangVWF];
    ActionChangeCN.Hint                    :=nHintAction_Change[IndLangVWF];
    ActionDelCN.Hint                       :=nHintAction_Del[IndLangVWF];
    ActionPrintCn.Hint                     :=nHintActiontPrint[IndLangVWF];
    ActionChangeCN_Status.Hint             :=nHintActionChangeCN_Status[IndLangVWF];

    cxGroupBoxContracts.Caption            :=ncxGroupBoxContracts[IndLangVWF];
    cxGroupBoxAllFilter.Caption            :=ncxGroupBoxFilter[IndLangVWF];

    colNUM_DOG.Caption                     :=ncolNUM_DOG[IndLangVWF];
    colDATE_DOG.Caption                    :=ncolDATE_DOG[IndLangVWF];
    colSUMMA.Caption                       :=ncolSUMMA[IndLangVWF];

    cxLabelNAME_DOG_STATUS.Caption         :=nLabelNAME_DOG_STATUS[IndLangVWF];
    cxLabelNAME_DOG_TYPE.Caption           :=nLabelNAME_DOG_TYPE[IndLangVWF];
    cxLabelMFO.Caption                     :=nLabelMFO[IndLangVWF];
    cxLabelFIO_PAYER.Caption               :=nLabelFIO_PAYER[IndLangVWF];

end;

procedure TFormPrKKlassViewWithFilter.SetInicFormCaption(
  const Value: string);
begin
  FInicFormCaption := Value;
  InicCaption;
end;

{ вызывается при иниц. SelectSQLText }
procedure TFormPrKKlassViewWithFilter.InicalisationDataSet;
begin
    DataBasePrKViewWithFilter.close;
    DataSetPrKViewWithFilter.Active                         :=false;
    DataBasePrKViewWithFilter.Handle                        :=DBHANDLE;
    DataBasePrKViewWithFilter.DefaultTransaction            := TransactionReadPrKViewWithFilter;
    DataSetPrKViewWithFilter.Database                       := DataBasePrKViewWithFilter;
    DataSetPrKViewWithFilter.Transaction                    := TransactionReadPrKViewWithFilter;
    DataSetPrKViewWithFilter.SelectSQL.Clear;
    DataSetPrKViewWithFilter.SQLs.SelectSQL.Text            :=FSelectSQLText;
{    if  cxCheckBoxFiltrOnDate.Checked =true
     then ChangeZaprosOnDate;

    cxCheckBoxFiltrOnPereklPropertiesChange(Self); }

    GetFilterParams;

    DataSetPrKViewWithFilter.ParamByName('ID_SP_GOD_NABORA').AsInt64 :=ResultArray['Input']['GodNabora'].AsInt64;
    DataSetPrKViewWithFilter.CloseOpen(false);
    DataSetPrKViewWithFilter.FetchAll;
{    RxMemoryDataPrKViewWithFilter.LoadFromDataSet(DataSetPrKViewWithFilter,DataSetPrKViewWithFilter.RecordCount,lmCopy);
    DataSetPrKViewWithFilter.Active:=false;}

   // ResultArray:=null;
end;

procedure TFormPrKKlassViewWithFilter.SetSelectSQLText(
  const Value: String);
begin
  FSelectSQLText := Value;
  InicalisationDataSet;
end;

procedure TFormPrKKlassViewWithFilter.SetSelectSQLTextCN(
  const Value: String);
begin
  FSelectSQLTextCN := Value;
    DataSetContrakts.Active                           :=false;
    DataSetContrakts.Database                         := DataBasePrKViewWithFilter;
    DataSetContrakts.Transaction                      := TransactionReadPrKViewWithFilter;
    DataSetContrakts.SelectSQL.Clear;
    DataSetContrakts.SQLs.SelectSQL.Text              :=FSelectSQLTextCN;
    if {RxMemoryDataPrKViewWithFilter} DataSetPrKViewWithFilter.fieldValues['ID_DT_ABIT']<>null
     then DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64:=DataSetPrKViewWithFilter.fieldValues['ID_DT_ABIT']
     else DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64:=-1;
    DataSetContrakts.CloseOpen(false);
end;


procedure TFormPrKKlassViewWithFilter.ActionADDExecute(Sender: TObject);
var
  InOutParam   :TAArray;
  id_dog_obnov :Int64;
begin
  InOutParam :=TAArray.Create;
    InOutParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKViewWithFilter.Handle);
    InOutParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InOutParam['Input']['GodNabora'].AsInt64            := ResultArray['Input']['GodNabora'].AsInt64;
    InOutParam['Input']['Rejim'].AsVariant              := AddPrK;
    InOutParam['Input']['ID_DT_ABIT'].AsInt64           :=-1;  {08.02.06 может из-за этого будет глюк}
    InOutParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  uPrK_Loader.ShowAbit(self,InOutParam);


  if InOutParam['Output']['ID_ABIT_OUT'].AsInt64<0 then
  begin
    ActionObnovExecute(sender);
  end
  else begin
    if DataSetContrakts.FieldValues['ID_DT_ABIT_DOG']<>null
     then id_dog_obnov:=DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];

    Obnovit(InOutParam['Output']['ID_ABIT_OUT'].AsInt64);
    DataSetContrakts.CloseOpen(false);
    ObnovitCn(id_dog_obnov);
  end;

  InOutParam.Free;
  InOutParam :=Nil;
end;

procedure TFormPrKKlassViewWithFilter.ActionChangeExecute(Sender: TObject);
var
  InputParam :TAArray;
begin
  if {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_DT_ABIT']<>Null then
  begin
    InputParam :=TAArray.Create;
      InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKViewWithFilter.Handle);
      InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
      InputParam['Input']['GodNabora'].AsInt64            := ResultArray['Input']['GodNabora'].AsInt64;
      InputParam['Input']['ID_DT_ABIT'].AsInt64           := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldByName('ID_DT_ABIT').value;
      InputParam['Input']['Rejim'].AsVariant              := ChangePrk;
      InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;  {08.02.06}
    uPrK_Loader.ShowAbit(self,InputParam);
    InputParam.Free;
    InputParam:=nil;
  end;
// ActionObnovExecute(sender);
end;

procedure TFormPrKKlassViewWithFilter.ActionDELExecute(Sender: TObject);
var
  InputParam :TAArray;
begin
  if {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_DT_ABIT']<>Null then
  begin
    InputParam :=TAArray.Create;
      InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKViewWithFilter.Handle);
      InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
      InputParam['Input']['GodNabora'].AsInt64            := ResultArray['Input']['GodNabora'].AsInt64;
      InputParam['Input']['ID_DT_ABIT'].AsInt64           := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldByName('ID_DT_ABIT').value;
      InputParam['Input']['Rejim'].AsVariant              := DelPrk;
      InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;  {08.02.06}
    uPrK_Loader.ShowAbit(self,InputParam);
    InputParam.Free;
    InputParam:=nil;
  end;

 ActionObnovExecute(sender);
end;

procedure TFormPrKKlassViewWithFilter.ActionViewExecute(Sender: TObject);
var
  InputParam :TAArray;
begin
  if {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_DT_ABIT']<>Null then
  begin
    InputParam :=TAArray.Create;
      InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrKViewWithFilter.Handle);
      InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
      InputParam['Input']['GodNabora'].AsInt64            := ResultArray['Input']['GodNabora'].AsInt64;
      InputParam['Input']['ID_DT_ABIT'].AsInt64           := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldByName('ID_DT_ABIT').value;
      InputParam['Input']['Rejim'].AsVariant              := ViewPrK;
    uPrK_Loader.ShowAbit(self,InputParam);
    InputParam.Free;
    InputParam:=nil;
  end;
end;

procedure TFormPrKKlassViewWithFilter.ActionObnovExecute(Sender: TObject);
var
  i:Int64;
  id_dog_obnov:int64;
begin
   cxGridPrKViewWithFilter.SetFocus;
   if {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues[ID_NAME]<>null
   then i:= StrToInt64({RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues[ID_NAME]);
   if DataSetContrakts.FieldValues['ID_DT_ABIT_DOG']<>null
   then id_dog_obnov:=DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
   Obnovit(i);
//   DataSetContrakts.CloseOpen(false);
   ObnovitCn(id_dog_obnov);
end;

procedure TFormPrKKlassViewWithFilter.SetID_NAME(const Value: string);
begin
  if Trim(Value)='' then ShowMessage('Пустое имя id!!!'+CHR(13)+
                   'Дальнейшая работа программы будет неверной!');
  FID_NAME := Value;
end;

procedure TFormPrKKlassViewWithFilter.Obnovit(id_obnovit: int64);
begin
 //  RxMemoryDataPrKViewWithFilter.LoadFromDataSet(DataSetPrKViewWithFilter,DataSetPrKViewWithFilter.RecordCount,lmCopy);
 // не понял а зачем сначала LoadFromDataSet а потом DataSetPrKViewWithFilter.CloseOpen(false);
   CanAfterScroll:=false;
   GetFilterParams;
 {//}  DataSetPrKViewWithFilter.CloseOpen(false);
 //  DataSetPrKViewWithFilter.Active:=false;
   {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.Locate(ID_NAME,id_obnovit,[]);
   CanAfterScroll:=true;
end;

procedure TFormPrKKlassViewWithFilter.ObnovitCn(id_obnovit: int64);
begin
   DataSetContrakts.Active:=false;
   if {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.fieldValues['ID_DT_ABIT']<> null
    then DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64:={RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.fieldValues['ID_DT_ABIT']
    else DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64:=-1;
   DataSetContrakts.CloseOpen(false);
   if DataSetContrakts.FieldValues['ID_DT_ABIT_DOG']<>null
    then DataSetContrakts.Locate('ID_DT_ABIT_DOG',id_obnovit,[]);
end;

procedure TFormPrKKlassViewWithFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then Action:=caFree;
end;

procedure TFormPrKKlassViewWithFilter.cxRadioButtonTodayClick(
  Sender: TObject);
begin
  cxGroupBoxDatePeriod.Visible:=false;
  DATE_FROM:=Today;
  DATE_TO  :=Today;
end;

procedure TFormPrKKlassViewWithFilter.cxRadioButtonPeriodClick(
  Sender: TObject);
begin
  cxGroupBoxDatePeriod.Visible:=true;

  if cxCheckBoxFrom.Checked=true
    then begin
      DATE_FROM:=cxDateEditFrom.Date;
      cxDateEditFrom.Enabled:=true;
    end
    else begin
      DATE_FROM:=0;
      cxDateEditFrom.Enabled:=false;
    end;

  if cxCheckBoxTo.Checked=true
    then begin
      DATE_TO:=cxDateEditTo.Date;
      cxDateEditTo.Enabled:=true;
    end
    else begin
      DATE_TO:=99999999;
      cxDateEditTo.Enabled:=false;
    end;
end;

procedure TFormPrKKlassViewWithFilter.ChangeZaprosOnDate;
var
   DateSQLText: string;
begin

   DateSQLText:='and DATE_APPEND_REC between :DATE_FROM  and :DATE_TO';
   if cxCheckBoxFiltrOnDate.Checked=true
    then begin
      DataSetPrKViewWithFilter.SQLs.SelectSQL.Add(DateSQLText);
      DataSetPrKViewWithFilter.ParamByName('DATE_FROM').AsDate :=DATE_FROM;
      DataSetPrKViewWithFilter.ParamByName('DATE_TO').AsDate   :=DATE_TO;
    end
    else
      if DataSetPrKViewWithFilter.SQLs.SelectSQL.IndexOf(DateSQLText)<>-1 then
        DataSetPrKViewWithFilter.SQLs.SelectSQL.Delete(DataSetPrKViewWithFilter.SQLs.SelectSQL.IndexOf(DateSQLText));
end;

procedure TFormPrKKlassViewWithFilter.cxCheckBoxFiltrOnDatePropertiesChange(
  Sender: TObject);
begin
  if cxCheckBoxFiltrOnDate.Checked =true
     then cxGroupBoxDate.Visible:=true
     else cxGroupBoxDate.Visible:=false;
end;

procedure TFormPrKKlassViewWithFilter.SetDATE_FROM(const Value: TDate);
begin
   FDATE_FROM := Value;
   if cxCheckBoxFiltrOnDate.Checked=true
    then  DataSetPrKViewWithFilter.ParamByName('DATE_FROM').AsDate :=FDATE_FROM;
end;

procedure TFormPrKKlassViewWithFilter.SetDATE_TO(const Value: TDate);
begin
  FDATE_TO := Value;
  if cxCheckBoxFiltrOnDate.Checked=true
    then DataSetPrKViewWithFilter.ParamByName('DATE_TO').AsDate := FDATE_TO;
end;

procedure TFormPrKKlassViewWithFilter.cxCheckBoxFromPropertiesChange(
  Sender: TObject);
begin
   if cxCheckBoxFrom.Checked=true
    then begin
      DATE_FROM:=cxDateEditFrom.Date;
      cxDateEditFrom.Enabled:=true;
    end
    else begin
      DATE_FROM:=0;
      cxDateEditFrom.Enabled:=false;
    end;
end;

procedure TFormPrKKlassViewWithFilter.cxCheckBoxToPropertiesChange(
  Sender: TObject);
begin
  if cxCheckBoxTo.Checked=true
    then begin
      DATE_TO:=cxDateEditTo.Date;
      cxDateEditTo.Enabled:=true;
    end
    else begin
      DATE_TO:=99999999;
      cxDateEditTo.Enabled:=false;
    end;
end;

procedure TFormPrKKlassViewWithFilter.cxDateEditFromExit(Sender: TObject);
begin
  DATE_FROM:=cxDateEditFrom.Date;
end;

procedure TFormPrKKlassViewWithFilter.cxDateEditToExit(Sender: TObject);
begin
  DATE_TO:=cxDateEditTo.Date;
end;

procedure TFormPrKKlassViewWithFilter.ActionOtmenaExecute(Sender: TObject);
begin
   close;
end;

procedure TFormPrKKlassViewWithFilter.ActionAddCNExecute(Sender: TObject);
 var
  AParameter      :TcnSimpleParamsAbiturient; // класс параметров для создания подключения
  cnParamsRecord  :TcnParamsToAddContract; // тип-запись для входящих параметров по обучению
  res: Variant; //результат работы справочника
  id_dog_obnov :int64;
 begin
  if {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_DT_ABIT']<>Null then
  begin
      // запуск справочника
      AParameter:= TcnSimpleParamsAbiturient.Create; // создать класс подключения
      AParameter.Owner           :=self;// владелец
      AParameter.Db_Handle       := DataBasePrKViewWithFilter.Handle;// хендл базы
      AParameter.ID_User         := ID_User_Global;  //иде-р пользователя в системе ?
      AParameter.User_Name       := User_Name_Global;//имя пользователя  ?
      AParameter.Formstyle       := fsNormal;        // тип формы
      AParameter.WaitPakageOwner := self;            // владелец окна ожидания загрузки
      AParameter.WorkMode        := 'extra';         // тип вызова - "extra" означает для системы абитуриент
      AParameter.ActionMode      := 'add';           // режим работы в системе - "добавление контракта"
      // входящие параметры
      if DataSetContrakts.RecordCount=0
       then cnParamsRecord.ID_DOG_STATUS := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_DOG_STATUS_CANDIDATE']
       else cnParamsRecord.ID_DOG_STATUS := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_DOG_STATUS_PROJECT'];

      cnParamsRecord.ID_DEPARTMENT := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_SP_DEPARTMENT_FAK'];
      cnParamsRecord.ID_SPEC       := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_SP_SPEC'];
      cnParamsRecord.ID_GROUP      := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_GROUP'];
      cnParamsRecord.ID_FORM_STUD  := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_CN_SP_FORM_STUD'];
      cnParamsRecord.ID_KAT_STUD   := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_CN_SP_KAT_STUD'];
      cnParamsRecord.ID_NATIONAL   := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_NATIONAL'];
      cnParamsRecord.KURS          := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['KOD_KURS'];
      cnParamsRecord.DATE_BEG      := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['DATE_BEG'];
      cnParamsRecord.DATE_END      := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['DATE_END'];
      cnParamsRecord.ID_MAN        := {RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_MAN'];
      AParameter.cnParamsToAddContract := cnParamsRecord;

      res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl','ShowContracts'); // вызов

    //если есть результат - вывожу
      if VarArrayDimCount(Res)>0
       then begin
         if ((Res[0]<>0) and (Res[0]<>-1)) then
          begin
              StoredProcContracts.Transaction.StartTransaction;
              StoredProcContracts.StoredProcName:='PRK_DT_ABIT_DOG_CHANGE';
              StoredProcContracts.Prepare;
              StoredProcContracts.ParamByName('ID_DT_ABIT_DOG').AsInt64   :=-1;//DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
              StoredProcContracts.ParamByName('ID_DT_ABIT').AsInt64       :={RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues['ID_DT_ABIT'];
              StoredProcContracts.ParamByName('ID_DOG').AsInt64           :=Res[0];
              StoredProcContracts.ParamByName('ID_USER').AsInt64          :=ID_User_Global;
              try
                 StoredProcContracts.ExecProc;
                 StoredProcContracts.Transaction.Commit;
                 id_dog_obnov:=StoredProcContracts.FieldByName('ID_OUT').AsInt64;
              except on e: Exception do
                begin
                   MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVWF]+chr(13)+
                          nMsgTryAgain[IndLangVWF]+nMsgOr[IndLangVWF]+nMsgToAdmin[IndLangVWF]+chr(13)+
                          e.Message),Pchar(nMsgBoxTitle[IndLangVWF]),MB_OK or MB_ICONWARNING);
                   StoredProcContracts.Transaction.Rollback;
                end;
              end;
              Obnovit({RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues[ID_NAME]);
              ObnovitCn(id_dog_obnov);
          end;
       end;
      AParameter.Free;
   end;
end;

procedure TFormPrKKlassViewWithFilter.ActionChangeCNExecute(
  Sender: TObject);
var
  AParameter      :TcnSimpleParamsAbiturient;
  cnParamsRecord  :TcnParamsToAddContract;
  cnParamsIds     :TcnParamsToPakage; //тип-запись для вх.параметров по контракту
  res             :Variant;
  id_dog_obnov    :int64;
begin
  if DataSetContrakts.FieldValues['ID_DOG']<>Null then
   begin
      // запуск справочника
      AParameter:= TcnSimpleParamsAbiturient.Create;
      AParameter.Owner          :=self;
      AParameter.Db_Handle      := DataBasePrKViewWithFilter.Handle;
      AParameter.ID_User        := ID_User_Global;
      AParameter.User_Name      := User_Name_Global;
      AParameter.Formstyle      := fsNormal;
      AParameter.WaitPakageOwner:= self;
      AParameter.WorkMode       := 'extra';
      AParameter.ActionMode     := 'edit'; // редактирование

      cnParamsIds.ID_DOG := DataSetContrakts.FieldValues['ID_DOG']; // вх. параметр
      AParameter.cnParamsToPakage := cnParamsIds;
      AParameter.cnParamsToAddContract := cnParamsRecord;
      RunFunctionFromPackage(AParameter, 'Contracts\cn_Contracts.bpl','ShowContracts');
      AParameter.Free;
      id_dog_obnov:=DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
      Obnovit({RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues[ID_NAME]);
      ObnovitCn(id_dog_obnov);
   end;
end;

procedure TFormPrKKlassViewWithFilter.ActionDelCNExecute(Sender: TObject);
var
 id_dog_obnov :int64;
begin
  if DataSetContrakts.FieldValues['ID_DOG']<>Null then
   begin
     if prkMessageDlg(nMsgBoxTitle[IndLangVWF],nMsgDelContract[IndLangVWF],
                        mtInformation,mbOKCancel,IndLangVWF)=mrOK then
         begin
            StoredProcContracts.Transaction.StartTransaction;
            StoredProcContracts.StoredProcName:='CN_DELETE_CONTRACT_BY_ID_DOG';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_DOG').AsInt64:=DataSetContrakts.FieldValues['ID_DOG'];
            StoredProcContracts.ExecProc;


            StoredProcContracts.StoredProcName:='PRK_DT_ABIT_DOG_DEL';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_USER').AsInt64 :=ID_User_Global;
            StoredProcContracts.ParamByName('ID_DT_ABIT_DOG').AsInt64  :=DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
            StoredProcContracts.ExecProc;
            try
              StoredProcContracts.Transaction.Commit;
              cxGridPrKContractsDBTableView1.NavigatorButtons.Prior.Click;
              id_dog_obnov:=DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVWF]+chr(13)+
                        nMsgTryAgain[IndLangVWF]+nMsgOr[IndLangVWF]+nMsgToAdmin[IndLangVWF]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVWF]),MB_OK or MB_ICONWARNING);
                 StoredProcContracts.Transaction.Rollback;
               end;
            end;
         end;

          Obnovit(StrToInt64({RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues[ID_NAME]));
          ObnovitCn(id_dog_obnov);
   end;
end;



procedure TFormPrKKlassViewWithFilter.colIS_LOCKEDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if (AviewInfo.GridRecord.Values[cxGridPrKViewWithFilterDBTableView1.IndexOfItem(
          cxGridPrKViewWithFilterDBTableView1.FindItemByName('colIS_LOCKED'))]) = 1 then
   begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(ImageListViewWithFilter, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 0);
            ADone := True;
   end
   else begin
           ACanvas.FillRect(AViewInfo.Bounds);
           ADone := True;
   end;

end;

procedure TFormPrKKlassViewWithFilter.RxMemoryDataPrKViewWithFilterAfterScroll(
  DataSet: TDataSet);
begin
{   if DataSetPrKViewWithFilter.Active=false then
   begin    }
     if CanAfterScroll=true then
     begin
      DataSetContrakts.Active                           :=false;
      if DataSetPrKViewWithFilter.fieldValues['ID_DT_ABIT']<>Null then
        DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64:={RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.fieldValues['ID_DT_ABIT']
      else
        DataSetContrakts.ParamByName('ID_DT_ABIT').AsInt64:=-1;
      DataSetContrakts.CloseOpen(false);
     // Проверяем, можно ли работать с договорами
     end;
{   end; }
end;

procedure TFormPrKKlassViewWithFilter.ActionPrintCnExecute(
  Sender: TObject);
var
   AParam: TcnSimpleParamsEx;
begin
  if DataSetContrakts.FieldValues['ID_DOG']=Null
   then exit;
  AParam := TcnSimpleParamsEx.Create;
  AParam.Owner                   := self;
  AParam.Db_Handle               := DataBasePrKViewWithFilter.Handle;
  AParam.cnParamsToPakage.ID_DOG :=DataSetContrakts.FieldValues['ID_DOG'];
  AParam.WaitPakageOwner         :=self;
  RunFunctionFromPackage(AParam, 'Contracts\cn_PrintDogovor.bpl','PrintDogovor');
  AParam.Free;
end;

procedure TFormPrKKlassViewWithFilter.ActionChangeCN_StatusExecute(
  Sender: TObject);
var
 id_dog_obnov :int64;
begin
  if DataSetContrakts.FieldValues['ID_DOG']<>Null then
   begin
     if prkMessageDlg(nMsgBoxTitle[IndLangVWF],nMsgChangeCN_Status[IndLangVWF],
                        mtInformation,mbOKCancel,IndLangVWF)=mrOK then
         begin
            id_dog_obnov:=DataSetContrakts.FieldValues['ID_DT_ABIT_DOG'];

            StoredProcContracts.Transaction.StartTransaction; 
            StoredProcContracts.StoredProcName:='PRK_ABIT_DOG_SET_CANDIDATE';
            StoredProcContracts.Prepare;
            StoredProcContracts.ParamByName('ID_DT_ABIT').AsInt64  :={RxMemoryDataPrKViewWithFilter}DataSetPrKViewWithFilter.FieldValues[ID_NAME];
            StoredProcContracts.ParamByName('ID_DOG').AsInt64      :=DataSetContrakts.FieldValues['ID_DOG'];
            try
              StoredProcContracts.ExecProc;
              StoredProcContracts.Transaction.Commit;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangVWF]+chr(13)+
                        nMsgTryAgain[IndLangVWF]+nMsgOr[IndLangVWF]+nMsgToAdmin[IndLangVWF]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangVWF]),MB_OK or MB_ICONWARNING);
                 StoredProcContracts.Transaction.Rollback;
               end;
            end;
         end;

         // Obnovit(StrToInt64(RxMemoryDataPrKViewWithFilter.FieldValues[ID_NAME]));
          ObnovitCn(id_dog_obnov);
   end;
end;

procedure TFormPrKKlassViewWithFilter.cxGridPrKViewWithFilterDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
 if (AViewInfo.GridRecord.Values[7]>0)then
  begin
   ACanvas.Brush.Color := clSilver;
  end;
end;

procedure TFormPrKKlassViewWithFilter.GetFilterParams;
var
   PereklSQLText: string;
   ZachSQLText: string;
begin
  if DataSetPrKViewWithFilter.Active then DataSetPrKViewWithFilter.Close;

  ChangeZaprosOnDate;

  PereklSQLText:='and ID_SP_TYPE_PEREKL<=0';
  if cxCheckBoxFiltrOnPerekl.Checked=true then
    DataSetPrKViewWithFilter.SQLs.SelectSQL.Add(PereklSQLText)
  else
    if DataSetPrKViewWithFilter.SQLs.SelectSQL.IndexOf(PereklSQLText)<>-1 then
      DataSetPrKViewWithFilter.SQLs.SelectSQL.Delete(DataSetPrKViewWithFilter.SQLs.SelectSQL.IndexOf(PereklSQLText));

  ZachSQLText:='and ID_DT_PRIK_ZACH>0';
  if cxCheckBoxFiltrOnZach.Checked=true then
    DataSetPrKViewWithFilter.SQLs.SelectSQL.Add(ZachSQLText)
  else
    if DataSetPrKViewWithFilter.SQLs.SelectSQL.IndexOf(ZachSQLText)<>-1 then
      DataSetPrKViewWithFilter.SQLs.SelectSQL.Delete(DataSetPrKViewWithFilter.SQLs.SelectSQL.IndexOf(ZachSQLText));
end;

procedure TFormPrKKlassViewWithFilter.DataSetContraktsAfterOpen(
  DataSet: TDataSet);
begin
  if DataSetPrKViewWithFilter.IsEmpty then Exit;
     if DataSetPrKViewWithFilter['IS_DOG_LOCKED']=0 then
       begin
         ActionAddCN.Enabled          :=True;
         ActionChangeCN.Enabled       :=True;
         ActionChangeCN_Status.Enabled:=True;
         ActionDelCN.Enabled          :=True;
       end
     else
       begin
         ActionAddCN.Enabled          :=False;
         ActionChangeCN.Enabled       :=False;
         ActionChangeCN_Status.Enabled:=False;
         ActionDelCN.Enabled          :=False;
       end;
end;

end.
