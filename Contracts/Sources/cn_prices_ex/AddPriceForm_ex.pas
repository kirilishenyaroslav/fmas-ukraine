unit AddPriceForm_ex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxTextEdit, StdCtrls, cxButtons, ExtCtrls, ActnList, cxMaskEdit,
  cxDropDownEdit, cn_common_funcs, cnConsts, cnConsts_Messages;

type
  TfrmGetPriceInfo = class(TForm)
    Panel2: TPanel;
    BegLabel: TLabel;
    EndLabel: TLabel;
    Panel1: TPanel;
    NameLabel: TLabel;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    cbYearEnd: TcxComboBox;
    Name_price: TcxTextEdit;
    ActionList1: TActionList;
    Ok_act: TAction;
    Cancel_act: TAction;
    Ok_button: TcxButton;
    Cancel_button: TcxButton;
    procedure Ok_actExecute(Sender: TObject);
    procedure Cancel_actExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBegOut:TDateTime;
    DateEndOut:TDateTime;
    PLanguageIndex:integer;    
    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime);reintroduce;
  end;

implementation

uses Resources_unitb, GlobalSpr, DateUtils;

{$R *.dfm}

constructor TfrmGetPriceInfo.Create(AOwner: TComponent; DateBeg,DateEnd: TDateTime);
var i:Integer;
begin
  inherited Create(AOwner);
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
    cbYearBeg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
    cbYearEnd.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
   end;

  cbMonthbeg.ItemIndex:=MonthOf(datebeg)-1;
  for i:=0 to cbYearBeg.Properties.Items.Count-1 do
   begin
    if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(datebeg)))>0 then
     begin
      cbYearBeg.ItemIndex:=i;
      break;
     end;
   end;
  cbMonthend.ItemIndex:=MonthOf(dateend)-1;
  for i:=0 to cbYearend.Properties.Items.Count-1 do
   begin
    if pos(cbYearend.Properties.Items[i],IntToStr(YearOf(dateend)))>0 then
     begin
      cbYearend.ItemIndex:=i;
      break;
     end;
   end;
  Self.DateBegOut:=DateBeg;
  Self.DateEndOut:=DateEnd;
end;

procedure TfrmGetPriceInfo.Ok_actExecute(Sender: TObject);
begin
  DateSeparator:='.';
  datebegout:=StrToDate('01.'+IntToStr(cbMonthbeg.ItemIndex+1)+'.'+cbYearbeg.Properties.Items[cbYearbeg.ItemIndex]);

  if(cbMonthend.ItemIndex+1<=11) then
   begin
    dateendout:=StrToDate('01.'+IntToStr(cbMonthend.ItemIndex+2)+'.'+cbYearend.Properties.Items[cbYearend.ItemIndex]);
    dateendout:=dateendout-1;
   end
  else
   begin
    dateendout:=StrToDate('01.01.'+cbYearend.Properties.Items[cbYearend.ItemIndex+1]);
    dateendout:=dateendout-1;
   end;

  if Name_price.Text='' then
   Begin
      ShowMessage(cn_Name_Need[PLanguageIndex]);
    exit;
   End;
   
  if  (datebegout>dateendout) then
   begin
    MessageBox(handle,Pchar('Некоректні данні'),Pchar(BU_ErrorCaption), MB_OK or MB_ICONWARNING);
    exit;
   end;

  ModalResult:=mrOk;
end;

procedure TfrmGetPriceInfo.Cancel_actExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmGetPriceInfo.FormCreate(Sender: TObject);
begin
  PLanguageIndex        := cn_Common_Funcs.cnLanguageIndex;
  Caption               := cn_InsertBtn_Caption[PLanguageIndex]+'...';
  NameLabel.Caption     := cn_Name_Column[PLanguageIndex];
  BegLabel.Caption      := cn_BegDate_Short[PLanguageIndex];
  EndLabel.Caption      := cn_EndDate_Short[PLanguageIndex];
  Ok_Button.Caption      := cn_Accept[PLanguageIndex];
  Ok_Button.Hint         := cn_Accept[PLanguageIndex];
  Cancel_Button.Caption  := cn_cancel[PLanguageIndex];
  Cancel_Button.Hint     := cn_cancel[PLanguageIndex];
end;

end.
