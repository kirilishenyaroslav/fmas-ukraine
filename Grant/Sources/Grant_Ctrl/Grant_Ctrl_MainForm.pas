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
  cxCheckBox,UpKernelUnit, cxGraphics, dxStatusBar, Registry;

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
    PrikazMaskEdit: TcxMaskEdit;
    PrikazLabel: TcxLabel;
    dxStatusBar1: TdxStatusBar;
    Action1: TAction;
    Action2: TAction;
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
    procedure Action1Execute(Sender: TObject);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
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
     ////////// удаление из спска массовых выплат
     DSetDelMass.Close;
     DSetDelMass.SQLs.SelectSQL.Text:='execute procedure  GR_MASS_PAYMENT_MAN_DD('''+IntToStr(Id)+''')';
     try
     DSetDelMass.Open;
     except
     showmessage('Можливо виникло переповнення протоколу змін');
     end;
      //////////
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
//******************************************************************************
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
//******************************************************************************
 MaskEditSumma.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+ZSystemDecimalSeparator+']\d\d?)?';
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

      PIdVidopl               := StProc.ParamByName('ID_VIDOPL').AsInteger;
      EditVidopl.Text         := VarToStrDef(StProc.ParamByName('KOD_VIDOPL').AsVariant,'');
      LabelVidoplData.Caption := VarToStrDef(StProc.ParamByName('NAME_VIDOPL').AsVariant,'');

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
//                       if(((PYear mod 4)=0)and(PMonth=2))then
//                         PDay:=PDay-1;
                       if((((PYear+1) mod 4)=0)and(PMonth=2))then
                         PDay:=PDay+1;
                       DBeg := EncodeDate(PYear,PMonth,PDay);
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
              //EditDateBeg.Date := DBeg;
              EditDateBeg.Date   := strToDate('01.09.'+FormatDateTime('yyyy',Date));
              EditDateEnd.Date   := IncMonth(strToDate('30.06.'+FormatDateTime('yyyy',Date)),12);
              try
              EditDateBeg.Properties.MaxDate := DEndStud;
              EditDateBeg.Properties.MinDate := DBegStud;

              //EditDateEnd.Date := DEnd;
              EditDateEnd.Properties.MaxDate := DEndStud;
              EditDateEnd.Properties.MinDate := DBegStud;
              except
              showmessage('Даты не допустимы')
              end;
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
              EditDateBeg.Date   := DBegStud;
              EditDateEnd.Date   := DEndStud;
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
              try
              EditDateBeg.Properties.MaxDate := DEndStud;
              EditDateBeg.Properties.MinDate := DBegStud;

              EditDateEnd.Date := DEnd;
              EditDateEnd.Properties.MaxDate := DEndStud;
              EditDateEnd.Properties.MinDate := DBegStud;
              except
              showmessage('Даты не допустимы')
              end;
         end;

      PIdVidopl               := StProc.ParamByName('ID_VIDOPL').AsInteger;
      PIdSmeta                := StProc.ParamByName('ID_SMETA').AsInt64;
      EditVidopl.Text         := VarToStrDef(StProc.ParamByName('KOD_VIDOPL').AsVariant,'');
      LabelVidoplData.Caption := VarToStrDef(StProc.ParamByName('NAME_VIDOPL').AsVariant,'');
      EditSmeta.Text          := VarToStrDef(StProc.ParamByName('KOD_SMETA').AsVariant,'');
      LabelSmetadata.Caption  := VarToStrDef(StProc.ParamByName('NAME_SMETA').AsVariant,'');
      MaskEditSumma.Text      := FloatToStrF(StProc.ParamByName('SUMMA').AsFloat,ffFixed,16,2);
      MaskEditBal.Text        := FloatToStrF(StProc.ParamByName('BAL').AsFloat,ffFixed,5,2);
      PrikazMaskEdit.Text     := VarToStrDef(StProc.ParamByName('PRIKAZ').AsVariant,'');
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
      PrikazMaskEdit.Text     := VarToStrDef(StProc.ParamByName('PRIKAZ').AsVariant,'');
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
 StProc.ParamByName('PRIKAZ').AsString   := PrikazMaskEdit.Text; 
 case Pcfs of
  zcfsUpdate:
    StProc.ParamByName('ID_GRANT').AsInteger := PIdGrant;
 end;

 StProc.ExecProc;
 if pcfs=zcfsInsert then
  PRes:=StProc.ParamByName('ID_GRANT').AsInteger
 else PRes:=PIdGrant;
 ////////// удаление из спска массовых выплат
 DSetDelMass.Close;
 DSetDelMass.SQLs.SelectSQL.Text:='execute procedure  GR_MASS_PAYMENT_MAN_DD('''+IntToStr(PIdGrant)+''')';
 try
 DSetDelMass.Open;
 except
 showmessage('Можливо виникло переповнення протоколу змін');
 end;
 //////////
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

procedure TFGrantCtrl.Action1Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
 CancelBtn.SetFocus; 
 Key := '\Software\Grant\GrantCtrl';
 reg:=TRegistry.Create;
 
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteDate('DateBegGrant',EditDateBeg.EditValue);
  reg.WriteDate('DateEndGrant',EditDateEnd.EditValue);
  if(MaskEditSumma.Text<>'') then
  reg.WriteCurrency('Summa',StrToFloat(MaskEditSumma.Text));
  if(MaskEditBal.Text<>'') then
  reg.WriteCurrency('Bal',StrToFloat(MaskEditBal.Text));  
  reg.WriteString('Prikaz',PrikazMaskEdit.Text);
  reg.WriteString('KodVidOpl',EditVidopl.Text);
  reg.WriteString('KodSmeta',EditSmeta.Text);
  
 finally
  reg.Free;
 end;
end;

procedure TFGrantCtrl.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin
  Key := '\Software\Grant\GrantCtrl';

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
 //try
 EditSmeta.Text := reg.ReadString('KodSmeta');
 EditSmetaExit(sender);
 EditVidOpl.Text := reg.ReadString('KodVidOpl');
 EditVidOplExit(sender);
 EditDateBeg.EditValue:=reg.ReadDate('DateBegGrant');
 EditDateEnd.EditValue:=reg.ReadDate('DateEndGrant');
 if(reg.ReadCurrency('Summa')<>Null) then
 MaskEditSumma.Text:=FloatToStr(reg.ReadCurrency('Summa'))
 else MaskEditSumma.Text:='';
 if(reg.ReadCurrency('Bal')<>Null) then
 MaskEditBal.Text:=FloatToStr(reg.ReadCurrency('Bal'))
 else MaskEditBal.Text:='';
 PrikazMaskEdit.Text := reg.ReadString('Prikaz');
 //finally
 EditDateBeg.SetFocus;
 Reg.Free;
 //end;
end;

procedure TFGrantCtrl.FormShow(Sender: TObject);
begin
  if Pcfs=zcfsInsert then RestoreFromBuffer(self);
  FormResize(sender);
end;

procedure TFGrantCtrl.FormResize(Sender: TObject);
var i:integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

procedure TFGrantCtrl.Action2Execute(Sender: TObject);
begin
if YesBtn.Focused=true then ActionYes.Execute;
if EditSmeta.Focused=true then YesBtn.SetFocus;
if EditVidopl.Focused=true then EditSmeta.SetFocus;
if PrikazMaskEdit.Focused=true then EditVidopl.SetFocus;
if MaskEditBal.Focused=true then PrikazMaskEdit.SetFocus;
if MaskEditSumma.Focused=true then MaskEditBal.SetFocus;
if EditDateEnd.Focused=true then MaskEditSumma.SetFocus;
if EditDateBeg.Focused=true then EditDateEnd.SetFocus;
if CancelBtn.Focused=true then  Close();  
end;

end.
