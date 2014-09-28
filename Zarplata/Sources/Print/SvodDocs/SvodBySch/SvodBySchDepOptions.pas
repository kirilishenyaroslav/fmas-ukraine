unit SvodBySchDepOptions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit,
  cxCheckBox, cxInplaceContainer, cxDBTL, cxControls, cxTLData, dxBar,
  dxBarExtItems,RxMemDS,SvodBySchDataModul, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase,ibase,ZProc, dxStatusBar,Unit_ZGlobal_Consts,
  ZSvodLoaderUnit,ZSvodTypesUnit;

type
  TFormOptionDep = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    FilterBtn: TdxBarButton;
    SelectBtn: TdxBarLargeButton;
    InverseBtn: TdxBarLargeButton;
    ReadTransaction: TpFIBTransaction;
    DB: TpFIBDatabase;
    DSourceMain: TDataSource;
    DSetMain: TpFIBDataSet;
    dxStatusBar1: TdxStatusBar;
    TreeListDep: TcxDBTreeList;
    TreeListColumnDepName: TcxDBTreeListColumn;
    TreeListColumnDepYes: TcxDBTreeListColumn;
    TreeListColumnDepId: TcxDBTreeListColumn;
    TreeListDepcxDBTreeListColumnCount: TcxDBTreeListColumn;
    TreeListDepcxDBTreeListColumnKOD: TcxDBTreeListColumn;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    procedure InverseBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    MemoryData: TRxMemoryData;
    Result:variant;
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE; ID_Session:integer); reintroduce;

  end;


implementation

{$R *.dfm}

{ TFormOptionDep }

constructor TFormOptionDep.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE; ID_Session:integer);
var i:integer;
begin
inherited Create(AOwner);
Caption:=SvodBySch_Caption[LanguageIndex];
  DB.Handle:=AHandle;
  DSetMain.SQLs.SelectSQL.Text := 'SELECT DISTINCT * FROM Z_RASCHVED_DEPARTMENT_S('+IntToStr(ID_Session)+') ORDER BY KOD_DEPARTMENT';
  DSetMain.Open;
  MemoryData:=TRxMemoryData.Create(self);
  MemoryData.FieldDefs.Add('id_department',ftInteger);
  MemoryData.FieldDefs.Add('name_department',ftString,255);
  MemoryData.FieldDefs.Add('count_people',ftInteger);
  MemoryData.FieldDefs.Add('kod_department',ftString,255);
  MemoryData.FieldDefs.Add('exists_line',ftInteger);
  MemoryData.FieldDefs.Add('id_link',ftInteger);
  MemoryData.Open;
  DSetMain.First;
  while not(DSetMain.Eof)do
  begin
    MemoryData.Insert;
    MemoryData['id_department']     :=DSetMain['id_department'];
    MemoryData['name_department'] :=DSetMain['name_department'];
    MemoryData['count_people']  :=DSetMain['count_people'];
    MemoryData['kod_department']       :=DSetMain['kod_department'];
    MemoryData['exists_line']    :=DSetMain['exists_line'];
    MemoryData['id_link']      :=DSetMain['id_link'];
    MemoryData.Post;
    DSetMain.Next
  end;
  DSourceMain.DataSet:=MemoryData;
  TreeListDep.DataController.DataSource:=DSourceMain;
   //******************************************************************************
  dxStatusBar1.Panels[0].Text:= 'F5 - '+RefreshBtn_Caption[LanguageIndex];
  dxStatusBar1.Panels[1].Text:= 'Enter - '+SelectBtn_Caption[LanguageIndex];
  dxStatusBar1.Panels[2].Text:= 'Esc - '+ExitBtn_Caption[LanguageIndex];
  for i:=0 to dxStatusBar1.Panels.Count-1 do
    dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;
   //******************************************************************************
  Result:=Null;
  TreeListDep.FullExpand;
  MemoryData.Last;
  dxBarLargeButton1Click(self);
end;

procedure TFormOptionDep.InverseBtnClick(Sender: TObject);
var i:integer;
begin
  i:=TreeListDep.DataController.FocusedRecordIndex;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['exists_line']=1)then
    begin
      MemoryData.Edit;
      MemoryData['exists_line']:=0;
      MemoryData.Post;
    end
    else
    begin
      MemoryData.Edit;
      MemoryData['exists_line']:=1;
      MemoryData.Post;
    end;
    MemoryData.Next;
  end;
  TreeListDep.DataController.FocusedRecordIndex:=i;
end;

procedure TFormOptionDep.SelectBtnClick(Sender: TObject);
var i:integer;
begin
  i:=0;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['exists_line']=1) and (MemoryData['count_people']<>0)then
      i:=i+1;
    MemoryData.Next;
  end;
  if(i<>0)then
  begin
    Result:=VarArrayCreate([0,i],varInteger);
    MemoryData.First;
    i:=0;
    while not(MemoryData.Eof)do
    begin
      if(MemoryData['exists_line']=1) and (MemoryData['count_people']<>0)then
      begin

        Result[i]:=MemoryData['id_department'];
        i:=i+1;
      end;
      MemoryData.Next;
    end;
    ModalResult:=mrYes;
  end
  else
    ShowMessage('Не обрано рахунок');
end;

procedure TFormOptionDep.dxBarLargeButton1Click(Sender: TObject);
var i:integer;
begin
 i:=TreeListDep.DataController.FocusedRecordIndex;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['exists_line']=1)then
    begin
      MemoryData.Edit;
      MemoryData['exists_line']:=0;
      MemoryData.Post;
    end ;

    MemoryData.Next;
  end;
  TreeListDep.DataController.FocusedRecordIndex:=i;
end;

procedure TFormOptionDep.ExitBtnClick(Sender: TObject);
begin
Close;
end;

end.
