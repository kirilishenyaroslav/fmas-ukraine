unit MainSpravka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ImgList, dxBar, dxBarExtItems, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxSplitter, ActnList, ExtCtrls,
  cxSpinEdit, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLabel, dxStatusBar, FIBQuery, pFIBQuery, pFIBStoredProc, Kernel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxCurrencyEdit, frxClass,
  frxDBSet, Placemnt;

type
  TfmMainSpravka = class(TForm)
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
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
    ImageList: TImageList;
    Database: TpFIBDatabase;
    MainDataSetSpravka: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    cxSplitter1: TcxSplitter;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionDelete: TAction;
    ActionChange: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    DataSourceMain: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel1: TcxLabel;
    cxComboBox1: TcxComboBox;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxLabel5: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    StoredProc: TpFIBStoredProc;
    TransactionWrite: TpFIBTransaction;
    Class_DataSet: TpFIBDataSet;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    MainDataSetSpravkaR_NUM_SPRAV: TFIBBCDField;
    MainDataSetSpravkaR_ID_MAN: TFIBBCDField;
    MainDataSetSpravkaR_DATE_REG: TFIBDateField;
    MainDataSetSpravkaR_ID_DOC: TFIBBCDField;
    MainDataSetSpravkaR_COMENT: TFIBStringField;
    MainDataSetSpravkaR_PRIHOD: TFIBIntegerField;
    MainDataSetSpravkaR_ID_TYPE_DOC: TFIBBCDField;
    MainDataSetSpravkaR_FIO: TFIBStringField;
    MainDataSetSpravkaR_BIRTHDAY: TFIBDateField;
    MainDataSetSpravkaR_TIN: TFIBStringField;
    MainDataSetSpravkaR_TN: TFIBIntegerField;
    MainDataSetSpravkaR_N_DOC: TFIBStringField;
    MainDataSetSpravkaR_D_DOC: TFIBDateField;
    MainDataSetSpravkaR_NOTE_DOC: TFIBStringField;
    MainDataSetSpravkaR_SUM_DOC_PRIH: TFIBBCDField;
    MainDataSetSpravkaR_PK_ID_DOC: TFIBBCDField;
    MainDataSetSpravkaR_SUM_DOC_RAS: TFIBBCDField;
    MainDataSetSpravkaR_FIO_DOC: TFIBStringField;
    ActionShow: TAction;
    MainDataSetSpravkaR_ID_CUSTOMER: TFIBBCDField;
    MainDataSetSpravkaR_ID_RATE: TFIBBCDField;
    MainDataSetSpravkaR_ID_RATE_NATIVE: TFIBBCDField;
    ActionPrint: TAction;
    DataSet: TpFIBDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    Action1: TAction;
    DataSetLang: TpFIBDataSet;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    ActionPrintReestr: TAction;
    DataSetReestr: TpFIBDataSet;
    DataSetReestrAVTOR: TFIBStringField;
    DataSetReestrNUM_SP: TFIBBCDField;
    DataSetReestrDATE_SP: TFIBDateField;
    DataSetReestrNUM_DOC: TFIBStringField;
    DataSetReestrDATE_DOC: TFIBDateField;
    DataSetReestrSUM_DOC: TFIBBCDField;
    DataSetReestrFIO: TFIBStringField;
    DataSetReestrNOTE: TFIBStringField;
    DataSetReestrSCH_DEB: TFIBStringField;
    DataSetReestrSCH_KRED: TFIBStringField;
    DataSetReestrDATE_DOG: TFIBStringField;
    DataSetReestrPK_ID: TFIBBCDField;
    DataSetReestrNUM_SMETA: TFIBIntegerField;
    DataSetReestrNUM_RAZD: TFIBIntegerField;
    DataSetReestrNUM_STATE: TFIBIntegerField;
    DataSetReestrNUM_KEKV: TFIBIntegerField;
    DataSetReestrNUM_DOG: TFIBStringField;
    DataSetReestrREG_DOG: TFIBStringField;
    DataSetReestrDOG_NAME_CUST: TFIBStringField;
    frxDBDatasetReestr: TfrxDBDataset;
    DataSetReestrSTORNO: TFIBStringField;
    DataSetReestrFIO_OBUCH: TFIBStringField;
    ReportReestr: TfrxReport;
    FormStorage1: TFormStorage;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionExitExecute(Sender: TObject);
    procedure cxSpinEdit1Click(Sender: TObject);
    procedure cxSpinEdit1Enter(Sender: TObject);
    procedure cxSpinEdit1Exit(Sender: TObject);
    procedure cxSpinEdit1Editing(Sender: TObject; var CanEdit: Boolean);
    procedure cxSpinEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxSpinEdit1FocusChanged(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure MainDataSetSpravkaAfterScroll(DataSet: TDataSet);
    procedure cxGrid1DBBandedTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionShowExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionPrintExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure ActionPrintReestrExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    flag_change_date : integer;
  public
    kod_s : integer;
    id_user, pk : int64;
    num_doc, date_doc, sum_doc, note, fio, name_r_s : string;
    prih_doc : integer;
    d : TDate;
    id_costomer, id_rate_acc, id_rate_acc_native : int64;
    constructor Create(AOwner: TComponent; DataB : TpFIBDatabase; kod_sys : integer); reintroduce; overload;
  end;

function spravka(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase; kod_system : integer):integer;stdcall;
   exports spravka;

implementation
uses Un_R_file_Alex, DateUtils, ShowAddDoc, SpravkaDoc, Un_Progress_form, SpravkaUnitCaption, GlobalSPR,
     SpravkaFitterPrint;

{$R *.dfm}

function spravka(AOwner:TComponent; id_user: int64; DB : TpFIBDatabase; kod_system : integer):integer;stdcall;
var
    T : TfmMainSpravka;
begin
    T := TfmMainSpravka.Create(AOwner, Db, kod_system);
    T.id_user := id_user;
    T.ShowModal;
    T.Free;
    spravka := -1;
end;

constructor TfmMainSpravka.Create(AOwner: TComponent; DataB: TpFIBDatabase; kod_sys : integer);
begin
    inherited Create (AOwner);
    Caption                          := SpravkaUnitCaption.MAIN_WINDOW_SPRAVKA;
    Database                         := DataB;
    TransactionRead.DefaultDatabase  := Database;
    Database.DefaultTransaction      := TransactionRead;
    TransactionWrite.DefaultDatabase := Database;

    StoredProc.Database              := Database;
    StoredProc.Transaction           := TransactionWrite;
    Database.DefaultTransaction      := TransactionRead;
    MainDataSetSpravka.Database      := Database;
    MainDataSetSpravka.Transaction   := TransactionRead;
    DataSetLang.Database             := Database;
    DataSetLang.Transaction          := TransactionRead;
    DataSet.Database                 := Database;
    DataSet.Transaction              := TransactionRead;
    DataSetReestr.Database           := Database;
    DataSetReestr.Transaction        := TransactionRead;

    TransactionRead.StartTransaction;

    cxComboBox1.Clear;
    cxComboBox1.Properties.Items.Insert(0, Un_R_file_Alex.MY_JANUARY);
    cxComboBox1.Properties.Items.Insert(1, Un_R_file_Alex.MY_FEBRIARY);
    cxComboBox1.Properties.Items.Insert(2, Un_R_file_Alex.MY_MARCH);
    cxComboBox1.Properties.Items.Insert(3, Un_R_file_Alex.MY_APRILE);
    cxComboBox1.Properties.Items.Insert(4, Un_R_file_Alex.MY_MAY);
    cxComboBox1.Properties.Items.Insert(5, Un_R_file_Alex.MY_JUNE);
    cxComboBox1.Properties.Items.Insert(6, Un_R_file_Alex.MY_JULY);
    cxComboBox1.Properties.Items.Insert(7, Un_R_file_Alex.MY_AUGUST);
    cxComboBox1.Properties.Items.Insert(8, Un_R_file_Alex.MY_SEPTEMBER);
    cxComboBox1.Properties.Items.Insert(9, Un_R_file_Alex.MY_OCTOBER);
    cxComboBox1.Properties.Items.Insert(10, Un_R_file_Alex.MY_NOVEMBER);
    cxComboBox1.Properties.Items.Insert(11, Un_R_file_Alex.MY_DESEMBER);


    cxGrid1DBBandedTableView1DBBandedColumn1.Caption := SpravkaUnitCaption.MAIN_FORM_NOMER;
    cxGrid1DBBandedTableView1DBBandedColumn2.Caption := SpravkaUnitCaption.MAIN_FORM_DATE;
    cxGrid1DBBandedTableView1DBBandedColumn3.Caption := SpravkaUnitCaption.MAIN_FORM_NOMER;
    if kod_sys = 1 then cxGrid1DBBandedTableView1DBBandedColumn4.Caption := SpravkaUnitCaption.MAIN_FORM_FIO;
    if kod_sys = 2 then cxGrid1DBBandedTableView1DBBandedColumn4.Caption := SpravkaUnitCaption.MAIN_FORM_CUST;
    cxGrid1DBBandedTableView1DBBandedColumn5.Caption := SpravkaUnitCaption.MAIN_FORM_PO_PRIH;
    cxGrid1DBBandedTableView1DBBandedColumn6.Caption := SpravkaUnitCaption.MAIN_FORM_PO_RASH;

    cxGrid1DBBandedTableView1.Bands.Items[1].Caption := SpravkaUnitCaption.MAIN_FORM_DOC;
    cxGrid1DBBandedTableView1.Bands.Items[0].Caption := SpravkaUnitCaption.MAIN_FORM_SPRAVKA;
    cxGrid1DBBandedTableView1.Bands.Items[2].Caption := SpravkaUnitCaption.MAIN_FORM_SUMMA;
    ActionAdd.Caption           := Un_R_file_Alex.MY_ACTION_ADD_CONST;
    ActionDelete.Caption        := Un_R_file_Alex.MY_ACTION_DELETE_CONST;
    ActionChange.Caption        := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
    ActionRefresh.Caption       := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;
    ActionExit.Caption          := Un_R_file_Alex.MY_ACTION_CLOSE_VIH;
    ActionShow.Caption          := Un_R_file_Alex.MY_ACTION_SHOW;
    dxBarLargeButton1.Caption   := Un_R_file_Alex.MY_ACTION_PRINT;
    ActionPrintReestr.Caption   := SpravkaUnitCaption.PRINT_REESTR_SPRAVOK;
    ActionPrint.Caption         := SpravkaUnitCaption.PRINT_SPRAVKA;

    cxComboBox1.ItemIndex       := MonthOf(date)-1;
    cxSpinEdit1.value           := yearOf(date);
    kod_s                       := kod_sys;

    cxLabel3.Caption            := Un_R_file_Alex.BANK_AUTOR_SPRAVKI;
    cxLabel4.Caption            := Un_R_file_Alex.BANK_KOMENTAR_SPRAVKI;
    cxLabel5.Caption            := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel2.Caption            := SpravkaUnitCaption.OTOBRAJAT_ZA;
    cxLabel1.Caption            := SpravkaUnitCaption.MY_YEAR;


    if cxComboBox1.ItemIndex > 8
        then d := StrToDate('01.'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
        else d := StrToDate('01.0'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));

    MainDataSetSpravka.Close;
    MainDataSetSpravka.Sqls.SelectSQL.Text := 'select * from PUB_SPRAVKA_SELECT_SPRAVKA('''+DateToStr(d)+''', '+IntToStr(kod_s)+')';
    MainDataSetSpravka.Open;
    Visible    := true;
    cxTextEdit1.SetFocus;
    cxGrid1.SetFocus;
    Visible           := false;
    //flag_change_date  :=0;
end;

procedure TfmMainSpravka.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
//    CanClose := MessageBox(Handle,Pchar(SpravkaUnitCaption.MAIN_FORM_EXIT), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes;
end;

procedure TfmMainSpravka.ActionExitExecute(Sender: TObject);
begin
    close;
end;

procedure TfmMainSpravka.cxSpinEdit1Click(Sender: TObject);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
    cxSpinEdit1.value := cxSpinEdit1.Text;
end;

procedure TfmMainSpravka.cxSpinEdit1Enter(Sender: TObject);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfmMainSpravka.cxSpinEdit1Exit(Sender: TObject);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfmMainSpravka.cxSpinEdit1Editing(Sender: TObject;
  var CanEdit: Boolean);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfmMainSpravka.cxSpinEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfmMainSpravka.cxSpinEdit1FocusChanged(Sender: TObject);
begin
    if cxSpinEdit1.value > 2999 then cxSpinEdit1.value := 2999;
end;

procedure TfmMainSpravka.ActionAddExecute(Sender: TObject);
var
    T : TfmSpravkaDoc;
begin
    if ShowSpravkaAdd(self, self, pk, num_doc, date_doc, sum_doc, note, fio, name_r_s, prih_doc, id_costomer, id_rate_acc, id_rate_acc_native) then
    begin
        T := TfmSpravkaDoc.Create(self, self, AddSprav);
        if T.FindSpravInLastPeriod then T.Showmodal else begin T.Free; exit; end;
        T.Free;
    end;
end;

procedure TfmMainSpravka.ActionRefreshExecute(Sender: TObject);
begin
    if ((flag_change_date=0)or(flag_change_date=1)) then
    begin
        flag_change_date := flag_change_date+1;
        exit;
    end;
    if cxComboBox1.ItemIndex > 8
        then d := StrToDate('01.'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
        else d := StrToDate('01.0'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
    MainDataSetSpravka.Close;
    MainDataSetSpravka.Sqls.SelectSQL.Text := 'select * from PUB_SPRAVKA_SELECT_SPRAVKA('''+DateToStr(d)+''', '+IntToStr(kod_s)+')';
    MainDataSetSpravka.Open;
    cxTextEdit1.SetFocus;
    cxGrid1.SetFocus;
end;

procedure TfmMainSpravka.ActionDeleteExecute(Sender: TObject);
var
    STRU:KERNEL_MODE_STRUCTURE;
    ErrorList:TStringList;
    DoResult : boolean;
    i : integer;
    mes : string;
    T : TfmUn_Progress_form;
begin
    if (MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DELETE_ALL_DOC +' '+ MainDataSetSpravka.FieldByName('R_NUM_SPRAV').AsString), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes) and (not MainDataSetSpravka.IsEmpty) then
    begin
        Class_DataSet.Database    := DataBase;
        Class_DataSet.Transaction := TransactionWrite;
        TransactionWrite.StartTransaction;
        try
            T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_DELETE_DATA);
            T.Show;
            T.UpDate;

            StoredProc.StoredProcName:='PUB_SPRAVKA_DT_DELETE';
            StoredProc.Prepare;
            StoredProc.ParamByName('D_NUM').AsInt64  := TFIBBCDField(MainDataSetSpravka.FieldByName('R_NUM_SPRAV')).AsInt64;
            StoredProc.ExecProc;

            STRU.DBHANDLE      := Database.Handle;
            STRU.TRHANDLE      := TransactionWrite.Handle;
            STRU.WORKDATE      := MainDataSetSpravka.FieldByName('R_DATE_REG').AsDateTime;//Date;
            STRU.KERNEL_ACTION := 2;
            STRU.KEY_SESSION   := Database.Gen_Id('KERNEL_GEN_ID_SESSION', 1);;
            STRU.PK_ID         := TFIBBCDField(MainDataSetSpravka.FieldByName('R_ID_DOC')).AsInt64;
            STRU.ID_USER       := id_user;
            DoResult           := Kernel.KernelDo(@STRU);
            if not DoResult
            then begin
                 ErrorList:=Kernel.GetDocErrorsList(@STRU);
                 mes := Un_R_file_Alex.MY_MESSAGE_ERROR+#13;
                 if ErrorList<>nil
                 then for i:=0 to  ErrorList.Count-1 do
                       mes :=  mes +' '+ ErrorList.Strings[i]+#13;
                       Class_DataSet.Close;
                       Class_DataSet.SQLs.SelectSQL.Text:='SELECT * FROM KASSA_SELECT_ERROR_PROVS('+IntToStr(STRU.KEY_SESSION)+')';
                       Class_DataSet.Open;
                       Class_DataSet.First;
                       while not Class_DataSet.Eof do
                       begin
                           mes := mes + Class_DataSet.FieldByName('ERROR_MESSAGE').AsString+#13;
                           Class_DataSet.Next;
                       end;
                       T.Free;
                       ShowMessage(mes);
                       TransactionWrite.Rollback;
                       exit;
//                 end;
             end;
            TransactionWrite.Commit;
            ActionRefreshExecute(Sender);
            T.Free;
        except on E:Exception do begin
            TransactionWrite.Rollback;
            T.Free;
            ShowMessage(E.Message);
            EXIT;
            end;
        end;
    end;
end;

procedure TfmMainSpravka.MainDataSetSpravkaAfterScroll(DataSet: TDataSet);
begin
    if not MainDataSetSpravka.IsEmpty then
    begin
        cxTextEdit1.Text := MainDataSetSpravka.FieldByName('R_FIO').AsString;
        cxTextEdit2.Text := MainDataSetSpravka.FieldByName('R_COMENT').AsString;
        cxTextEdit3.Text := MainDataSetSpravka.FieldByName('R_NOTE_DOC').AsString;
    end;
end;

procedure TfmMainSpravka.cxGrid1DBBandedTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_DELETE then ActionDeleteExecute(Sender);
    if key = VK_SPACE  then ActionShowExecute(Sender);
end;

procedure TfmMainSpravka.ActionChangeExecute(Sender: TObject);
var
    T : TfmSpravkaDoc;
begin
    prih_doc := MainDataSetSpravkaR_PRIHOD.AsInteger;
    pk       := MainDataSetSpravkaR_ID_DOC.AsInt64;
    date_doc := MainDataSetSpravkaR_D_DOC.AsString;
    d        := MainDataSetSpravkaR_DATE_REG.AsDateTime;
    T := TfmSpravkaDoc.Create(self, self, ChangeSprav);
    if T.FindSpravInLastPeriod then T.Showmodal else begin T.Free; exit; end;
    T.Free;
end;

procedure TfmMainSpravka.ActionShowExecute(Sender: TObject);
var
    T : TfmSpravkaDoc;
begin
    prih_doc := MainDataSetSpravkaR_PRIHOD.AsInteger;
    T := TfmSpravkaDoc.Create(self, self, ShowSprav);
    T.Showmodal;
    T.Free;
end;

procedure TfmMainSpravka.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsmdiChild then Action := CaFree;
    FormStorage1.SaveFormPlacement;
end;

procedure TfmMainSpravka.ActionPrintExecute(Sender: TObject);
var
    pk : int64;
    prihod_o, id_lang : integer;
begin
    if not MainDataSetSpravka.IsEmpty then
    begin
        DataSetLang.Close;
        DataSetLang.Sqls.SelectSQL.Text := 'select * from PUB_SYS_DATA';
        DataSetLang.Open;
        id_lang := DataSetLang.FieldByName('ID_LANGUAGE').ASInteger;
        DataSetLang.Close;
        pk       := StrToInt64(MainDataSetSpravka.FieldByName('R_PK_ID_DOC').AsString);
        prihod_o := MainDataSetSpravka.FieldByName('R_PRIHOD').AsInteger;
        DataSet.Close;
        DataSet.Sqls.SelectSQL.Text := 'Select * from PUB_SPRAVKA_SELECT_ALL_PROV_PK('+IntToStr(pk)+', '+IntToStr(prihod_o)+')';
        DataSet.Open;
        if id_lang = 1 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2006.fr3');
        if id_lang = 0 then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2006_ukr.fr3');
        frxReport1.Variables['number']      := QuotedStr(MainDataSetSpravka.FieldByName('R_NUM_SPRAV').AsString);
        frxReport1.Variables['num_doc']     := QuotedStr(MainDataSetSpravka.FieldByName('R_N_DOC').AsString);
        frxReport1.Variables['dat']         := QuotedStr(MainDataSetSpravka.FieldByName('R_D_DOC').AsString);
        if prihod_o = 1
            then frxReport1.Variables['sum']:= QuotedStr(MainDataSetSpravka.FieldByName('R_SUM_DOC_PRIH').AsString)
            else frxReport1.Variables['sum']:= QuotedStr(MainDataSetSpravka.FieldByName('R_SUM_DOC_RAS').AsString);
//        frVariables['fio']         := MainDataSetSpravka.FieldByName('R_PK_ID_DOC').AsString;
        frxReport1.Variables['name_author'] := QuotedStr(MainDataSetSpravka.FieldByName('R_FIO').AsString);
        if kod_s = 1
            then frxReport1.Variables['order']       := QuotedStr('1 (Касса)')
            else frxReport1.Variables['order']       := QuotedStr('2 (Банк)');
        frxReport1.Variables['mon']         := QuotedStr(cxComboBox1.Text + ' ' + cxSpinEdit1.Text);
        frxReport1.Variables['note']        := QuotedStr(MainDataSetSpravka.FieldByName('R_NOTE_DOC').AsString);
        frxReport1.Variables['id_user']     := QuotedStr(IntToStr(id_user));
        frxReport1.Variables['comp']        := QuotedStr(GetComputerNetName);
        frxReport1.Variables['coment']      := QuotedStr(MainDataSetSpravka.FieldByName('R_COMENT').AsString);
        frxReport1.PrepareReport;
        frxReport1.ShowReport;

        DataSet.Close;
    end;
end;

procedure TfmMainSpravka.cxGrid1DBBandedTableView1DblClick(
  Sender: TObject);
begin
    ActionShowExecute(Sender);
end;

procedure TfmMainSpravka.Action1Execute(Sender: TObject);
begin
  if not MainDataSetSpravka.IsEmpty then
  begin
        showmessage('date_reg - ' + MainDataSetSpravka.FieldByName('R_DATE_REG').Asstring+#13//+
{                    'id_sm - ' + MainDataSetSpravka.FieldByName('RxMemDatid_sm').Asstring+#13+
{                    'id_razd - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_razd').Asstring+#13+
                    'id_st - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_st').Asstring+#13+
                    'id_kekv - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_kekv').Asstring+#13+
                    'id_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_dog').Asstring+#13+
                    'kod_dog - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatkod_dog').Asstring+#13+
                    'id_sch - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_sch').Asstring+#13+
                    'id_kor_sch - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatID_SCH_KORESPOND').Asstring+#13+
                    'id_man - ' + RxMemoryDataSaveAll.FieldByName('RxMemDatid_man').Asstring+#13+
                    'id_rate - ' + IntToStr(myform.id_rate_acc)+#13+
                    'id_rate_n - ' +IntToStr(myform.id_rate_acc_native)+#13+
                    'id_customer - ' +IntToStr(myform.id_costomer)+#13+
                    'Storno - ' + RxMemoryDataSaveAll.FieldByName('Storno').Asstring+#13+
                    'Change - ' + RxMemoryDataSaveAll.FieldByName('Change').Asstring+#13+
                    'Автор - ' +IntToStr(id_man)}
                    );
    end;
end;

procedure TfmMainSpravka.ActionPrintReestrExecute(Sender: TObject);
var
    d1, d2 : TDate;
    ind : integer;
    sys, id_lang, priz : integer;
    s: string;
    id_smeta : int64;
begin
    if Show_filter_Print(self, d1, d2, ind, priz, id_smeta, Database) then
    begin
        if cxComboBox1.ItemIndex > 8
            then d1 := StrToDate('01.'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
            else d1 := StrToDate('01.0'+IntToStr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
        if ind = 1 then
        begin
            d2 := IncDay(IncMonth(d1, 1), -1);
            s  := cxComboBox1.Text + ' ' + cxSpinEdit1.Text + SpravkaUnitCaption.PRINT_REESTR_YEAR;
        end else
            s  := DateToStr(d2);
        if kod_s = 1 then sys := 1001;
        if kod_s = 2 then sys := 2002;
        DataSetReestr.Close;
        DataSetReestr.Sqls.SelectSql.Text := 'SELECT * FROM PUB_SPRAVKA_REEST_SPRAVOK('+IntToStr(sys)+', '''+DateToStr(d1)+''', '''+DateToStr(d2)+''', '+IntToStr(ind)+', '+IntToStr(priz)+', '+IntToStr(id_smeta)+') order by NUM_SP';
        DataSetReestr.Open;
        DataSetLang.Close;
        DataSetLang.Sqls.SelectSQL.Text := 'select * from PUB_SYS_DATA';
        DataSetLang.Open;
        id_lang := DataSetLang.FieldByName('ID_LANGUAGE').ASInteger;
        DataSetLang.Close;
        if id_lang = 1 then ReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2006.fr3');
        if id_lang = 0 then ReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Bank\Bank_2009_ukr.fr3');
        ReportReestr.Variables['mon']                     := QuotedStr(s);
        if kod_s = 1 then ReportReestr.Variables['fio'] := QuotedStr(SpravkaUnitCaption.PRINT_REESTR_FIO);
        if kod_s = 2 then ReportReestr.Variables['fio'] := QuotedStr(SpravkaUnitCaption.PRINT_REESTR_CUST);
        ReportReestr.Variables['id_user']     := QuotedStr(IntToStr(id_user));
        ReportReestr.Variables['comp']        := QuotedStr(GetComputerNetName);
        ReportReestr.PrepareReport;
        ReportReestr.ShowReport;
        DataSetReestr.Close;
    end;
end;

procedure TfmMainSpravka.FormCreate(Sender: TObject);
begin
    FormStorage1.RestoreFormPlacement;
end;

end.
