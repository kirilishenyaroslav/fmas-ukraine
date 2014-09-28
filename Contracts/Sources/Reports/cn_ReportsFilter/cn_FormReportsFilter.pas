unit cn_FormReportsFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase,Cn_uReportsConst,cn_Common_Funcs,cn_Common_Types, FIBDatabase,
  pFIBDatabase, ActnList, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, cxLookAndFeelPainters, StdCtrls, cxButtons,cn_Common_Loader,
  ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxCheckBox, cxGridTableView,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, RxMemDS, ExtCtrls;

type
  TfrmFilter = class(TForm)
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    StoredProc: TpFIBStoredProc;
    pFIBDataSetCreateFilter: TpFIBDataSet;
    ActionList1: TActionList;
    ActionF10: TAction;
    StatusBar1: TStatusBar;
    RxMemoryDataPrintSetup: TRxMemoryData;
    DataSourcePrintSetup: TDataSource;
    pFIBDataSetSetup: TpFIBDataSet;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    SelectField: TcxGridDBColumn;
    NameField: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    CNT_Filter: TcxGridDBColumn;
    Panel1: TPanel;
    cxButtonOK: TcxButton;
    Clean_button: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionF10Execute(Sender: TObject);
    procedure cxButtonOKClick(Sender: TObject);
    procedure Init();
    procedure GridDBViewDblClick(Sender: TObject);
    procedure Clean_buttonClick(Sender: TObject);
  private
    { Private declarations }
    procedure SaveFilter(Type_filter:Integer;Values:Int64);
  public
    ID_SESSION:Int64;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE; aId_Session:Int64);reintroduce;
    { Public declarations }
  end;
  function ShowReportFilter(AParameter:TcnSimpleParams):Variant;stdcall;
  exports  ShowReportFilter;

var
  frmFilter: TfrmFilter;
  res:Variant;
  PLanguageIndex:Integer;
implementation

uses
  GetFacilt;
{$R *.dfm}

function ShowReportFilter(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmFilter;
begin
  if AParameter.Formstyle = fsMDIChild then
  if IsMDIChildFormShow(TfrmFilter) then exit;
  ViewForm := TfrmFilter.Create(AParameter.Owner, AParameter.Db_Handle, AParameter.ID_SESSION);
  ViewForm.FormStyle:= AParameter.Formstyle;
  case ViewForm.FormStyle of
    fsNormal, fsStayOnTop : ViewForm.ShowModal;
    fsMDIChild	          : ViewForm.Show;
   else begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
  Result:=res;
end;

constructor TfrmFilter.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;aId_Session:Int64);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AOwner);
  DB.Handle:=DB_Handle;
  ID_SESSION:=aId_Session;
  Screen.Cursor:=crDefault;
end;


procedure TfrmFilter.FormCreate(Sender: TObject);
begin
  PLanguageIndex:= cn_Common_Funcs.cnLanguageIndex();
  caption:=Cn_uReportsConst.cn_RepFilterFT[PLanguageIndex];
  Init();
end;

procedure TfrmFilter.ActionF10Execute(Sender: TObject);
begin
  cxButtonOKClick(self);
end;

procedure TfrmFilter.cxButtonOKClick(Sender: TObject);
Var
 Check:integer;
 i:integer;
begin
  Check:=0;
  RxMemoryDataPrintSetup.First;
  for i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
   begin
    if RxMemoryDataPrintSetup.FieldByName('RxSelectField').Value = 1 then check:=1;
    RxMemoryDataPrintSetup.Next;
   End;
  Res:=VarArrayCreate([0,1],varVariant);
  res[0]:=VarArrayOf([Check]);
  close;
end;

procedure TfrmFilter.Init();
var
  i:Integer;
begin
  //чтение параметров для фильтрации
  pFIBDataSetCreateFilter.Database:=    DB;
  pFIBDataSetCreateFilter.Transaction:= ReadTransaction;
  pFIBDataSetCreateFilter.Active:=      false;
  pFIBDataSetCreateFilter.ParamByName('param_session').AsInt64:=ID_SESSION;
  pFIBDataSetCreateFilter.Active:=      true;
  pFIBDataSetCreateFilter.FetchAll;
  pFIBDataSetCreateFilter.First;

  //чтение параметров фильтрации
  pFIBDataSetSetup.Active:=false;
  pFIBDataSetSetup.Active:=true;
  pFIBDataSetSetup.FetchAll;

  RxMemoryDataPrintSetup.EmptyTable;
  for i:=0 to pFIBDataSetSetup.RecordCount-1 do
    begin
      RxMemoryDataPrintSetup.Open;
      RxMemoryDataPrintSetup.Insert;
      RxMemoryDataPrintSetup.FieldByName('RxSelectField').Value := 0;    //признак выбраного поля для фильтрации
      RxMemoryDataPrintSetup.FieldByName('RxCNT_Filter').Value  := 0;    //кол-во выбраных значений в поле
      RxMemoryDataPrintSetup.FieldByName('RxNameField').Value   := pFIBDataSetSetup.FieldByName('NAME_FILTER').AsString; //название поля
      RxMemoryDataPrintSetup.FieldByName('RxId_Filter').Value   := pFIBDataSetSetup.FieldByName('ID_FILTER').AsString;   //айдишник поля

      pFIBDataSetCreateFilter.Locate('TYPE_VALUE',pFIBDataSetSetup.FieldByName('ID_FILTER').AsInteger,[]);


      if (pFIBDataSetCreateFilter.FieldByName('CNT').AsInteger>0) and
         (pFIBDataSetSetup.FieldByName('ID_FILTER').AsInteger=pFIBDataSetCreateFilter.FieldByName('TYPE_VALUE').AsInteger) then
        begin
          RxMemoryDataPrintSetup.FieldByName('RxCNT_Filter').Value:=pFIBDataSetCreateFilter.FieldByName('CNT').AsInteger;
          RxMemoryDataPrintSetup.FieldByName('RxSelectField').Value:=1;
        end;
      RxMemoryDataPrintSetup.Post;
      pFIBDataSetSetup.Next;
    end;
end;

procedure TfrmFilter.SaveFilter(Type_filter:Integer;Values:Int64);
begin
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='CN_TMP_VALUE_PARAMETRS_INIT';
  StoredProc.ParamByName('IN_ID_SESSION').AsInt64:=ID_SESSION;
  StoredProc.ParamByName('IN_TYPE_VALUE').AsInteger:=Type_filter;
  StoredProc.ParamByName('IN_VALUE_PARAM').AsInteger:=Values;
  StoredProc.Prepare;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;
  WriteTransaction.Commit;
end;

procedure TfrmFilter.GridDBViewDblClick(Sender: TObject);
var
  ResultFacult:Variant;
  Facult:TfrmGetFacult;
  i:Integer;
  cnt:Integer;
begin
  If pFIBDataSetSetup.RecordCount = 0  then exit;

  RxMemoryDataPrintSetup.Open;
  RxMemoryDataPrintSetup.Edit;
  Facult:=TfrmGetFacult.Create(self,RxMemoryDataPrintSetup.FieldByName('RxId_Filter').AsInteger, ID_SESSION);
  ResultFacult:=Facult.Get();
  //удаляем предыдущий параметр
  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName:='CN_TMP_VALUE_PARAMETRS_DEL';
  StoredProc.Prepare;
  StoredProc.ParamByName('IN_ID_SESSION').AsInt64:=ID_SESSION;
  StoredProc.ParamByName('IN_TYPE_VALUE').AsInteger:=RxMemoryDataPrintSetup.FieldByName('RxId_Filter').AsInteger;
  try
   StoredProc.ExecProc;
   except
    begin
     WriteTransaction.Rollback;
     Exit;
    end;
  end;
  WriteTransaction.Commit;
  
  If VarArrayDimCount(ResultFacult)>0 then
    begin
      cnt:=VarArrayHighBound(ResultFacult,1)-VarArrayLowBound(ResultFacult,1);
      for i:=0 to cnt do
        begin
          SaveFilter(RxMemoryDataPrintSetup.FieldByName('RxId_Filter').AsInteger,ResultFacult[i]);
        end;
      RxMemoryDataPrintSetup.FieldByName('RxCNT_Filter').Value:=IntToStr(cnt+1);
      RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger:=1;
    end
   else
    begin
      RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger:=0;
      RxMemoryDataPrintSetup.FieldByName('RxCNT_Filter').Value:=0;
    end;
  RxMemoryDataPrintSetup.Post;
end;

procedure TfrmFilter.Clean_buttonClick(Sender: TObject);
Var
 i:integer;
begin

  RxMemoryDataPrintSetup.First;

  For i:=0 to RxMemoryDataPrintSetup.RecordCount-1 do
   Begin
    RxMemoryDataPrintSetup.Open;
    RxMemoryDataPrintSetup.Edit;
    RxMemoryDataPrintSetup.FieldByName('RxSelectField').AsInteger:=0;
    RxMemoryDataPrintSetup.FieldByName('RxCNT_Filter').Value:=0;
    RxMemoryDataPrintSetup.Next;
   End;
 // RxMemoryDataPrintSetup.Post; 

  if ID_SESSION <> null then
   Begin
    WriteTransaction.StartTransaction;
    StoredProc.StoredProcName := 'CN_TMP_VALUE_PARAMS_DEL_ALL';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_SESSION').AsInt64       := ID_SESSION;
    StoredProc.ExecProc;
    Try
     WriteTransaction.Commit;
     StoredProc.Close;
     except
      on E:Exception do
       begin
        WriteTransaction.Rollback;
        ShowMessage('Error in CN_TMP_VALUE_PARAMS_DEL_ALL');
        StoredProc.close;
        Screen.Cursor := crDefault;
        raise;
       end;
     end;
   end;
End;

end.
