unit USPFaculty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, ibase,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ImgList, ActnList;

type
  TfmSPFacul = class(TForm)
    Panel1: TPanel;
    cxGridShowdog: TcxGrid;
    cxGridShowdogDBTableView1: TcxGridDBTableView;
    cxGridShowdogLevel1: TcxGridLevel;
    pFIBDatabaseSpFacul: TpFIBDatabase;
    pFIBDataSetSpSel: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    DataSourceSelection: TDataSource;
    cxButtonClose: TcxButton;
    cxButtonOk: TcxButton;
    pFIBDataSetSpSelID_FACUL: TFIBBCDField;
    pFIBDataSetSpSelID_DEPARTMENT: TFIBBCDField;
    pFIBDataSetSpSelNAME: TFIBStringField;
    pFIBDataSetSpSelSHORT_NAME: TFIBStringField;
    pFIBDataSetSpSelNAME_EXEC: TFIBStringField;
    pFIBDataSetSpSelDEKAN: TFIBStringField;
    cxGridShowdogDBTableView1DBColumn1: TcxGridDBColumn;
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
    LargeImages: TImageList;
    PopupImageList: TImageList;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure cxGridShowdogDBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxGridShowdogDblClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultArray : Variant;
  end;
     function func_SP_facul(Basing: TISC_DB_HANDLE) : variant;
var
  fmSPFacul: TfmSPFacul;

implementation

{$R *.dfm}

function func_SP_facul(Basing: TISC_DB_HANDLE) : variant;
var
    fm : TfmSPFacul;
begin
    fm := TfmSPFacul.Create(nil);
    fm.pFIBDatabaseSpFacul.Handle := Basing;

    fm.Caption := 'Довiдник факультетiв';
    fm.cxButtonOk.Caption := 'Обрати';
    fm.cxButtonClose.Caption := 'Вiдмiнити';
    fm.cxGridShowdogDBTableView1DBColumn1.Caption := 'Назва';
//    fm.cxGridShowdogDBTableView1DBColumn2.Caption := 'Назва коротко';

    fm.pFIBDataSetSpSel.Open;

    fm.ShowModal;
    func_SP_facul := fm.ResultArray;
    fm.Free;
end;

procedure TfmSPFacul.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 0;
    close;
end;

procedure TfmSPFacul.cxButtonOkClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSel.FieldByName('ID_FACUL').AsString;
    close;
end;

procedure TfmSPFacul.cxGridShowdogDBTableView1DblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSel.FieldByName('ID_FACUL').AsString;
    close;
end;

procedure TfmSPFacul.Action1Execute(Sender: TObject);
begin
    cxButtonOk.Click;
end;

procedure TfmSPFacul.cxGridShowdogDblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSel.FieldByName('ID_FACUL').AsString;
    close;
end;

procedure TfmSPFacul.Action2Execute(Sender: TObject);
var
    id_home : integer;
begin
    DataSourceSelection.Enabled := false;
    pFIBDataSetSpSel.first;
    id_home := pFIBDataSetSpSel['ID_FACUL'];

    pFIBDataSetSpSel.Locate('ID_FACUL',id_home, []);

    DataSourceSelection.Enabled := true;
end;

procedure TfmSPFacul.Action3Execute(Sender: TObject);
var
    id_end : integer;
begin
    DataSourceSelection.Enabled := false;
    pFIBDataSetSpSel.last;
    id_end := pFIBDataSetSpSel['ID_FACUL'];

    pFIBDataSetSpSel.Locate('ID_FACUL',id_end, []);

    DataSourceSelection.Enabled := true;
end;

end.
