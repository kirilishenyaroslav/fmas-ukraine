unit uMovingsRedact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uBoolControl, uLabeledFControl, uDateControl,
  StdCtrls, Buttons, uIntControl, uSpravControl, uCharControl, uFormControl,
  uFloatControl, uMovingsDataModule, uInvisControl, ActnList;

type
  TMovingsRedact_Form = class(TForm)
    qFBC_IsMain: TqFBoolControl;
    qFDC_ACC_Beg: TqFDateControl;
    qFDC_ACC_end: TqFDateControl;
    qFDC_Date_beg: TqFDateControl;
    qFCC_num_order: TqFCharControl;
    qFDC_dorder: TqFDateControl;
    qFSC_wreason: TqFSpravControl;
    qFSC_acccond: TqFSpravControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    qFFC_Movings: TqFFormControl;
    qFDC_STDBeg: TqFDateControl;
    qFDC_STDEnd: TqFDateControl;
    qFCC_STDOrder: TqFCharControl;
    qFDC_STDDO: TqFDateControl;
    qFIC_ACC_End: TqFInvisControl;
    qFIC_ACC_YEARS: TqFIntControl;
    ActionList1: TActionList;
    Action1: TAction;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure qFSC_wreasonOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_acccondOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFDC_STDBegChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  	Mode:TFormMode;
    constructor Create(AOwner: TComponent; DM: TdmMovings; Mode:TFormMode; where: variant);
        reintroduce;
  end;

var
  MovingsRedact_Form: TMovingsRedact_Form;

implementation

{$R *.dfm}

uses SpCommon, SpFormUnit;

constructor TMovingsRedact_Form.Create(AOwner: TComponent; DM: TdmMovings; Mode:TFormMode; where: variant);
begin
  inherited Create(AOwner);
  Self.Mode:=Mode;
  qFFC_Movings.Prepare(DM.DB, Mode, Where, Null);
end;


procedure TMovingsRedact_Form.OkButtonClick(Sender: TObject);
var date:Tdate;
    years:integer;
begin
  if ((not VarIsNull(qFDC_ACC_Beg.Value))and(not VarIsNull(qFIC_ACC_YEARS.Value)))
   then
   begin
     date:=qFDC_ACC_Beg.Value;
     years:=qFIC_ACC_YEARS.Value;
     qFIC_ACC_End.Value:=IncMonth(date,12*YEARS);
   end;
  qFFC_Movings.Ok;
end;

procedure TMovingsRedact_Form.CancelButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMovingsRedact_Form.qFSC_wreasonOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
  PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'asup_ini_work_reason';
		Title := 'Основания для работы';
		IdField := 'id_work_reason';
		SpFields := 'name_short, NAME_FULL';
		ColumnNames := 'Краткое наименование, Полное наименование';
    SpMode := spmSelect;
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     value:=form.ResultQuery['id_work_reason'];
     DisplayText:=form.ResultQuery['NAME_FULL'];
   end;
	form.Free;
  PropParams.Free;
end;

procedure TMovingsRedact_Form.qFSC_acccondOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
  PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'asup_orders_accept_cond';
		Title := 'Условия вступления в должность';
		IdField := 'id_accept_cond';
		SpFields := 'NAME_ACCEPT_COND';
		ColumnNames := 'Условия';
    SpMode := spmSelect;
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     value:=form.ResultQuery['id_accept_cond'];
     DisplayText:=form.ResultQuery['NAME_ACCEPT_COND'];
   end;
	form.Free;
  PropParams.Free;
end;

procedure TMovingsRedact_Form.qFDC_STDBegChange(Sender: TObject);
begin
  if (not Visible) then exit;
  qFDC_ACC_Beg.Value := qFDC_STDBeg.Value;
end;

end.
