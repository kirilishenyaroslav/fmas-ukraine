unit SmGrMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList,
  FIBDatabase, pFIBDatabase,Ibase, FIBDataSet, pFIBDataSet,
  pFibStoredProc, Halcn6db, ExtCtrls, dxBar, dxDockPanel, dxDockControl,
  frxClass, frxDBSet, Menus, ActnList, StdCtrls, cxContainer, cxMemo,
  cxDBEdit, Placemnt, frxExportPDF, frxExportRTF, frxExportXML,
  frxExportXLS, frxExportHTML, frxExportTXT, cxSplitter;

type
  TfrmSmetaGroup = class(TForm)
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    WriteTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    GroupDataSource: TDataSource;
    OpenDialog1: TOpenDialog;
    GroupDataSet: TpFIBDataSet;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    FondsDataSet: TpFIBDataSet;
    FondsDataSource: TDataSource;
    DockSite: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    DockPanelTree: TdxDockPanel;
    dxBarDockControl1: TdxBarDockControl;
    DockPanelGrid: TdxDockPanel;
    cxGrid1: TcxGrid;
    GrView: TcxGridDBTableView;
    GrViewDBColumn2: TcxGridDBColumn;
    GrViewDBColumn1: TcxGridDBColumn;
    GrViewDBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel3: TPanel;
    ToolButton4: TToolButton;
    FondDataset: TfrxDBDataset;
    PrintDataSet: TpFIBDataSet;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    cxStyle1: TcxStyle;
    PageControl1: TPageControl;
    FndSheet: TTabSheet;
    TabSheet2: TTabSheet;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ToolBar3: TToolBar;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    G_PKVDataSet: TpFIBDataSet;
    G_PKVDataSource: TDataSource;
    frxReport1: TfrxReport;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    PopupMenu3: TPopupMenu;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    PopupMenu4: TPopupMenu;
    N13: TMenuItem;
    N14: TMenuItem;
    ActionList1: TActionList;
    Action1: TAction;
    Panel1: TPanel;
    N15: TMenuItem;
    FormStorage1: TFormStorage;
    ToolButton10: TToolButton;
    cxGridDBTableView2DBColumn3: TcxGridDBColumn;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    cxDBMemo1: TcxDBMemo;
    cxDBMemo2: TcxDBMemo;
    cxGridDBTableView2DBColumn4: TcxGridDBColumn;
    BankSchSheet: TTabSheet;
    ToolBar4: TToolBar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    cxGrid4: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    cxGridDBColumn9: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    SchDataSet: TpFIBDataSet;
    SchDataSource: TDataSource;
    cxDBMemo3: TcxDBMemo;
    ToolButton12: TToolButton;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    TabSheet1: TTabSheet;
    ToolBar5: TToolBar;
    ToolButton13: TToolButton;
    ToolButton15: TToolButton;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Panel4: TPanel;
    ToolBar6: TToolBar;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    cxGrid5: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    cxGrid6: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBColumn11: TcxGridDBColumn;
    cxGridDBColumn12: TcxGridDBColumn;
    cxGridDBColumn13: TcxGridDBColumn;
    cxGridDBColumn14: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    AssPeriodsDataSet: TpFIBDataSet;
    AssPeriodsDataSource: TDataSource;
    ToolButton16: TToolButton;
    FormulaDataSet: TpFIBDataSet;
    FormulaDataSource: TDataSource;
    cxGridDBTableView3DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure GrViewDblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton17Click(Sender: TObject);
    procedure ToolButton18Click(Sender: TObject);
    procedure ToolButton19Click(Sender: TObject);
    procedure cxGridDBTableView4DblClick(Sender: TObject);
    procedure cxGridDBTableView5DblClick(Sender: TObject);
    procedure cxGridDBTableView4FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private
    { Private declarations }
    UseAccess:Boolean;
  public
    { Public declarations }
    UseMO:Boolean;
    ResultValue:Variant;
    MbookDate  :TDateTime;
    Id_user    :Int64;
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer;Id_user:Int64);overload;
  end;

function GetSmGrp(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer;Id_user:Int64):Variant;stdcall;
exports GetSmGrp;

implementation

uses SmGrEdit,USmGrFonds,
     Resources_unitb,BaseTypes,GlobalSpr, FIBQuery, USetDefBudget,
     UEditPKV, UEditRsch, DateUtils, UEditAss;


function GetSmGrp(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer;Id_user:Int64):Variant;
var T:TfrmSmetaGroup;
    f:Boolean;
    i:integer;
    Res:Variant;
begin
       if fs=fsNormal
       then begin
            T:=TfrmSmetaGroup.Create(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION,Id_user);
            T.ToolButton2.Enabled:=true;
            T.AddButton.Enabled:=false;
            T.UpdateButton.Enabled:=false;
            T.DelButton.Enabled:=false;
            T.ToolButton4.Enabled:=false;

            T.DockPanelGrid.Hide;
            if T.ShowModal=mrYes
            then Res:=T.ResultValue
            else Res:=NULL;
            T.Free;
       end
       else begin
            f :=true;
            for i:=0 to Application.MainForm.MDIChildCount-1 do
            begin
                 if (Application.MainForm.MDIChildren[i] is TfrmSmetaGroup)
                 then begin
                                   Application.MainForm.MDIChildren[i].BringToFront;
                                   f:=false;
                 end;
            end;
            Res:=NULL;
            if f then TfrmSmetaGroup.Create(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION,Id_user);
       end;
       Result:=Res;
end;

{$R *.dfm}
constructor TfrmSmetaGroup.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer;Id_user:Int64);
var UseAccessDS:TpFibDataSet;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_HANDLE;
     ReadTransaction.StartTransaction;
     self.FormStyle:=fs;
     self.Id_user:=Id_user;

     UseAccessDS:=TpFibDataSet.Create(self);
     UseAccessDS.Database:=WorkDatabase;
     UseAccessDS.Transaction:=ReadTransaction;
     UseAccessDS.SelectSQL.Text:='SELECT * FROM BU_INI';
     UseAccessDS.Open;
     UseAccessDS.FetchAll;
     if (UseAccessDS.RecordCount>0)
     then begin
               if UseAccessDS.FieldByName('USE_ACCESS_INFO').Value<>NULL
               then UseAccess:=Boolean(UseAccessDS.FieldByName('USE_ACCESS_INFO').AsInteger)
               else UseAccess:=false;


               if UseAccessDS.FieldByName('USE_GR_PLUS_FND_LINK').Value<>NULL
               then begin
                         if UseAccessDS.FieldByName('USE_GR_PLUS_FND_LINK').Value=0
                         then FndSheet.TabVisible:=False;
               end
               else begin
                         FndSheet.TabVisible:=False;
               end;

               if UseAccessDS.FieldByName('USE_GR_PLUS_SCH_LINK').Value<>NULL
               then begin
                         if UseAccessDS.FieldByName('USE_GR_PLUS_SCH_LINK').Value=0
                         then BankSchSheet.TabVisible:=False;
               end
               else begin
                         BankSchSheet.TabVisible:=False;
               end;
     end;
     UseAccessDS.Close;

     UseAccessDS.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     UseAccessDS.Open;
     UseAccessDS.FetchAll;
     if (UseAccessDS.RecordCount>0)
     then begin
               if UseAccessDS.FieldByName('USE_MO').Value<>NULL
               then UseMO:=Boolean(UseAccessDS.FieldByName('USE_MO').AsInteger)
               else UseMO:=false;
     end;
     UseAccessDS.Free;

     if not UseMO
     then begin
               cxGridDBTableView2DBColumn4.Visible:=false;
     end;

     if (Self.FormStyle=fsNormal)
     then begin
               if UseAccess
               then GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT_EX('+IntToStr(Self.Id_user)+') WHERE ENABLED=1'
               else GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT WHERE ENABLED=1';
     end
     else begin
               if UseAccess
               then GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT_EX('+IntToStr(Self.Id_user)+')'
               else GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT ';
     end;
     GroupDataSet.Open;
     GrView.DataController.FocusedRowIndex:=0;

     GrView.RestoreFromRegistry('Software\Budgeting\SprGrSmeta',false,false, [],'GrView');
     SchDataSet.SelectSQL.Text       :='SELECT * FROM BU_SM_GR_PLUS_SCH_SEL(?ID_GROUP)';
     AssPeriodsDataSet.SelectSQL.Text:='SELECT * FROM BU_GR_PERIODS_ASIGN_DEVOTED_SEL(?ID_GROUP)';
     FormulaDataSet.SelectSQL.Text   :='SELECT * FROM BU_GR_PERIODS_ASIGN_FORMLS_SEL(?ID_PERIOD)';
     
end;

procedure TfrmSmetaGroup.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmetaGroup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GrView.StoreToRegistry('Software\Budgeting\SprGrSmeta',true,[],'GrView');
  Action:=caFree;
end;

procedure TfrmSmetaGroup.AddButtonClick(Sender: TObject);
var T:TfrmGrSmEdit;
    InsertStoredProc:TpFibStoredProc;
    id:Integer;
begin
    T:=TfrmGrSmEdit.Create(self, WorkDatabase.Handle, Id_user);
    if T.ShowModal=mrYes
    then begin
         InsertStoredProc:=TpFibStoredProc.Create(self);
         InsertStoredProc.Database:=WorkDatabase;
         InsertStoredProc.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         InsertStoredProc.StoredProcName:='PUB_SMETA_GROUP_INSERT';
         InsertStoredProc.Prepare;
         InsertStoredProc.ParamByName('GROUP_TITLE').Value  :=T.edSmGrTitle.Text;
         InsertStoredProc.ParamByName('GROUP_KOD').Value    :=T.edSmGrKod.EditValue;
         InsertStoredProc.ParamByName('ENABLED').Value      :=Integer(T.edSmGrEnable.Checked);
         InsertStoredProc.ParamByName('ID_USER').AsInt64    :=Id_user;
         InsertStoredProc.ParamByName('DEFAULT_KEKV').Value :=T.id_kekv;
         InsertStoredProc.ExecProc;
         id:=InsertStoredProc.ParamByName('ID_GROUP').AsInteger;
         WriteTransaction.Commit;
         GroupDataSet.CloseOpen(true);
         GroupDataSet.Locate('ID_GROUP',id,[]);
         InsertStoredProc.Free;
    end;
    T.Free;
end;

procedure TfrmSmetaGroup.UpdateButtonClick(Sender: TObject);
var T:TfrmGrSmEdit;
    UpdateStoredProc:TpFibStoredProc;
    id:Int64;
begin
if GroupDataSet.RecordCount>0
then begin
    T:=TfrmGrSmEdit.Create(self, WorkDatabase.Handle, Id_user);
    T.edSmGrTitle.Text    :=GroupDataSet.FieldByName('GROUP_TITLE').AsString;
    T.edSmGrKod.Text      :=GroupDataSet.FieldByName('GROUP_KOD').AsString;
    T.edSmGrEnable.Checked:=GroupDataSet.FieldByName('ENABLED').AsBoolean;
    T.cxButtonEdit1.Text  :=GroupDataSet.FieldByName('KEKV_INFO').AsString;
    T.id_kekv             :=GroupDataSet.FieldByName('ID_KEKV').Value;

    if T.ShowModal=mrYes
    then begin
         UpdateStoredProc:=TpFibStoredProc.Create(self);
         UpdateStoredProc.Database:=WorkDatabase;
         UpdateStoredProc.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         UpdateStoredProc.StoredProcName:='PUB_SMETA_GROUP_UPDATE';
         UpdateStoredProc.Prepare;
         id:=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
         UpdateStoredProc.ParamByName('ID_GROUP').AsInt64 :=id;
         UpdateStoredProc.ParamByName('GROUP_TITLE').Value     :=T.edSmGrTitle.Text;
         UpdateStoredProc.ParamByName('GROUP_KOD').Value       :=T.edSmGrKod.EditValue;
         UpdateStoredProc.ParamByName('ENABLED').Value         :=Integer(T.edSmGrEnable.Checked);
         UpdateStoredProc.ParamByName('DEFAULT_KEKV').Value    :=T.id_kekv;
         UpdateStoredProc.ParamByName('ID_USER').AsInt64       :=Id_user;
         UpdateStoredProc.ExecProc;
         WriteTransaction.Commit;
         GroupDataSet.CloseOpen(true);
         GroupDataSet.Locate('ID_GROUP',id,[]);
         UpdateStoredProc.Free;
    end;
    T.Free;
end;
end;

procedure TfrmSmetaGroup.DelButtonClick(Sender: TObject);
var DeleteStoredProc:TpFibStoredProc;
    FocusedIndex:Integer;
begin
   if (GroupDataSet.RecordCount>0)
   then begin
        if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити групу бюджетів?',mtWarning,[mbYes,mbNo])=mrYes
        then begin
             DeleteStoredProc:=TpFibStoredProc.Create(self);
             DeleteStoredProc.Database:=WorkDatabase;
             DeleteStoredProc.Transaction:=WriteTransaction;
             WriteTransaction.StartTransaction;
             DeleteStoredProc.StoredProcName:='PUB_SMETA_GROUP_DELETE';
             DeleteStoredProc.Prepare;
             FocusedIndex:=GrView.DataController.FocusedRowIndex;
             DeleteStoredProc.ParamByName('ID_GROUP').AsInt64 :=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
             DeleteStoredProc.ParamByName('ID_USER').AsInt64  :=Id_user;
             DeleteStoredProc.ExecProc;
             WriteTransaction.Commit;
             GroupDataSet.CacheDelete;
             GrView.DataController.FocusedRowIndex:=FocusedIndex;
        end;
   end;
end;

procedure TfrmSmetaGroup.ToolButton2Click(Sender: TObject);
begin
    if (GroupDataSet.RecordCount>0)
    then begin
        ResultValue:=VarArrayOf([GroupDataSet.FieldByName('ID_GROUP').Value,
                                 GroupDataSet.FieldByName('GROUP_TITLE').Value,
                                 GroupDataSet.FieldByName('GROUP_KOD').Value]);
        ModalResult:=mrYes;
    end;
end;

procedure TfrmSmetaGroup.ToolButton3Click(Sender: TObject);
var  id:Int64;
     UseAccessDS:TpFibDataSet;
begin
     GrView.BeginUpdate;
     Screen.Cursor:=crHourGlass;
     id:=0;
     if GroupDataSet.RecordCount>0
     then id:=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
     GroupDataSet.Close;

     UseAccessDS:=TpFibDataSet.Create(self);
     UseAccessDS.Database:=WorkDatabase;
     UseAccessDS.Transaction:=ReadTransaction;
     UseAccessDS.SelectSQL.Text:='SELECT * FROM BU_INI';
     UseAccessDS.Open;
     UseAccessDS.FetchAll;
     if (UseAccessDS.RecordCount>0)
     then begin
               if UseAccessDS.FieldByName('USE_ACCESS_INFO').Value<>NULL
               then UseAccess:=Boolean(UseAccessDS.FieldByName('USE_ACCESS_INFO').AsInteger)
               else UseAccess:=false;
     end;
     UseAccessDS.Close;
     UseAccessDS.Free;


     if (Self.FormStyle=fsNormal)
     then begin
               if UseAccess
               then GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT_EX('+IntToStr(Self.Id_user)+') WHERE ENABLED=1'
               else GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT WHERE ENABLED=1';
     end
     else begin
               if UseAccess
               then GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT_EX('+IntToStr(Self.Id_user)+')'
               else GroupDataSet.SelectSQL.Text:='SELECT * FROM PUB_SMETA_GROUP_SELECT ';
     end;

     GroupDataSet.Open;
     GroupDataSet.Locate('ID_GROUP',id,[]);
     Screen.Cursor:=crDefault;
     GrView.EndUpdate;
end;

procedure TfrmSmetaGroup.ToolButton5Click(Sender: TObject);
var T:TfrmSmGrFonds;
    InsertStoredProc:TpFibStoredProc;
    id:Integer;
begin
    T:=TfrmSmGrFonds.Create(self);
    if T.ShowModal=mrYes
    then begin
         InsertStoredProc:=TpFibStoredProc.Create(self);
         InsertStoredProc.Database:=WorkDatabase;
         InsertStoredProc.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         InsertStoredProc.StoredProcName:='PUB_DT_SM_GR_FND_INSERT';
         InsertStoredProc.Prepare;
         InsertStoredProc.ParamByName('ID_SM_GROUP').Value:=GroupDataSet.FieldByName('ID_GROUP').AsInteger;
         InsertStoredProc.ParamByName('DATE_BEG').Value   :=T.date_beg;
         if T.CheckBox1.Checked
         then InsertStoredProc.ParamByName('DATE_END').Value   :=T.date_end
         else InsertStoredProc.ParamByName('DATE_END').Value   :=NULL;
         InsertStoredProc.ParamByName('ID_PRIH_SCH').Value:=T.id_prih_sch;
         InsertStoredProc.ParamByName('ID_RASH_SCH').Value:=T.id_rasx_sch;
         InsertStoredProc.ParamByName('ID_SCH_LL').Value:=T.id_sch_ll;
         InsertStoredProc.ParamByName('ID_SCH_LL_NV').Value:=T.id_sch_ll_nv;
         InsertStoredProc.ExecProc;

         if InsertStoredProc.ParamByName('EXIST_WARNING').Asinteger=1
         then begin
                   ShowMessage(InsertStoredProc.ParamByName('WARNING').AsString);
         end;
         id:=InsertStoredProc.ParamByName('ID_FND').Value;
         WriteTransaction.Commit;
         FondsDataSet.CloseOpen(true);
         FondsDataSet.Locate('ID_FND',id,[]);
         InsertStoredProc.Free;
    end;
    T.Free;
end;

procedure TfrmSmetaGroup.ToolButton7Click(Sender: TObject);
var T:TfrmSmGrFonds;
    UpdateStoredProc:TpFibStoredProc;
    //id:Integer;
begin
    if (FondsDataSet.RecordCount>0)
    then begin
              T:=TfrmSmGrFonds.Create(self);
              T.edit_flag:=true;
              T.in_date_beg:=FondsDataSet.FieldByName('DATE_BEG').Value;
              T.in_date_end:=FondsDataSet.FieldByName('DATE_END').Value;
              T.id_prih_sch:=FondsDataSet.FieldByName('ID_PRIH_SCH').Value;
              T.id_rasx_sch:=FondsDataSet.FieldByName('ID_RASH_SCH').Value;
              T.id_sch_ll  :=FondsDataSet.FieldByName('ID_SCH_LL').Value;
              T.id_sch_ll_NV:=FondsDataSet.FieldByName('ID_SCH_LL_NV').Value;

              T.cxButtonEdit1.Text:=FondsDataSet.FieldByName('ID_PRIH_SCH_TEXT').Value;
              T.cxButtonEdit2.Text:=FondsDataSet.FieldByName('ID_RASH_SCH_TEXT').Value;
              T.cxButtonEdit3.Text:=FondsDataSet.FieldByName('ID_SCH_LL_TEXT').AsString;
              T.cxButtonEdit4.Text:=FondsDataSet.FieldByName('ID_SCH_LL_NV_TEXT').AsString;

              T.CheckBox1.Checked:=true;
              T.CheckBox1Click(T.CheckBox1);

              if T.ShowModal=mrYes
              then begin
                         UpdateStoredProc:=TpFibStoredProc.Create(self);
                         UpdateStoredProc.Database:=WorkDatabase;
                         UpdateStoredProc.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         UpdateStoredProc.StoredProcName:='PUB_DT_SM_GR_FND_UPDATE';
                         UpdateStoredProc.Prepare;
                         //id:=FondsDataSet.FieldByName('ID_FND').Value;
                         UpdateStoredProc.ParamByName('ID_FND').Value          :=FondsDataSet.FieldByName('ID_FND').Value;
                         UpdateStoredProc.ParamByName('ID_SM_GROUP').Value     :=GroupDataSet.FieldByName('ID_GROUP').Value;
                         UpdateStoredProc.ParamByName('DATE_BEG').Value        :=T.date_beg;
                         if T.CheckBox1.Checked
                         then UpdateStoredProc.ParamByName('DATE_END').Value   :=T.date_end
                         else UpdateStoredProc.ParamByName('DATE_END').Value   :=NULL;
                         UpdateStoredProc.ParamByName('ID_PRIH_SCH').Value     :=T.id_prih_sch;
                         UpdateStoredProc.ParamByName('ID_RASH_SCH').Value     :=T.id_rasx_sch;
                         UpdateStoredProc.ParamByName('ID_SCH_LL').Value       :=T.id_sch_ll;
                         UpdateStoredProc.ParamByName('ID_SCH_LL_NV').Value    :=T.id_sch_ll_nv;

                         UpdateStoredProc.ExecProc;

                         if UpdateStoredProc.ParamByName('EXIST_WARNING').Asinteger=1
                         then begin
                                   ShowMessage(UpdateStoredProc.ParamByName('WARNING').AsString);
                         end;

                         WriteTransaction.Commit;
                         FondsDataSet.CloseOpen(true);
                         //FondsDataSet.Locate('ID_FND',id,[]);
                         UpdateStoredProc.Free;
              end;
              T.Free;
    end;
end;

procedure TfrmSmetaGroup.FormResize(Sender: TObject);
begin
     Panel3.Width:=self.Width div 3;
end;

procedure TfrmSmetaGroup.ToolButton6Click(Sender: TObject);
var DeleteStoredProc:TpFibStoredProc;
begin
   if (FondsDataSet.RecordCount>0)
   then begin
        if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити період?',mtWarning,[mbYes,mbNo])=mrYes
        then begin
             DeleteStoredProc:=TpFibStoredProc.Create(self);
             DeleteStoredProc.Database:=WorkDatabase;
             DeleteStoredProc.Transaction:=WriteTransaction;
             WriteTransaction.StartTransaction;
             DeleteStoredProc.StoredProcName:='PUB_DT_SM_GR_FND_DELETE';
             DeleteStoredProc.Prepare;
             DeleteStoredProc.ParamByName('ID_FND').Value   :=FondsDataSet.FieldByName('ID_FND').Value;
             DeleteStoredProc.ExecProc;
             WriteTransaction.Commit;
             FondsDataSet.CloseOpen(true);
        end;
   end;end;

procedure TfrmSmetaGroup.N2Click(Sender: TObject);
begin
  if PrintDataset.Active then PrintDataset.Close;
  PrintDataset.SelectSQL.Text:='select * from PUB_DT_SM_GR_FND_SELECT_EX ORDER BY SM_GR_KOD';
  PrintDataset.Open;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmGroupReestrWithFonds.fr3',true);
  frxReport1.PrepareReport(true);
  frxReport1.ShowPreparedReport;
end;

procedure TfrmSmetaGroup.N1Click(Sender: TObject);
begin
  if PrintDataset.Active then PrintDataset.Close;
  PrintDataset.SelectSQL.Text:='select * from PUB_SMETA_GROUP_SELECT ORDER BY GROUP_KOD';
  PrintDataset.Open;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmGroupReestr.fr3',true);
  frxReport1.PrepareReport(true);
  frxReport1.ShowPreparedReport;
end;

procedure TfrmSmetaGroup.ToolButton8Click(Sender: TObject);
var  Res:Variant;
     InsertStoredProc:TpFibStoredProc;
     T:TfrmEditPKV;
begin
Res:=NULL;
if GroupDataSet.RecordCount>0
then begin
     T:=TfrmEditPKV.Create(self,date,date,-1,-1,false,null);
     if T.ShowModal=mrYes
     then begin
                try
                InsertStoredProc:=TpFibStoredProc.Create(self);
                InsertStoredProc.Database:=WorkDatabase;
                InsertStoredProc.Transaction:=WriteTransaction;
                WriteTransaction.StartTransaction;
                InsertStoredProc.StoredProcName:='BU_SM_GR_PKV_INSERT';
                InsertStoredProc.Prepare;
                InsertStoredProc.ParamByName('ID_SM_GROUP').AsInt64:=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
                InsertStoredProc.ParamByName('ID_PKV').AsInt64     :=T.id_sm_pkv;
                InsertStoredProc.ParamByName('DATE_BEG').Value     :=T.date_beg;
                InsertStoredProc.ParamByName('DATE_END').Value     :=T.date_end ;
                InsertStoredProc.ParamByName('ID_TYPE_FINANCE').Value     :=T.id_type_finance ;

                if UseMO
                then InsertStoredProc.ParamByName('MO_CHAR').Value    :=T.cxTextEdit1.Text
                else InsertStoredProc.ParamByName('MO_CHAR').Value    :=NULL;

                InsertStoredProc.ExecProc;
                WriteTransaction.Commit;
                InsertStoredProc.Free;

                except on E:Exception do
                   begin
                        ShowMessage(E.Message);
                   end
                end;


                G_PKVDataSet.CloseOpen(true);
     end;
end;
end;

procedure TfrmSmetaGroup.ToolButton9Click(Sender: TObject);
var
     InsertStoredProc:TpFibStoredProc;
begin
        if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити запис?',mtWarning,[mbYes,mbNo])=mrYes
        then begin
                  if ((G_PKVDataSet.RecordCount>0) and (GroupDataSet.RecordCount>0))
                  then begin
                                  InsertStoredProc:=TpFibStoredProc.Create(self);
                                  InsertStoredProc.Database:=WorkDatabase;
                                  InsertStoredProc.Transaction:=WriteTransaction;
                                  WriteTransaction.StartTransaction;
                                  InsertStoredProc.StoredProcName:='BU_SM_GR_PKV_DELETE';
                                  InsertStoredProc.Prepare;
                                  InsertStoredProc.ParamByName('ID_SM_GROUP').Value:=GroupDataSet.FieldByName('ID_GROUP').Value;
                                  InsertStoredProc.ParamByName('ID_PKV').Value     :=G_PKVDataSet.FieldByName('ID_PKV').Value;
                                  InsertStoredProc.ParamByName('DATE_BEG').Value   :=G_PKVDataSet.FieldByName('DATE_BEG').Value;
                                  InsertStoredProc.ParamByName('DATE_END').Value   :=G_PKVDataSet.FieldByName('DATE_END').Value;
                                  InsertStoredProc.ExecProc;
                                  WriteTransaction.Commit;
                                  InsertStoredProc.Free;
                                  G_PKVDataSet.CloseOpen(true);
                  end;
        end;
end;

procedure TfrmSmetaGroup.GrViewDblClick(Sender: TObject);
begin
      ToolButton2Click(self);
end;

procedure TfrmSmetaGroup.N3Click(Sender: TObject);
begin
     AddButton.OnClick(self);
end;

procedure TfrmSmetaGroup.N4Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmSmetaGroup.N5Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmSmetaGroup.N7Click(Sender: TObject);
begin
     ToolButton3.OnClick(self);
end;

procedure TfrmSmetaGroup.N9Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmetaGroup.N10Click(Sender: TObject);
begin
     ToolButton5.OnClick(self);
end;

procedure TfrmSmetaGroup.N11Click(Sender: TObject);
begin
     ToolButton6.OnClick(self);
end;

procedure TfrmSmetaGroup.N12Click(Sender: TObject);
begin
     ToolButton7.OnClick(self);
end;

procedure TfrmSmetaGroup.N13Click(Sender: TObject);
begin
     ToolButton8.OnClick(self);
end;

procedure TfrmSmetaGroup.N14Click(Sender: TObject);
begin
     ToolButton9.OnClick(self);
end;

procedure TfrmSmetaGroup.Action1Execute(Sender: TObject);
begin
    ToolButton2.onClick(self);
end;

procedure TfrmSmetaGroup.N15Click(Sender: TObject);
var T: TfrmGetDefBudget;
    UpSmSP:TpFibStoredProc;
begin
    if (GroupDataSet.RecordCount>0)
    then begin
              T:=TfrmGetDefBudget.Create(self);

              if GroupDataSet.FieldByName('DEF_ID_SM').Value<>NULL
              then T.DEF_ID_SM:=StrToInt64(GroupDataSet.FieldByName('DEF_ID_SM').AsString);

              if GroupDataSet.FieldByName('DEF_SM_TEXT').Value<>NULL
              then T.cxButtonEdit1.Text:=GroupDataSet.FieldByName('DEF_SM_TEXT').AsString;

              if T.ShowModal=mrYes
              then begin
                        UpSmSP:=TpFibStoredProc.Create(self);
                        UpSmSP.Database:=WorkDatabase;
                        UpSmSP.Transaction:=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        UpSmSP.StoredProcName:='BU_SM_GR_DEF_SM_UPDATE';
                        UpSmSP.ParamByName('ID_GROUP').AsInt64:=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
                        UpSmSP.ParamByName('ID_SM').AsInt64   :=T.DEF_ID_SM;
                        UpSmSP.ExecProc;
                        UpSmSP.Close;
                        WriteTransaction.Commit;
                        UpSmSP.Free;
                        ToolButton3Click(self);
              end;
              T.Free;
    end;
end;

procedure TfrmSmetaGroup.ToolButton10Click(Sender: TObject);
var  Res:Variant;
     InsertStoredProc:TpFibStoredProc;
     T:TfrmEditPKV;
begin
Res:=NULL;
if G_PKVDataSet.RecordCount>0
then begin
     T:=TfrmEditPKV.Create(self,
                           G_PKVDataSet.FieldByName('DATE_BEG').AsDateTime,
                           G_PKVDataSet.FieldByName('DATE_END').AsDateTime,
                           StrToInt64(G_PKVDataSet.FieldByName('ID_PKV').AsString),
                           G_PKVDataSet.FieldByName('ID_TYPE_FINANCE').Value,
                           true,
                           G_PKVDataSet.FieldByName('MO_CHAR').Value);
     if T.ShowModal=mrYes
     then begin
                try

                        InsertStoredProc:=TpFibStoredProc.Create(self);
                        InsertStoredProc.Database:=WorkDatabase;
                        InsertStoredProc.Transaction:=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        InsertStoredProc.StoredProcName:='BU_SM_GR_PKV_UPDATE';
                        InsertStoredProc.Prepare;
                        InsertStoredProc.ParamByName('ID_SM_GROUP').AsInt64:=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
                        InsertStoredProc.ParamByName('ID_PKV').AsInt64        :=T.id_sm_pkv;
                        InsertStoredProc.ParamByName('DATE_BEG').Value        :=T.date_beg;
                        InsertStoredProc.ParamByName('DATE_END').Value        :=T.date_end ;
                        InsertStoredProc.ParamByName('ID_TYPE_FINANCE').Value :=T.id_type_finance;

                        if UseMO
                        then InsertStoredProc.ParamByName('MO_CHAR').Value    :=T.cxTextEdit1.Text
                        else InsertStoredProc.ParamByName('MO_CHAR').Value    :=NULL;

                        InsertStoredProc.ExecProc;
                        WriteTransaction.Commit;
                        InsertStoredProc.Free;
                except on E:Exception do
                       begin
                            ShowMessage(e.Message);
                       end;
                end;
                G_PKVDataSet.CloseOpen(true);
     end;
end;
end;

procedure TfrmSmetaGroup.ToolButton1Click(Sender: TObject);
var
    T:TfrmGetSchInfo;
    InsertSP:TpFibStoredProc;
begin
     T:=TfrmGetSchInfo.Create(self);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='BU_SM_GR_PLUS_ACC_INS';
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_SM_GROUP').Value    :=GroupDataSet.FieldByName('ID_GROUP').Value;
               InsertSP.ParamByName('ID_ACCOUNT').asInt64   :=T.id_sch;
               InsertSP.ParamByName('DATE_BEG').Value       :=T.DateBeg.Date;
               InsertSP.ParamByName('ADDING_DATE').Value    :=T.DateBeg.Date;
               InsertSP.ParamByName('ISDEFAULT').Value      :=Integer(T.isDefault.Checked);
               InsertSP.ExecProc;
               InsertSP.Close;
               InsertSP.Free;
               WriteTransaction.Commit;
               SchDataSet.CloseOpen(true);
     end;
     T.Free;
end;

procedure TfrmSmetaGroup.ToolButton11Click(Sender: TObject);
var DropSP:TpFibStoredProc;
begin
     if SchDataSet.RecordCount>0
     then begin
               if (agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation,[mbYes,mbNo])=mrYes)
               then begin
                         DropSP:=TpFibStoredProc.Create(self);
                         DropSP.Database:=WorkDatabase;
                         DropSP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         DropSP.StoredProcName:='BU_SM_GR_PLUS_ACC_DEL';
                         DropSP.Prepare;
                         DropSP.ParamByName('ID_REC').Value:=SchDataSet.FieldByName('ID_REC').Value;
                         DropSP.ExecProc;
                         DropSP.Close;
                         DropSP.Free;
                         WriteTransaction.Commit;
                         SchDataSet.CloseOpen(true);
               end;
     end;
end;

procedure TfrmSmetaGroup.ToolButton12Click(Sender: TObject);
var
    T:TfrmGetSchInfo;
    InsertSP:TpFibStoredProc;
    id:Variant;
begin
     T:=TfrmGetSchInfo.Create(self);

     T.mfotext.Text        :=SchDataSet.FieldByName('sch_mfo').Value;
     T.mfoname.Text        :=SchDataSet.FieldByName('name_mfo').Value;
     T.rateaccounttext.Text:=SchDataSet.FieldByName('sch_number').Value;
     T.DateBeg.Date        :=SchDataSet.FieldByName('date_beg').Value;
     T.DateEnd.Visible     :=true;
     T.Label4.Visible      :=true;
     T.DateEnd.Date        :=SchDataSet.FieldByName('date_end').Value;
     T.id_sch              :=SchDataSet.FieldByName('id_acc').Value;
     t.isDefault.Checked   :=SchDataSet.FieldByName('isdefault').AsBoolean;


     if T.ShowModal=mrYes
     then begin
               try

               id:=SchDataSet.FieldByName('id_rec').Value;
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='BU_SM_GR_PLUS_ACC_UPD';
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_SM_GROUP').Value    :=GroupDataSet.FieldByName('ID_GROUP').Value;
               InsertSP.ParamByName('ID_ACCOUNT').asInt64   :=T.id_sch;
               InsertSP.ParamByName('DATE_BEG').Value       :=T.DateBeg.Date;
               InsertSP.ParamByName('DATE_END').Value       :=T.DateEnd.Date;
               InsertSP.ParamByName('ID_REC').Value         :=id;
               InsertSP.ParamByName('ADDING_DATE').Value    :=T.DateBeg.Date;
               InsertSP.ParamByName('ISDEFAULT').Value      :=Integer(T.isDefault.Checked);
               InsertSP.ExecProc;
               InsertSP.Close;
               InsertSP.Free;
               WriteTransaction.Commit;

               except on E:Exception do
                       begin
                            ShowMessage(e.Message);
                       end;
               end;


               SchDataSet.CloseOpen(true);
               SchDataSet.Locate('id_rec',id,[]);
     end;
     T.Free;
end;

procedure TfrmSmetaGroup.Panel3Resize(Sender: TObject);
begin
      PageControl1.Width:=Panel3.Width;
end;

procedure TfrmSmetaGroup.ToolButton13Click(Sender: TObject);
var T:TfrmEditPKV;
    InsertSp:TpFibStoredProc;
    id:Integer;
begin
     if (GroupDataSet.RecordCount>0)
     then begin
               T:=TfrmEditPKV.Create(self,date,EndOfTheYear(date),-1,-1,true,null,false);

               T.Label6.Caption:=GroupDataSet.FieldByName('GROUP_KOD').AsString+' '+
                                 GroupDataSet.FieldByName('GROUP_TITLE').AsString;

               T.Caption:='Робота з періодами розподілу асигнувань';
               T.Update;
               T.Label3.Visible       :=false;
               T.Label4.Visible       :=false;
               T.Label5.Visible       :=false;
               T.cxButtonEdit1.Visible:=false;
               T.cxButtonEdit2.Visible:=false;
               T.cxTextEdit1.Visible  :=false;

               if T.ShowModal=mrYes
               then begin
                         try
                                 InsertSp:=TpFibStoredProc.Create(self);
                                 InsertSp.Database   :=WorkDatabase;
                                 InsertSp.Transaction:=WriteTransaction;
                                 WriteTransaction.StartTransaction;
                                 InsertSp.StoredProcName:='BU_GR_PERIODS_ASIGN_DEVOTED_INS';
                                 InsertSp.Prepare;
                                 InsertSp.ParamByName('DATE_BEG').Value     :=T.date_beg;
                                 InsertSp.ParamByName('DATE_END').Value     :=T.date_end;
                                 InsertSp.ParamByName('ID_SM_GROUP').AsInt64:=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
                                 InsertSp.ExecProc;
                                 id:=InsertSp.ParamByName('ID_PERIOD').Value;
                                 WriteTransaction.Commit;
                                 InsertSp.Close;
                                 InsertSp.Free;
                         except on E:Exception do
                                 begin
                                      ShowMessage(e.Message);
                                 end;
                         end;

                         AssPeriodsDataSet.CloseOpen(true);
                         AssPeriodsDataSet.Locate('ID_PERIOD',id,[]);
               end;
               T.Free;
     end;
end;

procedure TfrmSmetaGroup.ToolButton15Click(Sender: TObject);
var
     InsertStoredProc:TpFibStoredProc;
begin
        if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити запис?',mtWarning,[mbYes,mbNo])=mrYes
        then begin
                  if ((AssPeriodsDataSet.RecordCount>0) and (GroupDataSet.RecordCount>0))
                  then begin
                            InsertStoredProc:=TpFibStoredProc.Create(self);
                            InsertStoredProc.Database:=WorkDatabase;
                            InsertStoredProc.Transaction:=WriteTransaction;
                            WriteTransaction.StartTransaction;
                            InsertStoredProc.StoredProcName:='BU_GR_PERIODS_ASIGN_DEVOTED_DEL';
                            InsertStoredProc.Prepare;
                            InsertStoredProc.ParamByName('ID_PERIOD').Value:=AssPeriodsDataSet.FieldByName('ID_PERIOD').Value;
                            InsertStoredProc.ExecProc;
                            WriteTransaction.Commit;
                            InsertStoredProc.Free;
                            AssPeriodsDataSet.CacheDelete;
                  end;
        end;
end;

procedure TfrmSmetaGroup.ToolButton16Click(Sender: TObject);
var T:TfrmEditPKV;
    InsertSp:TpFibStoredProc;
    id:Integer;
begin
     if AssPeriodsDataSet.RecordCount>0
     then begin
               T:=TfrmEditPKV.Create(self,
                                     AssPeriodsDataSet.FieldByName('DATE_BEG').Value,
                                     AssPeriodsDataSet.FieldByName('DATE_END').Value,
                                     -1,-1,true,null,false);
               T.Label6.Caption:=GroupDataSet.FieldByName('GROUP_KOD').AsString+ ' '+
                                 GroupDataSet.FieldByName('GROUP_TITLE').AsString;

               T.Caption:='Робота з періодами розподілу асигнувань';
               T.Update;
               T.Label3.Visible       :=false;
               T.Label4.Visible       :=false;
               T.Label5.Visible       :=false;
               T.cxButtonEdit1.Visible:=false;
               T.cxButtonEdit2.Visible:=false;
               T.cxTextEdit1.Visible  :=false;

               if T.ShowModal=mrYes
               then begin
                         try
                                 InsertSp:=TpFibStoredProc.Create(self);
                                 InsertSp.Database   :=WorkDatabase;
                                 InsertSp.Transaction:=WriteTransaction;
                                 WriteTransaction.StartTransaction;
                                 id:=AssPeriodsDataSet.FieldByName('ID_PERIOD').Value;
                                 InsertSp.StoredProcName:='BU_GR_PERIODS_ASIGN_DEVOTED_UPD';
                                 InsertSp.Prepare;
                                 InsertSp.ParamByName('DATE_BEG').Value     :=T.date_beg;
                                 InsertSp.ParamByName('DATE_END').Value     :=T.date_end;
                                 InsertSp.ParamByName('ID_SM_GROUP').AsInt64:=StrToInt64(GroupDataSet.FieldByName('ID_GROUP').AsString);
                                 InsertSp.ParamByName('ID_PERIOD').Value    :=AssPeriodsDataSet.FieldByName('ID_PERIOD').Value;
                                 InsertSp.ExecProc;

                                 WriteTransaction.Commit;
                                 InsertSp.Close;
                                 InsertSp.Free;

                         except on E:Exception do
                                 begin
                                      ShowMessage(e.Message);
                                 end;
                         end;

                         AssPeriodsDataSet.CloseOpen(true);
                         AssPeriodsDataSet.Locate('ID_PERIOD',id,[]);
               end;
               T.Free;
     end;
end;

procedure TfrmSmetaGroup.ToolButton17Click(Sender: TObject);
var T:TfrmFormulaEdit;
begin
     if AssPeriodsDataSet.RecordCount>0
     then begin
               T:=TfrmFormulaEdit.Create(self, WorkDatabase.Handle, Id_user, false,
               AssPeriodsDataSet.FieldByName('ID_PERIOD').Value);

               T.Label4.Caption:=GroupDataSet.FieldByName('GROUP_KOD').AsString+'  '+
                                 GroupDataSet.FieldByName('GROUP_TITLE').AsString;

               if T.ShowModal=mrYes
               then begin
                         FormulaDataSet.CloseOpen(true);
                         cxGridDBTableView5.ViewData.Expand(true);
               end;

               T.Free;


     end;

end;

procedure TfrmSmetaGroup.ToolButton18Click(Sender: TObject);
var
     InsertStoredProc:TpFibStoredProc;
begin
        if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити запис?',mtWarning,[mbYes,mbNo])=mrYes
        then begin
                  if (FormulaDataSet.RecordCount>0)
                  then begin
                            InsertStoredProc:=TpFibStoredProc.Create(self);
                            InsertStoredProc.Database:=WorkDatabase;
                            InsertStoredProc.Transaction:=WriteTransaction;
                            WriteTransaction.StartTransaction;
                            InsertStoredProc.StoredProcName:='BU_GR_PERIODS_ASIGN_FORMLS_DEL';
                            InsertStoredProc.Prepare;
                            InsertStoredProc.ParamByName('ID_FORMULA').Value:=FormulaDataSet.FieldByName('ID_FORMULA').Value;
                            InsertStoredProc.ExecProc;
                            WriteTransaction.Commit;
                            InsertStoredProc.Free;
                            FormulaDataSet.CacheDelete;
                  end;
        end;
end;

procedure TfrmSmetaGroup.ToolButton19Click(Sender: TObject);
var T:TfrmFormulaEdit;
    id:Integer;
begin
     if AssPeriodsDataSet.RecordCount>0
     then begin
               if FormulaDataSet.RecordCount>0
               then begin
                         T:=TfrmFormulaEdit.Create(self, WorkDatabase.Handle, Id_user, true,
                         AssPeriodsDataSet.FieldByName('ID_PERIOD').Value,
                         FormulaDataSet.FieldByName('ID_RAZD_SOURCE').Value);

                         T.Label4.Caption:=GroupDataSet.FieldByName('GROUP_KOD').AsString+' '+
                                 GroupDataSet.FieldByName('GROUP_TITLE').AsString;
                         T.ID_FORMULA:=FormulaDataSet.FieldByName('ID_FORMULA').Value;
                         id:=T.ID_FORMULA;
                         T.ID_RAZD_SOURCE:=FormulaDataSet.FieldByName('ID_RAZD_SOURCE').Value;
                         T.SOURCE_RAZD_ST_NUM:=FormulaDataSet.FieldByName('SOURCE_RAZD_ST_NUM').Value;
                         T.SOURCE_RAZD_ST_TITLE:=FormulaDataSet.FieldByName('SOURCE_RAZD_ST_TITLE').Value;
                         T.cxButtonEdit1.Text:=FormulaDataSet.FieldByName('SOURCE_RAZD_ST_NUM').Value+' "'+FormulaDataSet.FieldByName('SOURCE_RAZD_ST_TITLE').Value+'"';

                         if FormulaDataSet.FieldByName('TYPE_SOURCE_OBJ').Value=1
                         then T.cxRadioButton1.Checked:=true
                         else T.cxRadioButton2.Checked:=true;

                         if T.ShowModal=mrYes
                         then begin
                                   FormulaDataSet.CloseOpen(true);
                                   FormulaDataSet.Locate('ID_FORMULA',id,[]);
                                   cxGridDBTableView5.ViewData.Expand(true);
                         end;

                         T.Free;

               end;
     end;


end;

procedure TfrmSmetaGroup.cxGridDBTableView4DblClick(Sender: TObject);
begin
     if AssPeriodsDataSet.RecordCount>0
     then begin
               ToolButton16Click(self);
     end;
end;

procedure TfrmSmetaGroup.cxGridDBTableView5DblClick(Sender: TObject);
begin
     If FormulaDataSet.RecordCount>0
     then begin
               ToolButton19Click(self);
     end;
end;

procedure TfrmSmetaGroup.cxGridDBTableView4FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
     cxGridDBTableView5.ViewData.Expand(true);
end;

end.
