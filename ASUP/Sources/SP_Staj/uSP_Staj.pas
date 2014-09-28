unit uSP_Staj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBQuery, pFIBQuery, ActnList,
  cxGridTableView, ImgList, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxBarExtItems, dxBar, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxContainer, cxCheckBox, StdCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,Ibase,
  cxGridDBTableView, cxGrid, ExtCtrls, ComCtrls, ToolWin, pFibStoredProc;

type
  TfmSP_Staj = class(TForm)
    ToolBar1: TToolBar;
    btn2: TToolButton;
    btn4: TToolButton;
    ToolButton2: TToolButton;
    RefreshButton: TToolButton;
    btn1: TToolButton;
    btn3: TToolButton;
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    IL_Orders: TImageList;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    StajDS: TpFIBDataSet;
    dsSiognersDSet: TDataSource;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    KeyList: TActionList;
    AddAction: TAction;
    CancelAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    EnterAction: TAction;
    ShowInfoAction: TAction;
    procedure AddActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure EnterActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure ReportDataViewDblClick(Sender: TObject);
    procedure ShowInfoActionExecute(Sender: TObject);
  private

  public
    { Public declarations }
     staj_name:string;
     id_staj:Integer;
     constructor Create(AOwner: TComponent; id_type_signers: Integer;DbHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  fmSP_Staj: TfmSP_Staj;

implementation

uses uSP_Staj_Edit, BaseTypes, UpKernelUnit;

{$R *.dfm}
constructor TfmSP_Staj.Create(AOwner: TComponent; id_type_signers: Integer;DbHandle:TISC_DB_HANDLE);
begin

     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
     StajDS.SelectSQL.Text:='select * from  INI_STAJ';
     StajDS.Open;
end;

procedure TfmSP_Staj.AddActionExecute(Sender: TObject);
var T: TfmStajEdit;
    SP:TpFibStoredProc;
    ID_SHABLON:Integer;
begin
     T:=TfmStajEdit.Create(self);
     if T.ShowModal=mrYes
     then begin
               SP:=TpFibStoredProc.Create(self);
               SP.Database:=WorkDatabase;
               SP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               StartHistory(WriteTransaction);
               SP.StoredProcName:='INI_STAJ_INS';
               SP.Prepare;
               SP.ParamByName('NAME_STAJ').Value          :=T.cxTextEdit1.Text;
               SP.ParamByName('IS_DEFAULT').Value          :='F';
               SP.ExecProc;
               ID_SHABLON:=SP.ParamByName('ID_STAJ').Value;
               SP.Close;
               SP.Free;
               WriteTransaction.Commit;
               StajDS.CloseOpen(true);
               StajDS.Locate('ID_STAJ',ID_SHABLON,[]);
     end;
     T.Free;
end;

procedure TfmSP_Staj.CancelActionExecute(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfmSP_Staj.EditActionExecute(Sender: TObject);
var T: TfmStajEdit;
    SP:TpFibStoredProc;
    ID_SHABLON:Integer;
begin
     T:=TfmStajEdit.Create(self);
     T.cxTextEdit1.EditValue:=StajDS.FieldByName('NAME_STAJ').Value;
     if T.ShowModal=mrYes
     then begin
               SP:=TpFibStoredProc.Create(self);
               SP.Database:=WorkDatabase;
               SP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               StartHistory(WriteTransaction);
               SP.StoredProcName:='INI_STAJ_UPD';
               SP.Prepare;
               ID_SHABLON:=StajDS.FieldByName('ID_STAJ').Value;
               SP.ParamByName('ID_STAJ').Value          :=ID_SHABLON;
               SP.ParamByName('NAME_STAJ').Value          :=T.cxTextEdit1.Text;
               SP.ParamByName('IS_DEFAULT').Value          :='F';
               SP.ExecProc;
               SP.Close;
               SP.Free;
               WriteTransaction.Commit;
               StajDS.CloseOpen(true);
               StajDS.Locate('ID_STAJ',ID_SHABLON,[]);
     end;
     T.Free;

end;

procedure TfmSP_Staj.RefreshActionExecute(Sender: TObject);
begin
     StajDS.CloseOpen(true);
end;

procedure TfmSP_Staj.EnterActionExecute(Sender: TObject);
begin
     if (StajDS.RecordCount>0)
     then begin
               staj_name :=StajDS.FieldByName('NAME_STAJ').AsString;
               id_staj := StajDS.FieldByName('ID_STAJ').Value;
               //ShowMessage(staj_name);
               ModalResult:=mrYes;
     end;
end;

procedure TfmSP_Staj.DeleteActionExecute(Sender: TObject);
var SP:TpFibStoredProc;
begin
     if (StajDS.RecordCount>0)
     then begin
               if agMessageDlg('Увага!','Ви хочете вилучити запис?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         SP:=TpFibStoredProc.Create(self);
                         SP.Database:=WorkDatabase;
                         SP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         StartHistory(WriteTransaction);
                         SP.StoredProcName:='ASUP_STAJ_DEL';
                         SP.Prepare;
                         SP.ParamByName('ID_STAJ').Value          :=stajDS.FieldByName('ID_STAJ').Value;
                         SP.ExecProc;
                         SP.Close;
                         SP.Free;
                         WriteTransaction.Commit;
                         StajDS.CacheDelete;
               end;
     end;
end;

procedure TfmSP_Staj.ReportDataViewDblClick(Sender: TObject);
begin
EnterActionExecute(Sender);
end;

procedure TfmSP_Staj.ShowInfoActionExecute(Sender: TObject);
begin
  ShowInfo(StajDS);
end;

end.
