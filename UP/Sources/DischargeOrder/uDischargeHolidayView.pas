unit uDischargeHolidayView;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, DB, FIBDataSet, pFIBDataSet, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, StdCtrls, Buttons,
    ExtCtrls, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    cxCheckBox, cxImage, cxCurrencyEdit, cxTextEdit;

type
    TfrmHolidayView = class(TForm)
        DataSet: TpFIBDataSet;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        Panel1: TPanel;
        btnCancel: TBitBtn;
        DataSource1: TDataSource;
        cxGrid1DBTableView1HOLIDAY_BEG: TcxGridDBColumn;
        cxGrid1DBTableView1HOLIDAY_END: TcxGridDBColumn;
        cxGrid1DBTableView1IS_POST_MAIN: TcxGridDBColumn;
        cxGrid1DBTableView1TYPE_NAME: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_POST: TcxGridDBColumn;
        procedure btnCancelClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmHolidayView: TfrmHolidayView;

implementation
uses udischarge;
{$R *.dfm}

procedure TfrmHolidayView.btnCancelClick(Sender: TObject);
begin
    Close;
end;

end.
