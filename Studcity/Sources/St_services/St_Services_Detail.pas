unit St_Services_Detail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Ibase,
  cxButtonEdit;

type
  TfrmServiceDetail = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbYearEnd: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    Label4: TLabel;
    Label3: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    dbhandle:Tisc_db_handle;
  public
    { Public declarations }
    DateBeg:TDateTime;
    DateEnd:TDateTime;
    ID_RAZD_ST:Integer;
    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime;DbHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

uses BaseTypes, Resources_unitb, DateUtils, GlobalSpr;

constructor TfrmServiceDetail.Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime;DbHandle:TISC_DB_HANDLE);
var i:Integer;
begin
     inherited Create(AOwner);

     cbMonthBeg.Properties.Items.Clear;

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

     cbMonthEnd.Properties.Items.Clear;

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

     for i:=0 to 25 do
     begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(2000+i)));
     end;

     for i:=0 to 25 do
     begin
          cbYearEnd.Properties.Items.Add(TRIM(IntToStr(2000+i)));
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

     cbMonthEnd.ItemIndex:=MonthOf(DateBeg)-1;
     for i:=0 to cbYearEnd.Properties.Items.Count-1 do
     begin
           if pos(cbYearEnd.Properties.Items[i],IntToStr(YearOf(DateBeg)))>0
           then begin
              cbYearEnd.ItemIndex:=i;
              break;
           end;
     end;
end;

procedure TfrmServiceDetail.cxButton1Click(Sender: TObject);
begin
     DateSeparator := '.';
     DateBeg := StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
     DateEnd := StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);
     DateEnd := IncMonth(DateEnd,1) - 1;

     if (DateBeg > DateEnd)
     then begin
               ShowMessage('Дата початку не може бути меншою за дату закінчення періоду.');
               Exit;
     End;

     ModalResult:=mrYes;
end;

procedure TfrmServiceDetail.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmServiceDetail.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var Res:Variant;
begin
     Res:=GlobalSpr.GetRazdStSpr(self,dbhandle,fsNormal,date,1,allEnable,cmSt);
end;

end.
