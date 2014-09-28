unit SpPrintDataUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FR_PTabl, DB, DBGrids;

type
  TPrintQueryForm = class(TForm)
    OkButton: TBitBtn;
    BitBtn2: TBitBtn;
    frPrintTable1: TfrPrintTable;
    QueryRadio: TRadioButton;
    GridRadio: TRadioButton;
    frPrintGrid1: TfrPrintGrid;
    procedure BitBtn2Click(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    pDataSet: TDataSet;
    pGrid: TDBGrid;
  end;

var
  PrintQueryForm: TPrintQueryForm;

implementation

{$R *.dfm}

procedure TPrintQueryForm.BitBtn2Click(Sender: TObject);
begin
    Close;
end;

procedure TPrintQueryForm.OkButtonClick(Sender: TObject);
begin
    if QueryRadio.Checked then
    with frPrintTable1 do
    begin
        DataSet := pDataSet;
        ShowReport;
    end;

    if GridRadio.Checked then
    with frPrintGrid1 do
    begin
        DBGrid := pGrid;
        ShowReport;
    end;
end;

end.
