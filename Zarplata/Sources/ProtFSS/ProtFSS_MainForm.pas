unit ProtFSS_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase, ZProc,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, ExtCtrls, cxTextEdit, Dates,
  cxLabel, cxContainer, cxMaskEdit, cxDBEdit, PackageLoad, ZTypes, Unit_ZGlobal_Consts,
  cxCalendar, cxMemo, cxGridViewData, ActnList, ComCtrls, ProtFSS_DM,
  dxStatusBar, zMessages, cxGridBandedTableView,
  cxGridDBBandedTableView, zSvodLoaderUnit,
  zSvodTypesUnit, cxCheckBox,z_uWaitForm,ProtFSS_ReestrAdd,
  Unit_sprSubs_Consts,ProtFSS_ReestrFillForm, cxSpinEdit, cxDropDownEdit,
  cxGroupBox, StdCtrls, Buttons,   XLSReadWriteII2,XLSFonts2,CellFormats2,BIFFRecsII2,
  XLSNames2,XLSUtils2,CellAreas2, FormulaHandler2, XLSStream2;

type
  TFZProtFSS = class(TForm)
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    dxStatusBar1: TdxStatusBar;
    Panel1: TPanel;
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClNumRee: TcxGridDBColumn;
    Grid1ClDateRee: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    ActionList: TActionList;
    SystemAction: TAction;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    Grid2: TcxGrid;
    Grid2DBTableView1: TcxGridDBTableView;
    Grid2ClTn: TcxGridDBColumn;
    Grid2ClFIO: TcxGridDBColumn;
    Grid2ClSeria: TcxGridDBColumn;
    Grid2ClNumber: TcxGridDBColumn;
    Grid2CldateBeg: TcxGridDBColumn;
    Grid2CldateEnd: TcxGridDBColumn;
    Grid2Level1: TcxGridLevel;
    Panel3: TPanel;
    EditParent: TcxDBMaskEdit;
    LabelParent: TcxLabel;
    LabelVidOpl: TcxLabel;
    EditVidOpl: TcxDBMaskEdit;
    SplitterControlPanelDopData: TcxSplitter;
    Grid2ClVo: TcxGridDBColumn;
    PrintAllBtn: TdxBarLargeButton;
    PrintBtn: TdxBarLargeButton;
    Grid2ClPercent: TcxGridDBColumn;
    AverageBtn: TdxBarLargeButton;
    UpdateAvgHand: TdxBarLargeButton;
    ZayavkaBtn: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    Grid2DBTableView1DBColumn1: TcxGridDBColumn;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton2: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    InsertMenu: TdxBarPopupMenu;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    AddReestrBtn: TdxBarLargeButton;
    ChangeReestrBtn: TdxBarLargeButton;
    DelReestrBtn: TdxBarLargeButton;
    InsInReestrBtn: TdxBarLargeButton;
    dxBarButton7: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    SaveDialog1: TSaveDialog;
    procedure ExitBtnClick(Sender: TObject);
    procedure AddManBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SystemActionExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Grid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Grid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Panel3Resize(Sender: TObject);
    procedure Grid2DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure RefreshBtnClick(Sender: TObject);

    procedure AverageBtnClick(Sender: TObject);
    procedure UpdateAvgHandClick(Sender: TObject);
    procedure ZayavkaBtnClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure AddReestrBtnClick(Sender: TObject);
    procedure ChangeReestrBtnClick(Sender: TObject);
    procedure DelReestrBtnClick(Sender: TObject);
    procedure InsInReestrBtnClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
  private
    DM:TDM;
    PLanguageIndex:Byte;

  public
  TypeAlg : Integer;
  xls:TXLSReadWriteII2;
    constructor Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);reintroduce;
    destructor Destroy; reintroduce;
    procedure Refresh;
     procedure makeBorders(col:integer; row:integer);
  end;

implementation

uses Math;

{$R *.dfm}

constructor TFZProtFSS.Create(AOwner:TComponent;Db_Handle:TISC_DB_HANDLE);
var i:byte;
begin
   inherited Create(AOwner);
   PLanguageIndex:=LanguageIndex;
  //******************************************************************************


   for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

   dxStatusBar1.Panels[0].Text:= 'F5 - '+RefreshBtn.Caption;
   dxStatusBar1.Panels[1].Text:= 'Ins - '+ZayavkaBtn.Caption;
   dxStatusBar1.Panels[2].Text:= 'F9 - '+PrintAllBtn.Caption;
   dxStatusBar1.Panels[3].Text:= 'Ctrl+F9 - '+PrintBtn.Caption;
   dxStatusBar1.Panels[4].Text:= 'Space - '+AverageBtn.Caption;
   dxStatusBar1.Panels[5].Text:= 'F2 - '+UpdateAvgHand.Caption;
   dxStatusBar1.Panels[6].Text:= 'Esc - '+ExitBtn.Caption;
  //******************************************************************************
   DM := TDM.Create(self,Db_Handle);


   //Kod_Setup := CurrentKodSetup(Db_Handle);
  //******************************************************************************
   Grid1DBTableView1.DataController.DataSource := DM.DSource1;
   Grid2DBTableView1.DataController.DataSource := DM.DSource2;
  //******************************************************************************
   EditParent.DataBinding.DataSource   := Dm.DSource2;
   EditVidOpl.DataBinding.DataSource   := Dm.DSource2;
  //******************************************************************************
   Grid1DBTableView1FocusedRecordChanged(Grid1DBTableView1,nil,Grid1DBTableView1.Controller.FocusedRecord,True);
  //******************************************************************************
   WindowState := wsMaximized;
   if Dm.DSource1.DataSet.RecordCount>0 then Grid1DBTableView1.Controller.FocusedRowIndex:=0;
end;

procedure TFZProtFSS.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFZProtFSS.AddManBtnClick(Sender: TObject);
var Man:variant;
begin
Man := LoadPeopleModal(self,Dm.db.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<> NULL then
  if not DM.DSet1.Locate('ID_MAN',Man[0],[loCaseInsensitive]) then
  begin
   DM.DSet2.Close;
   DM.DSet1.SQLs.RefreshSQL.Text := 'SELECT * FROM Z_DATAPEOPLE_BY_ID_MAN('+VarToStr(Man[0])+')';
   DM.DSet1.SQLs.InsertSQL.Text := 'EXECUTE PROCEDURE Z_EMPTY_PROC';
   DM.DSet1.Insert;
   DM.DSet1.Post;
   DM.DSet2.Open;
  end;
end;

procedure TFZProtFSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZProtFSS.SystemActionExecute(Sender: TObject);
begin
ZShowMessage('System Information',
             'ID_REESTR = '+IfThen(DM.DSet1.Active,VarToStr(DM.DSet1['ID_REESTR']),'0')+#13+
             'ID_MAN_HOSP = '+IfThen(DM.DSet2.Active,VarToStr(DM.DSet2['ID_MAN_HOSP']),'0')+#13+
             'ID_MAN = '+IfThen(DM.DSet2.Active,VarToStr(DM.DSet2['ID_MAN']),'0')+#13,
              mtInformation,[mbOK]);
end;

procedure TFZProtFSS.FormResize(Sender: TObject);
var i:integer;
begin
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFZProtFSS.Grid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
PrintBtn.Enabled:=not (AFocusedRecord=nil);
AverageBtn.Enabled:=not (AFocusedRecord=nil);
UpdateAvgHand.Enabled:=not (AFocusedRecord=nil);
end;

procedure TFZProtFSS.Grid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
PrintAllBtn.Enabled := not (AFocusedRecord=nil);
Grid2DBTableView1FocusedRecordChanged(Grid2DBTableView1,nil,Grid2DBTableView1.Controller.FocusedRecord,True);
end;

procedure TFZProtFSS.Panel3Resize(Sender: TObject);
begin
 EditVidOpl.Width   := Max(100,Panel3.Width-112);
 EditParent.Width   := Max(100,Panel3.Width-112);
end;

procedure TFZProtFSS.Grid2DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (Grid2DBTableView1.OptionsBehavior.IncSearchItem<>Grid2ClTn)then
    begin
     Grid2DBTableView1.Controller.IncSearchingText   := '';
     Grid2DBTableView1.OptionsBehavior.IncSearchItem := Grid2ClTn;
    end
  end
 else
  if (Grid2DBTableView1.OptionsBehavior.IncSearchItem<>Grid2ClFIO)then
   begin
    Grid2DBTableView1.Controller.IncSearchingText   := '';
    Grid2DBTableView1.OptionsBehavior.IncSearchItem := Grid2ClFIO;
   end;
end;

procedure TFZProtFSS.RefreshBtnClick(Sender: TObject);
begin
  DataSetsCloseOpen(DM.DSet1,Dm.DSet2);
 {DM.DSet1.Close;
 DM.DSet2.Close;
 DM.DSet1.SQLs.SelectSQL.Text:='SELECT * FROM Z_DT_HOSP_REESTR_SEL(:kod_setup) order by Date_reestr';
 DM.DSet1.ParamByName('kod_setup').Value := Kod_Setup_filter;
 DM.DSet2.SQLs.SelectSQL.Text:='SELECT * FROM Z_MAN_HOSPITAL_S(:ID_REESTR) order by tn';
 DM.DSet1.Open;
 DM.DSet2.Open;

 if (DM.DSet1.IsEmpty)  then
   begin
     ChangeReestrBtn.Enabled:=False;
     DelReestrBtn.Enabled:=False;
     InsInReestrBtn.Enabled:=False;
     ZayavkaBtn.Enabled:=False;
     dxBarLargeButton4.Enabled:=False;
     AverageBtn.Enabled:=False;
     UpdateAvgHand.Enabled:=False;
   end
 else
   begin
     ChangeReestrBtn.Enabled:=true;
     DelReestrBtn.Enabled:=true;
     InsInReestrBtn.Enabled:=true;
     ZayavkaBtn.Enabled:=true;
     dxBarLargeButton4.Enabled:=true;
     AverageBtn.Enabled:=true;
     UpdateAvgHand.Enabled:=true;
   end   }

end;




destructor TFZProtFSS.Destroy;
begin
 DM.Destroy;
 inherited Destroy;
end;

procedure TFZProtFSS.AverageBtnClick(Sender: TObject);
begin
  LoadHospAvg(self,DM.DB.Handle,DM.DSet2['ID_MAN_HOSP'],-1);
//LoadShowHospAvg(Self,DM.DB.Handle,DM.DSet2['ID_MAN'],DM.DSet2['ALL_DATE_BEG'],6,DM.DSet2['ID_MAN_HOSP']);
end;

procedure TFZProtFSS.UpdateAvgHandClick(Sender: TObject);
var Parameter:TZAvgSumParameter;
begin
   DM.DataSetAlg.Close;
   DM.DataSetAlg.SQLs.SelectSQL.Text:='SELECT * FROM Z_GET_SYS_ALGORITM('+Inttostr(2)+','''+datetostr(date)+''','+IntToStr(DM.DSet2['ID_MAN_HOSP'])+')';
   DM.DataSetAlg.Open;

   TypeAlg := DM.DataSetAlg.FieldByname('ACTIV_ALGORITM').AsInteger;
    if(typealg=1) then
    begin
        LoadHospAvg(self,DM.DB.Handle,DM.DSet2['ID_MAN_HOSP'],-1);
    end else
    begin
        Parameter.Owner        :=self;
        Parameter.DB_Handle    :=DM.DB.Handle;
        Parameter.Id_Hosp_List :=DM.DSet2['ID_MAN_HOSP'];
        Parameter.rmoving      :=-1;
        LoadAvgSumHands(Parameter);
    end;
end;

procedure TFZProtFSS.ZayavkaBtnClick(Sender: TObject);
begin
 try
  DM.StProc.Transaction.StartTransaction;
  //ShowMessage(inttostr(DM.DSet1['ID_REESTR']));
  DM.StProc.StoredProcName := 'Z_REEHOSP_TO_ZAY';
  DM.StProc.ParamByName('ID_REESTR').AsInteger:=DM.DSet1['ID_REESTR'];
  DM.StProc.ExecProc;
  DM.StProc.Transaction.Commit;
  ZShowMessage('Результат','Заяву було вдало преформовано!',mtInformation,[mbOk]);
 except
  on E:exception do
   begin
    DM.StProc.Transaction.Rollback;
    ZShowMessage('Помилка',e.Message,mtError,[mbOk]);
   end;
 end;
end;

procedure TFZProtFSS.dxBarLargeButton1Click(Sender: TObject);
begin
  LoadHospAvg(self,DM.DB.Handle,DM.DSet2['ID_MAN_HOSP'],-1);
end;

procedure TFZProtFSS.dxBarLargeButton2Click(Sender: TObject);
begin
LoadHospReestr(self,DM.DB.Handle,dm.DSet1['ID_REESTR']);
end;



procedure TFZProtFSS.dxBarButton3Click(Sender: TObject);
var Parameter:TAvgHospParam;
begin
Parameter.Owner:=Self;
Parameter.DB_Handle:=DM.DB.Handle;
Parameter.Id:=DM.DSet1['ID_REESTR'];
Parameter.Type_Id:=1;
Parameter.SortOrder:='';
if Grid2ClTn.SortOrder<>soNone then Parameter.SortOrder:='T'
else if Grid2ClFio.SortOrder<>soNone then Parameter.SortOrder:='F';
PrintAvgHosp(Parameter);
end;

procedure TFZProtFSS.dxBarButton4Click(Sender: TObject);
  var Parameter:TAvgHospParam;
begin

  Parameter.Owner:=Self;
  Parameter.DB_Handle:=DM.DB.Handle;
  Parameter.Id:=DM.DSet2['ID_MAN_HOSP'];
  Parameter.Type_Id:=0;
  Parameter.SortOrder:='';
  PrintAvgHosp(Parameter);
end;

procedure TFZProtFSS.dxBarButton5Click(Sender: TObject);
  var Parameter:TAvgSocInsurance;
begin
  Parameter.Owner:=Self;
  Parameter.DB_Handle:=DM.DB.Handle;
  Parameter.Id_reestr:=DM.DSet1['ID_REESTR'];
  Parameter.TypeHospFSS:=thfTVP;
//  Parameter.Type_Id:=0;
//  Parameter.SortOrder:='';
  PrintAvgSocInsurance(Parameter);
end;

procedure TFZProtFSS.dxBarButton6Click(Sender: TObject);

  var Parameter:TAvgSocInsurance;
begin
  Parameter.Owner:=Self;
  Parameter.DB_Handle:=DM.DB.Handle;
  Parameter.Id_reestr:=DM.DSet1['ID_REESTR'];
  Parameter.kodsetup:= Ifthen(DM.DSet1['KOD_SETUP']<>null,DM.DSet1['KOD_SETUP'],CurrentKodSetup(DM.DB.Handle));
  Parameter.TypeHospFSS:=thfUnfortunate;
//  Parameter.Type_Id:=0;
//  Parameter.SortOrder:='';
  PrintAvgSocInsurance(Parameter);
end;

procedure TFZProtFSS.AddReestrBtnClick(Sender: TObject);
var
  ViewForm : TfmAddForm;
  wf : TForm;
  id : integer;
  Kod_setup:Integer;
begin
  ViewForm                := TfmAddForm.Create(Self,DM.DB.Handle);
  ViewForm.Caption        := 'Додати новий реєстр';
  Kod_Setup               := CurrentKodSetup(DM.DB.Handle);
  ViewForm.cxDateBeg.Date := ConvertKodToDate(Kod_Setup);
  ViewForm.cxDateEnd.Date := ConvertKodToDate(Kod_Setup+1)-1;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
    begin
     try

      wf:=ShowWaitForm(self, zwfDoFunction);

      DM.WriteTransaction.StartTransaction;
      DM.pFIBStoredProc.StoredProcName                   := 'DT_HOSP_REESTR_INSERT';
      DM.pFIBStoredProc.ParamByName('NUM').Value         := ViewForm.cxNumReestr.Text;
      DM.pFIBStoredProc.ParamByName('DATE_REESTR').Value := ViewForm.cxDateBeg.Date;
      DM.pFIBStoredProc.ParamByName('DATE_END').Value    := ViewForm.cxDateEnd.Date;
      DM.pFIBStoredProc.ExecProc;

      id:= DM.pFIBStoredProc.ParamByName('ID').Value;
      DM.WriteTransaction.Commit;

      CloseWaitForm(wf);

     except on E: Exception do
      begin
        ZShowMessage(TFSprSubs_LabelTo_Caption,'Операція не виповнена',mtError,[mbOK]);
        CloseWaitForm(wf);
        DM.WriteTransaction.Rollback;
      end;
     end;
     RefreshBtn.Click;
     DM.DSet1.Locate('ID_REESTR',id,[]);
    end;
end;

procedure TFZProtFSS.ChangeReestrBtnClick(Sender: TObject);
var
  ViewForm : TfmAddForm;
  wf : TForm;
  id : integer;
  Kod_Setup : integer;
begin
  ViewForm                  := TfmAddForm.Create(Self,DM.DB.Handle);
  ViewForm.Caption          := 'Змінити реєстр';
  ViewForm.cxNumReestr.Text := DM.DSet1['NUM_REESTR'];
  ViewForm.cxDateBeg.Date   := DM.DSet1['DATE_REESTR'];
  ViewForm.cxDateEnd.Date   := DM.DSet1['DATE_END'];;

  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrOK then
    begin
     try

      wf:=ShowWaitForm(self, zwfDoFunction);

      DM.WriteTransaction.StartTransaction;

      DM.pFIBStoredProc.StoredProcName := 'DT_HOSP_REESTR_UPDATE';
      DM.pFIBStoredProc.ParamByName('NUM_REESTR').Value  := ViewForm.cxNumReestr.Text;
      DM.pFIBStoredProc.ParamByName('DATE_REESTR').Value := ViewForm.cxDateBeg.Date;
      DM.pFIBStoredProc.ParamByName('DATE_END').Value    := ViewForm.cxDateEnd.Date;
      DM.pFIBStoredProc.ParamByName('ID_REESTR').Value   := DM.DSet1['ID_REESTR'];
      DM.pFIBStoredProc.ExecProc;

      id:= DM.DSet1['ID_REESTR'];
      DM.WriteTransaction.Commit;

      CloseWaitForm(wf);

     except on E: Exception do
      begin
        ZShowMessage(TFSprSubs_LabelTo_Caption,'Операція не виповнена',mtError,[mbOK]);
        CloseWaitForm(wf);
        DM.WriteTransaction.Rollback;
      end;
     end;
     RefreshBtn.Click;
     DM.DSet1.Locate('ID_REESTR',id,[]);
    end;
end;

procedure TFZProtFSS.DelReestrBtnClick(Sender: TObject);
begin
  if ZShowMessage(TFSprSubs_LabelTo_Caption,'Чи ви справді бажаєте вилучити реєстр?',mtConfirmation,[mbYes, MbNo]) = mrYes
   then
    begin
     try
      DM.WriteTransaction.StartTransaction;
      DM.pFIBStoredProc.StoredProcName := 'DT_HOSP_REESTR_DEL';
      DM.pFIBStoredProc.ParamByName('ID_REESTR').Value:= DM.DSet1['ID_REESTR'];
      DM.pFIBStoredProc.ExecProc;
      DM.WriteTransaction.Commit;
      ZShowMessage(TFSprSubs_LabelTo_Caption,'Реєстр видалено',mtInformation,[mbOK]);

     except on E: Exception do
      begin
        zshowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOk]);
        DM.WriteTransaction.Rollback;
      end;
     end;
     RefreshBtn.Click;
    end;
end;

procedure TFZProtFSS.InsInReestrBtnClick(Sender: TObject);
var
    form: TReestrFillForm;
begin
    form := TReestrFillForm.Create(Self,DM.DB.Handle);
    form.Prepare(DM.DSet1['Id_Reestr']);
    form.FormStyle := fsMDIChild;
    form.Show;  
end;

procedure TFZProtFSS.FilterBtnClick(Sender: TObject);
begin
  RefreshBtn.Click;
end;

procedure TFZProtFSS.Refresh;
begin
 RefreshBtnClick(self);
end;

procedure TFZProtFSS.dxBarButton7Click(Sender: TObject);
  var Parameter:TAvgSocInsurance;
begin
  Parameter.Owner:=Self;
  Parameter.DB_Handle:=DM.DB.Handle;
  Parameter.Id_reestr:=DM.DSet1['ID_REESTR'];
  Parameter.KODSETUP:=DM.DSet1['KOD_SETUP'];
  Parameter.TypeHospFSS:=thfUnfortunate1;
//  Parameter.Type_Id:=0;
//  Parameter.SortOrder:='';
  PrintAvgSocInsurance(Parameter);
end;

procedure TFZProtFSS.dxBarLargeButton5Click(Sender: TObject);
var
st,PathRes,PathTem :string ;
k,inc:integer;
wf:TForm;
DAYS_ALL, DAYS_FSS :integer;
SUMM_ALL,SUMM_FSS : Extended;
begin
    //salimov
     DAYS_ALL :=0;
     DAYS_FSS :=0;
     SUMM_ALL:=0;
     SUMM_FSS:=0;
   xls:= TXLSReadWriteII2.Create(Application);
   //PathRes:=ExtractFilePath(Application.ExeName)+ '1.xls';

   if (SaveDialog1.Execute ) then
   begin
       wf:=ShowWaitForm(self, zwfDoFunction);
      PathTem:= ExtractFilePath(Application.ExeName)+'Reports/Zarplata/ProtFSS.xls';
      PathRes:=  SaveDialog1.FileName;

      if FileExists(PathRes) then DeleteFile(PathRes);
      CopyFile(pansichar(PathTem), pansichar(PathRes),true);

      xls.Filename := PathRes;
      xls.Read;

      DM.DSetExport1.Close;
      DM.DSetExport2.Close;

      DM.DSetExport1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_AVG_SOC_INSURANCE('+intToStr(DM.Dset1['ID_REESTR'])+')';
      DM.DSetExport2.SQLs.SelectSQL.Text:='SELECT * FROM Z_AVG_SOC_INSURANCE_TRANS('+intToStr(DM.Dset1['ID_REESTR'])+') order by FIO,  id_man, DATE_BEG';

      DM.DSetExport1.Open;
      DM.DSetExport2.Open;


      xls.Sheet[0].AsString[2,1]:= DM.DSetExport1['reg_kod_strah_nsluch'];
      xls.Sheet[0].AsString[2,2]:= DM.DSetExport1['FULL_NAME'];
      xls.Sheet[0].AsString[2,3]:= DM.DSetExport1['OKPO'];

      xls.Sheet[0].AsString[2,5]:= DM.DSetExport1['mfo_nsluch'];

      xls.Sheet[0].AsString[2,6]:= DM.DSetExport1['TELEFON'];











   DM.DSetExport2.first;
   inc:=9 ;
     k:=10 ;

   while (not DM.DSetExport2.Eof) do
   begin
        xls.Sheet[0].AsInteger[0,k]:= k-inc;
        xls.Sheet[0].AsString[1,k]:= DM.DSetExport2['FIO'];
        xls.Sheet[0].AsString[2,k]:= DM.DSetExport2['SOC_CARD_NUMBER'];
        xls.Sheet[0].AsString[3,k]:= DM.DSetExport2['SER_LIST_HOSP']+' '+DM.DSetExport2['NUM_LIST_HOSP'];
        xls.Sheet[0].AsString[4,k]:= DM.DSetExport2['NAME_TYPE_DISEASE'];
        xls.Sheet[0].AsDateTime[5,k]:= DM.DSetExport2['DATE_BEG'];
        xls.Sheet[0].AsDateTime[6,k]:= DM.DSetExport2['DATE_END'];

        xls.Sheet[0].AsInteger[7,k]:= DM.DSetExport2['DAYS_ALL'];
        DAYS_ALL:=DAYS_ALL+ DM.DSetExport2['DAYS_ALL'];
        xls.Sheet[0].AsInteger[8,k]:= DM.DSetExport2['DAYS_FSS'];
        DAYS_FSS:=DAYS_FSS+ DM.DSetExport2['DAYS_FSS'];
        xls.Sheet[0].AsFloat[9,k]:= DM.DSetExport2['SUMM_ALL'];
        SUMM_ALL:=SUMM_ALL+ DM.DSetExport2['SUMM_ALL'];
        xls.Sheet[0].AsFloat[10,k]:= DM.DSetExport2['SUMM_FSS'];
        SUMM_FSS:=SUMM_FSS+ DM.DSetExport2['SUMM_FSS'];
        makeBorders(0,k);
        makeBorders(1,k);
        makeBorders(2,k);
        makeBorders(3,k);
        makeBorders(4,k);
        makeBorders(5,k);
        makeBorders(6,k);
        makeBorders(7,k);
        makeBorders(8,k);
        makeBorders(9,k);
        makeBorders(10,k);

     k:=k+1;
    DM.DSetExport2.Next;
   end   ;

   xls.Sheet[0].AsString[0,k]:= '';
   xls.Sheet[0].Cell[0,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[1,k]:= '';
   xls.Sheet[0].Cell[1,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[2,k]:= '';
   xls.Sheet[0].Cell[2,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[3,k]:= '';
   xls.Sheet[0].Cell[3,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[4,k]:= '';
   xls.Sheet[0].Cell[4,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[5,k]:= '';
   xls.Sheet[0].Cell[5,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsString[6,k]:= '';
   xls.Sheet[0].Cell[6,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsInteger[7,k]:= DAYS_ALL;
   xls.Sheet[0].Cell[7,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsInteger[8,k]:= DAYS_FSS;
   xls.Sheet[0].Cell[8,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsFloat[9,k]:= SUMM_ALL;
   xls.Sheet[0].Cell[9,k].BorderTopStyle:=cbsMedium;
   xls.Sheet[0].AsFloat[10,k]:= SUMM_FSS;
   xls.Sheet[0].Cell[10,k].BorderTopStyle:=cbsMedium;
   xls.Write;
   CloseWaitForm(wf);
   end ;




end;
     procedure TFZProtFSS.makeBorders(col:integer; row:integer);

begin
 xls.Sheet[0].Cell[col,row].BorderTopStyle:=cbsThin;
 xls.Sheet[0].Cell[col,row].BorderLeftStyle:=cbsThin;
 xls.Sheet[0].Cell[col,row].BorderBottomStyle:=cbsThin;
 xls.Sheet[0].Cell[col,row].BorderRightStyle:=cbsThin;
 end;


end.
