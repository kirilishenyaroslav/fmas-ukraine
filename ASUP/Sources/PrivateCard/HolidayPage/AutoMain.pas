unit AutoMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, Holiday_Form, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, HolidayDM, qFTools,

  uCommonSp,   ActnList, uHolidayAdd, uFormControl, cxTimeEdit,uDateControl,
  uCharControl, uIntControl, uFControl,uLabeledFControl, uSpravControl, StdCtrls,
  FIBDataSet, pFIBDataSet, uSelectForm, frxClass, frxDBSet;

type
  TForm1 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    SourceAutoPlan: TDataSource;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    ActionList1: TActionList;
    RefreshAutoPlan: TAction;
    AddAutoPlan: TAction;
    DelAutoPlan: TAction;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    PrintGraphHoliday: TfrxDBDataset;
    PrintGraph: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    Report: TfrxReport;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshAutoPlanExecute(Sender: TObject);
    procedure AddAutoPlanExecute(Sender: TObject);
    procedure DelAutoPlanExecute(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
  DM.SelectAutoPlan.Close;
  DM.SelectAutoPlan.Open;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TForm1.RefreshAutoPlanExecute(Sender: TObject);
begin
  Dm.SelectAutoPlan.Close;
  Dm.SelectAutoPlan.Open;
end;

procedure TForm1.AddAutoPlanExecute(Sender: TObject);
  var
    HolidayAuto: THolidayAuto;
begin
    HolidayAuto:=THolidayAuto.Create(Self, fmAdd,null,null);
    //HolidayAuto.ShowModal;
end;

procedure TForm1.DelAutoPlanExecute(Sender: TObject);
begin
 with DM do
  begin
    If SelectAutoPlan.IsEmpty then
     begin
       MessageDlg('Не можливо видалити пустий запис!',mtError,[mbYes],0);
       Exit;
     end;
    if (MessageDlg('Чи ви справді бажаєте вилучити цей запис?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
    try
      DefaultTransaction.StartTransaction;
      DelAutoPlan.ParamByName('Id_plan_auto').AsInteger:=SelectAutoPlan['Id_plan_auto'];
      DelAutoPlan.ExecProc;
      DefaultTransaction.Commit;
      SelectAutoPlan.Close;
      SelectAutoPlan.Open;
    except on e: Exception do
     begin
       MessageDlg('Не вдалося видалити запис: '+#13+e.Message,mtError,[mbYes],0);
       DefaultTransaction.Rollback;
     end;
    end;
  end;
end;

procedure TForm1.PrintButtonClick(Sender: TObject);
begin
    PrintGraph.Close;
    PrintGraph.ParamByName('id_plan_auto').AsInteger:=Dm.SelectAutoPlan['id_plan_auto'];
    PrintGraph.Open;
    Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\Asup_Man_Holiday_Plan_Graph.fr3');
    Report.PrepareReport(True);
    Report.ShowPreparedReport;
   // Report.DesignReport;
end;

end.
