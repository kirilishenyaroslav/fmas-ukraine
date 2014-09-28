unit PkvMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList,
  FIBDatabase, pFIBDatabase, Ibase,pFibStoredProc, FIBDataSet,
  pFIBDataSet, frxClass, frxDBSet, ExtCtrls, dxBar, dxDockPanel,
  dxDockControl, Menus, ActnList, Placemnt;

type
  TfrmSmPkvMain = class(TForm)
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    WriteTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    OpenDialog1: TOpenDialog;
    ProgrammDataSet: TpFIBDataSet;
    ProgrammDataSource: TDataSource;
    ProgDataset: TfrxDBDataset;
    ToolButton2: TToolButton;
    cxStyle1: TcxStyle;
    ToolButton3: TToolButton;
    RschetDataSet: TpFIBDataSet;
    RschetDataSource: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ToolButton7: TToolButton;
    ActionList1: TActionList;
    Action1: TAction;
    cxGrid1: TcxGrid;
    PkvView: TcxGridDBTableView;
    PkvViewDBColumn2: TcxGridDBColumn;
    PkvViewDBColumn1: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    FormStorage1: TFormStorage;
    ToolButton1: TToolButton;
    frxReport1: TfrxReport;
    PkvViewDBColumn3: TcxGridDBColumn;
    PkvViewDBColumn4: TcxGridDBColumn;
    procedure ToolButton1Click(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure PkvViewDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultValue:Variant;
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;fs:TFormStyle;ID_FOR_LOCATION:Integer);overload;
  end;


implementation

uses PkEdit,BaseTypes,PkvEditKEKV;

{$R *.dfm}

{ TfrmSmPkvMain }

constructor TfrmSmPkvMain.Create(AOwner: TComponent;
  DB_HANDLE: TISC_DB_HANDLE; fs: TFormStyle; ID_FOR_LOCATION: Integer);
begin
    inherited Create(AOwner);
    self.FormStyle:=fs;
    WorkDatabase.Handle:=DB_HANDLE;
    ReadTransaction.StartTransaction;
    RschetDataSet.SelectSQL.Text:='SELECT * FROM PUB_DT_PKV_RSCH_SELECT(?ID_PKV)';
    ProgrammDataSet.Open;

    //PkvView.RestoreFromRegistry('Software\Budgeting\SprPkvSmeta',false,false, [],'PkvView');
end;

procedure TfrmSmPkvMain.ToolButton1Click(Sender: TObject);
  var T:TfrmEditKEKV;
begin
      T:=TfrmEditKEKV.Create(self);
      T.ShowModal;
      T.Free;
end;

procedure TfrmSmPkvMain.CloseButtonClick(Sender: TObject);
begin
Close;
end;

procedure TfrmSmPkvMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  PkvView.StoreToRegistry('Software\Budgeting\SprPkvSmeta',true,[],'PkvView');
  Action:=caFree;
end;

procedure TfrmSmPkvMain.AddButtonClick(Sender: TObject);
var T:TfrmSmPkvEdit;
    InsertStoredProc:TpFibStoredProc;
    id:integer;
begin
    T:=TfrmSmPkvEdit.Create(self);
    if T.ShowModal=mrYes
    then begin
         InsertStoredProc:=TpFibStoredProc.Create(self);
         InsertStoredProc.Database:=WorkDatabase;
         InsertStoredProc.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         InsertStoredProc.StoredProcName:='PUB_SP_SM_PKV_INSERT';
         InsertStoredProc.Prepare;
         InsertStoredProc.ParamByName('PKV_TITLE').Value     :=T.edSmPKVTitle.Text;
         InsertStoredProc.ParamByName('PKV_KOD').Value       :=T.edSmPKVKod.Text;
         InsertStoredProc.ParamByName('KFK_KOD').Value       :=T.KFK_TEXT.Text;
         InsertStoredProc.ParamByName('KVK_KOD').Value       :=T.KVK_TEXT.Text;
         InsertStoredProc.ParamByName('TYPE_FINANCE').Value  :=T.cxRadioGroup1.ItemIndex+1;
         InsertStoredProc.ParamByName('DEFAULT_KEKV').AsInt64:=T.ID_KEKV;
         InsertStoredProc.ExecProc;
         id:=InsertStoredProc.ParamByName('ID_PKV').Value;
         WriteTransaction.Commit;
         ProgrammDataSet.CloseOpen(true);
         ProgrammDataSet.Locate('ID_PKV',id,[]);
         InsertStoredProc.Free;

    end;
    T.Free;
end;

procedure TfrmSmPkvMain.DelButtonClick(Sender: TObject);
var DeleteStoredProc:TpFibStoredProc;
begin
   if (ProgrammDataSet.RecordCount>0)
   then begin
        if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити програму фінансування?',mtWarning,[mbYes,mbNo])=mrYes
        then begin
             DeleteStoredProc:=TpFibStoredProc.Create(self);
             DeleteStoredProc.Database:=WorkDatabase;
             DeleteStoredProc.Transaction:=WriteTransaction;
             WriteTransaction.StartTransaction;
             DeleteStoredProc.StoredProcName:='PUB_SP_SM_PKV_DELETE';
             DeleteStoredProc.Prepare;
             DeleteStoredProc.ParamByName('ID_PKV').AsInt64   :=StrToInt64(ProgrammDataSet.FieldByName('ID_PKV').AsString);
             DeleteStoredProc.ExecProc;
             WriteTransaction.Commit;
             ProgrammDataSet.CacheDelete;
             DeleteStoredProc.Close;
             DeleteStoredProc.Free;
        end;
   end;
end;

procedure TfrmSmPkvMain.UpdateButtonClick(Sender: TObject);
var T:TfrmSmPkvEdit;
    UpdateStoredProc:TpFibStoredProc;
    id:INteger;
begin
if ProgrammDataSet.RecordCount>0
then begin
    T:=TfrmSmPkvEdit.Create(self);
    T.edSmPKVTitle.Text      :=ProgrammDataSet.FieldByName('PKV_TITLE').Value;
    T.edSmPKVKod.Text        :=ProgrammDataSet.FieldByName('PKV_KOD').Value;
    T.KFK_TEXT.text          :=ProgrammDataSet.FieldByName('KFK_KOD').AsString;
    T.KVK_TEXT.text          :=ProgrammDataSet.FieldByName('KVK_KOD').AsString;
    T.cxRadioGroup1.ItemIndex:=ProgrammDataSet.FieldByName('TYPE_FINANCE').Value-1;

    if ProgrammDataSet.FieldByName('ID_KEKV').Value<>NULL
    then begin
              T.cxButtonEdit1.Text     :=ProgrammDataSet.FieldByName('KEKV_TEXT').ASString;
              T.ID_KEKV                :=StrToInt64(ProgrammDataSet.FieldByName('ID_KEKV').ASString);
    end;          

    if T.ShowModal=mrYes
    then begin
         UpdateStoredProc:=TpFibStoredProc.Create(self);
         UpdateStoredProc.Database:=WorkDatabase;
         UpdateStoredProc.Transaction:=WriteTransaction;
         WriteTransaction.StartTransaction;
         UpdateStoredProc.StoredProcName:='PUB_SP_SM_PKV_UPDATE';
         UpdateStoredProc.Prepare;
         id:=ProgrammDataSet.FieldByName('ID_PKV').Value;
         UpdateStoredProc.ParamByName('ID_PKV').Value    :=ProgrammDataSet.FieldByName('ID_PKV').Value;
         UpdateStoredProc.ParamByName('PKV_TITLE').Value   :=T.edSmPKVTitle.Text;
         UpdateStoredProc.ParamByName('PKV_KOD').Value     :=T.edSmPKVKod.Text;
         UpdateStoredProc.ParamByName('KVK_KOD').Value    :=T.KVK_TEXT.Text;
         UpdateStoredProc.ParamByName('KFK_KOD').Value    :=T.KFK_TEXT.Text;
         UpdateStoredProc.ParamByName('TYPE_FINANCE').Value:=T.cxRadioGroup1.ItemIndex+1;
         UpdateStoredProc.ParamByName('DEFAULT_KEKV').AsInt64:=T.ID_KEKV;
         UpdateStoredProc.ExecProc;
         WriteTransaction.Commit;
         ProgrammDataSet.CloseOpen(true);
         ProgrammDataSet.Locate('ID_PKV',id,[]);
         UpdateStoredProc.Free;
    end;
    T.Free;
end;
end;

procedure TfrmSmPkvMain.ToolButton2Click(Sender: TObject);
begin
//PkvView.BeginUpdate;
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportProgramms.fr3',true);
  frxReport1.PrepareReport(true);
  frxReport1.ShowPreparedReport;
//PkvView.EndUpdate;  
end;

procedure TfrmSmPkvMain.ToolButton3Click(Sender: TObject);
begin
     if (FormStyle=fsNormal)
     then begin
                if (ProgrammDataSet.RecordCount>0)
                then begin
                          ResultValue:=ProgrammDataSet.FieldByName('ID_PKV').Value;
                          ModalResult:=mrYes;
                end;
     end;
end;

procedure TfrmSmPkvMain.PkvViewDblClick(Sender: TObject);
begin
     ToolButton3Click(self);
end;

procedure TfrmSmPkvMain.N1Click(Sender: TObject);
begin
     AddButton.OnClick(self);
end;

procedure TfrmSmPkvMain.N2Click(Sender: TObject);
begin
     DelButton.OnClick(self);
end;

procedure TfrmSmPkvMain.N3Click(Sender: TObject);
begin
     UpdateButton.OnClick(self);
end;

procedure TfrmSmPkvMain.N5Click(Sender: TObject);
begin
     ToolButton7.OnClick(self);
end;

procedure TfrmSmPkvMain.N7Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmPkvMain.ToolButton7Click(Sender: TObject);
var FI:Integer;
begin
    FI:=PkvView.DataController.FocusedRowIndex;
    ProgrammDataSet.CloseOpen(true);
    PkvView.DataController.FocusedRowIndex:=FI;
end;

procedure TfrmSmPkvMain.Action1Execute(Sender: TObject);
begin
      ToolButton3.OnClick(self);
end;

end.
