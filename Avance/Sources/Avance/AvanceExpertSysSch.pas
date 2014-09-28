unit BankExpertSysSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, cxLabel, ImgList,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ExtCtrls, BankOrder,
  cxCurrencyEdit, cxTextEdit;

type
  TfrmExpertSchSys = class(TForm)
    Panel1: TPanel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    ImageList1: TImageList;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    DataSetKORRSCH: TFIBBCDField;
    DataSetSCH_NUMBER: TFIBStringField;
    DataSetSCH_TITLE: TFIBStringField;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
     myform : TfmBankOrder;
  public
    { Public declarations }
  end;
function ShowExpertSch(Owner : TComponent; m : TfmBankOrder; var Res : Variant) : boolean;

implementation

{$R *.dfm}

function ShowExpertSch(Owner : TComponent; m : TfmBankOrder; var Res : Variant) : boolean;
var
    T: TfrmExpertSchSys;
    id : int64;
    number, title : string;
begin

    T := TfrmExpertSchSys.Create(nil);
    T.myform := m;
    T.Database                    := m.Class_Database;
    T.Transaction.DefaultDatabase := T.Database;
    T.DataSet.Database            := T.Database;
    T.DataSet.Transaction         := T.Transaction;
    T.DataSet.Close;
    T.DataSet.SQLs.SelectSQL.Text        := 'Select * from PUB_GET_KORR_SCH_FOR_BANKKASSA(:NATIVEBANKKASSASCH, :NATIVESCHINDB,:IDTYPEDOG,:IDSM,:ACTUALDATE,:CHECK_KORR_SCH_BY_REG, :IDRZ, :IDST)';
    T.DataSet.ParamByName('NATIVEBANKKASSASCH').AsInteger    := m.id_osnov_sch;
    T.DataSet.ParamByName('NATIVESCHINDB').AsInteger         := m.prih;
    T.DataSet.ParamByName('IDTYPEDOG').AsInteger             := m.id_type_dog;
    T.DataSet.ParamByName('IDSM').AsInteger                  := m.Class_DataSet['ID_SMETA'];
    T.DataSet.ParamByName('ACTUALDATE').Asdate               := m.date_act;
    T.DataSet.ParamByName('CHECK_KORR_SCH_BY_REG').AsInteger := 1;
    T.DataSet.ParamByName('IDRZ').AsInteger                  := m.Class_DataSet['ID_RAZD'];
    T.DataSet.ParamByName('IDST').AsInteger                  := m.Class_DataSet['ID_STATE'];
    T.DataSet.Open;
    T.cxLabel3.Caption := m.RxMemoryDataSaveAll.FieldByName('RxMemoryDataSaveAllSmRazStKekv').Value;
    T.cxLabel4.Caption := m.RxMemoryDataSaveAll.FieldByName('RxMemDat_summa').Value;
    if T.ShowModal=mrOk then
    begin
        id     := T.DataSet['KORRSCH'];
        T.DataSet.Locate('KORRSCH', id , []);
        number := T.DataSet['SCH_NUMBER'];
        title  := '1';//T.pFIBDataSet1.FieldByName('SCH_TITLE').AsString;
        Res    :=VarArrayOf([id, number, title]);
        Result := true;
    end
    else
        Result := false;
    T.Free
end;

procedure TfrmExpertSchSys.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ModalResult := mrOK;
end;

end.
