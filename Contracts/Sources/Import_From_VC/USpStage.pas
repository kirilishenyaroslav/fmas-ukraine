unit USpStage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, cxClasses, StdCtrls, cxButtons, ExtCtrls, ibase, ActnList;

type
  Tfmspstage = class(TForm)
    Panel1: TPanel;
    cxButtonClose: TcxButton;
    cxButtonOk: TcxButton;
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
    DataSourceSelectionForm: TDataSource;
    pFIBDataSetSpSelForm: TpFIBDataSet;
    pFIBDatabaseSpForm: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    cxGridShowForm: TcxGrid;
    cxGridShowFormDBTableView1: TcxGridDBTableView;
    cxGridShowFormDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShowFormLevel1: TcxGridLevel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    pFIBDataSetSpSelFormID_TYPE_STAGE: TFIBBCDField;
    pFIBDataSetSpSelFormNAME_STAGE: TFIBStringField;
    pFIBDataSetSpSelFormCNT_MONTH: TFIBIntegerField;
    procedure cxButtonOkClick(Sender: TObject);
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxGridShowFormDBTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure cxGridShowFormDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  ResultArray : Variant;
  end;
     function func_SP_Stage(Bazuki: TISC_DB_HANDLE) : variant;

var
  fmspstage: Tfmspstage;

implementation

{$R *.dfm}

function func_SP_Stage(Bazuki: TISC_DB_HANDLE) : variant;
var
    fm : Tfmspstage;
begin
    fm := Tfmspstage.Create(nil);
    fm.pFIBDatabaseSpForm.Handle := Bazuki;

    fm.Caption := 'Довiдник типiв';
    fm.cxButtonOk.Caption := 'Обрати';
    fm.cxButtonClose.Caption := 'Вiдмiнити';
    fm.cxGridShowFormDBTableView1DBColumn1.Caption := 'Назва';

    fm.pFIBDataSetSpSelForm.Close;
    fm.pFIBDataSetSpSelForm.SelectSQL.Text := 'select * from CN_INI_TYPE_STAGE order by name_stage collate win1251_UA';
    fm.pFIBDataSetSpSelForm.Open;

    fm.ShowModal;
    func_SP_Stage := fm.ResultArray;
    fm.Free;
end;

procedure Tfmspstage.cxButtonOkClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelForm.FieldByName('ID_TYPE_STAGE').AsVariant;
    close;
end;

procedure Tfmspstage.cxButtonCloseClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := 0;
    close;
end;

procedure Tfmspstage.cxGridShowFormDBTableView1DblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelForm.FieldByName('ID_TYPE_STAGE').AsVariant;
    close;
end;

procedure Tfmspstage.Action1Execute(Sender: TObject);
begin
    cxButtonOk.Click;
end;

procedure Tfmspstage.Action2Execute(Sender: TObject);
var
    id_home : string;
begin
    DataSourceSelectionForm.Enabled := false;
    pFIBDataSetSpSelForm.first;
    id_home := pFIBDataSetSpSelForm['NAME_STAGE'];

    pFIBDataSetSpSelForm.Locate('NAME_STAGE',id_home, []);

    DataSourceSelectionForm.Enabled := true;
end;

procedure Tfmspstage.Action3Execute(Sender: TObject);
var
    id_end : string;
begin
    DataSourceSelectionForm.Enabled := false;
    pFIBDataSetSpSelForm.last;
    id_end := pFIBDataSetSpSelForm['NAME_STAGE'];

    pFIBDataSetSpSelForm.Locate('NAME_STAGE',id_end, []);

    DataSourceSelectionForm.Enabled := true;
end;

procedure Tfmspstage.cxGridShowFormDblClick(Sender: TObject);
begin
    ResultArray := VarArrayCreate([0,1], varVariant);
    ResultArray[0] := pFIBDataSetSpSelForm.FieldByName('ID_TYPE_STAGE').AsVariant;
    close;
end;

end.
