unit BsGetInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, DB, FIBDataSet,
  pFIBDataSet, ExtCtrls, uConsts, uCommon_Messages, uCommon_Funcs, uCommon_Types,
  iBase, uCommon_Loader;

type
  TfrmGetInput = class(TForm)
    InputBox: TcxLookupComboBox;
    lblInput: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    InputDSet: TpFIBDataSet;
    InputDS: TDataSource;
    TimerEnter: TTimer;
    procedure TimerEnterTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure InputBoxPropertiesInitPopup(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure lblInputMouseEnter(Sender: TObject);
    procedure lblInputMouseLeave(Sender: TObject);
    procedure lblInputClick(Sender: TObject);
  private
    { Private declarations }
    IsAdmin:Boolean;
  public
    { Public declarations }
    DbHandle:TISC_DB_HANDLE;
    IdDisObject:Integer;
    constructor Create(AOwner:TComponent; isAdm:Boolean);reintroduce;
  end;

var
  frmGetInput: TfrmGetInput;

implementation

{$R *.dfm}

uses BsClient, BsClientEdit;

constructor TfrmGetInput.Create(AOwner:TComponent; isAdm:boolean);
begin
   inherited Create(AOwner);
   IsAdmin:=isAdm;
end;

procedure TfrmGetInput.TimerEnterTimer(Sender: TObject);
begin
   TimerEnter.Enabled:=True;
   InputDSet.Close;
   InputDSet.SQLs.SelectSQL.Text:='SELECT * FROM BS_GET_INPUT_BY_DIS_OBJECT(:KOD_INPUT_IN, :ID_DISCOUNT_OBJECT)';
   InputDSet.ParamByName('KOD_INPUT_IN').AsString:=InputBox.EditText;
   InputDSet.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=IdDisObject;
   InputDSet.Open;
   if not InputDSet.IsEmpty then
   begin
      InputBox.DroppedDown:=True;
   end;
end;

procedure TfrmGetInput.FormCreate(Sender: TObject);
var b:Byte;
begin
  b:=uCommon_Funcs.bsLanguageIndex();
  btnOk.Caption:=uConsts.bs_Accept[b];
  btnCancel.Caption:=uConsts.bs_Cancel[b];
end;

procedure TfrmGetInput.InputBoxPropertiesInitPopup(Sender: TObject);
begin
   if InputBox.EditText='' then
   begin
      InputDSet.Close;
      InputDSet.SQLs.SelectSQL.Text:='SELECT * FROM BS_GET_INPUT_BY_DIS_OBJECT(:KOD_INPUT_IN, :ID_DISCOUNT_OBJECT)';
      InputDSet.ParamByName('KOD_INPUT_IN').AsString:=InputBox.EditText;
      InputDSet.ParamByName('ID_DISCOUNT_OBJECT').AsInteger:=IdDisObject;
      InputDSet.Open;
   end;
end;

procedure TfrmGetInput.btnOkClick(Sender: TObject);
begin
   if InputBox.EditText<>'' then
   begin
      ModalResult:=mrOk;
   end;
end;

procedure TfrmGetInput.btnCancelClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmGetInput.lblInputMouseEnter(Sender: TObject);
begin
   Screen.Cursor:=crHandPoint;
end;

procedure TfrmGetInput.lblInputMouseLeave(Sender: TObject);
begin
   Screen.Cursor:=crDefault;
end;

procedure TfrmGetInput.lblInputClick(Sender: TObject);
var
  AParameter:TBsSimpleParams;
  InPutRes:Variant;
begin
  try
    AParameter:= TBsSimpleParams.Create;
    AParameter.Owner:=self;
    AParameter.Db_Handle:= DbHandle;
    AParameter.Formstyle:=fsNormal;
    AParameter.WaitPakageOwner:=self;
    AParameter.is_admin:=IsAdmin;
    InPutRes:=RunFunctionFromPackage(AParameter, 'BillingSystem\bs_sp_inputs.bpl','ShowSPInputs');
    AParameter.Free;
    if VarArrayDimCount(InPutRes)>0 then
    begin
       if InputDSet.Active then InputDSet.Close;
       InputDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_INPUT WHERE ID_INPUT=:ID_INPUT';
       InputDSet.ParamByName('ID_INPUT').AsInteger:=InPutRes[0];
       InputDSet.Open;
       InputBox.EditValue:=IntToStr(InPutRes[0]);
    end;
  except on E:exception
         do bsShowMessage('гтрур!', e.message, mtInformation, [mbOK]);
  end;
end;

end.
