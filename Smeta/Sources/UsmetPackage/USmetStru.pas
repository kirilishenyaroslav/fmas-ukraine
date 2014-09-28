unit USmetStru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, StdCtrls, ComCtrls, ToolWin, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,ibase, ExtCtrls,
  pFibStoredProc, DBCtrls, Buttons, Grids, Resources_unitb, GlobalSpr,
  cxTextEdit, cxContainer, cxDBEdit, dxBar, dxDockPanel, dxDockControl,
  cxCheckBox, frxClass, frxDBSet, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, Placemnt, cxMemo, cxLabel, cxDBLabel,
  cxCurrencyEdit;

resourcestring
  NOTSMETATEXT='Даний об'+''''+'єкт не являється вложеним кошторисом';
  PERIODNOTEQUAL='Період функціонування вложенного кошторису не співпадає';
  CHOOSEDOCERROR='Немає жодного документа під кошторисом, або вибранний документ не являється актуальним.';
type
  TfrmSmetaStru = class(TForm)
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    CloseButton: TToolButton;
    SmallImages: TImageList;
    WorkPopup: TPopupMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N10: TMenuItem;
    N6: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N9: TMenuItem;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    SmetaDataSet: TpFIBDataSet;
    StruDataSet: TpFIBDataSet;
    StruDataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    StDoxod: TcxStyle;
    StRasxod: TcxStyle;
    DocsButton: TToolButton;
    CHDocDataSet: TpFIBDataSet;
    ChDocDataSource: TDataSource;
    Panel6: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label2: TLabel;
    CHDocsBox: TDBLookupComboBox;
    N2: TMenuItem;
    N4: TMenuItem;
    DetailStruDataSet: TpFIBDataSet;
    DetailStruDataSource: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    MarkSummStyle: TcxStyle;
    DockSite: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    DockPanelTree: TdxDockPanel;
    dxBarDockControl1: TdxBarDockControl;
    DockPanelGrid: TdxDockPanel;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid4: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel4: TPanel;
    Label1: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    ToolBar3: TToolBar;
    addsumbutton: TToolButton;
    delsumbutton: TToolButton;
    updsumbutton: TToolButton;
    ToolButton3: TToolButton;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    Panel1: TPanel;
    Splitter1: TSplitter;
    cxCheckBox1: TcxCheckBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridDBTableView3DBColumn1: TcxGridDBColumn;
    cxGridDBTableView3DBColumn2: TcxGridDBColumn;
    MonthPlanDataSet: TpFIBDataSet;
    PlanMonthDataSource: TDataSource;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    Panel2: TPanel;
    Label3: TLabel;
    ToolButton4: TToolButton;
    PrintPopupMenu: TPopupMenu;
    N12: TMenuItem;
    PrintDocDataSet: TpFIBDataSet;
    PrintDataset: TfrxDBDataset;
    N17: TMenuItem;
    N18: TMenuItem;
    SignersDataset: TfrxDBDataset;
    SignDataSet: TpFIBDataSet;
    N5: TMenuItem;
    Panel3: TPanel;
    EdChangeIdPlan: TcxLookupComboBox;
    Label8: TLabel;
    FormStorage1: TFormStorage;
    ToolButton5: TToolButton;
    frxReport1: TfrxReport;
    N7: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBMemo1: TcxDBMemo;
    cxDBLabel1: TcxDBLabel;
    PopupMenu1: TPopupMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure cxGrid1Resize(Sender: TObject);
    procedure DocsButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure AddsumButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGrid2Resize(Sender: TObject);
    procedure updsumbuttonClick(Sender: TObject);
    procedure cxGrid2DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure delsumbuttonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure cxGrid2Enter(Sender: TObject);
    procedure CHDocsBoxClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure cxGrid2DBTableView1DBColumn4StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure cxGridDBTableView2DblClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
  private
    { Private declarations }
    bbShowFlag:Boolean;
    procedure SetColumsSize;
    procedure SetDetColumnSize;
    procedure GetStruDocs;
  public
     id_user:Integer;
     INFINITY_DATE:TdateTime;
     ActualDate:TDateTime;
     ResultValue:Variant;
     CurFS:TFormStyle;
     CurIdSmeta       : Int64;
     CurIdPlan        : Int64;
     CurSmetaKod      : string;
     CurSmetaGroup    : Integer;
     CurSmetaTitle    : string;
     CurSmetaEnabled  : Boolean;
     PlanDateBeg      : TDateTime;
     PlanDateEnd      : TDateTime;
     PlanIsBlocked    : Boolean;
     PlanSmGr         : Integer;
     constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE;FS:TFormStyle; Book_Date:TDateTime;Id_smeta:Int64;Id_plan:Int64);overload;
     function InsertData(id_obj:Int64 ; id_type,update_flag:integer):Integer;
  end;


implementation

uses uNewStruObj, uSmetaDocs, uSmetSum, BaseTypes, UPlanSign, UConfigureRz,
      USmetChart, UEditNoteForm;

{$R *.dfm}
{ TfrmSmetaStru }

constructor TfrmSmetaStru.Create(AOwner: TComponent;
  DBHandle: TISC_DB_HANDLE; FS: TFormStyle; Book_Date: TDateTime; Id_smeta,
  Id_plan: Int64);
var CheckStructureSP:TPFibStoredProc;
begin
      inherited Create(AOwner);
      bbShowFlag:=false;
      CurIdSmeta:=Id_smeta;
      CurIdPlan :=Id_plan;

      Self.WorkDatabase.Handle:=DBHAndle;
      ActualDate:=Book_Date;
      CurFS:=FS;
      self.FormStyle:=FS;
      if (CurFS=fsNormal)
      then begin
                 N1.Enabled:=false;
                 N3.Enabled:=false;
      end;
      MonthPlanDataSet.SelectSQL.Text:='SELECT * FROM BU_SMETA_VAL_EX WHERE ID_SM_VAL=?ID_VAL';


      try
              CheckStructureSP:=TPFibStoredProc.Create(self);
              CheckStructureSP.Database:=WorkDatabase;
              CheckStructureSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              CheckStructureSP.StoredProcName:='BU_CHECK_PLAN_STRUCTURE';
              CheckStructureSP.ParamByName('ID_PLAN').AsInt64:=CurIdPlan;
              CheckStructureSP.ExecProc;
              WriteTransaction.Commit;
              CheckStructureSP.Close;
              CheckStructureSP.Free;
      except on e:Exception do
                  ShowMessage(E.Message);
      end;
end;

procedure TfrmSmetaStru.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmSmetaStru.FormShow(Sender: TObject);
var SmetaInfo,PlanInfo:TpFibDataSet;
    date_str,beg_str,end_str, isDraft:string;
begin
    dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
    SmetaInfo:=TpFibDataSet.Create(self);
    SmetaInfo.Database:=WorkDatabase;
    SmetaInfo.Transaction:=ReadTransaction;


    PlanInfo:=TpFibDataSet.Create(self);
    PlanInfo.Database:=WorkDatabase;
    PlanInfo.Transaction:=ReadTransaction;
    PlanInfo.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_PLUS_PERIODS WHERE ID_PLAN='+IntTOStr(CurIdPlan);
    PlanInfo.Open;
    if (PlanInfo.RecordCount>0)
    then begin
              PlanDateBeg   :=PlanInfo.FieldByName('DATE_BEG').AsDateTime;
              PlanDateEnd   :=PlanInfo.FieldByName('DATE_END').AsDateTime;
              PlanSmGr      :=PlanInfo.FieldByName('ID_SM_GROUP').Value;
              PlanIsBlocked :=PlanInfo.FieldByName('IS_BLOCKED').AsBoolean;
              dateTimetostring(beg_str,'dd.mm.yyyy', PlanDateBeg);
              dateTimetostring(end_str,'dd.mm.yyyy', PlanDateEnd);

              if PlanInfo.FieldByName('IS_ENABLE_IN_BUHG').Value=0
              then isDraft:=' (Чернетка)'
              else isDraft:='';

              CurIdSmeta:=PlanInfo.FieldByName('ID_SMETA').Value;
    end;


    SmetaInfo.SQLs.SelectSQL.Text:=' SELECT * FROM PUB_SPR_SMETA_SELECT('+''''+date_str+''''+',-1)'+' WHERE P_ID_SMETA='+IntToStr(CurIdSmeta);
    SmetaInfo.Open;
    if SmetaInfo.RecordCount>0
    then begin
           CurSmetaKod    :=SmetaInfo.FieldByName('P_SMETA_KOD').AsString;
           CurSmetaTitle  :=SmetaInfo.FieldByName('P_SMETA_TITLE').AsString;
           CurSmetaEnabled:=SmetaInfo.FieldByName('P_SMETA_ENABLED').AsBoolean;
    end;

    DockPanelTree.Caption:=AnsiUpperCase(SmetaInfo.FieldByName('P_SMETA_KOD').AsString+' "'+SmetaInfo.FieldByName('P_SMETA_TITLE').AsString+'"')+'('+beg_str+'-'+end_str+')';

    Caption:='Планування бюджету "'+CurSmetaKod+'-'+CurSmetaTitle+'" на '+beg_str+'-'+end_str +isDraft ;
    SmetaInfo.Free;
    PlanInfo.Free;

    if RadioButton1.Checked
    then StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+',0) ORDER BY ID_TYPE_OBJ, OBJ_NUM '
    else StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+','+IntToStr(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsInteger)+') ORDER BY ID_TYPE_OBJ, OBJ_NUM ';
    StruDataSet.Open;
    cxGridDBTableView1.ViewData.Expand(true);

    GetStruDocs;
end;

procedure TfrmSmetaStru.AddButtonClick(Sender: TObject);
var T:TfrmSelectNewObjType;
    Res:Variant;
    Filter:TSmetaFilterValues;
    ResCount,i:Integer;
    CheckStoredProc:TpFibStoredProc;
begin
    T:=TfrmSelectNewObjType.Create(self);
    if T.ShowModal=mrYes
    then begin
               if T.RadioButton1.checked//Выбрали раздел
               then begin

                           Res:=GetRazdStSpr(self,   WorkDatabase.Handle,  fsNormal,    ActualDate,    CurIdPlan,   allNotExistInPlan, cmRazd);
                           if (VarArrayDimCount(Res)>0)
                           then begin
                                      ResCount := VarArrayHighBound(Res, 1);
                                      for i:=0 to ResCount-1 do
                                      begin
                                           {Осщуществляем проверку доходного раздела и вложенного бюджета}
                                           CheckStoredProc:=TpFibStoredProc.Create(self);
                                           CheckStoredProc.Database:=WorkDatabase;
                                           CheckStoredProc.Transaction:=ReadTransaction;
                                           CheckStoredProc.StoredProcName:='BU_CHECK_INNER_BUDGET_EX';
                                           CheckStoredProc.Prepare;
                                           CheckStoredProc.ParamByName('ID_PLAN').asInt64:=CurIdPlan;
                                           CheckStoredProc.ParamByName('ID_RZ').asInt64  :=VarAsType(Res[i],varInt64);
                                           CheckStoredProc.ExecProc;
                                           if CheckStoredProc.ParamByName('RESULT').AsInteger=1
                                           then InsertData(VarAsType(Res[i],varInt64),0,0);
                                      end;

                                      CheckStoredProc.ParamByName('ID_PLAN').asInt64:=CurIdPlan;
                                      CheckStoredProc.ParamByName('ID_RZ').asInt64  :=VarAsType(Res[ResCount],varInt64);
                                      CheckStoredProc.ExecProc;
                                      if CheckStoredProc.ParamByName('RESULT').AsInteger=1
                                      then InsertData(VarAsType(Res[ResCount],varInt64),0,1);
                                      CheckStoredProc.Free;
                           end
                           else begin
                                      if (Res<>Variant(0))
                                      then begin
                                                 {Осщуществляем проверку доходного раздела и вложенного бюджета}
                                                 CheckStoredProc:=TpFibStoredProc.Create(self);
                                                 CheckStoredProc.Database:=WorkDatabase;
                                                 CheckStoredProc.Transaction:=ReadTransaction;
                                                 CheckStoredProc.StoredProcName:='BU_CHECK_INNER_BUDGET_EX';
                                                 CheckStoredProc.Prepare;
                                                 CheckStoredProc.ParamByName('ID_PLAN').asInt64:=CurIdPlan;
                                                 CheckStoredProc.ParamByName('ID_RZ').asInt64  :=VarAsType(Res,varInt64);
                                                 CheckStoredProc.ExecProc;
                                                 if CheckStoredProc.ParamByName('RESULT').AsInteger=1
                                                 then InsertData(VarAsType(Res,varInt64),0,1)
                                                 else MessageBox(handle,PChar('Не можна додавати доходні розділи у вложенний кошторис.'),PChar(BU_WarningCaption),MB_OK or MB_ICONWARNING);
                                                 CheckStoredProc.Free;
                                      end
                           end;

               end;
               if T.Radiobutton2.checked//Выбрали смету
               then begin
                           SetLength(Filter.GroupValues,1);
                           Filter.GroupValues[0]:=PlanSmGr;
                           Filter.PlanBeg:=PlanDateBeg;
                           Filter.PlanEnd:=PlanDateEnd;
                           Filter.DateFilter:=true;
                           Filter.GroupFilter:=true;
                           Filter.NOTEqual:=CurIdSmeta;
                           Res:=GlobalSpr.GetSmetaSpr(self,
                                            WorkDatabase.Handle,
                                            fsNormal,
                                            ActualDate,
                                            Filter,
                                            id_user);
                           if  RES<>Variant(0)
                           then begin
                                      InsertData(VarAsType(Res,varInt64),1,1);
                           end;
               end;
    end;
    T.Free;
end;

function TfrmSmetaStru.InsertData(id_obj:Int64; id_type,update_flag: integer):Integer;
var Proc:TpFibStoredProc;
    id_o:integer;
    msg:string;
begin
    id_o:=id_obj;
    Proc:=TpFibStoredProc.Create(self);
    Proc.Database:=WorkDatabase;
    Proc.Transaction:=WriteTransaction;
    proc.StoredProcName:='BU_SMET_STRUCTURE_INSERT';
    WriteTransaction.StartTransaction;
    try
           proc.Prepare;
           proc.ParamByName('P_ID_PLAN_OBJ').AsInt64:=id_o;
           proc.ParamByName('P_ID_PLAN').AsInt64:=CurIdPlan;
           proc.ParamByName('P_ID_TYPE_OBJ').Value:=id_type;
           proc.ExecProc;
           id_o:=proc.ParamByName('P_ID_STRUCTURE').AsInteger;
           WriteTransaction.Commit;

    except on E:Exception do
           begin
                 msg:=E.Message;
                 Delete(msg,1,Pos('exception',msg)-1);
                 MessageBox(handle,PChar(msg),PChar(BU_WarningCaption),MB_OK or MB_ICONWARNING);
                 WriteTransaction.Rollback;
           end;
    end;

    if update_flag=1
    then begin
              StruDataSet.CloseOpen(true);
              cxGridDBTableView1.ViewData.Expand(true);
              cxGridDBTableView1.DataController.LocateByKey(id_o);
    end;
    result:=id_o;
end;

procedure TfrmSmetaStru.SetColumsSize;
begin
end;

procedure TfrmSmetaStru.cxGrid1Resize(Sender: TObject);
begin
     SetColumsSize;
end;

procedure TfrmSmetaStru.DocsButtonClick(Sender: TObject);
var T:TfrmSDocs;
begin
    T:=TfrmSDocs.Create(self);
    T.ShowModal;
    T.Free;
    GetStruDocs;
end;

procedure TfrmSmetaStru.DelButtonClick(Sender: TObject);
var Proc:TpFibStoredProc;
begin
      if (StruDataSet.RecordCount>0)
      then begin
                if MessageBox(Handle,PChar(BU_DeleteConfirmation),PChar(BU_WarningCaption),MB_YESNO or MB_ICONQUESTION)=idYes
                then begin
                     Proc:=TpFibStoredProc.Create(self);
                     Proc.Database:=WorkDatabase;
                     Proc.Transaction:=WriteTransaction;
                     Proc.StoredProcName:='BU_SMET_STRUCTURE_DELETE';
                     WriteTransaction.StartTransaction;
                     try
                            proc.Prepare;
                            proc.ParamByName('P_ID_STRUCTURE').AsInt64:=StrToInt64(StruDataSet.FieldByName('ID_STRUCTURE').AsString);
                            proc.ExecProc;
                            WriteTransaction.Commit;
                     except on E:Exception do
                            begin
                                 MessageBox(Handle,PChar(E.Message),PChar(BU_WarningCaption),MB_OK Or MB_ICONERROR);
                            end;
                     end;
                     StruDataSet.CacheDelete;
                 end;
      end;
end;

procedure TfrmSmetaStru.GetStruDocs;
begin
    CHDocDataSet.Close;
    CHDocDataSet.SQLs.SelectSQL.Text:='';
    CHDocDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_DOCS_SELECT('+IntToStr(CurIdPlan)+') ORDER BY ID_DOC';
    CHDocDataSet.Open;
    CHDocDataSet.Last;
    CHDocsBox.KeyValue:=CHDocDataSet.FieldByName('DATE_NUM').Value;
end;

procedure TfrmSmetaStru.RadioButton2Click(Sender: TObject);
var ID_STRUCTURE,ID_RAZD_ST:integer;
    date_str:string;
begin
   dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);

   if RadioButton2.Checked
   then begin
        RadioButton2.Font.Color:=clRed;
        RadioButton1.Font.Color:=clBlack;
   end
   else begin
        RadioButton2.Font.Color:=clBlack;
        RadioButton1.Font.Color:=clRed;
   end;

   Label2.Enabled:=RadioButton2.Checked;
   CHDocsBox.Enabled:=RadioButton2.Checked;

   ID_STRUCTURE:=0;
   if StruDataSet.RecordCount>0 then ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').Value;


   if StruDataSet.Active then StruDataSet.Close;
   if RadioButton1.Checked
   then StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+',0) ORDER BY ID_TYPE_OBJ, OBJ_NUM '
   else StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+','+IntToStr(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsInteger)+') ORDER BY ID_TYPE_OBJ, OBJ_NUM ';
   StruDataSet.Open;

   if MonthPlanDataSet.Active then MonthPlanDataSet.close;
   if RadioButton1.Checked
   then MonthPlanDataSet.SelectSQL.Text:=' SELECT * FROM BU_SMETA_VAL_EX WHERE ID_SM_VAL=:ID_VAL'
   else MonthPlanDataSet.SelectSQL.Text:=' SELECT * FROM BU_DOCS_SUM_BY_MONTH_SEL(:ID_SUMMA,0)';
   MonthPlanDataSet.Close;

   cxGridDBTableView1.ViewData.Expand(true);
   if ID_STRUCTURE>0
   then begin
        cxGridDBTableView1.DataController.LocateByKey(ID_STRUCTURE);
   end;

   if DetailStruDataSet.RecordCount>0
   then begin
      ID_RAZD_ST:=DetailStruDataSet.FieldByName('ID_RAZD_ST').Value;
      DetailStruDataSet.CloseOpen(true);
      cxGridDBTableView2.ViewData.Expand(true);
      cxGridDBTableView2.DataController.LocateByKey(ID_RAZD_ST);
   end;

   if CHDocDataSet.FieldByName('MAY_EDIT').Value=1
   then begin
             addsumbutton.Enabled:=true;
             if DetailStruDataSet.RecordCount>0
             then begin
                  DelsumButton.Enabled:=true;
                  UpdsumButton.Enabled:=true;
             end;
   end
   else begin
             addsumbutton.Enabled:=false;
             DelsumButton.Enabled:=false;
             UpdsumButton.Enabled:=false;
   end;
end;

procedure TfrmSmetaStru.RadioButton1Click(Sender: TObject);
var ID_RAZD_ST,ID_STRUCTURE:Integer;
    date_str:string;
begin
   dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
   addsumbutton.Enabled:=false;
   updsumbutton.Enabled:=false;
   delsumbutton.Enabled:=false;

   if RadioButton1.Checked
   then begin
        RadioButton1.Font.Color:=clRed;
        RadioButton2.Font.Color:=clBlack;
   end
   else begin
        RadioButton1.Font.Color:=clBlack;
        RadioButton2.Font.Color:=clRed;
   end;

   Label2.Enabled:=RadioButton2.Checked;
   CHDocsBox.Enabled:=RadioButton2.Checked;

   ID_STRUCTURE:=0;
   if StruDataSet.RecordCount>0 then ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').Value;

   if StruDataSet.Active then StruDataSet.Close;
   if RadioButton1.Checked
   then StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+',0) ORDER BY ID_TYPE_OBJ, OBJ_NUM '
   else StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+','+IntToStr(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsInteger)+') ORDER BY ID_TYPE_OBJ, OBJ_NUM ';
   StruDataSet.Open;

   if MonthPlanDataSet.Active then MonthPlanDataSet.close;
   if RadioButton1.Checked
   then MonthPlanDataSet.SelectSQL.Text:=' SELECT * FROM BU_SMETA_VAL_EX WHERE ID_SM_VAL=:ID_VAL'
   else MonthPlanDataSet.SelectSQL.Text:=' SELECT * FROM BU_DOCS_SUM_BY_MONTH_SEL(:ID_SUMMA,0)';
   MonthPlanDataSet.Close;

   cxGridDBTableView1.ViewData.Expand(true);
   if ID_STRUCTURE>0
   then begin
             cxGridDBTableView1.DataController.LocateByKey(ID_STRUCTURE);
   end;

   if DetailStruDataSet.RecordCount>0
   then begin
      ID_RAZD_ST:=DetailStruDataSet.FieldByName('ID_RAZD_ST').Value;
      DetailStruDataSet.CloseOpen(true);
      cxGridDBTableView2.ViewData.Expand(true);
      cxGridDBTableView2.DataController.LocateByKey(ID_RAZD_ST);
   end;
end;

procedure TfrmSmetaStru.N1Click(Sender: TObject);
begin
     AddButton.OnClick(self);
end;

procedure TfrmSmetaStru.N3Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmSmetaStru.N9Click(Sender: TObject);
begin
     CloseButton.OnClick(self);
end;

procedure TfrmSmetaStru.N2Click(Sender: TObject);
begin
     DocsButton.OnClick(self);
end;

procedure TfrmSmetaStru.AddsumButtonClick(Sender: TObject);
var T:TfrmPlanSum;
    Proc:TpFibStoredProc;
    id,ID_STRUCTURE, i, id_sum:integer;
begin
if (CHDocDataSet.RecordCount>0)
then begin
    T:=TfrmPlanSum.Create(self,-1, CurIdPlan,  true);

    T.UseAutoByMonth.checked:=true;
    T.cxRadioButton2.Checked:=not T.UseAutoByMonth.checked;
    T.cxButton1.Enabled     :=not T.UseAutoByMonth.checked;
    T.cxButton2.Enabled     :=not T.UseAutoByMonth.checked;
    T.cxGrid1.Enabled       :=not T.UseAutoByMonth.checked;
    T.Panel1.Visible        :=not T.UseAutoByMonth.checked;

    with CHDocsBox.ListSource.DataSet do
    begin
         T.EdDoc.Text:='№ '+FieldByName('DATE_NUM').AsString+' от'+
                       FieldByName('DATE_DOC').AsString+' "'+
                       FieldByName('DOC_ACTION_TEXT').AsString+'"';

         T.BeforeSumma.Text:=DetailStruDataSet.FieldByName('BEFORE_SUMMA').AsString;
    end;

    if StruDataSet.FieldByName('PL_BY_RAZ').AsBoolean
    then begin
                  T.EdObj.Text:='Раздел '+StruDataSet.FieldByName('OBJ_NUM').AsString+' "'+
                       StruDataSet.FieldByName('OBJ_TITLE').AsString+'"';

    end
    else begin
                  T.EdObj.Text:='Статья: '+DetailStruDataSet.FieldByName('RAZD_ST_NUM').AsString+' "'+
                       DetailStruDataSet.FieldByName('RAZD_ST_TITLE').AsString+'"';
    end;

    T.EdDeltaSum.text:='0';
    T.EdCurrentValue.Text:=DetailStruDataSet.FieldByName('CURRENT_SUMMA').asString;
    if T.ShowModal=mrYes
    then begin
               id:=DetailStruDataSet.FieldByName('ID_RAZD_ST').AsInteger;
               Proc:=TpFibStoredProc.Create(nil);
               Proc.Database:=WorkDatabase;
               Proc.Transaction:=WriteTransaction;
               proc.StoredProcName:='BU_SMET_DOCSUM_INSERT';
               WriteTransaction.StartTransaction;
               try
                      proc.Prepare;
                      proc.ParamByName('P_ID_PLAN_OBJ').Value     :=id;
                      proc.ParamByName('P_ID_PLAN').AsInt64       :=CurIdPlan;
                      proc.ParamByName('P_ID_DOC').AsInt64        :=StrToInt64(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsString);

                      if T.checkDelta.Checked
                      then proc.ParamByName('P_PLAN_SUM').value     :=StrToFloat(T.EdDeltaSum.Text)+StrToFloat(T.EdCurrentValue.Text)
                      else proc.ParamByName('P_PLAN_SUM').value     :=StrToFloat(T.EdNewSum.Text);

                      proc.ParamByName('P_KEY_SESSION').AsInt64   :=T.KEY_SESSION;

                      Proc.ParamByName('P_BY_MONTH_IS_AUTO').value :=Integer(T.UseAutoByMonth.checked);

                      proc.ExecProc;

                      if  proc.ParamByName('P_ID_SUM').value<>null
                      then begin
                                if not T.UseAutoByMonth.checked
                                then begin
                                          id_sum:= proc.ParamByName('P_ID_SUM').value;
                                          proc.StoredProcName:='BU_DOCS_SUM_BY_MONTH_IU';

                                          T.MonthValuesDataSetBuffer.First;
                                          for i:=0 to t.MonthValuesDataSetBuffer.RecordCount-1 do
                                          begin
                                               Proc.Prepare;
                                               Proc.ParamByName('ID_SUM_BY_MONTH_IN').value:=0;
                                               Proc.ParamByName('ID_SUM').asInt64         :=id_sum;
                                               Proc.ParamByName('DATE_REG').Value         :=T.MonthValuesDataSetBuffer.FieldByName('DATE_REG').Value;
                                               Proc.ParamByName('PLAN_SUM').Value         :=T.MonthValuesDataSetBuffer.FieldByName('PLAN_SUM').Value;
                                               Proc.ExecProc;
                                               T.MonthValuesDataSetBuffer.Next;
                                          end;
                                end;
                      end;

               except on E:Exception do
                      begin
                         ShowMessage('Помилка при роботі з плановими показниками: '+E.Message);
                         Proc.Free;
                      end;
               end;
               WriteTransaction.Commit;
               Proc.free;

               ID_STRUCTURE:=0;
               if StruDataSet.RecordCount>0 then ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').Value;

               StruDataSet.CloseOpen(true);

               cxGridDBTableView1.ViewData.Expand(true);
               if ID_STRUCTURE>0
               then begin
                     cxGridDBTableView1.DataController.LocateByKey(ID_STRUCTURE);
               end;

               DetailStruDataSet.CloseOpen(true);
               cxGridDBTableView2.ViewData.Expand(true);
               cxGridDBTableView2.DataController.LocateByKey(id);
    end;
    T.Free;
end
else begin
               BaseTypes.agMessageDlg(BU_WarningCaption,CHOOSEDOCERROR,mtError,[mbOk]);
end;
end;

procedure TfrmSmetaStru.RefreshButtonClick(Sender: TObject);
var date_str:string;
    id:integer;
begin
    id:=StruDataSet.FieldByName('ID_STRUCTURE').AsInteger;
    dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
    StruDataSet.Close;
    if RadioButton1.Checked
       then StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+',0) ORDER BY ID_TYPE_OBJ'
       else StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+','+IntToStr(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsInteger)+') ORDER BY ID_TYPE_OBJ';
    StruDataSet.Open;
    cxGridDBTableView1.ViewData.Expand(true);
    StruDataSet.Locate('ID_STRUCTURE',id,[]);
end;

procedure TfrmSmetaStru.N4Click(Sender: TObject);
var getPlanId:TpFibDataSet;
    searchSmeta:Int64;
    date_beg,date_end:String;
begin

   if cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_TYPE_OBJ').ASInteger=1
   then begin
        searchSmeta:=VarAsType(cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_PLAN_OBJ').Value,varInt64);
        DateTimeToString(date_beg,'dd.mm.yyyy',PlanDateBeg);
        DateTimeToString(date_end,'dd.mm.yyyy',PlanDateEnd);

        getPlanId:=TpFibDataSet.Create(self);
        getPlanId.Database:=WorkDatabase;
        getPlanId.Transaction:=ReadTransaction;
        getPlanId.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_PLUS_PERIODS '+
                                           ' WHERE ID_SMETA = '+IntToStr(searchSmeta)+
                                           ' AND DATE_BEG='+''''+date_beg+''''+
                                           ' AND DATE_END='+''''+date_end+'''';
        getPlanId.Open;
        if getPlanId.RecordCount>0
        then begin
                                          UseSmeta(self.Owner,
                                                   WorkDatabase.Handle,
                                                   fsMdiChild,
                                                   ActualDate,
                                                   searchSmeta,
                                                   TFibBCDField(getPlanId.FieldByName('ID_PLAN')).ASInt64);
        end
        else begin
                    BaseTypes.agMessageDlg(BU_WarningCaption,PERIODNOTEQUAL,mtError,[mbOk]);
        end;
        getPlanId.Free;
   end
   else begin
        BaseTypes.agMessageDlg(BU_WarningCaption,NOTSMETATEXT,mtError,[mbOk]);
   end;
end;

procedure TfrmSmetaStru.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
  var ID_RAZD_ST:Integer;
begin
           ID_RAZD_ST:=0;
           if DetailStruDataSet.RecordCount>0
           then ID_RAZD_ST:=DetailStruDataSet.FieldByName('ID_RAZD_ST').Value;
           DetailStruDataSet.Close;
           if (cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_TYPE_OBJ').ASinteger=0)
           then begin

                   if RadioButton1.Checked
                   then begin
                             if (cxGridDBTableView1.DataController.DataSource.DataSet.RecordCount>0)
                             then begin
                                       DetailStruDataSet.SQLs.SelectSQL.Text:=
                                       ' SELECT * FROM PUB_SPR_RAZD_ST_SELECT_EX('+
                                       cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_PLAN_OBJ').ASString
                                       +',0,'+IntToStr(CurIdPlan)+') ';

                                       DetailStruDataSet.Open;
                                       DetailStruDataSet.CloseOpen(true);
                                       cxGridDBTableView2.ViewData.Expand(true);
                                       DetailStruDataSet.Locate('ID_RAZD_ST',ID_RAZD_ST,[]);
                             end
                   end
                   else begin
                             if (cxGridDBTableView1.DataController.DataSource.DataSet.RecordCount>0)
                             then begin
                                       DetailStruDataSet.SQLs.SelectSQL.Text:=
                                       ' SELECT * FROM PUB_SPR_RAZD_ST_SELECT_EX('+
                                       cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_PLAN_OBJ').ASString
                                       +','+IntToStr(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsInteger)+','+IntToStr(CurIdPlan)+') ';
                                       DetailStruDataSet.Open;
                                       DetailStruDataSet.CloseOpen(true);
                                       cxGridDBTableView2.ViewData.Expand(true);
                                       DetailStruDataSet.Locate('ID_RAZD_ST',ID_RAZD_ST,[]);
                             end;
                   end;
           end;
end;

procedure TfrmSmetaStru.SetDetColumnSize;
begin

end;

procedure TfrmSmetaStru.cxGrid2Resize(Sender: TObject);
begin
     SetDetColumnSize;
end;

procedure TfrmSmetaStru.updsumbuttonClick(Sender: TObject);
var T:TfrmPlanSum;
    Proc:TpFibStoredProc;
    id,ID_STRUCTURE, i:integer;
begin
    if (CHDocDataSet.RecordCount>0)
    then begin
              T:=TfrmPlanSum.Create(self, DetailStruDataSet.FieldByName('ID_SUMMA').Value, CurIdPlan, false);

              T.UseAutoByMonth.checked:=Boolean(DetailStruDataSet.FieldByName('BY_MONTH_IS_AUTO').AsInteger);
              T.cxRadioButton2.Checked:=not T.UseAutoByMonth.checked;
              T.cxButton1.Enabled     :=not T.UseAutoByMonth.checked;
              T.cxButton2.Enabled     :=not T.UseAutoByMonth.checked;
              T.cxGrid1.Enabled       :=not T.UseAutoByMonth.checked;
              T.Panel1.Visible        :=not T.UseAutoByMonth.checked;

              with CHDocsBox.ListSource.DataSet do
              begin
                   T.EdDoc.Text:='№ '+FieldByName('DATE_NUM').AsString+' от'+
                                 FieldByName('DATE_DOC').AsString+' "'+
                                 FieldByName('DOC_ACTION_TEXT').AsString+'"';

                   T.BeforeSumma.Text:=DetailStruDataSet.FieldByName('BEFORE_SUMMA').AsString;

                   if (DetailStruDataSet.FieldByName('BEFORE_SUMMA').Value=0)
                   then begin
                             T.EdNewSum.Text   :=DetailStruDataSet.FieldByName('SUMMA').AsString;
                             T.CheckNewSum.Checked:=true;
                             T.EdCurrentValue.Text:=DetailStruDataSet.FieldByName('SUMMA').AsString;
                   end
                   else begin
                             T.EdDeltaSum.Text:=DetailStruDataSet.FieldByName('SUMMA').AsString;
                             T.EdNewSum.Text   :=DetailStruDataSet.FieldByName('BEFORE_SUMMA').Value+DetailStruDataSet.FieldByName('SUMMA').Value;
                             T.EdCurrentValue.Text:=T.EdNewSum.Text;
                             T.CheckNewSum.Checked:=true;
                   end;

              end;

              if StruDataSet.FieldByName('PL_BY_RAZ').AsBoolean
              then begin
                        T.EdObj.Text:='Раздел '+StruDataSet.FieldByName('OBJ_NUM').AsString+' "'+
                        StruDataSet.FieldByName('OBJ_TITLE').AsString+'"';

              end
              else begin
                        T.EdObj.Text:='Статья: '+DetailStruDataSet.FieldByName('RAZD_ST_NUM').AsString+' "'+
                        DetailStruDataSet.FieldByName('RAZD_ST_TITLE').AsString+'"';
              end;

              if T.ShowModal=mrYes
              then begin
                        id:=DetailStruDataSet.FieldByName('ID_RAZD_ST').AsInteger;
                        Proc:=TpFibStoredProc.Create(self);
                        Proc.Database:=WorkDatabase;
                        Proc.Transaction:=WriteTransaction;
                        proc.StoredProcName:='BU_SMET_DOCSUM_UPDATE';
                        WriteTransaction.StartTransaction;
                        try
                                proc.Prepare;
                                proc.ParamByName('P_ID_PLAN').AsInt64    :=CurIdPlan;
                                proc.ParamByName('P_ID_SUM').AsInt64     :=StrToInt64(DetailStruDataSet.FieldByName('ID_SUMMA').AsString);
                                proc.ParamByName('P_ID_PLAN_OBJ').AsInt64:=TFibBcdField(DetailStruDataSet.FieldByName('ID_RAZD_ST')).AsInt64;
                                proc.ParamByName('P_ID_DOC').AsInt64     :=StrToInt64(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsString);

                                if T.checkDelta.Checked
                                then proc.ParamByName('P_PLAN_SUM').value    :=StrToFloat(T.EdDeltaSum.Text)+StrToFloat(T.EdCurrentValue.Text)
                                else proc.ParamByName('P_PLAN_SUM').value    :=StrToFloat(T.EdNewSum.Text);

                                Proc.ParamByName('P_BY_MONTH_IS_AUTO').value :=Integer(T.UseAutoByMonth.checked);

                                proc.ParamByName('P_KEY_SESSION').AsInt64    :=T.KEY_SESSION;
                                proc.ExecProc;


                                if not T.UseAutoByMonth.checked
                                then begin
                                          proc.StoredProcName:='BU_DOCS_SUM_BY_MONTH_IU';

                                          T.MonthValuesDataSetBuffer.First;
                                          for i:=0 to t.MonthValuesDataSetBuffer.RecordCount-1 do
                                          begin
                                               Proc.Prepare;
                                               Proc.ParamByName('ID_SUM_BY_MONTH_IN').AsInt64:=StrToInt64(T.MonthValuesDataSetBuffer.FieldByName('ID_SUM_BY_MONTH').asString);
                                               Proc.ParamByName('ID_SUM').asInt64         :=StrToInt64(T.MonthValuesDataSetBuffer.FieldByName('ID_SUM').AsString);
                                               Proc.ParamByName('DATE_REG').Value         :=T.MonthValuesDataSetBuffer.FieldByName('DATE_REG').Value;
                                               Proc.ParamByName('PLAN_SUM').Value         :=T.MonthValuesDataSetBuffer.FieldByName('PLAN_SUM').Value;
                                               Proc.ExecProc;
                                               T.MonthValuesDataSetBuffer.Next;
                                          end;
                                end;

                        except on E:Exception do
                                begin
                                     ShowMessage('Помилка при зміні планового показника: '+E.Message);
                                     WriteTransaction.Rollback;
                                end;
                        end;
                        WriteTransaction.Commit;

                        ID_STRUCTURE:=0;
                        if (StruDataSet.RecordCount>0)
                        then ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').Value;

                        StruDataSet.CloseOpen(true);
                        cxGridDBTableView1.ViewData.Expand(true);
                        if ID_STRUCTURE>0
                        then begin
                              cxGridDBTableView1.DataController.LocateByKey(ID_STRUCTURE);
                        end;

                        DetailStruDataSet.CloseOpen(true);
                        cxGridDBTableView2.ViewData.Expand(true);
                        cxGridDBTableView2.DataController.LocateByKey(id);
              end;
              T.Free;
    end
    else begin
              BaseTypes.agMessageDlg(BU_WarningCaption,CHOOSEDOCERROR,mtError,[mbOk]);
    end;
end;

procedure TfrmSmetaStru.cxGrid2DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
      if (cxGridDBTableView2.Controller.GridView.ViewInfo.RecordsViewInfo.Count>0)
      and RadioButton2.Checked
      and (CHDocDataSet.FieldByName('MAY_EDIT').Value=1)
      then begin
                  if (StrToInt(cxGridDBTableView2.Controller.FocusedRecord.Values[3])>0)
                  then begin
                             AddsumButton.Enabled:=false;
                             updsumbutton.Enabled:=true;
                             delsumbutton.Enabled:=true;
                  end
                  else begin
                             AddsumButton.Enabled:=true;
                             updsumbutton.Enabled:=false;
                             delsumbutton.Enabled:=false;
                  end;
      end
      else begin
                AddsumButton.Enabled:=false;
                updsumbutton.Enabled:=false;
                delsumbutton.Enabled:=false;
      end;
end;

procedure TfrmSmetaStru.delsumbuttonClick(Sender: TObject);
var Proc:TpFibStoredProc;
    id,ID_STRUCTURE:integer;
begin
if MessageBox(Handle,PChar(BU_DeleteConfirmation),PChar(BU_WarningCaption),MB_YESNO or MB_ICONERROR)=idYes
then begin
          if (CHDocDataSet.RecordCount>0)
          then begin
                         id:=DetailStruDataSet.FieldByName('ID_RAZD_ST').AsInteger;
                         Proc:=TpFibStoredProc.Create(self);
                         Proc.Database:=WorkDatabase;
                         Proc.Transaction:=WriteTransaction;
                         proc.StoredProcName:='BU_SMET_DOCSUM_DELETE';
                         WriteTransaction.StartTransaction;
                         try
                                proc.Prepare;
                                proc.ParamByName('P_ID_SUM').asInt64     :=TFibBcdField(DetailStruDataSet.FieldByName('ID_SUMMA')).AsInt64;
                                proc.ExecProc;
                         except on E:Exception do
                                begin
                                   BaseTypes.agMessageDlg(BU_WarningCaption,E.Message,mtError,[mbOk]);
                                   WriteTransaction.Rollback;
                                end;
                         end;
                         WriteTransaction.Commit;

                         ID_STRUCTURE:=0;
                         if StruDataSet.RecordCount>0 then ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').Value;

                         StruDataSet.CloseOpen(true);
                         cxGridDBTableView1.ViewData.Expand(true);
                         if ID_STRUCTURE>0
                         then begin
                              cxGridDBTableView1.DataController.LocateByKey(ID_STRUCTURE);
                         end;

                         DetailStruDataSet.CloseOpen(true);
                         cxGridDBTableView2.ViewData.Expand(true);
                         cxGridDBTableView2.DataController.LocateByKey(id);
          end
          else begin
              BaseTypes.agMessageDlg(BU_WarningCaption,CHOOSEDOCERROR,mtError,[mbOk]);
          end;
end;

end;

procedure TfrmSmetaStru.ToolButton1Click(Sender: TObject);
var ID_STRUCTURE,id:Integer;
begin
     If StruDataSet.RecordCount>0
     then ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').value
     else ID_STRUCTURE:=0;

     StruDataSet.CloseOpen(true);
     cxGridDBTableView1.ViewData.Expand(true);
     if (ID_STRUCTURE>0)
     then begin
          cxGridDBTableView1.DataController.LocateByKey(ID_STRUCTURE);
     end;

     if  DetailStruDataSet.RecordCount>0
     then id:=DetailStruDataSet.FieldByName('ID_RAZD_ST').AsInteger
     else id:=0;

     DetailStruDataSet.CloseOpen(true);
     cxGridDBTableView2.ViewData.Expand(true);
     cxGridDBTableView2.DataController.LocateByKey(id);
end;

procedure TfrmSmetaStru.cxGrid2Enter(Sender: TObject);
begin
     cxGrid2DBTableView1FocusedRecordChanged(cxGridDBTableView2,cxGridDBTableView2.Controller.FocusedRecord,cxGridDBTableView2.Controller.FocusedRecord,false);
end;

procedure TfrmSmetaStru.CHDocsBoxClick(Sender: TObject);
var ID_STRUCTURE,id:Integer;
    date_str:string;
begin
     dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);

     If StruDataSet.RecordCount>0
     then ID_STRUCTURE:=StruDataSet.FieldByName('ID_STRUCTURE').value
     else ID_STRUCTURE:=0;

     StruDataSet.Close;

     if RadioButton1.Checked
     then StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+',0) ORDER BY ID_TYPE_OBJ, OBJ_NUM '
     else StruDataSet.SQLs.SelectSQL.Text:=' SELECT * FROM BU_SMET_STRUCTURE_SELECT('+IntToStr(CurIdPlan)+','+''''+date_str+''''+','+IntToStr(CHDocsBox.ListSource.DataSet.FieldByName('ID_DOC').AsInteger)+') ORDER BY ID_TYPE_OBJ, OBJ_NUM ';

     StruDataSet.Open;
     cxGridDBTableView1.ViewData.Expand(true);
     if (ID_STRUCTURE>0)
     then begin
          cxGridDBTableView1.DataController.LocateByKey(ID_STRUCTURE);
     end;

     if  DetailStruDataSet.RecordCount>0
     then id:=DetailStruDataSet.FieldByName('ID_RAZD_ST').AsInteger
     else id:=0;

     if DetailStruDataSet.SelectSQL.Text<>''
     then DetailStruDataSet.CloseOpen(true);
     
     cxGridDBTableView2.ViewData.Expand(true);
     cxGridDBTableView2.DataController.LocateByKey(id);
end;

procedure TfrmSmetaStru.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmetaStru.cxGrid2DBTableView1DBColumn4StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.Values[2]<>0
  then AStyle:=MarkSummStyle
  else AStyle:=back;
end;

procedure TfrmSmetaStru.ToolButton3Click(Sender: TObject);
begin
     GlobalSpr.GetOtchIntf(self,WorkDatabase.Handle,CurIdPlan,id_user,fsNormal);
end;

procedure TfrmSmetaStru.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     Panel1.Visible:=cxCheckBox1.Checked;
     if cxCheckBox1.Checked
     then Splitter1.Top:=Panel1.Top-1;
end;

procedure TfrmSmetaStru.N12Click(Sender: TObject);
begin
     if SignDataSet.Active then SignDataSet.Close;
     SignDataSet.SelectSQL.Text:='SELECT * FROM BU_DOCS_SIGNS_SELECT('+IntToStr(CurIdPlan)+') ORDER BY N_PP ASC';
     SignDataSet.Open;
     SignDataSet.FetchAll;

     if PrintDocDataSet.Active then PrintDocDataSet.Close;
     PrintDocDataSet.SelectSQL.Text:='SELECT * FROM BU_PRINT_PLAN_DOC('+IntToStr(CurIdPlan)+', NULL) ORDER BY PROFITABLE DESC, PRINT_POSITION, ID_TYPE_OBJ, PRINT_NUM ';
     PrintDocDataSet.Open;
     PrintDocDataSet.FetchAll;
     frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmPlanDoc.fr3',true);
     frxReport1.Variables['SM']:=''''+CurSmetaKod+' '+CurSmetaTitle+'''';
     frxReport1.Variables['PERIOD']:=''''+DateTimeToStr(PlanDateBeg)+'-'+DateTimeToStr(PlanDateEnd)+'''';
     frxReport1.PrepareReport(true);
     frxReport1.ShowPreparedReport;
end;

procedure TfrmSmetaStru.N18Click(Sender: TObject);
var T:TfrmSigners;
begin
    T:=TfrmSigners.Create(self);
    T.ShowModal;
    T.Free;
end;

procedure TfrmSmetaStru.N5Click(Sender: TObject);
var T:TfrmConfRazd;
    WorkSP:TpFIbStoredProc;
    SHOW_ONLY_PLANED:Integer;
begin
if (StruDataSet.RecordCount>0)
then begin
     if cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_TYPE_OBJ').ASInteger=0
     then begin
               //Получаем информацию по настройке раздела
               WorkSP:=TpFIbStoredProc.Create(self);
               WorkSP.Database:=WorkDatabase;
               WorkSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               WorkSP.StoredProcName:='BU_GET_RAZDEL_CONF';
               WorkSP.Prepare;
               WorkSP.ParamByName('ID_STRUCTURE').Value:=cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_STRUCTURE').Value;
               WorkSP.ExecProc;
               SHOW_ONLY_PLANED:=WorkSP.ParamByName('SHOW_ONLY_PLANED').AsInteger;
               T:=TfrmConfRazd.Create(self);
               T.cxRadioGroup1.ItemIndex:=SHOW_ONLY_PLANED;
               if T.ShowModal=mrYes
               then begin
                        SHOW_ONLY_PLANED:=T.cxRadioGroup1.ItemIndex;
                        WorkSP.StoredProcName:='BU_SET_RAZDEL_CONF';
                        WorkSP.ParamByName('SHOW_ONLY_PLANED').AsInteger:=SHOW_ONLY_PLANED;
                        WorkSP.ParamByName('ID_STRUCTURE').Value:=cxGridDBTableView1.DataController.DataSource.DataSet.FieldByName('ID_STRUCTURE').Value;
                        WorkSP.ExecProc;
               end;
               WriteTransaction.Commit;
               WorkSP.Free;
               T.Free;
     end
     else begin
               ShowMessage('Функція доступна тільки для розділів доходів та видатків');
     end;
end;     
end;

procedure TfrmSmetaStru.Panel3Resize(Sender: TObject);
begin
     EdChangeIdPlan.Left:=0;
     EdChangeIdPlan.Width:=Panel3.Width-125;
end;

procedure TfrmSmetaStru.cxGridDBTableView2DblClick(Sender: TObject);
begin
     if AddsumButton.Enabled
     then AddsumButton.OnClick(self);

     if updsumbutton.Enabled
     then updsumbutton.OnClick(self);
end;

procedure TfrmSmetaStru.ToolButton5Click(Sender: TObject);
var ChartForm: TChartForm;
begin
     //Отображаем структуру доходной и расходной частей бюджета
     ChartForm:=TChartForm.Create(self);
     ChartForm.ShowModal;
     ChartForm.Free;
end;

procedure TfrmSmetaStru.N7Click(Sender: TObject);
var frmEditNote: TfrmEditNote;
    UpdateSP:TpFibStoredProc;
    id_o:Integer;
begin
     if (StruDataSet.RecordCount>0)
     then begin
               frmEditNote:=TfrmEditNote.Create(self);
               frmEditNote.cxMemo1.Text:=StruDataSet.FieldByName('NOTE').AsString;
               if frmEditNote.ShowModal=mrYes
               then begin
                         UpdateSP:=TpFibStoredProc.Create(self);
                         UpdateSP.Database:=WorkDatabase;
                         UpdateSP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         UpdateSP.StoredProcName:='BU_SMET_STRUCTURE_UPD_NOTE';
                         UpdateSP.Prepare;
                         id_o:=StrToInt64(StruDataSet.FieldByName('ID_PLAN_OBJ').asString);
                         UpdateSP.ParamByName('ID_STUCTURE').AsInt64:=StrToInt64(StruDataSet.FieldByName('ID_STRUCTURE').asString);
                         UpdateSP.ParamByName('NOTE').Value:=frmEditNote.cxMemo1.EditValue;
                         UpdateSP.ExecProc;
                         WriteTransaction.Commit;
                         UpdateSP.Close;
                         UpdateSP.Free;
                         StruDataSet.CloseOpen(true);
                         cxGridDBTableView1.ViewData.Expand(true);
                         cxGridDBTableView1.DataController.LocateByKey(id_o);
               end;
               frmEditNote.Free;
     end;
end;

end.



