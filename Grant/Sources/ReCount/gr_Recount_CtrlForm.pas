unit gr_Recount_CtrlForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxButtonEdit, cxLabel, cxSpinEdit, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxControls, cxGroupBox,
  cxLookAndFeelPainters, StdCtrls, cxButtons, PackageLoad, zProc, iBase, zTypes,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, uCommonSp,
  gr_uCommonConsts, gr_uCommonProc, Dates, gr_uMessage, ActnList, DB,
  FIBDataSet, pFIBDataSet, gr_uWaitForm, gr_uCommonLoader;

type
  TFRecountCtrl = class(TForm)
    BoxKodSetup: TcxGroupBox;
    MonthesList1: TcxComboBox;
    YearSpinEdit1: TcxSpinEdit;
    MonthesList2: TcxComboBox;
    YearSpinEdit2: TcxSpinEdit;
    cxLabel1: TcxLabel;
    BoxIdMan: TcxGroupBox;
    EditMan: TcxButtonEdit;
    LabelManData: TcxLabel;
    Bevel1: TBevel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    ActionList: TActionList;
    ActionCancel: TAction;
    ActionYes: TAction;
    DSet: TpFIBDataSet;
    UpdateTransaction: TpFIBTransaction;
    procedure EditManExit(Sender: TObject);
    procedure EditManPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);

  private
    pTn:integer;
    pDbHandle:TISC_DB_HANDLE;
    pIdMan:Integer;
    pLanguageIndex:byte;
    pId:integer;
    pCtrlFormStyle:TZControlFormStyle;
    pSpravType:Boolean;
  public
    constructor Create(aOwner:TComponent;aDbHandle:TISC_DB_HANDLE);reintroduce;
    function GetData(aCtrlFormStyle:TZControlFormStyle;aId:integer):boolean;
    function DeleteRecord(aId:integer):boolean;
    property Id:integer read pId;
    property SpravType: Boolean write pSpravType;
  end;


implementation

{$R *.dfm}
constructor TFRecountCtrl.Create(aOwner:TComponent;aDbHandle:TISC_DB_HANDLE);
begin
 inherited Create(aOwner);
 pDbHandle := aDbHandle;
//------------------------------------------------------------------------------
 pLanguageIndex:=gr_uCommonProc.IndexLanguage;
 MonthesList1.Properties.Items.Text := gr_uCommonConsts.MonthesList_Text[pLanguageIndex];
 MonthesList2.Properties.Items.Text := gr_uCommonConsts.MonthesList_Text[pLanguageIndex];
 YesBtn.Caption := YesBtn_Caption[pLanguageIndex];
 CancelBtn.Caption := CancelBtn_Caption[pLanguageIndex];
end;

procedure TFRecountCtrl.EditManExit(Sender: TObject);
var man:Variant;
begin
if EditMan.Text<>'' then
 begin
  if (StrToInt(EditMan.Text)=pTn) or (Trim(EditMan.Text)='') then Exit;
  man:=grManByShifr(StrToInt(EditMan.Text),pDbHandle);
  if VarArrayDimCount(man)>0 then
   begin
    pIdman:=man[0];
    pTn:=ifThen(VarIsNULL(man[1]),0,man[1]);
    LabelManData.Caption := man[2];
   end
  else
   EditMan.SetFocus;
 end;
end;

function TFRecountCtrl.GetData(aCtrlFormStyle:TZControlFormStyle;aId:Integer):boolean;
var tKodSetup:integer;
begin
 Result:=false;
 pCtrlFormStyle:=aCtrlFormStyle;
 case aCtrlFormStyle of
  zcfsInsert:
   begin
    Caption := Caption_Insert[pLanguageIndex];
    if (aId=1) then
      BoxIdMan.Enabled:=false
    else
      BoxIdMan.Enabled:=True;
    pId:=aId;
    Result:=True;
   end;
  zcfsUpdate:
   try
    Caption := Caption_Update[pLanguageIndex];
    DB.Handle := pDbHandle;
    StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_S_BY_KEY';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.PrepareArrayFields;
    StProc.ParamByName('IN_ID').AsInteger := aId;
    pId:=aId;
    StProc.ExecProc;
    pIdMan := StProc.ParamByName('ID_MAN').AsInteger;
    LabelManData.Caption := VarToStrDef(StProc.ParamByName('FIO').AsVariant,'');
    tKodSetup := StProc.ParamByName('KOD_SETUP_B').AsInteger;
    YearSpinEdit1.Value := YearMonthFromKodSetup(tKodSetup);
    MonthesList1.ItemIndex := YearMonthFromKodSetup(tKodSetup,False)-1;
    tKodSetup := StProc.ParamByName('KOD_SETUP_E').AsInteger;
    YearSpinEdit2.Value := YearMonthFromKodSetup(tKodSetup);
    MonthesList2.ItemIndex := YearMonthFromKodSetup(tKodSetup,False)-1;
    StProc.Transaction.Commit;
    Result:=True;
   except
    on E:Exception do
     begin
      grShowMessage(ECaption[pLanguageIndex],e.Message,mtError,[mbOk]);
      StProc.Transaction.Rollback;
      Result:=false;
     end;
   end;
   zcfsShowDetails:
   try
    Caption := Caption_Detail[pLanguageIndex];
    DB.Handle := pDbHandle;
    StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_S_BY_KEY';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('IN_ID').AsInteger := aId;
    pId:=aId;
    StProc.ExecProc;
    pIdMan := StProc.ParamByName('ID_MAN').AsInteger;
    LabelManData.Caption := VarToStrDef(StProc.ParamByName('FIO').AsVariant,'');
    tKodSetup := StProc.ParamByName('KOD_SETUP_B').AsInteger;
    YearSpinEdit1.Value := YearMonthFromKodSetup(tKodSetup);
    MonthesList1.ItemIndex := YearMonthFromKodSetup(tKodSetup,False)-1;
    tKodSetup := StProc.ParamByName('KOD_SETUP_E').AsInteger;
    YearSpinEdit2.Value := YearMonthFromKodSetup(tKodSetup);
    MonthesList2.ItemIndex := YearMonthFromKodSetup(tKodSetup,False)-1;
    StProc.Transaction.Commit;
    BoxIdMan.Enabled := False;
    BoxKodSetup.Enabled := False;
    YesBtn.Visible := False;
    CancelBtn.Caption := ExitBtn_Caption[pLanguageIndex];
    Result:=True;
   except
    on E:Exception do
     begin
      grShowMessage(ECaption[pLanguageIndex],e.Message,mtError,[mbOk]);
      StProc.Transaction.Rollback;
      Result:=False;
     end;
   end;
 end;
end;

procedure TFRecountCtrl.EditManPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:Variant;
    sp: TSprav;
    AParameter: TgrSimpleParam;
begin
  if(pId=2)then
  begin
    try
      sp := GetSprav('SpDepartment');
      if sp <> nil then
      begin
        with sp.Input do
        begin
          Append;
          FieldValues['DBHandle'] := Integer(pDbHandle);
          FieldValues['ShowStyle'] := 0;
          FieldValues['Select'] := 1;
          FieldValues['Actual_Date'] := Date;
          FieldValues['Id_Property']:=4;
          Post;
        end;
      end;
      sp.Show;
    except
      on E:Exception do
      begin
        grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
      end;
    end;
    if sp.Output = nil then
      ShowMessage('BUG: Output is NIL!!!')
    else
      if not sp.Output.IsEmpty then
      begin
        pIdMan:=sp.Output['ID_DEPARTMENT'];
        LabelManData.Caption :=varToStrDef(sp.Output['NAME_FULL'],'');
        EditMan.Text :=varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
      end;
    sp.Free;
  end
  else
  begin
    AParameter:=TgrSimpleParam.Create;
    AParameter.Owner:=Self;
    AParameter.DB_Handle:=PDBHandle;
    Man:=DoFunctionFromPackage(AParameter,Stud_StudentCards);
    if VarArrayDimCount(Man)> 0 then
      if Man[0]<>NULL then
      begin
        pIdMan := Man[0];
        pTn := ifThen(VarisNull(Man[1]),0,Man[1]);
        LabelManData.Caption :=Man[2];
        EditMan.Text := ifThen(VarisNull(Man[1]),'',Man[1]);
      end;
  end;
end;

procedure TFRecountCtrl.ActionCancelExecute(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFRecountCtrl.ActionYesExecute(Sender: TObject);
var wf:TForm;
begin
YesBtn.SetFocus;
if BoxIdMan.Enabled=true then
if pIdMan=0 then
 begin
  grShowMessage(ECaption[pLanguageIndex],EManInput_Text[pLanguageIndex],mtInformation,[mbOk]);
  EditMan.SetFocus;
  Exit;
 end;
if PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1)>
   PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1) then
   begin
        grShowMessage(ECaption[pLanguageIndex],EInputKodSetups_Text[pLanguageIndex],mtInformation,[mbOk]);
        MonthesList1.SetFocus;
        Exit;
   end;
if((pCtrlFormStyle=zcfsInsert) and (BoxIdMan.Enabled=false))then
begin
  DB.Handle := pDbHandle;
  DSet.SQLs.SelectSQL.Text:='SELECT ID_MAN FROM GR_COUNT_PEOPLE('''+DateToStr(EncodeDate(YearSpinEdit2.Value,MonthesList2.ItemIndex+1,1))+
                             ''','''+ DateToStr(EncodeDate(YearSpinEdit2.Value,MonthesList2.ItemIndex+2,1)-1)+''')';
  StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_I';

  wf:=ShowWaitForm(self,wfSelectData);

  DSet.Open;
  while not DSet.Eof do
  begin
    try
      StProc.Transaction.StartTransaction;
      StProc.Prepare;

      StProc.ParamByName('ID_MAN').AsInteger :=DSet['ID_MAN'] ;
      StProc.ParamByName('KOD_SETUP_B').AsInteger := PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
      StProc.ParamByName('KOD_SETUP_E').AsInteger := PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);
      StProc.ExecProc;
      StProc.Transaction.Commit;
    except
    on e:exception do
      begin
        StProc.Transaction.Rollback;
        grShowMessage(ECaption[pLanguageIndex],e.Message,mtError,[mbOK]);
      end;
    end;
    DSet.Next;
  end;
  CloseWaitForm(wf);
  ModalResult := mrYes;
end
else
try
 DB.Handle := pDbHandle;
 if (pCtrlFormStyle=zcfsInsert) and (pId=2)then
  begin
    StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_BY_DEP';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
    StProc.ParamByName('KOD_SETUP_B').AsInteger:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
    StProc.ParamByName('KOD_SETUP_E').AsInteger:=PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);
    StProc.ParamByName('ID_DEP').AsInteger:=pIdMan;
    StProc.ExecProc;
    StProc.Transaction.Commit;
  end
 else
  begin
   case pCtrlFormStyle of
    zcfsInsert: StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_I';
    zcfsUpdate: StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_U';
   end;
   StProc.Transaction.StartTransaction;
    StProc.Prepare;

    StProc.ParamByName('ID_MAN').AsInteger := pIdMan;
    StProc.ParamByName('KOD_SETUP_B').AsInteger := PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
    StProc.ParamByName('KOD_SETUP_E').AsInteger := PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);

    if pCtrlFormStyle=zcfsUpdate then StProc.ParamByName('ID').AsInteger := pId;

    StProc.ExecProc;

    if pCtrlFormStyle=zcfsInsert then pId:=StProc.ParamByName('ID').AsInteger;

    StProc.Transaction.Commit;
  end;
ModalResult := mrYes;
except
 on e:exception do
  begin
   StProc.Transaction.Rollback;
   grShowMessage(ECaption[pLanguageIndex],e.Message,mtError,[mbOK]);
  end;
end;
end;

function TFRecountCtrl.DeleteRecord(aId:integer):boolean;
begin
 result:=True;
 if grShowMessage(DeleteBtn_Caption[pLanguageIndex],
                  DeleteRecordQuestion_Text[pLanguageIndex],
                  mtConfirmation,[mbYes,mbNo])=mrYes then
 try
  DB.Handle := pDbHandle;
  StProc.StoredProcName := 'GR_REE_FOR_RECOUNT_D';
  StProc.Transaction.StartTransaction;
  StProc.Prepare;
  StProc.ParamByName('ID').AsInteger := aId;
  StProc.ExecProc;
  StProc.Transaction.Commit;
  Result:=True;
 except
  on e:exception do
   begin
    grShowMessage(ECaption[pLanguageIndex],e.Message,mtError,[mbOk]);
    StProc.Transaction.Rollback;
   end;
 end;
end;
end.


