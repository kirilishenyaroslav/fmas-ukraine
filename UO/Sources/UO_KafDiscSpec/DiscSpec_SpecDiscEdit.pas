unit DiscSpec_SpecDiscEdit;
{ Содержит функции:
function AddSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE):Int64;
procedure EditSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);
procedure DeleteSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxLabel, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  FIBDatabase, pFIBDatabase, Ibase, FIBQuery, pFIBQuery, pFIBStoredProc, uUO_Resources,
  uPrK_Loader, uPrK_Resources, DB,
  FIBDataSet, pFIBDataSet, DiscSpec_dmCommonStyles, AArray, uUO_Loader;

type
  TfSpecDiscEdit = class(TForm)
    SpecLabel: TcxLabel;
    SpecBE: TcxButtonEdit;
    DiscLabel: TcxLabel;
    DiscBE: TcxButtonEdit;
    OkButton: TcxButton;
    ActionList1: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    CancelButton: TcxButton;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DSet: TpFIBDataSet;
    procedure SpecBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DiscBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    pID_SPEC:Int64;
    pID_DISC:Int64;
    pID_NAKAZ:Int64;
    pRejim:UORejim;
  public
    { Public declarations }
    pID_DISC_SPEC:Int64;
    constructor Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;ARejim:UORejim; AID:Int64 = -1);reintroduce;
  end;

function AddSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE):Int64;
procedure EditSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);
procedure DeleteSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);

implementation

{$R *.dfm}

uses uSpecKlassSprav;

function AddSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE):Int64;
var ViewForm:TfSpecDiscEdit;
begin
  Result:=-1;
  ViewForm:=TfSpecDiscEdit.Create(AOwner,ADB_HANDLE,uoAdd,-1);
  if ViewForm.ShowModal=mrOk then
    Result:=ViewForm.pID_DISC_SPEC;
  ViewForm.Release;
end;

procedure EditSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);
var ViewForm:TfSpecDiscEdit;
begin
  ViewForm:=TfSpecDiscEdit.Create(AOwner,ADB_HANDLE,uoEdit,AID);
  ViewForm.ShowModal;
  ViewForm.Release;
end;

procedure DeleteSpecDisc(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;AID:Int64);
var ViewForm:TfSpecDiscEdit;
begin
  ViewForm:=TfSpecDiscEdit.Create(AOwner,ADB_HANDLE,uoDelete,AID);
  if prkMessageDlg('Видалення','Ви дійсно бажаєте видалити запис?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    ViewForm.OkActionExecute(nil);
  ViewForm.Release;
end;


constructor TfSpecDiscEdit.Create(AOwner:TComponent;ADB_HANDLE:TISC_DB_HANDLE;ARejim:UORejim;AID:Int64 = -1);
begin
  inherited Create(AOwner);

  DB.Handle:=ADB_HANDLE;
  Transaction.Active:=True;

  pID_DISC_SPEC:=AID;
  pRejim:=ARejim;

  pID_NAKAZ:=-1;
  pID_SPEC:=-1;
  pID_DISC:=-1;

  Caption:=GetEditCaption(pRejim);

  if (pID_DISC_SPEC<>-1) and (pRejim=uoEdit) then
    begin
      if DSet.Active then DSet.Close;
      DSet.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_DISC_SPEC_S_BY_ID('+IntToStr(pID_DISC_SPEC)+')';
      DSet.Open;

      pID_SPEC:=DSet['ID_SP_SPEC'];
      pID_DISC:=DSet['ID_SP_DISC'];
      SpecBE.Text:=DSet['NAME_SPEC'];
      DiscBE.Text:=DSet['NAME_DISC'];
      pID_NAKAZ:=DSet['ID_SP_DISC_SPEC_NAKAZ'];
    end;
end;

procedure TfSpecDiscEdit.SpecBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
{var
  AParameter:TcnSimpleParams;
  Res :variant;
begin
  AParameter                := TcnSimpleParams.Create;
  AParameter.Owner          := self;
  AParameter.Db_Handle      := DB.Handle;
  AParameter.Formstyle      := fsNormal;
  AParameter.WaitPakageOwner:= self;

  AParameter.DontShowGroups := False;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if ((Res[0]<>Null) and (Res[1]<>Null))  then
      begin
          pID_SPEC:=Res[1];
          SpecBE.Text        := Res[4];
      end;
  end;
end; }
var Res:Variant;
begin
  Res:=uSpecKlassSprav.ViewPubSpUspec(Self,DB.Handle,fsNormal);
  if VarArrayDimCount(Res) > 0 then
    begin
      pID_SPEC:=Res[0];
      SpecBE.Text:=Res[1];
    end;
end;

procedure TfSpecDiscEdit.DiscBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    InputParam : TAArray;
  Res:Variant;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_DISC.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(DB.Handle);
  //  InputParam['Input']['id_user'].AsInteger        := -1;
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
//    InputParam['Input']['GodNabora'].AsInt64            := God_Nabora;
//    InputParam['Input']['ID_USER_GLOBAL'].AsInt64       := ID_USER_GLOBAL;
  {  Res:=}uUO_Loader.ShowAllUOBpl(self, InputParam);
    if not VarIsNull(InputParam['OutPut']['ID_SP_DISC'].AsVariant) then
      begin
        pID_DISC:=InputParam['OutPut']['ID_SP_DISC'].AsInt64;
        DiscBE.Text:=InputParam['OutPut']['NAME'].AsString;
      end;
end;

procedure TfSpecDiscEdit.OkActionExecute(Sender: TObject);
begin
 try
  StoredProc.Transaction.StartTransaction;
  if (pRejim<>uoDelete) and ((pID_SPEC=-1) or (pID_DISC=-1)) then
    begin
      prkMessageDlg('Увага','Не всі поля заповнені',mtInformation,[mbOK],0);
      Exit;
    end;
  case pRejim of
    uoAdd:begin
            StoredProc.StoredProcName:='UO_SP_DISC_SPEC_I';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SP_SPEC').AsInt64:=pID_SPEC;
            StoredProc.ParamByName('ID_SP_DISC').AsInt64:=pID_DISC;
            StoredProc.ParamByName('ID_SP_DISC_SPEC_NAKAZ').AsInt64:=pID_NAKAZ;
            StoredProc.ExecProc;
            pID_DISC_SPEC:=StoredProc.FN('ID_OUT').AsInt64;

          end;
    uoEdit:begin
            StoredProc.StoredProcName:='UO_SP_DISC_SPEC_U';
            StoredProc.Prepare;
            StoredProc.ParamByName('ID_SP_DISC_SPEC').AsInt64:=pID_DISC_SPEC;
            StoredProc.ParamByName('ID_SP_SPEC').AsInt64:=pID_SPEC;
            StoredProc.ParamByName('ID_SP_DISC').AsInt64:=pID_DISC;
            StoredProc.ParamByName('ID_SP_DISC_SPEC_NAKAZ').AsInt64:=pID_NAKAZ;
            StoredProc.ExecProc;
           end;
    uoDelete:begin
              StoredProc.StoredProcName:='UO_SP_DISC_SPEC_D';
              StoredProc.Prepare;
              StoredProc.ParamByName('ID_SP_DISC_SPEC').AsInt64:=pID_DISC_SPEC;
              StoredProc.ExecProc;
             end;
  end;
  StoredProc.Transaction.Commit;
  ModalResult:=mrOk;
 except
 on E:Exception do
   begin
     StoredProc.Transaction.Rollback;
     prkMessageDlg('Помилка',E.Message,mtError,[mbOK],0);
   end;
 end;
end;

procedure TfSpecDiscEdit.CancelActionExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfSpecDiscEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Transaction.Active:=False;
end;

end.
