unit UDoRecalcThread;

interface

uses
  Classes, Forms,pFibDataSet,cxTextEdit,ComCtrls,pFibStoredProc,Windows;

type
  TSmRecalcThread = class(TThread)
  private
    { Private declarations }
    CurDate : TDateTime;
    Form:TForm;
    PBStep:Integer;
    PB:TProgressBar;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean; Form:TForm);overload;
  end;

implementation

uses UDoSmRecalc, DateUtils,SysUtils,GlobalSpr;


constructor TSmRecalcThread.Create(CreateSuspended: Boolean; Form:TForm);
begin
    inherited Create(true);
    self.Form:=Form;
    PB:=TfrmBURecalc(self.Form).CalcProgressBar;
    CurDate:=TfrmBURecalc(self.Form).MBook_Date;
end;


procedure TSmRecalcThread.Execute;
var DoSP:TpFibStoredProc;
    Y,M,D:Word;
begin
    DoSP:=TpFibStoredProc.Create(nil);
    DoSP.Database   :=TfrmBURecalc(self.Form).WorkDatabase;
    DoSP.Transaction:=TfrmBURecalc(self.Form).WriteTransaction;

    //Блокируем все операции по бухучету
    {TfrmBURecalc(self.Form).WriteTransaction.StartTransaction;
    DoSP.StoredProcName:='MBOOK_BLOCK';
    DoSP.Prepare;
    DoSP.ExecProc;
    TfrmBURecalc(self.Form).WriteTransaction.Commit;}

    //Осуществляем пересчет
    TfrmBURecalc(self.Form).WriteTransaction.StartTransaction;
    DoSP.StoredProcName:='BU_RECALC_SM_VALUES';
    DoSP.Prepare;
    DoSP.ParamByName('DATE_BEG').Value:=StrToDate('01.'+IntToStr(TfrmBURecalc(self.Form).cbMonthDateFrom.ItemIndex+1)+'.'+TfrmBURecalc(self.Form).cbYearDateFrom.Items[TfrmBURecalc(self.Form).cbYearDateFrom.ItemIndex]);
    DecodeDate(StrToDate('01.'+IntToStr(TfrmBURecalc(self.Form).cbMonthDateTo.ItemIndex+1)+'.'+TfrmBURecalc(self.Form).cbYearDateTo.Items[TfrmBURecalc(self.Form).cbYearDateTo.ItemIndex]),Y,M,D);
    DoSP.ParamByName('DATE_END').Value:=IncMonth(EncodeDate(Y,M,1))-1;
    DoSP.ExecProc;
    TfrmBURecalc(self.Form).WriteTransaction.Commit;

    //Разблокируем все операции по бухучету
    {TfrmBURecalc(self.Form).WriteTransaction.StartTransaction;
    DoSP.StoredProcName:='MBOOK_UNBLOCK';
    DoSP.Prepare;
    DoSP.ExecProc;
    TfrmBURecalc(self.Form).WriteTransaction.Commit;}

    TfrmBURecalc(self.Form).cxButton1.Caption:='Почати процес';
    DoSP.Free;
end;

end.

