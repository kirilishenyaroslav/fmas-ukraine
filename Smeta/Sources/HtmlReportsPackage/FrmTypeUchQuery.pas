unit FrmTypeUchQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxRadioGroup, ExtCtrls, cxSpinEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxMRUEdit;

type
  TTypeUchQuery = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RadioGroup: TcxRadioGroup;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label4: TLabel;
    edtMonthBeg: TcxMRUEdit;
    edtYearBeg: TcxSpinEdit;
    Label6: TLabel;
    edtMonthEnd: TcxMRUEdit;
    edtYearEnd: TcxSpinEdit;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;datebeg,dateend:TDateTime);reintroduce;
    function getEndDate: TDateTime;
    function getStartDate: TDateTime;
  end;

implementation

uses dateUtils;

{$R *.dfm}

procedure TTypeUchQuery.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mryes;
end;

procedure TTypeUchQuery.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

constructor TTypeUchQuery.Create(AOwner: TComponent; datebeg,
  dateend: TDateTime);
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

function TTypeUchQuery.getStartDate: TdateTime;
var i:Integer;
begin
     for i := 0 to edtMonthBeg.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthBeg.Text) = Trim(edtMonthBeg.Properties.LookupItems[i]) then Break;
     end;
     Result:=EncodeDate( StrToInt( edtYearBeg.Text ), i + 1, 1 );
end;

function TTypeUchQuery.getEndDate: TDateTime;
var i:Integer;
begin
     for i := 0 to edtMonthEnd.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthEnd.Text) = Trim(edtMonthEnd.Properties.LookupItems[i]) then Break;
     end;
     Result:=IncMonth(EncodeDate( StrToInt( edtYearEnd.Text ), i + 1, 1 ))-1;
end;

end.
