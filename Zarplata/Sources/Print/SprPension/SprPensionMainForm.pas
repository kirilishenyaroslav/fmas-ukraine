unit SprPensionMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxButtonEdit,
  cxLabel, cxSpinEdit, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxControls, cxGroupBox, IBase, SprPensionDataModule,
  dates, PackageLoad, ZMessages, ZProc, ActnList, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, Unit_SprSubs_Consts;

type
  TFSprPension = class(TForm)
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
    procedure CancelBtnClick(Sender: TObject);
    procedure EditDataFilterPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditDataFilterExit(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
  private
    PDBHandle:TISC_DB_HANDLE;
    PFilterData:TFilterData;
  public
    constructor Create(AOwner:TComponent; ADb_Handle:TISC_DB_HANDLE; AParameter: TFilterData);reintroduce;
    property FilterData:TFilterData read PFilterData;
  end;

implementation

uses Math;

{$R *.dfm}

constructor TFSprPension.Create(AOwner:TComponent; ADb_Handle:TISC_DB_HANDLE;AParameter: TFilterData);
begin
inherited Create(AOwner);
PFilterData:=AParameter;
PDBHandle:=ADb_Handle;
//******************************************************************************
 Caption                                := TFSprSubs_Caption;
 YesBtn.Caption                         := TFSprSubs_YesBtn_Caption;
 CancelBtn.Caption                      := TFSprSubs_CancelBtn_Caption;
 YesBtn.Hint                            := YesBtn.Caption;
 CancelBtn.Hint                         := CancelBtn.Caption+' (Esc)';
 BoxKodSetup.Caption                    := TFSprSubs_BoxKodSetup_Caption; BoxDataFilter.Caption                  := TFSprSubs_BoxDataFilter_Caption;
 LabelFrom.Caption                      := TFSprSubs_LabelFrom_Caption;
 LabelTo.Caption                        := TFSprSubs_LabelTo_Caption;
 MonthesList1.Properties.Items.Text     := TFSprSubs_MonthesList_Text;
 MonthesList2.Properties.Items.Text     := TFSprSubs_MonthesList_Text;
//******************************************************************************
 AParameter.Kod_setup2:=CurrentKodSetup(ADb_Handle)-1;
 AParameter.Kod_setup1:=AParameter.Kod_setup2-59;
 if (AParameter.Kod_setup1<>-1) and (AParameter.Kod_setup2<>-1) then
 begin
   YearSpinEdit1.Value:=YearMonthFromKodSetup(AParameter.Kod_setup1);
   MonthesList1.ItemIndex:= YearMonthFromKodSetup(AParameter.Kod_setup1,false)-1;
   YearSpinEdit2.Value:=YearMonthFromKodSetup(AParameter.Kod_setup2);
   MonthesList2.ItemIndex:= YearMonthFromKodSetup(AParameter.Kod_setup2,false)-1;
 end;

end;

procedure TFSprPension.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFSprPension.EditDataFilterPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Man:Variant;
begin
Man:=LoadPeopleModal(Self,PDBHandle);
if VarArrayDimCount(Man)> 0 then
 If Man[0]<>NULL then
  begin
   PFilterData.ID_man := Man[0];
   PFilterData.Fio := VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);
   PFilterData.TN:=IfThen(VarIsNull(Man[4]),0,Man[4]);
   LabelManData.Caption := PFilterData.FIO;
   EditDataFilter.Text := varToStr(Man[4]);
  end;
end;

procedure TFSprPension.EditDataFilterExit(Sender: TObject);
var man:Variant;
begin
if EditDataFilter.Text<>'' then
 begin
  if StrToInt(EditDataFilter.Text)=PFilterData.Tn then Exit;
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

procedure TFSprPension.ActionYesExecute(Sender: TObject);
begin
if PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1)>PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1) then
 begin
  ZShowMessage(TFSprSubs_InputError_Caption,TFSprSubs_InputKodSetupsError_Text,mtWarning,[mbOK]);
  MonthesList1.SetFocus;
 end
else
 if (YearSpinEdit2.Value-YearSpinEdit1.Value)>7 then
  begin
   ZShowMessage(TFSprSubs_InputError_Caption,TFSprPension_InputKodSetupsDifferError_Text,mtWarning,[mbOK]);
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
    PFilterData.Kod_setup1:=PeriodToKodSetup(YearSpinEdit1.Value,MonthesList1.ItemIndex+1);
    PFilterData.Kod_setup2:=PeriodToKodSetup(YearSpinEdit2.Value,MonthesList2.ItemIndex+1);
    ModalResult:=mrYes;
   end;
end;

end.
