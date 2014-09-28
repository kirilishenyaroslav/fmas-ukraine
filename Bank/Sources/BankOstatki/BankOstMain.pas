unit BankOstMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ActnList, ImgList, dxStatusBar, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, cxSpinEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxContainer, cxLabel, ExtCtrls, FIBQuery,
  pFIBQuery, pFIBStoredProc;

type
  TfmBankOstMain = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    ActionList1: TActionList;
    AAdd: TAction;
    AChange: TAction;
    ADel: TAction;
    ARefresh: TAction;
    AExit: TAction;
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
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    dxStatusBar1: TdxStatusBar;
    DB: TpFIBDatabase;
    DSMain: TpFIBDataSet;
    Tr: TpFIBTransaction;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxComboBoxMonth: TcxComboBox;
    cxLabel2: TcxLabel;
    cxSpinEditYear: TcxSpinEdit;
    DS: TpFIBDataSet;
    DataSource1: TDataSource;
    TWr: TpFIBTransaction;
    Stored: TpFIBStoredProc;
    DSMainDATE_REG: TFIBDateField;
    DSMainID_SMETA: TFIBBCDField;
    DSMainID_RASZEL: TFIBBCDField;
    DSMainID_STATE: TFIBBCDField;
    DSMainID_KEKV: TFIBBCDField;
    DSMainID_SCH: TFIBBCDField;
    DSMainID_USER: TFIBBCDField;
    DSMainSYSTEM_ST: TFIBIntegerField;
    DSMainON_HANDE: TFIBIntegerField;
    DSMainSUMMA: TFIBBCDField;
    DSMainSM_TITLE: TFIBStringField;
    DSMainSM_KOD: TFIBIntegerField;
    DSMainRAZ_TITLE: TFIBStringField;
    DSMainRAZ_KOD: TFIBIntegerField;
    DSMainST_TITLE: TFIBStringField;
    DSMainST_KOD: TFIBIntegerField;
    DSMainKEKV_TITLE: TFIBStringField;
    DSMainKEKV_KOD: TFIBIntegerField;
    DSMainSCH_NUMBER: TFIBStringField;
    DSMainSCH_TITLE: TFIBStringField;
    procedure AExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ARefreshExecute(Sender: TObject);
    procedure ADelExecute(Sender: TObject);
    procedure AAddExecute(Sender: TObject);
    procedure AChangeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_users : int64;
    constructor Create(AOwner : TComponent; id : int64; DBase : TpFIBDatabase); reintroduce; overload;
  end;

Function ShowInsertOstatokBank(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase) : Integer; stdcall;
    exports ShowInsertOstatokBank;

implementation

uses DateUtils,
     AddBankOstatok,
     Un_R_file_Alex;

{$R *.dfm}

Function ShowInsertOstatokBank(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase) : Integer; stdcall;
var
    T : TfmBankOstMain;
begin
    T := TfmBankOstMain.Create(AOwner, id_user, DBHandle);
    T.FormStyle := fsMDIChild;
    T.Show;
    Result := -1;
end;

procedure TfmBankOstMain.AExitExecute(Sender: TObject);
begin
    Close;
end;

constructor TfmBankOstMain.Create(AOwner: TComponent; id: int64;
  DBase: TpFIBDatabase);
var
    col_day : integer;
    d1 : string;
begin
    inherited Create(AOwner);

    id_users              := id;  
    DB                    := DBase;

    Tr.DefaultDatabase    := DB;
    TWr.DefaultDatabase   := DB;
    DB.DefaultTransaction := Tr;

    DSMain.Database       := DB;
    DSMain.Transaction    := Tr;

    DS.Database           := DB;
    DS.Transaction        := Tr;

    TR.StartTransaction;

    DS.Close;
    DS.Sqls.SelectSQL.Text    := 'select * from bank_ini';
    DS.Open;

    col_day                   := DS.fbn('BANK_DAY_SHOW_LAST').AsInteger;
    cxComboBoxMonth.ItemIndex := MonthOf(IncDay(date, -col_day))-1;
    cxSpinEditYear.Value      := YearOf(IncDay(date, -col_day));
    DS.Close;
    if cxComboBoxMonth.ItemIndex < 9
        then d1 := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
        else d1 := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);

    DSMain.Close;
    DSMain.Sqls.SelectSql.Text := 'select * from KASSA_DT_OST_SMETA_SELECT('''+d1+''')';
    DSMain.Open;



    Caption          := Un_R_file_Alex.BANK_OSTATOK_MAIN_CAP[1];
    cxLabel1.Caption := Un_R_file_Alex.BANK_MO_TAKE_MONT[1];
    cxLabel2.Caption := Un_R_file_Alex.BANK_MO_TAKE_YEAR[1];
    AAdd.Caption     := Un_R_file_Alex.ADD_CONST[1];
    AChange.Caption  := Un_R_file_Alex.UPDATE_CONST[1];
    ADel.Caption     := Un_R_file_Alex.DELETE_CONST[1];
    ARefresh.Caption := Un_R_file_Alex.REFRESH_CONST[1];
    AExit.Caption    := Un_R_file_Alex.CLOSE_VIH[1];

    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.N_KASSA_SCH[1];
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.N_KASSA_SMETA[1];
    cxGrid1DBTableView1DBColumn3.Caption := Un_R_file_Alex.N_KASSA_STAT[1];
    cxGrid1DBTableView1DBColumn4.Caption := Un_R_file_Alex.N_KASSA_RAZD[1];
    cxGrid1DBTableView1DBColumn5.Caption := Un_R_file_Alex.N_KASSA_KEKV[1];
    cxGrid1DBTableView1DBColumn6.Caption := Un_R_file_Alex.N_KASSA_SUMMA[1];
//    cxGrid1DBTableView1DBColumn8.Caption := Un_R_file_Alex.

end;

procedure TfmBankOstMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    If formStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmBankOstMain.ARefreshExecute(Sender: TObject);
var
    d1 : string;
begin
    if cxComboBoxMonth.ItemIndex < 9
        then d1 := '01.'+'0'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.'+ IntToStr(cxSpinEditYear.Value)
        else d1 := '01.'+ IntToStr(cxComboBoxMonth.ItemIndex+1) + '.' + IntToStr(cxSpinEditYear.Value);
    DSMain.Close;
    DSMain.Sqls.SelectSql.Text := 'select * from KASSA_DT_OST_SMETA_SELECT('''+d1+''')';
    DSMain.Open;
end;

procedure TfmBankOstMain.ADelExecute(Sender: TObject);
var
    s : string;
begin
    if not DSMain.IsEmpty then
    begin
        s := Un_R_file_Alex.BANK_OSTATOK_DEL_OST[1];
        if MessageBox(Handle, Pchar(s), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            Stored.Database    := DB;
            Stored.Transaction := TWr;
            TWr.StartTransaction;
            try
            begin
                Stored.StoredProcName := 'KASSA_DT_OST_SMETA_DELETE';
                Stored.Prepare;
                Stored.ParamByName('D_ID_SCH').AsInt64      := DSMainID_SCH.AsInt64;
                Stored.ParamByName('D_ID_SMETA').AsInt64    := DSMainID_SMETA.AsInt64;
 //               Stored.ParamByName('D_ID_RAZD').AsString    := null;
//                Stored.ParamByName('D_ID_STATE').AsString   := null;
                Stored.ParamByName('D_ID_KEKV').AsInt64     := DSMainID_KEKV.AsInt64;
                Stored.ParamByName('D_DATE_REG').AsDateTime := DSMainDATE_REG.AsDateTime;
                Stored.ParamByName('D_SUMMA').AsExtended    := DSMainSUMMA.AsExtended;
                Stored.ExecProc;
                TWr.Commit;
                ARefreshExecute(Sender);
            end
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end;
            end;
        end;
    end;
end;

procedure TfmBankOstMain.AAddExecute(Sender: TObject);
var
    T : TfmAddBankOstatok;
begin
    T := TfmAddBankOstatok.Create(self, self, 1);
    T.Showmodal;
    T.Free;
end;

procedure TfmBankOstMain.AChangeExecute(Sender: TObject);
var
    T : TfmAddBankOstatok;
begin
    if not DSMain.IsEmpty then
    begin
        T := TfmAddBankOstatok.Create(self, self, 2);
        T.Showmodal;
        T.Free;
    end;
end;

end.
