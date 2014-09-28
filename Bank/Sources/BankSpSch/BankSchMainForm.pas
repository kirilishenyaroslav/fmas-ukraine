unit BankSchMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxControls, cxGroupBox, cxContainer, cxEdit,
  cxTextEdit, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxGridBandedTableView, cxGridDBBandedTableView, cxLabel, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ActnList, cxRadioGroup, Un_lo_file_Alex, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Buttons;

type
  TfmBankSchMainForm = class(TForm)
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox2: TcxGroupBox;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    cxTextEdit4: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxLabel1: TcxLabel;
    Database: TpFIBDatabase;
    DataSetTemp: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
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
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxTextEdit5: TcxTextEdit;
    DataSetData: TpFIBDataSet;
    DataSource1: TDataSource;
    DataSetDataID_RAS_SCH: TFIBBCDField;
    DataSetDataID_SCH: TFIBBCDField;
    DataSetDataKOD_SCH: TFIBStringField;
    DataSetDataTITLE_SCH: TFIBStringField;
    DataSetDataKOD_RAS: TFIBStringField;
    DataSetDataBLOKED: TFIBStringField;
    DataSetDataOPEN_SCH: TFIBDateField;
    DataSetDataMFO: TFIBStringField;
    DataSetDataNAME_MFO: TFIBStringField;
    DataSetDataNAME_TYPE_ACCOUNT: TFIBStringField;
    DataSetDataWHO_BLOCKED: TFIBStringField;
    DataSetDataWHO_CLOSED: TFIBStringField;
    DataSetDataDATE_RAS_BEG: TFIBDateField;
    DataSetDataDATE_RAS_END: TFIBDateField;
    DataSetDataMONTH_OPEN: TFIBStringField;
    DataSetDataID_SVYAZKA: TFIBBCDField;
    Timer1: TTimer;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionAdd: TAction;
    ActionDelete: TAction;
    ActionTake: TAction;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    TransactionWrite: TpFIBTransaction;
    DataSetWrite: TpFIBDataSet;
    cxDateEdit1: TcxDateEdit;
    cxLabel2: TcxLabel;
    SpeedButton1: TSpeedButton;
    ActionRefresh: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBBandedTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure cxRadioButton1Click(Sender: TObject);
    procedure cxRadioButton2Click(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure cxGrid1DBBandedTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  private
    id_svyazka, id_sch_new, id_ras_new : int64;
    date_beg, date_end : TDate;
    state_l, state_r : integer;
    WW : TResBankSPProc;
  public
    constructor Create(AOwner: TComponent; db : TpFIBDatabase; id_sch, id_ras, id_sv : int64; d1, d2 : TDate; ST : TResBankSPProc); reintroduce; overload;
  end;

function Bank_sp_sch (AOwner: TComponent; db : Tpfibdatabase; id_sch, id_ras, id_sv : int64; d1, d2 : TDate; ST : TResBankSPProc) : integer; stdcall;
    exports Bank_sp_sch;

implementation
uses Un_R_file_Alex;
{$R *.dfm}

function Bank_sp_sch (AOwner: TComponent; db : Tpfibdatabase; id_sch, id_ras, id_sv : int64; d1, d2 : TDate;ST : TResBankSPProc) : integer;
var
    T : TfmBankSchMainForm;
begin
    T := TfmBankSchMainForm.Create(AOwner, db, id_sch, id_ras, id_sv, d1, d2, st);
    T.FormStyle := fsMDIChild;
    T.Show;
    Result := -1;
end;

constructor TfmBankSchMainForm.Create(AOwner: TComponent; db: TpFIBDatabase; id_sch, id_ras, id_sv : int64; d1, d2 : TDate; ST : TResBankSPProc);
begin
    inherited Create (AOwner);

    Database                         := db;
    TransactionRead.DefaultDatabase  := Database;
    TransactionWrite.DefaultDatabase := Database;

    DataSetWrite.Database    := Database;
    DataSetWrite.Transaction := TransactionWrite;

    Database.DefaultTransaction      := TransactionRead;

    DataSetTemp.Database             := Database;
    DataSetTemp.Transaction          := TransactionRead;

    DataSetData.Database             := Database;
    DataSetData.Transaction          := TransactionRead;

    TransactionRead.StartTransaction;

    date_beg                         := d1;
    date_end                         := StrToDate('31.12.9999');
    id_svyazka                       := id_sv;
    ww                               := ST;
    cxDateEdit1.date                 := d1;


    if id_sch > 0 then
    begin
        DataSetTemp.close;
        DataSetTemp.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SP_MAIN_SCH_INFO ('''+DateToStr(date_beg)+''', '+IntToStr(id_sch)+')';
        DataSetTemp.Open;
        id_sch_new := id_sch;
        cxTextEdit1.Text := DataSetTemp.FBN('SCH_NUMBER').AsString;
        cxTextEdit2.Text := DataSetTemp.FBN('SCH_TITLE').AsString;
        DataSetTemp.Close;
        state_l          := -1;
    end else
    begin
        state_l := 0;
    end;
{    if id_ras > 0 then
    begin
        DataSetTemp.close;
        DataSetTemp.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_RAS_INFO ('+IntToStr(id_ras)+', '''+DateToStr(cxDateEdit1.Date)+''', '''+DateToStr(date_end)+''')';
        DataSetTemp.Open;
        id_ras_new := id_ras;
        cxTextEdit3.Text := DataSetTemp.FBN('KOD_RAS').AsString;
        cxTextEdit4.Text := DataSetTemp.FBN('MFO').AsString;
        cxTextEdit5.Text := DataSetTemp.FBN('NAME_MFO').AsString;
        DataSetTemp.Close;
        state_r          := -1;
    end else
    begin}
        state_r := 0;
//    end;

    if state_l = 0 then
    begin
        cxLabel1.Caption := Un_R_file_Alex.BANK_SP_CHANGE_SCH_1;
    end else
    begin
        if state_r = 0 then
        begin
            cxLabel1.Caption := Un_R_file_Alex.BANK_SP_CHANGE_RAS_1;
        end else
            cxLabel1.Caption := '';
    end;

    DataSetData.Close;
    DataSetData.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_RASCH_SCH('''+DateToStr(cxDateEdit1.Date)+''', '''+DatetoStr(date_end)+''') where ID_SCH=0';
    DataSetData.Open;



    Caption                := Un_R_file_Alex.BANK_SP_SVYAZ_FORM_CAPTION;

    cxGroupBox1.Caption    := Un_R_file_Alex.BANK_SP_DATA_SCH;
    cxGroupBox2.Caption    := Un_R_file_Alex.BANK_SP_DATA_RAS;
    cxRadioButton1.Caption := Un_R_file_Alex.BANK_SP_CHANGE_SCH;
    cxRadioButton2.Caption := Un_R_file_Alex.BANK_SP_CHANGE_RAS;
    ActionClose.Caption    := Un_R_file_Alex.MY_BUTTON_CANCEL_CONST;
    ActionAdd.Caption      := Un_R_file_Alex.MY_BUTTON_OK_CONST;
    ActionDelete.Caption   := Un_R_file_Alex.BANK_SP_DELETE_SV;
    ActionRefresh.Caption  := 'F5 - ' + Un_R_file_Alex.MY_ACTION_REFRESH_CONST;


    cxGrid1DBBandedTableView1.Bands.Items[0].Caption := Un_R_file_Alex.BANK_RECVIZ;
//    cxGrid1DBBandedTableView1.Bands.Items[0].Caption := Un_R_file_Alex.BANK_DANNIE_SCH;
//    cxGrid1DBBandedTableView1DBBandedColumn1.Caption := Un_R_file_Alex.KASSA_SCH;
//    cxGrid1DBBandedTableView1DBBandedColumn2.Caption := Un_R_file_Alex.BANK_DAY_SHOW_SCH_NAME_;
//    cxGrid1DBBandedTableView1DBBandedColumn3.Caption := Un_R_file_Alex.BANK_PERIOD_MONTH_YEAR;
//    cxGrid1DBBandedTableView1DBBandedColumn4.Caption := Un_R_file_Alex.BANK_BLOCK;
    cxGrid1DBBandedTableView1DBBandedColumn5.Caption := Un_R_file_Alex.BANK_R_S;
    cxGrid1DBBandedTableView1DBBandedColumn6.Caption := Un_R_file_Alex.BANK_MFO;
    cxGrid1DBBandedTableView1DBBandedColumn7.Caption := Un_R_file_Alex.BANK_BANK;

    cxLabel2.Caption                                 := Un_R_file_Alex.BANK_SP_LAB_1;
    ActionDelete.Visible                             := false;
end;

procedure TfmBankSchMainForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmBankSchMainForm.Timer1Timer(Sender: TObject);
begin
    if (state_l = 0) or (state_r = 0) then
    begin
        if cxLabel1.Style.Font.Color <> clRed
            then cxLabel1.Style.Font.Color := clRed
            else cxLabel1.Style.Font.Color := clBlack;

{        if (state_l = -1) and (state_r = -1) then
        begin
            cxTextEdit1.SetFocus;
        end else
        begin
            if state_r = -1 then cxTextEdit1.SetFocus;
            if state_l = -1 then cxTextEdit3.SetFocus;
        end;}
    end;
end;

procedure TfmBankSchMainForm.ActionCloseExecute(Sender: TObject);
begin
    WW(id_svyazka, self.ParentWindow);
    Close;
end;

procedure TfmBankSchMainForm.ActionTakeExecute(Sender: TObject);
begin
    if (state_l = -1) and (state_r = -1) then
    begin
        if cxRadioButton1.Checked then
        begin
            id_sch_new       := StrToInt(DataSetData.FBN('ID_SCH').AsString);
            cxTextEdit1.Text := DataSetData.FBN('KOD_SCH').AsString;
            cxTextEdit2.Text := DataSetData.FBN('TITLE_SCH').AsString;
        end;
        if cxRadioButton2.Checked then
        begin
            id_ras_new := StrToInt(DataSetData.FBN('ID_RAS_SCH').AsString);
            cxTextEdit3.Text := DataSetData.FBN('KOD_RAS').AsString;
            cxTextEdit4.Text := DataSetData.FBN('MFO').AsString;
            cxTextEdit5.Text := DataSetData.FBN('NAME_MFO').AsString;
        end;
        exit;
    end;

    if (state_l = 0) then
    begin
        id_sch_new       := StrToInt(DataSetData.FBN('ID_SCH').AsString);
        cxTextEdit1.Text := DataSetData.FBN('KOD_SCH').AsString;
        cxTextEdit2.Text := DataSetData.FBN('TITLE_SCH').AsString;
        state_l          := -1;
    end else
    begin
        if (state_r = 0) then
        begin
            id_ras_new := StrToInt(DataSetData.FBN('ID_RAS_SCH').AsString);
            cxTextEdit3.Text := DataSetData.FBN('KOD_RAS').AsString;
            cxTextEdit4.Text := DataSetData.FBN('MFO').AsString;
            cxTextEdit5.Text := DataSetData.FBN('NAME_MFO').AsString;
            state_r          := -1; 
        end;
    end;

end;

procedure TfmBankSchMainForm.cxGrid1DBBandedTableView1DblClick(
  Sender: TObject);
begin
//    ActionTakeExecute(Sender);
    ActionAddExecute(Sender);
end;

procedure TfmBankSchMainForm.cxGrid1DBBandedTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN
        then ActionAddExecute(Sender);//ActionTakeExecute(Sender);
end;

procedure TfmBankSchMainForm.ActionAddExecute(Sender: TObject);
begin
    ActionTakeExecute(Sender);
    TransactionWrite.StartTransaction;
    try
        DataSetWrite.close;
        DataSetWrite.SQLs.SelectSQL.Text := 'Select * from BANK_INSERT_SP_SCH('+IntToStr(id_ras_new)+', '+InttoStr(id_sch_new)+', '''+DateToStr(date_beg)+''', '+IntToStr(0)+', '+IntToStr(0)+', '+IntToStr(0)+', '+IntToStr(0)+', '''+DateToStr(date_end)+''')';
        DataSetWrite.Open;
        if DataSetWrite.FBN('R_RESULT').asInteger = 1 then
        begin
//            TransactionWrite.Rollback;
            showmessage(DataSetWrite.FBN('R_RESULT_VAR').asString);
            Exit;
        end else
        begin
            id_svyazka  := StrToInt64(DataSetWrite.FBN('Z_IDINT').AsString);
            TransactionWrite.Commit;
            WW(id_svyazka, self.ParentWindow);
            close;
        end;
    except on E:Exception do
    begin
        TransactionWrite.Rollback;
        ShowMessage(E.Message);
    end;
    end;
end;

procedure TfmBankSchMainForm.ActionDeleteExecute(Sender: TObject);
begin
    TransactionWrite.StartTransaction;
    try
        DataSetWrite.close;
        DataSetWrite.SQLs.SelectSQL.Text := 'Select * from BANK_DELETE_SP_SCH('+IntToStr(id_svyazka)+')';
        DataSetWrite.Open;
        if DataSetWrite.FBN('R_RESULT').asInteger = 1 then
        begin

//            TransactionWrite.Rollback;
            showmessage(DataSetWrite.FBN('R_RESULT_VAR').asString);
            Exit;
        end else
        begin
            TransactionWrite.Commit;
            id_svyazka := 0;
            WW(id_svyazka, self.ParentWindow);
            close;
        end;
    except on E:Exception do
    begin
        TransactionWrite.Rollback;
        ShowMessage(E.Message);
    end;
    end;
end;

procedure TfmBankSchMainForm.cxRadioButton1Click(Sender: TObject);
begin
    if cxRadioButton1.Checked then cxLabel1.Caption := Un_R_file_Alex.BANK_SP_CHANGE_SCH_1;
end;

procedure TfmBankSchMainForm.cxRadioButton2Click(Sender: TObject);
begin
    if cxRadioButton2.Checked then cxLabel1.Caption := Un_R_file_Alex.BANK_SP_CHANGE_RAS_1;
end;

procedure TfmBankSchMainForm.ActionRefreshExecute(Sender: TObject);
begin
    try cxDateEdit1.Date := StrToDate(cxDateEdit1.Text) finally end;
    DataSetData.Close;
    DataSetData.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_RASCH_SCH('''+DateToStr(cxDateEdit1.Date)+''', '''+DatetoStr(date_end)+''') where ID_SCH=0';
    DataSetData.Open;
end;

procedure TfmBankSchMainForm.cxGrid1DBBandedTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    Arect : TRect;
begin
    Arect:=AViewInfo.Bounds;
    ACanvas.Canvas.Pen.Color :=  clBlack;
    if not AViewInfo.GridRecord.Focused
        then ACanvas.Canvas.Font.Color := RGB(150,50,50);//clRed;
    ACanvas.Canvas.FillRect(Arect);
end;

end.
