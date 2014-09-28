unit st_Sprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxControls, cxContainer, cxEdit,
  cxProgressBar, StdCtrls, cxButtons, ExtCtrls, DB, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, st_ConstUnit, St_Proc, cxGroupBox,
  pFibDataBase,IB;

type
  TfrmSprav = class(TForm)
    Image: TImage;
    ProgressBar: TcxProgressBar;
    DataSet: TpFIBDataSet;
    WriteProc: TpFIBStoredProc;
    Timer1: TTimer;
    countLabel: TLabel;
    cxGroupBox1: TcxGroupBox;
    CloseButton: TcxButton;
    Result_Button: TcxButton;
    MemoError: TMemo;
    procedure CloseButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Result_ButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SyncShowMessage(ErrorMsg:String);
  private
    PLanguageIndex: byte;
  public
    ErrorMsg:String;
    { Public declarations }
  end;
    ReportTHerited = class (TThread)
      DataBase:TpFIBDatabase;
      Transaction:TpFIBTransaction;
      bar:TcxProgressBar;
      pos:Integer;
      DataSet:TpFIBDataSet;
      BRes,BCANCEL:TcxButton;
      WriteProc:TpFIBStoredProc;
      cLabel :TLabel;
      temp:String;
      MemoErr:TMemo;
      Constructor Create (InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;inDataSet:TpFIBDataSet;
                          prog:TcxProgressBar;InRes,InBCANCEL:TcxButton;InWriteProc:TpFIBStoredProc; InLabel : TLabel;InMemoErr:TMemo);
      procedure Execute;override;
      destructor Destroy;override;
      procedure UpdateBar;
      procedure UpdateLog;
    end;
var
  frmSprav: TfrmSprav;

implementation

uses Math,st_ReportShow, DataModule1_Unit;

{$R *.dfm}
Constructor ReportTHerited.Create (InDataBase:TpFIBDatabase;InTransaction:TpFIBTransaction;inDataSet:TpFIBDataSet;
                    prog:TcxProgressBar;InRes,InBCANCEL:TcxButton;InWriteProc:TpFIBStoredProc;InLabel : TLabel;InMemoErr:TMemo);
begin
  inherited Create(False);
  DataBase:=InDataBase;
  Transaction:=InTransaction;
  bar:=prog;
  BRes:=InRes;
  BCANCEL:=InBCANCEL;
  DataSet:=inDataSet;
  WriteProc:=InWriteProc;
  cLabel := InLabel;
  MemoErr:=InMemoErr;
end;

procedure ReportTHerited.Execute;
var
  i:Integer;
begin
   DataSet.Open;
   DataSet.FetchAll;
   DataSet.First;
   bar.Properties.Max := DataSet.RecordCount;
   cLabel.Caption := inttostr(DataSet.RecordCount);

     WriteProc.StoredProcName := 'ST_SPRAV_BY_SMET_TMP_DELETE';
     WriteProc.Transaction.StartTransaction;
     WriteProc.Prepare;
     WriteProc.ExecProc;
     WriteProc.Transaction.Commit;
     WriteProc.Close;

  for i := 0 to DataSet.RecordCount-1  do
   begin
     WriteProc.StoredProcName := 'ST_SPRAV_BY_SMET';
     WriteProc.Transaction.StartTransaction;
     WriteProc.Prepare;
     WriteProc.ParamByName('ID_KOD').AsInt64:= DataSet['ID_KOD'];
     WriteProc.ExecProc;
     try
      WriteProc.Transaction.Commit;
      Synchronize(UpdateBar);
      DataSet.Next;
      WriteProc.Close;
     except
//      begin
//        on E: Exception do begin
//          temp:='Error';
//          Synchronize(UpdateLog);
          WriteProc.Transaction.Rollback;
          WriteProc.Close;
          screen.Cursor := crDefault;
          raise;
          exit;
//          end;
     end;
   end;
   BCANCEL.Enabled := true;
   BRes.Enabled:= true;
//   showmessage(pchar(st_ConstUnit.st_GoodFormuv[PLanguageIndex]));
end;

procedure ReportTHerited.UpdateBar;
begin
  bar.Position := bar.Position +1;
  bar.Refresh;
end;

procedure ReportTHerited.UpdateLog;
begin
  MemoErr.Lines.Add(temp);
end;

destructor ReportTHerited.Destroy;
begin
  Inherited destroy;
end;

procedure TfrmSprav.CloseButtonClick(Sender: TObject);
begin
ModalResult:= mrOk;
Screen.Cursor := crDefault;
end;

procedure TfrmSprav.SyncShowMessage(ErrorMsg:String);
begin
  Showmessage(ErrorMsg);
end;

procedure TfrmSprav.Timer1Timer(Sender: TObject);
var
i: integer;
Report:ReportTHerited;
begin
 PLanguageIndex := St_Proc.cnLanguageIndex;
 Report:= ReportTHerited.Create(DataModule1.DB,DataModule1.WriteTransaction,DataSet,
 ProgressBar,Result_Button,CloseButton,WriteProc, countLabel,MemoError);
 timer1.Enabled := false;

{     WriteProc.StoredProcName := 'ST_SPRAV_BY_SMET_TMP_DELETE';
     WriteProc.Transaction.StartTransaction;
     WriteProc.Prepare;
     WriteProc.ExecProc;
     WriteProc.Transaction.Commit;
     WriteProc.Close;

  for i := 0 to DataSet.RecordCount-1  do
   begin
     WriteProc.StoredProcName := 'ST_SPRAV_BY_SMET';
     WriteProc.Transaction.StartTransaction;
     WriteProc.Prepare;
     WriteProc.ParamByName('ID_KOD').AsInt64:= DataSet['ID_KOD'];
     WriteProc.ExecProc;
     try
      WriteProc.Transaction.Commit;
      ProgressBar.Position := ProgressBar.Position +1;
      ProgressBar.Refresh;
      DataSet.Next;
      WriteProc.Close;
     except
      WriteProc.Transaction.Rollback;
      WriteProc.Close;
      screen.Cursor := crDefault;
      raise;
      exit;
     end;
   end;
   CloseButton.Enabled := true;
   Result_Button.Enabled:= true;
   showmessage(pchar(st_ConstUnit.st_GoodFormuv[PLanguageIndex]));   }

end;

procedure TfrmSprav.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if not CloseButton.Enabled then CanClose:=false;
end;

procedure TfrmSprav.Result_ButtonClick(Sender: TObject);
var
  print:TfrmReportShow;
begin
  print:=TfrmReportShow.Create(self);
  print.ShowModal;
  print.free;
end;

procedure TfrmSprav.FormShow(Sender: TObject);
begin
  timer1.Enabled := true;
end;

end.
