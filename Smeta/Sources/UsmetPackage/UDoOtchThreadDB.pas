unit UDoOtchThreadDB;

interface

uses
  Classes, Forms,pFibDataSet,cxTextEdit,ComCtrls,pFibStoredProc,Windows;

type
  TCalcThreadDB = class(TThread)
  private
    { Private declarations }
    CurDate : TDateTime;
    Form:TForm;
    PBStep:Integer;
    PB:TProgressBar;
    MemoString:String;
  protected
    procedure Execute; override;
    procedure UpdateMemo;
    procedure ClearMemo;
  public
    constructor Create(CreateSuspended: Boolean; Form:TForm);overload;
  end;

implementation

uses UDoOtch,DateUtils,SysUtils,GlobalSpr, FIBDataSet;


procedure TCalcThreadDB.ClearMemo;
begin
     TfrmDoOtch(self.Form).cxMemo1.Lines.Clear;
     TfrmDoOtch(self.Form).cxMemo1.Clear;
end;

constructor TCalcThreadDB.Create(CreateSuspended: Boolean; Form:TForm);
begin
    inherited Create(true);
    self.Form:=Form;
    PB:=TfrmDoOtch(self.Form).CalcProgressBar;
    CurDate:=TfrmDoOtch(self.Form).MBook_Date;
end;


procedure TCalcThreadDB.Execute;
var DoSP:TpFibStoredProc;
    GetError:TpFibDataSet;
    Y,M,D:Word;
    I:Integer;
    ErrorKod:Int64;
begin
              //Synchronize(ClearMemo);
              DoSP                :=TpFibStoredProc.Create(nil);
              DoSP.Database       :=TfrmDoOtch(self.Form).WorkDatabase;
              DoSP.Transaction    :=TfrmDoOtch(self.Form).WriteTransaction;

              try
                      TfrmDoOtch(self.Form).WriteTransaction.StartTransaction;
                      DoSP.StoredProcName :='BU_GET_PROV_BY_OTCH';
                      DoSP.Prepare;
                      DoSP.ParamByName('DATE_CALC_FROM').Value:=StrToDate('01.'+IntToStr(TfrmDoOtch(self.Form).cbMonthDateFrom.ItemIndex+1)+'.'+TfrmDoOtch(self.Form).cbYearDateFrom.Items[TfrmDoOtch(self.Form).cbYearDateFrom.ItemIndex]);
                      DecodeDate(StrToDate('01.'+IntToStr(TfrmDoOtch(self.Form).cbMonthDateTo.ItemIndex+1)+'.'+TfrmDoOtch(self.Form).cbYearDateTo.Items[TfrmDoOtch(self.Form).cbYearDateTo.ItemIndex]),Y,M,D);
                      DoSP.ParamByName('DATE_CALC_TO').Value  :=IncMonth(EncodeDate(Y,M,1))-1;
                      DoSP.ParamByName('COMPUTER_NAME').Value :=GlobalSpr.GetComputerNetName;
                      DoSP.ParamByName('ID_USER').Value       :=458;
                      DoSP.ExecProc;
                      ErrorKod:=DoSP.ParamByName('CUR_WORK_OTCH_SESSION').AsInt64;

                      if (DoSP.ParamByName('RESULT').AsInteger=1)
                      then begin
                               if Assigned(TfrmDoOtch(self.Form).IT)
                               then begin
                                    TfrmDoOtch(self.Form).IT.Terminate;
                               end;


                               MessageBox(form.Handle,PChar('Отчисления осуществлены.'),PChar('Управление бюджетами'),MB_OK or MB_ICONWARNING);
                               TfrmDoOtch(self.Form).WriteTransaction.Commit;
                               TfrmDoOtch(self.Form).cxButton1.Caption:='Почати процес';

                      end
                      else begin
                               if Assigned(TfrmDoOtch(self.Form).IT)
                               then begin
                                         TfrmDoOtch(self.Form).IT.Terminate;
                               end;

                               MessageBox(form.Handle,PChar('При проведении документов возникли ошибки! '),PChar('Управление бюджетами'),MB_OK or MB_ICONERROR);

                               //Забираем ошибки из буффера
                               GetError:=TpFibDataSet.Create(nil);
                               GetError.Database      :=TfrmDoOtch(self.Form).WorkDatabase;
                               GetError.Transaction   :=TfrmDoOtch(self.Form).WriteTransaction;

                               GetError.SelectSQL.Text:='SELECT * FROM BU_GET_OTCH_ERRORS('+IntToStr(ErrorKod)+')';
                               GetError.Open;
                               GetError.FetchAll;
                               for i:=0 to GetError.RecordCount-1 do
                               begin
                                    MemoString:=GetError.FieldByName('WARNING_MSG').AsString;
                                    Synchronize(UpdateMemo);
                                    GetError.Next;
                               end;
                               GetError.Close;
                               GetError.Free;

                               TfrmDoOtch(self.Form).WriteTransaction.Commit;
                      end;

              except on E:Exception do
                                    begin
                                         MessageBox(form.Handle,
                                                    PChar('При проведении документов возникли ошибки: '+E.Message),
                                                    PChar('Управление бюджетами'),
                                                    MB_OK or MB_ICONERROR);
                                    end;

              end;
              DoSP.Free;
end;

procedure TCalcThreadDB.UpdateMemo;
begin
     TfrmDoOtch(self.Form).cxMemo1.Lines.Add(MemoString);
end;

end.
