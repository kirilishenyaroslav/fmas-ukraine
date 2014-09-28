unit uEditSchProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls,uMain_Book_Ini, Resources_unit;

type
  TfrmSetPeriod = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    cbMonthEnd: TComboBox;
    cbYearEnd: TComboBox;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Curr_Date:TDateTime;
    date_beg:TdateTime;
    date_end:TdateTime;
    max_date:Tdatetime;
    { Public declarations }
  end;


implementation
uses DateUtils,uSchProperties;

{$R *.dfm}

procedure TfrmSetPeriod.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
     Resize:=false;
end;

procedure TfrmSetPeriod.Button1Click(Sender: TObject);
begin

     DateSeparator:='.';
     date_beg:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Items[cbYearbeg.ItemIndex]);

     if (cbMonthend.ItemIndex+1<=11)
     then begin
          date_end:=StrToDate('01.'+IntToStr(cbMonthend.ItemIndex+2)+'.'+cbYearend.Items[cbYearend.ItemIndex]);
          date_end:=date_end-1;
     end
     else begin
          date_end:=StrToDate('01.01.'+cbYearend.Items[cbYearend.ItemIndex+1]);
          date_end:=date_end-1;
     end;


     if date_beg<=date_end then ModalResult:=mrYes
                           else MessageBox(handle,Pchar(BU_MinDateError),Pchar(BU_ErrorCaption), MB_OK or MB_ICONWARNING);
end;

procedure TfrmSetPeriod.Button2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmSetPeriod.FormShow(Sender: TObject);
var i:Integer;
begin
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


       cbMonthbeg.ItemIndex:=MonthOf(Curr_Date)-1;
       cbMonthend.ItemIndex:=cbMonthbeg.ItemIndex;
       for i:=0 to cbYearBeg.Items.Count-1 do
       begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(Curr_Date)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              cbYearEnd.ItemIndex:=i;
              break;
           end;
       end;

end;

end.
