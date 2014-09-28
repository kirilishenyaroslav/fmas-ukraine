unit fmAddReqCertificateUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCharControl, uFloatControl, uFControl, uLabeledFControl,
    uDateControl, ActnList, StdCtrls, Buttons, uFormControl, uInvisControl,
    DateUtils, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
    cxClasses, ExtCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
    cxCalendar, dxBar, dxBarExtItems, ImgList, FIBDataSet, pFIBDataSet,
    pFIBStoredProc, uCommonSp ,cxCheckBox, cxButtonEdit, iBase, UpKernelUnit,
    AppStruClasses, AccMgmt, FIBDatabase, pFIBDatabase,IniFiles, uReqCommon;

type
    TfmAddReqCertificate = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        KeyList: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
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
        ItemsGrid: TcxGrid;
        cxGridDBTableView5: TcxGridDBTableView;
        cxGridDBTableView5DBColumn1: TcxGridDBColumn;
        cxGridDBTableView5DBColumn2: TcxGridDBColumn;
        cxGridDBTableView5DBColumn5: TcxGridDBColumn;
        cxGridDBTableView5DBColumn3: TcxGridDBColumn;
        cxGridDBTableView5DBColumn4: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        Panel1: TPanel;
        FormListButton: TBitBtn;
        Label6: TLabel;
        DateReq: TcxDateEdit;
        Panel2: TPanel;
        IL_OrdAcc: TImageList;
        dxBarManager1: TdxBarManager;
        dxAddPositionButton: TdxBarLargeButton;
        dxDelPositionButton: TdxBarLargeButton;
        dxSmDelButton: TdxBarLargeButton;
        dxDelPositionButtonOne: TdxBarLargeButton;
        dxDelPositionButtonAll: TdxBarLargeButton;
        dxCloseButton: TdxBarLargeButton;
        dxBarLargeButton1: TdxBarLargeButton;
        AddPcard: TAction;
        EditPcard: TAction;
        DelPcard: TAction;
        RenewPcard: TAction;
        ViewPcard: TAction;
        PeopleSet: TpFIBDataSet;
        PeopleDataSource: TDataSource;
        cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    Panel3: TPanel;
    DataRet: TpFIBDataSet;
    dxBarLargeButton2: TdxBarLargeButton;
    countAction: TAction;
    checkerAction: TAction;
    DataSet: TpFIBDataSet;
    DataSet1: TpFIBDataSet;
    cxGridDBTableView5DBColumn7: TcxGridDBColumn;
    cxGridDBTableView5DBColumn8: TcxGridDBColumn;
    dxBarLargeButton3: TdxBarLargeButton;
    summ_smeta: TAction;
    summ_count: TAction;
    Label1: TLabel;
    PanelGroup: TcxCheckBox;
    cxGridDBTableView5DBColumn9: TcxGridDBColumn;
    DeleteSet: TpFIBDataSet;
    DBFoto: TpFIBDatabase;
    pFIBTrans: TpFIBTransaction;
    FotoSet: TpFIBDataSet;
    cxGridDBTableView5DBColumn10: TcxGridDBColumn;
    FotoCheck: TcxCheckBox;
        procedure OkActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure FormControlNewRecordAfterPrepare(Sender: TObject);
        procedure FormListButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure cxGridDBTableView5DBColumn1PropertiesButtonClick(
            Sender: TObject; AButtonIndex: Integer);
        procedure cxGridDBTableView5KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure AddPcardExecute(Sender: TObject);
        procedure LoadDataFromFilter;
    procedure DelPcardExecute(Sender: TObject);
    procedure RenewPcardExecute(Sender: TObject);
    procedure countActionExecute(Sender: TObject);
    procedure checkerActionExecute(Sender: TObject);
    procedure cxGridDBTableView5DblClick(Sender: TObject);
    procedure ViewPcardExecute(Sender: TObject);
    procedure ShowErrors(Var Key_ses:Integer);
    procedure cxGridDBTableView5CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure summ_smetaExecute(Sender: TObject);
    procedure summ_countExecute(Sender: TObject);
    procedure PanelGroupPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpdImageMan;
    procedure ClearTempTab (Var Key_Ses:int64);
    procedure FormShow(Sender: TObject);
    function GetKeySession:Int64;
     // function CheckUserInfo(pIdUser:Int64; pass:AnsiString): Boolean; stdcall;
    private
        id_smets:Integer;
        id_user: Integer;
        Key_session_filter: int64;
        Is_Give_Cert:Integer; //Флаг для возможности изменения чекера в заявке
        Is_Del_Cert:Integer; //Флаг удалять заявку
        Close_Req:Integer;
        Key_session: int64;
        DbHand:TISC_DB_HANDLE;
        IdReqCertificate:Integer;
    { Private declarations }
    public
        PC: TFMASAppModule;
        constructor Create(AOwner:TComponent; IsGiveC, IsDelC, CloseC:Integer; HND:TISC_DB_HANDLE);
    end;

var
    fmAddReqCertificate: TfmAddReqCertificate;

implementation

{$R *.dfm}
uses fmReqCertificateUnit, fmCertSave,fmHistSigns ,fmReqCertificateSmets,
     BaseTypes,fmReqCertiifcateErrorForm, WinSock;

constructor TfmAddReqCertificate.Create(AOwner:TComponent; IsGiveC, IsDelC, CloseC:Integer; HND:TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    Self.Is_Give_Cert:=IsGiveC;
    Self.Is_Del_Cert:=IsDelC;
    Self.Close_Req:=CloseC;
    Self.DbHand:=HND;
end;


function TfmAddReqCertificate.GetKeySession:Int64;
begin
    Result:=Self.Key_session;
end;


procedure TfmAddReqCertificate.ClearTempTab (Var Key_Ses:int64);
Var DelFotoSpr:TpfibDataSet;
begin
   DelFotoSpr:=TpFIBDataSet.Create(Self);
   DelFotoSpr.Database:=TfmReqCertificate(Owner).LocalDatabase;
   DelFotoSpr.Transaction:=TfmReqCertificate(Owner).WorkWriteTransaction;
   DelFotoSpr.Transaction.StartTransaction;
   DelFotoSpr.Close;
   DelFotoSpr.Sqls.SelectSQL.Text:='delete from UP_DT_CERT_TEMP_FOTO where key_session=:key_s';
   DelFotoSpr.ParamByName('key_s').AsInteger:=Key_Ses;
   DelFotoSpr.Open;
   DelFotoSpr.Transaction.Commit;

   DelFotoSpr.Transaction.StartTransaction;
   DelFotoSpr.Close;
   DelFotoSpr.SQLs.SelectSQL.Clear;
   DelFotoSpr.Sqls.SelectSQL.Text:='delete from UP_DT_CERT_TEMP where key_session=:key_s';
   DelFotoSpr.ParamByName('key_s').AsInteger:=Key_Ses;
   DelFotoSpr.Open;
   DelFotoSpr.Transaction.Commit;
end;

procedure TfmAddReqCertificate.UpdImageMan;
var InsFoto, FotoSel:TpFibDataSet;
    i:Integer;
begin
   InsFoto:=TpFibDataSet.Create(Self);
   InsFoto.Database:=TfmReqCertificate(owner).LocalDatabase;
   InsFoto.Transaction:=TfmReqCertificate(owner).WorkWriteTransaction;
   DBFoto.Handle:=GetImageDBHandle(Self.DbHand);
   FotoSel:=TpFibDataSet.Create(Self);
   FotoSel.Database:=DBFoto;
   FotoSel.Transaction:=pFIBTrans;
   FotoSel.Close;
   FotoSel.SelectSQL.Clear;
   FotoSel.SQLs.SelectSQL.Text:='select distinct id_man from FOTO_MAIN';
   FotoSel.Open;
   FotoSel.FetchAll;
   FotoSel.First;
   for i:=0 to FotoSel.RecordCount-1 do
   begin
      InsFoto.Transaction.StartTransaction;
      InsFoto.Close;
      InsFoto.SelectSQL.Text:='insert into UP_DT_CERT_TEMP_FOTO(key_session,id_man) values('+inttostr(key_session)+','+inttostr(FotoSel['id_man'])+')';
      InsFoto.Open;
      InsFoto.Transaction.Commit;
      FotoSel.Next;
   end;
   DBFoto.Connected:=false;
   DBFoto.DefaultTransaction.Active:=False;
end;

procedure TfmAddReqCertificate.ShowErrors(var Key_ses:Integer);
var frm:TErrorForm;
begin
    //showmessage('yes');
    frm:=TErrorForm.Create(Self);
    frm.dataSet1.close;
    frm.Dataset1.SQLs.SelectSQL.Text:='select * from UP_DT_CERT_PEOPLE_TEMP_SEL_2(:KEY_SES, :DATE_REQ)';
    frm.Dataset1.ParamByName('KEY_SES').AsInteger:=key_ses;
    frm.Dataset1.ParamByName('DATE_REQ').AsDate:=DateReq.Date;
    frm.DataSet1.Open;
    frm.ShowModal;
    frm.free;
end;

{function TfmAddReqCertificate.CheckUserInfo(pIdUser:Int64; pass:AnsiString): Boolean;
begin
showmessage('CheckUserInfo');

end;  }


procedure TfmAddReqCertificate.OkActionExecute(Sender: TObject);
var sp: TSprav;
max_count,key_s1,k:Integer;
res:Boolean;
begin
    DataRet.Close;
    DataRet.SQLs.SelectSQL.Text:='SELECT DISTINCT USIC.MAX_COUNT_MAN_REQUEST FROM UP_SYS_INI_CONSTS  USIC';
    DataRet.Open;
    max_count:=DataRet['MAX_COUNT_MAN_REQUEST'];
    PeopleSet.FetchAll;
    if PeopleSet.RecordCount>max_count then
    begin
        agMessageDlg('Увага!', 'Кількість посвідчень не може перевищувати '+inttostr(max_count)+' у рамках однієї сесії!', mtInformation, [mbOK]);
        //showmessage('Увага! Кількість посвідчень не може перевищувати '+inttostr(max_count)+' у рамках однієї сесії!');
        exit;
    end;
    if PeopleSet.RecordCount=0 then
    begin
        agMessageDlg('Увага!', 'Треба додати запис або відмінити заявку', mtInformation, [mbOK]);
        exit;
    end;
    PeopleSet.Close;
    PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(KEY_SESSION) + ',' + '''' + DateTostr(DateReq.Date) + '''' + ')';
    PeopleSet.Open;
    key_s1:=PeopleSet['KEY_SESSION'];
    //showmessage('key= '+inttostr(key_s1));
    dataSet1.close;
    dataset1.SQLs.SelectSQL.Text:='select * from UP_DT_CERT_PEOPLE_TEMP_SEL_2(' + inttostr(key_s1)+ ',' + '''' + DateTostr(DateReq.Date) + '''' + ') ';
    DataSet1.Open;
    Dataset1.FetchAll;
    k:=DataSet1.RecordCount;
    //showmessage(inttostr(k));
    if (k>0) then  ShowErrors(key_s1)
    else
    begin
        sp := GetSprav('ASUP\LogInForma');
        if sp <> nil then
        begin
           with sp.Input do
           begin
              Append;
              FieldValues['DBHandle']   := Integer(Self.DbHand);
              //showmessage('gluk');
              FieldValues['Select']     := 1;
              Post;
           end;
           sp.Show;
           if ( sp.Output <> nil ) and not sp.Output.IsEmpty  then
           begin
              //showmessage(inttostr(GetUserId));
              res:=CheckUserInfo(GetUserId,Sp.Output['PASS']);
              if res=false then
              begin
                 agMessageDlg('Увага!', 'Помилка: невірний пароль! ',mtError,[mbOk]);
                 //showmessage('У вас немає прав на цю дію');
                 exit;
              end
              else
                Self.Close_Req:=1;
                ClearTempTab(Key_session);
                ModalResult := MrOK;
            end;
        end;
    end;//ModalResult := MrOK;
end;

procedure TfmAddReqCertificate.CancelActionExecute(Sender: TObject);
//var DeleteSP: TpFibStoredProc;
begin
    ClearTempTab(Key_session);
    ModalResult:=mrCancel;
end;

procedure TfmAddReqCertificate.FormControlNewRecordAfterPrepare(
    Sender: TObject);
var
    y, m, d: Word;
begin
    DecodeDate(Date, y, m, d);

    //AktDate.Value := Date;
   // PeriodBeg.Value := EncodeDate(y, m, 1);
   // PeriodEnd.Value := EncodeDate(y, m, DaysInMonth(Date));
end;

procedure TfmAddReqCertificate.FormListButtonClick(Sender: TObject);
var
    StoredPeople{, Strproc}: TpFIBStoredProc;
    count_posvid,count_1,count_2, max_count, cnt_pc:Integer;
begin
   // flag:=true;
    DataRet.Close;
    DataRet.SQLs.SelectSQL.Text:='SELECT DISTINCT USIC.MAX_COUNT_MAN_REQUEST FROM UP_SYS_INI_CONSTS  USIC';
    DataRet.Open;
    max_count:=DataRet['MAX_COUNT_MAN_REQUEST'];
    PeopleSet.Close;
    PeopleSet.SelectSQL.Clear;
    PeopleSet.SQLs.SelectSQL.Text:='SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(KEY_SESSION) + ',' + '''' + DateTostr(DateReq.Date) + '''' + ')';
    PeopleSet.Open;
    PeopleSet.FetchAll;
    count_1:=PeopleSet.RecordCount;
    StoredPeople := TpFibStoredProc.Create(self);
    StoredPeople.Database := TfmReqCertificate(owner).LocalDatabase;
    StoredPeople.Transaction := TfmReqCertificate(owner).WorkWriteTransaction;
    StoredPeople.Close;
    if FotoCheck.Checked then
    begin
        //UpdImageMan;
        if max_count-count_1=0 then exit;
        StoredPeople.Transaction.StartTransaction;
        StoredPeople.StoredProcName := 'UP_DT_MAN_CERT_INS_WF';
        StoredPeople.ParamByName('KEY_SESSION').AsInteger := Key_session;
        StoredPeople.ParamByName('DATE_REQUEST').AsDate := DateReq.Date;
        StoredPeople.ParamByName('ID_REQUEST_CERTIFICATE').AsInt64 := TfmReqCertificate(owner).ID;
        StoredPeople.ParamByName('COL_PEOPLE').AsInteger :=max_count-count_1  ;
        StoredPeople.ExecProc;
        cnt_pc:=StoredPeople.FieldByName('cnt_pc').AsInteger;
        //showmessage(inttostr(id_pcard));
        StoredPeople.Close;
        StoredPeople.Transaction.Commit;
        StoredPeople.Free;
        PeopleSet.Close;
        PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(KEY_SESSION) + ',' + '''' + DateTostr(DateReq.Date) + '''' + ')';
        PeopleSet.Open;
        PeopleSet.FetchAll;
        count_2:=PeopleSet.RecordCount;
        count_posvid:=count_2-count_1;
        //ShowMessage('Відобрано - '+inttostr(count_posvid)+' співробітників із '+inttostr(cnt_pc)+' заявлених');
        agMessageDlg('Увага!', 'Відобрано - '+inttostr(count_posvid)+' співробітників із '+inttostr(cnt_pc)+' заявлених',mtInformation,[mbOk]);
        Label1.Caption:='Кількість: '+inttostr(count_2);
    end
    else
    begin
        if max_count-count_1=0 then exit;
        StoredPeople.Transaction.StartTransaction;
        StoredPeople.StoredProcName := 'UP_DT_MAN_CERT_INS';
        StoredPeople.ParamByName('KEY_SESSION').AsInteger := Key_session;
        StoredPeople.ParamByName('DATE_REQUEST').AsDate := DateReq.Date;
        StoredPeople.ParamByName('ID_REQUEST_CERTIFICATE').AsInt64 := TfmReqCertificate(owner).ID;
        StoredPeople.ParamByName('COL_PEOPLE').AsInteger :=max_count-count_1  ;
        StoredPeople.ExecProc;
        //id_pcard:=StoredPeople.FieldByName('id_pcard').AsInteger;
        cnt_pc:=StoredPeople.FieldByName('cnt_pc').AsInteger;
        //showmessage(inttostr(id_pcard));
        StoredPeople.Close;
        StoredPeople.Transaction.Commit;
        StoredPeople.Free;
        PeopleSet.Close;
        PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(KEY_SESSION) + ',' + '''' + DateTostr(DateReq.Date) + '''' + ')';
        PeopleSet.Open;
        PeopleSet.FetchAll;
        count_2:=PeopleSet.RecordCount;
        count_posvid:=count_2-count_1;
        agMessageDlg('Увага!', 'Відобрано - '+inttostr(count_posvid)+' співробітників із '+inttostr(cnt_pc)+' заявлених',mtInformation,[mbOk]);
        //ShowMessage('Відобрано - '+inttostr(count_posvid)+' співробітників із '+inttostr(cnt_pc)+' заявлених');
        Label1.Caption:='Кількість: '+inttostr(count_2);
    end;
    //end;
end;

procedure TfmAddReqCertificate.FormCreate(Sender: TObject);
var
    SessionDataSet: TpFIBStoredProc;
begin
   // Close_Req:=0;
    DateReq.Date := Date;
    FotoCheck.Checked:=True;
    SessionDataSet := TpFIBStoredProc.Create(self);
    SessionDataSet.Database := TfmReqCertificate(owner).LocalDatabase;
    SessionDataSet.Transaction := TfmReqCertificate(owner).LocalReadTransaction;
    SessionDataSet.Close;
    SessionDataSet.StoredProcName := 'PUB_GET_ID_BY_GEN';
    SessionDataSet.ParamByName('GENERATOR_NAME').AsString := 'GEN_KEY_SESSION_CERT';
    SessionDataSet.ParamByName('STEP').AsInteger := 1;
    SessionDataSet.ExecProc;
    Key_session := SessionDataSet.FieldByName('RET_VALUE').AsInt64;
    SessionDataSet.Close;
    SessionDataSet.Free;
    //UpdImageMan;
    with TFMASAppModuleCreator.Create do
    begin
        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
        if (PC = nil)
            then agMessageDlg('Увага!', 'Помилка при роботі з модулем up_filter.bpl', mtError, [mbOk]);
    end;
    Key_session_filter := TfmReqCertificate(owner).LocalDatabase.Gen_Id('GEN_UP_ID_SESSION', 1);
end;

procedure TfmAddReqCertificate.cxGridDBTableView5DBColumn1PropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
begin
ViewPcardExecute(Self);
end;

procedure TfmAddReqCertificate.cxGridDBTableView5KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then begin
        ShowInfo(PeopleSet);
    end;
end;

procedure TfmAddReqCertificate.AddPcardExecute(Sender: TObject);
var id_order_type: Integer;
begin
    id_order_type := 0;

    PC.InParams.Items['AOwner'] := @self;
    PC.InParams.Items['DbHandle'] := PInteger(@Self.DbHand);
    PC.InParams.Items['Id_User'] := PInteger(@id_user);
    PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
    PC.InParams.Items['KEY_SESSION'] := PInt64(@Key_session_filter);
    //showmessage('Key_session_filter= '+inttostr(Key_session_filter));
    (PC as IFMASTemporaryDataStorage).ClearTmpData;

    (PC as IFMASModule).Run;

    if (PInteger(PC.OutParams.Items['Count'])^) = 0
        then begin
        agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз?', mtInformation, [mbOk]);
    end;

    if (PInteger(PC.OutParams.Items['Count'])^) > 0
        then begin
            //Загружаем данные из результатов работы фильтра
        LoadDataFromFilter;
           // GetData;
   end;
 end;

procedure TfmAddReqCertificate.LoadDataFromFilter;
var GetFilterDS, GetIdMan, PeopleFio,PeopleFioNorm : TpFibDataSet;
    InsertBuffer: TpFibStoredProc;
    i,count_spisok,k, man_cert: Integer;
    id_man_mov,id_pc,id_dep,id_po_s, id_1, IS_PR_SHOW, c_p,summ, id_man, tn:integer;
    res,nom:string;

begin
    //DBFoto.Handle:=(TfmReqCertificate(owner).LocalDatabase.Handle) ;
    DBFoto.Handle:=GetImageDBHandle(Self.DbHand);
    GetFilterDS:=TpFibDataSet.Create(nil);
    GetFilterDS.Database   :=TfmReqCertificate(owner).LocalDatabase;
    GetFilterDS.Transaction:=TfmReqCertificate(owner).LocalReadTransaction;
    //showmessage('load_filter= '+inttostr(Key_session_filter));
    GetFilterDS.SelectSQL.Text:='SELECT * FROM UP_KER_GET_FILTER_DATA_EX('+IntToStr(Key_session_filter)+')';
    GetFilterDS.Open;

    GetIdMan:=TpFibDataSet.Create(nil);
    GetIdMan.Database   :=TfmReqCertificate(owner).LocalDatabase;
    GetIdMan.Transaction:=TfmReqCertificate(owner).LocalReadTransaction;
    GetIdMan.SelectSQL.Text:='SELECT ID_MAN, TN FROM PRIVATE_CARDS WHERE ID_PCARD=:ID_PC';
    GetIdMan.ParamByName('ID_PC').AsInteger:=GetFilterDS['ID_PCARD'];
    GetIdMan.Open;
    id_man:=GetIdMan['ID_MAN'];
    tn:=GetIdMan['TN'];

    PeopleFio:=TpFibDataSet.Create(nil);
    PeopleFio.Database   :=TfmReqCertificate(owner).LocalDatabase;
    PeopleFio.Transaction:=TfmReqCertificate(owner).LocalReadTransaction;
    PeopleFio.SelectSQL.Text:='SELECT FAMILIA, IMYA, OTCHESTVO  FROM PEOPLE WHERE ID_MAN=:ID_MAN';
    PeopleFio.ParamByName('ID_MAN').AsInteger:=id_man;
    PeopleFio.Open;

    PeopleFioNorm:=TpFibDataSet.Create(nil);
    PeopleFioNorm.Database   :=TfmReqCertificate(owner).LocalDatabase;
    PeopleFioNorm.Transaction:=TfmReqCertificate(owner).LocalReadTransaction;
    PeopleFioNorm.SelectSQL.Text:='SELECT FIO from up_req_norm_fio(:fam_ukr, :imya_ukr, :otch_ukr)';
    PeopleFioNorm.ParamByName('fam_ukr').AsString:=PeopleFio['FAMILIA'];
    PeopleFioNorm.ParamByName('imya_ukr').AsString:=PeopleFio['IMYA'];
    PeopleFioNorm.ParamByName('otch_ukr').AsString:=PeopleFio['OTCHESTVO'];
    PeopleFioNorm.Open;
    // showmessage(inttostr(id_man));

    //id_man_mov:=GetFilterDS['ID_MAN_MOVING'];
    //id_pc:=GetFilterDS['ID_PCARD'];
    //id_dep:=GetFilterDS['ID_DEPARTMENT'];
    //id_po_s:=GetFilterDS['ID_POST_SALARY'];
    nom:=TfmReqCertificate(owner).CertSet.FieldByName('NOMER').AsString;
    //id_1:=TfmReqCertificate(owner).ID;
    GetFilterDS.FetchAll;
    GetFilterDS.First;
    //Если есть данные по фильтру
    if (GetFilterDS.RecordCount>0)
    then begin
            InsertBuffer:=TpFibStoredProc.Create(nil);
            InsertBuffer.Database:=TfmReqCertificate(owner).LocalDatabase;
            InsertBuffer.Transaction:=TfmReqCertificate(owner).LocalWriteTransaction;
            TfmReqCertificate(owner).LocalWriteTransaction.StartTransaction;
            //StartHistory(TfmReqCertificate(owner).LocalWriteTransaction);
            InsertBuffer.StoredProcName:='UP_DT_CERT_PEOPLE_TEMP_INS';

            for i:=0 to GetFilterDS.RecordCount-1 do
            begin
              //Добавляем данные в буфферные таблицы по основыным данным
              InsertBuffer.Prepare;
              InsertBuffer.ParamByName('KEY_SESSION').AsInt64            := Key_session;
              // InsertBuffer.ParamByName('KEY_SESSION').AsInteger            := 199;
              InsertBuffer.ParamByName('ID_MAN_MOVING').AsInt64          := StrToInt64(GetFilterDS.FieldByName('ID_MAN_MOVING').AsString);
              InsertBuffer.ParamByName('ID_PCARD').AsInt64               := StrToInt64(GetFilterDS.FieldByName('ID_PCARD').AsString);
              InsertBuffer.ParamByName('ID_DEPARTMENT').AsInt64          := StrToInt64(GetFilterDS.FieldByName('ID_DEPARTMENT').AsString);
              InsertBuffer.ParamByName('ID_POST_SALARY').AsInt64         := StrToInt64(GetFilterDS.FieldByName('ID_POST_SALARY').AsString);
              InsertBuffer.ParamByName('DATE_REQUEST').AsDate            := DateReq.Date;
              InsertBuffer.ParamByName('ID_REQUEST_CERTIFICATE').AsInt64 := TfmReqCertificate(owner).ID;
              InsertBuffer.ParamByName('SERIYA').AsString := TfmReqCertificate(owner).CertSet.FieldByName('NOMER').AsString;
              {было закоментировано}//InsertBuffer.ParamByName('ID_MAN_CERTIFICATE').AsInteger   := TfmReqCertificate (owner).ID;

              InsertBuffer.ExecProc;
              IS_PR_SHOW:=InsertBuffer.FieldByName('IS_PR').AsInteger;
              c_p:=InsertBuffer.FieldByName('C_P').AsInteger;
              man_cert:=InsertBuffer.FieldByName('id_man_cert').AsInteger;
              // k:=InsertBuffer.FieldByName('COUNT_P').AsInteger;
              GetFilterDS.Next;
            end;
            TfmReqCertificate(owner).LocalWriteTransaction.Commit;
            //SendMessage(outer_hwnd,FMAS_MESS_ITEM_INFO_CHANGED,0,0);
            InsertBuffer.Close;
            InsertBuffer.Free;
    end;
    FotoSet.Close;
    FotoSet.SQLs.SelectSQL.Text:='SELECT ID_FOTO FROM FOTO_GET_BY_ID_MAN(:IN_ID_MAN)';
    FotoSet.ParamByName('IN_ID_MAN').AsInteger:=id_man;
    FotoSet.Open;

    if VarIsNull(FotoSet['ID_FOTO']) then MessageDlg(PeopleFioNorm['FIO']+' (ТН '+inttostr(tn)+')'+' немає зареєстрованих фото',mtInformation, [mbOk],0);
    FotoSet.Close;

    PeopleSet.Close;
    PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(KEY_SESSION) + ',' + '''' + DateTostr(DateReq.Date) + '''' + ')';
    PeopleSet.Open;
    PeopleSet.Locate('ID_MAN_CERTIFICATE',man_cert,[]);
    //DataSet.Close;

    // DataSet.SQLs.SelectSQL.Text:='select * from UP_DT_CERT_PEOPLE_TEMP_INS(:Key_session,:id_man_mov,:id_pc,:id_dep,:id_po_s,:DateReq.Date,:id_1, :nom)';
    //DataSet.Open;
    //res:=DataSet['IS_PR'];
    //showmessage(res);
    //summ:=PeopleSet['SUMM'];
    //showmessage(inttostr(summ));
    if IS_PR_SHOW=1 then showmessage('Вже видано посвідчення');
    if C_P=1 then showmessage('Вже є запис');
    //if (k>1) then showmessage('Увага! Більше ніж один запис по цьому фіз.ліцу');
    GetFilterDS.Close;
    GetFilterDS.Free;
    countActionExecute(Self);
    DBFoto.Connected:=false;
    // summ_countExecute(Self);
end;

procedure TfmAddReqCertificate.DelPcardExecute(Sender: TObject);
var DeleteSP: TpFibStoredProc;
    count_spisok:Integer;
begin
//up_dt_cert_people_temp_del
 if (PeopleSet.RecordCount > 0)
        then begin
        if (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            then begin
            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := TfmReqCertificate(owner).LocalDatabase;
            DeleteSP.Transaction := TfmReqCertificate(owner).LocalWriteTransaction;
            TfmReqCertificate(owner).LocalWriteTransaction.StartTransaction;
            //StartHistory(TfmReqCertificate(owner).LocalWriteTransaction);
            DeleteSP.StoredProcName := 'UP_DT_CERT_PEOPLE_TEMP_DEL';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('MAN_M').AsInt64 := StrToInt64(PeopleSet.FieldByName('ID_MAN_CERTIFICATE').AsString);
            //DeleteSP.ParamByName('ID_PCARD').AsInt64 := StrToInt64(PeopleSet.FieldByName('ID_PCARD').AsString);
            DeleteSP.ExecProc;
            DeleteSP.Close;
            DeleteSP.Free;
            TfmReqCertificate(owner).LocalWriteTransaction.Commit;
            PeopleSet.Close;
            PeopleSet.Open;
            countActionExecute(Self);
            summ_countExecute(Self);
        end;
    end;
end;

procedure TfmAddReqCertificate.RenewPcardExecute(Sender: TObject);
begin
  PeopleSet.CloseOpen(true);
  summ_countExecute(Self);
end;

procedure TfmAddReqCertificate.countActionExecute(Sender: TObject);
var count_spisok:Integer;
begin
   PeopleSet.FetchAll;
   count_spisok:=PeopleSet.RecordCount;
   label1.caption:='Кількість: '+inttostr(count_spisok);
end;



procedure TfmAddReqCertificate.checkerActionExecute(Sender: TObject);
var Checker_click: TpFibStoredProc;
id_man_cert, id_man_mov:Integer;
begin
    id_man_cert:=PeopleSet['ID_MAN_CERTIFICATE'];
    id_man_mov:=PeopleSet['ID_MAN_MOVING'];
    if Is_Give_Cert=0 then exit else
    begin
       Checker_click:=TpFIBStoredProc.Create(Self);
       Checker_click.Database:=TfmReqCertificate(owner).LocalDatabase;
       Checker_click.Transaction:=TfmReqCertificate(owner).LocalWriteTransaction;
       Checker_click.close;
       TfmReqCertificate(owner).LocalWriteTransaction.StartTransaction;
       Checker_click.StoredProcName:='UP_DT_MAN_CERT_CHECK';
       Checker_click.Prepare;
       Checker_click.ParamByName('IS_PRINT').AsInteger :=1-PeopleSet['IS_PRINT'];
       Checker_click.ParamByName('ID_MAN_MOV').AsInteger :=id_man_mov;
       Checker_click.ExecProc;
       TfmReqCertificate(owner).LocalWriteTransaction.Commit;
       Checker_click.Close;
       Checker_click.Free;
       PeopleSet.CloseOpen(True);
       PeopleSet.Locate('ID_MAN_CERTIFICATE',id_man_cert,[]);
    end;
end ;

procedure TfmAddReqCertificate.cxGridDBTableView5DblClick(Sender: TObject);
begin
checkerActionexecute(self);
end;

procedure TfmAddReqCertificate.ViewPcardExecute(Sender: TObject);
var
    frm: TfrmCertSave;
    aid_man: Integer;
    aDb_handle: TISC_DB_HANDLE;
    nomer_posv: string;
begin
    nomer_posv := PeopleSet['NOMER'] + '/' + PeopleSet['SERIYA'];
    aDb_handle := TfmReqCertificate(owner).LocalDatabase.Handle;
    aId_man := StrToInt(PeopleSet['ID_MAN']);
    frm := TfrmCertSave.Create(Self, aDb_handle, aId_Man);
    frm.EditFamUkr.Text := PeopleSet['FAM_UKR'];
    frm.EditImyaUkr.Text := PeopleSet['IMYA_UKR'];
    frm.EditOtchUkr.Text := PeopleSet['OTCH_UKR'];
    frm.EditFamRus.Text := PeopleSet['FAM_RUS'];
    frm.EditImyaRus.Text := PeopleSet['IMYA_RUS'];
    frm.EditOtchRus.Text := PeopleSet['OTCH_RUS'];
    frm.EditPost.Text := PeopleSet['NAME_POST'];
    frm.EditDep.Text := PeopleSet['NAME_DEPARTMENT'];
    frm.EditShtrichKod.Text := PeopleSet['DIGITAL_KOD_SHTRIH'];
    frm.EditNomerPosv.Text := nomer_posv;
    frm.cxDateEdit1.Date := StrToDate(PeopleSet['DATE_BEG']);
    frm.cxDateEdit2.Date := StrToDate(PeopleSet['DATE_END']);
    frm.FIOUkr.Text := PeopleSet['FIO_UKR'];
    frm.FioRus.Text := PeopleSet['FIO_RUS'];
    frm.ShowModal;
    frm.Free;
end;

procedure TfmAddReqCertificate.cxGridDBTableView5CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
  var s1:String;
begin
if AViewInfo.GridRecord.Values[cxGridDBTableView5DBColumn1.Index] = s1 then
    begin
        ACAnvas.Brush.Color := clRed;
    end;
end;

procedure TfmAddReqCertificate.summ_smetaExecute(Sender: TObject);
var EditSummSmet: TpFibStoredProc;
    form:TReqCertificateSmets;
    id_man_mov:Integer;
    str:String[255];
    check:Integer;
    Can_Pos:Integer;
    man_mov:Variant;
begin
    if PeopleSet.IsEmpty then exit;
    Check := fibCheckPermission('/ROOT/UP_MAIN_MENU/Certificate/CertificateSmetEdit', 'Edit');
    //showmessage('2');
    if check<>0 then
    begin
      agMessageDlg('Увага!', 'Помилка: Ви не маєте прав на виконання цієї дії! ',mtError,[mbOk]);
      exit;
    end;
    id_man_mov:=PeopleSet['ID_MAN_MOVING'];
    id_smets:=PeopleSet['ID_SMETA'];
    // showmessage(inttostr(id_pcar));
    form:=TReqCertificateSmets.Create(Self);
    form.SmetaSet.close;
    form.SmetaSet.SQLs.SelectSQL.Text:='Select * from UP_REQ_CERT_SMET_SEL(:sm)';
    form.SmetaSet.ParamByName('sm').AsInteger:=id_smets;
    form.SmetaSet.Open;

    str:=PeopleSet['SMETA_NAME'];
    form.id_smeta:=form.SmetaSet['ID_SM'];
    //form.edit1.text:=str[1];
    form.KodSmet.Text:=inttostr(form.id_smeta);
    form.NameSmet.DisplayText:=form.SmetaSet['SM_NAME'];
    form.SumSmet.text:=PeopleSet['SMETA_SUMM'];
    //form.ShowModal;
    EditSummSmet:=TpFibStoredProc.Create(Self);
    EditSummSmet.Database:=TfmReqCertificate(owner).LocalDatabase;
    EditSummSmet.Transaction:=TfmReqCertificate(owner).LocalWriteTransaction;
    TfmReqCertificate(owner).LocalWriteTransaction.StartTransaction;
    EditSummSmet.StoredProcName:='UP_DEP_REQ_CERT_UPD';
    EditSummSmet.Prepare;
    if form.ShowModal=mrok then
    begin
        if form.SmetCheck.Checked then
        begin
            EditSummSmet.ParamByName('REQ_CERT').AsInteger:=PeopleSet['id_request_certificate'];
            EditSummSmet.ParamByName('SMETA_SUMM').Value:=form.SumSmet.text;
            EditSummSmet.ParamByName('ID_SMET').AsInteger:=form.ID_SMETA;
            EditSummSmet.ParamByName('FLAG').AsInteger:=2;
            EditSummSmet.ExecProc;
            TfmReqCertificate(owner).LocalWriteTransaction.Commit;
            Can_Pos:=0;
        end
        else
        begin
            EditSummSmet.ParamByName('ID_MAN_MOV').AsInteger:=id_man_mov;
            EditSummSmet.ParamByName('SMETA_SUMM').Value:=form.SumSmet.text;
            EditSummSmet.ParamByName('ID_SMET').AsInteger:=form.ID_SMETA;
            EditSummSmet.ParamByName('KEY_SESSION').AsInteger:=Key_session;
            EditSummSmet.ParamByName('FLAG').AsInteger:=1;
            EditSummSmet.ExecProc;
            man_mov:=EditSummSmet.FieldByName('MAN_MOV').AsInteger;
            TfmReqCertificate(owner).LocalWriteTransaction.Commit;
            Can_Pos:=1;
        end;
    end;
    EditSummSmet.Free;
    form.Free;
    PeopleSet.Close;
    PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(KEY_SESSION) + ',' + '''' + DateTostr(DateReq.Date) + '''' + ')';
    PeopleSet.Open;
   // showmessage(inttostr(man_mov));
    if Can_Pos=1 then PeopleSet.Locate('ID_MAN_MOVING',man_mov,[]);
    //summ_countExecute(Self);    }
end;


procedure TfmAddReqCertificate.summ_countExecute(Sender: TObject);
var summ:Integer;
begin
    PeopleSet.Close;
    PeopleSet.SelectSQL.Text := 'SELECT * FROM UP_DT_CERT_PEOPLE_TEMP_SEL(' + IntToStr(KEY_SESSION) + ',' + '''' + DateTostr(DateReq.Date) + '''' + ')';
    PeopleSet.Open;
    //if VarIsNull(PeopleSet['SUMM']) then label2.caption:='Разом: ' else
    begin
        summ:=PeopleSet['SUMM'];
       // label2.caption:='Разом: '+inttostr(summ);
    end;
end;

procedure TfmAddReqCertificate.PanelGroupPropertiesChange(Sender: TObject);
begin
   cxGridDBTableView5.OptionsView.GroupByBox:=PanelGroup.Checked;
end;

procedure TfmAddReqCertificate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if Self.Close_Req=0 then
    begin
      if Self.Is_Del_Cert=1 then
      begin
        DeleteSet.Close;
        DeleteSet.SQLs.SelectSQL.Text:='DELETE FROM UP_DT_REQUEST_CERTIFICATE WHERE ID_REQUEST_CERTIFICATE=:ID_REQ';
        DeleteSet.ParamByName('ID_REQ').AsInteger:=TfmReqCertificate(owner).ID;
        DeleteSet.Open;
        DeleteSet.Transaction.Commit;
      end
      else
      begin
        pc.Free;
        close;
        ClearTempTab(KEY_SESSION);
      end;
    end;
end;

procedure TfmAddReqCertificate.FormShow(Sender: TObject);
var Strproc: TpFIBStoredProc;
begin
   Strproc := TpFibStoredProc.Create(self);
   Strproc.Database := TfmReqCertificate(owner).LocalDatabase;
   Strproc.Transaction := TfmReqCertificate(owner).WorkWriteTransaction;
   Strproc.Close;
   Strproc.Transaction.StartTransaction;
   Strproc.StoredProcName:='UP_DT_CERT_TEMP_INS';
   Strproc.Prepare;
   Strproc.ParamByName('key_session').AsInteger:=Key_session;
   Strproc.ParamByName('DATE_REQUEST').AsDate:=DateReq.Date;
   Strproc.ParamByName('IS_READ_ONLY').AsInteger:=1-Is_Give_Cert;
   Strproc.ExecProc;
   Strproc.Transaction.Commit;
   Strproc.Close;
   Strproc.Free;
end;

initialization
    RegisterClass(TfmAddReqCertificate);

end.

