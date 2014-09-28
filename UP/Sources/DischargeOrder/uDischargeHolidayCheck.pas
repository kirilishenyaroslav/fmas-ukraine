unit uDischargeHolidayCheck;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
    cxControls, cxGridCustomView, cxGrid, StdCtrls, Buttons, ExtCtrls,
    FIBDataSet, pFIBDataSet;

type
    TfrmHolidayCheck = class(TForm)
        DataSet: TpFIBDataSet;
        DataSource1: TDataSource;
        Panel1: TPanel;
        btnCancel: TBitBtn;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1DBTableView1HOLIDAY_BEG: TcxGridDBColumn;
        cxGrid1DBTableView1HOLIDAY_END: TcxGridDBColumn;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
        Panel2: TPanel;
        procedure btnCancelClick(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    frmHolidayCheck: TfrmHolidayCheck;

implementation

{$R *.dfm}

procedure TfrmHolidayCheck.btnCancelClick(Sender: TObject);
begin
    Close;
end;

end.

