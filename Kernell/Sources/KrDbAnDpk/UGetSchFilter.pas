unit UGetSchFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit,
  FIBDataSet, pFIBDataSet, RxMemDS, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls, cxButtons,
  ExtCtrls, cxCheckBox,pFibStoredProc;

type
  TfrmGetSchFilter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxGrid3: TcxGrid;
    OstView: TcxGridDBBandedTableView;
    SchColumn: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    OstViewDBBandedColumn1: TcxGridDBBandedColumn;
    SchDataSet: TRxMemoryData;
    SchFibDataSet: TpFIBDataSet;
    SchDataSource: TDataSource;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    KEY_SESSION:Int64;
    FilterCnt:Integer;
    function Checkdata:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;KEY_SESSION:Int64);reintroduce;
    procedure SaveFilter;
  end;



implementation

uses UKrDbMainResults;

{$R *.dfm}

function TfrmGetSchFilter.Checkdata: Boolean;
var i:Integer;
    Flag:Boolean;
begin
     Flag:=false;
     SchDataSet.First;
     for i:=0 to SchDataSet.RecordCount-1 do
     begin
          if (SchDataSet.FieldByName('IS_CHECKED').AsInteger=1)
          then begin
                    Flag:=true;
                    Break;
          end;
          SchDataSet.Next;
     end;
     Result:=Flag;
end;

constructor TfrmGetSchFilter.Create(AOwner: TComponent;KEY_SESSION: Int64);
begin
     inherited Create(AOwner);
     self.KEY_SESSION:=KEY_SESSION;
end;

procedure TfrmGetSchFilter.cxButton1Click(Sender: TObject);
begin
     if Checkdata
     then begin
               SaveFilter;
               ModalResult:=mrYes;
     end
     else ShowMessage('Не вибрано жодного рахунку для фільтрації.');
end;

procedure TfrmGetSchFilter.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetSchFilter.FormCreate(Sender: TObject);
var ClearSP:TpFibStoredProc;
begin
     ClearSP:=TpFibStoredProc.Create(self);
     ClearSP.Database:=TfrmMainResults(Owner).WorkDatabase;
     ClearSP.Transaction:=TfrmMainResults(Owner).WriteTransaction;
     TfrmMainResults(Owner).WriteTransaction.StartTransaction;
     ClearSP.StoredProcName:='MBOOK_REPORT_FILTER_DELETE';
     ClearSP.Prepare;
     ClearSP.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     ClearSP.ExecProc;
     TfrmMainResults(Owner).WriteTransaction.Commit;
     ClearSP.Close;
     ClearSP.Free;

     SchFibDataSet.Database   :=TfrmMainResults(Owner).WorkDatabase;
     SchFibDataSet.Transaction:=TfrmMainResults(Owner).ReadTransaction;
     SchFibDataSet.Open;
     SchDataSet.CopyStructure(SchFibDataSet);
     SchDataSet.Open;
     SchDataSet.LoadFromDataSet(SchFibDataSet,0,lmCopy);
end;

procedure TfrmGetSchFilter.SaveFilter;
var SaveStoredProc:TpFibStoredProc;
    i:Integer;
begin
     SaveStoredProc            :=TpFibStoredProc.Create(self);
     SaveStoredProc.Database   :=TfrmMainResults(Owner).WorkDatabase;
     SaveStoredProc.Transaction:=TfrmMainResults(Owner).WriteTransaction;
     SaveStoredProc.StoredProcName:='MBOOK_REPORT_FILTER_INSERT';
     TfrmMainResults(Owner).WriteTransaction.StartTransaction;
     SchDataSet.First;
     for i:=0 to SchDataSet.RecordCount-1 do
     begin
          if SchDataSet.FieldByName('IS_CHECKED').AsInteger=1
          then begin
                    SaveStoredProc.Prepare;
                    SaveStoredProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
                    SaveStoredProc.ParamByName('ID_OBJECT').AsInt64  :=StrToInt64(SchDataSet.FieldByName('ID_SCH').AsString);
                    SaveStoredProc.ParamByName('TYPE_OBJECT').AsInt64:=0;
                    SaveStoredProc.ExecProc;
          end;
          SchDataSet.Next;
     end;
     SaveStoredProc.Close;
     TfrmMainResults(Owner).WriteTransaction.Commit;
     SaveStoredProc.Free;
end;

end.
