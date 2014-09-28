unit USpFormObuch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ExtCtrls,
  ActnList;

type
  TfmSpFormObuch = class(TForm)
    Panel1: TPanel;
    cxButtonOk: TcxButton;
    cxButtonClose: TcxButton;
    cxGridShowForm: TcxGrid;
    cxGridShowFormDBTableView1: TcxGridDBTableView;
    cxGridShowFormDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShowFormLevel1: TcxGridLevel;
    pFIBDatabaseSpForm: TpFIBDatabase;
    pFIBDataSetSpSelForm: TpFIBDataSet;
    DataSourceSelectionForm: TDataSource;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetSpSelFormID_FORM_STUD: TFIBBCDField;
    pFIBDataSetSpSelFormNAME: TFIBStringField;
    pFIBDataSetSpSelFormSHORT_NAME: TFIBStringField;
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
    procedure cxGridShowFormDBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure cxGridShowFormDblClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultArray : Variant;
  end;
     function func_SP_Form(Bazuki: TISC_DB_HANDLE) : variant;
var
  fmSpFormObuch: TfmSpFormObuch;

implementation

{$R *.dfm}

function func_SP_Form(Bazuki: TISC_DB_HANDLE) : variant;
var
    fm : TfmSpFormObuch;
begin
    fm := TfmSpFormObuch.Create(nil);
    fm.pFIBDatabaseSpForm.Handle := Bazuki;

    fm.Caption := 'Довiдник форм навчання';
    fm.cxButtonOk.Caption := 'Обрати';
    fm.cxButtonClose.Caption := 'Вiдмiнити';
    fm.cxGridShowFormDBTableView1DBColumn1.Caption := 'Назва';
//    fm.cxGridShowFormDBTableView1DBColumn2.Caption := 'Назва коротко';

    fm.pFIBDataSetSpSelForm.Open;

    fm.ShowModal;
    func_SP_Form := fm.ResultArray;
    fm.Free;
end;

procedure TfmSpFormObuch.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 0;
    close;
end;

procedure TfmSpFormObuch.cxButtonOkClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelForm.FieldByName('ID_FORM_STUD').AsString;
    close;
end;

procedure TfmSpFormObuch.cxGridShowFormDBTableView1DblClick(
  Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelForm.FieldByName('ID_FORM_STUD').AsString;
    close;
end;

procedure TfmSpFormObuch.Action1Execute(Sender: TObject);
begin
    cxButtonOk.Click;
end;

procedure TfmSpFormObuch.cxGridShowFormDblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelForm.FieldByName('ID_FORM_STUD').AsString;
    close;
end;

procedure TfmSpFormObuch.Action2Execute(Sender: TObject);
var
    id_home : integer;
begin
    DataSourceSelectionForm.Enabled := false;
    pFIBDataSetSpSelForm.first;
    id_home := pFIBDataSetSpSelForm['ID_FORM_STUD'];

    pFIBDataSetSpSelForm.Locate('ID_FORM_STUD',id_home, []);

    DataSourceSelectionForm.Enabled := true;
end;

procedure TfmSpFormObuch.Action3Execute(Sender: TObject);
var
    id_end : integer;
begin
    DataSourceSelectionForm.Enabled := false;
    pFIBDataSetSpSelForm.last;
    id_end := pFIBDataSetSpSelForm['ID_FORM_STUD'];

    pFIBDataSetSpSelForm.Locate('ID_FORM_STUD',id_end, []);

    DataSourceSelectionForm.Enabled := true;
end;

end.
