unit UDocReestrUnderBU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxTextEdit, cxCheckBox, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar;

type
  TfrmDocReestr = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    edSm: TcxTextEdit;
    edRz: TcxTextEdit;
    edSt: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    cbMonthEnd: TComboBox;
    cbYearEnd: TComboBox;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cbMonthBegChange(Sender: TObject);
    procedure cbYearBegChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBeg:TDateTime;
    DateEnd:TDateTIme;
    Constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime);overload;
  end;


implementation

uses GlobalSpr, Resources_unitb, DateUtils;

{$R *.dfm}

procedure TfrmDocReestr.cxButton3Click(Sender: TObject);
begin
     DateSeparator:='.';
     DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Items[cbYearBeg.ItemIndex]);
     DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Items[cbYearEnd.ItemIndex]);
     ModalResult:=mrYes;
end;

procedure TfrmDocReestr.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

constructor TfrmDocReestr.Create(AOwner: TComponent; DateBeg,
  DateEnd: TDateTime);
var i :Integer;
    date_str:string;
begin
     inherited Create(AOwner);
     self.DateBeg:=DateBeg;
     self.DateEnd:=DateEnd;

     cbMonthBeg.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     dateTimetostring(date_str,'dd.mm.yyyy', Datebeg);
     cbMonthBeg.ItemIndex:=MonthOf(Datebeg)-1;
     for i:=0 to cbYearBeg.Items.Count-1 do
     begin
         if pos(cbYearBeg.Items[i],IntToStr(YearOf(Datebeg)))>0
         then begin
            cbYearBeg.ItemIndex:=i;
            break;
         end;
     end;

     cbMonthEnd.Items.Add(TRIM(BU_Month_01));
     cbMonthEnd.Items.Add(TRIM(BU_Month_02));
     cbMonthEnd.Items.Add(TRIM(BU_Month_03));
     cbMonthEnd.Items.Add(TRIM(BU_Month_04));
     cbMonthEnd.Items.Add(TRIM(BU_Month_05));
     cbMonthEnd.Items.Add(TRIM(BU_Month_06));
     cbMonthEnd.Items.Add(TRIM(BU_Month_07));
     cbMonthEnd.Items.Add(TRIM(BU_Month_08));
     cbMonthEnd.Items.Add(TRIM(BU_Month_09));
     cbMonthEnd.Items.Add(TRIM(BU_Month_10));
     cbMonthEnd.Items.Add(TRIM(BU_Month_11));
     cbMonthEnd.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearEnd.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     dateTimetostring(date_str,'dd.mm.yyyy', Dateend);
     cbMonthEnd.ItemIndex:=MonthOf(Dateend)-1;
     for i:=0 to cbYearEnd.Items.Count-1 do
     begin
         if pos(cbYearEnd.Items[i],IntToStr(YearOf(Dateend)))>0
         then begin
            cbYearEnd.ItemIndex:=i;
            break;
         end;
     end;
end;

procedure TfrmDocReestr.cbMonthBegChange(Sender: TObject);
begin
     cbMonthEnd.ItemIndex:=cbMonthBeg.ItemIndex;
     cbYearEnd.ItemIndex:=cbYearBeg.ItemIndex;

end;

procedure TfrmDocReestr.cbYearBegChange(Sender: TObject);
begin
     cbMonthEnd.ItemIndex:=cbMonthBeg.ItemIndex;
     cbYearEnd.ItemIndex:=cbYearBeg.ItemIndex;
end;

end.
