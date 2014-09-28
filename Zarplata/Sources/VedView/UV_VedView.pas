unit UV_VedView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, dxBar, dxBarExtItems,
  cxSplitter, cxLabel, cxContainer, cxTextEdit, cxMaskEdit, cxDBEdit,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  dxDockPanel, dxDockControl, Unit_VedView_Consts, cxMemo,
  FIBQuery, pFIBQuery, ZProc, Dates, ZTypes, UV_VedView_Filter,ZMessages,
  PackageLoad, pFIBStoredProc, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, IBase,
  Unit_ZGlobal_Consts;

type
  TFUV_VedView = class(TForm)
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    PanelGridsChild: TPanel;
    SplitterPanelGridVed: TcxSplitter;
    PanelGridVed: TPanel;
    PanelGridPeople: TPanel;
    GridPeople: TcxGrid;
    GridPeopleView1: TcxGridDBTableView;
    GridChildColFIO: TcxGridDBColumn;
    GridPeopleLevel1: TcxGridLevel;
    DeleteBtn: TdxBarLargeButton;
    GridChildColSumma: TcxGridDBColumn;
    GridChildColFlVipl: TcxGridDBColumn;
    DataSourceChild: TDataSource;
    DataSourceParent: TDataSource;
    DataBase: TpFIBDatabase;
    DataSetChild: TpFIBDataSet;
    DataSetParent: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
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
    PanelDopDataVed: TPanel;
    DBMaskSmetaTitleEdit: TcxDBMaskEdit;
    DBMaskTypePaymentEdit: TcxDBMaskEdit;
    LabelSmetaTitle: TcxLabel;
    LabelTypePayment: TcxLabel;
    LabelDepartment: TcxLabel;
    DBMaskDepartmentEdit: TcxDBMaskEdit;
    cxSplitter2: TcxSplitter;
    InfoVedPeopleBtn: TdxBarLargeButton;
    dxBarDockControl2: TdxBarDockControl;
    FilterBtn: TdxBarLargeButton;
    GridVedView1: TcxGridDBTableView;
    GridVedLevel1: TcxGridLevel;
    GridVed: TcxGrid;
    GridMasterColKodSetup: TcxGridDBColumn;
    GridMasterColKod: TcxGridDBColumn;
    GridMasterColGrSumm: TcxGridDBColumn;
    GridMasterColTypeSheet: TcxGridDBColumn;
    GridMasterColIdReestr: TcxGridDBColumn;
    GridChildColTn: TcxGridDBColumn;
    GridMasterColSm: TcxGridDBColumn;
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InfoVedPeopleBtnClick(Sender: TObject);
    procedure ReportsBtnClick(Sender: TObject);
    procedure GridMasterColKodSetupGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure FilterBtnClick(Sender: TObject);
    procedure GridVedView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure GridPeopleView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure GridPeopleView1KeyPress(Sender: TObject; var Key: Char);
  private
    PParameter:UVVedFilter;
    PMode:TUVTypeViewSheet;
    PlanguageIndex:byte;
  public
    constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TUVTypeViewSheet;AParameter:UVVedFilter);reintroduce;
    property Mode:TUVTypeViewSheet read PMode;
  end;

function View_FUV_VedView(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TUVTypeViewSheet):Variant; stdcall;
 exports  View_FUV_VedView;


implementation

uses StrUtils;

{$R *.dfm}

function View_FUV_VedView(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TUVTypeViewSheet):Variant;
var ViewForm: TFUV_VedView;
    Parameter:UVVedFilter;
    i:integer;
    f:boolean;
begin
Parameter.Id_smeta:=0;
Parameter.Id_department:=0;
Parameter.Kod_Setup:=0;
Parameter.Kod:=0;
Parameter.Id_man:=0;
Parameter.ModalResult := mrYes;
F:=True;
for i:=Application.MainForm.MDIChildCount-1 downto 0 do
 if (Application.MainForm.MDIChildren[i].ClassType = TFUV_VedView) then
  if (Application.MainForm.MDIChildren[i] as TFUV_VedView).mode=ATypeView
   then
    begin
     Application.MainForm.MDIChildren[i].BringToFront;
     F:=False;
     break;
    end;
if F then
 begin
  if ATypeView=uvtvsWithFilter then
     Parameter := ViewFilter(AOwner,DB,Parameter);
  if Parameter.ModalResult=mrYes then
    ViewForm  :=  TFUV_VedView.Create(AOwner,DB,ATypeView,Parameter);
 end;
View_FUV_VedView:=NULL;
end;

constructor TFUV_VedView.Create(AOwner : TComponent;DB:TISC_DB_HANDLE;ATypeView:TUVTypeViewSheet;AParameter:UVVedFilter);
begin
Inherited Create(AOwner);
PParameter:=AParameter;
PlanguageIndex:=LanguageIndex;
SendMessage(self.handle,WM_SIZE,SIZE_MAXIMIZED,0);
//******************************************************************************
case ATypeView of
 uvtvsWithFilter:
 begin
  Caption                                      := TFUV_VedView_Caption_Filter;
  DeleteBtn.Visible := ivNever;
  FilterBtn.Visible    := ivAlways;
  DataSetParent.SQLs.SelectSQL.text            := 'SELECT * FROM UV_SELECT_GRSHEET('+
                                                  IFThen(PParameter.Kod_Setup=0,'NULL',IntToStr(PParameter.Kod_Setup))+','+
                                                  IfThen(PParameter.Kod=0,'NULL',IntToStr(PParameter.Kod))+','+
                                                  IfThen(PParameter.Id_man=0,'NULL',IntToStr(PParameter.Id_man))+','+
                                                  IFThen(PParameter.Id_Department=0,'NULL',IntToStr(PParameter.Id_department))+','+
                                                  IFThen(PParameter.Id_smeta=0,'NULL',IntToStr(PParameter.Id_smeta))+',0)';
 end;
 uvtvsCurrentKodSetup:
 begin
  Caption                                      := TFUV_VedView_Caption_CurrPeriod;
  DeleteBtn.Visible := ivAlways;
  FilterBtn.Visible := ivNever;
  DataSetParent.SQLs.SelectSQL.text            := 'SELECT * FROM UV_SELECT_GRSHEET(NULL,NULL,NULL,NULL,NULL,0)';
 end;
 uvtvsNotSaved:
 begin
  Caption                                      := TFUV_VedView_Caption_NotSaved;
  DeleteBtn.Visible := ivAlways;
  DeleteBtn.Enabled := True;
  FilterBtn.Visible    := ivNever;
  DataSetParent.SQLs.SelectSQL.text            := 'SELECT * FROM UV_SELECT_GRSHEET(NULL,NULL,NULL,NULL,NULL,1)';
 end;

end;
//******************************************************************************

PMode:=ATypeView;
PanelDopDataVed.Color                        := GridVedView1.Styles.Background.Color;
cxSplitter2.Color                            := GridVedView1.Styles.Header.Color;
//******************************************************************************
RefreshBtn.Caption                           := 'Відновити'; //TFUV_VedView_RefreshBtn_Caption;
ExitBtn.Caption                              := TFUV_VedView_ExitBtn_Caption;
InfoVedPeopleBtn.Caption                     := TFUV_VedView_InfoVedPeopleBtn_Caption;
DeleteBtn.Caption                            := TFUV_VedView_DeleteBtn_Caption;
FilterBtn.Caption                            := TFUV_VedView_FilterBtn_Caption;
GridMasterColKod.Caption                     := TFUV_VedView_GridMasterColKod_Caption;
GridMasterColTypeSheet.Caption               := TFUV_VedView_GridMasterColTypeSheet_Caption;
GridMasterColGrSumm.Caption                  := TFUV_VedView_GridMasterColGrSumma_Caption;
GridMasterColKodSetup.Caption                := TFUV_VedView_GridMasterColKodSetup_Caption;
GridMasterColIdReestr.Caption                := TFUV_VedView_GridMasterColIdReestr_Caption;
GridChildColFIO.Caption                      := TFUV_VedView_GridChildColFIO_Caption;
GridChildColSumma.Caption                    := TFUV_VedView_GridChildColSumma_Caption;
GridChildColFlVipl.Caption                   := TFUV_VedView_GridChildColFlVipl_Caption;
LabelSmetaTitle.Caption                      := 'Бюджет:'; //TFUV_VedView_LabelSmetaTitle_Caption;
LabelTypePayment.Caption                     := TFUV_VedView_LabelTypePayment_Caption;
LabelDepartment.Caption                      := TFUV_VedView_LabelDepartment_Caption;
//******************************************************************************
//******************************************************************************
GridMasterColKod.DataBinding.FieldName       := 'KOD_SHEET';
GridMasterColTypeSheet.DataBinding.FieldName := 'TYPE_SHEET';
GridMasterColGrSumm.DataBinding.FieldName    := 'GRSUMMA';
GridMasterColKodSetup.DataBinding.FieldName  := 'KOD_SETUP';
GridMasterColIdReestr.DataBinding.FieldName  := 'ID_REESTR';
//******************************************************************************
GridChildColFIO.DataBinding.FieldName        := 'FIO';
GridChildColSumma.DataBinding.FieldName      := 'SUMMA';
GridChildColFlVipl.DataBinding.FieldName     := 'FLAG_VIPL';
//******************************************************************************
DBMaskSmetaTitleEdit.DataBinding.DataField   := 'SMETA_TITLE';
DBMaskTypePaymentEdit.DataBinding.DataField  := 'TYPE_PAYMENT';
//DBMaskDepartmentEdit.DataBinding.DataField   := 'ALLSHORTNAME_DEPARTMENT';
//******************************************************************************
 case ATypeView of
  uvtvsWithFilter:
   begin
    GridMasterColKodSetup.Visible:=PParameter.Kod_Setup<>0;
    GridMasterColKodSetup.GroupIndex:=IfThen(PParameter.Kod_Setup=0,0,-1);
   end;
  uvtvsCurrentKodSetup:
   begin
    GridMasterColKodSetup.Visible:=False;
    GridMasterColKodSetup.GroupIndex:=-1;
   end;
  uvtvsNotSaved:
   begin
    GridMasterColKodSetup.Visible:=False;
    GridMasterColKodSetup.GroupIndex:=-1;
    GridMasterColIdReestr.Visible:=False;
   end;
 end;
DataSetChild.SQLs.SelectSQL.text             := 'SELECT * FROM UV_SHEET_LIST_PEOPLE(:ID_GRSHEET)';
DataBase.Handle                              := DB;
DataSetParent.Open;
DataSetChild.Open;
end;

procedure TFUV_VedView.ExitBtnClick(Sender: TObject);
begin
Close;
end;

procedure TFUV_VedView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
ReadTransaction.Commit;
if FormStyle=fsMDIChild then Action:=caFree;
end;

procedure TFUV_VedView.InfoVedPeopleBtnClick(Sender: TObject);
var Parameter:TUVSheetDataParameters;
begin
if DataSetChild.RecordCount<>0 then
 begin
  Parameter.ID:=DataSetChild.FieldValues['ID_SHEET'];
  Parameter.Caption:=DataSetChild.FieldValues['FIO'];
  LoadSheetData(Self,DataBase.Handle,Parameter);
 end;
end;

procedure TFUV_VedView.ReportsBtnClick(Sender: TObject);
begin
PrintSheet(self,DataBase.Handle,
            DataSetParent.FieldValues['ID_REESTR'],2);
end;

procedure TFUV_VedView.GridMasterColKodSetupGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
Atext:=KodSetupToPeriod(StrToInt(AText),0);
end;

procedure TFUV_VedView.FilterBtnClick(Sender: TObject);
begin
PParameter.ModalResult:=mrNone;
PParameter := ViewFilter(self,DataBase.Handle,PParameter);
if PParameter.ModalResult=mrYes then
 begin
    GridMasterColKodSetup.GroupIndex:=IfThen(PParameter.Kod_Setup=0,0,-1);
    DataSetParent.Close;
    DataSetParent.SQLs.SelectSQL.text            := 'SELECT * FROM UV_SELECT_GRSHEET('+
                                                  IFThen(PParameter.Kod_Setup=0,'NULL',IntToStr(PParameter.Kod_Setup))+','+
                                                  IfThen(PParameter.Kod=0,'NULL',IntToStr(PParameter.Kod))+','+
                                                  IfThen(PParameter.Id_man=0,'NULL',IntToStr(PParameter.Id_man))+','+
                                                  IFThen(PParameter.Id_Department=0,'NULL',IntToStr(PParameter.Id_department))+','+
                                                  IFThen(PParameter.Id_smeta=0,'NULL',IntToStr(PParameter.Id_smeta))+',0)';
    DataSetParent.Open;
    DataSetChild.CloseOpen(True);
    GridVedView1.DataController.LocateByKey(DataSetParent.FieldValues['ID_GRSHEET']);
 end;
end;

procedure TFUV_VedView.GridVedView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if (AFocusedRecord=nil) or (AFocusedRecord.Expandable) then
  GridPeopleView1.DataController.DataSource:=nil
else
  GridPeopleView1.DataController.DataSource:=DataSourceChild;
DeleteBtn.Enabled:= not ((AFocusedRecord=nil) or (AFocusedRecord.Expandable) or (VarToStrDef(DataSetParent.FieldValues['ID_REESTR'],'0')<>'0'));
GridPeopleView1FocusedRecordChanged(GridPeopleView1,nil,GridPeopleView1.Controller.FocusedRecord,True);
end;

procedure TFUV_VedView.GridPeopleView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
InfoVedPeopleBtn.Enabled := (AFocusedRecord <> nil);
end;

procedure TFUV_VedView.DeleteBtnClick(Sender: TObject);
begin
if ZShowMessage(TFUV_VedView_DeleteRecord_Caption,TFUV_VedView_DeleteRecord_Text,mtConfirmation,[mbYes,mbNo])=mrYes then
try
StoredProc.Database:=DataBase;
StoredProc.Transaction:=WriteTransaction;
StoredProc.Transaction.StartTransaction;
StoredProc.StoredProcName:='UV_DELETE_SHEET';
StoredProc.Prepare;
StoredProc.ParamByName('ID_GRSHEET').AsInteger := DataSetParent.FieldValues['ID_GRSHEET'];
StoredProc.ExecProc;
StoredProc.Transaction.Commit;
DataSetsCloseOpen(DataSetParent,DataSetChild);
if not DataSetParent.IsEmpty then
 GridVedView1.DataController.LocateByKey(DataSetParent.FieldValues['ID_GRSHEET']);
except
 on E:Exception do
  begin
   ZShowMessage(TFUV_VedView_Caption_Error,e.Message,mtError,[mbYes]);
   StoredProc.Transaction.Rollback;
  end
end;
end;

procedure TFUV_VedView.FormCreate(Sender: TObject);
begin
GridVedView1FocusedRecordChanged(GridVedView1,nil,GridVedView1.Controller.FocusedRecord,True);
end;

procedure TFUV_VedView.RefreshBtnClick(Sender: TObject);
var Id1,Id2:Variant;
begin
ID2:=DataSetChild.FieldValues['ID_SHEET'];
ID1:=DataSetParent.FieldValues['ID_GRSHEET'];
DataSetChild.Close;
DataSetParent.CloseOpen(True);
GridVedView1.DataController.LocateByKey(ID1);
DataSetChild.Open;
GridPeopleView1.DataController.LocateByKey(ID2);
end;

procedure TFUV_VedView.GridPeopleView1KeyPress(Sender: TObject;
  var Key: Char);
begin
 If (Key in ['0'..'9']) then
  begin
   if (GridPeopleView1.OptionsBehavior.IncSearchItem<>GridChildColTn)then
    begin
     GridPeopleView1.Controller.IncSearchingText   := '';
     GridPeopleView1.OptionsBehavior.IncSearchItem := GridChildColTn;
    end
  end
 else
  if (GridPeopleView1.OptionsBehavior.IncSearchItem<>GridChildColFIO)then
   begin
    GridPeopleView1.Controller.IncSearchingText   := '';
    GridPeopleView1.OptionsBehavior.IncSearchItem := GridChildColFIO;
   end;
end;

end.
