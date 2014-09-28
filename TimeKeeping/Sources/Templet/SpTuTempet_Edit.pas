unit SpTuTempet_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, ActnList, StdCtrls,
  cxButtons, ExtCtrls,TuCommonTypes,TuMessages,TuCommonProc,SpTuTemplet_DM,
  cxSpinEdit,TUDates,TuCommonLoader, cxButtonEdit,gr_uCommonLoader, cxLabel,
  cxCheckBox,AccMGMT,PackageLoad,SpTuTemplet_Warning;
 type TTemplet=class(TObject)
      Owner:TComponent;
      CFStyle:TTuControlFormStyle;
      id:Variant;
      Name:string;
      Comentar:string;
      DateBeg:TDate;
      DateEnd:TDate;
      ID_MAN_RESPONSIBLE:variant;
      ID_MAN_HEAD :variant;
      ID_MAN_PERSONNEL:variant;
      POST_RESPONSIBLE:string;
      POST_HEAD:string;
      POST_PERSONNEL:string;
      FIO_RESPONSIBLE:string;
      FIO_HEAD:string;
      FIO_PERSONNEL:string;
      ID_PARENT:variant;
      NAME_PARENT:string;
      KodSetup:variant;
      IS_TEMPLATE:variant;
      DM:TDM;
 end ;


  type
  TFormTemplet_Edit = class(TForm)
    Panel1: TPanel;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    EditName: TcxTextEdit;
    EditCommentar: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditMonthBeg: TcxComboBox;
    EditYearBeg: TcxSpinEdit;
    EditMonthEnd: TcxComboBox;
    EditYearEnd: TcxSpinEdit;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    Label4: TLabel;
    cxLabel2: TcxLabel;
    EditResponsible: TcxButtonEdit;
    EditResponsiblePost: TcxTextEdit;
    cxLabel1: TcxLabel;
    EditHead: TcxButtonEdit;
    EditHeadPost: TcxTextEdit;
    cxLabel3: TcxLabel;
    EditPersonnel: TcxButtonEdit;
    EditPersonnelPost: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    EditParent: TcxButtonEdit;
    CheckBoxNoTemplate: TcxCheckBox;
    CheckBoxBranch: TcxCheckBox;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure EditResponsiblePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditHeadPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditPersonnelPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditParentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure CheckBoxBranchPropertiesChange(Sender: TObject);
  private
    { Private declarations }

  public
     DM:TDM;
      FID_MAN_RESPONSIBLE:variant;
      FID_MAN_HEAD :variant;
      FID_MAN_PERSONNEL:variant;
      FID_PARENT:variant;
      FKodSetup:variant;
      Fid:variant;

    constructor Create(Param:TTemplet);reintroduce;
  end;

function View_TempletEdit(Param:TTemplet):Boolean ;
implementation

uses FIBQuery;



{$R *.dfm}
function View_TempletEdit(Param:TTemplet):Boolean  ;
var Form:TFormTemplet_Edit;
k,T:Integer;
begin
    if (((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav/TU_Templet','Del')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav','Del')<>0))
        and (Param.CFStyle=tcfsDelete))
      or (((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav/TU_Templet','Add')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav','Add')<>0))
        and (Param.CFStyle=tcfsInsert))
      or(((fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav/TU_Templet','Edit')<>0)
        and (fibCheckPermission('/ROOT/TimeKeeping/TU_MainMenu/TU_Sprav','Edit')<>0))
        and (Param.CFStyle=tcfsDelete))  then
    begin //yes
      MessageBox(null, 'Ви не маєте прав до цієї дії!','Увага!', MB_OK or MB_ICONWARNING);
      result:=false;
      exit
    end ;


  if Param.CFStyle=tcfsDelete then
  begin
    k:=TuShowMessage(GetConst('Delete','Error'),GetConst('DeleteText','Error'),
                  mtWarning, [mbYes,mbNo]);
    if   k=6 then
      begin
        Param.DM.StProc.Transaction.StartTransaction;
        Param.DM.StProc.StoredProcName:='TU_TEMPLATE_TIMESHEET_D';
        Param.DM.StProc.Prepare;
        Param.DM.StProc.ParamByName('ID').asinteger:=Param.Id;
        Param.DM.StProc.ExecProc;
        Param.DM.StProc.Transaction.Commit;
        Result:=True;
      end
    else
      Result:=False;
    Exit;
  end;
    Form:=TFormTemplet_Edit.Create(Param);
  if Form.ShowModal=mrYes then
    with Form.DM.StProc do
    begin
      Transaction.StartTransaction;
      if Param.CFStyle=tcfsInsert then StoredProcName:='TU_TEMPLATE_TIMESHEET_I'
      else  StoredProcName:='TU_TEMPLATE_TIMESHEET_U';
      Prepare;
      if Param.CFStyle=tcfsUpdate then  ParamByName('ID').asinteger    :=Param.Id;
      ParamByName('NAME').AsString          :=Form.EditName.text;
      ParamByName('COMMENTAR').AsString     :=Form.EditCommentar.Text;
      ParamByName('DATE_BEG').AsDate        :=EncodeDate(Form.EditYearBeg.value,Form.EditMonthBeg.ItemIndex+1,1);
      if Form.EditMonthEnd.ItemIndex=12 then  T:=1
      else T:=Form.EditMonthEnd.ItemIndex+2;
      ParamByName('DATE_END').AsDate        :=EncodeDate(Form.EditYearEnd.value,T,1)-1;
      if  Form.FID_MAN_RESPONSIBLE <>null then
      ParamByName('ID_MAN_RESPONSIBLE').ASInteger   :=Form.FID_MAN_RESPONSIBLE;
      if  Form.FID_MAN_HEAD <>null then
      ParamByName('ID_MAN_HEAD').ASInteger          :=Form.FID_MAN_HEAD;
      if  Form.FID_MAN_PERSONNEL <>null then
      ParamByName('ID_MAN_PERSONNEL').ASInteger     :=Form.FID_MAN_PERSONNEL;
      ParamByName('POST_RESPONSIBLE').ASString      :=Form.EditResponsiblePost.Text;
      ParamByName('POST_HEAD').ASString             :=Form.EditHeadPost.Text;
      ParamByName('POST_PERSONNEL').ASString        :=Form.EditPersonnelPost.Text;
      if (not Form.CheckBoxBranch.Checked) then
         ParamByName('ID_PARENT').AsInteger            :=Form.FID_PARENT
      else
      ParamByName('ID_PARENT').AsInteger:=-1;
      ParamByName('IS_TEMPLATE').AsInteger:=Form.CheckBoxNoTemplate.EditValue;
      ExecProc;
      if Param.CFStyle=tcfsInsert  then Param.Id:=ParamByName('ID').asinteger;
      Transaction.Commit;
      Result:=True;
    end
  else
    result:=false;
    Form.Destroy;
end;

constructor TFormTemplet_Edit.Create(Param:TTemplet);
var  YearBeg,YearEnd,MonthBeg,MonthEnd, i:Word;
begin
  inherited Create(Param.Owner);
  dm:=Param.DM;
  FID_PARENT:=Param.ID_PARENT;
  Fid:=Param.id;
  if not  ( FID_PARENT=-1 )then
  begin
     CheckBoxBranch.Checked:=false;
     EditParent.Text:=Param.NAME_PARENT;
  end;
  if Param.CFStyle=tcfsUpdate then
  begin
    EditName.Text:=VarToStrDef(Param.Name,'') ;
    EditCommentar.Text:=VarToStrDef(Param.Comentar,'');
    DecodeDate(Param.DateBeg,YearBeg,MonthBeg,i);
    DecodeDate(Param.DateEnd,YearEnd,MonthEnd,i);
    EditResponsible.Text:=Param.FIO_RESPONSIBLE;
    EditHead.text:=Param.FIO_HEAD;
    EditPersonnel.Text:=Param.FIO_PERSONNEL;
    FID_MAN_RESPONSIBLE:=Param.ID_MAN_RESPONSIBLE;
    FID_MAN_HEAD:=Param.ID_MAN_HEAD;
    FID_MAN_PERSONNEL:=Param.ID_MAN_PERSONNEL;
    EditResponsiblePost.Text:=Param.POST_RESPONSIBLE;
    EditHeadPost.text:=Param.POST_HEAD;
    EditPersonnelPost.Text:=Param.POST_PERSONNEL;
    CheckBoxNoTemplate.EditValue:=Param.IS_TEMPLATE ;

  end
  else
  begin
    DecodeDate(Date,YearBeg,MonthBeg,i);
    YearEnd:=9999;
    MonthEnd:=1;
  end;
  CheckBoxNoTemplate.EditValue:=Param.IS_TEMPLATE;
  FKodSetup:=Param.KodSetup;
  EditYearBeg.Value:=YearBeg;
  EditYearEnd.Value:=YearEnd;
//******************************************************************************
  if Param.CFStyle=tcfsUpdate then
    Caption           :=GetConst('Update','Button')+'['+GetConst('TempletTimesheet','Form')+']'
  else
    Caption           :=GetConst('Insert','Button')+'['+GetConst('TempletTimesheet','Form')+']';

  Label1.Caption      :=GetConst('Name','Label')+':';
  Label2.Caption      :=GetConst('Koment','Label')+':';
  Label3.Caption      :=GetConst('PeriodBeg','Label')+':';
  Label4.Caption      :=GetConst('PeriodEnd','Label')+':';
  ButtonYes.Caption    :=GetConst('Yes','Button');
  ButtonCancel.Caption    :=GetConst('Cancel','Button');

  EditMonthBeg.Properties.Items.Text:=GetConst('MonthJanuary','OtherConsts')+#13+
                                  GetConst('MonthFebruary','OtherConsts')+#13+
                                  GetConst('MonthMarch','OtherConsts')+#13+
                                  GetConst('MonthApril','OtherConsts')+#13+
                                  GetConst('MonthMay','OtherConsts')+#13+
                                  GetConst('MonthJune','OtherConsts')+#13+
                                  GetConst('MonthJuly','OtherConsts')+#13+
                                  GetConst('MonthAutumn','OtherConsts')+#13+
                                  GetConst('MonthSeptember','OtherConsts')+#13+
                                  GetConst('MonthOctober','OtherConsts')+#13+
                                  GetConst('MonthNovember','OtherConsts')+#13+
                                  GetConst('MonthDecember','OtherConsts');
  EditMonthEnd.Properties.Items.Text:=GetConst('MonthJanuary','OtherConsts')+#13+
                                  GetConst('MonthFebruary','OtherConsts')+#13+
                                  GetConst('MonthMarch','OtherConsts')+#13+
                                  GetConst('MonthApril','OtherConsts')+#13+
                                  GetConst('MonthMay','OtherConsts')+#13+
                                  GetConst('MonthJune','OtherConsts')+#13+
                                  GetConst('MonthJuly','OtherConsts')+#13+
                                  GetConst('MonthAutumn','OtherConsts')+#13+
                                  GetConst('MonthSeptember','OtherConsts')+#13+
                                  GetConst('MonthOctober','OtherConsts')+#13+
                                  GetConst('MonthNovember','OtherConsts')+#13+
                                  GetConst('MonthDecember','OtherConsts');
  EditMonthBeg.ItemIndex:=MonthBeg-1;
  EditMonthEnd.ItemIndex:=MonthEnd-1;
//******************************************************************************
end;
procedure TFormTemplet_Edit.ActionYesExecute(Sender: TObject);
var DB, DE,T:Integer;
  Form :TFormWarning;
  Yes:Boolean;
begin
 DB:=PeriodToKodSetup(EditYearBeg.value,EditMonthBeg.ItemIndex+1);
 DE:=PeriodToKodSetup(EditYearEnd.Value,EditMonthEnd.ItemIndex+1);
 if EditName.Text='' then
  TuShowMessage('Увага','Не вказана назва', mtWarning, [mbOk])
 else
   if DE<DB then
     TuShowMessage('Увага','Не правильний період', mtWarning, [mbOk])
   else
     if (not CheckBoxBranch.Checked ) and (FID_PARENT = null ) then
       TuShowMessage('Увага','Не вказаний корень', mtWarning, [mbOk])
     else
     begin
       DM.DsetEditWarning.Close;
       DM.DsetEditWarning.SelectSQL.text:='select * from TU_TEMPLATE_PERIOD_TEST(:ID_TEMPLET, :DB, :DE) ';
       DM.DsetEditWarning.Params.ByName['ID_TEMPLET'].AsVariant:=DM.DSetTemplet['ID'];
       DM.DsetEditWarning.Params.ByName['DB'].AsDate:=EncodeDate(EditYearBeg.value,EditMonthBeg.ItemIndex+1,1);
       if EditMonthEnd.ItemIndex=12 then  T:=1
       else T:=EditMonthEnd.ItemIndex+2;
       DM.DsetEditWarning.Params.ByName['DE'].AsDate:=EncodeDate(EditYearEnd.value,T,1)-1;
       DM.DsetEditWarning.Open;
       if  DM.DsetEditWarning.RecordCount>0 then
       begin
         Form:=TFormWarning.create(self,DM);
         if Form.ShowModal=mrYes then Yes:=true
         else Yes:=false;
       end
       else
         Yes:=true;
       if Yes then ModalResult:=mrYes;
     end;
end;

procedure TFormTemplet_Edit.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormTemplet_Edit.EditResponsiblePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin

  Res:=LoadSimplePackage(self,DM.DB.Handle,'Zarplata\SpSotr.bpl','View_SpSotr');;
  if VarIsArray(Res)  then
  begin
    FID_MAN_RESPONSIBLE:=Res[0];
    EditResponsible.Text:= Res[2];
    if EditResponsiblePost.Text='' then EditResponsiblePost.Text:= Res[3];

  end;
end;

procedure TFormTemplet_Edit.EditHeadPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin

  Res:=LoadSimplePackage(self,DM.DB.Handle,'Zarplata\SpSotr.bpl','View_SpSotr');;
  if VarIsArray(Res)  then
  begin
    FID_MAN_HEAD:=Res[0];
    EditHead.Text:= Res[2];
    if EditHeadPost.Text='' then  EditHeadPost.Text:= Res[3];

  end;
end;
procedure TFormTemplet_Edit.EditPersonnelPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin


  Res:=LoadSimplePackage(self,DM.DB.Handle,'Zarplata\SpSotr.bpl','View_SpSotr');;
  if VarIsArray(Res)  then
  begin
    FID_MAN_PERSONNEL:=Res[0];
    EditPersonnel.Text:= Res[2];
    if EditPersonnelPost.Text='' then  EditPersonnelPost.Text:= Res[3];
  end;
end;

procedure TFormTemplet_Edit.EditParentPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var res:variant;
begin

 res:=LoadTuSpTemplet(self, DM.DB.Handle,FKodSetup,tfsModalParent, Fid);
 if VarIsArray(RES)then
 begin
   if res[0]<>Fid then
   begin
     FID_PARENT:=res[0];
     EditParent.Text:=res[1];
   end
   else
     TuShowMessage(GetConst('Delete','Error'),'На себе вказувати не можливо', mtWarning, [mbOk])
 end
end;

procedure TFormTemplet_Edit.CheckBoxBranchPropertiesChange(
  Sender: TObject);
begin
  EditParent.Enabled:= not CheckBoxBranch.Checked;
end;

end.
