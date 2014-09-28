unit UCnEditAccounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxMaskEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, ExtCtrls,
  pFibStoredProc, pFIBDataSet;

type
  TfrmEditAcc = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    EdAccNum: TcxTextEdit;
    EdNote: TcxMemo;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    cbYearEnd: TcxComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdAccStatusPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    IS_DONGUET : Integer;
  public
    isEditMode : Boolean;
    DateBeg:TDateTime;
    DateEnd:TDateTime;
    Calc_Mode: Integer;
    cn_end_month : integer;
    function GetDATE_BEG:TDateTime;
  end;

implementation

uses UCnMainAccounts,BaseTypes, Resources_unitb, DateUtils;

{$R *.dfm}

procedure TfrmEditAcc.cxButton1Click(Sender: TObject);
begin
  DateSeparator := '.';
  DateBeg := StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
  DateEnd := StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);
  DateEnd := IncMonth(DateEnd,1) - cn_end_month - IS_DONGUET;//ƒонЌ”Ё“ в договорах периоды оплат по первое число мес€ца а счет делаю по последнее число мес€ца, маразм

 if (DateBeg > DateEnd) then
  begin
   ShowMessage('ƒата початку не може бути меншою за дату зак≥нченн€ пер≥оду.');
   Exit;
  End;

 ModalResult := mrOk;
end;

procedure TfrmEditAcc.cxButton2Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmEditAcc.FormShow(Sender: TObject);
var
 i : Integer;
 DataSet : TpFIBDataSet;
begin
  DataSet:=TpFIBDataSet.Create(self);
  DataSet.Database := TfrmAccountMain(Owner).WorkDatabase;
  DataSet.Transaction := TfrmAccountMain(Owner).ReadTransaction;
  DataSet.Close;
  DataSet.SQLs.SelectSQL.Text := 'select cn_end_month from pub_sys_data';
  DataSet.Open;
  if DataSet['cn_end_month'] <> null
   then cn_end_month := DataSet.FieldByName('cn_end_month').AsInteger
   else cn_end_month := 0;

  DataSet.Close;
  DataSet.SQLs.SelectSQL.Text := 'select IS_DONGUET from CN_INI_PRINT_REPORT';
  DataSet.Open;
  if DataSet['IS_DONGUET'] <> null
   then IS_DONGUET := DataSet.FieldByName('IS_DONGUET').AsInteger
   else IS_DONGUET := 0;

     if not isEditMode
     then begin
               GetDATE_BEG;
     end
     else begin
               if Calc_Mode<>1 then begin
                 cbMonthEnd.Enabled:=false;
                 cbYearEnd.Enabled:=false;
               end;
     end;

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

function TfrmEditAcc.GetDATE_BEG: TDateTime;
var DateBegSP:TpFibStoredProc;
begin
     if not isEditMode
     then begin
               DateBegSP:=TpFibStoredProc.Create(self);
               DateBegSP.Database:=TfrmAccountMain(Owner).WorkDatabase;
               DateBegSP.Transaction:=TfrmAccountMain(Owner).ReadTransaction;
               DateBegSP.StoredProcName:='CN_ACCOUNT_GET_DATE_START';
               DateBegSP.Prepare;
               DateBegSP.ExecProc;
               DateBeg:=DateBegSP.ParamByName('DATE_BEG').Value;
               DateEnd:=IncMonth(DateBeg,1);
               DateBegSP.Close;
               DateBegSP.Free;
     end;

     Result:=Date;
end;

procedure TfrmEditAcc.EdAccStatusPropertiesChange(Sender: TObject);
var i:Integer;
begin
     if not isEditMode
     then begin
                 GetDATE_BEG;

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
end;

end.
