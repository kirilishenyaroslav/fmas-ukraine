unit uDocWorkFilterSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBQuery, pFIBQuery , pFIBStoredProc, Buttons, ibase, GlobalSPR, uMatasVars, uMatasUtils;

  procedure ShowFilterSch(aOwner:TComponent; DBHANDLE: TISC_DB_HANDLE; ID_SESSION: Integer; var ResultStr:string);

const
  ID_OBJECT = 6;

type
  TDocWorkFilterSchForm = class(TForm)
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

  private
     DBHANDLE : TISC_DB_HANDLE;

  public
    Radz_st_num :Integer;
    Temp :Variant;
    ID_SESSION:Integer;
    ID_SCH       :Integer;
    SCH_TITLE    :String;
    SCH_NUMBER   :String;
    ResultStr : string;
    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer);overload;
  end;

var
  DocWorkFilterSchForm: TDocWorkFilterSchForm;

implementation

{$R *.dfm}

procedure ShowFilterSch(aOwner:TComponent; DBHANDLE: TISC_DB_HANDLE; ID_SESSION: Integer; var ResultStr:string);
var
  T:TDocWorkFilterSchForm;
begin
  T:=TDocWorkFilterSchForm.Create(aOwner,DBHANDLE, ID_SESSION);
  T.ShowModal;
  ResultStr:=T.ResultStr;
  T.Free;
end;

constructor TDocWorkFilterSchForm.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_SESSION:Integer);
begin
 inherited Create(AOwner);
 if Assigned(aDBHandle)
 then begin
   Self.DB.Close;
   Self.DBHANDLE:=aDBHANDLE;
   Self.DB.Handle:=aDBHANDLE;
   Self.Caption:='Параметри фільтрації по кореспондуючим рахункам';
   self.ID_SESSION:=aID_SESSION;
   self.ExitButton.Align:=alRight;

   with Self.DS do
   begin
    Close;
    ParamByName('Date').Value:=_MATAS_PERIOD;
    ParamByName('ID_SESSION').Value:=ID_SESSION;
    ParamByName('ID_OBJECT').Value:=ID_OBJECT;
    CloseOpen(false);
   end;
  end;
end;

procedure TDocWorkFilterSchForm.AddButtonClick(Sender: TObject);
var
  Res : Variant;
begin
  Res:=GlobalSPR.GetSch(self, DBHandle, fsNormal,_MATAS_PERIOD, 1, -1, -1);
  if VarArrayDimCount(Res)>0 then
  begin
   ID_SCH := (Res[0][0]);
   SCH_TITLE:=VarToStr(RES[0][1]);
   SCH_NUMBER := VarToStr(RES[0][3]);
   try
    TR.StartTransaction;
    StPr.StoredProcName:='MAT_FILTER_CHECK';
    StPr.Prepare;
    StPr.ParamByName('ID_SESSION').Value:=ID_SESSION;
    StPr.ParamByName('ID_KEY').Value:=ID_SCH;
    StPr.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
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
end;

procedure TDocWorkFilterSchForm.ExitButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TDocWorkFilterSchForm.DelButtonClick(Sender: TObject);
 var
  ID :integer;
begin
  if DS.IsEmpty then exit;

  ID:=DSID_KEY.AsInteger;

  try
   TR.StartTransaction;
   StPr.StoredProcName:='MAT_FILTER_CHECK';
   StPr.Prepare;
   StPr.ParamByName('ID_SESSION').Value:=ID_SESSION;
   StPr.ParamByName('ID_KEY').Value:=ID;
   StPr.ParamByName('ID_OBJECT').Value:=ID_OBJECT;
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

procedure TDocWorkFilterSchForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   Str:String;
begin
  Str:='';
  ResultStr:=Str;
  if DS.IsEmpty then exit;
  DS.First;
  while not DS.Eof do
  begin
    Str:=Str + DSKOD.AsString + ';';
    DS.Next;
  end;
  ResultStr:=Str;
end;


end.
