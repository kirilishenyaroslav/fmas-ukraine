unit SprDoh2MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxLabel, cxSpinEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxControls, cxGroupBox, IBase, SprDoh2DataModul,
  Unit_sprSubs_Consts, dates, PackageLoad, ZMessages, ZProc, ActnList,
  cxRadioGroup, Unit_ZGlobal_Consts, ZTypes, gr_uCommonProc, gr_uCommonLoader,
  cxCheckBox;

type
  TFSprSubs = class(TForm)
    BoxKodSetup: TcxGroupBox;
    MonthesList1: TcxComboBox;
    YearSpinEdit1: TcxSpinEdit;
    MonthesList2: TcxComboBox;
    YearSpinEdit2: TcxSpinEdit;
    LabelFrom: TcxLabel;
    LabelTo: TcxLabel;
    BoxDataFilter: TcxGroupBox;
    EditDataFilter: TcxButtonEdit;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    LabelManData: TcxLabel;
    ActionList: TActionList;
    ActionYes: TAction;
    RadioBtnWorker: TcxRadioButton;
    PrintCurUser: TcxCheckBox;
    procedure CancelBtnClick(Sender: TObject);
    procedure EditDataFilterPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditDataFilterExit(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
  private
    DModule:TDM;
    PDBHandle:TISC_DB_HANDLE;
    PFilterData:TFilterData;
    PLanguageIndex:Byte;
    PIsGrant:TZChildSystems;
  public
    constructor Create(AOwner:TComponent; ADb_Handle:TISC_DB_HANDLE; AParameter: TFilterData;AIs_Grant: TZChildSystems);reintroduce;
    property FilterData:TFilterData read PFilterData;
  end;

implementation

uses Math;

{$R *.dfm}

constructor TFSprSubs.Create(AOwner:TComponent; ADb_Handle:TISC_DB_HANDLE;AParameter: TFilterData;AIs_Grant: TZChildSystems);
begin
inherited Create(AOwner);
PFilterData:=AParameter;
PLanguageIndex:=LanguageIndex;
PDBHandle:=ADb_Handle;
PIsGrant:=AIs_Grant;
//******************************************************************************
 Caption                                := TFSprSubs_Caption;
 YesBtn.Caption                         := TFSprSubs_YesBtn_Caption;
 CancelBtn.Caption                      := TFSprSubs_CancelBtn_Caption;
 YesBtn.Hint                            := YesBtn.Caption;
 CancelBtn.Hint                         := CancelBtn.Caption+' (Esc)';
 BoxKodSetup.Caption                    := TFSprSubs_BoxKodSetup_Caption;
 BoxDataFilter.Caption                  := TFSprSubs_BoxDataFilter_Caption;
 LabelFrom.Caption                      := TFSprSubs_LabelFrom_Caption;
 LabelTo.Caption                        := TFSprSubs_LabelTo_Caption;
 MonthesList1.Properties.Items.Text     := TFSprSubs_MonthesList_Text;
 MonthesList2.Properties.Items.Text     := TFSprSubs_MonthesList_Text;
 RadioBtnWorker.Caption                 := LabelWorker_Caption[PLanguageIndex];
{ if(AIs_Grant=tsZarplata)then RadioBtnWorker.Checked:=true
 else
 begin
   RadioBtnStud.Checked:=true;
   RadioBtnWorker.Visible:=False;
   RadioBtnStud.Visible:=False;
   RadioBtnMan.Visible:=False;
   cxRadioGroup1.Visible:=False;
 end;}
//******************************************************************************
  if(AParameter.ID_man<>-1)then
  begin
    if(AParameter.ID_man<>-1)and (AParameter.FIO=null)then
      BoxDataFilter.Enabled:=False;
    DModule:=TDM.Create(AOwner);
    with DModule do
    begin
      DB.Handle := ADb_Handle;
      ReadTransaction.StartTransaction;
      DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_TN_BY_ID_MAN('+IntToStr(AParameter.ID_man)+','''+DateToStr(Date)+''')';
      DSet.Open;
    end;
    AParameter.TN:=DModule.DSet['TN'];
    with DModule do
    begin
      DSet.Close;
      ReadTransaction.Commit;
      Free;
    end;
  if AParameter.TN<>0 then
     EditDataFilter.Text := IntToStr(AParameter.TN);
  LabelManData.Caption := AParameter.FIO;
  EditDataFilter.OnExit(Self);
 end;
 if (AParameter.Kod_setup1<>-1) and (AParameter.Kod_setup2<>-1) then
 begin
  YearSpinEdit1.Value:=YearMonthFromKodSetup(AParameter.Kod_setup1);
  MonthesList1.ItemIndex:= YearMonthFromKodSetup(AParameter.Kod_setup1,false)-1;
  YearSpinEdit2.Value:=YearMonthFromKodSetup(AParameter.Kod_setup2);
  MonthesList2.ItemIndex:= YearMonthFromKodSetup(AParameter.Kod_setup2,false)-1;
 end
 else
 begin
  DModule:=TDM.Create(AOwner);
  with DModule do
   begin
    DB.Handle := ADb_Handle;
    ReadTransaction.StartTransaction;
    DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_KOD_SETUP_RETURN';
    DSet.Open;
   end;
    YearSpinEdit1.Value:=YearMonthFromKodSetup(DModule.DSet['KOD_SETUP']-6);
    MonthesList1.ItemIndex:= YearMonthFromKodSetup(DModule.DSet['KOD_SETUP']-6,false)-1;
    YearSpinEdit2.Value:=YearMonthFromKodSetup(DModule.DSet['KOD_SETUP']-1);
    MonthesList2.ItemIndex:= YearMonthFromKodSetup(DModule.DSet['KOD_SETUP']-1,false)-1;
  with DModule do
   begin
    DSet.Close;
    ReadTransaction.Commit;
    Free;
   end;
 end;
end;

procedure TFSprSubs.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSprSubs.EditDataFilterPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:Variant;
    PParameter:TgrSimpleParam;
begin
{if(RadioBtnStud.Checked=true)then
begin
  PParameter:=TgrSimpleParam.Create;
  PParameter.DB_Handle:=PDBHandle;
  PParameter.Owner:=self;
  Man:=DoFunctionFromPackage(PParameter,Stud_StudentCards);
end
else}
  Man:=LoadPeopleModal(Self,PDBHandle);
if VarArrayDimCount(Man)> 0 then
 If Man[0]<>NULL then
  {begin
   if(RadioBtnStud.Checked=true)then
   begin
     PFilterData.ID_man := Man[0];
     PFilterData.Fio := VarToStr(Man[2]);
     PFilterData.TN:=IfThen(VarIsNull(Man[1]),0,Man[1]);
     LabelManData.Caption := PFilterData.FIO;
     EditDataFilter.Text := varToStr(Man[1]);
   end
   else}
   begin
     PFilterData.ID_man := Man[0];
     PFilterData.Fio := VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
     PFilterData.TN:=IfThen(VarIsNull(Man[4]),0,Man[4]);
     LabelManData.Caption := PFilterData.FIO;
     EditDataFilter.Text := varToStr(Man[4]);
   end;

end;

procedure TFSprSubs.EditDataFilterExit(Sender: TObject);
var man:Variant;
begin
if EditDataFilter.Text<>'' then
 begin
  if StrToInt(EditDataFilter.Text)=PFilterData.Tn then Exit;
  {if(RadioBtnStud.Checked=true)then
    man:=grManByShifr(StrToInt(EditDataFilter.Text),PDBHandle)
  else }
    man:=ManByTn(StrToInt(EditDataFilter.Text),PDBHandle);
  if VarArrayDimCount(man)>0 then
   begin
    PFilterData.Id_man:=man[0];
    PFilterData.Tn:=man[1];
    PFilterData.FIO:=man[2];
    LabelManData.Caption := PFilterData.FIO;
   end
  else
   EditDataFilter.SetFocus;
 end;
end;

procedure TFSprSubs.ActionYesExecute(Sender: TObject);
var date_beg:TDate;
    date_end:TDate;
begin
  DModule:=TDM.Create(self);
  with DModule do
  begin
    DB.Handle := PDBHandle;
    ReadTransaction.StartTransaction;
    DSet.SQLs.SelectSQL.Text := 'SELECT * FROM Z_VPN_FOR_MAN('+IntToStr(PFilterData.ID_man)+','+IntToStr(PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1))+')';
    DSet.Open;
  end;
  if(DModule.DSet['N_STUD']=0) and (PIsGrant=TsGrant) then
  begin
    ZShowMessage(TFSprSubs_InputError_Caption,TFSprSubs_InputKodSetupsIntersect_Text,mtWarning,[mbOK]);
    MonthesList1.SetFocus;
  end
  else
    if PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1)>PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1) then
    begin
      ZShowMessage(TFSprSubs_InputError_Caption,TFSprSubs_InputKodSetupsError_Text,mtWarning,[mbOK]);
      MonthesList1.SetFocus;
    end
    else
      If PFilterData.ID_man<=0 then
        begin
          ZShowMessage(TFSprSubs_InputError_Caption,TFSprSubs_InputPersonError_Text,mtWarning,[mbOK]);
          EditDataFilter.SetFocus;
        end
        else
        begin
          If (PrintCurUser.Checked=True) then PFilterData.PrUser:=True
          else PFilterData.PrUser:=False;
          PFilterData.Kod_setup1:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
          PFilterData.Kod_setup2:=PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);
          ModalResult:=mrYes;
        end;
  with DModule do
  begin
    DSet.Close;
    ReadTransaction.Commit;
    Free;
  end;
end;

end.
