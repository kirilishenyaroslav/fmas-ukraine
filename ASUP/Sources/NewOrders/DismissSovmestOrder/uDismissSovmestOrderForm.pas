unit uDismissSovmestOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridTableView, StdCtrls,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Buttons, uActionControl,
  dmDismissSovmestOrder, uSearchFrame, qFTools, frexpimg, frOLEExl,
  FR_Class, frRtfExp, frxClass, frxDBSet, FIBDataSet, pFIBDataSet,
  Placemnt, cxCalc, cxMaskEdit;

type
  TfmMassDismissOrder = class(TForm)
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
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
    fmSearch: TfmSearch;
    cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    RecalcButton: TSpeedButton;
    cxGridDBTableView5DBColumn8: TcxGridDBColumn;
    cxGridDBTableView5DBColumn9: TcxGridDBColumn;
    PrintFooterQuery: TpFIBDataSet;
    GetOrderGroup: TpFIBDataSet;
    PrintFooterDataSet: TfrxDBDataset;
    PrintDataSet: TfrxDBDataset;
    Report: TfrxReport;
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
    SpeedButton1: TSpeedButton;
    EditAction: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure RecalcButtonClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure cxGridDBTableView5DBColumn9PropertiesChange(Sender: TObject);
    procedure AdminModeExecute(Sender: TObject);
    procedure ShowValuesExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure DismissedAfterEdit(Sender: TField);
    { Public declarations }
  end;

var
  EditMode, Edited : Boolean;
  fmMassDismissOrder: TfmMassDismissOrder;

implementation

{$R *.dfm}

uses uDismissAddForm;

procedure TfmMassDismissOrder.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmMassDismissOrder.FormResize(Sender: TObject);
begin
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TfmMassDismissOrder.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMassDismissOrder.RecalcButtonClick(Sender: TObject);
var
  fmDismissDate: TfmDismissDate;
begin
    if not DM.RxMD_Dismissed.IsEmpty then
     begin
       ShowMessage('Щоб переформувати наказ - необхідно вилучити цей пункт наказу і створити новий!');
       exit;
     end;

    if not qFConfirm('Звільнити всіх внутрішніх сумісників?') then
        exit;

    fmDismissDate:=TfmDismissDate.Create(Self);

    if fmDismissDate.ShowModal=mrOk then
     begin
       Dm.LocalWriteTransaction.StartTransaction;
       Dm.pFIBQ_Dismiss.Close;
       Dm.pFIBQ_Dismiss.ParamByName('act_date').AsDate:=fmDismissDate.PeriodBeg.Value;
       Dm.pFIBQ_Dismiss.ParamByName('id_order').AsInteger:=DM.IdOrder;
       Dm.pFIBQ_Dismiss.ExecQuery;
       Dm.LocalWriteTransaction.Commit;

       Dm.SelectDismissedInfo.CloseOpen(False);
       Dm.SelectDismissedInfo.Close;
       Dm.LocalReadTransaction.Commit;
     end;
end;

procedure TfmMassDismissOrder.SpeedButton2Click(Sender: TObject);
begin
    //PrintQuery.Close;
    //PrintQuery.ParamByName('id_order').AsInteger := Dm.IdOrder;
    //PrintQuery.Open;

    Printed:=True;

    GetOrderGroup.Close;
    GetOrderGroup.ParamByName('ID_ORDER').AsInteger := Dm.IdOrder;
    GetOrderGroup.Open;

    PrintFooterQuery.Close;
    PrintFooterQuery.ParamByName('ID_ORDER_GROUP').AsInteger := GetOrderGroup['ID_ORDER_GROUP'];
    PrintFooterQuery.Open;

    Report.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Reports\Asup\Asup_Sovmest_Dismiss_Order.fr3');

    Dm.SelectDismissedInfo.Open;

    if Editmode then Report.DesignReport
     else begin
            Report.PrepareReport(True);
            Report.ShowPreparedReport;
          end;

    Printed:=False;
end;

procedure TfmMassDismissOrder.cxGridDBTableView5DBColumn9PropertiesChange(
  Sender: TObject);
begin
//  ShowMessage('Changed!')
 { if VarIsNull(DM.RxMD_Dismissed['day_count']) then
   begin
     DM.RxMD_Dismissed['day_count']:=OldValue;
     cxGridDBTableView5DBColumn9.EditValue:=OldValue;
   end;
  if (MessageDlg('Ви впевнені що хочете змінити компенсацію днів відпустки з '+IntToStr(OldValue)+' на '+IntToStr(cxGridDBTableView5DBColumn9.EditValue)+'?',mtConfirmation,mbOKCancel,-1)=mrOk) then
   begin
//     OldValue:=DM.RxMD_Dismissed['day_count'];
//     cxGridDBTableView5DBColumn9.
   end
  else
   begin
     DM.RxMD_Dismissed['day_count']:=OldValue;
     cxGridDBTableView5DBColumn9.EditValue:=OldValue;
   end         }
end;

procedure TfmMassDismissOrder.AdminModeExecute(Sender: TObject);
begin
  EditMode:=not EditMode;
end;

procedure TfmMassDismissOrder.ShowValuesExecute(Sender: TObject);
begin
  ShowInfo(cxGridDBTableView5.DataController.DataSet);
end;

procedure TfmMassDismissOrder.DismissedAfterEdit(Sender: TField);
begin
  if (VarIsNull(Dm.RxMD_Dismissed['id_man_dismission'])) then exit;
  if Edited then exit;
  if VarIsNull(Dm.RxMD_Dismissed['day_count']) then
   begin
     Edited:=true;
     Dm.RxMD_Dismissed['day_count']:=OldValue;
     cxGridDBTableView5DBColumn9.EditValue:=OldValue;
     Edited:=false;
     Exit;
   end;
  if (MessageDlg('Ви впевнені що хочете змінити компенсацію днів відпустки з '+IntToStr(OldValue)+' на '+IntToStr(Dm.RxMD_Dismissed['day_count'])+'?',mtConfirmation,mbOKCancel,-1)=mrOk) then
   begin
     OldValue:=Dm.RxMD_Dismissed['day_count'];
     DM.pFIBQ_Edit.ParamByName('NOTUSED').AsInteger:=Dm.RxMD_Dismissed['day_count'];
     DM.pFIBQ_Edit.ParamByName('id_man_dismission').AsInteger:=Dm.RxMD_Dismissed['id_man_dismission'];
     DM.LocalWriteTransaction.StartTransaction;
     Dm.pFIBQ_Edit.ExecQuery;
     Dm.LocalWriteTransaction.Commit;
//     cxGridDBTableView5DBColumn9.
   end
  else
   begin
     Edited:=true;
     Dm.RxMD_Dismissed['day_count']:=OldValue;
     cxGridDBTableView5DBColumn9.EditValue:=OldValue;
     Edited:=false;
   end;
   NewValue:=Dm.RxMD_Dismissed['day_count'];
end;

procedure TfmMassDismissOrder.FormShow(Sender: TObject);
begin
  DM.RxMD_Dismissedday_count.OnChange:=DismissedAfterEdit;
  Edited:=false;
end;

procedure TfmMassDismissOrder.EditActionExecute(Sender: TObject);
begin
///
end;

end.
