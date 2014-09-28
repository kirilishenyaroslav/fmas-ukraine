unit UMainValute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ComCtrls, ToolWin,
  ImgList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridBandedTableView, cxGridDBBandedTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet,pfibStoredproc;

type
  TfrmValuteMain = class(TForm)
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    cxGrid3: TcxGrid;
    cxGrid3DBBandedTableView1: TcxGridDBBandedTableView;
    SchColumn: TcxGridDBBandedColumn;
    SmGrColumn: TcxGridDBBandedColumn;
    SmColumn: TcxGridDBBandedColumn;
    RzColumn: TcxGridDBBandedColumn;
    StColumn: TcxGridDBBandedColumn;
    KvColumn: TcxGridDBBandedColumn;
    KrColumn: TcxGridDBBandedColumn;
    cxGridLevel2: TcxGridLevel;
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxGrid1: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    cxGridDBBandedColumn1: TcxGridDBBandedColumn;
    cxGridLevel1: TcxGridLevel;
    ImageList1: TImageList;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    ToolBar1: TToolBar;
    ToolButton5: TToolButton;
    cxGridDBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    SpValuteDataSet: TpFIBDataSet;
    SpValuteDataSource: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure cxGridDBBandedTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Id_Valute:Integer;Id_User:Integer);overload;
  end;

  function GetValute(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Id_Valute:Integer;Id_User:Integer):Variant;stdcall;
  exports GetValute;

implementation

uses UEditValute, BaseTypes;

{$R *.dfm}
function GetValute(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Id_Valute:Integer;Id_User:Integer):Variant;
var T:TfrmValuteMain;
    i:Integer;
    f:Boolean;
    Res:Variant;
begin
     Res:=NULL;
     if (fs=fsNormal)
     then begin
                T:=TfrmValuteMain.Create(AOwner,DBHandle,FS,Id_Valute,Id_User);
                if T.showModal=mrYes
                then begin
                     Res:=T.ResultValue;
                end;
                T.Free;
     end
     else begin
                f :=true;
                for i:=0 to Application.MainForm.MDIChildCount-1 do
                begin
                     if (Application.MainForm.MDIChildren[i] is TfrmValuteMain)
                     then begin
                                       Application.MainForm.MDIChildren[i].BringToFront;
                                       f:=false;
                     end;
                end;
                if f then TfrmValuteMain.Create(AOwner,DBHandle,FS,Id_Valute,Id_User);
     end;
     Result:=Res;
end;


{ TfrmValuteMain }

constructor TfrmValuteMain.Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;FS:TFormStyle;Id_Valute:Integer;Id_User:Integer);
begin
      inherited Create(AOwner);
      self.FormStyle:=fs;
      WorkDatabase.Handle:=DBHandle;
      ReadTransaction.StartTransaction;

      SpValuteDataSet.Open;

      if (self.FormStyle=fsNormal) then ToolButton1.Enabled:=true;
end;

procedure TfrmValuteMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TfrmValuteMain.ToolButton5Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmValuteMain.ToolButton6Click(Sender: TObject);
var T:TfrmEditvalute;
    InsertSP:TpfibStoredproc;
    id:integer;
begin
    T:=TfrmEditvalute.Create(self);
    if T.showModal=mryes
    then begin
              InsertSP:=TpfibStoredproc.Create(self);
              InsertSP.Database:=WorkDatabase;
              InsertSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSP.StoredProcName:='PUB_SP_VALUTE_INSERT';
              InsertSP.Prepare;
              InsertSP.ParamByName('CODE_VALUTE').Value :=T.cxTextEdit1.Text;
              InsertSP.ParamByName('VALUTE_TITLE').Value:=T.cxTextEdit2.Text;
              InsertSP.ExecProc;
              id:=InsertSP.ParamByName('ID_VALUTE').AsInteger;
              WriteTransaction.Commit;
              SpValuteDataSet.CloseOpen(true);
              SpValuteDataSet.Locate('ID_VALUTE',id,[]);
              InsertSP.Free;
    end;
    T.free;
end;

procedure TfrmValuteMain.ToolButton3Click(Sender: TObject);
var T:TfrmEditvalute;
    InsertSP:TpfibStoredproc;
    id:integer;
begin
      if (SpValuteDataSet.RecordCount>0)
      then begin
                T:=TfrmEditvalute.Create(self);
                T.cxTextEdit1.Text:=SpValuteDataSet.FieldByName('CODE_VALUTE').AsString;
                T.cxTextEdit2.Text:=SpValuteDataSet.FieldByName('VALUTE_TITLE').AsString;
                if T.showModal=mryes
                then begin
                          InsertSP:=TpfibStoredproc.Create(self);
                          InsertSP.Database:=WorkDatabase;
                          InsertSP.Transaction:=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          InsertSP.StoredProcName:='PUB_SP_VALUTE_UPDATE';
                          InsertSP.Prepare;
                          id:=SpValuteDataSet.FieldByName('ID_VALUTE').asInteger;
                          InsertSP.ParamByName('ID_VALUTE').Value :=SpValuteDataSet.FieldByName('ID_VALUTE').asInteger;
                          InsertSP.ParamByName('CODE_VALUTE').Value:=T.cxTextEdit1.Text;
                          InsertSP.ParamByName('VALUTE_TITLE').Value:=T.cxTextEdit2.Text;
                          InsertSP.ExecProc;
                          WriteTransaction.Commit;
                          SpValuteDataSet.CloseOpen(true);
                          SpValuteDataSet.Locate('ID_VALUTE',id,[]);
                          InsertSP.Free;
                end;
                T.free;
      end;
end;

procedure TfrmValuteMain.ToolButton4Click(Sender: TObject);
var InsertSP:TpFibStoredproc;
begin
      if (SpValuteDataSet.RecordCount>0)
      then begin
                if agMessageDlg('Увага!','Ви хочете видалити валюту?',mtWarning,[mbYes,mbNo])=mrYes
                then begin
                            InsertSP:=TpfibStoredproc.Create(self);
                            InsertSP.Database:=WorkDatabase;
                            InsertSP.Transaction:=WriteTransaction;
                            WriteTransaction.StartTransaction;
                            InsertSP.StoredProcName:='PUB_SP_VALUTE_DELETE';
                            InsertSP.Prepare;
                            InsertSP.ParamByName('ID_VALUTE').Value :=SpValuteDataSet.FieldByName('ID_VALUTE').asInteger;
                            InsertSP.ExecProc;
                            WriteTransaction.Commit;
                            InsertSP.Free;
                            SpValuteDataSet.CacheDelete;
                end;
      end;
end;

procedure TfrmValuteMain.ToolButton2Click(Sender: TObject);
var FI:Integer;
begin
     FI:=cxGrid3DBBandedTableView1.DataController.FocusedRowIndex;
     SpValuteDataSet.CloseOpen(true);
     cxGrid3DBBandedTableView1.DataController.FocusedRowIndex:=FI;
end;

procedure TfrmValuteMain.ToolButton1Click(Sender: TObject);
begin
     if (SpValuteDataSet.RecordCount>0)
     then begin
               ResultValue:=VarArrayOf([SpValuteDataSet.FieldByName('ID_VALUTE').Value,
                                        SpValuteDataSet.FieldByName('CODE_VALUTE').Value,
                                        SpValuteDataSet.FieldByName('VALUTE_TITLE').Value]);

               ModalResult:=MrYes;                         
     end;
end;

procedure TfrmValuteMain.cxGridDBBandedTableView1DblClick(Sender: TObject);
begin
      ToolButton1.OnClick(self);
end;

end.
