unit AvanceReestrMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ExtCtrls, ActnList, ImgList, cxClasses,
  cxStyles, cxGridTableView, dxBar, dxBarExtItems, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxCalendar, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit, cxLabel,
  cxContainer, cxMaskEdit, cxDropDownEdit, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, Un_R_file_Alex, cxDBLabel, FIBQuery, pFIBQuery,
  pFIBStoredProc, Menus, cxCheckBox, frxClass, frxDBSet;

type
  TfrmAvanceReestrMain = class(TForm)
    BarManagerMain: TdxBarManager;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarLargeButton16: TdxBarLargeButton;
    ActionListReestr: TActionList;
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
    ActionAddReestr: TAction;
    ActionChangeReestr: TAction;
    ActionDeleteReestr: TAction;
    ActionPrintReestr: TAction;
    ActionClose: TAction;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ActionAddMan: TAction;
    ActionDeleteMan: TAction;
    cxGridMain: TcxGrid;
    cxGridMainDBTableView1: TcxGridDBTableView;
    cxGridMainLevel1: TcxGridLevel;
    cxGridRaznoskka: TcxGrid;
    cxGridRaznoskkaDBTableView1: TcxGridDBTableView;
    cxGridRaznoskkaLevel1: TcxGridLevel;
    cxGridMainDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridMainDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridRaznoskkaDBTableView1DBColumn2: TcxGridDBColumn;
    Panel5: TPanel;
    cxComboBoxSystem: TcxComboBox;
    cxLabel3: TcxLabel;
    cxComboBoxMonth: TcxComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxButton1: TcxButton;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSetMainReestr: TpFIBDataSet;
    cxLabel1: TcxLabel;
    DataSetSelectSystem: TpFIBDataSet;
    DataSourceReestrMain: TDataSource;
    DataSourceMan: TDataSource;
    DataSetMan: TpFIBDataSet;
    cxDBLabel1: TcxDBLabel;
    Panel1: TPanel;
    cxDBLabel2: TcxDBLabel;
    cxGridRaznoskkaDBTableView1DBColumn3: TcxGridDBColumn;
    ActionRefresh: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    StoredProc: TpFIBStoredProc;
    PopupMenu1: TPopupMenu;
    AddHand: TMenuItem;
    AddAll: TMenuItem;
    ActionAddManAll: TAction;
    DataSetPeriod: TpFIBDataSet;
    DataSetManAll: TpFIBDataSet;
    DataSetCount: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSetCountCOUNT_REST: TFIBIntegerField;
    DataSetManID_REESTR_MONTH_MAN: TFIBBCDField;
    DataSetManID_REESTR_MONTH: TFIBBCDField;
    DataSetManID_AO: TFIBBCDField;
    DataSetManDATE_AO: TFIBDateField;
    DataSetManSUM_AO: TFIBBCDField;
    DataSetManALL_NUMBER: TFIBStringField;
    DataSetManR_FIO: TFIBStringField;
    DataSetManNUM_REESTR: TFIBIntegerField;
    DataSetManDATE_REESTR: TFIBDateField;
    DataSetManFIO_ADD: TFIBStringField;
    cxDBLabel3: TcxDBLabel;
    TransactionManAll: TpFIBTransaction;
    frxDBDataset1: TfrxDBDataset;
    DataSetManNAME_PRED: TFIBStringField;
    DataSetManCOMMENT_REESTR: TFIBStringField;
    DataSetManALL_NUM_REESTR: TFIBStringField;
    PopupMenu2: TPopupMenu;
    DelHand: TMenuItem;
    DelAll: TMenuItem;
    ActionDelAll: TAction;
    ReportReestr: TfrxReport;
    cxGridMainDBTableView1DBColumn3: TcxGridDBColumn;
    DataSetManKOD_SCH: TFIBIntegerField;
    cxLabel2: TcxLabel;
    procedure cxComboBoxSystemClick(Sender: TObject);
    procedure ActionAddReestrExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionChangeReestrExecute(Sender: TObject);
    procedure ActionDeleteReestrExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionAddManExecute(Sender: TObject);
    procedure ActionAddManAllExecute(Sender: TObject);
    procedure ActionDeleteManExecute(Sender: TObject);
    procedure ActionPrintReestrExecute(Sender: TObject);
    procedure ActionDelAllExecute(Sender: TObject);
  private
     KOD_SYSTEM : STRING;
     IndSystem : array of int64;
     date_open : tdate;
     date_end_period_tmp : tdate;
  public
      id_system : int64;
      date_beg_period : tdate;
      id_user : int64;
      date_end_period : tdate;
      num_avance_b, num_avance_e : string;
      fl_sch, fl_num :integer;
      id_sch : int64;
      prefix, prefix_reestr : string;
      constructor Create(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase); reintroduce; overload;
  end;

function AvanceShowReestr(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer; stdcall;
   exports AvanceShowReestr;

{var
  frmAvanceResstrMain: TfrmAvanceReestrMain;}

implementation

uses DateUtils, Un_lo_file_Alex, AvanceAddReestr, AvanceAddMan, AvanceReestrFltr, Un_Progress_form;

{$R *.dfm}

function AvanceShowReestr(AOwner : TComponent; id_us : int64; DB : TpFIBDatabase): integer;
var
    T : TfrmAvanceReestrMain;
begin
    T := TfrmAvanceReestrMain.Create(AOwner, id_us, DB);
    T.id_user := id_us;
    T.ShowModal;
   AvanceShowReestr := -1;
end;

constructor TfrmAvanceReestrMain.Create(AOwner: TComponent; id_us: int64;DB: TpFIBDatabase);
var
    i, item_index : integer;
begin
    inherited Create(AOwner);

    Database.Handle                    := DB.Handle;
    Transaction.DefaultDatabase        := Database;
    Database.DefaultTransaction        := Transaction;

    DataSetMainReestr.Database         := DB;
    DataSetMainReestr.Transaction      := Transaction;

    DataSetSelectSystem.Database       := DB;
    DataSetSelectSystem.Transaction    := Transaction;

    DataSetMan.Database                := DB;
    DataSetMan.Transaction             := Transaction;

    DataSetPeriod.Database             := DB;
    DataSetPeriod.Transaction          := Transaction;

    DataSetManAll.Database             := DB;
    DataSetManAll.Transaction          := Transaction;

    StoredProc.DataBase                := DB;
    StoredProc.Transaction             := TransactionManAll;

    DataSetCount.Database              := DB;
    DataSetCount.Transaction           := Transaction;

    Caption                            := Un_R_file_Alex.J4_FORM_REESTR;
    ActionAddReestr.Caption            := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionChangeReestr.Caption         := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDeleteReestr.Caption         := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionRefresh.Caption              := Un_R_file_Alex.MY_BUTTON_REFRESH;
    ActionClose.Caption                := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionPrintReestr.Caption          := Un_R_file_Alex.MY_BUTTON_PRINT;
    ToolButton1.Caption                := Un_R_file_Alex.MY_BUTTON_ADD;
    ToolButton3.Caption                := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionDeleteMan.Caption            := Un_R_file_Alex.MY_BUTTON_DELETE;
    cxButton1.Caption                  := Un_R_file_Alex.OK[1];
    AddHand.Caption                    := Un_R_file_Alex.J4_REESTR_ADD_HAND;
    AddAll.Caption                     := Un_R_file_Alex.J4_REESTR_ADD_AUTO;
    ActionDelAll.Caption               := Un_R_file_Alex.J4_DEL_ALLAO_REESTR;
    cxLabel3.Caption                   := Un_R_file_Alex.J4_SYSTEM;
    cxLabel4.Caption                   := Un_R_file_Alex.J4_OBOROT_FORM_PERIOD;
    cxLabel1.Caption                   := Un_R_file_Alex.J4_COUNT_RECORDS_NE;

    cxGridMainDBTableView1DBColumn1.Caption       := Un_R_file_Alex.J4_REESTR_NUM;
    cxGridMainDBTableView1DBColumn2.Caption       := Un_R_file_Alex.J4_COUNT_RECORDS;
    cxGridRaznoskkaDBTableView1DBColumn1.Caption  := Un_R_file_Alex.J4_NUM_AO;
    cxGridRaznoskkaDBTableView1DBColumn2.Caption  := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGridRaznoskkaDBTableView1DBColumn3.Caption  := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;

    Transaction.StartTransaction;

    DataSetPeriod.Close;
    DataSetPeriod.SQLs.SelectSQL.Text := 'select min(DATE_OPEN) as date_open from J4_SELECT_INFO_OPEN_SCH('+inttostr(id_user)+') where DATE_OPEN<DATE_END';
    DataSetPeriod.open;

    try date_open            := DataSetPeriod.FBN('date_open').AsDateTime; except date_open := date end;

    cxSpinEdit1.Value                  := YearOf(date_open);
    cxComboBoxMonth.ItemIndex          := MonthOf(date_open)-1;

    DataSetSelectSystem.Close;
    DataSetSelectSystem.SQLs.SelectSQL.Text := 'SELECT * FROM J4_CHOOSE_SYS_BY_ID('+IntToStr(id_user)+')';
    DataSetSelectSystem.Open;
    DataSetSelectSystem.FetchAll;

    If DataSetSelectSystem.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_WARNING_LOAD_JORNAL), PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_MESSAGA), 16);
        close;
    end;  

    SetLength(IndSystem, DataSetSelectSystem.RecordCount);
    DataSetSelectSystem.First;
    i := 0;
    item_index := 0;
    cxComboBoxSystem.Properties.Items.Clear;

    While not DataSetSelectSystem.Eof do
    begin
        IndSystem[DataSetSelectSystem.RecNo - 1] := DataSetSelectSystem['ID_J4_SP_JO'];
        cxComboBoxSystem.Properties.Items.Add(DataSetSelectSystem.FieldByName('SHORT_NAME').AsString);
        IF DataSetSelectSystem.FieldByName('SYSTEM_OPEN').Asinteger = 1 THEN
        begin
            kod_system       := DataSetSelectSystem.FieldByName('KOD').AsString;
            id_system        := TFIBBCDField(DataSetSelectSystem.FieldByName('ID_J4_SP_JO')).AsInt64;
            Caption          := DataSetSelectSystem.FieldByName('FULL_NAME').AsString;
            item_index       := i;
        end;
        inc(i);
        DataSetSelectSystem.Next;
    end;
    cxComboBoxSystem.ItemIndex := item_index;

    if cxComboBoxMonth.ItemIndex < 10 then
    begin
         date_beg_period := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
         prefix          := kod_system+'-'+IntToStr(cxSpinEdit1.Value)+'/'+'0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'-';
         prefix_reestr   := IntToStr(cxSpinEdit1.Value)+'-'+'0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'/';
    end
    else
    begin
         date_beg_period := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
         prefix          := kod_system+'-'+IntToStr(cxSpinEdit1.Value)+'/'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'-';
         prefix_reestr   := IntToStr(cxSpinEdit1.Value)+'-'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'/';
    end;
    date_end_period_tmp             := IncMonth(date_beg_period,1);
    date_end_period                 := IncDay(date_end_period_tmp,-1);

    DataSetCount.Close;
    DataSetCount.SQLs.SelectSQL.Text := 'select distinct count(*) as count_rest from j4_dt_ao j where j.date_ao>='''+datetostr(date_beg_period)+ ''' and j.date_ao<='''+datetostr(date_end_period)+''' and j.id_j4_sp_jo='+inttostr(id_system)+' and (not (exists(select*from j4_reestr_month_man rmm where rmm.id_ao=j.id_ao)))';
    DataSetCount.Open;

    DataSetMainReestr.Close;
    DataSetMainReestr.SQLs.SelectSQL.Text := 'SELECT * FROM J4_REESTR_MONTH_SEL('+inttostr(id_system)+','''+dateToStr(date_beg_period)+''')';
    DataSetMainReestr.Open;

    DataSetMan.Close;
    DataSetMan.SQLs.SelectSQL.Text := 'Select * from J4_REESTR_MONTH_MAN_SEL(?ID_REESTR_MONTH)';
    DataSetMan.Open;
end;


procedure TfrmAvanceReestrMain.cxComboBoxSystemClick(Sender: TObject);
var
    i : integer;
begin
        i := cxComboBoxSystem.ItemIndex;
        if id_system <> IndSystem[i] then
        begin
           id_system        := IndSystem[i];
            DataSetSelectSystem.Close;
            DataSetSelectSystem.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SP_JO WHERE ID_J4_SP_JO = '+ QuotedStr(IntToStr(id_system))+'';
            DataSetSelectSystem.Open;
            kod_system       := DataSetSelectSystem.FieldByName('KOD').AsString;
            Caption          := DataSetSelectSystem.FieldByName('FULL_NAME').AsString;

            //DataSetSelect.Close;
            //DataSetSelect.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
           // DataSetSelect.Open;
            //cxDateBegin.Date := IncDay(date, -DataSetSelect.FieldByName('J4_DAY_SHOW_LAST').AsInteger);
            //cxDateBegin.Date := StrToDate('01'+copy(cxDateBegin.text, 3, 8));
            //date_beg         := cxDateBegin.Date;
            //cxDateBegin.Date := DataSetSelectSystem.FieldByName('DATA_OPEN').AsDateTime;
            //date_beg         := DataSetSelectSystem.FieldByName('DATA_OPEN').AsDateTime;
            //ActionRefreshExecute(Sender);
        end;
end;

procedure TfrmAvanceReestrMain.ActionAddReestrExecute(Sender: TObject);
var
    T : TfrmAvanceAddReestr;
begin
    T := TfrmAvanceAddReestr.Create(Self, Database, Self, Add);
    T.ShowModal;
    T.Free;
end;

procedure TfrmAvanceReestrMain.ActionRefreshExecute(Sender: TObject);
begin
    if cxComboBoxMonth.ItemIndex < 10 then
    begin
         date_beg_period := StrToDate('01.0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
         prefix          := kod_system+'-'+IntToStr(cxSpinEdit1.Value)+'/'+'0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'-';
         prefix_reestr   := IntToStr(cxSpinEdit1.Value)+'-'+'0'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'/';
    end
    else
    begin
         date_beg_period := StrToDate('01.'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
         prefix          := kod_system+'-'+IntToStr(cxSpinEdit1.Value)+'/'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'-';
         prefix_reestr   := IntToStr(cxSpinEdit1.Value)+'-'+IntTostr(cxComboBoxMonth.ItemIndex+1)+'/';
    end;


    date_end_period_tmp             := IncMonth(date_beg_period,1);
    date_end_period                 := IncDay(date_end_period_tmp,-1);

    DataSetCount.Close;
    DataSetCount.SQLs.SelectSQL.Text := 'select distinct count(*) as count_rest from j4_dt_ao j where j.date_ao>='''+datetostr(date_beg_period)+ ''' and j.date_ao<='''+datetostr(date_end_period)+''' and j.id_j4_sp_jo='+inttostr(id_system)+' and (not (exists(select*from j4_reestr_month_man rmm where rmm.id_ao=j.id_ao)))';
    DataSetCount.Open;

    DataSetMainReestr.Close;
    DataSetMainReestr.SQLs.SelectSQL.Text := 'SELECT * FROM J4_REESTR_MONTH_SEL('+inttostr(id_system)+','''+dateToStr(date_beg_period)+''')';
    DataSetMainReestr.Open;

    DataSetMan.Close;
    DataSetMan.SQLs.SelectSQL.Text := 'Select * from J4_REESTR_MONTH_MAN_SEL(?ID_REESTR_MONTH)';
    DataSetMan.Open;

end;

procedure TfrmAvanceReestrMain.ActionChangeReestrExecute(Sender: TObject);
var
    T : TfrmAvanceAddReestr;
begin
    T := TfrmAvanceAddReestr.Create(Self, Database, Self, Change);
    T.ShowModal;
    T.Free;
end;

procedure TfrmAvanceReestrMain.ActionDeleteReestrExecute(Sender: TObject);
var
    id : integer;
    error_message : integer;
begin
    if not DataSetMainReestr.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL +' реєстр №'+DataSetMainReestr.fbn('num_reestr').AsString+'?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
        begin
            StoredProc.Database         := Database;
            StoredProc.Transaction      := Transaction;

            try
                id := DataSetMainReestr.fieldByName('id_reestr_month').AsInteger;

                StoredProc.StoredProcName := 'J4_REESTR_MONTH_DEL';
                StoredProc.Prepare;
                StoredProc.ParamByName('id_reestr_month').AsInt64 := id;
                StoredProc.ExecProc;
                error_message   := StoredProc.ParamByName('result_er').value;
                if (error_message =1) then
                begin
                    showmessage('Неможливо видалити реєстр, який містить записи!');
                    exit;
                end;
                Transaction.Commit;
            except
                begin
                   Transaction.Rollback;
                end;
            end;
        ActionRefreshExecute(Sender);
        end;
    end;
end;

procedure TfrmAvanceReestrMain.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure TfrmAvanceReestrMain.ActionAddManExecute(Sender: TObject);
var
    T : TfrmAvanceAddMan;
    num_avance_beg_out, num_avance_end_out : string;
    num_avance_b_tmp, num_avance_e_tmp : string;
    id_sch_out : int64;
    flag_sch_out, flag_num_out :integer;
    l_beg, l_end : integer;
begin
   if(not DataSetMainReestr.Isempty) then
   begin
     if ShowAvanceReestrFltr(Database,date_beg_period, prefix, num_avance_beg_out,num_avance_end_out,id_sch_out,flag_num_out, flag_sch_out) then
     begin
        fl_num        := flag_num_out;
        if(fl_num =1) then
        begin
            l_beg := Length(num_avance_beg_out);
            l_end := Length(num_avance_end_out);
            if(l_beg=0) then  num_avance_b := '00000'+num_avance_beg_out;
            if(l_beg=1) then  num_avance_b := '0000'+num_avance_beg_out;
            if(l_beg=2) then  num_avance_b := '000'+num_avance_beg_out;
            if(l_beg=3) then  num_avance_b := '00'+num_avance_beg_out;
            if(l_beg=4) then  num_avance_b := '0'+num_avance_beg_out;
            if(l_beg=5) then  num_avance_b := num_avance_beg_out;
            if(l_end=0) then  num_avance_e := '00000'+num_avance_end_out;
            if(l_end=1) then  num_avance_e := '0000'+num_avance_end_out;
            if(l_end=2) then  num_avance_e := '000'+num_avance_end_out;
            if(l_end=3) then  num_avance_e := '00'+num_avance_end_out;
            if(l_end=4) then  num_avance_e := '0'+num_avance_end_out;
            if(l_end=5) then  num_avance_e := num_avance_end_out;
        end;

        id_sch        := id_sch_out;
        fl_sch        := flag_sch_out;
        if(not DataSetMainReestr.Isempty) then
        begin
            T := TfrmAvanceAddMan.Create(Self, Database, Self);
            T.ShowModal;
            T.Free;
        end;
    end;
   end;
end;

procedure TfrmAvanceReestrMain.ActionAddManAllExecute(Sender: TObject);
var
    id_reestr_man_tmp, id_reestr_month_tmp : int64;
    num_avance_beg_out, num_avance_end_out : string;
    num_avance_b_tmp, num_avance_e_tmp : string;
    id_sch_out : int64;
    flag_sch_out, flag_num_out :integer;
    l_beg, l_end : integer;
    T : TfmUn_Progress_form;
begin
   if(not DataSetMainReestr.Isempty) then
   begin
        if ShowAvanceReestrFltr(Database,date_beg_period, prefix, num_avance_beg_out,num_avance_end_out,id_sch_out,flag_num_out, flag_sch_out) then
        begin
            fl_num        := flag_num_out;
            if(fl_num =1) then
            begin
                l_beg := Length(num_avance_beg_out);
                l_end := Length(num_avance_end_out);
                if(l_beg=0) then  num_avance_b := '00000'+num_avance_beg_out;
                if(l_beg=1) then  num_avance_b := '0000'+num_avance_beg_out;
                if(l_beg=2) then  num_avance_b := '000'+num_avance_beg_out;
                if(l_beg=3) then  num_avance_b := '00'+num_avance_beg_out;
                if(l_beg=4) then  num_avance_b := '0'+num_avance_beg_out;
                if(l_beg=5) then  num_avance_b := num_avance_beg_out;
                if(l_end=0) then  num_avance_e := '00000'+num_avance_end_out;
                if(l_end=1) then  num_avance_e := '0000'+num_avance_end_out;
                if(l_end=2) then  num_avance_e := '000'+num_avance_end_out;
                if(l_end=3) then  num_avance_e := '00'+num_avance_end_out;
                if(l_end=4) then  num_avance_e := '0'+num_avance_end_out;
                if(l_end=5) then  num_avance_e := num_avance_end_out;
            end;
            id_sch        := id_sch_out;
            fl_sch        := flag_sch_out;

            T := TfmUn_Progress_form.Create(self, wait_, Un_R_file_Alex.J4_WAIT_DANN);
            T.Show;
            T.Update;

            DataSetManAll.Close;
            DataSetManAll.SQLs.SelectSQL.Text := 'SELECT * FROM J4_DT_SELECT_FOR_REESTR('''+dateToStr(date_beg_period)+''','+inttostr(id_system)+','''+dateToStr(date_end_period)+''')';
            if (fl_sch=1) then
            begin
                DataSetManAll.SQLs.SelectSQL.Add('where id_sch='+inttostr(id_sch)+'');
            end;

            if (fl_num=1) then
            begin
                if(fl_sch=1)  then
                begin
                    DataSetManAll.SQLs.SelectSQL.Add('and R_NUM_AO >='''+num_avance_b+'''');
                    DataSetManAll.SQLs.SelectSQL.Add('and R_NUM_AO <='''+num_avance_e+'''');
                end else
                begin
                    DataSetManAll.SQLs.SelectSQL.Add('where R_NUM_AO >='''+num_avance_b+'''');
                    DataSetManAll.SQLs.SelectSQL.Add('and R_NUM_AO <='''+num_avance_e+'''');
                end;
            end;
            DataSetManAll.Open;
            DataSetManAll.FetchAll;
            DataSetManAll.First;

            id_reestr_month_tmp := DataSetMainReestr['id_reestr_month'];
            while not DataSetManAll.Eof do
            begin
                TransactionManAll.StartTransaction;
                try
                    StoredProc.StoredProcName := 'J4_REESTR_MONTH_MAN_INS';
                    StoredProc.Prepare;
                    StoredProc.ParamByName('id_reestr_month').AsInteger    :=  id_reestr_month_tmp;
                    StoredProc.ParamByName('id_ao').AsInt64                := DataSetManAll.FieldByName('ID_AO').AsVariant;

                    StoredProc.ExecProc;

                    id_reestr_man_tmp                                      := StoredProc.ParamByName('id_reestr_month_man').value;

                    TransactionManAll.Commit;
                    ActionRefreshExecute(Sender);
                    DataSetMainReestr.Locate('id_reestr_month',id_reestr_month_tmp,[]);
                    DataSetMan.Locate('id_reestr_month_man', id_reestr_man_tmp, []);

                except
                    begin
                        TransactionManAll.Rollback;
                        Showmessage('При додаванні виникла помилка');
                        exit;
                    end;
                end;
                DataSetManAll.next;
            end;
              T.Free;
            if(DataSetManAll.Isempty) then
            begin
                //T.Free;
                showmessage(Un_R_file_Alex.J4_NO_FIND_AO);
                exit;
            end;
        end;
    end;
end;

procedure TfrmAvanceReestrMain.ActionDeleteManExecute(Sender: TObject);
var
    id : integer;
    error_message : integer;
begin
    if not DataSetMainReestr.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL +' авансовий звіт №'+DataSetMan.fbn('ALL_NUMBER').AsString+'?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
        begin
            StoredProc.Database         := Database;
            StoredProc.Transaction      := Transaction;

            try
                id := DataSetMan.fieldByName('ID_REESTR_MONTH_MAN').AsInteger;

                StoredProc.StoredProcName := 'J4_REESTR_MONTH_MAN_DEL';
                StoredProc.Prepare;
                StoredProc.ParamByName('id_reestr_month_man').AsInteger := id;
                StoredProc.ExecProc;
                Transaction.Commit;
            except
                begin
                   Transaction.Rollback;
                end;
            end;
        ActionRefreshExecute(Sender);
        end;
    end;
end;

procedure TfrmAvanceReestrMain.ActionPrintReestrExecute(Sender: TObject);
var
    reestr_month : integer;
begin
     reestr_month := DataSetMainReestr['id_reestr_month'];

     Transaction.StartTransaction;
     DataSetManAll.Close;
     DataSetManAll.SQLs.SelectSQL.Text := 'SELECT * FROM J4_REESTR_MONTH_MAN_SEL('+inttostr(reestr_month)+')';

     DataSetManAll.Open;


     ReportReestr.LoadFromFile(ExtractFilePath(Application.ExeName)+ 'Reports\Avance\Avance_reestr_month.fr3');

     ReportReestr.Variables['month_oo']     := QuotedStr(cxComboBoxMonth.Text);
     ReportReestr.Variables['year_oo']      := IntToStr(cxSpinEdit1.Value);
     ReportReestr.Variables['dolgnost']     := QuotedStr(DataSetMainReestr['NAME_POST_PRINT']);
     ReportReestr.Variables['fio_bugh']     := QuotedStr(DataSetMainReestr['FIO_FULL_PRINT']);
     ReportReestr.PrepareReport(true);
     //ReportReestr.designreport;
     ReportReestr.ShowReport(true);

    // Transaction.Commit;
end;

procedure TfrmAvanceReestrMain.ActionDelAllExecute(Sender: TObject);
var
    id : integer;
    error_message : integer;
begin
    if not DataSetMainReestr.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL +' усі авансові звіти реєстру №'+DataSetMainReestr.fbn('ALL_NUM').AsString+'?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO)=mrYes then
        begin
            StoredProc.Database         := Database;
            StoredProc.Transaction      := Transaction;

            try
                id := DataSetMainReestr['id_reestr_month'];

                StoredProc.StoredProcName := 'J4_REESTR_MONTH_MAN_DEL_ALL';
                StoredProc.Prepare;
                StoredProc.ParamByName('id_reestr_month').AsInteger := id;
                StoredProc.ExecProc;
                Transaction.Commit;
            except
                begin
                   Transaction.Rollback;
                end;
            end;
        ActionRefreshExecute(Sender);
        end;
    end;
end;

end.
