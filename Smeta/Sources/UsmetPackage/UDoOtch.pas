unit UDoOtch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, ComCtrls,
  FIBDatabase, pFIBDatabase, Ibase, cxControls, cxContainer, cxEdit,
  cxTextEdit,pFibDataSet,UDoOtchThread,UDoOtchThreadDB, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxMemo, Placemnt, pFibStoredProc;

type
  TfrmDoOtch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    Panel3: TPanel;
    cxMemo1: TcxMemo;
    Panel4: TPanel;
    Label3: TLabel;
    cbMonthDateFrom: TComboBox;
    cbYearDateFrom: TComboBox;
    Label4: TLabel;
    cbMonthDateTo: TComboBox;
    cbYearDateTo: TComboBox;
    Label6: TLabel;
    CalcProgressBar: TProgressBar;
    FormStorage1: TFormStorage;
    OTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel5: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    procedure OnTerminateCalcThread(Sender:TObject);
    procedure OnTerminateCalcThread_DB(Sender:TObject);
  public
    { Public declarations }
    IT:TCalcThread;
    IT_DB:TCalcThreadDB;
    MBook_Date:TDateTime;
    DateFrom:TDateTime;
    DateTo:TDateTime;
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);overload;
  end;

implementation

uses DB, GlobalSpr, Resources_Unitb, DateUtils, AccMgmt;

{$R *.dfm}
constructor TfrmDoOtch.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);
var SysDS:TpFibDataSet;
    i:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_HANDLE;
     OTransaction.StartTransaction;

     SysDS:=TpFibDataSet.Create(self);
     SysDS.Database:=WorkDatabase;
     SysDS.Transaction:=oTransaction;
     SysDS.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
     SysDS.Open;
     DateFrom    :=StartOfTheYear(SysDS.FieldByName('MAIN_BOOK_DATE').AsDateTime);
     MBook_Date  :=SysDS.FieldByName('MAIN_BOOK_DATE').Value;
     DateTo      :=EndOfTheYear(SysDS.FieldByName('MAIN_BOOK_DATE').Value);
     SysDS.Close;
     SysDS.Free;

     cbMonthDateFrom.Items.Add(TRIM(BU_Month_01));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_02));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_03));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_04));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_05));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_06));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_07));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_08));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_09));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_10));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_11));
     cbMonthDateFrom.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearDateFrom.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthDateFrom.ItemIndex:=MonthOf(DateFrom)-1;
     for i:=0 to cbYearDateFrom.Items.Count-1 do
     begin
         if pos(cbYearDateFrom.Items[i],IntToStr(YearOf(DateFrom)))>0
         then begin
            cbYearDateFrom.ItemIndex:=i;
            break;
         end;
     end;
     {}
     cbMonthDateTo.Items.Add(TRIM(BU_Month_01));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_02));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_03));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_04));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_05));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_06));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_07));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_08));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_09));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_10));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_11));
     cbMonthDateTo.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearDateTo.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthDateTo.ItemIndex:=MonthOf(DateTo)-1;
     for i:=0 to cbYearDateTo.Items.Count-1 do
     begin
         if pos(cbYearDateTo.Items[i],IntToStr(YearOf(DateTo)))>0
         then begin
            cbYearDateTo.ItemIndex:=i;
            break;
         end;
     end;
end;

procedure TfrmDoOtch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmDoOtch.cxButton1Click(Sender: TObject);
var DoSP:TpFibStoredProc;
    GetError:TpFibDataSet;
    Y,M,D:Word;
    I:Integer;
    ErrorKod:Int64;
begin
              Screen.Cursor:=crHourGlass;
              panel5.Visible:=true;
              self.Update;
              Application.ProcessMessages;
              DoSP                :=TpFibStoredProc.Create(nil);
              DoSP.Database       :=WorkDatabase;
              DoSP.Transaction    :=WriteTransaction;

              try
                      WriteTransaction.StartTransaction;
                      DoSP.StoredProcName :='BU_GET_PROV_BY_OTCH';
                      DoSP.Prepare;
                      DoSP.ParamByName('DATE_CALC_FROM').Value:=StrToDate('01.'+IntToStr(cbMonthDateFrom.ItemIndex+1)+'.'+cbYearDateFrom.Items[cbYearDateFrom.ItemIndex]);
                      DecodeDate(StrToDate('01.'+IntToStr(cbMonthDateTo.ItemIndex+1)+'.'+cbYearDateTo.Items[cbYearDateTo.ItemIndex]),Y,M,D);
                      DoSP.ParamByName('DATE_CALC_TO').Value  :=IncMonth(EncodeDate(Y,M,1))-1;
                      DoSP.ParamByName('COMPUTER_NAME').Value :=GlobalSpr.GetComputerNetName;
                      DoSP.ParamByName('ID_USER').Value       :=GetUserId;
                      DoSP.ExecProc;
                      ErrorKod:=DoSP.ParamByName('CUR_WORK_OTCH_SESSION').AsInt64;

                      if (DoSP.ParamByName('RESULT').AsInteger=1)
                      then begin
                               MessageBox(Handle,PChar('Відрахування виконані!'),PChar('Управління бюджетами'),MB_OK or MB_ICONWARNING);
                               WriteTransaction.Commit;
                               cxButton1.Caption:='Почати процес';
                      end
                      else begin
                               MessageBox(Handle,PChar('Під час провоедення документа відрахувань виникли помилки!'),PChar('Управління бюджетами'),MB_OK or MB_ICONERROR);
                               //Забираем ошибки из буффера
                               GetError:=TpFibDataSet.Create(nil);
                               GetError.Database      :=WorkDatabase;
                               GetError.Transaction   :=WriteTransaction;
                               GetError.SelectSQL.Text:='SELECT * FROM BU_GET_OTCH_ERRORS('+IntToStr(ErrorKod)+')';
                               GetError.Open;
                               GetError.FetchAll;
                               for i:=0 to GetError.RecordCount-1 do
                               begin
                                    cxMemo1.Lines.Add(GetError.FieldByName('WARNING_MSG').AsString);
                                    GetError.Next;
                               end;
                               GetError.Close;
                               GetError.Free;
                               WriteTransaction.Commit;
                      end;

              except on E:Exception do
                                    begin
                                         MessageBox(Handle,
                                                    PChar('Під час провоедення документа відрахувань виникли помилки: '+E.Message),
                                                    PChar('Управління бюджетами'),
                                                    MB_OK or MB_ICONERROR);
                                    end;

              end;
              Screen.Cursor:=crDefault;
              panel5.Visible:=false;
              DoSP.Free;
end;

procedure TfrmDoOtch.OnTerminateCalcThread(Sender: TObject);
begin
     cxButton1.Caption:='Почати процес';
end;

procedure TfrmDoOtch.OnTerminateCalcThread_DB(Sender: TObject);
begin
     if Assigned(IT)
     then IT.Terminate;
end;


procedure TfrmDoOtch.cxButton2Click(Sender: TObject);
begin
     Close;
end;

end.
