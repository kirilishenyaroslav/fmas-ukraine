unit fmAddFactPochasUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCharControl, uFloatControl, uFControl, uLabeledFControl,
    uDateControl, ActnList, StdCtrls, Buttons, uFormControl, uInvisControl,
    DateUtils, cxTextEdit, cxLabel, cxControls, cxContainer, cxEdit,
    cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxStyles,
    cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxGridLevel,
    cxGridCustomTableView, cxGridTableView, cxClasses, cxGridCustomView,
    cxGrid, cxButtons, UpKernelUnit;

type
    TfmAddFactPochas = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        KeyList: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        DateBegEdit: TcxDateEdit;
        lblBeg: TcxLabel;
        cxLabel1: TcxLabel;
        DateEndEdit: TcxDateEdit;
        cxLabel2: TcxLabel;
        DateAct: TcxDateEdit;
        NumAct: TcxTextEdit;
        cxLabel3: TcxLabel;
        GroupBox2: TGroupBox;
        btnAdd: TcxButton;
        btnEdit: TcxButton;
        btnDelete: TcxButton;
        cxGrid1: TcxGrid;
        cxGrid1TableView1: TcxGridTableView;
        cxGrid1TableView1SM_TITLE: TcxGridColumn;
        cxGrid1TableView1HOURS: TcxGridColumn;
        cxGrid1Level1: TcxGridLevel;
        cxstylrpstry1: TcxStyleRepository;
        cxstyl1: TcxStyle;
        cxstyl2: TcxStyle;
        cxstyl3: TcxStyle;
        cxstyl4: TcxStyle;
        cxstyl5: TcxStyle;
        cxstyl6: TcxStyle;
        cxstyl7: TcxStyle;
        cxstyl8: TcxStyle;
        cxstyl9: TcxStyle;
        cxstyl10: TcxStyle;
        cxstyl11: TcxStyle;
        cxstyl12: TcxStyle;
        cxstyl13: TcxStyle;
        cxstyl14: TcxStyle;
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
        cxGrid1TableView1Column1: TcxGridColumn;
        cxGrid1TableView1KOD_SM: TcxGridColumn;
        procedure CancelActionExecute(Sender: TObject);
        procedure FormControlNewRecordAfterPrepare(Sender: TObject);
        procedure btnAddClick(Sender: TObject);
        procedure OkActionExecute(Sender: TObject);
        procedure btnDeleteClick(Sender: TObject);
        procedure btnEditClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    private
    { Private declarations }
    public
    { Public declarations }
    end;

var
    fmAddFactPochas: TfmAddFactPochas;

implementation

{$R *.dfm}

uses uAddPochasSmet, BaseTypes;

procedure TfmAddFactPochas.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddFactPochas.FormControlNewRecordAfterPrepare(
    Sender: TObject);
var
    y, m, d: Word;
begin
  //  DecodeDate(Date, y, m, d);

  //  AktDate.Value := Date;
  //  PeriodBeg.Value := EncodeDate(y, m, 1);
   // PeriodEnd.Value := EncodeDate(y, m, DaysInMonth(Date));
end;

procedure TfmAddFactPochas.btnAddClick(Sender: TObject);
var
    frm: TfrmAddPochasSmet;
    idx: integer;
begin
    frm := TfrmAddPochasSmet.Create(Self);
    if frm.ShowModal = mrOk then
    begin
        cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
        idx := cxGrid1TableView1.DataController.RecordCount - 1;
        cxGrid1TableView1.DataController.Values[idx, 0] := frm.SmetaEdit.Value;
        cxGrid1TableView1.DataController.Values[idx, 1] := IntToStr(frm.kod_sm);
        cxGrid1TableView1.DataController.Values[idx, 2] := frm.SmetaEdit.DisplayText;
        cxGrid1TableView1.DataController.Values[idx, 3] := frm.HoursEdit.Value;
        cxGrid1TableView1.DataController.FocusedRecordIndex := idx;
    end;
    frm.Free;
end;

procedure TfmAddFactPochas.OkActionExecute(Sender: TObject);
begin
 // проверка на заполнение даты
    if Trim(DateBegEdit.Text) = '' then
    begin
        agMessageDlg('”вага!', '¬вед≥ть початок пер≥оду!', mtError, [mbOk]);
        DateBegEdit.SetFocus;
        DateBegEdit.Style.Color := clRed;
        Exit;
    end;

    // проверка на заполнение даты
    if Trim(DateEndEdit.Text) = '' then
    begin
        agMessageDlg('”вага!', '¬вед≥ть к≥нець пер≥оду!', mtError, [mbOk]);
        DateEndEdit.SetFocus;
        DateEndEdit.Style.Color := clRed;
        Exit;
    end;

    // проверка на корректность даты
    if DateBegEdit.Date > DateEndEdit.Date then
    begin
        agMessageDlg('”вага!', 'ƒата к≥нц€ повинна бути б≥льше дати початку пер≥оду!', mtError, [mbOk]);
        DateBegEdit.SetFocus;
        DateBegEdit.Style.Color := clRed;
        DateEndEdit.Style.Color := clRed;
        Exit;
    end;

    // проверка на заполнение номера акта
    if Trim(NumAct.Text) = '' then
    begin
        agMessageDlg('”вага!', '¬вед≥ть номер акту!', mtError, [mbOk]);
        NumAct.SetFocus;
        NumAct.Style.Color := clRed;
        Exit;
    end;

    // проверка на заполнение даты акта
    if Trim(DateAct.Text) = '' then
    begin
        agMessageDlg('”вага!', '¬вед≥ть дату акту!', mtError, [mbOk]);
        DateAct.SetFocus;
        DateAct.Style.Color := clRed;
        Exit;
    end;

    if cxGrid1TableView1.DataController.Recordcount=0
    then
    begin
        agMessageDlg('”вага!', '¬вед≥ть бюджети погодинноњ оплати прац≥!', mtError, [mbOk]);
        Exit;
    end;

    ModalResult := mrOk;
end;

procedure TfmAddFactPochas.btnDeleteClick(Sender: TObject);
begin
    cxGrid1TableView1.DataController.DeleteFocused;
end;

procedure TfmAddFactPochas.btnEditClick(Sender: TObject);
var
    frm: TfrmAddPochasSmet;
    idx: integer;
begin
    if cxGrid1TableView1.DataController.FocusedRecordIndex = -1 then exit;
    idx := cxGrid1TableView1.DataController.FocusedRecordIndex;
    frm := TfrmAddPochasSmet.Create(Self);
    frm.SmetaEdit.Value := cxGrid1TableView1.DataController.Values[idx, 0];
    frm.SmetaEdit.DisplayText := cxGrid1TableView1.DataController.Values[idx, 2];
    frm.kod_sm := StrToInt(cxGrid1TableView1.DataController.Values[idx, 1]);
    frm.KodEdit.Value := frm.kod_sm;
    if VarIsNull(cxGrid1TableView1.DataController.Values[idx, 3]) then
    begin
        frm.HoursEdit.Value := Null;
    end
    else
    begin
        frm.HoursEdit.Value := cxGrid1TableView1.DataController.Values[idx, 3];
    end;

    if frm.ShowModal = mrOk then
    begin
        cxGrid1TableView1.DataController.Values[idx, 0] := frm.SmetaEdit.Value;
        cxGrid1TableView1.DataController.Values[idx, 1] := IntToStr(frm.kod_sm);
        cxGrid1TableView1.DataController.Values[idx, 2] := frm.SmetaEdit.DisplayText;
        if VarIsNull(frm.HoursEdit.Value) then
        begin
            cxGrid1TableView1.DataController.Values[idx, 3] := Null;
        end
        else
        begin
            cxGrid1TableView1.DataController.Values[idx, 3] := frm.HoursEdit.Value;
        end
    end;
    frm.Free;
end;

procedure TfmAddFactPochas.FormCreate(Sender: TObject);
begin
    cxGrid1TableView1.Columns[0].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGrid1TableView1.Columns[1].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGrid1TableView1.Columns[2].DataBinding.ValueTypeClass := TcxStringValueType;
    cxGrid1TableView1.Columns[3].DataBinding.ValueTypeClass := TcxStringValueType;
end;

initialization
    RegisterClass(TfmAddFactPochas);

end.

