unit UpSignersFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, uFormControl,
    cxDataStorage, cxEdit, DB, cxDBData, FIBQuery, pFIBQuery, FIBDataSet,
    pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
    Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, pFibStoredProc,
    RxMemDS;

type
    TUP_SignersFrame = class(TFrame)
        SignersGrid: TcxGrid;
        View: TcxGridDBTableView;
        cxGridDBColumn2: TcxGridDBColumn;
        ViewDBColumn1: TcxGridDBColumn;
        cxGridLevel2: TcxGridLevel;
        pFIBDS_Signers: TpFIBDataSet;
        DS_Signers: TDataSource;
        pFIBDS_AddSigner: TpFIBDataSet;
        pFIBQ_DelSigner: TpFIBQuery;
        ToolBar1: TToolBar;
        AddSignerButton: TToolButton;
        DeleteSignerButton: TToolButton;
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
        IL_Orders: TImageList;
        Panel1: TPanel;
        CheckBox1: TCheckBox;
        CheckBox2: TCheckBox;
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
        cxStyle15: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        ToolButton1: TToolButton;
        ToolButton2: TToolButton;
        ToolButton3: TToolButton;
        ViewDBColumn2: TcxGridDBColumn;
        GetGlobalSignerDataSet: TpFIBDataSet;
        procedure AddSignerButtonClick(Sender: TObject);
        procedure DeleteSignerButtonClick(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure CheckBox2Click(Sender: TObject);
        procedure ToolButton1Click(Sender: TObject);
        procedure ToolButton2Click(Sender: TObject);
        procedure ToolButton3Click(Sender: TObject);
    private
        id_signers_type: Int64;
        id_order: Int64;
        id_type: Integer;
        tmpdir: string;
        procedure LoadFromTmpFile(FN: TFileName);
        procedure LoadFromGlobalSettings;
        procedure AddSingersToOrder(p1, p2: string);
    public
        FMode: TFormMode;
        constructor Create(aOwner: TComponent; aId_Order: Int64; aId_type: Int64; FMode: TFormMode; Is_new_order: Integer); reintroduce;
        destructor Destroy; reintroduce;
        procedure SaveToTmpFile;
    end;

implementation

uses uUnivSprav, UpOrderEdit, BaseTypes, UpSpSigners;

{$R *.dfm}

constructor TUP_SignersFrame.Create(aOwner: TComponent; aId_Order: Int64; aId_type: Int64; FMode: TFormMode; Is_new_order: Integer);
begin
    inherited Create(aOwner);
    tmpdir := GetEnvironmentVariable('HOMEDRIVE') + GetEnvironmentVariable('HOMEPATH');
    id_signers_type := aId_type;
    id_order := aId_Order;
    pFIBDS_AddSigner.Database := TUpEditOrder(Owner).WorkDatabase;
    pFIBDS_AddSigner.Transaction := TUpEditOrder(Owner).WriteTransaction;
    pFIBQ_DelSigner.Database := TUpEditOrder(Owner).WorkDatabase;
    pFIBQ_DelSigner.Transaction := TUpEditOrder(Owner).WriteTransaction;
    pFIBDS_Signers.Database := TUpEditOrder(Owner).WorkDatabase;
    pFIBDS_Signers.Transaction := TUpEditOrder(Owner).ReadTransaction;
    GetGlobalSignerDataSet.Database := TUpEditOrder(Owner).WorkDatabase;
    GetGlobalSignerDataSet.Transaction := TUpEditOrder(Owner).ReadTransaction;
    pFIBDS_Signers.ParamByName('id_order').AsInt64 := id_order;
    pFIBDS_Signers.ParamByName('id_sign_type').AsInt64 := id_signers_type;
    GetGlobalSignerDataSet.ParamByName('id_sign_type').AsInt64 := id_signers_type;
    GetGlobalSignerDataSet.Open;

    pFIBDS_AddSigner.ParamByName('id_order').AsInt64 := id_order;
    pFIBDS_AddSigner.ParamByName('id_sign_type').AsInt64 := id_signers_type;
    self.id_type := id_signers_type;

    if Is_new_order = 1
        then begin
                  //Проверяем если нет настроек локальных
        if not FileExists(tmpdir + '\tmpUsrSigners' + IntToStr(aId_type) + '.tmp')
            then begin
                            //то забираем глобальные
            LoadFromGlobalSettings;
        end
        else begin
                            //то забираем настройки из локального файла
            LoadFromTmpFile(tmpdir + '\tmpUsrSigners' + IntToStr(aId_type) + '.tmp')
        end;
    end;

    pFIBDS_Signers.Open;
    pFIBDS_Signers.FetchAll;


    AddSignerButton.Enabled := (FMode <> fmInfo);
    DeleteSignerButton.Enabled := (FMode <> fmInfo);
end;

procedure TUP_SignersFrame.AddSignerButtonClick(Sender: TObject);
var T: TfrmSpSigners;
    id_signer: Int64;
begin
    T := TfrmSpSigners.Create(Self, 6, pFIBDS_AddSigner.Database.Handle);
    T.Caption := 'Додати візу до наказу';
    if T.ShowModal = mrYes
        then begin
        pFIBDS_AddSigner.ParamByName('signer_fio').AsString := T.signer_fio;
        pFIBDS_AddSigner.ParamByName('signer_post').AsString := T.signer_post;
        try
            pFIBDS_AddSigner.Transaction.StartTransaction;
            pFIBDS_AddSigner.Open;
            id_signer := pFIBDS_AddSigner['ID_SIGNER'];
            pFIBDS_AddSigner.Close;
            pFIBDS_AddSigner.Transaction.Commit;
            pFIBDS_Signers.CloseOpen(true);
            pFIBDS_Signers.Locate('ID_SIGNER', ID_SIGNER, []);
        except on e: Exception do
            begin
                MessageDlg('Помилка : ' + e.Message, mtError, [mbYes], -1);
                pFIBDS_AddSigner.Transaction.Rollback;
            end;
        end;
    end;
    T.Free;
end;

procedure TUP_SignersFrame.DeleteSignerButtonClick(Sender: TObject);
begin
    if (pFIBDS_Signers.IsEmpty)
        then begin
        agShowMessage('Помилка : немає записів для вилучення! ');
        Exit;
    end;

    if (agMessageDlg('Увага!', 'Ви впевнені що хочете вилучити візуючого?', mtConfirmation, [mbYes, mbNo]) = mrYes)
        then begin
        try
            pFIBQ_DelSigner.ParamByName('id_signer').AsInt64 := pFIBDS_Signers['ID_SIGNER'];
            TUpEditOrder(Owner).WriteTransaction.StartTransaction;
            pFIBQ_DelSigner.ExecProc;
            pFIBDS_Signers.CacheDelete;
            TUpEditOrder(Owner).WriteTransaction.Commit;
        except on e: Exception do
            begin
                agShowMessage('Помилка : ' + e.Message);
                pFIBDS_AddSigner.Transaction.Rollback;
            end;

        end;
    end;
end;

procedure TUP_SignersFrame.CheckBox1Click(Sender: TObject);
var I: Integer;
begin
    for i := 0 to View.ColumnCount - 1 do
    begin
        View.Columns[i].Options.Filtering := CheckBox1.Checked;
    end;
end;

procedure TUP_SignersFrame.CheckBox2Click(Sender: TObject);
begin
    View.OptionsView.GroupByBox := CheckBox2.Checked;
end;

procedure TUP_SignersFrame.ToolButton1Click(Sender: TObject);
begin
    TUpEditOrder(Owner).Close;
end;

procedure TUP_SignersFrame.ToolButton2Click(Sender: TObject);
var UpdateSP: TpFibStoredProc;
    id: Int64;
begin
     //необходимо повысить запись в порядке
    if (pFIBDS_Signers.RecordCount > 0)
        then begin
        UpdateSP := TpFibStoredProc.Create(self);
        UpdateSP.Database := TUpEditOrder(Owner).WorkDatabase;
        UpdateSP.Transaction := TUpEditOrder(Owner).WriteTransaction;
        TUpEditOrder(Owner).WriteTransaction.StartTransaction;
        UpdateSP.StoredProcName := 'UP_DT_ORDER_SIGNERS_UPD_TOP';
        UpdateSP.Prepare;
        id := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('ID_SIGNER').AsInt64 := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('ID_ORDER').AsInt64 := id_order;
        UpdateSP.ParamByName('PRINT_ORDER').Value := pFIBDS_Signers.FieldByName('PRINT_ORDER').Value;
        UpdateSP.ParamByName('ID_TYPE_SIGNER').Value := id_type;
        UpdateSP.ExecProc;
        TUpEditOrder(Owner).WriteTransaction.Commit;
        pFIBDS_Signers.CloseOpen(true);
        pFIBDS_Signers.Locate('ID_SIGNER', id, []);
        UpdateSP.Close;
        UpdateSP.Free;
    end;
end;

procedure TUP_SignersFrame.ToolButton3Click(Sender: TObject);
var UpdateSP: TpFibStoredProc;
    id: Int64;
begin
     //необходимо понизить запись в порядке
    if (pFIBDS_Signers.RecordCount > 0)
        then begin
        UpdateSP := TpFibStoredProc.Create(self);
        UpdateSP.Database := TUpEditOrder(Owner).WorkDatabase;
        UpdateSP.Transaction := TUpEditOrder(Owner).WriteTransaction;
        TUpEditOrder(Owner).WriteTransaction.StartTransaction;
        UpdateSP.StoredProcName := 'UP_DT_ORDER_SIGNERS_UPD_DOWN';
        UpdateSP.Prepare;
        id := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('ID_SIGNER').AsInt64 := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('ID_ORDER').AsInt64 := id_order;
        UpdateSP.ParamByName('PRINT_ORDER').Value := pFIBDS_Signers.FieldByName('PRINT_ORDER').Value;
        UpdateSP.ParamByName('ID_TYPE_SIGNER').Value := id_type;
        UpdateSP.ExecProc;
        TUpEditOrder(Owner).WriteTransaction.Commit;
        pFIBDS_Signers.CloseOpen(true);
        pFIBDS_Signers.Locate('ID_SIGNER', id, []);
        UpdateSP.Close;
        UpdateSP.Free;
    end;
end;

destructor TUP_SignersFrame.Destroy;
begin
    inherited Destroy;
end;

procedure TUP_SignersFrame.LoadFromTmpFile(FN: TFileName);
var tmpFile: TextFile;
    signer_FIO: string;
    signer_POST: string;
begin
    AssignFile(tmpFile, FN);
    Reset(tmpFile);
    while not Eof(tmpFile) do
    begin
        Readln(tmpFile, signer_FIO);
        Readln(tmpFile, signer_POST);
        AddSingersToOrder(signer_FIO, signer_POST);
    end;
    CloseFile(tmpFile);
end;

procedure TUP_SignersFrame.AddSingersToOrder(p1, p2: string);
var id_signer: Integer;
begin
    pFIBDS_AddSigner.ParamByName('signer_fio').AsString := p1;
    pFIBDS_AddSigner.ParamByName('signer_post').AsString := p2;
    try
        pFIBDS_AddSigner.Transaction.StartTransaction;
        pFIBDS_AddSigner.Open;
        id_signer := pFIBDS_AddSigner['ID_SIGNER'];
        pFIBDS_AddSigner.Close;
        pFIBDS_AddSigner.Transaction.Commit;
        pFIBDS_Signers.CloseOpen(true);
        pFIBDS_Signers.Locate('ID_SIGNER', ID_SIGNER, []);
    except on e: Exception do
        begin
            MessageDlg('Помилка : ' + e.Message, mtError, [mbYes], -1);
            pFIBDS_AddSigner.Transaction.Rollback;
        end;
    end;
end;

procedure TUP_SignersFrame.SaveToTmpFile;
var tmpFile: TextFile;
begin
    AssignFile(tmpFile, tmpdir + '\tmpUsrSigners' + IntToStr(Id_type) + '.tmp');
    Rewrite(tmpFile);
    if pFIBDS_Signers.Active
        then begin
        if pFIBDS_Signers.RecordCount > 0
            then begin
            pFIBDS_Signers.First;
            while not pFIBDS_Signers.Eof do
            begin
                Writeln(tmpFile, pFIBDS_Signers.FieldByName('signer_FIO').asString);
                Writeln(tmpFile, pFIBDS_Signers.FieldByName('signer_POST').asString);
                pFIBDS_Signers.Next;
            end;
        end;
    end;
    CloseFile(tmpFile);
end;

procedure TUP_SignersFrame.LoadFromGlobalSettings;
begin
    GetGlobalSignerDataSet.First;
    while not GetGlobalSignerDataSet.Eof do
    begin
        AddSingersToOrder(GetGlobalSignerDataSet.FieldByName('SIGNER_FIO').AsString,
            GetGlobalSignerDataSet.FieldByName('SIGNER_POST').AsString);
        GetGlobalSignerDataSet.Next;
    end;
end;

end.
