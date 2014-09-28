unit SvodByGroupSmFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxCalc, cxTextEdit,
  dxBar, dxBarExtItems, cxGridBandedTableView, cxGridTableView, RxMemDS,
  FIBDataSet, pFIBDataSet, ActnList, FIBDatabase, pFIBDatabase,
  cxGridLevel, cxGridCustomTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar, ZTypes, DAtes, ZProc,
  ZMessages, SvodByGroupSmFind;

type
  TFSvodByGroupSmFilter = class(TForm)
    dxStatusBar1: TdxStatusBar;
    cxGrid2: TcxGrid;
    smview: TcxGridDBTableView;
    smviewDBColumn3: TcxGridDBColumn;
    smViewDBColumn2: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ActionList1: TActionList;
    SmetaDataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    Styles: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    BarManager: TdxBarManager;
    BtnUPD: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    BtnInvert: TdxBarLargeButton;
    BtnSelectMulty: TdxBarLargeButton;
    ShowAvgBtn: TdxBarLargeButton;
    BtnSelect: TdxBarLargeButton;
    FilterBtn: TdxBarLargeButton;
    BtnExit: TdxBarLargeButton;
    AcctCardBtn: TdxBarLargeButton;
    AvansBtn: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    BtnNotMultySelect: TdxBarLargeButton;
    Action1: TAction;
    Action3: TAction;
    procedure smviewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure smviewKeyPress(Sender: TObject; var Key: Char);
    procedure BtnExitClick(Sender: TObject);
    procedure BtnUPDClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSelectClick(Sender: TObject);
    procedure BtnSelectMultyClick(Sender: TObject);
    procedure BtnInvertClick(Sender: TObject);
    procedure BtnNotMultySelectClick(Sender: TObject);
    procedure FilterBtnClick(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    ParamLoc: TZSpGroupSm;
    { Private declarations }
  public
    RxMemoryData1: TRxMemoryData;
    FindText:String;
    constructor create(Param:TZSpGroupSm); reintroduce;

  end;

function View_GroupSmet(Param:TZSpGroupSm):TdataSet;

var
  FSvodByGroupSmFilter: TFSvodByGroupSmFilter;

implementation

{$R *.dfm}

{ TForm1 }

constructor TFSvodByGroupSmFilter.create(Param: TZSpGroupSm);
begin
  inherited create(Param.Owner);
  ParamLoc:=Param;
  DB.Handle:=Param.Db_Handle;
  ReadTransaction.StartTransaction;
  SmetaDataSet.Close;
  SmetaDataSet.SQLs.SELECTSQL.TEXT:='SELECT * from PUB_SMETA_GROUP_BY_KOD_SETUP_S('+IntToStr(Param.KodSetup)+')';
  SmetaDataSet.Open;

  if RxMemoryData1=nil then
  RxMemoryData1:=TRxMemoryData.Create(Application.Owner);
  RxMemoryData1.Close;
  RxMemoryData1.FieldDefs.Clear;
  RxMemoryData1.FieldDefs.Add('CHECKBOXBTN',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('ID_GROUP',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('GROUP_TITLE',ftString,150,True);
  RxMemoryData1.LoadFromDataSet(SmetaDataSet,0,lmAppend);
  RxMemoryData1.First;
  while (not RxMemoryData1.eof)  do
    begin
      RxMemoryData1.Edit;
      RxMemoryData1['CHECKBOXBTN']:=1;
      RxMemoryData1.Post;
      RxMemoryData1.Next;
    end;

  DataSource1.DataSet:=RxMemoryData1;
  RxMemoryData1.First;
  FindText:='';
end;

procedure TFSvodByGroupSmFilter.smviewMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  RxMemoryData1.Edit;
  if   RxMemoryData1['CHECKBOXBTN']=0 then RxMemoryData1['CHECKBOXBTN']:=1
  else if RxMemoryData1['CHECKBOXBTN']=1 then RxMemoryData1['CHECKBOXBTN']:=0;
  RxMemoryData1.Post;
end;

procedure TFSvodByGroupSmFilter.smviewKeyPress(Sender: TObject;
  var Key: Char);
begin
 {If (Key in ['0'..'9']) then
  begin
   if (smview.OptionsBehavior.IncSearchItem <> smViewDBColumn1)then
    begin
     smview.Controller.IncSearchingText   := '';
     smview.OptionsBehavior.IncSearchItem := smViewDBColumn1;
    end
  end}
 //else
  if (smview.OptionsBehavior.IncSearchItem <> smViewDBColumn2)then
   begin
    smview.Controller.IncSearchingText   := '';
    smview.OptionsBehavior.IncSearchItem := smViewDBColumn2;
   end;
end;

function View_GroupSmet(Param:TZSpGroupSm):TDataSet;
var ResultDataSet:TDataSet;
begin
  ResultDataSet:=nil;
  FSvodByGroupSmFilter:=TFSvodByGroupSmFilter.Create(Param);
  if FSvodByGroupSmFilter.showmodal=mrOk then
    ResultDataSet:= FSvodByGroupSmFilter.RxMemoryData1;

  FSvodByGroupSmFilter.free;
  View_GroupSmet:= ResultDataSet;
end;

procedure TFSvodByGroupSmFilter.BtnExitClick(Sender: TObject);
begin
  Modalresult:=MrCancel;
end;

procedure TFSvodByGroupSmFilter.BtnUPDClick(Sender: TObject);
begin
  SmetaDataSet.Close;
  //SmetaDataSet.SQLs.SELECTSQL.TEXT:='SELECT * FROM Z_PKV_TYPE_FINANCE_S('+IntToStr(ParamLoc.IdSession)+','''+DateToStr(ConvertKodToDate(Param.KodSetup))+''','+IntToStr(Param.TypeData)+')';
  SmetaDataSet.Open;

  if RxMemoryData1=nil then
  RxMemoryData1:=TRxMemoryData.Create(Application.Owner);
  RxMemoryData1.Close;
  RxMemoryData1.FieldDefs.Clear;
  RxMemoryData1.FieldDefs.Add('CHECKBOXBTN',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('ID_GROUP',ftInteger,0,True);
  RxMemoryData1.FieldDefs.Add('GROUP_TITLE',ftString,150,True);
  RxMemoryData1.LoadFromDataSet(SmetaDataSet,0,lmAppend);
  RxMemoryData1.First;
  while (not RxMemoryData1.eof)  do
    begin
      RxMemoryData1.Edit;
      RxMemoryData1['CHECKBOXBTN']:=1;
      RxMemoryData1.Post;
      RxMemoryData1.Next;
    end;

  DataSource1.DataSet:=RxMemoryData1;
  RxMemoryData1.First;
  FindText:='';
end;

procedure TFSvodByGroupSmFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ReadTransaction.Active then  ReadTransaction.Commit;
  //Action:=CaFree;
end;

procedure TFSvodByGroupSmFilter.BtnSelectClick(Sender: TObject);
var temp:integer;
begin
  DataSource1.DataSet:=nil;
  temp:=0;
  RxMemoryData1.first;
  while not RxMemoryData1.eof do
  begin
  if RxMemoryData1['CHECKBOXBTN']=1 then
  begin
    temp:=1;
    break;
  end;
  RxMemoryData1.next;
  end;

  if temp=0 then
  begin
    ZShowMessage('', 'Записи не обрано', mtInformation, [mbOK]);
    Exit;
  end;

  RxMemoryData1.first;
  while not RxMemoryData1.eof do
    if RxMemoryData1['CHECKBOXBTN']<>1 then RxMemoryData1.delete
    else RxMemoryData1.next;

  modalResult:=MrOk;
end;

procedure TFSvodByGroupSmFilter.BtnSelectMultyClick(Sender: TObject);
var id:String;
begin
  DataSource1.DataSet:=nil;
  id:=VarToStr(RxMemoryData1['ID_GROUP']);
  RxMemoryData1.First;
  while not RxMemoryData1.Eof do
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['CHECKBOXBTN']:=1;
    RxMemoryData1.Post;
    RxMemoryData1.Next;
  end;
  DataSource1.DataSet:=RxMemoryData1;
  RxMemoryData1.Locate('ID_GROUP',id,[]);
end;

procedure TFSvodByGroupSmFilter.BtnInvertClick(Sender: TObject);
var id:String;
begin
 DataSource1.DataSet:=nil;
 id:=VarToStr(RxMemoryData1['ID_GROUP']);
 RxMemoryData1.First;
 while not RxMemoryData1.Eof do
 begin
 if RxMemoryData1['CHECKBOXBTN']=0 then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['CHECKBOXBTN']:=1;
    RxMemoryData1.Post;
  end
 else if RxMemoryData1['CHECKBOXBTN']=1 then
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['CHECKBOXBTN']:=0;
    RxMemoryData1.Post;
  end;
  RxMemoryData1.Next;
 end;

 DataSource1.DataSet:=RxMemoryData1;
 RxMemoryData1.Locate('ID_GROUP',id,[]);
end;

procedure TFSvodByGroupSmFilter.BtnNotMultySelectClick(Sender: TObject);
var id:String;
begin
  DataSource1.DataSet:=nil;
  id:=VarToStr(RxMemoryData1['ID_GROUP']);
  RxMemoryData1.First;
  while not RxMemoryData1.Eof do
  begin
    RxMemoryData1.Edit;
    RxMemoryData1['CHECKBOXBTN']:=0;
    RxMemoryData1.Post;
    RxMemoryData1.Next;
  end;
  RxMemoryData1.Edit;
  RxMemoryData1['CHECKBOXBTN']:=0;
  RxMemoryData1.Post;
  RxMemoryData1.Locate('ID_GROUP',id,[]);
  DataSource1.DataSet:=RxMemoryData1;
end;

procedure TFSvodByGroupSmFilter.FilterBtnClick(Sender: TObject);
var FSvodByGroupSmFind:TFSvodByGroupSmFind;
begin
  FSvodByGroupSmFind:=TFSvodByGroupSmFind.create(Self);
  if FSvodByGroupSmFind.ShowModal=mrOk then
  begin
    FindText:= FSvodByGroupSmFind.cxMaskEdit1.Text;
    FSvodByGroupSmFind.Free;
    Action3Execute(self);
  end;
end;

procedure TFSvodByGroupSmFilter.Action3Execute(Sender: TObject);
begin
  if not RxMemoryData1.IsEmpty then
    RxMemoryData1.Locate('PKV_FINANCE_NAME',FindText,[loPartialKey,loCaseInsensitive]); //[loCaseInsensitive, loPartialKey]
end;

procedure TFSvodByGroupSmFilter.Action1Execute(Sender: TObject);
begin
  RxMemoryData1.Edit;
  if   RxMemoryData1['CHECKBOXBTN']=0 then RxMemoryData1['CHECKBOXBTN']:=1
  else if RxMemoryData1['CHECKBOXBTN']=1 then RxMemoryData1['CHECKBOXBTN']:=0;
  RxMemoryData1.Post;
end;



end.
