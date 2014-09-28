//______________________________________________________________________________
//-----------------------------------Salimov Artem----------------------10.11.12
//----------Последние изменение : Литовченко Дмитрий Николаевич-------22.12.2009
unit SpWorkMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox, cxSpinEdit,
  cxTimeEdit, cxLabel, ExtCtrls,WorkMode_Dm,TuCommonLoader,
  TuMessages,TuCommonProc, TuCommonTypes, Qt, ActnList, cxDropDownEdit,
  cxCalendar,dates, cxGroupBox, cxMemo, cxRadioGroup, cxButtonEdit,
  cxCurrencyEdit,AccMGMT;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    ButtonOK: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    cxGroupBox1: TcxGroupBox;
    CheckBoxZm: TcxCheckBox;
    EditFinish: TcxTimeEdit;
    Label5: TcxLabel;
    EditStart: TcxTimeEdit;
    Label4: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    EditDb: TcxDateEdit;
    cxLabel1: TcxLabel;
    Label1: TcxLabel;
    EditNum: TcxMaskEdit;
    Label2: TcxLabel;
    EditName: TcxMaskEdit;
    EditShortName: TcxMaskEdit;
    Label3: TcxLabel;
    cxLabel2: TcxLabel;
    EditDe: TcxDateEdit;
    CheckBoxTypeViewYes: TcxRadioButton;
    CheckBoxTypeViewNo: TcxRadioButton;
    EditCaption: TcxMemo;
    cxLabel3: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    CheckBoxNoWM: TcxCheckBox;
    CheckBoxBranch: TcxCheckBox;
    EditParent: TcxButtonEdit;
    cxLabel4: TcxLabel;
    EditCOEFFICIENT: TcxCurrencyEdit;
    procedure ButtonOKClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBoxZmPropertiesChange(Sender: TObject);
    procedure EditParentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxBranchPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    id:Variant;
    IdParent:Variant;
    PCFStyle:TTuControlFormStyle;
    constructor Create(PParameter:TTuWorkModeEditParam);reintroduce;
  end;
function View_SpWorkModeEdit(AParameter:TObject):Variant;stdcall;
exports View_SpWorkModeEdit;


implementation

uses FIBQuery;

{$R *.dfm}

function View_SpWorkModeEdit(AParameter:TObject):Variant;stdcall;
var Form:TForm1;

begin



  Form:=TForm1.Create(TTuWorkModeEditParam(AParameter));
  Form.PCFStyle:=TTuWorkModeEditParam(AParameter).CFStyle;

      if (((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkMode','Del')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Del')<>0))
        and (Form.PCFStyle=tcfsDelete))
      or (((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkMode','Add')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Add')<>0))
        and (Form.PCFStyle=tcfsInsert))
      or(((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work/TU_WorkMode','Edit')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Work','Edit')<>0))
        and (Form.PCFStyle=tcfsDelete))  then
    begin //yes
      MessageBox(null, 'Ви не маєте прав до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
      result:=null;
      exit
    end ;

 result:=TTuWorkModeEditParam(AParameter).id;
if Form.PCFStyle=tcfsDelete then
  begin
  if   TuShowMessage(GetConst('Delete','Error'),GetConst('DeleteText','Error'),
                  mtWarning, [mbYes,mbNo])=6 then
  begin
    dm.StProc.Transaction.Active:=true;
    dm.StProc.StoredProcName:='DT_WORK_MODE_DELETE';
    dm.StProc.Prepare;
    dm.StProc.ParamByName('ID_WORK_MODE').asinteger:=TTuWorkModeEditParam(AParameter).id;
    dm.StProc.ExecProc;
    DM.StProc.Transaction.Commit;


  end
  else    result:=null;
  Exit;
  end;

 if not  VarIsNull(TTuWorkModeEditParam(AParameter).id) then
  begin
    dm.StProc.Transaction.Active:=true;
    dm.StProc.StoredProcName:='DT_WORK_MODE_SELECT_BY_KEY';
    dm.StProc.Prepare;
    dm.StProc.ParamByName('ID_WORK_MODE_IN').asinteger:=TTuWorkModeEditParam(AParameter).id;
    dm.StProc.ExecProc;
    form.EditNum.Text       := dm.StProc.ParamByName('NOMER').AsString;
    form.EditName.Text      := dm.StProc.ParamByName('NAME').AsString;
    form.EditShortName.Text := dm.StProc.ParamByName('NAME_SHORT').AsString;
    form.EditStart.Time     := dm.StProc.ParamByName('NIGHT_BEG').AsTime ;
    form.EditFinish.Time    := dm.StProc.ParamByName('NIGHT_END').AsTime ;
    form.EditDB.Date        := dm.StProc.ParamByName('Date_BEG').AsDate ;
    form.EditDe.Date        := dm.StProc.ParamByName('DATE_END').AsDate ;
    form.EditCaption.text   := dm.StProc.ParamByName('CAPTION').AsString ;
    form.EditParent.text    := dm.StProc.ParamByName('NAME_parent').AsString ;
    form.EditCOEFFICIENT.Value:=dm.StProc.ParamByName('COEFFICIENT').AsExtended ;
    if dm.StProc.ParamByName('IS_SMENA').AsString='T' then
    begin
      Form.CheckBoxZm.Checked:=True;
      Form.CheckBoxTypeViewYes.Checked:=True;
    end ;
    if dm.StProc.ParamByName('TYPE_VIEW').AsInteger=1 then
                Form.CheckBoxTypeViewYes.Checked:=True
    else
    form.IdParent:=dm.StProc.ParamByName('id_parent').Asinteger;
    if form.IdParent<>-1 then Form.CheckBoxBranch.Checked:=false;
    Form.CheckBoxNoWM.EditValue:=dm.StProc.ParamByName('is_work_mode').Asinteger;
    DM.StProc.Transaction.Commit;
  end;
  if Form.PCFStyle=tcfsInsert then
  begin
    dm.StProc.Transaction.StartTransaction;
    dm.StProc.StoredProcName:='TU_WORK_MODE_NUM_BY_PARENT';
    dm.StProc.Prepare;
    dm.StProc.ParamByName('ID_PARENT').asinteger:=form.IdParent;
    dm.StProc.ExecProc;
    form.EditNum.Text:=dm.StProc.ParamByName('NOMER').AsString;
    form.EditCOEFFICIENT.Value:=1;
    DM.StProc.Transaction.Commit;
  end;

  if  Form.ShowModal=mrYes then
  begin
    dm.StProc.Transaction.StartTransaction;
    if Form.PCFStyle=tcfsInsert then dm.StProc.StoredProcName:='TU_WORK_MODE_INSERT'
    else  dm.StProc.StoredProcName:='TU_WORK_MODE_UPDATE';
    dm.StProc.Prepare;
    dm.StProc.ParamByName('NOMER').asinteger        :=strtoint(Form.EditNum.text);
    dm.StProc.ParamByName('NAME').AsString          :=Form.EditName.text;
    dm.StProc.ParamByName('NAME_SHORT').AsString    :=Form.EditShortName.text;
    dm.StProc.ParamByName('NIGHT_BEG').AsTime       :=Form.EditStart.Time;
    dm.StProc.ParamByName('NIGHT_END').AsTime       :=Form.EditFinish.Time;
    dm.StProc.ParamByName('date_beg').Asdate        :=Form.Editdb.date;
    dm.StProc.ParamByName('date_END').Asdate        :=Form.Editde.date;
    dm.StProc.ParamByName('CAPTION').AsString       :=Form.EditCaption.text;
    dm.StProc.ParamByName('COEFFICIENT').AsExtended :=Form.EditCOEFFICIENT.Value;
    if not Form.CheckBoxBranch.Checked then
      dm.StProc.ParamByName('id_parent').asInteger:=Form.IdParent
    else
      dm.StProc.ParamByName('id_parent').asInteger:= -1;
    dm.StProc.ParamByName('is_work_mode').asInteger:=Form.CheckBoxNoWM.EditValue;
    if Form.CheckBoxZm.Checked then
      dm.StProc.ParamByName('IS_SMENA').AsString:='T'
    else
      dm.StProc.ParamByName('IS_SMENA').AsString:='F';
    if  Form.CheckBoxTypeViewYes.Checked then
      dm.StProc.ParamByName('TYPE_VIEW').Asinteger   :=1
    else
      dm.StProc.ParamByName('TYPE_VIEW').Asinteger   :=0;
    if Form.PCFStyle=tcfsUpdate then   dm.StProc.ParamByName('ID_WORK_MODE').asinteger:=TTuWorkModeEditParam(AParameter).id;
    dm.StProc.ExecProc;
    if   Form.PCFStyle=tcfsInsert then   result:=dm.StProc.ParamByName('ID').asinteger;


    DM.StProc.Transaction.Commit;
    end
    else result:=null;

end;
//******************************************************************************
constructor TForm1.Create(PParameter:TTuWorkModeEditParam);
begin
  inherited Create(PParameter.Owner);
  Dm:=TDM.create(self);
  Dm.DB.Handle:=PParameter.Db_Handle;
  Dm.DB.Connected:=True;
  Id:=PParameter.id;
  EditDb.date:=strtodate(KodSetupToPeriod(PParameter.KodSetup,6));
  //------------------------------------------------------------------------------
  if PParameter.CFStyle=tcfsInsert then Caption:= GetConst('Insert','Button')+' '+GetConst('WorkMode','Form')
  else  Caption:= GetConst('Update','Button')+' '+GetConst('WorkMode','Form');
  Label1.Caption:=  GetConst('Nomer','Label')+':';
  Label2.Caption:=  GetConst('Name','Label')+':';
  Label3.Caption:=  GetConst('ShortName','Label')+':';
  Label4.Caption:=  GetConst('StartTime','Label')+':';
  Label5.Caption:=  GetConst('FinishTime','Label')+':';
  CheckBoxZm.Properties.Caption:=GetConst('Change','CheckBox');
//  CheckBoxTypeViewYes.Properties.Caption:=GetConst('TypeView','CheckBox');
  ButtonOK.Caption:=GetConst('Yes','Button');
  ButtonCancel.Caption:=GetConst('Cancel','Button');
  ButtonOK.Enabled:=True;
  EditStart.Text


end;

procedure TForm1.ButtonOKClick(Sender: TObject);
begin
  if (Length( EditNum.Text)=0 )
      or(Length( EditName.Text)=0 )
      or(Length( EditShortName.Text)=0)
      or (Length(EditCOEFFICIENT.text)=0) then
  begin
   TuShowMessage(GetConst('Caption','Error'),GetConst('EmptyData','Error'),
                  mtError, [mbOK]);
   Exit;
  end;
  ModalResult:=mrYes;
end;

procedure TForm1.ButtonCancelClick(Sender: TObject);
begin
   ModalResult:=mrNo;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
EditNum.SetFocus;
end;


procedure TForm1.CheckBoxZmPropertiesChange(Sender: TObject);
begin
CheckBoxTypeViewYes.Checked:=  CheckBoxZm.Checked;
CheckBoxTypeViewNo.Checked:= not CheckBoxZm.Checked;
end;

procedure TForm1.EditParentPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Parameter:TTuSimpleParam;
    res:variant;
begin
  Parameter := TTuSimpleParam.Create;
  Parameter.DB_Handle := DM.DB.Handle;
  Parameter.Owner := self;
  Parameter.CFStyle:=tfsModalParent;
  if PCFStyle=tcfsUpdate then
  Parameter.id:= id
  else
  Parameter.id:=null;
  res:=DoFunctionFromPackage(Parameter,Tu_SpWorkMode_Pack);
  if VarIsArray(res)then
  begin
     IdParent:=res[0];
     EditParent.Text:=res[1];
  end;
  Parameter.Destroy;
end;

procedure TForm1.CheckBoxBranchPropertiesChange(Sender: TObject);
begin
EditParent.Enabled:= not CheckBoxBranch.Checked;
end;

end.
