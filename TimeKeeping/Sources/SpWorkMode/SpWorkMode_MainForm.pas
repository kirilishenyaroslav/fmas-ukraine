
{ -$Id: SpWorkMode_MainForm.pas,v 1.10 2010/11/05 07:39:48 salimov Exp $}
{******************************************************************************}
{               Автоматизированная система табельного учета                    }

{               (c) Донецкий национальный университет, 2002-2009               }
{******************************************************************************}

{                      Модуль "Справочник режимов работы"                      }
{                     Работа со справочником режимов работы                    }
{                                ответственный: Литовченко Дмитрий Николаевич  }

unit SpWorkMode_MainForm;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    SpFormUnit, Db, IBCustomDataSet, IBQuery, Grids, DBGrids, Buttons,
    StdCtrls, ExtCtrls,{ WorkReg, Buffer, PersonalCommon,} SpCommon,
    {SpWorkExc,} uSearchFrame, SpWorkMode_DM, ibase, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  TuMessages, TuCommonProc, dxBar, dxBarExtItems, TuCommonStyles,
  cxCheckBox,TuCommonLoader, dxStatusBar, TuCommonTypes,TuWorkMode_TreeEdit,
  cxTextEdit, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxSplitter,
  cxTLData, cxGridBandedTableView,AccMGMT;

type   TWorkModeFilterParam = class(TObject)
  Owner:TComponent;
  FormStyle:TTuFormStyle;
  KodSetup:integer;
  DateBegActive:variant;
  DateEndActive:variant;
  id_man:variant;
  rmoving:variant;
  id_post_moving:variant;
  FioDog:string;
  FioMan:string;
  DateBeg:variant;
  DateEnd:variant;
end;
type
    TFSpWorkMode_MainForm = class(TForm)
    dxBarManager: TdxBarManager;
    BtnExit: TdxBarLargeButton;
    BtnInsert: TdxBarLargeButton;
    BtnUpdate: TdxBarLargeButton;
    BtnDelete: TdxBarLargeButton;
    BtnRefresh: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    BtnCorWorkMode: TdxBarLargeButton;
    ButtonTranscript: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    ButtonTree: TdxBarLargeButton;
    ButtonOk: TdxBarLargeButton;
    GridMain: TcxDBTreeList;
    Splitter33: TcxSplitter;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    GridDBTableEditDays: TcxGridDBTableView;
    GridIdDayWeek: TcxGridDBColumn;
    GridWorkBeg: TcxGridDBColumn;
    GridWorkEnd: TcxGridDBColumn;
    GridBreakBeg: TcxGridDBColumn;
    GridBreakEnd: TcxGridDBColumn;
    GridTodayHours: TcxGridDBColumn;
    GridTOMORROW_HOURS: TcxGridDBColumn;
    GridTODAY_HOURS_NIGHT: TcxGridDBColumn;
    GridTOMORROW_HOURS_NIGHT: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    GridMainColName: TcxDBTreeListColumn;
    GridMainColNum: TcxDBTreeListColumn;
    GridMainColNb: TcxDBTreeListColumn;
    GridMainColNe: TcxDBTreeListColumn;
    GridMainColIs_smena: TcxDBTreeListColumn;
    GridMainColIs_work: TcxDBTreeListColumn;
    ButtonFilter: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxSplitter5: TcxSplitter;
    GridMainColDb: TcxDBTreeListColumn;
    GridMainCoDe: TcxDBTreeListColumn;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarGroup1: TdxBarGroup;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSpinEdit1: TdxBarSpinEdit;
    dxBarCombo1: TdxBarCombo;
    EditDateBeg: TdxBarDateCombo;
    EditDateEnd: TdxBarDateCombo;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarButton4: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    BarDockControlFilter: TdxBarDockControl;
    CaptionFilter: TdxBarStatic;
    ButtonDelete: TdxBarLargeButton;
        procedure WorkRegButtonClick(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure ExcButtonClick(Sender: TObject);
        procedure ResultQueryIS_SMENAGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnRefreshClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BtnCorWorkModeClick(Sender: TObject);
    procedure ButtonTranscriptClick(Sender: TObject);
    procedure ButtonTreeClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButtonFilterClick(Sender: TObject);
    procedure GridWorkBegGetDisplayText(Sender: TcxCustomGridTableItem;
      ARecord: TcxCustomGridRecord; var AText: String);
    procedure GridMainDblClick(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure GridMainClick(Sender: TObject);
    procedure EditDateBegChange(Sender: TObject);
    procedure EditDateEndChange(Sender: TObject);
    private
      pStylesDM:TStyleDM;
      DModule:TDModule;
      ParamFilter:TWorkModeFilterParam;
    public
      IsWorkMode:integer;
      IsParent:Boolean;
      IdParentWorkMode:variant;
      constructor Create(AParam:TWorkModeFilterParam;ADModule:TDModule;AIDParent:variant; AIsParent:Boolean);reintroduce;
    end;

implementation

uses Variants,TuWorkMode_Filter, FIBQuery, pFIBStoredProc, pFIBQuery;

{$R *.DFM}

constructor TFSpWorkMode_MainForm.Create(AParam:TWorkModeFilterParam;ADModule:TDModule;AIDParent:variant; AIsParent:Boolean);
var I:Integer;
begin

  inherited Create(AParam.Owner);
  IdParentWorkMode:=AIDParent;
  IsParent:= AIsParent;
  ParamFilter:=AParam;
  DModule:=ADModule;
  Self.Caption:=GetConst('WorkMode','Form');
  BtnRefreshClick(nil);
  if  ParamFilter.DateBeg<>null then
  begin
    EditDateBeg.date:=strtodate(ParamFilter.DateBeg);
    EditDateEnd.date:=strtodate(ParamFilter.DateEnd);
  end
  else
  begin
   EditDateBeg.Visible:=ivNever;
   EditDateEnd.Visible:=ivNever;
   dxBarStatic1.Visible:=ivNever;
  end ;
  GridMain.DataController.DataSource:=DModule.DSourceMain;
  GridDBTableEditDays.DataController.DataSource:=DModule.DSourceMainTrans;
  pStylesDM:=TStyleDM.Create(Self);
  GridMain.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridDBTableEditDays.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
//------------------------------------------------------------------------------
  BtnExit.Caption                          :=GetConst('Exit','Button');
  GridMainColNum.Caption.Text     :=GetConst('Nomer','GridColumn');
  GridMainColName.Caption.Text      :=GetConst('Name','GridColumn');
 // GridMainColNameShort.Caption.Text :=GetConst('NameShort','GridColumn');
  GridMainColNb.Caption.Text  :=GetConst('NightBeg','GridColumn');
  GridMainColNe.Caption.Text  :=GetConst('NightEnd','GridColumn');
  GridMainColIs_smena.Caption.Text   :=GetConst('IsSmena','GridColumn');
  GridMainColIs_work.Caption.Text   :=GetConst('TypeView','GridColumn');
//------------------------------------------------------------------------------
  BtnInsert.Caption            :=GetConst('Insert','Button');
  BtnUpdate.Caption            :=GetConst('Update','Button');
  BtnDelete.Caption            :=GetConst('Delete','Button');
  BtnRefresh.Caption           :=GetConst('Refresh','Button');
  BtnCorWorkMode.Caption       :=GetConst('CorWorkMode','Button');
  ButtonTranscript.Caption     := GetConst('Transcript','Button');
  ButtonTree.Caption           := GetConst('TreeUpdate','Button');
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//dxStatusBar1.Panels[0].Text:= 'Ctrl+Ins-'+ButtonInsert.Caption;
 dxStatusBar1.Panels[0].Text:= 'Ins-'+BtnInsert.Caption;
 dxStatusBar1.Panels[1].Text:= 'F2-'+BtnUpdate.Caption;
 dxStatusBar1.Panels[2].Text:= 'Del-'+BtnDelete.Caption;
 dxStatusBar1.Panels[3].Text:= 'F5-'+BtnRefresh.Caption;
 dxStatusBar1.Panels[4].Text:= 'Esc-'+BtnExit.Caption;
 dxStatusBar1.Panels[5].Text:= 'F7-'+ButtonTranscript.Caption;
 dxStatusBar1.Panels[6].Text:= 'F8-'+BtnCorWorkMode.Caption;
// dxStatusBar1.Panels[6].Text:= 'F8-'+FilterBtn.Caption;
for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

end;


procedure TFSpWorkMode_MainForm.WorkRegButtonClick(Sender: TObject);
var
    Params: TSpParams;
//    form: TWorkRegForm;
begin
{    Params := TSpParams.Create;
    with Params do
    begin
        IdField := 'Id_Day_Week';
        SpFields := 'Work_Beg, Work_End, Break_Beg, Break_End';
        ColumnNames := 'День, Початок роботи, Кінець роботи, Початок перерви, Кінець перерви,-,-';
        SelectProcName := 'Dt_WorkReg_Select(:Id_Work_Mode)';
        DontHideFirstColumn := True;
        Title := 'Розшифровка режимів праці';
    end;

    if not ResultQuery.IsEmpty then
    begin
        form := TWorkRegForm.Create(Self);
        form.Init(Params);
        form.WorkModeBox.Prepare(ResultQuery['Id_Work_Mode']);
        form.Night_Beg := ResultQuery['Night_Beg'];
        form.Night_End := ResultQuery['Night_End'];
        form.ShowModal;
        form.Free;
    end;}
end;


procedure TFSpWorkMode_MainForm.AddButtonClick(Sender: TObject);
begin
{    if not GPP_Check then Exit;}
    inherited;
end;

procedure TFSpWorkMode_MainForm.ModifyButtonClick(Sender: TObject);
begin
{    if not GPP_Check then Exit;}
    inherited;
end;

procedure TFSpWorkMode_MainForm.ExcButtonClick(Sender: TObject);
var
//    form: TSpWorkExcForm;
    Params: TSpParams;
begin
{    form := TSpWorkExcForm.Create(Self);
    Params := TSpParams.Create;
    with Params do
    begin
        Title := 'Винятки режиму праці «' + ResultQuery['Name'] + '»';
        IdField := 'Exc_Date';
        SpFields := 'Type_Char,Exc_Type,Hours';
        ColumnNames := 'Дата,-,Тип,Час';
        SelectProcName := 'Work_Exc_Select_2(' + IntToStr(ResultQuery['Id_Work_Mode']) + ')';
    end;
    form.Init(Params);
    form.Id_Work_Mode := ResultQuery['Id_Work_Mode'];
    form.ShowModal;
    form.Free;}
end;

procedure TFSpWorkMode_MainForm.ResultQueryIS_SMENAGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
//    if ResultQuery['Is_Smena'] = 'T' then Text := 'Так'
//    else Text := 'Ні';
end;

procedure TFSpWorkMode_MainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  ClearCurrentBuffer(Sender);
  if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFSpWorkMode_MainForm.BtnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFSpWorkMode_MainForm.BtnUpdateClick(Sender: TObject);
var Parameter:TTuWorkModeEditParam;
id:Variant;
begin

Parameter := TTuWorkModeEditParam.Create;
Parameter.DB_Handle := DModule.DB.Handle;
Parameter.Owner := self;
Parameter.CFStyle:=tcfsUpdate;
Parameter.Id:=DModule.DSetMain['ID_WORK_MODE'];
id:=DoFunctionFromPackage(Parameter,Tu_SpWorkModeEdit_Pack);
  if  Id <> Null then
   begin
        BtnRefreshClick(sender);
   DModule.DSetMain.Locate('ID_WORK_MODE', Id,[]) ;
   end;

Parameter.Destroy;
end;


procedure TFSpWorkMode_MainForm.BtnDeleteClick(Sender: TObject);
var Parameter:TTuWorkModeEditParam;
id:Variant;
begin

Parameter := TTuWorkModeEditParam.Create;
Parameter.DB_Handle := DModule.DB.Handle;
Parameter.Owner := self;
Parameter.CFStyle:=tcfsDelete;
Parameter.id:=DModule.DSetMain['ID_WORK_MODE'];


id:=DoFunctionFromPackage(Parameter,Tu_SpWorkModeEdit_Pack);
  if  Id <>Null then
   begin
    DModule.DSetMain.SQLs.DeleteSQL.Text := 'execute procedure z_empty_proc';
   DModule.DSetMain.Delete;
  end;



Parameter.Destroy;
end;

procedure TFSpWorkMode_MainForm.BtnRefreshClick(Sender: TObject);
begin
  with(DModule)do
  try
    DSetMain.Close;
    if ParamFilter.FormStyle=tfsModalParent then
       DSetMain.SelectSQL.Text:='SELECT * FROM TU_WORK_MODE_S('
                               +varToStrDef(''''+ParamFilter.DateBegActive+'''','Null')+','
                               +varToStrDef(''''+ParamFilter.DateEndActive+'''','Null')+','
                               +varToStrDef(ParamFilter.id_man,'Null')+','
                               +varToStrDef(ParamFilter.rmoving,'Null')+','
                               +varToStrDef(ParamFilter.id_post_moving,'Null')+','
                               +varToStrDef(''''+ParamFilter.DateBeg+'''','Null')+','
                               +varToStrDef(''''+ParamFilter.DateEnd+'''','Null' )+',-1,'
                               +varToStrDef(IdParentWorkMode,'Null' )
                               +')'



    ELSE
      DSetMain.SelectSQL.Text:='SELECT * FROM TU_WORK_MODE_S('
                               +varToStrDef(''''+ParamFilter.DateBegActive+'''','Null')+','
                               +varToStrDef(''''+ParamFilter.DateEndActive+'''','Null')+','
                               +varToStrDef(ParamFilter.id_man,'Null')+','
                               +varToStrDef(ParamFilter.rmoving,'Null')+','
                               +varToStrDef(ParamFilter.id_post_moving,'Null')+','
                               +varToStrDef(''''+ParamFilter.DateBeg+'''','Null')+','
                               +varToStrDef(''''+ParamFilter.DateEnd+'''','Null')+',-1, null)';
    DSetMain.Open;
    DSetMainTrans.SelectSQL.Text:= 'select * from TU_WORKREG_SELECT(?ID_WORK_MODE)';
    DSetMainTrans.Open;
  except
    on e:Exception do
      TuShowMessage(GetConst('Caption','Error'),e.Message,mtError,[mbOK]);
  end;
  CaptionFilter.Caption:='';
  if ParamFilter.id_man<>null then
    CaptionFilter.caption:='Фізична особа: '+ParamFilter.FioMan+'    ';
  if ParamFilter.rmoving<>null then
    CaptionFilter.caption:=CaptionFilter.caption+'Трудовий договір на: '+ParamFilter.FioDog+'    ';
  if ParamFilter.DateBegActive<>null then
    CaptionFilter.caption:=CaptionFilter.caption+'Період використання: '+ParamFilter.DateBegActive+' - '+ParamFilter.DateEndActive;
end;

procedure TFSpWorkMode_MainForm.FormResize(Sender: TObject);
var I:Integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
end;

procedure TFSpWorkMode_MainForm.BtnCorWorkModeClick(Sender: TObject);
var Parameter:TTuWorkModeTranscript;
begin
  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkModeCor','Belong')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Belong')=0)
  then
  else
  begin
     MessageBox(self.Handle, 'Ви не маєте доступу до цієї інформації!','Увага!', MB_OK or MB_ICONWARNING);
     exit;
  end;
  Parameter := TTuWorkModeTranscript.Create;
  Parameter.DB_Handle := DModule.DB.Handle;
  Parameter.Owner := self;
  Parameter.Id:=DModule.DSetMain['ID_WORK_MODE'];
  DoFunctionFromPackage(Parameter,Tu_WorkModeTranscript_Pack );
  Parameter.Destroy;
end;

procedure TFSpWorkMode_MainForm.ButtonTranscriptClick(Sender: TObject);
var Parameter:TTuWorkModeTranscript;
begin
  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkMode','Edit')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Edit')=0)
  then
  else
  begin
     MessageBox(self.Handle, 'Ви не маєте доступу до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
     exit;
  end;
  Parameter := TTuWorkModeTranscript.Create;
  Parameter.DB_Handle := DModule.DB.Handle;
  Parameter.Owner := self;
  Parameter.Id:=DModule.DSetMain['ID_WORK_MODE'];
  DoFunctionFromPackage(Parameter,Tu_WorkModeEditDays_Pack );
  Parameter.Destroy;
end;

procedure TFSpWorkMode_MainForm.ButtonTreeClick(Sender: TObject);
var Form :TFormWorkModeTreeEdit;
begin
  if (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkMode','Edit')=0)
     or (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Edit')=0)
  then
  else
  begin
     MessageBox(self.Handle, 'Ви не маєте доступу до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
     exit;
  end;
  Form:=TFormWorkModeTreeEdit.Create(self,DModule);
  Form.Show;
end;

procedure TFSpWorkMode_MainForm.ButtonOkClick(Sender: TObject);
begin
ModalResult:=mrYes;
end;

procedure TFSpWorkMode_MainForm.FormShow(Sender: TObject);
begin
  if FormStyle<>fsMDIChild then
  begin
    BtnInsert.Visible:=ivNever;
    BtnUpdate.Visible:=ivNever;
    BtnDelete.Visible:=ivNever;
    ButtonTree.Visible:=ivNever;
  end
  else
  begin
       BtnInsert.Visible:=ivAlways;
    BtnUpdate.Visible:=ivAlways;
    BtnDelete.Visible:=ivAlways;
    ButtonTree.Visible:=ivAlways;
    ButtonOk.Visible:=ivNever;
  end;

end;

procedure TFSpWorkMode_MainForm.ButtonFilterClick(Sender: TObject);
var FormParam:TFormWorkMode_Filter;
begin
    FormParam:=TFormWorkMode_Filter.create(ParamFilter,DModule);
    if FormParam.showModal=mrYes then
    begin
      BtnRefreshClick(sender);
      if ParamFilter.DateBeg <>null then
      begin
        EditDateBeg.text:=ParamFilter.DateBeg;
        EditDateEnd.text:=ParamFilter.DateEnd;
      end
    end;
end;

procedure TFSpWorkMode_MainForm.GridWorkBegGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
if AText='' then AText:=GetConst('Holiday','CheckBox')
end;

procedure TFSpWorkMode_MainForm.GridMainDblClick(Sender: TObject);
begin
if (FormStyle=fsNormal )And ButtonOk.Enabled then ButtonOkClick(sender);
end;

procedure TFSpWorkMode_MainForm.dxBarButton2Click(Sender: TObject);
var Parameter:TTuWorkModeEditParam;
id:Variant;
begin

  Parameter := TTuWorkModeEditParam.Create;
  Parameter.DB_Handle := DModule.DB.Handle;
  Parameter.Owner := self;
  Parameter.kodSetup:=ParamFilter.KodSetup;
  Parameter.CFStyle:=tcfsInsert;
  Parameter.id:=null;
  id:=DoFunctionFromPackage(Parameter,Tu_SpWorkModeEdit_Pack);
  if  Id <> Null then
   begin
       BtnRefreshClick(sender);
       DModule.DSetMain.Locate('ID_WORK_MODE', Id,[]) ;
   end;
Parameter.Destroy;
end;

procedure TFSpWorkMode_MainForm.dxBarButton3Click(Sender: TObject);
var Parameter:TTuWorkModeEditParam;
id:Variant;
begin

  Parameter := TTuWorkModeEditParam.Create;
  Parameter.DB_Handle := DModule.DB.Handle;
  Parameter.Owner := self;
  Parameter.Id:=DModule.DSetMain['ID_WORK_MODE'];
  Parameter.kodSetup:=ParamFilter.KodSetup;
  Parameter.CFStyle:=tcfsInsert;
  id:=DoFunctionFromPackage(Parameter,Tu_SpWorkModeEdit_Pack);
  if  Id <> Null then
   begin
     with DModule.StProc do
     begin
       Transaction.StartTransaction;
       StoredProcName:='TU_WORK_MODE_TRANS_COPY';
       Prepare;
       ParamByName('ID_NEW').asInteger:=id;
       ParamByName('ID_OLD').asInteger:=Parameter.Id;
       ExecProc;
       Transaction.Commit;
     end ;
    // DModule.DSetMain.SQLs.RefreshSQL.Text := 'SELECT * FROM DT_WORK_MODE_SELECT_BY_KEY('+VarToStr(id)+')';
   //  DModule.DSetMain.SQLs.InsertSQL.Text := 'execute procedure z_empty_proc';
   //  DModule.DSetMain.Insert;
   //  DModule.DSetMain.Post ;
         BtnRefreshClick(sender);
     DModule.DSetMain.Locate('ID_WORK_MODE', Id,[]) ;

   end;



Parameter.Destroy;
end;

procedure TFSpWorkMode_MainForm.GridMainClick(Sender: TObject);
begin

if (DModule.DSetMain['IS_WORK_MODE']=1) or IsParent  then
  ButtonOk.Enabled:=true
else
  ButtonOk.Enabled:=false;
end;

procedure TFSpWorkMode_MainForm.EditDateBegChange(Sender: TObject);
begin
  if EditDateBeg.date<=EditDateEnd.date then
    ParamFilter.DateBeg:=EditDateBeg.text
  else
    EditDateBeg.date:=strtodate(ParamFilter.DateBeg);

  BtnRefreshClick(sender);
end;

procedure TFSpWorkMode_MainForm.EditDateEndChange(Sender: TObject);
begin
  if EditDateEnd.date>=EditDateBeg.date then
    ParamFilter.DateEnd:=EditDateEnd.text
  else

    EditDateEnd.date:=strtodate(ParamFilter.DateEnd);

  BtnRefreshClick(sender);
end;

initialization
    RegisterClass(TFSpWorkMode_MainForm);

end.
