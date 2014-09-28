unit SelectNeosnProv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ActnList, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, RxMemDS, cxTextEdit, cxCurrencyEdit, AddChangeAvance,
  cxImage, Un_R_file_Alex;

type
  TfmSelectNeosnProv = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ActionList1: TActionList;
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
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    RxBuhg: TRxMemoryData;
    DataSource1: TDataSource;
    ActionTake: TAction;
    ActionClose: TAction;
    procedure ActionCloseExecute(Sender: TObject);
    Procedure TakeProv;
    procedure ActionTakeExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
function ShowSelectNeosProvRas(W : TfmAddChangeAvance; var id_prov : int64; var s : string) : boolean;

implementation

{$R *.dfm}

function ShowSelectNeosProvRas(W : TfmAddChangeAvance; var id_prov : int64; var s : string) : boolean;
var
    T : TfmSelectNeosnProv;
begin
    T := TfmSelectNeosnProv.Create(nil);
    T.Caption            := Un_R_file_Alex.J4_SELECT_NEOSN_PROV_RAS_CAPTION;
    W.flag_na_aftoscroll := false;
    W.RxMemoryDataSaveProv.First;
    while not W.RxMemoryDataSaveProv.Eof do
    begin
        if W.RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldMain').AsInteger = 0 then
        begin
            T.RxBuhg.Open;
            T.RxBuhg.Insert;
            T.RxBuhg.FieldByName('osn_sch').Value  := W.RxMemoryDataSaveProv.FieldByName('RxMemDatNameSch').Value;
            T.RxBuhg.FieldByName('kor_sch').Value  := W.RxMemoryDataSaveProv.FieldByName('RxMemDatname_korespond').Value;
            T.RxBuhg.FieldByName('pr').Value       := W.RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldSmRzStK').Value;
            T.RxBuhg.FieldByName('buhg').Value     := W.RxMemoryDataSaveProv.FieldByName('RxMemoryDataSaveProvFieldTitle_sm').Value;
            T.RxBuhg.FieldByName('summa').Value    := W.RxMemoryDataSaveProv.FieldByName('RxMemDat_summa').Value;
            T.RxBuhg.FieldByName('id_prov').Value  := W.RxMemoryDataSaveProv.FieldByName('RxMemDatid_all_prov').Value;
            T.RxBuhg.Post;
        end;
        W.RxMemoryDataSaveProv.Next;
    end;
    W.flag_na_aftoscroll := false;
    T.cxGrid1DBTableView1DBColumn1.Caption := W.cxGrid1DBTableView1DBColumn1.Caption;
    T.cxGrid1DBTableView1DBColumn2.Caption := W.cxGrid1DBTableView1DBColumn2.Caption;
    T.cxGrid1DBTableView1DBColumn3.Caption := W.cxGrid1DBTableView1DBColumn3.Caption;
    T.cxGrid1DBTableView1DBColumn4.Caption := W.cxGrid1DBTableView1DBColumn4.Caption;
    T.cxGrid1DBTableView1DBColumn5.Caption := W.cxGrid1DBTableView1DBColumn7.Caption;

    if T.Showmodal = mrOk then
    begin
        id_prov := T.RxBuhg.FieldByName('id_prov').Value;
        s       := T.RxBuhg.FieldByName('osn_sch').AsString + ' - ' +  T.RxBuhg.FieldByName('kor_sch').AsString + '   ' + T.RxBuhg.FieldByName('pr').AsString + '  ' + T.RxBuhg.FieldByName('summa').AsString;
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;                               
end;

procedure TfmSelectNeosnProv.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSelectNeosnProv.TakeProv;
begin
    if not RxBuhg.IsEmpty then
        ModalResult := mrOk;
end;

procedure TfmSelectNeosnProv.ActionTakeExecute(Sender: TObject);
begin
    TakeProv;
end;

procedure TfmSelectNeosnProv.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    TakeProv;
end;

end.
