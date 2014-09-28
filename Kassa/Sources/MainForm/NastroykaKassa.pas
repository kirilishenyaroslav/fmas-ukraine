unit NastroykaKassa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxControls, cxContainer, cxEdit, cxCheckBox, cxLookAndFeelPainters,
  StdCtrls, cxButtons, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmNastroyka = class(TForm)
    cxCheckBoxRasschif: TcxCheckBox;
    cxButtonClose: TcxButton;
    cxButtonOk: TcxButton;
    StoredProc: TpFIBStoredProc;
    TransactionWr: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
    constructor Create(AOwner: TComponent; DB: TpFIBDatabase); reintroduce; overload;
  end;

var
  fmNastroyka: TfmNastroyka;

implementation

{$R *.dfm}
uses MainFormKassa;

constructor TfmNastroyka.Create(AOwner: TComponent; DB: TpFIBDatabase);
begin
    inherited Create (AOwner);
//    Database1.DBName := DB.DBName;
//    Database1.Connected := true;

{    DataSet.Close;
    DataSet.Open;
    if DataSet.FieldByName('RAZSCHIFROVKA').AsInteger = 1 then cxCheckBoxRasschif.Checked := true;
 }
end;

procedure TfmNastroyka.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

procedure TfmNastroyka.cxButtonOkClick(Sender: TObject);
begin

{

//    StoredProc.Database := Database1;
    StoredProc.Transaction := TransactionWr;
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='J4_NASTROYKA';
    StoredProc.Prepare;
    if cxCheckBoxRasschif.Checked then StoredProc.ParamByName('D_RAZSCHIFROVKA').AsInteger := 1
                                  else StoredProc.ParamByName('D_RAZSCHIFROVKA').AsInteger := 0;
//    StoredProc.ParamByName('D_ALL_KOD').AsString  := All;
//    StoredProc.ParamByName('D_MOVETO_ID').AsInt64 := move_linkto;
//    StoredProc.ParamByName('D_LEVEL').AsIntEGER    := LEVEL;
    try
        StoredProc.ExecProc;
        StoredProc.Transaction.Commit;
    except on E:Exception do begin
        StoredProc.Transaction.Rollback;
        ShowMessage(E.Message);
    end end;


    }
end;

procedure TfmNastroyka.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//    Database1.Connected := false;
    Action := caFree;
end;

end.
