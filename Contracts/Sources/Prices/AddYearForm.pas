unit AddYearForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmGetYear = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cbMonthBeg: TComboBox;
    cbMonthEnd: TComboBox;
    cbYearEnd: TComboBox;
    cbYearBeg: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBegOut:TDateTime;
    DateEndOut:TDateTime;
    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime);reintroduce;
  end;


implementation

uses  Resources_unitb, GlobalSpr, DateUtils;

{$R *.dfm}

constructor TfrmGetYear.Create(AOwner: TComponent; DateBeg,DateEnd: TDateTime);
var i:Integer;
begin
       inherited Create(AOwner);
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
          cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
          cbYearEnd.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;

       cbMonthbeg.ItemIndex:=MonthOf(datebeg)-1;
       for i:=0 to cbYearBeg.Items.Count-1 do
       begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(datebeg)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
       end;
       cbMonthend.ItemIndex:=MonthOf(dateend)-1;
       for i:=0 to cbYearend.Items.Count-1 do
       begin
           if pos(cbYearend.Items[i],IntToStr(YearOf(dateend)))>0
           then begin
              cbYearend.ItemIndex:=i;
              break;
           end;
       end;
       Self.DateBegOut:=DateBeg;
       Self.DateEndOut:=DateEnd;
end;

procedure TfrmGetYear.cxButton1Click(Sender: TObject);
begin
     DateSeparator:='.';
     datebegout:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Items[cbYearbeg.ItemIndex]);

     if(cbMonthend.ItemIndex+1<=11)
     then begin
               dateendout:=StrToDate('01.'+IntToStr(cbMonthend.ItemIndex+2)+'.'+cbYearend.Items[cbYearend.ItemIndex]);
               dateendout:=dateendout-1;
     end
     else begin
               dateendout:=StrToDate('01.01.'+cbYearend.Items[cbYearend.ItemIndex+1]);
               dateendout:=dateendout-1;
     end;

     if  (datebegout<=dateendout)
     then ModalResult:=mrYes
     else begin
               MessageBox(handle,Pchar('Некоректні данні'),Pchar(BU_ErrorCaption), MB_OK or MB_ICONWARNING);
     end;
end;

procedure TfrmGetYear.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
