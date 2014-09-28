unit uPensionAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, CheckEditUnit, StdCtrls, ComCtrls, SpComboBox, SpCommon,
  FieldControl, ExtCtrls, Buttons, EditControl,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, uMemoControl, uLabeledFControl, uSpravControl,
  uDateControl, uFormControl, uCharControl, uInvisControl, uLogicCheck,
  uSimpleCheck, uFControl, cxCheckBox, cxLabel, BaseTypes, iBase;

type
  TAddPension = class(TForm)
    Panel1: TPanel;
    SbCancel: TBitBtn;
    SbOk: TBitBtn;
    PensionCat: TqFSpravControl;
    PensionVid: TqFSpravControl;
    PensionNote: TqFMemoControl;
    PensionProp: TqFSpravControl;
    qFIC_id_pcard: TqFInvisControl;
    qFSC1: TqFSimpleCheck;
    qFSC2: TqFSimpleCheck;
    qFSC3: TqFSimpleCheck;
    cbInfinityDate: TcxCheckBox;
    PensionDateBeg: TcxDateEdit;
    lbDateBeg: TcxLabel;
    PensionDateEnd: TcxDateEdit;
    lbDateEnd: TcxLabel;
    PensionDateStart: TcxDateEdit;
    lbDateStart: TcxLabel;
    PensionDateWork: TcxDateEdit;
    lbDateWork: TcxLabel;
    PensionOrderNum: TcxTextEdit;
    lbNumOrder: TcxLabel;
    PensionDateOrder: TcxDateEdit;
    lbDateOrder: TcxLabel;
    PensionDok: TcxTextEdit;
    lbDoc: TcxLabel;
    PensionReport: TcxDateEdit;
    lbReport: TcxLabel;
    procedure FormCreate(Sender: TObject);
    procedure SbOkClick(Sender: TObject);
    procedure SbCancelClick(Sender: TObject);
    procedure PensionCatOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PensionVidOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure PensionPropOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure cbInfinityDateClick(Sender: TObject);
    procedure PensionDateStartPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    DHandle:Tisc_Db_Handle;
  public
    Inf_Date : TDateTime;
  	Mode:TFormMode;

    id_pcard,id:integer;
    FormControl: TEditControl;
    constructor Create(AOwner: TComponent; DbHandle:TISC_DB_HANDLE);reintroduce;
end;

var
  AddPension: TAddPension;

implementation

{$R *.dfm}

uses uCommonSp, SpFormUnit, FIBQuery, DB;

constructor TAddPension.Create(AOwner: TComponent; DbHandle:TISC_DB_HANDLE);
begin
   inherited Create(AOwner);
   DHandle:=DbHandle;
end;


{constructor TAddPension.Create(AOwner: TComponent; DM: TdmPension; Mode:TFormMode; Id_PCard: Integer; where: variant);
begin
  inherited Create(AOwner);
  Self.DM := DM;
  Self.Mode:=Mode;
  qFIC_id_pcard.Value:=Id_PCard;
  qFFC_Pension.Prepare(DM.DB, Mode, Where, Null);
  qFIC_id_pcard.Value:=Id_PCard;
  DM.InfinityDate.Close;
  DM.InfinityDate.Open;
  Inf_Date:=DM.InfinityDateINFINITY_DATE.Value;
end;  }

procedure TAddPension.FormCreate(Sender: TObject);
begin
   // DM:=TdmPension.Create(Self);

   { qFDC_DateBeg.Value:=Date;
    qFDC_DateEnd.Value:=Date;
    qFDC_DateStart.Value:=Date;
    qFDC_DateWork.Value:=Date;
    qFDC_DateOrder.Value:=Date;
    qFDC_Report.Value:=Date;
{    DTP_Date_order.Date:=Date();
    DTP_Date_start.Date:=Date();
    DTP_Date_work_beg.Date:=Date();
    DTP_Date_beg.Date:=Date();
    DTP_Date_end.Date:=Date();
    FormControl := TEditControl.Create;
    FormControl.Add([FC_Cat,FC_Type,FC_Prop]);
    FormControl.Prepare(emNew);}
end;

procedure TAddPension.SbOkClick(Sender: TObject);
var flag:Boolean;
begin
  flag:=True;
  if PensionDateBeg.Text='' then
  begin
     agMessageDlg('Увага!', 'Ви не заповнили поле "Дата початку"!', mtInformation, [mbOK]);
     PensionDateBeg.Style.Color:=clRed;
     flag:=False;
  end;
  if ((PensionDateBeg.Text<>'') and (PensionDateEnd.Text<>'')) then
      if PensionDateEnd.Date<PensionDateBeg.Date then
      begin
         agMessageDlg('Увага!', 'Дата кінця повина бути більш, ніж дата початку!', mtInformation, [mbOK]);
         PensionDateBeg.Style.Color:=clRed;
         PensionDateEnd.Style.Color:=clRed;
         flag:=False;
      end;
  try
    if flag then ModalResult:=mrOk;
    //qFFC_Pension.Ok;
  except on e: Exception do
         begin
             MessageDlg('Не вдалося змінити запис: '+#13+e.Message,mtError,[mbYes],0);
             ModalResult:=0;
         end;
  end;

end;

procedure TAddPension.SbCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TAddPension.PensionCatOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpPensionCategory');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DHandle);
            //FieldValues['ModeEdit'] := 1;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    if ((not sp.Output.IsEmpty) and (sp.Output<>nil)) then
    begin
       Value:=sp.Output['Id_Pension_Cat'];
       DisplayText:=sp.Output['Name_Pension_Cat'];
    end;

end;

procedure TAddPension.PensionVidOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
  PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'asup_sp_pension_type';
		Title := 'Види пенсій';
		IdField := 'id_pension_type';
		SpFields := 'name_pension_type';
		ColumnNames := 'Види пенсій';
    SpMode := [spfModify,spfFind,spfSelect,spfExt];
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     value:=form.ResultQuery['id_pension_type'];
     DisplayText:=form.ResultQuery['name_pension_type'];
   end;
	form.Free;
  PropParams.Free;
end;

procedure TAddPension.PensionPropOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
	form: TSpForm;
 	PropParams: TSpParams;
begin
  PropParams:=TSpParams.Create;
	with PropParams do
	begin
		Table := 'asup_sp_pension_prop';
		Title := 'Ознаки пенсій';
		IdField := 'id_pension_prop';
		SpFields := 'name_pension_prop';
		ColumnNames := 'Ознаки пенсій';
    SpMode := [spfModify,spfFind,spfSelect,spfExt];
	end;
	form := TSpForm.Create(Self);
	form.Init(PropParams);
	if (form.ShowModal=mrOk) then
   begin
     value:=form.ResultQuery['id_pension_prop'];
     DisplayText:=form.ResultQuery['name_pension_prop'];
   end;
	form.Free;
  PropParams.Free;
end;

procedure TAddPension.cbInfinityDateClick(Sender: TObject);
begin
    PensionDateEnd.Enabled := not cbInfinityDate.Checked;
    PensionDateEnd.Visible := not cbInfinityDate.Checked;
    if cbInfinityDate.Checked then PensionDateEnd.Date := EncodeDate(9999, 12, 31);
end;

procedure TAddPension.PensionDateStartPropertiesChange(Sender: TObject);
begin
   PensionDateWork.Date:=PensionDateStart.Date;
end;

end.
