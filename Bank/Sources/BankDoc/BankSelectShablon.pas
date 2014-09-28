unit BankSelectShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList, FIBDataSet,
  pFIBDataSet, BankDocMainForm, Un_R_file_Alex, pFIBDatabase,
  cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, ToolWin, cxTextEdit,
  cxContainer, cxLabel, cxImage, cxCurrencyEdit, Placemnt;

type
  TfmBankSelectShablon = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ActionList1: TActionList;
    ActionClose: TAction;
    DataSetShablon: TpFIBDataSet;
    DataSource: TDataSource;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    cxButtonTake: TcxButton;
    cxButtonClose: TcxButton;
    ActionTake: TAction;
    DataSetShablonID_KEY: TFIBBCDField;
    DataSetShablonNOTE: TFIBStringField;
    DataSetShablonV_N_DOG: TFIBStringField;
    DataSetShablonV_D_DOG: TFIBDateField;
    DataSetShablonV_MFO_K: TFIBStringField;
    DataSetShablonV_BANK_NAME_K: TFIBStringField;
    DataSetShablonV_RSCH_K: TFIBStringField;
    DataSetShablonV_NAME_CUSTOMER_K: TFIBStringField;
    DataSetShablonV_REGEST_NUM: TFIBStringField;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    DataSetShablonID_R: TFIBBCDField;
    DataSetShablonNUMBER: TFIBIntegerField;
    DataSetShablonDATE_D: TFIBDateField;
    DataSetShablonSUMM: TFIBBCDField;
    cxLabel1: TcxLabel;
    cxTextEditNote: TcxTextEdit;
    cxTextEditCust: TcxTextEdit;
    cxTextEditReg: TcxTextEdit;
    cxTextEditDate: TcxTextEdit;
    cxTextEditNum: TcxTextEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    cxLabel2: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxTextEdit3: TcxTextEdit;
    FormStorage1: TFormStorage;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ActionTakeExecute(Sender: TObject);
    procedure DataSetShablonAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    id : int64;
  procedure LoadCaptions;
  public
    mainform : TfmBankDocMainForm;
  end;

function Bank_Show_Shablon_bank(db : TpFIBDatabase; tran : TpFIBTransaction; m : TfmBankDocMainForm; var id_k: int64; var nnn : string):boolean;

implementation

{$R *.dfm}

function Bank_Show_Shablon_bank(db : TpFIBDatabase; tran : TpFIBTransaction; m : TfmBankDocMainForm; var id_k : int64; var nnn : string):boolean;
var
    T : TfmBankSelectShablon;
begin
    T := TfmBankSelectShablon.Create(nil);
    T.LoadCaptions;
    T.mainform                := m;
    T.DataSetShablon.Database := db;
    T.DataSetShablon.Transaction := tran;
    T.DataSetShablon.Transaction.StartTransaction;
    if m.kazna=1
        then T.DataSetShablon.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_PLAT_NA_SRAVNENIE('+IntToStr(m.id_ras)+', '+IntToStr(-123456)+', '''+DateToStr(m.date_doc)+''', ''' + StringReplace(m.sum_doc,',','.',[]) + ''', '+IntToStr(m.id_account_customer)+', '''+DateToStr(m.date_vip)+''')'
        else T.DataSetShablon.SQLs.SelectSQL.Text := 'SELECT * FROM BANK_SELECT_PLAT_NA_SRAVNENIE('+IntToStr(m.id_ras)+', '''+m.num_doc+''', '''+DateToStr(m.date_doc)+''', ''' + StringReplace(m.sum_doc,',','.',[]) + ''', '+IntToStr(m.id_account_customer)+', '''+DateToStr(m.date_vip)+''')';
    T.DataSetShablon.Open;
    T.DataSetShablon.FetchAll;
    T.cxTextEdit1.Text := m.note;
    T.cxTextEdit2.Text := m.sum_doc;
    T.cxTextEdit3.Text := m.num_doc;
    if T.DataSetShablon.RecordCount = 0 then
    begin
        id_k    := 0;
        nnn     := '';
        Result := false;
        T.DataSetShablon.Close;

        T.Free;
        exit;
    end;
    if T.DataSetShablon.RecordCount = 1 then
    begin
        id_k   := T.DataSetShablon['ID_KEY'];
        nnn    := T.DataSetShablon.fbn('NUMBER').AsString;
        result := true;
        T.DataSetShablon.Close;
        T.Free;
        exit;
    end;
    if T.DataSetShablon.RecordCount > 1 then
    begin
        if T.ShowModal=mrOk then
        begin
            id_k   := T.id;
            nnn    := T.DataSetShablon.fbn('NUMBER').AsString;
            Result := true;
        end
        else Result := false;
        T.DataSetShablon.Close;
        T.Free;
        exit;
    end;
    Result := false;
    T.DataSetShablon.Close;
    T.Free;
end;

procedure TfmBankSelectShablon.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmBankSelectShablon.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionTakeExecute(Sender);
end;

procedure TfmBankSelectShablon.LoadCaptions;
begin
    Caption := Un_R_file_Alex.BANK_SELECT_PL;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_FIND_DOC_NUM;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.BANK_DATE_DOCUMENT;
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.BANK_SUMMA_DOC;
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.BANK_P_S_NAME_CUSTOMER;
    cxGrid1DBTableView1DBColumn5.Caption := Un_R_file_Alex.BANK_BANK;
    cxGrid1DBTableView1DBColumn6.Caption := Un_R_file_Alex.BANK_MFO;
    cxLabel1.Caption                     := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel2.Caption                     := Un_R_file_Alex.KASSA_DOC_ORDER_OSNOVANIE;
    cxLabel3.Caption                     := Un_R_file_Alex.BANK_FULL_NAME_CUSTOMER;
    cxLabel4.Caption                     := Un_R_file_Alex.bANK_NUM_DOG;
    cxLabel5.Caption                     := Un_R_file_Alex.BANK_DATE_DOG;
    cxLabel6.Caption                     := Un_R_file_Alex.KASSA_REG_NUM;
    cxLabel7.Caption                     := Un_R_file_Alex.KASSA_SUMMA;
    cxLabel8.Caption                     := Un_R_file_Alex.J4_MAIN_FORM_NUMBER;
end;

procedure TfmBankSelectShablon.ActionTakeExecute(Sender: TObject);
begin
        if DataSetShablon['ID_KEY'] <> null
            then id := DataSetShablon['ID_KEY'];
        ModalResult := mrOk;
end;

procedure TfmBankSelectShablon.DataSetShablonAfterScroll(DataSet: TDataSet);
begin
    IF DataSetShablon.FieldByName('NOTE').AsString <> null then              cxTextEditNote.Text := DataSetShablon.FieldByName('NOTE').AsString              else cxTextEditNote.Text := '';
    IF DataSetShablon.FieldByName('V_NAME_CUSTOMER_K').AsString <> null then cxTextEditCust.Text := DataSetShablon.FieldByName('V_NAME_CUSTOMER_K').AsString else cxTextEditCust.Text := '';
    IF DataSetShablon.FieldByName('V_REGEST_NUM').AsString <> null then      cxTextEditReg.Text  := DataSetShablon.FieldByName('V_REGEST_NUM').AsString      else cxTextEditReg.Text  := '';
    IF DataSetShablon.FieldByName('V_D_DOG').AsString <> null then           cxTextEditDate.Text := DataSetShablon.FieldByName('V_D_DOG').AsString           else cxTextEditDate.Text := '';
    IF DataSetShablon.FieldByName('V_N_DOG').AsString <> null then           cxTextEditNum.Text  := DataSetShablon.FieldByName('V_N_DOG').AsString           else cxTextEditNum.Text  := '';
end;

procedure TfmBankSelectShablon.FormCreate(Sender: TObject);
begin
     FormStorage1.RestoreFormPlacement;
end;

procedure TfmBankSelectShablon.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     FormStorage1.SaveFormPlacement;
end;

end.
