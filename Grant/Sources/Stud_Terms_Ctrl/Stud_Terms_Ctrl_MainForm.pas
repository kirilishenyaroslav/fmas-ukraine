unit Stud_Terms_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, gr_uCommonConsts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  Stud_Terms_Ctrl_DM, gr_uMessage, ActnList, ZProc, uCommonSp,
  Unit_NumericConsts, Dates, gr_uCommonLoader, gr_uCommonProc, cxSpinEdit,
  cxGraphics, dxStatusBar,Registry, DateUtils;

type
  TFCtrlStudTerms = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMan: TcxGroupBox;
    LabelMan: TcxLabel;
    EditMan: TcxButtonEdit;
    BoxDates: TcxGroupBox;
    DateBegLabel: TcxLabel;
    EditDateBeg: TcxDateEdit;
    EditDateEnd: TcxDateEdit;
    DateEndLabel: TcxLabel;
    LabelKurs: TcxLabel;
    Actions: TActionList;
    ActionYes: TAction;
    BoxVidOpl: TcxGroupBox;
    EditDepartment: TcxButtonEdit;
    LabelDepartment: TcxLabel;
    SpinEditKurs: TcxSpinEdit;
    ComboBoxCategory: TcxLookupComboBox;
    LabelCategory: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    ActionF9: TAction;
    ActionEnter: TAction;
    PrikazMaskEdit: TcxMaskEdit;
    PrikazLabel: TcxLabel;
    EditDepartmentData: TcxMaskEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditDepartmentExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionF9Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure ActionEnterExecute(Sender: TObject);
    procedure SpinEditKursClick(Sender: TObject);
  private
   PIdStudInf:Int64;
   PIdStud:int64;
   PIdMan:integer;
   PIdDepartment:integer;
   PKodDepartment:string[10];
   DM:TDM;
   PRes:Variant;
   Pcfs:TZControlFormStyle;
   PLanguageIndex:byte;
   PUpdateDateEnd:integer;
   PCtrlType:integer;
   SpinEditKursValue:integer;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
    function PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64;CtrlType:integer):boolean;
    property Res:Variant read PRes;
  end;

function ViewStudTermsCtrl(AParameter:TObject):Variant;stdcall;
 exports ViewStudTermsCtrl;

implementation

uses FIBQuery, Math;

var First_NAME_FULL:string;
    First_DEPARTMENT_CODE:String;

{$R *.dfm}


function TFCtrlStudTerms.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
var PLanguageIndex:byte;
begin
 Result:=False;
 PLanguageIndex := IndexLanguage;
 if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
   with DM do
    try
     DB.Handle:=Db_Handle;
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='GR_CN_DT_STUD_INF_D';
     StProc.Prepare;
     StProc.ParamByName('ID_STUD_INF').AsInt64:=Id;
     StProc.ExecProc;
     StProc.Transaction.Commit;
     Result:=True;
     PRes:=-1;
    except
     on E:Exception do
      begin
       grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
       StProc.Transaction.Rollback;
       Result:=False;
      end;
     end;
end;

function ViewStudTermsCtrl(AParameter:TObject):Variant;stdcall;
var Form:TFCtrlStudTerms;
begin
 Form:=TFCtrlStudTerms.Create(TgrCtrlSimpleParam(AParameter).Owner);
 if TgrCtrlSimpleParam(AParameter).fs=zcfsDelete then
    result:=Form.DeleteRecord(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).Id)
 else
  begin
   result := Form.PrepareData(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).fs,
                              TgrCtrlSimpleParam(AParameter).Id,
                              TgrCtrlSimpleParam(AParameter).CtrlType);
   if Result<>False then
    begin
     Result := Form.ShowModal;
     if Result=mrYes then  Result:=Form.Res
     else Result := NULL;
    end
   else Result:=NULL;
  end;
  Form.Destroy;
end;

constructor TFCtrlStudTerms.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 DM:=TDM.Create(Self);
 ComboBoxCategory.Properties.DataController.DataSource := DM.DSourceCatStud;
 PLanguageIndex:=LanguageIndex;
 PRes:=NULL;
 PUpdateDateEnd:=0;
//******************************************************************************
 LabelMan.Caption        := LabelStudent_Caption[PLanguageIndex];
 DateBegLabel.Caption    := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption    := LabelDateEnd_Caption[PLanguageIndex];
 LabelKurs.Caption       := LabelKurs_Caption[PLanguageIndex];
 LabelDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
 LabelCategory.Caption   := LabelCategory_Caption[PLanguageIndex];
 BoxMan.Caption          := '';
 BoxVidOpl.Caption       := '';
 BoxDates.Caption        := '';
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';
end;

function TFCtrlStudTerms.PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64;CtrlType:integer):boolean;
var PDay,PMonth,PYear:word;
    DBegStud,DEndStud,DBeg,DEnd:TDate;
    Kurs:byte;
begin
 Result:=True;
 Pcfs := fs;
 PCtrlType:=CtrlType;
 DM.DSetCatStud.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_STUD_CAT_S';
 case fs of
  zcfsInsert:
  begin
    if(PCtrlType=1)then
    begin
      Caption:=Caption_Insert[PLanguageIndex];
      PrikazLabel.Visible:=true;
      PrikazMaskEdit.Visible:=true;
      with DM do
      try
        DB.Handle:=Db_Handle;
        DSetCatStud.Open;
        StProc.Transaction.StartTransaction;
        StProc.StoredProcName:='GR_MAN_BY_ID';
        StProc.Prepare;
        StProc.ParamByName('IN_ID_MAN').AsInt64:=Id;
        StProc.ExecProc;
        PIdStud            := 0;
        PIdMan             := StProc.ParamByName('ID_MAN').AsInt64;
        EditMan.Text       := StProc.ParamByName('FIO').AsString;

        EditDateBeg.Date   := strToDate('01.09.'+FormatDateTime('yyyy',Date));
        EditDateEnd.Date   := IncMonth(strToDate('30.06.'+FormatDateTime('yyyy',Date)),12);


        Kurs:=1;
        SpinEditKurs.Value := Kurs;


        StProc.Transaction.Commit;
      except
        on E:Exception do
        begin
          grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
          StProc.Transaction.Rollback;
          Result:=false;
        end;
      end;
    end else
    begin
      Caption:=Caption_Insert[PLanguageIndex];
      with DM do
      try
        DB.Handle:=Db_Handle;
        DSetCatStud.Open;
        StProc.Transaction.StartTransaction;
        StProc.StoredProcName:='GR_CN_DT_STUD_INF_FOR_I';
        StProc.Prepare;
        StProc.ParamByName('ID_STUD').AsInt64:=Id;
        StProc.ExecProc;
        PIdStud            := Id;
        EditMan.Text       := StProc.ParamByName('FIO').AsString;

        if VarIsNull(StProc.ParamByName('DATE_BEG_STUD').AsVariant) then DBegStud:=Date
                                                                    else DBegStud:=StProc.ParamByName('DATE_BEG').AsDate;
        if VarIsNull(StProc.ParamByName('DATE_END_STUD').AsVariant) then DEndStud:=Date
                                                                    else DEndStud:=StProc.ParamByName('DATE_END_STUD').AsDate;
        if DBegStud=DEndStud then
        begin
          EditDateBeg.Date := DBegStud;
          EditDateEnd.Date := DEndStud;
          BoxDates.Enabled := False;
        end else
        begin
          if VarIsNULL(StProc.ParamByName('DATE_END').AsVariant) then
            DEnd:=DEndStud
          else
          begin
            DEnd := StProc.ParamByName('DATE_END').AsDate;
            DecodeDate(DEnd,PYear,PMonth,PDay);
            DEnd := EncodeDate(PYear+1,PMonth,PDay);
          end;
          if VarIsNULL(StProc.ParamByName('DATE_BEG').AsVariant) then
            DBeg:=DBegStud
          else
          begin
            DBeg := StProc.ParamByName('DATE_BEG').AsDate;
            DecodeDate(DBeg,PYear,PMonth,PDay);
            DBeg := EncodeDate(PYear,PMonth,PDay);
          end;

          if DBegStud>DBeg then
          begin
            DBeg:=DBegStud;
            showmessage('0.-1');
          end;
          if DEndStud<DEnd then DEnd:=DEndStud;
          if DBeg>DEnd then DEnd:=DBeg;
          try
            EditDateBeg.Properties.MaxDate := DEndStud;
            EditDateBeg.Properties.MinDate := DBegStud;
            EditDateEnd.Properties.MaxDate := DEndStud;
            EditDateEnd.Properties.MinDate := DBegStud;

            EditDateBeg.Date := StrToDate('01.09.'+FormatDateTime('yyyy',DEndStud));// DBeg;
            EditDateEnd.Date := IncMonth(strToDate('30.06.'+FormatDateTime('yyyy',DEndStud)),12);//DEnd;

          except
            showmessage('Даты не допустимы');
          end;
        end;

        if VarIsNull(StProc.ParamByName('KURS').AsVariant) then
          Kurs:=1
        else
        begin
          Kurs:=StProc.ParamByName('KURS').AsInteger+1;
          PUpdateDateEnd:=1;
        end;

        SpinEditKurs.Value := Kurs;

        if not VarIsNULL(StProc.ParamByName('ID_DEPARTMENT').AsVariant) then
          PIdDepartment   := StProc.ParamByName('ID_DEPARTMENT').AsInteger;

        ComboBoxCategory.EditValue  := StProc.ParamByName('ID_CAT_STUD').AsVariant;
        PKodDepartment     := VarToStrDef(StProc.ParamByName('KOD_DEPARTMENT').AsString,'');
        EditDepartmentData.Text := VarToStrDef(StProc.ParamByName('NAME_DEPARTMENT').AsString,'');
        EditDepartment.Text:= VarToStrDef(StProc.ParamByName('KOD_DEPARTMENT').AsString,'');
        StProc.Transaction.Commit;
      except
        on E:Exception do
        begin
          grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
          StProc.Transaction.Rollback;
          Result:=false;
        end;
      end;
    end;

    DM.DSetFastDep.close;
    DM.DSetFastDep.SQLs.SelectSQL.Text := 'SELECT * FROM GR_VSP_DEPARTMENT order by DATE_ISP desc';
    DM.DSetFastDep.Open;

    if (DM.DSetFastDep['ID_DEPARTMENT']<>null) and (DM.DSetFastDep['ID_DEPARTMENT'])<>0  then
    PIdDepartment  :=DM.DSetFastDep['ID_DEPARTMENT'];
    if  DM.DSetFastDep['NAME_FULL']<>null then
    EditDepartmentData.Text := VarToStrDef(DM.DSetFastDep['NAME_FULL'],'');
    if DM.DSetFastDep['DEPARTMENT_CODE']<>null then
    EditDepartment.Text:= VarToStrDef(DM.DSetFastDep['DEPARTMENT_CODE'],'');


  end;
  zcfsUpdate:
   begin
    Caption:=Caption_Update[PLanguageIndex];
    with DM do
     try
      DB.Handle:=Db_Handle;
      DSetCatStud.Open;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_CN_DT_STUD_INF_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('ID_STUD_INF').AsInt64:=Id;
      StProc.ExecProc;
      PIdStudInf         := Id;
      PIdStud            := StProc.ParamByName('ID_STUD').AsInt64;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;
      if VarIsNull(StProc.ParamByName('DATE_BEG_STUD').AsVariant) then DBegStud:=Date
                                                                  else DBegStud:=StProc.ParamByName('DATE_BEG_STUD').AsDate;
      if VarIsNull(StProc.ParamByName('DATE_END_STUD').AsVariant) then DEndStud:=Date
                                                                  else DEndStud:=StProc.ParamByName('DATE_END_STUD').AsDate;
      if DBegStud=DEndStud then
         begin
              EditDateBeg.Date := DBegStud;
              EditDateEnd.Date := DEndStud;
              BoxDates.Enabled := False;
         end
      else
         begin
              if VarIsNULL(StProc.ParamByName('DATE_END').AsVariant) then DEnd:=DEndStud
                                                                     else DEnd := StProc.ParamByName('DATE_END').AsDate;
              if VarIsNULL(StProc.ParamByName('DATE_BEG').AsVariant) then DBeg:=DBegStud
                                                                     else DBeg := StProc.ParamByName('DATE_BEG').AsDate;

              if DBegStud>DBeg then DBeg:=DBegStud;
              
              if DEndStud<DEnd then DEnd:=DEndStud;
              
              if DBeg>DEnd then DEnd:=DBeg;
              EditDateBeg.Date := DBeg;
              EditDateBeg.Properties.MaxDate := DEndStud;
              EditDateBeg.Properties.MinDate := DBegStud;

              EditDateEnd.Date := DEnd;
              EditDateEnd.Properties.MaxDate := DEndStud;
              EditDateEnd.Properties.MinDate := DBegStud;
         end;

      if VarIsNull(StProc.ParamByName('KURS').AsVariant) then Kurs:=1
                                                         else Kurs:=StProc.ParamByName('KURS').AsInteger;

      SpinEditKurs.Value := Kurs;

      if not VarIsNULL(StProc.ParamByName('ID_DEPARTMENT').AsVariant) then
         PIdDepartment   := StProc.ParamByName('ID_DEPARTMENT').AsInteger;

      ComboBoxCategory.EditValue  := StProc.ParamByName('ID_CAT_STUD').AsVariant;

      if not VarIsNULL(StProc.ParamByName('ID_DEPARTMENT').AsVariant) then
         PIdDepartment   := StProc.ParamByName('ID_DEPARTMENT').AsInteger;
      PKodDepartment     := VarToStrDef(StProc.ParamByName('KOD_DEPARTMENT').AsString,'');
      EditDepartmentData.Text := VarToStrDef(StProc.ParamByName('NAME_DEPARTMENT').AsString,'');
      EditDepartment.Text:= StProc.ParamByName('KOD_DEPARTMENT').AsString;
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
        Result:=false;
       end;
     end;
    DM.DSetFastDep.close;
    DM.DSetFastDep.SQLs.SelectSQL.Text := 'SELECT * FROM GR_VSP_DEPARTMENT order by DATE_ISP';
    DM.DSetFastDep.Open;
   end;
  zcfsShowDetails:
   begin
    Caption:=Caption_Detail[PLanguageIndex];
    self.BoxVidOpl.Enabled       := false;
    self.BoxDates.Enabled        := false;
    YesBtn.Visible:=False;
    CancelBtn.Caption := ExitBtn_Caption[PlanguageIndex];
    EditDepartment.Properties.Buttons[0].Visible:=False;
    with DM do
     try
      DB.Handle:=Db_Handle;
      DSetCatStud.Open;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_CN_DT_STUD_INF_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('ID_STUD_INF').AsInt64:=Id;
      StProc.ExecProc;
      PIdStud:=StProc.ParamByName('ID_STUD').AsInteger;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;
      EditDateEnd.Date   := StProc.ParamByName('DATE_END').AsDate;
      EditDateBeg.Date   := StProc.ParamByName('DATE_BEG').AsDate;
      if VarIsNULL(StProc.ParamByName('KURS').AsVariant) then SpinEditKurs.Value:=1
                                                         else SpinEditKurs.Value := StProc.ParamByName('KURS').AsInteger;
      ComboBoxCategory.EditValue  := StProc.ParamByName('ID_CAT_STUD').AsVariant;
      PIdDepartment      := StProc.ParamByName('ID_DEPARTMENT').AsInteger;
      PKodDepartment     := StProc.ParamByName('KOD_DEPARTMENT').AsString;
      EditDepartmentData.Text := StProc.ParamByName('NAME_DEPARTMENT').AsString;
      EditDepartment.Text:= StProc.ParamByName('KOD_DEPARTMENT').AsString;
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
        Result:=false;
       end;
     end;
   end;
 end;
 SpinEditKursValue:=Kurs;
end;

procedure TFCtrlStudTerms.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFCtrlStudTerms.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var sp: TSprav;
begin
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
            FieldValues['Id_Property']:=4;
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
        EditDepartmentData.Text := varToStrDef(sp.Output['NAME_FULL'],'');
        PIdDepartment:=sp.Output['ID_DEPARTMENT'];

        First_NAME_FULL:=varToStrDef(sp.Output['NAME_FULL'],'');        // For BeckupEdit
        First_DEPARTMENT_CODE:=varToStrDef(sp.Output['DEPARTMENT_CODE'],'');

       end;
    sp.Free;
end;

procedure TFCtrlStudTerms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaultTransaction.InTransaction then DM.DefaultTransaction.Commit;
end;

procedure TFCtrlStudTerms.ActionYesExecute(Sender: TObject);
var Res:Int64;
begin
YesBtn.SetFocus;
if PIdDepartment=0 then
 begin
  grShowMessage(ECaption[PLanguageIndex],EDepartmentInput_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditDateBeg.Date>EditDateEnd.Date then
 begin
  grShowMessage(ECaption[PLanguageIndex],EInputTerms_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;

{if DM.DSetFastDep.Locate('NAME_FULL',EditDepartmentData.Text,[loCaseInsensitive, loPartialKey])
    then
      begin
        PIdDepartment  :=DM.DSetFastDep['ID_DEPARTMENT'];
        EditDepartmentData.Text := VarToStrDef(DM.DSetFastDep['NAME_FULL'],'');
        EditDepartment.Text:= VarToStrDef(DM.DSetFastDep['DEPARTMENT_CODE'],'');
      end
else
  begin
    EditDepartmentData.Text := First_NAME_FULL;
    EditDepartment.Text:= First_DEPARTMENT_CODE;
  end;}


with DM do
try
 StProcTransaction.StartTransaction;
 if(PCtrlType=1)then
 begin
   StProc.StoredProcName:='GR_CN_DT_STUD_I';
   StProc.Prepare;
   StProc.ParamByName('ID_MAN').AsInteger:=PIdMan;
   StProc.ParamByName('DATE_BEG').AsDate:=StrToDate(EditDateBeg.Text);
   StProc.ParamByName('DATE_END').AsDate:=StrToDate(EditDateEnd.Text);
   StProc.ParamByName('PRIKAZ').AsString:=PrikazMaskEdit.Text;
   StProc.ExecProc;
   PIdStud:=StProc.ParamByName('ID_STUD').AsInt64;
 end;
 case Pcfs of
  zcfsInsert:
  begin
    if(PCtrlType=1)then
      StProc.StoredProcName:='GR_CN_DT_STUD_INF_I2'
    else
      StProc.StoredProcName:='GR_CN_DT_STUD_INF_I';
  end;
  zcfsUpdate: StProc.StoredProcName:='GR_CN_DT_STUD_INF_U';
 end;
 StProc.Prepare;

 StProc.ParamByName('ID_STUD').AsInt64:=PIdStud;
 StProc.ParamByName('ID_CAT_STUD').AsInt64:=ComboBoxCategory.EditValue;
 StProc.ParamByName('ID_DEPARTMENT').AsInteger:=PIdDepartment;
 StProc.ParamByName('DATE_BEG').AsDate:=StrToDate(EditDateBeg.Text);
 StProc.ParamByName('DATE_END').AsDate:=StrToDate(EditDateEnd.Text);
 StProc.ParamByName('KURS').AsInteger:=SpinEditKurs.Value;

 case Pcfs of
  zcfsUpdate:
    StProc.ParamByName('ID_STUD_INF').AsInt64:=PIdStudInf;
 end;
 StProc.ExecProc;

  DM.DSetFastDep.Close;

  if PKodDepartment=null then PKodDepartment:='0';
  DM.DSetFastDep.SQLs.SelectSQL.Text:='execute procedure GR_VSP_DEPARTMENT_U('''+VarToStrDef(PIdDepartment,'0')
                                                                             +''','''+EditDepartment.Text+''','''
                                                                             + EditDepartmentData.Text+''')';
  DM.DSetFastDep.Open;

 if pcfs=zcfsInsert then
 begin
   if(PCtrlType=1)then
     Res:=PIdStud
   else
     Res:=StProc.ParamByName('ID_STUD_INF').AsInt64
 end
 else Res:=0;
 StProc.Transaction.Commit;
 PRes:=Res;
 ModalResult:=mrYes;
except
 on e:Exception do
  begin
   grShowMessage(ECaption[PLanguageIndex],e.message,mtError,[mbOk]);
   StProc.transaction.RollBack;
   PRes:=NULL;
  end;
end;




end;

procedure TFCtrlStudTerms.EditDepartmentExit(Sender: TObject);
var Department:Variant;
begin
if ((EditDepartment.Text<>'')and(NumPredpr(Dm.DB.Handle)<>7)) then
 begin
  if EditDepartment.Text=PKodDepartment then Exit;
  Department:=DepartmentByKod(EditDepartment.Text,Dm.DB.Handle);
  if VarArrayDimCount(Department)>0 then
   begin
    PIdDepartment:=Department[0];
    PKodDepartment:=Department[1];
    EditDepartmentData.Text := Department[2];
   end
  else
   EditDepartment.SetFocus;
 end;
end;

procedure TFCtrlStudTerms.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFCtrlStudTerms.ActionF9Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
 CancelBtn.SetFocus;
 Key := '\Software\Grant\CtrlStudTerms';

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteInteger('EditKurs',SpinEditKurs.EditValue);
  reg.WriteDate('DateBegPeriod',EditDateBeg.EditValue);
  reg.WriteDate('DateEndPeriod',EditDateEnd.EditValue);
  reg.WriteInteger('ComboBoxCategory',ComboBoxCategory.EditValue);
  //buttonEdit
  reg.WriteString('EditDepartment',EditDepartment.Text);
  reg.WriteInteger('PIdDepartment',PIdDepartment);

  reg.WriteString('LabelDepartmentData',EditDepartmentData.Text);
  reg.WriteString('Prikaz',PrikazMaskEdit.Text);
 finally
  reg.Free;
 end;
end;

procedure TFCtrlStudTerms.FormShow(Sender: TObject);
begin
if Pcfs=zcfsInsert then RestoreFromBuffer(self);
  //FormResize(sender);
  if PUpdateDateEnd=1 then EditDateEnd.Setfocus;
end;





procedure TFCtrlStudTerms.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin

  Key := '\Software\Grant\CtrlStudTerms';
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey(Key,False) then
   begin
    reg.free;
    Exit;
   end;

 if reg.ReadString('IsBuffer')<>'1' then
  begin
   reg.Free;
   exit;
  end;
 EditDateBeg.EditValue:=reg.ReadDate('DateBegPeriod');
 EditDateEnd.EditValue:=reg.ReadDate('DateEndPeriod');
 SpinEditKurs.EditValue:=reg.ReadInteger('EditKurs');
 ComboBoxCategory.EditValue:=reg.ReadInteger('ComboBoxCategory');
 EditDepartment.Text:=reg.ReadString('EditDepartment');
 PIdDepartment:=reg.ReadInteger('PIdDepartment');
 EditDepartmentData.Text:=reg.ReadString('LabelDepartmentData');
 PrikazMaskEdit.Text:=reg.ReadString('Prikaz');
 EditDateBeg.SetFocus;
 Reg.Free;
end;


procedure TFCtrlStudTerms.FormCreate(Sender: TObject);
begin
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
end;

procedure TFCtrlStudTerms.ActionEnterExecute(Sender: TObject);
begin
if CancelBtn.Focused=true then close();
if YesBtn.Focused=true then  ActionYes.Execute;
if EditDepartment.Focused=true then  EditDepartmentData.SetFocus;
if EditDepartmentData.Focused=true then
  begin
    YesBtn.SetFocus;/////
    ///DSet1.Locate('ID_DEPARTMENT',DSet1['ID_PARENT'],[]);
    {if DM.DSetFastDep.Locate('NAME_FULL',EditDepartmentData.Text,[loCaseInsensitive, loPartialKey])
    then
      begin
        PIdDepartment  :=DM.DSetFastDep['ID_DEPARTMENT'];
        EditDepartmentData.Text := VarToStrDef(DM.DSetFastDep['NAME_FULL'],'');
        EditDepartment.Text:= VarToStrDef(DM.DSetFastDep['DEPARTMENT_CODE'],'');
      end; }
  end;
  if ComboBoxCategory.Focused=true then  EditDepartment.SetFocus;
  if EditDateEnd.Focused=true then  ComboBoxCategory.SetFocus;
  if EditDateBeg.Focused=true then  EditDateEnd.SetFocus;
  if SpinEditKurs.Focused=true then  EditDateBeg.SetFocus;
end;

procedure TFCtrlStudTerms.SpinEditKursClick(Sender: TObject);
var Y, M, D: Word;
begin



  if SpinEditKursValue < SpinEditKurs.Value then
  begin
    EditDateBeg.Date:=IncYear(EditDateBeg.Date);
    EditDateEnd.Date:=IncYear(EditDateEnd.Date);
  end;
  if SpinEditKursValue > SpinEditKurs.Value then
  begin
  DecodeDate(EditDateBeg.Date, Y, M, D);
  if (m=2) and  (d=29) then d:=28;
  EditDateBeg.Date:=EncodeDate(Y - 1, M, D);
  DecodeDate(EditDateEnd.Date, Y, M, D);
  if (m=2) and  (d=29) then d:=28;
  EditDateEnd.Date:=EncodeDate(Y - 1, M, D);
  end;

  SpinEditKursValue:=SpinEditKurs.Value;
end;

end.
