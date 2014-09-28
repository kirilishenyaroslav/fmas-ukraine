unit LogForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ToolEdit, Gauges, IniFiles, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo, DMMain, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridBandedTableView, RxMemDS, ExtCtrls,
  DBCtrls, cxDropDownEdit, ComCtrls, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet,IBase, FIBQuery, pFIBQuery, pFIBStoredProc, ToolWin, ImgList,
  cxCheckBox,ConstClBank, cxCurrencyEdit,DogLoaderUnit, ActnList,DateCheck,
  WorkWithDublicate,FormView;

type
  TFormLog = class(TForm)
    StatusBar1: TStatusBar;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    pFIBDataSetReadSection: TpFIBDataSet;
    pFIBStoredProc: TpFIBStoredProc;
    WriteTransaction: TpFIBTransaction;
    PageControl1: TPageControl;
    TabSheetLog: TTabSheet;
    TabSheetError: TTabSheet;
    MemoLog: TcxMemo;
    GroupBox1: TGroupBox;
    BitBtnStart: TBitBtn;
    BitBtnStop: TBitBtn;
    GroupBox2: TGroupBox;
    cxGridDetailsError: TcxGrid;
    cxGridDetailsErrorDBTableView1: TcxGridDBTableView;
    cxGridDetailsErrorLevel1: TcxGridLevel;
    GroupBox3: TGroupBox;
    cxGridErrorRec: TcxGrid;
    cxGridErrorRecDBTableView1: TcxGridDBTableView;
    cxGridErrorRecLevel1: TcxGridLevel;
    pFIBDataSetErrorRec: TpFIBDataSet;
    DataSourceErrorRec: TDataSource;
    ACC_A: TcxGridDBColumn;
    BANK_A: TcxGridDBColumn;
    MFO_A: TcxGridDBColumn;
    NAME_A: TcxGridDBColumn;
    OKPO_A: TcxGridDBColumn;
    ACC_B: TcxGridDBColumn;
    BANK_B: TcxGridDBColumn;
    MFO_B: TcxGridDBColumn;
    NAME_B: TcxGridDBColumn;
    OKPO_B: TcxGridDBColumn;
    DATE_DOC: TcxGridDBColumn;
    DATE_VIP: TcxGridDBColumn;
    NUM_DOC: TcxGridDBColumn;
    SUMMA: TcxGridDBColumn;
    DataSourceDetailsError: TDataSource;
    pFIBDataSetErrorDetails: TpFIBDataSet;
    NAME_ERROR: TcxGridDBColumn;
    MESSAGE_ERROR: TcxGridDBColumn;
    ImageList1: TImageList;
    Splitter1: TSplitter;
    ToolBar1: TToolBar;
    ToolButtonWorkError: TToolButton;
    ToolBar2: TToolBar;
    ToolButtonRefresh: TToolButton;
    ToolButtonWorkAll: TToolButton;
    ToolButtonMarkDel: TToolButton;
    ToolButtonMarkDelAll: TToolButton;
    ToolButtonWorkAgain: TToolButton;
    ToolButtonExit: TToolButton;
    GroupBox4: TGroupBox;
    ProgressBar: TGauge;
    GroupBox5: TGroupBox;
    cxMemoNote: TcxMemo;
    PanelProgress: TPanel;
    RxMemoryDataExtendetError: TRxMemoryData;
    ID_KEY_LOCAL: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ToolButtonClear: TToolButton;
    ToolButtonUnMarkDel: TToolButton;
    ToolButtonUnmarkAllDel: TToolButton;
    ToolButtonColumnEdit: TToolButton;
    pFIBDataSet: TpFIBDataSet;
    DO_WORK: TcxGridDBColumn;
    ActionList1: TActionList;
    workError: TAction;
    Image1: TImage;
    ButtonError: TButton;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    ToolButtonView: TToolButton;
    GaugeAuto: TGauge;
    Panel1: TPanel;
    Image2: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnStartClick(Sender: TObject);
    procedure BitBtnStopClick(Sender: TObject);
    procedure ToolButtonRefreshClick(Sender: TObject);
    procedure pFIBDataSetErrorRecAfterScroll(DataSet: TDataSet);
    procedure ToolButtonWorkAgainClick(Sender: TObject);
    procedure ToolButtonMarkDelClick(Sender: TObject);
    procedure ToolButtonMarkDelAllClick(Sender: TObject);
    procedure ToolButtonExitClick(Sender: TObject);
    procedure ToolButtonWorkErrorClick(Sender: TObject);
    procedure cxGridErrorRecDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ToolButtonColumnEditClick(Sender: TObject);
    procedure ToolButtonUnMarkDelClick(Sender: TObject);
    procedure ToolButtonUnmarkAllDelClick(Sender: TObject);
    procedure ToolButtonClearClick(Sender: TObject);
    procedure workErrorExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButtonViewClick(Sender: TObject);
    procedure ToolButtonAutomatClick(Sender: TObject);
    procedure Automat();
  private

    { Private declarations }
  public
    ini:TiniFile;
    section: string;
    id_bank_select,choose_file:Variant;
    name_path : string;
    constructor Create (AOwner : TComponent;DB:TISC_DB_HANDLE;ID_BANK:Variant;Bank,Name_bank:String);overload;
    procedure MessageDelete(IN_ID_BANK:Int64);
  end;

var
  FormLog: TFormLog;
  MainDM: TMainDM;
  ExportStart: TConnect;
  colorFont:TColor;
  Check_Date_Flag:Integer;
  Check_Date:TDate;
implementation

{$R *.dfm}


constructor TFormLog.Create (AOwner : TComponent;DB:TISC_DB_HANDLE;ID_BANK:Variant;Bank,Name_bank:String);
var
  i:Integer;
begin
  Inherited Create(AOwner);
  Database.Handle:=DB;
  section:=Bank;
  id_bank_select:=ID_BANK;
  Caption:=ConstClBank.ClBank_CAPTION_LOG+' '+Name_bank;
  ToolButtonRefresh.Caption:=ConstClBank.ClBank_ACTION_REFRESH_CONST;
  ToolButtonMarkDel.Caption:=ConstClBank.ClBank_ACTION_DELETE_CONST;
  ToolButtonMarkDelAll.Caption:=ConstClBank.ClBank_ACTION_MARK_DELETE_ALL_CONST;
  ToolButtonWorkAgain.Caption:=ConstClBank.ClBank_ACTION_WOTK_CONST;
  ToolButtonExit.Caption:=ConstClBank.ClBank_ACTION_CLOSE_CONST;
  ToolButtonClear.Caption:=ConstClBank.ClBank_ACTION_CLEAR_CONST;
  ToolButtonUnMarkDel.Caption:=ConstClBank.ClBank_ACTION_UNMARK_DELETE_CONST;
  ToolButtonUnmarkAllDel.Caption:=ConstClBank.ClBank_ACTION_UNMARK_DELETE_ALLCONST;
  ToolButtonColumnEdit.Caption:=ConstClBank.ClBank_Column_Edit;

  StatusBar1.SimpleText:=section;
  pFIBDataSet.Active:=false;
  pFIBDataSet.SQLs.SelectSQL.Add('select * from CLBANK_TMP_BUFFER where ID_BANK='+VarToStr(id_bank_select));
  pFIBDataSet.Active:=true;
  pFIBDataSet.FetchAll;
  if pFIBDataSet.RecordCount>0 then
    begin
      MessageDelete(id_bank_select);
    end;
  pFIBDataSetErrorRec.Database:=Database;
  pFIBDataSetErrorRec.Transaction:=ReadTransaction;
  pFIBDataSetErrorRec.Active:=false;
  pFIBDataSetErrorRec.ParamByName('IN_ID_BANK').AsInt64:=id_bank_select;
  pFIBDataSetErrorRec.Active:=true;
  PanelProgress.Visible:=False;
  pFIBDataSetErrorRec.FetchAll;
  RxMemoryDataExtendetError.EmptyTable;
  for i:=0 to pFIBDataSetErrorRec.RecordCount do
    begin
      RxMemoryDataExtendetError.Open;
      RxMemoryDataExtendetError.Insert;
      RxMemoryDataExtendetError.FieldValues['RXID_LOCAL_KEY']:=pFIBDataSetErrorRec.fieldbyname('id_key_local').AsVariant;
      RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']:=0;
      RxMemoryDataExtendetError.Post;
      pFIBDataSetErrorRec.Next;
    end;
  colorFont:=cxGridDetailsError.Canvas.Font.Color;
  pFIBDataSetErrorRec.First;

  pFIBDataSetReadSection.Database:=Database;
  pFIBDataSetReadSection.Transaction:=ReadTransaction;
  pFIBDataSetReadSection.ParamByName('IN_ID_BANK').AsInt64:=id_bank_select;
  pFIBDataSetReadSection.Active:=true;

  Check_Date_Flag:=pFIBDataSetReadSection.FieldByName('CHECK_DATE').AsInteger;
  Check_Date:=pFIBDataSetReadSection.FieldByName('LAST_RUNS').AsDateTime;
  choose_file:=pFIBDataSetReadSection.FieldByName('CHOOSE_FILE').AsInteger;
  name_path := pFIBDataSetReadSection.FieldByName('PATH_FOLDER').AsString;
  Image2.Visible :=false;
end;


procedure TFormLog.FormClose(Sender: TObject; var Action: TCloseAction);
var
  h,m,s:word;
  time:String;
begin
  if ExportStart<>nil then
  begin
    ExportStart.Terminate;
  end;
  Action:=caFree;
end;

procedure TFormLog.BitBtnStartClick(Sender: TObject);
var
  formDateCheck:TfrmDateCheck;
  name_file:String;
begin
  if (id_bank_select=-1) or (CHOOSE_FILE=1) then
  begin
    OpenDialog1.InitialDir := name_path;
    OpenDialog1.Execute;
    name_file:=OpenDialog1.FileName;
    if name_file='' then
      begin
        exit;
      end
  end;

  if Check_Date_Flag=1 then
  begin
    formDateCheck:=TfrmDateCheck.Create(self);
    Check_Date:=formDateCheck.Check(Check_Date);
    formDateCheck.Free;
  end;

  MainDM:=TMainDM.Create(Self);
  Timer1.Enabled:=true;
  ButtonError.Enabled:=false;
  with MainDM do
         ExportStart:=TConnect.create(Panel1,Image2, progressbar,MemoLog,HTable,DBIbx,FIBTrans,WriteTransaction,FIBSProc,
         id_bank_select,Database.Handle,BitBtnStop,BitBtnStart,TabSheetError,ButtonError,
         Check_Date,Check_Date_Flag,name_file);
  BitBtnStop.Enabled:=True;
  BitBtnStart.Enabled:=False;
  TabSheetError.TabVisible:=false;
end;


procedure TFormLog.BitBtnStopClick(Sender: TObject);
begin
  ExportStart.Terminate;
  BitBtnStop.Enabled:=False;
  BitBtnStart.Enabled:=True;
  TabSheetError.Enabled:=True;
end;


procedure TFormLog.MessageDelete(IN_ID_BANK:Int64);
begin
if messageBox(Handle,PChar('У буфері не оброблені дані. Вилучити іх?'),
     PChar('Внимание'),MB_YESNO or MB_ICONQUESTION)=mrYes then
  begin
    pFIBStoredProc.StoredProcName:='CLBANK_DELETE_DATA';
    WriteTransaction.StartTransaction;
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('IN_ID_BANK').AsInt64:=IN_ID_BANK;
    try
      pFIBStoredProc.ExecProc;
      WriteTransaction.Commit;
      except
        begin
          ShowMessage('Помилка при вилученні даних з буферу');
          WriteTransaction.Rollback;
          Exit;
        end
     end;
  end;
end;


procedure TFormLog.ToolButtonRefreshClick(Sender: TObject);
var
  i:Integer;
  id_doc:Variant;
begin
  cxGridErrorRec.BeginUpdate;
  PanelProgress.Visible:=true;
  Refresh;
  id_doc:=pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').AsVariant;
  pFIBDataSetErrorRec.Active:=false;
  pFIBDataSetErrorRec.ParamByName('IN_ID_BANK').AsInt64:=id_bank_select;
  pFIBDataSetErrorRec.Active:=true;
  pFIBDataSetErrorRec.FetchAll;
  RxMemoryDataExtendetError.FindFirst;
  for i:=0 to pFIBDataSetErrorRec.RecordCount do
  begin
    RxMemoryDataExtendetError.Locate('RXID_LOCAL_KEY',pFIBDataSetErrorRec.fieldbyname('id_key_local').AsVariant,[]);
    if RxMemoryDataExtendetError.FieldValues['RXID_LOCAL_KEY']<>pFIBDataSetErrorRec.fieldbyname('id_key_local').AsVariant then
      begin
        RxMemoryDataExtendetError.Open;
        RxMemoryDataExtendetError.Insert;
        RxMemoryDataExtendetError.FieldValues['RXID_LOCAL_KEY']:=pFIBDataSetErrorRec.fieldbyname('id_key_local').AsVariant;
        RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']:=0;
        RxMemoryDataExtendetError.Post;
      end;
    pFIBDataSetErrorRec.Next;
  end;
  pFIBDataSetErrorRec.Locate('id_key_local',id_doc,[]);
  PanelProgress.Visible:=False;
  cxGridErrorRec.EndUpdate;
end;

procedure TFormLog.pFIBDataSetErrorRecAfterScroll(DataSet: TDataSet);
begin
  cxMemoNote.Text:=pFIBDataSetErrorRec.fieldbyname('NOTE').AsString;
end;

procedure TFormLog.ToolButtonWorkAgainClick(Sender: TObject);
var
  select : TpFIBDataSet;
  i : Integer;
begin
  cxGridErrorRec.BeginUpdate;
  PanelProgress.Visible:=true;
  Refresh;
  pFIBStoredProc.StoredProcName:='CLBANK_CLEARLOG';
  WriteTransaction.StartTransaction;
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('IN_ID_BANK').AsInt64:=id_bank_select;
  try
    pFIBStoredProc.ExecProc;
    WriteTransaction.Commit;
    except
      begin
        WriteTransaction.Rollback;
        Exit;
      end;
  end;
  select:=TpFIBDataSet.Create(nil);
  select.Transaction:=ReadTransaction;
  select.Database:=Database;
  select.SQLs.SelectSQL.Add('select id_key_local from CLBANK_TMP_BUFFER where ID_BANK='+VarToStr(id_bank_select));
  select.Active:=true;
  select.FetchAll;

  if select.RecordCount=0 then
    begin
      ShowMessage('Нет данных для обработки');
    end
    else
  begin
      if (pFIBDataSetReadSection.FieldByName('USE_PROVERKA_ACC_MFO_OKPO').AsInteger=1) then
      begin
        pFIBStoredProc.StoredProcName:='CLBANK_PROVERKA_MFO_OKPO_ACC';
        WriteTransaction.StartTransaction;
        pFIBStoredProc.Prepare;
          try
            pFIBStoredProc.ExecProc;
            WriteTransaction.Commit;
            except
              begin
                  WriteTransaction.Rollback;
                  Exit;
              end;
          end;
      end;

      pFIBStoredProc.StoredProcName:='CLBANK_TMP_BUFFER_START';
      WriteTransaction.StartTransaction;
      pFIBStoredProc.Prepare;
      select.First;
      for i:=0 to select.RecordCount-1 do
        begin
          pFIBStoredProc.ParamByName('ID_KEY_LOCAL').Value:=select.FieldByName('ID_KEY_LOCAL').AsString;
          select.Next;
          try
            pFIBStoredProc.ExecProc;
            except
              begin
              end;
            end;
        end;
      WriteTransaction.Commit;
  end;
  PanelProgress.Visible:=False;
  ToolButtonRefreshClick(self);
  cxGridErrorRec.EndUpdate;
end;

procedure TFormLog.ToolButtonMarkDelClick(Sender: TObject);
begin
//помечаем на удаление
{if RxMemoryDataExtendetError.RecordCount>0 then
  begin
    RxMemoryDataExtendetError.Locate('RXID_LOCAL_KEY',pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').AsVariant,[]);
    RxMemoryDataExtendetError.Open;
    RxMemoryDataExtendetError.Edit;
    RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']:=1;
    RxMemoryDataExtendetError.Post;
  end;}
  if pFIBDataSetErrorRec.RecordCount=0 then
  begin
    exit;
  end;

  if messageBox(Handle,PChar(ConstClBank.ClBank_MESSAGE_DELETE),
            PChar(ConstClBank.ClBank_MESSAGE_WARNING),MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON1)=mrYes then
  begin
    pFIBStoredProc.Database:=Database;
    pFIBStoredProc.Transaction:=WriteTransaction;
    WriteTransaction.StartTransaction;
    pFIBStoredProc.StoredProcName:='CLBANK_DELETE_RECORD';
    pFIBStoredProc.Prepare;
    pFIBStoredProc.ParamByName('ID_BANK').AsInt64:=id_bank_select;
    pFIBStoredProc.ParamByName('ID_LOCAL_KEY').AsInt64:=pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').asVariant;
    try
      pFIBStoredProc.ExecProc;
      except
        begin
          pFIBStoredProc.Transaction.Rollback;
          Exit;
        end
    end;
     pFIBStoredProc.Transaction.Commit;


    pFIBDataSetErrorRec.Active:=False;
    pFIBDataSetErrorRec.Active:=True;
  end;
end;

procedure TFormLog.ToolButtonMarkDelAllClick(Sender: TObject);
var
  i:Integer;
  id_doc:Variant;
begin
  cxGridErrorRec.BeginUpdate;
  id_doc:=pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').AsVariant;
  pFIBDataSetErrorRec.First;
  for i:=0 to pFIBDataSetErrorRec.RecordCount-1 do
  begin
    RxMemoryDataExtendetError.Locate('RXID_LOCAL_KEY',pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').AsVariant,[]);
    RxMemoryDataExtendetError.Open;
    RxMemoryDataExtendetError.Edit;
    RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']:=1;
    RxMemoryDataExtendetError.Post;
    pFIBDataSetErrorRec.Next;
  end;
  cxGridErrorRec.EndUpdate;
  pFIBDataSetErrorRec.Locate('id_key_local',id_doc,[]);
end;

procedure TFormLog.ToolButtonExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormLog.ToolButtonWorkErrorClick(Sender: TObject);
var
  Rec:TImportCustRateAcc;
  Bank:TImportBank;
  Cust:TImportCustomer;
  t:Boolean;
  id:Integer;
  name_cust:String;
  WorkDublicate:TfrmWorkWithDublicate;
  l : integer;
  i : integer;
  str : string;
  check : TpFIBDataSet;
  number_doc : string;
  count_number_doc : Integer;
begin
  //отбираем ошибку
  FillChar(cust, SizeOf(TImportCustomer), 0);
  FillChar(Bank, SizeOf(TImportBank), 0);
  FillChar(Rec, SizeOf(TImportCustRateAcc), 0);
  id:=pFIBDataSetErrorRec.fieldbyname('id_key_local').AsInteger;
  if pFIBDataSetErrorDetails.FieldbyName('id_error_data').AsVariant<1 then
    begin
      Exit;
    end;
  pFIBStoredProc.StoredProcName:='CLBANK_WORK_WITH_ERROR';
  WriteTransaction.StartTransaction;
  pFIBStoredProc.Prepare;
  pFIBStoredProc.ParamByName('ID_ERROR_DATA').AsInt64:=pFIBDataSetErrorDetails.FieldbyName('id_error_data').AsVariant;
  try
    pFIBStoredProc.ExecProc;
    except
      begin
        WriteTransaction.Rollback;
        Exit;
      end;
  end;
  if pFIBStoredProc.ParamByName('ID_ERROR').AsInteger=1 then
    begin
      rec.id_customer:=pFIBStoredProc.ParamByName('ID_CUSTOMER').AsInt64;
      rec.id_cust_rate_acc:=-1;
      rec.rate_account:=pFIBStoredProc.ParamByName('ACC').AsString;
      Rec.id_bank:=pFIBStoredProc.ParamByName('ID_BANK').AsInteger;
      Rec.id_type_account:=31399;
      Rec.date_beg:=pFIBStoredProc.ParamByName('DATE_BEG_ACC').AsDate;
      Rec.date_end:=pFIBStoredProc.ParamByName('DATE_END_ACC').AsDate;
      Rec.bShowInfo:=true;
      WriteTransaction.Commit;
      t:=ImportCustRateAcc(Rec,self,Database.Handle,WriteTransaction.Handle);
    end;
  if (pFIBStoredProc.ParamByName('ID_ERROR').AsInteger = 2) or (pFIBStoredProc.ParamByName('ID_ERROR').AsInteger=7) then
    begin
      Bank.mfo:=pFIBStoredProc.ParamByName('MFO').AsString;
      Bank.name:=pFIBStoredProc.ParamByName('BANK').AsString;
      Bank.city:='';
      Bank.bShowInfo:=true;
      WriteTransaction.Commit;
      t:=ImportBank(Bank,self,Database.Handle,WriteTransaction.Handle);
    end;
  if (pFIBStoredProc.ParamByName('ID_ERROR').AsInteger = 3) or (pFIBStoredProc.ParamByName('ID_ERROR').AsInteger=4) then
    begin
      Cust.id_customer:=-1;
      Cust.id_higher_instance:=-1;

      Cust.name_customer:=StringReplace(pFIBStoredProc.ParamByName('NAME_CUSTOMER').AsString,'''','"',[]);
      Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
      Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
      Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
      Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);
      Cust.name_customer:=StringReplace(Cust.name_customer,'''','"',[]);

      l := Length(Cust.name_customer);
      i := 1;
      while (i<=l) do
      begin
          str := Copy(Cust.name_customer,i,1);
          if (str='?') then Cust.name_customer[i] := ' ';
          i := i+1;
      end;

      Cust.short_name:='';
      Cust.kod_edrpou:=pFIBStoredProc.ParamByName('OKPO').AsString;
      Cust.date_nns:=Now;
      Cust.nns:='';
      Cust.nalog_nom:=-1;
      Cust.fiz_lico:=-1;
      Cust.plat_nds:=-1;
      Cust.pay_nds:=-1;
      Cust.id_type_property:=-1;
      Cust.id_branch:=-1;
      Cust.bShowInfo:=true;

      WriteTransaction.Commit;
      t:=ImportCustomer(Cust,self,Database.Handle,WriteTransaction.Handle);
    end;
  if (pFIBStoredProc.ParamByName('ID_ERROR').AsInteger=11) then
    begin
    { if section='DNEPR' then
        begin
          pFIBStoredProc.StoredProcName:='CLBANK_DNEPR_START';
        end;
      if section='EXIM' then
        begin
          pFIBStoredProc.StoredProcName:='CLBANK_EXIM_START';
        end;
      if section='PYMB' then
        begin
          pFIBStoredProc.StoredProcName:='CLBANK_PYMB_START';
        end;
      WriteTransaction.StartTransaction;
      pFIBStoredProc.Prepare;
      pFIBStoredProc.ParamByName('ID_KEY_LOCAL').Value:=pFIBDataSetErrorRec.FieldValues['ID_KEY_LOCAL'];
      try
        pFIBStoredProc.ExecProc;
        except
          begin
            WriteTransaction.Rollback;
            t:=false;
            exit;
          end;
        end;
      WriteTransaction.Commit;
      t:=true;}
      t:=false;
      ShowMessage('В данный момент обработка данной ошибки находиться в разработке.');
    end;
  if pFIBStoredProc.ParamByName('ID_ERROR').AsInteger=6 then
  begin
    WorkDublicate:=TfrmWorkWithDublicate.Create(self);
    WorkDublicate.work(pFIBDataSetErrorRec.FieldValues['ID_KEY_LOCAL'],id_bank_select,Database.Handle);
    WorkDublicate.free;
    t:=true;
  end;
  if pFIBStoredProc.ParamByName('ID_ERROR').AsInteger = 13 then
  begin
      count_number_doc:=0;
      number_doc:='';
      check:=TpFIBDataSet.Create(nil);
      check.Transaction:=ReadTransaction;
      check.Database:=Database;
      check.SQLs.SelectSQL.Add('select number_doc from CLBANK_TMP_BUFFER where ID_BANK='+VarToStr(id_bank_select)+'and id_key_local='+VarToStr(pFIBDataSetErrorRec.FieldValues['ID_KEY_LOCAL']));
      check.Active:=true;
      check.FetchAll;
      number_doc:=check.FieldByName('NUMBER_DOC').AsString;
      count_number_doc:=Length(number_doc);
      if (count_number_doc > 10) then
      begin
        ShowMessage('Довжина документа під номером '+number_doc+' більше 10 символів!');
        pFIBStoredProc.StoredProcName:='CLBANK_TMP_BUFFER_START_ERROR';
        WriteTransaction.StartTransaction;
        pFIBStoredProc.Prepare;
        pFIBStoredProc.ParamByName('ID_KEY_LOCAL').Value:=VarToStr(pFIBDataSetErrorRec.FieldValues['ID_KEY_LOCAL']);
        try  pFIBStoredProc.ExecProc;
        except
          begin
          end;
        end;
        WriteTransaction.Commit;
      end;
      t:=true;
  end;
  if (t = true) then
  begin
    ToolButtonWorkAgainClick(self);
    pFIBDataSetErrorRec.Locate('id_key_local',id,[]);
    if id <> pFIBDataSetErrorRec.fieldbyname('id_key_local').AsVariant then
    begin
      pFIBDataSetErrorRec.First;
    end;
  end
  else
  begin
    ShowMessage('Помилка не оброблена.');
  end;
end;

procedure TFormLog.cxGridErrorRecDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
  ind:Integer;
begin
  Arect:=AViewInfo.Bounds;
  ind:=Sender.IndexOfItem(ID_KEY_LOCAL);

  RxMemoryDataExtendetError.Locate('RXID_LOCAL_KEY',AViewInfo.GridRecord.Values[ind],[]);
  if RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']=1 then
    begin
      ACanvas.Canvas.Font.Color:=clRed;
      ACanvas.Canvas.Font.Style:=[fsStrikeOut];
      ACanvas.Canvas.FillRect(Arect);
    end
    else
    begin
      ACanvas.Canvas.Pen.Color:=colorFont;
      ACanvas.Canvas.Font.Style:=[];
      ACanvas.Canvas.FillRect(Arect);
    end;
end;
procedure TFormLog.ToolButtonColumnEditClick(Sender: TObject);
begin
  cxGridErrorRecDBTableView1.Controller.Customization := not cxGridErrorRecDBTableView1.Controller.Customization;
end;

procedure TFormLog.ToolButtonUnMarkDelClick(Sender: TObject);
begin
if RxMemoryDataExtendetError.RecordCount>0 then
  begin
    RxMemoryDataExtendetError.Locate('RXID_LOCAL_KEY',pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').AsVariant,[]);
    RxMemoryDataExtendetError.Open;
    RxMemoryDataExtendetError.Edit;
    RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']:=0;
    RxMemoryDataExtendetError.Post;
  end;
end;

procedure TFormLog.ToolButtonUnmarkAllDelClick(Sender: TObject);
var
  i:Integer;
  id_doc:Variant;
begin
cxGridErrorRec.BeginUpdate;
id_doc:=pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').AsVariant;
pFIBDataSetErrorRec.First;
for i:=0 to pFIBDataSetErrorRec.RecordCount-1 do
  begin
    RxMemoryDataExtendetError.Locate('RXID_LOCAL_KEY',pFIBDataSetErrorRec.FieldByName('ID_KEY_LOCAL').AsVariant,[]);
    RxMemoryDataExtendetError.Open;
    RxMemoryDataExtendetError.Edit;
    RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']:=0;
    RxMemoryDataExtendetError.Post;
    pFIBDataSetErrorRec.Next;
  end;
cxGridErrorRec.EndUpdate;
pFIBDataSetErrorRec.Locate('id_key_local',id_doc,[]);
end;

procedure TFormLog.ToolButtonClearClick(Sender: TObject);
var
  i:Integer;
begin
cxGridErrorRec.BeginUpdate;
if pFIBDataSetErrorRec.RecordCount>0 then
  begin
    if messageBox(Handle,PChar(ConstClBank.ClBank_MESSAGE_DELETE),
         PChar(ConstClBank.ClBank_MESSAGE_WARNING),MB_YESNO or MB_ICONQUESTION or MB_DEFBUTTON2)=mrYes then
      begin
        PanelProgress.Visible:=true;
        RxMemoryDataExtendetError.First;
        pFIBDataSetErrorRec.First;
        for i:=0 to RxMemoryDataExtendetError.RecordCount-1 do
          begin
            if RxMemoryDataExtendetError.FieldValues['RXFLAG_DELETE']=1 then
              begin
                pFIBStoredProc.StoredProcName:='CLBANK_DELETE_RECORD';
                WriteTransaction.StartTransaction;
                pFIBStoredProc.Prepare;
                pFIBStoredProc.ParamByName('ID_BANK').Value:=id_bank_select;
                pFIBStoredProc.ParamByName('id_local_key').Value:=pFIBDataSetErrorRec.FieldByName('id_key_local').AsVariant;
                pFIBDataSetErrorRec.Next;
                try
                  pFIBStoredProc.ExecProc;
                  except
                    begin
                      ShowMessage('Помилка при вилученні данних.');
                      WriteTransaction.Rollback;
                      PanelProgress.Visible:=false;
                      Exit;
                    end;
                  end;
                WriteTransaction.Commit;
                RxMemoryDataExtendetError.Delete;
              end;
            RxMemoryDataExtendetError.Next;
          end;
         ToolButtonRefreshClick(self);
         PanelProgress.Visible:=false;
      end;
  end;
cxGridErrorRec.EndUpdate;  
end;

procedure TFormLog.workErrorExecute(Sender: TObject);
begin
  //ToolButtonWorkErrorClick(self);
end;

procedure TFormLog.Timer1Timer(Sender: TObject);
begin
if ButtonError.Enabled=true then
  begin
    PageControl1.ActivePage:=TabSheetError;
    ToolButtonRefreshClick(self);
    Timer1.Enabled:=false;
  end;

end;

procedure TFormLog.ToolButtonViewClick(Sender: TObject);
var
  view:TfrmFormView;
begin
if pFIBDataSetErrorRec.RecordCount>0 then
  begin
    view:=TfrmFormView.Create(self);
    view.work(pFIBDataSetErrorRec.FieldValues['ID_KEY_LOCAL'],id_bank_select,Database.Handle);
    view.free;
  end;    
end;

procedure TFormLog.ToolButtonAutomatClick(Sender: TObject);
begin
//режим автоматического забора данных
cxGridErrorRec.BeginUpdate;
cxGridDetailsError.BeginUpdate;

GaugeAuto.Visible:=True;
Image1.Visible:=True;
GaugeAuto.MaxValue:=pFIBDataSetErrorRec.RecordCount;

Automat();

GaugeAuto.Visible:=False;
Image1.Visible:=False;

cxGridErrorRec.EndUpdate;
cxGridDetailsError.EndUpdate;
end;

procedure TFormLog.Automat();
begin


pFIBDataSetErrorRec.Active:=False;
pFIBDataSetErrorRec.Active:=True;

if pFIBDataSetErrorRec.RecordCount>0 then
  begin

    Automat();
  end;
end;

end.

