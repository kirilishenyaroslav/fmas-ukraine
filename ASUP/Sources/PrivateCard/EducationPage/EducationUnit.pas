unit EducationUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, CheckEditUnit, ComCtrls, SpComboBox, Variants,
  DB, IBCustomDataSet, FIBDataSet, pFIBDataSet, FieldControl,
  EditControl,SpCommon, uEducationDataModule, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, uFormControl,
  uBoolControl, uCharControl, uDateControl, uFControl, uLabeledFControl,
  uSpravControl, uLogicCheck, uSimpleCheck, uInvisControl, uIntControl, ibase,
  cxLabel;

type
  TEducMode=(emEducation,emKvalification);
  TEducationForm = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    AkreditationQuery: TpFIBDataSet;
    qFSC_Educ: TqFSpravControl;
    qFSC_Org: TqFSpravControl;
    qFDC_Beg: TqFDateControl;
    qFDC_End: TqFDateControl;
    qFSC_Spec: TqFSpravControl;
    qFSC_Kval: TqFSpravControl;
    qFDC_Diplom: TqFDateControl;
    qFBoolControl1: TqFBoolControl;
    qFFC_Educ: TqFFormControl;
    qFSimpleCheck1: TqFSimpleCheck;
    qFSimpleCheck2: TqFSimpleCheck;
    qFIC_PCard: TqFInvisControl;
    qFIC_Akr: TqFIntControl;
    qFInvisControl1: TqFInvisControl;
    DiplomNumberEdit: TcxTextEdit;
    lbDiplomNumber: TcxLabel;
    procedure OkButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure Focus(Sender: TObject);
    procedure EducOrgSpComboBoxChange(Sender: TObject);
    procedure qFSC_EducOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_SpecOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_KvalOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFSC_OrgOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure qFDC_EndChange(Sender: TObject);
    procedure DiplomNumberEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DiplomNumberEditClick(Sender: TObject);
    procedure DiplomNumberEditEnter(Sender: TObject);
    procedure DiplomNumberEditExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DHandle:TISC_DB_HANDLE;
    IsCapsLockOn:Boolean;
    { Private declarations }
  public
    DM:TdmEducation;
 	  id,idpcard:Integer;
  	Mode:TFormMode;
    HDLE:Integer;
    constructor Create(AOwner:TComponent; DBH:TISC_DB_HANDLE); reintroduce;
    function IsPressedCapsLock:Boolean;
    procedure PressedCapsLock;
  end;

var
  EducationForm: TEducationForm;

implementation

{$R *.DFM}

uses SpFormUnit, uCommonSp,  RxMemDS, uUnivSprav, uSpEducOrg;

constructor TEducationForm.Create(AOwner:TComponent; DBH:TISC_DB_HANDLE);
begin
   inherited Create(AOwner);
   DHandle:=DBH;
end;

{constructor TEducationForm.Create(DMod: TdmEducation; Mode: TFormMode; Where: Variant; id_pcard:Variant);
begin
  inherited Create(Nil);
	Self.Mode := Mode;
  Self.DM:=TdmEducation.Create(Self);
  Self.DM:=DMod;
  AkreditationQuery.Database:=DMod.DB;
 	AkreditationQuery.Transaction := DMod.ReadTransaction;
  qFIC_Pcard.SetValue(id_pcard);
  id:=id_pcard;
  qFFC_Educ.Prepare(DM.DB,Mode,Where,Null);
  qFIC_PCard.SetValue(id_pcard);

	if Mode=fmAdd then
		begin
      qFDC_Beg.Value:=Date;
		  qFDC_End.Value:=IncMonth(qFDC_Beg.Value,60);
	    qFDC_Diplom.Value:=qFDC_End.Value;
		end;
end;   }

procedure TEducationForm.Focus(Sender: TObject);
begin
	if Sender is TWinControl then
		if (Sender as TWinControl).TabStop = False then
			OkButton.SetFocus;
end;

function TEducationForm.IsPressedCapsLock:Boolean;
Var KeyState:TKeyboardState;
begin
   GetKeyboardState(KeyState);
   if KeyState[VK_CAPITAL]=1 then Result:=True
   else Result:=False;
end;

procedure TEducationForm.PressedCapsLock;
begin
   if not IsPressedCapsLock then
   begin
      keybd_event(VK_CAPITAL, $45, (KEYEVENTF_EXTENDEDKEY or 0), 0);
      keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
   end;
end;

procedure TEducationForm.FormActivate(Sender: TObject);
begin
	OkButton.SetFocus;
end;


procedure TEducationForm.OkButtonClick(Sender: TObject);
begin
  ModalResult:=mrOk;
   //qFFC_Educ.Ok;
end;

procedure TEducationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TEducationForm.CancelButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TEducationForm.EducOrgSpComboBoxChange(Sender: TObject);
begin
	if (AkreditationQuery.Transaction <> nil) and
		(qFSC_Org.Value <> null) then
	begin
		AkreditationQuery.Close;
		AkreditationQuery.ParamByName('Id_Org').AsInteger:=
			qFSC_Org.Value;
		AkreditationQuery.Open;
		qFIC_Akr.Value:=AkreditationQuery['Akreditation'];
	end;
end;

procedure TEducationForm.qFSC_EducOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpTypeEduc');
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
       Value:=sp.Output['Id_Educ'];
       DisplayText:=sp.Output['Name_Educ'];
    end;

end;

procedure TEducationForm.qFSC_SpecOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpSpec');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DHandle);
            FieldValues['ModeEdit'] := 1;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    if ((not sp.Output.IsEmpty) and (sp.Output<>nil)) then
    begin
       Value:=sp.Output['Id_Spec'];
       DisplayText:=sp.Output['Name_Spec'];
    end;
end;

procedure TEducationForm.qFSC_KvalOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpKvalification');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DHandle);
            FieldValues['ModeEdit'] := 1;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    if ((not sp.Output.IsEmpty) and (sp.Output<>nil)) then
    begin
       Value:=sp.Output['Id_Kval'];
       DisplayText:=sp.Output['Name_Kval'];
    end;
end;

procedure TEducationForm.qFSC_OrgOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
  Params:TUnivParams;
  OutPut : TRxMemoryData;
  frm:TfrmEducOrg;
begin

  {Params.FormCaption:='Довідник навчальних закладів';
  Params.ShowMode:=fsmSelect;
  Params.ShowButtons:=[fbAdd,fbDelete,fbModif,fbExit];
  Params.AddFormClass:='TForm_SPEducOrg_Add';
  Params.ModifFormClass:='TForm_SPEducOrg_Add';
  Params.TableName:='ASUP_SP_EDUCORG_Select';
  Params.Fields:='Name_Full,name_short,type_name,Id_Org';
  Params.FieldsName:='Повна назва,скорочена назва,тип';
  Params.KeyField:='Id_Org';
  Params.ReturnFields:='Name_Full,Id_Org';
  Params.DeleteSQL:='execute procedure SP_EducOrg_Delete(:Id_Org);';
  Params.DBHandle:=HDLE;

  OutPut:=TRxMemoryData.Create(self);

  if GetUnivSprav(Params,OutPut)
   then
   begin
//     ShowInfo(output);
     value:=output['Id_Org'];
     DisplayText:=VarToStr(output['Name_Full']);
   end; }
   frm:=TfrmEducOrg.Create(Self, DHandle);
   if frm.ShowModal=mrOk then
   begin
      Value:=frm.IdEducOrg;
      DisplayText:=frm.RetTextField;
   end;
   frm.Free;

end;

procedure TEducationForm.qFDC_EndChange(Sender: TObject);
begin
  //qFDC_Diplom.Value:=qFDC_End.Value;
end;

procedure TEducationForm.DiplomNumberEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ((Key=38) and (ssCtrl in Shift) and (ssShift in Shift))
  then DiplomNumberEdit.Properties.CharCase:=ecUpperCase;

  if ((Key=40) and (ssCtrl in Shift) and (ssShift in Shift))
  then DiplomNumberEdit.Properties.CharCase:=ecLowerCase;

  if ((Chr(Key)='N') and (ssCtrl in Shift) and (ssShift in Shift))
  then DiplomNumberEdit.Properties.CharCase:=ecNormal;
end;

procedure TEducationForm.DiplomNumberEditClick(Sender: TObject);
begin
   PressedCapsLock;
end;

procedure TEducationForm.DiplomNumberEditEnter(Sender: TObject);
begin
   PressedCapsLock;
end;

procedure TEducationForm.DiplomNumberEditExit(Sender: TObject);
begin
   if not IsCapsLockOn then
   begin
      if IsPressedCapsLock then
      begin
         keybd_event(VK_CAPITAL, $45, (KEYEVENTF_EXTENDEDKEY or 0), 0);
         keybd_event(VK_CAPITAL, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
      end;
   end;
   IsCapsLockOn:=IsPressedCapsLock;
end;

procedure TEducationForm.FormShow(Sender: TObject);
begin
   IsCapsLockOn:=IsPressedCapsLock;
end;

end.
