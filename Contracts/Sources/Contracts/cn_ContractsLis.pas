unit cn_ContractsLis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxCalendar, cxCheckBox, cxMaskEdit, ActnList, cxClasses, ImgList, dxBar,
  dxBarExtItems, cxInplaceContainer, cxDBTL, cxTLData, StdCtrls,
  cxRadioGroup, cxControls, cxGroupBox,
  DM, IBase, cn_Common_Types, cn_Common_Funcs, cnConsts, Cn_Common_Loader,
  cn_Common_WaitForm, ExtCtrls;

type
  TfrmContractsReestr = class(TForm)
    Filtration_GroupBox: TcxGroupBox;
    FiltrByFIO_RadioButton: TcxRadioButton;
    FiltrByNum_RadioButton: TcxRadioButton;
    cxDBTreeList1: TcxDBTreeList;
    fio: TcxDBTreeListColumn;
    date_dog: TcxDBTreeListColumn;
    num_dog: TcxDBTreeListColumn;
    beg_date: TcxDBTreeListColumn;
    end_date: TcxDBTreeListColumn;
    isdiss: TcxDBTreeListColumn;
    ISMAINDOG_col: TcxDBTreeListColumn;
    ID_KEY_c: TcxDBTreeListColumn;
    ID_PARENT_c: TcxDBTreeListColumn;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    PayButton: TdxBarLargeButton;
    LgotaButton: TdxBarLargeButton;
    EntryRestButton: TdxBarLargeButton;
    HistoryButton: TdxBarLargeButton;
    FIO_BarContainer: TdxBarControlContainerItem;
    FilterExecute_Button: TdxBarButton;
    Dog_Filter_Edit: TdxBarEdit;
    GlobalFilterButton: TdxBarLargeButton;
    DsetRecordCount: TdxBarButton;
    CreditButton: TdxBarLargeButton;
    Faculty_Footer_Label: TdxBarStatic;
    Spec_Footer_Label: TdxBarStatic;
    Gragdanstvo_Footer_Label: TdxBarStatic;
    FormStudy_Footer_Label: TdxBarStatic;
    CategoryStudy_Footer_Label: TdxBarStatic;
    Kurs_Footer_Label: TdxBarStatic;
    Group_Footer_Label: TdxBarStatic;
    UpLoad_Button: TdxBarLargeButton;
    BreakDown_Button: TdxBarLargeButton;
    PayerData_Button: TdxBarButton;
    RastorgPri4ina_Button: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    Dodatki_Button: TdxBarSubItem;
    Log: TdxBarButton;
    RecoveryBtn: TdxBarButton;
    OrdersBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    Erased_Btn: TdxBarButton;
    NoteStatic: TdxBarStatic;
    ExportDataBtn: TdxBarButton;
    btnTwain: TdxBarLargeButton;
    LargeImages: TImageList;
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
    Contracts_ActionList: TActionList;
    FilterAction: TAction;
    Magic_DissToNotDiss_Action: TAction;
    ApostrofAction: TAction;
    PopupImageList: TImageList;
    Timer1: TTimer;
    procedure ExitButtonClick(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure Dog_Filter_EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Dog_Filter_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FilterExecute_ButtonClick(Sender: TObject);
    procedure FilterActionExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxDBTreeList1DblClick(Sender: TObject);
    procedure cxDBTreeList1KeyPress(Sender: TObject; var Key: Char);
  private
    DM:TDM_Contracts;
    PLanguageIndex : Integer;
    procedure FormIniLanguage;
    //DBH : TISC_DB_HANDLE;
  public
   constructor Create(Owner: TComponent; DBH : TISC_DB_HANDLE; Lng: integer); reintroduce;
  end;

var
  Res : Variant;

implementation

{$R *.dfm}

constructor TfrmContractsReestr.Create(Owner: TComponent; DBH : TISC_DB_HANDLE ; Lng: integer);
begin
Screen.Cursor:=crHourGlass;
inherited Create(Owner);
DM:=TDM_Contracts.Create(Self);
DM.DB.Handle:=DBH;
PLanguageIndex := Lng;
DM.DataSet.SQLs.SelectSQL.clear;
DM.DataSet.SQLs.SelectSQL.Text := 'select * from SYS_OPTIONS';
DM.DataSet.Open;
DM.DataSet.Close;
cxDBTreeList1.DataController.DataSource := DM.DataSource;
FormIniLanguage;
Screen.Cursor:=crDefault;
end;


procedure TfrmContractsReestr.FormIniLanguage;
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();

 //кэпшн формы
 Caption:=                      cnConsts.cn_ReestrContracts_Tiltle[PLanguageIndex];
 //названия кнопок
 ExitButton.Caption :=          cnConsts.cn_ExitBtn_Caption[PLanguageIndex];
 SelectBtn.Caption:=         cnConsts.cn_SelectBtn_Caption[PLanguageIndex];

 // Грид
 fio.Caption.Text:=             cnConsts.cn_grid_FIO_Column[PLanguageIndex];
 date_dog.Caption.Text:=        cnConsts.cn_grid_Date_Dog_Column[PLanguageIndex];
 num_dog.Caption.Text:=         cnConsts.cn_grid_Num_Dog_Column[PLanguageIndex];
 beg_date.Caption.Text:=        cnConsts.cn_grid_Date_Beg[PLanguageIndex];
 end_date.Caption.Text:=        cnConsts.cn_grid_Date_End[PLanguageIndex];
 isdiss.Caption.Text:=          cnConsts.cn_grid_IsDiss_Column[PLanguageIndex];

 // Фильтр
 Dog_Filter_Edit.Caption:=                cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
 FiltrByFIO_RadioButton.Caption:=         cnConsts.cn_FiltrByFIO[PLanguageIndex];
 FiltrByNum_RadioButton.Caption:=         cnConsts.cn_FiltrByNum[PLanguageIndex];
 FilterExecute_Button.Hint:=              cnConsts.cn_SearchBtn_Caption[PLanguageIndex];

 GlobalFilterButton.Caption:=             cnConsts.cn_FilterBtn_Caption[PLanguageIndex];
 GlobalFilterButton.Hint:=                cnConsts.cn_FilterBtn_Caption[PLanguageIndex];

 BarManager.Bars[1].Caption:=             cnConsts.cn_SearchBtn_Caption[PLanguageIndex];
// Dog_Filter_Edit.CurText:=                cnConsts.cn_FilterText[PLanguageIndex];
 DsetRecordCount.Caption:=                cnConsts.cn_DSetRecordCount[PLanguageIndex];
end;

procedure TfrmContractsReestr.ExitButtonClick(Sender: TObject);
begin
DM.DataSet.Close;
DM.Free;
Close;
end;

procedure TfrmContractsReestr.SelectBtnClick(Sender: TObject);
begin
if DM.DataSet.RecordCount = 0 then Exit;

          Res:=VarArrayCreate([0,4],varVariant);
          Res[0]:= DM.DataSet['ID_DOG_ROOT'];
          Res[1]:= DM.DataSet['ID_DOG_LAST'];
          Res[2]:= DM.DataSet['ID_STUD'];
          Res[3]:= DM.DataSet['DATE_BEG'];
          ModalResult := mrOk;
end;

procedure TfrmContractsReestr.Dog_Filter_EditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var   wf:TForm;
 begin
if Dog_Filter_Edit.CurText = '' then exit;
if key = vk_return then
 begin
  Screen.Cursor := crHourGlass;
  wf:=ShowWaitForm(self,wfLoadPackage);
  DM.DataSet.Close;
  DM.DataSet.SelectSQL.Text:= 'select * from CN_DT_DOG_ROOT_FILTER_FIO_HS('+
                             ''''+
                             cn_Common_Funcs.UpperCaseRusUkr(Dog_Filter_Edit.CurText)
                             + ''''+',';
  if FiltrByFIO_RadioButton.Checked then
  DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '1'
  else
  DM.DataSet.SelectSQL.Text:=DM.DataSet.SelectSQL.Text + '2';
  DM.DataSet.SelectSQL.Text:= DM.DataSet.SelectSQL.Text + ',' + '1, -1' + ','+ ''''+ 'O' + '''' + ')';;
  DM.DataSet.Open;
  Screen.Cursor := crDefault;
  CloseWaitForm(wf);
 end;
end;

procedure TfrmContractsReestr.Dog_Filter_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then cxDBTreeList1.SetFocus;

if ((key <> #8) and (key <> '/')) then
if IntegerCheck(Key) then
  FiltrByNum_RadioButton.Checked:=true
else
  FiltrByFIO_RadioButton.Checked:=true;
end;

procedure TfrmContractsReestr.FilterExecute_ButtonClick(Sender: TObject);
var ss: TShiftState;
   key : Word;
begin
ss:=[ssShift] ;
key :=13;
Dog_Filter_EditKeyDown(self, key, ss);
end;

procedure TfrmContractsReestr.FilterActionExecute(Sender: TObject);
begin
Dog_Filter_Edit.Setfocus;
end;

procedure TfrmContractsReestr.Timer1Timer(Sender: TObject);
begin
FilterActionExecute(Sender);
Timer1.Enabled := false;
end;

procedure TfrmContractsReestr.cxDBTreeList1DblClick(Sender: TObject);
begin
  SelectBtnClick(Sender);
end;

procedure TfrmContractsReestr.cxDBTreeList1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then   SelectBtnClick(Sender);
end;

end.
