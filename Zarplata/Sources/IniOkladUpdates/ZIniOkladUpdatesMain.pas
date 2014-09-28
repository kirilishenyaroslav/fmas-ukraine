unit ZIniOkladUpdatesMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, dxStatusBar, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, cxClasses, dxBar, dxBarExtItems, IBase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ZIniOkladUpdatesAdd, cxTextEdit, FIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfrmZIniOkladUpdatesMain = class(TForm)
    dxBarManager1: TdxBarManager;
    InsertBtn: TdxBarLargeButton;
    EditBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    UPDBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
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
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dxStatusBar1: TdxStatusBar;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ExitBtn: TdxBarLargeButton;
    DB: TpFIBDatabase;
    DSet: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    DSource: TDataSource;
    procedure ExitBtnClick(Sender: TObject);
    procedure UPDBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    constructor Create(Component:TComponent; HANDLE:TISC_DB_HANDLE);reintroduce;
  end;

var
  frmZIniOkladUpdatesMain: TfrmZIniOkladUpdatesMain;

function View_ZIniOkladUpdates_Sp( AOwner:TComponent; DB:TISC_DB_HANDLE ):Variant; stdcall;
 exports View_ZIniOkladUpdates_Sp;

implementation


{$R *.dfm}

function View_ZIniOkladUpdates_Sp( AOwner:TComponent; DB:TISC_DB_HANDLE):Variant;
var
  ViewForm: TfrmZIniOkladUpdatesMain;
  i: Integer;
begin
    i:=0;
    while (Application.MainForm.MDIChildCount-i>0)
      and not (Application.MainForm.MDIChildren[i] is TfrmZIniOkladUpdatesMain) do
        inc(i);

    if i=Application.MainForm.MDIChildCount then
        ViewForm := TfrmZIniOkladUpdatesMain.Create(AOwner, DB)
    else Application.MainForm.MDIChildren[i].BringToFront;

    View_ZIniOkladUpdates_Sp:=NULL;
end;

constructor TfrmZIniOkladUpdatesMain.Create(Component:TComponent; HANDLE:TISC_DB_HANDLE);
begin
    inherited Create(Component);

    DB.Handle := HANDLE;
    DB.Open;
end;

procedure TfrmZIniOkladUpdatesMain.ExitBtnClick(Sender: TObject);
begin
    close;
end;

procedure TfrmZIniOkladUpdatesMain.UPDBtnClick(Sender: TObject);
begin
    DSet.Close;
    DSet.SelectSQL.Text := 'select d.* from Z_INI_OKLAD_UP_DATES d order by d.DATE_UP desc';
    DSet.Open;
    DSet.First;
end;

procedure TfrmZIniOkladUpdatesMain.FormCreate(Sender: TObject);
begin
    UPDBtnClick(Sender);
end;

procedure TfrmZIniOkladUpdatesMain.InsertBtnClick(Sender: TObject);
var
  SP :TpFIBStoredProc;
  F  :TfrmZIniOkladUpdatesAdd;
  id :Integer;
begin
    F := TfrmZIniOkladUpdatesAdd.Create(Self);
    F.cxDateEdit1.Date := Date;
    if F.ShowModal=mryes then
    begin
        SP := TpFIBStoredProc.Create(self);
        SP.Database:=DB;
        SP.Transaction:=pFIBTransaction1;
        SP.Transaction.StartTransaction;
        SP.StoredProcName:='Z_INI_OKLAD_UP_DATES_INS';
        SP.ParamByName('DATE_UP').AsString:=F.cxDateEdit1.Text;
        try
            SP.ExecProc;
            id:=SP.FieldByName('ID_UP').AsInteger;
            except on E : Exception
            do begin
                ShowMessage(E.Message);
                SP.Transaction.Rollback;
                Exit;
            end;
        end;
        SP.Transaction.Commit;
        DSet.CloseOpen(True);
        DSet.ExtLocate('ID_UP', id, []);
    end;
end;

procedure TfrmZIniOkladUpdatesMain.EditBtnClick(Sender: TObject);
var
  DS :TpFIBDataSet;
  F  :TfrmZIniOkladUpdatesAdd;
  id :Integer;
begin
    id :=DSet.FieldByName('ID_UP').AsInteger;
    F := TfrmZIniOkladUpdatesAdd.Create(Self);
    F.cxDateEdit1.Date := DSet.FieldByName('DATE_UP').AsDateTime;
    if F.ShowModal=mryes then
    begin
        DS := TpFIBDataSet.Create(self);
        DS.Database:=DB;
        DS.Transaction:=pFIBTransaction1;
        DS.Transaction.StartTransaction;
        DS.SelectSQL.Text:='update Z_INI_OKLAD_UP_DATES set DATE_UP='''+F.cxDateEdit1.Text+''' where ID_UP='+DSet.FieldByName('ID_UP').AsString;
        try
            DS.Open;
            except on E : Exception
            do begin
                ShowMessage(E.Message);
                DS.Transaction.Rollback;
                Exit;
            end;
        end;
        DS.Transaction.Commit;
        DSet.CloseOpen(True);
        DSet.ExtLocate('ID_UP', id, []);
    end;
end;

procedure TfrmZIniOkladUpdatesMain.DeleteBtnClick(Sender: TObject);
var
  DS :TpFIBDataSet;
begin
    if MessageBox(Self.Handle,'¬и д≥йсно бажаЇте видалити цей запис?  ','”вага!',MB_YESNO)=IDYES then
    begin
        DS := TpFIBDataSet.Create(self);
        DS.Database:=DB;
        DS.Transaction:=pFIBTransaction1;
        DS.Transaction.StartTransaction;
        DS.SelectSQL.Text:='delete from Z_INI_OKLAD_UP_DATES where ID_UP='+DSet.fieldbyname('ID_UP').AsString;
        try
            DS.Open;
            except on E : Exception
            do begin
                ShowMessage(E.Message);
                DS.Transaction.Rollback;
                Exit;
            end;
        end;
        DS.Transaction.Commit;
    end;
    DSet.CloseOpen(True);
end;

procedure TfrmZIniOkladUpdatesMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

end.
