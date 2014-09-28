unit UMBookSchFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxTextEdit, ExtCtrls,
  DB, FIBDataSet, pFIBDataSet, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridDBTableView, cxGrid, ComCtrls, ToolWin, ImgList, StdCtrls,
  cxContainer, cxDBEdit, Ibase, FIBDatabase, pFIBDatabase,pFibStoredProc,
  cxCheckBox, RxMemDS, cxButtonEdit;

type
  TSchFrame = class(TFrame)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    Panel1: TPanel;
    SchListDataSet: TpFIBDataSet;
    SchListDataSource: TDataSource;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    HeaderPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    ToolButton3: TToolButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxCheckBox1: TcxCheckBox;
    SchListDataSetLocal: TRxMemoryData;
    SchListDataSetLocalID_SCH: TIntegerField;
    SchListDataSetLocalSCH_TITLE: TStringField;
    SchListDataSetLocalSCH_NUMBER: TStringField;
    SchListDataSetLocalSCH_FULL: TStringField;
    SchListDataSetLocalSCH_TYPE: TIntegerField;
    SchListDataSetLocalLINK_TO: TIntegerField;
    SchListDataSetLocalDATE_BEG: TDateField;
    SchListDataSetLocalDATE_END: TDateField;
    SchListDataSetLocalTYPE_OBJECT: TIntegerField;
    SchListDataSetLocalSCH_OBJ_TYPE_TITLE: TStringField;
    SchListDataSetLocalSCH_TYPE_TITLE: TStringField;
    SchListDataSetLocalID_SYSTEM: TIntegerField;
    SchListDataSetLocalIS_BLOCKED: TIntegerField;
    SchListDataSetLocalIS_BLOCKED_TEXT: TStringField;
    SchListDataSetLocalOPEN_SCH: TDateField;
    SchListDataSetLocalDB_SALDO: TFloatField;
    SchListDataSetLocalKR_SALDO: TFloatField;
    SchListDataSetLocalDB_OBOR: TFloatField;
    SchListDataSetLocalKR_OBOR: TFloatField;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxStyle4: TcxStyle;
    SchListDataSetLocalOLD_DB_OBOR: TFloatField;
    SchListDataSetLocalDB_OBOR_SUM: TFloatField;
    Label5: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    MBIniDataSet: TpFIBDataSet;
    cxGrid1DBTableView2DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn5: TcxGridDBColumn;
    cxStyle5: TcxStyle;
    DetailSchListDataSet: TpFIBDataSet;
    DetailSchListDataSource: TDataSource;
    DetailSchListDataSetLocal: TRxMemoryData;
    DetailSchListDataSetLocalID_RECORD: TIntegerField;
    DetailSchListDataSetLocalID_SCH: TIntegerField;
    DetailSchListDataSetLocalOPEN_SCH: TDateField;
    DetailSchListDataSetLocalCAN_EDIT_RECORD: TIntegerField;
    DetailSchListDataSetLocalKR_ID_SM: TIntegerField;
    DetailSchListDataSetLocalKR_ID_RZ: TIntegerField;
    DetailSchListDataSetLocalKR_ID_ST: TIntegerField;
    DetailSchListDataSetLocalKR_ID_KEKV: TIntegerField;
    DetailSchListDataSetLocalSMETA_KOD: TIntegerField;
    DetailSchListDataSetLocalRZ_NUM: TIntegerField;
    DetailSchListDataSetLocalKEKV_KODE: TIntegerField;
    DetailSchListDataSetLocalST_NUM: TIntegerField;
    cxGrid1DBTableView2DBColumn6: TcxGridDBColumn;
    DetailSchListDataSetLocalOLD_DB_OBOR: TFloatField;
    DetailSchListDataSetLocalDB_OBOR: TFloatField;
    cxStyle6: TcxStyle;
    cxGrid1DBTableView2DBColumn7: TcxGridDBColumn;
    cxStyle7: TcxStyle;
    SchListDataSetLocalSYSTEM_IS_WORKING: TIntegerField;
    SchListDataSetLocalMAIN_SYSTEM_IS_WORKING: TIntegerField;
    SchListDataSetLocalID_MAIN_SYSTEM: TIntegerField;
    EditKRSaldo: TcxDBButtonEdit;
    EditDBSaldo: TcxDBButtonEdit;
    SchListDataSetLocalMAIN_TYPE_OBJECT: TIntegerField;
    Label8: TLabel;
    ToolButton2: TToolButton;
    SchListDataSetLocalCUSTOM_DB_SALDO: TFloatField;
    SchListDataSetLocalCUSTOM_KR_SALDO: TFloatField;
    SchListDataSetLocalID_SALDO: TIntegerField;
    Label9: TLabel;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure SchListDataSetAfterOpen(DataSet: TDataSet);
    procedure DetailSchListDataSetAfterOpen(DataSet: TDataSet);
    procedure cxGrid1DBTableView2DBColumn5PropertiesEditValueChanged(
      Sender: TObject);
    procedure cxGrid1DBTableView2StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxGrid1DBBandedTableView1DBBandedColumn3PropertiesChange(
      Sender: TObject);
    procedure SchListDataSetLocalBeforePost(DataSet: TDataSet);
    procedure SchListDataSetLocalAfterPost(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ToolButton2Click(Sender: TObject);
    procedure EditDBSaldoPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxGrid1DBBandedTableView1DBBandedColumn3PropertiesEditValueChanged(
      Sender: TObject);
  private
    KEYSESSION:Int64;
    Cur_PK_ID     :Int64;
    CheckFlag     :Boolean;
    Position      :Integer;
    NotEdotFlag   :Boolean;
  public
    ActualDate:TDateTime;
    MainSchSystemIsWorking:Boolean;
    function  UpdateData:Boolean;
    procedure CreateUpdateDoc;
    procedure ClearTmpData(KEY:Int64);
    function  DoUpdateDoc:Boolean;
    function  GetDocSumma:Currency;
  end;

implementation

{$R *.dfm}
uses GlobalSpr, UEditSchObor, Kernel, UCustomEditSaldo, BaseTypes;

function TSchFrame.GetDocSumma:Currency;
var i:Integer;
    Summa:Currency;
begin
    Summa:=0;
    SchListDataSetLocal.First;
    for i:=1 to SchListDataSetLocal.RecordCount do
    begin
        if (SchListDataSetLocal.FieldByName('DB_OBOR').AsCurrency<>SchListDataSetLocal.FieldByName('OLD_DB_OBOR').AsCurrency)
        then Summa:=Summa+SchListDataSetLocal.FieldByName('DB_OBOR').AsCurrency-SchListDataSetLocal.FieldByName('OLD_DB_OBOR').AsCurrency;
        SchListDataSetLocal.Next;
    end;
    Result:=Summa;
end;

procedure TSchFrame.ClearTmpData(KEY:Int64);
var TempCreateStoredProc:TpFibStoredProc;
begin
     TempCreateStoredProc:=TpFibStoredProc.Create(self);
     TempCreateStoredProc.Database:=WorkDatabase;
     TempCreateStoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     TempCreateStoredProc.StoredProcName:='KERNEL_CLEAR_TMP';
     TempCreateStoredProc.Prepare;
     TempCreateStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEYSESSION;
     TempCreateStoredProc.ExecProc;
     WriteTransaction.Commit;
     TempCreateStoredProc.Free;
end;

function TSchFrame.DoUpdateDoc:Boolean;
var ErrorList:TStringList;
    STRU:KERNEL_MODE_STRUCTURE;
    DoResult:Boolean;
begin
    STRU.DBHANDLE:=WorkDatabase.Handle;
    WriteTransaction.StartTransaction;
    STRU.TRHANDLE:=WriteTransaction.Handle;
    STRU.KEY_SESSION:=KEYSESSION;
    STRU.PK_ID:=Cur_PK_ID;
    STRU.WORKDATE:=ActualDate;
    STRU.KERNEL_ACTION:=1;
    DoResult:=Kernel.KernelDo(@STRU);
    WriteTransaction.Commit;
    if not DoResult
    then begin
         WriteTransaction.StartTransaction;
         STRU.TRHANDLE:=WriteTransaction.Handle;
         ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
         WriteTransaction.Commit;
         if ErrorList<>nil
         then begin
               //cxMemo1.Lines.Assign(ErrorList);
         end;
    end;
    DoUpdateDoc:=DoResult;
end;

procedure TSchFrame.CreateUpdateDoc;
var  TempCreateStoredProc:TpFibStoredProc;
     i:Integer;
begin
     KEYSESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
     TempCreateStoredProc:=TpFibStoredProc.Create(self);
     TempCreateStoredProc.Database:=WorkDatabase;
     TempCreateStoredProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     //Создание шапки документа
     TempCreateStoredProc.StoredProcName:='MBOOK_CREATE_DOC_EX';
     TempCreateStoredProc.Prepare;
     TempCreateStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEYSESSION;
     TempCreateStoredProc.ParamByName('COMPUTER').Value     :=GlobalSpr.GetComputerNetName;
     TempCreateStoredProc.ParamByName('DATE_DOC').Value     :=ActualDate;
     TempCreateStoredProc.ParamByName('DATE_PROV').Value    :=ActualDate;
     TempCreateStoredProc.ParamByName('SUMMA').AsCurrency   :=GetDocSumma;
     TempCreateStoredProc.ExecProc;
     Cur_PK_ID:=TempCreateStoredProc.ParamByName('PK_ID').AsInt64;

     //Создание тела документа
     TempCreateStoredProc.StoredProcName:='MBOOK_CREATE_PROV_EX';
     TempCreateStoredProc.Prepare;
     SchListDataSetLocal.First;
     for i:=1 to SchListDataSetLocal.RecordCount do
     begin
        if (SchListDataSetLocal.FieldByName('DB_OBOR').AsCurrency<>SchListDataSetLocal.FieldByName('OLD_DB_OBOR').AsCurrency)
        then begin

            //Откат старых данных
            if (SchListDataSetLocal.FieldByName('OLD_DB_OBOR').AsCurrency<>0)
            then begin
                 TempCreateStoredProc.ParamByName('KEY_SESSION').asInt64:=KEYSESSION;
                 TempCreateStoredProc.ParamByName('PK_ID').asInt64      :=Cur_PK_ID;
                 TempCreateStoredProc.ParamByName('SUMMA').asCurrency   :=-SchListDataSetLocal.FieldByName('OLD_DB_OBOR').AsCurrency;
                 TempCreateStoredProc.ParamByName('KR_ID_SCH').asInt64  :=SchListDataSetLocal.FieldByName('ID_SCH').AsInteger;
                 TempCreateStoredProc.ParamByName('DB_ID_SCH').asInt64  :=SchListDataSet.Tag;
                 TempCreateStoredProc.ExecProc;
            end;

            //Добавление новых данных
            if (SchListDataSetLocal.FieldByName('DB_OBOR').AsCurrency<>0)
            then begin
                 TempCreateStoredProc.ParamByName('KEY_SESSION').asInt64:=KEYSESSION;
                 TempCreateStoredProc.ParamByName('PK_ID').asInt64      :=Cur_PK_ID;
                 TempCreateStoredProc.ParamByName('SUMMA').asCurrency   :=SchListDataSetLocal.FieldByName('DB_OBOR').AsCurrency;
                 TempCreateStoredProc.ParamByName('KR_ID_SCH').asInt64  :=SchListDataSetLocal.FieldByName('ID_SCH').AsInteger;
                 TempCreateStoredProc.ParamByName('DB_ID_SCH').asInt64  :=SchListDataSet.Tag;
                 TempCreateStoredProc.ExecProc;
            end;

        end;
        SchListDataSetLocal.Next;
     end;
     WriteTransaction.Commit;
     TempCreateStoredProc.Free;
end;

function TSchFrame.UpdateData:Boolean;
var ResValue, ExistCanges:Boolean;
    i:Integer;
begin
    Screen.Cursor:=crHourGlass;
    SchListDataSetLocal.First;
    ExistCanges:=false;
    for i:=0 to SchListDataSetLocal.RecordCount-1 do
    begin
        if (SchListDataSetLocal.FieldByName('DB_OBOR').AsCurrency-SchListDataSetLocal.FieldByName('OLD_DB_OBOR').AsCurrency<>0)
        then begin
                  ExistCanges:=true;
                  Break;
        end;
        SchListDataSetLocal.Next;
    end;
    if ExistCanges
    then begin
       if BaseTypes.agMessageDlg('Увага?','Обороти по рахунку змінилися. Провести?',mtWarning,[mbYes, mbNo])=mrYes
       then begin
             //Создание документа
             CreateUpdateDoc;

             //Проведение документа
             ResValue:=DoUpdateDoc;

             //Очищение буффреов
             ClearTmpData(KEYSESSION);
       end
       else  ResValue:=true;
    end
    else ResValue:=true;

    Screen.Cursor:=crDefault;

    UpdateData:=ResValue;
end;

procedure TSchFrame.ToolButton1Click(Sender: TObject);
var id:Integer;
begin
    cxGrid1DBBandedTableView1.Controller.BeginUpdate;
    id:=0;
    if SchListDataSetLocal.RecordCount>0
    then begin
         id:=SchListDataSetLocal.FieldByName('ID_SCH').AsInteger;
    end;
    SchListDataSet.CloseOpen(true);

    if (MBIniDataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger=0)
    then begin
         DetailSchListDataSet.CloseOpen(true);
    end;

    SchListDataSet.Locate('ID_SCH',id,[]);
    SchListDataSetLocal.Locate('ID_SCH',id,[]);


    MBIniDataSet.CloseOpen(true);
    if (MBIniDataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger=1)
    then begin
        cxGrid1Level2.Visible:=false;
        cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=true;
    end
    else begin
        cxGrid1Level2.Visible:=true;
        cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=false;
    end;
    cxGrid1DBBandedTableView1.Controller.EndUpdate;
end;

procedure TSchFrame.ToolButton3Click(Sender: TObject);
begin
     GlobalSpr.GetOperationsSpr(Application.MainForm,WorkDatabase.Handle,fsMdiChild,SchListDataSet.Tag,ActualDate,false);
end;

procedure TSchFrame.cxCheckBox1Click(Sender: TObject);
begin
     if cxCheckBox1.Checked
     then begin
                   with cxGrid1DBBandedTableView1.DataController.Filter.Root do
                    begin
                          Clear;                         //Очищаем критерии которые были установлены ранее
                          BoolOperatorKind := fboAnd;     //Устанавливаем логическую связку
                                                         //Добавляем условия фильтрации
                          //add new filter conditions
                          AddItem(cxGrid1DBBandedTableView1DBBandedColumn3, fonotEqual, 0, 'Счета по которым есть движение');
                    end;
                    cxGrid1DBBandedTableView1.DataController.Filter.Active:=true;
     end
     else cxGrid1DBBandedTableView1.DataController.Filter.Root.Clear;                         //Очищаем критерии которые были установлены ранее
end;

procedure TSchFrame.SchListDataSetAfterOpen(DataSet: TDataSet);
var I,j:Integer;
begin
      cxGrid1DBBandedTableView1.Controller.BeginUpdate;
      SchListDataSet.FetchAll;
      SchListDataSetLocal.Close;
      SchListDataSetLocal.Open;
      SchListDataSet.First;
      for i:=1 to SchListDataSet.RecordCount do
      begin
          SchListDataSetLocal.Insert;
          for j:=0 to SchListDataSet.FieldCount-1 do
          begin
               SchListDataSetLocal.FieldByName(SchListDataSet.Fields[j].FieldName).Value:=SchListDataSet.Fields[j].Value;
          end;
          SchListDataSetLocal.FieldByName('OLD_DB_OBOR').Value:=SchListDataSet.FieldByName('DB_OBOR').Value;
          SchListDataSetLocal.Post;
          SchListDataSet.Next;
      end;
      cxGrid1DBBandedTableView1.Controller.EndUpdate;

      if MBIniDataSet.Active then MBIniDataSet.Close;
      MBIniDataSet.Open;
      if (MBIniDataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger=1)
      then begin
          cxGrid1Level2.Visible:=false;
          cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=true;
      end
      else begin
          cxGrid1Level2.Visible:=true;
          cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=false;
      end;

      if SchListDataSet.FieldByName('ID_MAIN_SYSTEM').AsInteger=1
      then begin
          //Гланый счет ведется главной книгой

          //Так как система главная книга то открываем
          //возможность редактирования оборотов
          cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=true;
          NotEdotFlag:=true;
      end
      else begin
         //Гланый счет ведется не главной книгой

         //Проверяем запущена ли эта система
         if SchListDataSet.FieldByName('MAIN_SYSTEM_IS_WORKING').AsInteger=1
         then begin
              //Так как система автоматизирована то закрываем
              //возможность редактирования оборотов
              cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=false;
              Label9.Caption:=' Изменение оборотов заблокировано т.к. система учета астоматизирована! ';
              NotEdotFlag:=false;
         end
         else begin
              //Так как система не автоматизирована то открываем
              //возможность редактирования оборотов
              cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=true;
              NotEdotFlag:=true;
         end;
      end;

      if SchListDataSet.FieldByName('MAIN_TYPE_OBJECT').AsInteger=3
      then begin
         Label8.Visible:=true;
         EditDBSaldo.Visible:=true;
         EditKRSaldo.Visible:=true;
      end
      else begin
         Label8.Visible:=false;
         EditDBSaldo.Visible:=false;
         EditKRSaldo.Visible:=false;
      end;
end;

procedure TSchFrame.DetailSchListDataSetAfterOpen(DataSet: TDataSet);
var j,i:integer;
begin
    cxGrid1DBBandedTableView1.Controller.BeginUpdate;
    if (MBIniDataSet.FieldByName('USE_DEFAULT_VALUES').AsInteger=0)
    then begin
          DetailSchListDataSet.FetchAll;
          DetailSchListDataSetLocal.Close;
          DetailSchListDataSetLocal.Open;
          DetailSchListDataSet.First;
          for i:=1 to DetailSchListDataSet.RecordCount do
          begin
              DetailSchListDataSetLocal.Insert;
              for j:=0 to DetailSchListDataSet.FieldCount-1 do
              begin
                   DetailSchListDataSetLocal.FieldByName(DetailSchListDataSet.Fields[j].FieldName).Value:=DetailSchListDataSet.Fields[j].Value;
              end;
              DetailSchListDataSetLocal.FieldByName('OLD_DB_OBOR').Value:=DetailSchListDataSet.FieldByName('DB_OBOR').Value;
              DetailSchListDataSetLocal.Post;
              DetailSchListDataSet.Next;
          end;
          cxGrid1DBBandedTableView1.ViewData.Collapse(true);
    end;
    cxGrid1DBBandedTableView1.Controller.EndUpdate;
end;

procedure TSchFrame.cxGrid1DBTableView2DBColumn5PropertiesEditValueChanged(
  Sender: TObject);
begin
    DetailSchListDataSetLocal.Refresh;
end;

procedure TSchFrame.cxGrid1DBTableView2StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.Values[6]=0
  then AStyle:=cxStyle7
  else AStyle:=cxStyle5;

end;

procedure TSchFrame.cxGrid1DBBandedTableView1DBBandedColumn3PropertiesChange(
  Sender: TObject);
begin
  CheckFlag:=true;
end;

procedure TSchFrame.SchListDataSetLocalBeforePost(DataSet: TDataSet);
begin
    Position:=SchListDataSetLocal.FieldByName('ID_SCH').asInteger;
end;

procedure TSchFrame.SchListDataSetLocalAfterPost(DataSet: TDataSet);
begin
    SchListDataSetLocal.Locate('ID_SCH',Position,[]);
end;

procedure TSchFrame.cxGrid1DBBandedTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if  (SchListDataSetLocal.FieldByName('ID_SYSTEM').asInteger<>1)
  and (SchListDataSetLocal.FieldByName('SYSTEM_IS_WORKING').asInteger=1)
  then begin
       //
  end
  else begin
       if NotEdotFlag
       then cxGrid1DBBandedTableView1DBBandedColumn3.Options.Editing:=true;
  end;
end;

procedure TSchFrame.ToolButton2Click(Sender: TObject);
begin
    if UpdateData then ToolButton1Click(self);
end;

procedure TSchFrame.EditDBSaldoPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var T:TfrmCustomEditSaldo;
    UpdateSaldoSP:TpFibStoredProc;
begin
    T:=TfrmCustomEditSaldo.Create(self);
    T.Label1.Caption:=HeaderPanel.Caption;
    T.EditDBSaldo.Text:=SchListDataSet.FieldByName('CUSTOM_DB_SALDO').AsString;
    T.EditKrSaldo.Text:=SchListDataSet.FieldByName('CUSTOM_KR_SALDO').AsString;
    if T.ShowModal=mrYes
    then begin
         UpdateSaldoSP:=TpFibStoredProc.Create(self);
         UpdateSaldoSP.Database   :=WorkDatabase;
         UpdateSaldoSP.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         UpdateSaldoSP.StoredProcName:='PUB_DT_SCH_SALDO_EXT_UPDATE';
         UpdateSaldoSP.Prepare;
         UpdateSaldoSP.ParamByName('ID_SALDO').Value:=SchListDataSet.FieldByName('ID_SALDO').Value;
         UpdateSaldoSP.ParamByName('KR_SALDO').Value:=T.EditKrSaldo.Text;
         UpdateSaldoSP.ParamByName('DB_SALDO').Value:=T.EditDBSaldo.Text;
         UpdateSaldoSP.ExecProc;
         WriteTransaction.Commit;
         UpdateSaldoSP.Free;
         ToolButton1Click(ToolButton1);
    end;
    T.Free;
end;

procedure TSchFrame.cxGrid1DBBandedTableView1DBBandedColumn3PropertiesEditValueChanged(
  Sender: TObject);
begin
  if  (SchListDataSetLocal.FieldByName('ID_SYSTEM').asInteger<>1)
  and (SchListDataSetLocal.FieldByName('SYSTEM_IS_WORKING').asInteger=1)
  then begin
       agShowMessage('Не можна змінити обороти по рахунку, бо система обліку функціонує.');
       cxGrid1DBBandedTableView1.DataController.Cancel;
  end;
end;

end.
