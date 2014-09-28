unit uStajBonusOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridTableView, StdCtrls,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Buttons, uActionControl,
  uSearchFrame, qFTools, frexpimg, frOLEExl,
  FR_Class, frRtfExp, frxClass, frxDBSet, FIBDataSet, pFIBDataSet,
  Placemnt, cxCalc, cxMaskEdit, pFibStoredProc, cxContainer, cxCheckBox,
  cxTextEdit;

type
  TfmMassStajOrder = class(TForm)
    ItemsGrid: TcxGrid;
    ReportDataView: TcxGridDBTableView;
    ReportDataViewDBColumn1: TcxGridDBColumn;
    ReportDataViewDBColumn2: TcxGridDBColumn;
    ReportDataViewDBColumn5: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
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
    KeyList: TActionList;
    CloseAction: TAction;
    Panel3: TPanel;
    CancelButton: TSpeedButton;
    ReportDataViewDBColumn6: TcxGridDBColumn;
    RecalcButton: TSpeedButton;
    ReportDataViewDBColumn8: TcxGridDBColumn;
    ReportDataViewDBColumn9: TcxGridDBColumn;
    PrintFooterQuery: TpFIBDataSet;
    PrintFooterDataSet: TfrxDBDataset;
    PrintDataSet: TfrxDBDataset;
    frRtfAdvExport1: TfrRtfAdvExport;
    frOLEExcelExport1: TfrOLEExcelExport;
    frBMPExport1: TfrBMPExport;
    frJPEGExport1: TfrJPEGExport;
    SpeedButton2: TSpeedButton;
    PrintAction: TAction;
    RecalcAction: TAction;
    FormStorage1: TFormStorage;
    AdminMode: TAction;
    ShowValues: TAction;
    EditAction: TAction;
    ReportDataDataSource: TDataSource;
    Panel1: TPanel;
    GetOrderGroup: TpFIBDataSet;
    pFIBDataSet1: TpFIBDataSet;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    Report: TfrxReport;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure RecalcButtonClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure AdminModeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    Editmode:Boolean;
    Printed:Boolean;
    { Public declarations }
  end;


implementation

uses dmStajBonusOrder;

{$R *.dfm}

procedure TfmMassStajOrder.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmMassStajOrder.FormResize(Sender: TObject);
begin
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TfmMassStajOrder.CloseActionExecute(Sender: TObject);
begin
    Close;
end;


procedure TfmMassStajOrder.RecalcButtonClick(Sender: TObject);
var FormOrderSP:TpFibStoredProc;
begin
     Panel1.Visible:=true;
     Application.ProcessMessages;

     //Формируем приказ
     FormOrderSP:=TpFibStoredProc.Create(nil);
     FormOrderSP.Database:=dmstaj.LocalDatabase;
     FormOrderSP.Transaction:=DMstaj.LocalWriteTransaction;
     DMstaj.LocalWriteTransaction.StartTransaction;
     FormOrderSP.StoredProcName:='ASUP_STAJ_BONUS_FORM_ORDER';
     FormOrderSP.Prepare;
     FormOrderSP.ParamByName('ID_ORDER').Value        :=dmstaj.IdOrder;
     FormOrderSP.ParamByName('ACTUAL_DATE').Value     :=dmstaj.DateOrder;
     FormOrderSP.ParamByName('STAJ_RECALC_NEED').Value:=Integer(cxCheckBox3.Checked);
     FormOrderSP.ParamByName('NUM_ITEM').Value        :=dmstaj.Num_item;
     FormOrderSP.ExecProc;
     DMstaj.LocalWriteTransaction.Commit;
     FormOrderSP.Close;
     FormOrderSP.Free;

     ReportDataView.BeginUpdate;
     dmstaj.ReportDataDataSet.CloseOpen(true);
     ReportDataView.ViewData.Expand(true);
     ReportDataView.EndUpdate;

     Panel1.Visible:=false;
     Application.ProcessMessages;

     RecalcButton.Enabled:=false;
end;

procedure TfmMassStajOrder.SpeedButton2Click(Sender: TObject);
begin
      if (dmstaj.ReportDataDataSet.RecordCount>0)
      then begin
                ReportDataView.BeginUpdate;
                Printed:=True;

                GetOrderGroup.Close;
                GetOrderGroup.ParamByName('ID_ORDER').AsInteger := DmStaj.IdOrder;
                GetOrderGroup.Open;

                PrintFooterQuery.Close;
                PrintFooterQuery.ParamByName('ID_ORDER_GROUP').AsInteger := GetOrderGroup['ID_ORDER_GROUP'];
                PrintFooterQuery.Open;

                Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\Asup_Staj_Bonus_Order.fr3');

                if Editmode
                then begin
                          ReportDataView.EndUpdate;
                          Report.DesignReport
                end
                else begin
                          Report.PrepareReport(True);
                          ReportDataView.EndUpdate;
                          Report.ShowPreparedReport;
                end;

                Printed:=False;
     end
     else ShowMessage('Не можна друркувани пустий наказ!');
end;

procedure TfmMassStajOrder.AdminModeExecute(Sender: TObject);
begin
     EditMode:=not EditMode;
end;

procedure TfmMassStajOrder.FormCreate(Sender: TObject);
begin
     EditMode:=false; 
end;

procedure TfmMassStajOrder.cxCheckBox1PropertiesChange(Sender: TObject);
var i:Integer;
begin
     for i:=0 to ReportDataView.ColumnCount-1 do ReportDataView.Columns[i].Options.Filtering:=cxCheckBox1.Checked;
end;

procedure TfmMassStajOrder.cxCheckBox2PropertiesChange(Sender: TObject);
begin
     ReportDataView.OptionsView.GroupByBox:=cxCheckBox2.Checked;
end;

end.
