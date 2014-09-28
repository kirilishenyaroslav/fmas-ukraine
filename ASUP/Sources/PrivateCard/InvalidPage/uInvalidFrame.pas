unit uInvalidFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
    cxGridDBTableView, cxGrid, uInvalidDataModule, Buttons, ExtCtrls,UpKernelUnit,
    ActnList, cxTextEdit, FIBDataSet, pFIBDataSet;

type
    TfmPCardInvalidPage = class(TFrame)
        InvalidGrid: TcxGrid;
        InvalidView: TcxGridDBTableView;
        InvalidGridLevel1: TcxGridLevel;
        StyleRepository: TcxStyleRepository;
        InvalidViewNAME_invalid: TcxGridDBColumn;
        InvalidViewDATE_BEG: TcxGridDBColumn;
        InvalidViewDATE_END: TcxGridDBColumn;
        InvalidViewID_INVALID: TcxGridDBColumn;
        Panel11: TPanel;
        SB_AddInvalid: TSpeedButton;
        SB_DelInvalid: TSpeedButton;
        SB_ModifInvalid: TSpeedButton;
        ALInvalid: TActionList;
        AddInvalidA: TAction;
        ModifInvalidA: TAction;
        DelInvalidA: TAction;
        ShowInformation: TAction;
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
    SpHistInvalid: TSpeedButton;
    InvalidViewDBColumn1: TcxGridDBColumn;
    InvalidViewDBColumn2: TcxGridDBColumn;
    InvSet: TpFIBDataSet;
        procedure AddInvalidAExecute(Sender: TObject);
        procedure ModifInvalidAExecute(Sender: TObject);
        procedure DelInvalidAExecute(Sender: TObject);
        procedure InvalidViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FrameEnter(Sender: TObject);
        procedure FrameExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    private
    { Private declarations }
    public
        DM: TdmInvalid;
        id_pcard: integer;
        constructor Create(AOwner: TComponent; DMod: TdmInvalid; Id_PC: Integer; modify: integer); reintroduce;
    end;

implementation

uses uInvalidAdd, BaseTypes,uInvalidHistory;
{$R *.dfm}

constructor TfmPCardInvalidPage.Create(AOwner: TComponent; DMod: TdmInvalid; Id_PC: Integer; modify: integer);
begin
    inherited Create(AOwner);
    DM := Dmod; id_pcard := Id_PC;
    DM.InvalidSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.InvalidSelect.Open;
    InvalidView.DataController.DataSource := DM.InvalidSource;
    InvalidView.ViewData.Expand(true);

    if (modify = 0) then
    begin
        AddInvalidA.Enabled := False;
        DelInvalidA.Enabled := False;
        ModifInvalidA.Enabled := False;
    end;
end;

procedure TfmPCardInvalidPage.AddInvalidAExecute(Sender: TObject);
var AForm: TAddInvalidForm;
begin
    AForm := TAddInvalidForm.Create(Self);
    AForm.Add := True;
    AForm.id_pcard := id_pcard;
    AForm.DM := DM;
    AForm.DT_DateBeg.Date :=  Date();
    AForm.DT_DateEnd.Date :=  Date()+365;
    AForm.ShowModal;
    if AForm.ModalResult = mrOk then
    begin
        DM.InvalidSelect.Close;
        DM.InvalidSelect.Open;
    end;
    AForm.Free;
    InvalidView.ViewData.Expand(true);
end;

procedure TfmPCardInvalidPage.ModifInvalidAExecute(Sender: TObject);
var AForm: TAddInvalidForm;
begin

    if DM.InvalidSelect.IsEmpty then Exit;
    AForm := TAddInvalidForm.Create(Self);
    AForm.Add := False;
    AForm.id_pcard := id_pcard;
    AForm.DM := DM;
    AForm.date_beg := DM.InvalidSelect['date_beg'];
    AForm.date_end := DM.InvalidSelect['date_end'];
    AForm.DT_DateBeg.Date :=  DM.InvalidSelect['date_beg'];
    AForm.DT_DateEnd.Date :=  DM.InvalidSelect['date_end'];
    InvSet.Close;
    InvSet.SQLs.SelectSQL.Text:='select name_invalid from asup_sp_invalid where id_invalid=:id_inv';
    InvSet.ParamByName('id_inv').AsInteger:=DM.InvalidSelect['id_invalid'];
    InvSet.Open;
    AForm.SprEdit.Text:=InvSet['name_invalid'];
    if varIsNull(DM.InvalidSelect['REASON_INV']) then AForm.ReasonInv.Text:=''
    else AForm.ReasonInv.Text:=DM.InvalidSelect['REASON_INV'];
    If VarIsNull(DM.InvalidSelect['NOM_INV']) then AForm.NomInv.Text:=''
    else AForm.NomInv.Text:=DM.InvalidSelect['NOM_INV'];
    AForm.id_inv := DM.InvalidSelect['id_invalid'];
    AForm.id_group_1:=DM.InvalidSelect['id_invalid'];
    AForm.SpCB_Inv.Prepare(DM.InvalidSelect['id_invalid'], DM.InvalidSelect['name_invalid']);
    AForm.ShowModal;
    if AForm.ModalResult = mrOk then
    begin
        DM.InvalidSelect.Close;
        DM.InvalidSelect.Open;
    end;
    AForm.Free;
    InvalidView.ViewData.Expand(true);
end;

procedure TfmPCardInvalidPage.DelInvalidAExecute(Sender: TObject);
begin
    if DM.InvalidSelect.IsEmpty then
    begin
        //MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
        agMessageDlg('Увага!', 'Не можливо видалити запис бо довідник пустий', mtError, [mbYes]);
        Exit;
    end;
    if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
    with DM do
    try
        DeleteQuery.Transaction.StartTransaction;
        StartHistory(DefaultTransaction);
        DeleteQuery.ParamByName('id_pcard').AsInteger := id_pcard;
        DeleteQuery.ParamByName('id_invalid').AsInteger := InvalidSelect['id_invalid'];
        DeleteQuery.ParamByName('date_beg').AsDate := InvalidSelect['date_beg'];
        DeleteQuery.ParamByName('date_end').AsDate := InvalidSelect['date_end'];
        DeleteQuery.ExecProc;
        DefaultTransaction.Commit;
    except on e: Exception do
        begin
            //MessageDlg('Не вдалося видалити запис: ' + #13 + e.Message, mtError, [mbYes], 0);
            agMessageDlg('Увага!', 'Не вдалося видалити запис: ' + #13 + e.Message, mtError, [mbYes]);
            DefaultTransaction.RollBack;
        end;
    end;
    DM.InvalidSelect.Close;
    DM.InvalidSelect.Open;
    InvalidView.ViewData.Expand(true);
end;

procedure TfmPCardInvalidPage.InvalidViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift)) then
        ShowInfo(InvalidView.DataController.DataSource.DataSet);
end;

procedure TfmPCardInvalidPage.FrameEnter(Sender: TObject);
begin
    if not DM.ReadTransaction.InTransaction
        then DM.ReadTransaction.StartTransaction;

    if DM.InvalidSelect.Active
        then DM.InvalidSelect.Close;

    DM.InvalidSelect.Open;
end;

procedure TfmPCardInvalidPage.FrameExit(Sender: TObject);
begin
    DM.ReadTransaction.CommitRetaining;
end;

procedure TfmPCardInvalidPage.SpeedButton1Click(Sender: TObject);
var frm:TfrmInvalidHistory;
    i_m:Integer;
begin
    InvSet.Close;
    InvSet.SQLs.SelectSQL.Text:='select distinct h.id_man from asup_dt_man_invalid_hst h, private_cards pc where pc.id_man=h.id_man and pc.id_pcard=:pc';
    InvSet.ParamByName('pc').AsInteger:=id_pcard;
    //showmessage(inttostr(id_pcard));
    InvSet.Open;
    if InvSet.IsEmpty then
    begin
        showmessage('Немає записів в "Історії змін"');
        exit;
    end
    else
    begin
        i_m:=InvSet['id_man'];
        //showmessage(inttostr(i_m));
        frm:=TfrmInvalidHistory.Create(Self);
        frm.InvalidHistSet.Close;
        frm.InvalidHistSet.SQLs.SelectSQL.Text:='Select * From ASUP_DT_MAN_INVALID_HST Where Id_Man=:Id_Man';
        frm.InvalidHistSet.ParamByName('ID_MAN').AsInteger:=i_m{dm.InvalidSelect['ID_MAN']};
        frm.InvalidHistSet.Open;
        frm.ShowModal;
        frm.Free;
    end;
end;

end.

