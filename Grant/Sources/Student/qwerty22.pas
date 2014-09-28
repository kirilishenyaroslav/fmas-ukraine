unit Grant_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, gr_uCommonConsts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  Grant_Ctrl_DM, gr_uMessage, ActnList, ZProc, uCommonSp,
  Unit_NumericConsts, Dates, gr_uCommonLoader, gr_uCommonProc, cxSpinEdit,
  cxCheckBox,UpKernelUnit;

type
  TFGrantCtrl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMan: TcxGroupBox;
    LabelMan: TcxLabel;
    EditMan: TcxButtonEdit;
    BoxDatesSum: TcxGroupBox;
    LabelSumma: TcxLabel;
    Actions: TActionList;
    ActionYes: TAction;
    BoxVidOpl: TcxGroupBox;
    EditVidopl: TcxButtonEdit;
    LabelVidoplData: TcxLabel;
    LabelVidopl: TcxLabel;
    LabelSmetadata: TcxLabel;
    EditSmeta: TcxButtonEdit;
    LabelSmeta: TcxLabel;
    MaskEditSumma: TcxMaskEdit;
    LabelBal: TcxLabel;
    MaskEditBal: TcxMaskEdit;
    BoxDates: TPanel;
    EditDateBeg: TcxDateEdit;
    DateBegLabel: TcxLabel;
    EditDateEnd: TcxDateEdit;
    DateEndLabel: TcxLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditVidoplExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
   PIdGrant:Integer;
   PIdStud:int64;
   PIdVidopl:integer;
   PKodVidopl:integer;
   PIdSmeta:int64;
   PKodSmeta:integer;
   DM:TDM;
   PRes:Variant;
   Pcfs:TZControlFormStyle;
   PLanguageIndex:byte;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
    function PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
    property Res:Variant read PRes;
  end;

function ViewGrantCtrl(AParameter:TObject):Variant;stdcall;
 exports ViewGrantCtrl;

implementation

uses FIBQuery, Math;

{$R *.dfm}


function TFGrantCtrl.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
var PLanguageIndex:byte;
begin
 Result:=False;
 PLanguageIndex := IndexLanguage;
 if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
   with DM do
    try
     Result:=True;
     DB.Handle:=Db_Handle;
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='GR_DT_GRANTS_D';
     StProc.Prepare;
     StProc.ParamByName('ID_GRANT').AsInteger:=Id;
     StProc.ExecProc;
     StProc.Transaction.Commit;
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

function ViewGrantCtrl(AParameter:TObject):Variant;stdcall;
var Form:TFGrantCtrl;
begin
 Form:=TFGrantCtrl.Create(TgrCtrlSimpleParam(AParameter).Owner);
 if TgrCtrlSimpleParam(AParameter).fs=zcfsDelete then
    result:=Form.DeleteRecord(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).Id)
 else
  begin
   result := Form.PrepareData(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).fs,
                              TgrCtrlSimpleParam(AParameter).Id);
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

constructor TFGrantCtrl.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 DM:=TDM.Create(Self);
 PLanguageIndex:=LanguageIndex;
 PRes:=NULL;
//******************************************************************************
 LabelMan.Caption        := LabelStudent_Caption[PLanguageIndex];
 DateBegLabel.Caption    := LabelDateBeg_Caption[PLanguageIndex];
 DateEndLabel.Caption    := LabelDateEnd_Caption[PLanguageIndex];
 LabelSmeta.Caption      := LabelSmeta_Caption[PLanguageIndex];
 LabelVidopl.Caption     := LabelVidOpl_Caption[PLanguageIndex];
 LabelSumma.Caption      := LabelSumma_Caption[PLanguageIndex];
 LabelBal.Caption        := LabelBal_Caption[PLanguageIndex];
 BoxMan.Caption          := '';
 BoxVidOpl.Caption       := '';
 BoxDatesSum.Caption     := '';
 YesBtn.Caption          := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption       := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint          := CancelBtn.Caption+' (Esc)';
end;

function TFGrantCtrl.PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
var PDay,PMonth,PYear:word;
    DBegStud,DEndStud,DBeg,DEnd:TDate;
    Smeta:variant;
begin
 Result:=True;
 Pcfs := fs;
 case fs of
  zcfsInsert:
   begin
    Caption:=Caption_Insert[PLanguageIndex];
    with DM do
     try
      DB.Handle:=Db_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_DT_GRANTS_S_FOR_I';
      StProc.Prepare;
      StProc.ParamByName('ID_STUD').AsInt64:=Id;
      StProc.ExecProc;
      PIdStud            := Id;
      EditMan.Text       := StProc.ParamByName('FIO').AsString;

      if VarIsNull(StProc.ParamByName('PERIOD_DB').AsVariant) then DBegStud:=Date
                                                              else DBegStud:=StProc.ParamByName('PERIOD_DB').AsDate;
      if VarIsNull(StProc.ParamByName('PERIOD_DE').AsVariant) then DEndStud:=Date
                                                              else DEndStud:=StProc.ParamByName('PERIOD_DE').AsDate;
      if DBegStud=DEndStud then
         begin
              EditDateBeg.Date := DBegStud;
              EditDateEnd.Date := DEndStud;
              BoxDates.Enabled := False;
         end
      else
         begin
              if VarIsNULL(StProc.ParamByName('DATE_BEG').AsVariant) then DBeg:=DBegStud
              else
                  begin
                       DBeg := StProc.ParamByName('DATE_BEG').AsDate;
                       DecodeDate(DBeg,PYear,PMonth,PDay);
                       if(((PYear mod 4)=0)and(PMonth=2))then
                         PDay:=PDay-1;
                       if((((PYear+1) mod 4)=0)and(PMonth=2))then
                         PDay:=PDay+1;
                       DBeg := EncodeDate(PYear+1,PMonth,PDay);
                  end;
              if VarIsNULL(StProc.ParamByName('DATE_END').AsVariant) then DEnd:=DEndStud
              else
                  begin
                       DEnd := StProc.ParamByName('DATE_END').AsDate;
                       DecodeDate(DEnd,PYear,PMonth,PDay);
                       if(((PYear mod 4)=0)and(PMonth=2))then
                         PDay:=PDay-1;
                       if((((PYear+1) mod 4)=0)and(PMonth=2))then
                         PDay:=PDay+1;
                       DEnd := EncodeDate(PYear+1,PMonth,PDay);
                  end;
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

      Smeta := grValueFieldFromZSetup(DB.Handle,'GR_DEFAULT_SMETA');
      if not VarIsNull(Smeta) then
         begin
              EditSmeta.Text := VarToStr(Smeta);
              EditSmetaExit(self);
         end;
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
  zcfsUpdate:
   begin
    Caption:=Caption_Update[PLanguageIndex];
    with DM do
     try
      DB.Handle:=Db_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_DT_GRANTS_S_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('OLD_ID_GRANT').AsInteger:=Id;
      StProc.ExecProc;
      PIdGrant                := Id;
      PIdStud                 := StProc.ParamByName('ID_STUD').AsInt64;
      EditMan.Text            := StProc.ParamByName('FIO').AsString;

      if VarIsNull(StProc.ParamByName('PERIOD_DB').AsVariant) then DBegStud:=Date
                                                              else DBegStud:=StProc.ParamByName('PERIOD_DB').AsDate;
      if VarIsNull(StProc.ParamByName('PERIOD_DE').AsVariant) then DEndStud:=Date
                                                              else DEndStud:=StProc.ParamByName('PERIOD_DE').AsDate;
      if DBegStud=DEndStud then
         begin
              EditDateBeg.Date := DBegStud;
              EditDateEnd.Date := DEndStud;
              BoxDates.Enabled := False;
         end
      else
         begin
              if VarIsNULL(StProc.ParamByName('DATE_BEG').AsVariant) then DBeg:=DBegStud
              else
                  begin
                       DBeg := StProc.ParamByName('DATE_BEG').AsDate;
                       DecodeDate(DBeg,PYear,PMonth,PDay);
//                       DBeg := EncodeDate(PYear+1,PMonth,PDay);
                  end;

              if VarIsNULL(StProc.ParamByName('DATE_END').AsVariant) then DEnd:=DEndStud
              else
                  begin
                       DEnd := StProc.ParamByName('DATE_END').AsDate;
                       DecodeDate(DEnd,PYear,PMonth,PDay);
//                       DEnd := EncodeDate(PYear+1,PMonth,PDay);
                  end;
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

      PIdVidopl               := StProc.ParamByName('ID_VIDOPL').AsInteger;
      PIdSmeta                := StProc.ParamByName('ID_SMETA').AsInt64;
      EditVidopl.Text         := VarToStrDef(StProc.ParamByName('KOD_VIDOPL').AsVariant,'');
      LabelVidoplData.Caption := VarToStrDef(StProc.ParamByName('NAME_VIDOPL').AsVariant,'');
      EditSmeta.Text          := VarToStrDef(StProc.ParamByName('KOD_SMETA').AsVariant,'');
      LabelSmetadata.Caption  := VarToStrDef(StProc.ParamByName('NAME_SMETA').AsVariant,'');
      MaskEditSumma.Text      := FloatToStrF(StProc.ParamByName('SUMMA').AsFloat,ffFixed,16,2);
      MaskEditBal.Text        := FloatToStrF(StProc.ParamByName('BAL').AsFloat,ffFixed,5,2);
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
  zcfsShowDetails:
   begin
    Caption:=Caption_Detail[PLanguageIndex];
    self.BoxVidOpl.Enabled       := false;
    self.BoxDatesSum.Enabled     := false;
    YesBtn.Visible:=False;
    CancelBtn.Caption := ExitBtn_Caption[PlanguageIndex];
    with DM do
     try
      DB.Handle:=Db_Handle;
      StProc.Transaction.StartTransaction;
      StProc.StoredProcName:='GR_DT_GRANTS_S_BY_KEY';
      StProc.Prepare;
      StProc.ParamByName('OLD_ID_GRANT').AsInteger:=Id;
      StProc.ExecProc;
      PIdGrant                := Id;
      PIdStud                 := StProc.ParamByName('ID_STUD').AsInt64;
      EditMan.Text            := StProc.ParamByName('FIO').AsString;
      EditDateEnd.Date        := StProc.ParamByName('DATE_END').AsDate;
      EditDateBeg.Date        := StProc.ParamByName('DATE_BEG').AsDate;
      PIdVidopl               := StProc.ParamByName('ID_VIDOPL').AsInteger;
      PIdSmeta                := StProc.ParamByName('ID_SMETA').AsInt64;
      EditVidopl.Text         := VarToStrDef(StProc.ParamByName('KOD_VIDOPL').AsVariant,'');
      LabelVidoplData.Caption := VarToStrDef(StProc.ParamByName('NAME_VIDOPL').AsVariant,'');
      EditSmeta.Text          := VarToStrDef(StProc.ParamByName('KOD_SMETA').AsVariant,'');
      LabelSmetadata.Caption  := VarToStrDef(StProc.ParamByName('NAME_SMETA').AsVariant,'');
      MaskEditSumma.Text      := FloatToStrF(StProc.ParamByName('SUMMA').AsFloat,ffFixed,16,2);
      MaskEditBal.Text        := FloatToStrF(StProc.ParamByName('BAL').AsFloat,ffFixed,5,2);
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
end;

procedure TFGrantCtrl.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFGrantCtrl.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DM.DB.Handle,zfsModal,
                   0,ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'));
 if VarArrayDimCount(VidOpl)>0 then
  begin
   PIdVidopl:=VidOpl[0];
   PKodVidopl:=VidOPl[2];
   LabelVidOplData.Caption := VidOpl[1];
   EditVidOpl.Text := IntToStr(PKodVidOpl);
  end
 else
  EditVidOpl.SetFocus;
end;

procedure TFGrantCtrl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if DM.DefaulttTransaction.InTransaction then DM.DefaulttTransaction.Commit;
end;

procedure TFGrantCtrl.ActionYesExecute(Sender: TObject);
begin
if PIdVidopl=0 then
 begin
  grShowMessage(ECaption[PLanguageIndex],EVidOplInput_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditDateBeg.Date>EditDateEnd.Date then
 begin
  grShowMessage(ECaption[PLanguageIndex],EInputTerms_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;

with DM do
try
 StProcTransaction.StartTransaction;

 case Pcfs of
  zcfsInsert: StProc.StoredProcName:='GR_DT_GRANTS_I';
  zcfsUpdate: StProc.StoredProcName:='GR_DT_GRANTS_U';
 end;
 StProc.Prepare;

 StProc.ParamByName('ID_STUD').AsInt64   := PIdStud;
 StProc.ParamByName('DATE_BEG').AsDate   := StrToDate(EditDateBeg.Text);
 StProc.ParamByName('DATE_END').AsDate   := StrToDate(EditDateEnd.Text);
 StProc.ParamByName('ID_SMETA').AsInt64  := PIdSmeta;
 StProc.ParamByName('ID_VIDOPL').AsInt64 := PIdVidopl;
 StProc.ParamByName('SUMMA').AsCurrency  := StrToFloat(MaskEditSumma.Text);
 StProc.ParamByName('BAL').AsCurrency    := StrToFloat(MaskEditBal.Text);
 case Pcfs of
  zcfsUpdate:
    StProc.ParamByName('ID_GRANT').AsInteger := PIdGrant;
 end;

 StProc.ExecProc;
 if pcfs=zcfsInsert then
  PRes:=StProc.ParamByName('ID_GRANT').AsInteger
 else PRes:=PIdGrant;
 StProc.Transaction.Commit;
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

procedure TFGrantCtrl.EditVidoplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PKodVidopl then Exit;
  VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,DM.DB.Handle,ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'),0);
  if VarArrayDimCount(VidOpl)>0 then
   begin
    PIdVidOpl:=VidOpl[0];
    PKodVidopl:=VidOPl[1];
    LabelVidOplData.Caption := Vidopl[2];
   end
  else
   EditVidOpl.SetFocus;
 end;
end;

procedure TFGrantCtrl.FormDestroy(Sender: TObject);
begin
if DM<>nil then DM.Destroy;
end;

procedure TFGrantCtrl.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
if EditSmeta.Text<>'' then
 begin
  if StrToInt(EditSmeta.Text)=PKodSmeta then Exit;
  Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DM.DB.Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PIdsmeta:=Smeta[0];
    PKodSmeta:=Smeta[1];
    LabelSmetaData.Caption := Smeta[2];
   end
  else
   EditSmeta.SetFocus;
 end;
end;

procedure TFGrantCtrl.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,DM.DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   PIdsmeta := Smeta[0];
   PKodSmeta := Smeta[3];
   EditSmeta.Text := IntToStr(PKodSmeta);
   LabelSmetaData.Caption := Smeta[2];
  end;
end;

end.
