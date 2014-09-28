unit UEditSchObor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxCalc,
  cxMaskEdit, cxDropDownEdit, cxStyles, cxControls, cxContainer, cxEdit,
  cxTextEdit, FIBDatabase, pFIBDatabase,pFibStoredProc,pFibDataSet, cxMemo;

type
  TfrmEditSchObor = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    KrSch: TcxTextEdit;
    DbSch: TcxTextEdit;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxPopupEdit1: TcxPopupEdit;
    cxPopupEdit2: TcxPopupEdit;
    EdSum: TcxCalcEdit;
    Label3: TLabel;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxMemo1: TcxMemo;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    KEY_SESSION:Int64;
    function UpdateObor(KR_ID,DB_ID:integer;NewValue:Real):Integer;
  public
    { Public declarations }
    DB_ID_SCH   : Integer;
    KR_ID_SCH   : Integer;
  end;


implementation

uses UMBookSchFrame, Kernel;


{$R *.dfm}

function TfrmEditSchObor.UpdateObor(KR_ID,DB_ID:integer;NewValue:Real):Integer;
 var UpdProc:TpFibStoredProc;
     ResValue:Integer;
begin
     UpdProc:=TpFibStoredProc.Create(self);
     UpdProc.Database:=WorkDatabase;
     UpdProc.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
     UpdProc.StoredProcName:='MBOOK_UPDATE_SCH_OBOR';
     UpdProc.Prepare;
     UpdProc.ParamByName('KEY_SESSION').AsInt64:=KEY_SESSION;
     UpdProc.ParamByName('ACTUAL_DATE').Value  :=(Owner as TSchFrame).ActualDate;
     UpdProc.ParamByName('KR_ID_SCH').value    :=KR_ID_SCH;
     UpdProc.ParamByName('DB_ID_SCH').value    :=DB_ID_SCH;
     UpdProc.ParamByName('NEW_OBOR_VAL').Value :=EdSum.Value;
     UpdProc.ExecProc;
     ResValue:=UpdProc.ParamByName('RESULT').AsInteger;
     WriteTransaction.Commit;
     UpdateObor:=REsValue;
end;


procedure TfrmEditSchObor.cxButton1Click(Sender: TObject);
var ErrorList:TStringList;
    STRU:KERNEL_MODE_STRUCTURE;
begin
    if UpdateObor(KR_ID_SCH, DB_ID_SCH, EdSum.Value)=1
    then begin
         ModalResult:=mrYes;
    end
    else begin
         ShowMessage('При попытке корректировки возникли ошибки.');
         cxMemo1.Visible:=true;
         STRU.DBHANDLE:=WorkDatabase.Handle;
         STRU.TRHANDLE:=WriteTransaction.Handle;
         STRU.KEY_SESSION:=KEY_SESSION;
         ErrorList:=Kernel.GetDocErrorsListEx(@STRU);
         if ErrorList<>nil then cxMemo1.Lines.Assign(ErrorList);
    end;
end;

procedure TfrmEditSchObor.cxButton2Click(Sender: TObject);
begin
    ModalResult:=mrNo;
end;

procedure TfrmEditSchObor.FormShow(Sender: TObject);
var SchInfoProc:TpFibDataSet;
begin
    WorkDatabase.Handle:=(Owner as TSchFrame).WorkDatabase.HANDLE;
    ReadTransaction.StartTransaction;
    KEY_SESSION:=WorkDatabase.Gen_Id('KERNEL_GEN_ID_SESSION',1);
    SchInfoProc:=TpFibDataSet.Create(self);
    SchInfoProc.Database:=WorkDatabase;
    SchInfoProc.Transaction:=ReadTransaction;
    SchInfoProc.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_INFO('+''''+DateToStr((Owner as TSchFrame).ActualDate)+''''+','+IntToStr(KR_ID_SCH)+')';
    SchInfoProc.Open;
    SchInfoProc.FetchAll;
    KrSch.Text:=SchInfoProc.FieldByName('SCH_NUMBER').AsString+' "'+SchInfoProc.FieldByName('SCH_TITLE').AsString+'"';
    SchInfoProc.Close;
    SchInfoProc.SelectSQL.Text:='SELECT * FROM PUB_SP_MAIN_SCH_INFO('+''''+DateToStr((Owner as TSchFrame).ActualDate)+''''+','+IntToStr(DB_ID_SCH)+')';
    SchInfoProc.Open;
    SchInfoProc.FetchAll;
    DBSch.Text:=SchInfoProc.FieldByName('SCH_NUMBER').AsString+' "'+SchInfoProc.FieldByName('SCH_TITLE').AsString+'"';
    SchInfoProc.Close;
    SchInfoProc.Free;
end;

end.
