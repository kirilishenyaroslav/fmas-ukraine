unit MainOstatkiAvanse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxSplitter, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, Menus, cxSpinEdit, cxLabel,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, ComCtrls, ToolWin,
  ImgList, ActnList, FIBQuery, pFIBQuery, pFIBStoredProc, Un_R_file_Alex,
  cxImage, Placemnt;

type
  TRegim = (Multy, Single);
  TVibor = (Group, Tovar, GroupAndtovar);

  TfmMainOstatkiAvance = class(TForm)
    Panel1: TPanel;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    Panel3: TPanel;
    DataSetMain: TpFIBDataSet;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    DataSetProvodka: TpFIBDataSet;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionDelete: TAction;
    ActionChange: TAction;
    ActionExit: TAction;
    ActionCancel: TAction;
    ActionRefresh: TAction;
    Action7: TAction;
    Action8: TAction;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
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
    ActionAdd1: TMenuItem;
    ActionChange1: TMenuItem;
    ActionDelete1: TMenuItem;
    ActionRefresh1: TMenuItem;
    ActionExit1: TMenuItem;
    ActionCancel1: TMenuItem;
    PopupMenu2: TPopupMenu;
    ActionAdd2: TMenuItem;
    ActionChange2: TMenuItem;
    ActionDelete2: TMenuItem;
    ActionRefresh2: TMenuItem;
    ActionExit2: TMenuItem;
    ActionCancel2: TMenuItem;
    DataSource: TDataSource;
    DataSourceProvodka: TDataSource;
    TransactionWrite: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DataSetJornal: TpFIBDataSet;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    Panel4: TPanel;
    cxLabel1: TcxLabel;
    cxComboBoxJornal: TcxComboBox;
    cxLabel2: TcxLabel;
    cxComboBox2: TcxComboBox;
    cxLabel3: TcxLabel;
    cxSpinEdit1: TcxSpinEdit;
    DataSetMainID_MAN: TFIBBCDField;
    DataSetMainID_OSTATOK: TFIBBCDField;
    DataSetMainDATE_REG: TFIBDateField;
    DataSetMainSUM_DEBET: TFIBBCDField;
    DataSetMainSUM_KREDIT: TFIBBCDField;
    DataSetMainINPUT_USER: TFIBSmallIntField;
    DataSetMainFIO: TFIBStringField;
    DataSetMainBIRTHDAY: TFIBDateField;
    DataSetMainTIN: TFIBStringField;
    DataSetMainR_J4: TFIBBCDField;
    DataSetMainR_DATE_B: TFIBDateField;
    DataSetMainR_DATE_E: TFIBDateField;
    DataSetProvodkaID_OSTATOK: TFIBBCDField;
    DataSetProvodkaID_SCH: TFIBBCDField;
    DataSetProvodkaID_SMETA: TFIBBCDField;
    DataSetProvodkaID_STATE: TFIBBCDField;
    DataSetProvodkaID_RAZDEL: TFIBBCDField;
    DataSetProvodkaID_KEKV: TFIBBCDField;
    DataSetProvodkaSUM_DEB: TFIBBCDField;
    DataSetProvodkaSUM_KREDIT: TFIBBCDField;
    DataSetProvodkaON_INPUT_USER: TFIBSmallIntField;
    DataSetProvodkaDATE_REG: TFIBDateField;
    DataSetProvodkaKOD_SMETA: TFIBIntegerField;
    DataSetProvodkaKOD_STATE: TFIBIntegerField;
    DataSetProvodkaKOD_RAZ: TFIBIntegerField;
    DataSetProvodkaKOD_KEKV: TFIBIntegerField;
    DataSetProvodkaKOD_SCH: TFIBStringField;
    DataSetProvodkaNAME_SMETA: TFIBStringField;
    DataSetProvodkaNAME_RAZD: TFIBStringField;
    DataSetProvodkaNAME_STATE: TFIBStringField;
    DataSetProvodkaNAME_KEKV: TFIBStringField;
    DataSetProvodkaNAME_SCH: TFIBStringField;
    DataSetProvodkaVVEDENO_POLZOVATELEM: TFIBStringField;
    DataSetProvodkaALL_KOD: TFIBStringField;
    DataSetProvodkaDATE_ZAV_OST: TFIBDateField;
    DataSetProvodkaID_DOG: TFIBBCDField;
    DataSetProvodkaKOD_DOG: TFIBBCDField;
    DataSetProvodkaNUM_DOG: TFIBStringField;
    DataSetProvodkaDATE_DOG: TFIBDateField;
    DataSetProvodkaREG_NUM: TFIBStringField;
    DataSetProvodkaDOGOVOR: TFIBStringField;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    FormStorage1: TFormStorage;
    procedure cxComboBoxJornalClick(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure cxGrid2DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure DataSetMainAfterScroll(DataSet: TDataSet);
    procedure cxGrid2DBTableView1DBColumn4CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Ind1 : array [1..2] of array of Variant;
  public
    ID_JORNAL : int64;
    date_beg, date_end : TDate;
    id_user : iNT64;
    priznak_new_alg : smallint;
    date_new_alg, date_open_sys : TDate;
    id_dog_group,id_dog_group_pr,id_dog_group_rash : int64;
    constructor Create(AOwner: TComponent; id: int64; DB: TpFIBDatabase); reintroduce; overload;
  end;

    function ShowOstatkiAvance(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64): Integer;stdcall;
    exports ShowOstatkiAvance;

implementation
uses AddOstatkiAvance, DateUtils;

{$R *.dfm}

function ShowOstatkiAvance(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; regim : TRegim; vibor : TVibor; posicirovanie : int64): Integer;stdcall;
var
    T : TfmMainOstatkiAvance;
begin
    T := TfmMainOstatkiAvance.Create(AOwner, id_user, DBHandle);
//    T.myvibor := vibor;
//    T.myregim := regim;
//    T.myposicirovanie := posicirovanie;
//    T.FormStyle := fsMDIChild;
    T.ShowModal;
    T.Free;
    ShowOstatkiAvance := -1;
end;

{ TfmMainOstatkiAvance }

constructor TfmMainOstatkiAvance.Create(AOwner: TComponent; id: int64;
  DB: TpFIBDatabase);
var
    i, item_index : integer;
begin
    inherited Create(AOwner);
    FormStorage1.RestoreFormPlacement;
    
    pFIBDatabase1                      := DB;
    pFIBDatabase1.DefaultTransaction   := pFIBTransaction1;
    pFIBTransaction1.DefaultDatabase   := pFIBDatabase1;
    TransactionWrite.DefaultDatabase   := pFIBDatabase1;
    StoredProc.Database                := pFIBDatabase1;
    StoredProc.Transaction             := TransactionWrite;
    StoredProc.Database                := pFIBDatabase1;
    DataSetMain.Database               := pFIBDatabase1;
    DataSetProvodka.Database           := pFIBDatabase1;
    DataSetJornal.Database             := pFIBDatabase1;
    DataSetJornal.Transaction          := pFIBTransaction1;
    id_user := id;

    cxComboBox2.Properties.Items.Insert(0, Un_R_file_Alex.MY_JANUARY);
    cxComboBox2.Properties.Items.Insert(1, Un_R_file_Alex.MY_FEBRIARY);
    cxComboBox2.Properties.Items.Insert(2, Un_R_file_Alex.MY_MARCH);
    cxComboBox2.Properties.Items.Insert(3, Un_R_file_Alex.MY_APRILE);
    cxComboBox2.Properties.Items.Insert(4, Un_R_file_Alex.MY_MAY);
    cxComboBox2.Properties.Items.Insert(5, Un_R_file_Alex.MY_JUNE);
    cxComboBox2.Properties.Items.Insert(6, Un_R_file_Alex.MY_JULY);
    cxComboBox2.Properties.Items.Insert(7, Un_R_file_Alex.MY_AUGUST);
    cxComboBox2.Properties.Items.Insert(8, Un_R_file_Alex.MY_SEPTEMBER);
    cxComboBox2.Properties.Items.Insert(9, Un_R_file_Alex.MY_OCTOBER);
    cxComboBox2.Properties.Items.Insert(10, Un_R_file_Alex.MY_NOVEMBER);
    cxComboBox2.Properties.Items.Insert(11, Un_R_file_Alex.MY_DESEMBER);

    {загрузка журнала}
    DataSetJornal.Close;
    DataSetJornal.SQLs.SelectSQL.Text := 'SELECT * FROM J4_INI';
    DataSetJornal.Open;

    try id_dog_group := DataSetJornal.FieldByName('ID_GROUP').AsInteger; except id_dog_group := 0; end;
    try id_dog_group_pr := DataSetJornal.FieldByName('ID_GROUP_ADD_PR').AsInteger; except id_dog_group_pr := 0; end;
    try id_dog_group_rash := DataSetJornal.FieldByName('ID_GROUP_ADD_RAS').AsInteger; except id_dog_group_rash := 0; end;

    if DataSetJornal.FieldByName('FLAG_NEW_ALGORITHM').asInteger = 1 then {признак нового алгоритма}
    begin
        priznak_new_alg := 1;
        date_new_alg    := DataSetJornal.FieldByName('DATE_NEW_ALGORITHM').AsDateTime;
        cxGrid2DBTableView1DBColumn3.Visible := true;
    end else
    begin
        cxGrid2DBTableView1DBColumn3.Visible := false;
    end;
    {DataSetJornal.Close;
    DataSetJornal.SQLs.SelectSQL.Text := ' SELECT * FROM J4_SP_JO ';
    DataSetJornal.open;
    DataSetJornal.FetchAll;}

    DataSetJornal.Close;
    DataSetJornal.SQLs.SelectSQL.Text := 'SELECT * FROM J4_CHOOSE_SYS_BY_ID('+IntToStr(id_user)+')';
    DataSetJornal.Open;
    DataSetJornal.FetchAll;

    If DataSetJornal.IsEmpty then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.J4_WARNING_LOAD_JORNAL), PChar(Un_R_file_Alex.J4_SP_RAZDELENIE_MESSAGA), 16);
        close;
    end;
    SetLength(Ind1[1], DataSetJornal.RecordCount);
    SetLength(Ind1[2], DataSetJornal.RecordCount);

    DataSetJornal.First;

    i := 0;
    item_index := 0;
    cxComboBoxJornal.Properties.Items.Clear;

    While not DataSetJornal.Eof do
    begin
        Ind1[1,DataSetJornal.RecNo - 1] := DataSetJornal['ID_J4_SP_JO'];
        Ind1[2, DataSetJornal.RecNo - 1] := DataSetJornal.FieldByName('DATA_OPEN').AsDateTime;
        cxComboBoxJornal.Properties.Items.Add(DataSetJornal.FieldByName('SHORT_NAME').AsString);
        IF DataSetJornal.FieldByName('SYSTEM_OPEN').Asinteger = 1 THEN
        begin
            //kod_system       := DataSetSelectSystem.FieldByName('KOD').AsString;
            ID_JORNAL        := TFIBBCDField(DataSetJornal.FieldByName('ID_J4_SP_JO')).AsInt64;
            //Caption          := DataSetSelectSystem.FieldByName('FULL_NAME').AsString;
            date_open_sys                   := DataSetJornal.FieldByName('DATA_OPEN').AsDateTime;
            item_index       := i;
        end;
        inc(i);
        DataSetJornal.Next;
    end;
    DataSetJornal.Close;
    cxComboBoxJornal.ItemIndex := item_index;

    cxSpinEdit1.Value := YearOf(date);
    cxComboBox2.ItemIndex := MonthOf(date)-1;
    //cxComboBoxJornal.ItemIndex := i;

    if MonthOf(date) < 10
        then date_beg := StrToDate('01.0'+IntTostr(MonthOf(date))+'.'+IntToStr(YearOf(date)))
        else date_beg := StrToDate('01.'+IntTostr(MonthOf(date))+'.'+IntToStr(YearOf(date)));
    date_end := IncDay(IncMonth(date_beg, 1), -1);

    Caption                      := Un_R_file_Alex.J4_OSTATOK_FORM_CAPTION;
//    ActionHelp.Caption           := Un_R_file_Alex.PUB_BUTTON_HELP;
    ActionExit.Caption            := Un_R_file_Alex.MY_BUTTON_CLOSE;
    ActionAdd.Caption             := Un_R_file_Alex.MY_BUTTON_ADD;
    ActionChange.Caption          := Un_R_file_Alex.MY_BUTTON_EDIT;
    ActionDelete.Caption          := Un_R_file_Alex.MY_BUTTON_DELETE;
    ActionRefresh.Caption         := Un_R_file_Alex.MY_BUTTON_REFRESH;
//    ActionFind.Caption           := Un_R_file_Alex.PUB_BUTTON_FIND;
//    ActionPrint.Caption          := Un_R_file_Alex.PUB_BUTTON_PRINT;
//    ActionTake.Caption           := Un_R_file_Alex.PUB_BUTTON_GET;
    ActionCancel.Caption          := Un_R_file_Alex.N_AUTOKOD_FORM_CANCLE;
    cxLabel1.Caption              := Un_R_file_Alex.J4_OSTATOK_FORM_JORNAL;
    cxLabel2.Caption              := Un_R_file_Alex.J4_OSTATOK_FORM_PERIOD;
    cxLabel3.caption              := Un_R_file_Alex.J4_OSTATOK_FORM_YEAR;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_DOC_FIO;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.J4_OSTATOK_FORM_OST_DEB;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.J4_OSTATOK_FORM_OST_KRID;
    cxGrid2DBTableView1DBColumn1.Caption := ' ';
    cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.J4_KOD_SM_RA_ST;
    cxGrid2DBTableView1DBColumn3.Caption := Un_R_file_Alex.J4_PRIKAZ;
//    cxGrid2DBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_STAT;
    cxGrid2DBTableView1DBColumn5.Caption := Un_R_file_Alex.KASSA_KEKV;
    cxGrid2DBTableView1DBColumn6.Caption := Un_R_file_Alex.KASSA_SCH;
    cxGrid2DBTableView1DBColumn7.Caption := Un_R_file_Alex.J4_MAIN_FORM_DEBET;
    cxGrid2DBTableView1DBColumn8.Caption := Un_R_file_Alex.J4_MAIN_FORM_KREDIT;
    cxLabel4.Caption := Un_R_file_Alex.J4_MAIN_FORM_DATA_BORN;
    cxLabel6.Caption := Un_R_file_Alex.J4_MAIN_FORM_IDEN_KOD;

    DataSetProvodka.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_OSTATKI_PO_FIO(?ID_MAN, ?R_J4, ?R_DATE_B, ?R_DATE_E)';
    DataSetMain.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_OSTATKI('+IntToStr(ID_JORNAL)+', ' +  QuotedStr(dateToStr(DATE_BEG)) + ', ' +  QuotedStr(dateToStr(DATE_END)) + ') order by FIO ASC';
    DataSetMain.Transaction.StartTransaction;
    DataSetMain.open;
    DataSetMain.Last;
end;

procedure TfmMainOstatkiAvance.cxComboBoxJornalClick(Sender: TObject);
var
    i : integer;
begin
        i := cxComboBoxJornal.ItemIndex;
        if ID_JORNAL <> Ind1[1][i] then
        begin
            ID_JORNAL                       := Ind1[1][i];
            if cxComboBox2.ItemIndex < 10
                then date_beg := StrToDate('01.0'+IntTostr(cxComboBox2.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
                else date_beg := StrToDate('01.'+IntTostr(cxComboBox2.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
            date_end := IncDay(IncMonth(date_beg, 1), -1);
            if date_beg < Ind1[2][i] then
            begin
                cxSpinEdit1.Properties.MinValue := YearOf(Ind1[2][i]);
                cxSpinEdit1.Value               := YearOf(Ind1[2][i]);
                cxComboBox2.ItemIndex           := MonthOf(Ind1[2][i])-1;
            end;
        end;
end;

procedure TfmMainOstatkiAvance.ActionAddExecute(Sender: TObject);
var
    T : TfmAddOstatkiAvance;
begin
    if cxGrid2.IsFocused then
    begin
         T := TfmAddOstatkiAvance.Create(self, self, AddOstatok, TFIBBCDField(DataSetMain.FieldByName('ID_MAN')).AsInt64, DataSetMain.FieldByName('FIO').AsString, 0);
         T.ShowModal;
         T.Free;
    end else
    begin
         T := TfmAddOstatkiAvance.Create(self, self, AddOstatok, 0, '', 1);
         T.ShowModal;
         T.Free;
    end;

end;

procedure TfmMainOstatkiAvance.ActionChangeExecute(Sender: TObject);
var
    T : TfmAddOstatkiAvance;
begin
    if not DataSetMain.IsEmpty then
    begin
        if cxGrid1.IsFocused then
        begin
//             if DataSetProvodka.RecordCount = 1 then
            showmessage(Un_R_file_Alex.AVANCE_OSTATOK_CANT_EDIT);
//            cxGrid2.SetFocus;
{             begin
                 T := TfmAddOstatkiAvance.Create(self, self, ChangeOstatok, TFIBBCDField(DataSetMain.FieldByName('ID_MAN')).AsInt64, DataSetMain.FieldByName('FIO').AsString, 2);

                 T.cxMRUEditFio.SetFocus;
                 T.cxMRUEditFio.TabOrder := 0;
                 T.GroupBox2.TabOrder    := 0;
                 T.cxTextEditSumma.Visible := false;

                 T.cxTextEditSumma.Properties.ReadOnly := true;
                 T.ShowModal;
                 T.Free;
             end;
}
        end;
        if cxGrid2.IsFocused then
        begin
             if not DataSetProvodka.IsEmpty then
             begin
                 if DataSetProvodka.FieldByName('ON_INPUT_USER').AsInteger = 1 then
                 begin
                     T := TfmAddOstatkiAvance.Create(self, self, ChangeOstatok, TFIBBCDField(DataSetMain.FieldByName('ID_MAN')).AsInt64, DataSetMain.FieldByName('FIO').AsString, 0);
                     T.ShowModal;
                     T.Free;
                 end else
                 begin
                     showmessage(Un_R_file_Alex.AVANCE_OSTATOK_CANT_EDIT_SYS);
                 end;
             end;
        end;
    end;
end;

procedure TfmMainOstatkiAvance.ActionRefreshExecute(Sender: TObject);
begin
    if cxComboBox2.ItemIndex < 10
        then date_beg := StrToDate('01.0'+IntTostr(cxComboBox2.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
        else date_beg := StrToDate('01.'+IntTostr(cxComboBox2.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
    date_end := IncDay(IncMonth(date_beg, 1), -1);
//    if not DatasetMain.IsEmpty then
//    begin
    DataSetMain.close;
    DataSetMain.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_OSTATKI('+IntToStr(ID_JORNAL)+', ' +  QuotedStr(dateToStr(DATE_BEG)) + ', ' +  QuotedStr(dateToStr(DATE_END)) + ')';
    DataSetMain.Open;

//        id   := DatasetMain['ID_MAN'];
//        id_p := DataSetProvodka.FieldbyName('ID_OSTATOK').asvariant;
//        DatasetMain.CloseOpen(true);
//        DatasetMain.locate('ID_MAN', id, []);
//        DatasetProvodka.locate('ID_OSTATOK', id_p, []);
{    end else
    begin
        DataSetMain.close;
        DataSetMain.SQLs.SelectSQL.Text     := 'SELECT * FROM J4_SELECT_OSTATKI('+IntToStr(ID_JORNAL)+', ' +  QuotedStr(dateToStr(DATE_BEG)) + ', ' +  QuotedStr(dateToStr(DATE_END)) + ')';
        DataSetMain.Open;
    end;}
end;

procedure TfmMainOstatkiAvance.ActionDeleteExecute(Sender: TObject);
begin
    if cxGrid2.IsFocused then
    begin
        if DataSetProvodka.FieldByName('ON_INPUT_USER').AsInteger = 0 then
        begin
            ShowMessage(Un_R_file_Alex.J4_OSTATOK_WARNING_DEL);
            exit;
        end;
        if MessageBox(Handle,Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL+'?'), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes then
        begin
            StoredProc.Transaction.StartTransaction;
            StoredProc.StoredProcName:='J4_DELETE_OSTATOK';
            StoredProc.Prepare;
            StoredProc.ParamByName('D_ID_SP_JO').AsInt64      := ID_JORNAL;
            StoredProc.ParamByName('D_ID_DT_OSTATOK').AsInt64 := TFIBBCDField(DataSetProvodka.FieldByName('ID_OSTATOK')).AsInt64;
            try
                StoredProc.ExecProc;
                StoredProc.Transaction.Commit;
                ActionRefreshExecute(Sender);
            except on E:Exception do begin
                StoredProc.Transaction.Rollback;
                ShowMessage(E.Message);
            end end;
        end;
    end;

    if cxGrid1.IsFocused then
    begin
        DataSetProvodka.First;
        while not DataSetProvodka.Eof do
        begin
            if DataSetProvodka.FieldByName('ON_INPUT_USER').AsInteger = 0 then
            begin
                ShowMessage(Un_R_file_Alex.J4_OSTATOK_WARNING_DEL);
                exit;
            end;
            DataSetProvodka.Next;
        end;
        if MessageBox(Handle,Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_DEL+'?'), Pchar(Un_R_file_Alex.N_AUTOKOD_MESSAGE_OK), mb_YesNO)=mrYes then
        begin
            StoredProc.Transaction.StartTransaction;
            StoredProc.StoredProcName:='J4_DELETE_OSTATOK_PO_FIO';
            StoredProc.Prepare;
            StoredProc.ParamByName('D_ID_SP_JO').AsInt64      := ID_JORNAL;
            StoredProc.ParamByName('D_DATE_REG').AsDate       := DataSetMain.FieldByName('DATE_REG').AsDateTime;
            StoredProc.ParamByName('D_ID_MAN').AsInt64        := TFIBBCDField(DataSetMain.FieldByName('ID_MAN')).AsInt64;
            try
                StoredProc.ExecProc;
                StoredProc.Transaction.Commit;
                ActionRefreshExecute(Sender);
            except on E:Exception do begin
                StoredProc.Transaction.Rollback;
                ShowMessage(E.Message);
            end end;
        end;
    end;


end;

procedure TfmMainOstatkiAvance.ActionExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMainOstatkiAvance.cxGrid2DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect : TRect;
begin
  Arect:=AViewInfo.Bounds;
  ACanvas.Canvas.Pen.Color :=  clBlack;
  if (AViewInfo.GridRecord.Values[1] = 0) and (not AViewInfo.GridRecord.Focused) then
    begin
      ACanvas.Canvas.Font.Color := clBlue;
      ACanvas.Canvas.FillRect(Arect);
      exit;
    end;
  if (not AViewInfo.GridRecord.Focused) then
  begin
      ACanvas.Canvas.Font.Color := clBlack;
      ACanvas.Canvas.FillRect(Arect);
  end;
end;

procedure TfmMainOstatkiAvance.DataSetMainAfterScroll(DataSet: TDataSet);
begin
    IF not DataSetMain.isEmpty then
    begin
        if DataSetMain.FieldByName('BIRTHDAY').ASDateTime <> null then
            cxLabel5.caption := DataSetMain.FieldByName('BIRTHDAY').ASstring;
        if DataSetMain.FieldByName('TIN').ASSTRing <> null then
            cxLabel7.caption := DataSetMain.FieldByName('TIN').ASstring;
    end;
end;

procedure TfmMainOstatkiAvance.cxGrid2DBTableView1DBColumn4CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if (AviewInfo.GridRecord.Values[1] = 0) then
    begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(ImageList1, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 2);
            ADone := True;
    end else
    begin
            ACanvas.FillRect(AViewInfo.Bounds);
            ACanvas.DrawImage(ImageList1, AViewInfo.Bounds.Left + Trunc((AViewInfo.Bounds.Right - AViewInfo.Bounds.Left) / 3),
                                AviewInfo.Bounds.Top, 9);
            ADone := True;
    end;
end;

procedure TfmMainOstatkiAvance.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    FormStorage1.SaveFormPlacement;
end;

end.


