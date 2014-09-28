unit USpKatObuch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons,
  ExtCtrls, FIBDataSet, FIBDatabase, pFIBDatabase, pFIBDataSet, ActnList;

type
  TfmSpKat = class(TForm)
    Panel1: TPanel;
    cxButtonOk: TcxButton;
    cxButtonClose: TcxButton;
    cxGridShowKat: TcxGrid;
    cxGridShowKatDBTableView1: TcxGridDBTableView;
    cxGridShowKatDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShowKatLevel1: TcxGridLevel;
    pFIBDatabaseSpKat: TpFIBDatabase;
    pFIBDataSetSpSelKat: TpFIBDataSet;
    DataSourceSelectionKat: TDataSource;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetSpSelKatID_KAT_STUD: TFIBBCDField;
    pFIBDataSetSpSelKatNAME: TFIBStringField;
    pFIBDataSetSpSelKatSHORT_NAME: TFIBStringField;
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
    procedure cxButtonOkClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxGridShowKatDBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxGridShowKatDblClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultArray : Variant;
  end;
     function func_SP_Kat(Bazukoy: TISC_DB_HANDLE) : variant;

var
  fmSpKat: TfmSpKat;

implementation

{$R *.dfm}

function func_SP_Kat(Bazukoy: TISC_DB_HANDLE) : variant;
var
    fm : TfmSpKat;
begin
    fm := TfmSpKat.Create(nil);
    fm.pFIBDatabaseSpKat.Handle := Bazukoy;

    fm.Caption := 'Довiдник категорiй навчання';
    fm.cxButtonOk.Caption := 'Обрати';
    fm.cxButtonClose.Caption := 'Вiдмiнити';
    fm.cxGridShowKatDBTableView1DBColumn1.Caption := 'Назва';
//    fm.cxGridShowKatDBTableView1DBColumn2.Caption := 'Назва коротко';

    fm.pFIBDataSetSpSelKat.Open;

    fm.ShowModal;
    func_SP_Kat := fm.ResultArray;
    fm.Free;
end;


procedure TfmSpKat.cxButtonOkClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelKat.FieldByName('ID_KAT_STUD').AsString;
    close;
end;

procedure TfmSpKat.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 0;
    close;
end;

procedure TfmSpKat.cxGridShowKatDBTableView1DblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelKat.FieldByName('ID_KAT_STUD').AsString;
    close;
end;

procedure TfmSpKat.Action1Execute(Sender: TObject);
begin
    cxButtonOk.Click;
end;

procedure TfmSpKat.cxGridShowKatDblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelKat.FieldByName('ID_KAT_STUD').AsString;
    close;
end;

procedure TfmSpKat.Action2Execute(Sender: TObject);
var
    id_home : integer;
begin
    DataSourceSelectionKat.Enabled := false;
    pFIBDataSetSpSelKat.first;
    id_home := pFIBDataSetSpSelKat['ID_KAT_STUD'];

    pFIBDataSetSpSelKat.Locate('ID_KAT_STUD',id_home, []);

    DataSourceSelectionKat.Enabled := true;
end;

procedure TfmSpKat.Action3Execute(Sender: TObject);
var
    id_end : integer;
begin
    DataSourceSelectionKat.Enabled := false;
    pFIBDataSetSpSelKat.last;
    id_end := pFIBDataSetSpSelKat['ID_KAT_STUD'];

    pFIBDataSetSpSelKat.Locate('ID_KAT_STUD',id_end, []);

    DataSourceSelectionKat.Enabled := true;
end;
end.
