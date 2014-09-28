{               "���� �������-������������ ���������, ��, ��� � ���"           }
{                        ������ ������� ��������                                }
{                                                                              }
{               (c) ������� �.�. 2004-2007                                     }
{                                                                              }
unit uAddFormTMC;

interface


uses
   IBASE, GlobalSPR,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBQuery, pFIBQuery , pFIBStoredProc, Buttons, ActnList;


type
  TAddFormTMC = class(TForm)
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    TR: TpFIBTransaction;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel: TPanel;
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
    DSID_KEY: TFIBBCDField;
    DSNAME: TFIBStringField;
    DSKOD: TFIBStringField;
    cxGrid1DBTableView1ID_KEY: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1KOD: TcxGridDBColumn;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    ExitButton: TSpeedButton;
    ActionList1: TActionList;
    acInsert: TAction;
    acDelete: TAction;
    acClose: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acInsertExecute(Sender: TObject);

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

    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);overload;


  end;

var
  AddFormTMC: TAddFormTMC;

implementation

{$R *.dfm}
uses DateUtils,uPackageManager;



constructor TAddFormTMC.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DB.Close;
   Self.DBHANDLE:=DBHANDLE;
   Self.DB.Handle:=DBHANDLE;
   Self.Caption:='������ ��������� ���������� �� :: '+NameForm;
   self.ID_OBJECT:=_ID_OBJECT;
   self.ID_SESSION:=_ID_SESSION;
   self.Date_SESSION_:=DATE_SESSION;
   self.ExitButton.Align:=alRight;
   with Self.DS do
   begin
     Close;
     ParamByName('Date').Value:=DATE_SESSION;
     ParamByName('ID_SESSION').Value:=_ID_SESSION;
     ParamByName('ID_OBJECT').Value:=_ID_OBJECT;
//:Date,:ID_SESSION,:ID_OBJECT
      CloseOpen(false);
   end;


 end;
end;
 {
var
  Res : Variant;
begin
   // ����� ��������� � ����������
 Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal, Date, 1, -1, -1);
 if VarArrayDimCount(Res)>0 then
 begin
   ID_SCH := (Res[0][0]);
   SCH_TITLE:=VarToStr(RES[0][1]);
   SCH_NUMBER := VarToStr(RES[0][3]);
 end;
}

{
var
 Res:variant;
begin
       // �����
 Res:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date, DEFAULT_ROOT_ID);
 if VarArrayDimCount(Res)>0 then
 begin
  if Res[0][0]<>NULL then begin
   Res[0][0]  - ������������� �����
   Res[0][1]  - ������������ �����
   Res[0][2]  - ��� �����
 end;
end
}

procedure TAddFormTMC.FormClose(Sender: TObject; var Action: TCloseAction);
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


procedure TAddFormTMC.acCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TAddFormTMC.acDeleteExecute(Sender: TObject);
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

procedure TAddFormTMC.acInsertExecute(Sender: TObject);
var
  Res : Variant;
  Str : String ;
  ID : Integer;
begin
  if (ID_OBJECT=6) or (ID_OBJECT=7) then
  begin
    Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal,Date_SESSION_, 1, -1, -1);
    if VarArrayDimCount(Res)>0 then
    begin
      // debit credit
      ID_SCH := (Res[0][0]);
      SCH_TITLE:=VarToStr(RES[0][1]);
      SCH_NUMBER := VarToStr(RES[0][3]);
    end;
  end;
  if (ID_OBJECT=8) then
  begin
    // ������
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
    Res:=GlobalSPR.GetRazdStSpr(self, DBHandle, fsNormal, Date_SESSION_, 0,allEnable,cmSt);
    if Res<>NULL then
    begin
      ID_SCH:=StrToInt(VarToStr(RES));
      try
        TR.StartTransaction;
        StPr.StoredProcName:='PUB_SPR_RAZD_ST_SELECT_ANALAZE';
        StPr.Prepare;
        StPr.ParamByName('ID_ST').AsInt64:=ID_SCH;
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
   try
     TR.StartTransaction;
     StPr.StoredProcName:='MAT_FILTER_CHECK';
     StPr.Prepare;
     StPr.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
     StPr.ParamByName('ID_KEY').AsInt64:=ID_SCH;
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

end.