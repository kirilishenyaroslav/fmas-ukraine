unit UpComandOrderSpTarget;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxContainer, cxLabel,
    StdCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, BaseTypes,
    FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, iBase, UpKernelUnit,
    FIBDataSet, pFIBDataSet, dxBar, ExtCtrls, ImgList, dxBarExtItems, UpComandOrderEdit;

type
    TFormComandSpTarget = class(TForm)
        dxBarManager: TdxBarManager;
        AddBtn: TdxBarLargeButton;
        ModifyBtn: TdxBarLargeButton;
        RefreshBtn: TdxBarLargeButton;
        DeleteBtn: TdxBarLargeButton;
        ExitBtn: TdxBarLargeButton;
        SelectBtn: TdxBarLargeButton;
        IL_OrdAcc: TImageList;
        PanelBar: TPanel;
        dxBarDockControl1: TdxBarDockControl;
        DSTarget: TDataSource;
        DSetTarget: TpFIBDataSet;
        Tr: TpFIBTransaction;
        StorProc: TpFIBStoredProc;
        GridTarget: TcxGrid;
        GridTargetDBTableView: TcxGridDBTableView;
        colIdComandTarget: TcxGridDBColumn;
        colTextTarget: TcxGridDBColumn;
        GridTargetLevel: TcxGridLevel;
        PanelSearch: TPanel;
        SearchEdit: TcxTextEdit;
        lblSearch: TcxLabel;
        procedure AddBtnClick(Sender: TObject);
        procedure ModifyBtnClick(Sender: TObject);
        procedure RefreshBtnClick(Sender: TObject);
        procedure DeleteBtnClick(Sender: TObject);
        procedure SelectBtnClick(Sender: TObject);
        procedure ExitBtnClick(Sender: TObject);
        procedure GridTargetDBTableViewDblClick(Sender: TObject);
        procedure GridTargetDBTableViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SearchEditPropertiesChange(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    private
        procedure DSetTargetCloseOpen;
        function DSetTargetIU(Id: Integer; Name: string): Integer;
    { Private declarations }
    public
        DBHandle: TISC_DB_HANDLE;
    { Public declarations }
    end;

var
    FormComandSpTarget: TFormComandSpTarget;

implementation

{$R *.dfm}

uses UpComandOrderTargetAdd;


procedure TFormComandSpTarget.DSetTargetCloseOpen;
begin
    DSetTarget.Close;
    DSetTarget.SQLs.SelectSQL.Text := 'SELECT * FROM UP_DT_COMAND_TARGET ORDER BY TEXT_TARGET COLLATE WIN1251_UA';
    DSetTarget.Open;
end;

function TFormComandSpTarget.DSetTargetIU(Id: Integer; Name: string): Integer;
begin
    try
        StorProc.Close;
        StorProc.Transaction.StartTransaction;
        StorProc.StoredProcName := 'UP_DT_COMAND_TARGET_IU';
        StorProc.Prepare;
        StorProc.ParamByName('IN_ID_COMAND_TARGET').AsInteger := Id;
        StorProc.ParamByName('TEXT_TARGET').AsString := Name;
        StorProc.ExecProc;
        DSetTargetIU := StorProc.FN('ID_COMAND_TARGET').AsInteger;
        StorProc.Transaction.Commit;
    except on E: Exception do
        begin
            ShowMessage(E.Message);
            StorProc.Transaction.Rollback;
            Result := -1;
        end;
    end;
end;

procedure TFormComandSpTarget.AddBtnClick(Sender: TObject);
var
    frmAdd: TFormTargetAdd;
    id: Integer;
begin
    frmAdd := TFormTargetAdd.Create(Self);
    if (frmAdd.ShowModal = mrOK) then
    begin
        Id := DSetTargetIU(-1, frmAdd.NameTE.EditingText);
        DSetTargetCloseOpen;
        DSetTarget.Locate('ID_COMAND_TARGET', Id, []);
    end;
    frmAdd.Free;
end;


procedure TFormComandSpTarget.ModifyBtnClick(Sender: TObject);
var
    frmAdd: TFormTargetAdd;
    Id: Integer;
begin
    Id := DSetTarget.FieldByName('ID_COMAND_TARGET').AsInteger;
    frmAdd := TFormTargetAdd.Create(Self);
    frmAdd.NameTE.Text := DSetTarget.FieldByName('TEXT_TARGET').AsString;
    if frmAdd.ShowModal = mrOk then
    begin
        Id := DSetTargetIU(Id, frmAdd.NameTE.EditingText);
        DSetTargetCloseOpen;
        DSetTarget.Locate('ID_COMAND_TARGET', Id, []);
    end;
    frmAdd.Free;
end;

procedure TFormComandSpTarget.RefreshBtnClick(Sender: TObject);
var
    Id: Integer;
begin
    if DSetTarget.RecordCount > 0 then
        Id := DSetTarget.FieldByName('ID_COMAND_TARGET').AsInteger;
    DSetTargetCloseOpen;
    DSetTarget.Locate('ID_COMAND_TARGET', Id, []);
end;

procedure TFormComandSpTarget.DeleteBtnClick(Sender: TObject);
var
    Id: Integer;
    NextId: Integer;
begin
    if (DSetTarget.RecordCount > 0)
        then
    begin
        Id := DSetTarget.FieldByName('ID_COMAND_TARGET').AsInteger;
        DSetTarget.Next;
        if not DSetTarget.Eof then
        begin
            NextId := DSetTarget.FieldByName('ID_COMAND_TARGET').AsInteger;
            DSetTarget.Prior;
        end
        else
            NextId := -1;

        if agMessageDlg('Увага!', 'Ви бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
        begin
            StorProc.Transaction.StartTransaction;
            StorProc.StoredProcName := 'UP_DT_COMAND_TARGET_DEL';
            StorProc.Prepare;
            StorProc.ParamByName('ID_COMAND_TARGET').AsInteger := Id;
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
            DSetTargetCloseOpen;
            if NextId = -1 then
                DSetTarget.Last
            else
                DSetTarget.Locate('ID_COMAND_TARGET', NextId, []);
        end;
    end;
end;

procedure TFormComandSpTarget.SelectBtnClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFormComandSpTarget.ExitBtnClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TFormComandSpTarget.GridTargetDBTableViewDblClick(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TFormComandSpTarget.GridTargetDBTableViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift)) then
        ShowInfo(DSetTarget);

end;

procedure TFormComandSpTarget.SearchEditPropertiesChange(Sender: TObject);
var
    sFilter: string;
begin
    if ((SearchEdit.Text = '') or VarIsNull(SearchEdit.Text)) then
    begin
        GridTargetDBTableView.DataController.DataSet.Filtered := False;
    end
    else
    begin
        try
            GridTargetDBTableView.DataController.DataSet.Filtered := False;
            sFilter := 'UPPER(' + AnsiUpperCase('TEXT_TARGET') + ') LIKE ''' +
                '%' + AnsiUpperCase(SearchEdit.Text) + '%'' AND ' +
                'TEXT_TARGET IS NOT NULL';
            GridTargetDBTableView.DataController.DataSet.Filter := sFilter;
            GridTargetDBTableView.DataController.DataSet.Filtered := True;
            GridTargetDBTableView.DataController.SelectRows(0, 0);
        except
            on E: Exception do
                ShowMessage(E.Message);
        end;
    end;
end;

procedure TFormComandSpTarget.FormCreate(Sender: TObject);
begin
    DSetTargetCloseOpen;
end;

end.
