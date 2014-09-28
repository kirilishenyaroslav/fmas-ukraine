unit uFilterOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, cxCheckBox, FIBDatabase,
  pFIBDatabase, ibase, cxButtonEdit, FIBQuery, pFIBQuery,
  pFIBStoredProc, DateUtils, ActnList, uSpMatSch, uMatasVars, uMatasUtils,
  GlobalSPR, uMatasFilter;

procedure ShowOperFilter(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION: integer; var aParams:TMatasFilterOperParams);stdcall;

exports ShowOperFilter;

type
  TOperFilterForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    WorkDataSet: TpFIBDataSet;
    KeyActionList: TActionList;
    ActionCancel: TAction;
    cxDbSch: TcxButtonEdit;
    cxKrSch: TcxButtonEdit;
    cxSm: TcxButtonEdit;
    cxRzSt: TcxButtonEdit;
    cxKekv: TcxButtonEdit;
    ClearButton: TcxButton;
    WorkStoredProc: TpFIBStoredProc;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure cxDbSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKrSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxSmPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxRzStPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxKekvPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
   DBHANDLE : TISC_DB_HANDLE;
   ID_SESSION:Integer;// содержит  идентификатор  сессии
  public
   constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION: integer);overload;
   function ShowFilterParam(ID_OBJECT:Integer; NameForm:String):string;
   function GetFilterParam(ID_OBJECT: Integer):string;
  end;

var
  OperFilterForm: TOperFilterForm;

implementation

{$R *.dfm}

uses uFilterParam;

procedure ShowOperFilter(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION: integer; var aParams:TMatasFilterOperParams);stdcall;
var
  T:TOperFilterForm;
begin
  T:=TOperFilterForm.Create(AOwner, aDBHANDLE, aID_SESSION);
  if T.ShowModal=mrOk then
  begin
   aParams.DB_SCH_LIST:=T.cxDbSch.Text;
   aParams.KR_SCH_LIST:=T.cxKrSch.Text;
   aParams.SM_LIST:=T.cxSm.Text;
   aParams.RZ_ST_LIST:=T.cxRzSt.Text;
   aParams.KEKV_LIST:=T.cxKekv.Text;
  end;
  T.Free;
end;

constructor TOperFilterForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION: Integer);
var
 dy, dm, dd: Word;
begin
 inherited Create(aOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DBHANDLE := aDBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=aDBHANDLE;
   Self.WorkDatabase.StartTransaction;
   Self.Caption:=MAT_SYS_PREFIX+MAT_ACTION_FILTER_CONST;
   self.OkButton.Caption:=MAT_BUTTON_OK_CONST;
   self.CancelButton.Caption:=MAT_BUTTON_CANCEL_CONST;
   ID_SESSION :=aID_SESSION;
   with Self.WorkDataSet.SelectSQL do
   begin
    Clear;
    Add('SELECT ID_KEY, NAME, KOD FROM MAT_TMP_FILTER_ANALAZE_SEL(:Date,:ID_SESSION,:ID_OBJECT)');
   end;
 end;
end;

procedure TOperFilterForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;

procedure TOperFilterForm.ClearButtonClick(Sender: TObject);
begin
 try
   WorkTransaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_FILTER_CLEAR_2';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('ID_SESSION').Value:=ID_SESSION;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
   except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
 end;
 cxDbSch.Text :='';
 cxKrSch.Text :='';
 cxSm.Text    :='';
 cxRzSt.Text  :='';
 cxKekv.Text  :='';
end;

function TOperFilterForm.ShowFilterParam(ID_OBJECT: Integer; NameForm: String):string;
var
 T: TFilterParamForm;
begin
 T:=TFilterParamForm.Create(self, DBHANDLE, ID_SESSION, ID_OBJECT, _MATAS_PERIOD, NameForm);
 T.ShowModal;
 Result:=T.Result;
 T.Free;
end;

procedure TOperFilterForm.cxDbSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 cxDbSch.Text:=ShowFilterParam(6,'кредитовим рахункам');
end;

procedure TOperFilterForm.cxKrSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 cxKrSch.Text:=ShowFilterParam(7,'дебетовим рахункам');
end;

procedure TOperFilterForm.cxSmPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 cxSm.Text:=ShowFilterParam(8,'бюджетам');
end;

procedure TOperFilterForm.cxRzStPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 cxRzSt.Text:=ShowFilterParam(9,'розділам/статтям');
end;

procedure TOperFilterForm.cxKekvPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
begin
 cxKekv.Text:=ShowFilterParam(10,'КЕКВам');
end;

function TOperFilterForm.GetFilterParam(ID_OBJECT: Integer): string;
var
  Str:String;
begin
  WorkDataSet.Close;
  WorkDataSet.ParamByName('Date').Value:=_MATAS_PERIOD;
  WorkDataSet.ParamByName('ID_SESSION').Value:=ID_SESSION;
  WorkDataSet.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
  WorkDataSet.CloseOpen(false);
  if WorkDataSet.IsEmpty then exit;
  WorkDataSet.First;
  while not WorkDataSet.Eof do
  begin
    Str:=Str + WorkDataSet.FieldByName('KOD').AsString + ';';
    WorkDataSet.Next;
  end;
  Result:=Str;
end;

procedure TOperFilterForm.FormCreate(Sender: TObject);
begin
 cxDbSch.Text:=GetFilterParam(6);
 cxKrSch.Text:=GetFilterParam(7);
 cxSm.Text:=GetFilterParam(8);
 cxRzSt.Text:=GetFilterParam(9);
 cxKekv.Text:=GetFilterParam(10);
end;

end.
