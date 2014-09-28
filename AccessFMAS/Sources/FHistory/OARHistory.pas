unit OARHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons, ExtCtrls,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, Ibase;

type
  TfrmOARHistory = class(TForm)
    WorkDatabase: TpFIBDatabase;
    HDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    HDataSource: TDataSource;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxGrid1: TcxGrid;
    DBGridActions: TcxGridDBTableView;
    DBGridActionsDBColumn5: TcxGridDBColumn;
    DBGridActionsDBColumn3: TcxGridDBColumn;
    DBGridActionsDBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    FIdObject:Integer;
    FIdAction:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_object,id_action:integer);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmOARHistory.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; id_object, id_action: integer);
begin
     inherited Create(AOwner);
     FIdObject:=id_object;
     FIdAction:=id_action;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     HDataSet.SelectSQL.Text:='SELECT * FROM PERMISSIONS_HST_SELECT('+IntToStr(FIdObject)+','+IntToStr(FIdAction)+')';
     HDataSet.Open;
end;

procedure TfrmOARHistory.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.