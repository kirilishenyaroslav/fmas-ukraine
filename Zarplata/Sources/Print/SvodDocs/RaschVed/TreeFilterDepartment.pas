unit TreeFilterDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer,
  cxTreeView, cxControls, cxGroupBox, IBase, cxEdit, cxRadioGroup,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxInplaceContainer, cxSpinEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel, Unit_ZGlobal_Consts,
  cxClasses, RaschVedMainDM, Dates, ZSvodLoaderUnit, ZSvodTypesUnit,
  ExtCtrls, dxBar, dxBarExtItems, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, RaschVedPrintDM, ZProc,
  RaschVedReestrPrintDM, zMessages, cxCheckBox, cxDBTL, cxTLData, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, RxMemDS, ActnList;

type
  TFTreeFilterDepartmen = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    PrintSvodBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    PrintReestrBtn: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ActionList1: TActionList;
    Action1: TAction;
    TreeListDep: TcxDBTreeList;
    TreeListColumnDepName: TcxDBTreeListColumn;
    TreeListColumnDepYes: TcxDBTreeListColumn;
    TreeListColumnDepId: TcxDBTreeListColumn;
    TreeListDepcxDBTreeListColumnCount: TcxDBTreeListColumn;
    TreeListDepcxDBTreeListColumnKOD: TcxDBTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    LBtnRecurs: TdxBarLargeButton;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure PrintSvodBtnClick(Sender: TObject);
    procedure PrintReestrBtnClick(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure obhod(ID_LINK:Integer;FIND:Integer;Res:integer);
    procedure TreeListDepDblClick(Sender: TObject);
    procedure LBtnRecursClick(Sender: TObject);
  private
    PParameter:TZAccListParameter;
    MainDM:TMainDM;
    PLanguageIndex:byte;
  public
    constructor Create(AParameter:TZAccListParameter);reintroduce;
    destructor Destroy;reintroduce;
  end;

implementation



{$R *.dfm}

constructor TFTreeFilterDepartmen.Create(AParameter:TZAccListParameter);
begin
 inherited Create(AParameter.AOwner);
 PParameter:=AParameter;
 PParameter.AOwner:=self;
 MainDM:=TMainDM.Create(PParameter);
 PParameter:=AParameter;
 PLanguageIndex:=LanguageIndex;
//******************************************************************************
 PrintSvodBtn.Caption := Sheets_Const[PLanguageIndex];
 PrintReestrBtn.Caption :=  Reestr_Const[PLanguageIndex];
 RefreshBtn.Caption := RefreshBtn_Caption[PLanguageIndex];
 ExitBtn.Caption    := ExitBtn_Caption[PLanguageIndex];

 TreeListColumnDepName.Caption.Text := LabelDepartment_Caption[PLanguageIndex];
 TreeListDepcxDBTreeListColumnKOD.Caption.Text := GridClKodDepartment_Caption[PLanguageIndex];;
 TreeListDepcxDBTreeListColumnCount.Caption.Text := OfPeople_Const[PLanguageIndex];

 Caption := FRaschVed_SelDepartment_Caption[PLanguageIndex];
//******************************************************************************
 TreeListDep.DataController.DataSource:=MainDM.DSource;
 MainDM.DSource.DataSet:=MainDM.RxMData;
 //eeListDep.FullCollapse;
 //eeListDep.Items[0][0].Expand(True);
 TreeListDep.FullExpand;
end;

procedure TFTreeFilterDepartmen.ExitBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFTreeFilterDepartmen.RefreshBtnClick(Sender: TObject);
var _recno:integer;
begin
  with MainDM do
  begin
    _recno:=RxMData.RecNo;
    DSet.CloseOpen(True);
    RxMData.close;
    RxMData.CopyStructure(DSet);
    RxMData.Open;
    RxMData.LoadFromDataSet(DSet,0,lmAppend);
    RxMData.RecNo:=_Recno;
  end
end;

procedure TFTreeFilterDepartmen.PrintSvodBtnClick(Sender: TObject);
var PrintDM:TPrintDM;
RecordNo:Integer;
begin
  TreeListDep.DataController.DataSet.DisableControls;
  PParameter.AOwner:=Self;

  with MainDM do
  begin
    try
      StProc.StoredProcName := 'PUB_GET_ID_BY_GEN';
      StProc.Transaction.StartTransaction;
      StProc.Prepare;
      StProc.ParamByName('GENERATOR_NAME').AsString:='GEN_Z_FILTER_PRINT_RASCH_VED';
      StProc.ParamByName('STEP').AsInteger:=1;
      StProc.ExecProc;
      PParameter.ID_SESSION_FILTER_DEP:=StProc.ParamByName('RET_VALUE').AsInteger;
      StProc.Transaction.Commit;
    except
      on E:exception do
      begin
        ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
        StProc.Transaction.Rollback;
      end;
    end;

    //PParameter.Id_Department:=MainDM.DSet['ID_DEPARTMENT'];
    RecordNo:=RxMData.RecNo;
    RxMData.First;
    while not(RxMData.Eof) do
    begin
     //if GridDBTableView1.Controller.FocusedRecord.Selected=true then
      if (RxMData['exists_line']=1) then
       try
        StProc.StoredProcName := 'Z_FILTER_PRINT_RASCH_VED_BUF_I';
        StProc.Transaction.StartTransaction;
        StProc.Prepare;
        StProc.ParamByName('ID_SESSION_FILTER_DEP').AsInteger:=PParameter.ID_SESSION_FILTER_DEP;
        StProc.ParamByName('ID_DEPARTMENT').AsInteger:=RxMData['ID_DEPARTMENT'];
        StProc.ExecProc;
        StProc.Transaction.Commit;
       except
        on E:exception do
          begin
            ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
            StProc.Transaction.Rollback;
          end;
       end;
     RxMData.Next
    end;


    PrintDM:=TPrintDM.Create(self);
    if (PParameter.TypeData in [4,6]) then
      PrintDM.ReportCreateShort(PParameter)
    else
    PrintDM.ReportCreate(PParameter);
    PrintDM.Free;
    try
      MainDM.StProc.StoredProcName := 'Z_FILTER_PRINT_RASCH_VED_BUF_D';
      MainDM.StProc.Transaction.StartTransaction;
      MainDM.StProc.Prepare;
      MainDM.StProc.ParamByName('ID_SESSION_FILTER_DEP').AsInteger:=PParameter.ID_SESSION_FILTER_DEP;
      MainDM.StProc.ExecProc;
      MainDM.StProc.Transaction.Commit;
    except
     on E:exception do
     begin
       ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
       MainDM.StProc.Transaction.Rollback;
     end;
    end;
    RxMData.RecNo:=RecordNo;
    TreeListDep.DataController.DataSet.EnableControls;
  end;
end;

destructor TFTreeFilterDepartmen.Destroy;
begin
 MainDM.Destroy;
 inherited Destroy;
end;

procedure TFTreeFilterDepartmen.PrintReestrBtnClick(Sender: TObject);
var PrintDM:TDM;
begin
PParameter.AOwner:=Self;
PParameter.Id_Department:=MainDM.RxMData['ID_DEPARTMENT'];
PrintDM:=TDM.Create(self);
PrintDM.PrintSpr(PParameter);
PrintDM.Free;
end;

procedure TFTreeFilterDepartmen.dxBarLargeButton1Click(Sender: TObject);
var RecNo:Integer;
begin

  with MainDM do
  begin
    TreeListDep.DataController.dataSource:=nil;//DSet
    RecNo:=RxMData.RecNo;
    RxMData.First;
    while(not RxMData.Eof) do
    begin
      RxMData.Edit;
      RxMData['exists_line'] :=1;
      RxMData.Post;
      RxMData.Next;
    end;
    RxMData.RecNo:=RecNo;
    TreeListDep.DataController.dataSource:=DSource;
  end;

end;

procedure TFTreeFilterDepartmen.dxBarLargeButton2Click(Sender: TObject);
var RecNo:Integer;
begin

  with MainDM do
  begin
    TreeListDep.DataController.dataSource:=nil;//DSet
    RecNo:=RxMData.RecNo;
    RxMData.First;
    while(not RxMData.Eof) do
    begin
      RxMData.Edit;
      RxMData['exists_line'] :=0;
      RxMData.Post;
      RxMData.Next;
    end;
    RxMData.RecNo:=RecNo;
    TreeListDep.DataController.dataSource:=DSource;
  end

end;

procedure TFTreeFilterDepartmen.dxBarLargeButton3Click(Sender: TObject);
var RecNo:Integer;
begin

  with MainDM do
  begin
    TreeListDep.DataController.dataSource:=nil;//DSet
    RecNo:=RxMData.RecNo;
    RxMData.First;
    while(not RxMData.Eof) do
    begin
      RxMData.Edit;
      if   RxMData['exists_line'] =1 then
        RxMData['exists_line'] :=0
      else  RxMData['exists_line'] :=1;
      RxMData.post;
      RxMData.Next;
    end;
    RxMData.RecNo:=RecNo;
    TreeListDep.DataController.dataSource:=DSource;
  end

end;

procedure TFTreeFilterDepartmen.obhod(ID_LINK, FIND, Res: integer);
begin
  with MainDM do
  begin
    while(RxMData.Locate('ID_LINK;exists_line',VarArrayOf([ID_LINK, FIND]),[]) ) do  // videlit vse dochernie tak ge kak i roditelya
    begin
      RxMData.Edit;
      RxMData['exists_line'] :=Res;
      RxMData.Post;
      obhod(RxMData['ID_DEPARTMENT'],FIND,Res);
    end;
  end;
end;

procedure TFTreeFilterDepartmen.TreeListDepDblClick(Sender: TObject);
var  val:integer;
begin
  with MainDM do
  begin
    RxMData.Edit;
    if RxMData['exists_line']=1 then  begin RxMData['exists_line'] :=0; val:=1; end
    else begin RxMData['exists_line'] :=1;  val:=0; end;
    RxMData.Post;
  end;
end;


procedure TFTreeFilterDepartmen.LBtnRecursClick(Sender: TObject);
var RecNo, ID_LINK, val, Res:integer;
begin
  with MainDM do
  begin
    TreeListDep.DataController.dataSource:=nil;//DSet
    RecNo:=RxMData.RecNo;
    ID_LINK:=RxMData['ID_DEPARTMENT'];
    RxMData.Edit;
    if RxMData['exists_line']=1 then  begin RxMData['exists_line'] :=0; val:=1; end
    else begin RxMData['exists_line'] :=1;  val:=0; end;
    Res:=RxMData['exists_line'];
    RxMData.Post;
    obhod(ID_LINK,val,Res);
    RxMData.RecNo:=RecNo;
    TreeListDep.DataController.dataSource:=DSource;
  end;
end;

end.
