unit TarifGridAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxCurrencyEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxCalendar, uFControl, uLabeledFControl,
  uCharControl, uFloatControl, cxCheckBox, BaseTypes, ExtCtrls, uIntControl,
  DateUtils, DB, FIBDataSet, pFIBDataSet, Math;

type
  TfrmTarifGridAdd = class(TForm)
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    DataSet: TpFIBDataSet;
    TarifRate: TcxCurrencyEdit;
    lblTarifRate: TcxLabel;
    cxLabel1: TcxLabel;
    MinValueEdit: TcxCurrencyEdit;
    SumEdit: TcxCurrencyEdit;
    cxLabel2: TcxLabel;
    PeriodBox: TGroupBox;
    lblDateBeg: TcxLabel;
    TarifDateBeg: TcxDateEdit;
    lblDateEnd: TcxLabel;
    WithOutEndPeriod: TcxCheckBox;
    TarifDateEnd: TcxDateEdit;
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
    procedure WithOutEndPeriodPropertiesChange(Sender: TObject);
    procedure TarifRatePropertiesChange(Sender: TObject);
    procedure TarifDateBegPropertiesChange(Sender: TObject);
  private
     LocDate:TDate;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; EditMode:Boolean);
    procedure FillMinValueEdit(ActualDate:TDate);
  end;

var
  frmTarifGridAdd: TfrmTarifGridAdd;

implementation

uses TarifGridMain;

{$R *.dfm}

constructor TfrmTarifGridAdd.Create(AOwner:TComponent; EditMode:Boolean);
begin
   inherited Create(AOwner);
   if EditMode=False then
   begin
      TarifDateBeg.Date:=EncodeDate(YearOf(Date), MonthOf(Date), 1);
      TarifDateEnd.Date:=Date;
      TarifRate.Value:=1;
      WithOutEndPeriod.Checked:=True;
   end;
   FillMinValueEdit(TarifDateEnd.Date);
end;

procedure TfrmTarifGridAdd.FillMinValueEdit(ActualDate:TDate);
begin
   try
     DataSet.Close;
     DataSet.SQLs.SelectSQL.Text:='select min_value from get_min_category(:act_date)';
     DataSet.ParamByName('act_date').AsDate:=ActualDate;
     DataSet.Open;
     MinValueEdit.Text:=FloatToStr(DataSet['Min_Value']);
   except on E:Exception
          do begin
                MinValueEdit.Text:='0';
          end;
   end;
end;

procedure TfrmTarifGridAdd.ActOkExecute(Sender: TObject);
begin
    If (DateToStr(TarifDateBeg.Date)='00.00.0000') then
    begin
       TarifDateBeg.Style.Color:=clRed;
       agMessageDlg('Увага', 'Треба заповнити дату початку!', mtInformation, [mbOK]);
       Exit;
    end;

    If ((DateToStr(TarifDateEnd.Date)='00.00.0000') And (WithOutEndPeriod.Checked=False)) then
    begin
       TarifDateEnd.Style.Color:=clRed;
       agMessageDlg('Увага', 'Треба заповнити дату кінця!', mtInformation, [mbOK]);
       Exit;
    end;

    If (VarIsNull(TarifRate.Value)) then
    begin
       TarifRate.Style.Color:=clRed;
       agMessageDlg('Увага', 'Треба ввести ставку першого розряду!', mtInformation, [mbOK]);
       Exit;
    end;

    If (TarifDateBeg.Date>TarifDateEnd.Date) then
    begin
       TarifDateBeg.Style.Color:=clRed;
       agMessageDlg('Увага', 'Дата початку повинна бути менш, ніж дата кінця!', mtInformation, [mbOK]);
       Exit;
    end;
    TarifDateBeg.Date:=EncodeDate(YearOf(TarifDateBeg.Date), MonthOf(TarifDateBeg.Date), 1);
    TarifDateEnd.Date:=EncodeDate(YearOf(TarifDateEnd.Date), MonthOf(TarifDateEnd.Date), DaysInMonth(TarifDateEnd.Date));
    ModalResult:=mrOk;
end;

procedure TfrmTarifGridAdd.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmTarifGridAdd.WithOutEndPeriodPropertiesChange(
  Sender: TObject);
begin
   TarifDateEnd.Visible:=not WithOutEndPeriod.Checked;
   If WithOutEndPeriod.Checked Then TarifDateEnd.Date:=EncodeDate(9999, 12, 31);
end;

procedure TfrmTarifGridAdd.TarifRatePropertiesChange(Sender: TObject);
var CurValue, MinVal:Double;
begin
   try
     CurValue:=StrToFloat(TarifRate.Text);
     MinVal:=StrToFloat(MinValueEdit.Text);
   except
     CurValue:=0;
     MinVal:=0;
   end;
   SumEdit.Text:=FloatToStr(SimpleRoundTo(CurValue*MinVal, -2));
end;

procedure TfrmTarifGridAdd.TarifDateBegPropertiesChange(Sender: TObject);
begin
  if Length(TarifDateBeg.EditText)=10 then
  begin
      TarifDateBeg.Date:=StrToDate(TarifDateBeg.EditText);
      FillMinValueEdit(TarifDateBeg.Date);
      TarifRatePropertiesChange(Sender);
  end;
end;

end.
