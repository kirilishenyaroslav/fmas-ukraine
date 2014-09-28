unit uSpSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ibase, FIBQuery, pFIBQuery,
  pFIBStoredProc,  cxCheckBox, RxMemDS, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ExtCtrls, uMainPerem, ActnList, uSchOborot;

type
  TSpSchForm = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    TR: TpFIBTransaction;
    ds1: TDataSource;
    StPr: TpFIBStoredProc;
    ID_SCH: TcxGridDBColumn;
    SCH_NUMBER: TcxGridDBColumn;
    SCH_TITLE: TcxGridDBColumn;
    ON_CHECK: TcxGridDBColumn;
    DSID_POS: TFIBBCDField;
    DSID_REG: TFIBBCDField;
    DSID_SCH: TFIBBCDField;
    DSSCH_NUMBER: TFIBStringField;
    DSSCH_TITLE: TFIBStringField;
    DSID_SESSION: TFIBBCDField;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    pnl1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    actlst1: TActionList;
    actOk: TAction;
    actCancel: TAction;
    procedure actCancelExecute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
  private
    DBHANDLE : TISC_DB_HANDLE;
  public
    ID_SES, count_rec:Integer;

    sch_numb_array: array of string;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; DBEG: TDateTime; DEND:TDateTime; calc:integer);overload;
  end;

var
  SpSchForm: TSpSchForm;

implementation

{$R *.dfm}


constructor TSpSchForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; DBEG: TDateTime; DEND:TDateTime; calc:integer);
var i:Integer;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.DB.Close;
   Self.DB.Handle:=DBHANDLE;
//   DB.Open;
   Self.DS.Close;
   Self.DS.SelectSQL.Clear;
   Self.DS.SelectSQL.Add('SELECT * FROM PC_SP_SCH_FOR_SYSTEM WHERE ID_SESSION = '+IntToStr(ID_SES_SCH_FOR_SYSTEM));
 //  Self.DS.Open;
 end;
end;

procedure TSpSchForm.actCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

procedure TSpSchForm.actOkExecute(Sender: TObject);
var i: Integer;
begin
 ModalResult:=mrOk;
end;

end.
