unit uMainForm8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, iBase, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox,
  ActnList, dxBar, dxBarExtItems, ImgList, cxGridLevel,cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, pFibStoredProc, dates, BaseTypes, uCommonSp, RXMemDS,
  StdCtrls, cxButtonEdit;

type
  TfrmZPersModule8 = class(TForm)
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
    DetailGridBanded: TcxGrid;
    StajView: TcxGridDBBandedTableView;
    Col_NomerOblik: TcxGridDBBandedColumn;
    Col_FIO: TcxGridDBBandedColumn;
    Col_CountDays: TcxGridDBBandedColumn;
    Col_PeriodBeg: TcxGridDBBandedColumn;
    Col_PeriodEnd: TcxGridDBBandedColumn;
    Col_CountHours: TcxGridDBBandedColumn;
    Col_IsSezon: TcxGridDBBandedColumn;
    DetailGridLevel4: TcxGridLevel;
    IL_Orders: TImageList;
    dxBM_Order: TdxBarManager;
    dxBLB_Add: TdxBarLargeButton;
    dxBLB_Modify: TdxBarLargeButton;
    dxBLB_Delete: TdxBarLargeButton;
    dxBLB_Refresh: TdxBarLargeButton;
    dxBLB_Print: TdxBarLargeButton;
    dxBLB_NotAccept: TdxBarLargeButton;
    dxBLB_Select: TdxBarLargeButton;
    dxBLB_Close: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    StopOrderButton: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxbrbtn1: TdxBarButton;
    dxbrbtn2: TdxBarButton;
    dxBarLargeButton5: TdxBarLargeButton;
    ActionList: TActionList;
    AddMan: TAction;
    ModifyOrder: TAction;
    DeleteOrder: TAction;
    ViewAction: TAction;
    RefreshList: TAction;
    SelectOrder: TAction;
    CloseForm: TAction;
    GenerateAll: TAction;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    DS_PersonStag: TpFIBDataSet;
    DataSource_PersonStag: TDataSource;
    ReadTransaction: TpFIBTransaction;
    Col_TN: TcxGridDBBandedColumn;
    Col_Staj: TcxGridDBBandedColumn;
    Col_IdPcard: TcxGridDBBandedColumn;
    PrintAct: TAction;
    dxBLB_PrintPeople: TdxBarLargeButton;
    DSConst: TpFIBDataSet;
    Col_PeriodPereschet: TcxGridDBBandedColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GenerateAllExecute(Sender: TObject);
    procedure AddManExecute(Sender: TObject);
    procedure ModifyOrderExecute(Sender: TObject);
    procedure RefreshListExecute(Sender: TObject);
    procedure CloseFormExecute(Sender: TObject);
    procedure DeleteOrderExecute(Sender: TObject);
    procedure Col_FIOPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure PrintActExecute(Sender: TObject);
  private
    FKodSetup:Integer;
    FidReport:Integer;
  public
    kod_setup_form :integer;
    msgError: string;
    function getKodSetup:Integer;
    function getIdReport:Integer;
    constructor Create(AOwner:TComponent;DBHanlde:TISC_DB_HANDLE;id_user:Int64;kodsetup:Integer;idreport:Int64);reintroduce;
  end;

type PersonStag = class(TSprav)
    public
      Pers: TfrmZPersModule8;
      constructor Create;
      procedure Show; override;
end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;
var
  frmZPersModule8: TfrmZPersModule8;

implementation

uses AddManInfo, cxCalendar, GenerateMan, PrintForm;
{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := PersonStag.Create;
end;

constructor PersonStag.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('KodSetup', ftInteger);
    Input.FieldDefs.Add('IdReport', ftInteger);
    Input.FieldDefs.Add('IdUser', ftInteger);
    Input.FieldDefs.Add('IdMode', ftInteger);
    PrepareMemoryDatasets;
end;

procedure PersonStag.Show;
begin
    Pers := TfrmZPersModule8.Create(Application.MainForm, TISC_DB_HANDLE(integer(Input['DBHandle'])),
            Input['IdUser'], Input['KodSetup'],  Input['IdReport']);
    Pers.FormStyle := fsMDIChild;
    Pers.Show;
    Pers.WindowState := wsMaximized;
    if Input['IdMode'] = 2 then
    begin
        Pers.dxBarLargeButton3.Enabled := False;
        Pers.dxBLB_Modify.Enabled := False;
        Pers.dxBLB_Add.Enabled := False;
        Pers.dxBarLargeButton4.Enabled := False;
        Pers.AddMan.Enabled:=False;
        Pers.ModifyOrder.Enabled:=False;
        Pers.DeleteOrder.Enabled:=False;
        Pers.ViewAction.Enabled:=False;
    end;
end;

constructor TfrmZPersModule8.Create(AOwner:TComponent;DBHanlde:TISC_DB_HANDLE;id_user:Int64;kodsetup:Integer;idreport:Int64);
begin
    inherited Create(AOwner);
    self.Caption:=Self.Caption+' за період '+KodSetupToPeriod(KodSetup,1);
    self.Update;
    FidReport := idreport;
    FKodSetup := kodsetup;
    WorkDatabase.Handle:=DBHanlde;
    ReadTransaction.StartTransaction;
    DS_PersonStag.Close;
    DS_PersonStag.SQLs.SelectSQL.Text := 'Select * from Person_Staj_Info_Select('+ IntToStr(getIdReport)+') order by TN asc';
    DS_PersonStag.Open;
    msgError := 'Помилка! ';
    DSConst.Close;
    DSConst.SQLs.SelectSQL.Text := 'Select Min(P.Kod_Setup) as Kod_Setup From Person_Documents P';
    try
    DSConst.Open;
    except
        on E:exception do
        ShowMessage(E.Message);
    end;
    kod_setup_form := DSConst['Kod_Setup'];
end;

function TfrmZPersModule8.getKodSetup: Integer;
begin
    Result:=FKodSetup;
end;

function TfrmZPersModule8.getIdReport: Integer;
begin
    Result:=FidReport;
end;

procedure TfrmZPersModule8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TfrmZPersModule8.GenerateAllExecute(Sender: TObject);
var
    GenerateAction: TpFibStoredProc;
    frm: TfrmGenerate;
    Msg: string;
begin
    frm := TfrmGenerate.Create(Self, getKodSetup, kod_setup_form);
    frm.hand := WorkDatabase.Handle;
    
    if frm.ShowModal = mrOk then
    begin
        GenerateAction := TpFibStoredProc.Create(self);
        GenerateAction.Database := WorkDatabase;
        GenerateAction.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        GenerateAction.StoredProcName := 'GENERATE_PERSON_STAG';
        GenerateAction.Prepare;
        GenerateAction.ParamByName('ID_PERSON_DOCUMENTS').Value := getIdReport;
        GenerateAction.ParamByName('KOD_SETUP').Value := PeriodToKodSetup(frm.YearSpinEdit.Value,frm.MonthesList.ItemIndex+1);
        if frm.RadioButtonAll.Checked then
            GenerateAction.ParamByName('ID_MAN').Value := NULL
        else
            GenerateAction.ParamByName('ID_MAN').Value := frm.PeopleEdit.Value;
        GenerateAction.ParamByName('KOD_SETUP_PERIOD').Value := PeriodToKodSetup(frm.YearSpinEdit1.Value,frm.MonthesList1.ItemIndex+1);

        GenerateAction.ParamByName('KOD_SETUP_DOC').Value := FKodSetup;
        try
            GenerateAction.ExecProc;
            WriteTransaction.Commit;
        except on E: Exception do
            begin
                msg := msgError + E.Message;
                MessageDlg(msg,mtError,[mbOk],0);
                WriteTransaction.Rollback;
            end;
        end;

        GenerateAction.Close;
        GenerateAction.Free;
        DS_PersonStag.Close;
        DS_PersonStag.Open;
        DS_PersonStag.FetchAll;
    end;
    frm.free;
end;

procedure TfrmZPersModule8.AddManExecute(Sender: TObject);
var
    frm: TfrmAddManInfo;
    SP:TpFibStoredProc;
    ID_SHABLON:Integer;
    isSezon, isStorno: Integer;
    msg: string;
begin
    ID_SHABLON:=DS_PersonStag['ID_PERSON_STAG'];
    frm := TfrmAddManInfo.Create(Self);
    frm.Caption := 'Додати';//
    if frm.ShowModal = mrYes then
    begin
        if (frm.SezonTrue.Checked = True) then
            isSezon := 1
        else isSezon := 0;
        isStorno := 0;
        SP:=TpFibStoredProc.Create(self);
        SP.Database:=WorkDatabase;
        SP.Transaction:=WriteTransaction;
        WriteTransaction.StartTransaction;
        //StartHistory(WriteTransaction);
        SP.StoredProcName:='PERSON_STAG_INSERT';
        SP.Prepare;
            SP.ParamByName('KOD_SETUP').Value          := frm.Kod_Setup;
            SP.ParamByName('KOD_SETUP_PERIOD').Value   := FKodSetup; //как его определять? от текущей даты? или из up_sys_ini_consts?
            SP.ParamByName('ID_MAN').Value             := frm.ManEdit.Value;
            SP.ParamByName('FIO').Value                := frm.ManEdit.DisplayText;
            SP.ParamByName('ID_TYPE_STAG').Value       := frm.TypeStagEdit.Value;
            SP.ParamByName('VALUE_STAG_DAYS').Value    := frm.CountDays.Value;
            SP.ParamByName('VALUE_STAG_HOURS').Value   := 0;
            SP.ParamByName('IS_STORNO').Value          := isStorno;
            SP.ParamByName('IS_ADD_AUTO').Value        := 0;
            SP.ParamByName('ID_PERSON_DOCUMENT').Value := FidReport;
            SP.ParamByName('INN').Value                := Null;
            SP.ParamByName('PERIOD_BEG').AsDate        := frm.cxDateBegEdit.Date;
            SP.ParamByName('PERIOD_END').AsDate        := frm.cxDateEndEdit.Date;
            SP.ParamByName('IS_SEZON').Value           := isSezon;
        try
            SP.ExecProc;
            ID_SHABLON:=SP['ID_PERSON_STAG'].AsInteger;
            WriteTransaction.Commit;
        except on E:Exception do
            begin
                msg := msgError + E.Message;
                MessageDlg(msg,mtError,[mbOk],0);
                WriteTransaction.Rollback;
            end;
        end;
        SP.Close;
        SP.Free;
        DS_PersonStag.Close;
        DS_PersonStag.Open;
        DS_PersonStag.FetchAll;
        DS_PersonStag.Locate('ID_PERSON_STAG',ID_SHABLON,[]);
    end;
    frm.Free;
end;

procedure TfrmZPersModule8.ModifyOrderExecute(Sender: TObject);
var
    frm: TfrmAddManInfo;
    SP:TpFibStoredProc;
    ID_SHABLON:Integer;
    isSezon, isStorno: Integer;
    DS: TpFIBDataSet;
    msg: string;
begin
    ID_SHABLON:=DS_PersonStag['ID_PERSON_STAG'];
    frm := TfrmAddManInfo.Create(Self);
    frm.Caption := 'Змінити';//

        frm.cxDateBegEdit.Date := DS_PersonStag['PERIOD_BEG'];
        frm.cxDateEndEdit.Date := DS_PersonStag['PERIOD_END'];
        frm.UpdatePeriod;
        frm.ManEdit.Value := DS_PersonStag['ID_MAN'];
        frm.ManEdit.DisplayText := DS_PersonStag['FIO'];
        frm.ManEdit.Blocked := true;
        frm.TypeStagEdit.Value := Ds_PersonStag['ID_TYPE_STAG'];
        frm.CountDays.Value := DS_PersonStag['Value_Stag_Days'];

        if DS_PersonStag['Is_Sezon'] = 1 then frm.SezonTrue.Checked := True
        else frm.SezonFalse.Checked := True;
        
        DS :=  TpFIBDataSet.Create(Self);
        DS.Database := WorkDatabase;
        DS.Transaction := ReadTransaction;

        DS.Close;
        Ds.SQLs.SelectSQL.Text := 'Select * from INI_STAJ where ID_STAJ = ' + VarToStr(Ds_PersonStag['ID_TYPE_STAG']);
        DS.Open;

        frm.TypeStagEdit.DisplayText := Ds['NAME_STAJ'];

        DS.Close;
        ds.Free;



    if frm.ShowModal = mrYes then
    begin
        if (frm.SezonTrue.Checked = True) then
            isSezon := 1
        else isSezon := 0;
        isStorno := 0;
        SP:=TpFibStoredProc.Create(self);
        SP.Database:=WorkDatabase;
        SP.Transaction:=WriteTransaction;
        WriteTransaction.StartTransaction;
        //StartHistory(WriteTransaction);
        SP.StoredProcName:='PERSON_STAG_UPDATE';
        SP.Prepare;

            SP.ParamByName('ID_PERSON_STAG').Value     := DS_PersonStag['ID_PERSON_STAG'];
            SP.ParamByName('KOD_SETUP').Value          := frm.Kod_Setup;
            SP.ParamByName('KOD_SETUP_PERIOD').Value   := FKodSetup; //как его определять? от текущей даты? или из up_sys_ini_consts?
            SP.ParamByName('ID_MAN').Value             := frm.ManEdit.Value;
            SP.ParamByName('FIO').Value                := frm.ManEdit.DisplayText;
            SP.ParamByName('ID_TYPE_STAG').Value       := frm.TypeStagEdit.Value;
            SP.ParamByName('VALUE_STAG_DAYS').Value    := frm.CountDays.Value;
            SP.ParamByName('VALUE_STAG_HOURS').Value   := 0; //временно, до новых распоряжений
            SP.ParamByName('IS_STORNO').Value          := isStorno;
            SP.ParamByName('IS_ADD_AUTO').Value        := DS_PersonStag['IS_ADD_AUTO'];
            SP.ParamByName('ID_PERSON_DOCUMENT').Value := FidReport;
            SP.ParamByName('INN').Value                := DS_PersonStag['INN'];
            SP.ParamByName('PERIOD_BEG').AsDate        := frm.cxDateBegEdit.Date;
            SP.ParamByName('PERIOD_END').AsDate        := frm.cxDateEndEdit.Date;
            SP.ParamByName('IS_SEZON').Value           := isSezon;
        try
            SP.ExecProc;
            WriteTransaction.Commit;
        except on E:Exception do
            begin
                msg := msgError + E.Message;
                MessageDlg(msg,mtError,[mbOk],0);
                WriteTransaction.Rollback;
            end;
        end;
        SP.Close;
        SP.Free;
        DS_PersonStag.Close;
        DS_PersonStag.Open;
        DS_PersonStag.Locate('ID_PERSON_STAG',ID_SHABLON,[]);
    end;
    frm.Free;
end;

procedure TfrmZPersModule8.RefreshListExecute(Sender: TObject);
var
    id_shablon: integer;
begin
    id_shablon := DS_PersonStag['ID_PERSON_STAG'];
    DS_PersonStag.Close;
    DS_PersonStag.Open;
    DS_PersonStag.Locate('ID_PERSON_STAG',ID_SHABLON,[]);
end;

procedure TfrmZPersModule8.CloseFormExecute(Sender: TObject);
begin
    Close;
end;

procedure TfrmZPersModule8.DeleteOrderExecute(Sender: TObject);
var DeleteSP: TpFibStoredProc;
    id_focus_index: Integer;
    msg: string;
begin
    id_focus_index := DS_PersonStag['ID_PERSON_STAG'];
    if (DS_PersonStag.RecordCount > 0)
        then begin
        if (agMessageDlg('Увага!', 'Ви хочете видалити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
            then begin

            DeleteSP := TpFibStoredProc.Create(self);
            DeleteSP.Database := WorkDatabase;
            DeleteSP.Transaction := WriteTransaction;
            DeleteSP.Transaction.StartTransaction;
            DeleteSP.StoredProcName := 'PERSON_STAG_DELETE';
            DeleteSP.Prepare;
            DeleteSP.ParamByName('ID_PERSON_STAG').Value := DS_PersonStag['ID_PERSON_STAG'];
            try
                DeleteSP.ExecProc;
                id_focus_index := StajView.Controller.FocusedRowIndex;
                DS_PersonStag.CacheDelete;
                StajView.Controller.FocusedRowIndex := id_focus_index;
                DeleteSP.Transaction.Commit;
            except on E:Exception do
                begin
                msg := msgError + E.Message;
                MessageDlg(msg,mtError,[mbOk],0);
                DeleteSP.Transaction.Rollback;
                end;
            end;
            DeleteSP.Close;
            DeleteSP.Free;
            DS_PersonStag.Close;
            DS_PersonStag.Open;
            DS_PersonStag.Locate('ID_PERSON_STAG',id_focus_index,[]);
        end;
    end;
end;

procedure TfrmZPersModule8.Col_FIOPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
    sp: TSprav;
begin
    if StajView.Controller.FocusedRow.Values[10] <> null
        then begin
        sp := GetSprav('asup\PrivateCard');
        if sp <> nil then
        begin
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(workDatabase.Handle);
                FieldValues['Actual_Date'] := Date;
                FieldValues['Id_PCard'] := StajView.Controller.FocusedRow.Values[10];
                FieldValues['CreatePCard'] := 0;
                FieldValues['Modify'] := 0;
                FieldValues['ShowStyle'] := 1;
                FieldValues['FIO'] := StajView.Controller.FocusedRow.Values[2];
                FieldValues['AdminMode'] := 0;
                Post;
            end;
            sp.Show;
        end;
    end;
end;

procedure TfrmZPersModule8.PrintActExecute(Sender: TObject);
var frm:TfrmPrint;
    id1, id2, id3:Integer;
    hnd:TISC_DB_HANDLE;
begin
    if DS_PersonStag.IsEmpty then exit;
    hnd:=WorkDatabase.Handle;
    id1:=getIdReport;
    id2:=DS_PersonStag['ID_MAN'];
    id3:=DS_PersonStag['ID_TYPE_STAG'];
    frm:=TfrmPrint.Create(Self);
    frm.SetParams(id1, id2, id3, hnd);
    frm.ShowModal;
    frm.Free;
end;

end.
