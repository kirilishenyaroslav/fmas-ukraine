unit uo_kontingent_4_vibor_disp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ImgList, ActnList, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  Tfmuo_kontingent_4_vibor_disp = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ActionList1: TActionList;
    ATake: TAction;
    AClose: TAction;
    ImageListButton: TImageList;
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
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    DataSource1: TDataSource;
    procedure ACloseExecute(Sender: TObject);
    procedure ATakeExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function sel_disp_kon_4(db : TpFibDataBase; var id : int64; var s : string) : boolean;

implementation

{$R *.dfm}

function sel_disp_kon_4(db : TpFibDataBase; var id : int64; var s : string) : boolean;
var
    T : Tfmuo_kontingent_4_vibor_disp;
begin
    T := Tfmuo_kontingent_4_vibor_disp.Create(nil);

    T.DB := DB;
    T.Tr.DefaultDatabase := T.DB;
    T.DB.DefaultTransaction := T.Tr;

    T.DS.Database           := T.DB;
    T.DS.Transaction        := T.Tr;

    T.Tr.StartTransaction;

    T.DS.Close;
    T.DS.Sqls.SelectSQL.Text := 'select uo_sp_disp.* from uo_sp_disp, UO_INI_KONTINGENT_DIPL where (uo_sp_disp.id_sp_type_disp=UO_INI_KONTINGENT_DIPL.ID_TYPE_DISC_GROUP) or (uo_sp_disp.id_sp_type_disp=UO_INI_KONTINGENT_DIPL.ID_TYPE_DISP_STUDENTS)';
    T.DS.Open;
    
    if T.ShowModal = mrOk then
    begin
        id := StrToInt64(T.DS.FBN('ID_SP_DISP').asString);
        s  := T.DS.FBN('NAME').asString;
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;


procedure Tfmuo_kontingent_4_vibor_disp.ACloseExecute(Sender: TObject);
begin
    close;
end;

procedure Tfmuo_kontingent_4_vibor_disp.ATakeExecute(Sender: TObject);
begin
    if (not DS.IsEmpty) then Modalresult := mrOK;
end;

end.
