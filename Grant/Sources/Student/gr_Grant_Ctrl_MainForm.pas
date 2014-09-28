unit gr_Grant_Ctrl_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxTextEdit, cxButtonEdit, cxContainer, cxEdit, cxLabel,
  cxControls, cxGroupBox, StdCtrls, cxButtons, gr_uCommonConsts,
  PackageLoad, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  ZTypes, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, GlobalSpr,
  gr_uMessage, ActnList, ZProc, uCommonSp,
  Unit_NumericConsts, Dates, gr_uCommonLoader, gr_uCommonProc, cxSpinEdit,
  cxCheckBox,UpKernelUnit, FIBQuery, pFIBQuery, pFIBStoredProc;

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
    DB: TpFIBDatabase;
    StProcTransaction: TpFIBTransaction;
    StProc: TpFIBStoredProc;
    ComboBoxCategory: TcxLookupComboBox;
    DSetCatStud: TpFIBDataSet;
    DSourceCatStud: TDataSource;
    DefaultTransaction: TpFIBTransaction;
    PrikazMaskEdit: TcxMaskEdit;
    PrikazLabel: TcxLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure EditVidOplPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ActionYesExecute(Sender: TObject);
    procedure EditVidoplExit(Sender: TObject);
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
   PRes:Variant;
   Pcfs:TZControlFormStyle;
   PLanguageIndex:byte;
   PGrantCtrlSimpleParam:TgrCtrlSimpleParam;
  public
    constructor Create(AOwner:TComponent);reintroduce;
    function PrepareData(Db_Handle:TISC_DB_HANDLE;fs:TZControlFormStyle;Id:int64):boolean;
    property Res:Variant read PRes;
    property GrantCtrlSimpleParam:TgrCtrlSimpleParam read PGrantCtrlSimpleParam;
  end;

function ViewGrantCtrl(AParameter:TObject):TgrCtrlSimpleParam;

implementation

uses Math;

{$R *.dfm}

function ViewGrantCtrl(AParameter:TObject):TgrCtrlSimpleParam;
var Form:TFGrantCtrl;
    PResult:variant;
begin
 Form:=TFGrantCtrl.Create(TgrCtrlSimpleParam(AParameter).Owner);
  begin
   PResult := Form.PrepareData(TgrCtrlSimpleParam(AParameter).DB_Handle,
                              TgrCtrlSimpleParam(AParameter).fs,
                              TgrCtrlSimpleParam(AParameter).Id);
   if PResult<>False then
    begin
     PResult := Form.ShowModal;
     if PResult=mrYes then  Result:=Form.GrantCtrlSimpleParam
     else Result := nil;
    end
   else Result:=nil;
  end;
  Form.Destroy;
end;

constructor TFGrantCtrl.Create(AOwner:TComponent);
begin
 inherited Create(AOwner);
 PLanguageIndex:=LanguageIndex;
 PRes:=NULL;
 PGrantCtrlSimpleParam:=TgrCtrlSimpleParam.Create;
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
            //  BoxDates.Enabled := False;
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
              try
              EditDateBeg.Date := DBeg;
              EditDateBeg.Properties.MaxDate := DEndStud;
              EditDateBeg.Properties.MinDate := DBegStud;

              EditDateEnd.Date := DEnd;
              EditDateEnd.Properties.MaxDate := DEndStud;
              EditDateEnd.Properties.MinDate := DBegStud;
              except
              showmessage('Даты не допустимы');
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
    DB.Handle:=Db_Handle;
    DSetCatStud.SQLs.SelectSQL.Text := 'SELECT * FROM GR_CN_STUD_CAT_S';
    DSetCatStud.Open;
    ComboBoxCategory.Properties.DataController.DataSource := DSourceCatStud;
    LabelVidopl.Caption:='Категория';
    LabelSmeta.Caption:='Група';
    LabelBal.Caption:='Курс';
    MaskEditSumma.Enabled:=false;
    EditVidopl.Visible:=false;
//    EditSmeta.Enabled:=false;
    LabelVidoplData.Visible:=false;
    ComboBoxCategory.Visible:=true;
//    LabelSmetadata.Enabled:=false;
  end;
  zcfsDelete:
  begin
    DB.Handle:=Db_Handle;
    LabelSmeta.Caption:='Група';
    DateBegLabel.Visible:=False;
    DateEndLabel.Visible:=False;
    LabelMan.Visible:=False;
    LabelSumma.Visible:=False;
    LabelBal.Visible:=False;
    PrikazLabel.Visible:=False;
    LabelVidopl.Visible:=False;
    EditMan.Visible:=False;
    EditDateBeg.Visible:=False;
    EditDateEnd.Visible:=False;
    MaskEditSumma.Visible:=False;
    MaskEditBal.Visible:=False;
    PrikazMaskEdit.Visible:=False;
    ComboBoxCategory.Visible:=False;
    EditVidOpl.Visible:=False;
    LabelVidoplData.Visible:=False;
    EditSmeta.Visible:=True;
    LabelSmetadata.Visible:=True;
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
                   DB.Handle,zfsModal,
                   0,ValueFieldZSetup(DB.Handle,'GR_ID_SYSTEM'));
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

procedure TFGrantCtrl.ActionYesExecute(Sender: TObject);
begin
if ((PIdVidopl=0) and (Pcfs=zcfsInsert)) then
 begin
  grShowMessage(ECaption[PLanguageIndex],EVidOplInput_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
if EditDateBeg.Date>EditDateEnd.Date then
 begin
  grShowMessage(ECaption[PLanguageIndex],EInputTerms_Text[PLanguageIndex],mtWarning,[mbOk]);
  exit;
 end;
 PGrantCtrlSimpleParam.DateBeg:=StrToDate(EditDateBeg.Text);
 PGrantCtrlSimpleParam.DateEnd:=StrToDate(EditDateEnd.Text);
 case Pcfs of
 zcfsInsert:
 begin
   PGrantCtrlSimpleParam.IdSmeta:=PIdSmeta;
   PGrantCtrlSimpleParam.IdVidopl:=PIdVidopl;
   PGrantCtrlSimpleParam.Summa:=StrToFloat(MaskEditSumma.Text);
   PGrantCtrlSimpleParam.Bal:=StrToFloat(MaskEditBal.Text);
   PGrantCtrlSimpleParam.Prikaz:=PrikazMaskEdit.Text;
 end;
 zcfsUpdate:
 begin
    PGrantCtrlSimpleParam.IdSmeta:=PIdSmeta;
    PGrantCtrlSimpleParam.IdVidopl:=ComboBoxCategory.EditValue;
    PGrantCtrlSimpleParam.Bal:=StrToFloat(MaskEditBal.Text);
    PGrantCtrlSimpleParam.Prikaz:=PrikazMaskEdit.Text;
 end;
 zcfsDelete:
 begin
    PGrantCtrlSimpleParam.IdSmeta:=PIdSmeta;
 end;
end;
 ModalResult:=mrYes;
end;

procedure TFGrantCtrl.EditVidoplExit(Sender: TObject);
var VidOpl:Variant;
begin
if EditVidOpl.Text<>'' then
 begin
  if StrToInt(EditVidOpl.Text)=PKodVidopl then Exit;
  VidOpl:=VoByKod(StrToInt(EditVidOpl.Text),date,DB.Handle,ValueFieldZSetup(DB.Handle,'GR_ID_SYSTEM'),0);
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

procedure TFGrantCtrl.EditSmetaExit(Sender: TObject);
var Smeta:Variant;
begin
case Pcfs of
  zcfsInsert:
begin
if EditSmeta.Text<>'' then
 begin
  if StrToInt(EditSmeta.Text)=PKodSmeta then Exit;
  Smeta:=SmetaByKod(StrToInt(EditSmeta.Text),DB.Handle);
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
zcfsUpdate:
begin
if ((EditSmeta.Text<>'')and (NumPredpr(DB.Handle)<>7)) then
 begin
  if (StrToInt(EditSmeta.Text)=PKodSmeta) then Exit;
  Smeta:=DepartmentByKod(EditSmeta.Text,DB.Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PIdSmeta:=Smeta[0];
    PKodSmeta:=Smeta[1];
    LabelSmetaData.Caption := Smeta[2];
   end
  else
   EditSmeta.SetFocus;
 end;
end;
zcfsDelete:
begin
if ((EditSmeta.Text<>'')and (NumPredpr(DB.Handle)<>7)) then
 begin
  if (StrToInt(EditSmeta.Text)=PKodSmeta) then Exit;
  Smeta:=DepartmentByKod(EditSmeta.Text,DB.Handle);
  if VarArrayDimCount(Smeta)>0 then
   begin
    PIdSmeta:=Smeta[0];
    PKodSmeta:=Smeta[1];
    LabelSmetaData.Caption := Smeta[2];
   end
  else
   EditSmeta.SetFocus;
 end;
end;
end;
end;

procedure TFGrantCtrl.EditSmetaPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
    sp: TSprav;
begin

case Pcfs of
  zcfsInsert:
begin
Smeta:=GetSmets(self,DB.Handle,Date,psmSmet);
if VarArrayDimCount(Smeta)> 0 then
 If Smeta[0]<>NULL then
  begin
   PIdsmeta := Smeta[0];
   PKodSmeta := Smeta[3];
   EditSmeta.Text := IntToStr(PKodSmeta);
   LabelSmetaData.Caption := Smeta[2];
  end;
end;
  zcfsUpdate:
begin
sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
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
        EditSmeta.Text := varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
        LabelSmetaData.Caption := varToStrDef(sp.Output['NAME_FULL'],'');
        PIdSmeta:=sp.Output['ID_DEPARTMENT'];
       end;
    sp.Free;
end;
  zcfsDelete:
begin
sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DB.Handle);
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
        EditSmeta.Text := varToStrDef(sp.Output['DEPARTMENT_CODE'],'');
        LabelSmetaData.Caption := varToStrDef(sp.Output['NAME_FULL'],'');
        PIdSmeta:=sp.Output['ID_DEPARTMENT'];
       end;
    sp.Free;
end;
end;
end;

end.
