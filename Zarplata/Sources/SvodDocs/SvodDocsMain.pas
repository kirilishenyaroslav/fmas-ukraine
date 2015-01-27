unit SvodDocsMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTreeView, cxControls, cxGroupBox, IBase, cxEdit, cxRadioGroup,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, Unit_ZGlobal_Consts,
  cxClasses, SvodDocsDataModul, Dates, ZSvodLoaderUnit, ZSvodTypesUnit,
  ExtCtrls, dxBarExtItems, dxBar, ZProc, Z_StProc_DM, ZMessages,
  PackageLoad, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase;

type
  TFOptionsSvod = class(TForm)
    dxBarManager: TdxBarManager;
    dxBarDockControl1: TdxBarDockControl;
    YearSpinEdit: TdxBarSpinEdit;
    SvodSub: TdxBarSubItem;
    ReestrSub: TdxBarSubItem;
    RaschVedBtn: TdxBarButton;
    LabelKodSetup: TdxBarStatic;
    MonthesList: TdxBarCombo;
    SvodBySchBtn: TdxBarButton;
    SvodByFOTSub: TdxBarSubItem;
    SvodByFOTFullBtn: TdxBarButton;
    SvodByFOTShortBtn: TdxBarButton;
    SvodByDepartmentBtn: TdxBarButton;
    SvodByFODBtn: TdxBarButton;
    ReeHospListSub: TdxBarSubItem;
    ReeHospListByTnBtn: TdxBarButton;
    ReeHospListByDepartmentBtn: TdxBarButton;
    ReeDutyBtn: TdxBarButton;
    ReeDopPlatBtn: TdxBarButton;
    ReeStrahBtn: TdxBarButton;
    ReeAlimonyBtn: TdxBarButton;
    ReeOtherUdBtn: TdxBarButton;
    ReePFUBtn: TdxBarButton;
    ReeMoreSumBtn: TdxBarButton;
    ReeInvalidBtn: TdxBarButton;
    ReePererahBtn: TdxBarButton;
    ReeCreditBtn: TdxBarButton;
    ExitBtn: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    SvodOtchislBtn: TdxBarButton;
    dxBarButton1: TdxBarButton;
    SvodBySmBtn: TdxBarButton;
    ReeInvalidBtn2: TdxBarButton;
    dxBarButton2: TdxBarButton;
    RaschVedByShifrBtn: TdxBarButton;
    RaschVedShortBtn: TdxBarButton;
    SvodByGroupSmBtn: TdxBarButton;
    ReeAccrualSingle: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    ReeAccrualSingleForMan: TdxBarSubItem;
    ReeAccrualSingleForManAll: TdxBarButton;
    ReeAccrualSingleForManOwer: TdxBarButton;
    ReeAccrualSingleForManInvalid: TdxBarButton;
    SvodBySchBtnNP7: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    SvodP49Btn: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    ReeAccrualSingleBySch: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ReeNarLimit: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SvodBySchBtnClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure SvodByFOTFullBtnClick(Sender: TObject);
    procedure SvodByFOTShortBtnClick(Sender: TObject);
    procedure SvodByDepartmentBtnClick(Sender: TObject);
    procedure SvodByFODBtnClick(Sender: TObject);
    procedure RaschVedBtnClick(Sender: TObject);
    procedure ReeHospListByTnBtnClick(Sender: TObject);
    procedure ReeHospListByDepartmentBtnClick(Sender: TObject);
    procedure ReeDopPlatBtnClick(Sender: TObject);
    procedure ReeStrahBtnClick(Sender: TObject);
    procedure ReeAlimonyBtnClick(Sender: TObject);
    procedure ReeOtherUdBtnClick(Sender: TObject);
    procedure ReePFUBtnClick(Sender: TObject);
    procedure ReeMoreSumBtnClick(Sender: TObject);
    procedure ReeInvalidBtnClick(Sender: TObject);
    procedure ReePererahBtnClick(Sender: TObject);
    procedure ReeCreditBtnClick(Sender: TObject);
    procedure ReeDutyBtnClick(Sender: TObject);
    procedure SvodOtchislBtnClick(Sender: TObject);
    procedure ClearSvodAccount;
    procedure ClearSvodFond;
    procedure dxBarButton1Click(Sender: TObject);
    procedure SvodBySmBtnClick(Sender: TObject);
    procedure ReeInvalidBtn2Click(Sender: TObject);
    procedure RaschVedByShifrBtnClick(Sender: TObject);
    procedure RaschVedShortBtnClick(Sender: TObject);
    procedure SvodByGroupSmBtnClick(Sender: TObject);
    procedure ReeAccrualSingleClick(Sender: TObject);
    procedure ReeAccrualSingleForManAllClick(Sender: TObject);
    procedure ReeAccrualSingleForManInvalidClick(Sender: TObject);
    procedure ReeAccrualSingleForManOwerClick(Sender: TObject);
    procedure SvodBySchBtnNP7Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure SvodP49BtnClick(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure ReeAccrualSingleBySchClick(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure ReeNarLimitClick(Sender: TObject);
  private
    PDb_handle:TISC_DB_HANDLE;
    PCurrentKodSetup:integer;
    PKodSetup,PKodSetupFond:integer;
    Id_Session, id_session_fond:integer;
    PlanguageIndex:byte;
    function PrepareParameter(NeedIdSession:boolean=True):TSvodParam;
    function PrepareParameterFonds(NeedIdSession:boolean=True):TSvodParam;
  public
    constructor Create(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TFOptionsSvod.Create(AOwner: TComponent; ADb_Handle:TISC_DB_HANDLE);
var Dmodule:TDModule;
DB: TpFIBDatabase;
ReadTransaction: TpFIBTransaction;
StProc: TpFIBStoredProc;
NUM_PREDPR:Integer;
begin
 inherited Create(AOwner);
 PlanguageIndex:=LanguageIndex;
 Caption := ZOptionsSvod_Caption[PlanguageIndex];
 LabelKodSetup.Caption := LabelPeriod_Caption[PlanguageIndex]+':';
 MonthesList.Items.Text := MonthesList_Text[PlanguageIndex];
 MonthesList.Caption := LabelMonth_Caption[PlanguageIndex];
 YearSpinEdit.Caption := LabelYear_Caption[PlanguageIndex];
 ExitBtn.Caption := ExitBtn_Caption[PlanguageIndex];
 SvodSub.Caption := Svods_Docs_Caption[PlanguageIndex];
 ReestrSub.Caption :=  Reestrs_docs_Caption[PlanguageIndex];
 RaschVedBtn.Caption := RaschVed_Caption[PlanguageIndex];
 RaschVedShortBtn.Caption := 'Скорочена';
 SvodBySchBtn.Caption := SvodBySch_Caption[PlanguageIndex];
 SvodBySchBtnNP7.Caption := SvodBySchNP7_Caption[PlanguageIndex];
 SvodByFOTSub.Caption := SvodByFot_Caption[PlanguageIndex];
 SvodByFOTFullBtn.Caption := Full_Const[PlanguageIndex];
 SvodByFOTShortBtn.Caption := Short_Const[PlanguageIndex];
 SvodByFODBtn.Caption := SvodByFod_Caption[PlanguageIndex];
 SvodByDepartmentBtn.Caption := SvodByDep_Caption[PlanguageIndex];
 SvodOtchislBtn.Caption := SvodOtchislen_Caption[PlanguageIndex];
 ReeHospListSub.Caption := ReestrHospLists_docs_Caption[PlanguageIndex];
 ReeHospListByTnBtn.Caption := ReestrHospListsByTn_Caption[PlanguageIndex];
 ReeHospListByDepartmentBtn.Caption := ReestrHospListsByDep_Caption[PlanguageIndex];
 ReeDutyBtn.Caption := ReestrDuty_Caption[PlanguageIndex];
 ReeNarLimit.Caption := 'Реєстр про нарахування (ліміт)';
 ReeDopPlatBtn.Caption := ReestrDodPlat_Caption[PlanguageIndex];
 ReeStrahBtn.Caption := ReestrStrah_Caption[PlanguageIndex];
 ReeAlimonyBtn.Caption := ReestrAlimony_Caption[PlanguageIndex];
 ReeOtherUdBtn.Caption := ReestrOtherUd_Caption[PlanguageIndex];
 ReePFUBtn.Caption := ReestrPFU_Caption[PlanguageIndex];
 ReeMoreSumBtn.Caption := ReestrMoreSum_Caption[PlanguageIndex];
 ReeInvalidBtn.Caption := ReestrInvalid_Caption[PlanguageIndex];
 ReePererahBtn.Caption := ReestrPererah_Caption[PlanguageIndex];
 ReeCreditBtn.Caption := ReestrCredit_Caption[PlanguageIndex];
 ReeAccrualSingle.Caption := ReeAccrualSingle_Caption[PlanguageIndex];
 ReeAccrualSingleForMan.Caption:=ReeAccrualSingleForMan_Caption[PlanguageIndex];
 ReeAccrualSingleForManAll.Caption:=ReeAccrualSingleForManAll_Caption[PlanguageIndex];
 ReeAccrualSingleForManInvalid.Caption:=ReeAccrualSingleForManInvalid_Caption[PlanguageIndex];
 ReeAccrualSingleForManOwer.Caption:=ReeAccrualSingleForManOwer_Caption[PlanguageIndex];
 PDb_handle:=ADb_Handle;
 Dmodule:=TDModule.Create(Self);
 PCurrentKodSetup:=Dmodule.CurrentKodSetup(ADb_Handle);
 Dmodule.Free;
 PKodSetup:=0;
 PKodSetupFond :=0;
 Id_session:=-1;
 id_session_fond := -1;
 WindowState:=wsMaximized;
 YearSpinEdit.Value:=YearMonthFromKodSetup(PCurrentKodSetup);
 MonthesList.ItemIndex:= YearMonthFromKodSetup(PCurrentKodSetup,false)-1;
 DB:=TpFIBDatabase.Create(AOwner);
 DB.handle:=ADb_Handle;
 ReadTransaction:=TpFIBTransaction.Create(AOwner);
 ReadTransaction.DefaultDatabase:=DB;
 StProc:=TpFIBStoredProc.Create(AOwner);
 StProc.Transaction:=ReadTransaction;
 StProc.StoredProcName := 'Z_GET_NUM_PREDPR';
 StProc.Transaction.StartTransaction;
 StProc.Prepare;
 StProc.ExecProc;
 StProc.Transaction.Commit;
 NUM_PREDPR:=StProc.ParamByName('NUM_PREDPR').AsInteger;
 StProc.Free;
 ReadTransaction.Free;
 DB.Close;
 DB.Free;
 if NUM_PREDPR=8 then
 dxBarButton8.Visible:=ivAlways;
end;

procedure TFOptionsSvod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ClearSvodAccount;
ClearSvodFond;
if FormStyle=fsMDIChild then Action:=caFree;

end;

procedure TFOptionsSvod.SvodBySchBtnClick(Sender: TObject);
var param:TSvodBySchParam;
begin
 param.FoundationParam :=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 param.Id_Sch := 1;
 param. TypeForm:=tfsSimple;
 PrintSvodSch(param);
end;

function TFOptionsSvod.PrepareParameter(NeedIdSession:boolean=True):TSvodParam;
var Parameter:TSvodParam;
    DM:TDModule;
begin
 Parameter.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.DB_Handle := PDb_handle;
 Parameter.AOwner := self;
 Parameter.ID_Session:=Id_Session;
 Parameter.Type_data:=tdAll;
 if (Parameter.Kod_setup<>PKodSetup) and (NeedIdSession) then
  begin
    ClearSvodAccount;
    DM:=TDModule.Create(self);
    Id_Session:=dm.PrepareData(PDb_handle,Parameter.Kod_setup,Parameter.Type_data);
    DM.Free;
    Parameter.ID_Session:=Id_Session;
  end;

 PKodSetup:=Parameter.Kod_setup;
 Result:=Parameter;
end;


function TFOptionsSvod.PrepareParameterFonds(NeedIdSession:boolean=True):TSvodParam;
var Parameter:TSvodParam;
    DM:TDModule;
begin
 Parameter.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.DB_Handle := PDb_handle;
 Parameter.AOwner := self;
 Parameter.Type_data:=tdAll;
 Parameter.Id_Session_fond:=Id_Session_fond;
 if (Parameter.Kod_setup<>PKodSetupFond) and (NeedIdSession) then
  begin
    ClearSvodFond;
    DM:=TDModule.Create(self);
    Id_Session_fond:=dm.PrepareDataFonds(PDb_handle,Parameter.Kod_setup,Parameter.Type_data);
    DM.Free;
    Parameter.Id_Session_fond:=Id_Session_fond;
  end;

 PKodSetupFond:=Parameter.Kod_setup;
 Result:=Parameter;
end;

procedure TFOptionsSvod.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TFOptionsSvod.SvodByFOTFullBtnClick(Sender: TObject);
var parameter:TSvodParam;
begin
 parameter:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodFOT(Parameter);
end;

procedure TFOptionsSvod.SvodByFOTShortBtnClick(Sender: TObject);
var parameter:TSvodParam;
begin
 parameter:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodFOT(Parameter, False);
end;

procedure TFOptionsSvod.SvodByDepartmentBtnClick(Sender: TObject);
var Parameter:TSvodParam;
begin
 parameter:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 LoadDepartmentForSvod(Parameter);
end;

procedure TFOptionsSvod.SvodByFODBtnClick(Sender: TObject);
var Parameter:TSvodParam;
begin
 parameter:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodFOD(Parameter);
end;

procedure TFOptionsSvod.RaschVedBtnClick(Sender: TObject);
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
 Parameter.Id_Man:=-1;

 PrintRaschList(Parameter);
end;

procedure TFOptionsSvod.ReeHospListByTnBtnClick(Sender: TObject);
var Parameter:TReeHospParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.TypeReeHosp := trhByTn;
 PrintReeHosp(Parameter);
end;

procedure TFOptionsSvod.ReeHospListByDepartmentBtnClick(Sender: TObject);
var Parameter:TReeHospParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.TypeReeHosp := trhByDepartment;
 PrintReeHosp(Parameter);
end;

procedure TFOptionsSvod.ReeDopPlatBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam:=PrepareParameter(True);
 Parameter.TypeSimpleReestr:=tsrDopPlat;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeStrahBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam:=PrepareParameter(True);
 Parameter.TypeSimpleReestr:=tsrStrah;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeAlimonyBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrAlimony;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeOtherUdBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
// Parameter.SvodParam:=PrepareParameter(True);
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrOtherUd;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReePFUBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrPFU;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeMoreSumBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrSumMoreVidrah;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeInvalidBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam:=PrepareParameter(False);
 Parameter.TypeSimpleReestr:=tsrInvalid;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReePererahBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam:=PrepareParameter(False);
 Parameter.TypeSimpleReestr:=tsrPererah;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeCreditBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam:=PrepareParameter(True);
 Parameter.TypeSimpleReestr:=tsrCredit;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeDutyBtnClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrDuty;

 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.SvodOtchislBtnClick(Sender: TObject);
var Parameter:TSvodParam;
begin
 Parameter.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.DB_Handle := PDb_handle;
 Parameter.AOwner := self;
 Parameter.ID_Session:=Id_Session;
 Parameter.Type_data:=tdAll;
 PrintSvodOtchisl(Parameter);
end;

procedure TFOptionsSvod.ClearSvodAccount;
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
      ZShowMessage(Error_Caption[PlanguageIndex],E.Message,mtError,[mbOK]);
      Transaction.Rollback;
     end;
   end;
  DM.Free;;
 end;
end;

procedure TFOptionsSvod.ClearSvodFond;
var DM:TStProcDM;
begin
if Id_Session<>-1 then
 begin
  DM:=TStProcDM.Create(Self);
  with DM do
   try
    DB.Handle := PDb_handle;
    Transaction.StartTransaction;
    StProc.StoredProcName:='Z_REESTR_FOND_DATA_DELETE';
    StProc.Prepare;
    StProc.ParamByName('ID_SESSION').AsInteger:=Id_Session_fond;
    StProc.ExecProc;
    Transaction.Commit;
   except
    on E:Exception do
     begin
      ZShowMessage(Error_Caption[PlanguageIndex],E.Message,mtError,[mbOK]);
      Transaction.Rollback;
     end;
   end;
  DM.Free;
 end;
end;

procedure TFOptionsSvod.dxBarButton1Click(Sender: TObject);
var param:TSvodBySchParam;
begin
 param.FoundationParam :=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 param.Id_Sch := null;
 PrintSvodSch(param);
end;

procedure TFOptionsSvod.SvodBySmBtnClick(Sender: TObject);
var Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodGroupSm(Param);
end;

procedure TFOptionsSvod.ReeInvalidBtn2Click(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam:=PrepareParameter(False);
 Parameter.TypeSimpleReestr:=tsrInvalid2;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.RaschVedByShifrBtnClick(Sender: TObject);
var Parameter:TZAccListParameter;
    Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 Parameter.AOwner:=Param.AOwner;
 Parameter.DB_Handle := Param.DB_Handle;
 Parameter.Kod_setup := Param.Kod_setup;
 Parameter.ID_Session := Param.ID_Session;
 Parameter.TypeData   := 3;
 Parameter.Id_Man:=-1;

 PrintRaschList(Parameter);
end;

procedure TFOptionsSvod.RaschVedShortBtnClick(Sender: TObject);
var Parameter:TZAccListParameter;
    Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 Parameter.AOwner:=Param.AOwner;
 Parameter.DB_Handle := Param.DB_Handle;
 Parameter.Kod_setup := Param.Kod_setup;
 Parameter.ID_Session := Param.ID_Session;
 Parameter.TypeData   := 4;
 Parameter.Id_Man:=-1;

 PrintRaschListShort(Parameter);
end;

procedure TFOptionsSvod.SvodByGroupSmBtnClick(Sender: TObject);
var Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodGroupPr(Param);
end;

procedure TFOptionsSvod.ReeAccrualSingleClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrAccrualSingle;
 PrintSimpleReestr(Parameter);
end;



procedure TFOptionsSvod.ReeAccrualSingleForManAllClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrAccrualSingleForManAll;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeAccrualSingleForManInvalidClick(
  Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrAccrualSingleForInvalid;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeAccrualSingleForManOwerClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrAccrualSingleForManOwer;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.SvodBySchBtnNP7Click(Sender: TObject);
var param:TSvodBySchParam;
begin
 param.FoundationParam :=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 param.Id_Sch := 1;
 param. TypeForm:=tfsNP7;
 PrintSvodSch(param);
end;

procedure TFOptionsSvod.dxBarButton4Click(Sender: TObject);
var param:TSvodBySchParam;
begin
 param.FoundationParam :=PrepareParameter(True);
 param.FoundationParam.DB_Handle:=PDb_handle;
 if Id_Session=-1 then Exit;

 param. TypeForm:=tfsNP6;
 PrintSvodSch(param);
end;

procedure TFOptionsSvod.dxBarButton5Click(Sender: TObject);
var Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodSm(Param);
end;

procedure TFOptionsSvod.SvodP49BtnClick(Sender: TObject);
var Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 PrintSvodP49(Param);
end;

procedure TFOptionsSvod.dxBarButton6Click(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 Parameter.SvodParam:=PrepareParameter(true);
 Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrAlimony_budget;
 PrintSimpleReestr(Parameter);
end;

procedure TFOptionsSvod.ReeAccrualSingleBySchClick(Sender: TObject);
var param:TSvodBySchParam;
begin
 param.FoundationParam :=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 param.Id_Sch := 1;
 param. TypeForm:=tfsReeAccrualSingleBySch;

 param.FoundationParam :=PrepareParameterFonds(True);
 if id_session_fond=-1 then Exit;
 param.Id_Sch := 1;
 param. TypeForm:=tfsReeAccrualSingleBySch;
 PrintSvodSch(param);
end;

procedure TFOptionsSvod.dxBarButton8Click(Sender: TObject);
var Parameter:TZAccListParameter;
    Param:TSvodParam;
begin
 param:=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 Parameter.AOwner:=Param.AOwner;
 Parameter.DB_Handle := Param.DB_Handle;
 Parameter.Kod_setup := Param.Kod_setup;
 Parameter.ID_Session := Param.ID_Session;
 Parameter.TypeData   := 6;
 Parameter.Id_Man:=-1;

 PrintRaschListShort(Parameter);
end;

procedure TFOptionsSvod.dxBarLargeButton2Click(Sender: TObject);
var param:TSvodBySchSmParam;
begin
 param.FoundationParam :=PrepareParameter(True);
 if Id_Session=-1 then Exit;
 param.TypeForm:=tfsSimple;
 PrintSvodSchSm(param);
end;

procedure TFOptionsSvod.dxBarLargeButton1Click(Sender: TObject);
var Param:TSvodParam;
begin
Param:=PrepareParameter(True);
PrintSvodSm(Param);
end;

procedure TFOptionsSvod.ReeNarLimitClick(Sender: TObject);
var Parameter:TSimpleReestrParam;
begin
 {Parameter.SvodParam.Kod_setup:=PeriodToKodSetup(StrToInt(YearSpinEdit.Text),MonthesList.ItemIndex+1);
 Parameter.SvodParam.DB_Handle := PDb_handle;
 Parameter.SvodParam.AOwner := self;
 Parameter.SvodParam.ID_Session:=Id_Session;
 Parameter.SvodParam.Type_data:=tdAll;
 Parameter.TypeSimpleReestr:=tsrNarLimit;

 PrintSimpleReestr(Parameter);  }

  Parameter.SvodParam:=PrepareParameter(False);
  Parameter.TypeSimpleReestr:=tsrNarLimit;
  PrintSimpleReestr(Parameter);
end;

end.

