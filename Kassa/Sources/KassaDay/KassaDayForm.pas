unit KassaDayForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet, ActnList,
  cxGridTableView, ImgList, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  ComCtrls, ToolWin, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSplitter, cxContainer,
  cxLabel, ExtCtrls, FIBDatabase, pFIBDatabase, KassaDayClass, Un_R_file_Alex,
  GlobalSPR, Un_lo_file_Alex, cxCalendar, cxCheckBox, dxStatusBar, Placemnt, Registry;
                 
type
  TfmShowDay = (Show, Edit);

  TfmKassaDayForm = class(TForm)
    Panel1: TPanel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxSplitter1: TcxSplitter;
    cxGridDay: TcxGrid;
    cxGridDayDBTableView1: TcxGridDBTableView;
    cxGridDayDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDayDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDayDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDayDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDayDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDayLevel1: TcxGridLevel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolBar2: TToolBar;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    Panel2: TPanel;
    cxLabel1: TcxLabel;
    cxComboBox1: TcxComboBox;
    ImageList: TImageList;
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
    ActionList: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    ActionFind: TAction;
    ActionCancel: TAction;
    DataSetDay: TpFIBDataSet;
    DataSetKass: TpFIBDataSet;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DataSourceDay: TDataSource;
    DataSetSelect: TpFIBDataSet;
    ActionTakeDoc: TAction;
    DataSetMax_day: TpFIBDataSet;
    ToolButton6: TToolButton;
    ActionPrint: TAction;
    cxDateEditBegin: TcxDateEdit;
    cxDateEditEnd: TcxDateEdit;
    cxCheckBoxWith: TcxCheckBox;
    cxCheckBoxTo: TcxCheckBox;
    DataSetDayID_DT_DAY: TFIBBCDField;
    DataSetDayID_SP_KASS: TFIBBCDField;
    DataSetDayDAY_KASSA: TFIBDateField;
    DataSetDaySALDO_BEGIN: TFIBBCDField;
    DataSetDaySALDO_END: TFIBBCDField;
    DataSetDaySUM_DEBET: TFIBBCDField;
    DataSetDaySUM_KREDIT: TFIBBCDField;
    DataSetDayBLOK_DEB: TFIBIntegerField;
    DataSetDayBLOK_KREDIT: TFIBIntegerField;
    DataSetDayID_USER_BLOK: TFIBBCDField;
    DataSetDayDATE_CLOSE_DAY: TFIBDateTimeField;
    DataSetDayID_USER_CLOSE_DAY: TFIBBCDField;
    DataSetDayCOL_PRIHOD: TFIBIntegerField;
    DataSetDayCOL_RASHOD: TFIBIntegerField;
    DataSetDayBLOK_SALDO_END: TFIBIntegerField;
    cxGridDayDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDayDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDayDBTableView1DBColumn8: TcxGridDBColumn;
    DataSetDayFIO_USER_OBOROT: TFIBStringField;
    DataSetDayFIO_USER_SALDO: TFIBStringField;
    DataSetDaySCH_BLOCK: TFIBIntegerField;
    DataSetDaySCH_CLOSE: TFIBIntegerField;
    cxGridDayDBTableView1DBColumn9: TcxGridDBColumn;
    cxGridDayDBTableView1DBColumn10: TcxGridDBColumn;
    cxLabel7: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    cxLabel8: TcxLabel;
    DataSetDayPARAM_PRINT: TFIBStringField;
    ActionShowSaldo: TAction;
    ToolButton7: TToolButton;
    FormStorage1: TFormStorage;
    DataSetDayPARAM_PRINT_VAR2: TFIBStringField;
    ActionShowInfo: TAction;
    ToolButton8: TToolButton;
    ActionInvoice: TAction;
    DataSetDayPARAM_PRINT_KAS_BOOK: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure DataSetDayAfterScroll(DataSet: TDataSet);
    procedure cxGridDayDBTableView1DblClick(Sender: TObject);
    procedure cxComboBox1Editing(Sender: TObject; var CanEdit: Boolean);
    procedure cxComboBox1Click(Sender: TObject);
    procedure ActionTakeDocExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure cxCheckBoxWithClick(Sender: TObject);
    procedure cxCheckBoxToClick(Sender: TObject);
    procedure cxDateEditEndFocusChanged(Sender: TObject);
    procedure cxDateEditBeginFocusChanged(Sender: TObject);
    procedure cxGridDayDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionShowSaldoExecute(Sender: TObject);
    procedure ActionShowInfoExecute(Sender: TObject);
    procedure ActionInvoiceExecute(Sender: TObject);
  private
    Ind1 : array of Int64;
    fl : boolean;
    d_end, d_beg : string;
    min_date, max_date : Tdate;
    main_saldo : integer;
    otchet_com_show: integer;
  public
    id_kassa : int64;
    myclass : TMainKassaDayClass;
    flag : TfmShowDay;
    id_user, kas_book_count_page : Integer;
//    ResValue : Variant;
    constructor Create(AOwner: TComponent; mclass: TMainKassaDayClass; m : TfmShowDay); reintroduce; overload;
  end;


implementation
uses KassaDayAdd, PFormDay, KassaDayInfoReport, DateUtils, Accmgmt, KassaInvoice;
{$R *.dfm}

{ TfmKassaDayForm }

constructor TfmKassaDayForm.Create(AOwner: TComponent;
  mclass: TMainKassaDayClass; m: TfmShowDay);
var
    i, item_index : int64;
    reg : TRegistry;
    val : string;
begin
    inherited Create (AOwner);
    myclass := mclass;
    //FormStorage1.RestoreFormPlacement;
    Database := myclass.Class_Database;
    Transaction := myclass.Class_Transaction_R;
{    if MonthOf(Date) < 10
        then date_beg := '01.'+'0'+ IntToStr(MonthOf(Date)) + '.'+ IntToStr(YearOf(Date))
        else date_beg := '01.'+ IntToStr(MonthOf(Date)) + '.' + IntToStr(YearOf(Date));
    date_end := date;
    cxDateEditBegin.date := StrTodate(date_beg);
    cxDateEditEnd.date   := date_end;
 }
    Caption                      := Un_R_file_Alex.KASSA_DAY_CAPTION;
    ActionAdd.Caption            := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionPrint.Caption          := Un_R_file_Alex.MY_BUTTON_PRINT;
//    ActionHelp.Caption           := Un_R_file_Alex.PUB_BUTTON_HELP;
    ActionExit.Caption           := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionChange.Caption         := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption         := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionRefresh.Caption        := Un_R_file_Alex.MY_BUTTON_REFRESH;
//    ActionPrint.Caption          := Un_R_file_Alex.PUB_BUTTON_PRINT;
    ActionCancel.Caption         := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
    ActionShowSaldo.Caption      := '';
    ActionInvoice.Caption        := Un_R_file_Alex.BANK_INVOICE;
    cxLabel1.Caption             := Un_R_file_Alex.KASSA_DOC_KASSA;
    cxLabel3.Caption             := Un_R_file_Alex.KASSA_DAY_KOL_PRIH;
//    Label6.caption               := Un_R_file_Alex.AUTOKOD_FORM_TOVAR_CAPTION;
    cxCheckBoxWith.Properties.Caption  := Un_R_file_Alex.KASSA_FIND_CAP_2;
    cxCheckBoxTo.Properties.Caption    := Un_R_file_Alex.KASSA_FIND_CAP_3;

    cxGridDayDBTableView1DBColumn1.Caption              := Un_R_file_Alex.KASSA_DAY_CAPTION;
    cxGridDayDBTableView1DBColumn2.Caption              := Un_R_file_Alex.KASSA_DAY_SALDO_BEGIN;
    cxGridDayDBTableView1DBColumn3.Caption              := Un_R_file_Alex.KASSA_DAY_SALDO_END;
    cxGridDayDBTableView1DBColumn4.Caption              := Un_R_file_Alex.KASSA_DAY_SUM_DEBET;
    cxGridDayDBTableView1DBColumn5.Caption              := Un_R_file_Alex.KASSA_DAY_SUM_KREDIT;

    dxStatusBar1.Panels[0].Text                  := 'Ins - '    + Un_R_file_Alex.MY_BUTTON_ADD;
    dxStatusBar1.Panels[1].Text                  := 'F2 - '     + Un_R_file_Alex.MY_BUTTON_EDIT;
    dxStatusBar1.Panels[2].Text                  := 'Del - '    + Un_R_file_Alex.MY_BUTTON_DELETE;
    dxStatusBar1.Panels[3].Text                  := 'F5 - '     + Un_R_file_Alex.MY_BUTTON_REFRESH;
    dxStatusBar1.Panels[4].Text                  := 'Esc - '    + Un_R_file_Alex.MY_BUTTON_CLOSE;
    dxStatusBar1.Panels[5].Text                  := 'Ctrl+P - ' + Un_R_file_Alex.MY_ACTION_PRINT_CONST;

    cxLabel6.Caption :=   Un_R_file_Alex.KASSA_USER_PODPIS;

//    DataSetUnderVetka.SQLs.SelectSQL.Text := 'select * from MAT_SP_AUTOKOD_UNDER_VETKA(?ID_VETKA)';
//    DataSetVetka.SQLs.SelectSQL.Text := 'SELECT * FROM MAT_SP_AUTOKOD_SELECT_VETKA(?ID_VETKA)';

    val := 'Ok';
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\odlas_niam\',False) then
        begin
            val := reg.ReadString('val');
        end;
    finally
        reg.Free;
    end;
    if Val = 'Ok' then
    begin
        main_saldo := 1;
        cxGridDayDBTableView1.Styles.Background.Color := $00E7FFFF;
    end else
    begin
        main_saldo := 0;
        cxGridDayDBTableView1.Styles.Background.Color := $00AAE8C8;
    end;

    if main_saldo = 1
        then ActionShowSaldo.Caption := Un_R_file_Alex.KASSA_SALDO_MAIN_NO
        else ActionShowSaldo.Caption := Un_R_file_Alex.KASSA_SALDO_MAIN_YES;

    datasetselect.Database := Database;
    DatasetSelect.Transaction := Database.DefaultTransaction;

    DataSetMax_day.Database := Database;
    DataSetMax_day.Transaction := Database.DefaultTransaction;

    DatasetSelect.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_INI_INSTALL';
    DataSetSelect.Open;
    d_end := dateToStr(date);
    max_date := StrToDate('31.12.2999');
    min_date := DataSetSelect.fIELDbYnAME('DATE_INSTALL_KASSA').AsDateTime;
    d_beg    := DateToStr(IncDay(date, -DataSetSelect.fIELDbYnAME('KASSA_DAY_SHOW_LAST').AsInteger));
    cxDateEditBegin.date := StrTodate(d_beg);
    cxDateEditEnd.date   := StrToDate(d_end);

    otchet_com_show      := DataSetSelect.FieldByName('OTCHET_COMMENT_SHOW').AsInteger;
    kas_book_count_page  := DataSetSelect.FieldByName('kas_book_count_page').AsInteger;

    if DataSetSelect['ID_KASSA_LOAD'] > 0 then
    begin
        id_kassa := StrToInt64(DataSetSelect.fbn('ID_KASSA_LOAD').AsString);
    end else
    begin
        MessageBox(Handle, Pchar(Un_R_file_Alex.KASSA_DONT_LOAD_KASSA), Pchar(Un_R_file_Alex.KASSA_WARNING), 16);
        Close;
        exit;
    end;


    DataSetKass.Database := Database;
    DataSetKass.Transaction := Database.DefaultTransaction;
    DataSetKass.Transaction.StartTransaction;
    {DataSetKass.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SP_KASS';
    DataSetKass.Open;
    DataSetKass.FetchAll;}

    id_user := myclass.id_user;
    DataSetKass.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_CHOOSE_KASSA_BY_ID('+IntToStr(id_user)+')';
    DataSetKass.Open;
    DataSetKass.FetchAll;
    if  DataSetKass.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.KASSA_CLOSE_JORNAL), PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_MESSAGA), 16);
        close;
    end;

    SetLength(Ind1, Datasetkass.RecordCount);
    DataSetKass.First;

    id_kassa := StrToInt64(DataSetKass.fbn('ID_SP_KASS').AsString);

    i := 0;
    cxComboBox1.Properties.Items.Clear;
    while not DatasetKass.Eof do
    begin
        Ind1[DataSetKass.RecNo - 1] := StrToInt64(DataSetKass.fbn('ID_SP_KASS').AsString);
        if (StrToInt64(DataSetKass.fbn('ID_SP_KASS').AsString) = id_kassa) then i := DataSetKass.RecNo - 1;
        //else id_kassa := StrToInt64(DataSetKass.fbn('ID_SP_KASS').AsString);
        CxComboBox1.Properties.Items.Insert(DataSetKass.RecNo - 1, DataSetKass['SHORT_NAME_KASS']);
        DataSetKass.Next;
    end;
    cxComboBox1.ItemIndex := i;

    DataSetDay.Database := Database;
    DataSetDay.Transaction := Database.DefaultTransaction;
    DataSetDay.Transaction.Active := true ;
    DataSetDay.Close;
    DataSetDay.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DAY_FOR_KASSA('+IntToStr(id_kassa)+', '''+cxDateEditBegin.Text+''', '''+cxDateEditEnd.Text+''', '+IntToStr(main_saldo)+')';
    DataSetDay.open;
    DataSetDay.last;

    DataSetDay.Locate('ID_DT_DAY', TFIBBCDField(DataSetDay.FieldByName('ID_DT_DAY')).AsInt64, []);

    fl := true;
    cxCheckBoxWith.Checked       := true;

//    cxDBTreeListMain.FullCollapse;
{    if myclass.myposicirovanie > 0
    then i := myclass.myposicirovanie
    else i := 2;
    DataSetTreeMain.Locate('ID_VETKA', i, []);
 }
end;

procedure TfmKassaDayForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    DataSetDay.Close;
    DataSetKass.Close;
    if FormStyle = fsMDIChild then
    begin
        Action := caFree;
        myclass.Free;
    end;
    //FormStorage1.SaveFormPlacement;
end;

procedure TfmKassaDayForm.ActionExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmKassaDayForm.ActionCancelExecute(Sender: TObject);
begin
//
end;

procedure TfmKassaDayForm.ActionRefreshExecute(Sender: TObject);
var
    date_b, date_e : string;
begin
    if cxCheckBoxWith.Checked then
    begin
        date_b := cxDateEditBegin.Text;
    end else
    begin
        date_b := DateToStr(min_date);
    end;
    if cxCheckBoxTo.Checked then
    begin
        date_e := cxDateEditEnd.Text;
    end else
    begin
        date_e := DateToStr(max_date);
    end;
    DataSetDay.Close;
    DataSetDay.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DAY_FOR_KASSA('+IntToStr(id_kassa)+', '''+date_b+''', '''+date_e+''', '+IntToStr(main_saldo)+')';
    DataSetDay.open;
    DataSetDay.last;
end;

procedure TfmKassaDayForm.ActionDeleteExecute(Sender: TObject);
var
    id_del, id_prev : int64;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    if DataSetDay.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.N_AUTOKOD_FORM_ERROR_DEL), PChar(Un_R_file_Alex.KASSA_WARNING), 16);
        exit;
    end
    else begin
        if MessageBox(Handle,Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL+' - '+datasetday.FieldByName('DAY_KASSA').AsString), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), MB_YESNO + MB_DEFBUTTON2)=mrYes
        then
        begin
            // удаление дн€
            id_del := DataSetDay['ID_DT_DAY'];
            cxGridDayDBTableView1.Controller.GoToPrev(false);
            id_prev := DataSetDay['ID_DT_DAY'];

            myclass.DeleteDay(id_del, id_kassa);

            ActionRefreshExecute(Sender);
            DataSetday.Locate('ID_DT_DAY',id_prev, []);
        end;
    end;
end;

procedure TfmKassaDayForm.ActionAddExecute(Sender: TObject);
var
    T : TfmKassaDayAdd;
    error : integer;
begin
    decimalseparator := ',';
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
//    DataSetMax_day.Transaction.StartTransaction;
    DataSetMax_day.Close;
    DataSetMax_day.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_SALDO_END('+IntTostr(id_kassa)+')';
    DataSetMax_day.Open;
    if DataSetMax_day['SALDO_END'] = null then
        T := TfmKassaDayAdd.Create(Self, Self, Myclass, Add_Day, '0,00')
    else
        T := TfmKassaDayAdd.Create(Self, Self, Myclass, Add_Day, DataSetMax_day['SALDO_END']);
    T.ShowModal;
    T.Free;
    DataSetMax_day.Close;
end;

procedure TfmKassaDayForm.ActionChangeExecute(Sender: TObject);
Var
    T : TfmKassaDayAdd;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    T := TfmKassaDayAdd.Create(self, Self, myclass, Change_Day, '0');
    T.ShowModal;
    T.Free;
end;

procedure TfmKassaDayForm.DataSetDayAfterScroll(DataSet: TDataSet);
begin
    if not VarIsNull(DataSetDay['COL_PRIHOD'])
        then cxLabel4.Caption := DataSetDayCOL_PRIHOD.AsString + Un_R_file_Alex.PRIHODNIH
        else cxLabel4.Caption := '0' + Un_R_file_Alex.PRIHODNIH;
    if not VarIsNull(DataSetDay['COL_RASHOD'])
        then cxLabel5.Caption := DataSetDayCOL_RASHOD.AsString + Un_R_file_Alex.RASHODNIH
        else cxLabel5.Caption := '0' + Un_R_file_Alex.RASHODNIH;
    if not VarIsNull(DataSetDay['FIO_USER_SALDO'])
        then cxLabel7.Caption := DataSetDay['FIO_USER_SALDO']
        else begin
            if not VarIsNull(DataSetDay['FIO_USER_OBOROT'])
                then cxLabel7.Caption := DataSetDay['FIO_USER_OBOROT']
                else cxLabel7.Caption := Un_R_file_Alex.KASSA_PRINT_WITHOUT_PODPIS;
        end;
    cxLabel2.Caption := '';
    if (DataSetDay['BLOK_DEB'] = 1)    then cxLabel2.Caption := Un_R_file_Alex.KASSA_BLOCK_DEBET;
    if (DataSetDay['BLOK_KREDIT'] = 1) then cxLabel2.Caption := Un_R_file_Alex.KASSA_BLOCK_KREDIT;
    if (DataSetDay['BLOK_KREDIT'] = 1) and (DataSetDay['BLOK_DEB'] = 1) then cxLabel2.Caption := Un_R_file_Alex.KASSA_BLOCK_DEBET + '               ' + Un_R_file_Alex.KASSA_BLOCK_KREDIT;
    if (DataSetDay['BLOK_SALDO_END'] = 1) then cxLabel2.Caption := Un_R_file_Alex.KASSA_BLOCK_SALDO_END;
    if OTCHET_COM_SHOW=1 then
    begin
        try cxLabel8.Caption := DataSetDay.FieldByName('PARAM_PRINT').AsString  except cxLabel8.Caption := ''; end;
    end else
    if OTCHET_COM_SHOW=2 then
    begin
        try cxLabel8.Caption := DataSetDay.FieldByName('PARAM_PRINT_VAR2').AsString  except cxLabel8.Caption := ''; end;
    end;

    if OTCHET_COM_SHOW=3 then
    begin
        try cxLabel8.Caption := DataSetDay.FieldByName('param_print_kas_book').AsString  except cxLabel8.Caption := ''; end;
    end;
end;

procedure TfmKassaDayForm.cxGridDayDBTableView1DblClick(Sender: TObject);
begin
    if not DataSetDay.IsEmpty then
    begin
        ActionTakeDocExecute(Sender);
    end;
end;

procedure TfmKassaDayForm.cxComboBox1Editing(Sender: TObject;
  var CanEdit: Boolean);
//var
//    i : integer;
begin
 {   if fl then
    begin
        i := CxComboBox1.ItemIndex;
        if id_kassa <> Ind1[i] then
            id_kassa := Ind1[i];

        DataSetDay.Close;
        DataSetDay.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DAY_FOR_KASSA('+IntToStr(id_kassa)+')';
        DataSetDay.open;
    end;}
end;

procedure TfmKassaDayForm.cxComboBox1Click(Sender: TObject);
var
    i : integer;
begin
    if fl then
    begin
        i := CxComboBox1.ItemIndex;
        if id_kassa <> Ind1[i] then
            id_kassa := Ind1[i];
        DataSetDay.Close;
        DataSetDay.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DAY_FOR_KASSA('+IntToStr(id_kassa)+', '''+cxDateEditBegin.Text+''', '''+cxDateEditEnd.Text+''', '+IntToStr(main_saldo)+')';
        //DataSetDay.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_DAY_FOR_KASSA('+IntToStr(id_kassa)+')';
        DataSetDay.open;
        DataSetDay.last;
    end;
end;

procedure TfmKassaDayForm.ActionTakeDocExecute(Sender: TObject);
var
    res : integer;
    id : int64;
begin
    if cxGridDay.IsFocused then
    begin
        if not DataSetDay.IsEmpty then
        begin
            id :=  TFIBBCDField(DataSetDay.FieldByName('ID_DT_DAY')).AsInt64;
            res := Un_lo_file_Alex.LKassaDocEdit(self, myclass.id_user, Database, id_kassa, id, -1);
            if res = -1 then
            begin
                ActionRefreshExecute(sender);
                DataSetDay.Locate('ID_DT_DAY', id, []);
            end;
        end;
    end;
end;

procedure TfmKassaDayForm.ActionPrintExecute(Sender: TObject);
var
    T : TfmPrintFormDay;
    error : integer;
begin
    if not DataSetDay.IsEmpty then
    begin
        error := fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day','Print');
        if error <> 0 then
        begin
            MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_ERROR_DONT_WORK), 16);
            exit;
        end;
        T := TfmPrintFormDay.Create(self);
        T.ShowModal;
        T.Free;
    end;
end;

procedure TfmKassaDayForm.cxCheckBoxWithClick(Sender: TObject);
begin
    if cxCheckBoxWith.Checked then
    begin
        cxDateEditBegin.Enabled := true;
        cxCheckBoxTo.Enabled    := true;
        cxDateEditEnd.Enabled   := true;
//        cxDateEditBegin.Date    := StrTodate(d_beg);
    end else
    begin
        cxDateEditBegin.Enabled := false;
        cxCheckBoxTo.Enabled    := false;
        cxDateEditEnd.Enabled   := false;
        cxDateEditBegin.Date    := StrToDate('01.01.1900');
    end;
    cxCheckBoxToClick(Sender);
end;

procedure TfmKassaDayForm.cxCheckBoxToClick(Sender: TObject);
begin
    if  cxCheckBoxTo.Checked then
    begin
        cxDateEditEnd.Properties.ReadOnly := false;
        cxDateEditEnd.Enabled             := true;
//        cxDateEditEnd.Date                := StrToDate(d_end);
    end else
    begin
        cxDateEditEnd.Properties.ReadOnly := true;
        cxDateEditEnd.Enabled             := false;
//        cxDateEditEnd.Date                := max_date;
    end;
end;

procedure TfmKassaDayForm.cxDateEditEndFocusChanged(Sender: TObject);
begin
    d_end := DateToStr(cxDateEditEnd.Date);
end;

procedure TfmKassaDayForm.cxDateEditBeginFocusChanged(Sender: TObject);
begin
    d_beg := DateToStr(cxDateEditBegin.Date);
end;

procedure TfmKassaDayForm.cxGridDayDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  if (DayOf(VarToDateTime(AViewInfo.GridRecord.Values[0])) = 1) and (AViewInfo.GridRecord.Values[9]=1) and (not AViewInfo.GridRecord.Focused) then
  begin //1-й день закрытого мес€ца
      ACanvas.Canvas.Font.Color := RGB(255,191,63);//оранжевый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end; //закрытый мес€ц
  if (AViewInfo.GridRecord.Values[9] = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //
      ACanvas.Canvas.Font.Color := RGB(192,192,192);//светло-серый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (DayOf(VarToDateTime(AViewInfo.GridRecord.Values[0])) = 1) and (AViewInfo.GridRecord.Values[8]=1) and (not AViewInfo.GridRecord.Focused) then
  begin //1-й день заблокированного мес€ца
      ACanvas.Canvas.Font.Color := RGB(255,204,102);//оранжевый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (AViewInfo.GridRecord.Values[8] = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //заблокированные счета
      ACanvas.Canvas.Font.Color := RGB(119,119,119);//темно-серый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (DayOf(VarToDateTime(AViewInfo.GridRecord.Values[0])) = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //первый день незаблокированного мес€ца
      ACanvas.Canvas.Font.Color := RGB(204,107,0);//красно-оранжевый;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (AViewInfo.GridRecord.Values[7] = 1) and (not AViewInfo.GridRecord.Focused) then
  begin //заблокированные сальдом
      ACanvas.Canvas.Font.Color := RGB(0,0,255);//синий;
      ACanvas.Canvas.FillRect(Arect);
      exit;
  end;
  if (not AViewInfo.GridRecord.Focused) then
  begin   // остальные
      ACanvas.Canvas.Font.Color := RGB(51,102,0);//темно-зелЄный;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmKassaDayForm.ActionShowSaldoExecute(Sender: TObject);
Var
  reg:TRegistry;
begin
    reg:=TRegistry.Create;
    try
        reg.RootKey:=HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12300006759837\odlas_niam\',true) then
        begin
            if main_saldo = 1
                then begin
                    reg.writeString('val', 'No');
                    main_saldo := 0;
                    ActionShowSaldo.Caption := Un_R_file_Alex.KASSA_SALDO_MAIN_YES;
                    cxGridDayDBTableView1.Styles.Background.Color := $00AAE8C8;
                end
                else begin
                    reg.writeString('val', 'Ok');
                    main_saldo := 1;
                    ActionShowSaldo.Caption := Un_R_file_Alex.KASSA_SALDO_MAIN_NO;
                    cxGridDayDBTableView1.Styles.Background.Color := $00E7FFFF;
                end;
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
    ActionRefreshExecute(Sender);
end;

procedure TfmKassaDayForm.ActionShowInfoExecute(Sender: TObject);
var T : TfmKassaDayInfoReport;
begin
        T := TfmKassaDayInfoReport.Create(self);
        T.ShowModal;
        T.Free;
end;

procedure TfmKassaDayForm.ActionInvoiceExecute(Sender: TObject);
var
    T : TfmKassaInvoice;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Work/Work_doc/Day/Kassa_invoices','Belong');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Accmgmt.AcMgmtErrMsg(error)), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
    T := TfmKassaInvoice.Create(Self, Database, Self);
    T.ShowModal;
    T.Free;
end;

end.
