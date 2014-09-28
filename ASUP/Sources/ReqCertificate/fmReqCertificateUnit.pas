unit fmReqCertificateUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, FIBDatabase, pFIBDatabase, ActnList, ExtCtrls, cxControls,
    cxSplitter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, uFControl, uLabeledFControl, uSpravControl,
    uCommonSp, AllPeopleUnit, qFTools, FIBDataSet, pFIBDataSet, StdCtrls,
    DBCtrls, Buttons, uActionControl, uFormControl, cxTextEdit, cxContainer,
    cxDBEdit, cxCheckBox, dxBar, dxBarExtItems, ImgList, pFibStoredProc, AccMgmt,
    cxButtonEdit, ComCtrls, fmAddReqCertificateUnit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, frxDesgn, frxClass, frxDBSet, frxExportXLS, frxExportHTML,
  frxExportRTF, NagScreenUnit, cxImage, uReqCommon, frxBarcode,
  frxExportImage, frxExportPDF, Menus;

Const Fields: Array[0..1] Of String = ('NOMER', 'DATE_REQUEST'{, 'NOMER_UD', 'TN'});

type
    TfmReqCertificate = class(TForm)
        LocalDatabase: TpFIBDatabase;
        LocalReadTransaction: TpFIBTransaction;
        LocalWriteTransaction: TpFIBTransaction;
        KeyList: TActionList;
        OkAction: TAction;
        Cancel: TAction;
        AddCert: TAction;
        ModifyCert: TAction;
        DeleteCert: TAction;
        ViewCert: TAction;
        RigthPanel: TPanel;
        cxGrid1: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        CertSet: TpFIBDataSet;
        CertDataSource: TDataSource;
        cxGridDBTableView1DBColumn1: TcxGridDBColumn;
        cxGridDBTableView1DBColumn2: TcxGridDBColumn;
        cxGridDBTableView1DBColumn3: TcxGridDBColumn;
        cxGridDBTableView1DBColumn4: TcxGridDBColumn;
        RenewCert: TAction;
        Panel4: TPanel;
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
        Label7: TLabel;
        cxDBTextEdit11: TcxDBTextEdit;
        cxDBTextEdit8: TcxDBTextEdit;
        Label1: TLabel;
        Label8: TLabel;
        cxDBTextEdit9: TcxDBTextEdit;
        Label9: TLabel;
        dxBarManager1: TdxBarManager;
        dxAddPositionButton: TdxBarLargeButton;
        dxDelPositionButton: TdxBarLargeButton;
        dxEditPositionButton: TdxBarLargeButton;
        dxErrorButton: TdxBarLargeButton;
        dxSmDelButton: TdxBarLargeButton;
        dxDelPositionButtonOne: TdxBarLargeButton;
        dxDelPositionButtonAll: TdxBarLargeButton;
        dxCloseButton: TdxBarLargeButton;
        IL_OrdAcc: TImageList;
        dxBarLargeButton1: TdxBarLargeButton;
        WorkWriteTransaction: TpFIBTransaction;
    Label3: TLabel;
    SearchEdit: TEdit;
    cxCB_FieldName: TcxComboBox;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    show: TdxBarLargeButton;
    showAction: TAction;
    DateSearch: TcxDateEdit;
    dxBarLargeButton2: TdxBarLargeButton;
    printAction: TAction;
    ReportDsetData: TfrxDBDataset;
    Designer: TfrxDesigner;
    RTFExport: TfrxRTFExport;
    HTMLExport: TfrxHTMLExport;
    XLSExport: TfrxXLSExport;
    ReportSet: TpFIBDataSet;
    PopupMenu: TdxBarPopupMenu;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    ReportSmetDsetData: TfrxDBDataset;
    DesignerSmet: TfrxDesigner;
    printSmetAction: TAction;
    ReportSmetSet: TpFIBDataSet;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    SIGNACTION: TAction;
    UNSIGNACTION: TAction;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    LevelSet: TpFIBDataSet;
    dxBarLargeButton7: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    dxBarLargeButton9: TdxBarLargeButton;
    SmetaSumma: TAction;
    SummSmetaSet: TpFIBDataSet;
    dxPathButton: TdxBarLargeButton;
    PrintManCert: TAction;
    ManCertDsetData: TfrxDBDataset;
    ManCertSet: TpFIBDataSet;
    ImageDB: TpFIBDatabase;
    ImageTrans: TpFIBTransaction;
    FotoByMan: TpFIBDataSet;
    FotoDsetData: TfrxDBDataset;
    ReportSmet: TfrxReport;
    ManCertDataSource: TDataSource;
    frxBarCodeObject1: TfrxBarCodeObject;
    fPDFExp: TfrxPDFExport;
    fTIFFExp: TfrxTIFFExport;
    fJPEGExp: TfrxJPEGExport;
    Report: TfrxReport;
    PopMenu: TPopupMenu;
    ReqHst: TMenuItem;
    ActReqCertHst: TAction;
    IniReports: TpFIBDataSet;
    DateCreateTime: TcxDBTextEdit;
        procedure CancelExecute(Sender: TObject);
        procedure FioOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ManOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure PlanQueryAfterOpen(DataSet: TDataSet);
        procedure CertSetAfterScroll(DataSet: TDataSet);
        procedure cxGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure RenewCertExecute(Sender: TObject);
        procedure DeleteCertExecute(Sender: TObject);
        procedure dxCloseButtonClick(Sender: TObject);
        procedure AddCertExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    procedure ModifyCertExecute(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
   
    procedure showActionExecute(Sender: TObject);
    procedure ViewCertExecute(Sender: TObject);
    procedure cxCB_FieldNamePropertiesChange(Sender: TObject);
    procedure DateSearchPropertiesChange(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure printActionExecute(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure SIGNACTIONExecute(Sender: TObject);
    procedure UNSIGNACTIONExecute(Sender: TObject);
    function CertificateLevel(Id_Req_Cert:Variant; Level_To:Integer): Boolean;
    function CheckSignActionByIdUser(ACTION: String; LEV: Integer): Boolean;
    procedure cxGrid1Click(Sender: TObject);
    procedure cxGridDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure printSmetActionExecute(Sender: TObject);
    procedure SmetaSummaExecute(Sender: TObject);
    procedure ExecReqCert(var Id_Req:Integer);
    procedure UpdHashKod (Var Id_Req:Integer);
    procedure EditDateReq (Var Id_req:Integer; Var DateReq:TDate);
    procedure SaveInfoCertPath(Id_Req_Cert: Integer; Id_Level, Id_User, Type_Move: Variant);
    procedure dxPathButtonClick(Sender: TObject);
    procedure PrintManCertExecute(Sender: TObject);
    procedure ActReqCertHstExecute(Sender: TObject);
    private
    { Private declarations }
    public
      ID:Integer;
      ID_req:Variant;
    end;

implementation

uses UpKernelUnit, BaseTypes, WinSock,fmReqCertiifcateErrorForm, fmReqCertificateSmets,
  Math, fmHistSigns, FIBQuery, uReqCertHst, uStatistic;

{$R *.dfm}

procedure TfmReqCertificate.SaveInfoCertPath(Id_Req_Cert: Integer; Id_Level, Id_User, Type_Move: Variant);
Var InsPath:TpFIBStoredProc;
begin
   try
    InsPath:=TpFIBStoredProc.Create(Self);
    InsPath.Database:=LocalDatabase;
    InsPath.Transaction:=LocalWriteTransaction;
    InsPath.Close;
    InsPath.StoredProcName:='UP_DT_CERT_PATH_INS';
    InsPath.Transaction.StartTransaction;
    InsPath.Prepare;
    InsPath.ParamByName('ID_REQ_CERT').AsInteger:=Id_Req_Cert;
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


procedure TfmReqCertificate.EditDateReq(var Id_req:Integer; Var DateReq:TDate);
Var EditDate:TpFIBStoredProc;
begin
    EditDate:=TpFIBStoredProc.Create(Self);
    EditDate.Database:=LocalDatabase;
    EditDate.Transaction:=LocalWriteTransaction;
    EditDate.Close;
    EditDate.StoredProcName:='UP_DT_REQUEST_CERTIFICATE_UPD';
    LocalWriteTransaction.StartTransaction;
    EditDate.Prepare;
    EditDate.ParamByName('ID_REQUEST_CERTIFICATE').AsInteger:=Id_req;
    EditDate.ParamByName('DATE_R').AsDate:=DateReq;
    EditDate.ExecProc;
    EditDate.Close;
    LocalWriteTransaction.Commit;
    EditDate.Free;
end;

procedure TfmReqCertificate.UpdHashKod(Var Id_Req:Integer);
Var UpdHashK:TpFIBStoredProc;
begin
    UpdHashK:= TpFIBStoredProc.Create(self);
    UpdHashK.Database := LocalDatabase;
    UpdHashK.Transaction := LocalWriteTransaction;
    UpdHashK.Close;
    UpdHashK.StoredProcName:='UP_DT_REQ_CERT_UPD_HASH';
    UpdHashK.Transaction.StartTransaction;
    UpdHashK.Prepare;
    UpdHashK.ParamByName('ID_REQ_CERT').AsInteger:=Id_Req;
    UpdHashK.ExecProc;
    UpdHashK.Transaction.Commit;
    UpdHashK.Close;
    UpdHashK.Free;
end;


procedure TfmReqCertificate.ExecReqCert(var Id_Req:Integer);
var Proverka:TpFIBStoredProc;
begin
        Proverka:=TpFIBStoredProc.Create(Self);
        Proverka.Database:=LocalDatabase;
        Proverka.Transaction:=LocalWriteTransaction;
        Proverka.Close;
        Proverka.StoredProcName:='UP_DT_CERT_EXEC_REQ';
        LocalWriteTransaction.StartTransaction;
        Proverka.Prepare;
        Proverka.ParamByName('id_req_cert').AsInteger:=Id_Req;
        Proverka.ExecProc;
        Proverka.Close;
        LocalWriteTransaction.Commit;
        Proverka.Free;
        CertSet.Close;
        CertSet.Open;
        RenewCertExecute(self);
        CertSet.Locate('ID_REQUEST_CERTIFICATE',Id_Req,[]);
end;


function TfmReqCertificate.CertificateLevel(Id_Req_Cert:Variant; Level_To:Integer): Boolean;
var SignProc:TpFIBStoredProc;
    Is_End:String;
begin
  //showmessage('1');
   try
    SignProc:=TpFIBStoredProc.Create(Self);
    SignProc.Database:=LocalDatabase;
    SignProc.Transaction:=LocalWriteTransaction;
    SignProc.Transaction.StartTransaction;
    dxBarLargeButton5.Enabled:=false;
    SignProc.StoredProcName:='UP_DT_REQ_CERT_LEVELS_UPD';
    SignProc.Prepare;
    SignProc.ParamByName('ID_REQ_CERT').AsInteger:= Id_Req_Cert;
    SignProc.ParamByName('LEVEL_TO').AsInteger:=Level_To;
    SignProc.ExecProc;
    Is_End:=SignProc.FieldByName('IS_END').AsString;
    SignProc.Transaction.Commit;
    SignProc.Close;
    SignProc.free;
    dxBarLargeButton5.Enabled:=true;
    if Is_End='T' then Result:=False
    else Result:=True;
  except on e:exception
  do begin
        Showmessage(e.message);
     end;
  end;
  //showmessage('2');
end;

function TfmReqCertificate.CheckSignActionByIdUser(ACTION: String; lev: Integer): Boolean;
Var IdUserCheckAction: TpFibStoredProc;
    Res: Integer;
Begin
   try
    IdUserCheckAction := TpFibStoredProc.Create(self);
    IdUserCheckAction.Database := LocalDatabase;
    IdUserCheckAction.Transaction := LocalWriteTransaction;
    LocalWriteTransaction.StartTransaction;
    IdUserCheckAction.StoredProcName := 'UP_KER_CHECK_SUPER_USER_SIGN_1';
    IdUserCheckAction.Prepare;
    IdUserCheckAction.ParamByName('ID_USER').AsInt64 := GetUserId;
    IdUserCheckAction.ParamByName('CUR_ID_LEVEL').Value :=CertSet.FieldByName('ID_LEVEL').Value;
    IdUserCheckAction.ParamByName('TO_UP_LEVEL').Value :=lev;
    IdUserCheckAction.ExecProc;
    Res := IdUserCheckAction.ParamByName('RESULT').Value;
    LocalWriteTransaction.Commit;
    IdUserCheckAction.Close;
    IdUserCheckAction.Free;

    If (Res = 1)
        Then Result := true
    Else
    Begin
        agMessageDlg('Увага!','У вас не має прав виконувати цю дію!',mtInformation, [mbOK]);
        Result := false;
    End;
  except on e:exception
  do begin
        ShowMessage(e.message);
     end;
  end;
End;

function GetCompName: string;
var
    s: string;
    sLen: Longword;
begin
    SetLength(s, 255);
    sLen := 255;
    GetHostName(@s[1], sLen);
    Result := Trim(StrPas(PAnsiChar(s)));
end;

function GetIPAddress: string;
var
    wVerReq: WORD;
    wsaData: TWSAData;
    i: pchar;
    h: PHostEnt;
    c: array[0..128] of char;
begin
    wVerReq := MAKEWORD(1, 1);
    WSAStartup(wVerReq, wsaData);
    GetHostName(@c, 128);
    h := GetHostByName(@c);
    i := iNet_ntoa(PInAddr(h^.h_addr_list^)^);
    Result := i; //O
    WSACleanup;
end;

procedure TfmReqCertificate.CancelExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmReqCertificate.FioOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    sp: TSprav;
begin
    // создать справочник
    sp := GetSprav('asup\PCardsList');
    if sp <> nil then
    begin

        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := Date;
            FieldValues['ShowWorking'] := False;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
        sp.Free;
    end;
end;

procedure TfmReqCertificate.ManOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    result: Variant;
begin
    try
        if not VarIsNull(Value) then
            result := AllPeopleUnit.GetMan(Self, LocalDatabase.Handle, False, True, Value)
        else
            result := AllPeopleUnit.GetMan(Self, LocalDatabase.Handle, False, True);

        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];

           { PlanQuery.Close;
            PlanQuery.ParamByName('ID_MAN').AsInteger := Value;
            PlanQuery.Open;   }
        end;

    except on e: Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                e.Message + '"');
            exit;
        end;
    end;
end;

procedure TfmReqCertificate.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TfmReqCertificate.PlanQueryAfterOpen(DataSet: TDataSet);
begin
    DataSet.Last;
end;

procedure TfmReqCertificate.CertSetAfterScroll(DataSet: TDataSet);
begin
    {AddItemButton.Enabled := not PlanQuery.IsEmpty;
    ModifyItemButton.Enabled := not PlanQuery.IsEmpty;
    DeleteItemButton.Enabled := not PlanQuery.IsEmpty;
    InfoButton.Enabled := not PlanQuery.IsEmpty;
    CloneButton.Enabled := not PlanQuery.IsEmpty;   }

 {  if PlanQuery.IsEmpty then exit;

    FactQuery.Close;
    FactQuery.SelectSQL.Text := 'select * from ASUP_DT_POCHAS_FACT_SELECT(' + PlanQueryID_POCHAS_PLAN.AsString + ')';
    FactQuery.Open;

    ActionControl.AddKeys := PlanQueryID_POCHAS_PLAN.Value;  }
end;

procedure TfmReqCertificate.cxGridDBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
var FrmSt:TfrmStatistic;
begin
   if ((Key=ord('M')) and (ssShift in Shift)
       and (ssAlt in Shift) and (ssCtrl in Shift)) then
   begin
       FrmSt:=TfrmStatistic.Create(Self);
       FrmSt.ShowModal;
       FrmSt.Free;
   end;
    if ((Key = VK_F12) and (ssShift in Shift))
        then begin
        ShowInfo(CertSet);
    end;
        If not VarIsNull(CertSet['ID_LEVEL']) then
    begin
        dxDelPositionButton.enabled:=false;
        exit;
    end
    else  dxDelPositionButton.enabled:=true;
    if CertSet.IsEmpty then exit
    else
    begin
        //cxTextEdit1.Text:=CertSet['DATE_SYS_CREATE'];
        cxDBTextEdit11.Text:=CertSet['IP_ADRESS_COMPUTER'];
        cxDBTextEdit9.Text:=CertSet['USER_CERT'];
        cxDBTextEdit8.Text:=CertSet['NAME_COMPUTER'];
   end;
end;

procedure TfmReqCertificate.RenewCertExecute(Sender: TObject);
begin
    CertSet.CloseOpen(true);
end;

procedure TfmReqCertificate.DeleteCertExecute(Sender: TObject);
var DeleteSP: TpFibStoredProc;
    Check:Integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Del');
    if check<>0 then
    begin
        agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
        exit;
    end;
    If not VarIsNull(CertSet['ID_LEVEL']) then
    begin
        dxDelPositionButton.enabled:=false;
        exit;
    end
    else
    begin
    if (CertSet.RecordCount > 0)
        then begin
        if (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            then begin
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := LocalDatabase;
            DeleteSP.Transaction := LocalWriteTransaction;
            LocalWriteTransaction.StartTransaction;
            StartHistory(LocalWriteTransaction);
            DeleteSP.StoredProcName := 'UP_DT_REQUEST_CERT_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('ID_REQUEST_CERTIFICATE').AsInt64 := StrToInt64(CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            LocalWriteTransaction.Commit;

            CertSet.Close;
            CertSet.Open;
        end;
    end;
    end;
end;

procedure TfmReqCertificate.dxCloseButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmReqCertificate.AddCertExecute(Sender: TObject);
var
    frm: TfmAddReqCertificate;
    StoredProcCert: TpFIBStoredProc;
    DateR:TDate;
    NagScreen:TNagScreen;
    Check:Integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Add');
    if check<>0 then
    begin
        agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
        exit;
    end;
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Формується список працівників...');
    frm := TfmAddReqCertificate.Create(Self, 1, 1, 0, LocalDatabase.Handle);
    frm.Caption := 'Додати ' + frm.Caption;
    StoredProcCert := TpFIBStoredProc.Create(self);
    StoredProcCert.Database := LocalDatabase;
    StoredProcCert.Transaction := LocalWriteTransaction;
    StoredProcCert.Close;
    StoredProcCert.StoredProcName := 'UP_DT_REQUEST_CERTIFICATE_INS';
    StoredProcCert.ParamByName('ID_REQUEST_CERTIFICATE_IN').Value := Null;
    StoredProcCert.ParamByName('NOMER').Value := Null; //frm.PPSSmet.Value;
    StoredProcCert.ParamByName('DATE_REQUEST').AsDate := Date; //frm.DateReq.Date;
    StoredProcCert.ParamByName('ID_USER').Value := GetUserId;
    StoredProcCert.ParamByName('IP_ADRESS_COMPUTER').Value := GetIPAddress;
    StoredProcCert.ParamByName('NAME_COMPUTER').Value := GetCompName;
    StoredProcCert.ParamByName('CLOSE_REQUEST').Value := Null;
    StoredProcCert.ParamByName('KOL_VO_CERTIFICATE').Value := Null;
    LocalWriteTransaction.StartTransaction;
    //StartHistory(LocalWriteTransaction);
    StoredProcCert.ExecProc;
    ID := StrToInt(StoredProcCert.FieldByName('ID_REQUEST_CERTIFICATE_OUT').AsString);
    StoredProcCert.Close;
    LocalWriteTransaction.Commit;
    frm.PeopleSet.Close;
    frm.PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(frm.GetKeySession) + ',' + '''' + DateTostr(frm.DateReq.Date) + '''' + ')';
    frm.PeopleSet.Open;
    frm.countActionExecute(Self);
    //frm.summ_countExecute(Self);
    if frm.ShowModal = mrOk then
    begin
        StoredProcCert.StoredProcName := 'UP_DT_MAN_CERTIFICATE_INS';
        StoredProcCert.ParamByName('KEY_SESSION').asInteger := frm.GetKeySession;
        StoredProcCert.ParamByName('ID_REQUEST_CERTIFICATE').Value := ID;
        LocalWriteTransaction.StartTransaction;
        try
            StoredProcCert.ExecProc;
            LocalWriteTransaction.Commit;
        except
            LocalWriteTransaction.Rollback;
          //  break;
        end;                                        
        StoredProcCert.StoredProcName := 'UP_DT_REQUEST_CERTIFICATE_UPD';
        StoredProcCert.ParamByName('ID_REQUEST_CERTIFICATE').Value := ID;
        StoredProcCert.ParamByName('DATE_R').asDate := frm.DateReq.Date;
        LocalWriteTransaction.StartTransaction;
        try
            StoredProcCert.ExecProc;
            LocalWriteTransaction.Commit;
        except
            LocalWriteTransaction.Rollback;
          //  break;
        end;
    end;
    DateR:=frm.DateReq.Date;
    EditDateReq (ID,DateR);
    CertSet.Close;
    CertSet.Open;
    frm.Free;
    ExecReqCert(ID);

    NagScreen.Close;
    NagScreen.free;
end;

procedure TfmReqCertificate.FormCreate(Sender: TObject);
begin
  //LongDateFormat:='dd.mm.yyyy hh:nn:ss';
  cxCB_FieldName.ItemIndex:=0;
end;

procedure TfmReqCertificate.ModifyCertExecute(Sender: TObject);
var
    frm: TfmAddReqCertificate;
    StoredProcCert: TpFIBStoredProc;
    id_req_cert, n: Integer;
    DateR:TDate;
    NagScreen:TNagScreen;
    Check:Integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Edit');
    if check<>0 then
    begin
        agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
        exit;
    end;
    if VarIsNull(CertSet['ID_REQUEST_CERTIFICATE']) then exit;
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані...');
    //id_req
    id_req_cert:=CertSet['ID_REQUEST_CERTIFICATE'];
    //
    LevelSet.Close;
    LevelSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_DT_REQ_CERT_LEV_SEL(:ID_REQ_CERT)';
    LevelSet.ParamByName('ID_REQ_CERT').AsInteger:=id_req_cert;
    LevelSet.Open;
    //n:=LevelSet['N'];
    if VarIsNull(LevelSet['N']) then
    begin
       n:=0;
    end
    else
    begin
        LevelSet.Close;
        LevelSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_DT_REQ_CERT_LEV_SEL(:ID_REQ_CERT)';
        LevelSet.ParamByName('ID_REQ_CERT').AsInteger:=id_req_cert;
        LevelSet.Open;
        n:=levelSet['N'];
    end;
    frm := TfmAddReqCertificate.Create(Self, 1, 0, 0, LocalDatabase.Handle);
    frm.Caption := 'Змінити ' + frm.Caption;
    frm.DateReq.Date := StrToDate(CertSet.FieldByName('DATE_REQUEST').AsString);
    case n of
    1:begin
        //frm.val_1:=0;
        frm.DateReq.Enabled:=false;
        frm.FormListButton.enabled:=false;
        frm.dxBarLargeButton1.enabled:=false;
        frm.dxAddPositionButton.Enabled:=false;
        frm.dxDelPositionButton.Enabled:=false;
        frm.dxBarLargeButton3.Enabled:=false;
        frm.FotoCheck.Enabled:=False;
      end;

    2:begin
        //frm.val_1:=0;
        frm.DateReq.Enabled:=false;
        frm.FormListButton.enabled:=false;
        frm.dxBarLargeButton1.enabled:=false;
        frm.dxAddPositionButton.Enabled:=false;
        frm.dxDelPositionButton.Enabled:=false;
        frm.dxBarLargeButton3.Enabled:=false;
        frm.FotoCheck.Enabled:=False;
      end;

    3:begin
        //frm.val_1:=0;
        frm.DateReq.Enabled:=false;
        frm.FormListButton.enabled:=false;
        frm.dxBarLargeButton1.enabled:=false;
        frm.dxAddPositionButton.Enabled:=false;
        frm.dxDelPositionButton.Enabled:=false;
        frm.dxBarLargeButton3.Enabled:=false;
        frm.FotoCheck.Enabled:=False;
      end;

    4:begin
        //frm.val_1:=0;
        frm.DateReq.Enabled:=false;
        frm.FormListButton.enabled:=false;
        frm.dxBarLargeButton1.enabled:=false;
        frm.dxAddPositionButton.Enabled:=false;
        frm.dxDelPositionButton.Enabled:=false;
        frm.dxBarLargeButton3.Enabled:=false;
        frm.FotoCheck.Enabled:=False;
      end;
    end;
    StoredProcCert := TpFIBStoredProc.Create(self);
    StoredProcCert.Database := LocalDatabase;
    StoredProcCert.Transaction := LocalWriteTransaction;
    StoredProcCert.Close;
    ID := CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsInteger;
    StoredProcCert.StoredProcName := 'UP_DT_MAN_CERT_CREATE_INFO';
    StoredProcCert.ParamByName('ID_REQ_CERT').Value := ID;
    StoredProcCert.ParamByName('KEY_SESSION').AsInteger := frm.GetKeySession;
    LocalWriteTransaction.StartTransaction;
    //StartHistory(LocalWriteTransaction);
    StoredProcCert.ExecProc;
    StoredProcCert.Close;
    LocalWriteTransaction.Commit;
    frm.PeopleSet.Close;
    frm.PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(frm.GetKeySession) + ',' + '''' + DateTostr(frm.DateReq.Date) + '''' + ')';
    frm.PeopleSet.Open;
    frm.countActionExecute(Self);
    if  frm.ShowModal = mrOk then
    begin
       LocalWriteTransaction.StartTransaction;
      // StartHistory(LocalWriteTransaction);
       StoredProcCert.StoredProcName := 'UP_DT_MAN_CERTIFICATE_INS_EX';
       StoredProcCert.Prepare;
       StoredProcCert.ParamByName('ID_REQ_CERT').Value := ID;
       StoredProcCert.ParamByName('KEY_S').AsInteger := frm.GetKeySession;
       StoredProcCert.ExecProc;
       StoredProcCert.Close;
       LocalWriteTransaction.Commit;
       StoredProcCert.Free;
       DateR:=frm.DateReq.Date;
       EditDateReq(ID,DateR);
       UpdHashKod(ID);
    end;
    NagScreen.Close;
    NagScreen.Free;
    ExecReqCert(ID);
    CertSet.Close;
    CertSet.Open;
    CertSet.Locate('ID_REQUEST_CERTIFICATE',ID,[]);
end;

procedure TfmReqCertificate.SearchEditChange(Sender: TObject);
VAR Fltstr:string;
     NOM_POS, SER_POS,FIO: STring;
     tab_n,i:Integer;
begin
  if (SearchEdit.Text = '')or(VarIsNull(SearchEdit.Text)) then
   begin
     cxGridDBTableView1.DataController.DataSet.Filtered := False;
   end
  else
   begin
     try
       cxGridDBTableView1.DataController.DataSet.Filtered := False;
       FltStr := 'UPPER('+
            AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])+') LIKE ''' +
            '%'+AnsiUpperCase(SearchEdit.Text) + '%'' and '+Fields[0]+' is not null';
       if  (AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])=AnsiUpperCase(Fields[1])) then
       FltStr := AnsiUpperCase(Fields[1])+' LIKE ''' +
            '%'+(SearchEdit.Text) + '%'' and '+Fields[0]+' is not null '+
            'and '+Fields[1]+' is not null';
       cxGridDBTableView1.DataController.DataSet.Filter:=FltStr;
       cxGridDBTableView1.DataController.DataSet.Filtered := True;
       cxGridDBTableView1.ViewData.Expand(False);
       cxGridDBTableView1.DataController.SelectRows(0, 0);
     except
     end;
    end;

    if (cxCB_FieldName.ItemIndex=2)  then
    begin
    if SearchEdit.Text='' then
    begin
     tab_n:=-1;
     FIO:='nl';
        CertSet.Close;
        CertSet.SQLs.SelectSQL.Clear;
        CertSet.SQLs.SelectSQL.Text:='select * from UP_DT_CERT_FILTR_TAB_NOM(:tab_n,:FIO)';
        CertSet.ParamByName('TAB_N').Value:=tab_n;
        CertSet.ParamByName('FIO').Value:=FIO;
        CertSet.Open;
    end
    else
        begin
         try
            tab_n := StrToInt(SearchEdit.Text);
        except
            tab_n :=-1;
        end;
         if tab_n =-1 then
         begin
            Fio := SearchEdit.Text;
            tab_n:=-1;
            end

         else begin
         Tab_n :=strtoint(SearchEdit.Text) ;
         Fio := 'nl';
     end;
        CertSet.Close;
        CertSet.SQLs.SelectSQL.Clear;
        CertSet.SQLs.SelectSQL.Text:='select * from UP_DT_CERT_FILTR_TAB_NOM(:tab_n,:FIO)';
        CertSet.ParamByName('TAB_N').AsInteger:=tab_n;
        CertSet.ParamByName('FIO').AsString:=FIO;
        CertSet.Open;
        end;
    end;

    if (cxCB_FieldName.ItemIndex=3)  then
        begin
            if SearchEdit.Text='' then
                begin
                   NOM_POS:='nl';
                   SER_POS:='nl';
                   CertSet.Close;
                   CertSet.SQLs.SelectSQL.Clear;
                   CertSet.SQLs.SelectSQL.Text:='select * from UP_DT_CERT_FILTR_NOM_POSVID(:NOM_POS, :SER_POS)';
                   CertSet.ParamByName('NOM_POS').Value:=NOM_POS;
                   CertSet.ParamByName('SER_POS').Value:=SER_POS;
                   CertSet.Open;
                end
        else
            begin
                i:=pos('/',SearchEdit.Text);
                begin
                    if i=0 then
                    begin
                        NOM_POS:=SearchEdit.Text;
                        SER_POS:='';
                    end
                    else
                    begin
                        SER_POS:=copy(SearchEdit.Text,i+1,length(SearchEdit.Text));
                        NOM_POS:=copy(SearchEdit.Text,0,i-1);
                    end;
                end;
                CertSet.Close;
                CertSet.SQLs.SelectSQL.Clear;
                CertSet.SQLs.SelectSQL.Text:='select * from UP_DT_CERT_FILTR_NOM_POSVID(:NOM_POS,:SER_POS)';
                CertSet.ParamByName('NOM_POS').AsString:=NOM_POS;
                CertSet.ParamByName('SER_POS').AsString:=SER_POS;
                CertSet.Open;
            end;

        end;
end;

procedure TfmReqCertificate.showActionExecute(Sender: TObject);
var
    frm: TfmAddReqCertificate;
    StoredProcCert: TpFIBStoredProc;
    id_req_cert: Integer;
begin
    frm := TfmAddReqCertificate.Create(Self, 1, 0, 0, LocalDatabase.Handle);
    frm.Caption := 'Змінити ' + frm.Caption;
    frm.DateReq.Date := StrToDate(CertSet.FieldByName('DATE_REQUEST').AsString);
    frm.FormListButton.Enabled:=false;
    frm.dxAddPositionButton.Enabled:=false;
    frm.dxDelPositionButton.Enabled:=false;
    frm.dxBarLargeButton1.Enabled:=false;
    frm.OkButton.Enabled:=false;
    frm.DateReq.Enabled:=false;
    StoredProcCert := TpFIBStoredProc.Create(self);
    StoredProcCert.Database := LocalDatabase;
    StoredProcCert.Transaction := LocalWriteTransaction;
    StoredProcCert.Close;

    id_req_cert := CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsInteger;
    StoredProcCert.StoredProcName := 'UP_DT_MAN_CERT_CREATE_INFO';
    StoredProcCert.ParamByName('ID_REQ_CERT').Value := id_req_cert;
    StoredProcCert.ParamByName('KEY_SESSION').AsInteger := frm.GetKeySession;
    LocalWriteTransaction.StartTransaction;
    //StartHistory(LocalWriteTransaction);
    StoredProcCert.ExecProc;
    StoredProcCert.Close;
    LocalWriteTransaction.Commit;
    frm.PeopleSet.Close;
    frm.PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(frm.GetKeySession) + ',' + '''' + DateTostr(frm.DateReq.Date) + '''' + ')';
    frm.PeopleSet.Open;

    CertSet.Close;
    CertSet.Open;
    //CertSet.Locate('ID_REQUEST_CERTIFICATE',id_req_cert,[]);
    frm.showmodal;
    frm.free;
end;

procedure TfmReqCertificate.ViewCertExecute(Sender: TObject);
var
    frm: TfmAddReqCertificate;
    StoredProcCert: TpFIBStoredProc;
    NagScreen:TNagScreen;
    Check:Integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'View');
    if check<>0 then
    begin
        agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
        exit;
    end;
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримуються дані...');
    frm := TfmAddReqCertificate.Create(Self, 0, 0, 0, LocalDatabase.Handle);
    frm.Caption := 'Перегляд заявки';
    frm.DateReq.Date := StrToDate(CertSet.FieldByName('DATE_REQUEST').AsString);
    frm.FormListButton.Enabled:=false;
    frm.dxAddPositionButton.Enabled:=false;
    frm.dxDelPositionButton.Enabled:=false;
    frm.dxBarLargeButton1.Enabled:=false;
    frm.OkButton.Enabled:=false;
    frm.DateReq.Enabled:=false;
    frm.dxBarLargeButton3.enabled:=false;
    frm.FotoCheck.Enabled:=False;
    frm.OkButton.Enabled:=false;
    StoredProcCert := TpFIBStoredProc.Create(self);
    StoredProcCert.Database := LocalDatabase;
    StoredProcCert.Transaction := LocalWriteTransaction;
    StoredProcCert.Close;

    id := CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsInteger;
    StoredProcCert.StoredProcName := 'UP_DT_MAN_CERT_CREATE_INFO';
    StoredProcCert.ParamByName('ID_REQ_CERT').Value := id;
    StoredProcCert.ParamByName('KEY_SESSION').AsInteger := frm.GetKeySession;
    LocalWriteTransaction.StartTransaction;
    //StartHistory(LocalWriteTransaction);
    StoredProcCert.ExecProc;
    StoredProcCert.Close;
    LocalWriteTransaction.Commit;
    frm.PeopleSet.Close;
    frm.PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(frm.GetKeySession) + ',' + '''' + DateTostr(frm.DateReq.Date) + '''' + ')';
    frm.PeopleSet.Open;
    frm.countActionExecute(Self);
    CertSet.Close;
    CertSet.Open;
    CertSet.Locate('ID_REQUEST_CERTIFICATE',ID,[]);
    frm.showmodal;
    frm.free;
    NagScreen.close;
    NagScreen.free;
end;

procedure TfmReqCertificate.cxCB_FieldNamePropertiesChange(Sender: TObject);
VAR Fltstr:string;
begin
   if cxCB_FieldName.ItemIndex=1 then
   begin
      SearchEdit.Visible:=false;
      DateSearch.Visible:=true;
      DateSearch.Date:=Date;
   end
   else
   begin
      SearchEdit.Visible:=true;
      DateSearch.Visible:=false;
      if (DateSearch.Text = '')or(VarIsNull(DateSearch.Text)) then
      begin
         cxGridDBTableView1.DataController.DataSet.Filtered := False;
      end
      else
      begin
      try
       cxGridDBTableView1.DataController.DataSet.Filtered := False;
       FltStr := 'UPPER('+
            AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])+') LIKE ''' +
            '%'+AnsiUpperCase(DateSearch.Text) + '%'' and '+Fields[0]+' is not null';
       if  (AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])=AnsiUpperCase(Fields[0])) then
       FltStr := AnsiUpperCase(Fields[1])+' LIKE ''' +
            '%'+(DateSearch.Text) + '%'' and '+Fields[0]+' is not null '+
            'and '+Fields[1]+' is not null';
       cxGridDBTableView1.DataController.DataSet.Filter:=FltStr;
       cxGridDBTableView1.DataController.DataSet.Filtered := True;
       cxGridDBTableView1.ViewData.Expand(False);
       cxGridDBTableView1.DataController.SelectRows(0, 0);
      except
      end;
    end;
   end;
end;

procedure TfmReqCertificate.DateSearchPropertiesChange(Sender: TObject);
VAR Fltstr:string;
begin
  if (DateSearch.Text = '')or(VarIsNull(DateSearch.Text)) then
   begin
     cxGridDBTableView1.DataController.DataSet.Filtered := False;
   end
  else
   begin
     try
       cxGridDBTableView1.DataController.DataSet.Filtered := False;
       FltStr := 'UPPER('+
            AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])+') LIKE ''' +
            '%'+AnsiUpperCase(DateSearch.Text) + '%'' and '+Fields[0]+' is not null';
       if  (AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])=AnsiUpperCase(Fields[0])) then
       FltStr := AnsiUpperCase(Fields[1])+' LIKE ''' +
            '%'+(DateSearch.Text) + '%'' and '+Fields[0]+' is not null '+
            'and '+Fields[1]+' is not null';
       cxGridDBTableView1.DataController.DataSet.Filter:=FltStr;
       cxGridDBTableView1.DataController.DataSet.Filtered := True;
       cxGridDBTableView1.ViewData.Expand(False);
       cxGridDBTableView1.DataController.SelectRows(0, 0);
     except
     end;
    end;


end;

procedure TfmReqCertificate.cxGridDBTableView1DblClick(Sender: TObject);
begin
ModifyCertExecute(Self);
end;

procedure TfmReqCertificate.printActionExecute(Sender: TObject);
Var Check:Integer;
    NagScreen:TNagScreen;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Print');
    if check<>0 then
    begin
        agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
        exit;
    end;
    if CertSet.IsEmpty then
    begin
        agMessageDlg('Увага!', 'Не має записів', mtInformation, [mbOK]);
        Exit;
    end;
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Формується звіт...');
    ID := CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsInteger;
    ReportSet.Close;
    ReportSet.SelectSQL.Text := 'SELECT * FROM UP_REPORT_REQ_CERT(' + IntToStr(ID) + ')';
    ReportSet.Open;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\'+'UpReqCertificate.fr3',True);
    if VarIsNull(CertSet['id_level']) then
        Report.Variables['chernetka']:=quotedStr(IntToStr(1))
    else
        Report.Variables['chernetka']:=quotedStr(IntToStr(0));
    Report.PrepareReport(true);
    Report.ShowReport(true);
    NagScreen.Free;
end;

procedure TfmReqCertificate.dxBarLargeButton3Click(Sender: TObject);
begin
    ID := CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsInteger;
    ReportSet.Close;
    ReportSet.SelectSQL.Text := 'SELECT * FROM UP_REPORT_REQ_CERT(' + IntToStr(ID) + ')';
    ReportSet.Open;
    if VarIsNull(CertSet['id_level']) then  Report.Variables['chernetka']:=quotedStr(IntToStr(1))
    else Report.Variables['chernetka']:=quotedStr(IntToStr(0));
    Report.ShowReport;
end;

procedure TfmReqCertificate.dxBarLargeButton4Click(Sender: TObject);
begin
    ID := CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsInteger;
    ReportSmetSet.Close;
    ReportSmetSet.SelectSQL.Text := 'SELECT * FROM UP_REPORT_DEP_REQ_CERT(' + IntToStr(ID) + ') order by name_department_upper collate win1251_ua, name_department collate win1251_ua';
    ReportSmetSet.Open;
    ReportSmet.ShowReport;
end;

procedure TfmReqCertificate.SIGNACTIONExecute(Sender: TObject);
var Id_Req_Cert:Integer;
begin
   try
    If VarIsNull(CertSet['ID_REQUEST_CERTIFICATE']) then exit;
    Id_Req_Cert:=CertSet['ID_REQUEST_CERTIFICATE'];
    //CertSet.Locate('ID_REQUEST_CERTIFICATE', ID, []);
    If CheckSignActionByIdUser('SIGN', 1) then
    begin
        dxAddPositionButton.Enabled:=False;
        dxEditPositionButton.Enabled:=False;
        dxErrorButton.Enabled:=False;
        dxBarLargeButton1.Enabled:=False;
        dxBarLargeButton5.Enabled:=False;
        dxBarLargeButton6.Enabled:=False;
        dxBarLargeButton7.Enabled:=False;
        dxBarLargeButton8.Enabled:=False;
        dxBarLargeButton9.Enabled:=False;
        dxCloseButton.Enabled:=False;
        if CertificateLevel(Id_Req_Cert, 1) then
        begin
          LevelSet.Close;
          LevelSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_DT_REQ_CERT_LEV_SEL(:ID_REQ_CERT)';
          LevelSet.ParamByName('ID_REQ_CERT').AsInteger:=Id_Req_Cert;
          LevelSet.Open;
          SaveInfoCertPath(Id_Req_Cert,LevelSet['N'],GetUserId,1);
        end
        else
        begin
          //  MessageDlg('',mtInformation,[mbOK],0);
        end;
    end;
    dxAddPositionButton.Enabled:=True;
    dxEditPositionButton.Enabled:=True;
    dxErrorButton.Enabled:=True;
    dxBarLargeButton1.Enabled:=True;
    dxBarLargeButton5.Enabled:=True;
    dxBarLargeButton6.Enabled:=True;
    dxBarLargeButton7.Enabled:=True;
    dxBarLargeButton8.Enabled:=True;
    dxBarLargeButton9.Enabled:=True;
    dxCloseButton.Enabled:=True;
    If VarIsNull(LevelSet['N']) then dxDelPositionButton.Enabled:=True
    Else dxDelPositionButton.Enabled:=False;
    CertSet.Close;
    CertSet.Open;
    CertSet.Locate('ID_REQUEST_CERTIFICATE', Id_Req_Cert, []);
  except on e:exception
  do begin
        ShowMessage(e.Message);
     end;
  end;
end;

procedure TfmReqCertificate.UNSIGNACTIONExecute(Sender: TObject);
var Id_Req_Cert:Variant;
begin
    If VarIsNull(CertSet['ID_REQUEST_CERTIFICATE']) then exit;
    Id_Req_Cert:=CertSet['ID_REQUEST_CERTIFICATE'];
    If CheckSignActionByIdUser('UNSIGN', 0) then
    begin
        dxAddPositionButton.Enabled:=False;
        dxEditPositionButton.Enabled:=False;
        dxErrorButton.Enabled:=False;
        dxBarLargeButton1.Enabled:=False;
        dxBarLargeButton5.Enabled:=False;
        dxBarLargeButton6.Enabled:=False;
        dxBarLargeButton7.Enabled:=False;
        dxBarLargeButton8.Enabled:=False;
        dxBarLargeButton9.Enabled:=False;
        dxCloseButton.Enabled:=False;    
        if CertificateLevel(Id_Req_Cert, -1) then
        begin
          CertSet.CloseOpen(true);
          LevelSet.Close;
          LevelSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_DT_REQ_CERT_LEV_SEL(:ID_REQ_CERT)';
          LevelSet.ParamByName('ID_REQ_CERT').AsInteger:=Id_Req_Cert;
          LevelSet.Open;
          SaveInfoCertPath(Id_Req_Cert,LevelSet['N'],GetUserId,0);
        end;
    end;
    dxAddPositionButton.Enabled:=True;
    dxEditPositionButton.Enabled:=True;
    dxErrorButton.Enabled:=True;
    dxBarLargeButton1.Enabled:=True;
    dxBarLargeButton5.Enabled:=True;
    dxBarLargeButton6.Enabled:=True;
    dxBarLargeButton7.Enabled:=True;
    dxBarLargeButton8.Enabled:=True;
    dxBarLargeButton9.Enabled:=True;
    dxCloseButton.Enabled:=True;
    If VarIsNull(LevelSet['N']) Then dxDelPositionButton.Enabled:=True
    Else dxDelPositionButton.Enabled:=False;
    CertSet.Locate('ID_REQUEST_CERTIFICATE', Id_Req_Cert, []);
end;

procedure TfmReqCertificate.cxGrid1Click(Sender: TObject);
begin
 {id_req:=CertSet['ID_REQUEST_CERTIFICATE'];
    id_level:=CertSet['ID_LEVEL'];
    if id_level<>0 then
      begin
          dxBarLargeButton5.enabled:=true;
      end;
     {if id_level=499 then
    begin

          dxBarLargeButton5.enabled:=false;
          dxBarLargeButton6.enabled:=true;
    end;  }
end;

procedure TfmReqCertificate.cxGridDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
    If not VarIsNull(CertSet['ID_LEVEL']) then
    begin
        dxDelPositionButton.enabled:=false;
        exit;
    end
    else  dxDelPositionButton.enabled:=true;
end;

procedure TfmReqCertificate.cxGridDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    If not VarIsNull(CertSet['ID_LEVEL']) then
    begin
        dxDelPositionButton.enabled:=false;
        exit;
    end
    else  dxDelPositionButton.enabled:=true;
end;

procedure TfmReqCertificate.printSmetActionExecute(Sender: TObject);
Var Check:Integer;
    NagScreen:TNagScreen;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Print');
    if check<>0 then
    begin
        agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
        exit;
    end;
    if CertSet.IsEmpty then
    begin
        agMessageDlg('Увага!', 'Не має записів', mtInformation, [mbOK]);
        Exit;
    end;
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Формується звіт...');
    ID := CertSet.FieldByName('ID_REQUEST_CERTIFICATE').AsInteger;
    ReportSmetSet.Close;
    ReportSmetSet.SelectSQL.Text := 'SELECT * FROM UP_REPORT_DEP_REQ_CERT(' + IntToStr(ID) + ') order by name_department_upper collate win1251_ua, name_department collate win1251_ua';
    ReportSmetSet.Open;
    ReportSmet.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\'+'UpReqCertificateSmet.fr3',True);
    if VarIsNull(CertSet['id_level']) then
        ReportSmet.Variables['chernetka']:=quotedStr(IntToStr(1))
    else
        ReportSmet.Variables['chernetka']:=quotedStr(IntToStr(0));
    ReportSmet.PrepareReport(True);
    ReportSmet.ShowReport;
    NagScreen.Free;
end;

procedure TfmReqCertificate.SmetaSummaExecute(Sender: TObject);
var SummSmet: TpFibStoredProc;
    UpdSmetSum:TpFIBDataset;
    CertSmetForm:TReqCertificateSmets;
    check, def_smeta:Integer;
    def_sum:Double;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate/CertificateSmetEdit', 'Edit');
  if check<>0 then
  begin
      agMessageDlg('Увага!', 'Помилка: Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
  end;
  UpdSmetSum:=TpFIBDataSet.Create(Self);
  UpdSmetSum.Database:=LocalDatabase;
  UpdSmetSum.Transaction:=LocalWriteTransaction;
  UpdSmetSum.Close;

  SummSmetaSet.Close;
  SummSmetaSet.SQLs.SelectSQL.Text:='Select def_smeta, def_sum From asup_ini_reports';
  SummSmetaSet.Open;
  def_smeta:=SummSmetaSet['def_smeta'];
  def_sum:=SummSmetaSet['def_sum'];
  CertSmetForm:=TReqCertificateSmets.Create(Self);
  CertSmetForm.SmetCheck.Visible:=false;
  CertSmetForm.SmetaSet.close;
  CertSmetForm.SmetaSet.SQLs.SelectSQL.Text:='Select * from UP_REQ_CERT_SMET_SEL(:sm)';
  CertSmetForm.SmetaSet.ParamByName('sm').AsInteger:=def_smeta;
  CertSmetForm.SmetaSet.Open;
  CertSmetForm.id_smeta:=CertSmetForm.SmetaSet['ID_SM'];
  CertSmetForm.KodSmet.Text:=inttostr(CertSmetForm.id_smeta);
  CertSmetForm.NameSmet.DisplayText:=CertSmetForm.SmetaSet['SM_NAME'];
  CertSmetForm.SumSmet.text:=floattostr(def_sum);
  SummSmet:=TpFibStoredProc.Create(Self);
  SummSmet.Database:=LocalDatabase;
  SummSmet.Transaction:=LocalWriteTransaction;
  SummSmet.Transaction.StartTransaction;
  if CertSmetForm.ShowModal=mrok then
  begin
      UpdSmetSum.SQLs.SelectSQL.Text:='update asup_ini_reports set def_smeta=:d_smet, def_sum=:d_sum where id=1';
      UpdSmetSum.ParamByName('d_smet').AsInteger:=strtoint(CertSmetForm.KodSmet.Text);
      UpdSmetSum.ParamByName('d_sum').AsDouble:=strtofloat(CertSmetForm.SumSmet.Text);
      UpdSmetSum.Open;
      UpdSmetSum.Transaction.Commit;
  end;
  SummSmet.Free;
  CertSmetForm.Free;
end;

procedure TfmReqCertificate.dxPathButtonClick(Sender: TObject);
var CertPath:THistSigns;
begin
    CertPath:=THistSigns.Create(Self);
    CertPath.HistSignsDataSet.Close;
    CertPath.HistSignsDataSet.SQLs.SelectSQL.Text:='select distinct * from UP_DT_CERT_PATH_SEL(:Id_Req_Cert) order by id_path, type_move desc';
    CertPath.HistSignsDataSet.ParamByName('Id_Req_Cert').AsInteger:=CertSet['ID_REQUEST_CERTIFICATE'];
    CertPath.HistSignsDataSet.Open;
    //CertPath.Id_Req_Cert:=CertSet['ID_REQUEST_CERTIFICATE'];
    CertPath.ShowModal;
    CertPath.Free;

end;

procedure TfmReqCertificate.PrintManCertExecute(Sender: TObject);
Var ID, i:Integer;
    Check:Integer;
begin
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate', 'Print');
    if check<>0 then
    begin
        agMessageDlg('Помилка!','Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
        exit;
    end;
   If CertSet.IsEmpty Then
   begin
       agMessageDlg('Увага!', 'Реєстр посвідчень немає записів!', mtInformation, [mbOK]);
       Exit;
   end;
   if VarIsNull(CertSet['id_level']) then
   begin
      if ((VarIsNull(IniReports['actual_req_cert_shablon'])) Or (IniReports['actual_req_cert_shablon']='')) then
      begin
         agMessageDlg('Увага!', 'Не знайдено шаблон друку!', mtInformation, [mbOK]);
         Exit;
      end
   end
   else
   begin
      If ((VarIsNull(CertSet['Shablon_Print'])) Or (CertSet['Shablon_Print']='')) then
      begin
         agMessageDlg('Увага!', 'Не знайдено шаблон друку!', mtInformation, [mbOK]);
         Exit;
      end;
   end;
   NagScreen := TNagScreen.Create(self);
   NagScreen.Show;
   NagScreen.SetStatusText('Формуються дані...');
   ImageDB.Handle:=GetImageDBHandle(LocalDatabase.Handle);
   ID:=CertSet['ID_REQUEST_CERTIFICATE'];
   ManCertSet.Close;
   ManCertSet.SQLs.SelectSQL.Text:='select distinct * '+
                                   'from up_dt_man_cert_print(:in_id_req_cert) '+
                                   'order by fio collate win1251_ua';
   ManCertSet.ParamByName('in_id_req_cert').AsInt64:=ID;
   FotoByMan.SQLs.SelectSQL.Text:='select first(1) foto_icon '+
                                  'from FOTO_MAIN '+
                                  'where id_man=?out_id_man';
   try
     ManCertSet.Open;
     FotoByMan.Open;
     if VarIsNull(CertSet['id_level']) then
     begin
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\'+IniReports['actual_req_cert_shablon'],True);
        Report.Variables['chernetka']:=quotedStr(IntToStr(1));
     end
     else
     begin
        Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Up\'+CertSet['Shablon_Print'],True);
        Report.Variables['chernetka']:=quotedStr(IntToStr(0));
     end;
     Report.PrepareReport(True);
     report.ShowReport(True);
     for i:=0 to ImageDB.TransactionCount-1 do
     begin
         if ImageDB.Transactions[i].Active then ImageDB.Transactions[i].Commit;
     end;
     ImageDB.Close;
     NagScreen.Free;
   except on e:exception
   do begin
         agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
         ManCertSet.Close;
         FotoByMan.Close;
         NagScreen.Free;
      end;
   end;

end;

procedure TfmReqCertificate.ActReqCertHstExecute(Sender: TObject);
var frm:TfrmReqCertHst;
begin
   try
    frm:=TfrmReqCertHst.Create(Self, CertSet['ID_REQUEST_CERTIFICATE']);
    frm.ShowModal;
    frm.Free;
   except on e:Exception
   do begin
         ShowMessage(e.Message);
      end;
   end;
end;

end.



