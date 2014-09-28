unit UGetWorkDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmGetWorkdate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    ActualDate:TDateTime;
    constructor Create(AOwner:TComponent;ActualDate:TDateTime);overload;
    { Public declarations }
  end;

implementation

uses GlobalSpr, Resources_unitb, DateUtils;
{$R *.dfm}

{ TfrmGetWorkdate }

constructor TfrmGetWorkdate.Create(AOwner: TComponent; ActualDate: TDateTime);
var i:Integer;
    date_str:String;
begin
     inherited Create(AOwner);
     self.ActualDate:=ActualDate;

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

     dateTimetostring(date_str,'dd.mm.yyyy', ActualDate);
     cbMonthBeg.ItemIndex:=MonthOf(ActualDate)-1;
     for i:=0 to cbYearBeg.Items.Count-1 do
     begin
         if pos(cbYearBeg.Items[i],IntToStr(YearOf(ActualDate)))>0
         then begin
            cbYearBeg.ItemIndex:=i;
            break;
         end;
     end;
end;

procedure TfrmGetWorkdate.cxButton1Click(Sender: TObject);
begin
     DateSeparator:='.';
     ActualDate:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Items[cbYearBeg.ItemIndex]);
     ModalResult:=mrYes;
end;

end.
