{ $Id: U_Shtat_Rep065.pas,v 1.57 2010/10/29 14:53:23 mzagurskaya Exp $ }
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Печать отчетов штатного расписания"              }
{                                                                              }
{                                               ответственный: Тимофеев Антон  }
unit U_Shtat_Rep065;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, StdCtrls, Buttons, FR_DSet, FR_DBSet, FIBDatabase, IBase,
    DB, RxMemDS, pFIBDatabase, FIBDataSet, pFibDataSet, FR_Class, ExtCtrls,
    CheckLst, FieldControl, SpComboBox, {frxClass, frxDBSet, } FIBQuery, SpCommon,
    pFIBQuery, CheckEditUnit, EditControl, cxStyles, cxCustomData, uCommonSp,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, NagScreenUnit,
    cxGridTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid, ActnList, frxClass,
    frxDBSet, frxDesgn, frOLEExl, FR_E_RTF, FR_E_TXT, FR_E_HTM, frRtfExp, ClipBrd,
    frxExportXLS, frxExportRTF, frxExportHTML, cxDropDownEdit, uFControl,
    uBoolControl, frxDCtrl, pFIBStoredProc, uLabeledFControl, uCharControl,
    uIntControl, qfTools, uDateControl, BaseTypes, cxTextEdit, Registry,
    UpKernelUnit, AccMgmt, cxContainer, cxMaskEdit, cxButtonEdit;

type
    TShtat_Rep = class(TForm)
        pFIBDB: TpFIBDatabase;
        MainReportDs: TpFIBDataSet;
        pFIBTrans: TpFIBTransaction;
        BBOk: TBitBtn;
        BBCancel: TBitBtn;
        RxMD_ShtatRas: TRxMemoryData;
        Panel1: TPanel;
        Panel2: TPanel;
        RxMD_ShtatRasname_type_post: TVariantField;
        RxMD_ShtatRasdep_name: TVariantField;
        RxMD_ShtatRaspost_name: TVariantField;
        RxMD_ShtatRaskol_stavok: TFloatField;
        RxMD_ShtatRasbase_oklad: TFloatField;
        RxMD_ShtatRasid_shtatras: TIntegerField;
        RxMD_ShtatRasid_department: TIntegerField;
        RxMD_ShtatRaskod_sm: TIntegerField;
        RxMD_ShtatRassmeta_name: TVariantField;
        DataSource1: TDataSource;
        Label9: TLabel;
        RxMD_ShtatRasoklad_fund: TFloatField;
        RxMD_ShtatRasbonus_fund: TFloatField;
        RxMD_ShtatRasmfund: TFloatField;
        pFIBQDel: TpFIBQuery;
        Panel3: TPanel;
        Panel4: TPanel;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        cxGrid2DBTableView1: TcxGridDBTableView;
        cxGrid2Level1: TcxGridLevel;
        cxGrid2: TcxGrid;
        Panel5: TPanel;
        Panel6: TPanel;
        cxStyleRepository1: TcxStyleRepository;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        SB_Add_Prop: TSpeedButton;
        SB_Del_Prop: TSpeedButton;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        RxMD_Dep: TRxMemoryData;
        RxMD_Smet: TRxMemoryData;
        ActionList1: TActionList;
        AddDep: TAction;
        AddSmeta: TAction;
        DelDep: TAction;
        DelSmeta: TAction;
        RxMD_DepId_Department: TIntegerField;
        RxMD_DepName_Full: TVariantField;
        DataSource2: TDataSource;
        DataSource3: TDataSource;
        cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
        RxMD_Smetid_smeta: TIntegerField;
        RxMD_Smetname: TVariantField;
        cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
        Print: TAction;
        frxDBDataset1: TfrxDBDataset;
        Panel7: TPanel;
        TotalValuesDS: TpFIBDataSet;
        frxDBDataset2: TfrxDBDataset;
        DepartmentsDS: TpFIBDataSet;
        RxMD_AllDep: TRxMemoryData;
        IntegerField1: TIntegerField;
        frxDesigner1: TfrxDesigner;
            Export: TAction;
        Cans: TAction;
        DesignRep: TAction;
        RxMD_ShtatRasfname: TVariantField;
        RxMD_ShtatRasftype: TIntegerField;
        RB_Kosh: TRadioButton;
        RB_Fund: TRadioButton;
        pFIBDS_Summary: TpFIBDataSet;
        frxDBDataset4: TfrxDBDataset;
        RB_Summ: TRadioButton;
        ShtatReportInfo: TpFIBDataSet;
        frxDBDataset5: TfrxDBDataset;
        frxHTMLExport1: TfrxHTMLExport;
        frxRTFExport1: TfrxRTFExport;
        frxXLSExport1: TfrxXLSExport;
        RxMD_ShtatRasdisp_order1: TIntegerField;
        RxMD_ShtatRasdisp_order2: TIntegerField;
        RxMD_ShtatRasdisp_order3: TIntegerField;
        RxMD_ShtatRasdisp_order: TIntegerField;
        RxMD_ShtatRasNadb11: TFloatField;
        RxMD_ShtatRasNadb12: TFloatField;
        RxMD_ShtatRasNadb13: TFloatField;
        RxMD_ShtatRasNadb14: TFloatField;
        RxMD_ShtatRasDopl11: TFloatField;
        RxMD_ShtatRasDopl12: TFloatField;
        RxMD_ShtatRasDopl13: TFloatField;
        RxMD_ShtatRassalary: TFloatField;
        RxMD_ShtatRasoklad: TFloatField;
        qFBC_Is_PPS_Group: TqFBoolControl;
        frxDialogControls1: TfrxDialogControls;
        pFIBT_DepDORecalc: TpFIBTransaction;
        pFIBSP_DepDORecalc: TpFIBQuery;
        qFBC_Filter: TqFBoolControl;
        RB_Qual: TRadioButton;
        SRPlanFund: TpFIBDataSet;
        MonthCount: TqFIntControl;
        frxPlanFundDS: TfrxDBDataset;
        SRPlanFundByF: TpFIBDataSet;
        frxPlanFundByFDS: TfrxDBDataset;
        SRParams: TpFIBDataSet;
        frxSRParams: TfrxDBDataset;
        SRPlanFundAll: TpFIBDataSet;
        frxPlanAll: TfrxDBDataset;
        RxMD_ShtatRasIs_Totals: TIntegerField;
        RxMD_ShtatRasIs_Dept_Header: TIntegerField;
        Nest: TqFIntControl;
        RxMD_ShtatRasId_Smeta: TIntegerField;
        ReportTransaction: TpFIBTransaction;
        ReportFiles: TpFIBDataSet;
        RxMD_ShtatRasNum_Digit: TIntegerField;
        ActDate: TqFDateControl;
        RxMD_ShtatRasVipusk_kaf: TIntegerField;
        RxMD_ShtatRasNAME_DEPARTMENT_UPPER: TStringField;
        RxMD_ShtatRasid_depatrment_upper: TIntegerField;
        RxMD_ShtatRasdisp_order5: TIntegerField;
        RB_Rozgorn: TRadioButton;
        PubSysDataDS: TpFIBDataSet;
        pFIBDS_Rozgorn: TpFIBDataSet;
        frxDBDataset3: TfrxDBDataset;
        btnGenerateSigners: TBitBtn;
        ActGenerateSigners: TAction;
        ShablonDSet: TpFIBDataSet;
        RxMD_ShtatRasid_dept_upper2: TIntegerField;
        RxMD_ShtatRasname_deprt_upper2: TStringField;
        RxMD_ShtatRasdisplay_order_6: TIntegerField;
        frxDBDataset6: TfrxDBDataset;
        ConstsSet: TpFIBDataSet;
        frxReport: TfrxReport;
    ShrDocSprav: TcxButtonEdit;
        procedure BBOkClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure MainReportDsAfterOpen(DataSet: TDataSet);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure SB_Add_PropClick(Sender: TObject);
        procedure DelDepExecute(Sender: TObject);
        procedure AddSmetaExecute(Sender: TObject);
        procedure DelSmetaExecute(Sender: TObject);
        procedure CB_FilterClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure DepartmentsDSAfterOpen(DataSet: TDataSet);
        procedure BBCancelClick(Sender: TObject);
        procedure DesignRepExecute(Sender: TObject);
        procedure RB_SummClick(Sender: TObject);
        procedure BBOkMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure CopyDS(FromDS, ToDS: TDataSet);
        procedure SpCB_SRChange(Sender: TObject);
        procedure ActGenerateSignersExecute(Sender: TObject);
    procedure ShrDocSpravPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    private
        FormControl: TEditControl;
        DesignReport: Boolean;
        SignerFio, SignerNamePost: string;
        IsPrintHead: string;
        RootDepartment, IdSr: Integer;
        ShrDateBeg, ShrDateEnd:TDate;
        procedure BeginLoadData;
        procedure EndLoadData;
        function Checked(FromDS: TDataSet; DataSet: TDataSet; NameField: string): boolean;
        procedure FormAllDep;

        procedure ShowFilter(Filter: Boolean);
    { Private declarations }
    public
        IdMode: Integer; //режим отчетов: 1 - обычный, 2 - для Мону
        procedure ExportReportTo(Report: TfrxReport);
        constructor Create(AOwner: TComponent; Handle: TISC_DB_HANDLE); reintroduce;
        function FormListSigner: Boolean;
    end;

var
    Shtat_Rep: TShtat_Rep;

implementation

{$R *.dfm}

uses GlobalSPR, u_raise_config, SignersForm, uUnivSprav;

const
    SQLSys = 'select * from pub_sys_data p';
    SQLBeg = 'select r.*, :cond11 :cond12 :cond13 :cond14 :cond21 :cond22 :cond23 ' +
        ' from dt_shtatras_report065(:id_sr,:how, :pps_group, :Act_Date) r order by ftype, ';

//    SQLSer = 'disp_order1, id_smeta, ';
    SQLSer = 'id_smeta, ';
    SQLEnd = 'disp_order2, name_type_post, disp_order3, id_department, disp_order4, Num_Digit DESC,  Koeff Desc, post_name';
    SQLEnd2 = 'disp_order2, name_type_post, disp_order6, Id_Department_Upper2, disp_order5, Id_Department_Upper, disp_order3, id_department, disp_order4, Num_Digit DESC, Koeff Desc, post_name';
    SQLEnd3 = 'disp_order5, Id_Department_Upper, disp_order3, id_department, disp_order4, Num_Digit DESC,  Koeff Desc, name_post collate win1251_ua';
    SQLSummary = 'select * from DT_SHTATRAS_REPORT_PLAN(:id_sr,:str, :Act_Date)';
    SQLQual = 'select * from DT_SHTATRAS_REPORT_QUALITY(:id_sr,:str, :Act_Date)';
    SQLFond = 'select * from DT_SHTATRAS_REPORT_FOND(:id_sr,:str, :pps_group, :nest_level, :Act_Date)';
    SQLRozgorn = 'select * from DT_SHTATRAS_REPORT(:id_sr, :Act_Date) r order by';

constructor TShtat_Rep.Create(AOwner: TComponent; Handle: TISC_DB_HANDLE);
var
    id_server: Integer;
begin
    inherited Create(AOwner);
    SignerFio := '';
    SignerNamePost := '';
    pFIBDB.Handle := Handle;
    RB_Rozgorn.Visible := False;
    RB_Rozgorn.Enabled := False;
    PubSysDataDS.Close;
    PubSysDataDS.SQLs.SelectSQL.Text := SQLSys;
    PubSysDataDS.Open;
    id_server := PubSysDataDS['id_server'];
    if id_server = 93
        then
    begin
        RB_Rozgorn.Visible := True;
        RB_Rozgorn.Enabled := True;
    end;
    ConstsSet.Close;
    ConstsSet.SQLs.SelectSQL.Text := 'select * from asup_ini_reports';
    ConstsSet.Open;
    IsPrintHead := ConstsSet['IS_PRINT_HEAD_IN_SHT_FUND'];
    ConstsSet.Close;
    ConstsSet.SQLs.SelectSQL.Text := 'select * from ini_asup_consts';
    ConstsSet.Open;
    RootDepartment := ConstsSet['GLOBAL_ROOT'];
end;

function TShtat_Rep.FormListSigner: Boolean;
var i, j, cnt, NumberRecord: Integer;
    CntItems, ValueItem: Variant;
begin
    try
        SignerFio := '';
        SignerNamePost := '';
        if VarToStr(KYVLoadFromRegistry('ListSignerCntItems', GetUserId))='' then Exit;
        CntItems := KYVLoadFromRegistry('ListSignerCntItems', GetUserId);
        if ((VarIsNull(CntItems)) or (CntItems = 0)) then Exit;
        for j := 0 to CntItems - 1 do
        begin
            ValueItem := KYVLoadFromRegistry('ListSigner' + IntToStr(j), GetUserId);
            if ((VarIsNull(ValueItem)) or (ValueItem = 0)) then Exit;
            ShablonDSet.Close;
            ShablonDSet.SQLs.SelectSQL.Text := 'select distinct * ' +
                '  from up_dt_text_shablons ' +
                ' where id_shablon=:id_shablon';
            ShablonDSet.ParamByName('id_shablon').AsInteger := ValueItem;
            ShablonDSet.Open;
            ShablonDSet.FetchAll;
            if not ShablonDSet.IsEmpty then
            begin
                if SignerFio = '' then SignerFio := ShablonDSet['text1']
                else SignerFio := SignerFio + '#' + ShablonDSet['text1'];
                if SignerNamePost = '' then SignerNamePost := ShablonDSet['text2']
                else SignerNamePost := SignerNamePost + '#' + ShablonDSet['text2'];
            end;
        end;
    except on e: Exception
        do begin
            agMessageDlg('Увага!', e.Message, mtError, [mbOK]);
            Result := False;
        end;
    end;
end;

procedure TShtat_Rep.BeginLoadData;
begin
    NagScreen := TNagScreen.Create(nil);
    NagScreen.Show;
    NagScreen.SetStatusText('Формується звіт...');
end;

procedure TShtat_Rep.EndLoadData;
begin
    NagScreen.Free;
end;

function TShtat_Rep.Checked(FromDS: TDataSet; DataSet: TDataSet; NameField: string): boolean;
var
    field: TField;
begin
    field := FromDS.FindField(NameField);
    if field = nil then
    begin
        Result := True;
        Exit;
    end;

    DataSet.Open;
    DataSet.First;
    if (DataSet.FindField(NameField) = nil) then
    begin
        Result := True;
        Exit;
    end;

    result := (not qFBC_Filter.Value) or (DataSet.IsEmpty);
    while (not DataSet.Eof) and (not result) do
    begin
        if (DataSet[NameField] = FromDS[NameField]) then
        begin
            Result := True;
            Exit;
        end;
        DataSet.Next;
    end;
end;

procedure TShtat_Rep.BBOkClick(Sender: TObject);
var
    RaiseConfig: TRaise_config;
    SRDS:TpFibDataSet;
    id_sr_dbeg, id_sr_dend : Variant;
begin
    if (ShrDocSprav.Text='') then
    begin
       agMessageDlg('Увага!', 'Необхідно обрати документ штатного розкладу!', mtInformation, [mbOK]);
       ShrDocSprav.SetFocus;
       Exit;
    end;

    if (((VarToDateTime(ActDate.Value)<ShrDateBeg) and (VarToDateTime(ActDate.Value)<ShrDateEnd)) or
        ((VarToDateTime(ActDate.Value)>ShrDateBeg) and (VarToDateTime(ActDate.Value)>ShrDateEnd))) then
    begin
       agMessageDlg('Увага!', 'Дата фільтру не належить періоду функціонування документа!', mtInformation, [mbOK]);
       ShrDocSprav.SetFocus;
       Exit;
    end;
    FormListSigner;

    RaiseConfig := TRaise_config.Create(Self);
    RaiseConfig.pFIBDS_SelectRaises.Database := pFIBDB;
    RaiseConfig.pFIBDS_SelectRaises.Transaction := pFIBTrans;
    RaiseConfig.id_sr := IdSr;

    SRParams.Close;
    SRParams.ParamByName('Id_SR').AsInteger := IdSr;
    SRParams.Open;

    if RB_Kosh.Checked then
    begin
        SRPlanFund.Close;
        SRPlanFund.ParamByName('ID_SR').AsInteger := IdSr;
        SRPlanFund.Open;
    end;

    if RB_Fund.Checked then
    begin
        SRPlanFundByF.Close;
        SRPlanFundByF.ParamByName('ID_SR').AsInteger := IdSr;
        SRPlanFundByF.Open;
    end;

    if RB_Summ.Checked then
    begin
        SRPlanFundByF.Close;
        SRPlanFundByF.ParamByName('ID_SR').AsInteger := IdSr;
        SRPlanFundByF.Open;
    end;

    if RB_Rozgorn.Checked then
    begin
        SRPlanFundByF.Close;
        SRPlanFundByF.ParamByName('ID_SR').AsInteger := IdSr;
        SRPlanFundByF.Open;
    end;

    ReportFiles.Close;
    ReportFiles.Open;

    if RaiseConfig.ShowModal = mrOk then
    begin
        SRDS:=TpFibDataSet.Create(nil);
        SRDS.Database   :=pFIBDB;
        SRDS.Transaction:=pFIBTrans;
        SRDS.SelectSQL.Text:='SELECT * FROM DT_SR WHERE ID_SR='+IntToStr(IdSr)+'';
        SRDS.Open;
        SRDS.FetchAll;
        SRDS.First;
        id_sr_dbeg :=SRDS.FieldByName('DATE_BEG').Value;
        id_sr_dend :=SRDS.FieldByName('DATE_END').Value;
        if  ((not VarIsNull(id_sr_dbeg)) and (not VarIsNull(id_sr_dend))) then
        if not ((ActDate.Value>=id_sr_dbeg) And (ActDate.Value<=id_sr_dend)) then
        begin
            showmessage('Дата друку не відповідає періоду дії штатного розкладу!');
            Exit;
        end;
        try
            FormControl.Read;
            {*переформируем порядок отображения подразделений
              для всех случаев, кроме зведеного и якісного*}
            if (RB_Kosh.Checked or RB_Fund.Checked or RB_Rozgorn.Checked) then
            begin
                pFIBDB.Open;
                try
                    pFIBT_DepDORecalc.StartTransaction;
                    pFIBSP_DepDORecalc.Prepare;
                    pFIBSP_DepDORecalc.ExecProc;
                    pFIBT_DepDORecalc.Commit;
                except

                end;
                pFIBTrans.StartTransaction;
            end;

            if not FormControl.CheckFill then
            begin
                ModalResult := 0;
                Exit;
            end;

            BeginLoadData;

            MainReportDS.Transaction := ReportTransaction;
            if MainReportDs.Transaction.Active then
                MainReportDs.Transaction.Rollback;
            MainReportDs.Transaction.StartTransaction;

            if RB_Kosh.Checked then
            begin
                FormAllDep;

                MainReportDS.Close;
                MainReportDS.SelectSQL.Text := StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(StringReplace(SQLBeg, ':cond23', IdGroup23, [rfReplaceAll, rfIgnoreCase]), ':cond22', IdGroup22, [rfReplaceAll, rfIgnoreCase]), ':cond21', IdGroup21, [rfReplaceAll, rfIgnoreCase]), ':cond14', IdGroup14, [rfReplaceAll, rfIgnoreCase]), ':cond13', IdGroup13, [rfReplaceAll, rfIgnoreCase]), ':cond12', IdGroup12, [rfReplaceAll, rfIgnoreCase]), ':cond11', IdGroup11, [rfReplaceAll, rfIgnoreCase]);

                MainReportDS.SelectSQL.Text := MainReportDS.SelectSQL.Text + SQLSer + SQLEnd2;
                MainReportDS.ParamByName('how').AsInteger := 1;

                MainReportDS.ParamByName('Id_sr').AsInteger := IdSr;
                MainReportDS.ParamByName('pps_group').AsInteger := (qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value);
                MainReportDS.ParamByName('Act_Date').AsDate := ActDate.Value;

                if DesignReport then
                begin
                    Clipboard.Clear;
                    Clipboard.AsText := MainReportDS.SelectSQL.Text;
                    ShowMessage(MainReportDS.SelectSQL.Text);
                    ShowMessage(IntToStr((qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value)));
                end;

                MainReportDS.Open;
                TotalValuesDS.Transaction := MainReportDS.Transaction;
                TotalValuesDS.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                TotalValuesDS.Open;
                pFIBQDel.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                pFIBQDel.ExecProc;
                MainReportDS.Close;
                ShtatReportInfo.Open;
                RxMD_ShtatRas.Open;

                if IdMode = 1 then
                    //загружаем обычный отчет
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['Smet_Report'], true)
                else //загружаем отчет для МОНУ
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['Smet_Report_MON'], true);
                frxReport.Variables['MColl'] := MonthCount.Value;
                frxReport.Variables['FioSigner'] := QuotedStr(SignerFio);
                frxReport.Variables['PostSigner'] := QuotedStr(SignerNamePost);
                if not RxMD_Smet.IsEmpty then
                    frxReport.Variables['IdSmeta'] := RxMD_Smet['Id_Smeta']
                else frxReport.Variables['IdSmeta'] := -1;
            end;

            if RB_Fund.Checked then
            begin
                FormAllDep;

                MainReportDS.Close;
                MainReportDS.SelectSQL.Text := SQLFond;
                MainReportDS.ParamByName('str').AsString := IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23;
                MainReportDS.ParamByName('Id_sr').AsInteger := IdSr;
                MainReportDS.ParamByName('pps_group').AsInteger := (qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value);
                MainReportDS.ParamByName('nest_level').AsInteger := Nest.Value;
                MainReportDS.ParamByName('Act_Date').AsDate := ActDate.Value;

                if DesignReport then
                begin
                    Clipboard.Clear;
                    Clipboard.AsText := MainReportDS.SelectSQL.Text;
                    ShowMessage(MainReportDS.SelectSQL.Text);
                    ShowMessage(IntToStr((qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value)));
                    Clipboard.Clear;
                    Clipboard.AsText := IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23;
                    ShowMessage(IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23);
                end;

                MainReportDS.Open;

                TotalValuesDS.Transaction := MainReportDS.Transaction;
                TotalValuesDS.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                TotalValuesDS.Open;
                pFIBQDel.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                pFIBQDel.ExecProc;
                MainReportDS.Close;
                ShtatReportInfo.Open;
                RxMD_ShtatRas.Open;

                //MainReportDS.Open;
                if IdMode = 1 then
                    //загружаем обычный отчет
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['Fund_Report'], true)
                else //загружаем отчет для МОНУ
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['Fund_Report_Mon'], true);

                frxReport.Variables['MColl'] := MonthCount.Value;
                frxReport.Variables['FioSigner'] := QuotedStr(SignerFio);
                frxReport.Variables['PostSigner'] := QuotedStr(SignerNamePost);
                frxReport.Variables['IsPrintHead'] := QuotedStr(IsPrintHead);
                frxReport.Variables['RootDep'] := RootDepartment;
            end;

            if RB_Summ.Checked
                then begin
                MainReportDS.Close;
                MainReportDS.SelectSQL.Text := SQLSummary;
                MainReportDS.ParamByName('str').AsString := IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23;
                MainReportDS.ParamByName('Id_sr').AsInteger := IdSr;
                MainReportDS.ParamByName('Act_Date').AsDate := ActDate.Value;

                if DesignReport then
                begin
                    Clipboard.Clear;
                    Clipboard.AsText := MainReportDS.SelectSQL.Text;
                    ShowMessage(MainReportDS.SelectSQL.Text);
                    ShowMessage(IntToStr((qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value)));
                    Clipboard.Clear;
                    Clipboard.AsText := IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23;
                    ShowMessage(IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23);
                end;

                MainReportDS.Open;
                TotalValuesDS.Transaction := MainReportDS.Transaction;
                TotalValuesDS.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                TotalValuesDS.Open;
                pFIBQDel.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                pFIBQDel.ExecProc;
                MainReportDS.Close;
                ShtatReportInfo.Open;
                RxMD_ShtatRas.Open;

                MainReportDS.Open;

                if IdMode = 1 then
                    //загружаем обычный отчет
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['CONSOLIDATED_REPORT'], True)
                else //загружаем отчет для МОНУ
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['CONSOLIDATED_REPORT_MON'], true);

                frxReport.Variables['MColl'] := MonthCount.Value;
                frxReport.Variables['FioSigner'] := QuotedStr(SignerFio);
                frxReport.Variables['PostSigner'] := QuotedStr(SignerNamePost);
            end;

            if RB_Qual.Checked
                then begin
                MainReportDS.Close;
                MainReportDS.SelectSQL.Text := SQLQual;
                MainReportDS.ParamByName('str').AsString := IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23;
                MainReportDS.ParamByName('Id_sr').AsInteger := IdSr;
                MainReportDS.ParamByName('Act_Date').AsDate := ActDate.Value;

                if DesignReport then
                begin
                    Clipboard.Clear;
                    Clipboard.AsText := MainReportDS.SelectSQL.Text;
                    ShowMessage(MainReportDS.SelectSQL.Text);
                    ShowMessage(IntToStr((qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value)));
                    Clipboard.Clear;
                    Clipboard.AsText := IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23;
                    ShowMessage(IdGroup11 + IdGroup12 + IdGroup13 + IdGroup14 + IdGroup21 + IdGroup22 + IdGroup23);
                end;

                MainReportDS.Open;
                if not MainReportDs.IsEmpty then
                begin
                    TotalValuesDS.Transaction := MainReportDS.Transaction;
                    TotalValuesDS.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                    TotalValuesDS.Open;

                    pFIBQDel.ParamByName('id_session').AsInteger := MainReportDS['Id_session'];
                    pFIBQDel.ExecProc;
                end;

                MainReportDS.Close;
                ShtatReportInfo.Open;
                RxMD_ShtatRas.Open;

                MainReportDS.Open;

                if IdMode = 1 then
                    //загружаем обычный отчет
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['Quality_Report'], true)
                else //загружаем отчет для МОНУ
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['Quality_Report_Mon'], true);
                frxReport.Variables['MColl'] := MonthCount.Value;
                frxReport.Variables['FioSigner'] := QuotedStr(SignerFio);
                frxReport.Variables['PostSigner'] := QuotedStr(SignerNamePost);
            end;

            if RB_Rozgorn.Checked then
            begin
                FormAllDep;

                pFIBDS_Rozgorn.Transaction := ReportTransaction;
                if pFIBDS_Rozgorn.Transaction.Active then
                    pFIBDS_Rozgorn.Transaction.Rollback;
                pFIBDS_Rozgorn.Transaction.StartTransaction;

                pFIBDS_Rozgorn.Close;
                pFIBDS_Rozgorn.SelectSQL.Text := SQLRozgorn;

                pFIBDS_Rozgorn.SelectSQL.Text := pFIBDS_Rozgorn.SelectSQL.Text + SqlSer + SQLEnd3;
              //  MainReportDS.ParamByName('how').AsInteger := 1;

                pFIBDS_Rozgorn.ParamByName('Id_sr').AsInteger := IdSr;
             //   MainReportDS.ParamByName('pps_group').AsInteger := (qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value);
                pFIBDS_Rozgorn.ParamByName('Act_Date').AsDate := ActDate.Value;

                if DesignReport then
                begin
                    Clipboard.Clear;
                    Clipboard.AsText := pFIBDS_Rozgorn.SelectSQL.Text;
                    ShowMessage(pFIBDS_Rozgorn.SelectSQL.Text);
                    ShowMessage(IntToStr((qFBC_Is_PPS_Group.Value) * (qFBC_Is_PPS_Group.Value)));
                end;

                pFIBDS_Rozgorn.Open;
                TotalValuesDS.Transaction := pFIBDS_Rozgorn.Transaction;
                TotalValuesDS.ParamByName('id_session').AsInteger := pFIBDS_Rozgorn['Id_session'];
                TotalValuesDS.Open;
                pFIBQDel.ParamByName('id_session').AsInteger := pFIBDS_Rozgorn['Id_session'];
                pFIBQDel.ExecProc;
                pFIBDS_Rozgorn.Close;
                ShtatReportInfo.Open;
                RxMD_ShtatRas.Open;

                if IdMode = 1 then
                    // загружаем обычный отчет
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['DOP_REPORT'], true)
                else //загружаем отчет для МОНУ
                    frxReport.LoadFromFile(ExtractFilePath(Application.ExeName) + ReportFiles['DOP_REPORT_MON'], true);

                // frxReport.Variables['MColl'] := MonthCount.Value;
                frxReport.Variables['FioSigner'] := QuotedStr(SignerFio);
                frxReport.Variables['PostSigner'] := QuotedStr(SignerNamePost);
                if not RxMD_Smet.IsEmpty then
                    frxReport.Variables['IdSmeta'] := RxMD_Smet['Id_Smeta']
                else frxReport.Variables['IdSmeta'] := -1;
            end;

            EndLoadData;
            if DesignReport
                then frxReport.DesignReport
            else begin
                frxReport.ShowReport;
            end;

            pFIBTrans.Commit;
        except on e: Exception do
            begin
                MessageDlg('Помилка: ' + e.Message, mtError, [mbYes], 0);
            end;
        end;
        ShtatReportInfo.Close;
        TotalValuesDS.Close;
    end;
    RaiseConfig.Free;
end;


procedure TShtat_Rep.FormCreate(Sender: TObject);
begin
    //SpCB_SR.LoadFromRegistry;
    FormControl := TEditControl.Create;
    //FormControl.Add([FC_SR]);
    FormControl.Prepare(emNew);
    DesignReport := False;
    ActDate.Value := Date;
end;

procedure ShowInfo(DataSet: TDataSet);
var
    text: string;
    i: integer;
begin
    text := '';
    for i := 1 to DataSet.Fields.Count do
        text := text + DataSet.Fields[i - 1].FieldName + ' : ' + DataSet.Fields[i - 1].DisplayText + #13;
    ShowMessage(text);
end;

procedure TShtat_Rep.CopyDS(FromDS, ToDS: TDataSet);
var
    field: TField;
    i: Integer;
begin
    FromDS.First;
    while not FromDS.Eof do
    begin
        if Checked(FromDS, RxMD_AllDep, 'id_department')
            and Checked(FromDS, RxMD_Smet, 'id_smeta') then
        begin
            ToDS.Append;
            for i := 0 to FromDS.FieldCount - 1 do
            begin
                field := ToDs.FindField(FromDS.Fields[i].FieldName);
                if field <> nil then
                    field.Value := FromDS.Fields[i].Value;
            end;
            ToDS.Post;
        end;
        FromDS.Next;
    end;
end;

procedure TShtat_Rep.MainReportDsAfterOpen(DataSet: TDataSet);
begin
    try
        RxMD_ShtatRas.Open;
        RxMD_ShtatRas.EmptyTable;
        CopyDS(DataSet, RxMD_ShtatRas);
    except on e: Exception do
        begin
            qFErrorDialog('Виникла помилка (in MainReportDsAfterOpen): ' + e.Message);
                    //ShowInfo(DataSet);
        end
    end
end;

procedure TShtat_Rep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if MainReportDs.Transaction.Active then
        MainReportDs.Transaction.Rollback;
    //SpCB_SR.SaveIntoRegistry;
    FormControl.Free;
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TShtat_Rep.SB_Add_PropClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(pFIBDB.Handle);
            FieldValues['Actual_Date'] := Date();
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        RxMD_Dep.Open;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            sp.Output.First;
            while not sp.Output.Eof do
            begin
                RxMD_Dep.Append;
                RxMD_Dep['Id_Department'] := sp.Output['Id_Department'];
                RxMD_Dep['Name_Full'] := sp.Output['Name_Full'];
                RxMD_Dep.Post;
                sp.Output.Next;
            end;
        end;
        sp.Free;
    end;
end;

procedure TShtat_Rep.DelDepExecute(Sender: TObject);
begin
    if RxMD_Dep.IsEmpty then
        Exit;
    RxMD_Dep.Delete;
end;

procedure TShtat_Rep.AddSmetaExecute(Sender: TObject);
var
    id: variant;
begin
    id := GlobalSPR.GetSmets(Owner, pFIBDB.Handle, Date(), psmSmet);
    RxMD_Smet.Open;
    if (VarArrayDimCount(id) > 0) and (id[0] <> Null) then
    begin
        RxMD_Smet.Append;
        RxMD_Smet['id_smeta'] := id[0];
        RxMD_Smet['name'] := IntToStr(id[3]) + '. ' + id[2];
        RxMD_Smet.Post;
    end;
end;

procedure TShtat_Rep.DelSmetaExecute(Sender: TObject);
begin
    if RxMD_Smet.IsEmpty then
        Exit;
    RxMD_Smet.Delete;
end;

procedure TShtat_Rep.CB_FilterClick(Sender: TObject);
begin
    ShowFilter(qFBC_Filter.Value);
//  Position:=poScreenCenter;
end;

procedure TShtat_Rep.FormShow(Sender: TObject);
begin
    ShowFilter(False);
end;

procedure TShtat_Rep.ExportReportTo(Report: TfrxReport);
begin
    ExportReportTo(Report);
end;

procedure TShtat_Rep.DepartmentsDSAfterOpen(DataSet: TDataSet);
begin
    RxMD_AllDep.Open;
    DataSet.First;
    while not DataSet.Eof do
    begin
        RxMD_AllDep.Append;
        if DataSet.FindField('Id_Department') <> nil then
            RxMD_AllDep['id_department'] := DataSet['id_department'];
        RxMD_AllDep.Post;
        DataSet.Next;
    end;
end;

procedure TShtat_Rep.BBCancelClick(Sender: TObject);
begin
    Close;
end;

procedure TShtat_Rep.DesignRepExecute(Sender: TObject);
begin
    DesignReport := not DesignReport;
end;

procedure TShtat_Rep.RB_SummClick(Sender: TObject);
begin
    if (RB_Summ.Checked) or (RB_Qual.Checked) or (RB_Rozgorn.Checked) then
    begin
        qFBC_Filter.Value := false;
        CB_FilterClick(Sender);
    end;
    qFBC_Filter.Visible := not (RB_Summ.Checked or RB_Qual.Checked or RB_Rozgorn.Checked);
    qFBC_Is_PPS_Group.Visible := not (RB_Summ.Checked or RB_Qual.Checked or RB_Rozgorn.Checked);
end;

procedure TShtat_Rep.BBOkMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
    if (ssCtrl in Shift) and (ssAlt in Shift) then
        DesignReport := True;
end;

procedure TShtat_Rep.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Integer);
begin
    if (ssCtrl in Shift) and (ssAlt in Shift) then
        DesignReport := True;
end;

procedure TShtat_Rep.FormAllDep;
begin
    DepartmentsDS.Close;
    RxMD_AllDep.EmptyTable;
    RxMD_Dep.Open;
    RxMD_Dep.First;
    DepartmentsDS.ParamByName('Act_date').AsDate := Date();

    while not RxMD_Dep.Eof do
    begin
        DepartmentsDS.ParamByName('root').AsInteger := RxMD_Dep['id_department'];
        DepartmentsDS.Open;
        DepartmentsDS.Close;
        RxMD_Dep.Next;
    end;
end;

procedure TShtat_Rep.ShowFilter(Filter: Boolean);
begin
    AddDep.Enabled := Filter;
    DelDep.Enabled := Filter;
    AddSmeta.Enabled := Filter;
    DelSmeta.Enabled := Filter;
    Panel7.Visible := Filter;

    if Filter then
        ClientHeight := Panel2.Height + Panel1.Height + 290
    else
        ClientHeight := Panel2.Height + Panel1.Height;

end;

procedure TShtat_Rep.SpCB_SRChange(Sender: TObject);
begin
//
end;

procedure TShtat_Rep.ActGenerateSignersExecute(Sender: TObject);
var frm: TfrmSigner;
begin
    frm := TfrmSigner.Create(Self, pFIBDB.Handle);
    frm.ShowModal;
    frm.Free;
end;

procedure TShtat_Rep.ShrDocSpravPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
begin
    Screen.Cursor := crHourGlass;
    Params.FormCaption := 'Документи штатного розкладу';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'DT_SR_SELECT_BY_DATE('+''''+DateToStr(actdate.value)+''''+')';
    Params.Fields := 'name,date_beg,date_end,id_sr';
    Params.FieldsName := 'Назва документа,Дата початку,Дата кінця';
    Params.KeyField := 'id_sr';
    Params.ReturnFields := 'name,date_beg,date_end,id_sr';
    Params.DBHandle := Integer(pFIBDB.Handle);

    OutPut := TRxMemoryData.Create(self);
    try
        Screen.Cursor := crDefault;
        if GetUnivSprav(Params, OutPut) then
        begin
            IdSr := VarAsType(output['id_sr'], varInteger);
            ShrDateBeg:=VarAsType(OutPut['date_beg'], varDate);
            ShrDateEnd:=VarAsType(OutPut['date_end'], varDate);
            ShrDocSprav.Text := VarToStr(output['name']);
        end;

    except on E: Exception
           do begin
              agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
           end;
    end;

end;

end.

