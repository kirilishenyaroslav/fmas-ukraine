unit uInvalidGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, dxBar, dxBarExtItems, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, Grids, DBGrids, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ActnList;

type
  TfrmInvalidGroup = class(TForm)
    Panel2: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    BtnAdd: TdxBarLargeButton;
    BtnUpd: TdxBarLargeButton;
    BtnSel: TdxBarLargeButton;
    BtnClose: TdxBarLargeButton;
    GroupSource: TDataSource;
    GroupSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    Trans1: TpFIBTransaction;
    BtnDel: TdxBarLargeButton;
    BtnRef: TdxBarLargeButton;
    InvalidGridDBTableView: TcxGridDBTableView;
    InvalidGridLevel: TcxGridLevel;
    InvalidGrid: TcxGrid;
    InvalidGridDBTableViewDBColumn1: TcxGridDBColumn;
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
    qizzStyle: TcxGridTableViewStyleSheet;
    ActionList1: TActionList;
    InsAct: TAction;
    EditAct: TAction;
    RefreshAct: TAction;
    SelectAct: TAction;
    CloseAct: TAction;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure InvalidGridDBTableViewDblClick(Sender: TObject);
    procedure InsActExecute(Sender: TObject);
    procedure EditActExecute(Sender: TObject);
    procedure RefreshActExecute(Sender: TObject);
    procedure SelectActExecute(Sender: TObject);
    procedure CloseActExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_group:Integer;
    name_group:String;
  end;

var
  frmInvalidGroup: TfrmInvalidGroup;

implementation

uses uInvalidDataModule, uInvalidAdd, uInvalidFrame, uInvalidGroupEdit;

{$R *.dfm}

procedure TfrmInvalidGroup.FormCreate(Sender: TObject);
begin
    GroupSet.Close;
    GroupSet.SQLs.SelectSQL.Text:='select * from ASUP_SP_INVALID';
    GroupSet.Open;
end;

procedure TfrmInvalidGroup.DBGrid1DblClick(Sender: TObject);
begin
    id_group:=GroupSet['ID_INVALID'];
    name_group:=GroupSet['NAME_INVALID'];
    ModalResult:=mrOk;
end;

procedure TfrmInvalidGroup.BtnDelClick(Sender: TObject);
begin
    if (GroupSet.RecordCount>0) then
    begin
        if messagedlg('Ви бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        begin
           StorProc.StoredProcName:='ASUP_SP_INVALID_DEL';
           StorProc.Transaction.StartTransaction;
           StorProc.Prepare;
           StorProc.ParamByName('ID_INVALID').Value:=GroupSet['ID_INVALID'];
           StorProc.ExecProc;
           StorProc.Transaction.Commit;
        end;
    end;
   GroupSet.Close;
   GroupSet.SQLs.SelectSQL.Text:='select * from ASUP_SP_INVALID';
   GroupSet.Open;
end;

procedure TfrmInvalidGroup.InvalidGridDBTableViewDblClick(Sender: TObject);
begin
    SelectActExecute(Self);
end;

procedure TfrmInvalidGroup.InsActExecute(Sender: TObject);
var frm:TfrmGroupEdit;
id_inv:Integer;
begin
   frm:=TfrmGroupEdit.Create(Self);
   frm.Caption:='Додати';
   StorProc.StoredProcName:='ASUP_SP_INVALID_INS';
   StorProc.Transaction.StartTransaction;
   if frm.ShowModal=mrOk then
   begin
       StorProc.Prepare;
       StorProc.ParamByName('NAME_INVALID').AsString:=frm.InvEdit.Text;
       StorProc.ExecProc;
       id_inv:=StorProc.FieldByName('ID_INVALID').AsInteger;
       StorProc.Transaction.Commit;
   end;
   frm.Free;
   GroupSet.Close;
   GroupSet.SQLs.SelectSQL.Text:='select * from ASUP_SP_INVALID';
   GroupSet.Open;
   GroupSet.Locate('id_invalid',id_inv,[]);
end;

procedure TfrmInvalidGroup.EditActExecute(Sender: TObject);
var frm:TfrmGroupEdit;
id_inv:Integer;
begin
   frm:=TfrmGroupEdit.Create(Self);
   frm.Caption:='Змінити';
   id_inv:=GroupSet['ID_INVALID'];
   frm.InvEdit.Text:=GroupSet['NAME_INVALID'];
   StorProc.StoredProcName:='ASUP_SP_INVALID_UPD';
   StorProc.Transaction.StartTransaction;
   if frm.ShowModal=mrOk then
   begin
       StorProc.Prepare;
       StorProc.ParamByName('ID_INVALID').AsInteger:=id_inv;
       StorProc.ParamByName('NAME_INVALID').AsString:=frm.InvEdit.Text;
       StorProc.ExecProc;
       StorProc.Transaction.Commit;
   end;
   frm.Free;
   GroupSet.Close;
   GroupSet.SQLs.SelectSQL.Text:='select * from ASUP_SP_INVALID';
   GroupSet.Open;
   GroupSet.Locate('id_invalid',id_inv,[]);
end;

procedure TfrmInvalidGroup.RefreshActExecute(Sender: TObject);
begin
    GroupSet.CloseOpen(True);
end;

procedure TfrmInvalidGroup.SelectActExecute(Sender: TObject);
begin
    id_group:=GroupSet['ID_INVALID'];
    name_group:=GroupSet['NAME_INVALID'];
    ModalResult:=mrOk;
end;

procedure TfrmInvalidGroup.CloseActExecute(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

end.
