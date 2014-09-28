unit uPensionFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, EditControl,
    cxGridDBTableView, cxGrid, Buttons, ExtCtrls, uPensionAdd,
    ActnList, ComCtrls, FieldControl, SpComboBox, uCommonSp, SpCommon, Mask,
    CheckEditUnit, uFormControl, pFibStoredProc, UpKernelUnit, FIBDataSet,
    pFIBDataSet, BaseTypes, cxTextEdit, FIBQuery, pFIBQuery, FIBDatabase,
    pFIBDatabase, ibase;

type
    TfmPCardPensionPage = class(TFrame)
        Panel11: TPanel;
        SB_ModifPension: TSpeedButton;
        SB_AddPension: TSpeedButton;
        ALPension: TActionList;
        AddPensionA: TAction;
        ModifPensionA: TAction;
        cxStyleRepository1: TcxStyleRepository;
        DelPensionA: TAction;
        SB_DelPension: TSpeedButton;
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
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        PensionGridView: TcxGridDBTableView;
        PensionGridLevel1: TcxGridLevel;
        PensionGrid: TcxGrid;
        PensionGridViewDBColumn1: TcxGridDBColumn;
        PensionGridViewDBColumn2: TcxGridDBColumn;
        PensionGridViewDBColumn3: TcxGridDBColumn;
        PensionGridViewDBColumn4: TcxGridDBColumn;
        PensionGridViewDBColumn5: TcxGridDBColumn;
        PensionGridViewDBColumn6: TcxGridDBColumn;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        PensionSelect: TpFIBDataSet;
        PensionSource: TDataSource;
        InsertUpdate: TpFIBQuery;
        DeleteQ: TpFIBQuery;
        InfinityDate: TpFIBDataSet;
        InfinityDateINFINITY_DATE: TFIBDateTimeField;
        StorProc: TpFIBStoredProc;
        procedure ModifPensionAExecute(Sender: TObject);
        procedure AddPensionAExecute(Sender: TObject);
        procedure DelPensionAExecute(Sender: TObject);
        procedure FrameExit(Sender: TObject);
        procedure FrameEnter(Sender: TObject);
        procedure PensionGridViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
    { Private declarations }
    public
        id_pcard: integer;
        constructor Create(AOwner: TComponent; Id_PC: Integer; modify: integer; DH: Integer); reintroduce;
        procedure DSetCloseOpen;
    end;

implementation

uses cxCalendar;

{$R *.dfm}

constructor TfmPCardPensionPage.Create(AOwner: TComponent; Id_PC: Integer; modify: integer; DH: Integer);
begin
    inherited Create(AOwner);
    DB.Handle := Tisc_db_handle(Dh);
    id_pcard := Id_PC;
    DSetCloseOpen;
    if (modify = 0) then
    begin
        Panel11.Enabled := False;
        ModifPensionA.Enabled := False;
        AddPensionA.Enabled := False;
        DelPensionA.Enabled := False;
    end;
end;

procedure TfmPCardPensionPage.DSetCloseOpen;
begin
    try
        PensionSelect.Close;
        PensionSelect.SQLs.SelectSQL.Text := 'select distinct * from asup_sp_pension_s(:id_pcard)';
        PensionSelect.ParamByName('id_pcard').AsInt64 := id_pcard;
        PensionSelect.Open;
    except on E: Exception
        do begin
            agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
            PensionSelect.Close;
        end;
    end;
end;

procedure TfmPCardPensionPage.ModifPensionAExecute(Sender: TObject);
var
    frm: TAddPension;
    id: Int64;
begin
    frm := TAddPension.Create(Self, DB.Handle);
    if not (VarIsNull(PensionSelect['NOTE'])) then
        frm.PensionNote.Value := PensionSelect['NOTE'];
    frm.PensionDateBeg.Date := PensionSelect['DATE_BEG'];
    if not VarIsNull(PensionSelect['DATE_END']) then
    begin
        if DateToStr(PensionSelect['DATE_END']) = '31.12.9999' then
        begin
            frm.cbInfinityDate.Checked := True;
            frm.cbInfinityDateClick(Sender);
        end
        else frm.PensionDateEnd.Date := PensionSelect['DATE_END'];
    end;
    if not VarIsNull(PensionSelect['DATE_START']) then
        frm.PensionDateStart.Date := PensionSelect['DATE_START'];
    if not VarIsNull(PensionSelect['DATE_WORK_BEG']) then
        frm.PensionDateWork.Date := PensionSelect['DATE_WORK_BEG'];
    if not VarIsNull(PensionSelect['ORDER_NUMB']) then
        frm.PensionOrderNum.Text := PensionSelect['ORDER_NUMB'];
    if not VarIsNull(PensionSelect['DATE_ORDER']) then
        frm.PensionDateOrder.Date := PensionSelect['DATE_ORDER'];
    if not VarIsNull(PensionSelect['DOKUMENT']) then
        frm.PensionDok.text := PensionSelect['DOKUMENT'];
    if not VarIsNull(PensionSelect['DATE_REPORT']) then
        frm.PensionReport.Date := PensionSelect['DATE_REPORT'];
    frm.PensionCat.Value := PensionSelect['ID_PENSION_CAT'];
    frm.PensionCat.DisplayText := PensionSelect['NAME_PENSION_CAT'];
    frm.PensionVid.Value := PensionSelect['ID_PENSION_TYPE'];
    frm.PensionVid.DisplayText := PensionSelect['NAME_PENSION_TYPE'];
    frm.PensionProp.Value := PensionSelect['ID_PENSION_PROP'];
    frm.PensionProp.DisplayText := PensionSelect['NAME_PENSION_PROP'];
    if (frm.ShowModal = mrOk) then
    begin
        Id := PensionSelect['ID_SP_PENSION'];
        StorProc.StoredProcName := 'ASUP_SP_PENSION_UPD';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_PCARD').AsInteger := id_pcard;
        StorProc.ParamByName('ID_PENSION_CAT').AsInteger := frm.PensionCat.Value;
        StorProc.ParamByName('ID_PENSION_TYPE').AsInteger := frm.PensionVid.Value;
        StorProc.ParamByName('NOTE').AsString := frm.PensionNote.Value;
        StorProc.ParamByName('DATE_BEG').AsDate := frm.PensionDateBeg.Date;
        if frm.PensionDateEnd.Text = '' then StorProc.ParamByName('DATE_END').Value := null
        else StorProc.ParamByName('DATE_END').AsDate := frm.PensionDateEnd.Date;
        StorProc.ParamByName('ID_PENSION_PROP').AsInteger := frm.PensionProp.Value;
        if frm.PensionDateStart.Text = '' then StorProc.ParamByName('DATE_START').Value := null
        else StorProc.ParamByName('DATE_START').AsDate := frm.PensionDateStart.Date;
        if frm.PensionDateWork.Text = '' then StorProc.ParamByName('DATE_WORK_BEG').Value := null
        else StorProc.ParamByName('DATE_WORK_BEG').AsDate := frm.PensionDateWork.Date;
        StorProc.ParamByName('ORDER_NUMB').AsString := frm.PensionOrderNum.Text;
        if frm.PensionDateOrder.Text = '' then StorProc.ParamByName('DATE_ORDER').Value := null
        else StorProc.ParamByName('DATE_ORDER').AsDate := frm.PensionDateOrder.Date;
        StorProc.ParamByName('DOKUMENT').AsString := frm.PensionDok.Text;
        if frm.PensionReport.Text = '' then StorProc.ParamByName('DATE_REPORT').Value := null
        else StorProc.ParamByName('DATE_REPORT').AsDate := frm.PensionReport.Date;
        StorProc.ParamByName('ID_SP_PENSION').AsInteger := PensionSelect['ID_SP_PENSION'];
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on E: Exception do
            begin
                agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
        frm.Free;
    end;
    DSetCloseOpen;
    PensionSelect.Locate('ID_SP_PENSION', Id, []);
end;

procedure TfmPCardPensionPage.AddPensionAExecute(Sender: TObject);
var
    frm: TAddPension;

begin
    frm := TAddPension.Create(Self, DB.Handle);
    if (frm.ShowModal = mrOk) then
    begin
        StorProc.StoredProcName := 'ASUP_SP_PENSION_I';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        StorProc.ParamByName('ID_PCARD').AsInteger := id_pcard;
        StorProc.ParamByName('ID_PENSION_CAT').AsInteger := frm.PensionCat.Value;
        StorProc.ParamByName('ID_PENSION_TYPE').AsInteger := frm.PensionVid.Value;
        StorProc.ParamByName('NOTE').AsString := frm.PensionNote.Value;
        StorProc.ParamByName('DATE_BEG').AsDate := frm.PensionDateBeg.Date;
        if frm.PensionDateEnd.Text = '' then StorProc.ParamByName('DATE_END').Value := null
        else StorProc.ParamByName('DATE_END').AsDate := frm.PensionDateEnd.Date;
        StorProc.ParamByName('ID_PENSION_PROP').AsInteger := frm.PensionProp.Value;
        if frm.PensionDateStart.Text = '' then StorProc.ParamByName('DATE_START').Value := null
        else StorProc.ParamByName('DATE_START').AsDate := frm.PensionDateStart.Date;
        if frm.PensionDateWork.Text = '' then StorProc.ParamByName('DATE_WORK_BEG').Value := null
        else StorProc.ParamByName('DATE_WORK_BEG').AsDate := frm.PensionDateWork.Date;
        StorProc.ParamByName('ORDER_NUMB').AsString := frm.PensionOrderNum.Text;
        if frm.PensionDateOrder.Text = '' then StorProc.ParamByName('DATE_ORDER').Value := null
        else StorProc.ParamByName('DATE_ORDER').AsDate := frm.PensionDateOrder.Date;
        StorProc.ParamByName('DOKUMENT').AsString := frm.PensionDok.Text;
        if frm.PensionReport.Text = '' then StorProc.ParamByName('DATE_REPORT').Value := null
        else StorProc.ParamByName('DATE_REPORT').AsDate := frm.PensionReport.Date;
        try
            StorProc.ExecProc;
            StorProc.Transaction.Commit;
        except on E: Exception
            do begin
                agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                StorProc.Transaction.Rollback;
            end;
        end;
        frm.Free;
        DSetCloseOpen;
    end;
end;

procedure TfmPCardPensionPage.DelPensionAExecute(Sender: TObject);
begin
    if PensionSelect.IsEmpty then
    begin
        MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
        Exit;
    end;
    if (agMessageDlg('Увага!', 'Чи ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo]) = mrNo) then Exit;
    try
        DefaultTransaction.StartTransaction;
        DeleteQ.ParamByName('Id_sp_pension').AsInteger := PensionSelect['Id_sp_pension'];
        DeleteQ.ExecProc;
        DefaultTransaction.Commit;
        PensionSelect.Close;
        PensionSelect.Open;
    except on e: Exception do
        begin
            agMessageDlg('Увага!', 'Не вдалося видалити запис: ' + #13 + e.Message, mtError, [mbOk]);
            DefaultTransaction.Rollback;
        end;
    end;
end;

procedure TfmPCardPensionPage.FrameExit(Sender: TObject);
begin
    ReadTransaction.CommitRetaining;
end;

procedure TfmPCardPensionPage.FrameEnter(Sender: TObject);
begin
    { if not DM.ReadTransaction.InTransaction
     then DM.ReadTransaction.StartTransaction;

     if DM.PensionSelect.Active
     then DM.PensionSelect.Close;

     DM.PensionSelect.Open;}
    DSetCloseOpen;
end;

procedure TfmPCardPensionPage.PensionGridViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
  {if (( Key = VK_F12) and (ssShift in Shift)) then
   ShowInfo(DM.PensionSelect); }
end;

end.

