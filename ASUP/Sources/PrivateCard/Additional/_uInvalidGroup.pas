unit _uInvalidGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, dxBar, dxBarExtItems, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, Grids, DBGrids;

type
  T_frmInvalidGroup = class(TForm)
    Panel2: TPanel;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    BtnAdd: TdxBarLargeButton;
    BtnUpd: TdxBarLargeButton;
    BtnSel: TdxBarLargeButton;
    BtnClose: TdxBarLargeButton;
    GroupSource: TDataSource;
    ASUP_ADD_PROP_INS: TDBGrid;
    GroupSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    Trans1: TpFIBTransaction;
    BtnDel: TdxBarLargeButton;
    BtnRef: TdxBarLargeButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnSelClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnUpdClick(Sender: TObject);
    procedure ASUP_ADD_PROP_INSDblClick(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BtnRefClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_group:Integer;
    name_group:String;
  end;

var
  _frmInvalidGroup: T_frmInvalidGroup;

implementation

uses _uInvalidDataModule, _uInvalidAdd, _uInvalidFrame, _uInvalidGroupEdit;

{$R *.dfm}

procedure T_frmInvalidGroup.FormCreate(Sender: TObject);
begin
    GroupSet.Close;
    GroupSet.SQLs.SelectSQL.Text:='select * from ASUP_ADD_PROPS';
    GroupSet.Open;
end;

procedure T_frmInvalidGroup.BtnSelClick(Sender: TObject);
begin
    id_group:=GroupSet['ID_PROP'];
    name_group:=GroupSet['PROP_NEME'];
    ModalResult:=mrOk;
end;

procedure T_frmInvalidGroup.BtnCloseClick(Sender: TObject);
begin
    ModalResult:=mrCancel;
end;

procedure T_frmInvalidGroup.BtnAddClick(Sender: TObject);
var frm:T_frmGroupEdit;
id_inv:Integer;
begin
   frm:=T_frmGroupEdit.Create(Self);
   frm.Caption:='Додати';
   StorProc.StoredProcName:='ASUP_ADD_PROP_INS';
   StorProc.Transaction.StartTransaction;
   if frm.ShowModal=mrOk then
   begin
       StorProc.Prepare;
       StorProc.ParamByName('PROP_NEME').AsString:=frm.InvEdit.Text;
       StorProc.ExecProc;
       id_inv:=StorProc.FieldByName('ID_PROP').AsInteger;
       StorProc.Transaction.Commit;
   end;
   frm.Free;
   GroupSet.Close;
   GroupSet.SQLs.SelectSQL.Text:='select * from asup_add_props';
   GroupSet.Open;
   GroupSet.Locate('id_prop',id_inv,[]);
end;

procedure T_frmInvalidGroup.BtnUpdClick(Sender: TObject);
var frm:T_frmGroupEdit;
id_inv:Integer;
begin
   frm:=T_frmGroupEdit.Create(Self);
   frm.Caption:='Змінити';
   id_inv:=GroupSet['ID_prop'];
   frm.InvEdit.Text:=GroupSet['prop_NEME'];
   StorProc.StoredProcName:='ASUP_ADD_PROPS_UPD';
   StorProc.Transaction.StartTransaction;
   if frm.ShowModal=mrOk then
   begin
       StorProc.Prepare;
       StorProc.ParamByName('ID_prop').AsInteger:=id_inv;
       StorProc.ParamByName('prop_NEME').AsString:=frm.InvEdit.Text;
       StorProc.ExecProc;
       StorProc.Transaction.Commit;
   end;
   frm.Free;
   GroupSet.Close;
   GroupSet.SQLs.SelectSQL.Text:='select * from asup_add_props';
   GroupSet.Open;
   GroupSet.Locate('id_prop',id_inv,[]);
end;
procedure T_frmInvalidGroup.ASUP_ADD_PROP_INSDblClick(Sender: TObject);
begin
    id_group:=GroupSet['ID_prop'];
    name_group:=GroupSet['prop_NEME'];
    ModalResult:=mrOk;
end;

procedure T_frmInvalidGroup.BtnDelClick(Sender: TObject);
begin
    if (GroupSet.RecordCount>0) then
    begin
        if messagedlg('Ви бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
        begin
             StorProc.StoredProcName:='asup_add_props_DEL';
             StorProc.Transaction.StartTransaction;
             StorProc.Prepare;
             StorProc.ParamByName('ID_prop').Value:=GroupSet['ID_prop'];
             StorProc.ExecProc;
             StorProc.Transaction.Commit;
        end;
    end;
   GroupSet.Close;
   GroupSet.SQLs.SelectSQL.Text:='select * from asup_add_props';
   GroupSet.Open;
end;

procedure T_frmInvalidGroup.BtnRefClick(Sender: TObject);
begin
    GroupSet.CloseOpen(True);
end;

end.
