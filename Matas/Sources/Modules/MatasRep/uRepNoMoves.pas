{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль печати отчетов                                 }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uRepNoMoves;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxCheckBox,
  ActnList, cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, ibase, uResources, uMatasUtils, uMatasVars,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, FR_Class, FR_DSet,
  FR_DBSet, DB, FIBDataSet, pFIBDataSet, cxButtonEdit, uSpMatSchMulti,
  pFIBStoredProc;

procedure ShowRepNoMoves(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;

exports ShowRepNoMoves;

type
  TRepNoMovesForm = class(TForm)
    Label1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    Label5: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    Label2: TLabel;
    cxReport: TcxComboBox;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    cxCheckOnPrinter: TcxCheckBox;
    cxSelectPrinter: TcxCheckBox;
    Label4: TLabel;
    cxCopies: TcxSpinEdit;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    cxCheckBox1: TcxCheckBox;
    RepDataSet: TpFIBDataSet;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    WorkQuery: TpFIBQuery;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    LabelSch: TLabel;
    cxLookupSch: TcxButtonEdit;
    StoredProc: TpFIBStoredProc;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure cxLookupSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxLookupSchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
   DBHANDLE : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth1, MatasYear1: Word;
   MatasMonth2, MatasYear2: Word;
   PERIOD: TDateTime;
   FILTER_ID_SESSION: integer;
   F_SCH, F_MO: boolean;
   ID_SESSION: integer;
   ID_SCH, TIP_SCH: integer;
   constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);overload;
  end;


var
  RepNoMovesForm: TRepNoMovesForm;

implementation
uses DateUtils;

{$R *.dfm}
procedure ShowRepNoMoves(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aPERIOD: TDateTime);stdcall;
begin
 TRepNoMovesForm.Create(AOwner, DBHANDLE, aID_USER, aPERIOD);
end;

constructor TRepNoMovesForm.Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64; PERIOD: TDateTime);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.PERIOD:=PERIOD;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_REP_NOMOVE ;
   DecodeDate(PERIOD, dy, dm,  dd);
   MatasYear1:=dy;
   MatasMonth1:=dm;
   LoadMonthTocxComboBox(self.cxMonthBeg);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.cxCopies.Value:=1;
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.cxCheckBox1.Visible := IntToBool(_ALLOW_EDIT_TEMPLATE);
   self.cxCheckOnPrinter.Checked:=IntToBool(_SET_PRINT_ON_PRINTER);
   self.OkButton.Caption:=MAT_ACTION_PRINT_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonthEnd.ItemIndex:=MatasMonth1-1;
   self.cxYearEnd.Value:=MatasYear1;
   IncAMonth(dy, dm,  dd, -3);
   MatasYear2:=dy;
   MatasMonth2:=dm;
   self.cxMonthBeg.ItemIndex:=MatasMonth2-1;
   self.cxYearBeg.Value:=MatasYear2;
 end;
 ID_SESSION:=0;
end;

procedure TRepNoMovesForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TRepNoMovesForm.ActionOkExecute(Sender: TObject);
begin
 OkButton.Click;
end;

procedure TRepNoMovesForm.FormCreate(Sender: TObject);
begin
 FILTER_ID_SESSION:=WorkDatabase.Gen_Id('MAT_ID_SESSION',1, WorkTransaction);
 F_SCH:=false;
 F_MO:=false;
 cxReport.ItemIndex:=0;
end;

procedure TRepNoMovesForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 WorkQuery.Close;
 WorkQuery.SQL.Clear;
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_OBOROT WHERE ID_SESSION='+IntToStr(ID_SESSION));
 try
  WorkQuery.Transaction := WorkTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;
 WorkQuery.Close;
 WorkQuery.SQL.Clear;
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_FILTER WHERE ID_SESSION='+IntToStr(FILTER_ID_SESSION));
 try
  WorkQuery.Transaction := WorkTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TRepNoMovesForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TRepNoMovesForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
begin
 w:=ShowWaitWindow(self);
 MatasYear1:=cxYearBeg.Value;
 MatasMonth1:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear1, MatasMonth1);
 MatasYear2:=cxYearEnd.Value;
 MatasMonth2:=cxMonthEnd.ItemIndex+1;
 DEND:=EndOfAMonth(MatasYear2, MatasMonth2);

 WorkQuery.Close;
 WorkQuery.SQL.Clear;
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_OBOROT WHERE ID_SESSION='+IntToStr(ID_SESSION));
 try
  WorkQuery.Transaction := WorkTransaction;
  WorkQuery.Transaction.StartTransaction;
  WorkQuery.ExecQuery;
  WorkQuery.Transaction.Commit;
  except on E : Exception
   do begin
     ShowMessage(E.Message);
     WorkQuery.Transaction.Rollback;
     exit;
   end;
 end;

 try
  StoredProc.Close;
  StoredProc.Transaction := WorkTransaction;
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='MAT_MAKE_OBOROT';
  StoredProc.Prepare;
  StoredProc.ParamByName('PDATE_BEG').AsDate:=DBEG;
  StoredProc.ParamByName('PDATE_END').AsDate:=DEND;
  StoredProc.ExecProc;
  ID_SESSION:=StoredProc.ParamByName('ID_SESSION').AsInteger;
  StoredProc.Transaction.Commit;
 except on E : Exception
  do begin
   ShowMessage(E.Message);
   StoredProc.Transaction.Rollback;
   exit;
  end;
 end;

 if cxReport.ItemIndex=0 then begin
  RepDataSet.Close;

  with RepDataSet.SelectSQL do
  begin
   Clear;
   Add('SELECT *');
   Add(' FROM MAT_GET_OBOROT_NO_MOVES(:ID_SESSION)');
   if F_SCH then
   begin
    Add('WHERE ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=2 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
    Add('OR BAL_ID_SCH IN (SELECT ID_KEY FROM MAT_TMP_FILTER WHERE ID_OBJECT=3 AND ID_SESSION='+IntToStr(FILTER_ID_SESSION)+')');
   end;
   Add('ORDER BY SCH_NUMBER, SFIO, NAME_DEPARTMENT');
  end;

  RepDataSet.Prepare;
  RepDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
  RepDataSet.CloseOpen(false);
  frReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+'\ved_no_moves.frf');
 end;

 if (cxYearEnd.Value=cxYearBeg.Value) and (cxMonthBeg.ItemIndex=cxMonthEnd.ItemIndex) then
  frVariables['PERIOD']:=AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)
 else
  frVariables['PERIOD']:='ПЕРІОД З '+AnsiUpperCase(cxMonthBeg.Text)+' '+IntToStr(cxYearBeg.Value)+' ПО '+AnsiUpperCase(cxMonthEnd.Text)+' '+IntToStr(cxYearEnd.Value);
 frVariables['DATE_BEG']:=DateToStr(DBEG);
 frVariables['DATE_END']:=DateToStr(IncDay(DEND));
 frVariables['ORG_NAME']:=_ORG_FULL_NAME;
 frVariables['ORG_SHORT_NAME']:=_ORG_SHORT_NAME;
 frVariables['ORG_KOD_OKPO']:=_ORG_KOD_OKPO;
 CloseWaitWindow(w);
 frReport1.PrepareReport;
 if cxCopies.Value>1 then
  frReport1.DefaultCopies:=cxCopies.Value;
 if cxCheckOnPrinter.Checked then
 begin
  if cxSelectPrinter.Checked then
   frReport1.PrintPreparedReportDlg
  else
   frReport1.PrintPreparedReport('', cxCopies.Value, false, frAll);
 end
 else
  frReport1.ShowReport;
 if cxCheckBox1.Checked then
  frReport1.DesignReport;

end;

procedure TRepNoMovesForm.cxLookupSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res : Variant;
  mr: boolean;
  VarDimCnt: integer;
  i: integer;
  s: string;
begin
 mr:=false;
 Res:=uSpMatSchMulti.GetMatSchMulti(self, DBHandle, 0, FILTER_ID_SESSION, mr);
 if mr then begin
  if  VarType(Res) <> varEmpty then begin
   VarDimCnt:=VarArrayHighBound(Res,  1);
   s:='';
   for i:=0 to VarDimCnt do begin
    s:=s+VarToStr(Res[i][1])+';';
   end;
   cxLookupSch.Text := s;
   F_SCH:=true;
  end
 end
 else
 begin
  F_SCH:=false;
  cxLookupSch.Text:='';
 end;
end;

procedure TRepNoMovesForm.cxLookupSchKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key=VK_BACK) or (Key=VK_DELETE) then
 begin
  cxLookupSch.Text:='';
  ID_SCH:=0;
  F_SCH:=false;
 end
end;

end.
