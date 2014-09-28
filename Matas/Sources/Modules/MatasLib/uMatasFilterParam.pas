unit uMatasFilterParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBQuery, pFIBQuery , pFIBStoredProc, Buttons, IBASE, GlobalSPR, uPackageManager,
  ActnList;

type
  TFilterParamForm = class(TForm)
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    trRead: TpFIBTransaction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel: TPanel;
    DataSource: TDataSource;
    spWork: TpFIBStoredProc;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1ID_KEY: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1KOD: TcxGridDBColumn;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    ExitButton: TSpeedButton;
    DSID_KEY: TFIBBCDField;
    DSNAME: TFIBStringField;
    DSKOD: TFIBStringField;
    ClearButton: TSpeedButton;
    OkButton: TSpeedButton;
    trWrite: TpFIBTransaction;
    ActionList1: TActionList;
    acInsert: TAction;
    acDelete: TAction;
    acClose: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClearButtonClick(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);

  private
     DBHANDLE : TISC_DB_HANDLE;
     ID_USER : Int64;{ Public declarations }

  public
    Radz_st_num :Integer;
    Temp :Variant;
    ID_OBJECT    :Integer;
    ID_SESSION   :Integer;
    ID_KEY       :Integer;
    KEY_TITLE    :String;
    KEY_NUMBER   :String;
    DATE_SESSION :TDateTime;
    Result       :String;
    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:String);overload;
  end;

var
  FilterParamForm: TFilterParamForm;

implementation

{$R *.dfm}

constructor TFilterParamForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:String);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DB.Close;
   Self.DBHANDLE:=aDBHANDLE;
   Self.DB.Handle:=aDBHANDLE;
   Self.Caption:='Параметри фільтрації по '+aNameForm;
   self.ID_OBJECT:=aID_OBJECT;
   self.ID_SESSION:=aID_SESSION;
   self.DATE_SESSION:=aDATE_SESSION;
   self.ExitButton.Align:=alRight;
   self.OkButton.Align:=alRight;
   with Self.DS do
   begin
      Close;
      ParamByName('Date').Value:=DATE_SESSION;
      ParamByName('ID_SESSION').Value:=ID_SESSION;
      ParamByName('ID_OBJECT').Value:=ID_OBJECT;
      CloseOpen(false);
   end;
 end;
end;

procedure TFilterParamForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   Str:String;
begin
  Str:='';
  Result:=Str;
  if DS.IsEmpty then exit;
  DS.First;
  while (not DS.Eof) and (Length(Str)<1000) do
  begin
    if ID_OBJECT=30 then Str:=Str + DSNAME.AsString + ';'
    else Str:=Str + DSKOD.AsString + ';';
    DS.Next;
  end;
  Result:=Str;
end;


procedure TFilterParamForm.ClearButtonClick(Sender: TObject);
begin
  try
   trWrite.StartTransaction;
   spWork.StoredProcName:='MAT_FILTER_CLEANER';
   spWork.Prepare;
   spWork.ParamByName('ID_SESSION').Value:=ID_SESSION;
   spWork.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
   spWork.ExecProc;
   spWork.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    spWork.Transaction.Rollback;
    Exit;
   end;
  end;
  DS.CloseOpen(false);
end;

procedure TFilterParamForm.acInsertExecute(Sender: TObject);
var
  Res : Variant;
begin
   // дебетовые и кредитовые счета
   if (ID_OBJECT=6) or (ID_OBJECT=7) then
   begin
    Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal,DATE_SESSION, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
    // debit credit
     ID_KEY := (Res[0][0]);
     KEY_TITLE:=VarToStr(RES[0][1]);
     KEY_NUMBER := VarToStr(RES[0][3]);
    end;
   end;

   // номенклатура
   if (ID_OBJECT=30)then
   begin
     Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, ID_KEY , 0, 0, 0, 0, 0);
    if  VarType(Res) <> varEmpty then
    begin
      ID_KEY:=res[0];
      KEY_TITLE:=Res[1];
      KEY_NUMBER:=Res[11];
    end;
   end;

  // Бюджеты
  if (ID_OBJECT=8) then
   begin
    Res:=GlobalSPR.GetSmetsEx(self,DBHandle,DATE_SESSION,psmSmet,0,0,0);
    if VarArrayDimCount(Res)>0 then
    begin
     if Res[0]<>NULL then
     begin
     ID_KEY := (Res[0]);
     KEY_TITLE:=VarToStr(Res[2]);
     KEY_NUMBER := VarToStr(Res[3]);
     end;
    end;
   end;

   // разделы и статьи
   if (ID_OBJECT=9) then
   begin
     Res:=GlobalSPR.GetRazdStSpr(self, DBHandle, fsNormal, Date_SESSION, 0, allEnable, cmSt);
     if Res<>NULL then
     begin
      Radz_st_num:=StrToInt(VarToStr(Res));
      ID_KEY:=Radz_st_num;
      KEY_TITLE:=IntToStr(Radz_st_num);
     end
   end;

   // КЕКВы
   if (ID_OBJECT=10) then
   begin
    Res:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date_SESSION, DEFAULT_ROOT_ID);
    if VarArrayDimCount(Res)>0 then
    begin
     if Res[0][0]<>NULL then
     begin
     ID_KEY := (Res[0][0]);
     KEY_TITLE:=VarToStr(RES[0][1]);
     KEY_NUMBER := VarToStr(RES[0][3]);
     end;
    end;
   end;

   if KEY_TITLE='' then Exit;

   try
    trWrite.StartTransaction;
    spWork.StoredProcName:='MAT_FILTER_CHECK';
    spWork.Prepare;
    spWork.ParamByName('ID_SESSION').Value:=ID_SESSION;
    spWork.ParamByName('ID_KEY').Value:=ID_KEY;
    spWork.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
    spWork.ExecProc;
    spWork.Transaction.Commit;
   except on E : Exception
    do begin
     ShowMessage(E.Message);
     spWork.Transaction.Rollback;
     Exit;
    end;
   end;
   DS.CloseOpen(false);
end;

procedure TFilterParamForm.acDeleteExecute(Sender: TObject);
var
  ID :integer;
begin
  if DS.IsEmpty then exit;
  ID:=DSID_KEY.AsInteger;
  try
   trWrite.StartTransaction;
   spWork.StoredProcName:='MAT_FILTER_CHECK';
   spWork.Prepare;
   spWork.ParamByName('ID_SESSION').Value:=ID_SESSION;
   spWork.ParamByName('ID_KEY').Value:=ID;
   spWork.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
   spWork.ExecProc;
   spWork.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    spWork.Transaction.Rollback;
    Exit;
   end;
  end;
  DS.CloseOpen(false);
end;

procedure TFilterParamForm.acCloseExecute(Sender: TObject);
begin
 Close;
end;

end.
