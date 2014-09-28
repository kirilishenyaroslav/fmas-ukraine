unit ReeUrzbImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxTL, cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery,TiCommonProc, cxMaskEdit, pFIBStoredProc,DogLoaderUnit,
  ActnList, cxCalendar, cxContainer, cxLabel, cxImage, cxCheckBox,Accmgmt,Kernel;

type
  TFormExport = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Database: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGrid2: TcxGrid;
    cxGrid2TableView1: TcxGridTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid2TableView1ColumnNumRee: TcxGridColumn;
    cxGrid2TableView1ColumnPeriod: TcxGridColumn;
    cxGrid2TableView1ColumnDataSch: TcxGridColumn;
    cxGrid2TableView1ColumnNumReeTi: TcxGridColumn;
    cxGrid2TableView1ColumnNumSch: TcxGridColumn;
    cxGrid2TableView1ColumnContragent: TcxGridColumn;
    StoredProc: TpFIBStoredProc;
    cxGrid2TableView1ColumIdSch: TcxGridColumn;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    cxStyle1: TcxStyle;
    cxLabel1: TcxLabel;
    cxImage1: TcxImage;
    cxGrid2TableView1ColumnIs_signature: TcxGridColumn;
    cxStyle2: TcxStyle;
    cxGrid2TableView1ColumnTypeRow: TcxGridColumn;
    cxImage2: TcxImage;
    cxLabel2: TcxLabel;
    cxStyle3: TcxStyle;
    cxLabel3: TcxLabel;
    cxImage3: TcxImage;
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxGrid2TableView1StylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SelectAll;
  end;



implementation

{$R *.dfm}


procedure TFormExport.FormCreate(Sender: TObject);
begin
  cxGrid2TableView1ColumnContragent.DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1ColumnNumRee.DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1ColumnPeriod.DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1ColumnDataSch.DataBinding.ValueTypeClass := TcxDateTimeValueType;
  cxGrid2TableView1ColumnNumReeTi.DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1ColumnNumSch.DataBinding.ValueTypeClass := TcxStringValueType;
  cxGrid2TableView1ColumIdSch.DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1ColumnIs_signature.DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1ColumnTypeRow.DataBinding.ValueTypeClass := TcxIntegerValueType;
end;

procedure TFormExport.SelectAll;
var
  i : Integer;
begin

  cxGrid2TableView1.DataController.RecordCount := DataSet.RecordCount;
  for i :=0 to cxGrid2TableView1.DataController.RecordCount - 1 do
  begin
    cxGrid2TableView1ColumnContragent.DataBinding.DataController.Values[i, 6] := GetFullName(Database.Handle ,DataSet.FBN('NAME_CUSTOMER').AsString);
    cxGrid2TableView1ColumnNumRee.DataBinding.DataController.Values[i, 0] := DataSet.FBN('NUM_REESTR').AsVariant;
    cxGrid2TableView1ColumnPeriod.DataBinding.DataController.Values[i, 2] := DataSet.FBN('PERIOD').AsString;
    cxGrid2TableView1ColumnNumSch.DataBinding.DataController.Values[i, 3] := DataSet.FBN('num_sch').AsString;
    cxGrid2TableView1ColumnNumReeTi.DataBinding.DataController.Values[i, 4] := DataSet.FBN('LAST_NOMER_VID_NAKL').asInteger;
    cxGrid2TableView1ColumnDataSch.DataBinding.DataController.Values[i, 5] := DataSet.FBN('DATE_SCH').AsDateTime;
     cxGrid2TableView1ColumIdSch.DataBinding.DataController.Values[i,7 ] := DataSet.FBN('ID_KEY').asInteger;
      cxGrid2TableView1ColumnIs_signature.DataBinding.DataController.Values[i,1 ] := DataSet.FBN('IS_SIGNATURE').asInteger;
      cxGrid2TableView1ColumnTypeRow.DataBinding.DataController.Values[i, 8] := DataSet.FBN('TYPE_ROW').asInteger;
    DataSet.Next;
  end;
end;

procedure TFormExport.Action1Execute(Sender: TObject);
var i,j         : Integer;
    KEY_SESSION : Int64;
    workdate    : TDate;
    STRU        : KERNEL_MODE_STRUCTURE;
    DoResult    : Boolean;
    ErrorList   : TStringList;
    s           : string;
begin

   // GetFullName(Database.Handle ,'ТОВ ывафыва')

  for i :=0 to cxGrid2TableView1.DataController.RecordCount - 1 do
  begin
    StoredProc.Transaction.StartTransaction;
    StoredProc.StoredProcName:='DOG_ARND_SCH_EXPORT_TO_TI';
    StoredProc.ParamByName('ID_SCH').AsInt64:=cxGrid2TableView1ColumIdSch.DataBinding.DataController.Values[i, 7];
    StoredProc.ParamByName('ID_USER').AsInt64:=GetUserId;
    StoredProc.ParamByName('FULL_NAME_CUSTOMER').AsString:=cxGrid2TableView1ColumnContragent.DataBinding.DataController.Values[i, 6];
    StoredProc.ParamByName('DATE_SCH').AsDate:=cxGrid2TableView1ColumnDataSch.DataBinding.DataController.Values[i, 5];
    StoredProc.ParamByName('NUM_NAKL').AsString:=cxGrid2TableView1ColumnNumReeTi.DataBinding.DataController.Values[i, 4];
     StoredProc.ExecProc ;
     //StoredProc.Transaction.Commit;
     // добавление проводки
     KEY_SESSION := StoredProc.ParamByName('KEY_SESSION').value;
     workdate    := StoredProc.ParamByName('WORKDATE').value;
     //ShowMessage(IntToStr(KEY_SESSION));

    STRU.KEY_SESSION   := KEY_SESSION;
    STRU.WORKDATE      := WORKDATE;
    STRU.DBHANDLE      := StoredProc.Database.Handle;
    STRU.TRHANDLE      := StoredProc.Transaction.Handle;
    STRU.KERNEL_ACTION := 1;
    STRU.ID_USER       := DogLoaderUnit.SYS_ID_USER;

    try
      DoResult:=Kernel.KernelDo(@STRU);
    except
     on E:Exception do
     begin
      ShowMessage('Помилка ядра ' + E.Message);
      Exit;
     end;
    end;

   if not DoResult then
   begin
    ErrorList := Kernel.GetDocErrorsListEx(@STRU);

    s := '';
    for j:=0 to ErrorList.Count - 1 do
     begin
       if s <> '' then s := s + #13;
       s := s + ErrorList.Strings[j];
     end;

     ShowMessage(s);
     StoredProc.Transaction.Rollback;
     Exit;
   end;
     StoredProc.Transaction.Commit;
    DataSet.Next;
  end;
  ShowMessage('Дані експортовано');
    ModalResult :=mrYes;


end;
procedure TFormExport.Action2Execute(Sender: TObject);
begin
ModalResult :=mrCancel;
end;

procedure TFormExport.cxGrid2TableView1StylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
 if( ARecord.DisplayTexts[8]='1')  then
 AStyle:=cxStyle2 ;
 if( ARecord.DisplayTexts[8]='2')  then
 AStyle:=cxStyle2 ;
 if( ARecord.DisplayTexts[8]='3')  then
 AStyle:=cxStyle3 ;
end;

end.
