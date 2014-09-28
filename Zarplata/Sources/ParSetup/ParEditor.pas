unit ParEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit_ZGlobal_Consts, cxTextEdit, cxDropDownEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxSpinEdit, cxLabel, FIBDatabase,
  pFIBDatabase, Dates, cxLookAndFeelPainters, StdCtrls, cxButtons, ZMessages,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, zTypes,
  ActnList, ExtCtrls, Kernel;

type
  TfParEditor = class(TForm)
    SEYear: TcxSpinEdit;
    CBMonth: TcxComboBox;
    meProf: TcxMaskEdit;
    mePens: TcxMaskEdit;
    meZan: TcxMaskEdit;
    meSoc: TcxMaskEdit;
    meNSluch: TcxMaskEdit;
    meInv: TcxMaskEdit;
    lProf: TcxLabel;
    lPens: TcxLabel;
    lZan: TcxLabel;
    lSoc: TcxLabel;
    lNSluch: TcxLabel;
    lInv: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    DSet: TpFIBDataSet;
    Write: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ActionList1: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxLabel1: TcxLabel;
    ESN_R: TcxMaskEdit;
    cxLabel2: TcxLabel;
    ESN_NDC: TcxMaskEdit;
    ESN_INV: TcxMaskEdit;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    ESN_LL: TcxMaskEdit;
    ESN_DP: TcxMaskEdit;
    cxLabel5: TcxLabel;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
    PLanguageIndex:byte;
    Purpose:TZControlFormStyle;
    ID:integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DS:TpFIBDataSet); reintroduce;
    function Prepare: Boolean;
    procedure Delete;
    procedure FocusOnField(Field: TcxMaskEdit);
  end;

  function View_FZ_ParEditor(AOwner : TComponent;DS:TpFIBDataSet; cfs:TZControlFormStyle):Variant;stdcall;

implementation

{$R *.dfm}

function View_FZ_ParEditor(AOwner : TComponent;DS:TpFIBDataSet; cfs:TZControlFormStyle):Variant;
var ViewForm:TfParEditor;
begin
  ViewForm:=TfParEditor.Create(AOwner,DS);
  ViewForm.Purpose:=cfs;
  ViewForm.PLanguageIndex:=1;
  if ViewForm.Prepare then
   begin
    if ViewForm.Purpose<>zcfsDelete then
     begin
      If ViewForm.ModalResult=mrNone then
        ViewForm.ShowModal;
     end
    else
      ViewForm.Delete;
   end;
  ViewForm.Free;
end;

constructor TfParEditor.Create(AOwner:TComponent;DS:TpFIBDataSet);
begin
 inherited Create(AOwner);
//******************************************************************************
 DSet:=DS;
 Write.DefaultDatabase:=DSet.Database;
 StoredProc.Database:=DSet.Database;
 StoredProc.Transaction:=Write;
 DSet.Open;
end;

function TfParEditor.Prepare: Boolean;
var RecInfo:RECORD_INFO_STRUCTURE;
begin
  Result:=true;
//******************************************************************************
  Caption := FZ_ParEdit_Caption[PLanguageIndex];
  lPens.Caption  := GridClProcPens_Caption[PLanguageIndex];
  lProf.Caption  := GridClProcProf_Caption[PLanguageIndex];
  lInv.Caption   := GridClProcInv_Caption[PLanguageIndex];
  lNSluch.Caption:= GridClProcNSluch_Caption[PLanguageIndex];
  lSoc.Caption   := GridClProcSoc_Caption[PLanguageIndex];
  lZan.Caption   := GridClProcZan_Caption[PLanguageIndex];
  btnOk.Caption     := YesBtn_Caption[PLanguageIndex];
  btnOk.Hint        := btnOk.Caption;
  btnCancel.Caption := CancelBtn_Caption[PLanguageIndex];
  btnCancel.Hint    := btnCancel.Caption;

//******************************************************************************
  cbMonth.Properties.Items.Text:=MonthesList_Text[PLanguageIndex];
  case Purpose of
   zcfsInsert:  //Insert
   begin
    cbMonth.ItemIndex:=YearMonthFromKodSetup(DateToKodSetup(date),False)-1;
    seYear.Value:=YearMonthFromKodSetup(DateToKodSetup(date));
    meProf.Text   :='0';
    meSoc.Text    :='0';
    meZan.Text    :='0';
    meNSluch.Text :='0';
    mePens.Text   :='0';
    meInv.Text    :='0';
   end;
   zcfsUpdate: //Update
   try
    // Обновление записи
    ID:=DSet['ID'];
    DSet.SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
    DSet.SQLs.RefreshSQL.Text := 'select * from Z_PAR_SET_SELECT_BY_ID('+IntToStr(ID)+')';
    DSet.Edit;
    DSet.Post;
    DSet.SQLs.UpdateSQL.Clear;
    DSet.SQLs.RefreshSQL.Clear;

    // блокировка записи
    StoredProc.Transaction.StartTransaction;
    RecInfo.TRHANDLE       :=StoredProc.Transaction.Handle;
    RecInfo.DBHANDLE     :=DSet.Database.Handle;
    RecInfo.ID_RECORD    :=VarArrayOf([ID]);
    RecInfo.PK_FIELD_NAME:=VarArrayOf(['ID']);
    RecInfo.TABLE_NAME   :='Z_PAR_SET';
    RecInfo.RAISE_FLAG   :=True;
    LockRecord(@RecInfo);

    cbMonth.ItemIndex:=YearMonthFromKodSetup(DSet.fieldByName('KOD_SETUP_END').AsInteger,False)-1;
    seYear.Value:=YearMonthFromKodSetup(DSet.fieldByName('KOD_SETUP_END').AsInteger);
    meProf.Text   := FloatToStrF(DSet['PROC_PROF'],ffFixed,8,4);
    meSoc.Text    := FloatToStrF(DSet['PROC_SOC'],ffFixed,8,4);
    meZan.Text    := FloatToStrF(DSet['PROC_ZAN'],ffFixed,8,4);
    meNSluch.Text := FloatToStrF(DSet['PROC_NSLUCH'],ffFixed,8,4);
    mePens.Text   := FloatToStrF(DSet['PROC_PENS'],ffFixed,8,4);
    meInv.Text    := FloatToStrF(DSet['PROC_INV'],ffFixed,8,4);

    ESN_R.Text      :=FloatToStrF(DSet['ESN_R'],ffFixed,8,4);
    ESN_NDC.Text      :=FloatToStrF(DSet['ESN_NDC'],ffFixed,8,4);
    ESN_INV.Text      :=FloatToStrF(DSet['ESN_INV'],ffFixed,8,4);
    ESN_LL.Text      :=FloatToStrF(DSet['ESN_LL'],ffFixed,8,4);
    ESN_DP.Text      :=FloatToStrF(DSet['ESN_DP'],ffFixed,8,4);

   except
    on E:exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOk]);
      StoredProc.Transaction.Rollback;
      Result:=false;
     end;
   end;
   zcfsDelete:
   try
    // Обновление записи
    ID:=DSet['ID'];
    DSet.SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
    DSet.SQLs.RefreshSQL.Text := 'select * from Z_PAR_SET_SELECT_BY_ID('+IntToStr(ID)+')';
    DSet.Edit;
    DSet.Post;
    DSet.SQLs.UpdateSQL.Clear;
    DSet.SQLs.RefreshSQL.Clear;

    // блокировка записи
    StoredProc.Transaction.StartTransaction;
    RecInfo.TRHANDLE       :=StoredProc.Transaction.Handle;
    RecInfo.DBHANDLE     :=DSet.Database.Handle;
    RecInfo.ID_RECORD    :=VarArrayOf([ID]);
    RecInfo.PK_FIELD_NAME:=VarArrayOf(['ID']);
    RecInfo.TABLE_NAME   :='Z_PAR_SET';
    RecInfo.RAISE_FLAG   :=True;
    LockRecord(@RecInfo);
   except
    on E:exception do
     begin
      ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOk]);
      StoredProc.Transaction.Rollback;
      Result:=false;
     end;
   end;
  end;
end;

procedure TfParEditor.Delete;
begin
  if zShowMessage(Caption_Delete[PLanguageIndex],DeleteRecordQuestion_Text[PLanguageIndex],mtConfirmation,[mbYes,mbNo])=mrYes then
    begin
      try
        StoredProc.StoredProcName:='Z_PAR_SET_D';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID').AsInteger:=ID;
        StoredProc.ExecProc;
        StoredProc.Transaction.Commit;
        DSet.DeleteSQL.Text:='execute procedure Z_EMPTY_PROC';
        DSet.Delete;
      except
       on e:Exception do
        begin
          StoredProc.Transaction.Rollback;
          ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
        end;
      end;
    end;
end;

procedure TfParEditor.FocusOnField(Field: TcxMaskEdit);
begin
  zShowMessage(Caption_Update[PLanguageIndex],EmptyFields_Message[PLanguageIndex],mtInformation,[mbOk]);
  Field.SetFocus;
end;

procedure TfParEditor.OkActionExecute(Sender: TObject);
begin
//ПРОВЕРКА НА ЗАПОЛНЕННОСТЬ ПОЛЕЙ
  if (meProf.Text<>'0') or(ESN_R.Text<>'0') or (ESN_NDC.Text<>'0') or
   (ESN_INV.Text<>'0') or (ESN_LL.Text<>'0') or (ESN_DP.Text<>'0') then
   if (meProf.Text='') then
     FocusOnField(meProf)
   else
    if (ESN_R.Text='') then
       FocusOnField(ESN_R)
     else
        if (ESN_NDC.Text='') then
           FocusOnField(ESN_NDC)
         else
          if (ESN_INV.Text='') then
             FocusOnField(ESN_INV)
           else
              if (ESN_LL.Text='') then
                 FocusOnField(ESN_LL)
               else
                  if (ESN_DP.Text='') then
                     FocusOnField(ESN_DP)
                   else


   begin
      try
      if purpose=zcfsInsert then
       begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName:='Z_PAR_SET_I'
       end
      else
        begin
          StoredProc.StoredProcName:='Z_PAR_SET_U';
          StoredProc.ParamByName('ID').AsInteger:=ID;
        end;
      StoredProc.Prepare;
      StoredProc.ParamByName('KOD_SETUP_END').AsInteger:=PeriodToKodSetup(seYear.Value,cbMonth.ItemIndex+1);
      StoredProc.ParamByName('PROC_PROF').AsExtended:=StrToFloat(meProf.Text);
      StoredProc.ParamByName('PROC_PENS').AsExtended:=StrToFloat(mePens.Text);
      StoredProc.ParamByName('PROC_ZAN').AsExtended:=StrToFloat(meZan.Text);
      StoredProc.ParamByName('PROC_SOC').AsExtended:=StrToFloat(meSoc.Text);
      StoredProc.ParamByName('PROC_NSLUCH').AsExtended:=StrToFloat(meNSluch.Text);
      StoredProc.ParamByName('PROC_INV').AsExtended:=StrToFloat(meInv.Text);
      StoredProc.ParamByName('ESN_R').AsExtended:=StrToFloat(ESN_R.Text);
      StoredProc.ParamByName('ESN_NDC').AsExtended:=StrToFloat(ESN_NDC.Text);
      StoredProc.ParamByName('ESN_INV').AsExtended:=StrToFloat(ESN_INV.Text);
      StoredProc.ParamByName('ESN_LL').AsExtended:=StrToFloat(ESN_LL.Text);
      StoredProc.ParamByName('ESN_DP').AsExtended:=StrToFloat(ESN_DP.Text);
      StoredProc.ExecProc;
      if purpose=zcfsInsert then id:=StoredProc.ParamByName('ID').AsInteger;
      StoredProc.Transaction.Commit;
      if purpose=zcfsInsert then
       begin
        DSet.SQLs.InsertSQL.Text := 'execute procedure Z_EMPTY_PROC';
        DSet.SQLs.RefreshSQL.Text := 'select * from Z_PAR_SET_SELECT_BY_ID('+IntToStr(ID)+')';
        DSet.Insert;
        DSet['ID']:=id;
        DSet.Post;
        DSet.SQLs.InsertSQL.Clear;
        DSet.SQLs.RefreshSQL.Clear;
       end
      else
       begin
        DSet.SQLs.UpdateSQL.Text := 'execute procedure Z_EMPTY_PROC';
        DSet.SQLs.RefreshSQL.Text := 'select * from Z_PAR_SET_SELECT_BY_ID('+IntToStr(ID)+')';
        DSet.Edit;
        DSet.Post;
        DSet.SQLs.UpdateSQL.Clear;
        DSet.SQLs.RefreshSQL.Clear;
       end;
      Close;
      except
       on e:Exception do
        begin
          StoredProc.Transaction.Rollback;
          ZShowMessage(Error_Caption[PLanguageIndex],E.Message,mtError,[mbOK]);
        end;
      end;
   end
  else zShowMessage(Caption_Update[PLanguageIndex],NullFields_Message[PLanguageIndex],mtInformation,[mbOk]);
end;

procedure TfParEditor.CancelActionExecute(Sender: TObject);
begin
  Close;
end;

end.
