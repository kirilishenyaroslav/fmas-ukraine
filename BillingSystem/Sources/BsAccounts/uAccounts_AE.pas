unit uAccounts_AE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMemo, cxMaskEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxButtons, ExtCtrls,
  pFibStoredProc, pFIBDataSet, uDM, ibase, cxProgressBar, cxLabel;

type
  TfrmAccounts_AE = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    EdAccNum: TcxTextEdit;
    EdNote: TcxMemo;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    cxTextEdit1: TcxTextEdit;
    cxProgressBar1: TcxProgressBar;
    Label_period: TcxLabel;
    Timer1: TTimer;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdAccStatusPropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    DM : TfrmAccounts_DM;
  public
    isEditMode : Boolean;
    DateBeg:TDateTime;
    DateEnd:TDateTime;
    Calc_Mode: Integer;
    cn_end_month : integer;
    KOd_period_system : Integer;
    date_month : string;
    date_year : string;
    stop : Boolean;
    id_session : Int64;
    function GetDATE_BEG:TDateTime;
    constructor create(aOwner : TComponent; aHandle : TISC_DB_HANDLE); reintroduce;
  end;

implementation

uses {BaseTypes, Resources_unitb,} DateUtils;

{$R *.dfm}

procedure TfrmAccounts_AE.cxButton1Click(Sender: TObject);
var
  i : Integer;
  number, FIO :string;
begin
  DM.ReadDataSet.Close;
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'SELECT Surname_Client || '' '' || ' +
     'Firstname_Client || '' '' || Secondname_Client as FIO, KOD_MACHINE from '
      + 'BS_CLIENT_ACCOUNT_FILTER(null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null,null)';
  DM.ReadDataSet.Open;
  DM.ReadDataSet.FetchAll;

  DM.WriteTransaction.StartTransaction;
  DM.StoredProc.StoredProcName := 'BS_DT_ACCOUNTS_UPDATE';
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('status').AsInteger := 1;
  DM.StoredProc.ExecProc;
  DM.WriteTransaction.Commit;

  id_session := DM.DB.Gen_id('BS_GEN_ID_SESSION', 1);
  stop := false;
  cxButton2.Caption := '«упинити';
  cxButton1.Enabled := False;

  Timer1.Enabled := True;

  DM.WriteTransaction.StartTransaction;
  DM.StoredProc.StoredProcName := 'BS_DT_ACCOUNTS_UPDATE';
  DM.StoredProc.Prepare;
  DM.StoredProc.ParamByName('status').AsInteger := 2;
  DM.StoredProc.ExecProc;
  DM.WriteTransaction.Commit;


  cxButton1.Enabled := True;
  //ModalResult := mrOk;
end;

procedure TfrmAccounts_AE.cxButton2Click(Sender: TObject);
begin
 if not stop then
  Begin
   stop:= true;
   cxButton2.Caption := '¬их≥д';
  end
  Else Close;
end;

procedure TfrmAccounts_AE.FormShow(Sender: TObject);
var
 i : Integer;
begin
  stop := true;
  Case StrToInt(date_month) of
   1: Label_period.Caption := Label_period.Caption + ' €нварь';
   2: Label_period.Caption := Label_period.Caption + ' февраль';
   3: Label_period.Caption := Label_period.Caption + ' март';
   4: Label_period.Caption := Label_period.Caption + ' апрель';
   5: Label_period.Caption := Label_period.Caption + ' май';
   6: Label_period.Caption := Label_period.Caption + ' июнь';
   7: Label_period.Caption := Label_period.Caption + ' июль';
   8: Label_period.Caption := Label_period.Caption + ' август';
   9: Label_period.Caption := Label_period.Caption + ' сент€брь';
   10: Label_period.Caption := Label_period.Caption + ' окт€брь';
   11: Label_period.Caption := Label_period.Caption + ' но€брь';
   12: Label_period.Caption := Label_period.Caption + ' декабрь';
  End;

  Label_period.Caption := Label_period.Caption + ' ' + date_year;
end;

function TfrmAccounts_AE.GetDATE_BEG: TDateTime;
begin
  if not isEditMode then
   begin
    DM.WriteTransaction.StartTransaction;
    DM.StoredProc.StoredProcName := 'BS_ACCOUNT_GET_DATE_START';
    DM.StoredProc.Prepare;
    DM.StoredProc.ExecProc;
    DateBeg := DM.StoredProc.ParamByName('DATE_BEG').Value;
    DateEnd := IncMonth(DateBeg, 1);
    DM.WriteTransaction.Commit;
   end;
 Result:=Date;
end;

procedure TfrmAccounts_AE.EdAccStatusPropertiesChange(Sender: TObject);
var i:Integer;
begin
  if not isEditMode then
   begin
    GetDATE_BEG;

   end;
end;

constructor TfrmAccounts_AE.create(aOwner: TComponent;
  aHandle: TISC_DB_HANDLE);
begin
  inherited Create(aOwner);

  DM := TfrmAccounts_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := True;
  DM.ReadTransaction.StartTransaction;
end;

procedure TfrmAccounts_AE.Timer1Timer(Sender: TObject);
var
  i, j : Integer;
  FIO, S :string;
  ID_SESSION_OUT, TYPE_ERROR_OUT : Integer;
  number : Integer;
begin
  DM.ReadDataSet.First;
  For i := 1 to DM.ReadDataSet.RecordCount do
   begin
    number := DM.ReadDataSet['KOD_MACHINE'];

    if (DM.ReadDataSet['FIO'] <> null)
     then FIO := DM.ReadDataSet['FIO']
     else FIO := '-Ќевизначено-';

    Label1.Caption := IntToStr(number);
    Label3.Caption := FIO;

    DM.WriteTransaction.StartTransaction;
    DM.StoredProc.StoredProcName := 'BS_ACCRUAL_CLIENT_ACCOUNT';
    DM.StoredProc.Prepare;
    DM.StoredProc.ParamByName('KOD_MACHINE').AsInteger := number;
    DM.StoredProc.ParamByName('FLAG_ACCOUNT').AsInteger := 0;
    DM.StoredProc.ExecProc;
    ID_SESSION_OUT := DM.StoredProc.fieldByName('ID_SESSION_OUT').AsInteger;
    TYPE_ERROR_OUT := DM.StoredProc.fieldByName('TYPE_ERROR_OUT').AsInteger;
    try
     DM.WriteTransaction.Commit;
     except
      DM.WriteTransaction.Rollback;
    end;

    if TYPE_ERROR_OUT <> 0 then
     Begin
      S := IntToStr(number) + ' ';
      DM.ReadDataSet_error.Close;
      DM.ReadDataSet_error.SQLs.SelectSQL.Text := 'Select * from BS_ACCOUNT_ERROR_SEL(:id_session, :kod_machine)';
      DM.ReadDataSet_error.ParamByName('id_session').AsInteger := ID_SESSION_OUT;
      DM.ReadDataSet_error.ParamByName('KOD_MACHINE').AsInteger := Number;
      DM.ReadDataSet_error.Open;
      DM.ReadDataSet_error.FetchAll;
      DM.ReadDataSet_error.First;

      For j := 1 to DM.ReadDataSet_error.RecordCount do
       Begin
        S := S + DM.ReadDataSet_error['TEXT_ERROR'] + ' ';
        DM.ReadDataSet_error.Next;
       end;
     end;

    EdNote.Lines.Add(S); 
    DM.ReadDataSet.Next;

    cxProgressBar1.Position := Round((i/DM.ReadDataSet.RecordCount)*100);
   end;
   
  Timer1.Enabled := false;
  cxButton2Click(self);
  ShowMessage('ѕроцес розрахунку завершено!');
end;

end.
