unit DiscSpec_ParSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxGridBandedTableView, dxBar, dxBarExtItems, IBase,
  FIBQuery, pFIBQuery, pFIBStoredProc, RxMemDS, AArray, ExtCtrls,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxSpinEdit, uPrK_Resources,
  cxContainer, cxTextEdit, cxMaskEdit, cxButtonEdit, cn_Common_Types, cn_Common_Loader,
  uPrK_Loader, cxLabel, ImgList, ActnList, FIBSQLMonitor, DiscSpec_dmCommonStyles,
  Menus;

type
  TfParSet = class(TForm)
    DB: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    DSetKaf: TpFIBDataSet;
    DSetKurs: TpFIBDataSet;
    DSourceKaf: TDataSource;
    DSourceKurs: TDataSource;
    GridKursDBTableView1: TcxGridDBTableView;
    GridKursLevel1: TcxGridLevel;
    GridKurs: TcxGrid;
    GridFormObuchDBTableView1: TcxGridDBTableView;
    GridFormObuchLevel1: TcxGridLevel;
    GridFormObuch: TcxGrid;
    MemDSKaf: TRxMemoryData;
    cmnKURS_NAME: TcxGridDBColumn;
    DSetFormObuch: TpFIBDataSet;
    DSourceFormObuch: TDataSource;
    cmnFORM_OBUCH_NAME: TcxGridDBColumn;
    DSetKatStud: TpFIBDataSet;
    DSetTypeLesson: TpFIBDataSet;
    DSourceKatStud: TDataSource;
    DSourceTypeLesson: TDataSource;
    GridTypeLessonDBTableView1: TcxGridDBTableView;
    GridTypeLessonLevel1: TcxGridLevel;
    GridTypeLesson: TcxGrid;
    GridKatStudDBTableView1: TcxGridDBTableView;
    GridKatStudLevel1: TcxGridLevel;
    GridKatStud: TcxGrid;
    MemDSTypeLesson: TRxMemoryData;
    MemDSKatStud: TRxMemoryData;
    MemDSFormObuch: TRxMemoryData;
    MemDSKurs: TRxMemoryData;
    cmnKURS_NUM: TcxGridDBColumn;
    cmnKURS_GROUP: TcxGridDBColumn;
    cmnFORM_OBUCH_NUM: TcxGridDBColumn;
    cmnFORM_OBUCH_GROUP: TcxGridDBColumn;
    cmnTYPE_LESSON_NAME: TcxGridDBColumn;
    cmnTYPE_LESSON_NUM: TcxGridDBColumn;
    cmnTYPE_LESSON_GROUP: TcxGridDBColumn;
    cmnKAT_STUD_NAME: TcxGridDBColumn;
    cmnKAT_STUD_NUM: TcxGridDBColumn;
    cmnKAT_STUD_GROUP: TcxGridDBColumn;
    GridKafDBTableView1: TcxGridDBTableView;
    GridKafLevel1: TcxGridLevel;
    GridKaf: TcxGrid;
    cmnKAF_NAME: TcxGridDBColumn;
    cmnKAF_NUM: TcxGridDBColumn;
    cmnKAF_GROUP: TcxGridDBColumn;
    cmnKAF_PERCENT: TcxGridDBColumn;
    AddKafBtn: TcxButton;
    SpecBE: TcxButtonEdit;
    DiscBE: TcxButtonEdit;
    DiscSpecPanel: TPanel;
    SpecLabel: TcxLabel;
    DiscLabel: TcxLabel;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ImageList: TImageList;
    BarManager1: TdxBarManager;
    RefresBtn: TdxBarLargeButton;
    SaveBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    ActionList: TActionList;
    RefreshA: TAction;
    SaveA: TAction;
    ExitA: TAction;
    StoredProcT: TpFIBStoredProc;
    FIBSQLMonitor1: TFIBSQLMonitor;
    DSetPercent: TpFIBDataSet;
    DSourceKafRefresh: TDataSource;
    MainPanel: TPanel;
    PopupMenuKaf: TPopupMenu;
    smnAddKaf: TMenuItem;
    smfDelGroup: TMenuItem;
    smnCreateLink: TMenuItem;
    smnChangePercent: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridDragOver(Sender, Source: TObject; X,
      Y: Integer; State: TDragState; var Accept: Boolean);
    procedure GridDragDrop(Sender, Source: TObject; X,
      Y: Integer);
    procedure AddKafBtnClick(Sender: TObject);
    procedure GridTypeLessonDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure GridKafDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpecBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure DiscBEPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure GridKafDBTableView1DblClick(Sender: TObject);
    procedure ExitAExecute(Sender: TObject);
    procedure SaveAExecute(Sender: TObject);
    procedure FIBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
    procedure GridKursDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GridFormObuchDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure GridKatStudDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure GridTypeLessonDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure RefreshAExecute(Sender: TObject);
    procedure smnAddKafClick(Sender: TObject);
    procedure smnCreateLinkClick(Sender: TObject);
    procedure smfDelGroupClick(Sender: TObject);
    procedure smnChangePercentClick(Sender: TObject);
  private
    { Private declarations }
    PLanguageIndex:byte;
    pArray:TAArray;
    pColors, pReserved:Array[0..15] of Integer;
    MaxGroupCount:Integer;
    pGroupNum:Integer;
    pMode:RejimPrK;
    pIdSpec:Int64;
    pIdDisc:Int64;
    pStylesDM:TStylesDM;

    procedure InsertGroup;
    procedure DeleteGroup;
    procedure ChangePercent;
    procedure ImportData(ASourceDSet:TDataSet;var AMemDS:TRxMemoryData);
    procedure InsertIntoLink(var ADSet:TDataSet;AGroupNum:Integer);
    procedure CopyLinks(AGroupNum,ANewGroupNum:Integer;ADSet:TDataSet);
    procedure DeleteLink(var ADSet:TRxMemoryData;AGroupNum:Integer);
    procedure SaveT(ADSet:TDataSet;ATableName,AIdName,ASourceIdName:String;AGroup:Integer;AID_SP_KAF_DISC_SPEC:Int64);
    procedure PrepareDSet(var ADSet:TpFIBDataSet;ASelectProcName:String);
    procedure ShowLinks(ADSet:TDataSet;var AMemDS:TRxMemoryData;AIdName:String;AGroup:Integer);
    function GetSourceInDragDrop(ASource:TObject; AEtalon:TcxGrid):Integer;
    function GetSenderInDragDrop(ASender:TObject; AEtalon:TcxGrid):Integer;
    function CreateNewLink:Integer;
    function GetMaxIntValue(AField:TIntegerField):Integer;
    function GetNewGroupNumber:Integer;
//    function IsHavePoint(ApA:TAArray;APointDim,ADimCount):Variant;
    function GetChain(ApA:TAArray;ADim:Variant):TAArray;
    function CopyChain(AGroupNum:Integer):Integer; // New group number
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AIdSpec,AIdDisc:Int64;AMode:RejimPrK);reintroduce;
    procedure DSetReOpen;
  end;

{  function View_FZ_ParSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
   exports View_FZ_ParSetup;
}

implementation
uses DiscSpec_ParEditor, Math, uCommonSp, DiscSpec_MainForm;

{$R *.dfm}

{function View_FZ_ParSetup(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
var ViewForm:TfParSet;
begin
  if IsMDIChildFormShow(TfParSet) then Exit;
  ViewForm:=TfParSet.Create(AOwner,DB,nil);
  if ViewForm.ModalResult=mrNone then
    ViewForm.Show;
end; }

function TfParSet.GetMaxIntValue(AField:TIntegerField):Integer;
var A:array of Integer;
 i,l, RecNum:Integer;
begin
  if not Assigned(AField.DataSet) then
    begin
      Result:=Low(Integer);
      Exit;
    end;

  l:=AField.DataSet.RecordCount;

  if l=0 then
    begin
      Result:=0;
      Exit;
    end;

//  ShowMessage(BoolToStr(AField.DataSet.Modified));

  SetLength(A,l);
  RecNum:=AField.DataSet.RecNo;
  AField.DataSet.DisableControls;
  AField.DataSet.First;
  for i:=0 to l-1 do
   begin
    A[i]:=AField.Value;
    AField.DataSet.Next;
   end;
  AField.DataSet.First;
  for i:=1 to RecNum-1 do
    AField.DataSet.Next;
  AField.DataSet.EnableControls;

  Result:=MaxIntValue(A);
end;



constructor TfParSet.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE;AIdSpec,AIdDisc:Int64;AMode:RejimPrK);
var i:integer;
begin
 inherited Create(AOwner);
//******************************************************************************
 DB.Handle:=AHandle;
 Transaction.StartTransaction;
 DSetReOpen;
 PLanguageIndex:=1;
 pMode:=AMode;
 if pMode=AddPrK then
   begin
//     RefreshA.Enabled:=False;
     pIdSpec:=-1;
     pIdDisc:=-1;
   end
 else
   begin
     pIdSpec:=AIdSpec;
     pIdDisc:=AIdDisc;
     SpecBE.Text:=TfMainForm(AOwner).DSet['SPEC_NAME'];
     DiscBE.Text:=TfMainForm(AOwner).DSet['DISC_NAME'];
     DiscSpecPanel.Enabled:=False;
     if pMode=ViewPrK then
       begin
         MainPanel.Enabled:=False;
         SaveA.Enabled:=False;
       end;
   end;
//******************************************************************************
 pArray:=TAArray.Create;
 pGroupNum:=0;
//******************************************************************************
 MaxGroupCount:=16;
// SetLength(pReserved,16);
 pReserved[0]:=-1;
 pReserved[1]:=-1;
 pReserved[2]:=-1;
 pReserved[3]:=-1;
 pReserved[4]:=-1;
 pReserved[5]:=-1;
 pReserved[6]:=-1;
 pReserved[7]:=-1;
 pReserved[8]:=-1;
 pReserved[9]:=-1;
 pReserved[10]:=-1;
 pReserved[11]:=-1;
 pReserved[12]:=-1;
 pReserved[13]:=-1;
 pReserved[14]:=-1;
 pReserved[15]:=-1;

// SetLength(pColors,16);
 pColors[0]:=clWhite;
 pColors[1]:=clDkGray;
 pColors[2]:=clLtGray;
 pColors[3]:=clAqua;
 pColors[4]:=clFuchsia;
 pColors[5]:=clBlue;
 pColors[6]:=clYellow;
 pColors[7]:=clLime;
 pColors[8]:=clRed;
 pColors[9]:=clSilver;
 pColors[10]:=clGray;
 pColors[11]:=clTeal;
 pColors[12]:=clNavy;
 pColors[13]:=clOlive;
 pColors[14]:=clMaroon;
 pColors[15]:=clMoneyGreen;
{  clBlack = TColor($000000);
  clMaroon = TColor($000080);
  clGreen = TColor($008000);
  clOlive = TColor($008080);
  clNavy = TColor($800000);
  clPurple = TColor($800080);
  clTeal = TColor($808000);
  clGray = TColor($808080);
  clSilver = TColor($C0C0C0);
  clRed = TColor($0000FF);
  clLime = TColor($00FF00);
  clYellow = TColor($00FFFF);
  clBlue = TColor($FF0000);
  clFuchsia = TColor($FF00FF);
  clAqua = TColor($FFFF00);
  clLtGray = TColor($C0C0C0);
  clDkGray = TColor($808080);
  clWhite = TColor($FFFFFF);
  StandardColorsCount = 16; }
//******************************************************************************
 { pMode:=RejimPrK(AParams['EditMode']);
  if pMode <> AddPrK then
    DiscSpecPanel.Enabled:=False;     }

  if (pMode=ChangePrk) or (pMode=ViewPrK) then
         RefreshAExecute(Self);
//******************************************************************************
//   Caption := FZ_ParSetup_Caption[PLanguageIndex];
  pStylesDM:=TStylesDM.Create(Self);
  GridKursDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridFormObuchDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridKatStudDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridTypeLessonDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
  GridKafDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
//******************************************************************************
end;

procedure TfParSet.DSetReOpen;
var
 i:integer;
begin
{  if DSet.Active then DSet.Close;
  DSet.Open;
  DSet.First;     }

  DSetKurs.SQLs.SelectSQL.Text:='SELECT * FROM PRK_SP_KURS_SELECT';
  DSetFormObuch.SQLs.SelectSQL.Text:='SELECT * FROM PRK_SP_FORM_OBUCH_KAT_SELECT';
  DSetKatStud.SQLs.SelectSQL.Text:='SELECT * FROM PRK_SP_TYPE_KAT_STUD_SELECT';
  DSetTypeLesson.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_TYPE_DISC_LESSON_S';

  ImportData(DSetKurs,MemDSKurs);
  ImportData(DSetFormObuch,MemDSFormObuch);                
  ImportData(DSetKatStud,MemDSKatStud);
  ImportData(DSetTypeLesson,MemDSTypeLesson);

  DSourceKurs.DataSet:=MemDSKurs;
  DSourceFormObuch.DataSet:=MemDSFormObuch;
  DSourceKatStud.DataSet:=MemDSKatStud;
  DSourceTypeLesson.DataSet:=MemDSTypeLesson;

  cmnKURS_NUM.DataBinding.FieldName:='NUM';
  cmnKURS_GROUP.DataBinding.FieldName:='GROUP';

  cmnFORM_OBUCH_NUM.DataBinding.FieldName:='NUM';
  cmnFORM_OBUCH_GROUP.DataBinding.FieldName:='GROUP';

  cmnKAT_STUD_NUM.DataBinding.FieldName:='NUM';
  cmnKAT_STUD_GROUP.DataBinding.FieldName:='GROUP';

  cmnTYPE_LESSON_NUM.DataBinding.FieldName:='NUM';
  cmnTYPE_LESSON_GROUP.DataBinding.FieldName:='GROUP';
//******************************************************************************
  MemDSKaf.FieldDefs.Add('ID_DEPARTMENT',ftInteger);
  MemDSKaf.FieldDefs.Items[MemDSKaf.FieldDefs.Count-1].CreateField(MemDSKaf,nil,'ID_DEPARTMENT',false);
  MemDSKaf.FieldDefs.Add('NAME_SHORT',ftVariant);
  MemDSKaf.FieldDefs.Items[MemDSKaf.FieldDefs.Count-1].CreateField(MemDSKaf,nil,'NAME_SHORT',false);
  MemDSKaf.FieldDefs.Add('GROUP',ftInteger);
  MemDSKaf.FieldDefs.Items[MemDSKaf.FieldDefs.Count-1].CreateField(MemDSKaf,nil,'GROUP',false);
  MemDSKaf.FieldDefs.Add('NUM',ftInteger);
  MemDSKaf.FieldDefs.Items[MemDSKaf.FieldDefs.Count-1].CreateField(MemDSKaf,nil,'NUM',false);
  MemDSKaf.FieldDefs.Add('PERCENT',ftVariant);
  MemDSKaf.FieldDefs.Items[MemDSKaf.FieldDefs.Count-1].CreateField(MemDSKaf,nil,'PERCENT',false);

  DSourceKaf.DataSet:=MemDSKaf;

  cmnKAF_NAME.DataBinding.FieldName:='NAME_SHORT';
  cmnKAF_NUM.DataBinding.FieldName:='NUM';
  cmnKAF_GROUP.DataBinding.FieldName:='GROUP';
  cmnKAF_PERCENT.DataBinding.FieldName:='PERCENT';

  MemDSKaf.Open;
//******************************************************************************
{
  MemDSKaf.Append;
  MemDSKaf['ID_DEPARTMENT']:=1;
  MemDSKaf['NAME_SHORT']:='FIRST';
  MemDSKaf['GROUP']:=0;
  MemDSKaf['NUM']:=1;
  MemDSKaf['PERCENT']:=0;
  MemDSKaf.Post;

  MemDSKaf.Append;
  MemDSKaf['ID_DEPARTMENT']:=2;
  MemDSKaf['NAME_SHORT']:='SECOND';
  MemDSKaf['GROUP']:=0;
  MemDSKaf['NUM']:=1;
  MemDSKaf['PERCENT']:=0;
  MemDSKaf.Post;
}
//******************************************************************************
end;

procedure TfParSet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Transaction.Active:=False;
  Action:= caFree;
end;

procedure TfParSet.GridDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:= TDragControlObject(Source).Control is TcxGridSite;
  if Accept then
    Accept:=not(Sender = TDragControlObject(Source).Control);
end;

procedure TfParSet.ImportData(ASourceDSet:TDataSet;var AMemDS:TRxMemoryData);
var i:Integer;
begin
  if AMemDS.Active then AMemDS.Close;
  if ASourceDSet.Active then ASourceDSet.Close;
  ASourceDSet.Open;

  AMemDS.CopyStructure(ASourceDSet);

  AMemDS.FieldDefs.Add('GROUP',ftInteger);
  AMemDS.FieldDefs.Items[AMemDS.FieldDefs.Count-1].CreateField(AMemDS,nil,'GROUP',false);
  AMemDS.FieldDefs.Add('NUM',ftInteger);
  AMemDS.FieldDefs.Items[AMemDS.FieldDefs.Count-1].CreateField(AMemDS,nil,'NUM',false);

  AMemDS.Open;
  ASourceDSet.First;
  while not ASourceDSet.Eof do
   begin
    AMemDS.Append;
    for i:=0 to ASourceDSet.FieldCount-1 do
      AMemDS.Fields.Fields[i].Value:=ASourceDSet.Fields.Fields[i].Value;
    AMemDS['GROUP']:=0;
    AMemDS['NUM']:=ASourceDSet.RecNo;
    AMemDS.Post;
    ASourceDSet.Next;
   end;
  AMemDS.First;
  ASourceDSet.Close;
end;

function TfParSet.GetSourceInDragDrop(ASource:TObject; AEtalon:TcxGrid):Integer;
begin
  if TDragControlObject(ASource).Control.Parent <> AEtalon then
    Result:=-1
  else
    Result:=TcxGridDBTableView(TcxGridSite(TDragControlObject(ASource).Control).GridView).DataController.DataSource.DataSet['NUM'];
end;

function TfParSet.GetSenderInDragDrop(ASender:TObject; AEtalon:TcxGrid):Integer;
begin
  if TcxGridSite(ASender).Parent <> AEtalon then
    Result:=-1
  else
    Result:=TcxGridDBTableView(TcxGridSite(ASender).GridView).DataController.DataSource.DataSet['NUM'];
end;

function TfParSet.GetNewGroupNumber:Integer;
begin
  pGroupNum:=pGroupNum+1;
  Result:=pGroupNum;
end;

function TfParSet.CreateNewLink:Integer;
var i, NewGroupNum:Integer;
  v:Variant;
begin
  i:=0;
  while (pReserved[i]>0) and (i<MaxGroupCount) do
    begin
      i:=i+1;
    end;
  NewGroupNum:=GetNewGroupNumber; //GetMaxIntValue(TIntegerField(MemDSKaf.FieldByName('NUM')))+1;
  pReserved[i]:=NewGroupNum;

  v:=VarArrayCreate([0,MemDSKaf.FieldCount-1], varVariant);
  for i:=0 to MemDSKaf.FieldCount-1 do
    v[i]:=MemDSKaf.Fields.Fields[i].Value;

  MemDSKaf.Edit;
  MemDSKaf['GROUP']:=NewGroupNum;
  MemDSKaf['NUM']:=NewGroupNum;
  MemDSKaf['PERCENT']:=100;
  MemDSKaf.Post;

  MemDSKaf.Insert;
  for i:=0 to MemDSKaf.FieldCount-1 do
    MemDSKaf.Fields.Fields[i].Value:=v[i];
  MemDSKaf.Post;
  MemDSKaf.Next;

  Result:=NewGroupNum;
end;

procedure TfParSet.InsertIntoLink(var ADSet:TDataSet;AGroupNum:Integer);
var i:Integer;
  v:Variant;
begin
  v:=VarArrayCreate([0,ADSet.FieldCount-1], varVariant);
  for i:=0 to ADSet.FieldCount-1 do
    v[i]:=ADSet.Fields.Fields[i].Value;

  ADSet.Edit;
  ADSet['GROUP']:=AGroupNum;
  ADSet.Post;

  ADSet.Insert;
  for i:=0 to ADSet.FieldCount-1 do
    ADSet.Fields.Fields[i].Value:=v[i];
  ADSet.Post;
  ADSet.Next;

end;

{function TfParSet.IsHavePoint(ApA:TAArray;APointDim,ADimCount):Variant;
begin
end; }

procedure TfParSet.CopyLinks(AGroupNum,ANewGroupNum:Integer;ADSet:TDataSet);
var pCurrNum:Integer;
begin
  pCurrNum:=ADSet['NUM'];
  ADSet.DisableControls;
  ADSet.First;
  while not ADSet.Eof do
    begin
      if ADSet['GROUP']=AGroupNum then
        InsertIntoLink(ADSet,ANewGroupNum);
      ADSet.Next;
    end;
  ADSet.Locate('NUM',pCurrNum,[]);
  ADSet.EnableControls;
end;

function TfParSet.CopyChain(AGroupNum:Integer):Integer;
begin
  MemDSKaf.Locate('GROUP',AGroupNum,[]);
  Result:=CreateNewLink;

  CopyLinks(AGroupNum,Result,MemDSKurs);
  CopyLinks(AGroupNum,Result,MemDSFormObuch);
  CopyLinks(AGroupNum,Result,MemDSKatStud);
  CopyLinks(AGroupNum,Result,MemDSTypeLesson);
end;

function TfParSet.GetChain(ApA:TAArray;ADim:Variant):TAArray;
begin
end;


procedure TfParSet.GridDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var KafNum, KursNum, FormObuchNum, KatStudNum, TypeLessonNum:Integer;
 pSourceDS, pSenderDS:TDataSet;
 r,v:Variant;
 i:Integer;
 p0,p1,p2,p3:Integer;
begin
  KafNum:=-GetSenderInDragDrop(Sender,GridKaf)*GetSourceInDragDrop(Source,GridKaf);
  KursNum:=-GetSenderInDragDrop(Sender,GridKurs)*GetSourceInDragDrop(Source,GridKurs);
  FormObuchNum:=-GetSenderInDragDrop(Sender,GridFormObuch)*GetSourceInDragDrop(Source,GridFormObuch);
  KatStudNum:=-GetSenderInDragDrop(Sender,GridKatStud)*GetSourceInDragDrop(Source,GridKatStud);
  TypeLessonNum:=-GetSenderInDragDrop(Sender,GridTypeLesson)*GetSourceInDragDrop(Source,GridTypeLesson);

  pSenderDS:=TcxGridDBTableView(TcxGridSite(Sender).GridView).DataController.DataSource.DataSet;
  pSourceDS:=TcxGridDBTableView(TcxGridSite(TDragControlObject(Source).Control).GridView).DataController.DataSource.DataSet;

  if (pSenderDS['GROUP']=0) and (pSourceDS['GROUP']=0) then
    if KafNum<0 then
      Exit
    else
      begin
        KafNum:=CreateNewLink;
        if pSenderDS=MemDSKaf then
          begin
            InsertIntoLink(pSourceDS,KafNum);
          end
          else
          begin
            InsertIntoLink(pSenderDS,KafNum);
          end;
        pArray [KafNum][KursNum][FormObuchNum][KatStudNum][TypeLessonNum].AsVariant:=1;
{        ShowMessage(IntToStr(KafNum)+' '+
                    IntToStr(KursNum)+' '+
                    IntToStr(FormObuchNum)+' '+
                    IntToStr(KatStudNum)+' '+
                    IntToStr(TypeLessonNum));       }
{        ShowMessage(IntToStr(pArray .Count));
        ShowMessage(IntToStr(pArray [KafNum][KursNum][FormObuchNum].Count));
        ShowMessage(IntToStr(pArray [KafNum][KursNum][FormObuchNum][KatStudNum].Count));
        ShowMessage(IntToStr(pArray [KafNum][KursNum][FormObuchNum][KatStudNum][TypeLessonNum].Count));
}      end
  else
    begin
//     ShowMessage('!');
      if pSenderDS['GROUP']*pSourceDS['GROUP']=0 then
        begin
//     ShowMessage('!!');
          KafNum:=(pSenderDS['GROUP']+1)*(pSourceDS['GROUP']+1)-1;

          if pSenderDS.Locate('NUM; GROUP',VarArrayOf([pSenderDS['NUM'],pSourceDS['GROUP']]),[]) then
            Exit;

          v:=VarArrayCreate([0,3],varInteger);
          v[0]:=GetMaxIntValue(TIntegerField(MemDSKurs.FieldByName('NUM')));
          v[1]:=GetMaxIntValue(TIntegerField(MemDSFormObuch.FieldByName('NUM')));
          v[2]:=GetMaxIntValue(TIntegerField(MemDSKatStud.FieldByName('NUM')));
          v[3]:=GetMaxIntValue(TIntegerField(MemDSTypeLesson.FieldByName('NUM')));
//          r:=VarArrayCreate([0,3],varInteger);

  for p0:=-1 to v[0] do
    for p1:=-1 to v[1] do
      for p2:=-1 to v[2] do
        for p3:=-1 to v[3] do
          if Assigned(pArray[KafNum][p0][p1][p2][p3]) then
            if pArray[KafNum][p0][p1][p2][p3].AsVariant>0 then
              begin        //[KafNum] [KursNum][FormObuchNum][KatStudNum][TypeLessonNum]
{                r[0]:=p0;
                r[1]:=p1;
                r[2]:=p2;
                r[3]:=p3;
              ShowMessage(IntToStr(r[0])+' '+
                          IntToStr(r[1])+' '+
                          IntToStr(r[2])+' '+
                          IntToStr(r[3]));     }

                if (KursNum<>-1) and (p0=-1) then
                  begin
                    pArray[KafNum][p0][p1][p2][p3].AsVariant:=0;
                    pArray[KafNum][KursNum][p1][p2][p3].AsVariant:=1;
                  end
                else
                  if (KursNum<>-1) and (p0<>KursNum) then
                    begin
                       pArray[KafNum][KursNum][p1][p2][p3].AsVariant:=1;
                    end;

                if (FormObuchNum<>-1) and (p1=-1) then
                  begin
                    pArray[KafNum][p0][p1][p2][p3].AsVariant:=0;
                    pArray[KafNum][p0][FormObuchNum][p2][p3].AsVariant:=1;
                  end
                else
                  if (FormObuchNum<>-1) and (p1<>FormObuchNum) then
                    begin
                       pArray[KafNum][p0][FormObuchNum][p2][p3].AsVariant:=1;
                    end;

                if (KatStudNum<>-1) and (p2=-1) then
                  begin
                    pArray[KafNum][p0][p1][p2][p3].AsVariant:=0;
                    pArray[KafNum][p0][p1][KatStudNum][p3].AsVariant:=1;
                  end
                else
                  if (KatStudNum<>-1) and (p2<>KatStudNum) then
                    begin
                      pArray[KafNum][p0][p1][KatStudNum][p3].AsVariant:=1;
                    end;

                if (TypeLessonNum<>-1) and (p3=-1) then
                  begin
                    pArray[KafNum][p0][p1][p2][p3].AsVariant:=0;
                    pArray[KafNum][p0][p1][p2][TypeLessonNum].AsVariant:=1;
                  end
                else
                  if (TypeLessonNum<>-1) and (p3<>TypeLessonNum) then
                    begin
                       pArray[KafNum][p0][p1][p2][TypeLessonNum].AsVariant:=1;
                    end;
              end;

              if pSourceDS['GROUP']=0 then
                InsertIntoLink(pSourceDS,KafNum)
              else
                InsertIntoLink(pSenderDS,KafNum);
        end;
    end;
end;

procedure TfParSet.AddKafBtnClick(Sender: TObject);
var
    sp: TSprav;
    NewNum:Integer;
begin
// создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(DB.Handle);
                // MDI-окно
            FieldValues['ShowStyle'] := 1;
                // без выборки
            FieldValues['Select'] := 1;
                // с возможностью редактирования
            FieldValues['AllowEdit'] := False;
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
    NewNum:=GetNewGroupNumber;  //GetMaxIntValue(TIntegerField(MemDSKaf.FieldByName('NUM')))+1;
    if not VarIsNull(sp.Output['ID_DEPARTMENT']) then
      begin
        MemDSKaf.Append;
        MemDSKaf['ID_DEPARTMENT']:=sp.Output['ID_DEPARTMENT'];
        MemDSKaf['NAME_SHORT']:=sp.Output['NAME_SHORT'];
        MemDSKaf['NUM']:=NewNum;
        MemDSKaf['GROUP']:=0;
        MemDSKaf['PERCENT']:=0;
        MemDSKaf.Post;
      end;
    sp.Free;
end;

procedure TfParSet.GridTypeLessonDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var i:Integer;
begin
 if (AViewInfo.GridRecord.Values[0]<>0) then
  begin
//   ACanvas.Font.Style := [fsStrikeOut];
   for i:=0 to MaxGroupCount-1 do
     if pReserved[i]= Integer(AViewInfo.GridRecord.Values[0]) then
       Break;
   ACanvas.Brush.Color :=   pColors[i];
  end;
end;

procedure TfParSet.DeleteLink(var ADSet:TRxMemoryData;AGroupNum:Integer);
begin
  ADSet.DisableControls;
  ADSet.Last;
  while not ADSet.Bof do
    begin
      if ADSet['GROUP'] = AGroupNum then
       begin
        ADSet.Delete;
       end
      else
       ADSet.Prior;
    end;
  ADSet.EnableControls;
end;

procedure TfParSet.GridKafDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  ShowMessage(IntToStr(Key));
 if MemDSKaf.IsEmpty then Exit;

 if (Key = $2D) {i.e. Ins}then
   InsertGroup;

 if (Key = $2E) {i.e. Del} then
   DeleteGroup;
{          v:=VarArrayCreate([0,3],varInteger);
          v[0]:=GetMaxIntValue(TIntegerField(MemDSKurs.FieldByName('NUM')));
          v[1]:=GetMaxIntValue(TIntegerField(MemDSFormObuch.FieldByName('NUM')));
          v[2]:=GetMaxIntValue(TIntegerField(MemDSKatStud.FieldByName('NUM')));
          v[3]:=GetMaxIntValue(TIntegerField(MemDSTypeLesson.FieldByName('NUM')));

  for p0:=-1 to v[0] do
    for p1:=-1 to v[1] do
      for p2:=-1 to v[2] do
        for p3:=-1 to v[3] do
          if Assigned(pArray[KafNum][p0][p1][p2][p3]) then
            if pArray[KafNum][p0][p1][p2][p3].AsVariant>0 then
              begin        //[KafNum] [KursNum][FormObuchNum][KatStudNum][TypeLessonNum]
                pArray[KafNum][p0][p1][p2][p3].AsVariant:=0;
              end;     }
end;

procedure TfParSet.SpecBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  Res :variant;
begin
  AParameter                := TcnSimpleParams.Create;
  AParameter.Owner          := self;
  AParameter.Db_Handle      := DB.Handle;
  AParameter.Formstyle      := fsNormal;
  AParameter.WaitPakageOwner:= self;

  AParameter.DontShowGroups := False;
  Res:=RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FacultySpecGroup.bpl','ShowSPFacSpecGroup');
  AParameter.Free;
  if VarArrayDimCount(res) > 0 then
  begin
      if ((Res[0]<>Null) and (Res[1]<>Null))  then
      begin
          pIdSpec:=Res[1];
{          DataVL['ID_CN_SP_FAK'].AsInt64        := Res[0];   // id_faculty;
          DataVL['ID_CN_SP_SPEC'].AsInt64       := Res[1];   // id_spec;
          DataVL['SHORT_NAME_FAK'].AsString     := Res[3];   //DM.DataSet['NAME'];
          DataVL['SHORT_NAME_SPEC'].AsString    := Res[4];   //DM_Detail_1.DataSet['NAME'];
          DataVL['ID_CN_JN_FACUL_SPEC'].AsInt64 := Res[6];   }

          SpecBE.Text        := Res[4];
{          ShowMessage(VarToStr(Res[0])+'; '+VarToStr(Res[1])+'; '+VarToStr(Res[2])+'; '+
          VarToStr(Res[3])+'; '+VarToStr(Res[4])+'; '+VarToStr(Res[5])+'; '+VarToStr(Res[6]));}
      end;
  end;
end;

procedure TfParSet.DiscBEPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  Res:Variant;
begin
//  Res:=uPrK_Loader.ShowPrkSprav(Self,DB.Handle,PrK_SP_DISC,fsNormal);
  if VarArrayDimCount(Res)>0 then
    begin
      pIdDisc:=Res[0];
      DiscBE.Text:=Res[2];
    end;
end;

procedure TfParSet.GridKafDBTableView1DblClick(Sender: TObject);
begin
  ChangePercent;
end;

procedure TfParSet.ExitAExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
  Close;
end;

procedure TfParSet.SaveAExecute(Sender: TObject);
var ID_Prev,ID_Prev_T:Int64;
begin
  if (pIdSpec=-1) or (pIdDisc=-1) then Exit;
  if prkMessageDlg('Збереження','Прийняти зміни?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
    Exit;

  MemDSKaf.DisableControls;
  MemDSKurs.DisableControls;
  MemDSFormObuch.DisableControls;
  MemDSKatStud.DisableControls;
  MemDSTypeLesson.DisableControls;

//  FIBSQLMonitor1.OnSQL:=FIBSQLMonitor1SQL;

 try
  StoredProc.Transaction.StartTransaction;
  StoredProc.StoredProcName:='UO_SP_KAF_DISC_SPEC_INS';
  StoredProc.Prepare;

  MemDSKaf.First;
  ID_Prev:=-1;
  while not MemDSKaf.Eof do
    begin
     if MemDSKaf['GROUP']<>0 then
      begin
       StoredProc.ParamByName('ID_SP_KAF_DISC_SPEC_PREV').AsInt64:=ID_Prev;
 {      if ID_Prev<>NULL then
         ShowMessage(StoredProc.ParamByName('ID_SP_KAF_DISC_SPEC_PREV').AsString);           }
       StoredProc.ParamByName('ID_SP_DEPARTMENT').AsInt64:=MemDSKaf['ID_DEPARTMENT'];
       StoredProc.ParamByName('ID_SP_SPEC').AsInt64:=pIdSpec;
       StoredProc.ParamByName('ID_SP_DISC').AsInt64:=pIdDisc;
       StoredProc.ParamByName('ID_NAKAZ').AsInt64:=-1;
       StoredProc.ExecProc;
       ID_Prev:=StoredProc.FN('ID_SP_KAF_DISC_SPEC').AsInt64;
 //      ShowMessage(IntToStr(ID_Prev));

       SaveT(MemDSKurs,'UO_SP_KAF_DISC_SPEC_KURS','ID_SP_KAF_DISC_SPEC_KURS','ID_SP_KURS',MemDSKaf['GROUP'],ID_Prev);
       SaveT(MemDSFormObuch,'UO_SP_KAF_DISC_SPEC_FRM_STD','ID_SP_KAF_DISC_SPEC_FRM_STD','ID_SP_FORM_OBUCH_KATEGORY',MemDSKaf['GROUP'],ID_Prev);
       SaveT(MemDSKatStud,'UO_SP_KAF_DISC_SPEC_KAT_STD','ID_SP_KAF_DISC_SPEC_KAT_STD','ID_SP_TYPE_KAT_STUD',MemDSKaf['GROUP'],ID_Prev);
       SaveT(MemDSTypeLesson,'UO_SP_KAF_DISC_SPEC_TYP_LESS','ID_SP_KAF_DISC_SPEC_TYP_LESS','ID_SP_TYPE_DISC_LESSON',MemDSKaf['GROUP'],ID_Prev);

       StoredProcT.StoredProcName:='UO_SP_KAF_DISC_SPEC_PERCENT_INS';
       StoredProcT.Prepare;
       if MemDSKaf['PERCENT']<>100 then
        begin
            StoredProcT.ParamByName('ID_SP_KAF_DISC_SPEC').AsInt64:=ID_Prev;
            StoredProcT.ParamByName('NEW_VALUE').AsExtended:=MemDSKaf['PERCENT'];
        end
       else
        begin
            StoredProcT.ParamByName('ID_SP_KAF_DISC_SPEC').AsInt64:=ID_Prev;
            StoredProcT.ParamByName('NEW_VALUE').AsVariant:=NULL;
        end;
       StoredProcT.ExecProc;

      end;
      MemDSKaf.Next;
    end;
  // Стираем лишнее
  StoredProc.StoredProcName:='UO_SP_KAF_DISC_SPEC_DEL';
  StoredProc.Prepare;
       StoredProc.ParamByName('ID_LAST').AsInt64:=ID_Prev;
       StoredProc.ParamByName('ID_SP_SPEC').AsInt64:=pIdSpec;
       StoredProc.ParamByName('ID_SP_DISC').AsInt64:=pIdDisc;
  StoredProc.ExecProc;
  StoredProc.Transaction.Commit;
  prkMessageDlg('Збереження','Дані збережено',mtInformation,[mbOk],0);

 except
 on E:Exception do
   begin
     StoredProc.Transaction.Rollback;
     prkMessageDlg('Помилка',E.Message,mtError,[mbOK],0);
   end;
 end;
  MemDSKaf.EnableControls;
  MemDSKurs.EnableControls;
  MemDSFormObuch.EnableControls;
  MemDSKatStud.EnableControls;
  MemDSTypeLesson.EnableControls;
end;

procedure TfParSet.SaveT(ADSet:TDataSet;ATableName,AIdName,ASourceIdName:String;AGroup:Integer;AID_SP_KAF_DISC_SPEC:Int64);
var ID_Prev_T:Int64;
begin
       StoredProcT.StoredProcName:='UO_SP_KAF_DISC_SPEC_T_I';
       StoredProcT.Prepare;
       ADSet.First;
       ID_Prev_T:=-1;
       while not ADSet.Eof do
        begin
         if ADSet['GROUP']=AGROUP then
          begin
            StoredProcT.ParamByName('TABLE_NAME').AsString:=ATableName;
            StoredProcT.ParamByName('ID_NAME').AsString:=AIdName;
            StoredProcT.ParamByName('ID_PREV').AsInt64:=ID_Prev_T;
            StoredProcT.ParamByName('ID_SP_KAF_DISC_SPEC').AsInt64:=AID_SP_KAF_DISC_SPEC;
            StoredProcT.ParamByName('NEW_VALUE').AsInt64:=ADSet[ASourceIdName];
            StoredProcT.ExecProc;
            ID_Prev_T:=StoredProcT.FN('ID_OUT').AsInt64;
          end;
         ADSet.Next;
        end;
       StoredProcT.StoredProcName:='UO_SP_KAF_DISC_SPEC_T_D';
       StoredProcT.Prepare;
            StoredProcT.ParamByName('TABLE_NAME').AsString:=ATableName;
            StoredProcT.ParamByName('ID_NAME').AsString:=AIdName;
            StoredProcT.ParamByName('ID_LAST').AsInt64:=ID_Prev_T;
            StoredProcT.ParamByName('ID_SP_KAF_DISC_SPEC').AsInt64:=AID_SP_KAF_DISC_SPEC;
       StoredProcT.ExecProc;
end;

procedure TfParSet.FIBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
begin
  ShowMessage(EventText);
end;

procedure TfParSet.GridKursDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=$2E) and (MemDSKurs['GROUP']<>0) then
    if prkMessageDlg('Видалення','Вилучити запис?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        MemDSKurs.Delete;
      end;
end;

procedure TfParSet.GridFormObuchDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=$2E) and (MemDSFormObuch['GROUP']<>0) then
    if prkMessageDlg('Видалення','Вилучити запис?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        MemDSFormObuch.Delete;
      end;
end;

procedure TfParSet.GridKatStudDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=$2E) and (MemDSKatStud['GROUP']<>0) then
    if prkMessageDlg('Видалення','Вилучити запис?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        MemDSKatStud.Delete;
      end;
end;

procedure TfParSet.GridTypeLessonDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key=$2E) and (MemDSTypeLesson['GROUP']<>0) then
    if prkMessageDlg('Видалення','Вилучити запис?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
      begin
        MemDSTypeLesson.Delete;
      end;
end;

procedure TfParSet.RefreshAExecute(Sender: TObject);
var i,pGroupNumber, NewNum:Integer;
begin
  if (pIdSpec=-1) or (pIdDisc=-1) then Exit;
{  MemDSKaf.DisableControls;
  MemDSKurs.DisableControls;
  MemDSFormObuch.DisableControls;
  MemDSKatStud.DisableControls;
  MemDSTypeLesson.DisableControls;
}
       for I:=0 to MaxGroupCount-1 do
           pReserved[i]:=-1;

  MemDSKaf.Last;
  while not MemDSKaf.Bof do
    begin
     pGroupNumber:=MemDSKaf['GROUP'];
     if pGroupNumber<>0 then
      begin
       DeleteLink(MemDSKurs,pGroupNumber);
       DeleteLink(MemDSFormObuch,pGroupNumber);
       DeleteLink(MemDSKatStud,pGroupNumber);
       DeleteLink(MemDSTypeLesson,pGroupNumber);
       MemDSKaf.Delete;
      end
     else
      MemDSKaf.Prior;
    end;

  if DSetKaf.Active then DSetKaf.Close;
  DSetKaf.SQLs.SelectSQL.Text:='SELECT * FROM UO_SP_KAF_DISC_SPEC_GET_KAF('
                   +IntToStr(pIdSpec)+',' +IntToStr(pIdDisc)+')';
  DSetKaf.Open;
  DSetKaf.First;
                 

  PrepareDSet(DSetKurs,'UO_SP_KAF_DISC_SPEC_KURS_S');
  PrepareDSet(DSetFormObuch,'UO_SP_KAF_DISC_SPEC_FRM_STD_S');
  PrepareDSet(DSetKatStud,'UO_SP_KAF_DISC_SPEC_KAT_STD_S');
  PrepareDSet(DSetTypeLesson,'UO_SP_KAF_DISC_SPEC_TYP_LESS_S');
  PrepareDSet(DSetPercent,'UO_SP_KAF_DISC_SPEC_PERCENT_S');

  while not DSetKaf.Eof do
   begin
        if not MemDSKaf.Locate('ID_DEPARTMENT; GROUP',VarArrayOf([DSetKaf['ID_DEPARTMENT'],0]),[]) then
          begin
            NewNum:=GetNewGroupNumber;
            MemDSKaf.Append;
            MemDSKaf['ID_DEPARTMENT']:=DSetKaf['ID_DEPARTMENT'];
            MemDSKaf['NAME_SHORT']:=DSetKaf['NAME_SHORT'];
            MemDSKaf['NUM']:=NewNum;
            MemDSKaf['GROUP']:=0;
            MemDSKaf['PERCENT']:=0;
            MemDSKaf.Post;
          end;
          pGroupNumber:=CreateNewLink;
          // Вставляем информацию из сопутсвующих DSet'ов
          ShowLinks(DSetKurs,MemDSKurs,'ID_SP_KURS',pGroupNumber);
          ShowLinks(DSetFormObuch,MemDSFormObuch,'ID_SP_FORM_OBUCH_KATEGORY',pGroupNumber);
          ShowLinks(DSetKatStud,MemDSKatStud,'ID_SP_TYPE_KAT_STUD',pGroupNumber);
          ShowLinks(DSetTypeLesson,MemDSTypeLesson,'ID_SP_TYPE_DISC_LESSON',pGroupNumber);

          DSetPercent.First;
          if not(VarIsNull(DSetPercent['PERCENT_VAL'])) then
            begin
             MemDSKaf.Edit;
             MemDSKaf['PERCENT']:=DSetPercent['PERCENT_VAL'];
             MemDSKaf.Post;
            end;
        DSetKaf.Next;
   end;

{  MemDSKaf.EnableControls;
  MemDSKurs.EnableControls;
  MemDSFormObuch.EnableControls;
  MemDSKatStud.EnableControls;
  MemDSTypeLesson.EnableControls; }
end;

procedure TfParSet.PrepareDSet(var ADSet:TpFIBDataSet;ASelectProcName:String);
begin
  if ADSet.Active then ADSet.Close;
  ADSet.DataSource:=DSourceKafRefresh;
  ADSet.SQLs.SelectSQL.Text:='SELECT * FROM '+ASelectProcName+'(?ID_SP_KAF_DISC_SPEC)';
  ADSet.Open;
end;

procedure TfParSet.ShowLinks(ADSet:TDataSet;var AMemDS:TRxMemoryData;AIdName:String;AGroup:Integer);
begin
          ADSet.First;
          while not ADSet.Eof do
            begin
              if AMemDS.Locate(AIdName+'; GROUP',VarArrayOf([ADSet[AIdName],0]),[]) then
                InsertIntoLink(TDataSet(AMemDS),AGroup);
              ADSet.Next;
            end;
end;

procedure TfParSet.smnAddKafClick(Sender: TObject);
begin
  AddKafBtnClick(Self);
end;

procedure TfParSet.smnCreateLinkClick(Sender: TObject);
var Key:Word;
begin
  InsertGroup;
end;

procedure TfParSet.InsertGroup;
begin
 if MemDSKaf.IsEmpty then Exit;

 if (MemDSKaf['GROUP']=0) then
   CreateNewLink;
end;

procedure TfParSet.DeleteGroup;
var pGroupNumber, KafNum, p0,p1,p2,p3,i:Integer;
    v:Variant;
begin
 if MemDSKaf.IsEmpty then Exit;

 if (MemDSKaf['GROUP']<>0) then
   if uPrK_Resources.prkMessageDlg('Видалення','Ви дійсно бажаєте видалити запис?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
     begin
       pGroupNumber:=MemDSKaf['GROUP'];
       KafNum      :=MemDSKaf['NUM'];
       DeleteLink(MemDSKurs,pGroupNumber);
       DeleteLink(MemDSFormObuch,pGroupNumber);
       DeleteLink(MemDSKatStud,pGroupNumber);
       DeleteLink(MemDSTypeLesson,pGroupNumber);
       DeleteLink(MemDSKaf,pGroupNumber);
       for I:=0 to MaxGroupCount-1 do
         if pReserved[i]=pGroupNumber then
           pReserved[i]:=-1;
     end;
end;

procedure TfParSet.ChangePercent;
begin
  if MemDSKaf['GROUP']<>0 then
   begin
    MemDSKaf.Edit;
    MemDSKaf['PERCENT']:=SetPercent(Self,MemDSKaf['PERCENT']);
    MemDSKaf.Post;
   end;
end;

procedure TfParSet.smfDelGroupClick(Sender: TObject);
begin
  DeleteGroup;
end;

procedure TfParSet.smnChangePercentClick(Sender: TObject);
begin
  ChangePercent;
end;

end.

