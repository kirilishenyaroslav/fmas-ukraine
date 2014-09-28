unit sp_Inflation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ComCtrls, cxMemo, cxCheckBox,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxGridBandedTableView,
  FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, IBase, pFIBStoredProc, cxContainer, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, dxBar,
  dxBarExtItems;

type
  Tsp_Inflation_Form = class(TForm)
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    TableView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    DataSource: TDataSource;
    TableViewPK_ID: TcxGridDBColumn;
    TableViewDATE_BEG: TcxGridDBColumn;
    TableViewDATE_END: TcxGridDBColumn;
    TableViewINFLATION_INDEX: TcxGridDBColumn;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure InitConnection(DBhandle: TISC_DB_HANDLE; RTransaction: TISC_TR_HANDLE);
    procedure SelectData;
    procedure LocateRec(Key : integer);
  end;

function DoShowSP_Inflation(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         fs : TFormStyle) : boolean; stdcall;

exports  DoShowSP_Inflation;

var
  sp_Inflation_Form: Tsp_Inflation_Form;

implementation

uses sp_Inflation_Add, DateUtils, TagTypes;

{$R *.dfm}

function DoShowSP_Inflation(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE;
         fs : TFormStyle) : boolean; stdcall;
var
 f : Tsp_Inflation_Form;
begin
 if fs = fsNormal then begin
  f := Tsp_Inflation_Form.Create(AOwner);

  f.InitConnection(DBHandle, RTrans);
  f.FormStyle := fs;

//  GetFormParams(f);
  f.ShowModal;
//  SetFormParams(f);
 end
 else begin
  f := Tsp_Inflation_Form.Create(AOwner);

  f.InitConnection(DBHandle, RTrans);
  f.FormStyle := fs;

//  GetFormParams(f);
  if fs = fsNormal then f.ShowModal
  else f.Show;
 end;

 Result := True;
end;

procedure Tsp_Inflation_Form.InitConnection(DBhandle: TISC_DB_HANDLE;
  RTransaction: TISC_TR_HANDLE);
begin
 Database.Handle        := DBhandle;
 ReadTransaction.Handle := RTransaction;
end;

procedure Tsp_Inflation_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// if not (fsModal in FormState) then SetFormParams(Self);

 Action := caFree;
end;

procedure Tsp_Inflation_Form.FormShow(Sender: TObject);
begin
 SelectData;
end;

procedure Tsp_Inflation_Form.SelectData;
begin
 DataSet.CloseOpen(True);
end;


procedure Tsp_Inflation_Form.CloseButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure Tsp_Inflation_Form.RefreshButtonClick(Sender: TObject);
var
 k  : integer;
 id : int64;
begin
 id := -1;

 k := TableView.DataController.FocusedRecordIndex;
 if k >= 0 then id := TableView.DataController.Values[k, 0];

 SelectData;
 LocateRec(id);
end;

procedure Tsp_Inflation_Form.AddButtonClick(Sender: TObject);
var
 f : Tsp_Inflation_Add_Form;
 Key : integer;
begin
 f := Tsp_Inflation_Add_Form.Create(Self);

 f.Caption := 'Додавання індексу інфляції';

 with TableView.DataController do begin
  if RecordCount > 0 then begin
   f.DateBegEdit.Date := Values[0, 2] + 1;
   f.DateEndEdit.Date := IncMonth(Values[0, 2] + 1) - 1;
   f.IndexEdit.Value  := Values[0, 3];
  end
  else begin
   f.DateBegEdit.Date := StartOfTheMonth(Now);
   f.DateEndEdit.Date := EndOfTheMonth(Now);
  end;
 end;

 if f.ShowModal <> mrOk then Exit;

 StoredProc.Transaction.StartTransaction;

 StoredProc.ExecProcedure('DOG_SP_INFLATION_ADD', [f.DateBegEdit.Date, f.DateEndEdit.Date, f.IndexEdit.Value]);

 key := StoredProc.Fields[0].AsInteger;

 StoredProc.Transaction.Commit;

 SelectData;
 LocateRec(Key);
end;

procedure Tsp_Inflation_Form.LocateRec(Key: integer);
begin
 if Key = -1 then Exit;
 DataSet.Locate('PK_ID', Key, []);
end;

procedure Tsp_Inflation_Form.EditButtonClick(Sender: TObject);
var
 f : Tsp_Inflation_Add_Form;
 Key : integer;
 k   : integer;
begin
 with TableView.DataController do begin
  k := FocusedRecordIndex;
  if k < 0 then Exit;

  f := Tsp_Inflation_Add_Form.Create(Self);

  f.Caption := 'Зміна індексу інфляції';

  Key                := Values[k, 0];
  f.DateBegEdit.Date := Values[k, 1];
  f.DateEndEdit.Date := Values[k, 2];
  f.IndexEdit.Value  := Values[k, 3];

  if f.ShowModal <> mrOk then Exit;

  StoredProc.Transaction.StartTransaction;

  StoredProc.ExecProcedure('DOG_SP_INFLATION_UPD', [Key, f.DateBegEdit.Date, f.DateEndEdit.Date, f.IndexEdit.Value]);

  StoredProc.Transaction.Commit;

  SelectData;
  LocateRec(Key);
 end; 
end;

procedure Tsp_Inflation_Form.DelButtonClick(Sender: TObject);
var
 k          : integer;
 Key        : integer;
 id         : integer;
begin
 k := TableView.DataController.FocusedRecordIndex;
 if k < 0 then Exit;

 id := TableView.DataController.Values[k, 0];

 if MessageDlg('Увага!', 'Ви дійсно бажаєте видалити даний індекс інфляції?', mtConfirmation, [mbYes, mbNo]) <> mrYes then Exit;

 Key := -1;

 if k + 1 < TableView.DataController.RecordCount then Key := TableView.DataController.Values[k + 1, 0]
 else if k - 1 >= 0 then Key := TableView.DataController.Values[k - 1, 0];

 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('DOG_SP_INFLATION_DEL', [id]);
 StoredProc.Transaction.Commit;

 SelectData;
 if Key <> -1 then LocateRec(Key);
end;

end.
