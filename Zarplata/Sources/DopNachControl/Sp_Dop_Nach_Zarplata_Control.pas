unit Sp_Dop_Nach_Zarplata_Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, unit_ZGlobal_consts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  Sp_dop_nach_Zarplata_control_DataModul, ZMessages, ActnList,
  Unit_NumericConsts, ZProc, Dates,
  Registry, cxGraphics,
   uCommonSP, cxCalc,  Menus;

type
  TFZ_DopNach_Sp_Control = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMan: TcxGroupBox;
    LabelMan: TcxLabel;
    EditMan: TcxButtonEdit;
    BoxDatesSum: TcxGroupBox;
    DateBegLabel: TcxLabel;
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    DateEndLabel: TcxLabel;
    LabelSumma: TcxLabel;
    EditSumma: TcxMaskEdit;
    Bevel2: TBevel;
    Actions: TActionList;
    ActionYes: TAction;
    BoxVidOpl: TcxGroupBox;
    Action1: TAction;
    cxGroupBox1: TcxGroupBox;
    LabelSmetaData: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox5: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    EditCategory: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    LabelVidOpl: TcxLabel;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    EditDepartment: TcxButtonEdit;
    LabelDepartmentData: TcxLabel;
    cxLabel5: TcxLabel;
    EditTypePost: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure EditDepartmentExit(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaExit(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditCategoryPropertiesChange(Sender: TObject);
  private

   PId_Department:integer;
   PKod_Department:string;
   PId_Smeta:int64;
   PKod_Smeta:integer;
  //pHoursParam:TNonSpisokByHours;
   //PKodSetup:Integer;

   PId_VidOpl:integer;
   PId_Man:integer;
   DM:TDM;
   PRes:Variant;
   PParameter:TDopNachControlParameter;
   PKod_VidOpl:integer;
   PlanguageIndex: Byte;
  public
    constructor Create(AParameter:TDopNachControlParameter);reintroduce;
    property Res:Variant read PRes;
  end;

function ViewDopNachControl(AParameter:TDopNachControlParameter):Variant;stdcall;
 exports ViewDopNachControl;

implementation

uses FIBQuery, Math;

{$R *.dfm}

function ViewDopNachControl(AParameter:TDopNachControlParameter):Variant;stdcall;
var Form:TFZ_DopNach_Sp_Control;
    Res:Variant;
begin
 Form:=TFZ_DopNach_Sp_Control.Create(AParameter);
 if AParameter.AControlFormStyle<>zcfsDelete then
    Form.ShowModal;
 Res:=Form.Res;
 Form.Free;
 Result:=Res;
end;

constructor TFZ_DopNach_Sp_Control.Create(AParameter:TDopNachControlParameter);
var KodSetup:integer;
    DBeg,DEnd:TDate;
begin
 inherited Create(AParameter.AOwner);
 DM:=TDM.Create(AParameter);
 PParameter:=AParameter;
 PRes:=NULL;
 PlanguageIndex:=LanguageIndex;
//******************************************************************************
 LabelMan.Caption        := LabelMan_Caption[PLanguageIndex];
 DateBegLabel.Caption    := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption    := LabelDateEnd_Caption[PLanguageIndex];
 LabelSumma.Caption      := LabelSumma_Caption[PLanguageIndex];
 LabelVidOpl.Caption     := LabelVidOpl_Caption[PLanguageIndex];
 BoxMan.Caption          := '';
 BoxVidOpl.Caption       := '';
 BoxDatesSum.Caption     := '';
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';
//******************************************************************************
 EditSumma.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
//******************************************************************************
 EditCategory.Properties.ListSource:=DM.DSourceCategory;
 DM.DSetCategory.SQLs.SelectSQL.Text := ' SELECT * FROM SP_CATEGORY ';
 EditTypePost.Properties.ListSource:=DM.DSourceTypePost;
 DM.DSetCategory.Open;
//******************************************************************************
 case AParameter.AControlFormStyle of
  zcfsInsert:
   begin
    Caption:=ZDopNachCtrl_Caption_Insert[PlanguageIndex];
    with DM do
     try
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='Z_MANSDATA_BY_RMOVING';
      StProc.Prepare;
      StProc.ParamByName('RMOVING').AsInteger:=AParameter.AId;
      StProc.ExecProc;
      PId_Man:=StProc.ParamByName('ID_MAN').AsInteger;
      EditMan.Text := StProc.ParamByName('TN').AsString+' - '+StProc.ParamByName('FIO').AsString;
      EditDateEnd.Properties.MinDate:=StProc.ParamByName('PER_DATE_BEG').AsDate;
      EditDateEnd.Properties.MaxDate:=StProc.ParamByName('PER_DATE_END').AsDate;
      EditDateBeg.Properties.MinDate:=StProc.ParamByName('PER_DATE_BEG').AsDate;
      EditDateBeg.Properties.MaxDate:=StProc.ParamByName('PER_DATE_END').AsDate;
      KodSetup:=CurrentKodSetup(AParameter.ADb_Handle);
      DBeg        := ConvertKodToDate(KodSetup);
      DEnd        := ConvertKodToDate(KodSetup+1)-1;
      if EditDateEnd.Properties.MinDate=EditDateEnd.Properties.MaxDate then
       begin
        EditDateEnd.Date:=EditDateEnd.Properties.MaxDate;
        EditDateEnd.Properties.ReadOnly:=true;
        EditDateBeg.Date:=EditDateBeg.Properties.MaxDate;
        EditDateBeg.Properties.ReadOnly:=true;
       end
      else
       begin
        if (EditDateEnd.Properties.MaxDate>=DEnd) and (EditDateEnd.Properties.MinDate<=DEnd) then EditDateEnd.Date:=DEnd
        else EditDateEnd.Date:=EditDateEnd.Properties.MaxDate;
        if (EditDateBeg.Properties.MinDate<=DBeg) and (EditDateBeg.Properties.MaxDate>=DBeg) then EditDateBeg.Date:=DBeg
        else EditDateBeg.Date:=EditDateBeg.Properties.MinDate;
       end;
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
       end;
     end;
   end;
  zcfsUpdate:
   begin
    Caption:=ZDopNachCtrl_Caption_Update[PlanguageIndex];
    with DM do
     try
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='Z_DOP_NACH_SELECT_BY_ID';
      StProc.Prepare;
      StProc.ParamByName('ID_DOP_NACH').AsInteger:=AParameter.AId;
      StProc.ExecProc;
      PId_Man:=StProc.ParamByName('ID_MAN').AsInteger;
      PId_VidOpl:=StProc.ParamByName('ID_VIDOPL').AsInteger;
      EditMan.Text := StProc.ParamByName('TN').AsString+' - '+StProc.ParamByName('FIO').AsString;
      EditDateEnd.Properties.MinDate:=StProc.ParamByName('PER_DATE_BEG').AsDate;
      EditDateEnd.Properties.MaxDate:=StProc.ParamByName('PER_DATE_END').AsDate;
      EditDateBeg.Properties.MinDate:=StProc.ParamByName('PER_DATE_BEG').AsDate;
      EditDateBeg.Properties.MaxDate:=StProc.ParamByName('PER_DATE_END').AsDate;
      EditDateBeg.Date := StProc.ParamByName('DATE_BEG').AsDate;
      EditDateEnd.Date := StProc.ParamByName('DATE_END').AsDate;
      EditSumma.Text := StProc.ParamByName('SUMMA').AsString;
      EditVidOpl.Text := StProc.ParamByName('KOD_VIDOPL').AsString;
      LabelVidOplData.Caption:=StProc.ParamByName('NAME_VIDOPL').AsString;

      EditCategory.EditValue:=        StProc.ParamByName('ID_CATEGORY').AsInteger;
      EditTypePost.EditValue:=        StProc.ParamByName('ID_TYPE_POST').AsInteger;
      PId_Smeta:=                     StProc.ParamByName('ID_SMETA').AsInteger;
      LabelSmetaData.Caption:=        StProc.ParamByName('NAME_SMETA').AsString;
      EditSmeta.Text:=                StProc.ParamByName('SMETA_KOD').AsString;
      PId_Department:=                StProc.ParamByName('ID_DEPARTMENT').AsInteger;
      LabelDepartmentData.Caption:=   StProc.ParamByName('NAME_FULL_DEP').AsString;
      EditDepartment.Text:=           StProc.ParamByName('KOD_DEP').AsString;

      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
       end;
     end;
   end;
  zcfsDelete:
   begin
    if ZShowMessage(ZDopNachCtrl_Caption_Delete[PlanguageIndex],
                    DeleteRecordQuestion_Text[PlanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
     with DM do
      try
       StProc.Transaction.StartTransaction;
       StProc.StoredProcName:='Z_DOP_NACH_DELETE';
       StProc.Prepare;
       StProc.ParamByName('ID_DOP_NACH').AsInteger:=AParameter.AId;
       StProc.ExecProc;
       StProc.Transaction.Commit;
       PRes:=-1;
      except
       on E:Exception do
        begin
         ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
         StProc.Transaction.Rollback;
        end;
      end;
   end;
  zcfsShowDetails:
   begin
    Caption:=ZDopNachCtrl_Caption_Detail[PlanguageIndex];
    self.BoxVidOpl.Enabled       := false;
    self.BoxDatesSum.Enabled     := false;
    YesBtn.Visible:=False;


    cxGroupBox1.Enabled     := false;
    cxGroupBox3.Enabled     := false;
    cxGroupBox4.Enabled     := false;
    cxGroupBox5.Enabled     := false;
   {EditCategory.Enabled     := false;
    EditTypePost.Enabled     := false;
    EditSmeta.Enabled        := false;
    EditDepartment.Enabled   := false;
                                        }

    CancelBtn.Caption := ExitBtn_Caption[PlanguageIndex];
    EditVidOpl.Properties.Buttons[0].Visible:=False;
    with DM do
     try
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='Z_DOP_NACH_SELECT_BY_ID';
      StProc.Prepare;
      StProc.ParamByName('ID_DOP_NACH').AsInteger:=AParameter.AId;
      StProc.ExecProc;
      PId_Man:=StProc.ParamByName('ID_MAN').AsInteger;
      PId_VidOpl:=StProc.ParamByName('ID_VIDOPL').AsInteger;
      EditMan.Text := StProc.ParamByName('TN').AsString+' - '+StProc.ParamByName('FIO').AsString;
      EditDateEnd.Properties.MinDate:=StProc.ParamByName('PER_DATE_BEG').AsDate;
      EditDateEnd.Properties.MaxDate:=StProc.ParamByName('PER_DATE_END').AsDate;
      EditDateBeg.Properties.MinDate:=StProc.ParamByName('PER_DATE_BEG').AsDate;
      EditDateBeg.Properties.MaxDate:=StProc.ParamByName('PER_DATE_END').AsDate;
      EditDateBeg.Date := StProc.ParamByName('DATE_BEG').AsDate;
      EditDateEnd.Date := StProc.ParamByName('DATE_END').AsDate;
      EditSumma.Text := StProc.ParamByName('SUMMA').AsString;
      EditVidOpl.Text := StProc.ParamByName('KOD_VIDOPL').AsString;
      LabelVidOplData.Caption:=StProc.ParamByName('NAME_VIDOPL').AsString;

      EditCategory.EditValue:=        StProc.ParamByName('ID_CATEGORY').AsInteger;
      EditTypePost.EditValue:=        StProc.ParamByName('ID_TYPE_POST').AsInteger;
      PId_Smeta:=                     StProc.ParamByName('ID_SMETA').AsInteger;
      LabelSmetaData.Caption:=        StProc.ParamByName('NAME_SMETA').AsString;
      EditSmeta.Text:=                StProc.ParamByName('SMETA_KOD').AsString;
      PId_Department:=                StProc.ParamByName('ID_DEPARTMENT').AsInteger;
      LabelDepartmentData.Caption:=   StProc.ParamByName('NAME_FULL_DEP').AsString;
      EditDepartment.Text:=           StProc.ParamByName('KOD_DEP').AsString;
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        ZShowMessage(Error_Caption[PlanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
       end;
     end;
   end;
 end;
end;

procedure TFZ_DopNach_Sp_Control.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFZ_DopNach_Sp_Control.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DM.DB.Handle,
                   zfsModal,
                   ValueFieldZSetup(DM.DB.Handle,'ID_VO_PROP_DOPNACH'),
                   ValueFieldZSetup(DM.DB.Handle,'Z_ID_SYSTEM'));
if VarArrayDimCount(VidOpl)> 0 then
 if VidOpl[0]<> NULL then
  begin
   EditVidOpl.Text := VarToStr(VidOpl[2]);
   LabelVidOplData.Caption := VarToStr(VidOpl[1]);
   PId_VidOpl      := VidOpl[0];
   PKod_VidOpl     := VidOpl[2];
  end;
end;

procedure TFZ_DopNach_Sp_Control.EditManPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(self,DM.DB.Handle);
if VarArrayDimCount(Man)> 0 then
 if Man[0]<>NULL then
  begin
   EditMan.Text  := Man[1]+' '+Man[2]+' '+Man[3];
   PId_Man       := Man[0];
  end;
end;

procedure TFZ_DopNach_Sp_Control.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaulttTransaction.InTransaction then DM.DefaulttTransaction.Commit;
end;

procedure TFZ_DopNach_Sp_Control.ActionYesExecute(Sender: TObject);
var Res:Integer;
begin
if PId_VidOpl=0 then
 begin
  ZShowMessage(Error_Caption[PlanguageIndex],VidOplInput_ErrorText[PlanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditDateBeg.Date>EditDateEnd.Date then
 begin
  ZShowMessage(Error_Caption[PlanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditSumma.Text='' then
 begin
  ZShowMessage(Error_Caption[PlanguageIndex],SummaInput_ErrorText[PlanguageIndex],mtWarning,[mbOk]);
  exit;
 end;

if EditCategory.Text='' then
  begin
    EditCategory.SetFocus;
    ZShowMessage(Error_Caption[PLanguageIndex],CategoryInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
    Exit;
  end;

if EditTypePost.Text='' then
  begin
    EditTypePost.SetFocus;
    ZShowMessage(Error_Caption[PLanguageIndex],'Треба вибрати тип персоналу!',mtError,[mbOK]);
    Exit;
  end;

if EditDepartment.Text='' then
  begin
    EditDepartment.SetFocus;
    ZShowMessage(Error_Caption[PLanguageIndex],DepartmentInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
    Exit;
  end;

if EditSmeta.Text=''  then
  begin
    EditSmeta.SetFocus;
    ZShowMessage(Error_Caption[PLanguageIndex],SmetaInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
    Exit;
  end;

with DM do
try
 StProcTransaction.StartTransaction;
 case PParameter.AControlFormStyle of
  zcfsInsert: StProc.StoredProcName:='Z_DOP_NACH_INSERT';
  zcfsUpdate: StProc.StoredProcName:='Z_DOP_NACH_UPDATE';
 end;
 StProc.Prepare;

 StProc.ParamByName('ID_MAN').AsInteger:=PId_Man;
 StProc.ParamByName('ID_VIDOPL').AsInteger:=PId_VidOpl;
 StProc.ParamByName('DATE_BEG').AsDate:=EditDateBeg.Date;
 StProc.ParamByName('DATE_END').AsDate:=EditDateEnd.Date;
 StProc.ParamByName('SUMMA').AsFloat:=StrToFloat(EditSumma.text);
 StProc.ParamByName('ID_CATEGORY').AsInteger := EditCategory.EditValue;
 StProc.ParamByName('ID_TYPE_POST').AsInteger := EditTypePost.EditValue;
 StProc.ParamByName('ID_SMETA').AsInteger:=PId_Smeta;
 StProc.ParamByName('ID_DEPARTMENT').AsInteger:=PId_Department;

 case PParameter.AControlFormStyle of
  zcfsInsert: StProc.ParamByName('RMOVING').AsInteger:=PParameter.AId;
  zcfsUpdate: StProc.ParamByName('ID_DOP_NACH').AsInteger:=PParameter.AId;
 end;

 StProc.ExecProc;
 if PParameter.AControlFormStyle=zcfsInsert then
  Res:=StProc.ParamByName('ID_DOP_NACH').AsInteger
 else Res:=0;
 StProc.Transaction.Commit;
 PRes:=Res;
 ModalResult:=mrYes;
except
 on e:Exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex] ,e.message,mtError,[mbOk]);
   StProc.transaction.RollBack;
   PRes:=NULL;
  end;
end;
end;

procedure TFZ_DopNach_Sp_Control.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PKod_VidOpl then Exit;
  VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,Dm.DB.Handle,ZDopNachVidOplProp);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PId_VidOpl:=VidOpl[0];
    PKod_VidOpl:=VidOPl[1];
    LabelVidOplData.Caption := VidOPl[2];
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TFZ_DopNach_Sp_Control.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFZ_DopNach_Sp_Control.Action1Execute(Sender: TObject);
begin
     if  YesBtn.Focused Then ActionYesExecute(Sender);
     SendKeyDown(Self.ActiveControl,VK_TAB,[]);
end;

procedure TFZ_DopNach_Sp_Control.EditDepartmentExit(Sender: TObject);
var Department:Variant;
begin
if EditDepartment.Text<>'' then
 begin
  if EditDepartment.Text=PKod_department then Exit;
  Department:=DepartmentByKod(EditDepartment.Text,DM.DB.Handle);
  if VarArrayDimCount(Department)>0 then
   begin
    PId_department:=Department[0];
    PKod_department:=Department[1];
    LabelDepartmentData.Caption := Department[2];
   end
  else
   //EditDepartment.SetFocus;
 end;
end;

procedure TFZ_DopNach_Sp_Control.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var sp: TSprav;
    Date:TDate;
    KS:integer;
begin
    KS := DateTokodSetup(EditDateBeg.Date); //PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1);
    Date := ConvertKodToDate(KS+1);
    Date := Date - 1;

    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DM.DB.Handle);
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
        EditDepartment.Text := varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
        LabelDepartmentData.Caption := varToStrDef(sp.Output['NAME_FULL'],'');
        PId_department := sp.Output['ID_DEPARTMENT'];
        PKod_department := EditDepartment.Text;
       end;
    sp.Free;
end;

procedure TFZ_DopNach_Sp_Control.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
if EditSmeta.Text<>'' then
 begin
  if StrToInt(EditSmeta.Text)=PKod_Smeta then Exit;
  Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DM.DB.Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PId_smeta:=Smeta[0];
    PKod_Smeta:=Smeta[1];
    LabelSmetaData.Caption := Smeta[2];
   end
  else
   //EditSmeta.SetFocus;
 end;
end;

procedure TFZ_DopNach_Sp_Control.EditSmetaPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Smeta:variant;
begin
Smeta:=GetSmets(self,DM.DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)>0 then
 begin
  PId_Smeta:=Smeta[0];
  LabelSmetaData.Caption := VarToStr(Smeta[2]);
  EditSmeta.Text := VarToStr(Smeta[3]);
  PKod_Smeta := Smeta[3];
 end;
end;

procedure TFZ_DopNach_Sp_Control.EditCategoryPropertiesChange(
  Sender: TObject);
begin
     DM.DSetTypePost.Close;
     DM.DSetTypePost.SQLs.SelectSQL.Text := ' SELECT * FROM Z_GET_TYPE_POST_BY_CATEGORY('+
                                            VarToStr(EditCategory.EditValue)+','
                                            +IntToStr(DateTokodSetup(EditDateBeg.Date))+') ';
     DM.DSetTypePost.Open;
     DM.DSetTypePost.FetchAll;
     if (DM.DSetTypePost.RecordCount>0)
     then EditTypePost.EditValue:=DM.DSetTypePost.FieldByName('id_type_post').Value;
end;

end.
