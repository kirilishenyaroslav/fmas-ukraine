//******************************************************************************
// Проект "Контракты"
// Кредит
// Чернявский А.Э. 2007г.
//******************************************************************************

unit Credit_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM_cr, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  cn_Common_Funcs, cnConsts, cxCurrencyEdit, frxClass, frxDBSet, frxDesgn,
  frxExportPDF, frxExportXLS, frxExportHTML, frxExportRTF, ActnList,
  ExtCtrls, Credit_AE,
  cnConsts_Messages, cn_Common_Messages, Credit_AddAll_Unit,
  cn_Common_Types, cn_Common_Loader, mcmImage, mcmImageDB, mcmPrinter,
  frmRangeUnit;

type
  TfrmCredit = class(TForm)
    Splitter1: TSplitter;
    Grid: TcxGrid;
    GridView: TcxGridDBTableView;
    NAME_DOCUM: TcxGridDBColumn;
    DATE_DOCUM: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    Grid2: TcxGrid;
    Grid2View: TcxGridDBTableView;
    Facul_Col: TcxGridDBColumn;
    FIO_Col: TcxGridDBColumn;
    Summa_Col: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    StatusBar: TdxStatusBar;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    AddPfioButton: TdxBarLargeButton;
    DeletePfioButton: TdxBarLargeButton;
    EditPfioButton: TdxBarLargeButton;
    AddListPfioButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Search_Button: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    AddAllAvto_Btn: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    BarStatic: TdxBarStatic;
    DeleteAll_Btn: TdxBarLargeButton;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ViewAction: TAction;
    DebugPrintAction: TAction;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    PopupMenu1: TdxBarPopupMenu;
    PopupImageList: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    clnSumma: TcxGridDBColumn;
    clnNUM_DOG: TcxGridDBColumn;
    frxReport: TfrxReport;
    btnPrintList: TdxBarButton;
    btnPrintImage: TdxBarButton;
    btnScan: TdxBarLargeButton;
    db_imgPicture: TmcmImageDB;
    mcmPrinter: TmcmPrinter;
    btnView: TdxBarLargeButton;
    btnPrintOptions: TdxBarButton;
    PrinterSetupDialog: TPrinterSetupDialog;
    clnSummaDog: TcxGridDBColumn;
    btnPrintRange: TdxBarButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeletePfioButtonClick(Sender: TObject);
    procedure DeleteAll_BtnClick(Sender: TObject);
    procedure AddAllAvto_BtnClick(Sender: TObject);
    procedure DebugPrintActionExecute(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure btnPrintListClick(Sender: TObject);
    procedure GridViewDblClick(Sender: TObject);
    procedure btnScanClick(Sender: TObject);
procedure PrintImageEx(Sender: TObject; IsRange: Boolean; Rbeg:Integer; Rend: Integer; PrintValue: Integer);
    procedure btnViewClick(Sender: TObject);
    procedure btnPrintOptionsClick(Sender: TObject);
    procedure btnPrintRangeClick(Sender: TObject);
    procedure btnPrintImageClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM, DM_Detail_1 :TDM_C;
    procedure FormIniLanguage;
  public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;

  var designer_rep:Integer;

implementation

uses FIBQuery;

{$R *.dfm}

constructor TfrmCredit.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
designer_rep:=0;
DM:=TDM_C.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_CREDIT_S';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
GridView.DataController.DataSource := DM.DataSource;

DM_Detail_1:=TDM_C.Create(Self);
DM_Detail_1.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM  CN_DT_CREDIT_LIST_S(?ID_CREDIT) order by FIO';
DM_Detail_1.DataSet.DataSource:= DM.DataSource;
DM_Detail_1.DB.Handle:=DB_Handle;
DM_Detail_1.DataSet.Open;
Grid2View.DataController.DataSource := DM_Detail_1.DataSource;


FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmCredit.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 Caption:= cnConsts.cn_Credit_Caption[PLanguageIndex];

 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_Execution[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 ViewButton.Caption :=          cnConsts.cn_ViewShort_Caption[PLanguageIndex];
 PrintButton.Caption:=          cnConsts.cn_Print_Caption[PLanguageIndex];
 btnView.Hint:=                 cnConsts.cn_Sort[PLanguageIndex];
 DeleteAll_Btn.Hint:=           cn_DelAll_Caption[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];

 AddPfioButton.Caption :=     cn_InsertBtn_Caption[PLanguageIndex];
 AddPfioButton.Hint :=        cn_InsertBtn_Caption[PLanguageIndex];
 EditPfioButton.Caption :=    cn_EditBtn_Caption[PLanguageIndex];
 EditPfioButton.Hint :=       cn_EditBtn_Caption[PLanguageIndex];
 DeletePfioButton.Caption :=  cn_DeleteBtn_Caption[PLanguageIndex];
 DeletePfioButton.Hint :=     cn_DeleteBtn_Caption[PLanguageIndex];
 AddListPfioButton.Caption := cn_Add_List[PLanguageIndex];
 AddListPfioButton.Hint :=    cn_Add_List[PLanguageIndex];
 AddAllAvto_Btn.Hint :=       cn_RaportAvto[PLanguageIndex];
 btnPrintList.Caption :=      cn_Reestr[PLanguageIndex];
 btnPrintImage.Caption :=     cn_Image[PLanguageIndex];
 btnScan.Caption :=           cn_Image[PLanguageIndex];
 //btnPrintRange.Caption :=     cn_PrintRangeImage[PLanguageIndex];
 btnPrintRange.Caption :=     cn_Image[PLanguageIndex];

 // grid's
 NAME_DOCUM.Caption  :=   cn_FiltrByNum[PLanguageIndex];
 DATE_DOCUM.Caption  :=   cn_Date_Opl_Column[PLanguageIndex];
 clnSumma.Caption    :=   cn_Summa_Column[PLanguageIndex];
 Facul_Col.Caption   :=   cn_footer_Faculty[PLanguageIndex];
 clnSummaDog.Caption :=   cn_DogSum[PLanguageIndex];

 FIO_Col.Caption     :=   cn_grid_FIO_Column[PLanguageIndex];
 Summa_Col.Caption   :=   cn_Summa_Column[PLanguageIndex];
 clnNUM_DOG.Caption   :=  cn_grid_Num_Dog_Column[PLanguageIndex];
end;

procedure TfrmCredit.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmCredit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmCredit.AddButtonClick(Sender: TObject);
var ViewForm : TfrmCredit_AE;
 location : int64;
begin
 ViewForm := TfrmCredit_AE.create(self, PLanguageIndex, DM.DB.Handle);
 ViewForm.Caption := cn_InsertBtn_Caption[PLanguageIndex];
 ViewForm.Date_Create_Edit.Date := Now;
 
 if ViewForm.ShowModal = mrOk then
  begin
    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_DT_CREDIT_I';
        Transaction.StartTransaction;
        ParamByName('NUM_CREDIT').AsString    := ViewForm.Num_Credit_Edit.Text;
        ParamByName('DATE_START_CALC').AsDate := ViewForm.DateStartCalc_Edit.Date;
        ParamByName('DATE_CREDIT').AsDate     := ViewForm.Date_Credit_Edit.Date;
        ParamByName('SUMMA').AsCurrency       := ViewForm.SummaEdit.Value;
        ParamByName('NOTE').AsString          := ViewForm.Note_Edit.Text;
        ParamByName('CUSTOMER').AsString      := ViewForm.Customer_Edit.Text;
        ParamByName('LIMIT_SUM').AsCurrency   := ViewForm.LimitSum_Edit.Value;
        ParamByName('LIMIT_DOGS').AsCurrency  := ViewForm.LimitDog_Edit.Value;
        ParamByName('IMAGE_PRIORITY').AsInteger:=  Integer(ViewForm.ckbxImagePriority.Checked);
        ParamByName('COMMENTS').AsString      := ViewForm.ord_ae_Comments.Text;
        ParamByName('ID_STATUS').AsInt64      := ViewForm.Id_Status;
        Prepare;
        ExecProc;
         location := ParamByName('ID_CREDIT').AsInt64;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure CN_DT_CREDIT_I');
        raise;
        exit;
      end;
     end;
     DM.DataSet.CloseOpen(true);
     DM.DataSet.Locate('ID_CREDIT',location,[] );
     DM_Detail_1.DataSet.CloseOpen(true);
  end;
end;

procedure TfrmCredit.EditButtonClick(Sender: TObject);
var ViewForm : TfrmCredit_AE;
 locateID : int64;
begin
if GridView.DataController.RecordCount = 0 then exit;

 ViewForm := TfrmCredit_AE.create(self, PLanguageIndex, DM.DB.Handle);
 ViewForm.Caption := cn_EditBtn_Caption[PLanguageIndex];

 ViewForm.Num_Credit_Edit.Text   := DM.DataSet['NUM_CREDIT'];
 ViewForm.DateStartCalc_Edit.Date  := DM.DataSet['DATE_START_CALC'];
 ViewForm.Date_Credit_Edit.Date :=    DM.DataSet['DATE_CREDIT'];
 ViewForm.Date_Create_Edit.Date :=    DM.DataSet['DATE_CREATE'];
 ViewForm.SummaEdit.Value       :=    DM.DataSet['SUMMA'];
 ViewForm.Note_Edit.Text        :=    DM.DataSet['NOTE'];
 ViewForm.Customer_Edit.Text    :=    DM.DataSet['CUSTOMER'];
 ViewForm.LimitSum_Edit.Value    :=    DM.DataSet['LIMIT_SUM'];
 ViewForm.LimitDog_Edit.Value    :=    DM.DataSet['LIMIT_DOGS'];
 ViewForm.ckbxImagePriority.Checked :=  Boolean(DM.DataSet['IMAGE_PRIORITY']);
 ViewForm.ord_ae_Comments.Text    :=  DM.DataSet['COMMENTS'];
 ViewForm.Id_Status := DM.DataSet['ID_STATUS'];
 ViewForm.StatusEdit.Text := DM.DataSet['NAME_STATUS'];
 
  if DM_Detail_1.DataSet.RecordCount > 0 then
   begin
    ViewForm.Date_Credit_Edit.Properties.ReadOnly := True;
    ViewForm.Date_Credit_Edit.Style.Color :=  $00F8E4D8;
    ViewForm.DateStartCalc_Edit.Properties.ReadOnly := True;
    ViewForm.DateStartCalc_Edit.Style.Color :=  $00F8E4D8;
    ViewForm.LimitSum_Edit.Properties.ReadOnly := True;
    ViewForm.LimitSum_Edit.Style.Color :=  $00F8E4D8;
    ViewForm.LimitDog_Edit.Properties.ReadOnly := True;
    ViewForm.LimitDog_Edit.Style.Color :=  $00F8E4D8;
    ViewForm.ckbxImagePriority.Properties.ReadOnly := True;
   end;

 if ViewForm.ShowModal = mrOk then
  begin
    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_DT_CREDIT_U';
        Transaction.StartTransaction;
        ParamByName('ID_CREDIT').AsInt64 := DM.Dataset['ID_CREDIT'];
        locateID := DM.Dataset['ID_CREDIT'];
        ParamByName('NUM_CREDIT').AsString    := ViewForm.Num_Credit_Edit.Text;
        ParamByName('DATE_START_CALC').AsDate := ViewForm.DateStartCalc_Edit.Date;
        ParamByName('DATE_CREDIT').AsDate     := ViewForm.Date_Credit_Edit.Date;
        ParamByName('SUMMA').AsCurrency       := ViewForm.SummaEdit.Value;
        ParamByName('NOTE').AsString          := ViewForm.Note_Edit.Text;
        ParamByName('CUSTOMER').AsString      := ViewForm.Customer_Edit.Text;
        ParamByName('DATE_CREATE').AsDate     := ViewForm.Date_Create_Edit.Date;
        ParamByName('LIMIT_SUM').AsCurrency   := ViewForm.LimitSum_Edit.Value;
        ParamByName('LIMIT_DOGS').AsCurrency  := ViewForm.LimitDog_Edit.Value;
        ParamByName('IMAGE_PRIORITY').AsInteger:=  Integer(ViewForm.ckbxImagePriority.Checked);
        ParamByName('COMMENTS').AsString      := ViewForm.ord_ae_Comments.Text;
        ParamByName('ID_STATUS').AsInt64      := ViewForm.Id_Status;
        Prepare;
        ExecProc;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure CN_DT_CREDIT_U');
        raise;
        exit;
      end;
     end;
   DM.DataSet.CloseOpen(true);
   DM_Detail_1.DataSet.CloseOpen(true);
   DM.DataSet.Locate('ID_CREDIT',locateID, []);
  end;
end;

procedure TfrmCredit.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
 begin
if GridView.DataController.RecordCount = 0 then Exit;

  if DM_Detail_1.DataSet.RecordCount > 0 then
   begin
    showmessage(cnConsts_Messages.cn_NonDeleteDependet[PLanguageIndex]);
    exit;
   end;

i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_CREDIT_D';
        Prepare;
        ParamByName('ID_CREDIT').AsInt64       :=  DM.DataSet['ID_CREDIT'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          Transaction.Rollback;
         end;
       end;
 DM.DataSet.CloseOpen(True);
 DM_Detail_1.DataSet.CloseOpen(True);
   end;
end;

procedure TfrmCredit.RefreshButtonClick(Sender: TObject);
begin
 DM.DataSet.CloseOpen(True);
 DM_Detail_1.DataSet.CloseOpen(True);
end;

procedure TfrmCredit.DeletePfioButtonClick(Sender: TObject);
 var
  i: byte;
  id_Locator, id_Locator_master : Int64;
begin
 if Grid2View.DataController.RecordCount = 0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
    Screen.Cursor := crHourGlass;
     id_Locator:= Grid2View.DataController.FocusedRecordIndex;
     id_Locator_master := DM.DataSet['ID_CREDIT'];
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_CREDIT_LIST_D';
        Prepare;
        ParamByName('ID_PK').AsInt64       :=  DM_Detail_1.DataSet['ID_PK'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_CREDIT_LIST_D',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
          raise;
         end;
       end;

 DM_Detail_1.DataSet.CloseOpen(true);

     with DM.StProc do
       try
        Transaction.StartTransaction;
           // здесь апдейт суммы по кредиту суммой SummaAllCredit
          StoredProcName := 'CN_DT_CREDIT_UPDATE_SUMMA';
          Prepare;
          ParamByName('ID_CREDIT').AsInt64    := DM.DataSet['ID_CREDIT'];
          ParamByName('SUMMA').AsCurrency     := StrToFloat(Grid2View.DataController.Summary.FooterSummaryValues[0]);
          ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_CREDIT_UPDATE_SUMMA',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
          raise;
         end;
       end;
   DM.DataSet.CloseOpen(true);
   DM_Detail_1.DataSet.CloseOpen(true);

   Grid2View.DataController.FocusedRecordIndex := id_Locator -1;
   DM.DataSet.Locate('ID_CREDIT', id_Locator_master ,[] );
   Screen.Cursor := crDefault;

   end;
end;

procedure TfrmCredit.DeleteAll_BtnClick(Sender: TObject);
 var
  i: byte;
begin
 if Grid2View.DataController.RecordCount = 0 then exit;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Execute[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_CREDIT_LIST_D_ALL';
        Prepare;
        ParamByName('ID_CREDIT').AsInt64       :=  DM.DataSet['ID_CREDIT'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_CREDIT_LIST_D_ALL',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
          raise;
         end;
       end;

     with DM.StProc do
       try
        Transaction.StartTransaction;
           // здесь апдейт суммы по кредиту суммой SummaAllCredit
          StoredProcName := 'CN_DT_CREDIT_UPDATE_SUMMA';
          Prepare;
          ParamByName('ID_CREDIT').AsInt64    := DM.DataSet['ID_CREDIT'];
          ParamByName('SUMMA').AsCurrency     := 0;
          ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_CREDIT_UPDATE_SUMMA',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
          raise;
         end;
       end;
   DM.DataSet.CloseOpen(true);
   DM_Detail_1.DataSet.CloseOpen(true);
   end;
end;

procedure TfrmCredit.AddAllAvto_BtnClick(Sender: TObject);
var
  ViewForm : TfrmAddAll;
begin
if GridView.DataController.RecordCount = 0 then exit;

 ViewForm := TfrmAddAll.Create(self,DM.DB.Handle, PLanguageIndex, Dm.DataSet['ID_CREDIT']);
 ViewForm.Caption := cn_InsertBtn_Caption[PLanguageIndex];
 ViewForm.DATE_START_CALC :=  Dm.DataSet['DATE_START_CALC'];
 ViewForm.DATE_CREDIT :=      Dm.DataSet['DATE_CREDIT'];
 ViewForm.IS_IMAGE_PRIOR :=   Dm.DataSet['IMAGE_PRIORITY'];
 ViewForm.LIMIT_SUM  :=       DM.DataSet['LIMIT_SUM'];
 ViewForm.LIMIT_DOGS :=       DM.DataSet['LIMIT_DOGS'];
 ViewForm.ShowModal;
 DM.DataSet.CloseOpen(true);
 DM_Detail_1.DataSet.CloseOpen(true);
 ViewForm.Free;

end;


procedure TfrmCredit.DebugPrintActionExecute(Sender: TObject);
begin
if designer_rep=0 then
  begin
    designer_rep:=1;
    BarStatic.Caption:='Режим отладки отчетов';
  end
  else
  begin
    designer_rep:=0;
    BarStatic.Caption:='';
  end;
end;

procedure TfrmCredit.PrintButtonClick(Sender: TObject);
var ID_NAMEREP : int64;
begin
  frxReport.Clear;
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+'cn_che_CreditList'+'.fr3');
  frxReport.Variables.Clear;

  frxReport.Variables['CUSTOMER']:= ''''+ DM.DataSet['CUSTOMER']+'''';
  frxReport.Variables['NOTE']    := ''''+ DM.DataSet['NOTE']+'''';
  frxReport.Variables['SUMMA']   := ''''+ vartostr(DM.DataSet['LIMIT_SUM'])+'''';
  frxReport.Variables['DATE_CREDIT']   := ''''+ vartostr(DM.DataSet['DATE_CREDIT'])+'''';
  frxReport.Variables['DATE_START_CALC']   := ''''+ vartostr(DM.DataSet['DATE_START_CALC'])+'''';
  frxReport.Variables['SUMMARY']   := ''''+ vartostr(Grid2View.DataController.Summary.FooterSummaryValues[0])+'''';
    
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select CN_NAMEZVIT_CREDIT from PUB_SYS_DATA';
  Dm.ReadDataSet.Open;
   if Dm.ReadDataSet['CN_NAMEZVIT_CREDIT'] <> null then
   ID_NAMEREP := Dm.ReadDataSet['CN_NAMEZVIT_CREDIT'];
  Dm.ReadDataSet.Close;

  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_FR_GET_SIGNATURES(' + inttostr(ID_NAMEREP) + ')';
  Dm.ReadDataSet.Open;
  Dm.ReadDataSet.FetchAll;
  
  frxDBDataset.DataSet  := DM_Detail_1.DataSet;
  frxDBDataset2.DataSet := DM.ReadDataSet;

  frxReport.PrepareReport(true);
  frxReport.ShowReport;
  if designer_rep=1 then
    begin
      frxReport.DesignReport;
    end;
  Dm.ReadDataSet.Close;
end;

procedure TfrmCredit.btnPrintListClick(Sender: TObject);
begin
PrintButtonClick(Sender);
end;

procedure TfrmCredit.GridViewDblClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmCredit.btnScanClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
if Grid2View.DataController.RecordCount = 0 then exit;

 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG     := DM_Detail_1.Dataset['ID_DOG'];
 AParameter.cnParamsToPakage.FIO        := DM_Detail_1.DataSet['FIO'];
 AParameter.WaitPakageOwner:= self;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_Scan.bpl','cnLoadTwain');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmCredit.PrintImageEx(Sender: TObject; IsRange: Boolean; Rbeg:Integer; Rend: Integer; PrintValue: Integer);
var
    i, CN_IMAGE_PRINT_PAGE_LIMIT: Integer;
    DM2 :TDM_C;
    Id_session: int64;
    AddToPrint : Boolean;
    k: Integer;
begin
if (not Boolean(DM.DataSet['IMAGE_PRIORITY'])) then exit;

  if PrinterSetupDialog.Execute
  then
   begin
    mcmPrinter.RefreshProperties;
    InvalidateRect(Handle, Nil, True);
   end
  else exit;

     mcmPrinter.Clear;
     DM2:=TDM_C.Create(Self);
     DM2.DB.Handle:= Dm.DB.Handle;

     // проверяю Кол-во страниц печати образов
     DM2.ReadDataSet.SelectSQL.Text := 'SELECT CN_IMAGE_PRINT_PAGE_LIMIT FROM CN_GET_CN_IMAGE_PRINT_PAGE_LIM';
     DM2.ReadDataSet.Open;
      CN_IMAGE_PRINT_PAGE_LIMIT:= DM2.ReadDataSet['CN_IMAGE_PRINT_PAGE_LIMIT'];
     DM2.ReadDataSet.Close;

     // проверяю подключаться ли к другой базе
     DM2.ReadDataSet.SelectSQL.Text := 'SELECT CN_IMAGE_IN_OTHER_DB FROM CN_PUB_SYS_DATA_GET_ALL';
     DM2.ReadDataSet.Open;
     if DM2.ReadDataSet['CN_IMAGE_IN_OTHER_DB'] =1 then
      begin
        DM2.ReadDataSet.Close;
        ReadIniFileImage(DM2.DB);
      end;
     if DM2.ReadDataSet.Active then DM2.ReadDataSet.Close;

  // генерирую сессию для печати
     with DM2.StProc do
     try
      Transaction.StartTransaction;
      StoredProcName := 'CN_TMP_SCAN_GEN_SESSION';
      Prepare;
      ExecProc;
      Id_session := ParamByName('ID_SESSION').AsInt64;
      Transaction.Commit;
     except
      on E:Exception do
       begin
        ShowMessage('Error in CN_TMP_SCAN_GEN_SESSION');
        Transaction.Rollback;
        raise;
       end;
     end;

 // заполнение временной таблицы печати
   DM_Detail_1.DataSet.First;
   
   for i := 0 to DM_Detail_1.DataSet.RecordCount-1  do
   begin
     AddToPrint := False;

     if IsRange then
      if ((i >= Rbeg-1) and (i<= Rend-1))
       then
        AddToPrint := True;

     if not IsRange then AddToPrint := True;

     if AddToPrint then
     with DM2.StProc do
     try
      Transaction.StartTransaction;
      StoredProcName := 'CN_TMP_SCAN_PRINT_ALL_I';
      ParamByName('ID_SESSION').AsInt64 := Id_session;
      ParamByName('ID_DOG').AsInt64 :=  DM_Detail_1.DataSet['ID_DOG'];
      Prepare;
      ExecProc;
      Transaction.Commit;
     except
      on E:Exception do
       begin
        ShowMessage('Error in CN_TMP_SCAN_PRINT_ALL_I');
        Transaction.Rollback;
        break;
        raise;
       end;
     end;
     DM_Detail_1.DataSet.Next;

   end;

 // отбор данных печати
 DM2.DataSet.SQLs.SelectSQL.Text := 'select * from CN_TMP_SCAN_PRINT_SELECT(' + inttostr(Id_session) + ',' + inttostr(CN_IMAGE_PRINT_PAGE_LIMIT) +')';
 db_imgPicture.DataSource := DM2.DataSource;
 DM2.DataSet.Open;
 DM2.DataSet.FetchAll;
 DM2.DataSet.First;
 k:=0;
 for i:= 0 to DM2.DataSet.RecordCount-1
 do begin
  case PrintValue of
   0:
      begin
       mcmPrinter.AddPage;
       mcmPrinter.Pages[i].Assign(db_imgPicture.Image);
      end;
   2:
       if ( DM2.DataSet['NUM_PAGE'] mod 2 = 0) then
        begin
         mcmPrinter.AddPage;
         mcmPrinter.Pages[k].Assign(db_imgPicture.Image);
         k:=k+1;
        end;
   1:
        if ( DM2.DataSet['NUM_PAGE'] mod 2 <> 0) then
        begin
         mcmPrinter.AddPage;
         mcmPrinter.Pages[k].Assign(db_imgPicture.Image);
         k:=k+1;
        end;
  end;

   DM2.DataSet.Next;
 end;

 // удаляю сессию
     with DM2.StProc do
     try
      Transaction.StartTransaction;
      StoredProcName := 'CN_TMP_SCAN_PRINT_ALL_D';
      ParamByName('ID_SESSION').AsInt64 := Id_session;
      Prepare;
      ExecProc;
      Transaction.Commit;
     except
      on E:Exception do
       begin
        ShowMessage('Error in CN_TMP_SCAN_PRINT_ALL_D');
        Transaction.Rollback;
        raise;
       end;
     end;

  if (mcmPrinter.PageCount > 0)
  then begin
     mcmPrinter.ImageFitToPage := True;
     mcmPrinter.ImageCenter := True;
     mcmPrinter.ForceMargin  := true;
     mcmPrinter.MarginLeft   := 0;
     mcmPrinter.MarginTop    := 0;
     mcmPrinter.MarginRight  := 0;
     mcmPrinter.MarginBottom := 0;
     mcmPrinter.Print;
  end;
end;

procedure TfrmCredit.btnViewClick(Sender: TObject);
begin
Facul_Col.GroupIndex :=
StrToInt(BoolToStr(not StrToBool(IntToStr(Facul_Col.GroupIndex))));
end;

procedure TfrmCredit.btnPrintOptionsClick(Sender: TObject);
begin
  // Access printer set-up dialogue.
  if PrinterSetupDialog.Execute
  then mcmPrinter.RefreshProperties;
  InvalidateRect(Handle, Nil, True);
end;

procedure TfrmCredit.btnPrintRangeClick(Sender: TObject);
var
  frmRange: TfrmRange;
  PrintValue : Integer;
begin
  frmRange := TfrmRange.Create(self);
  frmRange.PLanguageIndex := PLanguageIndex;
  frmRange.OKButton.Caption            :=   cn_Accept[PLanguageIndex];
  frmRange.CancelButton.Caption        :=   cn_Cancel[PLanguageIndex];
  frmRange.Caption := cn_PrintRangeImage[PLanguageIndex];
  frmRange.radAll.Caption := cn_PrintAllPages[PLanguageIndex];
  frmRange.radChet.Caption := cn_PrintChetPages[PLanguageIndex];
  frmRange.radNechet.Caption := cn_PrintNeChetPages[PLanguageIndex];

  frmRange.REndEdit.Value := Grid2View.DataController.Summary.FooterSummaryValues[1];

  if frmRange.ShowModal = mrOk then
   begin
     if frmRange.radAll.Checked then PrintValue    := 0; // 'all';
     if frmRange.radChet.Checked then PrintValue   := 2;  //'chet';
     if frmRange.radNechet.Checked then PrintValue := 1; // 'nechet';

     PrintImageEx(Self, True, StrToInt(frmRange.RBegEdit.Text) , StrToInt(frmRange.REndEdit.Text), PrintValue);
   end;
end;

procedure TfrmCredit.btnPrintImageClick(Sender: TObject);
begin
  PrintImageEx(Self, false,0,0,0);
end;

end.
