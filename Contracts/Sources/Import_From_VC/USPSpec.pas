unit USPSpec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ExtCtrls, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxLookAndFeelPainters, StdCtrls, cxButtons, ActnList;

type
  TfmSpSpec = class(TForm)
    DataSourceSelectionSpec: TDataSource;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDatabaseSpSpec: TpFIBDatabase;
    pFIBDataSetSpSelSpec: TpFIBDataSet;
    Panel1: TPanel;
    cxGridShowSpec: TcxGrid;
    cxGridShowSpecDBTableView1: TcxGridDBTableView;
    cxGridShowSpecDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShowSpecLevel1: TcxGridLevel;
    pFIBDataSetSpSelSpecID_SPEC: TFIBBCDField;
    pFIBDataSetSpSelSpecCODE_SPEC: TFIBStringField;
    pFIBDataSetSpSelSpecNAME: TFIBStringField;
    cxButtonOk: TcxButton;
    cxButtonClose: TcxButton;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure cxGridShowSpecDBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxGridShowSpecDblClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
    id_facul_ty : int64;
  public
    { Public declarations }
    ResultArray : Variant;
  end;
    function func_SP_spec(Baza: TISC_DB_HANDLE; sm_id : int64) : variant;
var
  fmSpSpec: TfmSpSpec;

implementation

{$R *.dfm}

function func_SP_spec(Baza: TISC_DB_HANDLE; sm_id : int64) : variant;
var
    fm : TfmSpSpec;
begin
    fm := TfmSpSpec.Create(nil);
    fm.pFIBDatabaseSpSpec.Handle := Baza;
    fm.id_facul_ty               := sm_id;
    fm.Caption := 'Довiдник спецiальностей';
    fm.cxButtonOk.Caption := 'Обрати';
    fm.cxButtonClose.Caption := 'Вiдмiнити';
    fm.cxGridShowSpecDBTableView1DBColumn1.Caption := 'Назва';
//    fm.cxGridShowSpecDBTableView1DBColumn2.Caption := 'Код спец.';

    fm.pFIBDataSetSpSelSpec.Close;
    fm.pFIBDataSetSpSelSpec.SelectSQL.Text := 'select * from CN_VC_SEL_SPEC_P_JN('+IntToStr(fm.id_facul_ty)+') order by name collate win1251_UA';
    fm.pFIBDataSetSpSelSpec.Open;

    fm.ShowModal;
    func_SP_spec := fm.ResultArray;
    fm.Free;
end;


procedure TfmSpSpec.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 0;
    close;
end;

procedure TfmSpSpec.cxButtonOkClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelSpec.FieldByName('ID_SPEC').AsString;
    close;
end;

procedure TfmSpSpec.cxGridShowSpecDBTableView1DblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelSpec.FieldByName('ID_SPEC').AsString;
    close;
end;

procedure TfmSpSpec.Action1Execute(Sender: TObject);
begin
    cxButtonOk.Click;
end;

procedure TfmSpSpec.cxGridShowSpecDblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelSpec.FieldByName('ID_SPEC').AsString;
    close;
end;

procedure TfmSpSpec.Action2Execute(Sender: TObject);
var
    id_home : integer;
begin
    DataSourceSelectionSpec.Enabled := false;
    pFIBDataSetSpSelSpec.first;
    id_home := pFIBDataSetSpSelSpec['ID_SPEC'];

    pFIBDataSetSpSelSpec.Locate('ID_SPEC',id_home, []);

    DataSourceSelectionSpec.Enabled := true;
end;

procedure TfmSpSpec.Action3Execute(Sender: TObject);
var
    id_end : integer;
begin
    DataSourceSelectionSpec.Enabled := false;
    pFIBDataSetSpSelSpec.last;
    id_end := pFIBDataSetSpSelSpec['ID_SPEC'];

    pFIBDataSetSpSelSpec.Locate('ID_SPEC',id_end, []);

    DataSourceSelectionSpec.Enabled := true;
end;

end.
