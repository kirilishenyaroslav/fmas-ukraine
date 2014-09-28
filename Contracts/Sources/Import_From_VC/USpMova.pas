unit USpMova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  FIBDataSet, FIBDatabase, pFIBDatabase, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ibase,
  ActnList;

type
  TfmMova = class(TForm)
    Panel1: TPanel;
    cxButtonOk: TcxButton;
    cxButtonClose: TcxButton;
    cxGridShowMova: TcxGrid;
    cxGridShowMovaDBTableView1: TcxGridDBTableView;
    cxGridShowMovaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShowMovaLevel1: TcxGridLevel;
    pFIBDatabaseSpMova: TpFIBDatabase;
    pFIBDataSetSpSelMova: TpFIBDataSet;
    DataSourceSelectionMova: TDataSource;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetSpSelMovaID_NATIONAL: TFIBBCDField;
    pFIBDataSetSpSelMovaNAME: TFIBStringField;
    pFIBDataSetSpSelMovaSHORT_NAME: TFIBStringField;
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
    procedure cxGridShowMovaDBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxGridShowMovaDblClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultArray : Variant;
  end;
    function func_SP_mova(Bazuka: TISC_DB_HANDLE) : variant;

var
  fmMova: TfmMova;

implementation

{$R *.dfm}


function func_SP_mova(Bazuka: TISC_DB_HANDLE) : variant;
var
    fm : TfmMova;
begin
    fm := TfmMova.Create(nil);
    fm.pFIBDatabaseSpMova.Handle := Bazuka;

    fm.Caption := 'Довiдник громадянства';
    fm.cxButtonOk.Caption := 'Обрати';
    fm.cxButtonClose.Caption := 'Вiдмiнити';
    fm.cxGridShowMovaDBTableView1DBColumn1.Caption := 'Назва';
//    fm.cxGridShowMovaDBTableView1DBColumn2.Caption := 'Назва коротко';

    fm.pFIBDataSetSpSelMova.Open;

    fm.ShowModal;
    func_SP_mova := fm.ResultArray;
    fm.Free;
end;

procedure TfmMova.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 0;
    close;
end;

procedure TfmMova.cxButtonOkClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelMova.FieldByName('ID_NATIONAL').AsVariant;
    close;
end;

procedure TfmMova.cxGridShowMovaDBTableView1DblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelMova.FieldByName('ID_NATIONAL').AsVariant;
    close;
end;

procedure TfmMova.Action1Execute(Sender: TObject);
begin
    cxButtonOk.Click;
end;

procedure TfmMova.cxGridShowMovaDblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelMova.FieldByName('ID_NATIONAL').AsVariant;
    close;
end;

procedure TfmMova.Action2Execute(Sender: TObject);
var
    id_home : integer;
begin
    DataSourceSelectionMova.Enabled := false;
    pFIBDataSetSpSelMova.first;
    id_home := pFIBDataSetSpSelMova['ID_NATIONAL'];

    pFIBDataSetSpSelMova.Locate('ID_NATIONAL',id_home, []);

    DataSourceSelectionMova.Enabled := true;
end;

procedure TfmMova.Action3Execute(Sender: TObject);
var
    id_end : integer;
begin
    DataSourceSelectionMova.Enabled := false;
    pFIBDataSetSpSelMova.last;
    id_end := pFIBDataSetSpSelMova['ID_NATIONAL'];

    pFIBDataSetSpSelMova.Locate('ID_NATIONAL',id_end, []);

    DataSourceSelectionMova.Enabled := true;
end;

end.
