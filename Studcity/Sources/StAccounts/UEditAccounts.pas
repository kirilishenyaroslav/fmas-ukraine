unit UEditAccounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxMaskEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, ExtCtrls,
  pFibStoredProc;

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
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    cbMonthEnd: TComboBox;
    cbYearEnd: TComboBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdAccStatusPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    isEditMode:Boolean;
    DateBeg:TDateTime;
    DateEnd:TDateTime;
    st_end_month : Integer;
    { Public declarations }
    function GetDATE_BEG:TDateTime;
  end;

implementation

uses UMainAccounts,BaseTypes, Resources_unitb, DateUtils;

{$R *.dfm}

procedure TfrmEditAcc.cxButton1Click(Sender: TObject);
 var InsertSP:TpFibStoredProc;
     ID_ACC:Integer;
begin
      DateSeparator:='.';
      DateBeg := StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Items[cbYearBeg.ItemIndex]);
      DateEnd := StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Items[cbYearEnd.ItemIndex]);
      DateEnd := IncMonth(DateEnd, 1);
      //проверка на включение последнего дня расчетного периода
      if st_end_month = 1
       then DateEnd := DateEnd - 1;

      if (DateBeg<DateEnd)
      then begin
                if isEditMode
                then begin
                          InsertSP:=TpFibStoredProc.Create(self);
                          InsertSP.Database:=TfrmAccountMain(Owner).WorkDatabase;
                          InsertSP.Transaction:=TfrmAccountMain(Owner).WriteTransaction;
                          TfrmAccountMain(Owner).WriteTransaction.StartTransaction;
                          InsertSP.StoredProcName:='ST_DT_ACCOUNTS_UPDATE';
                          InsertSP.Prepare;
                          ID_ACC:=TfrmAccountMain(Owner).AccDataSet.FieldByName('ID_ACCOUNT').Value;
                          InsertSP.ParamByName('ID_ACCOUNT').Value:=TfrmAccountMain(Owner).AccDataSet.FieldByName('ID_ACCOUNT').Value;
                          InsertSP.ParamByName('DATE_BEG').Value :=DateBeg;
                          InsertSP.ParamByName('DATE_END').Value :=DateEnd;
                          InsertSP.ParamByName('NOTE').Value     :=EdNote.Text;
                          InsertSP.ExecProc;
                          TfrmAccountMain(Owner).WriteTransaction.Commit;
                          TfrmAccountMain(Owner).AccDataSet.CloseOpen(true);
                          TfrmAccountMain(Owner).AccDataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
                end
                else begin
                          EdNote.Text:='Рахунок  за період '+DateToStr(DateBeg)+'-'+DateToStr(DateEnd)+' '+EdNote.Text;
                          InsertSP:=TpFibStoredProc.Create(self);
                          InsertSP.Database:=TfrmAccountMain(Owner).WorkDatabase;
                          InsertSP.Transaction:=TfrmAccountMain(Owner).WriteTransaction;
                          TfrmAccountMain(Owner).WriteTransaction.StartTransaction;
                          InsertSP.StoredProcName:='ST_DT_ACCOUNTS_INSERT';
                          InsertSP.Prepare;
                          InsertSP.ParamByName('DATE_BEG').Value   := DateBeg;
                          InsertSP.ParamByName('DATE_END').Value   := DateEnd;
                          InsertSP.ParamByName('NOTE').Value       := EdNote.Text;
                          InsertSP.ParamByName('is_account').Value := 1;
                          InsertSP.ExecProc;
                          ID_ACC:=InsertSP.ParamByName('ID_ACCOUNT').Value;
                          TfrmAccountMain(Owner).WriteTransaction.Commit;
                          TfrmAccountMain(Owner).AccDataSet.CloseOpen(true);
                          TfrmAccountMain(Owner).AccDataSet.Locate('ID_ACCOUNT',ID_ACC,[]);
                end;
                ModalResult:=mrYes;
      end
      else ShowMessage('Дата початку не може бути меншою за дату закінчення періоду.');
end;

procedure TfrmEditAcc.cxButton2Click(Sender: TObject);
begin
      ModalResult:=mrNo;
end;

procedure TfrmEditAcc.FormShow(Sender: TObject);
var i:Integer;
begin
     if not isEditMode
     then begin
               GetDATE_BEG;
     end
     else begin
               //cbMonthEnd.Enabled:=false;
               //cbYearEnd.Enabled:=false;
     end;

     cbMonthBeg.Items.Clear;

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

     cbMonthEnd.Items.Clear;

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


     for i:=0 to 25 do
     begin
          cbYearBeg.Items.Add(TRIM(IntToStr(2000+i)));
     end;

     for i:=0 to 25 do
     begin
          cbYearEnd.Items.Add(TRIM(IntToStr(2000+i)));
     end;

     cbMonthBeg.ItemIndex:=MonthOf(DateBeg)-1;
     for i:=0 to cbYearBeg.Items.Count-1 do
     begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(DateBeg)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
     end;

     cbMonthEnd.ItemIndex:=MonthOf(DateBeg)-1;
     for i:=0 to cbYearEnd.Items.Count-1 do
     begin
           if pos(cbYearEnd.Items[i],IntToStr(YearOf(DateBeg)))>0
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
               DateBegSP.StoredProcName:='ST_ACCOUNT_GET_DATE_START';
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

                 cbMonthBeg.Items.Clear;

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

                 cbMonthEnd.Items.Clear;

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


                 for i:=0 to 25 do
                 begin
                      cbYearBeg.Items.Add(TRIM(IntToStr(2000+i)));
                 end;

                 for i:=0 to 25 do
                 begin
                      cbYearEnd.Items.Add(TRIM(IntToStr(2000+i)));
                 end;

                 cbMonthBeg.ItemIndex:=MonthOf(DateBeg)-1;
                 for i:=0 to cbYearBeg.Items.Count-1 do
                 begin
                       if pos(cbYearBeg.Items[i],IntToStr(YearOf(DateBeg)))>0
                       then begin
                          cbYearBeg.ItemIndex:=i;
                          break;
                       end;
                 end;

                 cbMonthEnd.ItemIndex:=MonthOf(DateBeg)-1;
                 for i:=0 to cbYearEnd.Items.Count-1 do
                 begin
                       if pos(cbYearEnd.Items[i],IntToStr(YearOf(DateBeg)))>0
                       then begin
                          cbYearEnd.ItemIndex:=i;
                          break;
                       end;
                 end;
     end;
end;

end.
