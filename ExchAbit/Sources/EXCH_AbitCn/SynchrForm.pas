unit SynchrForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxMemo, ExtCtrls, DB, ADODB, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxDBEdit, cxLabel, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc, uAbitCn_Resources,uConstants,
  ibase, ActnList, ImgList  ;

type
  TSynchr_Form = class(TForm)
    SearchPanel: TPanel;
    SelectBtn: TcxButton;
    cxLabelNAME_VIDSP: TcxLabel;
    cxDBTextEditNAME_VIDSP: TcxDBTextEdit;
    cxDBTextEditNAME_FAK: TcxDBTextEdit;
    cxLabelNAME_FAK: TcxLabel;
    cxLabelNAME_SPEC: TcxLabel;
    cxDBTextEditNAME_SPEC: TcxDBTextEdit;
    cxDBTextEditNAME_KOD_FORM: TcxDBTextEdit;
    cxLabelNAME_KOD_FORM: TcxLabel;
    cxLabelFIO: TcxLabel;
    cxDBTextEditFIO: TcxDBTextEdit;
    cxLabelMSNAME_VIDSP: TcxLabel;
    cxDBTextEditMSNAME_VIDSP: TcxDBTextEdit;
    cxLabelMSNAME_FAK: TcxLabel;
    cxDBTextEditMSNAME_FAK: TcxDBTextEdit;
    cxDBTextEditMSNAME_SPEC: TcxDBTextEdit;
    cxLabelMSNAME_SPEC: TcxLabel;
    cxLabelMSNAME_KOD_FORM: TcxLabel;
    cxDBTextEditMSNAME_KOD_FORM: TcxDBTextEdit;
    cxLabelMSFIO: TcxLabel;
    cxDBTextEditMSFIO: TcxDBTextEdit;
    LabelDog_nom: TLabel;
    cxTextEditDog_num: TcxTextEdit;
    cxButtonFiltr: TcxButton;
    LabelAbiturient: TLabel;
    spContracts: TpFIBStoredProc;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    dSetContrakts: TpFIBDataSet;
    ADOStoredProcWrite: TADOStoredProc;
    ActionList1: TActionList;
    ActionFilter: TAction;
    ActionOk: TAction;
    dsContrakts: TDataSource;
    db: TpFIBDatabase;
    CanselBtn: TcxButton;
    DelLinkBtn: TcxButton;
    ActionDelLink: TAction;
    ActionCansel: TAction;
    ImageListViewWithFilter: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionFilterExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure ActionCanselExecute(Sender: TObject);
    procedure ActionDelLinkExecute(Sender: TObject);
  private
    NST: Int64;
    ID_USER_GLOBAL : Int64;
  public
    constructor Create(AOwner: TComponent; TC: TADOConnection; DBHANDLE:TISC_DB_HANDLE;
        MSNAME_VIDSP,MSNAME_FAK,MSNAME_SPEC,MSNAME_KOD_FORM,MSFIO: String; xNST: Int64);overload;
  end;

procedure Synchr(AOwner:TComponent; TC: TADOConnection; DBHANDLE:TISC_DB_HANDLE;
    MSNAME_VIDSP,MSNAME_FAK,MSNAME_SPEC,MSNAME_KOD_FORM,MSFIO: String; xNST: Int64);

implementation

{$R *.dfm}
uses AccMgmt;
procedure Synchr(AOwner:TComponent; TC: TADOConnection; DBHANDLE:TISC_DB_HANDLE;
    MSNAME_VIDSP,MSNAME_FAK,MSNAME_SPEC,MSNAME_KOD_FORM,MSFIO: String; xNST: Int64);
var ViewForm:TSynchr_Form;
begin
  ViewForm:=TSynchr_Form.Create(AOwner,TC,DBHANDLE,MSNAME_VIDSP,MSNAME_FAK,MSNAME_SPEC,MSNAME_KOD_FORM,MSFIO,xNST);
  ViewForm.ShowModal;
  ViewForm.Release;
end;

constructor TSynchr_Form.Create(AOwner: TComponent; TC: TADOConnection; DBHANDLE:TISC_DB_HANDLE;
    MSNAME_VIDSP,MSNAME_FAK,MSNAME_SPEC,MSNAME_KOD_FORM,MSFIO: String; xNST: Int64);
begin
  inherited Create(AOwner);

  cxDBTextEditMSNAME_VIDSP.Text := MSNAME_VIDSP;
  cxDBTextEditMSNAME_FAK.Text := MSNAME_FAK;
  cxDBTextEditMSNAME_SPEC.Text := MSNAME_SPEC;
  cxDBTextEditMSNAME_KOD_FORM.Text := MSNAME_KOD_FORM;
  cxDBTextEditMSFIO.Text := MSFIO;

  NST := xNST;

  ADOStoredProcWrite.Connection := TC;
  db.Handle := DBHANDLE;

  dSetContrakts.Active :=false;
  dSetContrakts.SelectSQL.Clear;
  dSetContrakts.SQLs.SelectSQL.Text := 'Select * from EXCH_NST_DOG_GET_INF_BY_NUM(:num_dog)';
  dSetContrakts.ParamByName('num_dog').AsString := '';
  dSetContrakts.CloseOpen(false);
end;

procedure TSynchr_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ReadTransaction.Active then ReadTransaction.Commit;
  if WriteTransaction.Active then WriteTransaction.Rollback;
end;

procedure TSynchr_Form.ActionFilterExecute(Sender: TObject);
begin
  dSetContrakts.ParamByName('num_dog').AsString := cxTextEditDog_num.Text;
  dSetContrakts.CloseOpen(false);
end;

procedure TSynchr_Form.ActionOkExecute(Sender: TObject);
var ID_DOG_CN: int64;
begin
   ID_USER_GLOBAL        :=AccMgmt.GetUserId;
  if (not VarIsNull(dSetContrakts.FieldValues['id_man'])) then
  begin
    ADOStoredProcWrite.Close;
    ADOStoredProcWrite.ProcedureName := 'exch_dt_nst_dog_change';
    ADOStoredProcWrite.Parameters.Refresh;

    ADOStoredProcWrite.Parameters.ParamByName('@id_dt_nst_dog').Value :=-1;
    ADOStoredProcWrite.Parameters.ParamByName('@nst').Value :=NST;
    ID_DOG_CN := dSetContrakts.FieldValues['id_dog'];
    ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value := inttostr(ID_DOG_CN);
    ADOStoredProcWrite.Parameters.ParamByName('@NUM_DOG').Value := cxTextEditDog_num.Text;
    ADOStoredProcWrite.Parameters.ParamByName('@date_dog').Value :=dSetContrakts.FieldValues['date_dog'];
    ADOStoredProcWrite.Parameters.ParamByName('@id_dog_status').Value :=dSetContrakts.FieldValues['id_dog_status'];
    ADOStoredProcWrite.Parameters.ParamByName('@id_type_dog').Value :=dSetContrakts.FieldValues['id_type_dog'];
    ADOStoredProcWrite.Parameters.ParamByName('@summa').Value :=dSetContrakts.FieldValues['summa'];
    ADOStoredProcWrite.Parameters.ParamByName('@id_group').Value :=dSetContrakts.FieldValues['id_group'];
    ADOStoredProcWrite.Parameters.ParamByName('@date_beg').Value :=dSetContrakts.FieldValues['date_beg'];
    ADOStoredProcWrite.Parameters.ParamByName('@date_end').Value :=dSetContrakts.FieldValues['date_end'];
    ADOStoredProcWrite.Parameters.ParamByName('@vidpr').Value :=dSetContrakts.FieldValues['vidpr'];
    ADOStoredProcWrite.ExecProc;

    spContracts.Transaction.StartTransaction;
    spContracts.StoredProcName:='EXCH_DT_NST_DOG_CHANGE';
    spContracts.Prepare;
    spContracts.ParamByName('id_dt_nst_dog').AsInt64   := -1;
    spContracts.ParamByName('NST').AsInt64 := NST;
    spContracts.ParamByName('ID_DOG').AsInt64 := dSetContrakts.FieldValues['id_dog'];
    spContracts.ParamByName('ID_DEPARTMENT').AsInt64 := dSetContrakts.FieldValues['ID_DEPARTMENT'];
    spContracts.ParamByName('id_man').AsInt64 := dSetContrakts.FieldValues['id_man'];
    spContracts.ParamByName('id_cn_sp_national').AsInt64 := dSetContrakts.FieldValues['id_cn_sp_national'];
    spContracts.ParamByName('date_beg').AsDate := dSetContrakts.FieldValues['date_beg'];
    spContracts.ParamByName('date_end').AsDate := dSetContrakts.FieldValues['date_end'];
    //showmessage(inttostr(ID_USER_GLOBAL));
    spContracts.ParamByName('id_owner').AsInt64 := ID_USER_GLOBAL;
    spContracts.ExecProc;
    spContracts.Transaction.Commit;
  end;

  ModalResult:=mrOk;
end;

procedure TSynchr_Form.ActionCanselExecute(Sender: TObject);
begin
  ModalResult:=mrCancel	;

end;

procedure TSynchr_Form.ActionDelLinkExecute(Sender: TObject);
var ID_DOG_CN: int64;
begin

  if ((not VarIsNull(dSetContrakts.FieldValues['ID_DOG']))
        and (uAbitCnMessageDlg(nMsgBoxTitle[0],'Ви дійсно бажаєте видалити зв`язок із контрактом?',
                        mtInformation,mbOKCancel,0)=mrOK)) then
  begin
    ADOStoredProcWrite.Close;
    ADOStoredProcWrite.ProcedureName := 'EXCH_DT_NST_DOG_DEL_NST_DOG';
    ADOStoredProcWrite.Parameters.Refresh;

    ADOStoredProcWrite.Parameters.ParamByName('@nst').Value :=NST;
    ID_DOG_CN := dSetContrakts.FieldValues['id_dog'];
    ADOStoredProcWrite.Parameters.ParamByName('@ID_DOG_CN').Value := inttostr(ID_DOG_CN);
    ADOStoredProcWrite.ExecProc;

    spContracts.Transaction.StartTransaction;
    spContracts.StoredProcName:='EXCH_DT_NST_DOG_DEL_NST_DOG';
    spContracts.Prepare;
    spContracts.ParamByName('NST').AsInt64 := NST;
    spContracts.ParamByName('ID_DOG').AsInt64 := dSetContrakts.FieldValues['id_dog'];
    spContracts.ExecProc;
    spContracts.Transaction.Commit;
  end;

end;

end.
