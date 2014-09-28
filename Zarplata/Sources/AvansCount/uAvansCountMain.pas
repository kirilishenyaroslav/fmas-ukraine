unit uAvansCountMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel,
  cxLookAndFeelPainters, StdCtrls, cxButtons, iBase,
  Unit_ZGlobal_Consts, ZProc, Gauges, zThread, Dates, cxProgressBar,
  cxTextEdit, cxMemo, pfibStoredProc, pFibDataBase, Zmessages, uAvansData,
  cxMaskEdit, cxSpinEdit, cxDropDownEdit, pFibDataSet, FIBDatabase,
  ComCtrls, ZWait;
type
  TfAvansCount = class(TForm)
    Bevel1: TBevel;
    LabelTn: TcxLabel;
    LabelFio: TcxLabel;
    LabelTnData: TcxLabel;
    LabelFioData: TcxLabel;
    Panel1: TPanel;
    OkBtn: TcxButton;
    CancelBtn: TcxButton;
    Panel2: TPanel;
    cxMemo1: TcxMemo;
    LabelDopInfo: TcxLabel;
    NumDateBeg: TcxSpinEdit;
    NumDateEnd: TcxSpinEdit;
    cxLabel1: TcxLabel;
    MonthComboBox: TcxComboBox;
    YearSpinEdit: TcxSpinEdit;
    ProgressBar1: TProgressBar;
    cxButton1: TcxButton;

    procedure OkBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelBtnClick(Sender: TObject);
    function CreateAvansTree(Sender:TObject):boolean;
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure cxButton1Click(Sender: TObject);
  private
    PLanguageIndex:byte;
    ThreadProgress:TzThread;
    pDBHandle:TISC_DB_HANDLE;
    CurrKodSetup:integer;
    FTerminate:Boolean;
  public
    constructor Create(AOwner:TComponent;aDbHandle:TISC_DB_HANDLE);reintroduce;
  end;

implementation

uses Math, FIBQuery, pFIBQuery, FIBDataSet;

{$R *.dfm}

constructor TfAvansCount.Create(AOwner:TComponent;aDbHandle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 FTerminate:=false;
 pDbHandle:=aDbHandle;
 PLanguageIndex    := LanguageIndex;

 Caption           := FZ_AvansCount_Caption[PLanguageIndex];
 LabelTn.Caption   := LabelTn_Caption[PLanguageIndex];
 LabelFio.Caption  := LabelFIO_Caption[PLanguageIndex];
 OkBtn.Caption                  := YesBtn_Caption[PLanguageIndex];
 CancelBtn.Caption              := CancelBtn_Caption[PLanguageIndex];
 cxMemo1.Lines.Text             :='';


 CurrKodSetup                   := CurrentKodSetup(aDbHandle);

 NumDateBeg.Properties.MinValue := 1;
 NumDateBeg.Properties.MaxValue := CntDaysFromKodSetup(CurrKodSetup);
 NumDateBeg.Value               := NumDateBeg.Properties.MinValue;

 NumDateEnd.Properties.MinValue := NumDateBeg.Value;
 NumDateEnd.Properties.MaxValue := NumDateBeg.Properties.MaxValue;
 NumDateEnd.Value               := 15;

 MonthComboBox.Properties.Items.Text := MonthesList_Text[PLanguageIndex];
 MonthComboBox.ItemIndex := YearMonthFromKodSetup(CurrKodSetup,False)-1;
 MonthComboBox.Properties.ReadOnly := True;
 YearSpinEdit.Value      := YearMonthFromKodSetup(CurrKodSetup);
end;

procedure TfAvansCount.OkBtnClick(Sender: TObject);
var IdGroup:integer;
    tmpKodSetup:integer;
    GetDataInfo:TpFibDataSet;
    CalcSP:TpFIBStoredProc;
    wf:TForm;
    ViewForm  :TFAvansData;
begin
  OkBtn.Visible     :=False;
  CancelBtn.Visible :=False;
  cxButton1.Visible :=True;
  FTerminate:=false;

  SetBeginAction(pDBHandle,7);

  if not GetIdGroupAccount(pDBHandle,IdGroup) then exit;
  tmpKodSetup := CurrentKodSetup(pDBHandle);

  wf:=ShowWaitForm(Application.MainForm);
  GetDataInfo:=TpFibDataSet.Create(Self);
  GetDataInfo.Database:=TpFIBDatabase.Create(self);
  GetDataInfo.Database.SQLDialect:=3;
  GetDataInfo.Transaction:=TpFIBTransaction.Create(self);
  GetDataInfo.Transaction.DefaultDatabase := GetDataInfo.Database;
  GetDataInfo.Database.Handle := pDBHandle;
  GetDataInfo.SelectSQL.Text:=' SELECT * FROM Z_AVANS_GET_PEOPLE ';

  CalcSP:=TpFIBStoredProc.Create(self);
  CalcSP.Database:=GetDataInfo.Database;
  CalcSP.Transaction:=TpFIBTransaction.Create(self);
  CalcSP.Transaction.DefaultDatabase:=GetDataInfo.Database;
  CalcSP.StoredProcName:='Z_PAYMENT_COUNT_AVANS';

  GetDataInfo.Open;
  GetDataInfo.FetchAll;
  ProgressBar1.Max:=GetDataInfo.RecordCount;
  ProgressBar1.Min:=0;
  ProgressBar1.Step:=1;
  ProgressBar1.Position:=0;
  ProgressBar1.Update;
  Application.ProcessMessages;

  wf.close;
  while (not GetDataInfo.Eof) and (not FTerminate) do
  begin
       try
               if not CalcSP.Transaction.InTransaction
               then CalcSP.Transaction.StartTransaction;

               CalcSP.Prepare;
               CalcSP.ParamByName('DATE_BEG').Value        :=EncodeDate(YearSpinEdit.Value,MonthComboBox.ItemIndex+1,NumDateBeg.Value);
               CalcSP.ParamByName('DATE_END').Value        :=EncodeDate(YearSpinEdit.Value,MonthComboBox.ItemIndex+1,NumDateEnd.Value);
               CalcSP.ParamByName('ID_GROUP_ACCOUNT').Value:=IdGroup;
               CalcSP.ParamByName('ID_ACCOUNT').Value      :=NULL;
               CalcSP.ParamByName('ID_MAN').Value          :=GetDataInfo.FieldByName('ID_MAN').Value;
               CalcSP.ExecProc;

               CalcSP.Transaction.Commit;

        except on E:Exception do
               begin
                    MessageBox(self.Handle,PChar(e.Message),pChar(Error_Caption[LanguageIndex]),
                    MB_OK+MB_ICONERROR);
                    if CalcSP.Transaction.InTransaction then CalcSP.Transaction.Rollback;
               end;
        end;

       GetDataInfo.Next;
       ProgressBar1.StepIt;

       try
               LabelTnData.Caption  := VarToStr(GetDataInfo['TN']);
               LabelFIOData.Caption := VarToStr(GetDataInfo['FIO']);
               LabelDopInfo.Caption := IntToStr(GetDataInfo.RecNo-1)+' - '+IntToStr(ProgressBar1.Max);
               except on E:Exception do begin end;
       end;

       Application.ProcessMessages;
  end;

  if CreateAvansTree(Sender) and (not FTerminate)
  then begin
            SetEndAction(pDBHandle,'T');

            ViewForm  :=  TFAvansData.Create(self, GetDataInfo.Database.Handle);
            if ViewForm.ShowModal=mrYes
            then begin
                      ShowMessage('Розрахунок авансу завершено!')
            end;
            ViewForm.Free;
  end
  else SetEndAction(pDBHandle,'');

  CancelBtn.Visible := True;
  if Trim(cxMemo1.Lines.Text)='' then Close;

  OkBtn.Visible     :=true;
  CancelBtn.Visible :=true;
  cxButton1.Visible :=false;
end;


procedure TfAvansCount.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfAvansCount.CancelBtnClick(Sender: TObject);
begin
Close;
end;


function TfAvansCount.CreateAvansTree(Sender:TObject):boolean;
var StProc:TpFIBStoredProc;
begin
      Result:=False;
      StProc := TpFIBStoredProc.Create(nil);
      with StProc do
       try
         Database := TpFIBDatabase.Create(nil);
         Transaction := TpFIBTransaction.Create(nil);
         Transaction.DefaultDatabase := Database;
         Database.Handle := pDBHandle;

         StoredProcName := 'Z_FILL_DT_AVANS';
         Transaction.StartTransaction;
         Prepare;
         ExecProc;
         Transaction.Commit;
         Result:=True;
       except
        on E:Exception do
         begin
          ZShowMessage(Error_Caption[pLanguageIndex],e.Message,mtError,[mbOk]);
          Transaction.Rollback;
         end;
       end;
end;

procedure TfAvansCount.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
     Resize:=False;
end;

procedure TfAvansCount.cxButton1Click(Sender: TObject);
begin
     FTerminate:=True;
end;

end.
