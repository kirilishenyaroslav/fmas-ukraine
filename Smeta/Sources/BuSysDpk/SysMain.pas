unit SysMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  Ibase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ToolWin, ImgList,pfibStoredProc, cxCheckBox, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, cxGridBandedTableView, cxGridDBBandedTableView,
  Placemnt, cxRadioGroup;

type
  TfrmSysOptions = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    EdSchForOtch: TcxButtonEdit;
    Label1: TLabel;
    EdKekvForOtch: TcxButtonEdit;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    ObjectPathDataSet: TpFIBDataSet;
    ObjectPathDataSource: TDataSource;
    Label3: TLabel;
    EditSchForSprav: TcxButtonEdit;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    SmallImages: TImageList;
    TemplateDataSet: TpFIBDataSet;
    TemplateDataSource: TDataSource;
    TabSheet4: TTabSheet;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    cxGrid1: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDBBandedColumn2: TcxGridDBBandedColumn;
    cxGridDBBandedColumn3: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    DefPerDataSet: TpFIBDataSet;
    DefPerDataSource: TDataSource;
    FormStorage1: TFormStorage;
    CheckUseAccessInfo: TcxCheckBox;
    TypeOtch0: TcxRadioButton;
    TypeOtch1: TcxRadioButton;
    ViewFnds: TcxCheckBox;
    ViewBankSch: TcxCheckBox;
    UsePrInInner: TcxCheckBox;
    USE_PLAN_VALUES_UPDATE_SHEMES: TcxCheckBox;
    TabSheet3: TTabSheet;
    Label22: TLabel;
    MAIN_REPORT_SCH_COLUMN_9_PROP: TcxTextEdit;
    Label4: TLabel;
    MAIN_REPORT_SCH_COLUMN_10_PROP: TcxTextEdit;
    Label6: TLabel;
    MAIN_REPORT_SCH_COLUMN_13_PROP: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure EdKekvForOtchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSchForSpravPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    CurMBookData:TDateTime;
    SchForOtch  :Int64;
    SchForSprav :Int64;
    KEKVFOROTCH :Int64;
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);overload;
  end;

  procedure GetSysOptionsBu(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);stdcall;
  exports GetSysOptionsBu;

implementation

uses GlobalSPR, BaseTypes, UEditDefPer, cxCalc;

{$R *.dfm}
{ TfrmSysOptions }
procedure GetSysOptionsBu(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
var f:Boolean;
    i:Integer;
begin
    f:=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmSysOptions)
         then begin
                           Application.MainForm.MDIChildren[i].BringToFront;
                           f:=false;
         end;
    end;
    if f then TfrmSysOptions.Create(AOwner,DB_HANDLE);
end;


constructor TfrmSysOptions.Create(AOwner: TComponent;DB_HANDLE: TISC_DB_HANDLE);
var SysInfo:TpFibDataSet;
begin
     inherited Create(AOwner);
     PageControl1.ActivePageIndex:=0;
     WorkDatabase.Handle:=DB_HANDLE;
     ReadTransaction.StartTransaction;

     SysInfo:=TpFibDataSet.Create(self);
     SysInfo.Database:=WorkDatabase;
     SysInfo.Transaction:=ReadTransaction;
     SysInfo.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     SysInfo.Open;
     CurMBookData:=SysInfo.FieldByName('MAIN_BOOK_DATE').AsDateTime;
     SysInfo.Close;
     SysInfo.SelectSQL.Text:='SELECT * FROM BU_INI_SELECT';
     SysInfo.Open;
     SchForOtch:=TFIBBCDField(SysInfo.FieldByName('ID_SCH_FOR_OTCH')).AsInt64;
     EdSchForOtch.Text:=SysInfo.FieldByName('SCH_NUMBER').AsString+' "'+SysInfo.FieldByName('SCH_TITLE').AsString+'"';
     SchForSprav:=TFIBBCDField(SysInfo.FieldByName('ID_SCH_FOR_SPRAV')).AsInt64;
     EditSchForSprav.Text:=SysInfo.FieldByName('SCH_NUMBER_SPRAV').AsString+' "'+SysInfo.FieldByName('SCH_TITLE_SPRAV').AsString+'"';
     KEKVFOROTCH:=TFIBBCDField(SysInfo.FieldByName('ID_KEKV_FOR_OTCH')).AsInt64;
     EdKekvForOtch.Text:=SysInfo.FieldByName('KEKV_KOD').AsString+' "'+SysInfo.FieldByName('KEKV_TITLE').AsString+'"';
     cxLookupComboBox1.editvalue:=SysInfo.FieldByName('ID_OBJECT').Value;
     CheckUseAccessInfo.Checked:=Boolean(SysInfo.FieldByName('USE_ACCESS_INFO').Value);

     if (SysInfo.FieldByName('USE_OTCH_ONLY_KASSA_VALUES').Value<>NULL)
     then begin
               if SysInfo.FieldByName('USE_OTCH_ONLY_KASSA_VALUES').asInteger=0
               then TypeOtch0.Checked:=true
               else TypeOtch1.Checked:=true;
     end
     else begin
               TypeOtch0.Checked:=true;
     end;

     if (SysInfo.FieldByName('USE_GR_PLUS_SCH_LINK').Value<>NULL)
     then begin
               if SysInfo.FieldByName('USE_GR_PLUS_SCH_LINK').asInteger=0
               then ViewBankSch.Checked:=FAlse
               else ViewBankSch.Checked:=true;
     end
     else begin
               ViewBankSch.Checked:=true;
     end;

     if (SysInfo.FieldByName('USE_GR_PLUS_FND_LINK').Value<>NULL)
     then begin
               if SysInfo.FieldByName('USE_GR_PLUS_FND_LINK').asInteger=0
               then ViewFnds.Checked:=false
               else ViewFnds.Checked:=true;
     end
     else begin
               ViewFnds.Checked:=true;
     end;

     if (SysInfo.FieldByName('USE_PROFITABLE_OBJECT_IN_INNER').Value<>NULL)
     then begin
               if SysInfo.FieldByName('USE_PROFITABLE_OBJECT_IN_INNER').asInteger=0
               then UsePrInInner.Checked:=false
               else UsePrInInner.Checked:=true;
     end
     else begin
               UsePrInInner.Checked:=true;
     end;

     if (SysInfo.FieldByName('USE_PLAN_VALUES_UPDATE_SHEMES').Value<>NULL)
     then begin
               if SysInfo.FieldByName('USE_PLAN_VALUES_UPDATE_SHEMES').asInteger=0
               then USE_PLAN_VALUES_UPDATE_SHEMES.Checked:=false
               else USE_PLAN_VALUES_UPDATE_SHEMES.Checked:=true;
     end
     else begin
               USE_PLAN_VALUES_UPDATE_SHEMES.Checked:=true;
     end;

     if (SysInfo.FieldByName('MAIN_REPORT_SCH_COLUMN_10_PROP').Value<>NULL)
     then begin
               MAIN_REPORT_SCH_COLUMN_10_PROP.EditValue:=SysInfo.FieldByName('MAIN_REPORT_SCH_COLUMN_10_PROP').Value;
     end;

     if (SysInfo.FieldByName('MAIN_REPORT_SCH_COLUMN_9_PROP').Value<>NULL)
     then begin
               MAIN_REPORT_SCH_COLUMN_9_PROP.EditValue:=SysInfo.FieldByName('MAIN_REPORT_SCH_COLUMN_9_PROP').Value;
     end;

     if (SysInfo.FieldByName('MAIN_REPORT_SCH_COLUMN_13_PROP').Value<>NULL)
     then begin
               MAIN_REPORT_SCH_COLUMN_13_PROP.EditValue:=SysInfo.FieldByName('MAIN_REPORT_SCH_COLUMN_13_PROP').Value;
     end;

     SysInfo.Close;
     SysInfo.Free;

     ObjectPathDataSet.Open;
     ObjectPathDataSet.FetchAll;


     TemplateDataSet.Open;

     DefPerDataSet.SelectSQL.Text:='SELECT * FROM BU_OTCH_DEF_PERCENT_SELECT';
     DefPerDataSet.Open;
end;

procedure TfrmSysOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;


procedure TfrmSysOptions.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSch(self,WorkDatabase.Handle,fsNormal,Date,1,0,SchForOtch);
    if VarArrayDimCount(Res)>0
    then begin
               SchForOtch:=RES[0][0];
               EdSchForOtch.Text:=VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
    end;
end;

procedure TfrmSysOptions.cxButton1Click(Sender: TObject);
 var UpdateStoredProc:TpFibStoredProc;
begin
     UpdateStoredProc:=TpFibStoredProc.Create(self);
     UpdateStoredProc.Database:=WorkDatabase;
     UpdateStoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdateStoredProc.StoredProcName:='BU_INI_UPDATE';
     UpdateStoredProc.Prepare;
     UpdateStoredProc.ParamByName('ID_SCH_FOR_OTCH').AsInt64 := SchForOtch;
     UpdateStoredProc.ParamByName('ID_SCH_FOR_SPRAV').AsInt64:=SchForSprav;
     UpdateStoredProc.ParamByName('ID_KEKV_FOR_OTCH').AsInt64:= KEKVFOROTCH;
     UpdateStoredProc.ParamByName('ID_OBJECT').AsInt64       := VarAsType(cxLookupComboBox1.EditValue, varInt64);
     UpdateStoredProc.ParamByName('USE_ACCESS_INFO').Value   := Integer(CheckUseAccessInfo.Checked);
     UpdateStoredProc.ParamByName('USE_GR_PLUS_SCH_LINK').Value   := Integer(ViewBankSch.Checked);
     UpdateStoredProc.ParamByName('USE_GR_PLUS_FND_LINK').Value   := Integer(ViewFnds.Checked);
     UpdateStoredProc.ParamByName('USE_PROFITABLE_OBJECT_IN_INNER').Value   := Integer(UsePrInInner.Checked);
     UpdateStoredProc.ParamByName('USE_PLAN_VALUES_UPDATE_SHEMES').Value   := Integer(USE_PLAN_VALUES_UPDATE_SHEMES.Checked);

     UpdateStoredProc.ParamByName('MAIN_REPORT_SCH_COLUMN_10_PROP').Value   := MAIN_REPORT_SCH_COLUMN_10_PROP.EditValue;
     UpdateStoredProc.ParamByName('MAIN_REPORT_SCH_COLUMN_9_PROP').Value   := MAIN_REPORT_SCH_COLUMN_9_PROP.EditValue;
     UpdateStoredProc.ParamByName('MAIN_REPORT_SCH_COLUMN_13_PROP').Value   := MAIN_REPORT_SCH_COLUMN_13_PROP.EditValue;

     if TypeOtch0.Checked
     then UpdateStoredProc.ParamByName('USE_OTCH_ONLY_KASSA_VALUES').Value   :=0
     else UpdateStoredProc.ParamByName('USE_OTCH_ONLY_KASSA_VALUES').Value   :=1;
     UpdateStoredProc.ExecProc;
     UpdateStoredProc.Free;
     WriteTransaction.Commit;
     Close;
end;

procedure TfrmSysOptions.cxButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSysOptions.EdKekvForOtchPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,WorkDatabase.Handle,fsNormal,CurMBookData,1);
    if VarArrayDimCount(Res)>0
    then begin
         KEKVFOROTCH:=Res[0][0];
         EdKekvForOtch.Text:=VarToStr(Res[0][2])+' "'+VarToStr(Res[0][1])+'"';
    end;
end;

procedure TfrmSysOptions.EditSchForSpravPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSch(self,WorkDatabase.Handle,fsNormal,Date,1,0,SchForSprav);
    if VarArrayDimCount(Res)>0
    then begin
               SchForSprav:=RES[0][0];
               EditSchForSprav.Text:=VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
    end;
end;

procedure TfrmSysOptions.ToolButton1Click(Sender: TObject);
var T:TfrmEditDef;
    InsertSP:TpFibStoredProc;
    ID_DEF : Integer;
begin
    T:=TfrmEditDef.Create(self);
    if T.ShowModal=mrYes
    then begin
              InsertSP:=TpFibStoredProc.Create(self);
              InsertSP.Database:=WorkDatabase;
              InsertSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSP.StoredProcName:='BU_OTCH_DEF_PERCENT_INSERT';
              InsertSP.Prepare;
              InsertSP.ParamByName('MIN_SUM').Value     :=T.cxCalcEdit1.Value;
              InsertSP.ParamByName('MAX_SUM').Value     :=T.cxCalcEdit2.Value;
              InsertSP.ParamByName('PERCENT').Value     :=T.cxCalcEdit3.Value;
              ID_DEF :=InsertSP.ParamByName('ID_DEF').Value;
              InsertSP.ExecProc;
              WriteTransaction.Commit;
              DefPerDataSet.CloseOpen(true);
              DefPerDataSet.Locate('ID_DEF',ID_DEF,[]);
    end;
    T.Free;
end;

procedure TfrmSysOptions.ToolButton3Click(Sender: TObject);
var T:TfrmEditDef;
    InsertSP:TpFibStoredProc;
    ID_DEF:Integer;
begin
    T:=TfrmEditDef.Create(self);
    T.cxCalcEdit1.Value:=DefPerDataSet.FieldByName('MIN_SUM').Value;
    T.cxCalcEdit2.Value:=DefPerDataSet.FieldByName('MAX_SUM').Value;
    T.cxCalcEdit3.Value:=DefPerDataSet.FieldByName('PERCENT').Value;
    if T.ShowModal=mrYes
    then begin
              InsertSP:=TpFibStoredProc.Create(self);
              InsertSP.Database:=WorkDatabase;
              InsertSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSP.StoredProcName:='BU_OTCH_DEF_PERCENT_UPDATE';
              InsertSP.Prepare;
              ID_DEF :=DefPerDataSet.FieldByName('ID_DEF').Value;
              InsertSP.ParamByName('ID_DEF').Value      :=DefPerDataSet.FieldByName('ID_DEF').Value;
              InsertSP.ParamByName('MIN_SUM').Value     :=T.cxCalcEdit1.Value;
              InsertSP.ParamByName('MAX_SUM').Value     :=T.cxCalcEdit2.Value;
              InsertSP.ParamByName('PERCENT').Value     :=T.cxCalcEdit3.Value;
              InsertSP.ExecProc;
              WriteTransaction.Commit;
              DefPerDataSet.CloseOpen(true);
              DefPerDataSet.Locate('ID_DEF',ID_DEF,[]);
    end;
    T.Free;
end;

procedure TfrmSysOptions.ToolButton2Click(Sender: TObject);
var DeleSP:TpFibStoredProc;
begin
     if DefPerDataSet.RecordCount>0
     then begin
              if agMessageDlg('Увага!','Ви хочете видалити запис?',mtWarning, [mbYes,mbNo])=mrYes
              then begin
                        DeleSP:=TpFibStoredProc.Create(self);
                        DeleSP.Database:=WorkDatabase;
                        DeleSP.Transaction:=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        DeleSP.StoredProcName:='BU_OTCH_DEF_PERCENT_DELETE';
                        DeleSP.Prepare;
                        DeleSP.ParamByName('ID_DEF').Value      :=DefPerDataSet.FieldByName('ID_DEF').Value;
                        DeleSP.ExecProc;
                        WriteTransaction.Commit;
                        DefPerDataSet.CacheDelete;
              end;
     end;
end;

end.


