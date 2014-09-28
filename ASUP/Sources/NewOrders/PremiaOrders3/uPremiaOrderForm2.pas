unit uPremiaOrderForm2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridTableView, StdCtrls,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Buttons, uActionControl,
  dmPremiaOrder2, uSearchFrame, qFTools, frexpimg, frOLEExl,
  FR_Class, frRtfExp, frxClass, frxDBSet, FIBDataSet, pFIBDataSet,
  Placemnt, cxCalc, cxMaskEdit, DBCtrls, uInvisControl, IBCustomDataSet,
  IBQuery, Menus, uBoolControl, uFControl, uLabeledFControl, uSpravControl,
  Mask, ToolEdit,AccMgmt, NagScreenUnit, uCommonSP, Clipbrd, ShellApi;

type
  TfmPremiaOrderList = class(TForm)
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
    ButtonsPanel: TPanel;
    CancelButton: TSpeedButton;
    RecalcButton: TSpeedButton;
    RndButton: TSpeedButton;
    FilterBox: TGroupBox;
    AcceptFilterButton: TSpeedButton;
    FilterDateEnd: TCheckBox;
    FilterDateBeg: TCheckBox;
    DateBeg: TDateEdit;
    DateEnd: TDateEdit;
    Fio: TqFSpravControl;
    FilterFio: TCheckBox;
    FilterShowDeleted: TqFBoolControl;
    SortMenu: TPopupMenu;
    N1: TMenuItem;
    Nomer: TMenuItem;
    Typ: TMenuItem;
    DateSort: TMenuItem;
    DateSort2: TMenuItem;
    N3: TMenuItem;
    Source: TDataSource;
    ActionList: TActionList;
    OrderGrid: TcxGrid;
    OrderGridDBTableView1: TcxGridDBTableView;
    OrderGridDBTableView1DBColumn1: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn2: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn6: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn7: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn3: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn4: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn5: TcxGridDBColumn;
    OrderGridLevel1: TcxGridLevel;
    IdUser: TqFInvisControl;
    Panel1: TPanel;
    Label1: TLabel;
    StatusText: TDBText;
    Label2: TLabel;
    PrintName: TDBText;
    SearchPanel: TPanel;
    SearchLabel: TLabel;
    Label5: TLabel;
    SearchNextButton: TSpeedButton;
    AllLabel: TLabel;
    SearchEdit: TEdit;
    OrdersActionControl: TqFActionControl;
    RndAction: TAction;
    RecalcAction: TAction;
    ShowValue: TAction;
    OrderGridDBTableView1DBColumn8: TcxGridDBColumn;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure AdminModeExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshFilterActionExecute(Sender: TObject);
    procedure FilterAccept;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseFormExecute(Sender: TObject);
    procedure OrdersActionControlBeforePrepare(Sender: TObject;
      Form: TForm);
    procedure OrderGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchNextButtonClick(Sender: TObject);
    procedure AllLabelClick(Sender: TObject);
    procedure OrderGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FilterFioClick(Sender: TObject);
    procedure RndActionExecute(Sender: TObject);
    procedure RecalcActionExecute(Sender: TObject);
    procedure ShowValueExecute(Sender: TObject);
  private
    { Private declarations }
    {id_server,} Id_PCard : Integer;
  public
    procedure DismissedAfterEdit(Sender: TField);
    { Public declarations }
  end;

var
  EditMode, Edited : Boolean;
  fmPremiaOrderList: TfmPremiaOrderList;

implementation

{$R *.dfm}

uses uPremiaRndForm,SpFormUnit, uPremiaRecalcForm;

procedure TfmPremiaOrderList.FilterAccept;
begin

    DM.InputQuery.Close;

    if FilterFio.Checked then begin
        if not VarIsNull(Fio.Value)
        then
            DM.InputQuery.ParamByName('ID_PCARD').AsInteger := Fio.Value
        else
            DM.InputQuery.ParamByName('ID_PCARD').AsVariant := null;
    end
    else
        DM.InputQuery.ParamByName('ID_PCARD').AsVariant := null;

    if FilterDateBeg.Checked
        then
            DM.InputQuery.ParamByName('FILTER_DATE_BEG').AsDate := DateBeg.Date
        else
            DM.InputQuery.ParamByName('FILTER_DATE_BEG').AsVariant := null;

    if FilterDateEnd.Checked
        then
            DM.InputQuery.ParamByName('FILTER_DATE_END').AsDate := DateEnd.Date
        else
            DM.InputQuery.ParamByName('FILTER_DATE_END').AsVariant := null;

    if FilterShowDeleted.Value then
        DM.InputQuery.ParamByName('FILTER_SHOW_DELETED').AsString := 'T'
    else
        DM.InputQuery.ParamByName('FILTER_SHOW_DELETED').AsString := 'F';

    NAgScreen := TNagScreen.Create(Self);
    NagScreen.Show;
    NagScreen.SetStatusText('відбір даних...');

    DM.InputQuery.Open;
    NagScreen.Free;
end;

procedure TfmPremiaOrderList.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPremiaOrderList.FormResize(Sender: TObject);
begin
    FilterBox.Width := ButtonsPanel.Width - 5;
end;

procedure TfmPremiaOrderList.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmPremiaOrderList.AdminModeExecute(Sender: TObject);
begin
  EditMode:=not EditMode;
end;

procedure TfmPremiaOrderList.DismissedAfterEdit(Sender: TField);
begin

end;

procedure TfmPremiaOrderList.FormShow(Sender: TObject);
begin
   OrdersActionControl.SelectDataSet := DM.InputQuery;

    //Фильтр на день
    DateBeg.Date := Date;
    DateEnd.Date := Date;

    id_pcard := -1;

    FilterShowDeleted.Visible := AdminMode;

    FilterAccept;
    Edited:=false;

   // DM.InputQuery.AfterScroll:=DM.InputQueryAfterScroll;
end;

procedure TfmPremiaOrderList.RefreshFilterActionExecute(Sender: TObject);
begin
    FilterAccept;
end;

procedure TfmPremiaOrderList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TfmPremiaOrderList.CloseFormExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmPremiaOrderList.OrdersActionControlBeforePrepare(Sender: TObject;
  Form: TForm);
begin
//   (Form as TOrders2EditForm).Id_Order := InputQueryID_ORDER.value;
end;

procedure TfmPremiaOrderList.OrderGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Order_Group: ' + IntToStr(DM.InputQueryId_Order.Value) +
            ' Exec_DateTime: ' + DateTimeToStr(DM.InputQueryExec_DateTime.Value));

        Clipboard.AsText := IntToStr(DM.InputQueryId_Order.Value);
        ShowMessage('id_user: '+IntToStr(GetUserId)+'  id_owner: '+IntToStr(dm.InputQueryOWNER_ID_USER.Value)+'  '+BoolToStr(AdminMode,True));
    except
    end;
end;

procedure TfmPremiaOrderList.SearchEditChange(Sender: TObject);
begin
    DM.InputQuery.Locate('NUM_ORDER_KADR', SearchEdit.Text, []);
end;

procedure TfmPremiaOrderList.SearchNextButtonClick(Sender: TObject);
begin
    DM.InputQuery.LocateNext('NUM_ORDER_KADR', SearchEdit.Text, []);
end;

procedure TfmPremiaOrderList.AllLabelClick(Sender: TObject);
begin
   DM.InputQuery.FetchAll;
    AllLabel.Caption := 'Кіл-ть записів: ' + IntToStr(DM.InputQuery.RecordCount);

end;

procedure TfmPremiaOrderList.OrderGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.Selected then
    begin
        ACanvas.Brush.Color := clBlue;
        ACanvas.Font.Color := clWhite
    end
    else
        case AViewInfo.GridRecord.Values[OrderGridDBTableView1DBColumn5.Index] of
            1 : ACanvas.Brush.Color := RGB(157,244,162);
            2 : ACanvas.Brush.Color := RGB(151,167,255);
            3 : ACanvas.Brush.Color := RGB(138,215,255);
            4 : ACanvas.Brush.Color := RGB(250,163,177);
            5 : ACanvas.Brush.Color := clWhite;
        end;

end;

procedure TfmPremiaOrderList.FioOpenSprav(Sender: TObject; var Value: Variant;
  var DisplayText: String);
var
    sp: TSprav;
begin
    // создать справочник
    sp :=  GetSprav('asup\PCardsList');
    if sp <> nil then
    begin
        // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(dm.LocalDatabase.Handle);
            FieldValues['ActualDate'] := Date;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := AdminMode;
            Post;
        end;
        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];
        end;
        sp.Free;
    end;
end;

procedure TfmPremiaOrderList.FilterFioClick(Sender: TObject);
begin
    if not FilterFio.Checked then begin
        Fio.Blocked := True;
        Fio.Value := null;
        Fio.DisplayText := '';
    end        
    else begin
        Fio.Blocked := False;
        Fio.OpenSprav;
    end;
end;

procedure TfmPremiaOrderList.RndActionExecute(Sender: TObject);
var
  fmRndForm: TfmRndForm;
  rnd_value:integer;
begin
  try
    fmRndForm:=TfmRndForm.Create(Self);

    if fmRndForm.ShowModal=mrOk then
     begin
      with Dm
       do begin
             LocalWriteTransaction.StartTransaction;
             pFIBQ_Rnd.ParamByName('ID_ORDER_GROUP').AsInt64 := InputQueryID_ORDER.Value;
             rnd_value:=fmRndForm.RndComboBox.ItemIndex;
             if rnd_value=-1 then rnd_value:=0;
             pFIBQ_Rnd.ParamByName('RND').AsInteger:=rnd_value;
             pFIBQ_Rnd.Prepare;
             pFIBQ_Rnd.ExecQuery;
             LocalWriteTransaction.Commit;
       end;
       FilterAccept;
     end;
     finally
      if fmRndForm<>nil then FreeAndNil(fmRndForm);
     end;
end;

procedure TfmPremiaOrderList.RecalcActionExecute(Sender: TObject);
var  fmRecalcForm: TfmRecalcForm;
begin
  try
    fmRecalcForm := TfmRecalcForm.Create(Self);

     if fmRecalcForm.ShowModal = mrOk
     then begin

       with Dm
       do begin
         pFIBQ_Recalc.ParamByName('ID_ORDER_GROUP').AsInt64    := InputQueryID_ORDER.Value;
         pFIBQ_Recalc.ParamByName('SUMMA_RECALC').AsExtended := fmRecalcForm.RecalcEdit.Value;
         LocalWriteTransaction.StartTransaction;
         pFIBQ_Recalc.Prepare;
         pFIBQ_Recalc.ExecProc;
         LocalWriteTransaction.Commit;
       end;
         FilterAccept;
     end;

  finally
      //Освобождаем выделенные для формы ресурсы
      if fmRndForm <> nil then FreeAndNil(fmRndForm);
      //Откатываем транзакцию в случае, если приложение было аварийно завершено
      if DM.LocalWriteTransaction.InTransaction then DM.LocalWriteTransaction.Rollback;
  end;


end;

procedure TfmPremiaOrderList.ShowValueExecute(Sender: TObject);
begin
   ShowInfo(OrderGridDBTableView1.DataController.DataSet);
end;

end.
