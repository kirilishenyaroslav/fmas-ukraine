unit USpKD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ActnList,
  cxClasses, cxStyles, cxGridTableView, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxControls, cxGridCustomView,
  cxGrid, cxCheckBox;

type
  TfmKD = class(TForm)
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
    DataSourceSelectionKD: TDataSource;
    pFIBDataSetSpSelKD: TpFIBDataSet;
    pFIBDatabaseSpKD: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    Panel1: TPanel;
    cxButtonOk: TcxButton;
    cxButtonClose: TcxButton;
    cxGridShowKD: TcxGrid;
    cxGridShowKDDBTableView1: TcxGridDBTableView;
    cxGridShowKDDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShowKDLevel1: TcxGridLevel;
    Action2: TAction;
    Action3: TAction;
    pFIBDataSetSpSelKDID_TYPE_DOG: TFIBBCDField;
    pFIBDataSetSpSelKDCODENAME: TFIBStringField;
    pFIBDataSetSpSelKDNAME: TFIBStringField;
    pFIBDataSetSpSelKDISMAINDOG: TFIBBooleanField;
    pFIBDataSetSpSelKDREPORT_NAME: TFIBStringField;
    pFIBDataSetSpSelKDCOPYPRINTCOUNT: TFIBSmallIntField;
    procedure Action1Execute(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure cxGridShowKDDBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    ResultArray : Variant;
  end;
     function func_SP_KD(Bazuka: TISC_DB_HANDLE) : variant;
var
  fmKD: TfmKD;

implementation

{$R *.dfm}

function func_SP_KD(Bazuka: TISC_DB_HANDLE) : variant;
var
    fm : TfmKD;
begin
    fm := TfmKD.Create(nil);
    fm.pFIBDatabaseSpKD.Handle := Bazuka;

    fm.Caption               := 'Довiдник типiв договорiв';
    fm.cxButtonOk.Caption    := 'Обрати';
    fm.cxButtonClose.Caption := 'Вiдмiнити';
    fm.cxGridShowkdDBTableView1DBColumn1.Caption := 'Назва';


    fm.pFIBDataSetSpSelKD.Open;

    fm.ShowModal;
    func_SP_KD := fm.ResultArray;
    fm.Free;
end;

procedure TfmKD.Action1Execute(Sender: TObject);
begin
    cxButtonOk.Click;
end;

procedure TfmKD.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 0;
    close;
end;

procedure TfmKD.cxButtonOkClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelKD.FieldByName('ID_TYPE_DOG').AsVariant;
    close;
end;

procedure TfmKD.Action2Execute(Sender: TObject);
var
    id_home : integer;
begin
    DataSourceSelectionKD.Enabled := false;
    pFIBDataSetSpSelKD.first;
    id_home := pFIBDataSetSpSelKD['ID_TYPE_DOG'];

    pFIBDataSetSpSelKD.Locate('ID_TYPE_DOG',id_home, []);

    DataSourceSelectionKD.Enabled := true;
end;

procedure TfmKD.Action3Execute(Sender: TObject);
var
    id_end : integer;
begin
    DataSourceSelectionKD.Enabled := false;
    pFIBDataSetSpSelKD.last;
    id_end := pFIBDataSetSpSelKD['ID_TYPE_DOG'];

    pFIBDataSetSpSelKD.Locate('ID_TYPE_DOG',id_end, []);

    DataSourceSelectionKD.Enabled := true;
end;

procedure TfmKD.cxGridShowKDDBTableView1DblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelKD.FieldByName('ID_TYPE_DOG').AsVariant;
    close;
end;

end.
