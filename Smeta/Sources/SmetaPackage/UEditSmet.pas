unit UEditSmet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, FIBDataSet, pFIBDataSet, DBCtrls,
  pFibStoredProc, Resources_unitb, cxLookAndFeelPainters, cxButtons,
  ActnList, pFibDataBase, Ibase, FIBDatabase, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit;

type
  TfrmEditSmet = class(TForm)
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    EdKod: TEdit;
    EdTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    chbEnabled: TCheckBox;
    EmptyNomerButton: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    LocalUseDb: TpFIBDatabase;
    LocalUseReadTransaction: TpFIBTransaction;
    LocalUseWriteTransaction: TpFIBTransaction;
    EditDepartment: TcxButtonEdit;
    Label3: TLabel;
    is_with_nds: TCheckBox;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure EmptyNomerButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    edit_flag:Boolean;
    view_falg:Boolean;
    LocalRefreshDataSet:TpFIBDataSet;
    LocalSm_Kod:String;
    LocalSmTitle:String;
    LocalSmEnable:Boolean;
    LocalId_user:Int64;
    LocalIdSmeta:Integer;
    IdDepartment:Int64;
    function CheckInputData:Boolean;
  procedure InputData;
  procedure UpdateData;
    { Public declarations }
  constructor Create(AOwner:TComponent;
                     DBHandle:TISC_DB_HANDLE;
                     UseDB:TpFibDataBase;
                     UseTransaction:TpFIBTransaction;
                     id_user:Int64;
                     RefreshDataSet:TpFIBDataSet;
                     IsInserting:Boolean=true;
                     IsViewing:Boolean=false;
                     Sm_Kod:string='';
                     SmTitle:string='';
                     id_dep:Int64=-1;
                     dep_name:string='';
                     SmEnable:Boolean=True;
                     IdSmeta:Int64=-1;
                     is_with_nds:Integer=0
                     );reintroduce;
  end;

implementation

uses BaseTypes, uGetEmptyNomer, uCommonSP;
{$R *.dfm}

procedure TfrmEditSmet.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize:=false;
end;

procedure TfrmEditSmet.FormShow(Sender: TObject);
begin
     if edit_flag
     then begin
                EmptyNomerButton.Visible:=false;
                EdKod.text              :=LocalSm_Kod;
                EdTitle.Text            :=LocalSmTitle;
                chbEnabled.Checked      :=LocalSmEnable;
     end;
     if view_falg
     then begin
                Button1.Visible:=false;
     end;
end;

procedure TfrmEditSmet.Button1Click(Sender: TObject);
begin
      if CheckInputData
      then begin
           if Edit_Flag
           then UpdateData
           else InputData;
           ModalResult:=mrYes;
      end;
end;

procedure TfrmEditSmet.Button2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

function TfrmEditSmet.CheckInputData: Boolean;
var ResChecking:Boolean;
begin
        ResChecking:=true;

        if (EdKod.Text='') and ResChecking
        then begin
             EdKod.SetFocus;
             ResChecking:=false;
             BaseTypes.agMessageDlg(BU_ErrorCaption,BU_TitleError,mtWarning,[mbOk]);
        end;

        if (EdTitle.Text='') and ResChecking
        then begin
             EdTitle.SetFocus;
             ResChecking:=false;
             BaseTypes.agMessageDlg(BU_ErrorCaption,BU_TitleError,mtWarning,[mbOk]);
        end;

        CheckInputData:=ResChecking;
end;

procedure TfrmEditSmet.InputData;
var Proc:TpFibStoredProc;
    id:integer;
begin
            id:=-1;
            Proc:=TpFibStoredProc.Create(self);
            Proc.Database:=LocalUseDB;
            Proc.Transaction:=LocalUseWriteTransaction;
            proc.StoredProcName:='PUB_SPR_SMETA_INSERT';
            LocalUseWriteTransaction.StartTransaction;
            try
                  proc.Prepare;
                  proc.ParamByName('P_SMETA_TITLE').value    :=EdTitle.Text;
                  proc.ParamByName('P_SMETA_KOD').asString   :=EdKod.Text;
                  proc.ParamByName('P_SMETA_ENABLED').value  :=chbEnabled.Checked;
                  proc.ParamByName('P_ID_GROUP').value       :=null;
                  proc.ParamByName('P_ID_USER').asInt64      :=LocalId_user;
                  proc.parambyName('P_ID_DEPARTMENT').asInt64:=IdDepartment;
                  proc.parambyName('P_IS_WITH_NDS').value    :=Integer(is_with_nds.Checked);
                  proc.ExecProc;
                  id:=proc.ParamByName('P_ID_SMETA').ASInteger;
            except on E:Exception do
                  begin
                     BaseTypes.agMessageDlg(BU_ErrorCaption,E.Message,mtWarning,[mbOk]);
                     LocalUseWriteTransaction.Rollback;
                  end;
            end;

            LocalUseWriteTransaction.Commit;

            if Assigned(LocalRefreshDataSet)
            then begin
                      LocalRefreshDataSet.CloseOpen(true);
                      LocalRefreshDataSet.Locate('P_ID_SMETA',id,[]);
            end;

            Proc.Free;
end;

procedure TfrmEditSmet.UpdateData;
var Proc:TpFibStoredProc;
    id:integer;
begin
      id:=LocalIdSmeta;
      Proc:=TpFibStoredProc.Create(self);
      Proc.Database:=LocalUseDB;
      Proc.Transaction:=LocalUseWriteTransaction;
      proc.StoredProcName:='PUB_SPR_SMETA_UPDATE';
      LocalUseWriteTransaction.StartTransaction;
      try
            proc.Prepare;
            id:=LocalIdSmeta;
            proc.ParamByName('P_ID_SMETA').value:=id;
            proc.ParamByName('P_SMETA_TITLE').value:=EdTitle.Text;
            proc.ParamByName('P_SMETA_KOD').asString:=EdKod.Text;
            proc.ParamByName('P_SMETA_ENABLED').value:=chbEnabled.Checked;
            proc.ParamByName('P_ID_GROUP').value:=null;
            proc.ParamByName('P_ID_USER').AsInt64 :=LocalId_user;
            proc.ParamByName('P_ID_DEPARTMENT').AsInt64 :=IDDepartment;
            proc.ParamByName('BOOK_DATE').value:=Date;
            proc.ParamByName('P_IS_WITH_NDS').value:=Integer(is_with_nds.Checked);
            proc.ExecProc;

      except on E:Exception do
            begin
                 BaseTypes.agMessageDlg(BU_ErrorCaption,E.Message,mtWarning,[mbOk]);
                 LocalUseWriteTransaction.Rollback;
            end;
      end;
      LocalUseWriteTransaction.Commit;

      if Assigned(LocalRefreshDataSet)
      then begin
                LocalRefreshDataSet.CloseOpen(true);
                LocalRefreshDataSet.Locate('P_ID_SMETA',id,[]);
      end;

      Proc.Free;
end;

procedure TfrmEditSmet.EmptyNomerButtonClick(Sender: TObject);
var
  T: TfrmGetEmptyNomer;
begin
       T:=TfrmGetEmptyNomer.Create(self, LocalUseDB, LocalUseWriteTransaction);
       if T.ShowModal=mrYes
       then begin
                 EdKod.Text:=IntToStr(T.EmptyNomer);
       end;
       T.Free;
end;

constructor TfrmEditSmet.Create(AOwner:TComponent;
                     DBHandle:TISC_DB_HANDLE;
                     UseDB:TpFibDataBase;
                     UseTransaction:TpFIBTransaction;
                     id_user:Int64;
                     RefreshDataSet:TpFIBDataSet;
                     IsInserting:Boolean=true;
                     IsViewing:Boolean=false;
                     Sm_Kod:string='';
                     SmTitle:string='';
                     id_dep:Int64=-1;
                     dep_name:string='';
                     SmEnable:Boolean=True;
                     IdSmeta:Int64=-1;
                     is_with_nds:Integer=0);
begin
     inherited Create(AOwner);

     LocalUseDB.Handle:=DBHandle;
     //LocalUseReadTransaction.StartTransaction;

     EmptyNomerButton.Visible:=false;

     if IsInserting
     then edit_flag:=false
     else edit_flag:=True;

     if IsViewing
     then view_falg:=True
     else view_falg:=False;

     LocalSm_Kod:=Sm_Kod;
     LocalSmTitle:=SmTitle;
     LocalSmEnable:=SmEnable;
     IdDepartment:=id_dep;
     EditDepartment.Text:=dep_name;
     self.is_with_nds.Checked:=Boolean(is_with_nds);


     LocalId_user:=Id_user;
     LocalIdSmeta:=IdSmeta;

     LocalRefreshDataSet:=RefreshDataSet;
end;

procedure TfrmEditSmet.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalUseDb.Handle);
            FieldValues['ShowStyle'] := 0;
            FieldValues['Select'] := 1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
       begin
        EditDepartment.Text := sp.Output['NAME_FULL'];
        Iddepartment := sp.Output['ID_DEPARTMENT'];
       end;
    sp.Free;
end;

end.
