unit gr_SpSmetMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxControls,
  cxInplaceContainer, cxTLData, cxDBTL, dxBar, dxBarExtItems,
  cxGridBandedTableView, cxClasses, cxGridTableView, dxStatusBar, ibase,
  ZProc, gr_uCommonConsts, DB, FIBDatabase, gr_dmCommonStyles,
  pFIBDatabase, FIBDataSet, pFIBDataSet, gr_uCommonProc, cxMaskEdit,
  cxCheckBox, RxMemDS, Unit_ZGlobal_Consts, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridDBTableView, cxGridLevel, cxGridCustomView, cxGrid, Dates;

type
  TFGr_SmetForm = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    FilterBtn: TdxBarButton;
    SelectBtn: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    DB: TpFIBDatabase;
    DSetMain: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    DSourceMain: TDataSource;
    InverseBtn: TdxBarLargeButton;
    GridSmetaDBTableView: TcxGridDBTableView;
    cxgrdlvlGridSmetaLevel: TcxGridLevel;
    GridSmeta: TcxGrid;
    GridSmetaDBTableViewDBCheck: TcxGridDBColumn;
    GridSmetaDBTableViewDBSmetaKod: TcxGridDBColumn;
    GridSmetaDBTableViewDBTitle: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure InverseBtnClick(Sender: TObject);
    procedure GridSmetaDBTableViewKeyPress(Sender: TObject; var Key: Char);
    procedure GridSmetaDBTableViewDblClick(Sender: TObject);
  private
    PStyles : TStylesDM;
    PLanguageIndex:Integer;
  public
    MemoryData: TRxMemoryData;
    Result:variant;
    constructor Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE); reintroduce;
  end;

var
  FGr_SmetForm: TFGr_SmetForm;

implementation

{$R *.dfm}

constructor TfGr_SmetForm.Create(AOwner:TComponent;AHandle:TISC_DB_HANDLE);
var i:integer;
begin
 inherited Create(AOwner);
//******************************************************************************

//******************************************************************************
 PLanguageIndex:=LanguageIndex;
 Caption:=SvodBySch_Caption[PLanguageIndex];
 RefreshBtn.Caption:='Обновити';//RefreshBtn_Caption[PLanguageIndex];
 SelectBtn.Caption :='Вибрати';//SelectBtn_Caption[PLanguageIndex];
 InverseBtn.Caption:='Інвертувати';//InverseBtn_Caption[PLanguageIndex];
 ExitBtn.Caption   :='Вийти';//ExitBtn_Caption[PLanguageIndex];
 DB.Handle:=AHandle;
 DSetMain.SQLs.SelectSQL.Text:='SELECT S.ID_SMETA, S.SMETA_TITLE, S.SMETA_KOD, P.ID_PLAN   '+
                               '  FROM BU_SMET_PLUS_PERIODS P, PUB_SPR_SMETA S '+
                               ' WHERE S.ID_SMETA=P.ID_SMETA '+
                               '   AND P.DATE_BEG<='+''''+DateToStr(Date)+''''+
                               '   AND P.DATE_END> '+''''+DateToStr(Date)+''''+
                               ' ORDER BY S.SMETA_KOD DESC';
 DSetMain.Open;
 MemoryData:=TRxMemoryData.Create(self);
 MemoryData.FieldDefs.Add('ID_SMETA',ftInteger);
 MemoryData.FieldDefs.Add('SMETA_KOD',ftString,255);
 MemoryData.FieldDefs.Add('SMETA_TITLE',ftString,255);
 MemoryData.FieldDefs.Add('CHECK',ftBoolean);
 MemoryData.Open;
 DSetMain.First;
 while not(DSetMain.Eof)do
 begin
   MemoryData.Insert;
   MemoryData['ID_SMETA']:=DSetMain['ID_SMETA'];
   MemoryData['SMETA_KOD']:=DSetMain['SMETA_KOD'];
   MemoryData['SMETA_TITLE']:=DSetMain['SMETA_TITLE'];
   MemoryData['CHECK']:=false;
   MemoryData.Post;
   DSetMain.Next;
 end;

//******************************************************************************
 PStyles:=TStylesDM.Create(self);
 GridSmetaDBTableView.Styles.StyleSheet:=PStyles.GridTableViewStyleSheetDevExpress;
//******************************************************************************
 DSourceMain.DataSet:=MemoryData;
 GridSmetaDBTableView.DataController.DataSource:=DSourceMain;
 //******************************************************************************
 dxStatusBar1.Panels[0].Text:= 'F5 - '+RefreshBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[1].Text:= 'Enter - '+SelectBtn_Caption[PLanguageIndex];
 dxStatusBar1.Panels[2].Text:= 'Esc - '+ExitBtn_Caption[PLanguageIndex];
 for i:=0 to dxStatusBar1.Panels.Count-1 do
   dxStatusBar1.Panels[i].Width := dxStatusBar1.Width div dxStatusBar1.Panels.Count;

//******************************************************************************
 Result:=Null;
 MemoryData.First;
end;

procedure TFGr_SmetForm.ExitBtnClick(Sender: TObject);
begin
  Result:=null;
  ModalResult:=mrCancel;
end;

procedure TFGr_SmetForm.RefreshBtnClick(Sender: TObject);
begin
  DSetMain.Close;
  MemoryData.Close;
  DSetMain.Open;
  MemoryData.Open;
  DSetMain.First;
  while not(DSetMain.Eof)do
  begin
    MemoryData.Insert;
    MemoryData['ID_SMETA']:=DSetMain['ID_SMETA'];
    MemoryData['SMETA_KOD']:=DSetMain['SMETA_KOD'];
    MemoryData['SMETA_TITLE']:=DSetMain['SMETA_TITLE'];
    MemoryData['CHECK']:=false;
    MemoryData.Post;
    DSetMain.Next
  end;
  MemoryData.First;
end;

procedure TFGr_SmetForm.SelectBtnClick(Sender: TObject);
var i:integer;
begin
  i:=0;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['CHECK']=true)then
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
      if(MemoryData['CHECK']=true)then
      begin
        Result[i]:=MemoryData['ID_SMETA'];
        i:=i+1;
      end;
      MemoryData.Next;
    end;
    ModalResult:=mrYes;
  end
  else
    ShowMessage('Не обрано кошторис');
end;

procedure TFGr_SmetForm.InverseBtnClick(Sender: TObject);
var i:integer;
begin
  i:=GridSmetaDBTableView.DataController.FocusedRecordIndex;
  MemoryData.First;
  while not(MemoryData.Eof)do
  begin
    if(MemoryData['CHECK']=true)then
    begin
      MemoryData.Edit;
      MemoryData['CHECK']:=false;
      MemoryData.Post;
    end
    else
    begin
      MemoryData.Edit;
      MemoryData['CHECK']:=true;
      MemoryData.Post;
    end;
    MemoryData.Next;
  end;
  GridSmetaDBTableView.DataController.FocusedRecordIndex:=i;
end;

procedure TFGr_SmetForm.GridSmetaDBTableViewKeyPress(Sender: TObject;
  var Key: Char);
begin
if(Key=' ')then
  GridSmetaDBTableViewDBCheck.EditValue:=not(GridSmetaDBTableViewDBCheck.EditValue);
If (Key in ['0'..'9']) then
  begin
   if (GridSmetaDBTableView.OptionsBehavior.IncSearchItem <> GridSmetaDBTableViewDBSmetaKod)then
    begin
     GridSmetaDBTableView.Controller.IncSearchingText   := '';
     GridSmetaDBTableView.OptionsBehavior.IncSearchItem := GridSmetaDBTableViewDBSmetaKod;
    end
  end
 else
 begin
  if (GridSmetaDBTableView.OptionsBehavior.IncSearchItem <> GridSmetaDBTableViewDBTitle)then
   begin
    GridSmetaDBTableView.Controller.IncSearchingText   := '';
    GridSmetaDBTableView.OptionsBehavior.IncSearchItem := GridSmetaDBTableViewDBTitle;
   end;
 end
end;

procedure TFGr_SmetForm.GridSmetaDBTableViewDblClick(Sender: TObject);
begin
  GridSmetaDBTableViewDBCheck.EditValue:=not(GridSmetaDBTableViewDBCheck.EditValue);
end;

end.
