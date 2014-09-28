unit BankMoveToDay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, ImgList, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, BankOrder,
  cxCurrencyEdit, ComCtrls, ToolWin;

type
  TfmBankMoveToDay = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxGridDayBank: TcxGrid;
    cxGridDayBankDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDayBankDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGridDayBankLevel1: TcxGridLevel;
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
    DataSetDays: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    Database: TpFIBDatabase;
    DataSource: TDataSource;
    ImageList1: TImageList;
    cxGridDayBankDBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
     myform : TfmBankOrder;
     date_open :tdate;
  public
    { Public declarations }
  end;

function Show_Days(Owner : TComponent; m : TfmBankOrder; var Res : Variant) : boolean;

{var
  fmBankMoveToDay: TfmBankMoveToDay;  }

implementation

{$R *.dfm}

function Show_Days(Owner : TComponent; m : TfmBankOrder; var Res : Variant) : boolean;
var
    T: TfmBankMoveToDay;
    id : int64;
    day_bank : tdate;
begin

    T := TfmBankMoveToDay.Create(nil);
    T.myform := m;
    T.Database                    := m.Class_Database;
    T.Transaction.DefaultDatabase := T.Database;

    T.DataSetDays.Database            := T.Database;
    T.DataSetDays.Transaction         := T.Transaction;


    T.DataSetDays.Close;
    T.DataSetDays.SQLs.SelectSQL.Text        := 'Select BANK_DT_DAY.day_bank, BANK_DT_DAY.id_dt_day from BANK_DT_DAY, BANK_SP_SCH where BANK_DT_DAY.id_bank_sp_sch=BANK_SP_SCH.id_bank_sp_sch and BANK_SP_SCH.ID_RAS_SCH='+inttostr(m.id_ras_cur)+' and BANK_SP_SCH.ID_SCH='+inttostr(m.id_osnov_sch)+' and BANK_DT_DAY.DAY_BANK>=:DATE_OP';
    T.DataSetDays.Prepare;
    T.DataSetDays.ParamByName('Date_op').ASDAte := T.myform.date_open;
    T.DataSetDays.Open;

    if T.ShowModal=mrOk then
    begin
        id     := T.DataSetDays['id_dt_day'];
        T.DataSetDays.Locate('id_dt_day', id , []);
        day_bank := T.DataSetDays['day_bank'];
        Res    :=VarArrayOf([id, day_bank]);
        Result := true;
    end
    else
        Result := false;
    T.Free
end;

procedure TfmBankMoveToDay.ToolButton1Click(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TfmBankMoveToDay.ToolButton2Click(Sender: TObject);
begin
    close;
end;

end.
