unit uReestrZajavok;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCommonSp, FIBDatabase, pFIBDatabase, RxMemDS, iBase, DB, uSpravControl,
    cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
    cxEdit, cxDBData, cxTextEdit, cxCheckBox, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
    cxGridCustomView, cxGrid, cxClasses, cxSplitter, cxMaskEdit,
    cxDropDownEdit, StdCtrls, cxContainer, cxDBEdit, Buttons, ExtCtrls,
    dxBarExtItems, dxBar, ActnList, ImgList, AppStruClasses, Accmgmt, pFIBStoredProc,
    UpKernelUnit, pFibDataSet, Menus, frxClass, frxDBSet, FIBQuery,
    pFIBQuery, FIBDataSet, frxExportRTF, frxExportXLS, frxExportHTML,
    cxImage, NagScreenUnit;

type
    TfrmReestrZajavok = class(TForm)
        Panel1: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        SpeedButton1: TSpeedButton;
        cxDBTextEdit1: TcxDBTextEdit;
        SearchEdit: TEdit;
        cxCB_FieldName: TcxComboBox;
        cxSortByFieldInfo: TcxComboBox;
        cxSplitter1: TcxSplitter;
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        PersonGrid: TcxGrid;
        MainPersonView: TcxGridDBTableView;
        PersonLevel1: TcxGridLevel;
        ImageList1: TImageList;
        IL_Orders: TImageList;
        ActionList: TActionList;
        AddOrder: TAction;
        ModifyOrder: TAction;
        DeleteOrder: TAction;
        ViewAction: TAction;
        RefreshList: TAction;
        PrintOrder: TAction;
        NotAccept: TAction;
        AcceptOrder: TAction;
        SelectOrder: TAction;
        CloseForm: TAction;
        RefreshFilterAction: TAction;
        dxBM_Order: TdxBarManager;
        dxBLB_Add: TdxBarLargeButton;
        dxBLB_Modify: TdxBarLargeButton;
        dxBLB_Delete: TdxBarLargeButton;
        dxBLB_Refresh: TdxBarLargeButton;
        dxBLB_Print: TdxBarLargeButton;
        dxBLB_NotAccept: TdxBarLargeButton;
        dxBLB_Accept: TdxBarLargeButton;
        dxBLB_Select: TdxBarLargeButton;
        dxBLB_Close: TdxBarLargeButton;
        dxBCCI_Space: TdxBarControlContainerItem;
        dxBarButton1: TdxBarButton;
        dxBarButton2: TdxBarButton;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBarLargeButton2: TdxBarLargeButton;
        dxBarLargeButton3: TdxBarLargeButton;
        StopOrderButton: TdxBarLargeButton;
        dxBarLargeButton4: TdxBarLargeButton;
        dxbrbtn1: TdxBarButton;
        dxbrbtn2: TdxBarButton;
        dxBarLargeButton5: TdxBarLargeButton;
        MainPersonViewDBColumn1: TcxGridDBColumn;
        MainPersonViewDBColumn2: TcxGridDBColumn;
        MainPersonViewDBColumn3: TcxGridDBColumn;
        MainPersonViewDBColumn4: TcxGridDBColumn;
        MainPersonViewDBColumn5: TcxGridDBColumn;
        MainPersonViewDBColumn6: TcxGridDBColumn;
        MainDSource: TDataSource;
        PrintDoc: TAction;
        dxBarPopupMenu1: TdxBarPopupMenu;
        dxBarLargeButton6: TdxBarLargeButton;
        dxBarLargeButton7: TdxBarLargeButton;
        dxBarLargeButton8: TdxBarLargeButton;
        pFIBD_Reestr: TpFIBDatabase;
        pFIBT_Read: TpFIBTransaction;
        pFIBT_Write: TpFIBTransaction;
        pFIB_MainDS: TpFIBDataSet;
        pFIBDSHesh: TpFIBDataSet;
        StoredProc: TpFIBStoredProc;
        Report: TfrxReport;
        ReportDsetData: TfrxDBDataset;
        ReportDataSet: TpFIBDataSet;
        MainPersonViewDBColumn7: TcxGridDBColumn;
        fxHTMLExport: TfrxHTMLExport;
        fxEXLExport: TfrxXLSExport;
        fxRTFExport: TfrxRTFExport;
        cxDTime: TcxTextEdit;
    DataSetConst: TpFIBDataSet;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CloseFormExecute(Sender: TObject);
        procedure ModifyOrderExecute(Sender: TObject);
        procedure RefreshListExecute(Sender: TObject);
        procedure MainPersonViewDblClick(Sender: TObject);
        procedure dxBLB_AcceptClick(Sender: TObject);
        function CheckSignActionByIdUser(ACTION: string; cur_lev: variant; lev: variant): Boolean;
        function DocLevel(id_doc: Variant; id_lev: integer):Boolean;
        procedure dxBLB_NotAcceptClick(Sender: TObject);
        procedure DeleteOrderExecute(Sender: TObject);
        procedure dxBLB_PrintClick(Sender: TObject);
        procedure AddOrderExecute(Sender: TObject);
        procedure MainPersonViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PrintOrderExecute(Sender: TObject);
        procedure PrintDocExecute(Sender: TObject);
        procedure ViewActionExecute(Sender: TObject);
        procedure MainPersonViewStylesGetContentStyle(
            Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
            AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
        procedure MainPersonViewKeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure MainPersonViewCellClick(Sender: TcxCustomGridTableView;
            ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
            AShift: TShiftState; var AHandled: Boolean);
        procedure SaveInfoCertPath(Id_Doc :Integer; Id_Level,
                  Id_User, Type_Move: Variant);
    procedure dxBarLargeButton4Click(Sender: TObject);
    private
    { Private declarations }
        ModuleFactory: TFMASAppModuleCreator;
    public
    { Public declarations }
        id_user: integer;
        OutPut: TRxMemoryData;
        kod_setup: integer;
        constructor Create(AOwner: TComponent; aDBHandle: TISC_DB_HANDLE; id_user: Int64; kodsetup: Integer; idreport: Int64; aOutPut: TRxMemoryData = nil); reintroduce;
        procedure SelectAll;
    end;

    ReestrZajavok = class(TSprav)
    public
        ReestrZ: TfrmReestrZajavok;
        constructor Create;
        procedure Show; override;
    end;

    TZReestrModule = class(TFMASAppModule, IFMASModule)
    private
        WorkMainForm: TForm;
    public
        procedure Run;
        procedure OnLanguageChange(var Msg: TMessage); message FMAS_MESS_CHANGE_LANG;
        procedure OnGridStylesChange(var Msg: TMessage); message FMAS_MESS_CHANGE_GSTYLE;
{$WARNINGS OFF}
        destructor Destroy; override;
        constructor Create(AOwner: TComponent); override;
{$WARNINGS ON}
    end;


function CreateSprav: TSprav; stdcall;
exports CreateSprav;
var
    frmReestrZajavok: TfrmReestrZajavok;
    idrep: int64;



implementation

uses Add_Reestr, uFControl, BaseTypes, AssociationList, PrintFormR, ReestrSignsHist;

{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := ReestrZajavok.Create;
end;

constructor ReestrZajavok.Create;
begin
    inherited Create;
    PrepareMemoryDatasets;
end;

procedure ReestrZajavok.Show;
begin
    ReestrZ := TfrmReestrZajavok.Create(Application.MainForm, TISC_DB_HANDLE(integer(Input['DBHandle'])), 0, 0, 0, Output);
    ReestrZ.FormStyle := fsMDIChild;
    ReestrZ.Show;
    ReestrZ.WindowState := wsMaximized;


end;

constructor TfrmReestrZajavok.Create(AOwner: TComponent; aDBHandle: TISC_DB_HANDLE; id_user: Int64; kodsetup: Integer; idreport: Int64; aOutPut: TRxMemoryData);
begin

    inherited Create(AOwner);
    Output := aOutPut;
    idrep := idreport;

   // DataM_RZ := TReestr_DatM.Create(Application.MainForm);
    pFIBD_Reestr.Handle := aDBHandle;

    pFIB_MainDS.Close;
    pFIB_MainDS.Transaction.StartTransaction;
    pFIB_MainDS.SelectSQL.Text := 'SELECT * FROM UP_PERSON_DOC_SELECT(:ID_PERSON_DOCUM) ORDER BY YEAR_T DESC, MONTH_T DESC';
    if (Output = nil) then
        pFIB_MainDS.ParamByName('ID_PERSON_DOCUM').AsInt64 := idrep
    else
        pFIB_MainDS.ParamByName('ID_PERSON_DOCUM').Value := null;

    pFIB_MainDS.Open;

    if pFIB_MainDS.RecordCount > 0 then
        cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
    else cxDTime.Text := '';
end;

procedure TfrmReestrZajavok.SelectAll;
begin
end;

procedure TfrmReestrZajavok.SaveInfoCertPath(Id_Doc: Integer; Id_Level, Id_User, Type_Move: Variant);
Var InsPath:TpFIBStoredProc;
begin
   try
    InsPath:=TpFIBStoredProc.Create(Self);
    InsPath.Database:=pFIBD_Reestr;
    InsPath.Transaction:=pFIBT_Write;
    InsPath.Close;
    InsPath.StoredProcName:='UP_PERSON_LEVEL_PATH_INS';
    InsPath.Transaction.StartTransaction;
    InsPath.Prepare;
    InsPath.ParamByName('ID_PERSON_DOCUMENT').AsInteger:=Id_Doc;
    InsPath.ParamByName('ID_LEVEL').AsVariant:=Id_Level;
    InsPath.ParamByName('TYPE_MOVE').AsInteger:=Type_Move;
    InsPath.ParamByName('ID_USER').AsInteger:=Id_User;
    InsPath.ExecProc;
    InsPath.Transaction.Commit;
    InsPath.Close;
    InsPath.Free;
  except on e:exception
  do begin
       Showmessage(e.message);
     end;
  end;
end;

procedure TfrmReestrZajavok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;


procedure TfrmReestrZajavok.CloseFormExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmReestrZajavok.ModifyOrderExecute(Sender: TObject);
var
    //kod_setup: integer;
    id_pers_doc: integer;
    Sp_PersSt: TSprav;
begin
    if pFIB_MainDS.ISEmpty then exit;
    if not VarIsNull(pFIB_MainDS['ID_LEVEL']) then
    begin
        agShowMessage('Записи можна змінювати лише на рівні "чернетка"!');
        exit;
    end;
    kod_setup := pFIB_MainDS['kod_setup'];
    id_pers_doc := pFIB_MainDS['ID_PERSON_DOCUMENT'];
    Sp_PersSt := TSprav.Create;
    Sp_PersSt := GetSprav('Zarplata\zPersModule8.bpl');
    if Sp_PersSt <> nil then
    begin
        Sp_PersSt.input.Open;
        with Sp_PersSt.Input do
        begin
            Append;
            FieldValues['DBHANDLE'] := Integer(pFIBD_Reestr.Handle);
            FieldValues['IdUser'] := id_user;
            FieldValues['KodSetup'] := kod_setup;
            FieldValues['IdReport'] := id_pers_doc;
            FieldValues['IdMode'] := 1;
            Post;
        end;
        Sp_PersSt.Show;

        if not VarIsNull(pFIB_MainDS['ID_PERSON_DOCUMENT']) then
        begin
            id_pers_doc := pFIB_MainDS['ID_PERSON_DOCUMENT'];
            pFIBDSHesh.Close;
            pFIBDSHesh.SelectSQL.Text := 'execute procedure UP_PERSON_DOC_UPD_HASH(' + inttostr(id_pers_doc) + ')';
            pFIBDSHesh.Open;
            pFIBDSHesh.Transaction.Commit;
            RefreshListExecute(self);
            pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_pers_doc, []);
        end;
    end;
    if pFIB_MainDS.RecordCount > 0 then
        cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
    else cxDTime.Text := '';
end;

procedure TfrmReestrZajavok.RefreshListExecute(Sender: TObject);
begin
    pFIB_MainDS.Close;
    pFIB_MainDS.Open;
    if pFIB_MainDS.RecordCount > 0 then
        cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
    else cxDTime.Text := '';
end;

procedure TfrmReestrZajavok.MainPersonViewDblClick(Sender: TObject);
begin
    if not VarIsNull(pFIB_MainDS['ID_LEVEL']) then
        ViewActionExecute(self)
    else
        ModifyOrderExecute(self);
end;

function TfrmReestrZajavok.CheckSignActionByIdUser(ACTION: string; cur_lev: variant; lev: variant): Boolean;
var IdUserCheckAction: TpFibStoredProc;
    Res: Integer;
begin
    IdUserCheckAction := TpFibStoredProc.Create(self);
    IdUserCheckAction.Database := pFIBD_Reestr;
    IdUserCheckAction.Transaction := pFIBT_Write;
    pFIBT_Write.StartTransaction;
    IdUserCheckAction.StoredProcName := 'UP_PERSONSTAJ_USER_SIGN';
    IdUserCheckAction.Prepare;
    IdUserCheckAction.ParamByName('ID_USER').AsInt64 := GetUserId;
    IdUserCheckAction.ParamByName('CUR_ID_LEVEL').Value := cur_lev;
    IdUserCheckAction.ParamByName('TO_UP_LEVEL').Value := lev;
    IdUserCheckAction.ExecProc;
    Res := IdUserCheckAction.ParamByName('RESULT').Value;
    pFIBT_Write.Commit;
    IdUserCheckAction.Close;
    IdUserCheckAction.Free;

    if (Res = 1)
        then Result := true
    else Result := false;
end;

function TfrmReestrZajavok.DocLevel(id_doc: Variant; id_lev: integer):Boolean;
var SignsProc: TpFIBStoredProc;
    Res: Integer;
    Res_mes: string;
    IsEnd:String;
begin
    dxBLB_Accept.Enabled := false;
    dxBLB_NotAccept.Enabled := false;
    try
        SignsProc := TpFIBStoredProc.Create(Self);
        SignsProc.Database := pFIBD_Reestr;
        SignsProc.Transaction := pFIBT_Write;
        SignsProc.Transaction.StartTransaction;
        SignsProc.StoredProcName := 'UP_PERSON_LEVEL_UPD';
        SignsProc.Prepare;
        SignsProc.ParamByName('ID_PERSON_DOC').AsInteger := id_doc;
        SignsProc.ParamByName('LEVEL_TO').AsInteger := id_lev;
        SignsProc.ExecProc;
        if not VarIsNull(SignsProc.ParamByName('RES').Value) then
            Res := SignsProc.ParamByName('RES').AsInteger
        else Res := 0;
        if not VarIsNull(SignsProc.ParamByName('RES_MESS').Value) then
            Res_mes := SignsProc.ParamByName('RES_MESS').AsString
        else Res_mes := '';
        IsEnd:=SignsProc.ParamByName('Is_End').AsString;
        SignsProc.Transaction.Commit;
        SignsProc.Close;
        SignsProc.free;
        if (Res = 0)
            then agShowMessage(Res_mes);
    except
        on e: Exception do
            agShowMessage(e.Message);
    end;
    dxBLB_Accept.Enabled := true;
    dxBLB_NotAccept.Enabled := true;
    if IsEnd='F' then Result:=True
    else Result:=False;
end;

procedure TfrmReestrZajavok.dxBLB_AcceptClick(Sender: TObject);
var id_lev, id_doc, current_level: variant;
    us_id: Variant;
    NagScreen:TNagScreen;
begin
    us_id := GetUserId;
    id_lev := 1;
    try
        NagScreen := TNagScreen.Create(self);
        NagScreen.Show;
        NagScreen.SetStatusText('Зачекайте! Йде обробка данних...');
        if VarIsNull(pFIB_MainDS['ID_PERSON_DOCUMENT']) then exit;
        id_doc := pFIB_MainDS['ID_PERSON_DOCUMENT'];
        pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_doc, []);

        if not VarIsNull(current_level) then
            current_level := pFIB_MainDS['id_level']
        else current_level := null;
        if CheckSignActionByIdUser('SIGN', current_level, 1) then
        begin
            if DocLevel(id_doc, 1) then
            begin
                pFIB_MainDS.CloseOpen(true);
                pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_doc, []);
                SaveInfoCertPath(id_doc, pFIB_MainDS['id_level'], us_id, 1);
            end;
        end;
        NagScreen.Close;
        NagScreen.Free;
        pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_doc, []);
    except
        on e: Exception do
            agShowMessage(e.Message);
    end;

end;

procedure TfrmReestrZajavok.dxBLB_NotAcceptClick(Sender: TObject);
var id_doc, id_main_doc, res: integer;
    us_id, current_level: Variant;
    LevProc: TpFIBStoredProc;
    NagScreen:TNagScreen;
begin
    us_id := GetUserId;
    try
        NagScreen := TNagScreen.Create(self);
        NagScreen.Show;
        NagScreen.SetStatusText('Зачекайте! Йде обробка данних...');
        if VarIsNull(pFIB_MainDS['ID_PERSON_DOCUMENT']) then exit;
        id_doc := pFIB_MainDS['ID_PERSON_DOCUMENT'];
        id_main_doc := pFIB_MainDS['Id_Person_Doc'];
        pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_doc, []);

        LevProc := TpFIBStoredProc.Create(Self);
        LevProc.Database := pFIBD_Reestr;
        LevProc.Transaction := pFIBT_Write;
        LevProc.Transaction.StartTransaction;
        LevProc.StoredProcName := 'UP_CHECK_PERSON_LEVEL';
        LevProc.Prepare;
        LevProc.ParamByName('ID_PERSON_DOC').AsInteger := id_main_doc;
        LevProc.ExecProc;
        Res := LevProc.ParamByName('RESULT').Value;
        LevProc.Transaction.Commit;
        LevProc.Close;
        LevProc.free;

        if Res = 1 then
        begin
            current_level := pFIB_MainDS['id_level'];
            if CheckSignActionByIdUser('UNSIGN', current_level, 0) then
            begin
                if DocLevel(id_doc, -1) then
                begin
                   pFIB_MainDS.CloseOpen(true);
                   pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_doc, []);
                   SaveInfoCertPath(id_doc, pFIB_MainDS['id_level'], us_id, 0);
                end;
            end;
        end
        else
            agShowMessage('Не можна зняти підпис бо документ підписаний в цілому!');
        pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_doc, []);
        if pFIB_MainDS.RecordCount > 0 then
            cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
        else cxDTime.Text := '';
        NagScreen.Close;
        NagScreen.Free;
    except
        on e: Exception do
            agShowMessage(e.Message);
    end;
end;

procedure TfrmReestrZajavok.DeleteOrderExecute(Sender: TObject);
var DeleteSP: TpFibStoredProc;
    id_focus_index: Integer;
begin
    if not VarIsNull(pFIB_MainDS['ID_LEVEL']) then
    begin
        agShowMessage('Записи можна вилучати лише з рівня "чернетка"!');
        exit;
    end;
    if (pFIB_MainDS.RecordCount > 0)
        then begin
        if (agMessageDlg('Увага!', 'Ви хочете вилучити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            then begin
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := pFIBD_Reestr;
            DeleteSP.Transaction := pFIBT_Write;
            DeleteSP.Transaction.StartTransaction;
            DeleteSP.StoredProcName := 'UP_PERSON_DOCUMENTS_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('ID_PERSON_DOCUMENT').AsInt64 := StrToInt64(pFIB_MainDS.FieldByName('ID_PERSON_DOCUMENT').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Transaction.Commit;
            DeleteSP.Close;
            DeleteSP.Free;
            id_focus_index := MainPersonView.Controller.FocusedRowIndex;
            pFIB_MainDS.CacheDelete;
            MainPersonView.Controller.FocusedRowIndex := id_focus_index;
            pFIB_MainDS.Close;
            pFIB_MainDS.Open;
            if pFIB_MainDS.RecordCount > 0 then
                cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
            else cxDTime.Text := '';
        end;
    end;
end;

procedure TfrmReestrZajavok.dxBLB_PrintClick(Sender: TObject);
begin
//
end;

procedure TfrmReestrZajavok.AddOrderExecute(Sender: TObject);
var
    frm: TAdd_Form;
    id: integer;
    id_parent: variant;
begin
    id := 0;
    frm := TAdd_Form.Create(Self);
    frm.Caption := 'Додати - ' + frm.Caption;
    id_parent := null;
    frm.RadioButtonAll.Checked := True;
    frm.PeopleEdit.Visible := False;

    frm.hand := pFIBD_Reestr.Handle;
    if frm.ShowModal = mrOk then
    begin
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_PERSON_DOCUMENTS_ALL_INS';
        StoredProc.Prepare;
        StoredProc.ParamByName('ID_PERSON_DOC').Value := frm.PersDoc.Value;
        StoredProc.ParamByName('COMMENTS').Value := frm.CommentEdit.Value;
        StoredProc.ParamByName('ID_USER').Value := GetUserId;

        StoredProc.ParamByName('KOD_SETUP_BEG').AsInteger := frm.kod_setup_beg;
        StoredProc.ParamByName('KOD_SETUP_END').AsInteger := frm.kod_setup_end;

        if frm.RadioButtonAll.Checked then
            StoredProc.ParamByName('ID_MAN').Value := NULL
        else
            StoredProc.ParamByName('ID_MAN').Value := frm.PeopleEdit.Value;

        try
            StoredProc.ExecProc;
        except on E: Exception
            do
            begin
                agShowMessage(e.Message);
                StoredProc.Transaction.Rollback;
                frm.Free;
                exit;
            end;
        end;
        id := StoredProc['ID_PERSON_DOCUMENT'].AsInteger;
        StoredProc.Transaction.Commit;
    end;
    pFIB_MainDS.Close;
    pFIB_MainDS.Open;
    pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id, []);
    if pFIB_MainDS.RecordCount > 0 then
        cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
    else cxDTime.Text := '';
    frm.Free;
end;

procedure TfrmReestrZajavok.MainPersonViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then
    begin
        ShowInfo(pFIB_MainDS);
    end;

end;

procedure TfrmReestrZajavok.PrintOrderExecute(Sender: TObject);
var ID: Integer;
    lev: Integer;
begin
    if pFIB_MainDS.IsEmpty then
    begin
        agMessageDlg('Увага!', 'Не має записів', mtInformation, [mbOK]);
        Exit;
    end;
    ID := pFIB_MainDS['Id_Person_Document'];
    if VarIsNull(pFIB_MainDS['Id_Level']) then lev := 1 else lev := 0;
    ReportDataSet.Close;
    ReportDataSet.SelectSQL.Text := 'SELECT * FROM UP_REPORT_DOC_PERS_STAJ(' + IntToStr(ID) + ')';
    ReportDataSet.Open;
    if ReportDataSet.IsEmpty then
    begin
        agMessageDlg('Увага!', 'Обраний документ не сформований!', mtInformation, [mbOK]);
        exit;
    end;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Up\' + 'UpPersonStajDoc.fr3', True);
    Report.Variables['chernetka'] := quotedStr(IntToStr(lev));
    Report.ShowReport(true);
end;

procedure TfrmReestrZajavok.PrintDocExecute(Sender: TObject);
var frm: TfrmPrintR;
    id1, id2, id3: Integer;
    hnd: TISC_DB_HANDLE;
begin
    if pFIB_MainDS.IsEmpty then
    begin
        agMessageDlg('Увага!', 'Не має записів', mtInformation, [mbOK]);
        Exit;
    end;
    hnd := pFIBD_Reestr.Handle;
    id1 := pFIB_MainDS['ID_PERSON_DOCUMENT'];
    id2 := -1;
    id3 := -1;
    frm := TfrmPrintR.Create(Self);
    frm.SetParams(id1, id2, id3, hnd);
    frm.ShowModal;
    frm.Free;
end;


{ TUPFilter }

{$WARNINGS OFF}


constructor TZReestrModule.Create(AOwner: TComponent);
begin
    inherited Create(Aowner);
end;

destructor TZReestrModule.Destroy;
begin
    if Assigned(self.WorkMainForm) then self.WorkMainForm.Free;
    inherited Destroy;
end;
{$WARNINGS ON}

procedure TZReestrModule.OnGridStylesChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZReestrModule.OnLanguageChange(var Msg: TMessage);
begin
     //Для будущей реализации
end;

procedure TZReestrModule.Run;
var I: Integer;
    ExistFlag: Boolean;
begin
    ExistFlag := False;
    for i := 0 to Application.MainForm.MDIChildCount - 1 do
    begin
        if (Application.MainForm.MDIChildren[i] is TfrmReestrZajavok)
            then begin
            if TfrmReestrZajavok(Application.MainForm.MDIChildren[i]).Kod_Setup = PInteger(self.InParams.Items['KodSetup'])^
                then begin
                Application.MainForm.MDIChildren[i].BringToFront;
                ExistFlag := True;
            end;
        end;
    end;

    if not ExistFlag
        then begin
        WorkMainForm := TfrmReestrZajavok.Create(TComponent(self.InParams.Items['AOwner']^),
            TISC_DB_HANDLE(PInteger(self.InParams.Items['DbHandle'])^),
            PInteger(self.InParams.Items['Id_User'])^,
            PInteger(self.InParams.Items['KodSetup'])^,
            PInteger(self.InParams.Items['IdReport'])^,
            nil);
        WorkMainForm.Show;
    end;

end;


procedure TfrmReestrZajavok.ViewActionExecute(Sender: TObject);
var
    //kod_setup: integer;
    id_pers_doc: integer;
    Sp_PersSt: TSprav;
begin
    if pFIB_MainDS.ISEmpty then exit;

    kod_setup := pFIB_MainDS['kod_setup'];
    id_pers_doc := pFIB_MainDS['ID_PERSON_DOCUMENT'];
    Sp_PersSt := TSprav.Create;
    Sp_PersSt := GetSprav('Zarplata\zPersModule8.bpl');
    if Sp_PersSt <> nil then
    begin
        Sp_PersSt.input.Open;
        with Sp_PersSt.Input do
        begin
            Append;
            FieldValues['DBHANDLE'] := Integer(pFIBD_Reestr.Handle);
            FieldValues['IdUser'] := id_user;
            FieldValues['KodSetup'] := kod_setup;
            FieldValues['IdReport'] := id_pers_doc;
            FieldValues['IdMode'] := 2;
            Post;
        end;
        Sp_PersSt.Show;

        if not VarIsNull(pFIB_MainDS['ID_PERSON_DOCUMENT']) then
        begin
            id_pers_doc := pFIB_MainDS['ID_PERSON_DOCUMENT'];
            RefreshListExecute(self);
            pFIB_MainDS.Locate('ID_PERSON_DOCUMENT', id_pers_doc, []);
            if pFIB_MainDS.RecordCount > 0 then
                cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
            else cxDTime.Text := '';
        end;
    end;
end;

procedure TfrmReestrZajavok.MainPersonViewStylesGetContentStyle(
    Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
    AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
var LocStyle: TcxStyle;
begin
    if (pFIB_MainDS.RecordCount > 0)
        then begin
        if (ARecord.Values[6] <> null)
            then begin
            LocStyle := TcxStyle.Create(self);
            {
            if ARecord.Values[10] <> null
                then LocStyle.Color := ARecord.Values[10];
        }
            if ARecord.Values[6] <> null
                then LocStyle.TextColor := ARecord.Values[6];

            AStyle := LocStyle;
        end;
    end;
end;

procedure TfrmReestrZajavok.MainPersonViewKeyUp(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if pFIB_MainDS.RecordCount > 0 then
        cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value
    else cxDTime.Text := '';
end;

procedure TfrmReestrZajavok.MainPersonViewCellClick(
    Sender: TcxCustomGridTableView;
    ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
    AShift: TShiftState; var AHandled: Boolean);
begin
    cxDTime.Text := pFIB_MainDS.FieldByName('DATETIME_LAST_EDIT').Value;
end;

procedure TfrmReestrZajavok.dxBarLargeButton4Click(Sender: TObject);
var frm:TfrmSignsHst;
begin
   frm:=TfrmSignsHst.Create(Self, pFIB_MainDS['ID_PERSON_DOCUMENT']);
   frm.ShowModal;
   frm.Free;
end;

initialization
     //Регистрация класса в глобальном реестре
    RegisterAppModule(TZReestrModule, 'UPReestrZajavok');



end.
