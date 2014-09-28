//******************************************************************************
//* Проект "Горводоканал"                                                      *
//* Главная форма по реестрам договоров                                        *
//* Выполнил: Перчак А.Л. 2010г                                                *
//******************************************************************************
unit uReestr_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery, pFIBQuery,
  pFIBStoredProc, ActnList, DB, FIBDataSet, pFIBDataSet, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, ImgList,
  dxBar, dxBarExtItems, cxContainer, cxLabel, ExtCtrls, cxTextEdit,
  cxCurrencyEdit, cxCalendar, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, Menus, cxCheckBox, cxRadioGroup,
  dxStatusBar, cxProgressBar, cxDBLookupComboBox, AccMGMT, uCommon_Types,
  uCommon_Funcs, uReestr_DM, cxTL, Placemnt, uConsts, uConsts_Messages, uReestr_AE,
  uCommon_Messages, cxGroupBox, uCommon_WaitForm, uReestr_Comments,
  uCommon_Loader;

type
  TfrmReestr_main = class(TForm)
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    Panel1: TPanel;
    Label_FIO: TcxLabel;
    Label_num_dog: TcxLabel;
    Bevel4: TBevel;
    Label_status: TcxLabel;
    Calc_Button: TButton;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    HotKey_StatusBar: TdxStatusBar;
    dxStatusBar1: TdxStatusBar;
    HotKey_StatusBarContainer5: TdxStatusBarContainerControl;
    Progress: TcxProgressBar;
    Grid_Reestr_main: TcxGrid;
    Grid_Reestr_mainDBTableView1: TcxGridDBTableView;
    Grid_Reestr_mainLevel1: TcxGridLevel;
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
    BarManager: TdxBarManager;
    ButtonAdd: TdxBarLargeButton;
    ButtonEdit: TdxBarLargeButton;
    ButtonDelete: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    ButtonPrint: TdxBarLargeButton;
    dxBarPopupMenu2: TdxBarPopupMenu;
    FormStorage: TFormStorage;
    ButtonRefresh: TdxBarLargeButton;
    Grid_Table_Fio: TcxGridDBColumn;
    Grid_Table_Date_Reg: TcxGridDBColumn;
    Grid_Table_Num_dog: TcxGridDBColumn;
    Grid_Table_Date_Beg: TcxGridDBColumn;
    Grid_Table_Date_End: TcxGridDBColumn;
    PrintAction: TAction;
    Panel2: TPanel;
    Dog_Filter_Edit_Label: TcxLabel;
    DSetRecordCount: TcxLabel;
    Dog_Filter_edit: TcxTextEdit;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    FiltrByKod_RadioButton: TcxRadioButton;
    SearchButton: TcxButton;
    Button_Comment: TcxButton;
    Button_Pay: TdxBarLargeButton;
    Button_Reload_Dog: TdxBarLargeButton;
    Button_Diss_Dog: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    ButtonDogOrders: TdxBarLargeButton;
    ButtonDogEnteryRest: TdxBarLargeButton;
    ButtonDogLgots: TdxBarLargeButton;
    Grid_Table_is_main: TcxGridDBColumn;
    Grid_Table_is_diss: TcxGridDBColumn;
    Label_Main: TcxLabel;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButton1Click(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure EditClick(aPageIndex : integer );
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ButtonPrintClick(Sender: TObject);
    procedure Dog_Filter_editEnter(Sender: TObject);
    procedure Dog_Filter_editKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dog_Filter_editKeyPress(Sender: TObject; var Key: Char);
    procedure Dog_Filter_editKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchButtonClick(Sender: TObject);
    procedure Button_CommentClick(Sender: TObject);
    procedure ButtonDogOrdersClick(Sender: TObject);
    procedure ButtonDogLgotsClick(Sender: TObject);
    procedure ButtonDogEnteryRestClick(Sender: TObject);
    procedure ButtonEditClick(Sender: TObject);
    procedure Grid_Reestr_mainDBTableView1DblClick(Sender: TObject);
    procedure Grid_Reestr_mainDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure Button_Diss_DogClick(Sender: TObject);
    procedure Button_Reload_DogClick(Sender: TObject);
    procedure Button_PayClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM : TfrmReestr_DM;
    procedure FormIniLanguage;
  public
    KeyField    : string;
    edit_item_id  : Int64;
    KS, Beg_KS: TKeyboardState;
    Subsidy_Edit, Lgots_Edit: Boolean;
    res : Variant;
    is_admin : Boolean;
    constructor Create(AParameter:TbsSimpleParams); reintroduce;
  end;

var
  frmReestr_main: TfrmReestr_main;

implementation

uses pFIBProps, FIBDatabase, uReestr_DissDog, uReestr_Filter;

{$R *.dfm}

constructor TfrmReestr_main.Create(AParameter:TbsSimpleParams);
Begin
  Inherited create(AParameter.Owner);
  
  FormStorage.RestoreFormPlacement;
  is_admin := AParameter.is_admin;
  FormIniLanguage;
  DM := TfrmReestr_DM.Create(self);
  DM.DB.Handle := AParameter.Db_Handle;
  DM.DB.Connected := true;
  DM.ReadTransaction.StartTransaction;
  Grid_Reestr_mainDBTableView1.DataController.DataSource := DM.DataSource;
  
  DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * From CN_GET_SYS_CURRENT_DATE';
  DM.DataSet.Open;
  if DM.DataSet['CURRENTDATE'] <> null
   then DM.CURRENT_DATE := DM.DataSet['CURRENTDATE']
   else DM.CURRENT_DATE := Date;

  {DM.DataSet.Close;
  DM.DataSet.SQLs.SelectSQL.Text := 'Select * From bs_PUB_SYS_DATA_GET_ALL';
  DM.DataSet.Open;
  if DM.DataSet['bs_max_sys_timestamp'] <> null
   then DM.MAX_TIMESTAMP := DM.DataSet['bs_max_sys_timestamp'];

  DM.DataSet.close;
  DM.DataSet.SelectSQL.Text:='select * from bs_DT_DOG_SELECT Order by ukr_fio_upper';
  DM.DataSet.AfterOpen   := DataSetAfterOpen;
  DM.DataSet.AfterScroll := DataSetAfterScroll;}

  RefreshButtonClick(self);
End;

procedure TfrmReestr_main.FormIniLanguage;
begin
  // индекс языка (1-укр, 2 - рус)
  PLanguageIndex:=               uCommon_Funcs.bsLanguageIndex;

  self.Caption :=                uConsts.bs_Reestr_Main_Caption[PLanguageIndex];
  
  //названия кнопок
  ButtonAdd.Caption           := bs_InsertBtn_Caption[PLanguageIndex];
  ButtonEdit.Caption          := bs_EditBtn_Caption[PLanguageIndex];
  ButtonDelete.Caption        := bs_DeleteBtn_Caption[PLanguageIndex];
  ButtonRefresh.Caption       := bs_RefreshBtn_Caption[PLanguageIndex];
  ButtonPrint.Caption         := bs_Print_Caption[PLanguageIndex];
  ButtonDogLgots.Caption      := bs_Lgota_Caption[PLanguageIndex];
  ButtonDogEnteryRest.Caption := bs_EntryRest_Caption[PLanguageIndex];
  ButtonDogOrders.Caption     := bs_Orders[PLanguageIndex];
  ExitButton.Caption          := bs_ExitBtn_Caption[PLanguageIndex];
  Button_Comment.caption      := bs_CommentDiss[PLanguageIndex];
  Button_Diss_Dog.Caption     := bs_BreakDown_Caption[PLanguageIndex];
  Button_Reload_Dog.Caption   := bs_Upload_Caption[PLanguageIndex];
  Button_Pay.Caption          := bs_Pay_Caption[PLanguageIndex];

  //статусбар
  dxStatusBar1.Panels[0].Text     := bs_InsertBtn_ShortCut[PLanguageIndex]  + uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[1].Text     := bs_EditBtn_ShortCut[PLanguageIndex]    + uConsts.bs_EditBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[2].Text     := bs_DeleteBtn_ShortCut[PLanguageIndex]  + uConsts.bs_DeleteBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[3].Text     := bs_RefreshBtn_ShortCut[PLanguageIndex] + uConsts.bs_RefreshBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[4].Text     := bs_FilterBtn_ShortCut[PLanguageIndex]  + uConsts.bs_FilterBtn_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[0].Text := bs_PaymentBtn_ShortCut[PLanguageIndex]      + uConsts.bs_Pay_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[1].Text := bs_PrintBtn_ShortCut[PLanguageIndex]   + uConsts.bs_Print_Caption[PLanguageIndex];
  HotKey_StatusBar.Panels[2].Text := bs_ModeBtn_ShortCut[PLanguageIndex]      + uConsts.bs_Orders[PLanguageIndex];
  dxStatusBar1.Hint               := bs_HotKeys[PLanguageIndex];
  HotKey_StatusBar.Hint           := bs_HotKeys[PLanguageIndex];

  // Грид
  Grid_Table_Fio.Caption      := uConsts.bs_grid_FIO_Column[PLanguageIndex];
  Grid_Table_Date_Reg.Caption := uConsts.bs_grid_Date_Dog_Column[PLanguageIndex];
  Grid_Table_Num_dog.Caption  := uConsts.bs_grid_Num_Dog_Column[PLanguageIndex];
  Grid_Table_Date_Beg.Caption := uConsts.bs_grid_Date_Beg[PLanguageIndex];
  Grid_Table_Date_End.Caption := uConsts.bs_grid_Date_End[PLanguageIndex];

  // Фильтр
  Dog_Filter_Edit_label.Caption:=          uConsts.bs_SearchBtn_Caption[PLanguageIndex];
  FiltrByFIO_RadioButton.Caption:=         uConsts.bs_FiltrByFIO[PLanguageIndex];
  FiltrByNum_RadioButton.Caption:=         uConsts.bs_FiltrByNum[PLanguageIndex];
  FiltrByKod_RadioButton.Caption:=         uConsts.bs_FiltrBarCode[PLanguageIndex];
  Dog_Filter_Edit.Text:=                   uConsts.bs_FilterText[PLanguageIndex];

  Label_FIO.Caption     := uConsts.bs_grid_FIO_Column[PLanguageIndex];
  Label_num_dog.Caption := uConsts.bs_grid_Num_Dog_Column[PLanguageIndex];
  Label_status.Caption  := bs_Status_Dog_Label[PLanguageIndex];
  Label_Main.Caption    := bs_Type_Dog_Label[PLanguageIndex];
end;

procedure TfrmReestr_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormStorage.SaveFormPlacement;
  If FormStyle = fsMDIChild
   then action:=caFree
   else DM.Free;
end;

procedure TfrmReestr_main.AddButton1Click(Sender: TObject);
var
  ViewForm : TfrmReestr_AE;
  ID_DOG : Int64;
  i : Integer;
  Num_Dog : String;
begin
  If (not Is_Admin) then
   If fibCheckPermission('/ROOT/bs/bs_REESTR_DOG','ADD') <> 0 then
    Begin
     messagebox(handle,
     pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
     +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
     pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    End;

  DM.StProc.Transaction.StartTransaction;
  DM.StProc.StoredProcName := 'bs_INI_DOG_NUMBER_GET';
  DM.StProc.ParamByName('DATE_YEAR').AsDate := DM.CURRENT_DATE;
  DM.StProc.ExecProc;
  Num_Dog := DM.StProc.FieldByName('NUM_DOG').AsString;
  try
    DM.StProc.Transaction.Commit;
   except
    on E:Exception do
     begin
      LogException;
      bsShowMessage('Error',e.Message,mtError,[mbOK]);
      DM.StProc.Transaction.Rollback;
      raise;
     end;
  end;

  ViewForm := TfrmReestr_AE.Create(self, DM.DB.Handle, is_admin, 0);

  ViewForm.Caption := uConsts.bs_InsertBtn_Caption[PLanguageIndex];
  ViewForm.ID_Man := -1;
  ViewForm.ID_DOG := -1;
  ViewForm.DateEdit_Date_Reg.EditValue := DM.CURRENT_DATE;
  ViewForm.DateEdit_Date_Beg.EditValue := DM.CURRENT_DATE;
  ViewForm.DateEdit_Date_End.EditValue := DM.MAX_TIMESTAMP;
  ViewForm.Edit_num_Dog.EditValue := Num_Dog;
  ViewForm.is_edit := 0;
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrOk then
   Begin
    DM.StProc.StoredProcName := 'bs_DT_DOG_INSERT';
    DM.WriteTransaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('date_reg').AsDateTime := ViewForm.DateEdit_Date_Reg.EditValue;
    DM.StProc.ParamByName('date_beg').AsDate     := ViewForm.DateEdit_Date_Beg.EditValue;
    DM.StProc.ParamByName('date_end').AsDate     := ViewForm.DateEdit_Date_End.EditValue;
    DM.StProc.ParamByName('num_dog').AsString    := ViewForm.Edit_num_Dog.Text;
    DM.StProc.ParamByName('ID_MAN').AsInt64      := ViewForm.ID_MAN;
    DM.StProc.ParamByName('IS_MAIN').AsInteger   := 1;
    if ViewForm.RadioButton_fiz.Checked
     then DM.StProc.ParamByName('IS_FIZ').AsInteger    := 1
     else DM.StProc.ParamByName('IS_FIZ').AsInteger    := 0;
    DM.StProc.ExecProc;
    ID_DOG := DM.StProc.FieldByName('ID_DOG').AsInt64;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_Living.Open;
    if not ViewForm.MemoryData_Living.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_LIVING_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_Living.First;
      for i := 0 to ViewForm.MemoryData_Living.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64 := ID_DOG;
        DM.StProc.ParamByName('ID_MAN').AsInt64 := ViewForm.MemoryData_Living['MemoryData_Living_ID_MAN'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_Living.Next;
       End;
     End;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_Kat.Open;
    if not ViewForm.MemoryData_Kat.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_KAT_SUM_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_Kat.First;
      for i := 0 to ViewForm.MemoryData_Kat.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64     := ID_DOG;
        DM.StProc.ParamByName('ID_KAT_SUM').AsInt64 := ViewForm.MemoryData_Kat['MemoryData_KAT_ID_KAT_SUM'];
        DM.StProc.ParamByName('DATE_BEG').AsDate    := ViewForm.MemoryData_Kat['MemoryData_KAT_DATE_BEG'];
        DM.StProc.ParamByName('DATE_END').AsDate    := ViewForm.MemoryData_Kat['MemoryData_KAT_DATE_END'];
        DM.StProc.ParamByName('beg_in').AsInteger      := ViewForm.MemoryData_Kat['MemoryData_KatBeg'];
        DM.StProc.ParamByName('end_in').AsInteger      := ViewForm.MemoryData_Kat['MemoryData_KatEnd'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_Kat.Next;
       End;
     End;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_Subsidy.Open;
    if not ViewForm.MemoryData_Subsidy.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_SUBSIDY_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_Subsidy.First;
      for i := 0 to ViewForm.MemoryData_Subsidy.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64     := ID_DOG;
        DM.StProc.ParamByName('ID_SUBSIDY').AsInt64 := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_ID_SUBSIDY'];
        DM.StProc.ParamByName('DATE_BEG').AsDate    := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_DATE_BEG'];
        DM.StProc.ParamByName('DATE_END').AsDate    := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_DATE_END'];
        DM.StProc.ParamByName('SUMMA').AsFloat      := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_SUMMA'];
        if ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_COMMENTS'] <> null
         then DM.StProc.ParamByName('COMMENTS').AsString  := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_COMMENTS']
         else DM.StProc.ParamByName('COMMENTS').AsString  := '';
        DM.StProc.ExecProc;
        ViewForm.MemoryData_Subsidy.Next;
       End;
     End;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_lgots.Open;
    if not ViewForm.MemoryData_lgots.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_LGOT_SUM_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_lgots.First;
      for i := 0 to ViewForm.MemoryData_lgots.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64      := ID_DOG;
        DM.StProc.ParamByName('ID_lgot_SUM').AsInt64 := ViewForm.MemoryData_lgots['MemoryData_lgots_ID_lgot_SUM'];
        DM.StProc.ParamByName('DATE_BEG').AsDate     := ViewForm.MemoryData_lgots['MemoryData_lgots_DATE_BEG'];
        DM.StProc.ParamByName('DATE_END').AsDate     := ViewForm.MemoryData_lgots['MemoryData_lgots_DATE_END'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_lgots.Next;
       End;
     End;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_EntryRest.Open;
    if not ViewForm.MemoryData_EntryRest.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_ENTRYREST_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_EntryRest.First;
      for i := 0 to ViewForm.MemoryData_EntryRest.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64    := ID_DOG;
        DM.StProc.ParamByName('ID_SMETA').AsInt64  := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_SMETA'];
        DM.StProc.ParamByName('ID_RAZDEL').AsInt64 := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_RAZDEL'];
        DM.StProc.ParamByName('ID_STAT').AsInt64   := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_STAT'];
        DM.StProc.ParamByName('ID_KEKV').AsInt64   := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_KEKV'];
        DM.StProc.ParamByName('SUMMA').AsFloat     := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_SUMMA'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_EntryRest.Next;
       End;
     End; 

    try
     DM.WriteTransaction.Commit;
     except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
    end;
    DM.DataSet.Close;
    DM.DataSet.Open;
    DM.DataSet.Locate('ID_DOG', ID_DOG, []);
   end;
  ViewForm.Free;
end;

procedure TfrmReestr_main.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmReestr_main.FormShow(Sender: TObject);

begin
  Dog_Filter_edit.SetFocus;
end;

procedure TfrmReestr_main.DataSetAfterOpen(DataSet: TDataSet);
begin
  if DM.DataSet.RecordCount = 0 then Exit;

  Label_FIO.Caption     := uConsts.bs_grid_FIO_Column[PLanguageIndex] + ':';
  Label_num_dog.Caption := uConsts.bs_grid_Num_Dog_Column[PLanguageIndex] + ':';
  Label_status.Caption  := bs_Status_Dog_Label[PLanguageIndex] + ':';
  Label_Main.Caption    := bs_Type_Dog_Label[PLanguageIndex] + ':';

  if DM.DataSet['UKR_FIO_UPPER'] <> null then Label_FIO.caption := Label_FIO.caption + ' ' + DM.DataSet['UKR_FIO_UPPER'];
  if DM.DataSet['NUM_DOG'] <> null then Label_num_dog.caption := Label_num_dog.caption + ' ' + DM.DataSet['NUM_DOG'] ;
  if DM.DAtaSet['IS_DISS'] <> null then
   if DM.DAtaSet['IS_DISS'] = 0
    then Label_Status.caption := Label_Status.caption + ' ' + uConsts.bs_grid_IsNotDiss_Column[PLanguageIndex]
    else Label_Status.caption := Label_Status.caption + ' ' + uConsts.bs_grid_IsDiss_Column[PLanguageIndex];
  if DM.DAtaSet['IS_MAIN'] <> null then
   if DM.DAtaSet['IS_MAIN'] = 1
    then Label_main.caption := Label_main.caption + ' ' + bs_Basic_Dog_Label[PLanguageIndex]
    else Label_main.caption := Label_main.caption + ' ' + bs_Addit_Dog_Label[PLanguageIndex];
end;

procedure TfrmReestr_main.DataSetAfterScroll(DataSet: TDataSet);
begin
  if DM.DataSet.RecordCount = 0 then exit;

  Label_FIO.Caption     := uConsts.bs_grid_FIO_Column[PLanguageIndex] + ':';
  Label_num_dog.Caption := uConsts.bs_grid_Num_Dog_Column[PLanguageIndex] + ':';
  Label_status.Caption  := bs_Status_Dog_Label[PLanguageIndex] + ':';
  Label_Main.Caption    := bs_Type_Dog_Label[PLanguageIndex] + ':';

  if DM.DataSet['UKR_FIO_UPPER'] <> null then Label_FIO.caption := Label_FIO.caption + ' ' + DM.DataSet['UKR_FIO_UPPER'];
  if DM.DataSet['NUM_DOG'] <> null then Label_num_dog.caption := Label_num_dog.caption + ' ' + DM.DataSet['NUM_DOG'] ;
  if DM.DAtaSet['IS_DISS'] <> null then
   if DM.DAtaSet['IS_DISS'] = 0
    then Label_Status.caption := Label_Status.caption + ' ' + uConsts.bs_grid_IsNotDiss_Column[PLanguageIndex]
    else Label_Status.caption := Label_Status.caption + ' ' + uConsts.bs_grid_IsDiss_Column[PLanguageIndex];
  if DM.DAtaSet['IS_MAIN'] <> null then
   if DM.DAtaSet['IS_MAIN'] = 1
    then Label_main.caption := Label_main.caption + ' ' + bs_Basic_Dog_Label[PLanguageIndex]
    else Label_main.caption := Label_main.caption + ' ' + bs_Addit_Dog_Label[PLanguageIndex];
end;

procedure TfrmReestr_main.RefreshButtonClick(Sender: TObject);
begin
  Progress.Position:=11;
  Progress.Update;

  Screen.Cursor:=crSQLWait;

  DM.DataSet.Close;
  DM.DataSet.Open;

  DsetRecordCount.Caption:=   uConsts.bs_DSetRecordCount[PLanguageIndex];
  DsetRecordCount.Caption:=   DsetRecordCount.Caption + inttostr(Dm.DataSet.RecordCount);
  Progress.Position:=40;
  Progress.Update;

  Progress.Position:=Progress.Properties.Max;
  Progress.Update;
  Progress.Properties.Max:=100;
  Progress.Position:=100;

  Screen.Cursor:=crDefault;
end;

procedure TfrmReestr_main.ButtonDeleteClick(Sender: TObject);
var
  i : Byte;
begin
  If not Is_Admin then
   If (fibCheckPermission('/ROOT/bs/bs_REESTR_DOG','DEL') <> 0) then
    Begin
     messagebox(handle,
     pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
     +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
     pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    End;

  if Grid_Reestr_mainDBTableView1.DataController.RecordCount = 0 then exit;

  i:= uCommon_Messages.bsShowMessage(uConsts.bs_Confirmation_Caption[PLanguageIndex], uConsts.bs_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

  DM.StProc.StoredProcName := 'bs_DT_DOG_DELETE';
  DM.WriteTransaction.StartTransaction;
  DM.StProc.Prepare;
  DM.StProc.ParamByName('ID_DOG').AsInt64  := DM.DataSet['ID_DOG'];
  DM.StProc.ExecProc;
  try
   DM.WriteTransaction.Commit;
   except
    on E:Exception do
     begin
      LogException;
      bsShowMessage('Error',e.Message,mtError,[mbOK]);
      DM.WriteTransaction.Rollback;
      raise;
     end;
  end;
  RefreshButtonClick(self);
end;

procedure TfrmReestr_main.EditClick(aPageIndex : integer );
var
  ViewForm : TfrmReestr_AE;
  i : Integer;
  ID_DOG : Int64;
begin
  If Grid_Reestr_mainDBTableView1.DataController.RecordCount = 0 then Exit;

  ViewForm := TfrmReestr_AE.Create(self, DM.DB.Handle, is_admin, aPageIndex);

  ViewForm.ID_DOG := DM.DataSet['ID_DOG'];
  ViewForm.ID_Man := DM.DataSet['ID_MAN'];
  ViewForm.DateEdit_Date_Reg.EditValue := DM.DataSet['date_reg'];
  ViewForm.DateEdit_Date_Beg.EditValue := DM.DataSet['date_Beg'];
  ViewForm.DateEdit_Date_End.EditValue := DM.DataSet['date_End'];
  ViewForm.Edit_num_Dog.EditValue := DM.DataSet['NUM_DOG'];
  ViewForm.Payer_Edit.EditValue := DM.DataSet['ukr_fio_upper'];
  If DM.DataSet['is_fiz']<>null then
   if DM.DataSet['is_fiz'] = 1
    then ViewForm.RadioButton_fiz.Checked := True
    else ViewForm.RadioButton_jur.Checked := True;
  If DM.DataSet['RATE_ACCOUNT'] <> null then ViewForm.RasSchet_Edit.EditValue := DM.DataSet['RATE_ACCOUNT'];
  If DM.DataSet['MFO'] <> null then ViewForm.MFO_Edit.EditValue := DM.DataSet['MFO'];

  ViewForm.is_edit := 1;
  ViewForm.Caption        := uConsts.bs_EditBtn_Caption[PLanguageIndex];
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrOk then
   Begin
    DM.StProc.StoredProcName := 'bs_DT_DOG_UPDATE';
    DM.WriteTransaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('ID_DOG').AsInt64      := DM.DataSet['ID_DOG'];
    DM.StProc.ParamByName('date_reg').AsDateTime := ViewForm.DateEdit_Date_Reg.EditValue;
    DM.StProc.ParamByName('date_beg').AsDate     := ViewForm.DateEdit_Date_Beg.EditValue;;
    DM.StProc.ParamByName('date_end').AsDate     := ViewForm.DateEdit_Date_End.EditValue;;
    DM.StProc.ParamByName('num_dog').AsString    := ViewForm.Edit_num_Dog.Text;
    DM.StProc.ParamByName('ID_MAN').AsInt64      := ViewForm.ID_MAN;
    DM.StProc.ParamByName('IS_MAIN').AsInteger   := 1;
    if ViewForm.RadioButton_fiz.Checked
     then DM.StProc.ParamByName('IS_FIZ').AsInteger    := 1
     else DM.StProc.ParamByName('IS_FIZ').AsInteger    := 0;
    DM.StProc.ExecProc;

    //--------------------------------------------------------------------------
    if Not ViewForm.MemoryData_Living.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_LIVING_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_Living.First;
      for i := 0 to ViewForm.MemoryData_Living.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64 := DM.DataSet['ID_DOG'];
        DM.StProc.ParamByName('ID_MAN').AsInt64 := ViewForm.MemoryData_Living['MemoryData_Living_ID_MAN'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_Living.Next;
       End;
     End;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_Kat.Open;
    if not ViewForm.MemoryData_Kat.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_KAT_SUM_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_Kat.First;
      for i := 0 to ViewForm.MemoryData_Kat.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64     := DM.DataSet['ID_DOG'];
        DM.StProc.ParamByName('ID_KAT_SUM').AsInt64 := ViewForm.MemoryData_Kat['MemoryData_KAT_ID_KAT_SUM'];
        DM.StProc.ParamByName('DATE_BEG').AsDate    := ViewForm.MemoryData_Kat['MemoryData_KAT_DATE_BEG'];
        DM.StProc.ParamByName('DATE_END').AsDate    := ViewForm.MemoryData_Kat['MemoryData_KAT_DATE_END'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_Kat.Next;
       End;
     End;

     //--------------------------------------------------------------------------
    ViewForm.MemoryData_Subsidy.Open;
    if not ViewForm.MemoryData_Subsidy.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_SUBSIDY_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_Subsidy.First;
      for i := 0 to ViewForm.MemoryData_Subsidy.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64     := DM.DataSet['ID_DOG'];
        DM.StProc.ParamByName('ID_SUBSIDY').AsInt64 := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_ID_SUBSIDY'];
        DM.StProc.ParamByName('DATE_BEG').AsDate    := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_DATE_BEG'];
        DM.StProc.ParamByName('DATE_END').AsDate    := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_DATE_END'];
        DM.StProc.ParamByName('SUMMA').AsFloat      := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_SUMMA'];
        if ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_COMMENTS'] <> null
         then DM.StProc.ParamByName('COMMENTS').AsString  := ViewForm.MemoryData_Subsidy['MemoryData_SUBSIDY_COMMENTS']
         else DM.StProc.ParamByName('COMMENTS').AsString  := '';
        DM.StProc.ExecProc;
        ViewForm.MemoryData_Subsidy.Next;
       End;
     End;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_lgots.Open;
    if not ViewForm.MemoryData_lgots.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_LGOT_SUM_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_lgots.First;
      for i := 0 to ViewForm.MemoryData_lgots.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64      := DM.DataSet['ID_DOG'];
        DM.StProc.ParamByName('ID_lgot_SUM').AsInt64 := ViewForm.MemoryData_lgots['MemoryData_lgots_ID_lgot_SUM'];
        DM.StProc.ParamByName('DATE_BEG').AsDate     := ViewForm.MemoryData_lgots['MemoryData_lgots_DATE_BEG'];
        DM.StProc.ParamByName('DATE_END').AsDate     := ViewForm.MemoryData_lgots['MemoryData_lgots_DATE_END'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_lgots.Next;
       End;
     End;

    //--------------------------------------------------------------------------
    ViewForm.MemoryData_EntryRest.Open;
    if not ViewForm.MemoryData_EntryRest.IsEmpty then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_ENTRYREST_INS';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;

      ViewForm.MemoryData_EntryRest.First;
      for i := 0 to ViewForm.MemoryData_EntryRest.RecordCount - 1 do
       Begin
        DM.StProc.ParamByName('ID_DOG').Asint64    := DM.DataSet['ID_DOG'];
        DM.StProc.ParamByName('ID_SMETA').AsInt64  := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_SMETA'];
        DM.StProc.ParamByName('ID_RAZDEL').AsInt64 := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_RAZDEL'];
        DM.StProc.ParamByName('ID_STAT').AsInt64   := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_STAT'];
        DM.StProc.ParamByName('ID_KEKV').AsInt64   := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_ID_KEKV'];
        DM.StProc.ParamByName('SUMMA').AsFloat     := ViewForm.MemoryData_EntryRest['MemoryData_EntryRest_SUMMA'];
        DM.StProc.ExecProc;
        ViewForm.MemoryData_EntryRest.Next;
       End;
     End;

    try
     DM.WriteTransaction.Commit;
     except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.WriteTransaction.Rollback;
        raise;
       end;
    end;
    ID_DOG := DM.DataSet['ID_DOG'];
    DM.DataSet.Close;
    DM.DataSet.Open;
    DM.DataSet.Locate('ID_DOG', ID_DOG, []);
   end;
  ViewForm.Free;
end;

procedure TfrmReestr_main.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin
  if ((AViewInfo.GridRecord.Values[9]= 1) and (not AViewInfo.GridRecord.Focused ))
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00AEA4DF;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[9]= 1) and (AViewInfo.GridRecord.Focused ))
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$007968CA;
      ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[8]= 1) and  (not AViewInfo.GridRecord.Focused ) )
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00F2F2F2;
      ACanvas.Canvas.FillRect(Arect);
   end;

  if ((AViewInfo.GridRecord.Values[8]= 1) and  (AViewInfo.GridRecord.Focused ))
  then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00D6D6D6;
      ACanvas.Font.Color:= clBlack ;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TfrmReestr_main.ButtonPrintClick(Sender: TObject);
begin
;
end;

procedure TfrmReestr_main.Dog_Filter_editEnter(Sender: TObject);
begin
  if Dog_Filter_Edit.Text = uConsts.bs_FilterText[PLanguageIndex]
   then Dog_Filter_Edit.Text:= '';
end;

procedure TfrmReestr_main.Dog_Filter_editKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  wf:TForm;
  FIO_Search : string;
  Len_FIO, p : Integer;
begin
  if Dog_Filter_Edit.Text = '' then exit;
  if key = vk_return then
   begin
    Screen.Cursor := crHourGlass;

    Progress.Position:=11;
    Progress.Update;

    wf:=ShowWaitForm(self,wfLoadPackage);

    DM.DataSet.Close;

    FIO_Search := Dog_Filter_edit.text;
    Len_FIO:=length(FIO_Search);
    p:=1;
    while p<=len_FIO do
     Begin
      If FIO_Search[p]=' ' then
                            Begin
                             Insert('%',FIO_Search,p);
                             p:=p+1;
                             Len_fio:=len_fio+1;
                            End;
      p:=p+1;
     End;
    DM.DataSet.SelectSQL.Text:= 'select * from bs_DT_DOG_FILTER('+
                             ''''+
                             uCommon_Funcs.UpperCaseRusUkr(FIO_Search)
                             + ''''+',';
    if FiltrByFIO_RadioButton.Checked
     then DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '1';
    if FiltrByNum_RadioButton.Checked
     then DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '2';
    if FiltrByKod_RadioButton.Checked
     then DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '3';

    DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + ')';

    DM.DataSet.Open;

    Progress.Position:=40;
    Progress.Update;

    Progress.Position:=Progress.Properties.Max;
    Progress.Update;
    Progress.Properties.Max:=100;
    Progress.Position:=100;

    Screen.Cursor := crDefault;

    DsetRecordCount.Caption := uConsts.bs_DSetRecordCount[PLanguageIndex];
    DsetRecordCount.Caption := DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
    CloseWaitForm(wf);
    Grid_Reestr_main.SetFocus;
   end;
end;

procedure TfrmReestr_main.Dog_Filter_editKeyPress(Sender: TObject;
  var Key: Char);
  function CtrlPressed():boolean;
   begin
    result:= HiWord(GetAsyncKeyState(VK_CONTROL))>0;       //Зажат ли
   end;
begin
  If key = #13 then Grid_Reestr_main.SetFocus;
  If (CtrlPressed) then Exit;

  If ( ((key <> #8) and (key <> '/')) and (key <> '-')) then
   If not IntegerCheck(Key)
    then FiltrByFIO_RadioButton.Checked := True
    else FiltrByNum_RadioButton.Checked := True;

end;

procedure TfrmReestr_main.Dog_Filter_editKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Dog_Filter_Edit.Text = '' then Exit;

  If ((IntegerCheck(Dog_Filter_Edit.Text))and (Length(Dog_Filter_Edit.Text) = 10))
   then FiltrByKod_RadioButton.Checked := True
   else
    If not IntegerCheck(Dog_Filter_Edit.Text[1])
     then FiltrByFIO_RadioButton.Checked := True
     else FiltrByNum_RadioButton.Checked := true;
end;

procedure TfrmReestr_main.SearchButtonClick(Sender: TObject);
var
  ss: TShiftState;
  key : Word;
begin
  Dog_Filter_Edit.SetFocus;
  ss:=[ssShift] ;
  key :=13;
  Dog_Filter_EditKeyDown(self, key, ss);
  Grid_Reestr_main.SetFocus;
end;

procedure TfrmReestr_main.Button_CommentClick(Sender: TObject);
Var
  ViewForm : Tfrm_comments;
begin
  if Grid_Reestr_mainDBTableView1.DataController.RecordCount = 0 then Exit;

  ViewForm := Tfrm_comments.create(self);

  ViewForm.aHandle := DM.DB.Handle;
  ViewForm.is_admin := is_admin;
  ViewForm.id_dog := DM.DataSet['ID_DOG'];

  ViewForm.ShowModal;
  ViewForm.Free;
end;

procedure TfrmReestr_main.ButtonDogOrdersClick(Sender: TObject);
var
  AParameter:TbsSimpleParamsEx;
begin
  if Grid_Reestr_mainDBTableView1.DataController.RecordCount = 0 then Exit;

  AParameter := TbsSimpleParamsEx.Create;
  AParameter.Owner := self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle := fsNormal;
  AParameter.WaitPakageOwner := self;
  AParameter.is_admin := is_admin;
  AParameter.bsParamsToPakage.ID_DOG := DM.DataSet['ID_DOG'];
  RunFunctionFromPackage(AParameter, 'bs\bs_DogOrders.bpl','ShowDogOrders');
  AParameter.Free;
end;

procedure TfrmReestr_main.ButtonDogLgotsClick(Sender: TObject);
begin
  EditClick(3);
end;

procedure TfrmReestr_main.ButtonDogEnteryRestClick(Sender: TObject);
begin
  EditClick(5);
end;

procedure TfrmReestr_main.ButtonEditClick(Sender: TObject);
begin
  If (not Is_Admin) then
   If fibCheckPermission('/ROOT/bs/bs_REESTR_DOG','EDIT') <> 0 then
    Begin
     messagebox(handle,
     pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
     +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
     pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    End;

  EditClick(0);
end;

procedure TfrmReestr_main.Grid_Reestr_mainDBTableView1DblClick(
  Sender: TObject);
begin
  If (not Is_Admin) then
   If fibCheckPermission('/ROOT/bs/bs_REESTR_DOG','EDIT') <> 0 then
    Begin
     messagebox(handle,
     pchar(uConsts_Messages.bs_NotHaveRights[PLanguageIndex]
     +#13+ uConsts_Messages.bs_GoToAdmin[PLanguageIndex]),
     pchar(uConsts_Messages.bs_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    End;

  EditClick(0);
end;

procedure TfrmReestr_main.Grid_Reestr_mainDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  aRect :TRect;
begin
  if Grid_Reestr_mainDBTableView1.DataController.RecordCount = 0 then exit;

  if ((vartostr(AViewInfo.GridRecord.Values[5]) = '0') and (not AViewInfo.GridRecord.Focused )) then
   begin
      aRect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:= clInfoBk;  //$00EBCBA0;//$00C0CFDC;
      ACanvas.Canvas.FillRect(Arect);
   end;

  if ((vartostr(AViewInfo.GridRecord.Values[5]) = '0') and (AViewInfo.GridRecord.Focused )) then
   begin
      aRect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:= $00B3FFFF; //$00DCA356; //$0096AEC5;
      ACanvas.Font.Color:= clWindowText ;
      ACanvas.Canvas.FillRect(Arect);
   end;

  if ((vartostr(AViewInfo.GridRecord.Values[6]) = '1') and  (not AViewInfo.GridRecord.Focused )) then
   begin
      aRect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00F2EFEC;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((vartostr(AViewInfo.GridRecord.Values[6]) = '1') and (AViewInfo.GridRecord.Focused )) then
   begin
      aRect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$00B7B7B7;
      ACanvas.Canvas.FillRect(Arect);
   end;
end;

procedure TfrmReestr_main.Button_Diss_DogClick(Sender: TObject);
var
  ViewForm : TfrmReestr_DissDog;
begin
  If DM.DataSet.RecordCount = 0 then Exit;

  If DM.DataSet['IS_DISS'] = 1 then
   begin
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Text := 'Select * from bs_dt_dog_diss_info_sel(:id_dog)';
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64 := DM.DataSet['ID_DOG'];
    DM.ReadDataSet.Open;

    ViewForm := TfrmReestr_DissDog.Create(self, DM.DB.Handle, is_admin);
    if DM.ReadDataSet['DATE_DISS']      <> null then ViewForm.DateDiss.EditValue      := DM.ReadDataSet['DATE_DISS'];
    if DM.ReadDataSet['ORDER_DATE']     <> null then ViewForm.OrderDate.EditValue     := DM.ReadDataSet['ORDER_DATE'];
    if DM.ReadDataSet['ORDER_NUM']      <> null then ViewForm.OrderNum_Edit.EditValue := DM.ReadDataSet['ORDER_NUM'];
    if DM.ReadDataSet['name_type_diss'] <> null then ViewForm.TypeDiss_Edit.EditText  := DM.ReadDataSet['name_type_diss'];
    if DM.ReadDataSet['id_type_diss']   <> null then ViewForm.ID_TYPE_DISS            := DM.ReadDataSet['id_type_diss'];
    if DM.ReadDataSet['comments']       <> null then ViewForm.Comments_Edit.EditValue := DM.ReadDataSet['comments'];
    ViewForm.ShowModal;

    if ViewForm.ModalResult = mrOk then
     Begin
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName := 'bs_DT_DOG_DISS_INFO_UPD';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('id_dog_diss').AsInt64  := DM.ReadDataSet['id_dog_diss'];
      DM.StProc.ParamByName('id_type_diss').Asint64 := ViewForm.ID_TYPE_DISS;
      DM.StProc.ParamByName('date_diss').AsDate     := ViewForm.DateDiss.EditValue;
      DM.StProc.ParamByName('order_date').AsDate    := ViewForm.OrderDate.EditValue;
      DM.StProc.ParamByName('order_num').AsString   := ViewForm.OrderNum_Edit.EditValue;
      if ViewForm.Comments_Edit.Text <> ''
       then DM.StProc.ParamByName('comments').AsString := ViewForm.Comments_Edit.EditValue
       else DM.StProc.ParamByName('comments').AsString := '---';
      DM.StProc.ExecProc;
      try
       DM.StProc.Transaction.Commit;
       except
        on E:Exception do
         begin
          LogException;
          bsShowMessage('Error',e.Message,mtError,[mbOK]);
          DM.StProc.Transaction.Rollback;
          raise;
         end;
      end;
     end;
    ViewForm.Free;
   End;

  If DM.DataSet['IS_DISS'] = 0 then
   begin
    ViewForm := TfrmReestr_DissDog.Create(self, DM.DB.Handle, is_admin);
    ViewForm.ShowModal;

    if ViewForm.ModalResult = mrOk then
     Begin
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName := 'bs_DT_DOG_DISS_INFO_INS';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('id_type_diss').Asint64 := ViewForm.ID_TYPE_DISS;
      DM.StProc.ParamByName('id_Dog').Asint64       := DM.DataSet['ID_DOG'];
      DM.StProc.ParamByName('ID_ORDER').Asint64     := ViewForm.ID_ORDER;
      DM.StProc.ParamByName('date_diss').AsDate     := ViewForm.DateDiss.EditValue;
      DM.StProc.ParamByName('order_date').AsDate    := ViewForm.OrderDate.EditValue;
      DM.StProc.ParamByName('order_num').AsString   := ViewForm.OrderNum_Edit.EditValue;
      if ViewForm.Comments_Edit.Text <> ''
       then DM.StProc.ParamByName('comments').AsString := ViewForm.Comments_Edit.EditValue
       else DM.StProc.ParamByName('comments').AsString := '---';
      DM.StProc.ExecProc;
      try
       DM.StProc.Transaction.Commit;
       except
        on E:Exception do
         begin
          LogException;
          bsShowMessage('Error',e.Message,mtError,[mbOK]);
          DM.StProc.Transaction.Rollback;
          raise;
         end;
      end;
     end;
    ViewForm.Free;

    DM.DataSet.AfterScroll := nil;
    DM.DataSet.SQLs.UpdateSQL.Text:='execute procedure bs_empty_proc';
    DM.DataSet.RefreshSQL.Text := 'Select * From bs_DT_DOG_SELECT where id_dog = ' + IntToStr(DM.DataSet['ID_DOG']);
    DM.DataSet.Edit;
    DM.DataSet.Post;
   End
end;

procedure TfrmReestr_main.Button_Reload_DogClick(Sender: TObject);
var
  ViewFormDiss   : TfrmReestr_DissDog;
  ViewFormReload : TfrmReestr_AE;
  Num_Dog        : String;
  ID_DOG         : int64;
  i              : Integer;
begin
  If Grid_Reestr_mainDBTableView1.DataController.RecordCount = 0 then Exit;

  If DM.DataSet['IS_DISS'] = 0 then
   begin
    ViewFormDiss := TfrmReestr_DissDog.Create(self, DM.DB.Handle, is_admin);
    ViewFormDiss.ShowModal;

    if ViewFormDiss.ModalResult = mrOk then
     Begin
      DM.StProc.Transaction.StartTransaction;
      DM.StProc.StoredProcName := 'bs_DT_DOG_DISS_INFO_INS';
      DM.StProc.Prepare;
      DM.StProc.ParamByName('id_type_diss').Asint64 := ViewFormDiss.ID_TYPE_DISS;
      DM.StProc.ParamByName('id_Dog').Asint64       := DM.DataSet['ID_DOG'];
      DM.StProc.ParamByName('ID_ORDER').Asint64     := ViewFormDiss.ID_ORDER;
      DM.StProc.ParamByName('date_diss').AsDate     := ViewFormDiss.DateDiss.EditValue;
      DM.StProc.ParamByName('order_date').AsDate    := ViewFormDiss.OrderDate.EditValue;
      DM.StProc.ParamByName('order_num').AsString   := ViewFormDiss.OrderNum_Edit.EditValue;
      if ViewFormDiss.Comments_Edit.Text <> ''
       then DM.StProc.ParamByName('comments').AsString := ViewFormDiss.Comments_Edit.EditValue
       else DM.StProc.ParamByName('comments').AsString := '---';
      DM.StProc.ExecProc;

      try
       DM.StProc.Transaction.Commit;
       except
        on E:Exception do
         begin
          LogException;
          bsShowMessage('Error',e.Message,mtError,[mbOK]);
          DM.StProc.Transaction.Rollback;
          raise;
         end;
      end;

      DM.DataSet.AfterScroll         := nil;
      DM.DataSet.SQLs.UpdateSQL.Text := 'execute procedure bs_empty_proc';
      DM.DataSet.RefreshSQL.Text     := 'Select * From bs_DT_DOG_SELECT where id_dog = ' + IntToStr(DM.DataSet['ID_DOG']);
      DM.DataSet.Edit;
      DM.DataSet.Post;
     end;
     
    ViewFormDiss.Free; 
   End;
   
//------------------------------------------------------------------------------
  If DM.DataSet['IS_DISS'] = 1 then
   begin
    DM.StProc.Transaction.StartTransaction;
    DM.StProc.StoredProcName := 'bs_INI_DOG_NUMBER_GET';
    DM.StProc.ParamByName('DATE_YEAR').AsDate := DM.CURRENT_DATE;
    DM.StProc.ExecProc;
    Num_Dog := DM.StProc.FieldByName('NUM_DOG').AsString;

    try
     DM.StProc.Transaction.Commit;
     except
      on E:Exception do
       begin
        LogException;
        bsShowMessage('Error',e.Message,mtError,[mbOK]);
        DM.StProc.Transaction.Rollback;
        raise;
       end;
    end;

    //--------------------------------------------------------------------------
    ViewFormReload := TfrmReestr_AE.Create(self, DM.DB.Handle, is_admin, 0);

    ViewFormReload.ID_DOG := -1;
    ViewFormReload.ID_Man := DM.DataSet['ID_MAN'];
    ViewFormReload.DateEdit_Date_Reg.EditValue := DM.CURRENT_DATE;
    ViewFormReload.DateEdit_Date_Beg.EditValue := DM.CURRENT_DATE;
    if DM.DataSet['Date_End'] < DM.CURRENT_DATE
     then ViewFormReload.DateEdit_Date_End.EditValue := DM.MAX_TIMESTAMP
     else ViewFormReload.DateEdit_Date_End.EditValue := DM.DataSet['date_End'];
    ViewFormReload.Edit_num_Dog.EditValue := NUM_DOG;
    ViewFormReload.Payer_Edit.EditValue := DM.DataSet['ukr_fio_upper'];
    If DM.DataSet['is_fiz']<>null then
     if DM.DataSet['is_fiz'] = 1
      then ViewFormReload.RadioButton_fiz.Checked := True
      else ViewFormReload.RadioButton_jur.Checked := True;
    If DM.DataSet['RATE_ACCOUNT'] <> null then ViewFormReload.RasSchet_Edit.EditValue := DM.DataSet['RATE_ACCOUNT'];
    If DM.DataSet['MFO'] <> null then ViewFormReload.MFO_Edit.EditValue := DM.DataSet['MFO'];


    ViewFormReload.Caption := bs_Upload_Caption[PLanguageIndex];

    ID_DOG := DM.DataSet['ID_DOG'];
    //------------------------------------------------------------------------
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_LIVING_SEL(:ID_DOG)';
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;
    DM.ReadDataSet.First;

    ViewFormReload.MemoryData_Living.Open;
    For i := 0 to DM.ReadDataSet.RecordCount-1 do
     Begin
      ViewFormReload.MemoryData_Living.Insert;
      ViewFormReload.MemoryData_Living.FieldByName('MemoryData_Living_id_man').AsInteger     := DM.ReadDataSet['ID_Man'];
      ViewFormReload.MemoryData_Living.FieldByName('MemoryData_Living_DateBirth').AsDateTime := DM.ReadDataSet['date_birth'];
      ViewFormReload.MemoryData_Living.FieldByName('MemoryData_Living_FIO').AsString         := DM.ReadDataSet['ukr_Fio_upper'];
      ViewFormReload.MemoryData_Living.Post;
      DM.ReadDataSet.Next;
     end;

    //--------------------------------------------------------------------------
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_KAT_SUM_SEL(:ID_DOG)';
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;
    DM.ReadDataSet.First;

    ViewFormReload.MemoryData_Kat.Open;
    For i := 0 to DM.ReadDataSet.RecordCount-1 do
     Begin
      if DM.ReadDataSet['DATE_END'] >= DM.CURRENT_DATE then
       Begin
        ViewFormReload.MemoryData_kat.Insert;
        ViewFormReload.MemoryData_kat.FieldByName('MemoryData_kat_id_kat_sum').AsInteger := DM.ReadDataSet['ID_KAT_SUM'];
        ViewFormReload.MemoryData_kat.FieldByName('MemoryData_kat_id_kat').AsInteger     := DM.ReadDataSet['ID_KAT'];
        ViewFormReload.MemoryData_kat.FieldByName('MemoryData_kat_Name').AsString        := DM.ReadDataSet['NAME_KAT'];
        if DM.ReadDataSet['DATE_BEG']< DM.CURRENT_DATE
         then ViewFormReload.MemoryData_kat.FieldByName('MemoryData_kat_date_beg').AsDateTime  := DM.CURRENT_DATE
         else ViewFormReload.MemoryData_kat.FieldByName('MemoryData_kat_date_beg').AsDateTime  := DM.ReadDataSet['DATE_BEG'];
        ViewFormReload.MemoryData_kat.FieldByName('MemoryData_kat_date_end').AsDateTime  := DM.ReadDataSet['DATE_END'];
        ViewFormReload.MemoryData_kat.FieldByName('MemoryData_kat_summa').AsFloat        := DM.ReadDataSet['SUMMA'];
        ViewFormReload.MemoryData_kat.Post;
       end;
      DM.ReadDataSet.Next;
     end;

    //--------------------------------------------------------------------------
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_SUBSIDY_SEL(:ID_DOG)';
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;
    DM.ReadDataSet.First;

    ViewFormReload.MemoryData_Subsidy.Open;
    For i := 0 to DM.ReadDataSet.RecordCount-1 do
     Begin
      if DM.ReadDataSet['DATE_END']>= DM.CURRENT_DATE then
       Begin
        ViewFormReload.MemoryData_Subsidy.Insert;
        ViewFormReload.MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_Id_subsidy').AsInteger := DM.ReadDataSet['ID_SUBSIDY'];
        ViewFormReload.MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_NAME').AsString        := DM.ReadDataSet['NAME_SUBSIDY'];
        if DM.ReadDataSet['DATE_BEG']< DM.CURRENT_DATE
         then ViewFormReload.MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_BEG').AsDateTime  := DM.CURRENT_DATE
         else ViewFormReload.MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_BEG').AsDateTime  := DM.ReadDataSet['DATE_BEG'];
        ViewFormReload.MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_DATE_END').AsDateTime  := DM.ReadDataSet['DATE_END'];
        ViewFormReload.MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_SUMMA').AsFloat        := DM.ReadDataSet['SUMMA'];
        ViewFormReload.MemoryData_Subsidy.FieldByName('MemoryData_Subsidy_COMMENTS').AsString    := DM.ReadDataSet['COMMENTS'];
        ViewFormReload.MemoryData_Subsidy.Post;
       End;
      DM.ReadDataSet.Next;
     end;

    //--------------------------------------------------------------------------
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_LGOT_SUM_SEL(:ID_DOG)';
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;
    DM.ReadDataSet.First;

    ViewFormReload.MemoryData_lgots.Open;
    For i := 0 to DM.ReadDataSet.RecordCount-1 do
     Begin
      if DM.ReadDataSet['DATE_END']>= DM.CURRENT_DATE then
       Begin
        ViewFormReload.MemoryData_lgots.Insert;
        ViewFormReload.MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot_sum').AsInteger := DM.ReadDataSet['ID_lgot_SUM'];
        ViewFormReload.MemoryData_lgots.FieldByName('MemoryData_lgots_id_lgot').AsInteger     := DM.ReadDataSet['ID_lgot'];
        ViewFormReload.MemoryData_lgots.FieldByName('MemoryData_lgots_Name').AsString         := DM.ReadDataSet['NAME_lgot'];
        if DM.ReadDataSet['DATE_BEG']< DM.CURRENT_DATE
         then ViewFormReload.MemoryData_lgots.FieldByName('MemoryData_lgots_date_beg').AsDateTime   := DM.CURRENT_DATE
         else ViewFormReload.MemoryData_lgots.FieldByName('MemoryData_lgots_date_beg').AsDateTime   := DM.ReadDataSet['DATE_BEG'];
        ViewFormReload.MemoryData_lgots.FieldByName('MemoryData_lgots_date_end').AsDateTime   := DM.ReadDataSet['DATE_END'];
        ViewFormReload.MemoryData_lgots.FieldByName('MemoryData_lgots_procent').AsFloat       := DM.ReadDataSet['Procent'];
        ViewFormReload.MemoryData_lgots.Post;
         end;
      DM.ReadDataSet.Next;
     end;

    //--------------------------------------------------------------------------
    DM.ReadDataSet.Close;
    DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from bs_DT_DOG_ENTRYREST_SEL(:ID_DOG)';
    DM.ReadDataSet.ParamByName('ID_DOG').AsInt64 := ID_DOG;
    DM.ReadDataSet.Open;
    DM.ReadDataSet.FetchAll;
    DM.ReadDataSet.First;

    ViewFormReload.MemoryData_EntryRest.Open;
    For i := 0 to DM.ReadDataSet.RecordCount-1 do
     Begin
      ViewFormReload.MemoryData_EntryRest.Insert;
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_smeta').AsInteger  := DM.ReadDataSet['id_smeta'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_Razdel').AsInteger := DM.ReadDataSet['id_Razdel'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_id_Stat').AsInteger   := DM.ReadDataSet['id_Stat'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Id_Kekv').AsInteger   := DM.ReadDataSet['Id_Kekv'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_smeta').AsInteger     := DM.ReadDataSet['smet'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Razdel').AsInteger    := DM.ReadDataSet['Razdel'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Stat').AsInteger      := DM.ReadDataSet['Stat'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Kekv').AsInteger      := DM.ReadDataSet['Kekv'];
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Sources').AsString    := IntToStr(DM.ReadDataSet['smet']) + '.' + IntToStr(DM.ReadDataSet['Razdel']) + '.' + IntToStr(DM.ReadDataSet['Stat']) + '.' + IntToStr(DM.ReadDataSet['Kekv']);
      ViewFormReload.MemoryData_EntryRest.FieldByName('MemoryData_EntryRest_Summa').AsFloat       := DM.ReadDataSet['Summa'];
      ViewFormReload.MemoryData_EntryRest.Post;
      DM.ReadDataSet.Next;
     end;

    ViewFormReload.ShowModal;
    
    //------------------------------------------------------------------------
    If ViewFormReload.ModalResult = mrOk then
     Begin
      DM.StProc.StoredProcName := 'bs_DT_DOG_INSERT';
      DM.WriteTransaction.StartTransaction;
      DM.StProc.Prepare;
      DM.StProc.ParamByName('date_reg').AsDateTime := ViewFormReload.DateEdit_Date_Reg.EditValue;
      DM.StProc.ParamByName('date_beg').AsDate     := ViewFormReload.DateEdit_Date_Beg.EditValue;
      DM.StProc.ParamByName('date_end').AsDate     := ViewFormReload.DateEdit_Date_End.EditValue;
      DM.StProc.ParamByName('num_dog').AsString    := ViewFormReload.Edit_num_Dog.Text;
      DM.StProc.ParamByName('ID_MAN').AsInt64      := ViewFormReload.ID_MAN;
      DM.StProc.ParamByName('IS_MAIN').AsInteger   := 1;
      if ViewFormReload.RadioButton_fiz.Checked
       then DM.StProc.ParamByName('IS_FIZ').AsInteger    := 1
       else DM.StProc.ParamByName('IS_FIZ').AsInteger    := 0;
      DM.StProc.ExecProc;
      ID_DOG := DM.StProc.FieldByName('ID_DOG').AsInt64;

      //--------------------------------------------------------------------------
      ViewFormReload.MemoryData_Living.Open;
      if not ViewFormReload.MemoryData_Living.IsEmpty then
       Begin
        DM.StProc.StoredProcName := 'bs_DT_DOG_LIVING_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;

        ViewFormReload.MemoryData_Living.First;
        for i := 0 to ViewFormReload.MemoryData_Living.RecordCount - 1 do
         Begin
          DM.StProc.ParamByName('ID_DOG').Asint64 := ID_DOG;
          DM.StProc.ParamByName('ID_MAN').AsInt64 := ViewFormReload.MemoryData_Living['MemoryData_Living_ID_MAN'];
          DM.StProc.ExecProc;
          ViewFormReload.MemoryData_Living.Next;
         End;
       End;

      //--------------------------------------------------------------------------
      ViewFormReload.MemoryData_Kat.Open;
      if not ViewFormReload.MemoryData_Kat.IsEmpty then
       Begin
        DM.StProc.StoredProcName := 'bs_DT_DOG_KAT_SUM_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;

        ViewFormReload.MemoryData_Kat.First;
        for i := 0 to ViewFormReload.MemoryData_Kat.RecordCount - 1 do
         Begin
          DM.StProc.ParamByName('ID_DOG').Asint64     := ID_DOG;
          DM.StProc.ParamByName('ID_KAT_SUM').AsInt64 := ViewFormReload.MemoryData_Kat['MemoryData_KAT_ID_KAT_SUM'];
          DM.StProc.ParamByName('DATE_BEG').AsDate    := ViewFormReload.MemoryData_Kat['MemoryData_KAT_DATE_BEG'];
          DM.StProc.ParamByName('DATE_END').AsDate    := ViewFormReload.MemoryData_Kat['MemoryData_KAT_DATE_END'];
          DM.StProc.ExecProc;
          ViewFormReload.MemoryData_Kat.Next;
         End;
       End;

      //--------------------------------------------------------------------------
      ViewFormReload.MemoryData_Subsidy.Open;
      if not ViewFormReload.MemoryData_Subsidy.IsEmpty then
       Begin
        DM.StProc.StoredProcName := 'bs_DT_DOG_SUBSIDY_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;

        ViewFormReload.MemoryData_Subsidy.First;
        for i := 0 to ViewFormReload.MemoryData_Subsidy.RecordCount - 1 do
         Begin
          DM.StProc.ParamByName('ID_DOG').Asint64     := ID_DOG;
          DM.StProc.ParamByName('ID_SUBSIDY').AsInt64 := ViewFormReload.MemoryData_Subsidy['MemoryData_SUBSIDY_ID_SUBSIDY'];
          DM.StProc.ParamByName('DATE_BEG').AsDate    := ViewFormReload.MemoryData_Subsidy['MemoryData_SUBSIDY_DATE_BEG'];
          DM.StProc.ParamByName('DATE_END').AsDate    := ViewFormReload.MemoryData_Subsidy['MemoryData_SUBSIDY_DATE_END'];
          DM.StProc.ParamByName('SUMMA').AsFloat      := ViewFormReload.MemoryData_Subsidy['MemoryData_SUBSIDY_SUMMA'];
          if ViewFormReload.MemoryData_Subsidy['MemoryData_SUBSIDY_COMMENTS'] <> null
           then DM.StProc.ParamByName('COMMENTS').AsString  := ViewFormReload.MemoryData_Subsidy['MemoryData_SUBSIDY_COMMENTS']
           else DM.StProc.ParamByName('COMMENTS').AsString  := '';
          DM.StProc.ExecProc;
          ViewFormReload.MemoryData_Subsidy.Next;
         End;
       End;

      //--------------------------------------------------------------------------
      ViewFormReload.MemoryData_lgots.Open;
      if not ViewFormReload.MemoryData_lgots.IsEmpty then
       Begin
        DM.StProc.StoredProcName := 'bs_DT_DOG_LGOT_SUM_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;

        ViewFormReload.MemoryData_lgots.First;
        for i := 0 to ViewFormReload.MemoryData_lgots.RecordCount - 1 do
         Begin
          DM.StProc.ParamByName('ID_DOG').Asint64      := ID_DOG;
          DM.StProc.ParamByName('ID_lgot_SUM').AsInt64 := ViewFormReload.MemoryData_lgots['MemoryData_lgots_ID_lgot_SUM'];
          DM.StProc.ParamByName('DATE_BEG').AsDate     := ViewFormReload.MemoryData_lgots['MemoryData_lgots_DATE_BEG'];
          DM.StProc.ParamByName('DATE_END').AsDate     := ViewFormReload.MemoryData_lgots['MemoryData_lgots_DATE_END'];
          DM.StProc.ExecProc;
          ViewFormReload.MemoryData_lgots.Next;
         End;
       End;

      //--------------------------------------------------------------------------
      ViewFormReload.MemoryData_EntryRest.Open;
      if not ViewFormReload.MemoryData_EntryRest.IsEmpty then
       Begin
        DM.StProc.StoredProcName := 'bs_DT_DOG_ENTRYREST_INS';
        DM.WriteTransaction.StartTransaction;
        DM.StProc.Prepare;

        ViewFormReload.MemoryData_EntryRest.First;
        for i := 0 to ViewFormReload.MemoryData_EntryRest.RecordCount - 1 do
         Begin
          DM.StProc.ParamByName('ID_DOG').Asint64    := ID_DOG;
          DM.StProc.ParamByName('ID_SMETA').AsInt64  := ViewFormReload.MemoryData_EntryRest['MemoryData_EntryRest_ID_SMETA'];
          DM.StProc.ParamByName('ID_RAZDEL').AsInt64 := ViewFormReload.MemoryData_EntryRest['MemoryData_EntryRest_ID_RAZDEL'];
          DM.StProc.ParamByName('ID_STAT').AsInt64   := ViewFormReload.MemoryData_EntryRest['MemoryData_EntryRest_ID_STAT'];
          DM.StProc.ParamByName('ID_KEKV').AsInt64   := ViewFormReload.MemoryData_EntryRest['MemoryData_EntryRest_ID_KEKV'];
          DM.StProc.ParamByName('SUMMA').AsFloat     := ViewFormReload.MemoryData_EntryRest['MemoryData_EntryRest_SUMMA'];
          DM.StProc.ExecProc;
          ViewFormReload.MemoryData_EntryRest.Next;
         End;
       End;

      try
       DM.StProc.Transaction.Commit;
       except
        on E:Exception do
         begin
          LogException;
          bsShowMessage('Error',e.Message,mtError,[mbOK]);
          DM.StProc.Transaction.Rollback;
          raise;
         end;
      end;

      DM.DataSet.Close;
      DM.DataSet.Open;
      DM.DataSet.Locate('ID_DOG', ID_DOG, []);
     end;

    ViewFormReload.Free;
   end;
end;

procedure TfrmReestr_main.Button_PayClick(Sender: TObject);
var
  AParameter : TbsSimpleParamsEx;
begin
  If DM.DataSet.RecordCount = 0 then Exit;
  
  AParameter                          := TbsSimpleParamsEx.Create;
  AParameter.Owner                    := self;
  AParameter.Db_Handle                := DM.DB.Handle;
  AParameter.Formstyle                := fsNormal;
  AParameter.WaitPakageOwner          := self;
  AParameter.is_admin                 := is_admin;
  AParameter.bsParamsToPakage.ID_DOG := DM.DataSet['ID_DOG'];
  AParameter.bsParamsToPakage.FIO    := DM.DataSet['ukr_fio_upper'];
  RunFunctionFromPackage(AParameter, 'bs\bs_dt_PaymentAnalysis.bpl','ShowDtPayment');
  AParameter.Free;
end;

procedure TfrmReestr_main.dxBarLargeButton4Click(Sender: TObject);
var
  ViewForm : TfrmReestr_filter;
begin
  ViewForm := TfrmReestr_filter.Create(self);
  ViewForm.ShowModal;
  If ViewForm.ModalResult = mrOk then
   begin
    DM.DataSet.Close;
    DM.DataSet.SQLs.SelectSQL.Text:='Select * from bs_dog_select_for_print(:date_beg,:date_end,:ndiss,:diss,:jur,:fiz)';
    DM.DataSet.ParamByName('date_beg').AsDate := ViewForm.cxDateEdit1.EditValue;
    DM.DataSet.ParamByName('date_end').AsDate := ViewForm.cxDateEdit2.EditValue;
    if ViewForm.cxCheckBox1.Checked
     then DM.DataSet.ParamByName('ndiss').AsInteger := 1
     else DM.DataSet.ParamByName('ndiss').AsInteger := 0;
    if ViewForm.cxCheckBox2.Checked
     then DM.DataSet.ParamByName('diss').AsInteger := 1
     else DM.DataSet.ParamByName('diss').AsInteger := 0;
    if ViewForm.cxCheckBox3.Checked
     then DM.DataSet.ParamByName('fiz').AsInteger :=   1
     else DM.DataSet.ParamByName('fiz').AsInteger :=   0;
    if ViewForm.cxCheckBox4.Checked
     then DM.DataSet.ParamByName('jur').AsInteger :=  1
     else DM.DataSet.ParamByName('jur').AsInteger :=  0;
    DM.DataSet.Open; 
   end;
  ViewForm.Free;
end;

end.
