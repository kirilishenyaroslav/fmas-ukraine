unit NonSpisokControl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  NonSpisokControl_DataModule, ZMessages, ActnList, cxSpinEdit, dates, ZProc,
  Unit_ZGlobal_Consts, Unit_NumericConsts, Registry, cxGraphics,
  dxStatusBar, uCommonSP, cxCalc, NonSpisokCtrl_ByHours, Menus;

type
  TFZ_NonSpisok_Control = class(TForm)
    BoxMan: TcxGroupBox;
    LabelMan: TcxLabel;
    EditMan: TcxButtonEdit;
    BoxDatesSum: TcxGroupBox;
    LabelSumma: TcxLabel;
    Actions: TActionList;
    ActionYes: TAction;
    LabelPeriod: TcxLabel;
    EditMonth: TcxComboBox;
    EditYear: TcxSpinEdit;
    LabelCategory: TcxLabel;
    LabelVidOpl: TcxLabel;
    EditDepartment: TcxButtonEdit;
    LabelDepartment: TcxLabel;
    EditSmeta: TcxButtonEdit;
    LabelSmeta: TcxLabel;
    EditVidOpl: TcxButtonEdit;
    EditCategory: TcxLookupComboBox;
    LabelVidOplData: TcxLabel;
    LabelDepartmentData: TcxLabel;
    LabelSmetaData: TcxLabel;
    ActionSaveToBuffer: TAction;
    dxStatusBar1: TdxStatusBar;
    PopupMenu1: TPopupMenu;
    ByClock: TMenuItem;
    EditTypePost: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    CheckDS: TpFIBDataSet;
    EditPrikazB: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    EdHours: TcxCalcEdit;
    cxLabel4: TcxLabel;
    EdTarif: TcxCalcEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    EditSumma: TcxMaskEdit;
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditDepartmentPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionYesExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditDepartmentExit(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionSaveToBufferExecute(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure FormResize(Sender: TObject);
    procedure ByClockClick(Sender: TObject);
    procedure EditCategoryPropertiesChange(Sender: TObject);
    procedure EditPrikazBPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdTarifPropertiesEditValueChanged(Sender: TObject);
    procedure EdHoursPropertiesEditValueChanged(Sender: TObject);
    procedure EditMonthExit(Sender: TObject);
  private
   DM:TDM;

   PLanguageIndex:byte;

   PId_Man:integer;
   PId_VidOpl:integer;
   PKod_VidOpl:integer;
   PId_Department:integer;
   PKod_Department:string;
   PId_Smeta:int64;
   PKod_Smeta:integer;
   pHoursParam:TNonSpisokByHours;
   PKodSetup:Integer;

   PRes:Variant;
   PParameter:TNonSpisokControlParameter;
   function CheckPochas(id_vo: Integer): Boolean;
  public
    constructor Create(AParameter:TNonSpisokControlParameter);reintroduce;
    property Res:Variant read PRes;
  end;

implementation

uses pFIBStoredProc, FIBQuery, pFIBQuery, UPochasOrdersNS, Math;


{$R *.dfm}
function TFZ_NonSpisok_Control.CheckPochas(id_vo: Integer): Boolean;
begin
     if CheckDS.Active then CheckDS.Close;
     CheckDS.SelectSQL.Text:=' SELECT * FROM Z_POCHAS_GET_VO WHERE ID_VIDOPL='+IntToStr(id_vo);
     CheckDS.Open;
     CheckDS.FetchAll;
     if CheckDS.RecordCount>0
     then begin
               if (CheckDS.FieldByName('NEED_ORDER').Value=1)
               then begin
                         cxLabel2.Visible   :=true;
                         EditPrikazB.Visible:=true;
                         EdHours.Visible:=True;
                         EdTarif.Visible:=True;
                         EditSumma.PopupMenu:=nil;
                         cxLabel3.Visible:=True;
                         cxLabel4.Visible:=True;
                         EditSumma.Enabled:=False;
               end
               else begin
                         cxLabel2.Visible   :=false;
                         EditPrikazB.Visible:=false;
                         EdHours.Visible:=false;
                         EdTarif.Visible:=false;
                         EditSumma.PopupMenu:=PopupMenu1;
                         cxLabel3.Visible:=false;
                         cxLabel4.Visible:=false;
                         EditSumma.Enabled:=true;
                         EditPrikazB.Tag:=0;
               end
     end
     else begin
               cxLabel2.Visible   :=false;
               EditPrikazB.Visible:=false;
               EdHours.Visible:=false;
               EdTarif.Visible:=false;
               EditSumma.PopupMenu:=PopupMenu1;
               cxLabel3.Visible:=false;
               cxLabel4.Visible:=false;
               EditSumma.Enabled:=true;
               EditPrikazB.Tag:=0;
     end;
end;


constructor TFZ_NonSpisok_Control.Create(AParameter:TNonSpisokControlParameter);
var CheckDS1:TpFIBDataSet;
begin
 inherited Create(AParameter.Owner);
 DM:=TDM.Create(AParameter);
 PRes:=NULL;
 CheckDS.Database:=DM.DB;
 CheckDS.Transaction:=DM.DefaultTransaction;
 PLanguageIndex:=LanguageIndex;
 PParameter:=AParameter;
 //EditSumma.Properties.EditMask := '-\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
 pHoursParam.Clock := '0';
//******************************************************************************
 LabelMan.Caption := LabelMan_Caption[PLanguageIndex];
 LabelVidOpl.Caption := LabelVidOpl_Caption[PLanguageIndex];
 LabelDepartment.Caption := LabelDepartment_Caption[PLanguageIndex];
 LabelSmeta.Caption := LabelSmeta_Caption[PLanguageIndex];
 LabelCategory.Caption := LabelCategory_Caption[PLanguageIndex];
 LabelPeriod.Caption := LabelPeriod_Caption[PLanguageIndex];
 LabelSumma.Caption  := LabelSumma_Caption[PLanguageIndex];
 EditMonth.Properties.Items.Text:=MonthesList_Text[PLanguageIndex];
 YesBtn.Caption := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[PLanguageIndex];
//******************************************************************************
 dxStatusBar1.Panels[0].Text := ToBufferBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := YesBtn_Hint[PLanguageIndex];
 dxStatusBar1.Panels[2].Text := CancelBtn_Hint[PLanguageIndex];

 EditCategory.Properties.ListSource:=DM.DSourceCategory;
 EditTypePost.Properties.ListSource:=DM.DSourceTypePost;

 case AParameter.ControlFormStyle of
  zcfsInsert:
   begin
    caption := Caption_Insert[PLanguageIndex];
    EditMan.Text := VarToStr(DM.DSet['TN'])+' - '+VarToStr(DM.DSet['FIO']);
    PId_Man:=DM.DSet['ID_MAN'];
    self.EditMonth.ItemIndex   := YearMonthFromKodSetup(DM.CurrentKodSetup,False)-1;
    self.EditYear.Value        := YearMonthFromKodSetup(DM.CurrentKodSetup);
   end;
  zcfsUpdate:
   begin
    caption := Caption_Update[PLanguageIndex];
    EditMan.Text := VarToStr(DM.DSet['TN'])+' - '+VarToStr(DM.DSet['FIO']);
    PId_Man:=DM.DSet['ID_MAN'];
    EditVidOpl.Text := VarToStr(DM.DSet['KOD_VIDOPL']);
    LabelVidOplData.Caption := VarToStr(DM.DSet['NAME_VIDOPL']);
    PId_VidOpl := DM.DSet['ID_VIDOPL'];
    CheckPochas(DM.DSet['ID_VIDOPL']);
    EditDepartment.Text := VarToStr(DM.DSet['KOD_DEPARTMENT']);
    LabelDepartmentData.Caption:=VarToStr(DM.DSet['FULL_NAME_DEPARTMENT']);
    PId_Department:=DM.DSet['ID_DEPARTMENT'];
    EditSmeta.Text := VarToStr(DM.DSet['KOD_SMETA']);
    LabelSmetaData.Caption := VarToStr(DM.DSet['NAME_SMETA']);
    PId_Smeta:=DM.DSet['ID_SMETA'];
    EditCategory.EditValue := DM.DSet['ID_CATEGORY'];
    EditTypePost.EditValue := DM.DSet['ID_type_post'];
    EditSumma.Text := varToStr(DM.DSet['SUMMA']);
    EditYear.Value := YearMonthFromKodSetup(DM.DSet['KOD_SETUP2']);
    EditMonth.ItemIndex := YearMonthFromKodSetup(DM.DSet['KOD_SETUP2'],False)-1;
    pHoursParam.Clock := VarToStrDef(DM.DSet['CLOCK'],'');
    pHoursParam.Sum_Clock := ifThen(VarIsNull(DM.DSet['SUM_CLOCK']),0,DM.DSet['SUM_CLOCK']);
    pHoursParam.Percent := ifThen(VarIsNull(DM.DSet['PERCENT']),0,DM.DSet['PERCENT']);

    if PParameter.ControlFormStyle=zcfsUpdate
    then CheckPochas(DM.DSet['ID_VIDOPL']);


    if (DM.DSet['POCHAS_ORDER']>0)
    then begin
           EditPrikazB.Visible:=True;
           EditPrikazB.Text:='Наказ від '+DM.DSet.FieldByName('date_order').AsString+' № '+DM.DSet.FieldByName('num_order').AsString;

           cxLabel2.Visible   :=true;
           EditPrikazB.Visible:=true;
           EdHours.Visible:=True;
           EdTarif.Visible:=True;
           EditSumma.PopupMenu:=nil;
           cxLabel3.Visible:=True;
           cxLabel4.Visible:=True;

           if DM.DSet.FieldByName('POCHAS_ORDER').Value<>null
           then EditPrikazB.Tag:=DM.DSet.FieldByName('POCHAS_ORDER').Value;

           EdTarif.Value:=DM.DSet.FieldByName('SUM_CLOCK').Value;
           EdHours.Value:=DM.DSet.FieldByName('CLOCK').Value;

           EditSumma.Enabled:=False;

    end;


       if DM.DSetTypePost.Active then DM.DSetTypePost.Close;
       DM.DSetTypePost.SQLs.SelectSQL.Text := ' SELECT * FROM Z_GET_TYPE_POST_BY_CATEGORY('+
                                            VarToStr(EditCategory.EditValue)+','
                                            +IntToStr(PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1))+') ';
       DM.DSetTypePost.Open;
       DM.DSetTypePost.FetchAll;
  end;

  zcfsShowDetails:
   begin
    caption := Caption_Detail[PLanguageIndex];
    EditMan.Text := VarToStr(DM.DSet['TN'])+' - '+VarToStr(DM.DSet['FIO']);
    PId_Man:=DM.DSet['ID_MAN'];
    EditVidOpl.Text := VarToStr(DM.DSet['KOD_VIDOPL']);
    LabelVidOplData.Caption:=VarToStr(DM.DSet['NAME_VIDOPL']);
    PId_VidOpl := DM.DSet['ID_VIDOPL'];
    EditDepartment.Text := VarToStr(DM.DSet['KOD_DEPARTMENT']);
    LabelDepartmentData.Caption := VarToStr(DM.DSet['FULL_NAME_DEPARTMENT']);
    PId_Department:=DM.DSet['ID_DEPARTMENT'];
    EditSmeta.Text := VarToStr(DM.DSet['KOD_SMETA']);
    LabelSmetaData.Caption := VarToStr(DM.DSet['NAME_SMETA']);
    PId_Smeta:=DM.DSet['ID_SMETA'];
    EditCategory.EditValue := DM.DSet['ID_CATEGORY'];
    EditTypePost.EditValue := DM.DSet['ID_type_post'];
    EditSumma.Text := varToStr(DM.DSet['SUMMA']);
    EditYear.Value := YearMonthFromKodSetup(DM.DSet['KOD_SETUP2']);
    EditMonth.ItemIndex := YearMonthFromKodSetup(DM.DSet['KOD_SETUP2'],False)-1;
    BoxDatesSum.Enabled := False;
    YesBtn.Visible:=False;
   end;
 end;


 try
           CheckDS1:=TpFIBDataSet.Create(self);
           CheckDS1.Database   :=DM.DB;
           CheckDS1.Transaction:=DM.DefaultTransaction;
           CheckDS1.SelectSQL.Text:='select Z_POCHAS_TARIF_MAY_EDIT from Z_POCHAS_TARIF_MAY_EDIT';
           CheckDS1.Open;
           if (CheckDS1.RecordCount>0)
           then begin
                     if (CheckDS1.FieldByName('Z_POCHAS_TARIF_MAY_EDIT').Value=1)
                     then EdTarif.Enabled:=true
                     else EdTarif.Enabled:=false;
           end;
           CheckDS1.Close;
           CheckDS1.Free;
           except on e:exception do begin end;
  end;
end;

procedure TFZ_NonSpisok_Control.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin

VidOPl:=LoadVidOpl(self,
                   DM.DB.Handle,
                   zfsModal,
                   ValueFieldZSetup(DM.DB.Handle,'ID_VO_PROP_NONSPISOK'),
                   ValueFieldZSetup(DM.DB.Handle,'Z_ID_SYSTEM'));

if VarArrayDimCount(VidOpl)> 0 then
 if VidOpl[0]<> NULL then begin
   EditVidOpl.Text := VarToStr(VidOpl[2]);
   LabelVidOplData.Caption := VarToStr(VidOpl[1]);
   PKod_VidOpl := VidOpl[2];
   PId_VidOpl      := VidOpl[0];
   CheckPochas(VidOpl[0]);
  end;
end;

procedure TFZ_NonSpisok_Control.EditManPropertiesButtonClick(
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

procedure TFZ_NonSpisok_Control.EditDepartmentPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var sp: TSprav;
    Date:TDate;
    KS:integer;
begin
    KS := PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1);
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

procedure TFZ_NonSpisok_Control.EditSmetaPropertiesButtonClick(
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

procedure TFZ_NonSpisok_Control.ActionYesExecute(Sender: TObject);
var tPercent:double;
    tClock:double;
    tSumClock:double;
var CheckSP:TpFIBStoredProc;
    ExitFlag:Boolean;
begin
      if EditPrikazB.Visible and (EditPrikazB.Tag=0)
      then begin
                if CheckDS.RecordCount>0
                then begin
                          if CheckDS.FieldByName('need_order').Value=1
                          then begin
                                    ShowMessage('Не вибрано наказ для погодинної оплати праці!');
                                    EditPrikazB.SetFocus;
                                    Exit;
                          end;
                end;
      end;

      if EditPrikazB.Visible and (EditPrikazB.Tag=0)
      then begin
                tPercent  := pHoursParam.Percent;
                tClock    := ifThen(trim(pHoursParam.Clock)='',0,StrToFloat(pHoursParam.Clock));
                tSumClock := pHoursParam.Sum_Clock;
      end
      else begin
                tPercent  := 100;
                tClock    := EdHours.Value;
                tSumClock := EdTarif.Value;
      end;

      if EditMan.Text=''
      then begin
                EditMan.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],ManInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if EditMonth.Text=''
      then begin
                EditMonth.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],MonthInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if EditYear.Text=''
      then begin
                EditYear.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],YearInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if (EditSumma.Text='') and EditSumma.enabled
      then begin
                EditSumma.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],SummaInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if EditCategory.Text=''
      then begin
                EditCategory.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],CategoryInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if EditTypePost.Text=''
      then begin
                EditTypePost.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],'Треба вибрати тип персоналу!',mtError,[mbOK]);
                Exit;
      end;

      if EditVidOpl.Text=''
      then begin
                EditVidOpl.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],VidOplInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if EditDepartment.Text=''
      then begin
                EditDepartment.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],DepartmentInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if EditSmeta.Text=''
      then begin
                EditSmeta.SetFocus;
                ZShowMessage(Error_Caption[PLanguageIndex],SmetaInput_ErrorText[PLanguageIndex],mtError,[mbOK]);
                Exit;
      end;

      if EditPrikazB.Visible
      then begin
                CheckSP:=TpFIBStoredProc.Create(self);
                CheckSP.Database:=DM.DB;
                CheckSP.Transaction:=DM.DefaultTransaction;
                CheckSP.StoredProcName:='Z_POCHAS_CHECK_NS';
                CheckSP.Prepare;


                case PParameter.ControlFormStyle of
                zcfsInsert: CheckSP.ParamByName('id_non_spisok').Value    :=0;
                zcfsUpdate: CheckSP.ParamByName('id_non_spisok').Value    :=PParameter.Id;
                end;

                CheckSP.ParamByName('id_pochas_plan').Value:=EditPrikazB.Tag;
                CheckSP.ParamByName('id_vo').AsInt64       :=PId_VidOpl;
                CheckSP.ParamByName('hours').Value         :=tClock;
                CheckSP.ParamByName('kod_setup').Value     :=PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1);
                CheckSP.ParamByName('id_man').Value        :=PId_Man;

                CheckSP.ExecProc;

                ExitFlag:=false;
                if CheckSP.ParamByName('result').Value=0
                then begin
                          ZShowMessage(ZeInputError_Caption[PLanguageIndex], CheckSP.ParamByName('error_msg').AsString ,mtInformation,[mbOK]);
                          ExitFlag:=true;
                end;

                CheckSP.Free;

                if ExitFlag then Exit;
      end;





case PParameter.ControlFormStyle of
 zcfsInsert:
  with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName:='Z_NONSPISOK_I';
   Prepare;
   ParamByName('ID_MAN').AsInteger := PId_Man;
   ParamByName('ID_VIDOPL').AsInteger := PId_VidOpl;
   ParamByName('ID_DEPARTMENT').AsInteger := PId_Department;
   ParamByName('ID_SMETA').AsInt64 := PId_Smeta;
   ParamByName('ID_CATEGORY').AsInteger := EditCategory.EditValue;
   ParamByName('KOD_SETUP2').AsInteger := PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1);
   if EditSumma.enabled and (EditSumma.Text<>'') then  ParamByName('SUMMA').AsExtended :=  StrToFloat(EditSumma.Text)
   else   ParamByName('SUMMA').AsExtended :=EdTarif.Value*EdHours.Value;
   ParamByName('PERCENT').AsExtended := tPercent;
   ParamByName('SUM_CLOCK').AsExtended := tSumClock;
   ParamByName('CLOCK').AsExtended := tClock;
   ParamByName('ID_TYPE_POST').AsInteger := EditTypePost.EditValue;

   if (EditPrikazB.Tag>0)
   then ParamByName('POCHAS_ORDER').value     := EditPrikazB.Tag
   else ParamByName('POCHAS_ORDER').value     := Null;

   ExecProc;
   PRes:=ParamByName('ID').AsInteger;
   Transaction.Commit;
   ModalResult:=mrYes;
  except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
 zcfsUpdate:
  with DM.StProc do
  try
   Transaction.StartTransaction;
   StoredProcName:='Z_NONSPISOK_U';
   Prepare;
   ParamByName('ID').AsInteger := PParameter.Id;
   ParamByName('ID_MAN').AsInteger := PId_Man;
   ParamByName('ID_VIDOPL').AsInteger := PId_VidOpl;
   ParamByName('ID_DEPARTMENT').AsInteger := PId_Department;
   ParamByName('ID_SMETA').AsInt64 := PId_Smeta;
   ParamByName('ID_CATEGORY').AsInteger := EditCategory.EditValue;
   ParamByName('KOD_SETUP2').AsInteger := PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1);
   if EditSumma.enabled and (EditSumma.Text<>'') then  ParamByName('SUMMA').AsExtended :=  StrToFloat(EditSumma.Text)
   else   ParamByName('SUMMA').AsExtended :=EdTarif.Value*EdHours.Value;;
   ParamByName('KOD_SETUP').asInteger := DM.DSet['KOD_SETUP'];
   ParamByName('DATE_REG').asDate     := VarToDateTime(DM.DSet['DATE_REG']);
   ParamByName('PERCENT').AsExtended := tPercent;
   ParamByName('SUM_CLOCK').AsExtended := tSumClock;
   ParamByName('CLOCK').AsExtended := tClock;
   ParamByName('ID_TYPE_POST').AsInteger := EditTypePost.EditValue;

   if (EditPrikazB.Tag>0)
   then ParamByName('POCHAS_ORDER').value     := EditPrikazB.Tag
   else ParamByName('POCHAS_ORDER').value     := Null;

   ExecProc;
   Transaction.Commit;
   PRes:=PParameter.Id;
   ModalResult:=mrYes;
  except
   on E:Exception do
    begin
     ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
     Transaction.Rollback;
    end;
  end;
end;
end;

procedure TFZ_NonSpisok_Control.FormCreate(Sender: TObject);
begin
FormResize(Sender);
if PParameter.ControlFormStyle = zcfsDelete then
 if ZShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PlanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
  with DM.StProc do
   try
    Transaction.StartTransaction;
    StoredProcName:='Z_NONSPISOK_D';
    Prepare;
    ParamByName('ID').AsInteger := PParameter.Id;
    ExecProc;
    Transaction.Commit;
    PRes:=-1;
   except
    on E:Exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
      Transaction.Rollback;
     end;
   end;
end;

procedure TFZ_NonSpisok_Control.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaultTransaction.InTransaction then DM.DefaultTransaction.Commit;
end;

procedure TFZ_NonSpisok_Control.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PKod_VidOpl then Exit;
  VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,DM.DB.Handle,ZNonSpisokVidOplProp);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PId_VidOpl:=VidOpl[0];
    CheckPochas(VidOpl[0]);
    PKod_VidOpl:=VidOPl[1];
    LabelVidOplData.Caption := VidOpl[2];
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TFZ_NonSpisok_Control.EditDepartmentExit(Sender: TObject);
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

procedure TFZ_NonSpisok_Control.EditSmetaExit(Sender: TObject);
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

procedure TFZ_NonSpisok_Control.FormDestroy(Sender: TObject);
begin
DM.Destroy;
end;

procedure TFZ_NonSpisok_Control.FormShow(Sender: TObject);
begin
      if PParameter.ControlFormStyle=zcfsInsert
      then begin
                 RestoreFromBuffer(self);
                 {if  ZDefaultSmeta>0
                 then begin
                           EditSmeta.Text := IntToStr(zcurrentCtrlDefaultSmeta);
                           EditSmetaExit(self);
                           //EditVidOpl.SetFocus;
                 end;}
      end;
end;

procedure TFZ_NonSpisok_Control.ActionSaveToBufferExecute(Sender: TObject);
var reg: TRegistry;
begin
 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey('\Software\Zarplata\NonSpisokCtrl\',True);
  reg.WriteInteger('IsBuffer',1);
  if (EditSmeta.Text<>'') then reg.WriteInteger('KodSmeta',StrToInt(EditSmeta.Text));
  if (EditVidOpl.Text<>'') then reg.WriteInteger('KodVidOpl',StrToInt(EditVidOpl.Text));
  if (EditDepartment.Text<>'') then reg.WriteInteger('KodDepartment',StrToInt(EditDepartment.Text));
  if (EditCategory.EditValue<>NULL) then reg.WriteInteger('IdCategory',StrToInt(EditCategory.EditValue));
  if (EditTypePost.EditValue<>NULL) then reg.WriteInteger('Id_type_post',StrToInt(EditTypePost.EditValue));
  reg.WriteInteger('KodSetup',PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1));
 finally
  reg.Free;
 end;
end;


procedure TFZ_NonSpisok_Control.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
begin
  reg := TRegistry.Create;
  reg.RootKey:=HKEY_CURRENT_USER;
  if not reg.OpenKey('\Software\Zarplata\NonSpisokCtrl\',False) then
   begin
    reg.free;
    Exit;
   end;

 try
  kod := reg.ReadInteger('IsBuffer');
  if kod<=0 then
   begin
    reg.Free;
    Exit;
   end;
 except
  reg.Free;
  exit;
 end;

 try
  Kod := reg.ReadInteger('KodSmeta');
  if Kod>0 then
   begin
    EditSmeta.Text := IntToStr(Kod);
    EditSmetaExit(sender);
   end;
 except
  Kod:=0;
 end;

 try
  Kod := reg.ReadInteger('KodVidOpl');
  if Kod>0 then
   begin
    EditVidOpl.Text := IntToStr(Kod);
    EditVidOplExit(sender);
   end;
 except
  Kod:=0;
 end;

 try
  Kod := reg.ReadInteger('IdCategory');
  if Kod>0 then
   begin
    EditCategory.EditValue := Kod;
   end;
 except
  Kod:=0;
 end;

 try
  Kod := reg.ReadInteger('Id_type_post');
  if Kod>0 then
   begin
    EditTypePost.EditValue := Kod;
   end;
 except
  Kod:=0;
 end;


 try
  Kod := reg.ReadInteger('KodDepartment');
  if Kod>0 then
   begin
    EditDepartment.Text := IntToStr(Kod);
    EditDepartmentExit(sender);
   end;
 except
  Kod:=0;
 end;

 try
  Kod := reg.ReadInteger('KodSetup');
  if Kod>0 then
   begin
    EditMonth.ItemIndex := YearMonthFromKodSetup(Kod,False)-1;
    EditYear.Value := YearMonthFromKodSetup(Kod);
   end;
 except
  Kod:=0;
 end;

 //editSumma.SetFocus;
 Reg.Free;
end;

procedure TFZ_NonSpisok_Control.FormResize(Sender: TObject);
var i:integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

procedure TFZ_NonSpisok_Control.ByClockClick(Sender: TObject);
begin
  pHoursParam := Show_TFNonSpisokCtrl_ByHours(self,pHoursParam);
  if pHoursParam.ModalResult=mrYes
  then EditSumma.Text := FloatToStr(pHoursParam.Summa);
end;

procedure TFZ_NonSpisok_Control.EditCategoryPropertiesChange(
  Sender: TObject);
begin
     DM.DSetTypePost.Close;
     DM.DSetTypePost.SQLs.SelectSQL.Text := ' SELECT * FROM Z_GET_TYPE_POST_BY_CATEGORY('+
                                            VarToStr(EditCategory.EditValue)+','
                                            +IntToStr(PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1))+') ';
     DM.DSetTypePost.Open;
     DM.DSetTypePost.FetchAll;
     if (DM.DSetTypePost.RecordCount>0)
     then EditTypePost.EditValue:=DM.DSetTypePost.FieldByName('id_type_post').Value;
end;

procedure TFZ_NonSpisok_Control.EditPrikazBPropertiesButtonClick
(
  Sender: TObject; AButtonIndex: Integer
);
var
    T:TfrmPochasOrders;
begin
    T:=TfrmPochasOrders.Create(self, DM.DB.Handle, PId_Man, PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1));
    if T.ShowModal=mrYes
    then begin
              EditPrikazB.Text:='Наказ від '+T.OrdersDataSet.FieldByName('date_order').AsString+' № '+T.OrdersDataSet.FieldByName('num_order').AsString;
              EditPrikazB.Tag :=T.OrdersDataSet.FieldByName('id_pochas_plan').Value;
              EdTarif.Text:=T.OrdersDataSet.FieldByName('tarif').Value;
    end;
    T.Free;
end;

procedure TFZ_NonSpisok_Control.EdTarifPropertiesEditValueChanged(
  Sender: TObject);
begin
      try
          EditSumma.EditValue:=RoundTo(EdHours.Value*EdTarif.Value,-2);
      except on E:Exception do
             begin

             end;
      end;
end;

procedure TFZ_NonSpisok_Control.EdHoursPropertiesEditValueChanged(
  Sender: TObject);
begin
      try
            EditSumma.EditValue:=RoundTo(EdHours.Value*EdTarif.Value,-2);
      except on E:Exception do
             begin

             end;
      end;
end;

procedure TFZ_NonSpisok_Control.EditMonthExit(Sender: TObject);
var UpdateTarifDS:TpFIBDataSet;
begin
     if PParameter.ControlFormStyle=zcfsInsert
     then begin
               if  EditPrikazB.Tag>0
               then begin
                    UpdateTarifDS:=TpFIBDataSet.Create(self);
                    UpdateTarifDS.Database:=DM.DB;
                    UpdateTarifDS.Transaction:=DM.DefaultTransaction;
                    UpdateTarifDS.SelectSQL.Text:='SELECT * FROM Z_POCHAS_GET_TARIF('+IntTostr(EditPrikazB.Tag)+','+iNTTOSTR(PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1))+')';

                    UpdateTarifDS.Open;
                    if (UpdateTarifDS.RecordCount>0)
                    then begin
                                 EdTarif.Value:=UpdateTarifDS.Fieldbyname('tarif').Value;

                    end;
                    UpdateTarifDS.Close;
                    UpdateTarifDS.Free;
               end;
     end;

     if PParameter.ControlFormStyle=zcfsUpdate
     then begin
               if  DM.DSet.FieldByName('POCHAS_ORDER').Value>0
               then begin
                    UpdateTarifDS:=TpFIBDataSet.Create(self);
                    UpdateTarifDS.Database:=DM.DB;
                    UpdateTarifDS.Transaction:=DM.DefaultTransaction;
                    UpdateTarifDS.SelectSQL.Text:='SELECT * FROM Z_POCHAS_GET_TARIF('+IntTostr(DM.DSet.FieldByName('POCHAS_ORDER').Value)+','+iNTTOSTR(PeriodToKodSetup(EditYear.Value,EditMonth.ItemIndex+1))+')';

                    UpdateTarifDS.Open;
                    if (UpdateTarifDS.RecordCount>0)
                    then begin
                                 EdTarif.Value:=UpdateTarifDS.Fieldbyname('tarif').Value;

                    end;
                    UpdateTarifDS.Close;
                    UpdateTarifDS.Free;
               end;
     end;
end;

end.
