unit UP_HP_HIST;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
    cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
    cxGridDBTableView, cxGrid, Buttons, ActnList, FIBDataSet, pFIBDataSet;

type
    TfrmHistHol = class(TForm)
        Panel1: TPanel;
        Panel2: TPanel;
        GridHistHolidays: TcxGrid;
        GridHistHolidaysView: TcxGridDBTableView;
        GridHistHolidaysLevel1: TcxGridLevel;
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
        GridHistHolidaysViewDBColumn1: TcxGridDBColumn;
        GridHistHolidaysViewDBColumn2: TcxGridDBColumn;
        GridHistHolidaysViewDBColumn3: TcxGridDBColumn;
        GridHistHolidaysViewDBColumn4: TcxGridDBColumn;
        GridHistHolidaysViewDBColumn5: TcxGridDBColumn;
        GridHistHolidaysViewDBColumn6: TcxGridDBColumn;
        GridHistHolidaysViewDBColumn7: TcxGridDBColumn;
        GridHistHolidaysViewDBColumn8: TcxGridDBColumn;
        SpeedButton1: TSpeedButton;
        ActionList1: TActionList;
        CloseForm: TAction;
        HistSet: TpFIBDataSet;
        HistSource: TDataSource;
        procedure SpeedButton1Click(Sender: TObject);
        procedure CloseFormExecute(Sender: TObject);
    private
        { Private declarations }
    public
        { Public declarations }
        constructor Create(AOwner: TComponent; IdManHol: Integer);
    end;

var
    frmHistHol: TfrmHistHol;

implementation

uses UP_HP_DM;

{$R *.dfm}

constructor TfrmHistHol.Create(AOwner: TComponent; IdManHol: Integer);
begin
    inherited Create(AOwner);
    HistSet.Close;
    HistSet.SQLs.SelectSQL.Text := 'select * from hl_dt_man_holiday_plan_hst_sel(:id_man_holiday_plan)';
    HistSet.ParamByName('id_man_holiday_plan').AsInteger := IdManHol;
    HistSet.Open;
end;

procedure TfrmHistHol.SpeedButton1Click(Sender: TObject);
begin
    Close
end;

procedure TfrmHistHol.CloseFormExecute(Sender: TObject);
begin
    close;
end;

end.
