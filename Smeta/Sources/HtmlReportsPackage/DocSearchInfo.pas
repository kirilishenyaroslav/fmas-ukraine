unit DocSearchInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit;

type
  TfrmDocsSearchInfo = class(TForm)
    pnl1: TPanel;
    grp1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    GroupBox1: TGroupBox;
    rb3: TRadioButton;
    rb4: TRadioButton;
    cxButtonOk: TcxButton;
    Label4: TLabel;
    edtMonthBeg: TcxMRUEdit;
    edtYearBeg: TcxSpinEdit;
    Label6: TLabel;
    edtMonthEnd: TcxMRUEdit;
    edtYearEnd: TcxSpinEdit;
    procedure OKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent; DateBeg,DateEnd: TDateTime); reintroduce;
    function getEndDate: TDateTime;
    function getStartDate: TDateTime;
  end;

implementation

uses GlobalSpr, Resources_unitb, DateUtils;

{$R *.dfm}


procedure TfrmDocsSearchInfo.OKClick(Sender: TObject);
begin
    ModalResult:=mrOk;
end;

procedure TfrmDocsSearchInfo.FormCreate(Sender: TObject);
begin

    rb3.Checked:=True;
    rb1.Checked:=True;
end;

constructor TfrmDocsSearchInfo.Create(AOwner: TComponent; DateBeg, DateEnd: TDateTime);
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

function TfrmDocsSearchInfo.getStartDate: TdateTime;
var i:Integer;
begin
     for i := 0 to edtMonthBeg.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthBeg.Text) = Trim(edtMonthBeg.Properties.LookupItems[i]) then Break;
     end;
     Result:=EncodeDate( StrToInt( edtYearBeg.Text ), i + 1, 1 );
end;

function TfrmDocsSearchInfo.getEndDate: TDateTime;
var i:Integer;
begin
     for i := 0 to edtMonthEnd.Properties.LookupItems.Count-1 do
     begin
         if Trim(edtMonthEnd.Text) = Trim(edtMonthEnd.Properties.LookupItems[i]) then Break;
     end;
     Result:=IncMonth(EncodeDate( StrToInt( edtYearEnd.Text ), i + 1, 1 ))-1;
end;



end.
