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

  function ShowFilterParams(aOwner:TComponent; DBHANDLE: TISC_DB_HANDLE; ID_SESSION: Integer; ID_OBJECT:Integer; DATE_SESSION:TDateTime; NameForm:String):Variant;stdcall;
  exports ShowFilterParams;

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
    cxGrid1DBTableView1ID_KEY: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1KOD: TcxGridDBColumn;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    ExitButton: TSpeedButton;
    DSID_KEY: TFIBBCDField;
    DSNAME: TFIBStringField;
    DSKOD: TFIBStringField;
    procedure AddButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);

  private
     DBHANDLE : TISC_DB_HANDLE;
     ID_USER : Int64;{ Public declarations }

  public
    Radz_st_num :Integer;
    Temp :Variant;
    ID_OBJECT :Integer;
    ID_SESSION:Integer;

    ID_SCH       :Integer;
    SCH_TITLE    :String;
    SCH_NUMBER   :String;
    DATE_SESSION :TDateTime;
    Result :Variant;
    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:String);overload;
  end;

var
  AddForm: TAddForm;

implementation

{$R *.dfm}

function ShowFilterParams(aOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_SESSION:Integer; ID_OBJECT:Integer; DATE_SESSION:TDateTime; NameForm:String):Variant;stdcall;
var
  FM:TAddForm;
begin
  FM:=TAddForm.Create(AOwner,DBHANDLE, ID_SESSION, ID_OBJECT, DATE_SESSION, NameForm);
  FM.ShowModal;
  ShowFilterParams:=FM.Result;
  FM.Free;
end;

constructor TAddForm.Create(AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer; aID_OBJECT:Integer; aDATE_SESSION:TDateTime; aNameForm:String);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DB.Close;
   Self.DBHANDLE:=DBHANDLE;
   Self.DB.Handle:=DBHANDLE;
   Self.Caption:='Äמהאעט ןאנאלוענט פ³כüענאצ³¿ ןמ '+aNameForm;
   self.ID_OBJECT:=aID_OBJECT;
   self.ID_SESSION:=aID_SESSION;
   self.DATE_SESSION:=aDATE_SESSION;
   self.ExitButton.Align:=alRight;

   if ID_OBJECT =9 then
   begin
    with Self.DS do
    begin

      Close;
      ParamByName('Date').Value:=DATE_SESSION;
      ParamByName('ID_SESSION').Value:=ID_SESSION;
      ParamByName('ID_OBJECT').Value:=11;

      CloseOpen(false);
    end;
   end
   else
   begin
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
end;

procedure TAddForm.AddButtonClick(Sender: TObject);
var
  Res : Variant;
begin

   if (ID_OBJECT=6) or (ID_OBJECT=7) or (ID_OBJECT=30) then
   begin
    Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal,DATE_SESSION, 1, -1, -1);
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
       // Á‏הזוע
   //---------------------------------------------------------------------------
  //---------------------------------------------------------------------------
    Res:=GlobalSPR.GetSmetsEx(self,DBHandle,DATE_SESSION,psmSmet,0,0,0);
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
         Res:=GlobalSPR.GetRazdStSpr(self, DBHandle, fsNormal, Date_SESSION, 0,allEnable,cmSt);
   //       ShowMessage(VarToStr(Res));
   // if VarArrayDimCount(Res)>0 then
   // begin
     if Res<>NULL then
     begin

      Radz_st_num:=StrToInt(VarToStr(Res));

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
         do
         begin
          ShowMessage(E.Message);
          StPr.Transaction.Rollback;
          Exit;
         end;
      end;
     end;

    with DS do
    begin

      Close;
      ParamByName('Date').Value:=Date_SESSION ;
      ParamByName('ID_SESSION').Value:=ID_SESSION;
      ParamByName('ID_OBJECT').Value:=11;

      CloseOpen(false);
    end;
     Exit;
   end;

   if (ID_OBJECT=10) then
   begin
       // ÊÅÊÂÈ
    Res:=GlobalSPR.GetKEKVSpr(self, DBHandle, fsNormal, Date_SESSION, DEFAULT_ROOT_ID);
    if VarArrayDimCount(Res)>0 then
    begin
     if Res[0][0]<>NULL then
     begin
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
//   ShowMessage(SCH_TITLE);
      DS.CloseOpen(false);
    if SCH_TITLE='' then Exit;

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
  Radz_st_num:=DSID_KEY.AsInt64;
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


procedure TAddForm.Button1Click(Sender: TObject);
begin
 DS.CloseOpen(false);
end;

end.
