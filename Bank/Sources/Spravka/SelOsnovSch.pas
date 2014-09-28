unit SelOsnovSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, Un_R_file_Alex, FilterSpravka, Placemnt;

type
  TfmSelOsnovSch = class(TForm)
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1ID_SCH: TFIBBCDField;
    pFIBDataSet1DATE_BEG: TFIBDateField;
    pFIBDataSet1DATE_END: TFIBDateField;
    pFIBDataSet1FLAG_DEFAULT: TFIBIntegerField;
    pFIBDataSet1SCH_TITLE: TFIBStringField;
    pFIBDataSet1SCH_NUM: TFIBStringField;
    FormStorage1: TFormStorage;
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoadCaption;
  private
    myform : TfmFilterSpravka;
  public
    { Public declarations }
  end;
function ShowSchOsnowSpravka(Owner : TComponent; m : TfmFilterSpravka; var Res : Variant) : boolean;

implementation

{$R *.dfm}

function ShowSchOsnowSpravka(Owner : TComponent; m : TfmFilterSpravka; var Res : Variant) : boolean;
var
    T : TfmSelOsnovSch;
    i : integer;
    id : int64;
    number, title : string;
begin
    T := TfmSelOsnovSch.Create(Owner);
    T.myform := m;
    T.pFIBDatabase1                    := m.d;
    T.pFIBTransaction1.DefaultDatabase := T.pFIBDatabase1;
    T.pFIBDataSet1.Database            := T.pFIBDatabase1;
    T.pFIBDataSet1.Transaction         := T.pFIBTransaction1;
    T.pFIBTransaction1.StartTransaction;
    T.pFIBDataSet1.Close;
    T.pFIBDataSet1.SQLs.SelectSQL.Text := 'SELECT * FROM PUB_SPRAVKA_SELECT_OSNOVNOY_SCH('+IntToStr(m.kod_sys)+')';
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

procedure TfmSelOsnovSch.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TfmSelOsnovSch.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (key = VK_RETURN) or (key = VK_F10) then  ModalResult := mrOK;
end;

procedure TfmSelOsnovSch.LoadCaption;
begin
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_CLOSE_NUMBER_SCH;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_CLOSE_NAME_SCH;
    Caption                              := Un_R_file_Alex.KASSA_FIND_CAPTION_SCH;
end;

end.
