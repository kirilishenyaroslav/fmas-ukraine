unit uFormTMC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridTableView, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, Buttons, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, GlobalSPR,
  uMatasVars;

type
  TAddTMC = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbclmnGrid1DBTableView1ID_KEY: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1KOD: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel: TPanel;
    btnacInsert: TSpeedButton;
    btnacDelete: TSpeedButton;
    btnacClose: TSpeedButton;
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    DSID_KEY: TFIBBCDField;
    DSNAME: TFIBStringField;
    DSKOD: TFIBStringField;
    TR: TpFIBTransaction;
    DataSource: TDataSource;
    StPr: TpFIBStoredProc;
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
    actlst1: TActionList;
    actInsert: TAction;
    actDelete: TAction;
    actClose: TAction;
    btnGrpByut: TSpeedButton;
    actGrpByut: TAction;
    ds_grp_sm: TpFIBDataSet;
    ds_grp_smID_SMETA: TFIBBCDField;
    pFIBTransaction1: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actDeleteExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actGrpByutExecute(Sender: TObject);
private
     DBHANDLE : TISC_DB_HANDLE;
     ID_USER : Int64;{ Public declarations }

  public
    Radz_st_num :Integer;
    Temp :Variant;
    ID_OBJECT :Integer;
    ID_SESSION:Integer;

    ID_SCH     :Integer;
    SCH_TITLE  :String;
    SCH_NUMBER :String;
    Date_SESSION_:TDateTime;
    Result :Variant;
    F_ID_NOMN, F_LINKTO: integer;
    params:array of array of Variant;
    id_grp_sm:Integer;

    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);overload;


  end;
  function GetTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;
  exports  GetTMC;
var
  AddTMC: TAddTMC;

implementation

{$R *.dfm}
uses DateUtils,uPackageManager;

function GetTMC(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String):Variant;stdcall;
var f: TAddTMC;
begin
 f:=TAddTMC.Create(AOwner, DBHANDLE, ID_USER, _ID_SESSION, _ID_OBJECT, DATE_SESSION, NameForm);
 f.ShowModal;
 GetTMC:=f.Result;
  f.Free;
end;

constructor TAddTMC.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DB.Close;
   Self.DBHANDLE:=DBHANDLE;
   Self.DB.Handle:=DBHANDLE;
   Self.Caption:='Додати параметри фільтрації по :: '+NameForm;
   self.ID_OBJECT:=_ID_OBJECT;
   self.ID_SESSION:=_ID_SESSION;
   self.Date_SESSION_:=DATE_SESSION;
 //  self.ExitButton.Align:=alRight;
   with Self.DS do
   begin
     Close;
     ParamByName('Date').Value:=DATE_SESSION;
     ParamByName('ID_SESSION').Value:=_ID_SESSION;
     ParamByName('ID_OBJECT').Value:=_ID_OBJECT;
//:Date,:ID_SESSION,:ID_OBJECT
      CloseOpen(false);
   end;
   if _ID_OBJECT=8 then  btnGrpByut.Visible:=True else btnGrpByut.Visible:=False; 
    self.ID_USER:=_CURRENT_USER_ID;
 end;
end;
procedure TAddTMC.FormClose(Sender: TObject; var Action: TCloseAction);
var
   Str:String;
begin

   Str:='';
   Result:=Str;

  if DS.IsEmpty then exit;

   DS.First;
  while not DS.Eof and (length(str)<10000) do
  begin
  if (id_object=30) then
    Str:=Str + DSNAME.AsString + ';'
    else Str:=Str + DSKOD.AsString + ';' ;
    DS.Next;
  end;
  Result:=Str;

end;

procedure TAddTMC.actDeleteExecute(Sender: TObject);
var
  ID :integer;
begin
  if DS.IsEmpty then exit;
  ID:=DSID_KEY.AsInt64;
  if (ID_OBJECT = 9 )then
  begin
    try
      TR.StartTransaction;
      StPr.StoredProcName:='PUB_SPR_RAZD_ST_SELECT_ANALAZE';
      StPr.Prepare;
      StPr.ParamByName('ID_ST').AsInt64:=ID;
      StPr.ExecProc;
      Radz_st_num:=StPr.ParamByName('RAZD_ST_NUM2').AsInteger;
      Temp:= StPr.ParamByName('ID_RAZD_ST').AsInteger;
      Temp:= StPr.ParamByName('RAZD_ST_NUM1').AsInteger;
      Temp:= StPr.ParamByName('RAZD_ST_NUM3').AsString;
      StPr.Transaction.Commit;
    except on E : Exception
      do begin
        ShowMessage(E.Message);
        StPr.Transaction.Rollback;
        Exit;
      end;
    end;
    try
      TR.StartTransaction;
      StPr.StoredProcName:='MAT_FILTER_CHECK';
      StPr.Prepare;
      StPr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
      StPr.ParamByName('ID_KEY').AsInt64:=Radz_st_num;
      StPr.ParamByName('ID_OBJECT').AsInt64:=11;
      StPr.ExecProc;
      StPr.Transaction.Commit;
    except on E : Exception
      do begin
        ShowMessage(E.Message);
        StPr.Transaction.Rollback;
        Exit;
      end;
    end;
  end;
  try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_FILTER_CHECK';
   StPr.Prepare;
   StPr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   StPr.ParamByName('ID_KEY').AsInt64:=ID;
   StPr.ParamByName('ID_OBJECT').AsInt64:=ID_OBJECT;
   StPr.ExecProc;
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    Exit;
   end;
  end;
  DS.CloseOpen(false);

end;

procedure TAddTMC.actInsertExecute(Sender: TObject);
var
  Res : Variant;
  Str : String ;
  ID : Integer;
  i: Integer;
begin
  params:=nil;
  if (ID_OBJECT=6) or (ID_OBJECT=7) then
  begin
    Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal,Date_SESSION_, 1, 0, 0);
    if VarArrayDimCount(Res)>0 then
    begin
    SetLength(params,VarArrayHighBound(RES,1)+1, 3);
    for i:=0 to VarArrayHighBound(RES,1)  do
    begin
    // debit credit
     params[i][0] := (Res[i][0]);
     params[i][1]:=(RES[i][1]);
     params[i][2] := (RES[i][3]);
    end;
    end;
  end;
  if (ID_OBJECT=8) then
  begin
    // Бюджет
    Res:=GlobalSPR.GetSmetsEx(self,DBHandle,Date_SESSION_,psmSmet,0,0,0);
    if VarArrayDimCount(Res)>0 then
    begin
      if Res[0]<>NULL then
      begin
        ID_SCH := (Res[0]);
        SCH_TITLE:=VarToStr(Res[2]);
        SCH_NUMBER := VarToStr(Res[3]);
      end;
    end;
  end;
  if (ID_OBJECT=9) then
  begin
    Res:=GlobalSPR.GetRazdStSpr(self, DBHandle, fsNormal, Date_SESSION_, 0,allData,cmSt);//allEnable,cmSt);
    if Res<>NULL then
    begin
      ID_SCH:=StrToInt(VarToStr(RES));
      {try
        TR.StartTransaction;
        StPr.StoredProcName:='PUB_SPR_RAZD_ST_SELECT_ANALAZE';
        StPr.Prepare;
        StPr.ParamByName('ID_ST').AsInt64:=ID_SCH;
        StPr.ExecProc;
        Radz_st_num:=StPr.ParamByName('RAZD_ST_NUM2').AsInteger;
        //id_sch:=StPr.ParamByName('RAZD_ST_NUM2').AsInteger;
        Temp:= StPr.ParamByName('ID_RAZD_ST').AsInteger;
        Temp:= StPr.ParamByName('RAZD_ST_NUM1').AsInteger;
        Temp:= StPr.ParamByName('RAZD_ST_NUM3').AsString;
        StPr.Transaction.Commit;
      except on E : Exception
        do begin
          ShowMessage(E.Message);
          StPr.Transaction.Rollback;
          Exit;
        end;
      end;
      {try
        TR.StartTransaction;
        StPr.StoredProcName:='MAT_FILTER_CHECK';
        StPr.Prepare;
        StPr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
        StPr.ParamByName('ID_KEY').AsInt64:=Radz_st_num;
        StPr.ParamByName('ID_OBJECT').AsInt64:=11;
        StPr.ExecProc;
        StPr.Transaction.Commit;
      except on E : Exception
        do begin
          ShowMessage(E.Message);
          StPr.Transaction.Rollback;
          Exit;
        end;
      end; }
    end;
   end;
   if (ID_OBJECT=10) then
   begin
     Res:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date_SESSION_, DEFAULT_ROOT_ID);
     if VarArrayDimCount(Res)>0 then
     begin
       if Res[0][0]<>NULL then
       begin
         ID_SCH := (Res[0][0]);
         SCH_TITLE:=VarToStr(RES[0][1]);
         SCH_NUMBER := VarToStr(RES[0][3]);
       end;
     end;
   end;
   if ( ID_OBJECT=30)then
   begin
     Res:=uPackageManager.LGetNomn(self, DBHandle, fsNormal, 0, id_sch , 0, 0, 0, 0, 0);
     if  VarType(Res) <> varEmpty then id_sch:=res[0];
   end;

   if (ID_OBJECT=6) or (ID_OBJECT=7) then
   begin
   for i:=0 to VarArrayHighBound(RES,1) do
   try
     TR.StartTransaction;
     StPr.StoredProcName:='MAT_FILTER_CHECK';
     StPr.Prepare;
     StPr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
     StPr.ParamByName('ID_KEY').AsInt64:=params[i][0];
     StPr.ParamByName('ID_OBJECT').AsInt64:=ID_OBJECT;
     StPr.ExecProc;
     StPr.Transaction.Commit;
   except on E : Exception
     do begin
       ShowMessage(E.Message);
       StPr.Transaction.Rollback;
       Exit;
     end;
   end;
   end
   else
   begin

   try
     TR.StartTransaction;
     StPr.StoredProcName:='MAT_FILTER_CHECK';
     StPr.Prepare;
     StPr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
     StPr.ParamByName('ID_KEY').AsInt64:=id_sch;
     StPr.ParamByName('ID_OBJECT').AsInt64:=ID_OBJECT;
     StPr.ExecProc;
     StPr.Transaction.Commit;
   except on E : Exception
     do begin
       ShowMessage(E.Message);
       StPr.Transaction.Rollback;
       Exit;
     end;
   end;
   end;
   DS.CloseOpen(false);

end;

procedure TAddTMC.actCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TAddTMC.actGrpByutExecute(Sender: TObject);
var
  Res : Variant;
  id_key:Integer;
begin
  Res:=GlobalSPR.GetSmGrp(self, DBHandle, fsNormal, 0, _CURRENT_USER_ID);
  if VarArrayDimCount(Res)>0 then
  begin
  id_grp_sm:=Res[0];

  ds_grp_sm.close;
  ds_grp_sm.SelectSQL.Clear;
  ds_grp_sm.SelectSQL.Add('select id_smeta from BU_SMET_PLUS_PERIODS where ID_SM_GROUP='+IntToStr(id_grp_sm)+' and :Date_ between date_beg and date_end');
  ds_grp_sm.Prepare;
  ds_grp_sm.ParamByName('Date_').AsDate:= Date_SESSION_;
  ds_grp_sm.CloseOpen(False);

  ds_grp_sm.FetchAll;
  ds_grp_sm.First;

  TR.StartTransaction;
  StPr.StoredProcName:='MAT_FILTER_CHECK';
  while not ds_grp_sm.Eof do
  begin
    id_key:=ds_grp_smID_SMETA.AsInteger;
     StPr.Prepare;
     StPr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
     StPr.ParamByName('ID_KEY').AsInt64:=id_key;
     StPr.ParamByName('ID_OBJECT').AsInt64:=ID_OBJECT;
     StPr.ExecProc;
    ds_grp_sm.Next;

  end;
  try
    StPr.Transaction.Commit;
   except on E : Exception
     do begin
       ShowMessage(E.Message);
       StPr.Transaction.Rollback;
       Exit;
     end;
   end;
  end;
  DS.CloseOpen(false);
end;

end.
