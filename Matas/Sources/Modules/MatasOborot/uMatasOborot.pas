{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с оборотами                             }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uMatasOborot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit, ibase,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  uResources, uMatasVars, uMatasUtils, ActnList, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc, DateUtils;

type
  TOborotForm = class(TForm)
    Label1: TLabel;
    cxMonthBeg: TcxComboBox;
    cxYearBeg: TcxSpinEdit;
    Label5: TLabel;
    cxMonthEnd: TcxComboBox;
    cxYearEnd: TcxSpinEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    ActionOk: TAction;
    WorkQuery: TpFIBQuery;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionCancelExecute(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DBHANDLE:TISC_DB_HANDLE;
  public
   YearBeg, YearEnd, MonthBegNumber, MonthEndNumber   :Word;
   MonthBeg,MonthEnd  :String;
   ID_SESSION: integer;

   constructor Create(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);overload;
  end;

  procedure ShowOborot(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;

  exports ShowOborot;

var
  OborotForm: TOborotForm;

implementation

{$R *.dfm}
uses uMatasViewSchOborot;

procedure ShowOborot(aOwner:TComponent; DBHANDLE : TISC_DB_HANDLE);stdcall;
begin
 TOborotForm.Create(aOwner, DBHANDLE);
end;

constructor TOborotForm.Create(aOwner:TComponent;DBHANDLE : TISC_DB_HANDLE);
var
 dy, dm, dd: Word;
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
   Self.Caption:=MAT_SYS_PREFIX+MAT_STR_MAIN_MENU_ACC_OBOR;
   DecodeDate(_MATAS_PERIOD, dy, dm,  dd);
   LoadMonthTocxComboBox(self.cxMonthBeg);
   LoadMonthTocxComboBox(self.cxMonthEnd);
   self.OkButton.Caption:=MAT_ACTION_VIEW_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   self.cxMonthBeg.ItemIndex:=dm-1;
   self.cxYearBeg.Value:=dy;
   self.cxMonthEnd.ItemIndex:=dm-1;
   self.cxYearEnd.Value:=dy;
 end;
 self.ID_SESSION:=0;
end;

procedure TOborotForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TOborotForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
 w: TForm;
begin
 {w:=ShowWaitWindow(self);
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
 WorkQuery.SQL.Add('DELETE FROM MAT_TMP_OBOROT_DOC WHERE ID_SESSION='+IntToStr(ID_SESSION));
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
 CloseWaitWindow(w); }
 if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TOborotForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TOborotForm.OkButtonClick(Sender: TObject);
var
 DBEG, DEND: TDateTime;
 w: TForm;
 MatasMonth1, MatasYear1: Word;
 MatasMonth2, MatasYear2: Word;
 T: TViewSchOborotForm;
begin
 w:=ShowWaitWindow(self);
 MatasYear1:=cxYearBeg.Value;
 MatasMonth1:=cxMonthBeg.ItemIndex+1;
 DBEG:=StartOfAMonth(MatasYear1, MatasMonth1);
 MatasYear2:=cxYearEnd.Value;
 MatasMonth2:=cxMonthEnd.ItemIndex+1;

 YearBeg:=MatasYear1; MonthBeg:=cxMonthBeg.Text; MonthBegNumber:=MatasMonth1;
 YearEnd:=MatasYear2; MonthEnd:=cxMonthEnd.Text; MonthEndNumber:=MatasMonth2;
 DEND:=EndOfAMonth(MatasYear2, MatasMonth2);
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
 ShowMessage(IntToStr(ID_SESSION));
 CloseWaitWindow(w);
 T:=TViewSchOborotForm.Create(self);
 T.WorkDatabase.Handle:=DBHANDLE;
 T.WorkDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
 T.WorkDataSet.CloseOpen(false);
 T.cxGrid1DBBandedTableView1.ViewData.Expand(true);
 T.ShowModal;
 T.Free;
end;

procedure TOborotForm.FormCreate(Sender: TObject);
begin
 WorkTransaction.StartTransaction;
end;

end.
