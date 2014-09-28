unit SpSotr_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxSplitter, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, IBase, SpSotr_FilterForm, cxContainer,
  cxLabel, cxDBLabel, cxTextEdit, cxDBEdit, dxBar,  Unit_zGlobal_Consts,
  z_dmCommonStyles, cxCalendar, cxGridBandedTableView,
  cxGridDBBandedTableView, cxMaskEdit, ComCtrls, dxBarExtItems,
  dxDockControl, dxDockPanel, cxMemo, PackageLoad, cxCheckBox, FIBQuery,
  pFIBQuery, pFIBStoredProc, zMessages, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxDropDownEdit, UpKernelUnit, cxButtonEdit, Menus, ZProc,
  IbDatabase, IBExternals, IB_Externals, cxHyperLinkEdit,
  accmgmt, dxStatusBar, ZTypes;


type
  TfmSpSotr = class(TForm)
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DSetMain: TpFIBDataSet;
    DSourceMain: TDataSource;
    BarManager: TdxBarManager;
    DSetDetail: TpFIBDataSet;
    DSourceDetail: TDataSource;
    DSetBanded: TpFIBDataSet;
    DSourceBanded: TDataSource;
    DSet2: TpFIBDataSet;
    DSource2: TDataSource;
    InsertBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    ShowAvgBtn: TdxBarLargeButton;
    ShowAllDataBtn: TdxBarLargeButton;
    StoredProc: TpFIBStoredProc;
    StProcTransaction: TpFIBTransaction;
    FilterBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AcctCardBtn: TdxBarLargeButton;
    AvansBtn: TdxBarLargeButton;
    pm1: TPopupMenu;
    N1: TMenuItem;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheetRmoving: TTabSheet;
    Panel2: TPanel;
    PanelDetailGrid: TPanel;
    DetailGrid: TcxGrid;
    DetailGridDBTableView1: TcxGridDBTableView;
    Grid2ClRMoving: TcxGridDBColumn;
    Grid2ClPeriodBeg: TcxGridDBColumn;
    Grid2ClPeriodEnd: TcxGridDBColumn;
    DetailGridLevel1: TcxGridLevel;
    Panel6: TPanel;
    cxSplitter2: TcxSplitter;
    Panel7: TPanel;
    DetailGridBanded: TcxGrid;
    DetailGridDBBandedTableView1: TcxGridDBBandedTableView;
    Grid22ClManMoving: TcxGridDBBandedColumn;
    Grid22ClDateBeg: TcxGridDBBandedColumn;
    Grid22ClRealDateEnd: TcxGridDBBandedColumn;
    Grid22ClNameSovmest: TcxGridDBBandedColumn;
    Grid22ClNamePost: TcxGridDBBandedColumn;
    Grid22ClStavka: TcxGridDBBandedColumn;
    Grid22ClKodSmBase: TcxGridDBBandedColumn;
    Grid22ClOkladBase: TcxGridDBBandedColumn;
    Grid22ClKodSmPPS: TcxGridDBBandedColumn;
    Grid22ClOkladPPS: TcxGridDBBandedColumn;
    DetailGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    DetailGridLevel4: TcxGridLevel;
    cxSplitter3: TcxSplitter;
    PageControl3: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    SmetaDataSet: TpFIBDataSet;
    SmetaDataSource: TDataSource;
    BonusSmetaDataSet: TpFIBDataSet;
    BonusSmetaDataSource: TDataSource;
    Panel10: TPanel;
    LabelCategor: TcxLabel;
    EditRazryad: TcxDBMaskEdit;
    LabelDepartment: TcxLabel;
    EditDepartment: TcxDBMaskEdit;
    LabelPrikaz: TcxLabel;
    EditPrikaz: TcxDBMaskEdit;
    cxLabel1: TcxLabel;
    cxDBMaskEdit1: TcxDBMaskEdit;
    PeopleGrid: TcxGrid;
    PeopleGridDBTableView1: TcxGridDBTableView;
    cmnID_MAN: TcxGridDBColumn;
    cmnID_PCARD: TcxGridDBColumn;
    cmnTN: TcxGridDBColumn;
    cmnFIO: TcxGridDBColumn;
    cmnTin: TcxGridDBColumn;
    cmnBDate: TcxGridDBColumn;
    cmnSex: TcxGridDBColumn;
    PeopleGridLevel1: TcxGridLevel;
    use_email: TcxGridDBColumn;
    Panel3: TPanel;
    Panel4: TPanel;
    DetailGrid_: TcxGrid;
    DetailGrid_DBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel5: TPanel;
    Label1: TLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDBMaskEdit2: TcxDBMaskEdit;
    cxDBMaskEdit3: TcxDBMaskEdit;
    cxDBMaskEdit4: TcxDBMaskEdit;
    cxDBMaskEdit5: TcxDBMaskEdit;
    Panel8: TPanel;
    DetailGridBanded_: TcxGrid;
    DetailGridDBBandedTableView1_: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridDBBandedColumn4: TcxGridDBBandedColumn;
    cxGridDBBandedColumn5: TcxGridDBBandedColumn;
    cxGridDBBandedColumn7: TcxGridDBBandedColumn;
    cxGridDBBandedColumn8: TcxGridDBBandedColumn;
    cxGridDBBandedColumn9: TcxGridDBBandedColumn;
    cxGridDBBandedColumn10: TcxGridDBBandedColumn;
    cxGridDBBandedColumn11: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    Panel9: TPanel;
    cxSplitter4: TcxSplitter;
    cxSplitter5: TcxSplitter;
    cxSplitter6: TcxSplitter;
    dxstsbr1: TdxStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridCurrentClKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure GridNonSpisokClKodSetup2GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure DSetBandedFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DetailGridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ShowAvgBtnClick(Sender: TObject);
    procedure PeopleGridDBTableView1KeyPress(Sender: TObject;
      var Key: Char);
    procedure ShowAllDataBtnClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure PageControl2Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure AcctCardBtnClick(Sender: TObject);
    procedure AvansBtnClick(Sender: TObject);
    procedure cmnTypePaymentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cmnShifrPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure N1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure PeoplePanelCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure cxSplitter6AfterClose(Sender: TObject);
    procedure cxSplitter6AfterOpen(Sender: TObject);
    procedure cxSplitter4AfterClose(Sender: TObject);
    procedure cxSplitter4AfterOpen(Sender: TObject);
    procedure cxSplitter5AfterClose(Sender: TObject);
    procedure cxSplitter5AfterOpen(Sender: TObject);
  private
    { Private declarations }
    PRes:Variant;
    pKodSetupBeg:Integer;
    pKodSetupEnd:Integer;
    pStylesDM:TStylesDM;
    pLanguageIndex:Byte;
    pFilterParams:TSotrFilter;
    date_beg, date_end: tdate;
    procedure ApplyFilter;
    procedure ResetDetail;
    procedure DisableAllDBControls;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;FilterParams:TZParamFilterSprDoh); reintroduce;
    property Res:Variant read PRes;
  end;

implementation

{$R *.dfm}

uses StrUtils, Dates, cxLookAndFeels, ZWait,  Math;

procedure TfmSpSotr.ResetDetail;
var id_rmoving:int64;
begin
  id_rmoving:=-1;
  if DSetDetail.Active
  then begin
            if DSetDetail.RecordCount>0
            then id_rmoving:=DSetDetail['rmoving'];
            
            DSetDetail.Close;
  end;

  if DSetBanded.Active then DSetBanded.Close;
 // if (ShowAllDataBtn=nil) or (ShowAllDataBtn.Down) then
  begin
     DSetDetail.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_RMOVING_BY_PERIOD(?OUT_ID_MAN,'''+
                                      DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order by DATE_END descending';

     DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_(?OUT_ID_MAN,'''+
                                      DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order by REAL_END descending,RMOVING';


     //DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_PERIOD(?OUT_ID_MAN,'''+
     //                                 DateToStr(pFilterParams.DateBeg)+''','''+DateToStr(pFilterParams.DateEnd)+''') order by REAL_END descending,RMOVING';
  end;
  {else
  begin
     DSetDetail.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_RMOVING_BY_PERIOD(?OUT_ID_MAN,NULL,NULL) order by DATE_END descending';

     //DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_PERIOD(?OUT_ID_MAN,NULL,NULL) order by REAL_END descending,RMOVING';

     DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_(?OUT_ID_MAN,NULL,NULL) order by REAL_END descending,RMOVING';
  end;  }
  DSetDetail.Open;
  DSetDetail.Locate('rmoving',id_rmoving,[]);
  DSetBanded.Open;
  DetailGridDBBandedTableView1.Controller.GridView.ViewData.Expand(true);
end;

procedure TfmSpSotr.ApplyFilter;
var wf:TForm;
    str:string;
    id:Integer;
begin
  id:=-1;
  wf:=ShowWaitForm(Self);
  try
    pKodSetupBeg := DateToKodSetup(pFilterParams.DateBeg);
    pKodSetupEnd := DateToKodSetup(pFilterParams.DateEnd);
    if DSetMain.Active
    then begin
              if DSetMain.RecordCount>0
              then id:=DSetMain.FieldByName('OUT_TN').Value;
              DSetMain.Close;
    end;

    str := 'SELECT DISTINCT * FROM Z_GET_SOTR_DATA(';

    if pFilterParams.Is_man then
    begin
        if pFilterParams.Tn>0
        then str := str + IntToStr(pFilterParams.Tn)+','
        else str := str + 'NULL,';
    end
    else str := str + 'NULL,';

    if pFilterParams.Is_main_job
    then str := str + '''1'','
    else str := str + 'NULL,';

    if pFilterParams.Is_notmain_job
    then str := str + '''1'','
    else str := str + 'NULL,';

    if (pFilterParams.Is_department) and (pFilterParams.Id_department>0)
    then str := str + IntToStr(pFilterParams.Id_department) + ','
    else str := str + 'NULL,';
    
    if (pFilterParams.Is_priv) and (pFilterParams.id_priv>0)                    // учитывать льготы
    then str := str + inttostr(pFilterParams.id_priv) + ',' + IfThen(pFilterParams.has_priv,'''1'',','''0'',')
    else str := str + 'NULL,NULL,';

    if (pFilterParams.Is_prop) and (pFilterParams.Id_prop>0)                    // учитывать свойства
    then str := str + inttostr(pFilterParams.id_prop) + ',' + IfThen(pFilterParams.has_prop,'''1'',','''0'',')
    else str := str + ' NULL,NULL,';

    if (pFilterParams.Is_raise) and (pFilterParams.Id_Raise>0)                  // учитывать надбавки
    then str := str + IntToStr(pFilterParams.Id_Raise) + ',' + IfThen(pFilterParams.has_raise,'''1'',','''0'',')
    else str := str + 'NULL,NULL,';

    if pFilterParams.Is_period then                                             // учитывать период
    begin
        if pFilterParams.Is_just_leaved then str := str + '''1'','              // искать только уволенных в этот период
                                        else str := str + 'NULL,';              // искать всех
        str := str + ''''+DateToStr(pFilterParams.DateBeg)+''',';
        str := str + ''''+DateToStr(pFilterParams.DateEnd)+''') order by OUT_TN';
    end
    else
        str := str + 'NULL,NULL,NULL) order by OUT_TN';

    DSetMain.SQLs.SelectSQL.Text := str;
    DSetMain.Open;
    DSetMain.Locate('OUT_TN',id,[]);
  finally
    CloseWaitForm(wf);
  end;
end;


constructor TfmSpSotr.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;FilterParams:TZParamFilterSprDoh);
var
id:Integer;
id_rmoving:int64;
wf:TForm;
i:byte;
yyy, mmm, ddd :word;
d:TDateTime;
begin
  inherited Create(AOwner);
  PageControl1.ActivePage:=TabSheetRmoving;
  pLanguageIndex                                 := LanguageIndex;
  pKodSetupBeg                                   := CurrentKodSetup(ADB_Handle);
  pKodSetupEnd                                   := CurrentKodSetup(ADB_Handle);
 //******************************************************************************
  DB.Handle                                      := ADB_Handle;
  ReadTransaction.Active                         := True;
  Caption                                        := GetConst('Workers',tcForm);
//******************************************************************************
  pStylesDM                                      := TStylesDM.Create(Self);

  PeopleGridDBTableView1.Styles.StyleSheet        := pStylesDM.GridTableViewStyleSheetDevExpress;
  DetailGridDBTableView1.Styles.StyleSheet        := pStylesDM.GridTableViewStyleSheetDevExpress;
  DetailGrid_DBTableView1.Styles.StyleSheet       := pStylesDM.GridTableViewStyleSheetDevExpress;

  DetailGridDBBandedTableView1_.Styles.StyleSheet := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
  DetailGridDBBandedTableView1.Styles.StyleSheet  := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
  cxGridDBBandedTableView1.Styles.StyleSheet      := pStylesDM.GridBandedTableViewStyleSheetDevExpress;
  //******************************************************************************
 //*pFilterParams := FilterParams;
 wf:=ShowWaitForm(Self);
 id:=-1;
 id_rmoving:=-1;

 DSetMain.SQLs.SelectSQL.Text :='SELECT DISTINCT * FROM Z_GET_SOTR_DATA(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,:DateBeg,:DateEnd) order by OUT_TN';
  DecodeDate(Date,Yyy,Mmm,Ddd);
  if(pFilterParams.DateBeg=strtodate('30.12.1899')) and (pFilterParams.DateEnd=strtodate('30.12.1899')) then
  begin
      pFilterParams.DateBeg:=  strtodate(KodSetupTopEriod(FilterParams.Kod_Setup1,6));
      DSetMain.ParamByName('DateBeg').AsDate:= pFilterParams.DateBeg;
      pFilterParams.DateEnd  := strtodate(KodSetupTopEriod(FilterParams.Kod_Setup2,6));//IncMonth(pFilterParams.DateBeg,4)-1;
      DSetMain.ParamByName('DateEnd').AsDate := pFilterParams.DateEnd;
  end
  else
  begin
      DSetMain.ParamByName('DateBeg').AsDate:= pFilterParams.DateBeg;
      DSetMain.ParamByName('DateEnd').AsDate := pFilterParams.DateEnd;
  end;

 DSetMain.Open;
 DSetMain.FetchAll;
 DSetMain.Locate('OUT_TN',id,[]);
 DSetDetail.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ASUP_RMOVING_BY_PERIOD(?OUT_ID_MAN,:DateBeg,:DateEnd) order by DATE_END descending';
 DSetBanded.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_ALL_MOVINGS_DETAIL_(?OUT_ID_MAN,:DateBeg,:DateEnd) order by REAL_END descending,RMOVING';

 DSetDetail.ParamByName('DateBeg').AsDate:=pFilterParams.DateBeg;
 DSetDetail.ParamByName('DateEnd').Value:=pFilterParams.DateEnd;
 DSetBanded.ParamByName('DateBeg').AsDate:=pFilterParams.DateBeg;;
 DSetBanded.ParamByName('DateEnd').Value:=pFilterParams.DateEnd;
 DSetDetail.Open;
 DSetDetail.Locate('rmoving',id_rmoving,[]);
 DSetBanded.Open;
 DetailGridDBBandedTableView1.Controller.GridView.ViewData.Expand(true);
 CloseWaitForm(wf);
 //** ApplyFilter;
 //**ResetDetail;
//******************************************************************************
  InsertBtn.Caption                  := GetConst('Insert',tcButton);
  UpdateBtn.Caption                  := GetConst('Update',tcButton);
  DeleteBtn.Caption                  := GetConst('Delete',tcButton);
  DetailBtn.Caption                  := GetConst('Detail',tcButton);
  FilterBtn.Caption                  := GetConst('Filter',tcButton);
  ExitBtn.Caption                    := GetConst('Exit',tcButton);
  AcctCardBtn.Caption                := GetConst('AcctCard',tcButton);
  ShowAvgBtn.Caption                 := GetConst('Avarage',tcButton);
  AvansBtn.Caption                   := GetConst('Avans',tcButton);  
//******************************************************************************
  TabSheetRmoving.Caption            := GetConst('RMoving',tcTabSheet);
  LabelDepartment.Caption            := GetConst('Department',tcLabel);
  LabelPrikaz.Caption                := GetConst('Prikaz',tcLabel);
  LabelCategor.Caption               := GetConst('Category',tcLabel);
//******************************************************************************
  cmnTN.Caption                      := GetConst('Tn',tcGridColumn);
  cmnFIO.Caption                     := GetConst('FIO',tcGridColumn);

  Grid2ClPeriodBeg.Caption           := GetConst('DateBeg',tcGridColumn);
  Grid2ClPeriodEnd.Caption           := GetConst('DateEnd',tcGridColumn);
  Grid22ClDateBeg.Caption            := GetConst('DateBeg',tcGridColumn);
  Grid22ClRealDateEnd.Caption        := GetConst('DateEnd',tcGridColumn);
  Grid22ClNamePost.Caption           := GetConst('Post',tcGridColumn);
  Grid22ClStavka.Caption             := GetConst('Stavka',tcGridColumn);
//******************************************************************************
 dxstsbr1.Panels[0].Text:= 'F8 - '+FilterBtn.Caption;
 dxstsbr1.Panels[1].Text:= 'Enter - '+ShowAllDataBtn.Caption;
 for i:=0 to dxstsbr1.Panels.Count-1 do
    dxstsbr1.Panels[i].Width := dxstsbr1.Width div dxstsbr1.Panels.Count;
end;

procedure TfmSpSotr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;



procedure TfmSpSotr.DisableAllDBControls;
begin

    // “еперь выключаютс€ пол€ редактировани€
    //RMoving
     if EditRazryad <> nil then EditRazryad.DataBinding.DataSource            := nil;
     if EditDepartment <> nil then EditDepartment.DataBinding.DataSource            := nil;
     if EditPrikaz <> nil then EditPrikaz.DataBinding.DataSource            := nil;
     if cxDBMaskEdit1 <> nil then cxDBMaskEdit1.DataBinding.DataSource            := nil;
end;

procedure TfmSpSotr.GridCurrentClKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     AText:=KodSetupToPeriod(StrToInt(AText),1);
end;

procedure TfmSpSotr.GridNonSpisokClKodSetup2GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
     AText:=KodSetupToPeriod(StrToInt(AText),1);
end;

procedure TfmSpSotr.DSetBandedFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
    if DSetBanded['RMOVING']=DSetDetail['RMOVING'] then Accept:=True
    else Accept:=False;
end;

procedure TfmSpSotr.DetailGridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  DSetBanded.DisableControls;
  DSetBanded.Filtered:=False;
  DSetBanded.Filtered:=True;
  DSetBanded.EnableControls;
end;

procedure TfmSpSotr.ShowAvgBtnClick(Sender: TObject);
begin
  if DSet2.IsEmpty then Exit;
end;

procedure TfmSpSotr.PeopleGridDBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (PeopleGridDBTableView1.OptionsBehavior.IncSearchItem<>cmnTN)then
    begin
     PeopleGridDBTableView1.Controller.IncSearchingText   := '';
     PeopleGridDBTableView1.OptionsBehavior.IncSearchItem := cmnTN;
    end
  end
 else
  if (PeopleGridDBTableView1.OptionsBehavior.IncSearchItem<>cmnFIO)then
   begin
    PeopleGridDBTableView1.Controller.IncSearchingText   := '';
    PeopleGridDBTableView1.OptionsBehavior.IncSearchItem := cmnFIO;
   end;

  if key=#13 then
  ShowAllDataBtn.Click;

end;

procedure TfmSpSotr.ShowAllDataBtnClick(Sender: TObject);
//var wf:TForm;
begin
  PRes:=VarArrayCreate([0,3], varVariant);
  PRes[0]:=DSetMain['OUT_ID_MAN'];
  PRes[1]:=DSetMain['OUT_TN'];
  PRes[2]:=DSetMain['OUT_FIO'];
  PRes[3]:=DSetBanded['VPOST'];
  ModalResult:=mrYes;
end;

procedure TfmSpSotr.cxButton1Click(Sender: TObject);
var pStProc:TpFIBStoredProc;
    pTransaction:TpFIBTransaction;
    pDataBase:TpFIBDatabase;
begin
  pDataBase := TpFIBDatabase.Create(Application.MainForm);
  pTransaction := TpFIBTransaction.Create(Application.MainForm);
  pStProc := TpFIBStoredProc.Create(Application.MainForm);

  try
    try
       pDataBase.SQLDialect := 3;
       pDataBase.DefaultTransaction := pTransaction;
       pTransaction.DefaultDatabase := pDataBase;
       pStProc.Database := pDataBase;
       pStProc.Transaction := pTransaction;

       pDataBase.Handle := DB.Handle;
       pStProc.Transaction.StartTransaction;
       pStProc.StoredProcName := 'Z_UP_BUFF_RMOVING_END_ROLLBACK';
       pStProc.Prepare;
       pStProc.ParamByName('RMOVING').AsVariant := DSetDetail['RMOVING'];
       pStProc.ExecProc;

       pStProc.Transaction.Commit;
       DSetBanded.Close;
       DSetDetail.CloseOpen(True);
       DSetBanded.Open;
       DetailGridDBBandedTableView1.Controller.GridView.ViewData.Expand(true);
       PageControl1Change(Self);
    except
      on e:exception do
       begin
        pStProc.Transaction.Rollback;
        zShowMessage(Error_Caption[LanguageIndex],e.Message,mtError,[mbOK]);
       end;
    end;
  finally
     pStProc.Destroy;
     pTransaction.Destroy;
     pDataBase.Destroy;
  end;
end;

procedure TfmSpSotr.PageControl2Change(Sender: TObject);
begin
  DisableAllDBControls;

  EditRazryad.DataBinding.DataSource  := DSourceBanded;
  EditDepartment.DataBinding.DataSource  := DSourceBanded;
  EditPrikaz.DataBinding.DataSource  := DSourceBanded;
  cxDBMaskEdit1.DataBinding.DataSource  := DSourceBanded;
  if InsertBtn<>nil then InsertBtn.Enabled:=True;
  if UpdateBtn<>nil then UpdateBtn.Enabled := True;
  if DeleteBtn<>nil then DeleteBtn.Enabled := True;
  if DetailBtn<>nil then DetailBtn.Enabled := True;
  if ShowAvgBtn<>nil then ShowAvgBtn.Visible:=ivNever;
  if (DSetMain<>nil) and (DSetMain.Active)
  and (PageControl1.ActivePage=TabSheetRmoving) then
  begin
    if not DSet2.IsEmpty      then DSet2.First;
    if not DSetBanded.IsEmpty then DSetBanded.First;
  end;
end;

procedure TfmSpSotr.PageControl1Change(Sender: TObject);
begin
  DisableAllDBControls;

  if InsertBtn<>nil then InsertBtn.Enabled:=True;
  if UpdateBtn<>nil then UpdateBtn.Enabled := True;
  if DeleteBtn<>nil then DeleteBtn.Enabled := True;
  if DetailBtn<>nil then DetailBtn.Enabled := True;
  if ShowAvgBtn<>nil then ShowAvgBtn.Visible:=ivNever;
  if (DSetMain<>nil) and (DSetMain.Active) then
  begin
    if PageControl1.ActivePage=TabSheetRMoving  then PageControl2Change(Sender);
    if not DSet2.IsEmpty then DSet2.First;
  end;
end;

procedure TfmSpSotr.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSpSotr.FilterBtnClick(Sender: TObject);
begin

  if ShowFilter(self,DB.Handle,pFilterparams) then
    begin
      ApplyFilter;
      ResetDetail;
      ///PageControl1Change(Self);
    end;
end;

procedure TfmSpSotr.AcctCardBtnClick(Sender: TObject);
begin
     if DSetMain.RecordCount>0
     then PackageLoad.LoadSpAllPeopleEditForm(Self,DB.Handle,DSetMain['OUT_ID_MAN'],True);
end;

procedure TfmSpSotr.AvansBtnClick(Sender: TObject);
begin
  if PeopleGridDBTableView1.Controller.FocusedRecord <> nil then
  begin
    StoredProc.StoredProcName := 'Z_TNACCESS_IS_AVANS_UPDATE';
    try
      StoredProc.Transaction.StartTransaction;
      UpKernelUnit.StartHistory(TpFIBTransaction(StoredProc.Transaction),ValueFieldZSetup(DB.Handle,'Z_ID_SYSTEM'));
      StoredProc.Prepare;
      StoredProc.ParamByName('ID_MAN').AsInteger := DSetMain['OUT_ID_MAN'];
      StoredProc.ParamByName('IS_AVANS_O').AsString := DSetMain['IS_AVANS'];
      StoredProc.ExecProc;
      StoredProc.Transaction.Commit;
      ApplyFilter;
      ResetDetail;
      PageControl1Change(self);
    except
    on E:Exception do
      begin
        if StoredProc.Transaction.InTransaction then StoredProc.Transaction.Rollback;
        zshowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOk]);
      end;
    end;
  end;

end;


procedure TfmSpSotr.cmnTypePaymentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
    if DSetMain.RecordCount>0
    then begin
              PackageLoad.LoadTnAccess(Self,DB.Handle,DSetMain['OUT_ID_MAN']);
              ApplyFilter;
              ResetDetail;
              PageControl1Change(self);
    end;
end;

procedure TfmSpSotr.cmnShifrPropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
begin
    if (DSetMain.RecordCount>0)
    then begin
              PackageLoad.LoadTnAccess(Self,DB.Handle,DSetMain['OUT_ID_MAN']);
              ApplyFilter;
              ResetDetail;
              PageControl1Change(self);
    end;

end;

procedure TfmSpSotr.N1Click(Sender: TObject);
begin
  //   cmnShifr.Visible:=not cmnShifr.Visible;
end;

procedure TfmSpSotr.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
var
  i:byte;
begin
    if NewWidth<800 then Resize:=False;
    for i:=0 to dxstsbr1.Panels.Count-1 do
    dxstsbr1.Panels[i].Width := dxstsbr1.Width div dxstsbr1.Panels.Count; 

end;

procedure TfmSpSotr.PeoplePanelCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
    if NewWidth>300 then Resize:=False;
end;


procedure TfmSpSotr.cxSplitter6AfterClose(Sender: TObject);
begin
 Panel9.Visible:=false;
 Panel3.Visible:=false;
end;

procedure TfmSpSotr.cxSplitter6AfterOpen(Sender: TObject);
begin
 Panel9.Visible:=true;
 Panel3.Visible:=true;
 cxSplitter6.AlignSplitter:=salTop;
 cxSplitter6.AlignSplitter:=salBottom;

end;

procedure TfmSpSotr.cxSplitter4AfterClose(Sender: TObject);
begin
 Panel4.Visible:=false;
end;

procedure TfmSpSotr.cxSplitter4AfterOpen(Sender: TObject);
begin
Panel4.Visible:=true;
end;

procedure TfmSpSotr.cxSplitter5AfterClose(Sender: TObject);
begin
Panel5.Visible:=false;
end;

procedure TfmSpSotr.cxSplitter5AfterOpen(Sender: TObject);
begin
Panel5.Visible:=true;
cxSplitter5.AlignSplitter:=salRight;
end;

end.
