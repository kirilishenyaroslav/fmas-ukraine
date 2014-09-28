unit uNomnAnalize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uResources, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, DB, FIBDataSet, pFIBDataSet, FR_Class, FR_DSet, FR_DBSet,
  cxCheckBox, FIBDatabase, pFIBDatabase, ibase, cxButtonEdit, uSpMatSch,
  uMatasVars, uMatasUtils, ActnList, GlobalSPR, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxInplaceContainer, cxDBTL, cxTLData, ExtCtrls,
  cxCurrencyEdit, cxClasses, cxGridTableView, Buttons, FIBQuery, pFIBQuery,
  pFIBStoredProc;


function ShowNomnFilter(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;_ID_SESSION:Int64;FMS :TFormStyle):Variant;stdcall;

exports ShowNomnFilter;

type
  TNomnAddForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    Panel1: TPanel;
    cxDBTreeList1: TcxDBTreeList;
    AllGroupDataSource: TDataSource;
    AllGroupDataSet: TpFIBDataSet;
    cxDBTreeList1TYPE_RECORD: TcxDBTreeListColumn;
    cxDBTreeList1LINK_TO: TcxDBTreeListColumn;
    cxDBTreeList1ID_NOM: TcxDBTreeListColumn;
    cxDBTreeList1NAME: TcxDBTreeListColumn;
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
    WorkStoredProc: TpFIBStoredProc;
    AllGroupDataSetEND_OR_NOT: TFIBIntegerField;
    AllGroupDataSetTYPE_RECORD: TFIBIntegerField;
    AllGroupDataSetLINK_TO: TFIBBCDField;
    AllGroupDataSetID_NOM: TFIBBCDField;
    AllGroupDataSetNAME: TFIBStringField;
    AddButton: TSpeedButton;
    DelButton: TSpeedButton;
    DelAllButton: TSpeedButton;
    ExitButton: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);


    procedure DelAllButtonClick(Sender: TObject);


  private
    { Private declarations }
   DBHANDLE_1 : TISC_DB_HANDLE;
   ID_USER : Int64;
  public
    { Public declarations }
   MatasMonth, MatasYear: Word;
   PERIOD: TDateTime;
   ID_SCH: integer;
   ID_SESSION:Integer;// содержит  идентификатор  сессии
   Res :Variant;
   constructor Create(AOwner_:TComponent; DBHANDLE_ : TISC_DB_HANDLE;aID_SESSION:Int64);overload;
  end;

var
  NomnAddForm: TNomnAddForm;

implementation

{$R *.dfm}
uses DateUtils,uPackageManager;

function ShowNomnFilter(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; _ID_SESSION:Int64;FMS :TFormStyle):Variant;stdcall;
var
 form : TNomnAddForm;
begin
 form := TNomnAddForm.Create(aOwner, DBHANDLE,_ID_SESSION);

 form.FormStyle:= FMS;
 form.ShowModal;
 ShowNomnFilter:=form.Res;
 form.Free;
end;

constructor TNomnAddForm.Create(AOwner_:TComponent;DBHANDLE_ : TISC_DB_HANDLE;aID_SESSION:Int64);
var
 dy, dm, dd: Word;
begin

 inherited Create(AOwner_);

 if Assigned(DBHandle_) then
  begin
   Self.WorkDatabase.Close;
   Self.DBHANDLE_1:= DBHandle_;
   Self.WorkDatabase.Handle:=DBHANDLE_;
   self.WorkDatabase.Open;
   ID_SESSION:=aID_SESSION;
    AllGroupDataSet.Close;
    AllGroupDataSet.ParamByName('ID_SESSION').Value :=ID_SESSION;
    AllGroupDataSet.CloseOpen(false);
 end;
end;

procedure TNomnAddForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var
   Str:String;
begin
   if FormStyle = fsMDIChild then Action := caFree;
     if AllGroupDataSet.IsEmpty then exit;

   AllGroupDataSet.First;
  while not AllGroupDataSet.Eof do
  begin
    if AllGroupDataSetEND_OR_NOT.AsInteger=1 then Str:=Str + AllGroupDataSetNAME.AsString + ';';
   AllGroupDataSet.Next;
  end;

   Res:=Str;
end;

procedure TNomnAddForm.CancelButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TNomnAddForm.ActionCancelExecute(Sender: TObject);
begin
 Close;
end;



procedure TNomnAddForm.AddButtonClick(Sender: TObject);
 var
 hPack     : HModule;
 SpravFunc : function (aOwner:TComponent;
                     DBHANDLE : TISC_DB_HANDLE;
                     aFS: TFormStyle;  {стиль формы: fsModal или fsMDIChild}
                     aID_USER : INT64; {ид.пользователя}
                     aID_NOMN: int64;  {ид.номенклатуры, если >0, то пытаемся позицироваться}
                     aID_PROP: int64;  {ид. свойства, если >0, то фильтруем записи по свойству, (пока не реализовано!)}
                     aNType: integer;  {фильтр на тип записей: 0 - все, 1 -  ТМЦ, 2 - услуги}
                     aMView: integer;  {пока не используется }
                     aMSelect:integer; {тип выбора записей: 0 - выбор одной записи, 1 - мультивыбор записей, 2 - выбор группы }
                     aLang: integer =0 {язык интерфейса: 0 - русский (по умолчанию), 1 - украинский}
  ):Variant;stdcall;
 Res:Variant;
 Temp:Int64;
begin
 hPack := GetModuleHandle('SpNom.bpl');
 if hPack < 32 then hPack := LoadPackage('SpNom.bpl');
 if hPack > 0 then begin
  @SpravFunc := GetProcAddress(hPack, PCHAR('GetNomnEx'));
  if @SpravFunc <> NIL then Res := SpravFunc(self, DBHANDLE_1, fsNormal, 0, 0, 0, 0, 0, 2, 0);
 end else begin
  ShowMessage(PChar('Error!'));
 end;
 if VarType(Res)<>Null then
 begin
//         ShowMessage('Try');
    try
      Temp:=Res[0];

    except
     on EConvertError do ;
    else

    end;
    if (Temp=0)then Exit;
    //-------------------------------------------------
     try
       WorkTransaction.StartTransaction;
       WorkStoredProc.StoredProcName:='MAT_GROUP_TREE';
       WorkStoredProc.Prepare;
       WorkStoredProc.ParamByName('ID_OBJECT_NOMN').AsInt64:=Res[0];
       WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
       WorkStoredProc.ExecProc;
       WorkStoredProc.Transaction.Commit;
      except on E : Exception
       do begin
        ShowMessage(E.Message);
        WorkStoredProc.Transaction.Rollback;
        Exit;
       end;
      end;
       AllGroupDataSet.CloseOpen(false);
    ///----------------

 end;

end;

procedure TNomnAddForm.DelButtonClick(Sender: TObject);
var
  ID:Int64;
  Link:Int64;
begin
 ID:=AllGroupDataSetID_NOM.AsInt64;
 Link:=AllGroupDataSetLINK_TO.AsInt64;
 try
   WorkTransaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_DEL_FROM_TMP_FTR_RECORD';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('ID_NOMN').AsInt64:=ID;
   WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
 AllGroupDataSet.Close;
 AllGroupDataSet.ParamByName('ID_SESSION').Value :=ID_SESSION;
 AllGroupDataSet.CloseOpen(false);
 AllGroupDataSet.Locate('id_nom',Link,[]);


end;

procedure TNomnAddForm.ExitButtonClick(Sender: TObject);
begin
 Close();
end;
procedure TNomnAddForm.DelAllButtonClick(Sender: TObject);
 begin

 try
   WorkTransaction.StartTransaction;
   WorkStoredProc.StoredProcName:='MAT_DEL_FROM_TMP_FILTER';
   WorkStoredProc.Prepare;
   WorkStoredProc.ParamByName('ID_SESSION').AsInt64:=ID_SESSION;
   WorkStoredProc.ExecProc;
   WorkStoredProc.Transaction.Commit;
  except on E : Exception
   do begin
    ShowMessage(E.Message);
    WorkStoredProc.Transaction.Rollback;
    Exit;
   end;
  end;
end;
end.


