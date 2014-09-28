unit UBonByMovig;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxDBEdit, StdCtrls,
    cxSplitter, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxContainer,
    cxCheckBox, ExtCtrls, cxClasses, FIBDataSet, pFIBDataSet,
    cxLookAndFeelPainters, cxButtons, pFibStoredProc;

type
    TfrmMovingBonuses = class(TForm)
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
        Panel2: TPanel;
        cxCheckBox2: TcxCheckBox;
        ItemsGrid: TcxGrid;
        ReportDataView: TcxGridDBTableView;
        ReportDataViewDBColumn1: TcxGridDBColumn;
        DateBegCol: TcxGridDBColumn;
        DateEndCol: TcxGridDBColumn;
        ReportDataViewDBColumn2: TcxGridDBColumn;
        ReportDataViewDBColumn7: TcxGridDBColumn;
        ReportDataViewDBColumn3: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        cxSplitter1: TcxSplitter;
        Panel1: TPanel;
        Label3: TLabel;
        Label4: TLabel;
        Label1: TLabel;
        cxDBTextEdit1: TcxDBTextEdit;
        cxDBTextEdit2: TcxDBTextEdit;
        cxDBTextEdit3: TcxDBTextEdit;
        Panel3: TPanel;
        cxGrid1: TcxGrid;
        SmView: TcxGridDBTableView;
        SmViewDBColumn2: TcxGridDBColumn;
        cxGridDBColumn1: TcxGridDBColumn;
        SmViewDBColumn1: TcxGridDBColumn;
        cxGridLevel1: TcxGridLevel;
        BonusSelect: TpFIBDataSet;
        SmetsDataSet: TpFIBDataSet;
        SmetsDataSource: TDataSource;
        BonusSource: TDataSource;
        cxButton1: TcxButton;
        cxButton2: TcxButton;
        procedure cxCheckBox2PropertiesChange(Sender: TObject);
        procedure ReportDataViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SmViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxButton1Click(Sender: TObject);
        procedure cxButton2Click(Sender: TObject);
    private
    { Private declarations }
        id_item: Int64;
        ks: Int64;
    public
    { Public declarations }
        constructor Create(AOwner: TComponent; mode: Integer; id_moving: int64; id_order_item: Int64; key_session: Int64); reintroduce;
    end;


implementation

uses UpKernelUnit, UpBonusOrderForm, BaseTypes;

{$R *.dfm}

{ TfrmMovingBonuses }

constructor TfrmMovingBonuses.Create(AOwner: TComponent; mode: Integer; id_moving: int64; id_order_item: Int64; key_session: Int64);
var D, M, Y, Hour, Min, Sec, MSec: Word;
begin
    inherited Create(Aowner);
    DecodeDate(Date, Y, M, D);
    DecodeTime(Time, Hour, Min, Sec, MSec);
    self.Name := self.Name + IntToStr(Y) + IntToStr(M) + IntToStr(D) + IntToStr(Hour) + IntToStr(Min) + IntToStr(Sec);

    SmetsDataSet.Database := TfmBonusOrder(Owner).WorkDatabase;
    BonusSelect.Database := TfmBonusOrder(Owner).WorkDatabase;
    SmetsDataSet.Transaction := TfmBonusOrder(Owner).ReadTransaction;
    BonusSelect.Transaction := TfmBonusOrder(Owner).ReadTransaction;

    SmetsDataSet.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_BONUS_SMET_INFO(?ID_MAN_BONUS)';

    if mode = 1
        then BonusSelect.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_BONUS_INFO_BY_MOVING(' + IntToStr(id_moving) + ')'
    else begin
        BonusSelect.SelectSQL.Text := 'SELECT * FROM UP_KER_GET_ABSORBE_BONUS_INFO(' + IntToStr(id_order_item) + ',' + IntToStr(key_session) + ')';
        cxButton2.Visible := True;
        id_item := id_order_item;
        ks := key_session;
    end;

    BonusSelect.Open;

    ReportDataView.ViewData.Expand(true);
end;

procedure TfrmMovingBonuses.cxCheckBox2PropertiesChange(Sender: TObject);
begin
    Panel3.Visible := cxCheckBox2.Checked;
    cxSplitter1.Visible := cxCheckBox2.Checked;

    if cxCheckBox2.Checked
        then begin
        cxSplitter1.Top := Panel3.Top - 1;
    end;
end;

procedure TfrmMovingBonuses.ReportDataViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then begin
        ShowInfo(BonusSelect);
    end;

end;

procedure TfrmMovingBonuses.SmViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift))
        then begin
        ShowInfo(SmetsDataSet);
    end;

end;

procedure TfrmMovingBonuses.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfrmMovingBonuses.cxButton2Click(Sender: TObject);
var DelSp: TpFibStoredProc;
begin
    if (BonusSelect.RecordCount > 0)
        then begin
        if agMessageDlg('Увага!', 'Ви хочете вилучити інструкцію по зняттю надбавки/доплати?', mtConfirmation, [mbYes, mbNo]) = mrYes
            then begin
            DelSp := TpFibStoredProc.Create(self);
            DelSp.Database := TfmBonusOrder(Owner).WorkDatabase;
            DelSp.Transaction := TfmBonusOrder(Owner).WriteTransaction;
            TfmBonusOrder(Owner).WriteTransaction.StartTransaction;
            DelSp.StoredProcName := 'UP_DT_BONUS_REMOVE_BUFF_DEL_EX';
            DelSp.Prepare;
            DelSp.ParamByName('KEY_SESSION').asInt64 := self.ks;
            DelSp.ParamByName('ID_ORDER_ITEM').AsInt64 := StrToInt64(BonusSelect.FieldByName('id_item').asString);
            DelSp.ExecProc;
            DelSp.Close;
            DelSp.Free;
            TfmBonusOrder(Owner).WriteTransaction.Commit;
            BonusSelect.CloseOpen(true);
        end;
    end;
end;

end.
