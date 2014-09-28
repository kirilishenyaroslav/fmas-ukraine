unit gr_SvodDocsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTreeView, cxControls, cxGroupBox, IBase, cxEdit, cxRadioGroup,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
  cxClasses, gr_SvodDocsDataModul, Dates,
  ExtCtrls, dxBarExtItems, dxBar, ZProc, Z_StProc_DM,
  gr_uMessage, gr_uCommonConsts, gr_SvodTypesUnit,
  gr_SvodLoaderUnit;

type
  TGrFOptionsSvod = class(TForm)
    dxBarManager: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    YearSpinEdit: TdxBarSpinEdit;
    SvodSub: TdxBarSubItem;
    ReestrSub: TdxBarSubItem;
    RaschVedBtn: TdxBarButton;
    LabelKodSetup: TdxBarStatic;
    MonthesList: TdxBarCombo;
    SvodBySchBtn: TdxBarButton;
    SvodByDepartmentBtn: TdxBarButton;
    ReeAlimonyBtn: TdxBarButton;
    ExitBtn: TdxBarButton;
    dxBarButton1: TdxBarButton;
    SvodBySmBtn: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SvodBySchBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SvodByFOTFullBtnClick(Sender: TObject);
    procedure SvodByFOTShortBtnClick(Sender: TObject);
    procedure SvodByDepartmentBtnClick(Sender: TObject);
    procedure RaschVedBtnClick(Sender: TObject);
    procedure ClearSvodAccount;
    procedure dxBarButton1Click(Sender: TObject);
  private
    PDb_handle:TISC_DB_HANDLE;
    PCurrentKodSetup:integer;
    PKodSetup:integer;
    Id_Session:integer;
    PlanguageIndex:byte;
    function PrepareParameter(NeedIdSession:boolean=True):TSvodParam;
  public
    constructor Create(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TGrFOptionsSvod.Create(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE);
var Dmodule:TDM;
begin
 inherited Create(AOwner);
 PlanguageIndex:=LanguageIndex;
 //Caption := ZOptionsSvod_Caption[PlanguageIndex];
 LabelKodSetup.Caption := LabelPeriod_Caption[PlanguageIndex]+':';
 MonthesList.Items.Text := MonthesList_Text[PlanguageIndex];
 MonthesList.Caption := LabelMonth_Caption[PlanguageIndex];
 YearSpinEdit.Caption := LabelYear_Caption[PlanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[PlanguageIndex];
// SvodSub.Caption := Svods_Caption[PlanguageIndex];
// ReestrSub.Caption :=  Reestrs_Caption[PlanguageIndex];
// RaschVedBtn.Caption := RaschVed_Caption[PlanguageIndex];
// SvodBySchBtn.Caption := SvodBySch_Caption[PlanguageIndex];
// SvodByFOTSub.Caption := SvodByFot_Caption[PlanguageIndex];
// SvodByFOTFullBtn.Caption := Full_Const[PlanguageIndex];
// SvodByFOTShortBtn.Caption := Short_Const[PlanguageIndex];
// SvodByFODBtn.Caption := SvodByFod_Caption[PlanguageIndex];
// SvodByDepartmentBtn.Caption := SvodByDep_Caption[PlanguageIndex];
// SvodOtchislBtn.Caption := SvodOtchislen_Caption[PlanguageIndex];
// ReeHospListSub.Caption := ReestrHospLists_Caption[PlanguageIndex];
// ReeHospListByTnBtn.Caption := ReestrHospListsByTn_Caption[PlanguageIndex];
// ReeHospListByDepartmentBtn.Caption := ReestrHospListsByDep_Caption[PlanguageIndex];
// ReeDutyBtn.Caption := ReestrDuty_Caption[PlanguageIndex];
// ReeDopPlatBtn.Caption := ReestrDodPlat_Caption[PlanguageIndex];
// ReeStrahBtn.Caption := ReestrStrah_Caption[PlanguageIndex];
// ReeAlimonyBtn.Caption := ReestrAlimony_Caption[PlanguageIndex];
// ReeOtherUdBtn.Caption := ReestrOtherUd_Caption[PlanguageIndex];
// ReePFUBtn.Caption := ReestrPFU_Caption[PlanguageIndex];
// ReeMoreSumBtn.Caption := ReestrMoreSum_Caption[PlanguageIndex];
// ReeInvalidBtn.Caption := ReestrInvalid_Caption[PlanguageIndex];
// ReePererahBtn.Caption := ReestrPererah_Caption[PlanguageIndex];
// ReeCreditBtn.Caption := ReestrCredit_Caption[PlanguageIndex];

 PDb_handle:=ADb_Handle;
 Dmodule:=TDM.Create(Self);
 PCurrentKodSetup:=Dmodule.CurrentKodSetup(ADb_Handle);
 Dmodule.Free;
 PKodSetup:=0;
 Id_session:=-1;
 WindowState:=wsMaximized;
 YearSpinEdit.Value:=YearMonthFromKodSetup(PCurrentKodSetup);
 MonthesList.ItemIndex:= YearMonthFromKodSetup(PCurrentKodSetup,false)-1;
end;

procedure TGrFOptionsSvod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ClearSvodAccount;
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TGrFOptionsSvod.SvodBySchBtnClick(Sender: TObject);
//var param:TSvodBySchParam;
begin
{ param.FoundationParam :=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 param.Id_Sch := 1;
 PrintSvodSch(param);
}end;

function TGrFOptionsSvod.PrepareParameter(NeedIdSession:boolean=True):TSvodParam;
var Parameter:TSvodParam;
    DM:TDM;
begin
 Parameter.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.DB_Handle := PDb_handle;
 Parameter.AOwner := self;
 Parameter.ID_Session:=Id_Session;
 Parameter.Type_data:=tdAll;
 if (Parameter.Kod_setup<>PKodSetup) and (NeedIdSession) then
  begin
    ClearSvodAccount;
    DM:=TDM.Create(self);
    Id_Session:=dm.PrepareData(PDb_handle,Parameter.Kod_setup);
    DM.Free;
    Parameter.ID_Session:=Id_Session;
  end;

// if Id_Session=-1 then Exit;

 PKodSetup:=Parameter.Kod_setup;
 Result:=Parameter;
end;

procedure TGrFOptionsSvod.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TGrFOptionsSvod.SvodByFOTFullBtnClick(Sender: TObject);
var parameter:TSvodParam;
begin
{ parameter:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodFOT(Parameter);
}end;

procedure TGrFOptionsSvod.SvodByFOTShortBtnClick(Sender: TObject);
var parameter:TSvodParam;
begin
{ parameter:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodFOT(Parameter, False);
}end;

procedure TGrFOptionsSvod.SvodByDepartmentBtnClick(Sender: TObject);
var Parameter:TSvodParam;
begin
{ parameter:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 LoadDepartmentForSvod(Parameter);
}end;

procedure TGrFOptionsSvod.RaschVedBtnClick(Sender: TObject);
var Parameter:TZAccListParameter;
    Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 Parameter.AOwner:=Param.AOwner;
 Parameter.DB_Handle := Param.DB_Handle;
 Parameter.Kod_setup := Param.Kod_setup;
 Parameter.ID_Session := Param.ID_Session;
 Parameter.TypeData   := 2;

 PrintRaschList(Parameter);
end;

procedure TGrFOptionsSvod.ClearSvodAccount;
var DM:TStProcDM;
begin
if Id_Session<>-1 then
 begin
  DM:=TStProcDM.Create(Self);
  with DM do
   try
    DB.Handle := PDb_handle;
    Transaction.StartTransaction;
    StProc.StoredProcName:='Z_SVOD_PREPARE_DATA_DELETE';
    StProc.Prepare;
    StProc.ParamByName('ID_SESSION').AsInteger:=Id_Session;
    StProc.ExecProc;
    Transaction.Commit;
   except
    on E:Exception do
     begin
      grShowMessage(ECaption[PlanguageIndex],e.Message,mtError,[mbOK]);
      Transaction.Rollback;
     end;
   end;
  DM.Destroy;
 end;
end;

procedure TGrFOptionsSvod.dxBarButton1Click(Sender: TObject);
var param:TSvodBySchParam;
begin
 param.FoundationParam :=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 param.Id_Sch := null;
 PrintSvodSch(param);
end;

end.

