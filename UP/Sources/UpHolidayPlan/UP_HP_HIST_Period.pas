unit UP_HP_HIST_Period;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
    cxGridDBTableView, cxGrid, Buttons, ActnList, FIBDataSet, pFIBDataSet;

type
    TfrmHistPeriods = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        GridHistPeriods: TcxGrid;
        GridHistPeriodsView: TcxGridDBTableView;
        GridHistPeriodsLevel1: TcxGridLevel;
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
        cxStyle16: TcxStyle;
        cxStyle17: TcxStyle;
        cxStyle18: TcxStyle;
        cxStyle19: TcxStyle;
        cxStyle20: TcxStyle;
        cxStyle21: TcxStyle;
        cxStyle22: TcxStyle;
        cxStyle23: TcxStyle;
        cxStyle24: TcxStyle;
        cxStyle25: TcxStyle;
        cxStyle26: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        GridHistPeriodsViewDBColumn1: TcxGridDBColumn;
        GridHistPeriodsViewDBColumn2: TcxGridDBColumn;
        GridHistPeriodsViewDBColumn3: TcxGridDBColumn;
        GridHistPeriodsViewDBColumn4: TcxGridDBColumn;
        GridHistPeriodsViewDBColumn5: TcxGridDBColumn;
        SpeedButton1: TSpeedButton;
        ActionList1: TActionList;
        CloseForm: TAction;
        HistPeriodsSet: TpFIBDataSet;
        HistPeriodSource: TDataSource;
        procedure SpeedButton1Click(Sender: TObject);
        procedure CloseFormExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        constructor Create(Aowner: TComponent; IdHolPeriod: Integer);
    end;

var
    frmHistPeriods: TfrmHistPeriods;

implementation

uses UP_HP_DM;

{$R *.dfm}

constructor TfrmHistPeriods.Create(Aowner: TComponent; IdHolPeriod: Integer);
begin
    inherited Create(Aowner);
    HistPeriodsSet.Close;
    HistPeriodsSet.SQLs.SelectSQL.Text := 'select * from HL_DT_MAN_PLAN_PERIOD_HST_SEL(:ID_HOLIDAY_PERIOD)';
    HistPeriodsSet.ParamByName('ID_HOLIDAY_PERIOD').AsInteger := IdHolPeriod;
    HistPeriodsSet.Open;
end;

procedure TfrmHistPeriods.SpeedButton1Click(Sender: TObject);
begin
    Close
end;

procedure TfrmHistPeriods.CloseFormExecute(Sender: TObject);
begin
    close;
end;

end.
