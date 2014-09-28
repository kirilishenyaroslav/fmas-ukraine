unit BonusForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dmBonus, StdCtrls, ComCtrls,
  ExtCtrls, Buttons, frxClass, frxDBSet, FIBDataSet, pFIBDataSet;

type
  TForm1 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    DataSet_Bonus: TDataSource;
    ActionList1: TActionList;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    Panel1: TPanel;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    CancelButton: TBitBtn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    SpeedButton2: TSpeedButton;
    CloseAction: TAction;
    PrintAction: TAction;
    CheckAction: TAction;
    frxDBDataset1: TfrxDBDataset;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    DataSource1: TDataSource;
    Report: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure CheckActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bonus_Form: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  DataModule2.FIBDataSet.Close;
  DataModule2.FIBDataSet.Open;
end;

procedure TForm1.CloseActionExecute(Sender: TObject);
begin
  close;
end;

procedure TForm1.CheckActionExecute(Sender: TObject);
begin
  DataModule2.FIBDataSet.Close;
  DataModule2.FIBDataSet.ParamByName('DATA').AsDate := DateTimePicker1.Date;
  DataModule2.FIBDataSet.Open;
  DataModule2.FIBDataSet.First;
end;

procedure TForm1.PrintActionExecute(Sender: TObject);
begin
    DataModule2.FIBDataSet.Close;
    DataModule2.FIBDataSet.ParamByName('data').AsDate:=DateTimePicker1.Date;
    DataModule2.FIBDataSet.Open;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\BonusReport.fr3');
    Report.PrepareReport(True);
//    Report.DesignReport;
    Report.ShowPreparedReport;
end;

end.
