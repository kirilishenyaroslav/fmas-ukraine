unit Sp_DedConst_Zarplata_Control;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, unit_ZGlobal_consts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  Sp_DedConst_Zarplata_control_DataModul, ZMessages, ActnList, ZProc,
  Unit_NumericConsts, Dates, cxRadioGroup;

type
  TFZ_DedConst_Control = class(TForm)
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
    Actions: TActionList;
    ActionYes: TAction;
    BoxVidOpl: TcxGroupBox;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplData: TcxLabel;
    LabelVidOpl: TcxLabel;
    BoxSumPercent: TcxGroupBox;
    FilterType: TcxRadioGroup;
    EditSumma: TcxMaskEdit;
    procedure CancelBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FilterTypePropertiesChange(Sender: TObject);
  private
   PId_VidOpl:integer;
   PKod_VidOpl: integer;
   PId_Man:integer;
   DM:TDM;
   PRes:Variant;
   PParameter:TDedConstControlParameter;
   PLanguageIndex:byte;
  public
    constructor Create(AParameter:TDedConstControlParameter);reintroduce;
    property Res:Variant read PRes;
  end;

function ViewDedConstControl(AParameter:TDedConstControlParameter):Variant;stdcall;
 exports ViewDedConstControl;

implementation

uses FIBQuery, Math;

{$R *.dfm}

function ViewDedConstControl(AParameter:TDedConstControlParameter):Variant;stdcall;
var Form:TFZ_DedConst_Control;
    Res:Variant;
begin
 Form:=TFZ_DedConst_Control.Create(AParameter);
 if AParameter.AControlFormStyle<>zcfsDelete then
    Form.ShowModal;
 Res:=Form.Res;
 Form.Free;
 Result:=Res;
end;

constructor TFZ_DedConst_Control.Create(AParameter:TDedConstControlParameter);
var KodSetup:integer;
    DBeg,DEnd:TDate;
begin
 inherited Create(AParameter.AOwner);
 DM:=TDM.Create(Self);
 PLanguageIndex:=LanguageIndex;
 PParameter:=AParameter;
 PRes:=NULL;
//******************************************************************************
 LabelMan.Caption        := LabelMan_Caption[PLanguageIndex];
 DateBegLabel.Caption    := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption    := LabelDateEnd_Caption[PLanguageIndex];
// LabelSumma.Caption      := LabelSumma_Caption[PLanguageIndex];
 LabelVidOpl.Caption     := LabelVidOpl_Caption[PLanguageIndex];
 BoxMan.Caption          := '';
 BoxVidOpl.Caption       := '';
 BoxDatesSum.Caption     := '';
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';

 FilterType.Properties.Items[0].Caption := LabelSumma_Caption[PLanguageIndex];
 FilterType.Properties.Items[1].Caption := LabelPercent_Caption[PLanguageIndex];

//******************************************************************************
 EditSumma.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
//******************************************************************************
 case AParameter.AControlFormStyle of
  zcfsInsert:
   begin
    Caption:=ZDedConstCtrl_Caption_Insert[PLanguageIndex];
    with DM do
     try
      DB.Handle:=AParameter.ADb_Handle;
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
        if (EditDateEnd.Properties.MaxDate>=DEnd) then EditDateEnd.Date:=DEnd
        else EditDateEnd.Date:=EditDateEnd.Properties.MaxDate;
        if (EditDateBeg.Properties.MinDate<=DBeg) then EditDateBeg.Date:=DBeg
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
    Caption:=ZDedConstCtrl_Caption_Update[PLanguageIndex];
    with DM do
     try
      DB.Handle:=AParameter.ADb_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='Z_DEDCONST_SELECT_BY_ID';
      StProc.Prepare;
      StProc.ParamByName('ID_DEDCONST').AsInteger:=AParameter.AId;
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
      LabelVidOplData.Caption :=StProc.ParamByName('NAME_VIDOPL').AsString;
      if (StProc.ParamByName('IS_PERCENT').AsString='T') then
           FilterType.ItemIndex:=1
      else
      if (StProc.ParamByName('IS_PERCENT').AsString='F')  then
           FilterType.ItemIndex:=0;
// end;
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
    if ZShowMessage(ZDedConstCtrl_Caption_Delete[PLanguageIndex],
                    DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
     with DM do
      try
       DB.Handle:=AParameter.ADb_Handle;
       StProc.Transaction.StartTransaction;
       StProc.StoredProcName:='Z_DEDCONST_DELETE';
       StProc.Prepare;
       StProc.ParamByName('ID_DEDCONST').AsInteger:=AParameter.AId;
       StProc.ExecProc;
       StProc.Transaction.Commit;
       PRes:=-1;
      except
       on E:Exception do
        begin
         ZShowMessage(Error_Caption[PlanguageIndex],e.Message,mtError,[mbOK]);
         StProc.Transaction.Rollback;
        end;
      end;
   end;
  zcfsShowDetails:
   begin
    Caption:=ZDedConstCtrl_Caption_Detail[PLanguageIndex];
    self.BoxVidOpl.Enabled       := false;
    self.BoxDatesSum.Enabled     := false;
    self.BoxSumPercent.Enabled     := false;
    YesBtn.Visible:=False;
    CancelBtn.Caption := ExitBtn_Caption[PlanguageIndex];
    EditVidOpl.Properties.Buttons[0].Visible:=False;
    with DM do
     try
      DB.Handle:=AParameter.ADb_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='Z_DEDCONST_SELECT_BY_ID';
      StProc.Prepare;
      StProc.ParamByName('ID_DEDCONST').AsInteger:=AParameter.AId;
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
      LabelVidOplData.Caption :=StProc.ParamByName('NAME_VIDOPL').AsString;
      if (StProc.ParamByName('IS_PERCENT').AsString='T') then
           FilterType.ItemIndex:=1
      else
      if (StProc.ParamByName('IS_PERCENT').AsString='F')  then
           FilterType.ItemIndex:=0;
      StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOK]);
        StProc.Transaction.Rollback;
       end;
     end;
   end;
 end;
end;

procedure TFZ_DedConst_Control.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFZ_DedConst_Control.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DM.Db.Handle,zfsModal,
                   ValueFieldZSetup(DM.Db.Handle,'ID_VO_PROP_DEDCONST'),
                   ValueFieldZSetup(DM.Db.Handle,'Z_ID_SYSTEM'));
if VarArrayDimCount(VidOpl)> 0 then
 if VidOpl[0]<> NULL then
  begin
   EditVidOpl.Text := VarToStr(VidOpl[2]);
   LabelVidOplData.Caption := VarToStr(VidOpl[1]);
   PId_VidOpl      := VidOpl[0];
   PKod_VidOpl     := VidOpl[2];
  end;
end;

procedure TFZ_DedConst_Control.EditManPropertiesButtonClick(
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

procedure TFZ_DedConst_Control.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaulttTransaction.InTransaction then DM.DefaulttTransaction.Commit;
end;

procedure TFZ_DedConst_Control.ActionYesExecute(Sender: TObject);
var Res:Integer;
begin
if PId_VidOpl=0 then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],VidOplInput_ErrorText[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditDateBeg.Date>EditDateEnd.Date then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],ZeInputTerms_ErrorText[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditSumma.Text='' then
 begin
  ZShowMessage(Error_Caption[PLanguageIndex],SummaInput_ErrorText[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;

with DM do
try
 StProcTransaction.StartTransaction;
 case PParameter.AControlFormStyle of
  zcfsInsert: StProc.StoredProcName:='Z_DEDCONST_INSERT';
  zcfsUpdate: StProc.StoredProcName:='Z_DEDCONST_UPDATE';
 end;
 StProc.Prepare;

 StProc.ParamByName('ID_MAN').AsInteger:=PId_Man;
 StProc.ParamByName('ID_VIDOPL').AsInteger:=PId_VidOpl;
 StProc.ParamByName('DATE_BEG').AsDate:=EditDateBeg.Date;
 StProc.ParamByName('DATE_END').AsDate:=EditDateEnd.Date;
 StProc.ParamByName('SUMMA').AsFloat:=StrToFloat(EditSumma.text);


 case FilterType.ItemIndex of
  0: StProc.ParamByName('IS_PERCENT').AsString:='F';
  1: StProc.ParamByName('IS_PERCENT').AsString:='T';
 end;

 case PParameter.AControlFormStyle of
  zcfsInsert: StProc.ParamByName('RMOVING').AsInteger:=PParameter.AId;
  zcfsUpdate: StProc.ParamByName('ID_DEDCONST').AsInteger:=PParameter.AId;
 end;

 StProc.ExecProc;
 if PParameter.AControlFormStyle=zcfsInsert then
  Res:=StProc.ParamByName('ID_DEDCONST').AsInteger
 else Res:=0;
 StProc.Transaction.Commit;
 PRes:=Res;
 ModalResult:=mrYes;
except
 on e:Exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],e.message,mtError,[mbOk]);
   StProc.transaction.RollBack;
   PRes:=NULL;
  end;
end;
end;

procedure TFZ_DedConst_Control.EditVidOplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PKod_VidOpl then Exit;
  VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,Dm.DB.Handle,ZDedConstVidOplProp);
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

procedure TFZ_DedConst_Control.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;




procedure TFZ_DedConst_Control.FilterTypePropertiesChange(Sender: TObject);
begin
   if(FilterType.ItemIndex=1) then
   Begin
        EditSumma.Properties.EditMask := '(100 (['+DecimalSeparator+']00?)?) | (\d\d? (['+DecimalSeparator+']\d\d?)?)';
   end else
        EditSumma.Properties.EditMask := '\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
end;

end.
