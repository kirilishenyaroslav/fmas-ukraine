unit SelectSchAvance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, AddOstatkiAvance,
  FIBDatabase, pFIBDatabase, Un_R_file_Alex;

type
  TfmSelectSchAvance = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBTransaction1: TpFIBTransaction;
    Database: TpFIBDatabase;
    DataSetID_SCH: TFIBBCDField;
    DataSetDATE_BEG: TFIBDateField;
    DataSetDATE_END: TFIBDateField;
    DataSetID_SP_KASS: TFIBBCDField;
    DataSetSCH_TITLE: TFIBStringField;
    DataSetSCH_NUM: TFIBStringField;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure LoadCap;
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    id_s : int64;
    kod_s, title_s : string;
    mm : TfmAddOstatkiAvance;
  public
    { Public declarations }
  end;

function Show_sch_Avance(n : TfmAddOstatkiAvance; db : TpFIBDatabase; Tr : TpFIBTransaction; id : int64; var id_sch : int64; var kod, title : string):boolean;


implementation

{$R *.dfm}

function Show_sch_Avance(n : TfmAddOstatkiAvance; db : TpFIBDatabase; Tr : TpFIBTransaction; id : int64; var id_sch : int64; var kod, title : string):boolean;
var
    T : TfmSelectSchAvance;
begin
    T := TfmSelectSchAvance.create(nil);
    T.mm := n;
    T.Database                := db;
    T.pFIBTransaction1        := Tr;
    T.Database.DefaultTransaction  := T.pFIBTransaction1;
    T.DataSet.Database        := T.Database;
    T.DataSet.Transaction     := T.Database.DefaultTransaction;
    T.DataSet.Transaction.StartTransaction;
    T.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM J4_SELECT_ALL_SCH(' +IntToStr(id)+ ')';
    T.DataSet.Open;
    T.LoadCap;

    if T.ShowModal=mrOk then
    begin
        id_sch   := T.id_s;
        kod      := T.kod_s;
        title    := T.title_s;
        Result   := true;
    end
    else
        Result   := false;
    T.Free
end;



procedure TfmSelectSchAvance.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    id_s    := TFIBBCDField(DataSet.FieldByname('ID_SCH')).AsInt64;
    kod_s   := DataSet.FieldByname('SCH_NUM').AsString;
    title_s := DataSet.FieldByname('SCH_TITLE').AsString;
    ModalResult := mrOK;
end;

procedure TfmSelectSchAvance.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if key = '#13' then cxGrid1DBTableView1DblClick(Sender);
end;

procedure TfmSelectSchAvance.LoadCap;
begin
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_CLOSE_NUMBER_SCH;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_CLOSE_NAME_SCH;
    caption := Un_R_file_Alex.J4_SEL_SCH_OSTATOK;
end;

procedure TfmSelectSchAvance.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
     if key = VK_RETURN then
     begin
        id_s    := TFIBBCDField(DataSet.FieldByname('ID_SCH')).AsInt64;
        kod_s   := DataSet.FieldByname('SCH_NUM').AsString;
        title_s := DataSet.FieldByname('SCH_TITLE').AsString;
        ModalResult := mrOK;
     end;
end;

end.
