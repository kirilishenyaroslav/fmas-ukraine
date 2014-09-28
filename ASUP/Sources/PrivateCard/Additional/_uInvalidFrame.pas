unit _uInvalidFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
    cxGridDBTableView, cxGrid, _uInvalidDataModule, Buttons, ExtCtrls,
    ActnList, cxTextEdit, FIBDataSet, pFIBDataSet;

type
    T_fmPCardInvalidPage = class(TFrame)
        InvalidGrid: TcxGrid;
        InvalidView: TcxGridDBTableView;
        InvalidGridLevel1: TcxGridLevel;
        StyleRepository: TcxStyleRepository;
        InvalidViewNAME_invalid: TcxGridDBColumn;
        InvalidViewDATE_BEG: TcxGridDBColumn;
        InvalidViewDATE_END: TcxGridDBColumn;
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
    InvSet: TpFIBDataSet;
    InvalidViewDBColumn1: TcxGridDBColumn;
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
        DM: T_dmInvalid;
        id_pcard: integer;
        constructor Create(AOwner: TComponent; DMod: T_dmInvalid; Id_PC: Integer; modify: integer); reintroduce;
    end;

implementation

uses _uInvalidAdd, BaseTypes, _uInvalidHistory;
{$R *.dfm}

constructor T_fmPCardInvalidPage.Create(AOwner: TComponent; DMod: T_dmInvalid; Id_PC: Integer; modify: integer);
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

procedure T_fmPCardInvalidPage.AddInvalidAExecute(Sender: TObject);
var AForm: T_AddInvalidForm;
begin
    AForm := T_AddInvalidForm.Create(Self);
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

procedure T_fmPCardInvalidPage.ModifInvalidAExecute(Sender: TObject);
var AForm: T_AddInvalidForm;
begin
    if DM.InvalidSelect.IsEmpty then Exit;
    AForm := T_AddInvalidForm.Create(Self);
    AForm.Add := False;
    AForm.id_pcard := id_pcard;
    AForm.DM := DM;
    AForm.date_beg := DM.InvalidSelect['date_beg'];
    AForm.date_end := DM.InvalidSelect['date_end'];
    AForm.DT_DateBeg.Date :=  DM.InvalidSelect['date_beg'];
    AForm.DT_DateEnd.Date :=  DM.InvalidSelect['date_end'];
    InvSet.Close;
    InvSet.SQLs.SelectSQL.Text:='select * from ASUP_GET_PCARD_ADD_PROPS('+IntTostr(Id_PCard)+') where id_rec='+VarToStr(DM.InvalidSelect['id_rec']);
    InvSet.Open;
    AForm.SprEdit.Text:=InvSet['prop_neme'];
    AForm.id_inv := DM.InvalidSelect['id_prop'];
    AForm.id_group_1:=DM.InvalidSelect['id_prop'];
    AForm.SpCB_Inv.Prepare(DM.InvalidSelect['id_prop'], DM.InvalidSelect['prop_neme']);
    AForm.ShowModal;
    if AForm.ModalResult = mrOk then
    begin
        DM.InvalidSelect.Close;
        DM.InvalidSelect.Open;
    end;
    AForm.Free;
    InvalidView.ViewData.Expand(true);
end;

procedure T_fmPCardInvalidPage.DelInvalidAExecute(Sender: TObject);
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
        //StartHistory(DefaultTransaction);
        DeleteQuery.ParamByName('id_rec').AsInteger := InvalidSelect['id_rec'];
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

procedure T_fmPCardInvalidPage.InvalidViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift)) then
        ShowInfo(InvalidView.DataController.DataSource.DataSet);
end;

procedure T_fmPCardInvalidPage.FrameEnter(Sender: TObject);
begin
    if not DM.ReadTransaction.InTransaction
        then DM.ReadTransaction.StartTransaction;

    if DM.InvalidSelect.Active
        then DM.InvalidSelect.Close;

    DM.InvalidSelect.Open;
end;

procedure T_fmPCardInvalidPage.FrameExit(Sender: TObject);
begin
    DM.ReadTransaction.CommitRetaining;
end;

procedure T_fmPCardInvalidPage.SpeedButton1Click(Sender: TObject);
var frm:T_frmInvalidHistory;
begin
    if dm.InvalidSelect.IsEmpty then
    begin
        showmessage('Немає записів в "Історії змін"');
        exit;
    end
    else
    begin
        frm:=T_frmInvalidHistory.Create(Self);
        frm.InvalidHistSet.Close;
        frm.InvalidHistSet.SQLs.SelectSQL.Text:='Select * From ASUP_DT_MAN_INVALID_HST Where Id_Man=:Id_Man';
        frm.InvalidHistSet.ParamByName('ID_MAN').AsInteger:=dm.InvalidSelect['ID_MAN'];
        frm.InvalidHistSet.Open;
        frm.ShowModal;
        frm.Free;
    end;
end;

end.

