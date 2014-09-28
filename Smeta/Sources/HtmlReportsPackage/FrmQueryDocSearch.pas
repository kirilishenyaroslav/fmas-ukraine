unit FrmQueryDocSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxMRUEdit;

type
  TfrmDocSearchInfo = class(TForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    cxButton1: TcxButton;
    Label4: TLabel;
    edtMonthBeg: TcxMRUEdit;
    edtYearBeg: TcxSpinEdit;
    Label6: TLabel;
    edtMonthEnd: TcxMRUEdit;
    edtYearEnd: TcxSpinEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;datebeg,dateend:TdateTime);reintroduce;
    function getEndDate: TDateTime;
    function getStartDate: TDateTime;
  end;

implementation

uses DateUtils;
{$R *.dfm}

constructor TfrmDocSearchInfo.Create(AOwner: TComponent; datebeg,
  dateend: TdateTime);
begin
    inherited Create(AOwner);

    edtMonthBeg.AddItem('грудень');
    edtMonthBeg.AddItem('листопад');
    edtMonthBeg.AddItem('жовтень');
    edtMonthBeg.AddItem('вересень');
    edtMonthBeg.AddItem('серпень');
    edtMonthBeg.AddItem('липень');
    edtMonthBeg.AddItem('червень');
    edtMonthBeg.AddItem('травень');
    edtMonthBeg.AddItem('квітень');
    edtMonthBeg.AddItem('березень');
    edtMonthBeg.AddItem('лютий');
    edtMonthBeg.AddItem('січень');

    edtMonthEnd.AddItem('грудень');
    edtMonthEnd.AddItem('листопад');
    edtMonthEnd.AddItem('жовтень');
    edtMonthEnd.AddItem('вересень');
    edtMonthEnd.AddItem('серпень');
    edtMonthEnd.AddItem('липень');
    edtMonthEnd.AddItem('червень');
    edtMonthEnd.AddItem('травень');
    edtMonthEnd.AddItem('квітень');
    edtMonthEnd.AddItem('березень');
    edtMonthEnd.AddItem('лютий');
    edtMonthEnd.AddItem('січень');

    edtMonthBeg.Properties.LookupItems.IndexOf(trim(edtMonthBeg.Properties.LookupItems[MonthOf(StartOftheYear( DateBeg )) - 1]));
    edtMonthEnd.Properties.LookupItems.IndexOf(trim(edtMonthEnd.Properties.LookupItems[MonthOf(EndOftheYear( DateEnd )) - 1]));
    edtMonthBeg.Text:=edtMonthBeg.Properties.LookupItems[MonthOf(StartOftheYear( DateBeg )) - 1];
    edtMonthEnd.Text:=edtMonthEnd.Properties.LookupItems[MonthOf(EndOftheYear( DateEnd )) - 1];

    edtYearBeg.Value:=YearOf(DateBeg);
    edtYearBeg.Properties.MinValue := 2000;
    edtYearBeg.Properties.MaxValue := 2050;

    edtYearEnd.Value:=YearOf(DateEnd);
    edtYearEnd.Properties.MinValue := 2000;
    edtYearEnd.Properties.MaxValue := 2050;

end;

procedure TfrmDocSearchInfo.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmDocSearchInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;


function TfrmDocSearchInfo.getStartDate: TdateTime;
var i:Integer;
begin
     for i := 0 to edtMonthBeg.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthBeg.Text) = Trim(edtMonthBeg.Properties.LookupItems[i]) then Break;
     end;
     Result:=EncodeDate( StrToInt( edtYearBeg.Text ), i + 1, 1 );
end;

function TfrmDocSearchInfo.getEndDate: TDateTime;
var i:Integer;
begin
     for i := 0 to edtMonthEnd.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthEnd.Text) = Trim(edtMonthEnd.Properties.LookupItems[i]) then Break;
     end;
     Result:=IncMonth(EncodeDate( StrToInt( edtYearEnd.Text ), i + 1, 1 ))-1;
end;

end.
