
unit uUpReportSvod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,uCommonSp,DB, FIBDatabase, pFIBDatabase,IBase, ComCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons,Gauges,pFIBStoredProc,
  FIBQuery, pFIBQuery, frxDesgn, frxClass, frxDBSet, frxExportXLS,
  FIBDataSet, pFIBDataSet, frxExportHTML, frxExportRTF, ActnList,
  cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCheckBox, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxControls, cxContainer, cxEdit, cxLabel, uUnivSprav, ExtCtrls,
  cxRadioGroup;

    type
    TUP_RegardsCommonReport = class(TSprav)
    public
        constructor Create;
        procedure Show; override;
        destructor Destroy;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

type
  TfmMain = class(TForm)
    StatusBar1: TStatusBar;
    cxButtonPrint: TcxButton;
    ActionList1: TActionList;
    FilterAction: TAction;
    PrintAction: TAction;
    DesAction: TAction;
    cxButtonClose: TcxButton;
    FontAction: TAction;
    ParamAction: TAction;
    PanelParam: TPanel;
    MonthesList: TcxComboBox;
    cxKodSm: TcxCheckBox;
    KodSmEdit: TcxButtonEdit;
    LabelDateForm: TcxLabel;
    WorkDay: TcxMaskEdit;
    MonthesList1: TcxComboBox;
    SetkaButton: TcxButton;
    SetkaAction: TAction;
    GroupBox1: TGroupBox;
    RadioMonthesList: TcxRadioButton;
    RadioMonthesList1: TcxRadioButton;
    PrevButton: TcxButton;
    PreviewAct: TAction;
    Constructor Create(aOwner : TComponent;HandleDb:Integer); reintroduce;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure cxKodSmClick(Sender: TObject);
    procedure KodSmEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure SetkaActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioMonthesList1Enter(Sender: TObject);
    procedure RadioMonthesListEnter(Sender: TObject);
    procedure PreviewActExecute(Sender: TObject);
    procedure print(prev:boolean);
    procedure MonthesListPropertiesChange(Sender: TObject);
    procedure MonthesList1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    PKodSm:integer;
  public
    { Public declarations }
    //function  IfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant; overload;
    //function YearMonthFromKodSetup(KodSetup:integer;IsYear:boolean=True):integer;
  end;
    ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TGauge;
      pos:Integer;
      ID_SESSION:Variant;
      ReportParam:Variant;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;RepParam:Variant);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
    end;

{const MonthesList_Text:string =('Січень'+#13+'Лютий'+#13+'Березень'+#13+
                             'Квітень'+#13+'Травень'+#13+'Червень'+#13+
                             'Липень'+#13+'Серпень'+#13+'Вересень'+#13+
                             'Жовтень'+#13+'Листопад'+#13+'Грудень');}
   const
      YearBeg=1995;
      MonthBeg=1;
var
  fmMain: TfmMain;
  id_sp_report,id_session:Int64;
  IsDesign:Boolean;
  report:ReportTHerited;
  PFontNames:string;
  PFontSizes:integer;
  PFontColors:TColor;
  PFontStyles:TFontStyles;
  Kod_Setup1:integer;
  PN_Setka_Base:Integer;
  Zvit:array[1..9] of integer;
  ZvitReal:array[1..4] of integer;
  RachNach:integer;
  MonthesList_Text:array[1..12] of string=('Січень','Лютий','Березень','Квітень','Травень','Червень',
                                 'Липень','Серпень','Вересень','Жовтень','Листопад','Грудень');


implementation

uses GlobalSPR,dmReportSvod, RxMemDS,uUpSetkaSvod, BaseTypes,NagScreenUnit, uUpPreviewSvod;

{$R *.dfm}

Constructor ReportTHerited.Create(InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;
                          prog:TGauge;ID_TRAN:Variant;RepParam:Variant);
begin
{  inherited Create(False);
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  bar:=prog;
  ID_SESSION:=ID_TRAN;
  ReportParam:=RepParam;
 }
end;


destructor TUP_RegardsCommonReport.Destroy;
begin
    inherited Destroy;
end;


procedure ReportTHerited.Execute;
begin
end;

procedure ReportTHerited.UpdateBar;
begin

end;


destructor ReportTHerited.Destroy;
begin
end;

function CreateSprav: TSprav;stdcall;
begin
    Result := TUP_RegardsCommonReport.Create;
end;

constructor TUP_RegardsCommonReport.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('id_session', ftVariant);
    Input.FieldDefs.Add('id_sp_report', ftVariant);
    Input.FieldDefs.Add('DesignReport', ftBoolean);

    PrepareMemoryDatasets;
end;

procedure TUP_RegardsCommonReport.Show;
var
    hnd: Integer;
    Print: TfmMain;
begin
    hnd := Input['DBHandle'];
    id_sp_report := Input['id_sp_report'];
    IsDesign := Input['DesignReport'];

    PFontNames:='Times New Roman';
    PFontSizes:=10;
    PFontColors:=clDefault;

    DM := TDM.Create(nil);
    DM.DB.Handle := TISC_DB_HANDLE(hnd);
    Print:=TfmMain.Create(Application.MainForm,hnd);
    Print.ShowModal;
    Print.Free;
    Dm.Free;
end;

function IfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant; overload;
begin
 if AValue then
  IfThen:=ATrue
 else
  IfThen:=AFalse;
end;


function YearMonthFromKodSetup(KodSetup:integer;IsYear:boolean=True):integer;
var TYear,TMonth:integer;
begin
 TYear  := (KodSetup - MonthBeg + 1) div 12;
 TMonth := MonthBeg + KodSetup - TYear * 12 - 1;
 if (TMonth mod 12 = 0) then
  begin
   TYear  := TYear + YearBeg + TMonth div 12 - 1;
   TMonth := 12;
  end
 else
  begin
   TYear  := TYear + YearBeg + TMonth div 12;
   TMonth := TMonth mod 12;
  end;
 YearMonthFromKodSetup:=IfThen(IsYear,TYear,TMonth);
end;

function CurrentKodSetup:integer;
var UpdateSP:TpFIBStoredProc;
    res:integer;
begin
    Res:=0;
    UpdateSP:=TpFibStoredProc.Create(fmMain);
    UpdateSP.Database    :=DM.DB;
    UpdateSP.Transaction :=DM.WriteTransaction;
    try
      dm.WriteTransaction.StartTransaction;
      UpdateSP.StoredProcName:='Z_KOD_SETUP_RETURN';
      UpdateSP.Prepare;
      UpdateSP.ExecProc;
      Res := UpdateSP.ParamByName('KOD_SETUP').AsInteger;
      UpdateSP.Close;
      UpdateSP.Free;
      Dm.WriteTransaction.Commit;
    except
    on E:exception do
    begin
        agMessageDlg('Помилка!', e.Message, mtError, [mbOk]);
        Dm.WriteTransaction.Rollback;
    end;
   end;
   Result:=res;
end;

constructor TfmMain.Create(aOwner : TComponent;HandleDb:Integer);
begin
    inherited Create(aOwner);
    Dm.DSet.SelectSQL.Text:='select distinct NAME_REPORT from UP_DT_REPORT_SP_REPORT Where ID_SP_REPORT='+IntToStr(id_sp_report)+'';
    Dm.DSet.Active:=True;
    self.Caption:=Dm.DSet.FieldValues['NAME_REPORT'];
    Dm.DSet.Active:=False;
    //получаем идентификатор транзакции
    Dm.WriteTransaction.StartTransaction;
    Dm.StoredProc.StoredProcName:='UP_DT_REPORT_SESSION';
    Dm.StoredProc.Prepare;
    try
        Dm.StoredProc.ExecProc;
        except
        begin
            Dm.WriteTransaction.Rollback;
            Exit;
        end;                                  
    end;
    ID_SESSION:= Dm.StoredProc.FieldByName('OUT_ID_REPORT_SESSION').AsVariant;

    Dm.WriteTransaction.Commit;
    With Dm Do
    Begin
        DSet.SQLs.SelectSQL.Text := 'SELECT CURRENT_DEPARTMENT, FIRM_NAME FROM INI_ASUP_CONSTS';
        BaseDataSet.SQLs.SelectSQL.Text := 'SELECT N_SETKA, WEEK_5DAY FROM UP_SVOD_BASE WHERE ID=1';
        DSet.Open;
        BaseDataSet.Open;
    End;
      WorkDay.Text:=Dm.BaseDataSet.FieldValues['WEEK_5DAY'];
      PN_Setka_Base:= dm.BaseDataSet.FieldValues['N_SETKA'];
      Kod_Setup1:= CurrentKodSetup-1;
      // EditDepartment.Text:= Dm.DSet.FieldValues['FIRM_NAME'];
      // PId_Depratment:=Dm.DSet.FieldValues['CURRENT_DEPARTMENT'];
      // DateEdit.Date := Date;

       // убираем возможность выбора смет - изменение от 22/09/09
      cxKodSm.Visible := False;
      KodSmEdit.Visible := False;
      PanelParam.Height := PanelParam.Height - KodSmEdit.Height;


end;

procedure TfmMain.cxButtonCloseClick(Sender: TObject);
begin
    Close;
end;

function PeriodToKodSetup(Year:integer;Month:integer):integer;
begin
 PeriodToKOdSetup := (Year - YearBeg) * 12 + (Month - MonthBeg + 1);
end;

procedure TfmMain.PrintActionExecute(Sender: TObject);
begin
   print(false);
end;

procedure TfmMain.cxKodSmClick(Sender: TObject);
begin
    KodSmEdit.Enabled:=cxKodSm.Checked;
end;

procedure TfmMain.KodSmEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Smeta:Variant;
begin
    Smeta:=GetSmets(self,DM.DB.Handle,Date,psmSmet);
    if VarArrayDimCount(Smeta)> 0 then
    If Smeta[0]<>NULL then
    begin
        KodSmEdit.Text := Smeta[2];
        PKodSm := Smeta[0];
        KodSmEdit.Text := Smeta[2];
    end;
end;

procedure TfmMain.SetkaActionExecute(Sender: TObject);
var //UpdateSP:TpFIBStoredProc;
    frm : TdmSetka;
begin
    frm := TdmSetka.Create(Self,PN_Setka_Base);
    if frm.ShowModal=mrOk
    then
    begin
       PN_Setka_Base:=frm.N_SETKA_LIST;
       { try
        UpdateSP:=TpFibStoredProc.Create(self);
        UpdateSP.Database    :=DM.DB;
        UpdateSP.Transaction :=DM.WriteTransaction;
        dm.WriteTransaction.StartTransaction;
        UpdateSP.StoredProcName:='UP_SVOD_BASE_UPD';
        UpdateSP.Prepare;
        UpdateSP.ParamByName('N_SETKA').AsInt64 :=frm.N_SETKA_LIST;
        UpdateSP.ExecProc;
        UpdateSP.Close;
        UpdateSP.Free;
        dm.WriteTransaction.Commit;
        except
        on E: Exception
        do agMessageDlg('Увага', 'Данні не будуть збережені! Звіт заблоковано!', mtInformation, [mbOk])
        end;    }
     end;
     frm.Free;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var str:string; i:integer;
begin
   //ShowMessage(IntToStr(Kod_Setup1));
   //ShowMessage(IntToStr(YearMonthFromKodSetup(Kod_Setup1,False)));
   str:='';
   for i:=1 to YearMonthFromKodSetup(Kod_Setup1,False) do
   str:=str+MonthesList_Text[i]+#13;
   MonthesList.Properties.Items.Text     := str;
   MonthesList1.Properties.Items.Text    := str;
   MonthesList.Enabled:=True;
   MonthesList1.Enabled:=False;
   MonthesList.ItemIndex := YearMonthFromKodSetup(Kod_Setup1,False)-1;
   MonthesList1.ItemIndex :=YearMonthFromKodSetup(Kod_Setup1,False)-1;
end;

procedure TfmMain.RadioMonthesList1Enter(Sender: TObject);
begin
   MonthesList.Enabled:=False;
   MonthesList1.Enabled:=True;
   if (MonthesList1.ItemIndex <> (YearMonthFromKodSetup(Kod_Setup1,False)-1))
   then cxButtonPrint.Enabled := False
   else cxButtonPrint.Enabled := True;
end;

procedure TfmMain.RadioMonthesListEnter(Sender: TObject);
begin
   MonthesList.Enabled:=True;
   MonthesList1.Enabled:=False;
   if (MonthesList.ItemIndex <> (YearMonthFromKodSetup(Kod_Setup1,False)-1))
   then cxButtonPrint.Enabled := False
   else cxButtonPrint.Enabled := True;
end;

procedure TfmMain.PreviewActExecute(Sender: TObject);
var frm : TfmPrev;
begin
    frm := TfmPrev.Create(Self);
    if frm.ShowModal=mrOk
    then
    begin
        with frm do
        begin
            if cbFund.Checked then Zvit[1]:=1 else Zvit[1]:=0;
            if cbZpCat.Checked then Zvit[2]:=1 else Zvit[2]:=0;
            if cbHol.Checked then Zvit[3]:=1 else Zvit[3]:=0;
            if cbPodNal.Checked then Zvit[4]:=1 else Zvit[4]:=0;
            if cbProgul.Checked then Zvit[5]:=1 else Zvit[5]:=0;
            if cbChPersCat.Checked then Zvit[6]:=1 else Zvit[6]:=0;
            if cbWorkTime.Checked then Zvit[7]:=1 else Zvit[7]:=0;
            if cbPersZp.Checked then Zvit[8]:=1 else Zvit[8]:=0;
            if cbCertificate.Checked then Zvit[9]:=1 else Zvit[9]:=0;

            if cbProgulReal.Checked then ZvitReal[1]:=1 else ZvitReal[1]:=0;
            if cbChPersCatReal.Checked then ZvitReal[2]:=1 else ZvitReal[2]:=0;
            if cbWorkTimeReal.Checked then ZvitReal[3]:=1 else ZvitReal[3]:=0;
            if cbCertificateReal.Checked then ZvitReal[4]:=1 else ZvitReal[4]:=0;

            if cbRachNach.Checked then RachNach:=1 else RachNach:=0;
        end;
         Print(true);
     end;
     frm.Free;
end;

procedure TfmMain.print(prev: boolean);
var
    ReportOptions:Variant;
    NameReport:TpFIBDataSet;
   // m : TfrxMasterData;
    InsertSP,UpdateSP:TpFIBStoredProc;
    {kod_set,} period, mon_list:Integer;
    NagScreen     : TNagScreen;
begin
    mon_list:=1;
    NagScreen     := TNagScreen.Create(Application.MainForm);
    NagScreen.Show;
    NagScreen.SetStatusText('Чекайте! Йде обробка даних для звіту');
    period:=1;
    if RadioMonthesList.Checked then
    begin
        period:=1;
        mon_list:=MonthesList.ItemIndex+1;

        //kod_set:=PeriodToKodSetup(YearMonthFromKodSetup(Kod_Setup1),MonthesList.ItemIndex+1);
    end;
    if RadioMonthesList1.Checked then
    begin
         period :=0;
         mon_list:=MonthesList1.ItemIndex+1;
         //kod_set:=PeriodToKodSetup(YearMonthFromKodSetup(Kod_Setup1),MonthesList1.ItemIndex+1);
    end;

    try
    UpdateSP:=TpFibStoredProc.Create(self);
    UpdateSP.Database    :=DM.DB;
    UpdateSP.Transaction :=DM.WriteTransaction;
    dm.WriteTransaction.StartTransaction;
    UpdateSP.StoredProcName:='UP_SVOD_BASE_UPD';
    UpdateSP.Prepare;
    UpdateSP.ParamByName('N_SETKA').AsInt64 :=PN_Setka_Base;
    UpdateSP.ParamByName('Week_5day').AsInt64 :=StrToInt(WorkDay.Text);
    UpdateSP.ExecProc;
    dm.WriteTransaction.Commit;
    UpdateSP.Close;
    UpdateSP.Free;

    except
    on E: Exception
    do agMessageDlg('Увага', 'Данні не будуть збережені! Звіт заблоковано!', mtInformation, [mbOk])
    end;

    if not prev then
    begin
        InsertSP:=TpFibStoredProc.Create(self);
        InsertSP.Database    :=DM.DB;
        InsertSP.Transaction :=DM.WriteTransaction;

        dm.WriteTransaction.StartTransaction;
        InsertSP.StoredProcName:='UP_DT_REPORT_SVOD_INS';
        InsertSP.Prepare;
        InsertSP.ParamByName('CUR_MONTH').AsInteger  := mon_list;
        if not cxKodSm.Checked then
        InsertSP.ParamByName('KOD_SMET').Value      :=Null
        else
        InsertSP.ParamByName('KOD_SMET').Value      :=PKodSm;
        InsertSP.ExecProc;
        dm.WriteTransaction.Commit;
        InsertSP.Close;
        InsertSP.Free;
    end;

    NameReport:=TpFIBDataSet.Create(Self);
    NameReport.Database:=Dm.DB;
    NameReport.Transaction:=Dm.ReadTransaction;
    NameReport.SelectSQL.Text:='select R.name_fr3 from up_dt_report_sp_report R where R.id_sp_report=:id_sp_report';
    NameReport.ParamByName('id_sp_report').AsInt64:=id_sp_report;
    NameReport.Active:=true;

    ReportOptions:=VarArrayCreate([0,1],varVariant);
    ReportOptions[0]:=VarArrayOf([NameReport.FieldByName('name_fr3').AsString]);
    ReportOptions[1]:=VarArrayOf([IsDesign]);
    with Dm do
    begin
        MainDataSet.Active:=False;
        MainDataSet.SQLs.SelectSQL.Text :='SELECT distinct * FROM UP_SVOD_MAIN_DATA ('+inttostr(mon_list)+','+inttostr(period)+')';

        DsUPSVODFUNDSZP.Active:=False;
        DsUPSVODFUNDSZP.SQLs.SelectSQL.Text :='SELECT * FROM UP_SVOD_FUNDS_ZP_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODFUNDSUD.Active:=False;
        DsUPSVODFUNDSUD.SQLs.SelectSQL.Text :='SELECT * FROM UP_SVOD_FUNDS_ZP_UD_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODFUNDSONCAT.Active:=False;
        DsUPSVODFUNDSONCAT.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_FUNDS_ON_CAT_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODSUMOTPUSK.Active:=False;
        DsUPSVODSUMOTPUSK.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_SUM_OTPUSK_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODPODOHODNALOG.Active:=False;
        DsUPSVODPODOHODNALOG.SQLs.SelectSQL.Text :='SELECT * FROM UP_SVOD_PODOHOD_NALOG_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODCHISLPERSS.Active:=False;
        DsUPSVODCHISLPERSS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_CHISL_PERS_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        {DsUPSVODCHISLPERSR.Active:=False;
        DsUPSVODCHISLPERSR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_CHISL_PERS_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
        }
        DsUPSVODALLSOTRUDS.Active:=False;
        DsUPSVODALLSOTRUDS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_ALL_SOTRUD_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        {DsUPSVODALLSOTRUDR.Active:=False;
        DsUPSVODALLSOTRUDR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_ALL_SOTRUD_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
        }
        DsUPSVODCHISLPERSONCATS.Active:=False;
        DsUPSVODCHISLPERSONCATS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_CHISL_PERS_ON_CAT_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        {DsUPSVODCHISLPERSONCATR.Active:=False;
        DsUPSVODCHISLPERSONCATR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_CHISL_PERS_ON_CAT_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
        }
        DsUPSVODFUNDWTS.Active:=False;
        DsUPSVODFUNDWTS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_FUND_WT_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        {DsUPSVODFUNDWTR.Active:=False;
        DsUPSVODFUNDWTR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_FUND_WT_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
        }
        DsUPSVODWORKERZP.Active:=False;
        DsUPSVODWORKERZP.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_WORKER_ZP_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODONWORKERSS.Active:=False;
        DsUPSVODONWORKERSS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_ON_WORKERS_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        {DsUPSVODONWORKERSR.Active:=False;
        DsUPSVODONWORKERSR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_ON_WORKERS_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
        }
        DsUPSVODONWORKEXT.Active:=False;
        DsUPSVODONWORKEXT.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_ON_WORK_EXT_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODWORKERSOVM.Active:=False;
        DsUPSVODWORKERSOVM.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_WORKER_SOVM_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODEXTSOVMS.Active:=False;
        DsUPSVODEXTSOVMS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_EXT_SOVM_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        {DsUPSVODEXTSOVMR.Active:=False;
        DsUPSVODEXTSOVMR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_EXT_SOVM_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
        }
        DsUPSVODPROGULS.Active:=False;
        DsUPSVODPROGULS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_PROGUL_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';;

        {DsUPSVODPROGULR.Active:=False;
        DsUPSVODPROGULR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_PROGUL_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
         }
        DsUPSVODRASHNACH.Active:=False;
        DsUPSVODRASHNACH.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_RASH_NACH_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODRASHPPS.Active:=False;
        DsUPSVODRASHPPS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_RASH_PPS_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODRASHPOCH.Active:=False;
        DsUPSVODRASHPOCH.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_RASH_POCH_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODRASHNEO.Active:=False;
        DsUPSVODRASHNEO.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_RASH_NEO_Z ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODWORKREASON.Active:=False;
        DsUPSVODWORKREASON.SQLs.SelectSQL.Text :='SELECT * FROM ASUP_INI_WORK_REASON';

        {DsUPSVODFUNDALLR.Active:=False;
        DsUPSVODFUNDALLR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_FUND_WT_ALL_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
         }
        DsUPSVODFUNDALLS.Active:=False;
        DsUPSVODFUNDALLS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_FUND_WT_ALL_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';


        DsUPSVODFUNDWTS.Active:=False;
        DsUPSVODFUNDWTS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_FUND_WT_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';

        DsUPSVODCHISLDISMISS.Active:=False;
        DsUPSVODCHISLDISMISS.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_CHISL_DISMISS_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';;

        DsUPSVODCHISLACCEPT.Active:=False;
        DsUPSVODCHISLACCEPT.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_CHISL_ACCEPT_S ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';;

        {DsUPSVODFUNDWTALLR.Active:=False;
        DsUPSVODFUNDWTALLR.SQLs.SelectSQL.Text :='SELECT  * FROM UP_SVOD_FUND_WT_R ('+inttostr(mon_list)+','+inttostr(period)+',:KOD_SMET,:IS_PRINT)';
            }
        try
            if not cxKodSm.Checked then
            DsUPSVODFUNDSZP.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODFUNDSZP.ParamByName('KOD_SMET').Value      :=PKodSm;
            if not cxKodSm.Checked then
            DsUPSVODFUNDSONCAT.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODFUNDSONCAT.ParamByName('KOD_SMET').Value      :=PKodSm;
            if not cxKodSm.Checked then
            DsUPSVODSUMOTPUSK.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODSUMOTPUSK.ParamByName('KOD_SMET').Value      :=PKodSm;
            if not cxKodSm.Checked then
            DsUPSVODPODOHODNALOG.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODPODOHODNALOG.ParamByName('KOD_SMET').Value      :=PKodSm;
            if not cxKodSm.Checked then
            DsUPSVODCHISLPERSS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODCHISLPERSS.ParamByName('KOD_SMET').Value      :=PKodSm;
            {if not cxKodSm.Checked then
            DsUPSVODCHISLPERSR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODCHISLPERSR.ParamByName('KOD_SMET').Value      :=PKodSm;}
            if not cxKodSm.Checked then
            DsUPSVODALLSOTRUDS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODALLSOTRUDS.ParamByName('KOD_SMET').Value      :=PKodSm;
            {if not cxKodSm.Checked then
            DsUPSVODALLSOTRUDR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODALLSOTRUDR.ParamByName('KOD_SMET').Value      :=PKodSm; }
            if not cxKodSm.Checked then
            DsUPSVODCHISLPERSONCATS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODCHISLPERSONCATS.ParamByName('KOD_SMET').Value      :=PKodSm;
            {if not cxKodSm.Checked then
            DsUPSVODCHISLPERSONCATR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODCHISLPERSONCATR.ParamByName('KOD_SMET').Value      :=PKodSm;}
            if not cxKodSm.Checked then
            DsUPSVODFUNDWTS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODFUNDWTS.ParamByName('KOD_SMET').Value      :=PKodSm;
            {if not cxKodSm.Checked then
            DsUPSVODFUNDWTR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODFUNDWTR.ParamByName('KOD_SMET').Value      :=PKodSm;}

            {if not cxKodSm.Checked then
            DsUPSVODFUNDALLR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODFUNDALLR.ParamByName('KOD_SMET').Value      :=PKodSm; }

            if not cxKodSm.Checked then
            DsUPSVODFUNDALLS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODFUNDALLS.ParamByName('KOD_SMET').Value      :=PKodSm;

            if not cxKodSm.Checked then
            DsUPSVODWORKERZP.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODWORKERZP.ParamByName('KOD_SMET').Value      :=PKodSm;
            if not cxKodSm.Checked then
            DsUPSVODONWORKERSS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODONWORKERSS.ParamByName('KOD_SMET').Value      :=PKodSm;
            {if not cxKodSm.Checked then
            DsUPSVODONWORKERSR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODONWORKERSR.ParamByName('KOD_SMET').Value      :=PKodSm; }
            if not cxKodSm.Checked then
            DsUPSVODONWORKEXT.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODONWORKEXT.ParamByName('KOD_SMET').Value      :=PKodSm;
            if not cxKodSm.Checked then
            DsUPSVODWORKERSOVM.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODWORKERSOVM.ParamByName('KOD_SMET').Value      :=PKodSm;
            if not cxKodSm.Checked then
            DsUPSVODEXTSOVMS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODEXTSOVMS.ParamByName('KOD_SMET').Value      :=PKodSm;
            {if not cxKodSm.Checked then
            DsUPSVODEXTSOVMR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODEXTSOVMR.ParamByName('KOD_SMET').Value      :=PKodSm;}
            if not cxKodSm.Checked then
            DsUPSVODPROGULS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODPROGULS.ParamByName('KOD_SMET').Value      :=PKodSm;
            {if not cxKodSm.Checked then
            DsUPSVODPROGULR.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODPROGULR.ParamByName('KOD_SMET').Value      :=PKodSm;}
            if not cxKodSm.Checked then
            DsUPSVODRASHNACH.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODRASHNACH.ParamByName('KOD_SMET').Value      :=PKodSm;

            if not cxKodSm.Checked then
            DsUPSVODRASHNEO.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODRASHNEO.ParamByName('KOD_SMET').Value      :=PKodSm;

            if not cxKodSm.Checked then
            DsUPSVODFUNDSUD.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODFUNDSUD.ParamByName('KOD_SMET').Value      :=PKodSm;

            if not cxKodSm.Checked then
            DsUPSVODRASHPPS.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODRASHPPS.ParamByName('KOD_SMET').Value      :=PKodSm;

            if not cxKodSm.Checked then
            DsUPSVODRASHPOCH.ParamByName('KOD_SMET').Value      :=Null
            else
            DsUPSVODRASHPOCH.ParamByName('KOD_SMET').Value      :=PKodSm;

            if not cxKodSm.Checked then
            DsUPSVODCHISLDISMISS.ParamByName('KOD_SMET').Value  :=Null
            else
            DsUPSVODCHISLDISMISS.ParamByName('KOD_SMET').Value  :=PKodSm;

            if not cxKodSm.Checked then
            DsUPSVODCHISLACCEPT.ParamByName('KOD_SMET').Value  :=Null
            else
            DsUPSVODCHISLACCEPT.ParamByName('KOD_SMET').Value  :=PKodSm;

            {IS_PRINT}
            {
            if (prev and (Zvit[1]=1)) then
            DsUPSVODFUNDSZP.Active:=True;

            if (prev and (Zvit[2]=1)) then
            DsUPSVODFUNDSONCAT.Active:=True;

            if (prev and (Zvit[3]=1)) then
            DsUPSVODSUMOTPUSK.Active:=True;

            if (prev and (Zvit[4]=1)) then
            DsUPSVODPODOHODNALOG.Active:=True;

            if (prev and (Zvit[5]=1)) then
            begin
                DsUPSVODPROGULS.Active:=True;
                DsUPSVODCHISLPERSS.Active:=True;
                DsUPSVODALLSOTRUDS.Active:=True;

            end;

            if (prev and (ZvitReal[1]=1)) then
            begin
                DsUPSVODPROGULR.Active:=True;
                DsUPSVODCHISLPERSR.Active:=True;
                DsUPSVODALLSOTRUDR.Active:=True;
            end;

            if (prev and (Zvit[6]=1)) then
            DsUPSVODCHISLPERSONCATS.Active:=True;

            if (prev and (ZvitReal[2]=1)) then
            DsUPSVODCHISLPERSONCATR.Active:=True;

            if (prev and (Zvit[7]=1)) then
            DsUPSVODFUNDWTS.Active:=True;

            if (prev and (ZvitReal[3]=1)) then
            DsUPSVODFUNDWTR.Active:=True;
            
            if (prev and (Zvit[8]=1)) then
            begin
                DsUPSVODWORKERZP.Active:=True;
                DsUPSVODONWORKERSS.Active:=True;
                DsUPSVODONWORKERSR.Active:=True;
            end;

            if (prev and (Zvit[9]=1)) then
            begin
                DsUPSVODONWORKEXT.Active:=True;
                DsUPSVODWORKERSOVM.Active:=True;
                DsUPSVODEXTSOVMS.Active:=True;
            end;

            if (prev and (ZvitReal[4]=1)) then
            DsUPSVODEXTSOVMR.Active:=True;

            if (prev and (RachNach=1)) then
            DsUPSVODRASHNACH.Active:=True;   }

            if (prev and (Zvit[1]=0)) then
            begin
                DsUPSVODFUNDSZP.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODFUNDSUD.ParamByName('IS_PRINT').Value      :=0;
            end
            else
            begin
                DsUPSVODFUNDSZP.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODFUNDSUD.ParamByName('IS_PRINT').Value      :=1;
            end;

            if (prev and (Zvit[2]=0)) then
            DsUPSVODFUNDSONCAT.ParamByName('IS_PRINT').Value    :=0
            else
            DsUPSVODFUNDSONCAT.ParamByName('IS_PRINT').Value    :=1;

            if (prev and (Zvit[3]=0)) then
            DsUPSVODSUMOTPUSK.ParamByName('IS_PRINT').Value      :=0
            else
            DsUPSVODSUMOTPUSK.ParamByName('IS_PRINT').Value      :=1;

            if (prev and (Zvit[4]=0)) then
            DsUPSVODPODOHODNALOG.ParamByName('IS_PRINT').Value   :=0
            else
            DsUPSVODPODOHODNALOG.ParamByName('IS_PRINT').Value   :=1;

            if (prev and (Zvit[5]=0)) then
            begin
                DsUPSVODPROGULS.ParamByName('IS_PRINT').Value         :=0;
                DsUPSVODCHISLPERSS.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODALLSOTRUDS.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODCHISLDISMISS.ParamByName('IS_PRINT').Value    :=0;
                DsUPSVODCHISLACCEPT.ParamByName('IS_PRINT').Value     :=0;
            end
            else
            begin
                DsUPSVODPROGULS.ParamByName('IS_PRINT').Value         :=1;
                DsUPSVODCHISLPERSS.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODALLSOTRUDS.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODCHISLDISMISS.ParamByName('IS_PRINT').Value    :=1;
                DsUPSVODCHISLACCEPT.ParamByName('IS_PRINT').Value     :=1;
            end;

            {if (prev and (ZvitReal[1]=0)) then
            begin
                DsUPSVODPROGULR.ParamByName('IS_PRINT').Value         :=0;
                DsUPSVODCHISLPERSR.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODALLSOTRUDR.ParamByName('IS_PRINT').Value      :=0
            end
            else
            begin
                DsUPSVODPROGULR.ParamByName('IS_PRINT').Value         :=1;
                DsUPSVODCHISLPERSR.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODALLSOTRUDR.ParamByName('IS_PRINT').Value      :=1;
            end;  }

            if (prev and (Zvit[6]=0)) then
            DsUPSVODCHISLPERSONCATS.ParamByName('IS_PRINT').Value      :=0
            else
            DsUPSVODCHISLPERSONCATS.ParamByName('IS_PRINT').Value      :=1;

           { if (prev and (ZvitReal[2]=0)) then
            DsUPSVODCHISLPERSONCATR.ParamByName('IS_PRINT').Value      :=0
            else
            DsUPSVODCHISLPERSONCATR.ParamByName('IS_PRINT').Value      :=1;
               }
            if (prev and (Zvit[7]=0)) then
            begin
            DsUPSVODFUNDWTS.ParamByName('IS_PRINT').Value      :=0;
            //DsUPSVODFUNDWTALLS.ParamByName('IS_PRINT').Value      :=0;
           // DsUPSVODFUNDWTALLR.ParamByName('IS_PRINT').Value      :=0;
            end
            else
            begin
            DsUPSVODFUNDWTS.ParamByName('IS_PRINT').Value      :=1;
            //DsUPSVODFUNDWTALLS.ParamByName('IS_PRINT').Value      :=1;
           // DsUPSVODFUNDWTALLR.ParamByName('IS_PRINT').Value      :=1;
            end;

            {if (prev and (ZvitReal[3]=0)) then
            DsUPSVODFUNDWTR.ParamByName('IS_PRINT').Value      :=0
            else
            DsUPSVODFUNDWTR.ParamByName('IS_PRINT').Value      :=1;
            }
            {if (prev and (ZvitReal[3]=0)) then
            DsUPSVODFUNDALLR.ParamByName('IS_PRINT').Value      :=0
            else
            DsUPSVODFUNDALLR.ParamByName('IS_PRINT').Value      :=1;
            }
            if (prev and (ZvitReal[3]=0)) then
            DsUPSVODFUNDALLS.ParamByName('IS_PRINT').Value      :=0
            else
            DsUPSVODFUNDALLS.ParamByName('IS_PRINT').Value      :=1;

            if (prev and (Zvit[8]=0)) then
            begin
                DsUPSVODWORKERZP.ParamByName('IS_PRINT').Value         :=0;
                DsUPSVODONWORKERSS.ParamByName('IS_PRINT').Value      :=0;
                {DsUPSVODONWORKERSR.ParamByName('IS_PRINT').Value      :=0}
            end
            else
            begin
                DsUPSVODWORKERZP.ParamByName('IS_PRINT').Value         :=1;
                DsUPSVODONWORKERSS.ParamByName('IS_PRINT').Value      :=1;
                {DsUPSVODONWORKERSR.ParamByName('IS_PRINT').Value      :=1;}
            end;

            if (prev and (Zvit[9]=0)) then
            begin
                DsUPSVODONWORKEXT.ParamByName('IS_PRINT').Value        :=0;
                DsUPSVODWORKERSOVM.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODEXTSOVMS.ParamByName('IS_PRINT').Value      :=0
            end
            else
            begin
                DsUPSVODONWORKEXT.ParamByName('IS_PRINT').Value        :=1;
                DsUPSVODWORKERSOVM.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODEXTSOVMS.ParamByName('IS_PRINT').Value      :=1;
            end;

            {if (prev and (ZvitReal[4]=0)) then
            DsUPSVODEXTSOVMR.ParamByName('IS_PRINT').Value      :=0
            else
            DsUPSVODEXTSOVMR.ParamByName('IS_PRINT').Value      :=1; }

            if (prev and (RachNach=0)) then
            begin
                DsUPSVODRASHNACH.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODRASHNEO.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODRASHPPS.ParamByName('IS_PRINT').Value      :=0;
                DsUPSVODRASHPOCH.ParamByName('IS_PRINT').Value      :=0;
            end
            else
            begin
                DsUPSVODRASHNACH.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODRASHNEO.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODRASHPPS.ParamByName('IS_PRINT').Value      :=1;
                DsUPSVODRASHPOCH.ParamByName('IS_PRINT').Value      :=1;
            end;


            DM.MainDataSet.Active:=True;
            DsUPSVODFUNDSZP.Active:=True;
            DsUPSVODFUNDSONCAT.Active:=True;
            DsUPSVODSUMOTPUSK.Active:=True;
            DsUPSVODPODOHODNALOG.Active:=True;
            DsUPSVODPROGULS.Active:=True;
            DsUPSVODCHISLPERSS.Active:=True;
            DsUPSVODALLSOTRUDS.Active:=True;
            DsUPSVODCHISLDISMISS.Active :=True;
            DsUPSVODCHISLACCEPT.Active :=True;
            //DsUPSVODPROGULR.Active:=True;
            //DsUPSVODCHISLPERSR.Active:=True;
            //DsUPSVODALLSOTRUDR.Active:=True;
            DsUPSVODCHISLPERSONCATS.Active:=True;
            //DsUPSVODCHISLPERSONCATR.Active:=True;
            DsUPSVODFUNDWTS.Active:=True;
            //DsUPSVODFUNDWTR.Active:=True;
            DsUPSVODWORKERZP.Active:=True;
            DsUPSVODONWORKERSS.Active:=True;
            //DsUPSVODONWORKERSR.Active:=True;
            DsUPSVODONWORKEXT.Active:=True;
            DsUPSVODWORKERSOVM.Active:=True;
            DsUPSVODEXTSOVMS.Active:=True;
            //DsUPSVODEXTSOVMR.Active:=True;
            DsUPSVODRASHNACH.Active:=True;
            DsUPSVODRASHNEO.Active:=True;
            DsUPSVODFUNDSUD.Active:=True;
            DsUPSVODWORKREASON.Active:=True;
            //DsUPSVODFUNDALLR.Active:=True;
            DsUPSVODFUNDALLS.Active:=True;
            DsUPSVODRASHPPS.Active:=True;
            DsUPSVODRASHPOCH.Active:=True;

            //DsUPSVODFUNDWTALLR.Active:=True;
            //DsUPSVODFUNDWTALLS.Active:=True;
            except
            on E:Exception do
            begin
                NagScreen.Free;
                messageBox(0,PChar('Помилка при підготовці звіту!'),'Помилка!',MB_OK);
                Exit;
            end;
        end;

        NagScreen.Free;

        {if  DSetData.IsEmpty then
        begin
            messageBox(0,PChar('За такими данними співробітників не знайдено'),'Увага!',MB_OK);
            Exit;
        end;  }

        Report.Clear;
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\'+ReportOptions[0][0]+'.fr3',True);
      //  Report.Variables['CUR_DATE']:=QuotedStr(DSetData['CUR_DATE']);
      //  Report.Variables['FIRM_NAME']:=QuotedStr(DSetData['FIRM_NAME']);

      {  m := TfrxMasterData(Report.FindObject('MasterData1'));
        if m <> nil then
        begin
            m.Font.Name := PFontNames;
            m.Font.Size := PFontSizes;
            m.Font.Color := PFontColors;
            m.Font.Style := PFontStyles;
        end;}

        if ReportOptions[1][0]=true then
        begin
          Report.DesignReport;
        end
        else
        begin
          Report.ShowReport;
        end;
    end;
end;

procedure TfmMain.MonthesListPropertiesChange(Sender: TObject);
begin
    if (MonthesList.ItemIndex <> (YearMonthFromKodSetup(Kod_Setup1,False)-1))
    then cxButtonPrint.Enabled := False
    else cxButtonPrint.Enabled := True;
end;

procedure TfmMain.MonthesList1PropertiesChange(Sender: TObject);
begin
    if (MonthesList1.ItemIndex <> (YearMonthFromKodSetup(Kod_Setup1,False)-1))
    then cxButtonPrint.Enabled := False
    else cxButtonPrint.Enabled := True;
end;

end.
