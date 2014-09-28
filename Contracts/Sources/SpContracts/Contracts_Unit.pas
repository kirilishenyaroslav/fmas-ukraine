//******************************************************************************
// Проект "Контракты"
// Реестр контрактов
// Чернявский А.Э. 2005г.
//******************************************************************************

unit Contracts_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, cn_Common_Funcs, cn_Common_Messages, cnConsts,
  StdCtrls, cxLabel, ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxTextEdit, cxCalendar,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, cxCurrencyEdit, cxCheckBox, ActnList,
  cxRadioGroup, cxGroupBox, FIBDataSet, pFIBDataSet, DM, IBase,
  cn_Common_Types, cn_Common_Loader, cxTL, cxMaskEdit, cxInplaceContainer,
  cxDBTL, cxTLData;
  //PrintLoader;
  
type
  TfrmContracts = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    HotKey_StatusBar: TdxStatusBar;
    HotKey_StatusBarContainer: TdxStatusBarContainerControl;
    Progress: TcxProgressBar;
    StatusBarTop: TdxStatusBar;
    Footer_Panel: TPanel;
    Footer_Bevel: TBevel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    Faculty_Footer_Label: TLabel;
    Spec_Footer_Label: TLabel;
    Group_Footer_Label: TLabel;
    PrintButton: TdxBarLargeButton;
    PayButton: TdxBarLargeButton;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    HistoryButton: TdxBarLargeButton;
    Gragdanstvo_Footer_Label: TLabel;
    CategoryStudy_Footer_Label: TLabel;
    FormStudy_Footer_Label: TLabel;
    Kurs_Footer_Label: TLabel;
    Contracts_ActionList: TActionList;
    FilterAction: TAction;
    FIO_BarContainer: TdxBarControlContainerItem;
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    FilterExecute_Button: TdxBarButton;
    Magic_DissToNotDiss_Action: TAction;
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
    Dog_Filter_Edit: TdxBarEdit;
    GlobalFilterButton: TdxBarLargeButton;
    cxDBTreeList1: TcxDBTreeList;
    fio: TcxDBTreeListColumn;
    date_dog: TcxDBTreeListColumn;
    num_dog: TcxDBTreeListColumn;
    beg_date: TcxDBTreeListColumn;
    end_date: TcxDBTreeListColumn;
    isdiss: TcxDBTreeListColumn;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
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
    DsetRecordCount: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure Dog_Filter_EditEnter(Sender: TObject);
    procedure Dog_Filter_EditKeyPress(Sender: TObject; var Key: Char);
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EntryRestButtonClick(Sender: TObject);
    procedure PayButtonClick(Sender: TObject);
    procedure Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FilterExecute_ButtonClick(Sender: TObject);
    procedure DsetRecordCountClick(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    DM:TDM_Contracts;
    FirstSymbol: Smallint;
    procedure FormIniLanguage;
    procedure CaptionsClear();
  public
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
    procedure    DataSetAfterOpen(DataSet: TDataSet);
    procedure    DataSetAfterScroll(DataSet: TDataSet);
  end;

  var frmContracts :TfrmContracts;

implementation

uses Contract_Add_Edit, FIBQuery, pFIBStoredProc, pFIBQuery;


{$R *.dfm}
procedure TfrmContracts.CaptionsClear();
begin
 Faculty_Footer_Label.Caption:=           cnConsts.cn_footer_Faculty[PLanguageIndex];
 Spec_Footer_Label.Caption:=              cnConsts.cn_footer_Spec[PLanguageIndex];
 Group_Footer_Label.Caption:=             cnConsts.cn_footer_Group[PLanguageIndex];
 Kurs_Footer_Label.Caption:=              cnConsts.cn_footer_Kurs[PLanguageIndex];
 CategoryStudy_Footer_Label.Caption:=     cnConsts.cn_footer_CategoryStudy[PLanguageIndex];
 FormStudy_Footer_Label.Caption:=         cnConsts.cn_footer_FormStudy[PLanguageIndex];
 Gragdanstvo_Footer_Label.Caption:=       cnConsts.cn_Gragdanstvo[PLanguageIndex];
end;

procedure TfrmContracts.DataSetAfterOpen(DataSet: TDataSet);
begin
CaptionsClear();
if DataSet['NAME_FACUL']<> null then
Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DataSet['NAME_FACUL'];
if DataSet['NAME_SPEC']<> null then
Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DataSet['NAME_SPEC'];
if DataSet['NAME_GROUP']<> null then
Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DataSet['NAME_GROUP'];
if DataSet['KURS']<> null then
Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DataSet['KURS']);
if DataSet['NAME_KAT_STUD']<> null then
CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DataSet['NAME_KAT_STUD'];
if DataSet['NAME_FORM_STUD']<> null then
FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DataSet['NAME_FORM_STUD'];
if DataSet['NAME_NAZIONAL']<> null then
Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DataSet['NAME_NAZIONAL'];
end;

procedure TfrmContracts.DataSetAfterScroll(DataSet: TDataSet);
begin
CaptionsClear();
if DataSet['NAME_FACUL'] <> null then
Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DataSet['NAME_FACUL'];
if DataSet['NAME_SPEC']<> null then
Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DataSet['NAME_SPEC'];
if DataSet['NAME_GROUP']<> null then
Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DataSet['NAME_GROUP'];
if DataSet['KURS']<> null then
Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DataSet['KURS']);
if DataSet['NAME_KAT_STUD']<> null then
CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DataSet['NAME_KAT_STUD'];
if DataSet['NAME_FORM_STUD']<> null then
FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DataSet['NAME_FORM_STUD'];
if DataSet['NAME_NAZIONAL']<> null then
Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DataSet['NAME_NAZIONAL'];
end;

constructor TfrmContracts.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_Contracts.Create(Self);
DM.DB.Handle:=DB_Handle;
DM.DataSet.SQLs.SelectSQL.clear;
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_ROOT_SELECT';
DM.DataSet.AfterOpen   := DataSetAfterOpen;
DM.DataSet.AfterScroll := DataSetAfterScroll;
DM.DataSet.Open;
cxDBTreeList1.DataController.DataSource := DM.DataSource;
Screen.Cursor:=crDefault;
end;

procedure TfrmContracts.FormIniLanguage;
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_ReestrContracts_Tiltle[PLanguageIndex];
 //названия кнопок
 AddButton.Caption :=           cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 PrintButton.Caption:=          cnConsts.cn_Print_Caption[PLanguageIndex];
 PayButton.Caption:=            cnConsts.cn_Pay_Caption[PLanguageIndex];
 LgotaButton.Caption:=          cnConsts.cn_Lgota_Caption[PLanguageIndex];
 EntryRestButton.Caption:=      cnConsts.cn_EntryRest_Caption[PLanguageIndex];
 HistoryButton.Caption:=        cnConsts.cn_History[PLanguageIndex];
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 //статусбар
 StatusBarTop.Panels[0].Text:=  cnConsts.cn_InsertBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_InsertBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[1].Text:=  cnConsts.cn_EditBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_EditBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[2].Text:=  cnConsts.cn_DeleteBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_DeleteBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[3].Text:=  cnConsts.cn_RefreshBtn_ShortCut[PLanguageIndex] + cnConsts.cn_RefreshBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[4].Text:=  cnConsts.cn_FilterBtn_ShortCut[PLanguageIndex]  + cnConsts.cn_FilterBtn_Caption[PLanguageIndex];
 StatusBarTop.Panels[5].Text:=  cnConsts.cn_ExitBtn_ShortCut[PLanguageIndex]    + cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 StatusBarTop.Hint:=            cnConsts.cn_HotKeys[PLanguageIndex];
 // Грид
 fio.Caption.Text:=             cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 date_dog.Caption.Text:=             cnConsts.cn_grid_Date_Dog_Column[PLanguageIndex];
 num_dog.Caption.Text:=              cnConsts.cn_grid_Num_Dog_Column[PLanguageIndex];
 beg_date.Caption.Text:=             cnConsts.cn_grid_Date_Beg[PLanguageIndex];
 end_date.Caption.Text:=             cnConsts.cn_grid_Date_End[PLanguageIndex];
 isdiss.Caption.Text:=               cnConsts.cn_grid_IsDiss_Column[PLanguageIndex];

 // Футер
 Faculty_Footer_Label.Caption:=           cnConsts.cn_footer_Faculty[PLanguageIndex];
 Spec_Footer_Label.Caption:=              cnConsts.cn_footer_Spec[PLanguageIndex];
 Group_Footer_Label.Caption:=             cnConsts.cn_footer_Group[PLanguageIndex];
 Kurs_Footer_Label.Caption:=              cnConsts.cn_footer_Kurs[PLanguageIndex];
 CategoryStudy_Footer_Label.Caption:=     cnConsts.cn_footer_CategoryStudy[PLanguageIndex];
 FormStudy_Footer_Label.Caption:=         cnConsts.cn_footer_FormStudy[PLanguageIndex];
 Gragdanstvo_Footer_Label.Caption:=       cnConsts.cn_Gragdanstvo[PLanguageIndex];
 // Фильтр
 Dog_Filter_Edit.Caption:=                cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
 FiltrByFIO_RadioButton.Caption:=         cnConsts.cn_FiltrByFIO[PLanguageIndex];
 FiltrByNum_RadioButton.Caption:=         cnConsts.cn_FiltrByNum[PLanguageIndex];
 FilterExecute_Button.Hint:=              cnConsts.cn_SearchBtn_Caption[PLanguageIndex];

 GlobalFilterButton.Caption:=             cnConsts.cn_FilterBtn_Caption[PLanguageIndex];
 GlobalFilterButton.Hint:=                cnConsts.cn_FilterBtn_Caption[PLanguageIndex];

 BarManager.Bars[1].Caption:=             cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
 Dog_Filter_Edit.CurText:=                cnConsts.cn_FilterText[PLanguageIndex];
 DsetRecordCount.Caption:=                cnConsts.cn_DSetRecordCount[PLanguageIndex];
end;

procedure TfrmContracts.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if FormStyle = fsMDIChild then action:=caFree
else
DM.Free;
end;

procedure TfrmContracts.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmContracts.FormCreate(Sender: TObject);
begin
FormIniLanguage;
end;

procedure TfrmContracts.AddButtonClick(Sender: TObject);
var
 ViewForm          :Tfrm_Contracts_AE;
 i, k: integer;
 ID_DOG_ROOT       : int64;
 ID_DOG            : int64;
 ID_STUD           : int64;
 CurrentServerDate : TDateTime;
 cnAcademicYear    : TcnAcademicYear;
begin
ViewForm:= Tfrm_Contracts_AE.create(frmContracts, PLanguageIndex, DM.DB.Handle);
ViewForm.Caption:= cnConsts.cn_InsertBtn_Caption[PLanguageIndex];

 DM.ReadDataSet.close;
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
 DM.ReadDataSet.Open;
 CurrentServerDate:= DM.ReadDataSet['CUR_DATE'];
 DM.ReadDataSet.close;

 cnAcademicYear:=cn_Common_Funcs.AcademicYear(CurrentServerDate);

 ViewForm.Date_Beg_DateEdit.Date  := cnAcademicYear.Date_Beg;
 ViewForm.Date_End_DateEdit.Date  := cnAcademicYear.Date_End;
 ViewForm.Date_Zakl_DateEdit.Date := CurrentServerDate;

 if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
       try
        Transaction.StartTransaction;
//-------
      {добавление общей информации по договору в таблицу договоров и корень одной процедурой}
      //вызывается 1 раз //
      // CN_DT_DOG_INSERT (возвращаю идентификаторы ID_DOG , ID_DOG_ROOT )
        StoredProcName := 'CN_DT_DOG_INSERT';
        Prepare;
        if ViewForm.Base_Dog_RadioButton.Checked then
        ParamByName('ID_TYPE_DOG').AsInt64    := 1  //основной договор
        else
        ParamByName('ID_TYPE_DOG').AsInt64    := 2; //дополнительный договор
        ParamByName('ID_DOG_STATUS').Asint64  := 1; //1- действующий
        ParamByName('ID_INT_ACCOUNT').AsInt64 := -1;
        ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
        ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
        ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
        ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
        //ParamByName('DATE_DISS').AsDate       := ViewForm.;
        ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
        ParamByName('ISOSTATOK').AsShort      := 0;
        ExecProc;
           ID_DOG_ROOT := ParamByName('ID_DOG_ROOT').AsInt64;
           ID_DOG      := ParamByName('ID_DOG').AsInt64;

//-------

        // всё в одном цикле по студенту(ам)
        // begin for
          for i := 0 to ViewForm.Grid_fioTableView.DataController.RecordCount - 1 do begin
           ID_STUD := -1;
      {добавление информации о студенте}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_STUD_INSERT (запускаю с параметром ID_DOG_ROOT и возвращаю идентификатор ID_STUD)
             StoredProcName := 'CN_DT_STUD_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64        := ID_DOG_ROOT;
            ParamByName('ID_MAN').AsInt64             := ViewForm.Grid_fioTableView.DataController.values[i, 17];
            ParamByName('SUM_ENTRY_REST').AsVariant   := null;
            ExecProc;
           ID_STUD := ParamByName('ID_STUD').AsInt64;
      {добавление расширенной полной информации о студенте}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_STUD_INF_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STUD)
            StoredProcName := 'CN_DT_STUD_INF_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
            ParamByName('ID_DOG').AsInt64         := ID_DOG;
            ParamByName('ID_STUD').AsInt64        := ID_STUD;
            ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
            ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
            ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
            ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
            ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
            ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
            ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
            ParamByName('DATE_BEG').AsDate        := ViewForm.Grid_fioTableView.DataController.values[i, 1];
            ParamByName('DATE_END').AsDate        := ViewForm.Grid_fioTableView.DataController.values[i, 2];
            ExecProc;
      {обновляю корень информацией по студенту}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_DOG_ROOT_STUD_INF_UPDATE (запускаю с параметром ID_DOG_ROOT)
            StoredProcName := 'CN_DT_DOG_ROOT_STUD_INF_UPDATE';
            Prepare;
            if ViewForm.Grid_fioTableView.DataController.RecordCount > 1 then
             begin
             ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
             ParamByName('ISCOLLECT').AsShort      := 1;
             ParamByName('FIO').AsString           := cnConsts.cn_CollectDog[PLanguageIndex];
             ParamByName('ID_FACUL').AsVariant     := NULL;
             ParamByName('ID_SPEC').AsVariant      := NULL;
             ParamByName('ID_NATIONAL').AsVariant  := NULL;
             ParamByName('ID_FORM_STUD').AsVariant := NULL;
             ParamByName('ID_KAT_STUD').AsVariant  := NULL;
             ParamByName('ID_GROUP').AsVariant     := NULL;
             ParamByName('KURS').AsVariant         := NULL;
             end
             else
             begin
             ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
             ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
             ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
             ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
             ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
             ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
             ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
             ParamByName('ISCOLLECT').AsShort      := 0;
             ParamByName('FIO').AsString           := ViewForm.Grid_fioTableView.DataController.values[i, 0];
             ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
             end;
             ExecProc;

    //-------
                  {добавление информации о периодах оплаты внутри цикла по студенту}
                  //кол-во вызовов зависит от кол-ва периодов оплаты по внесенному договору //
                  // CN_DT_STAGE_OPL_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STAGE_OPL(не использую))
               for k := 0 to ViewForm.Grid_payTableView.DataController.RecordCount - 1 do begin
                if ViewForm.Grid_fioTableView.DataController.values[i, 17] = ViewForm.Grid_payTableView.DataController.values[k, 5]
                {если значение id_man по студенту совпадает со значением id_man_stage_opl}
                  then begin
                    StoredProcName := 'CN_DT_STAGE_OPL_INSERT';
                    Prepare;
                    ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                    ParamByName('ID_DOG').AsInt64         := ID_DOG;
                    ParamByName('ID_STUD').AsInt64        := ID_STUD;
                    ParamByName('ID_PAYER').AsInt64       := ViewForm.Grid_payTableView.DataController.values[k, 4];
                    ParamByName('NUM_YEAR').AsString      := '-1';
                    ParamByName('DATE_BEG').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 0]);
                    ParamByName('DATE_END').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 1]);
                    ParamByName('DATE_PAY').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 2]);
                    ParamByName('SUMMA').AsCurrency       := ViewForm.Grid_payTableView.DataController.values[k, 3];
                    ExecProc;
                 end;
                 // enf if
               end;
               // end for
                //-------
                      {добавление информации о сметах}
                      //кол-во вызовов зависит от кол-ва периодов разбивки //
                      // CN_DT_DOG_SMET_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_DOG_SMET)
                       for k := 0 to ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1 do begin
                        if ViewForm.Grid_fioTableView.DataController.values[i, 17] = ViewForm.Grid_istochnikiTableView.DataController.values[k, 9]
                         {если значение id_man по студенту совпадает со значением id_man_istochniki}
                        then begin
                        StoredProcName := 'CN_DT_DOG_SMET_INSERT';
                        Prepare;
                        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                        ParamByName('ID_DOG').AsInt64         := ID_DOG;
                        ParamByName('ID_STUD').AsInt64        := ID_STUD;
                        ParamByName('ID_SMET').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 5];
                        ParamByName('ID_RAZD').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 6];
                        ParamByName('ID_STAT').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 7];
                        ParamByName('ID_KEKV').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 8];
                        ParamByName('PERSENT').AsCurrency     :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 4];
                        ExecProc;
                         end;
                         // enf if
                       end;
                       // end for

          end;
           // end for по студенту в целом

//-------
       for i := 0 to ViewForm.Grid_payersTableView.DataController.RecordCount - 1 do begin
      {добавление информации о плательщике}
      //кол-во вызовов зависит от кол-ва плательщиков по внесенному договору //
      // CN_DT_PAYER_STAGE_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG и возвращаю идентификатор ID_PAYER_STAGE)
            StoredProcName := 'CN_DT_PAYER_STAGE_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64      := ID_DOG_ROOT;
            ParamByName('ID_DOG').AsInt64           := ID_DOG;
            ParamByName('ID_PAYER').AsInt64         := ViewForm.Grid_payersTableView.DataController.values[i, 6];

              // 1 - физ.лицо, 2- юр.лицо .. пока так надо уточнить
            ParamByName('ID_TYPE_PAYER').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 3];

            ParamByName('ID_RATE_ACCOUNT').AsInt64  :=  ViewForm.Grid_payersTableView.DataController.values[i, 7];
            ParamByName('ID_TYPE_STAGE').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 4];

             if ViewForm.Grid_payersTableView.DataController.values[i, 5] = 1
               then
                 begin
                  ParamByName('PERSENT').AsCurrency       := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('SUMMA').AsCurrency         := 0;
                 end
               else
                 begin
                  ParamByName('SUMMA').AsCurrency         := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('PERSENT').AsCurrency       := 0;
                 end;
            ExecProc;
       end;
       // end for


      // commit all
        Transaction.Commit;

  DM.DataSet.SQLs.InsertSQL.Text:='execute procedure z_empty_proc';
  DM.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID(' + IntToStr(ID_DOG_ROOT)+')';
  DM.DataSet.Insert;
  DM.DataSet.Post;

  CaptionsClear();
    if DM.DataSet['NAME_FACUL'] <> null then
    Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
    if DM.DataSet['NAME_SPEC']<> null then
    Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
    if DM.DataSet['NAME_GROUP']<> null then
    Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
    if DM.DataSet['KURS']<> null then
    Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
    if DM.DataSet['NAME_KAT_STUD']<> null then
    CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
    if DM.DataSet['NAME_FORM_STUD']<> null then
    FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
    if DM.DataSet['NAME_NAZIONAL']<> null then
    Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];

       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
   end;
end;

procedure TfrmContracts.EditButtonClick(Sender: TObject);
var
ViewForm:Tfrm_Contracts_AE;
i, k: integer;
 ID_DOG_ROOT : int64;
 ID_DOG      : int64;
 ID_STUD     : int64;

 ID_DOG_Convert : int64;
 ID_DOG_ROOT_Convert : int64;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
ViewForm:= Tfrm_Contracts_AE.create(frmContracts, PLanguageIndex, DM.DB.Handle);
ViewForm.Caption:= cnConsts.cn_EditBtn_Caption[PLanguageIndex];

ViewForm.Num_Dog_Edit.Text             :=  DM.Dataset['NUM_DOG'];
ViewForm.Date_Zakl_DateEdit.Date       :=  strtodate(DM.Dataset['DATE_DOG']);
ViewForm.Date_Beg_DateEdit.Date        :=  strtodate(DM.Dataset['DATE_BEG']);
ViewForm.Date_End_DateEdit.Date        :=  strtodate(DM.Dataset['DATE_END']);

 if DM.Dataset['ISMAINDOG'] = 1 then
   ViewForm.Base_Dog_RadioButton.Checked  := true
 else
   ViewForm.Addit_Dog_RadioButton.Checked :=  false;

// работает DM.ReadDataSet - забиваем гриды информацией
// информация по студенту
 DM.ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_ALL_STUDINFO_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_fioTableView.DataController.RecordCount := ViewForm.Grid_fioTableView.DataController.RecordCount + 1;
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PEOPLE'];
{ид_ман}
   ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 17] := DM.ReadDataSet['ID_MAN'];
{дата_начала}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 1] :=  DM.ReadDataSet['DATE_BEG'];
{дата_конца}         ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 2] :=  DM.ReadDataSet['DATE_END'];
{факультет}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 3] :=  DM.ReadDataSet['NAME_FACUL'];
{специальность}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 4] :=  DM.ReadDataSet['NAME_SPEC'];
{группа}             ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 5] :=  DM.ReadDataSet['NAME_GROUP'];
{форма_обучения}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 6] :=  DM.ReadDataSet['NAME_FORM_STUD'];
{категория_обучения} ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 7] :=  DM.ReadDataSet['NAME_KAT_STUD'];
{национальность}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 8] :=  DM.ReadDataSet['NAME_NAZIONAL'];
{курс}               ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 9] :=  DM.ReadDataSet['KURS'];
{сумма}              ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 10] := -1;//DM.ReadDataSet[''];

{ид_факультета}      ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 11] := DM.ReadDataSet['ID_FACUL'];
{ид_спец}            ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 12] := DM.ReadDataSet['ID_SPEC'];
{ид_группы}          ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 13] := DM.ReadDataSet['ID_GROUP'];
{ид_формыобуч}       ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 14] := DM.ReadDataSet['ID_FORM_STUD'];
{ид_категоробуч}     ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 15] := DM.ReadDataSet['ID_KAT_STUD'];
{ид_национал}        ViewForm.Grid_fioTableView.DataController.Values[ViewForm.Grid_fioTableView.DataController.RecordCount - 1, 16] := DM.ReadDataSet['ID_NATIONAL'];
  DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 // информация по плательщикам
 DM.ReadDataSet.SelectSQL.Clear;
 ID_DOG_ROOT_Convert := DM.DataSet['ID_DOG_ROOT'];
 ID_DOG_Convert      := DM.DataSet['ID_DOG_LAST'];
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_PAYER_STAGE_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payersTableView.DataController.RecordCount := ViewForm.Grid_payersTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['FIO_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['NAME_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['ID_TYPE_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_TYPE_STAGE'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ISPERCENT'];
   if DM.ReadDataSet['ISPERCENT'] =1 then
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['PERSENT']
   else
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['SUMMA'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_RATE_ACCOUNT'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['MFO'];
   ViewForm.Grid_payersTableView.DataController.Values[ViewForm.Grid_payersTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['RATE_ACCOUNT'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 // информация по сметам
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_DOG_SMET_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_istochnikiTableView.DataController.RecordCount := ViewForm.Grid_istochnikiTableView.DataController.RecordCount + 1;
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['KOD_SM'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['KOD_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['KOD_ST'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['KOD_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['PERSENT'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_SMET'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 6]  := DM.ReadDataSet['ID_RAZD'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 7]  := DM.ReadDataSet['ID_STAT'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 8]  := DM.ReadDataSet['ID_KEKV'];
   ViewForm.Grid_istochnikiTableView.DataController.Values[ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1, 9]  := DM.ReadDataSet['ID_MAN'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;

 // информация по периодам оплат
 DM.ReadDataSet.SelectSQL.Clear;
 DM.ReadDataSet.SelectSQL.Text := 'select * from CN_DT_STAGE_OPL_SELECT(' + IntToStr(ID_DOG_ROOT_Convert) + ',' + IntToStr(ID_DOG_Convert) + ')';
 DM.ReadDataSet.Open;
 DM.ReadDataSet.FetchAll;
 DM.ReadDataSet.First;
 for i:=0 to DM.ReadDataSet.RecordCount-1 do
  begin
   ViewForm.Grid_payTableView.DataController.RecordCount := ViewForm.Grid_payTableView.DataController.RecordCount + 1;
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 0]  := DM.ReadDataSet['DATE_BEG'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 1]  := DM.ReadDataSet['DATE_END'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 2]  := DM.ReadDataSet['DATE_PAY'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 3]  := DM.ReadDataSet['SUMMA'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 4]  := DM.ReadDataSet['ID_PAYER'];
   ViewForm.Grid_payTableView.DataController.Values[ViewForm.Grid_payTableView.DataController.RecordCount - 1, 5]  := DM.ReadDataSet['ID_MAN'];
   DM.ReadDataSet.Next;
  end;
 DM.ReadDataSet.Close;


 // -----------------------------
 if ViewForm.ShowModal = mrOk then
   begin
     with DM.StProc do
       try
       // удаляем все записи по договору и связанным таблицам путем закрытия use_enda
        Transaction.StartTransaction; // старт общей транзакции

        StoredProcName := 'CN_DT_DOG_ROOT_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ExecProc;

        StoredProcName := 'CN_DT_DOG_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_STUD_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ExecProc;

        StoredProcName := 'CN_DT_STUD_INF_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_PAYER_STAGE_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_DOG_SMET_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_STAGE_OPL_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        //-------
      {добавление общей информации по договору в таблицу договоров и корень одной процедурой}
      //вызывается 1 раз //
      // CN_DT_DOG_INSERT (возвращаю идентификаторы ID_DOG , ID_DOG_ROOT )
        StoredProcName := 'CN_DT_DOG_INSERT';
        Prepare;
        if ViewForm.Base_Dog_RadioButton.Checked then
        ParamByName('ID_TYPE_DOG').AsInt64    := 1  //основной договор
        else
        ParamByName('ID_TYPE_DOG').AsInt64    := 2; //дополнительный договор
        ParamByName('ID_DOG_STATUS').Asint64  := 1; //1- действующий
        ParamByName('ID_INT_ACCOUNT').AsInt64 := -1;
        ParamByName('NUM_DOG').AsString       := ViewForm.Num_Dog_Edit.Text;
        ParamByName('DATE_DOG').AsDate        := ViewForm.Date_Zakl_DateEdit.Date;
        ParamByName('DATE_BEG').AsDate        := ViewForm.Date_Beg_DateEdit.Date;
        ParamByName('DATE_END').AsDate        := ViewForm.Date_End_DateEdit.Date;
        //ParamByName('DATE_DISS').AsDate       := ViewForm.;
        ParamByName('SUMMA').AsCurrency       :=  StrToFloat(ViewForm.Grid_payTableView.DataController.Summary.FooterSummaryValues[0]);
        ParamByName('ISOSTATOK').AsShort      := 0;
        ExecProc;
           ID_DOG_ROOT := ParamByName('ID_DOG_ROOT').AsInt64;
           ID_DOG      := ParamByName('ID_DOG').AsInt64;

//-------

        // всё в одном цикле по студенту(ам)
        // begin for
          for i := 0 to ViewForm.Grid_fioTableView.DataController.RecordCount - 1 do begin
           ID_STUD := -1;
      {добавление информации о студенте}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_STUD_INSERT (запускаю с параметром ID_DOG_ROOT и возвращаю идентификатор ID_STUD)
             StoredProcName := 'CN_DT_STUD_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64        := ID_DOG_ROOT;
            ParamByName('ID_MAN').AsInt64             := ViewForm.Grid_fioTableView.DataController.values[i, 17];
            ParamByName('SUM_ENTRY_REST').AsVariant   := null;
            ExecProc;
           ID_STUD := ParamByName('ID_STUD').AsInt64;
      {добавление расширенной полной информации о студенте}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_STUD_INF_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STUD)
            StoredProcName := 'CN_DT_STUD_INF_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
            ParamByName('ID_DOG').AsInt64         := ID_DOG;
            ParamByName('ID_STUD').AsInt64        := ID_STUD;
            ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
            ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
            ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
            ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
            ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
            ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
            ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
            ParamByName('DATE_BEG').AsDate        := ViewForm.Grid_fioTableView.DataController.values[i, 1];
            ParamByName('DATE_END').AsDate        := ViewForm.Grid_fioTableView.DataController.values[i, 2];
            ExecProc;
      {обновляю корень информацией по студенту}
      //кол-во вызовов зависит от кол-ва обучающихся по внесенному договору //
      // CN_DT_DOG_ROOT_STUD_INF_UPDATE (запускаю с параметром ID_DOG_ROOT)
            StoredProcName := 'CN_DT_DOG_ROOT_STUD_INF_UPDATE';
            Prepare;
            if ViewForm.Grid_fioTableView.DataController.RecordCount > 1 then
             begin
             ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
             ParamByName('ISCOLLECT').AsShort      := 1;
             ParamByName('FIO').AsString           := cnConsts.cn_CollectDog[PLanguageIndex];
             ParamByName('ID_FACUL').AsVariant     := NULL;
             ParamByName('ID_SPEC').AsVariant      := NULL;
             ParamByName('ID_NATIONAL').AsVariant  := NULL;
             ParamByName('ID_FORM_STUD').AsVariant := NULL;
             ParamByName('ID_KAT_STUD').AsVariant  := NULL;
             ParamByName('ID_GROUP').AsVariant     := NULL;
             ParamByName('KURS').AsVariant         := NULL;
             end
             else
             begin
             ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
             ParamByName('ID_FACUL').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 11];
             ParamByName('ID_SPEC').AsInt64        := ViewForm.Grid_fioTableView.DataController.values[i, 12];
             ParamByName('ID_NATIONAL').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 16];
             ParamByName('ID_FORM_STUD').AsInt64   := ViewForm.Grid_fioTableView.DataController.values[i, 14];
             ParamByName('ID_KAT_STUD').AsInt64    := ViewForm.Grid_fioTableView.DataController.values[i, 15];
             ParamByName('ID_GROUP').AsInt64       := ViewForm.Grid_fioTableView.DataController.values[i, 13];
             ParamByName('ISCOLLECT').AsShort      := 0;
             ParamByName('FIO').AsString           := ViewForm.Grid_fioTableView.DataController.values[i, 0];
             ParamByName('KURS').AsSingle          := ViewForm.Grid_fioTableView.DataController.values[i, 9];
             end;
             ExecProc;

    //-------
                  {добавление информации о периодах оплаты внутри цикла по студенту}
                  //кол-во вызовов зависит от кол-ва периодов оплаты по внесенному договору //
                  // CN_DT_STAGE_OPL_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_STAGE_OPL(не использую))
               for k := 0 to ViewForm.Grid_payTableView.DataController.RecordCount - 1 do begin
                if ViewForm.Grid_fioTableView.DataController.values[i, 17] = ViewForm.Grid_payTableView.DataController.values[k, 5]
                {если значение id_man по студенту совпадает со значением id_man_stage_opl}
                  then begin
                    StoredProcName := 'CN_DT_STAGE_OPL_INSERT';
                    Prepare;
                    ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                    ParamByName('ID_DOG').AsInt64         := ID_DOG;
                    ParamByName('ID_STUD').AsInt64        := ID_STUD;
                    ParamByName('ID_PAYER').AsInt64       := ViewForm.Grid_payTableView.DataController.values[k, 4];
                    ParamByName('NUM_YEAR').AsString      := '-1';
                    ParamByName('DATE_BEG').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 0]);
                    ParamByName('DATE_END').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 1]);
                    ParamByName('DATE_PAY').AsDate        := StrtoDate(ViewForm.Grid_payTableView.DataController.values[k, 2]);
                    ParamByName('SUMMA').AsCurrency       := ViewForm.Grid_payTableView.DataController.values[k, 3];
                    ExecProc;
                 end;
                 // enf if
               end;
               // end for
                //-------
                      {добавление информации о сметах}
                      //кол-во вызовов зависит от кол-ва периодов разбивки //
                      // CN_DT_DOG_SMET_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG, ID_STUD и возвращаю идентификатор ID_DOG_SMET)
                       for k := 0 to ViewForm.Grid_istochnikiTableView.DataController.RecordCount - 1 do begin
                        if ViewForm.Grid_fioTableView.DataController.values[i, 17] = ViewForm.Grid_istochnikiTableView.DataController.values[k, 9]
                         {если значение id_man по студенту совпадает со значением id_man_istochniki}
                        then begin
                        StoredProcName := 'CN_DT_DOG_SMET_INSERT';
                        Prepare;
                        ParamByName('ID_DOG_ROOT').AsInt64    := ID_DOG_ROOT;
                        ParamByName('ID_DOG').AsInt64         := ID_DOG;
                        ParamByName('ID_STUD').AsInt64        := ID_STUD;
                        ParamByName('ID_SMET').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 5];
                        ParamByName('ID_RAZD').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 6];
                        ParamByName('ID_STAT').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 7];
                        ParamByName('ID_KEKV').AsInt64        :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 8];
                        ParamByName('PERSENT').AsCurrency     :=  ViewForm.Grid_istochnikiTableView.DataController.values[k, 4];
                        ExecProc;
                         end;
                         // enf if
                       end;
                       // end for

          end;
           // end for по студенту в целом

//-------
       for i := 0 to ViewForm.Grid_payersTableView.DataController.RecordCount - 1 do begin
      {добавление информации о плательщике}
      //кол-во вызовов зависит от кол-ва плательщиков по внесенному договору //
      // CN_DT_PAYER_STAGE_INSERT (запускаю с параметром ID_DOG_ROOT, ID_DOG и возвращаю идентификатор ID_PAYER_STAGE)
            StoredProcName := 'CN_DT_PAYER_STAGE_INSERT';
            Prepare;
            ParamByName('ID_DOG_ROOT').AsInt64      := ID_DOG_ROOT;
            ParamByName('ID_DOG').AsInt64           := ID_DOG;
            ParamByName('ID_PAYER').AsInt64         := ViewForm.Grid_payersTableView.DataController.values[i, 6];

              // 1 - физ.лицо, 2- юр.лицо .. пока так надо уточнить
            ParamByName('ID_TYPE_PAYER').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 3];

            ParamByName('ID_RATE_ACCOUNT').AsInt64  :=  ViewForm.Grid_payersTableView.DataController.values[i, 7];
            ParamByName('ID_TYPE_STAGE').AsInt64    :=  ViewForm.Grid_payersTableView.DataController.values[i, 4];

             if ViewForm.Grid_payersTableView.DataController.values[i, 5] = 1
               then
                 begin
                  ParamByName('PERSENT').AsCurrency       := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('SUMMA').AsCurrency         := 0;
                 end
               else
                 begin
                  ParamByName('SUMMA').AsCurrency         := ViewForm.Grid_payersTableView.DataController.values[i, 2];
                  ParamByName('PERSENT').AsCurrency       := 0;
                 end;
            ExecProc;
       end;
       // end for

        Transaction.Commit;     // коммит общей транзакции

          DM.DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
          DM.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM CN_DT_DOG_ROOT_SELECT_BY_ID(' + IntToStr(ID_DOG_ROOT)+')';
          DM.DataSet.Edit;
          DM.DataSet.Post;

          CaptionsClear();
          if DM.DataSet['NAME_FACUL'] <> null then
          Faculty_Footer_Label.Caption       := Faculty_Footer_Label.Caption       + ': '+ DM.DataSet['NAME_FACUL'];
          if DM.DataSet['NAME_SPEC']<> null then
          Spec_Footer_Label.Caption          := Spec_Footer_Label.Caption          + ': '+ DM.DataSet['NAME_SPEC'];
          if DM.DataSet['NAME_GROUP']<> null then
          Group_Footer_Label.Caption         := Group_Footer_Label.Caption         + ': '+ DM.DataSet['NAME_GROUP'];
          if DM.DataSet['KURS']<> null then
          Kurs_Footer_Label.Caption          := Kurs_Footer_Label.Caption          + ': '+ inttostr(DM.DataSet['KURS']);
          if DM.DataSet['NAME_KAT_STUD']<> null then
          CategoryStudy_Footer_Label.Caption := CategoryStudy_Footer_Label.Caption + ': '+ DM.DataSet['NAME_KAT_STUD'];
          if DM.DataSet['NAME_FORM_STUD']<> null then
          FormStudy_Footer_Label.Caption     := FormStudy_Footer_Label.Caption     + ': '+ DM.DataSet['NAME_FORM_STUD'];
          if DM.DataSet['NAME_NAZIONAL']<> null then
          Gragdanstvo_Footer_Label.Caption   := Gragdanstvo_Footer_Label.Caption   + ': '+ DM.DataSet['NAME_NAZIONAL'];

      except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
   end;
end;

procedure TfrmContracts.FilterActionExecute(Sender: TObject);
begin
Dog_Filter_Edit.Setfocus;
end;

procedure TfrmContracts.DeleteButtonClick(Sender: TObject);
var
i: byte;
begin
if cxDBTreeList1.DataController.RecordCount = 0 then exit;
 i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts.cn_DeletePromt[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
 if ((i = 7) or (i= 2)) then exit;

     with DM.StProc do
       try
       // удаляем все записи по договору и связанным таблицам путем закрытия use_enda
        Transaction.StartTransaction; // старт общей транзакции

        StoredProcName := 'CN_DT_DOG_ROOT_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ExecProc;

        StoredProcName := 'CN_DT_DOG_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_STUD_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ExecProc;

        StoredProcName := 'CN_DT_STUD_INF_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_PAYER_STAGE_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_DOG_SMET_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        StoredProcName := 'CN_DT_STAGE_OPL_DELETE';
        Prepare;
        ParamByName('ID_DOG_ROOT').AsInt64    := DM.DataSet['ID_DOG_ROOT'];
        ParamByName('ID_DOG').AsInt64         := DM.DataSet['ID_DOG_LAST'];
        ExecProc;

        Transaction.Commit;     // коммит общей транзакции

        DM.DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
        DM.DataSet.Delete;
        
       except
        on E:Exception do
         begin
          cnShowMessage('Error',e.Message,mtError,[mbOK]);
          Transaction.Rollback;
         end;
       end;
end;

procedure TfrmContracts.GridDBViewDblClick(Sender: TObject);
begin
EditButtonClick(Sender);
end;

procedure TfrmContracts.Dog_Filter_EditEnter(Sender: TObject);
begin
if Dog_Filter_Edit.CurText = cnConsts.cn_FilterText[PLanguageIndex] then
Dog_Filter_Edit.CurText:='';
end;

procedure TfrmContracts.Dog_Filter_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then cxDBTreeList1.SetFocus;

if ((key <> #8) and (key <> '/')) then
if IntegerCheck(Key) then
  FiltrByNum_RadioButton.Checked:=true
else
  FiltrByFIO_RadioButton.Checked:=true;

end;

procedure TfrmContracts.RefreshButtonClick(Sender: TObject);
begin
screen.Cursor:= crHourGlass;
DM.DataSet.close;
DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_ROOT_SELECT';
DM.DataSet.CloseOpen(true);
screen.Cursor:= crDefault;
end;

procedure TfrmContracts.FormShow(Sender: TObject);
begin
DataSetAfterOpen(DM.DataSet);
cxDBTreeList1.SetFocus;
if DM.DataSet.RecordCount >0 then
   cxDBTreeList1.DataController.FocusedRecordIndex :=0;
   
end;

procedure TfrmContracts.EntryRestButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.cnParamsToPakage.ID_DOG_ROOT:= DM.Dataset['ID_DOG_ROOT'];
 AParameter.cnParamsToPakage.ID_STUD:= DM.Dataset['ID_STUD_COLLECT'];
 AParameter.WaitPakageOwner:= frmContracts;
 RunFunctionFromPackage(AParameter, 'Contracts\cn_dt_EntryRest.bpl','ShowEntryRest');
 AParameter.Free;
 Screen.Cursor := crDefault;
end;

procedure TfrmContracts.PayButtonClick(Sender: TObject);
var AParameter : TcnSimpleParamsEx;
begin
 AParameter:= TcnSimpleParamsEx.Create;
 AParameter.Owner:=self;
 AParameter.Db_Handle:= DM.DB.Handle;
 AParameter.Formstyle:=fsNormal;
 AParameter.WaitPakageOwner:= frmContracts;
 AParameter.cnParamsToPakage.ID_STUD:=DM.DataSet['ID_STUD_COLLECT'];
 RunFunctionFromPackage(AParameter, 'Contracts\cn_inf_PaymentAnalysis.bpl','ShowPayment');
 end;

procedure TfrmContracts.Dog_Filter_EditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Dog_Filter_Edit.CurText = '' then exit;
if key = vk_return then
 begin
  Screen.Cursor := crHourGlass;
  DM.DataSet.Close;
  DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO('+
                             ''''+
                             cn_Common_Funcs.UpperCaseRusUkr(Dog_Filter_Edit.CurText)
                             + ''''+',';
  if FiltrByFIO_RadioButton.Checked then
  DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '1)'
  else
  DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '2)';
  DM.DataSet.Open;
  Screen.Cursor := crDefault;
  DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
  DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);  
 end;
end;

procedure TfrmContracts.FilterExecute_ButtonClick(Sender: TObject);
var ss: TShiftState;
   key : Word;
begin
ss:=[ssShift] ;
key :=13;
Dog_Filter_EditKeyDown(self, key, ss);
end;

procedure TfrmContracts.DsetRecordCountClick(Sender: TObject);
begin
DsetRecordCount.Caption:=   cnConsts.cn_DSetRecordCount[PLanguageIndex];
DsetRecordCount.Caption:=DsetRecordCount.Caption+ inttostr(Dm.DataSet.RecordCount);
end;

procedure TfrmContracts.PrintButtonClick(Sender: TObject);
begin
//PrintLoader.LPrintDogs(Self,DM.DB.Handle, DM.DataSet['ID_STUD_COLLECT']);
end;

end.

