unit cn_dt_Raport_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxTextEdit,
  cxCurrencyEdit, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, dxBar, ImgList, ActnList,
  dxBarExtItems, dxStatusBar, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls,
  DM_Raport, cn_Common_Types, cn_Common_Funcs, cnConsts,
  frmDocs_AE_Unit, cn_Common_Messages,cnConsts_Messages, cn_Common_Loader,
  frmPfio_AE_Unit,frmAddAll_Unit, frxClass, frxDBSet, frxDesgn,
  frxExportPDF, frxExportXLS, frxExportHTML, frxExportRTF, StdCtrls;

type
  TfrmRaport = class(TForm)
    Splitter1: TSplitter;
    Grid: TcxGrid;
    GridView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    Grid2: TcxGrid;
    Grid2View: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
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
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ViewAction: TAction;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    PopupMenu1: TdxBarPopupMenu;
    PopupImageList: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
    NAME_DOCUM: TcxGridDBColumn;
    DATE_DOCUM: TcxGridDBColumn;
    FIO_Col: TcxGridDBColumn;
    Summa_Col: TcxGridDBColumn;
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
    StatusBar: TdxStatusBar;
    Facul_Col: TcxGridDBColumn;
    KURS_Col: TcxGridDBColumn;
    Group_Col: TcxGridDBColumn;
    DATE_OPL_Col: TcxGridDBColumn;
    AddAllAvto_Btn: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    frxDesigner1: TfrxDesigner;
    frxDBDataset: TfrxDBDataset;
    DebugPrintAction: TAction;
    BarStatic: TdxBarStatic;
    frxReport: TfrxReport;
    ID_STATUS_col: TcxGridDBColumn;
    DeleteAll_Btn: TdxBarLargeButton;
    frxDBDataset2: TfrxDBDataset;
    procedure AddButtonClick(Sender: TObject);
    procedure AddPfioButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure GridViewDblClick(Sender: TObject);
    procedure DeletePfioButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure AddListPfioButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure AddAllAvto_BtnClick(Sender: TObject);
    procedure DebugPrintActionExecute(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure DeleteAll_BtnClick(Sender: TObject);
  private
    PLanguageIndex :byte;
    DM, DM_Detail_1: TDM_Rap;
    SpravMode: byte; // 1-отчисление, 2-восстановление
  //  SelectSQL, MasterDetailSQl : string;
    Id_type_doc: int64;
    ID_STATUS_Proekt   : int64;
    ID_STATUS_Vipolnen : int64;

    procedure FormIniLanguage();
  public
    res: Variant;
    constructor Create(Parameter:TcnSimpleParamsEx); reintroduce;
  end;

  var designer_rep:Integer;

implementation

uses cxCalendar;

{$R *.dfm}


constructor TfrmRaport.Create(Parameter:TcnSimpleParamsEx);
begin
Screen.Cursor:=crHourGlass;
inherited Create(Parameter.Owner);
DM:=TDM_Rap.Create(Self);
DM.DB.Handle:=Parameter.DB_Handle;

designer_rep:=0;

SpravMode := Parameter.TypeDoc;
    // оперделяю тип документа
    if SpravMode = 1 then // отчисление
    begin
     DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ID_TYPEDOC_OTCHISLENIE';
     DM.ReadDataSet.Open;
     if DM.ReadDataSet['CN_ID_TYPEDOC_OTCHISLENIE'] = null then
      begin
       showmessage('Не заполнены системные параметры (CN_ID_TYPEDOC_OTCHISLENIE). Продолжение работы невозможно');
       DM.ReadDataSet.Close;
       exit;
      end
     else
     Id_type_doc := DM.ReadDataSet['CN_ID_TYPEDOC_OTCHISLENIE'];
    end
    else // восстановление
    begin
     AddListPfioButton.Visible :=  ivNever;
     Summa_Col.Visible :=  false;
     DATE_OPL_Col.Visible :=  false;
     DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ID_TYPEDOC_VOSSTANOVL';
     DM.ReadDataSet.Open;
     if DM.ReadDataSet['CN_ID_TYPEDOC_VOSSTANOVL'] = null then
      begin
       showmessage('Не заполнены системные параметры (CN_ID_TYPEDOC_VOSSTANOVL). Продолжение работы невозможно');
       exit;
       DM.ReadDataSet.Close;
      end
     else
     Id_type_doc := DM.ReadDataSet['CN_ID_TYPEDOC_VOSSTANOVL'];
    end;
DM.ReadDataSet.Close;
    // возможные статусы
     DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ID_RAP_STATUS_PROEKT';
     DM.ReadDataSet.Open;
     if DM.ReadDataSet['CN_ID_RAP_STATUS_PROEKT'] = null then
      begin
       showmessage('Не заполнены системные параметры (CN_ID_RAP_STATUS_PROEKT). Продолжение работы невозможно');
       DM.ReadDataSet.Close;
       exit;
      end
     else
     ID_STATUS_Proekt := DM.ReadDataSet['CN_ID_RAP_STATUS_PROEKT'];

     DM.ReadDataSet.Close;

     DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ID_RAP_STATUS_VIPOLNEN';
     DM.ReadDataSet.Open;
     if DM.ReadDataSet['CN_ID_RAP_STATUS_VIPOLNEN'] = null then
      begin
       showmessage('Не заполнены системные параметры (CN_ID_RAP_STATUS_VIPOLNEN). Продолжение работы невозможно');
       DM.ReadDataSet.Close;
       exit;
      end
     else
     ID_STATUS_Vipolnen := DM.ReadDataSet['CN_ID_RAP_STATUS_VIPOLNEN'];

      DM.ReadDataSet.Close;

DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_RAPORT_SELECT(' + inttostr(Id_type_doc) + ')';
DM.DataSet.Open;
GridView.DataController.DataSource := DM.DataSource;

DM_Detail_1:=TDM_Rap.Create(Self);
DM_Detail_1.DataSet.SQLs.SelectSQL.Text := 'SELECT * FROM  CN_DT_RAPORT_STUD_SELECT(?ID_DOCUM) order by NAME_FACUL, NAME_GROUP';
DM_Detail_1.DataSet.DataSource:= DM.DataSource;
DM_Detail_1.DB.Handle:=Parameter.DB_Handle;
DM_Detail_1.DataSet.Open;
Grid2View.DataController.DataSource := DM_Detail_1.DataSource;

FormIniLanguage;
Screen.Cursor:=crDefault;
end;

procedure TfrmRaport.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 if SpravMode = 1 then
 Caption := cnConsts.cn_Main_RaportOtchisl[PLanguageIndex]
 else
 Caption := cnConsts.cn_Main_RaportVotanovl[PLanguageIndex];

 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 SelectButton.Caption :=        cnConsts.cn_Execution[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 ViewButton.Caption :=          cnConsts.cn_ViewShort_Caption[PLanguageIndex];
 PrintButton.Caption:=          cnConsts.cn_Print_Caption[PLanguageIndex];

 DeleteAll_Btn.Hint:=           cn_DelAll_Caption[PLanguageIndex];

  //статусбар
 StatusBar.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBar.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBar.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBar.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBar.Panels[4].Text:=  cnConsts.cn_EnterBtn_ShortCut[PLanguageIndex]   + cnConsts.cn_SelectBtn_Caption[PLanguageIndex];
 StatusBar.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 

 AddPfioButton.Caption :=          cn_InsertBtn_Caption[PLanguageIndex];
 AddPfioButton.Hint :=             cn_InsertBtn_Caption[PLanguageIndex];
 EditPfioButton.Caption :=         cn_EditBtn_Caption[PLanguageIndex];
 EditPfioButton.Hint :=            cn_EditBtn_Caption[PLanguageIndex];
 DeletePfioButton.Caption :=       cn_DeleteBtn_Caption[PLanguageIndex];
 DeletePfioButton.Hint :=          cn_DeleteBtn_Caption[PLanguageIndex];
 AddListPfioButton.Caption :=      cn_Add_List[PLanguageIndex];
 AddListPfioButton.Hint :=         cn_Add_List[PLanguageIndex];

 AddAllAvto_Btn.Hint :=      cn_RaportAvto[PLanguageIndex];

 // grid's
 NAME_DOCUM.Caption  :=   cn_Name_Column[PLanguageIndex];
 DATE_DOCUM.Caption  :=   cn_DateDoc_Pay[PLanguageIndex];
 Facul_Col.Caption   :=   cn_footer_Faculty[PLanguageIndex];

 FIO_Col.Caption     :=   cn_grid_FIO_Column[PLanguageIndex];
 KURS_Col.Caption    :=   cn_footer_Kurs[PLanguageIndex];
 Group_Col.Caption   :=   cn_footer_Group[PLanguageIndex];
 Summa_Col.Caption   :=   cn_Summa_Column[PLanguageIndex];
 DATE_OPL_Col.Caption:=   cn_Date_Opl_Column[PLanguageIndex];                      
 
end;

procedure TfrmRaport.AddButtonClick(Sender: TObject);
var ViewForm : TfrmDocs_AE;
 location : int64;
begin
 ViewForm := TfrmDocs_AE.create(self, PLanguageIndex, DM.DB.Handle, false );
 ViewForm.Caption := cn_InsertBtn_Caption[PLanguageIndex];

 ViewForm.ID_STATUS := ID_STATUS_Proekt;
 ViewForm.ID_TYPE_DOCUM := Id_type_doc;

 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_RAPSTATUS_NAME_BY_ID (' + inttostr(ID_STATUS_Proekt) + ')';
 DM.ReadDataSet.Open;
 ViewForm.Status_Edit.Text := DM.ReadDataSet['NAME'];
 DM.ReadDataSet.Close;

 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_TYPEDOCUM_NAME_BY_ID (' + inttostr(Id_type_doc) + ')';
 DM.ReadDataSet.Open;
 ViewForm.TypeDocum_Edit.Text := DM.ReadDataSet['NAME'];
 DM.ReadDataSet.Close;

 if ViewForm.ShowModal = mrOk then
  begin
    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_DT_RAPORT_INSERT';
        Transaction.StartTransaction;
        ParamByName('NAME_DOCUM').AsString    := ViewForm.Num_Doc_Edit.Text;
        ParamByName('DATE_DOCUM').AsDate      := ViewForm.Date_Doc_Edit.Date;
        ParamByName('ID_STATUS').AsInt64      := ViewForm.ID_STATUS;
        ParamByName('ID_TYPE_DOCUM').AsInt64  := ViewForm.ID_TYPE_DOCUM;
        ParamByName('DATE_DEPT').AsDate       := ViewForm.DateDept_Edit.Date;
        ParamByName('ORDER_DATE').AsDate      := ViewForm.Order_Date_Edit.Date;
        ParamByName('ORDER_NUM').AsString     := ViewForm.Order_Num_Edit.Text;
        Prepare;
        ExecProc;
        location := ParamByName('ID_DOCUM').AsInt64;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure CN_DT_RAPORT_INSERT');
        exit;
      end;
     end;
     DM.DataSet.CloseOpen(true);
     DM.DataSet.Locate('ID_DOCUM',location,[] );
     DM_Detail_1.DataSet.CloseOpen(true);
  end;
end;

procedure TfrmRaport.AddPfioButtonClick(Sender: TObject);
var
  ViewForm : TfrmPfio_AE;
  id_pk_new : int64;
begin
if GridView.DataController.RecordCount = 0 then exit;
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;
 
 ViewForm := TfrmPfio_AE.create(self,DM.DB.Handle, PLanguageIndex, Dm.DataSet['DATE_DEPT'], SpravMode);
 ViewForm.Caption := cn_InsertBtn_Caption[PLanguageIndex];
 if ViewForm.ShowModal = mrOk then
  begin

    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_DT_RAPORT_STUD_INSERT';
        Transaction.StartTransaction;
        ParamByName('ID_DOCUM').AsInt64      := DM.DataSet['ID_DOCUM'];
        ParamByName('ID_DOG').AsInt64        := ViewForm.ID_DOG;
        ParamByName('ID_STUD').AsInt64       := ViewForm.ID_STUD;
        ParamByName('ID_GROUP').AsInt64      := ViewForm.ID_GROUP;
        ParamByName('ID_FACUL').AsInt64      := ViewForm.ID_FACUL;
        ParamByName('SUMMA').AsCurrency      := ViewForm.SummaEdit.Value;
        ParamByName('KURS').AsShort          := ViewForm.Kurs;
        ParamByName('DATE_OPL').AsDate       := ViewForm.DateOpl;
        Prepare;
        ExecProc;
          id_pk_new := ParamByName('ID_PK').AsInt64;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure CN_DT_RAPORT_STUD_INSERT');
        exit;
      end;
     end;

     DM_Detail_1.DataSet.CloseOpen(true);
     DM_Detail_1.DataSet.Locate('ID_PK',id_pk_new,[] );
  end;
end;

procedure TfrmRaport.EditButtonClick(Sender: TObject);
var ViewForm : TfrmDocs_AE;
 locateID : int64;
begin
if GridView.DataController.RecordCount = 0 then exit;
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;
 ViewForm := TfrmDocs_AE.create(self, PLanguageIndex, DM.DB.Handle, false);
 ViewForm.Caption := cn_EditBtn_Caption[PLanguageIndex];
 ViewForm.Num_Doc_Edit.Text   := DM.DataSet['NAME_DOCUM'];
 ViewForm.Date_Doc_Edit.Date  := DM.DataSet['DATE_DOCUM'];
 ViewForm.ID_STATUS           := DM.DataSet['ID_STATUS'];
 ViewForm.ID_TYPE_DOCUM       := DM.DataSet['ID_TYPE_DOCUM'];
 ViewForm.Status_Edit.Text    := DM.DataSet['NAME_STATUS'];
 ViewForm.TypeDocum_Edit.Text := DM.DataSet['NAME_TYPE_DOCUM'];
 ViewForm.DateDept_Edit.Date  := DM.DataSet['DATE_DEPT'];
if DM.DataSet['ORDER_DATE'] <> null then
 ViewForm.Order_Date_Edit.Date:= DM.DataSet['ORDER_DATE'];
if DM.DataSet['ORDER_NUM'] <> null then
 ViewForm.Order_Num_Edit.Text := DM.DataSet['ORDER_NUM'];

 if ViewForm.ShowModal = mrOk then
  begin
    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_DT_RAPORT_UPDATE';
        Transaction.StartTransaction;
        ParamByName('ID_DOCUM').AsInt64 := DM.Dataset['ID_DOCUM'];
        locateID := DM.Dataset['ID_DOCUM'];
        ParamByName('NAME_DOCUM').AsString  := ViewForm.Num_Doc_Edit.Text;
        ParamByName('DATE_DOCUM').AsDate    := ViewForm.Date_Doc_Edit.Date;
        ParamByName('ID_STATUS').AsInt64    := ViewForm.ID_STATUS;
        ParamByName('ID_TYPE_DOCUM').AsInt64:= ViewForm.ID_TYPE_DOCUM;
        ParamByName('DATE_DEPT').Asdate     := ViewForm.DateDept_Edit.Date;
        ParamByName('ORDER_DATE').AsDate    := ViewForm.Order_Date_Edit.Date;
        ParamByName('ORDER_NUM').AsString   := ViewForm.Order_Num_Edit.Text;
        Prepare;
        ExecProc;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure CN_DT_RAPORT_UPDATE');
        exit;
      end;
     end;
   DM.DataSet.CloseOpen(true);
   DM_Detail_1.DataSet.CloseOpen(true);
   DM.DataSet.Locate('ID_DOCUM',locateID, []);
  end;
end;
procedure TfrmRaport.GridViewDblClick(Sender: TObject);
begin
 EditButtonClick(Sender);
end;

procedure TfrmRaport.DeletePfioButtonClick(Sender: TObject);
 var
  i: byte;
begin
 if Grid2View.DataController.RecordCount = 0 then exit;
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;
 
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_RAPORT_STUD_DELETE';
        Prepare;
        ParamByName('ID_PK').AsInt64       :=  DM_Detail_1.DataSet['ID_PK'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_RAPORT_STUD_DELETE',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM_Detail_1.DataSet.CloseOpen(true);
   end;
end;


procedure TfrmRaport.FormShow(Sender: TObject);
begin
FormIniLanguage();
end;

procedure TfrmRaport.DeleteButtonClick(Sender: TObject);
 var
  i: byte;
 begin
if GridView.DataController.RecordCount = 0 then exit;
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;

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
        StoredProcName := 'CN_DT_RAPORT_DELETE';
        Prepare;
        ParamByName('ID_DOCUM').AsInt64       :=  DM.DataSet['ID_DOCUM'];
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


procedure TfrmRaport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else begin
DM.Free;
DM_Detail_1.Free;
end;
end;

procedure TfrmRaport.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmRaport.RefreshButtonClick(Sender: TObject);
begin
 DM.DataSet.CloseOpen(True);
 DM_Detail_1.DataSet.CloseOpen(True);
end;

procedure TfrmRaport.AddListPfioButtonClick(Sender: TObject);
  var
  AParameter:TcnSimpleParamsEx;
  res: Variant;
  cnt, i: integer;
  CnCalcOut : TCnCalcOut;
  cnCalcIn: TcnCalcIn;
  CnPayOut : TCnPayOut;
  cnPayIn: TcnPayIn;
begin
if GridView.DataController.RecordCount = 0 then exit;
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;
 
  // вызов справочника
  AParameter:= TcnSimpleParamsEx.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.ReturnMode := 'Multy';
  Res:= null;
  Res:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_ContractsList.bpl','ShowSPContractsList');

   if VarArrayDimCount(res)>0 then
      begin
        cnt:=VarArrayHighBound(res,1)-VarArrayLowBound(res,1);
        for i:=0 to cnt do
          begin
            with DM.StProc do
             try
             // сначала рассчитываю сумму и дату оплаты
             // рассчитывается на дату. указанную в документе
             // cn_pay
               cnPayIn.Owner       := self;
               cnPayIn.DB_Handle   := DM.DB.Handle;
               cnPayIn.ID_STUD     := res[i][1];
               cnPayIn.BEG_CHECK   := strtodate('01.01.1900');
               cnPayIn.END_CHECK   := Dm.DataSet['DATE_DEPT'];
               cnPayIn.DATE_PROV_CHECK := 1;
               cnPayIn.IS_DOC_GEN      := 0;
               cnPayIn.IS_PROV_GEN     := 0;
               cnPayIn.IS_SMET_GEN     := 0;
               cnPayIn.NOFPROV         := 1;
               cnPayIn.DIGNORDOCID     := 1;
                  CnPayOut := GetCnPay(cnPayIn);
            // cn_calc
               cnCalcIn.Owner     := self;
               cnCalcIn.DB_Handle := DM.DB.Handle;
               cnCalcIn.ID_STUD   := res[i][1];
               cnCalcIn.BEG_CHECK := strtodate('01.01.1900');
               cnCalcIn.END_CHECK := Dm.DataSet['DATE_DEPT'];
               cnCalcIn.CNUPLSUM  := CnPayOut.CNSUMDOC;
                  CnCalcOut := GetCnCalc(cnCalcIn);

             //далее вношу записи в базу
              Transaction.StartTransaction;
              StoredProcName := 'CN_DT_RAPORT_STUD_INSERT';
              Prepare;
              ParamByName('ID_DOCUM').AsInt64      := DM.DataSet['ID_DOCUM'];
              ParamByName('ID_DOG').AsInt64        := res[i][0];
              ParamByName('ID_STUD').AsInt64       := res[i][1];
              ParamByName('ID_FACUL').AsInt64      := res[i][2];
              ParamByName('ID_GROUP').AsInt64      := res[i][3];
               if CnPayOut.CNUPLSUM > CnPayOut.CNSUMDOC
                then
               ParamByName('SUMMA').AsCurrency      := CnCalcOut.CN_SNEED - CnPayOut.CNUPLSUM
               else
               ParamByName('SUMMA').AsCurrency      := CnCalcOut.CN_SNEED - CnPayOut.CNSUMDOC;
              ParamByName('KURS').AsShort          := res[i][4];
              ParamByName('DATE_OPL').AsDate       := CnCalcOut.CNDATEOPL;
              ExecProc;
              Transaction.Commit;
             except
              on E:Exception do
               begin
                cnShowMessage('Error in CN_DT_RAPORT_STUD_INSERT',e.Message,mtError,[mbOK]);
                Transaction.Rollback;
               end;
             end;
        end;
 DM_Detail_1.DataSet.CloseOpen(true);
 end;
end;

procedure TfrmRaport.SelectButtonClick(Sender: TObject);
var i: integer;
 cnAnnulContractIn :TcnAnnulContractIn;
 ID_DOG_as_int, ID_STUD_as_int, CN_ORDERTYPE_OTCHISLENIE, CN_ORDERTYPE_VOSSTANOVL: int64;
begin
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;

if Grid2View.DataController.RecordCount = 0 then exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Execute[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;


 DM_Detail_1.DataSet.First;
 if SpravMode =1 then
  begin
      Dm.ReadDataSet.Close;
      Dm.ReadDataSet.SelectSQL.Clear;
      Dm.ReadDataSet.SelectSQL.Text := 'select CN_ORDERTYPE_OTCHISLENIE from CN_PUB_SYS_DATA_GET_ALL';
      Dm.ReadDataSet.Open;
      CN_ORDERTYPE_OTCHISLENIE := Dm.ReadDataSet['CN_ORDERTYPE_OTCHISLENIE'];
      Dm.ReadDataSet.Close;

       for i:=0 to DM_Detail_1.DataSet.RecordCount-1 do
       begin
        ID_DOG_as_int := DM_Detail_1.DataSet['ID_DOG'];
        ID_STUD_as_int:= DM_Detail_1.DataSet['ID_STUD'];
        // определяю параметры для разрыва
        DM.ReadDataSet.SelectSQL.Text := 'select * from CN_ANNUL_CONTRACT_PREPARE('
                                         + IntToStr(ID_DOG_as_int)+
                                         ','+
                                         IntToStr(ID_STUD_as_int)+ ')';
        DM.ReadDataSet.Open;
        cnAnnulContractIn.Owner := self;
        cnAnnulContractIn.DB_Handle   := Dm.DB.Handle;
        cnAnnulContractIn.ID_DOG_ROOT := DM.ReadDataSet['ID_DOG_ROOT'];
        cnAnnulContractIn.ID_DOG      :=  DM_Detail_1.DataSet['ID_DOG'];
        cnAnnulContractIn.ID_STUD     := DM_Detail_1.DataSet['ID_STUD'];
        cnAnnulContractIn.DATE_DISS   := DM.DataSet['DATE_DEPT'];
        cnAnnulContractIn.ID_TYPE_DISS:= DM.ReadDataSet['CN_ID_TYPE_DISS_FOR_RAPORT'];
        cnAnnulContractIn.ORDER_DATE  := DM.DataSet['ORDER_DATE'];
        cnAnnulContractIn.ORDER_NUM   := DM.DataSet['ORDER_NUM'];
        cnAnnulContractIn.COMMENT     := 'Авто розірвання за рапортом на відрахування';
        cnAnnulContractIn.IS_COLLECT  := DM.ReadDataSet['IS_COLLECT'];
        DM.ReadDataSet.close;
        // разрываю контракт
        DoAnnulContract(cnAnnulContractIn);
        // пишу приказ об отчислении
          with DM.StProc do
           begin
            try
              StoredProcName := 'CN_DT_ORDERS_INSERT';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_ORDER').AsInt64       := CN_ORDERTYPE_OTCHISLENIE;
              ParamByName('ID_STUD').AsInt64        := DM_Detail_1.DataSet['ID_STUD'];
              ParamByName('DATE_ORDER').AsDate      := DM.DataSet['ORDER_DATE'];
              ParamByName('NUM_ORDER').AsString     := DM.DataSet['ORDER_NUM'];
              ParamByName('COMMENTS').AsString      := 'автоматичне додавання наказу при роботі з рапортами на відрахування';
              ExecProc;
              Transaction.Commit;
              Close;
            except
              Transaction.Rollback;
              ShowMessage('Error in stored procedure CN_DT_ORDERS_INSERT');
              exit;
            end;
          end;

        DM_Detail_1.DataSet.Next;
       end;
  end
  else // восстановление
  begin
      Dm.ReadDataSet.Close;
      Dm.ReadDataSet.SelectSQL.Clear;
      Dm.ReadDataSet.SelectSQL.Text := 'select CN_ORDERTYPE_VOSSTANOVL from CN_PUB_SYS_DATA_GET_ALL';
      Dm.ReadDataSet.Open;
      CN_ORDERTYPE_VOSSTANOVL := Dm.ReadDataSet['CN_ORDERTYPE_VOSSTANOVL'];
      Dm.ReadDataSet.Close;

       for i:=0 to DM_Detail_1.DataSet.RecordCount-1 do
       begin
        ID_DOG_as_int := DM_Detail_1.DataSet['ID_DOG'];
        ID_STUD_as_int:= DM_Detail_1.DataSet['ID_STUD'];
        // определяю параметры для восстановления
        DM.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_ID_DOG_ROOT('
                                         + IntToStr(ID_DOG_as_int)+
                                         ','+
                                         IntToStr(ID_STUD_as_int)+ ')';
        DM.ReadDataSet.Open;
          with DM.StProc do
           begin
            try
             StoredProcName := 'CN_DT_CONTRACT_RECOVERY';
             Transaction.StartTransaction;
             Prepare;
             ParamByName('ID_DOG_ROOT').AsInt64     := DM.ReadDataSet['ID_DOG_ROOT'];
             ParamByName('ID_DOG').AsInt64          := ID_DOG_as_int;
             ParamByName('ID_STUD').AsInt64         := ID_STUD_as_int;
             ExecProc;
             Transaction.Commit;
             Close;
            except
              Transaction.Rollback;
              ShowMessage('Error in stored procedure CN_DT_CONTRACT_RECOVERY');
              exit;
            end;
          end;
        DM.ReadDataSet.close;

        // пишу приказ о восстановлении
          with DM.StProc do
           begin
            try
              StoredProcName := 'CN_DT_ORDERS_INSERT';
              Transaction.StartTransaction;
              Prepare;
              ParamByName('ID_ORDER').AsInt64       := CN_ORDERTYPE_VOSSTANOVL;
              ParamByName('ID_STUD').AsInt64        := DM_Detail_1.DataSet['ID_STUD'];
              ParamByName('DATE_ORDER').AsDate      := DM.DataSet['ORDER_DATE'];
              ParamByName('NUM_ORDER').AsString     := DM.DataSet['ORDER_NUM'];
              ParamByName('COMMENTS').AsString      := 'автоматичне додавання наказу при роботі з рапортами на відновлення';
              ExecProc;
              Transaction.Commit;
              Close;
            except
              Transaction.Rollback;
              ShowMessage('Error in stored procedure CN_DT_ORDERS_INSERT');
              exit;
            end;
          end;

        DM_Detail_1.DataSet.Next;
       end;
  end;
  
    with DM.StProc do
     begin
      try
        StoredProcName := 'CN_DT_RAPORT_UPT_VIPOLNEN';
        Transaction.StartTransaction;
        ParamByName('ID_DOCUM').AsInt64  := DM.Dataset['ID_DOCUM'];
        ParamByName('ID_STATUS').AsInt64 := ID_STATUS_Vipolnen;
        Prepare;
        ExecProc;
        Transaction.Commit;
        Close;
      except
        Transaction.Rollback;
        ShowMessage('Error in stored procedure CN_DT_RAPORT_UPT_VIPOLNEN');
        exit;
      end;
     end;

      DM.DataSet.CloseOpen(true);
      DM_Detail_1.DataSet.CloseOpen(true);

end;

procedure TfrmRaport.ViewButtonClick(Sender: TObject);
var ViewForm :TfrmDocs_AE;
begin
if GridView.DataController.RecordCount = 0 then exit;

 ViewForm := TfrmDocs_AE.create(self, PLanguageIndex, DM.DB.Handle, true);
 ViewForm.Caption := cn_EditBtn_Caption[PLanguageIndex];
 ViewForm.Num_Doc_Edit.Text  := DM.DataSet['NAME_DOCUM'];
 ViewForm.Date_Doc_Edit.Date := DM.DataSet['DATE_DOCUM'];
 ViewForm.ID_STATUS          := DM.DataSet['ID_STATUS'];
 ViewForm.ID_TYPE_DOCUM      := DM.DataSet['ID_TYPE_DOCUM'];
 ViewForm.Status_Edit.Text   := DM.DataSet['NAME_STATUS'];
 ViewForm.TypeDocum_Edit.Text  := DM.DataSet['NAME_TYPE_DOCUM'];
 ViewForm.DateDept_Edit.Date := DM.DataSet['DATE_DEPT'];
if DM.DataSet['ORDER_DATE'] <> null then
 ViewForm.Order_Date_Edit.Date:= DM.DataSet['ORDER_DATE'];
if DM.DataSet['ORDER_NUM'] <> null then
 ViewForm.Order_Num_Edit.Text := DM.DataSet['ORDER_NUM'];
 ViewForm.ShowModal;
end;

procedure TfrmRaport.AddAllAvto_BtnClick(Sender: TObject);
var
  ViewForm : TfrmAddAll;
begin
if GridView.DataController.RecordCount = 0 then exit;
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;
 
 ViewForm := TfrmAddAll.Create(self,DM.DB.Handle, PLanguageIndex, Dm.DataSet['DATE_DEPT'], Dm.DataSet['ID_DOCUM'], SpravMode);
 ViewForm.Caption := cn_InsertBtn_Caption[PLanguageIndex];
 ViewForm.DateDocumVosst :=  Dm.DataSet['DATE_DOCUM'];
 ViewForm.ShowModal;
 DM_Detail_1.DataSet.CloseOpen(true);
 ViewForm.Free;

end;

procedure TfrmRaport.DebugPrintActionExecute(Sender: TObject);
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

procedure TfrmRaport.PrintButtonClick(Sender: TObject);
var ID_NAMEREP : int64;
begin

  frxReport.Clear;

  if SpravMode = 1 then
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+'cn_che_RaportOtchisl'+'.fr3')
  else
  frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\'+'cn_che_RaportVosstanovl'+'.fr3');

  frxReport.Variables.Clear;

  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_FR_RAPORT_GET_ATRIBUTES';
  Dm.ReadDataSet.Open;
   frxReport.Variables['CN_FR_UNIVER']     := ''''+ Dm.ReadDataSet['CN_FR_UNIVER']     +'''';
   frxReport.Variables['CN_FR_REKTOR']     := ''''+ Dm.ReadDataSet['CN_FR_REKTOR']     +'''';
   frxReport.Variables['CN_FR_UNIVER_NAME']:= ''''+ Dm.ReadDataSet['CN_FR_UNIVER_NAME']+'''';
  Dm.ReadDataSet.Close;

  frxReport.Variables['DATE_DOCUM']:= ''''+ datetostr(DM.DataSet['DATE_DOCUM'])+'''';
  
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select CN_NAMEZVIT_RAP_NA_OTCHISL from CN_PUB_SYS_DATA_GET_ALL';
  Dm.ReadDataSet.Open;
   if Dm.ReadDataSet['CN_NAMEZVIT_RAP_NA_OTCHISL'] <> null then
   ID_NAMEREP := Dm.ReadDataSet['CN_NAMEZVIT_RAP_NA_OTCHISL'];
  Dm.ReadDataSet.Close;

  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_FR_GET_SIGNATURES(' + inttostr(ID_NAMEREP) + ')';
  Dm.ReadDataSet.Open;
  Dm.ReadDataSet.FetchAll;

  frxDBDataset.DataSet  := DM_Detail_1.DataSet;
  frxDBDataset2.DataSet := Dm.ReadDataSet;

  frxReport.PrepareReport(true);
  frxReport.ShowReport;
  if designer_rep=1 then
    begin
      frxReport.DesignReport;
    end;
  Dm.ReadDataSet.Close;
end;

procedure TfrmRaport.GridViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  Arect:TRect;
begin

  if ((AViewInfo.GridRecord.Values[2]= ID_STATUS_Vipolnen) and (not AViewInfo.GridRecord.Focused )) 
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00AEA4DF;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[2]= ID_STATUS_Vipolnen) and (AViewInfo.GridRecord.Focused ))
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$007968CA;
      ACanvas.Canvas.FillRect(Arect);
   end;

end;

procedure TfrmRaport.DeleteAll_BtnClick(Sender: TObject);
 var
  i: byte;
begin
 if Grid2View.DataController.RecordCount = 0 then exit;
if DM.DataSet['ID_STATUS'] = ID_STATUS_Vipolnen then
 begin
  showmessage(cn_NotChangeRaport[PLanguageIndex]);
  exit;
 end;

  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Execute[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit
  else
  begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_RAPORT_STUD_DELETE_ALL';
        Prepare;
        ParamByName('ID_DOCUM').AsInt64       :=  DM.DataSet['ID_DOCUM'];
        ExecProc;
        Transaction.Commit;
       except
        on E:Exception do
         begin
          cnShowMessage('Error in CN_DT_RAPORT_STUD_DELETE_ALL',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
 DM_Detail_1.DataSet.CloseOpen(true);
   end;
end;

end.
