unit MainImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ComCtrls, cxControls, cxContainer,
  cxEdit, cxCheckBox, StdCtrls, cxButtons, ExtCtrls, FIBDatabase,
  pFIBDatabase,UImportThread;

type
  TfrmImportMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    CheckRegUch: TcxCheckBox;
    PrRegUch: TProgressBar;
    CheckKEKV: TcxCheckBox;
    PrKekv: TProgressBar;
    CheckProperties: TcxCheckBox;
    PrProperties: TProgressBar;
    CheckSch: TcxCheckBox;
    PrBal: TProgressBar;
    CheckOper: TcxCheckBox;
    PrOper: TProgressBar;
    CheckBudget: TcxCheckBox;
    PrBu: TProgressBar;
    CheckDocProv: TcxCheckBox;
    PrDoc: TProgressBar;
    cxButton3: TcxButton;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    CheckBudgetPer: TcxCheckBox;
    PrBuPeriod: TProgressBar;
    CheckBuStru: TcxCheckBox;
    PrBuStru: TProgressBar;
    CheckBuDoc: TcxCheckBox;
    PrBuDoc: TProgressBar;
    CheckBuPValues: TcxCheckBox;
    PrBuPValues: TProgressBar;
    CheckBuCalc: TcxCheckBox;
    PrBuCalc: TProgressBar;
    PrProv: TProgressBar;
    Label1: TLabel;
    CheckRazdSt: TcxCheckBox;
    PrRazdSt: TProgressBar;
    CheckBuGr: TcxCheckBox;
    PrBuGr: TProgressBar;
    CheckBuPKV: TcxCheckBox;
    PrBuPKV: TProgressBar;
    CheckBuFnds: TcxCheckBox;
    PrBuFnds: TProgressBar;
    CheckPkvRsch: TcxCheckBox;
    PrPkvRsch: TProgressBar;
    CheckBuVal: TcxCheckBox;
    PrBuVal: TProgressBar;
    CheckBuMVal: TcxCheckBox;
    PrBuMVal: TProgressBar;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    IT:TDataImportThread;
    procedure OnTerminate(Sender:TObject);
  public
    ConnectionString:String;
    ConnectionUser  :String;
    ConnectionPsswrd:String;
    { Public declarations }
  end;

var
  frmImportMain: TfrmImportMain;

implementation

{$R *.dfm}

procedure TfrmImportMain.cxButton3Click(Sender: TObject);
begin
    Database.DBName :=ConnectionString;
    Database.ConnectParams.UserName := ConnectionUser;
    Database.ConnectParams.Password := ConnectionPsswrd;

    Database.Open;

    if Database.Connected
    then begin
              ReadTransaction.StartTransaction;
              cxButton1.Enabled:=true;
    end
    else ShowMessage('Connected Error');
end;

procedure TfrmImportMain.cxButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TfrmImportMain.cxButton1Click(Sender: TObject);
begin
  if (cxButton1.Caption='Перервати')
  then begin
      cxButton1.Caption:='Почати';
      IT.Terminate;
  end
  else begin
      cxButton1.Caption:='Перервати';
      IT:=TDataImportThread.Create(true,self);
      IT.FreeOnTerminate:=true;
      IT.Priority:=tpNormal;
      IT.OnTerminate:=OnTerminate;
      IT.Resume;
  end;
end;

procedure TfrmImportMain.OnTerminate(Sender: TObject);
begin
     ShowMessage('Import is done');
     cxButton1.Caption:='Почати';     
end;

end.
