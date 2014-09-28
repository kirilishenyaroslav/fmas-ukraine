unit MinCategoryAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLabel, cxCurrencyEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons,
  cxMaskEdit, cxDropDownEdit, cxCalendar, uFControl, uLabeledFControl,
  uCharControl, uFloatControl, cxCheckBox, BaseTypes, uIntControl, cxCalc,
  DB, FIBDataSet, pFIBDataSet, DateUtils;

type
  TfrmMinCatAdd = class(TForm)
    lblDateEnd: TcxLabel;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    ActList: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
    lblDateBeg: TcxLabel;
    lblCategory: TcxLabel;
    CatDateBeg: TcxDateEdit;
    CatDateEnd: TcxDateEdit;
    cMinValue: TcxCalcEdit;
    CheckDates: TpFIBDataSet;
    procedure ActOkExecute(Sender: TObject);
    procedure ActCancelExecute(Sender: TObject);
  private
    { Private declarations }
    ModeEdit:Boolean;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; EditMode:Boolean);
    function IsPeriodCrossWithOld(DateBeg, DateEnd: TDate):Boolean;
  end;

var
  frmMinCatAdd: TfrmMinCatAdd;

implementation

uses MinCategoryMain;

{$R *.dfm}

constructor TfrmMinCatAdd.Create(AOwner:TComponent; EditMode:Boolean);
begin
   inherited Create(AOwner);
   if EditMode=False then
   begin
      cMinValue.EditValue:=0;
      CatDateBeg.Date:=EncodeDate(YearOf(Date), MonthOf(Date), 1);
      CatDateEnd.Date:=EncodeDate(9999, 12, 31);
   end;
   ModeEdit:=EditMode;
end;

function TfrmMinCatAdd.IsPeriodCrossWithOld(DateBeg, DateEnd: TDate):Boolean;
begin
  Result:=False;
  if ModeEdit=False then
  begin
    try
       CheckDates.Close;
       CheckDates.SQLs.SelectSQL.Text:='select * '+
                                       '  from sp_min_category s'+
                                       ' where :date_beg between s.date_beg and s.date_end';
       CheckDates.ParamByName('date_beg').AsDate:=DateBeg;
       //CheckDates.ParamByName('date_end').AsDate:=DateEnd;
       CheckDates.Open;
    except on e:Exception do
              agShowMessage(e.Message);
    end;
    if CheckDates.IsEmpty then Result:=False
    else Result:=True;
  end;
end;

procedure TfrmMinCatAdd.ActOkExecute(Sender: TObject);
begin
    If (CatDateBeg.Date>CatDateEnd.Date) then
    begin
       agMessageDlg('Увага!', 'Дата початку повинна бути менш, ніж дата кінця!', mtInformation, [mbOK]);
       Exit;
    end;
    if IsPeriodCrossWithOld(CatDateBeg.Date, CatDateEnd.Date)=True then
    begin
        if agMessageDlg('Підтвердження', 'Вже є запис на цей період! Ви бажаєте закрити старий запис?', mtInformation, [mbYes, mbNo])=mrYes then
           ModalResult:=mrOk
        else
           Exit;
    end
    else ModalResult:=mrOk;
end;

procedure TfrmMinCatAdd.ActCancelExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

end.
