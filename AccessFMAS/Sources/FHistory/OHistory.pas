unit OHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Ibase;

type
  TfrmOHistory = class(TForm)
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    DBGridActions: TcxGridDBTableView;
    DBGridActionsDBColumn1: TcxGridDBColumn;
    DBGridActionsDBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton1: TcxButton;
    WorkDatabase: TpFIBDatabase;
    HDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    HDataSource: TDataSource;
    DBGridActionsDBColumn3: TcxGridDBColumn;
    DBGridActionsDBColumn4: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    FIdObject:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_object:Integer);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmOHistory.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; id_object:Integer);
begin
     inherited Create(AOwner);
     FIdObject:=id_object;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     HDataSet.SelectSQL.Text:='SELECT * FROM OBJECTS_HST_SELECT('+IntToStr(FIdObject)+')';
     HDataSet.Open;
end;

procedure TfrmOHistory.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

end.