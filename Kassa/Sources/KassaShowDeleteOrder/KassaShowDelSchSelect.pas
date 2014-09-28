unit KassaShowDelSchSelect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, KassaShowDelFilter, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, Un_R_file_Alex;

type
  TfmKassaShowDelSchSelect = class(TForm)
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
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1ID_SCH: TFIBBCDField;
    pFIBDataSet1DATE_BEG: TFIBDateField;
    pFIBDataSet1DATE_END: TFIBDateField;
    pFIBDataSet1ID_SP_KASS: TFIBBCDField;
    pFIBDataSet1SCH_TITLE: TFIBStringField;
    pFIBDataSet1SCH_NUM: TFIBStringField;
    pFIBDataSet1FLAG_DEFAULT: TFIBIntegerField;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoadCaption;
  private
    myform : TfmKassaShowDelFilter;
  public
  end;

function ShowSchKassaDel(Owner : TComponent; m : TfmKassaShowDelFilter; var Res : Variant) : boolean;

implementation


{$R *.dfm}

{ TfmKassaSchSelect }

function ShowSchKassaDel(Owner : TComponent; m : TfmKassaShowDelFilter; var Res : Variant) : boolean;
var
    T : TfmKassaShowDelSchSelect;
    i : integer;
    id : int64;
    number, title : string;
begin
    T := TfmKassaShowDelSchSelect.Create(nil);
    T.myform := m;
    T.pFIBDatabase1                    := m.d;
    T.pFIBTransaction1.DefaultDatabase := T.pFIBDatabase1;
    T.pFIBDataSet1.Database            := T.pFIBDatabase1;
    T.pFIBDataSet1.Transaction         := T.pFIBTransaction1;
//    T.ShowModal;
    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS('+IntToStr(m.id_user)+')';
    T.pFIBDataSet1.Open;
    T.LoadCaption;

    if T.ShowModal = mrOk then
    begin
        Res := VarArrayCreate([0, T.cxGrid1DBTableView1.dataController.GetSelectedCount-1],varVariant);
        For i := 0 to T.cxGrid1DBTableView1.dataController.GetSelectedCount-1 do
        begin
           id     := T.cxGrid1DBTableView1.DataController.GetRecordId(T.cxGrid1DBTableView1.Controller.SelectedRecords[i].RecordIndex);
           T.pFIBDataSet1.Locate('ID_SCH', id , []);
           number := T.pFIBDataSet1.FieldByName('SCH_NUM').AsString;
           title  := T.pFIBDataSet1.FieldByName('SCH_TITLE').AsString;
           Res[i]:=VarArrayOf([id, number, title]);
        end;
        Result  := true;
    end
    else
        Result  := false;
    T.Free;
end;

procedure TfmKassaShowDelSchSelect.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TfmKassaShowDelSchSelect.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_RETURN then  ModalResult := mrOK;
end;

procedure TfmKassaShowDelSchSelect.LoadCaption;
begin
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_CLOSE_NUMBER_SCH;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_CLOSE_NAME_SCH;
    Caption                              := Un_R_file_Alex.KASSA_FIND_CAPTION_SCH;
end;

end.
