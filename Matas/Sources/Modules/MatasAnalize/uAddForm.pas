{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль анализа операций                                }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uAddForm;

interface


uses
   IBASE, GlobalSPR,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBQuery, pFIBQuery , pFIBStoredProc, Buttons;


type
  TAddForm = class(TForm)
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
    procedure AddButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

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

    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER: int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);overload;


  end;

var
  AddForm: TAddForm;

implementation

{$R *.dfm}
uses DateUtils;



constructor TAddForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64;_ID_SESSION:Integer;_ID_OBJECT:Integer; DATE_SESSION:TDateTime;NameForm:String);
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
   // Счета дебетовые и кредитовые
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
       // КЕКВИ
 Res:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date, DEFAULT_ROOT_ID);
 if VarArrayDimCount(Res)>0 then
 begin
  if Res[0][0]<>NULL then begin
   Res[0][0]  - идентификатор КЕКВа
   Res[0][1]  - наименование КЕКВа
   Res[0][2]  - код КЕКВа
 end;
end
}

procedure TAddForm.AddButtonClick(Sender: TObject);
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
   //---------------------------------------------------------------------------
  if (ID_OBJECT=8) then
   begin
       // Бюджет
   //---------------------------------------------------------------------------
  //---------------------------------------------------------------------------
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
   //---------------------------------------------------------------------------


   if (ID_OBJECT=9) then
   begin

         Res:=GlobalSPR.GetRazdStSpr(self, DBHandle, fsNormal, Date_SESSION_, 0,allEnable,cmSt);
//         ShowMessage(VarToStr(Res));
   // if VarArrayDimCount(Res)>0 then
   // begin
     if Res<>NULL then
     begin

    ID_SCH:=StrToInt(VarToStr(RES));

   try
   TR.StartTransaction;
   StPr.StoredProcName:='PUB_SPR_RAZD_ST_SELECT_ANALAZE';
   StPr.Prepare;
   {
    ID_SESSION NUMERIC(10,0),
    ID_KEY NUMERIC(10,0),
    ID_OBJECT NUMERIC(10,0)
    }
   StPr.ParamByName('ID_ST').AsInt64:=ID_SCH;

   StPr.ExecProc;

   Radz_st_num:=StPr.ParamByName('RAZD_ST_NUM2').AsInteger;
   Temp:= StPr.ParamByName('ID_RAZD_ST').AsInteger;
   Temp:= StPr.ParamByName('RAZD_ST_NUM1').AsInteger;
   Temp:= StPr.ParamByName('RAZD_ST_NUM3').AsString;
//   ShowMessage(IntToStr(Radz_st_num));


   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    Exit;
   end;
  end;
    //--------------------------------------------------------------------------





    //--------------------------------------------------------------------------
      try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_FILTER_CHECK';
   StPr.Prepare;
   {
    ID_SESSION NUMERIC(10,0),
    ID_KEY NUMERIC(10,0),
    ID_OBJECT NUMERIC(10,0)
    }
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
    //--------------------------------------------------------------------------

     end;
   // end;


   end;
   //---------------------------------------------------------------------------

   if (ID_OBJECT=10) then
   begin
       // КЕКВИ
    Res:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date_SESSION_, DEFAULT_ROOT_ID);
    if VarArrayDimCount(Res)>0 then
    begin
     if Res[0][0]<>NULL then
     begin
  //   Res[0][0]  - идентификатор КЕКВа
  //   Res[0][1]  - наименование КЕКВа
  //   Res[0][2]  - код КЕКВа

     ID_SCH := (Res[0][0]);
     SCH_TITLE:=VarToStr(RES[0][1]);
     SCH_NUMBER := VarToStr(RES[0][3]);
      //--------------------------------------
      // Proc add to DB
      //--------------------------------------
     end;
    end;
   end;
  //----------------------------------------------------------------------------
  try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_FILTER_CHECK';
   StPr.Prepare;
   {
    ID_SESSION NUMERIC(10,0),
    ID_KEY NUMERIC(10,0),
    ID_OBJECT NUMERIC(10,0)
    }
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

  //----------------------------------------------------------------------------
    DS.CloseOpen(false);

end;

procedure TAddForm.ExitButtonClick(Sender: TObject);
begin
 Close();
end;

procedure TAddForm.DelButtonClick(Sender: TObject);
 var
  ID :integer;
begin

  if DS.IsEmpty then exit;

   ID:=DSID_KEY.AsInt64;

  if (ID_OBJECT = 9 )then
  begin
 //----------------------------------------------------------------------------
//  ShowMessage('ghjghj');
  //----------------------------------------------------------------------------
    try
   TR.StartTransaction;
   StPr.StoredProcName:='PUB_SPR_RAZD_ST_SELECT_ANALAZE';
   StPr.Prepare;
   {
    ID_SESSION NUMERIC(10,0),
    ID_KEY NUMERIC(10,0),
    ID_OBJECT NUMERIC(10,0)
    }
   StPr.ParamByName('ID_ST').AsInt64:=ID;

   StPr.ExecProc;

   Radz_st_num:=StPr.ParamByName('RAZD_ST_NUM2').AsInteger;
   Temp:= StPr.ParamByName('ID_RAZD_ST').AsInteger;
   Temp:= StPr.ParamByName('RAZD_ST_NUM1').AsInteger;
   Temp:= StPr.ParamByName('RAZD_ST_NUM3').AsString;

//   ShowMessage('Radz_st_num del '+IntToStr(Radz_st_num));
   StPr.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    StPr.Transaction.Rollback;
    Exit;
   end;
  end;
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
      try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_FILTER_CHECK';
   StPr.Prepare;
   {
    ID_SESSION NUMERIC(10,0),
    ID_KEY NUMERIC(10,0),
    ID_OBJECT NUMERIC(10,0)
    }
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
    //--------------------------------------------------------------------------
  //----------------------------------------------------------------------------
  end;







  //----------------------------------------------------------------------------
  try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_FILTER_CHECK';
   StPr.Prepare;
   {
    ID_SESSION NUMERIC(10,0),
    ID_KEY NUMERIC(10,0),
    ID_OBJECT NUMERIC(10,0)
    }
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

  //----------------------------------------------------------------------------



    DS.CloseOpen(false);
end;

procedure TAddForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   Str:String;
begin

   Str:='';
   Result:=Str;

  if DS.IsEmpty then exit;

   DS.First;
  while not DS.Eof do
  begin
    Str:=Str + DSKOD.AsString + ';';
    DS.Next;
  end;
  Result:=Str;
end;


end.
