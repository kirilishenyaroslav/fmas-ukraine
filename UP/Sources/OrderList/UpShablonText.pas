unit UpShablonText;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, cxGridTableView, ImgList, cxGridLevel,
    cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
    cxGridCustomView, cxGrid, ComCtrls, ToolWin, UpEditText, pFibStoredProc,
    BaseTypes, Ibase;

type
    TfrmShablonText = class(TForm)
        ToolBar1: TToolBar;
        btnAdd: TToolButton;
        btnDel: TToolButton;
        btnEdit: TToolButton;
        RefreshButton: TToolButton;
        btnSel: TToolButton;
        btnClose: TToolButton;
        TextGrid: TcxGrid;
        TextView: TcxGridDBTableView;
        TextViewDBColumn1: TcxGridDBColumn;
        TextLevel: TcxGridLevel;
        IL_Orders: TImageList;
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
        TextDS: TpFIBDataSet;
        dsTextDSet: TDataSource;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        procedure btnAddClick(Sender: TObject);
        procedure btnSelClick(Sender: TObject);
        procedure btnCloseClick(Sender: TObject);
        procedure btnDelClick(Sender: TObject);
        procedure RefreshButtonClick(Sender: TObject);
        procedure btnEditClick(Sender: TObject);
        procedure TextViewDblClick(Sender: TObject);
        procedure TextViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
    { Private declarations }
        id_type_text: Integer;
    public
    { Public declarations }
        shablon_text: string;
        constructor Create(AOwner: TComponent; id_type_texts: Integer; DbHandle: TISC_DB_HANDLE); reintroduce;
    end;

var
    frmShablonText: TfrmShablonText;

implementation

{$R *.dfm}

uses UpKernelUnit;

procedure TfrmShablonText.btnAddClick(Sender: TObject);
var T: TfrmShablonEdit;
    SP: TpFibStoredProc;
    ID_SHABLON: Integer;
begin
    T := TfrmShablonEdit.Create(self);
    T.Caption := 'Додати назву';
    if T.ShowModal = mrYes
        then begin
        SP := TpFibStoredProc.Create(self);
        SP.Database := WorkDatabase;
        SP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        SP.StoredProcName := 'UP_DT_TEXT_SHABLONS_INS_UPD';
        SP.Prepare;
        SP.ParamByName('ID_SH').Value := null;
        SP.ParamByName('TEXT1').Value := T.cxMemoText.Text;
        SP.ParamByName('ID_SHABLON_TYPE').Value := id_type_text;
        SP.ExecProc;
        ID_SHABLON := SP.ParamByName('ID_SHABLON').Value;
        SP.Close;
        SP.Free;
        WriteTransaction.Commit;
        TextDS.CloseOpen(true);
        TextDS.Locate('ID_SHABLON', ID_SHABLON, []);
    end;
    T.Free;
end;

procedure TfrmShablonText.btnSelClick(Sender: TObject);
begin
    if (TextDS.RecordCount > 0)
        then begin
        shablon_text := TextDS.FieldByName('text1').AsString;
        ModalResult := mrYes;
    end;
end;

procedure TfrmShablonText.btnCloseClick(Sender: TObject);
begin
    ModalResult := mrNo;
end;

procedure TfrmShablonText.btnDelClick(Sender: TObject);
var SP: TpFibStoredProc;
begin
    if (TextDS.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви хочете вилучити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes
            then begin
            SP := TpFibStoredProc.Create(self);
            SP.Database := WorkDatabase;
            SP.Transaction := WriteTransaction;
            WriteTransaction.StartTransaction;
            SP.StoredProcName := 'UP_DT_TEXT_SHABLONS_DEL';
            SP.Prepare;
            SP.ParamByName('ID_SHABLON').Value := TextDS.FieldByName('ID_SHABLON').Value;
            SP.ExecProc;
            SP.Close;
            SP.Free;
            WriteTransaction.Commit;
            TextDS.CacheDelete;
        end;
    end;
end;

procedure TfrmShablonText.RefreshButtonClick(Sender: TObject);
begin
    TextDS.CloseOpen(true);
end;

constructor TfrmShablonText.Create(AOwner: TComponent;
    id_type_texts: Integer; DbHandle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);
    id_type_text := id_type_texts;
    WorkDatabase.Handle := DbHandle;
    ReadTransaction.StartTransaction;
    TextDS.SelectSQL.Text := 'select * from  up_get_text_shablon(' + IntToStr(id_type_text) + ')';
    TextDS.Open;
end;

procedure TfrmShablonText.btnEditClick(Sender: TObject);
var T: TfrmShablonEdit;
    SP: TpFibStoredProc;
    ID_SHABLON: Integer;
begin
    T := TfrmShablonEdit.Create(self);
    T.Caption := 'Змінити назву';
    T.cxMemoText.EditValue := TextDS.FieldByName('TEXT1').Value;
    if T.ShowModal = mrYes
        then begin
        SP := TpFibStoredProc.Create(self);
        SP.Database := WorkDatabase;
        SP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        SP.StoredProcName := 'UP_DT_TEXT_SHABLONS_INS_UPD';
        SP.Prepare;
        ID_SHABLON := TextDS.FieldByName('ID_SHABLON').Value;
        SP.ParamByName('ID_SH').Value := ID_SHABLON;
        SP.ParamByName('TEXT1').Value := T.cxMemoText.Text;
        SP.ParamByName('ID_SHABLON_TYPE').Value := id_type_text;
        SP.ExecProc;
        SP.Close;
        SP.Free;
        WriteTransaction.Commit;
        TextDS.CloseOpen(true);
        TextDS.Locate('ID_SHABLON', ID_SHABLON, []);
    end;
    T.Free;
end;

procedure TfrmShablonText.TextViewDblClick(Sender: TObject);
begin
    if (TextDS.RecordCount > 0)
        then begin
        shablon_text := TextDS.FieldByName('text1').AsString;
        ModalResult := mrYes;
    end;
end;

procedure TfrmShablonText.TextViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if TextDS.RecordCount > 0
        then
    begin
        if ((Key = VK_INSERT) and (btnAdd.Enabled))
            then btnAdd.Click;

        if ((Key = VK_F2) and (btnEdit.Enabled))
            then btnEdit.Click;

        if ((Key = VK_DELETE) and (btnDel.Enabled))
            then btnDel.Click;

        if ((Key = VK_F5) and (RefreshButton.Enabled))
            then RefreshButton.Click;

        if ((Key = VK_ESCAPE) and (btnClose.Enabled))
            then btnClose.Click;

        if ((Key = VK_RETURN) and (btnSel.Enabled))
            then
        begin
            if (TextDS.RecordCount > 0)
                then begin
                shablon_text := TextDS.FieldByName('text1').AsString;
                ModalResult := mrYes;
            end;
        end;

        if ((Key = VK_F12) and (ssShift in Shift))
            then ShowInfo(TextDS);
    end
end;

end.
