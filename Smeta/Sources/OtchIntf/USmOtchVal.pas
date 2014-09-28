unit USmOtchVal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, StdCtrls, cxLookAndFeelPainters, cxButtons, cxCalc;

type
  TfrmGetOtchislVal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    cbYearEnd: TcxComboBox;
    Label3: TLabel;
    cxCalcEdit1: TcxCalcEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    LocMinDate:TDateTime;
    LocMaxDate:TDateTime;
  public
    { Public declarations }
    DateBeg:TDateTime;
    DateEnd:TDateTime;
    function CheckData:Boolean;
    constructor Create(Aowner:TComponent;MinDate,MaxDate:TDateTime;DateBegIn,DateEndIn:TDateTime);reintroduce;
  end;

implementation

{$R *.dfm}

uses Resources_unitb,BaseTypes,GlobalSpr,DateUtils;

function TfrmGetOtchislVal.CheckData: Boolean;
var res:Boolean;
begin
     res:=True;
     DateSeparator:='.';
     DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
     DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);
     DateEnd:=IncMonth(DateEnd,1)-1;

     if ((not (Datebeg<=LocMaxDate)
      or (not (Datebeg>=LocMinDate))
     and Res))
     then begin
               agMessageDlg('Увага!','Період відрахувань виходить за періоди функціонування бюджетів!',mtError,[mbOk]);
               res:=false;
     end;

     if ((not (Dateend<=LocMaxDate)
      or (not (Dateend>=LocMinDate))
     and Res))
     then begin
               agMessageDlg('Увага!','Період відрахувань виходить за періоди функціонування бюджетів!',mtError,[mbOk]);
               res:=false;
     end;


     result:=res;
end;

constructor TfrmGetOtchislVal.Create(Aowner: TComponent; MinDate,
  MaxDate: TDateTime;DateBegIn,DateEndIn:TDateTime);
var I:Integer;
begin
     inherited Create(Aowner);
     LocMinDate:=MinDate;
     LocMaxDate:=MaxDate;


     DateBeg:=DateBegIn;
     DateEnd:=DateEndIn;

     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearBeg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthBeg.ItemIndex:=MonthOf(DateBeg)-1;
     for i:=0 to cbYearBeg.Properties.Items.Count-1 do
     begin
         if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(DateBeg)))>0
         then begin
            cbYearBeg.ItemIndex:=i;
            break;
         end;
     end;

     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_01));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_02));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_03));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_04));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_05));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_06));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_07));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_08));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_09));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_10));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_11));
     cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearEnd.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthEnd.ItemIndex:=MonthOf(DateEnd)-1;
     for i:=0 to cbYearEnd.Properties.Items.Count-1 do
     begin
         if pos(cbYearEnd.Properties.Items[i],IntToStr(YearOf(DateEnd)))>0
         then begin
                   cbYearEnd.ItemIndex:=i;
                   break;
         end;
     end;

end;

procedure TfrmGetOtchislVal.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then ModalResult:=mrYes
     else ShowMessage('Не коректна інформація по проценту нарахування!');
end;

procedure TfrmGetOtchislVal.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
