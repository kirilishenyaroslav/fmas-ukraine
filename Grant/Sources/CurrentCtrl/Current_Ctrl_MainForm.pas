//******************************************************************************
//                               Пакет для редактирования записи
//                   из таблицы Z_Current - зарплатные текущие выплаты
// Параметры: AOwner - компонент от которого создается форма для редактирования
//            DB_Handle - база для подключения
//            AZControlFormStyle - тип формы: редактрирование, удаление, добавление, просмотр
//            AID - если добавление, то RMoving, иначе ID_Current
//******************************************************************************

unit Current_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, Registry,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  cxDBEdit, cxSpinEdit, cxMemo, Dates, cxCalc, FIBQuery, pFIBQuery,
  pFIBStoredProc, gr_uMessage, ActnList, gr_uCommonConsts,
  Current_Ctrl_DM, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid, Unit_NumericConsts,
  dxStatusBar, Menus, gr_uCommonProc, cxGridBandedTableView,
  cxGridDBBandedTableView, ZProc, gr_dmCommonStyles, cxCheckBox;

type
  TFgrCurrentCtrl = class(TForm)
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    BoxMain: TcxGroupBox;
    PrikazBox: TcxGroupBox;
    EditPrikaz: TcxMaskEdit;
    LabelPrikaz: TcxLabel;
    LabelPeriod: TcxLabel;
    MonthesList: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    LabelSumma: TcxLabel;
    EditSumma: TcxMaskEdit;
    Bevel2: TBevel;
    IdMovingBox: TcxGroupBox;
    LabelManMoving: TcxLabel;
    LabelMan: TcxLabel;
    EditMan: TcxDBButtonEdit;
    ActionList1: TActionList;
    Action1: TAction;
    Grid1Level1: TcxGridLevel;
    Grid1: TcxGrid;
    cxStyleRepository1: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    BoxChild: TcxGroupBox;
    EditSmeta: TcxButtonEdit;
    LabelSmeta: TcxLabel;
    LabelSmetaName: TcxLabel;
    LabelVidOpl: TcxLabel;
    EditVidOpl: TcxButtonEdit;
    LabelVidOplName: TcxLabel;
    Action2: TAction;
    dxStatusBar1: TdxStatusBar;
    Grid1DBBandedTableView1: TcxGridDBBandedTableView;
    GridClKodDepartment: TcxGridDBBandedColumn;
    GridClNameDepartment: TcxGridDBBandedColumn;
    GridClNamePost: TcxGridDBBandedColumn;
    GridClDateBeg: TcxGridDBBandedColumn;
    GridClDateEnd: TcxGridDBBandedColumn;
    GridClKurs: TcxGridDBBandedColumn;
    CheckBoxMonthFinish: TcxCheckBox;
    Action3: TAction;
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action1Execute(Sender: TObject);
    procedure EditVidOplExit(Sender: TObject);
    procedure EditSmetaExit(Sender: TObject);
    procedure MonthesListExit(Sender: TObject);
    procedure EditSmetaPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RestoreFromBuffer(Sender:TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
  private
    Pcfs:TZControlFormStyle;
    PId_VidOpl:LongWord;
    PId_Smeta:LongWord;
    PId_Man:LongWord;
    PIdStud:int64;
    PIdCurrent:int64;
    PResult:Variant;
    PParameter:TZCurrentParameters;
    PLanguageIndex:Byte;
    PKodSetup:integer;
    DM:TDM;
    StylesDM:TStylesDM;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
    function PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
    property result:Variant read PResult;
  end;


implementation

uses Math;

{$R *.dfm}

Var F:boolean;

function TFgrCurrentCtrl.DeleteRecord(Db_Handle:TISC_DB_HANDLE;Id:integer):boolean;
var PLanguageIndex:byte;
begin
 Result:=False;
 PLanguageIndex := IndexLanguage;
 if grShowMessage(Caption_Delete[PLanguageIndex],
                  DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbCancel])=mrYes then
  begin
   DM := TDM.Create(self);
   with DM do
    try
     Result:=True;
     DB.Handle:=Db_Handle;
     StProc.Transaction.StartTransaction;
     StProc.StoredProcName:='GR_CURRENT_D';
     StProc.Prepare;
     StProc.ParamByName('ID_CURRENT').AsInteger:=Id;
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
    except
     on E:Exception do
      begin
       grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
       StProc.Transaction.Rollback;
       Result:=False;
      end;
     end;
   DM.Destroy;
  end;
end;

constructor TFgrCurrentCtrl.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 PLanguageIndex:= IndexLanguage;
//******************************************************************************
 EditSumma.Properties.EditMask := '[-]?\d\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d?\d? (['+grSystemDecimalSeparator+']\d\d?)?';
//******************************************************************************
 LabelMan.Caption        := LabelStudent_Caption[PLanguageIndex];
 LabelSumma.Caption      := LabelSumma_Caption[PLanguageIndex];
 LabelVidOpl.Caption     := LabelVidOpl_Caption[PLanguageIndex];
 LabelSmeta.Caption      := LabelSmeta_Caption[PLanguageIndex];
 LabelManMoving.Caption  := LabelStudentMoving_Caption[PLanguageIndex];
 LabelPeriod.Caption     := LabelPeriod_Caption[PLanguageIndex];
 LabelPrikaz.Caption     := LabelPrikaz_Caption[PLanguageIndex];
 CheckBoxMonthFinish.Properties.Caption := LabelMonthFinish_Caption[PLanguageIndex];

 MonthesList.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
 YesBtn.Caption            := YesBtn_Caption[PLanguageIndex];
 YesBtn.Hint               := YesBtn.Caption;
 CancelBtn.Caption         := CancelBtn_Caption[PLanguageIndex];
 CancelBtn.Hint            := CancelBtn.Caption+' (Esc)';
//******************************************************************************
 dxStatusBar1.Panels[0].Text := 'F9 - '+ToBuffer_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text := 'F10 - '+YesBtn.Caption;
 dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
//******************************************************************************
 GridClKodDepartment.Caption  := LabelKod_Caption[PLanguageIndex];
 GridClNameDepartment.Caption := LabelNameDepartment_Caption[PLanguageIndex];
 GridClNamePost.Caption       := LabelPost_Caption[PLanguageIndex];
 GridClDateBeg.Caption        := LabelDateBeg_Caption[PLanguageIndex];
 GridClDateEnd.Caption        := LabelDateEnd_Caption[PLanguageIndex];
 GridClKurs.Caption           := LabelKurs_Caption[PLanguageIndex];
//******************************************************************************
 SetOptionsGridView(Grid1DBBandedTableView1);
 StylesDM := TStylesDM.Create(self);
 Grid1DBBandedTableView1.Styles.StyleSheet := StylesDM.GridBandedTableViewStyleSheetDevExpress;
//******************************************************************************
 PResult := NULL;
end;

function TFgrCurrentCtrl.PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
var CurrKodSetup:integer;
    FieldValue:Variant;
begin
 Result:=False;
 DM := TDM.Create(self);
 Pcfs:=fs;
   DM.DB.Handle := Db_Handle;
   Grid1DBBandedTableView1.DataController.DataSource := DM.DSourceMoving;
   case fs of
    zcfsInsert:
     try
      Caption := Caption_Insert[PLanguageIndex];
      DM.DSetMoving.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_INF_S_BY_STUD_KS('+
                                                  IntToStr(Id)+',NULL)';
      DM.DSetMoving.Open;
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName := 'GR_MAN_BY_ID_STUD';
      DM.StProc.Prepare;
      PIdStud := Id;
      DM.StProc.ParamByName('ID_STUD').AsInt64 := Id;
      DM.StProc.ExecProc;
      EditMan.Text := DM.StProc.ParamByName('FIO').AsString;
      PId_Man := DM.StProc.ParamByName('ID_MAN').AsInteger;
      DM.StProc.Transaction.Commit;
      CurrKodSetup := ValueFieldZSetup(Db_Handle,'GR_KOD_SETUP');
      MonthesList.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
      YearSpinEdit.Value    := YearMonthFromKodSetup(CurrKodSetup);
      PKodSetup := CurrKodSetup;
      FieldValue := ValueFieldZSetup(Db_Handle,'GR_DEFAULT_SMETA');

      if not VarIsNULL(FieldValue) then
       begin
        EditSmeta.Text := VarToStr(FieldValue);
        EditSmetaExit(self);
       end;
      Result:=True;
     except
      on E:Exception do
       begin
        DM.StProc.Transaction.Rollback;
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOk]);
        Result := False;
       end;
     end;
    zcfsUpdate:
     try
      Caption := Caption_Update[PLanguageIndex];
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName := 'GR_CURRENT_S_BY_KEY';
      DM.StProc.Prepare;

      PIdCurrent := Id;
      DM.StProc.ParamByName('OLD_ID_CURRENT').AsInt64 := Id;
      DM.StProc.ExecProc;

      CheckBoxMonthFinish.EditValue := DM.StProc.ParamByName('NOW_PAY').AsString;
      PId_Man := DM.StProc.ParamByName('ID_MAN').AsInteger;
      EditMan.Text := DM.StProc.ParamByName('FIO').AsString;

      PId_VidOpl := DM.StProc.ParamByName('ID_VIDOPL').AsInteger;
      EditVidOpl.Text := VarToStrDef(DM.StProc.ParamByName('KOD_VIDOPL').AsVariant,'');
      LabelVidOplName.Caption := VarToStrDef(DM.StProc.ParamByName('NAME_VIDOPL').AsVariant,'');

      PId_Smeta := DM.StProc.ParamByName('ID_SMETA').AsInt64;
      EditSmeta.Text := VarToStrDef(DM.StProc.ParamByName('KOD_SMETA').AsVariant,'');
      LabelSmetaName.Caption := VarToStrDef(DM.StProc.ParamByName('NAME_SMETA').AsVariant,'');

      EditPrikaz.Text := VarToStrDef(DM.StProc.ParamByName('PRIKAZ').AsVariant,'');
      EditSumma.Text := FloatToStrF(DM.StProc.ParamByName('SUMMA').AsCurrency,ffFixed,16,2);
      PKodSetup := DM.StProc.ParamByName('KOD_SETUP').AsInteger;
      MonthesList.ItemIndex := YearMonthFromKodSetup(PKodSetup,False)-1;
      YearSpinEdit.Value    := YearMonthFromKodSetup(PKodSetup);

      PIdStud   := DM.StProc.ParamByName('ID_STUD').AsInt64;

      DM.DSetMoving.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_INF_S_BY_STUD_KS('+
                                                  IntToStr(PIdStud)+','+IntToStr(PKodSetup)+')';
      DM.DSetMoving.Open;
      if not DM.DSetMoving.Locate('ID_STUD_INF',DM.StProc.ParamByName('ID_STUD_INF').AsInt64,[loCaseInsensitive]) then
        grShowMessage(ECaption[PLanguageIndex],EStudentMovingNotSelect_Text[PLanguageIndex],mtInformation,[mbOK]);
      DM.StProc.Transaction.Commit;

      Result:=True;
     except
      on E:Exception do
       begin
        DM.StProc.Transaction.Rollback;
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOk]);
        Result := False;
       end;
     end;
    zcfsShowDetails:
     try
      Caption := Caption_Detail[PLanguageIndex];
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName := 'GR_CURRENT_S_BY_KEY';
      DM.StProc.Prepare;

      PIdCurrent := Id;
      DM.StProc.ParamByName('OLD_ID_CURRENT').AsInt64 := Id;
      DM.StProc.ExecProc;

      CheckBoxMonthFinish.EditValue := DM.StProc.ParamByName('NOW_PAY').AsString;
      PId_Man := DM.StProc.ParamByName('ID_MAN').AsInteger;
      EditMan.Text := DM.StProc.ParamByName('FIO').AsString;

      PId_VidOpl := DM.StProc.ParamByName('ID_VIDOPL').AsInteger;
      EditVidOpl.Text := VarToStrDef(DM.StProc.ParamByName('KOD_VIDOPL').AsVariant,'');
      LabelVidOplName.Caption := VarToStrDef(DM.StProc.ParamByName('NAME_VIDOPL').AsVariant,'');

      PId_Smeta := DM.StProc.ParamByName('ID_SMETA').AsInt64;
      EditSmeta.Text := VarToStrDef(DM.StProc.ParamByName('KOD_SMETA').AsVariant,'');
      LabelSmetaName.Caption := VarToStrDef(DM.StProc.ParamByName('NAME_SMETA').AsVariant,'');

      EditPrikaz.Text := VarToStrDef(DM.StProc.ParamByName('PRIKAZ').AsVariant,'');
      EditSumma.Text := FloatToStrF(DM.StProc.ParamByName('SUMMA').AsCurrency,ffFixed,16,2);
      PKodSetup := DM.StProc.ParamByName('KOD_SETUP').AsInteger;
      MonthesList.ItemIndex := YearMonthFromKodSetup(PKodSetup,False)-1;
      YearSpinEdit.Value    := YearMonthFromKodSetup(PKodSetup);

      PIdStud   := DM.StProc.ParamByName('ID_STUD').AsInt64;

      DM.DSetMoving.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_DT_STUD_INF_S_BY_STUD_KS('+
                                                  IntToStr(PIdStud)+','+IntToStr(PKodSetup)+')';
      DM.DSetMoving.Open;
      if not DM.DSetMoving.Locate('ID_STUD_INF',DM.StProc.ParamByName('ID_STUD_INF').AsInt64,[loCaseInsensitive]) then
        grShowMessage(ECaption[PLanguageIndex],EStudentMovingNotSelect_Text[PLanguageIndex],mtInformation,[mbOK]);
      DM.StProc.Transaction.Commit;

      BoxMain.Enabled := False;
      BoxChild.Enabled := False;
      PrikazBox.Enabled := False;
      IdMovingBox.Enabled := False;
      YesBtn.Visible := False;
      CancelBtn.Caption := ExitBtn_Caption[PLanguageIndex];
      dxStatusBar1.Panels[1].Visible :=  false;
      dxStatusBar1.Panels[2].Text := 'Esc - '+CancelBtn.Caption;
      Result:=True;
     except
      on E:Exception do
       begin
        DM.StProc.Transaction.Rollback;
        grShowMessage(ECaption[PLanguageIndex],e.Message,mtError,[mbOk]);
        Result := False;
       end;
     end;
   end;
end;

procedure TFgrCurrentCtrl.CancelBtnClick(Sender: TObject);
begin
ModalResult  := mrCancel;
end;

procedure TFgrCurrentCtrl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
DM.Free;
end;

procedure TFgrCurrentCtrl.Action1Execute(Sender: TObject);
begin
if DM.DSetMoving.IsEmpty then
 begin
  grShowMessage(ECaption[PLanguageIndex],EStudentMovingNotSelect_Text[PLanguageIndex],mtInformation,[mbOK]);
  CancelBtn.SetFocus;
  Exit;
 end;
if EditSumma.Text='' then
 begin
  grShowMessage(ECaption[PLanguageIndex],ESummaInput_Text[PLanguageIndex],mtInformation,[mbOK]);
  EditSumma.SetFocus;
  Exit;
 end;
if PId_VidOpl=0 then
 begin
  grShowMessage(ECaption[PLanguageIndex],EVidOplInput_Text[PLanguageIndex],mtInformation,[mbOK]);
  EditVidOpl.SetFocus;
  Exit;
 end;
if PId_Smeta=0 then
 begin
  grShowMessage(ECaption[PLanguageIndex],ESmetaInput_Text[PLanguageIndex],mtInformation,[mbOK]);
  EditSmeta.SetFocus;
  Exit;
 end;

 with DM do
 try
  StProc.Transaction.StartTransaction;
  case Pcfs of
   zcfsInsert: StProc.StoredProcName:='GR_CURRENT_I';
   zcfsUpdate: StProc.StoredProcName:='GR_CURRENT_U';
  end;
  StProc.Prepare;

  StProc.ParamByName('KOD_SETUP').AsInteger     := PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
  StProc.ParamByName('KOD_SETUP_O1').AsVariant  := NULL;
  StProc.ParamByName('KOD_SETUP_O2').AsVariant  := NULL;
  StProc.ParamByName('ID_MAN').AsVariant        := NULL;
  StProc.ParamByName('SUMMA').AsCurrency        := StrToFloat(EditSumma.Text);
  StProc.ParamByName('ID_CATEGORY').AsVariant   := DSetMoving['ID_KAT_STUD'];
  StProc.ParamByName('ID_POST').AsVariant       := NULL;
  StProc.ParamByName('ID_DEPARTMENT').AsVariant := NULL;
  StProc.ParamByName('ID_SMETA').AsInt64        := PId_Smeta;
  StProc.ParamByName('ID_ACCOUNT').AsVariant    := NULL;
  StProc.ParamByName('ID_STUD_INF').AsInt64     := DSetMoving['ID_STUD_INF'];
  StProc.ParamByName('ID_STUD').AsVariant       := NULL;
  StProc.ParamByName('TAX_TEXT').AsVariant      := NULL;
  StProc.ParamByName('P_OLD').AsString          := 'F';
  StProc.ParamByName('ID_VIDOPL').AsInteger     := PId_VidOpl;
  StProc.ParamByName('PRIKAZ').AsString         := EditPrikaz.Text;
  StProc.ParamByName('NOW_PAY').AsString        := CheckBoxMonthFinish.EditValue;

  grShowStProcParametersData(StProc);
  case Pcfs of
   zcfsUpdate:
     StProc.ParamByName('ID_CURRENT').AsInt64   := PIdCurrent;
  end;

  StProc.ExecProc;
  if pcfs=zcfsInsert then
   PResult := StProc.ParamByName('ID_CURRENT').AsInt64
  else PResult:=PIdCurrent;

  ////////// удаление из спска массовых выплат
  DSetDelMass.Close;
  DSetDelMass.SQLs.SelectSQL.Text:='execute procedure  GR_MASS_PAYMENT_MAN_DD('''+IntToStr(PIdCurrent)+''')';
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
    StProc.Transaction.RollBack;
    PResult:=NULL;
   end;
 end;
end;

procedure TFgrCurrentCtrl.EditVidOplExit(Sender: TObject);
var Vo:variant;
begin
 if EditVidOpl.Text<>'' then
  begin
   VO:=VoByKod(StrToInt(EditVidOpl.Text),
               Date,
               DM.DB.Handle,
               ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'),
               0);
   if not VarIsNull(VO) then
    begin
     PId_VidOpl:=VO[0];
     LabelVidOplName.Caption:=VarToStr(VO[2]);
    end
   else
    EditVidOpl.SetFocus;
  end;
end;

procedure TFgrCurrentCtrl.EditSmetaExit(Sender: TObject);
var Smeta:variant;
begin
 if EditSmeta.Text<>'' then
  begin
   Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DM.DB.Handle);
   if not VarIsNull(Smeta) then
    begin
     PId_Smeta:=Smeta[0];
     LabelSmetaName.Caption:=VarToStr(Smeta[2]);
    end
   else
    EditSmeta.SetFocus;
  end
end;

procedure TFgrCurrentCtrl.MonthesListExit(Sender: TObject);
begin
if PKodSetup=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1) then Exit
else PKodSetup:=PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1);
if DM.DSetMoving.Active then DM.DSetMoving.Close;
   DM.DSetMoving.SQLs.SelectSQL.Text:='SELECT * FROM GR_CN_DT_STUD_INF_S_BY_STUD_KS('+
                                        IntToStr(PIdStud)+','+IntToStr(PKodSetup)+') order by DATE_END';
   DM.DSetMoving.Open;
   DM.DSetMoving.Last;
end;

procedure TFgrCurrentCtrl.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
Smeta:=GetSmets(self,DM.DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   EditSmeta.Text         := Smeta[3];
   LabelSmetaName.Caption := Smeta[2];
   PId_Smeta              := Smeta[0];
  end;
end;

procedure TFgrCurrentCtrl.EditVidOplPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var VidOpl:Variant;
begin
VidOPl:=LoadVidOpl(self,
                   DM.DB.Handle,
                   zfsModal,
                   0,
                   ValueFieldZSetup(DM.DB.Handle,'GR_ID_SYSTEM'));
if VarArrayDimCount(VidOpl)> 0 then
 if VidOpl[0]<> NULL then
  begin
   EditVidOpl.Text     := VidOpl[2];
   LabelVidOplName.Caption := VidOpl[1];
   PId_VidOpl          := VidOpl[0];
  end;
end;

procedure TFgrCurrentCtrl.RestoreFromBuffer(Sender:TObject);
var reg:TRegistry;
    Kod:integer;
    Key:string;
begin
 if (Owner as TForm).Caption = CurrentOperationsData_Text[PLanguageIndex] then
     Key := '\Software\Grant\CurrentCtrl\Current';
 if (Owner as TForm).Caption = DataStud_Caption[PLanguageIndex] then
     Key := '\Software\Grant\CurrentCtrl\Stud';

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

 EditSmeta.Text := reg.ReadString('KodSmeta');
 EditSmetaExit(sender);

 EditVidOpl.Text := reg.ReadString('KodVidOpl');
 EditVidOplExit(sender);

 EditPrikaz.Text := reg.ReadString('Prikaz');
 CheckBoxMonthFinish.EditValue := reg.ReadString('EndMonth');

  Kod := reg.ReadInteger('KodSetup');
  if Kod>0 then
   begin
    MonthesList.ItemIndex := YearMonthFromKodSetup(Kod,False)-1;
    YearSpinEdit.Value := YearMonthFromKodSetup(Kod);
   end;

 editSumma.SetFocus;
 Reg.Free;
end;

procedure TFgrCurrentCtrl.Action2Execute(Sender: TObject);
var reg: TRegistry;
    Key:string;
begin
  CancelBtn.SetFocus;
 if (Owner as TForm).Caption = CurrentOperationsData_Text[PLanguageIndex] then
     Key := '\Software\Grant\CurrentCtrl\Current';
 if (Owner as TForm).Caption = DataStud_Caption[PLanguageIndex] then
     Key := '\Software\Grant\CurrentCtrl\Stud';

 reg:=TRegistry.Create;
 try
  reg.RootKey:=HKEY_CURRENT_USER;
  reg.OpenKey(Key,True);
  reg.WriteString('IsBuffer','1');
  reg.WriteString('KodSmeta',EditSmeta.Text);
  reg.WriteString('KodVidOpl',EditVidOpl.Text);
  reg.WriteInteger('KodSetup',PeriodToKodSetup(YearSpinEdit.Value,MonthesList.ItemIndex+1));
  reg.WriteString('Prikaz',EditPrikaz.Text);
  reg.WriteString('EndMonth',CheckBoxMonthFinish.EditValue);
 finally
  reg.Free;
 end;
end;

procedure TFgrCurrentCtrl.FormShow(Sender: TObject);
begin
if Pcfs=zcfsInsert then RestoreFromBuffer(self);
 FormResize(sender);
  F:=False; 
end;

procedure TFgrCurrentCtrl.FormResize(Sender: TObject);
var i:integer;
begin
for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := Width div dxStatusBar1.Panels.Count;
end;

procedure TFgrCurrentCtrl.Action3Execute(Sender: TObject);
begin

if (CancelBtn.Focused=False) and (YesBtn.focused=False) and (CheckBoxMonthFinish.Focused=False) and 
(YearSpinEdit.focused=False) and (MonthesList.focused=False) and (EditSumma.focused=False) and 
(EditPrikaz.focused=False) and (EditVidOpl.focused=False) and (EditSmeta.focused=False)
then F:=True;
if CancelBtn.focused=true then close();
if YesBtn.focused=true then Action1.Execute;
if F=true then 
  begin  
  YesBtn.SetFocus;
  F:=False; 
  exit; 
  end;
if CheckBoxMonthFinish.Focused=true then begin Grid1.SetFocus; F:=True; exit; end;
if YearSpinEdit.focused=true then begin CheckBoxMonthFinish.SetFocus; exit; end;
if MonthesList.focused=true then begin YearSpinEdit.SetFocus; exit; end;
if EditSumma.focused=true then begin MonthesList.SetFocus; exit; end;
if EditPrikaz.focused=true then begin EditSumma.SetFocus; exit; end;
if EditVidOpl.focused=true then begin EditPrikaz.SetFocus; exit; end;
if EditSmeta.focused=true then begin EditVidOpl.SetFocus; exit; end;

//if CancelBtn.focused=true then EditSmeta.SetFocus;
end;

end.
