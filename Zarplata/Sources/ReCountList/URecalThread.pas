unit URecalThread;

interface

uses
    Classes, ReCountListUnit, cxContainer, cxProgressBar, ZProc,pFibDataSet, dxStatusBar,
    Variants, zMessages, Dialogs, cxmemo ;

type
  TRecalcThread = class(TThread)
  private
    { Private declarations }
    FForm:TReCountListForm;
    FProgressBar:TcxProgressBar;
    FProgressbarPosition:Integer;
    FStatusPanel:TdxStatusBarPanel;
    FErrorLog:TcxMemo;
    FStatusPanelText:string;
    FErrorLogString:string;
    procedure UpdateProgressBar;
    procedure UpdateStatusPanelText;
    procedure UpdateErrorLog;
    procedure ClearErrorLog;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended:Boolean;Form:TReCountListForm); reintroduce;
  end;

implementation

uses SysUtils, FIBDataSet;

{ TRecalThread }

constructor TRecalcThread.Create(CreateSuspended: Boolean; Form: TReCountListForm);
begin
     inherited Create(true);
     FForm:=Form;
     FProgressBar:=Form.ProgressBar;
     FErrorLog   :=Form.cxMemo1;
     FStatusPanel:=Form.StatusBar.Panels[0];
end;

procedure TRecalcThread.Execute;
var GetListForcalc:TpFibDataSet;
    I:Integer;
begin
  Synchronize(ClearErrorLog);
  if(ZProc.SetBeginAction(FForm.MainDataBase.Handle,1))then
  begin
    FForm.WriteTransaction.StartTransaction;

    GetListForcalc            :=TpFibDataSet.Create(nil);
    GetListForcalc.Database   :=FForm.ListDataSet.Database;
    GetListForcalc.Transaction:=FForm.ListDataSet.Transaction;
    GetListForcalc.SelectSQL.Text:='SELECT * FROM Z_RE_COUNT_LIST_SELECT_EX ORDER BY TN ASC';
    GetListForcalc.Open;
    FProgressBar.Properties.Max:=GetListForcalc.RecordCountFromSrv;
    GetListForcalc.FetchAll;
    GetListForcalc.First;
    FProgressbarPosition:=0;

    for i:=1 to GetListForcalc.RecordCount do
    begin
      FStatusPanelText:='ТН:'+VarToStr(GetListForcalc['TN']);
      Synchronize(UpdateStatusPanelText);
      FForm.RecountProc.ParamByName('ID_MAN').Value :=GetListForcalc['ID_MAN'];
      try
        FForm.RecountProc.ExecProc;
        except on E:Exception do
        begin
          if FForm.WriteTransaction.InTransaction then FForm.WriteTransaction.Rollback;
          FErrorLogString:='Помилка при роботі з '+FStatusPanelText+' '+Trim(E.Message);
          StringReplace(FErrorLogString,#10#13,' ', [rfReplaceAll, rfIgnoreCase]);
          Synchronize(UpdateErrorLog);
          FForm.SelectBtn.Enabled:=True;
          Break;
        end;
      end;


      GetListForcalc.Next;

      FProgressbarPosition:=FProgressbarPosition+1;
      Synchronize(UpdateProgressBar);
    end;

    if FForm.WriteTransaction.InTransaction then FForm.WriteTransaction.Commit;
    GetListForcalc.Close;
    GetListForcalc.Free;

    ZProc.SetEndAction(FForm.MainDataBase.Handle,'T');
  end;
end;


procedure TRecalcThread.UpdateProgressBar;
begin
     FProgressBar.Position:=FProgressbarPosition;
     FProgressBar.Update;
end;

procedure TRecalcThread.UpdateStatusPanelText;
begin
     FStatusPanel.Text:=FStatusPanelText;
end;

procedure TRecalcThread.UpdateErrorLog;
begin
     FErrorLog.Lines.Add(FErrorLogString);
end;

procedure TRecalcThread.ClearErrorLog;
begin
     FErrorLog.Lines.Clear;
     FErrorLog.Clear;
end;

end.
