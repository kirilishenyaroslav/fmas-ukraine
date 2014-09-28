unit SysMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  Ibase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxRadioGroup, cxDBEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  ToolWin, ImgList,pfibStoredProc, cxCheckBox, cxGridBandedTableView,
  cxGridDBBandedTableView, Placemnt, cxDropDownEdit, cxCalendar;

type
  TfrmSysOptions = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton2: TcxButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    WorkDatabase: TpFIBDatabase;
    DefOptionDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DefOptionDataSource: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    SysUchDataSet: TpFIBDataSet;
    SysUchDataSource: TDataSource;
    SmallImages: TImageList;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    SysInfoDataSet: TpFIBDataSet;
    SysInfoDataSource: TDataSource;
    Label5: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label6: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label7: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    Label8: TLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cxDBTextEdit7: TcxDBTextEdit;
    TabSheet4: TTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    ToolBar2: TToolBar;
    RegUchDataSet: TpFIBDataSet;
    RegUchDataSource: TDataSource;
    ToolBar3: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxStyle2: TcxStyle;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    TabSheet5: TTabSheet;
    cxGrid3: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    ToolBar1: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    DocsTypeDataSet: TpFIBDataSet;
    DocsTypeDataSource: TDataSource;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    TabSheet6: TTabSheet;
    PageControl2: TPageControl;
    TabSheet7: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    CheckConfDefaultBu: TRadioGroup;
    cxDBButtonEdit1: TcxDBButtonEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    TabSheet8: TTabSheet;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    cxDBButtonEdit4: TcxDBButtonEdit;
    CheckConfDefaultKV: TRadioGroup;
    TabSheet9: TTabSheet;
    CheckKekv: TcxCheckBox;
    CHECK_FOND_PLUS_GROUP: TcxCheckBox;
    CheckKernelBlock: TcxCheckBox;
    CHECK_SPIS_BY_SM_RZ_ST: TcxCheckBox;
    ToolBar4: TToolBar;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    cxGrid4: TcxGrid;
    cxGrid2DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid2DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGridLevel3: TcxGridLevel;
    cxGrid2DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn10: TcxGridDBBandedColumn;
    cxGrid2DBBandedTableView1DBBandedColumn11: TcxGridDBBandedColumn;
    TemplateDataSet: TpFIBDataSet;
    TemplateDataSource: TDataSource;
    Panel3: TPanel;
    cxDBCheckBox2: TcxDBCheckBox;
    MAIN_BUHG_FIO: TcxTextEdit;
    Label12: TLabel;
    Label13: TLabel;
    RECTOR_FIO: TcxTextEdit;
    cxButton1: TcxButton;
    FormStorage1: TFormStorage;
    TabSheet10: TTabSheet;
    cxButtonEdit1: TcxButtonEdit;
    Label18: TLabel;
    LinksDataSet: TpFIBDataSet;
    LinksDataSource: TDataSource;
    PageControl3: TPageControl;
    TabSheet11: TTabSheet;
    Label16: TLabel;
    EdOnlyInCredit: TcxTextEdit;
    Label17: TLabel;
    EdOnlyInDb: TcxTextEdit;
    Label14: TLabel;
    EDMainSchNDS: TcxTextEdit;
    Label15: TLabel;
    EDStNeedNDS: TcxTextEdit;
    Label19: TLabel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxGrid5: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    TabSheet12: TTabSheet;
    Label20: TLabel;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    cxGrid6: TcxGrid;
    cxGridDBTableView4: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGridDBTableView4DBColumn1: TcxGridDBColumn;
    SchFilterDataSet: TpFIBDataSet;
    SchFilterDataSource: TDataSource;
    DateForSprav: TcxDateEdit;
    Label21: TLabel;
    KERNELL_CHECK_SM_PLUS_KEKV: TcxCheckBox;
    KERNELL_USE_HISTORY: TcxCheckBox;
    CHECK_CLOSING_IN_BUDGETS: TcxCheckBox;
    TabSheet13: TTabSheet;
    FINANCE_NUM_PROP: TcxTextEdit;
    Label22: TLabel;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    Label23: TLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    Label24: TLabel;
    CLOSE_FINANCE_RESULTS_DOX: TcxTextEdit;
    Label25: TLabel;
    CLOSE_FINANCE_RESULTS_RASX: TcxTextEdit;
    Label26: TLabel;
    CLOSE_FINANCE_RESULTS: TcxTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton1Click(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBButtonEdit4PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure CheckKernelBlockPropertiesChange(Sender: TObject);
    procedure CheckConfDefaultBuClick(Sender: TObject);
    procedure CheckConfDefaultKVClick(Sender: TObject);
    procedure CheckKekvPropertiesChange(Sender: TObject);
    procedure CHECK_FOND_PLUS_GROUPPropertiesChange(Sender: TObject);
    procedure CHECK_SPIS_BY_SM_RZ_STPropertiesChange(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton11Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
  private
  public
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);reintroduce;
    procedure SetBuConfigure;
    procedure SetKVConfigure;
  end;

  procedure GetSysOptions(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);stdcall;
  exports GetSysOptions;

implementation

uses GlobalSPR,    UEditRegUch,    BaseTypes,
     UEditFormUch, UEditTypeDoc,   UEditTemplate;

{$R *.dfm}
{ TfrmSysOptions }
procedure GetSysOptions(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
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
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_HANDLE;
     
     DefOptionDataSet.Open;

     if (DefOptionDataSet.FieldByName('USE_DEFAULT_VALUES').AsBoolean)
     then begin
               CheckConfDefaultBu.ItemIndex:=0;
               SetBuConfigure;
     end;

     if (DefOptionDataSet.FieldByName('USE_DEFAULT_KEKV').AsBoolean)
     then begin
               CheckConfDefaultKV.ItemIndex:=0;
               SetKVConfigure;
     end;

     if (DefOptionDataSet.FieldByName('KERNELL_IS_BLOCK').AsBoolean)
     then CheckKernelBlock.Checked:=true
     else CheckKernelBlock.Checked:=false;

     if (DefOptionDataSet.FieldByName('KERNELL_CHECK_KEKV').AsBoolean)
     then CheckKekv.Checked:=true
     else CheckKekv.Checked:=false;

     if (DefOptionDataSet.FieldByName('CHECK_FOND_PLUS_GROUP').AsBoolean)
     then CHECK_FOND_PLUS_GROUP.Checked:=true
     else CHECK_FOND_PLUS_GROUP.Checked:=false;

     if (DefOptionDataSet.FieldByName('CHECK_SPIS_BY_SM_RZ_ST').AsBoolean)
     then CHECK_SPIS_BY_SM_RZ_ST.Checked:=true
     else CHECK_SPIS_BY_SM_RZ_ST.Checked:=false;

     if (DefOptionDataSet.FieldByName('MAIN_BUHG_FIO').Value<>null)
     then MAIN_BUHG_FIO.Text:=DefOptionDataSet.FieldByName('MAIN_BUHG_FIO').AsString
     else MAIN_BUHG_FIO.Text:='';

     if (DefOptionDataSet.FieldByName('RECTOR_FIO').Value<>null)
     then RECTOR_FIO.Text:=DefOptionDataSet.FieldByName('RECTOR_FIO').AsString
     else RECTOR_FIO.Text:='';

     if (DefOptionDataSet.FieldByName('NDS_NUM_PROP').Value<>null)
     then EDMainSchNDS.Text:=DefOptionDataSet.FieldByName('NDS_NUM_PROP').AsString
     else EDMainSchNDS.Text:='0';

     if (DefOptionDataSet.FieldByName('ST_NDS_NUM_PROP').Value<>null)
     then EDStNeedNDS.Text:=DefOptionDataSet.FieldByName('ST_NDS_NUM_PROP').AsString
     else EDStNeedNDS.Text:='0';

     if (DefOptionDataSet.FieldByName('SALDO_ONLY_IN_KR').Value<>null)
     then EdOnlyInCredit.Text:=DefOptionDataSet.FieldByName('SALDO_ONLY_IN_KR').AsString
     else EdOnlyInCredit.Text:='0';

     if (DefOptionDataSet.FieldByName('SALDO_ONLY_IN_DB').Value<>null)
     then EdOnlyInDb.Text:=DefOptionDataSet.FieldByName('SALDO_ONLY_IN_DB').AsString
     else EdOnlyInDb.Text:='0';

     if (DefOptionDataSet.FieldByName('KERNELL_CHECK_SM_PLUS_KEKV').Value<>null)
     then KERNELL_CHECK_SM_PLUS_KEKV.Checked:=Boolean(DefOptionDataSet.FieldByName('KERNELL_CHECK_SM_PLUS_KEKV').AsInteger)
     else KERNELL_CHECK_SM_PLUS_KEKV.Checked:=false;

     if (DefOptionDataSet.FieldByName('KERNELL_USE_HISTORY').Value<>null)
     then KERNELL_USE_HISTORY.Checked:=Boolean(DefOptionDataSet.FieldByName('KERNELL_USE_HISTORY').AsInteger)
     else KERNELL_USE_HISTORY.Checked:=false;

     if (DefOptionDataSet.FieldByName('CHECK_CLOSING_IN_BUDGETS').Value<>null)
     then CHECK_CLOSING_IN_BUDGETS.Checked:=Boolean(DefOptionDataSet.FieldByName('CHECK_CLOSING_IN_BUDGETS').AsInteger)
     else CHECK_CLOSING_IN_BUDGETS.Checked:=false;

     if (DefOptionDataSet.FieldByName('FINANCE_NUM_PROP').Value<>null)
     then FINANCE_NUM_PROP.Text:=DefOptionDataSet.FieldByName('FINANCE_NUM_PROP').AsString
     else FINANCE_NUM_PROP.Text:='';

     if (DefOptionDataSet.FieldByName('CLOSE_FINANCE_RESULTS').Value<>null)
     then CLOSE_FINANCE_RESULTS.Text:=DefOptionDataSet.FieldByName('CLOSE_FINANCE_RESULTS').AsString
     else CLOSE_FINANCE_RESULTS.Text:='';

     if (DefOptionDataSet.FieldByName('CLOSE_FINANCE_RESULTS_RASX').Value<>null)
     then CLOSE_FINANCE_RESULTS_RASX.Text:=DefOptionDataSet.FieldByName('CLOSE_FINANCE_RESULTS_RASX').AsString
     else CLOSE_FINANCE_RESULTS_RASX.Text:='';

     if (DefOptionDataSet.FieldByName('CLOSE_FINANCE_RESULTS_DOX').Value<>null)
     then CLOSE_FINANCE_RESULTS_DOX.Text:=DefOptionDataSet.FieldByName('CLOSE_FINANCE_RESULTS_DOX').AsString
     else CLOSE_FINANCE_RESULTS_DOX.Text:='';

     DateForSprav.Date:=Date;
     SchFilterDataSet.SelectSQL.Text:='SELECT * FROM MBOOK_SCH_Z_SELECT';

     SysUchDataSet.Open;

     SysInfoDataSet.SelectSQL.Text:=' select * from PUB_SYS_DATA_SELECT ';
     SysInfoDataSet.Open;

     RegUchDataSet.Open;
     DocsTypeDataSet.Open;
     TemplateDataSet.open;
     LinksDataSet.open;
     SchFilterDataSet.Open;


     PageControl1.ActivePageIndex:=0;
end;

procedure TfrmSysOptions.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;


procedure TfrmSysOptions.ToolButton1Click(Sender: TObject);
var UpdateStateSP:TpfibStoredProc;
    id:Integer;
    frmEditFormUch: TfrmEditFormUch;
begin
      frmEditFormUch:=TfrmEditFormUch.Create(self);
      frmEditFormUch.WorkGroup.ItemIndex    :=SysUchDataSet.FieldByName('IS_WORKING').AsInteger;
      frmEditFormUch.CheckMenGroup.ItemIndex:=SysUchDataSet.FieldByName('CHECK_ID_MEN').AsInteger;
      frmEditFormUch.CheckDogGroup.ItemIndex:=SysUchDataSet.FieldByName('CHECK_DOG').AsInteger;
      if frmEditFormUch.ShowModal=mrYes
      then begin
                UpdateStateSP:=TpfibStoredProc.Create(self);
                UpdateStateSP.Database:=WorkDatabase;
                UpdateStateSP.Transaction:=WriteTransaction;
                WriteTransaction.StartTransaction;
                UpdateStateSP.StoredProcName:='PUB_SP_SYSTEM_UPDATE';
                UpdateStateSP.Prepare;
                id                                               :=SysUchDataSet.FieldByName('ID_SYSTEM').AsInteger;
                UpdateStateSP.ParamByName('ID_SYSTEM').Value     :=  SysUchDataSet.FieldByName('ID_SYSTEM').Value;
                UpdateStateSP.ParamByName('IS_WORKING').Value    :=  frmEditFormUch.WorkGroup.ItemIndex;
                UpdateStateSP.ParamByName('CHECK_ID_MEN').Value  :=  frmEditFormUch.CheckMenGroup.ItemIndex;
                UpdateStateSP.ParamByName('CHECK_DOG').Value     :=  frmEditFormUch.CheckDogGroup.ItemIndex;
                UpdateStateSP.ExecProc;
                WriteTransaction.Commit;
                UpdateStateSP.Free;
                SysUchDataSet.CloseOpen(true);
                SysUchDataSet.Locate('ID_SYSTEM',id,[]);
      end;
end;

procedure TfrmSysOptions.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var id:Variant;
    UpdProc:TpFibStoredProc;
begin
    id:=GlobalSPR.GetSmets(self,WorkDatabase.Handle,SysInfoDataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime,psmRazdSt);
    if VarArrayDimCount(id)>0
    then begin
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 WriteTransaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('USE_DEFAULT_VALUES').AsInteger:=1;
                 UpdProc.ParamByName('DEFAULT_SMETA').Value       :=id[0];
                 UpdProc.ParamByName('DEFAULT_RAZD').Value        :=id[1];
                 UpdProc.ParamByName('DEFAULT_ST').Value          :=id[2];
                 UpdProc.ExecProc;
                 WriteTransaction.Commit;
                 DefOptionDataSet.CloseOpen(true);
    end;

end;

procedure TfrmSysOptions.cxDBButtonEdit4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var id:Variant;
    UpdProc:TpFibStoredProc;
begin
    id:=GlobalSpr.GetKEKVSpr(self,WorkDatabase.Handle,fsNormal,SysInfoDataSet.FieldByName('MAIN_BOOK_DATE').AsDateTime,DEFAULT_ROOT_ID);
    if VarArrayDimCount(id)>0
    then begin
                 UpdProc:=TpFibStoredProc.Create(self);
                 UpdProc.Database:=WorkDatabase;
                 UpdProc.Transaction:=WriteTransaction;
                 WriteTransaction.StartTransaction;
                 UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE_KV';
                 UpdProc.Prepare;
                 UpdProc.ParamByName('USE_DEFAULT_KEKV').AsInteger:=1;
                 UpdProc.ParamByName('DEFAULT_KEKV').Value        :=id[0][0];
                 UpdProc.ExecProc;
                 WriteTransaction.Commit;
                 DefOptionDataSet.CloseOpen(true);
    end;
end;

procedure TfrmSysOptions.cxButton2Click(Sender: TObject);
var GlobalConstsSP:TpFibStoredProc;
begin
         GlobalConstsSP:=TpFibStoredProc.Create(self);
         GlobalConstsSP.Database:=WorkDatabase;
         GlobalConstsSP.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         GlobalConstsSP.StoredProcName:='MBOOK_INI_GCONST_UPDATE';
         GlobalConstsSP.Prepare;
         GlobalConstsSP.ParamByName('MAIN_BUHG_FIO').Value   :=MAIN_BUHG_FIO.Text;
         GlobalConstsSP.ParamByName('RECTOR_FIO').Value      :=RECTOR_FIO.Text;
         GlobalConstsSP.ParamByName('NDS_NUM_PROP').Value    :=EDMainSchNDS.Text;
         GlobalConstsSP.ParamByName('ST_NDS_NUM_PROP').Value :=EDStNeedNDS.Text;
         GlobalConstsSP.ParamByName('SALDO_ONLY_IN_KR').Value:=EdOnlyInCredit.Text;
         GlobalConstsSP.ParamByName('SALDO_ONLY_IN_DB').Value:=EdOnlyInDb.Text;
         GlobalConstsSP.ParamByName('KERNELL_CHECK_SM_PLUS_KEKV').Value:=Integer(KERNELL_CHECK_SM_PLUS_KEKV.Checked);
         GlobalConstsSP.ParamByName('KERNELL_USE_HISTORY').Value       :=Integer(KERNELL_USE_HISTORY.Checked);
         GlobalConstsSP.ParamByName('CHECK_CLOSING_IN_BUDGETS').Value  :=Integer(CHECK_CLOSING_IN_BUDGETS.Checked);
         GlobalConstsSP.ParamByName('FINANCE_NUM_PROP').Value          :=FINANCE_NUM_PROP.Text;
         GlobalConstsSP.ParamByName('CLOSE_FINANCE_RESULTS').Value     :=CLOSE_FINANCE_RESULTS.Text;
         GlobalConstsSP.ParamByName('CLOSE_FINANCE_RESULTS_DOX').Value :=CLOSE_FINANCE_RESULTS_DOX.Text;
         GlobalConstsSP.ParamByName('CLOSE_FINANCE_RESULTS_RASX').Value:=CLOSE_FINANCE_RESULTS_RASX.Text;
         GlobalConstsSP.ExecProc;
         WriteTransaction.Commit;
         GlobalConstsSP.Free;

         Close;
end;

procedure TfrmSysOptions.ToolButton2Click(Sender: TObject);
var T:TfrmEditReg;
    InsertStoredProc:TpFibStoredProc;
    Id_reg:Integer;
begin
    T:=TfrmEditReg.Create(self);
    T.N_PP.Text:=IntToStr(RegUchDataSet.RecordCount+1);
    if T.ShowModal=mrYes
    then begin
               InsertStoredProc:=TpFibStoredProc.Create(self);
               InsertStoredProc.Database:=WorkDatabase;
               InsertStoredProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertStoredProc.StoredProcName:='PUB_SP_REG_UCH_INSERT';
               InsertStoredProc.Prepare;
               InsertStoredProc.ParamByName('REG_TITLE').Value:=T.Edit1.Text;
               InsertStoredProc.ParamByName('REG_SHORT').Value:=T.Edit2.Text;
               InsertStoredProc.ParamByName('ID_FORM_UCH').Value:=T.DBLookupComboBox1.KeyValue;
               InsertStoredProc.ParamByName('REG_KOD').Value:=T.Edit3.Text;
               InsertStoredProc.ParamByName('N_PP').Value:=T.N_PP.Text;

               try

                   InsertStoredProc.ExecProc;
                   except on E:Exception do
                   begin
                         ShowMessage('Помилка при роботі з регістрами обліку. Зверніться до адміністратора!');
                   end;

               end;

               Id_reg:=InsertStoredProc.ParamByName('ID_REG').AsInteger;
               WriteTransaction.Commit;
               InsertStoredProc.Free;

               cxGrid1.BeginUpdate;
               RegUchDataSet.CloseOpen(true);
               RegUchDataSet.Locate('ID_REG',id_reg,[]);
               cxGrid1.EndUpdate;
    end;
    T.Free;
end;

procedure TfrmSysOptions.ToolButton4Click(Sender: TObject);
var T:TfrmEditReg;
    InsertStoredProc:TpFibStoredProc;
    Id_reg:Integer;
begin
 if (RegUchDataSet.RecordCount>0)
 then begin
    T:=TfrmEditReg.Create(self);
    T.Edit1.Text:=RegUchDataSet.FieldByName('REG_TITLE').AsString;
    T.Edit2.Text:=RegUchDataSet.FieldByName('REG_SHORT').AsString;
    T.Edit3.Text:=RegUchDataSet.FieldByName('REG_KOD').AsString;
    T.N_PP.Text :=RegUchDataSet.FieldByName('N_PP').AsString;
    T.DBLookupComboBox1.KeyValue:=RegUchDataSet.FieldByName('ID_FORM_UCH').AsInteger;
    if T.ShowModal=mrYes
    then begin
               InsertStoredProc:=TpFibStoredProc.Create(self);
               InsertStoredProc.Database:=WorkDatabase;
               InsertStoredProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertStoredProc.StoredProcName:='PUB_SP_REG_UCH_UPDATE';
               InsertStoredProc.Prepare;
               id_reg:=RegUchDataSet.FieldByName('ID_REG').AsInteger;
               InsertStoredProc.ParamByName('ID_REG').Value:=RegUchDataSet.FieldByName('ID_REG').AsInteger;
               InsertStoredProc.ParamByName('REG_TITLE').Value:=T.Edit1.Text;
               InsertStoredProc.ParamByName('REG_SHORT').Value:=T.Edit2.Text;
               InsertStoredProc.ParamByName('REG_KOD').Value:=T.Edit3.Text;
               InsertStoredProc.ParamByName('ID_FORM_UCH').Value:=T.DBLookupComboBox1.KeyValue;
               InsertStoredProc.ParamByName('N_PP').Value:=T.N_PP.Text;


               try

                   InsertStoredProc.ExecProc;
                   except on E:Exception do
                   begin
                         ShowMessage('Помилка при роботі з регістрами обліку. Зверніться до адміністратора!');
                   end;

               end;


               WriteTransaction.Commit;
               InsertStoredProc.Free;

               cxGrid1.BeginUpdate;
               RegUchDataSet.CloseOpen(true);
               RegUchDataSet.Locate('ID_REG',id_reg,[]);
               cxGrid1.EndUpdate;
    end;
    T.Free;
  end;
end;

procedure TfrmSysOptions.ToolButton5Click(Sender: TObject);
begin
     RegUchDataSet.CloseOpen(true);
     SysUchDataSet.CloseOpen(true);
end;

procedure TfrmSysOptions.ToolButton3Click(Sender: TObject);
var InsertStoredProc:TpFibStoredProc;
begin
 if (RegUchDataSet.RecordCount>0)
 then begin
     if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити регістр обліку?',mtWarning,[mbYes,mbNo])=mrYes
     then begin
         InsertStoredProc:=TpFibStoredProc.Create(self);
         InsertStoredProc.Database:=WorkDatabase;
         InsertStoredProc.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         InsertStoredProc.StoredProcName:='PUB_SP_REG_UCH_DELETE';
         InsertStoredProc.Prepare;
         InsertStoredProc.ParamByName('ID_REG').Value:=RegUchDataSet.FieldByName('ID_REG').AsInteger;
         InsertStoredProc.ExecProc;
         WriteTransaction.Commit;
         InsertStoredProc.Free;
         RegUchDataSet.CacheDelete;
     end;
 end;
end;

procedure TfrmSysOptions.ToolButton9Click(Sender: TObject);
var id:integer;
begin
     Id:=-1;
     
     cxGrid3.BeginUpdate;

     if DocsTypeDataSet.RecordCount>0 then id:=DocsTypeDataSet.FieldByName('ID_TYPE_DOC').Value;

     DocsTypeDataSet.CloseOpen(true);

     DocsTypeDataSet.Locate('ID_TYPE_DOC',Id,[]);

     cxGrid3.EndUpdate;
end;

procedure TfrmSysOptions.ToolButton6Click(Sender: TObject);
var T:TfrmEditDocType;
    InsertSp:TpFibStoredProc;
    NewId:Integer;
begin
    T:=TfrmEditDocType.Create(self);
    if T.ShowModal=mrYes
    then begin
              InsertSp:=TpFibStoredProc.Create(nil);
              InsertSp.database:=WorkDatabase;
              InsertSp.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSp.StoredProcName:='PUB_INI_TYPE_DOC_INSERT';
              InsertSp.Prepare;
              InsertSp.ParamByName('TYPE_DOC_TITLE').Value:=T.cxTextEdit1.Text;
              InsertSp.ParamByName('TYPE_DOC_SHORT').Value:=T.cxTextEdit2.Text;
              InsertSp.ParamByName('ID_FORM_KOD').Value   :=T.SysLookUp.EditValue;
              InsertSp.ParamByName('ID_REG_UCH').Value    :=T.RegLookUp.EditValue;
              InsertSp.ExecProc;
              NewId:=InsertSp.ParamByName('ID_TYPE_DOC').Value;
              WriteTransaction.Commit;

              cxGrid3.BeginUpdate;
              DocsTypeDataSet.CloseOpen(true);
              DocsTypeDataSet.Locate('ID_TYPE_DOC',NewId,[]);
              cxGrid3.BeginUpdate;              
    end;
    T.Free;
end;

procedure TfrmSysOptions.ToolButton7Click(Sender: TObject);
var  DeleteSp:TpFibStoredProc;
begin
if (DocsTypeDataSet.RecordCount>0)
then begin
      if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити тип документу?',mtWarning,[mbYes,mbNo])=mrYes
      then begin
            DeleteSp:=TpFibStoredProc.Create(nil);
            DeleteSp.database:=WorkDatabase;
            DeleteSp.Transaction:=WriteTransaction;
            WriteTransaction.StartTransaction;
            DeleteSp.StoredProcName:='PUB_INI_TYPE_DOC_DELETE';
            DeleteSp.Prepare;
            DeleteSp.ParamByName('ID_TYPE_DOC').Value:=DocsTypeDataSet.FieldByName('ID_TYPE_DOC').Value;
            DeleteSp.ExecProc;
            WriteTransaction.Commit;
            DocsTypeDataSet.CloseOpen(true);
      end;
end;
end;

procedure TfrmSysOptions.ToolButton8Click(Sender: TObject);
var T:TfrmEditDocType;
    UpdateSp:TpFibStoredProc;
    NewId:Integer;
begin
if DocsTypedataSet.RecordCount>0
then begin
    T:=TfrmEditDocType.Create(self);
    T.cxTextEdit1.Text:=DocsTypeDataSet.FieldByName('TYPE_DOC_TITLE').AsString;
    T.cxTextEdit2.Text:=DocsTypeDataSet.FieldByName('TYPE_DOC_SHORT').AsString;
    T.SysLookUp.EditValue:=DocsTypeDataSet.FieldByName('ID_FORM_KOD').Value;
    T.RegLookUp.EditValue:=DocsTypeDataSet.FieldByName('ID_REG_UCH').Value;

    if T.ShowModal=mrYes
    then begin
              UpdateSp:=TpFibStoredProc.Create(nil);
              UpdateSp.database:=WorkDatabase;
              UpdateSp.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              UpdateSp.StoredProcName:='PUB_INI_TYPE_DOC_UPDATE';
              UpdateSp.Prepare;
              NewId:=DocsTypeDataSet.FieldByName('ID_TYPE_DOC').Value;
              UpdateSp.ParamByName('ID_TYPE_DOC').Value:=DocsTypeDataSet.FieldByName('ID_TYPE_DOC').Value;
              UpdateSp.ParamByName('TYPE_DOC_TITLE').Value:=T.cxTextEdit1.Text;
              UpdateSp.ParamByName('TYPE_DOC_SHORT').Value:=T.cxTextEdit2.Text;
              UpdateSp.ParamByName('ID_FORM_KOD').Value   :=T.SysLookUp.EditValue;
              UpdateSp.ParamByName('ID_REG_UCH').Value    :=T.RegLookUp.EditValue;
              UpdateSp.ExecProc;
              WriteTransaction.Commit;

              cxGrid3.BeginUpdate;
              DocsTypeDataSet.CloseOpen(true);
              DocsTypeDataSet.Locate('ID_TYPE_DOC',NewId,[]);
              cxGrid3.EndUpdate;
    end;
    T.Free;
end;
end;

procedure TfrmSysOptions.CheckKernelBlockPropertiesChange(Sender: TObject);
var UpdProc:TpFibStoredProc;
begin
     UpdProc:=TpFibStoredProc.Create(self);
     UpdProc.Database:=WorkDatabase;
     UpdProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE_EX';
     UpdProc.Prepare;
     UpdProc.ParamByName('KERNELL_IS_BLOCK').AsInteger  :=Integer(CheckKernelBlock.Checked);
     UpdProc.ExecProc;
     WriteTransaction.Commit;
     DefOptionDataSet.CloseOpen(true);
end;

procedure TfrmSysOptions.SetBuConfigure;
var UpdProc:TpFibStoredProc;
begin
    if (CheckConfDefaultBu.ItemIndex=0)
    then begin
               cxDBButtonEdit1.Enabled:=true;
               cxDBTextEdit1.Enabled:=true;
               cxDBTextEdit2.Enabled:=true;
               Label1.Enabled:=true;
               Label2.Enabled:=true;
               Label3.Enabled:=true;

               UpdProc:=TpFibStoredProc.Create(self);
               UpdProc.Database:=WorkDatabase;
               UpdProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE';
               UpdProc.Prepare;
               UpdProc.ParamByName('USE_DEFAULT_VALUES').AsInteger:=1;
               UpdProc.ParamByName('DEFAULT_SMETA').Value       :=DefOptionDataSet.FieldByName('DEFAULT_SMETA').Value;
               UpdProc.ParamByName('DEFAULT_RAZD').Value        :=DefOptionDataSet.FieldByName('DEFAULT_RAZD').Value;
               UpdProc.ParamByName('DEFAULT_ST').Value          :=DefOptionDataSet.FieldByName('DEFAULT_ST').Value;
               UpdProc.ExecProc;
               WriteTransaction.Commit;
               DefOptionDataSet.CloseOpen(true);
    end
    else begin
               cxDBButtonEdit1.Enabled:=false;
               cxDBTextEdit1.Enabled:=false;
               cxDBTextEdit2.Enabled:=false;
               Label1.Enabled:=false;
               Label2.Enabled:=false;
               Label3.Enabled:=false;

               UpdProc:=TpFibStoredProc.Create(self);
               UpdProc.Database:=WorkDatabase;
               UpdProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE';
               UpdProc.Prepare;
               UpdProc.ParamByName('USE_DEFAULT_VALUES').AsInteger:=0;
               UpdProc.ParamByName('DEFAULT_SMETA').Value       :=DefOptionDataSet.FieldByName('DEFAULT_SMETA').Value;
               UpdProc.ParamByName('DEFAULT_RAZD').Value        :=DefOptionDataSet.FieldByName('DEFAULT_RAZD').Value;
               UpdProc.ParamByName('DEFAULT_ST').Value          :=DefOptionDataSet.FieldByName('DEFAULT_ST').Value;
               UpdProc.ExecProc;
               WriteTransaction.Commit;
               DefOptionDataSet.CloseOpen(true);
    end;
end;

procedure TfrmSysOptions.CheckConfDefaultBuClick(Sender: TObject);
begin
      SetBuConfigure;
end;

procedure TfrmSysOptions.CheckConfDefaultKVClick(Sender: TObject);
begin
      SetKVConfigure;
end;

procedure TfrmSysOptions.SetKVConfigure;
var UpdProc:TpFibStoredProc;
begin
    if (CheckConfDefaultKV.ItemIndex=0)
    then begin
               cxDBButtonEdit4.Enabled:=true;
               Label4.Enabled:=true;

               UpdProc:=TpFibStoredProc.Create(self);
               UpdProc.Database:=WorkDatabase;
               UpdProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE_KV';
               UpdProc.Prepare;
               UpdProc.ParamByName('USE_DEFAULT_KEKV').AsInteger:=1;
               UpdProc.ParamByName('DEFAULT_KEKV').Value       :=DefOptionDataSet.FieldByName('DEFAULT_KEKV').Value;
               UpdProc.ExecProc;
               WriteTransaction.Commit;
               DefOptionDataSet.CloseOpen(true);
    end
    else begin
               cxDBButtonEdit4.Enabled:=false;
               Label4.Enabled:=false;

               UpdProc:=TpFibStoredProc.Create(self);
               UpdProc.Database:=WorkDatabase;
               UpdProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE_KV';
               UpdProc.Prepare;
               UpdProc.ParamByName('USE_DEFAULT_KEKV').AsInteger:=0;
               UpdProc.ParamByName('DEFAULT_KEKV').Value       :=DefOptionDataSet.FieldByName('DEFAULT_KEKV').Value;
               UpdProc.ExecProc;
               WriteTransaction.Commit;
               DefOptionDataSet.CloseOpen(true);
    end;
end;

procedure TfrmSysOptions.CheckKekvPropertiesChange(Sender: TObject);
var UpdProc:TpFibStoredProc;
begin
     UpdProc:=TpFibStoredProc.Create(self);
     UpdProc.Database:=WorkDatabase;
     UpdProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE_EX2';
     UpdProc.Prepare;
     UpdProc.ParamByName('KERNELL_CHECK_KEKV').AsInteger  :=Integer(CheckKekv.Checked);
     UpdProc.ExecProc;
     WriteTransaction.Commit;
     DefOptionDataSet.CloseOpen(true);
end;

procedure TfrmSysOptions.CHECK_FOND_PLUS_GROUPPropertiesChange(
  Sender: TObject);
var UpdProc:TpFibStoredProc;
begin
     UpdProc:=TpFibStoredProc.Create(self);
     UpdProc.Database:=WorkDatabase;
     UpdProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE_EX3';
     UpdProc.Prepare;
     UpdProc.ParamByName('CHECK_FOND_PLUS_GROUP').AsInteger  :=Integer(CHECK_FOND_PLUS_GROUP.Checked);
     UpdProc.ExecProc;
     WriteTransaction.Commit;
     DefOptionDataSet.CloseOpen(true);
end;

procedure TfrmSysOptions.CHECK_SPIS_BY_SM_RZ_STPropertiesChange(
  Sender: TObject);
var UpdProc:TpFibStoredProc;
begin
     UpdProc:=TpFibStoredProc.Create(self);
     UpdProc.Database:=WorkDatabase;
     UpdProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdProc.StoredProcName:='MBOOK_INI_DATA_UPDATE_EX4';
     UpdProc.Prepare;
     UpdProc.ParamByName('CHECK_SPIS_BY_SM_RZ_ST').AsInteger  :=Integer(CHECK_SPIS_BY_SM_RZ_ST.Checked);
     UpdProc.ExecProc;
     WriteTransaction.Commit;
     DefOptionDataSet.CloseOpen(true);
end;

procedure TfrmSysOptions.ToolButton11Click(Sender: TObject);
var InsertSP:TpFibStoredProc;
begin
if (TemplateDataSet.RecordCount>0)
then begin
          if agMessageDlg('Увага!','Ви хочете видалити шаблон?',mtWarning,[mbYes,mbNo])=mrYes
          then begin
              InsertSP:=TpFibStoredProc.Create(self);
              InsertSP.Database:=WorkDatabase;
              InsertSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSP.StoredProcName:='BU_SPRAV_TEMPLATE_DELETE';
              InsertSP.Prepare;
              InsertSP.ParamByName('ID_TEMPLATE').Value  :=TemplateDataSet.FieldByName('ID_TEMPLATE').Value;
              InsertSP.ExecProc;
              WriteTransaction.Commit;
              TemplateDataSet.CloseOpen(true);
           end;
end;
end;

procedure TfrmSysOptions.ToolButton10Click(Sender: TObject);
var T:TfrmEditTemplate;
    InsertSP:TpFibStoredProc;
    NewId:Integer;
begin
    T:=TfrmEditTemplate.Create(self);
    if T.ShowModal=mrYes
    then begin
              InsertSP:=TpFibStoredProc.Create(self);
              InsertSP.Database:=WorkDatabase;
              InsertSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSP.StoredProcName:='BU_SPRAV_TEMPLATE_INSERT';
              InsertSP.Prepare;
              InsertSP.ParamByName('DB_ID_SCH').asInt64    :=T.DB_ID_SCH;
              InsertSP.ParamByName('DB_ID_SCH').asInt64    :=T.DB_ID_SCH;
              InsertSP.ParamByName('DB_ID_SM').asInt64     :=T.DB_ID_SM;
              InsertSP.ParamByName('DB_ID_RZ').asInt64     :=T.DB_ID_RZ;
              InsertSP.ParamByName('DB_ID_ST').asInt64     :=T.DB_ID_ST;
              InsertSP.ParamByName('KR_ID_SM').asInt64     :=T.KR_ID_SM;
              InsertSP.ParamByName('KR_ID_RZ').asInt64     :=T.KR_ID_RZ;
              InsertSP.ParamByName('KR_ID_ST').asInt64     :=T.KR_ID_ST;
              InsertSP.ParamByName('KR_ID_KEKV').AsInt64   :=T.KR_ID_KEKV;
              InsertSP.ParamByName('DB_ID_KEKV').AsInt64   :=T.DB_ID_KEKV;
              InsertSP.ParamByName('CR_BY_DT').AsInt64     :=Integer(T.CR_BY_DT.checked);
              InsertSP.ParamByName('TEMPLATE_TITLE').Value:=T.TemplateTitle.Text;
              InsertSP.ExecProc;
              NewId:=InsertSP.ParamByName('ID_TEMPLATE').value;
              WriteTransaction.Commit;

              TemplateDataSet.CloseOpen(true);
              TemplateDataSet.Locate('ID_TEMPLATE',NewId,[]);
    end;
    T.Free;
end;

procedure TfrmSysOptions.ToolButton12Click(Sender: TObject);
var T:TfrmEditTemplate;
    InsertSP:TpFibStoredProc;
    NewId:Integer;
begin
    T:=TfrmEditTemplate.Create(self);
    if TemplateDataSet.FieldByName('TEMPLATE_TITLE').Value<>null
    then T.TemplateTitle.Text:=TemplateDataSet.FieldByName('TEMPLATE_TITLE').AsString;

    if TemplateDataSet.FieldByName('CR_BY_DT').Value<>null
    then T.CR_BY_DT.checked:=TemplateDataSet.FieldByName('CR_BY_DT').AsBoolean;

    if TemplateDataSet.FieldByName('DB_ID_SM').Value<>null
    then T.DB_ID_SM:=StrToInt64(TemplateDataSet.FieldByName('DB_ID_SM').AsString);

    if TemplateDataSet.FieldByName('DB_ID_RZ').Value<>null
    then T.DB_ID_RZ:=StrToInt64(TemplateDataSet.FieldByName('DB_ID_RZ').AsString);

    if TemplateDataSet.FieldByName('DB_ID_ST').Value<>null
    then T.DB_ID_ST:=StrToInt64(TemplateDataSet.FieldByName('DB_ID_ST').AsString);

    if TemplateDataSet.FieldByName('KR_ID_SM').Value<>null
    then T.KR_ID_SM:=StrToInt64(TemplateDataSet.FieldByName('KR_ID_SM').AsString);

    if TemplateDataSet.FieldByName('KR_ID_RZ').Value<>null
    then T.KR_ID_RZ:=StrToInt64(TemplateDataSet.FieldByName('KR_ID_RZ').AsString);

    if TemplateDataSet.FieldByName('KR_ID_ST').value<>null
    then T.KR_ID_ST:=StrToInt64(TemplateDataSet.FieldByName('KR_ID_ST').AsString);

    if TemplateDataSet.FieldByName('DB_ID_SCH').Value<>null
    then T.DB_ID_SCH:=StrToInt64(TemplateDataSet.FieldByName('DB_ID_SCH').AsString);

    if TemplateDataSet.FieldByName('KR_ID_SCH').Value<>null
    then T.KR_ID_SCH:=StrToInt64(TemplateDataSet.FieldByName('KR_ID_SCH').AsString);

    if TemplateDataSet.FieldByName('DB_ID_KEKV').value<>null
    then T.DB_ID_KEKV:=StrToInt64(TemplateDataSet.FieldByName('DB_ID_KEKV').AsString);

    if TemplateDataSet.FieldByName('KR_ID_KEKV').value<>null
    then T.KR_ID_KEKV:=StrToInt64(TemplateDataSet.FieldByName('KR_ID_KEKV').AsString);

    if TemplateDataSet.FieldByName('DB_SM').value<>null
    then T.DB_SM.Text:=TemplateDataSet.FieldByName('DB_SM').AsString;

    if TemplateDataSet.FieldByName('DB_RZ').value<>null
    then T.DB_RZ.Text:=TemplateDataSet.FieldByName('DB_RZ').AsString;

    if TemplateDataSet.FieldByName('DB_ST').value<>null
    then T.DB_ST.Text:=TemplateDataSet.FieldByName('DB_ST').AsString;

    if TemplateDataSet.FieldByName('KR_SM').Value<>null
    then T.KR_SM.Text:=TemplateDataSet.FieldByName('KR_SM').AsString;

    if TemplateDataSet.FieldByName('KR_RZ').Value<>null
    then T.KR_RZ.Text:=TemplateDataSet.FieldByName('KR_RZ').AsString;

    if TemplateDataSet.FieldByName('KR_ST').Value<>null
    then T.KR_ST.Text:=TemplateDataSet.FieldByName('KR_ST').AsString;

    if TemplateDataSet.FieldByName('DB_SCH').value<>null
    then T.DB_SCH.Text:=TemplateDataSet.FieldByName('DB_SCH').AsString;

    if TemplateDataSet.FieldByName('KR_SCH').Value<>null
    then T.KR_SCH.Text:=TemplateDataSet.FieldByName('KR_SCH').AsString;

    if TemplateDataSet.FieldByName('DB_KEKV').Value<>null
    then T.DB_KEKV.Text:=TemplateDataSet.FieldByName('DB_KEKV').AsString;

    if TemplateDataSet.FieldByName('KR_KEKV').Value<>null
    then T.KR_KEKV.Text:=TemplateDataSet.FieldByName('KR_KEKV').AsString;

    if T.ShowModal=mrYes
    then begin
              InsertSP:=TpFibStoredProc.Create(self);
              InsertSP.Database:=WorkDatabase;
              InsertSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSP.StoredProcName:='BU_SPRAV_TEMPLATE_UPDATE';
              InsertSP.Prepare;
              NewId:=TemplateDataSet.FieldByName('ID_TEMPLATE').Value;
              InsertSP.ParamByName('ID_TEMPLATE').Value  :=TemplateDataSet.FieldByName('ID_TEMPLATE').Value;
              InsertSP.ParamByName('DB_ID_SM').AsInt64     :=T.DB_ID_SM;
              InsertSP.ParamByName('DB_ID_RZ').AsInt64     :=T.DB_ID_RZ;
              InsertSP.ParamByName('DB_ID_ST').AsInt64     :=T.DB_ID_ST;
              InsertSP.ParamByName('KR_ID_SM').AsInt64     :=T.KR_ID_SM;
              InsertSP.ParamByName('KR_ID_RZ').AsInt64     :=T.KR_ID_RZ;
              InsertSP.ParamByName('KR_ID_ST').AsInt64     :=T.KR_ID_ST;
              InsertSP.ParamByName('KR_ID_KEKV').AsInt64   :=T.KR_ID_KEKV;
              InsertSP.ParamByName('DB_ID_KEKV').AsInt64   :=T.DB_ID_KEKV;
              InsertSP.ParamByName('TEMPLATE_TITLE').Value:=T.TemplateTitle.Text;
              InsertSP.ParamByName('DB_ID_SCH').asInt64    :=T.DB_ID_SCH;
              InsertSP.ParamByName('KR_ID_SCH').asInt64    :=T.KR_ID_SCH;
              InsertSP.ParamByName('CR_BY_DT').AsInt64     :=Integer(T.CR_BY_DT.checked);
              InsertSP.ExecProc;
              WriteTransaction.Commit;

              TemplateDataSet.CloseOpen(true);
              TemplateDataSet.Locate('ID_TEMPLATE',NewId,[]);
    end;
    T.Free;
end;

procedure TfrmSysOptions.cxButton1Click(Sender: TObject);
begin
      close;
end;

procedure TfrmSysOptions.cxButton3Click(Sender: TObject);
var InsertSP:TpFibStoredProc;
    num_prop:Integer;
begin
     num_prop:=StrToInt(InputBox('Конфігурація системи.','Треба ввести номер властивості.','0'));
     if not LinksDataSet.Locate('NUM_PROP',num_prop,[])
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database:=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='MBOOK_LINKS_PROP_INSERT';
               InsertSP.Prepare;
               InsertSP.ParamByName('NUM_PROP').Value:=num_prop;
               InsertSP.ExecProc;
               WriteTransaction.Commit;
               LinksDataSet.CloseOpen(true);
               LinksDataSet.Locate('NUM_PROP',num_prop,[]);
               InsertSP.Free;
     end;
end;

procedure TfrmSysOptions.cxButton4Click(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
      if (LinksDataSet.RecordCount>0)
      then begin
                 DeleteSP:=TpFibStoredProc.Create(self);
                 DeleteSP.Database:=WorkDatabase;
                 DeleteSP.Transaction:=WriteTransaction;
                 WriteTransaction.StartTransaction;
                 DeleteSP.StoredProcName:='MBOOK_LINKS_PROP_DELETE';
                 DeleteSP.Prepare;
                 DeleteSP.ParamByName('NUM_PROP').Value:=LinksDataSet.FieldByName('NUM_PROP').Value;
                 DeleteSP.ExecProc;
                 WriteTransaction.Commit;
                 LinksDataSet.CacheDelete;
                 DeleteSP.Free;
      end;
end;

procedure TfrmSysOptions.cxButton5Click(Sender: TObject);
var InsertSP:TpFibStoredProc;
    Res:Variant;
    id_sch:int64;
begin
     Res:=GlobalSpr.GetSch(self,
                           WorkDatabase.handle,
                           fsNormal,
                           DateForSprav.Date,
                           DEFAULT_ROOT_ID,0,0);
     If (varArrayDimCount(Res)>0)
     then begin
               id_sch:=RES[0][0];
               if not SchFilterDataSet.Locate('ID_SCH',id_sch,[])
               then begin
                         InsertSP:=TpFibStoredProc.Create(self);
                         InsertSP.Database:=WorkDatabase;
                         InsertSP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='MBOOK_SCH_Z_INSERT';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_SCH').AsInt64  :=id_sch;
                         InsertSP.ParamByName('DATE_ADD').Value  :=DateForSprav.Date;
                         InsertSP.ExecProc;
                         WriteTransaction.Commit;
                         SchFilterDataSet.CloseOpen(true);
                         SchFilterDataSet.Locate('ID_SCH',ID_SCH,[]);
                         InsertSP.Free;
               end;
      end;
end;

procedure TfrmSysOptions.cxButton6Click(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
      if (SchFilterDataSet.RecordCount>0)
      then begin
                 DeleteSP:=TpFibStoredProc.Create(self);
                 DeleteSP.Database:=WorkDatabase;
                 DeleteSP.Transaction:=WriteTransaction;
                 WriteTransaction.StartTransaction;
                 DeleteSP.StoredProcName:='MBOOK_SCH_Z_DELETE';
                 DeleteSP.Prepare;
                 DeleteSP.ParamByName('ID_SCH').Value:=StrToInt64(SchFilterDataSet.FieldByName('ID_SCH').AsString);
                 DeleteSP.ExecProc;
                 WriteTransaction.Commit;
                 SchFilterDataSet.CacheDelete;
                 DeleteSP.Free;
      end;

end;

procedure TfrmSysOptions.ToolButton13Click(Sender: TObject);
var i:Integer;
begin
     ToolButton13.Down:= not ToolButton13.Down;
     for i:=0 to cxGridDBTableView2.ColumnCount-1 do cxGridDBTableView2.Columns[i].Options.Filtering:=ToolButton13.Down;
end;

end.


