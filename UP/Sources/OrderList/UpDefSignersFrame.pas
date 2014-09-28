unit UpDefSignersFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, uFormControl,
    cxDataStorage, cxEdit, DB, cxDBData, FIBQuery, pFIBQuery, FIBDataSet,
    pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
    Buttons, ExtCtrls, ImgList, ComCtrls, ToolWin, StdCtrls, pFibStoredProc,
    FIBDatabase, pFIBDatabase, Ibase;

type
    TUP_DefSignersFrame = class(TFrame)
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
        ToolButton2: TToolButton;
        ToolButton3: TToolButton;
        ViewDBColumn2: TcxGridDBColumn;
        WorkDatabase: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        WriteTransaction: TpFIBTransaction;
        IL_Orders: TImageList;
        procedure AddSignerButtonClick(Sender: TObject);
        procedure DeleteSignerButtonClick(Sender: TObject);
        procedure CheckBox1Click(Sender: TObject);
        procedure CheckBox2Click(Sender: TObject);
        procedure ToolButton2Click(Sender: TObject);
        procedure ToolButton3Click(Sender: TObject);
    private
        id_signers_type: Int64;

        id_type: Integer;
    public
        FMode: TFormMode;
        constructor Create(aOwner: TComponent; aId_type: Int64; dbHandle: TIsc_DB_HANDLE); reintroduce;
    end;

implementation

uses uUnivSprav, RxMemDS, BaseTypes;

{$R *.dfm}

constructor TUP_DefSignersFrame.Create(aOwner: TComponent; aId_type: Int64; DbHandle: TISC_DB_HANDLE);
begin
    inherited Create(aOwner);
    id_signers_type := aId_type;
    WorkDatabase.Handle := dbHandle;
    pFIBDS_AddSigner.Database := WorkDatabase;
    pFIBDS_AddSigner.Transaction := WriteTransaction;
    pFIBQ_DelSigner.Database := WorkDatabase;
    pFIBQ_DelSigner.Transaction := WriteTransaction;
    pFIBDS_Signers.Database := WorkDatabase;
    pFIBDS_Signers.Transaction := ReadTransaction;

    pFIBDS_Signers.SelectSQL.Text := 'select * from UP_DT_ORDER_DEF_SIGNERS_SEL(' + IntTOStr(aid_type) + ')';

    pFIBDS_Signers.Open;
    pFIBDS_AddSigner.ParamByName('id_sign_type').AsInt64 := id_signers_type;
    self.id_type := id_signers_type;
end;

procedure TUP_DefSignersFrame.AddSignerButtonClick(Sender: TObject);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
    id_signer: Int64;
begin
    Params.FormCaption := 'Додати візу до наказу';
    Params.ShowMode := fsmSelect;
    Params.ShowButtons := [fbExit];
    Params.TableName := 'up_get_text_shablon(6)';
    Params.Fields := 'text1,text2,id_shablon';
    Params.FieldsName := 'ПІП/б,Посада';
    Params.KeyField := 'ID_shablon';
    Params.ReturnFields := 'text1,text2';
    Params.DBHandle := Integer(pFIBDS_AddSigner.Database.Handle);

    OutPut := TRxMemoryData.Create(self);

    if GetUnivSprav(Params, OutPut)
        then
    begin
        pFIBDS_AddSigner.ParamByName('signer_fio').AsString := VarToStr(output['text1']);
        pFIBDS_AddSigner.ParamByName('signer_post').AsString := VarToStr(output['text2']);
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
end;

procedure TUP_DefSignersFrame.DeleteSignerButtonClick(Sender: TObject);
begin
    if (pFIBDS_Signers.IsEmpty)
        then begin
        agShowMessage('Помилка : немає записів для вилучення! ');
        Exit;
    end;

    if (agMessageDlg('Увага!', 'Ви впевнені що хочете вилучити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes)
        then begin
        try
            pFIBQ_DelSigner.ParamByName('id_signer').AsInt64 := pFIBDS_Signers['ID_SIGNER'];
            WriteTransaction.StartTransaction;
            pFIBQ_DelSigner.ExecProc;
            pFIBDS_Signers.CacheDelete;
            WriteTransaction.Commit;
        except on e: Exception do
            begin
                agShowMessage('Помилка : ' + e.Message);
                pFIBDS_AddSigner.Transaction.Rollback;
            end;

        end;
    end;
end;

procedure TUP_DefSignersFrame.CheckBox1Click(Sender: TObject);
var I: Integer;
begin
    for i := 0 to View.ColumnCount - 1 do
    begin
        View.Columns[i].Options.Filtering := CheckBox1.Checked;
    end;
end;

procedure TUP_DefSignersFrame.CheckBox2Click(Sender: TObject);
begin
    View.OptionsView.GroupByBox := CheckBox2.Checked;
end;

procedure TUP_DefSignersFrame.ToolButton2Click(Sender: TObject);
var UpdateSP: TpFibStoredProc;
    id: Int64;
begin
     //необходимо повысить запись в порядке
    if (pFIBDS_Signers.RecordCount > 0)
        then begin
        UpdateSP := TpFibStoredProc.Create(self);
        UpdateSP.Database := WorkDatabase;
        UpdateSP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        UpdateSP.StoredProcName := 'UP_DT_ORDER_DEF_SIGNERS_UPD_TOP';
        UpdateSP.Prepare;
        id := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('ID_SIGNER').AsInt64 := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('PRINT_ORDER').Value := pFIBDS_Signers.FieldByName('PRINT_ORDER').Value;
        UpdateSP.ParamByName('ID_TYPE_SIGNER').Value := id_type;
        UpdateSP.ExecProc;
        WriteTransaction.Commit;
        pFIBDS_Signers.CloseOpen(true);
        pFIBDS_Signers.Locate('ID_SIGNER', id, []);
        UpdateSP.Close;
        UpdateSP.Free;
    end;
end;

procedure TUP_DefSignersFrame.ToolButton3Click(Sender: TObject);
var UpdateSP: TpFibStoredProc;
    id: Int64;
begin
     //необходимо понизить запись в порядке
    if (pFIBDS_Signers.RecordCount > 0)
        then begin
        UpdateSP := TpFibStoredProc.Create(self);
        UpdateSP.Database := WorkDatabase;
        UpdateSP.Transaction := WriteTransaction;
        WriteTransaction.StartTransaction;
        UpdateSP.StoredProcName := 'UP_DT_ORDER_DE_SIGNERS_UPD_DOWN';
        UpdateSP.Prepare;
        id := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('ID_SIGNER').AsInt64 := StrToInt64(pFIBDS_Signers.FieldByName('ID_SIGNER').asString);
        UpdateSP.ParamByName('PRINT_ORDER').Value := pFIBDS_Signers.FieldByName('PRINT_ORDER').Value;
        UpdateSP.ParamByName('ID_TYPE_SIGNER').Value := id_type;
        UpdateSP.ExecProc;
        WriteTransaction.Commit;
        pFIBDS_Signers.CloseOpen(true);
        pFIBDS_Signers.Locate('ID_SIGNER', id, []);
        UpdateSP.Close;
        UpdateSP.Free;
    end;
end;

end.
