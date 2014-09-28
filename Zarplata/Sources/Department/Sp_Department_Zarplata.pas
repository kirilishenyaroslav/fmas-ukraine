//******************************************************************************
//Возвращает вариантній массив:
//индекс[0] - идентификатор подразделения
//индекс[1] - название подразделения
//индекс[2] - модальный результат: mrOk или mrAll
//******************************************************************************
unit Sp_Department_Zarplata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, dxBar, dxBarExtItems, ExtCtrls, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  dxDockControl, dxDockPanel, cxPropertiesStore, StdCtrls,
  cxLookAndFeelPainters, cxButtons, cxContainer, cxTextEdit, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ZTypes, Unit_ZGlobal_Consts, IBase, ZProc,
  ZSvodTypesUnit,ZMessages,zSvodLoaderUnit, cxCheckBox, ZcxLocateBar;

type
  TFZSp_Department = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    DockSite: TdxDockSite;
    DockPanelGrid: TdxDockPanel;
    dxLayoutDockSite2: TdxLayoutDockSite;
    DockPanelTree: TdxDockPanel;
    dxLayoutDockSite1: TdxLayoutDockSite;
    DivisionTreeList: TcxDBTreeList;
    DivisionTreeListColumnShortName: TcxDBTreeListColumn;
    DivisionTreeListColumnNameDepType: TcxDBTreeListColumn;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    ColumnOptionName: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    DivisionTreeListColumnKod: TcxDBTreeListColumn;
    SelectAllBtn: TdxBarLargeButton;
    DB: TpFIBDatabase;
    DataSetParent: TpFIBDataSet;
    DataSetChild: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSourceChild: TDataSource;
    DataSourceParent: TDataSource;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
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
    DivisionTreeListColumnSumma: TcxDBTreeListColumn;
    PrintSvodBtn: TdxBarLargeButton;
    DivisionTreeListColumnFULLName: TcxDBTreeListColumn;
    ColumnInUse: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SelectBtnClick(Sender: TObject);
    procedure SelectAllBtnClick(Sender: TObject);
    procedure PrintSvodBtnClick(Sender: TObject);
    procedure DivisionTreeListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DivisionTreeListDblClick(Sender: TObject);
    procedure DivisionTreeListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
  private
    PResault: Variant;
    Ins_ZFormStyle:TZFormStyle;
    Is_Svod:boolean;
    SvodParam:TSvodParam;
    PLanguageIndex:Byte;
    PBarLocate:TZBarLocate;
  public
    constructor Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);reintroduce;
    constructor CreateForSvod(AParameter:TSvodParam);overload;
    property Resault:Variant read PResault;
    property ZFormStyle:TZFormStyle read Ins_ZFormStyle;
  end;

function View_FZ_Department_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant; stdcall;
 exports  View_FZ_Department_Sp;

function View_FZ_DepartmentForSvod(AParameter:TSvodParam):variant;stdcall;
 exports View_FZ_DepartmentForSvod;

implementation

{$R *.dfm}

function View_FZ_DepartmentForSvod(AParameter:TSvodParam):variant;
var ViewForm: TFZSp_Department;
begin
   ViewForm  :=  TFZSp_Department.CreateForSvod(AParameter);
   ViewForm.ShowModal;
   ViewForm.Free;
end;

function View_FZ_Department_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle):Variant;
var ViewForm: TFZSp_Department;
    Res:Variant;
begin
case ComeFormStyle of
 zfsChild:
  begin
   if (not IsMDIChildFormShow(TFZSp_Department)) then
    begin
     ViewForm  :=  TFZSp_Department.Create(AOwner, DB, zfsChild);
     ViewForm.Show;
    end;
   res:=NULL;
  end;
 zfsNormal:
  begin
   ViewForm  :=  TFZSp_Department.Create(AOwner, DB, zfsNormal);
   ViewForm.ShowModal;
   if (ViewForm.ModalResult=mrOk) or (ViewForm.ModalResult=mrAll) then
    res:=ViewForm.Resault
   else
     res:=NULL;
   ViewForm.Free;
  end;
 zfsModal:
  begin
   ViewForm  :=  TFZSp_Department.Create(AOwner, DB, zfsModal);
   ViewForm.ShowModal;
   if (ViewForm.ModalResult=mrOk) or (ViewForm.ModalResult=mrAll) then
    res:=ViewForm.Resault
   else
     res:=NULL;
   ViewForm.Free;
  end;
end;
View_FZ_Department_Sp:=res;
end;

constructor TFZSp_Department.CreateForSvod(AParameter:TSvodParam);
begin
inherited create(AParameter.AOwner);
PLanguageIndex:=LanguageIndex;
self.Caption                                            := Sp_Department_Caption[PLanguageIndex];
//******************************************************************************
SvodParam:=AParameter;
Self.BorderStyle:=bsSizeable;
Is_Svod:=True;
DB.Handle := AParameter.DB_Handle;
//******************************************************************************
Self.SelectBtn.Visible:=ivNever;
Self.SelectAllBtn.Visible:=ivNever;
Self.RefreshBtn.Visible:=ivNever;
Self.PrintSvodBtn.Visible:=ivAlways;
//******************************************************************************
self.PrintSvodBtn.Caption                               := PrintSvodBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                                  := SelectBtn_Caption[PLanguageIndex];
self.SelectAllBtn.Caption                               := SelectWithDependence_Caption[PLanguageIndex];
self.RefreshBtn.Caption                                 := 'Відновити'; //RefreshBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                                    := ExitBtn_Caption[PLanguageIndex];
self.DivisionTreeListColumnNameDepType.Caption.Text     := GridClType_Caption[PLanguageIndex];
self.DivisionTreeListColumnShortName.Caption.Text       := GridClShortName_Caption[PLanguageIndex];
self.DivisionTreeListColumnFULLName.Caption.Text        := GridClFullName_Caption[PLanguageIndex];
self.DivisionTreeListColumnKod.Caption.Text             := GridClKod_Caption[PLanguageIndex];
self.DivisionTreeListColumnSumma.Caption.Text           := GridClSumma_Caption[PLanguageIndex];
self.ColumnOptionName.Caption                           := GridClPropertyName_Caption[PLanguageIndex];
self.DockPanelGrid.Caption                              := PanelDockProperty_Caption[PLanguageIndex];
self.ColumnInUse.Caption                                := GridClPropertyUse_Caption[PLanguageIndex];
//******************************************************************************
DivisionTreeList.GotoBOF;
DivisionTreeListFocusedNodeChanged(DivisionTreeList,nil,DivisionTreeList.FocusedNode);
//******************************************************************************
if Is_Svod then DockPanelGrid.Free;
//******************************************************************************
DataSetParent.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM Z_SVODBYDEPARTMENT_DATA_FOR_S('+IntToStr(AParameter.ID_Session)+')';
//******************************************************************************
DivisionTreeListColumnSumma.Visible:=True;
try
 DataSetParent.Open;
except
 on E:Exception do
  begin
   ZShowMessage(Error_Caption[PLanguageIndex],e.Message,mtError,[mbOk]);
   exit;
  end;
end;
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DataSetParent;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('NAME_FULL',
                           DivisionTreeListColumnFULLName.Caption.Text,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('NAME_SHORT',
                           DivisionTreeListColumnShortName.Caption.Text,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('DEPARTMENT_KOD',
                           DivisionTreeListColumnKod.Caption.Text,
                           [loCaseInsensitive,loPartialKey]);
//******************************************************************************
PResault:=VarArrayCreate([0,2],varVariant);
end;

constructor TFZSp_Department.Create(ComeComponent:TComponent;ComeDB:TISC_DB_HANDLE;ComeFormStyle:TZFormStyle=zfsChild);
begin
 inherited Create(ComeComponent);
 PLanguageIndex:=LanguageIndex;
 self.Caption                                            :=  Sp_Department_Caption[PLanguageIndex];
//******************************************************************************
 Is_Svod:=False;
case ComeFormStyle of
 zfsModal:
  begin
   self.FormStyle            := fsNormal;
   self.BorderStyle          := bsDialog;
   self.SelectBtn.Visible    := ivAlways;
   self.SelectAllBtn.Visible := ivAlways;
   self.Position             := poOwnerFormCenter;
  end;
 zfsChild:
  begin
   self.FormStyle            := fsMDIChild;
   self.BorderStyle          := bsSizeable;
   self.SelectBtn.Visible    := ivNever;
   self.SelectAllBtn.Visible := ivNever;
   self.Position             := poMainFormCenter;
  end;
 zfsNormal:
  begin
   self.FormStyle            := fsNormal;
   self.BorderStyle          := bsDialog;
   self.SelectBtn.Visible    := ivAlways;
   self.SelectAllBtn.Visible := ivNever;
   self.Position             := poOwnerFormCenter;
  end;
end;
Ins_ZFormStyle:=ComeFormStyle;
DB.Handle := ComeDB;
//******************************************************************************
DataSetParent.SQLs.SelectSQL.Text:='SELECT * FROM SP_DEPARTMENT_ZARSELECT';
DataSetChild.SQLs.SelectSQL.Text:='SELECT * FROM Z_DEPARTMENT_PROPERTY_SELECT(:ID_DEPARTMENT)';
DataSetParent.Open;
DataSetChild.Open;
//******************************************************************************
PResault:=VarArrayCreate([0,3],varVariant);
//******************************************************************************
self.PrintSvodBtn.Caption                               := PrintSvodBtn_Caption[PLanguageIndex];
self.SelectBtn.Caption                                  := SelectBtn_Caption[PLanguageIndex];
self.SelectAllBtn.Caption                               := SelectWithDependence_Caption[PLanguageIndex];
self.RefreshBtn.Caption                                 := RefreshBtn_Caption[PLanguageIndex];
self.ExitBtn.Caption                                    := ExitBtn_Caption[PLanguageIndex];
self.DivisionTreeListColumnNameDepType.Caption.Text     := GridClType_Caption[PLanguageIndex];
self.DivisionTreeListColumnShortName.Caption.Text       := GridClShortName_Caption[PLanguageIndex];
self.DivisionTreeListColumnFULLName.Caption.Text        := GridClFullName_Caption[PLanguageIndex];
self.DivisionTreeListColumnKod.Caption.Text             := GridClKod_Caption[PLanguageIndex];
self.DivisionTreeListColumnSumma.Caption.Text           := GridClSumma_Caption[PLanguageIndex];
self.ColumnOptionName.Caption                           := GridClPropertyName_Caption[PLanguageIndex];
self.DockPanelGrid.Caption                              := PanelDockProperty_Caption[PLanguageIndex];
self.ColumnInUse.Caption                                := GridClPropertyUse_Caption[PLanguageIndex];
//******************************************************************************
DivisionTreeList.GotoBOF;
DivisionTreeListFocusedNodeChanged(DivisionTreeList,nil,DivisionTreeList.FocusedNode);
//******************************************************************************
 PBarLocate:=TZBarLocate.Create(BarManager);
 PBarLocate.DataSet := DataSetParent;
 PBarLocate.BorderStyle := bbsNone;
 PBarLocate.AddLocateItem('NAME_FULL',
                           DivisionTreeListColumnFULLName.Caption.Text,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('NAME_SHORT',
                           DivisionTreeListColumnShortName.Caption.Text,
                           [loCaseInsensitive,loPartialKey]);
 PBarLocate.AddLocateItem('DEPARTMENT_KOD',
                           DivisionTreeListColumnKod.Caption.Text,
                           [loCaseInsensitive,loPartialKey]);
//******************************************************************************
end;

procedure TFZSp_Department.ExitBtnClick(Sender: TObject);
begin
if self.ZFormStyle=zfsModal then ModalResult:=mrNo
else Close;
end;

procedure TFZSp_Department.RefreshBtnClick(Sender: TObject);
begin
if Is_Svod then
 DataSetCloseOpen(DataSetParent,'ID_DEPARTMENT')
else
 DataSetsCloseOpen(DataSetParent,DataSetChild,'ID_DEPARTMENT','ID_PROPERTY');
end;

procedure TFZSp_Department.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
If self.FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFZSp_Department.SelectBtnClick(Sender: TObject);
begin
PResault[0]:=DataSetParent.FieldValues['ID_DEPARTMENT'];
PResault[1]:=DataSetParent.FieldValues['NAME_SHORT'];
PResault[2]:=mrOk;
PResault[3]:=DataSetParent.FieldValues['DEPARTMENT_KOD'];
self.ModalResult := mrOk;
end;

procedure TFZSp_Department.SelectAllBtnClick(Sender: TObject);
begin
PResault[0]:=DataSetParent.FieldValues['ID_DEPARTMENT'];
PResault[1]:=DataSetParent.FieldValues['NAME_SHORT'];
PResault[2]:=mrAll;
PResault[3]:=DataSetParent.FieldValues['DEPARTMENT_KOD'];
self.ModalResult := mrAll;
end;

procedure TFZSp_Department.PrintSvodBtnClick(Sender: TObject);
var Param:TSvodByDepartmentParam;
begin
if DivisionTreeList.FocusedNode=nil then exit;
Param.SvodParam:=SvodParam;
Param.SvodParam.AOwner:=self;
Param.Id_Department:=DataSetParent['ID_DEPARTMENT'];
PrintSvodDepartment(Param);
end;

procedure TFZSp_Department.DivisionTreeListKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key=13 then
  DivisionTreeListDblClick(Sender);
end;

procedure TFZSp_Department.DivisionTreeListDblClick(Sender: TObject);
begin
 if (PrintSvodBtn.Visible=ivAlways) and (PrintSvodBtn.Enabled) then
     PrintSvodBtnClick(Sender);
 if (SelectBtn.Visible=ivAlways) and (SelectBtn.Enabled) then
     SelectBtnClick(Sender);
end;

procedure TFZSp_Department.DivisionTreeListFocusedNodeChanged(
  Sender: TObject; APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
if AFocusedNode<>nil then
 begin
  PrintSvodBtn.Enabled := True;
  SelectBtn.Enabled := True;
  SelectAllBtn.Enabled := True;
 end
else
 begin
  PrintSvodBtn.Enabled := False;
  SelectBtn.Enabled := False;
  SelectAllBtn.Enabled := False;
 end;
end;

end.
