unit AnLinkEnum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ImgList, ActnList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxButtonEdit, FIBDatabase, pFIBDatabase,Ibase, FIBDataSet, pFIBDataSet,
  cxTextEdit,pFibStoredProc;

type
  TfrmAnMain = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    columnst: TcxStyle;
    ActionList1: TActionList;
    Action1: TAction;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    DeleteButton: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    CloseButton: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    AnDataSet: TpFIBDataSet;
    AnDataSource: TDataSource;
    Action2: TAction;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    procedure cxGrid1DBTableView1DBColumn2PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure Action2Execute(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DBColumn3PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    ResultValue:Variant;
    constructor Create(AOwner: TComponent; DB_HANDLE: TISC_DB_HANDLE;  FS: TFormStyle);
    { Public declarations }
  end;

  function GetIniAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;stdcall;
  exports GetIniAnalitic;


implementation

uses UseEnumsMain, GlobalSpr;


function GetIniAnalitic(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle):Variant;
var T:TfrmAnMain;
    Res:Variant;
begin
    if FS=fsNormal
    then begin
         T:=TfrmAnMain.Create(AOwner,DB_HANDLE,FS);
         if T.ShowModal=mrYes
         then begin
             Res:=T.ResultValue;
         end
         else Res:=NULL;
         T.Free;
    end
    else begin
         Res:=Integer(TfrmAnMain.Create(AOwner,DB_HANDLE,FS));
    end;
end;
{$R *.dfm}

{ TfrmAnMain }

constructor TfrmAnMain.Create(AOwner: TComponent;
  DB_HANDLE: TISC_DB_HANDLE; FS: TFormStyle);
begin
  Inherited Create(AOwner);
  self.FormStyle:=FS;
  WorkDatabase.Handle:=DB_HANDLE;
  AnDataSet.Open;
end;

procedure TfrmAnMain.cxGrid1DBTableView1DBColumn2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    Sp:TpFibStoredProc;
    New_id:Integer;
begin
  Res:=GlobalSpr.GetEnums(self,WorkDatabase.Handle,fsNormal);
  if Res<>NULL
  then begin
       Sp:=TpFibStoredProc.Create(self);
       Sp.Database:=WorkDatabase;
       Sp.Transaction:=ReadTransaction;
       Sp.StoredProcName:='PUB_SPR_ANALITIC_UPDATE';
       Sp.Transaction.StartTransaction;
       Sp.Prepare;
       New_id:=AnDataSet.FieldByName('ID_ANALITIC').AsInteger;
       Sp.ParamByName('ID_ANALITIC').AsInteger:=AnDataSet.FieldByName('ID_ANALITIC').AsInteger;
       Sp.ParamByName('ID_TYPE_ENUM').AsString:=Res;
       Sp.ExecProc;
       Sp.Transaction.Commit;
       Sp.Free;
       AnDataSet.CloseOpen(true);
       AnDataSet.Locate('ID_ANALITIC',new_id,[]);
  end;
end;

procedure TfrmAnMain.Action2Execute(Sender: TObject);
begin
    if self.WindowState=wsMaximized
    then self.WindowState:=wsNormal
    else self.WindowState:=wsMaximized;
end;

procedure TfrmAnMain.DeleteButtonClick(Sender: TObject);
var Sp:TpFibStoredProc;
    New_id:Integer;
begin
  if MessageBox(Handle,PChar('Вы хотите удалить привязку к перечислению?'),PChar('Внимание!'),MB_YESNO or MB_ICONERROR)=idYes
  then begin
       Sp:=TpFibStoredProc.Create(self);
       Sp.Database:=WorkDatabase;
       Sp.Transaction:=ReadTransaction;
       Sp.StoredProcName:='PUB_SPR_ANALITIC_DELETE';
       Sp.Transaction.StartTransaction;
       Sp.Prepare;
       New_id:=AnDataSet.FieldByName('ID_ANALITIC').AsInteger;
       Sp.ParamByName('ID_ANALITIC').AsInteger:=AnDataSet.FieldByName('ID_ANALITIC').AsInteger;
       Sp.ExecProc;
       Sp.Transaction.Commit;
       Sp.Free;
       AnDataSet.CloseOpen(true);
       AnDataSet.Locate('ID_ANALITIC',new_id,[]);
  end;
end;

procedure TfrmAnMain.cxGrid1DBTableView1DBColumn3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var   Sp:TpFibStoredProc;
      New_id:integer;
      New_Note:String;
begin
       New_Note:=inputbox('Работа с аналитикой','Введите наименование аналитики',AnDataSet.FieldByName('NOTE').AsString);
       Sp:=TpFibStoredProc.Create(self);
       Sp.Database:=WorkDatabase;
       Sp.Transaction:=ReadTransaction;
       Sp.StoredProcName:='PUB_SPR_ANALITIC_UPDATE_NOTE';
       Sp.Transaction.StartTransaction;
       Sp.Prepare;
       New_id:=AnDataSet.FieldByName('ID_ANALITIC').AsInteger;
       Sp.ParamByName('ID_ANALITIC').AsInteger:=AnDataSet.FieldByName('ID_ANALITIC').AsInteger;
       Sp.ParamByName('NOTE').AsString:=New_Note;
       Sp.ExecProc;
       Sp.Transaction.Commit;
       Sp.Free;
       AnDataSet.CloseOpen(true);
       AnDataSet.Locate('ID_ANALITIC',new_id,[]);
end;

procedure TfrmAnMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

end.
