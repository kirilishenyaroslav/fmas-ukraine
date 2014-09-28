unit PrintsFormsUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, dxBar, dxBarExtItems, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ImgList, FIBDatabase,
  pFIBDatabase, pFIBDataSet, ActnList, dxStatusBar, cxCheckBox, ibase,
  st_ConstUnit, st_proc, FIBQuery, pFIBQuery, pFIBStoredProc, AccMGMT;

type
  TPrintsFormsForm = class(TForm)
    HotKey_StatusBar: TdxStatusBar;
    ActionList1: TActionList;
    EditAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    DB: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    EditButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    GridTableViewName: TcxGridDBColumn;
    GridTableViewUse: TcxGridDBColumn;
    DataSetID_TYPE_DOC: TFIBIntegerField;
    DataSetNAME_DOC: TFIBStringField;
    DataSetFUNCTION_TYPE: TFIBStringField;
    DataSetTYPE_DOC: TFIBIntegerField;
    DataSetUSED: TFIBIntegerField;
    WriteProc: TpFIBStoredProc;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    procedure RefreshActionExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
  private
   constructor Create (Aowner:Tcomponent;DBL:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    PLanguageIndex:integer;
    { Public declarations }
  end;

function LoadPrintForms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
 exports LoadPrintForms;


var
  PrintsFormsForm: TPrintsFormsForm;

implementation

{$R *.dfm}
function LoadPrintForms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  view: TPrintsFormsForm;
begin
  view:= TPrintsFormsForm.Create(AOwner,DB);
  view.ShowModal;
  view.Free;
end;

constructor TPrintsFormsForm.Create(Aowner:Tcomponent;DBL:TISC_DB_HANDLE);
Begin
 Inherited Create(Aowner);
 Db.handle:=dbl;
 Db.Connected:=true;
 ReadTransaction.Active:=true;
 Dataset.close;
 DataSet.open;
 //Languaga
 PLanguageIndex                   :=st_proc.cnLanguageIndex;
 PrintsFormsForm.Caption          :=st_printsForms[PLanguageIndex];
 EditButton.Caption               :=St_EditBtn_Caption[PLanguageIndex];
 EditButton.Hint                  :=St_EditBtn_Caption[PLanguageIndex];
 RefreshButton.Caption            :=st_RefreshBtn_Caption[PLanguageIndex];
 RefreshButton.Hint               :=st_RefreshBtn_Caption[PLanguageIndex];
 ExitButton.Caption               :=st_ExitBtn_Caption[PLanguageIndex];
 ExitButton.Hint                  :=st_ExitBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[0].Text  :=St_EditBtn_ShortCut[PLanguageIndex]+' '+St_EditBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text  :=St_RefreshBtn_ShortCut[PLanguageIndex]+' '+st_RefreshBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text  :=St_ExitBtn_ShortCut[PLanguageIndex]+' '+st_ExitBtn_Caption[PLanguageIndex];
 GridTableViewName.Caption        :=st_NameLable[PLanguageIndex];
 GridTableViewUse.Caption         :=st_State[PLanguageIndex];
End;

procedure TPrintsFormsForm.RefreshActionExecute(Sender: TObject);
Var
 id:integer;
begin
 id:=DataSetID_TYPE_DOC.AsInteger;
 Dataset.close;
 DataSet.open;
 DataSet.Locate('ID_TYPE_DOC', id, []);
end;

procedure TPrintsFormsForm.ExitActionExecute(Sender: TObject);
begin
 Close;
end;

procedure TPrintsFormsForm.EditActionExecute(Sender: TObject);
Var
 id:integer;
begin
if fibCheckPermission('/ROOT/Studcity/Object','Edit') <> 0 then
 begin
  messagebox(handle,
  pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
  +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
  pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
  exit;
 end;
 
 id:=DataSetID_TYPE_DOC.AsInteger;
 WriteProc.StoredProcName:='ST_SP_TYPE_DOC_U';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName('ID_TYPE_DOC').AsInteger:=id;
 WriteProc.ParamByName('USED').AsInteger:=1-DataSetUSED.AsInteger;
 WriteProc.ExecProc;
 try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
 Except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  Raise;
 End;
 DataSet.Close;
 DataSet.Open;
 DataSet.Locate('ID_TYPE_DOC', id, []);
end;

procedure TPrintsFormsForm.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  If ACellViewInfo.Item.Index=1 then
   Begin
    EditActionExecute(Self);
   End;
  AHandled:=true;
end;

end.
