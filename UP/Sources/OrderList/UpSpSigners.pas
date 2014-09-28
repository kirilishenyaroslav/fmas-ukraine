unit UpSpSigners;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ComCtrls, ToolWin, ImgList, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
    pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses, Ibase,
    FIBDatabase, pFIBDatabase, pFibStoredProc;

type
    TfrmSpSigners = class(TForm)
        IL_Orders: TImageList;
        ToolBar1: TToolBar;
        ToolButton2: TToolButton;
        RefreshButton: TToolButton;
        btn1: TToolButton;
        btn2: TToolButton;
        btn3: TToolButton;
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
        ContentError: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
        ItemsGrid: TcxGrid;
        ReportDataView: TcxGridDBTableView;
        ReportDataViewDBColumn1: TcxGridDBColumn;
        ReportDataViewDBColumn2: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        SignersDS: TpFIBDataSet;
        dsSiognersDSet: TDataSource;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        btn4: TToolButton;
        procedure btn3Click(Sender: TObject);
        procedure btn1Click(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure btn2Click(Sender: TObject);
        procedure ToolButton2Click(Sender: TObject);
        procedure btn4Click(Sender: TObject);
    private
    { Private declarations }
        id_type_signer: Integer;
    public
    { Public declarations }
        signer_fio: string;
        signer_post: string;
        constructor Create(AOwner: TComponent; id_type_signers: Integer; DbHandle: TISC_DB_HANDLE); reintroduce;
    end;

implementation

{$R *.dfm}

uses UpEditSigners, BaseTypes;

{ TfrmSpSigners }

constructor TfrmSpSigners.Create(AOwner: TComponent; id_type_signers: Integer; DbHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    id_type_signer := id_type_signers;
    WorkDatabase.Handle := DbHandle;
    ReadTransaction.StartTransaction;
    SignersDS.SelectSQL.Text := 'select * from  up_get_text_shablon(' + IntToStr(id_type_signer) + ')';
    SignersDS.Open;
end;

procedure TfrmSpSigners.btn3Click(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmSpSigners.btn1Click(Sender: TObject);
begin
    if (SignersDS.RecordCount > 0)
        then begin
        signer_fio := SignersDS.FieldByName('text1').AsString;
        signer_post := SignersDS.FieldByName('text2').AsString;
        ModalResult := mrYes;
    end;
end;

procedure TfrmSpSigners.RefreshButtonClick(Sender: TObject);
begin
    SignersDS.CloseOpen(true);
end;

procedure TfrmSpSigners.btn2Click(Sender: TObject);
var T: TfrmEditSignInfo;
    SP: TpFibStoredProc;
    ID_SHABLON: Integer;
begin
    T := TfrmEditSignInfo.Create(self);
    if T.ShowModal = mrYes
        then begin
        SP := TpFibStoredProc.Create(self);
        SP.Database := WorkDatabase;
        SP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        SP.StoredProcName := 'UP_DT_TEXT_SHABLONS_INS_UPD';
        SP.Prepare;
        SP.ParamByName('ID_SH').Value := null;
        SP.ParamByName('TEXT1').Value := T.cxTextEdit1.Text;
        SP.ParamByName('TEXT2').Value := T.cxTextEdit2.Text;
        SP.ParamByName('ID_SHABLON_TYPE').Value := id_type_signer;
        SP.ExecProc;
        ID_SHABLON := SP.ParamByName('ID_SHABLON').Value;
        SP.Close;
        SP.Free;
        WriteTransaction.Commit;
        SignersDS.CloseOpen(true);
        SignersDS.Locate('ID_SHABLON', ID_SHABLON, []);
    end;
    T.Free;
end;

procedure TfrmSpSigners.ToolButton2Click(Sender: TObject);
var T: TfrmEditSignInfo;
    SP: TpFibStoredProc;
    ID_SHABLON: Integer;
begin
    T := TfrmEditSignInfo.Create(self);
    T.cxTextEdit1.EditValue := SignersDS.FieldByName('TEXT1').Value;
    T.cxTextEdit2.EditValue := SignersDS.FieldByName('TEXT2').Value;
    if T.ShowModal = mrYes
        then begin
        SP := TpFibStoredProc.Create(self);
        SP.Database := WorkDatabase;
        SP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        SP.StoredProcName := 'UP_DT_TEXT_SHABLONS_INS_UPD';
        SP.Prepare;
        ID_SHABLON := SignersDS.FieldByName('ID_SHABLON').Value;
        SP.ParamByName('ID_SH').Value := ID_SHABLON;
        SP.ParamByName('TEXT1').Value := T.cxTextEdit1.Text;
        SP.ParamByName('TEXT2').Value := T.cxTextEdit2.Text;
        SP.ParamByName('ID_SHABLON_TYPE').Value := id_type_signer;
        SP.ExecProc;
        SP.Close;
        SP.Free;
        WriteTransaction.Commit;
        SignersDS.CloseOpen(true);
        SignersDS.Locate('ID_SHABLON', ID_SHABLON, []);
    end;
    T.Free;
end;

procedure TfrmSpSigners.btn4Click(Sender: TObject);
var SP: TpFibStoredProc;
begin
    if (SignersDS.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви хочете вилучити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes
            then begin
            SP := TpFibStoredProc.Create(self);
            SP.Database := WorkDatabase;
            SP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            SP.StoredProcName := 'UP_DT_TEXT_SHABLONS_DEL';
            SP.Prepare;
            SP.ParamByName('ID_SHABLON').Value := SignersDS.FieldByName('ID_SHABLON').Value;
            SP.ExecProc;
            SP.Close;
            SP.Free;
            WriteTransaction.Commit;
            SignersDS.CacheDelete;
        end;
    end;
end;

end.
