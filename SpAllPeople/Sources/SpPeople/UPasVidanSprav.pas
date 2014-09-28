unit UPasVidanSprav;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
    cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, Buttons,
    ExtCtrls, StdCtrls, FIBDatabase, pFIBDatabase, FIBDataSet,
    pFIBDataSet, cxContainer, cxTextEdit, IBase, SpPeople_z_dmCommonStyles, UAddVidanPlace,
    ActnList, ToolWin, ComCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, AccMgmt,
    SpPeople_ZMessages;

type
    TPasVidanForm = class(TForm)
        MainGrid: TcxGrid;
        MainGridDBTableView1: TcxGridDBTableView;
        MainGridLevel1: TcxGridLevel;
        SearchPanel: TPanel;
        MainGridDBTableView1VIDAN: TcxGridDBColumn;
        DB: TpFIBDatabase;
        DSet1: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        DSource1: TDataSource;
        SearchTE: TcxTextEdit;
        Timer1: TTimer;
        ActionList1: TActionList;
        CloseAction: TAction;
        SelectAction: TAction;
        MainToolBar: TToolBar;
        AddBtn: TSpeedButton;
        SelectBtn: TSpeedButton;
        HistWriteTransaction: TpFIBTransaction;
        StProcHist: TpFIBStoredProc;
        MakeOldBtn: TSpeedButton;
        MakeOldAction: TAction;
        StoredProc: TpFIBStoredProc;
        procedure AddBtnClick(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
        procedure SearchTEKeyPress(Sender: TObject; var Key: Char);
        procedure SelectActionExecute(Sender: TObject);
        procedure CloseActionExecute(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure MainGridDBTableView1DblClick(Sender: TObject);
        procedure MainGridDBTableView1KeyPress(Sender: TObject; var Key: Char);
        procedure HistWriteTransactionAfterStart(Sender: TObject);
        procedure MakeOldActionExecute(Sender: TObject);
    private
        pStylesDM: TStylesDM;
        procedure ReOpenDSet;
    public
        GrantedPlace: string; //  ем выдан
        Nach_vidan: string;
        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; pas_vidan: string); reintroduce;
    end;

function GetVidanPlace(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; pas_vidan: string): string;

implementation

{$R *.dfm}

function GetVidanPlace(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; pas_vidan: string): string;
var
    ViewForm: TPasVidanForm;
begin
    ViewForm := TPasVidanForm.Create(AOwner, ADB_Handle, pas_vidan);
    if ViewForm.ShowModal = mrOk then
        Result := ViewForm.GrantedPlace
    else
        Result := '';
    ViewForm.Free;
end;

constructor TPasVidanForm.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; pas_vidan: string);
begin
    inherited Create(AOwner);
    //******************************************************************************
    DB.Handle := ADB_Handle;
    nach_vidan := pas_vidan;
    pStylesDM := TStylesDM.Create(Self);
    MainGridDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
    ReOpenDSet;
    dset1.Locate('VIDAN', nach_vidan, []);
    SearchTE.Width := SearchPanel.Width - 64;
end;

procedure TPasVidanForm.ReOpenDSet;
begin
    if DSet1.Active then
        DSet1.Close;
    if SearchTE.Text <> '' then
        DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_PASS_VIDAN(''' + SearchTE.Text + ''') ORDER BY VIDAN'
    else
        DSet1.SQLs.SelectSQL.Text := 'SELECT * FROM Z_GET_PASS_VIDAN(NULL) ORDER BY VIDAN';
    DSet1.Open;
end;

procedure TPasVidanForm.AddBtnClick(Sender: TObject);
var
    s: string;
begin
    s := AddVidan;
    if s <> '' then
    begin
        GrantedPlace := s;
        ModalResult := mrOk;
    end;
end;

procedure TPasVidanForm.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled := False;
    ReOpenDSet;
end;

procedure TPasVidanForm.SearchTEKeyPress(Sender: TObject; var Key: Char);
begin
    Timer1.Enabled := False;
    Timer1.Enabled := True;
end;

procedure TPasVidanForm.SelectActionExecute(Sender: TObject);
begin
    GrantedPlace := DSet1['VIDAN'];
    ModalResult := mrOk;
end;

procedure TPasVidanForm.CloseActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TPasVidanForm.FormResize(Sender: TObject);
begin
    SearchTE.Width := SearchPanel.Width - 64;
end;

procedure TPasVidanForm.MainGridDBTableView1DblClick(Sender: TObject);
begin
    SelectActionExecute(Self);
end;

procedure TPasVidanForm.MainGridDBTableView1KeyPress(Sender: TObject;
    var Key: Char);
const
    LettersBig = 'јЅ¬√•ƒ≈®∆«™≤»ѓ… ЋћЌќѕ–—“”‘’÷„ЎўЏџ№Ёёя';
    LettersSmall = 'абвгідеЄжзЇ≥ињйклмнопрстуфхцчшщъыьэю€';
    Signs = '0123456789-()/\';
    Space = ' ';
begin
    if (Pos(Key, LettersBig) = 0) and (Pos(Key, LettersSmall) = 0) and
        (Pos(Key, Signs) = 0) and (Pos(Key, Space) = 0) then
        Exit;

    SearchTE.Text := SearchTE.Text + Key;
    SearchTE.SetFocus;
    SearchTE.SetSelection(Length(SearchTE.Text), Length(SearchTE.Text));
    Timer1.Enabled := False;
    Timer1.Enabled := True;
end;

procedure TPasVidanForm.HistWriteTransactionAfterStart(Sender: TObject);
begin
    // записываем данные о гр€дущем изменении в таблицу PUB_DT_HISTORY_INFO
    // уже не записываем, по словам  я¬а данные должна писать аццмжмт-бплина
    {StProcHist.StoredProcName := 'PUB_SET_HISTORY_INS';
    StProcHist.Prepare;
    StProcHist.ParamByName('IN_ID_USER').AsInt64 := accMgmt.GetUserId;
    StProcHist.ParamByName('APP_NAME').AsString := ExtractFileName(Application.ExeName);
    StProcHist.ExecProc;}
end;

procedure TPasVidanForm.MakeOldActionExecute(Sender: TObject);
begin
    if DSet1.IsEmpty then
        Exit;
    if ZShowMessage(Self.Caption, MakeOld_Message, mtCustom, [mbYes, mbNo]) = mrYes then
    begin
        try
            StoredProc.StoredProcName := 'PEOPLE_MAKE_PASS_VIDAN_OLD';
            StoredProc.Transaction.StartTransaction;
            StoredProc.Prepare;
            StoredProc.ParamByName('VIDAN').Value := DSet1['VIDAN'];
            StoredProc.ExecProc;
            StoredProc.Transaction.Commit;
            DSet1.CloseOpen(False);
        except
            on E: Exception do
            begin
                ZShowMessage(Self.Caption, E.Message, mtError, [mbOK]);
                StoredProc.Transaction.Rollback;
            end;
        end;
    end;
end;

end.
