unit UAUsersMngr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, DB,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, cxClasses, cxStyles,
  cxGridTableView, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, Ibase,
  pFibStoredproc;

type
  TfrmUsersMngr = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    AllUsersDataSet: TpFIBDataSet;
    AuthUsersDataSet: TpFIBDataSet;
    AllUsersDataSource: TDataSource;
    AuthUsersDataSource: TDataSource;
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
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Splitter1: TSplitter;
    ListGrid: TcxGrid;
    ListGridTabView: TcxGridDBTableView;
    FIOColumn: TcxGridDBColumn;
    ListGridLevel1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

{$R *.dfm}

constructor TfrmUsersMngr.Create(AOwner: TComponent; DbHandle: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     AllUsersDataSet.Open;
     AuthUsersDataSet.Open;
end;

procedure TfrmUsersMngr.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmUsersMngr.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmUsersMngr.cxButton3Click(Sender: TObject);
var SP:TpFibStoredproc;
begin
     if AllUsersDataSet.RecordCount>0
     then begin
               if MessageBox(Handle,
                 'Ви хочете зробити первинну авторизацію як для користувача системи "Зарплата" ?',
                 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
                         SP:=TpFibStoredproc.Create(self);
                         SP.Database:=WorkDatabase;
                         SP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         SP.StoredProcName:='Z_DO_AUTHENTIFICATION';
                         SP.Prepare;
                         SP.ParamByName('ID_USER').Value:=AllUsersDataSet.FieldByName('ID_USER').Value;
                         SP.ParamByName('FLAG').Value:=1;
                         SP.ExecProc;
                         WriteTransaction.Commit;
                         AuthUsersDataSet.CloseOpen(true);
                         AuthUsersDataSet.Locate('id_user',AllUsersDataSet.FieldByName('ID_USER').Value,[]);
                         SP.Free;
               end;
     end;

end;

procedure TfrmUsersMngr.cxButton4Click(Sender: TObject);
var SP:TpFibStoredproc;
begin
     if AuthUsersDataSet.RecordCount>0
     then begin
               if MessageBox(Handle,
                 'Ви хочете видалити авторизацію для користувача системи "Зарплата" ?',
                 'Увага!', MB_YESNO + MB_ICONQUESTION) = IDYES
               then begin
                         SP:=TpFibStoredproc.Create(self);
                         SP.Database:=WorkDatabase;
                         SP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         SP.StoredProcName:='Z_DO_AUTHENTIFICATION_DELETE';
                         SP.Prepare;
                         SP.ParamByName('ID_USER').Value:=AuthUsersDataSet.FieldByName('ID_USER').Value;
                         SP.ExecProc;
                         WriteTransaction.Commit;
                         AuthUsersDataSet.CacheDelete;
                         SP.Free;
               end;
     end;
end;

end.
