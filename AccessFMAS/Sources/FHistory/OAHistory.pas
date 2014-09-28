unit OAHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, ExtCtrls;

type
  TfrmOAHistory = class(TForm)
    Panel1: TPanel;
    WorkDatabase: TpFIBDatabase;
    HDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    HDataSource: TDataSource;
    cxGrid1: TcxGrid;
    DBGridActions: TcxGridDBTableView;
    DBGridActionsDBColumn1: TcxGridDBColumn;
    DBGridActionsDBColumn3: TcxGridDBColumn;
    DBGridActionsDBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    DBGridActionsDBColumn5: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    FIdObject:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_object:Integer); reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmOAHistory.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE; id_object: Integer);
begin
     inherited Create(AOwner);
     FIdObject:=id_object;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     HDataSet.SelectSQL.Text:='SELECT * FROM OBJECTS_ACTIONS_HST_SELECT('+IntToStr(FIdObject)+')';
     HDataSet.Open;
end;

procedure TfrmOAHistory.cxButton1Click(Sender: TObject);
begin
      ModalResult:=mrYes;
end;

end.