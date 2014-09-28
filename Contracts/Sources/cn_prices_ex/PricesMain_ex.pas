unit PricesMain_ex;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, ComCtrls, ToolWin, ImgList, cxStyles, cxGraphics,
  cxCustomData, cxTL, cxControls, cxInplaceContainer, cxTLData, cxDBTL,
  cxMaskEdit, Menus, pFibStoredProc, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, cxTextEdit, cn_Common_Types, ActnList,
  cn_Common_Funcs, CnConsts, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxCalendar, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomView, cxGrid, cxClasses, FIBQuery, pFIBQuery, AccMgmt,
  cnConsts_Messages, cn_Common_Messages, Placemnt, frxClass, frxDBSet,
  frxDesgn, RxMemDS, cxCheckBox, ExtCtrls, cxSplitter,
  cxLookAndFeelPainters, StdCtrls, cxButtons, frxDock, Buttons, cxContainer,
  cn_Common_WaitForm, frxExportRTF, frxExportXLS, frxExportHTML,
  frxExportPDF, ADODB, IniFiles;

type
  TfrmPricesMain_ex = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet_read: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    DATE_BEG: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    NAME_PRICE: TcxGridDBColumn;
    DATE_END: TcxGridDBColumn;
    act_Refresh: TAction;
    act_exit: TAction;
    act_edit: TAction;
    act_add: TAction;
    act_del: TAction;
    act_select: TAction;
    act_view: TAction;
    SProc: TpFIBStoredProc;
    CnFormStorage: TFormStorage;
    FormStorage1: TFormStorage;
    dxBarLargeButton1: TdxBarLargeButton;
    copy_act: TAction;
    dxBarPopupMenu1: TdxBarPopupMenu;
    add_new: TdxBarLargeButton;
    copy_price: TdxBarLargeButton;
    print_button: TdxBarLargeButton;
    print_act: TAction;
    debug_act: TAction;
    DataSet_report: TpFIBDataSet;
    Price_frxDataset: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    PopupMenu_print: TdxBarPopupMenu;
    dxbrsbtm1: TdxBarSubItem;
    Print_price: TdxBarLargeButton;
    print_price_hst: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    GridColVerName: TcxGridDBColumn;
    GridColVerActual: TcxGridDBColumn;
    cxSplitter1: TcxSplitter;
    DSetVerssion: TpFIBDataSet;
    VerssionDSource: TDataSource;
    SIGNED: TcxGridDBColumn;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    act_del_ver1: TSpeedButton;
    act_edit_ver1: TSpeedButton;
    act_add_ver1: TSpeedButton;
    CopyVerssionBtn: TSpeedButton;
    ToolButton1: TToolButton;
    signButton: TdxBarLargeButton;
    Price_Report: TfrxReport;
    GridColID_ver: TcxGridDBColumn;
    ID_PRICES: TcxGridDBColumn;
    LrgBtnView: TdxBarLargeButton;
    chbxShowVerssion: TcxCheckBox;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    Publish: TdxBarLargeButton;
    Connection: TADOConnection;
    StoredProc: TADOStoredProc;
    DataSet_publish: TpFIBDataSet;
    ToolButton3: TToolButton;
    SpeedButton1: TSpeedButton;
    procedure ActionExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure act_RefreshExecute(Sender: TObject);
    procedure act_exitExecute(Sender: TObject);
    procedure act_editExecute(Sender: TObject);
    procedure act_addExecute(Sender: TObject);
    procedure act_delExecute(Sender: TObject);
    procedure act_selectExecute(Sender: TObject);
    procedure OpenPriceReestr( id_price_ver:int64; can_edit: Boolean);
    procedure copy_actExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure print_actExecute(Sender: TObject);
    procedure debug_actExecute(Sender: TObject);
    procedure print_price_hstClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure act_add_ver1Click(Sender: TObject);
    procedure act_edit_ver1Click(Sender: TObject);
    procedure act_del_ver1Click(Sender: TObject);
    procedure CopyVerssionBtnClick(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure signButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure LrgBtnViewClick(Sender: TObject);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
    procedure chbxShowVerssionClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure PublishClick(Sender: TObject);
  private
    is_admin:Boolean;
    { Private declarations }
  public
    { Public declarations }
    id_user:int64;
    PLanguageIndex:integer;
     IsDebugMode : Boolean;
    constructor Create(AParameter:TcnSimpleParams);reintroduce;
  end;

  Function ShowPrices(AParameter:TcnSimpleParams):Variant; stdcall;
  Exports ShowPrices;


var
  res:Variant;

implementation

uses BaseTypes, UParamsReestr_ex, AddPriceForm_ex, uCopy_param, AddVerssion;

{$R *.dfm}


Function ShowPrices(AParameter:TcnSimpleParams):Variant; stdcall;
var
  ViewForm:TfrmPricesMain_ex;
begin
  if AParameter.Formstyle = fsMDIChild then
  if IsMDIChildFormShow(TfrmPricesMain_ex) then exit;

  ViewForm := TfrmPricesMain_ex.Create(AParameter);
  ViewForm.FormStyle:= AParameter.Formstyle;

  case ViewForm.FormStyle of
   fsNormal, fsStayOnTop : ViewForm.ShowModal;
   fsMDIChild	           : ViewForm.Show;
  else
   begin
    ViewForm.ShowModal;
    ViewForm.free;
   end;
  end;
  Result:=res;
end;

constructor TfrmPricesMain_ex.Create(AParameter:TcnSimpleParams);
begin
  inherited Create(AParameter.Owner);
  id_user := AParameter.ID_User;
  is_admin := AParameter.is_admin;

  WorkDatabase.Handle:=AParameter.Db_Handle;

  WorkDatabase.Open;
  ReadTransaction.StartTransaction;
  act_RefreshExecute(self);
  DataSet_read.First;
  DSetVerssion.First;
  CnFormStorage.RestoreFormPlacement;
end;

procedure TfrmPricesMain_ex.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmPricesMain_ex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CnFormStorage.SaveFormPlacement;
  Action:=caFree;
end;

procedure TfrmPricesMain_ex.act_RefreshExecute(Sender: TObject);
begin
    DSetVerssion.Close;
    DataSet_read.Close;
    DataSet_read.SelectSQL.Text:='SELECT * FROM CN_DT_PRICES where is_deleted = 0 order by DATE_BEG ASC, ID_PRICES ASC';
    DSetVerssion.SelectSQL.Text:='select pv.ID_PRICE_VERSSION, pv.ID_PRICE, pv.NAME_VERSSION, pv.IS_ACTUAL '+
                                  ' from CN_DT_PRICE_VERSSION pv '+
                                  'where pv.ID_PRICE=:ID_PRICES '+
                                  'order by IS_ACTUAL desc';
    DataSet_read.Open;
    DataSet_read.FetchAll;
    DSetVerssion.Open;
    DSetVerssion.FetchAll;
end;

procedure TfrmPricesMain_ex.act_exitExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmPricesMain_ex.act_editExecute(Sender: TObject);
Var
  ViewForm:TfrmGetPriceInfo;
  id: Int64;
  //idv: Int64;
begin
    if DataSet_read.RecordCount=0 then exit;
    If not Is_Admin then
        If fibCheckPermission('/ROOT/Contracts/Cn_Price','Edit') <> 0 then
        Begin
              messagebox(handle,
              pchar(cn_NotHaveRights[PLanguageIndex]
              +#13+ cn_GoToAdmin[PLanguageIndex]),
              pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
              exit;
        End;

  if DataSet_read['SIGNED']='T'
   then cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex],CnConsts.cn_price_already_signed[PLanguageIndex],mtConfirmation,[mbOk])
   else
    begin
     ViewForm:=TfrmGetPriceInfo.create(self,DataSet_read['DATE_BEG'], DataSet_read['DATE_END']);
     ViewForm.Name_price.Text:=DataSet_read['NAME_PRICE'];
     ViewForm.Caption:=cn_EditBtn_Caption[PLanguageIndex]+' "'+DataSet_read['NAME_PRICE']+'"';
     id :=DataSet_read['ID_PRICES'];
     //if not DSetVerssion.IsEmpty then idv:=DSetVerssion['ID_PRICE_VERSSION'];
     ViewForm.ShowModal;

     if ViewForm.ModalResult=mrOk then
      Begin
       WriteTransaction.StartTransaction;
       SProc.StoredProcName:='CN_DT_PRICES_UPDATE';
       SProc.Prepare;
       SProc.ParamByName('ID_PRICES').AsInt64:=id;
       SProc.ParamByName('NAME_PRICE').AsString:=ViewForm.Name_price.Text;
       SProc.ParamByName('DATE_BEG').AsDate:=ViewForm.DateBegOut;
       SProc.ParamByName('DATE_END').AsDate:=ViewForm.DateEndOut;
       SProc.ParamByName('SIGNED').AsString:='F';
       SProc.ExecProc;
        try
         WriteTransaction.Commit;
         except
          WriteTransaction.Rollback;
        End;
       SProc.Close;
       DataSet_read.CloseOpen(True);
       DataSet_read.Locate('ID_PRICES', IntToStr(id),[]);
       DSetVerssion.CloseOpen(True);
       //if not DSetVerssion.IsEmpty then DSetVerssion.Locate('ID_PRICE_VERSSION', IntToStr(idv), []);
      End;
     ViewForm.Free
    end;
end;

procedure TfrmPricesMain_ex.act_addExecute(Sender: TObject);
Var
  ViewForm:TfrmGetPriceInfo;
  id:Int64;
begin
    If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_price','ADD') <> 0 then
    begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    ViewForm:=TfrmGetPriceInfo.create(self,now,now);
    ViewForm.Caption:=cn_InsertBtn_Caption[PLanguageIndex];
    ViewForm.ShowModal;
    if ViewForm.ModalResult=mrOk then
    Begin
        WriteTransaction.StartTransaction;
        SProc.StoredProcName:='CN_DT_PRICES_INSERT';
        SProc.Prepare;
        SProc.ParamByName('NAME_PRICE').AsString:=ViewForm.Name_price.Text;
        SProc.ParamByName('DATE_BEG').AsDate:=ViewForm.DateBegOut;
        SProc.ParamByName('DATE_END').AsDate:=ViewForm.DateEndOut;
        SProc.ExecProc;
        id:=SProc.FldByName['ID'].AsInt64;
        Try
         WriteTransaction.Commit;
         except
         WriteTransaction.Rollback;
        End;
        SProc.Close;
        DataSet_read.CloseOpen(True);
        DataSet_read.Locate('ID_PRICES',IntToStr(id),[]);
        DSetVerssion.Open;
    End;
    ViewForm.Free;
end;

procedure TfrmPricesMain_ex.act_delExecute(Sender: TObject);
var
  i:integer;
begin
    if DataSet_read.RecordCount=0 then exit;

    If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Del') <> 0
    then Begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     End;

 // if cxGrid1DBTableView1.DataController.RowCount=0 then exit;
    if DataSet_read['SIGNED']='T' then
        cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex],CnConsts.cn_price_already_signed[PLanguageIndex],mtConfirmation,[mbOk])
    else begin
        if cxGrid1DBTableView1.DataController.RecordCount = 0 then exit;
        i:= cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
        if ((i = 7) or (i= 2)) then exit;

        WriteTransaction.StartTransaction;
        SProc.StoredProcName:='CN_DT_PRICES_DELETE';
        SProc.Prepare;
        SProc.ParamByName('ID_PRICES').AsInt64:=DataSet_read['ID_PRICES'];
        SProc.ExecProc;
        Try
         WriteTransaction.Commit;
         except
          WriteTransaction.Rollback;
        End;
        SProc.Close;
        act_RefreshExecute(self);
    end;
end;

procedure TfrmPricesMain_ex.act_selectExecute(Sender: TObject);
begin
  OpenPriceReestr(DSetVerssion['ID_PRICE_VERSSION'],False);
end;

procedure TfrmPricesMain_ex.OpenPriceReestr( id_price_ver:int64; can_edit: Boolean);
Var
  ViewForm:TfrmPriceReestr;
  aHandel:TISC_DB_HANDLE;
begin
    if DSetVerssion.IsEmpty then Exit;

    aHandel:=WorkDatabase.Handle;
    ViewForm:=TfrmPriceReestr.Create(self,aHandel,id_price_ver,id_user,can_edit,is_admin);
    ViewForm.Caption := DataSet_read['NAME_PRICE']+' ('+DateToStr(DataSet_read['Date_BEG'])+'-'+DateToStr(DataSet_read['DATE_END'])+')';
    ViewForm.FormStyle:=FormStyle;
    ViewForm.Show;
end;

procedure TfrmPricesMain_ex.copy_actExecute(Sender: TObject);
Var
  ViewForm:TfrmGetPriceInfo;
  T:TfrmCopy_param;
  wf : TForm;
begin
  If DataSet_read.RecordCount=0 then exit;

  If not Is_Admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_price','Add') <> 0
    then
     Begin
      messagebox(handle,
      pchar(cn_NotHaveRights[PLanguageIndex]
      +#13+ cn_GoToAdmin[PLanguageIndex]),
      pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
      exit;
     End;

  ViewForm:=TfrmGetPriceInfo.create(self,now,now);
  ViewForm.Caption:=CnConsts.cn_CopyPrice[PLanguageIndex]+' "'+DataSet_read['NAME_PRICE']+'"';
  ViewForm.Name_price.Text:=DataSet_read['NAME_PRICE'];
  ViewForm.ShowModal;
  if ViewForm.ModalResult=mrOk then
   Begin
    wf := ShowWaitForm(self,wfLoadPackage);
    T:=TfrmCopy_param.create(self);
    T.ShowModal;
    if T.ModalResult=mrOk then
     Begin
      WriteTransaction.StartTransaction;
      SProc.StoredProcName:='CN_DT_COPY_PRICE';
      SProc.Prepare;
      SProc.ParamByName('ID_PRICE_OLD').AsInt64:=DataSet_read['ID_PRICES'];
      SProc.ParamByName('PRICE_NAME').AsString:=ViewForm.Name_price.Text;
      SProc.ParamByName('DATE_BEG').AsDate:=ViewForm.DateBegOut;
      SProc.ParamByName('DATE_END').AsDate:=ViewForm.DateEndOut;
      SProc.ParamByName('KOEF').Asfloat:=T.koeffic.EditValue;
      SProc.ParamByName('ID_NAC').AsInt64:=T.id_Nac;
      SProc.ParamByName('Round_s').AsInteger := 1 - T.round_ComboBox.ItemIndex;
      SProc.ExecProc;
      Try
       WriteTransaction.Commit;
       except
       WriteTransaction.Rollback;
      End;
      SProc.Close;
      act_RefreshExecute(self);
     End;
    T.Free;
    CloseWaitForm(wf);
   End;
  ViewForm.Free;
  act_RefreshExecute(self);
end;

procedure TfrmPricesMain_ex.FormCreate(Sender: TObject);
begin
  PLanguageIndex          := cn_Common_Funcs.cnLanguageIndex;
  Caption                 := cn_PreyskurantWork[PLanguageIndex];
  AddButton.Caption       := cn_InsertBtn_Caption[PLanguageIndex];
  AddButton.Hint          := cn_InsertBtn_Caption[PLanguageIndex];
  EditButton.Caption      := cn_EditBtn_Caption[PLanguageIndex];
  EditButton.Hint         := cn_EditBtn_Caption[PLanguageIndex];
  RefreshButton.Caption   := cn_RefreshBtn_Caption[PLanguageIndex];
  RefreshButton.Hint      := cn_RefreshBtn_Caption[PLanguageIndex];
  DeleteButton.Caption    := cn_DeleteBtn_Caption[PLanguageIndex];
  DeleteButton.Hint       := cn_DeleteBtn_Caption[PLanguageIndex];
  SelectButton.Caption    := cn_SelectBtn_Caption[PLanguageIndex];
  SelectButton.Hint       := cn_SelectBtn_Caption[PLanguageIndex];
  chbxShowVerssion.Properties.Caption:= cn_showVerssions[PLanguageIndex];
  ExitButton.Caption      := cn_ExitBtn_Caption[PLanguageIndex];
  ExitButton.Hint         := cn_ExitBtn_Caption[PLanguageIndex];
  act_add_ver1.Caption    := cn_InsertBtn_Caption[PLanguageIndex];
  act_edit_ver1.Caption   := cn_EditBtn_Caption[PLanguageIndex];
  act_del_ver1.Caption    := cn_DeleteBtn_Caption[PLanguageIndex];
  add_new.Caption         := cn_InsertBtn_Caption[PLanguageIndex];
  copy_price.Caption      := cn_CopyPrice[PLanguageIndex];
  CopyVerssionBtn.Caption :=cn_CopyPrice[PLanguageIndex];
  NAME_PRICE.Caption      := cn_Name_Column[PLanguageIndex];
  DATE_BEG.Caption        := cn_grid_Date_Beg[PLanguageIndex];
  DATE_END.Caption        := cn_grid_Date_End[PLanguageIndex];
  SIGNED.Caption          := cn_price_already_signed[PLanguageIndex];
  GridColVerName.Caption  := cn_grid_VerName[PLanguageIndex];
  GridColVerActual.Caption:= cn_grid_Actual[PLanguageIndex];
  Print_Button.Caption    := cn_Print_Caption[PLanguageIndex];
  Print_Button.Hint       := cn_Print_Caption[PLanguageIndex];
  LrgBtnView.Caption      := cn_ViewShort_Caption[PLanguageIndex];
  LrgBtnView.Hint         := cn_ViewPrice_Hint[PLanguageIndex];
  IsDebugMode:=false;
  DataSet_read.First;
end;

procedure TfrmPricesMain_ex.print_actExecute(Sender: TObject);
begin
  if DataSet_read.RecordCount = 0 then Exit;

  If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Print') <> 0
    then Begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     End;

  Screen.Cursor:=crHourGlass;

  DataSet_report.Close;
  DataSet_report.SQLs.SelectSQL.Text:='Select * from CN_PRICE_SELECT_FOR_PRINT(:id_price) ORDER BY name_nationality, name_faculty, name_speciality, name_kategory, name_form_study';
  DataSet_report.ParamByName('ID_PRICE').AsInt64:=DSetVerssion['ID_PRICE_VERSSION'];
  DataSet_report.Open;

  Price_Report.Clear;
  Price_Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\cn_price_ex.fr3');
  Price_Report.Variables.Clear;

  Screen.Cursor:=crDefault;
  Price_Report.PrepareReport(True);
  if IsDebugMode then Price_Report.DesignReport
                 else Price_Report.ShowReport;
end;

procedure TfrmPricesMain_ex.debug_actExecute(Sender: TObject);
begin
 if not IsDebugMode then
                      Begin
                       Caption:=Caption+' *debug';
                       IsDebugMode:=true;
                      End
                     Else
                      Begin
                       IsDebugMode:=false;
                       Caption := cn_PreyskurantWork[PLanguageIndex];
                      End;
end;

procedure TfrmPricesMain_ex.print_price_hstClick(Sender: TObject);
begin
  if DataSet_read.RecordCount = 0 then Exit;

   If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Print') <> 0
    then Begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     End;

  Screen.Cursor:=crHourGlass;

  DataSet_report.Close;
  DataSet_report.SQLs.SelectSQL.Clear;
  DataSet_report.SQLs.SelectSQL.Add('Select * ');
  DataSet_report.SQLs.SelectSQL.Add('from CN_PRICE_SELECT_HIST_FOR_PRINT(:id_price_ver)');
  DataSet_report.SQLs.SelectSQL.Add('ORDER BY name_national, name_facul, name_spec, name_form_stud, kurs');
  DataSet_report.ParamByName('ID_PRICE_VER').AsInt64:=DSetVerssion['ID_PRICE_VERSSION'];
  DataSet_report.Open;

  Price_Report.Clear;
  Price_Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\cn_price_hst_ex.fr3');
  Price_Report.Variables.Clear;

  Screen.Cursor:=crDefault;
  Price_Report.PrepareReport(True);
  if IsDebugMode then Price_Report.DesignReport
                 else Price_Report.ShowReport;

end;

procedure TfrmPricesMain_ex.dxBarLargeButton2Click(Sender: TObject);
begin
  if DataSet_read.RecordCount = 0 then Exit;

   If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','Print') <> 0
    then Begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
     End;

  Screen.Cursor:=crHourGlass;

  DataSet_report.Close;
  DataSet_report.SQLs.SelectSQL.Text:='Select * from cn_price_select_for_print(:idp) ORDER BY name_nationality, name_faculty, name_speciality, name_kategory, name_form_study';
  DataSet_report.ParamByName('IDP').AsInt64:=DSetVerssion['ID_PRICE_VERSSION'];
  DataSet_report.Open;

  Price_Report.Clear;
  Price_Report.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Contracts\cn_price_ex_smet.fr3');
  Price_Report.Variables.Clear;

  Screen.Cursor:=crDefault;
  Price_Report.PrepareReport(True);
  if IsDebugMode then Price_Report.DesignReport
                 else Price_Report.ShowReport;
end;

procedure TfrmPricesMain_ex.act_add_ver1Click(Sender: TObject);
var
  T: TfrmAddVerssion;
  id: Int64;
begin
    If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_price','ADD') <> 0 then
    begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    if DataSet_read['SIGNED']='T' then
        cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex],CnConsts.cn_price_already_signed[PLanguageIndex],mtConfirmation,[mbOk])
    else begin
        T:=TfrmAddVerssion.Create(Self, PLanguageIndex);
        T.Caption:=cnConsts.cn_AddVerssion[PLanguageIndex]+' "'+DataSet_read['NAME_PRICE']+'"';
        if DSetVerssion.IsEmpty then
        begin
            T.chbActual.Checked:=true;
            T.chbActual.Enabled:=False;
        end;
        if T.ShowModal=mrok then
        begin
            WriteTransaction.StartTransaction;
            SProc.StoredProcName:='CN_DT_PRICE_VERSSION_INS';
            SProc.Prepare;
            SProc.ParamByName('NAME_VERSSION').AsString:=T.EditNameVerssion.Text;
            SProc.ParamByName('ID_PRICE').AsInt64:=DataSet_read['ID_PRICES'];
            if T.chbActual.Checked then SProc.ParamByName('ACTUAL').AsString:='T'
            else                        SProc.ParamByName('ACTUAL').AsString:='F';
            SProc.ExecProc;
            id:=SProc.ParamByName('ID').AsInt64;            
            Try
             WriteTransaction.Commit;
             except
             WriteTransaction.Rollback;
            End;
            SProc.Close;
            DSetVerssion.CloseOpen(True);
            DSetVerssion.Locate('ID_PRICE_VERSSION', IntToStr(id),[]);
        end;
        T.Free;
    end;
end;

procedure TfrmPricesMain_ex.act_edit_ver1Click(Sender: TObject);
var
  T: TfrmAddVerssion;
  id: Int64;
begin
    if DSetVerssion.RecordCount=0 then exit;
    If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_price','EDIT') <> 0 then
    begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    if DataSet_read['SIGNED']='T' then
        cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex],CnConsts.cn_price_already_signed[PLanguageIndex],mtConfirmation,[mbOk])
    else begin
        T:=TfrmAddVerssion.Create(Self, PLanguageIndex);
        T.EditNameVerssion.Text:=DSetVerssion['NAME_VERSSION'];
        T.Caption:=cnConsts.cn_AddVerssion[PLanguageIndex]+' "'+DataSet_read['NAME_PRICE']+'"('+DSetVerssion['NAME_VERSSION']+')';
        if DSetVerssion['IS_ACTUAL']='T' then
        begin
            T.chbActual.Visible:=False;
            T.chbActual.Checked:=True;
        end;
        id:=DSetVerssion['ID_PRICE_VERSSION'];
        if T.ShowModal=mrok then
        begin
            WriteTransaction.StartTransaction;
            SProc.StoredProcName:='CN_DT_PRICE_VERSSION_UPD';
            SProc.Prepare;
            SProc.ParamByName('ID_PRICE_VERSSION').AsInt64:=DSetVerssion['ID_PRICE_VERSSION'];
            SProc.ParamByName('NAME_VERSSION').AsString:=T.EditNameVerssion.Text;
            SProc.ParamByName('ID_PRICE').AsInt64:=DataSet_read['ID_PRICES'];
            if T.chbActual.Checked then SProc.ParamByName('IS_ACTUAL').AsString:='T'
            else                        SProc.ParamByName('IS_ACTUAL').AsString:='F';
            SProc.ExecProc;
            Try
             WriteTransaction.Commit;
             except
             WriteTransaction.Rollback;
            End;
            SProc.Close;
            DSetVerssion.CloseOpen(True);
            DSetVerssion.Locate('ID_PRICE_VERSSION', IntToStr(id),[]);
        end;
        T.Free;
    end;
end;

procedure TfrmPricesMain_ex.act_del_ver1Click(Sender: TObject);
var
  i:Integer;
begin
    if DSetVerssion.RecordCount=0 then exit;
    If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_price','DEL') <> 0 then
    begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;
    if cxGrid2DBTableView1.DataController.RecordCount = 0 then exit;

    i:= cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;

    WriteTransaction.StartTransaction;
    SProc.StoredProcName:='CN_DT_PRICE_VERSSION_DEL';
    SProc.Prepare;
    SProc.ParamByName('ID_PRICE_VERSSION').AsInt64:=DSetVerssion['ID_PRICE_VERSSION'];
    SProc.ExecProc;
    Try
      WriteTransaction.Commit;
    except
      WriteTransaction.Rollback;
    End;
    SProc.Close;
    DSetVerssion.Close;
    DSetVerssion.Open;
end;

procedure TfrmPricesMain_ex.CopyVerssionBtnClick(Sender: TObject);
var
  T: TfrmAddVerssion;
  id: Int64;
  wf : TForm;
begin
    if DSetVerssion.RecordCount=0 then exit;
    If not Is_Admin then
    If fibCheckPermission('/ROOT/Contracts/cn_price','ADD') <> 0 then
    begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    T:=TfrmAddVerssion.Create(Self,PLanguageIndex);
    T.Caption:=CnConsts.cn_AddVerssion[PLanguageIndex]+' "'+DataSet_read['NAME_PRICE']+'"';
    T.EditNameVerssion.Text:=DSetVerssion['NAME_VERSSION'];
    T.chbActual.Visible:=False;
    if T.ShowModal=mrok then
    begin
        wf := ShowWaitForm(self,wfLoadPackage);
        WriteTransaction.StartTransaction;
        SProc.StoredProcName:='CN_DT_COPY_PRICE_VERSSION';
        SProc.Prepare;
        SProc.ParamByName('ID_PRICE_VERSSION_OLD').AsInt64:=DSetVerssion['ID_PRICE_VERSSION'];
        SProc.ParamByName('ID_PRICE').AsInt64    :=DataSet_read['ID_PRICES'];
        SProc.ParamByName('NAME_VERSSION').AsString:=T.EditNameVerssion.Text;
        SProc.ParamByName('KOEF').Asfloat:=1;
        SProc.ParamByName('ID_NAC').AsInt64:=-1;
        SProc.ParamByName('Round_s').AsInteger:=1;
        SProc.ParamByName('year_correct').AsInteger:=0;
        SProc.ExecProc;
        id:=SProc.FldByName['ID_PRICE_VERSSION_NEW'].AsInt64;
        Try
          WriteTransaction.Commit;
        except
          WriteTransaction.Rollback;
        End;
        SProc.Close;
        DSetVerssion.CloseOpen(True);
        DSetVerssion.Locate('ID_PRICE_VERSSION',IntToStr(id),[]);
        CloseWaitForm(wf);
    end;
    T.Free;
end;


procedure TfrmPricesMain_ex.cxSplitter1AfterClose(Sender: TObject);
begin
    chbxShowVerssion.Checked:=False;
end;

procedure TfrmPricesMain_ex.cxSplitter1AfterOpen(Sender: TObject);
begin
    chbxShowVerssion.Checked:=True;
end;

procedure TfrmPricesMain_ex.signButtonClick(Sender: TObject);
var
  Query:TpFIBQuery;
  i: Integer;
  id: Int64;
  idv: Int64;
begin
    If fibCheckPermission('/ROOT/Contracts/Cn_Price','SIGN') <> 0 then
    begin
        messagebox(handle,
        pchar(cn_NotHaveRights[PLanguageIndex]
        +#13+ cn_GoToAdmin[PLanguageIndex]),
        pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
        exit;
    end;

    if DataSet_read['SIGNED']='T' then
        i:= cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex],
                      cnConsts.cn_Signature_off[PLanguageIndex]+'?',
                      mtConfirmation, [mbYes, mbNo])
    else
        i:= cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex],
                      cnConsts.cn_Signature_on[PLanguageIndex]+'?',
                      mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then exit;

    Query:=TpFIBQuery.Create(nil);
    Query.Database:=WorkDatabase;

    if DataSet_read['SIGNED']='F' then
    begin
        Query.SQL.Text:='select first 1 id_price_verssion from cn_dt_price_verssion '+
                        ' where id_price=:idp and is_actual=''T''';
        Query.ParamByName('idp').AsInt64:=DataSet_read['id_prices'];
        Query.ExecQuery;
        if Query.FieldByName('id_price_verssion').AsInt64>0 then
        begin
            Query.Close;
            Query.SQL.Text:='update CN_DT_PRICES set SIGNED=''T'' where id_prices=:idp';
        end else begin
            cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex],cnConsts_Messages.cn_no_actual_price[PLanguageIndex],mtConfirmation,[mbOk])
        end;
    end;
    if DataSet_read['SIGNED']='T' then
        Query.SQL.Text:='update CN_DT_PRICES set SIGNED=''F'' where id_prices=:idp';

    id  := DataSet_read['ID_PRICES'];

    if not DSetVerssion.IsEmpty
     then idv :=DSetVerssion['ID_PRICE_VERSSION'];

    Query.ParamByName('idp').AsInt64:=DataSet_read['id_prices'];
    Query.Transaction.StartTransaction;
    Query.ExecQuery;
    Try    Query.Transaction.Commit;
    except Query.Transaction.Rollback;
    End;
    Query.Free;
    DataSet_read.CloseOpen(True);
    DataSet_read.Locate('ID_PRICES', IntToStr(id),[]);
    DSetVerssion.CloseOpen(True);

    if not DSetVerssion.IsEmpty
     then DSetVerssion.Locate('ID_PRICE_VERSSION',IntToStr(idv),[]);
end;

procedure TfrmPricesMain_ex.cxGrid1DBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView;
  APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
    if not DataSet_read.IsEmpty then 
      if DataSet_read['signed']='T' then
      begin
          ToolBar1.Enabled:=False;
          act_add_ver1.Enabled:=False;
          act_edit_ver1.Enabled:=False;
          act_del_ver1.Enabled:=False;
          CopyVerssionBtn.Enabled:=False;
          signButton.Caption      := cn_Signature_off[PLanguageIndex];
          signButton.LargeImageIndex:=23;
      end;
      if DataSet_read['signed']='F' then
      begin
          ToolBar1.Enabled:=True;
          act_add_ver1.Enabled:=True;
          act_edit_ver1.Enabled:=True;
          act_del_ver1.Enabled:=True;
          CopyVerssionBtn.Enabled:=True;
          signButton.Caption      := cn_Signature_on[PLanguageIndex];
          signButton.LargeImageIndex:=22;
      end;
end;

procedure TfrmPricesMain_ex.LrgBtnViewClick(Sender: TObject);
var
  proc:TpFIBQuery;
begin
    if (not DataSet_read.IsEmpty) and (not DSetVerssion.IsEmpty) then
    begin
        proc:=TpFIBQuery.Create(nil);
        proc.Database:=WorkDatabase;
        proc.SQL.Text:='select ID_PRICE_VERSSION from CN_DT_PRICE_VERSSION where IS_ACTUAL=''T'' and id_PRICE=:idp';
        proc.ParamByName('idp').AsInt64:=DataSet_read['ID_PRICES'];
        proc.ExecQuery;
        if proc.FldByName['ID_PRICE_VERSSION'].AsInt64>0 then
            OpenPriceReestr(proc.FldByName['ID_PRICE_VERSSION'].AsInt64,False);
    end;
end;

procedure TfrmPricesMain_ex.cxGrid2DBTableView1DblClick(Sender: TObject);
var
  wf:TForm;
begin
  wf:=ShowWaitForm(self,wfLoadPackage);
  if DSetVerssion.IsEmpty then Exit;
  if (DataSet_read['SIGNED']='T')
   then cnShowMessage(cnConsts.cn_Uvaga_Caption[PLanguageIndex],CnConsts.cn_price_already_signed[PLanguageIndex],mtConfirmation,[mbOk])
   else OpenPriceReestr(DSetVerssion['ID_PRICE_VERSSION'],True);
  CloseWaitForm(wf);
end;

procedure TfrmPricesMain_ex.chbxShowVerssionClick(Sender: TObject);
begin
  cxGrid1.SetFocus;
end;

procedure TfrmPricesMain_ex.cxCheckBox1PropertiesChange(Sender: TObject);
begin
    if chbxShowVerssion.Checked then cxSplitter1.OpenSplitter
    else cxSplitter1.CloseSplitter;
end;

procedure TfrmPricesMain_ex.PublishClick(Sender: TObject);
var
  IniFile : TIniFile;
  i       : Integer;
  DB_String : string;
begin
  if DataSet_read.RecordCount=0 then exit;

  if not is_admin then
   If fibCheckPermission('/ROOT/Contracts/Cn_Price','Publish') <> 0 then
    begin
     messagebox(handle,
     pchar(cn_NotHaveRights[PLanguageIndex]
     +#13+ cn_GoToAdmin[PLanguageIndex]),
     pchar(cn_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  i:= cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], 'Ви дійсно бажаєте опублікувати прейскурант?', mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  if not FileExists(ExtractFileDir(Application.ExeName) + '\' + 'config.ini')
   then
    begin
     MessageBox(Application.Handle,'INI-файл не знайдено!','Помилка',MB_OK +MB_ICONERROR);
     exit;
    end
   else
    begin
     IniFile   := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\' + 'config.ini');
     DB_String := IniFile.ReadString('MSSERVER', 'ConnectionString', DB_String);
     IniFile.Free;
    End;

  Connection.ConnectionString :=DB_String;
  try
   Connection.Connected := True;

   StoredProc.Close;
   StoredProc.ProcedureName := 'dt_fb_publ_cn_price_d';
   StoredProc.ExecProc;

   DataSet_publish.Close;
   DataSet_publish.SQLs.SelectSQL.Text:='Select * from CN_PRICE_SELECT_FOR_PRINT(:id_price) ORDER BY name_nationality, name_faculty, name_speciality, name_kategory, name_form_study';
   DataSet_publish.ParamByName('ID_PRICE').AsInt64:=DSetVerssion['ID_PRICE_VERSSION'];
   DataSet_publish.Open;
   DataSet_publish.FetchAll;
   DataSet_publish.First;

   for i := 0 to DataSet_publish.RecordCount-1 do
    Begin
     StoredProc.ProcedureName := 'dt_fb_publ_cn_price_i';
     StoredProc.Parameters.Refresh;
     StoredProc.Parameters.ParamByName('@name_nationality').Value := DataSet_publish['name_nationality'];
     StoredProc.Parameters.ParamByName('@id_user').Value          := id_user;
     StoredProc.Parameters.ParamByName('@name_faculty').Value     := DataSet_publish['name_faculty'];
     StoredProc.Parameters.ParamByName('@id_facul').Value         := DataSet_publish['id_facul'];
     StoredProc.Parameters.ParamByName('@name_speciality').Value  := DataSet_publish['name_speciality'];
     StoredProc.Parameters.ParamByName('@id_spec').Value          := DataSet_publish['id_spec'];
     StoredProc.Parameters.ParamByName('@name_kategory').Value    := DataSet_publish['name_kategory'];
     StoredProc.Parameters.ParamByName('@id_kat_stud').Value      := DataSet_publish['id_kat_stud'];
     StoredProc.Parameters.ParamByName('@name_form_stud').Value   := DataSet_publish['name_form_study'];
     StoredProc.Parameters.ParamByName('@id_form_stud').Value     := DataSet_publish['id_form_stud'];
     StoredProc.Parameters.ParamByName('@name_price').Value       := DataSet_publish['name_price'];
     StoredProc.Parameters.ParamByName('@id_national').Value      := DataSet_publish['id_national'];
     StoredProc.Parameters.ParamByName('@date_beg').Value         := DataSet_publish['date_beg'];
     StoredProc.Parameters.ParamByName('@sum1').Value             := DataSet_publish['sum1'];
     StoredProc.Parameters.ParamByName('@sum2').Value             := DataSet_publish['sum2'];
     StoredProc.Parameters.ParamByName('@sum3').Value             := DataSet_publish['sum3'];
     StoredProc.Parameters.ParamByName('@sum4').Value             := DataSet_publish['sum4'];
     StoredProc.Parameters.ParamByName('@sum5').Value             := DataSet_publish['sum5'];
     StoredProc.Parameters.ParamByName('@summa_all').Value        := DataSet_publish['summa_all'];
     StoredProc.Parameters.ParamByName('@term_stud').Value        := DataSet_publish['term_stud'];
     StoredProc.ExecProc;
     DataSet_publish.Next;
    end;
   StoredProc.Close;
  except on E:Exception do
   begin
    ShowMessage(E.Message);
    Exit;
   end;
  end;
  ShowMessage('Готово!'); 
end;

end.
