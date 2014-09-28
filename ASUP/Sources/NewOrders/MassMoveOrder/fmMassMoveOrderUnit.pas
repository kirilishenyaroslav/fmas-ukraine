unit fmMassMoveOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFormControl, ComCtrls, DB, FIBDataSet, pFIBDataSet, RxMemDS,
  FIBDatabase, pFIBDatabase, ActnList, StdCtrls, Buttons, uFControl,
  uInvisControl, uLabeledFControl, uSpravControl, uCommonSP, uCharControl,
  cxClasses, cxStyles, cxGridTableView,  uDateControl, uFloatControl, ExtCtrls,
  cxControls, cxSplitter, uShtatUtils, qFTools, uSelectForm, GlobalSPR,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, uBoolControl;

type
  TfmMassMoveOrder = class(TForm)
    KeyList: TActionList;
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    WorkQuery: TpFIBDataSet;
    CancelAction: TAction;
    TopPanel: TPanel;
    BottomPanel: TPanel;
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
    MiddlePanel: TPanel;
    InfoPanel: TPanel;
    Panel3: TPanel;
    DeleteItemButton: TSpeedButton;
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    FormListAction: TAction;
    InsertOrderQuery: TpFIBDataSet;
    ResultQuery: TpFIBDataSet;
    ResultQueryID_MASS_MOVE: TFIBIntegerField;
    ResultQueryTN: TFIBIntegerField;
    ResultQueryFIO: TFIBStringField;
    ResultQueryPOST_NAME: TFIBStringField;
    ResultQueryDEPARTMENT_NAME: TFIBStringField;
    GridSource: TDataSource;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    ResultQueryDATE_BEG: TFIBDateField;
    ResultQueryDEPARTMENT_NAME2: TFIBStringField;
    ResultQueryREASON: TFIBStringField;
    ResultQueryID_DEPARTMENT: TFIBIntegerField;
    ResultQueryID_DEPARTMENT2: TFIBIntegerField;
    FindPanel: TPanel;
    SearchLabel: TLabel;
    PCardCountLabel: TLabel;
    Label1: TLabel;
    SearchEdit: TEdit;
    ResultQueryDATE_END: TFIBDateField;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    BottomButtonsPanel: TPanel;
    CancelButton: TBitBtn;
    OkButton: TBitBtn;
    TopButtonsPanel: TPanel;
    Department: TqFSpravControl;
    DateBeg: TqFDateControl;
    Department2: TqFSpravControl;
    Reason: TqFCharControl;
    FormListButton: TBitBtn;
    procedure CancelActionExecute(Sender: TObject);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure DepartmentOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure OkActionExecute(Sender: TObject);
    procedure FormListActionExecute(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure ResultQueryAfterOpen(DataSet: TDataSet);
    procedure cxGridDBTableView5KeyPress(Sender: TObject; var Key: Char);
    procedure Department2OpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FormResize(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    DateOrder : TDate;
    IdOrder : Integer;
  end;

var
  fmMassMoveOrder: TfmMassMoveOrder;

implementation

{$R *.dfm}

procedure TfmMassMoveOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmMassMoveOrder.FioOpenSprav(Sender: TObject; var Value: Variant;
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
            FieldValues['DBHandle'] := Integer(LocalDatabase.Handle);
            FieldValues['ActualDate'] := DateOrder;
            FieldValues['SecondDate'] := 0;
            FieldValues['ShowWorking'] := True;
            FieldValues['CanRemoveFilter'] := True;
            FieldValues['AdminMode'] := True;
            Post;
        end;

        // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['ID_PCARD'];
            DisplayText := sp.Output['FIO'];

            Reason.Value := 'Заява ' + DisplayText;
        end;
        sp.Free;
    end;
end;

procedure TfmMassMoveOrder.DepartmentOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(fmMassMoveOrder.LocalDatabase.Handle);
            FieldValues['Actual_Date'] := fmMassMoveOrder.DateOrder;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmMassMoveOrder.OkActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmMassMoveOrder.FormListActionExecute(Sender: TObject);
begin
    if not qFCheckAll(Self) then
        exit;

    if MessageDlg('Ця операція створить у підрозділі "' + Department2.DisplayText + '"' +
                  ' усі посади ЩР, які є у підпідрозділи "' + Department.DisplayText + '".' +
                  ' Якщо відбувається переформування,' +
                  ' тоді спочатку відбудється вилучення створених раніше' +
                  ' позицій штатного розкладу.' +
                  ' Ви дійсно бажаєте продовжити?', mtConfirmation, [mbYes, mbNo], 0) = mrNo

    then
        exit;        

    try
        LocalWriteTransaction.StartTransaction;

        WorkQuery.Close;
        WorkQuery.InsertSQL.Text := 'EXECUTE PROCEDURE ASUP_MASS_MOVE_INSERT(' +
                                IntToStr(IdOrder) + ',' +
                                IntToStr(Department.Value) + ',' +
                                IntToStr(Department2.Value)  + ',' +
                                QuotedStr(DateToStr(DateBeg.Value))  + ',' +
                                QuotedStr(Reason.Value)  + ')';
        WorkQuery.QInsert.ExecQuery;
    except on e:exception do begin
            LocalWriteTransaction.Rollback;
            MessageDlg('При занесенні данних у базу виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
            exit;
        end;
    end;

    LocalWriteTransaction.Commit;

    ResultQuery.Close;
    ResultQuery.Open;
end;

procedure TfmMassMoveOrder.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    if TN <> 0 then
        ResultQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        ResultQuery.Locate('FIO', SearchEdit.Text, [loPartialKey,
            loCaseInsensitive]);
end;

procedure TfmMassMoveOrder.ResultQueryAfterOpen(DataSet: TDataSet);
begin
    ResultQuery.FetchAll;
    PCardCountLabel.Caption := 'Кількість записів: ' + IntToStr(ResultQuery.RecordCount);
end;

procedure TfmMassMoveOrder.cxGridDBTableView5KeyPress(Sender: TObject;
  var Key: Char);
const
    LettersBig = 'АБВГҐДЕЁЖЗЄІИЇЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ';
    LettersSmall = 'абвгґдеёжзєіиїйклмнопрстуфхцчшщъыьэюя';
    Signs = '0123456789-()/\';
begin
    if (Pos(Key, LettersBig) = 0)
        and (Pos(Key, LettersSmall) = 0)
        and (Pos(Key, Signs) = 0)
        then Exit;

    SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TfmMassMoveOrder.Department2OpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(fmMassMoveOrder.LocalDatabase.Handle);
            FieldValues['Actual_Date'] := fmMassMoveOrder.DateOrder;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
        begin
            Value := sp.Output['Id_Department'];
            DisplayText := sp.Output['Name_Full'];
        end;
        sp.Free;
    end;
end;

procedure TfmMassMoveOrder.FormResize(Sender: TObject);
begin
    BottomButtonsPanel.Left := Trunc(Width / 2) - Trunc(BottomButtonsPanel.Width / 2);
    TopButtonsPanel.Left := Trunc(Width / 2) - Trunc(TopButtonsPanel.Width / 2);    
end;

procedure TfmMassMoveOrder.DeleteActionExecute(Sender: TObject);
begin
    if ResultQuery.IsEmpty then begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    if MessageDlg('Ви справді бажаєте вилучити цей запис?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        exit;        

    try
        LocalWriteTransaction.StartTransaction;

        WorkQuery.Close;
        WorkQuery.DeleteSQL.Text := 'EXECUTE PROCEDURE ASUP_MASS_MOVE_DELETE(' +
                                IntToStr(ResultQueryID_MASS_MOVE.Value) + ')';
        WorkQuery.QDelete.ExecQuery;
    except on e:exception do begin
            LocalWriteTransaction.Rollback;
            MessageDlg('При занесенні данних у базу виникла помилка: "' + E.Message + '"', mtError, [mbOk], 0);
            exit;
        end;
    end;

    LocalWriteTransaction.Commit;

    ResultQuery.Close;
    ResultQuery.Open;
end;

end.
