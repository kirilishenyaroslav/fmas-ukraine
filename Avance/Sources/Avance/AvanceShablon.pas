unit AvanceShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, ActnList, cxClasses,
  RxMemDS, Un_r_file_Alex;

type
  Tfm_j4shablon = class(TForm)
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
    ActionList1: TActionList;
    ActionClose: TAction;
    ActionTake: TAction;
    ActionShowmes: TAction;
    DataSource: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    RxData: TRxMemoryData;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    procedure LoadCaptions;
  public
    { Public declarations }
  end;

function Show_j4_Shablon(var id_oper : integer ):boolean;

implementation

{$R *.dfm}

{ Tfm_j4shablon }

function Show_j4_Shablon(var id_oper : integer ):boolean;
var
    T : Tfm_j4shablon;
begin
    T := Tfm_j4shablon.Create(nil);
    T.LoadCaptions;
    T.RxData.Open;

    T.RxData.Open;
    T.RxData.Insert;
    T.RxData.FieldByName('name').Value := '¬¬Œƒ ƒ¿ÕÕ€’ »« ¬≈ƒŒÃŒ—“≈…';
    T.RxData.FieldByName('kod').Value  := 2;
    T.RxData.Post;

    T.RxData.Insert;
    T.RxData.FieldByName('name').Value := '¬¬Œƒ ƒ¿ÕÕ€’ —  À¿¬»¿“”–€';
    T.RxData.FieldByName('kod').Value  := 1;
    T.RxData.Post;

    if T.ShowModal=mrOk then
    begin
        id_oper := T.RxData.FieldByName('kod').AsInteger;
        Result := true;
    end
    else Result := false;
    T.Free
end;

procedure Tfm_j4shablon.LoadCaptions;
begin
    Caption                              := Un_r_file_Alex.KASSA_SELECT_SHOBLON_CAPTION;
    cxGrid1DBTableView1DBColumn1.Caption := Un_r_file_Alex.KASSA_SELECT_SHABLON_NAME;
    cxGrid1DBTableView1DBColumn2.Caption := Un_r_file_Alex.KASSA_KOD;
end;

procedure Tfm_j4shablon.ActionCloseExecute(Sender: TObject);
begin
    close;
end;

procedure Tfm_j4shablon.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     ModalResult := mrOk;
end;

end.
