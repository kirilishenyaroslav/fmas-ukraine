unit uShtatFunds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, Buttons, ExtCtrls, ActnList,
  uActionControl, uShtatDocData, uSearchFrame;

type
  TfmShtatSRFund = class(TForm)
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
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
    SRFundsView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ActionList1: TActionList;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ActionControl: TqFActionControl;
    SRFundsViewID_SR_HOURS_PAY: TcxGridDBColumn;
    SRFundsViewID_SR_FUND_TYPE: TcxGridDBColumn;
    SRFundsViewID_SMETA: TcxGridDBColumn;
    SRFundsViewPERCENT: TcxGridDBColumn;
    SRFundsViewSUMMA: TcxGridDBColumn;
    SRFundsViewNAME_FUND_TYPE: TcxGridDBColumn;
    SRFundsViewNAME_SMETA: TcxGridDBColumn;
    procedure ExitActionExecute(Sender: TObject);
    procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
  private
    DM: TdmShtatDoc;
  public
    constructor Create(AOwner: TComponent; DM: TdmShtatDoc); reintroduce;
  end;

var
  fmShtatSRFund: TfmShtatSRFund;

implementation

{$R *.dfm}

uses uShtatDocPlanFundAdd;

constructor TfmShtatSRFund.Create(AOwner: TComponent; DM: TdmShtatDoc);
begin
    inherited Create(AOwner);
    Self.DM := DM;

    DM.FundsSelect.Close;
    DM.FundsSelect.ParamByName('Id_SR').AsInteger := DM.ShtatDocSelect['Id_SR'];
    DM.FundsSelect.Open;

    SRFundsView.DataController.DataSource := DM.FundsSource;

    ActionControl.Database := DM.DB;
    ActionControl.SelectDataSet := DM.FundsSelect;
    ActionControl.AddKeys := IntToStr(DM.ShtatDocSelect['Id_SR']);
end;

procedure TfmShtatSRFund.ExitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatSRFund.ActionControlBeforePrepare(Sender: TObject;
  Form: TForm);
begin
    if Form is TfmShtatDocPlanFundAdd then
    begin
        (Form as TfmShtatDocPlanFundAdd).DM := DM;
         DM.DSConsts.CloseOpen(false);
        (Form as TfmShtatDocPlanFundAdd).Summa.NegativeAllowed := (DM.DSConsts['USE_NEGATIVE_SHTAT_PLAN'] = 1);
    end;
end;

end.
