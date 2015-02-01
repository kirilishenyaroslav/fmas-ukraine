//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма-справочник проживающих (исходная и главная по проживанию)     *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_Ptio_Registration;

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
  cxDBLookupEdit, cxDBExtLookupComboBox, Menus, cxCheckBox,
  st_sys_Pfio_SelectThread, cxRadioGroup, LoadPackegeStudCity, dxStatusBar,
  cxProgressBar, cxDBLookupComboBox, AccMGMT, St_Loader_Unit,
  st_Proc, st_ConstUnit, cn_ExtraFilter_Unit, st_Common_Messages,
  st_common_funcs, Unit_of_Utilits;

type
  TRegistration_Form = class(TForm)
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    WriteProc: TpFIBStoredProc;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    LargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Category_Label: TEdit;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    cxGridDBTableColumn8: TcxGridDBColumn;
    ReadDataSet: TpFIBDataSet;
    Bevel4: TBevel;
    Filter_BarEdit1: TdxBarEdit;
    dxBarButton5: TdxBarButton;
    FIO_CheckBox: TcxRadioButton;
    Nomer_CheckBox: TcxRadioButton;
    Filter_Button: TcxButton;
    CancelFiltr_Button: TcxButton;
    cxLabel5: TcxLabel;
    Status_Edit: TEdit;
    Filter_BarEdit: TcxTextEdit;
    Filtration: TAction;
    Dogovor_Label: TEdit;
    Propusk_Label: TEdit;
    dxBarDateCombo1: TdxBarDateCombo;
    dxBarDateCombo2: TdxBarDateCombo;
    dxBarStatic1: TdxBarStatic;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    Filter_Kat_Button: TcxButton;
    Cancel_Filter_Kat_Button: TcxButton;
    dxBarStatic2: TdxBarStatic;
    Po_Label: TcxLabel;
    dxBarStatic3: TdxBarStatic;
    END_REGISTRATION_FLAG: TcxGridDBColumn;
    Calc_Button: TButton;
    dxBarButton3: TdxBarButton;
    dxBarStatic4: TdxBarStatic;
    N3: TdxBarButton;
    PayButton: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    dxBarButton4: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarStatic5: TdxBarStatic;
    dxBarLargeButton4: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    SearchAction: TAction;
    HotKey_StatusBar: TdxStatusBar;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxStatusBar1: TdxStatusBar;
    HotKey_StatusBarContainer5: TdxStatusBarContainerControl;
    Progress: TcxProgressBar;
    Propiska_LargeButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    dxBarButton9: TdxBarButton;
    Status_ComboBox: TcxComboBox;
    Status_Label: TcxLabel;
    calc: TdxBarButton;
    Propi: TdxBarButton;
    Narush: TdxBarButton;
    print: TdxBarButton;
    Prikaz_BarLargeButton: TdxBarLargeButton;
    ISSENDINGDOWN: TcxGridDBColumn;
    Edit_PopupMenu: TdxBarPopupMenu;
    Subsidy_Modify: TdxBarButton;
    Lgots_Modify: TdxBarButton;
    SpyMonitor: TdxBarButton;
    Spy_Action: TAction;
    Subcidy_EditAction: TAction;
    Lgots_EditAction: TAction;
    ViewButton: TdxBarLargeButton;
    ApostrofAdd: TAction;
    Electorat_Button: TdxBarLargeButton;
    Electorat_Menu: TdxBarPopupMenu;
    AddToElectorat: TdxBarButton;
    DelFromElectorat: TdxBarButton;
    cxStyletoone: TcxStyle;
    Filter_Btn: TdxBarLargeButton;
    Inc_Button: TdxBarLargeButton;
    Barcode_CheckBox: TcxRadioButton;
    Act_help: TAction;
    PIB_Label: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddButton1Click(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure Name_BarButtonClick(Sender: TObject);

    procedure Filter_BarEdit1Enter(Sender: TObject);
    procedure Filter_BarEdit1Exit(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure Filter_BarEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Filter_ButtonClick(Sender: TObject);
    procedure CancelFiltr_ButtonClick(Sender: TObject);
    procedure Calc_ButtonClick(Sender: TObject);
    procedure Filter_BarEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Filter_Kat_ButtonClick(Sender: TObject);
    procedure cxGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure Cancel_Filter_Kat_ButtonClick(Sender: TObject);
    procedure PayButtonClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure PrintButtonClick(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure cxGridDBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure Propiska_LargeButtonClick(Sender: TObject);
    procedure Status_ComboBoxPropertiesCloseUp(Sender: TObject);
    procedure RazvorotActionExecute(Sender: TObject);
    procedure calcClick(Sender: TObject);
    procedure PropiClick(Sender: TObject);
    procedure NarushClick(Sender: TObject);
    procedure printClick(Sender: TObject);
    procedure Prikaz_BarLargeButtonClick(Sender: TObject);
    procedure Subsidy_ModifyClick(Sender: TObject);
    procedure Lgots_ModifyClick(Sender: TObject);
    procedure SpyMonitorClick(Sender: TObject);
    procedure Spy_ActionExecute(Sender: TObject);
    procedure Subcidy_EditActionExecute(Sender: TObject);
    procedure Lgots_EditActionExecute(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure ApostrofAddExecute(Sender: TObject);
    procedure AddToElectoratClick(Sender: TObject);
    procedure Electorat_ButtonClick(Sender: TObject);
    procedure DelFromElectoratClick(Sender: TObject);
    procedure Filter_BtnClick(Sender: TObject);
    procedure Inc_ButtonClick(Sender: TObject);
    procedure Act_helpExecute(Sender: TObject);
  private
    GroupString, SpecString : string;
    Comboflag: integer;
    IsStatusOnFilter: boolean;
    id_session_calc, id_session_pay, id_session_filter : int64;
    Registration_Form_AddViewMode: boolean;
    PLanguageIndex: byte;
    procedure FormIniLanguage;
    procedure AcademicYear;
    procedure AcademicYearPropiska(Kurs : smallint);
    function DecodeDateToNomerDogovor : string;
  public
    is_admin : Boolean;
    Pfio_SelectThread: TPfio_SelectThread;
    KeyField    : string;
    edit_item_id  : Int64;
    KS, Beg_KS: TKeyboardState;
    Subsidy_Edit, Lgots_Edit: Boolean;
    procedure SelectAll;
  end;

var
  Registration_Form: TRegistration_Form;

implementation
uses St_Pfio_First_Add_Form, Main, St_Pfio_Add_Form,
     st_sp_lgota_FORM_ADD, ST_DT_SQL_WaitForm, St_pfio_OplataSprav_Form_Unit,
     DataModule1_Unit, pFIBProps, Propiska;
{$R *.dfm}

function StringPrepareToQueryText(AText:string):string;
var I:integer;
    TStr:string;
begin
 i:=1;
 While i<>Length(AText)+1 do
  begin
   if copy(Atext,i,1)='''' then
    begin
     TStr:=copy(Atext,i+1,Length(Atext)-i);
     delete(Atext,i+1,Length(Atext)-i);
     AText:=AText+''''+TStr;
     inc(i);
    end;
    inc(i);
  end;
 result:=Atext;
end;

{function LocateInDataSet(DSet:TpFIBDataSet;KeyField:string;KeyFieldValue:variant):boolean;
var RecordCount:int64;
    IndexCurrentRecord:int64;
    IsForward:boolean;
begin
 IsForward:=True;
 IndexCurrentRecord:=0;
 DSet.Last;
 RecordCount:=DSet.RecNo;
 DSet.First;
 while DSet.RecNo<>IndexCurrentRecord do
  begin
   IndexCurrentRecord:=DSet.RecNo;
   if IsForward then DSet.RecNo:=IndexCurrentRecord+(RecordCount-IndexCurrentRecord) div 2
   else
    begin
     DSet.RecNo:=IndexCurrentRecord+(RecordCount-IndexCurrentRecord) div 2;
     RecordCount:=IndexCurrentRecord;
    end;
   IsForward := VarToStr(DSet[KeyField])<VarToStr(KeyFieldValue);
  end;
end;}
procedure TRegistration_Form.FormIniLanguage;
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 AddButton.Caption :=           st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Caption :=          st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Caption :=        st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 RefreshButton.Caption :=       st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 PrintButton.Caption:=          st_ConstUnit.st_Print_Caption[PLanguageIndex];
 PayButton.Caption:=            st_ConstUnit.st_Pay_Caption[PLanguageIndex];
 PayButton.Hint:=               st_ConstUnit.st_Pay_Caption[PLanguageIndex];
 ViewButton.Caption:=           st_ConstUnit.st_ViewBtn_Caption[PLanguageIndex];
 ViewButton.Hint:=              st_ConstUnit.st_ViewBtn_Caption[PLanguageIndex];
 Propiska_LargeButton.Caption:= st_ConstUnit.st_PropiBtn_Caption[PLanguageIndex];
 Propiska_LargeButton.Hint:=    st_ConstUnit.st_PropiBtn_Caption[PLanguageIndex];
 Prikaz_BarLargeButton.Caption:=st_ConstUnit.st_NakazBtn_Caption[PLanguageIndex];
 Prikaz_BarLargeButton.Hint:=   st_ConstUnit.st_NakazBtn_Caption[PLanguageIndex];
 dxBarLargeButton4.Caption:=    st_ConstUnit.st_NarushBtn_Caption[PLanguageIndex];
 dxBarLargeButton4.Hint:=       st_ConstUnit.st_NarushBtn_Caption[PLanguageIndex];
 ExitButton.Caption :=          st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

 Filter_Btn.Caption :=          st_ConstUnit.st_FilterBtn_Caption[PLanguageIndex];
 Filter_Btn.Hint:=               st_ConstUnit.st_FilterBtn_Caption[PLanguageIndex];

 Inc_Button.Caption :=          st_ConstUnit.st_Inc_Caption[PLanguageIndex];
 Inc_Button.Hint:=              st_ConstUnit.st_Inc_Hint[PLanguageIndex];

 FIO_CheckBox.Caption :=        st_ConstUnit.st_SearchByIdFIOCaption[PLanguageIndex];
 Nomer_CheckBox.Caption :=      st_ConstUnit.st_SearchByIdNalogCaption[PLanguageIndex];
 Barcode_CheckBox.Caption :=    st_constUnit.st_SearchByBarcodeCaption[PLanguageIndex];
 {pop_up_onMainmenu}
 Subsidy_Modify.Caption :=      st_ConstUnit.st_Subsidy_Modify[PLanguageIndex];
 Subsidy_Modify.Hint :=         st_ConstUnit.st_Subsidy_Modify[PLanguageIndex];
 Lgots_Modify.Caption :=        st_ConstUnit.st_Lgots_Modify[PLanguageIndex];
 Lgots_Modify.Hint :=           st_ConstUnit.st_Lgots_Modify[PLanguageIndex];
 {pop_up menu}
 // добавить
 dxBarButton4.Caption:=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 // изменить
 dxBarButton6.Caption:=         st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 // удалить
 dxBarButton7.Caption:=         st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 // обновить
 dxBarButton8.Caption:=         st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
 // печать
 print.Caption:=         st_ConstUnit.st_Print_Caption[PLanguageIndex];
 // оплата
 calc.Caption:=         st_ConstUnit.st_Pay_Caption[PLanguageIndex];
 // прописка
 Propi.Caption:=         st_ConstUnit.st_PropiBtn_Caption[PLanguageIndex];
 // нарушения
 Narush.Caption:=         st_ConstUnit.st_NarushBtn_Caption[PLanguageIndex];
 // мониторинг записи
 SpyMonitor.Caption:=         st_ConstUnit.st_SpyMonutor_Caption[PLanguageIndex];
 // выход
 dxBarButton9.Caption:=         st_ConstUnit.st_ExitBtn_Caption[PLanguageIndex];

 Electorat_Button.Caption:=         st_ConstUnit.st_Electorat[PLanguageIndex];

 Cancel_Filter_Kat_Button.hint := st_ConstUnit.st_CancelFilter_Hint[PLanguageIndex];
 CancelFiltr_Button.hint :=       st_ConstUnit.st_CancelFilter_Hint[PLanguageIndex];
 dxBarStatic4.hint :=             st_ConstUnit.st_FioSearch_Hint[PLanguageIndex];
 dxBarStatic3.hint :=             st_ConstUnit.st_ReestrFilter_Hint[PLanguageIndex];
 Filter_Button.hint :=            st_ConstUnit.st_GoFilter_Hint[PLanguageIndex];
 Filter_Kat_Button.hint :=        st_ConstUnit.st_GoFilter_Hint[PLanguageIndex];
 FIO_CheckBox.hint :=             st_ConstUnit.st_FIOFilter_Hint[PLanguageIndex];
 Nomer_CheckBox.hint :=           st_ConstUnit.st_NalofFilter_Hint[PLanguageIndex];
 Filter_BarEdit.hint :=           st_ConstUnit.st_Combo_Hint[PLanguageIndex];

  //статусбар
  dxStatusBar1.Panels[0].Text:=  st_ConstUnit.st_HelpBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_HelpBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[1].Text:=  st_ConstUnit.st_InsertBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[2].Text:=  st_ConstUnit.st_EditBtn_ShortCut[PLanguageIndex]    + st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[3].Text:=  st_ConstUnit.st_DeleteBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[4].Text:=  st_ConstUnit.st_RefreshBtn_ShortCut[PLanguageIndex] + st_ConstUnit.st_RefreshBtn_Caption[PLanguageIndex];
  dxStatusBar1.Panels[5].Text:=  st_ConstUnit.st_FilterBtn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_FilterBtn_Caption[PLanguageIndex];

 HotKey_StatusBar.Panels[0].Text:=  st_ConstUnit.st_F6Btn_ShortCut[PLanguageIndex]      + st_ConstUnit.st_Pay_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[1].Text:=  st_ConstUnit.st_CtrlF8Btn_ShortCut[PLanguageIndex]  + st_ConstUnit.st_NarushBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[2].Text:=  st_ConstUnit.st_F9Btn_ShortCut[PLanguageIndex]      + st_ConstUnit.st_PropiBtn_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[3].Text:=  st_ConstUnit.st_PrintBtn_ShortCut[PLanguageIndex]   + st_ConstUnit.st_Print_Caption[PLanguageIndex];
 HotKey_StatusBar.Panels[4].Text:=  st_ConstUnit.st_F8Btn_ShortCut[PLanguageIndex]      + st_ConstUnit.st_NakazBtn_Caption[PLanguageIndex];
 Progress.Hint:=                    st_ConstUnit.st_ProgressBtn_Caption[PLanguageIndex];
 dxStatusBar1.Hint:=                st_ConstUnit.st_HotKeys[PLanguageIndex];
 HotKey_StatusBar.Hint:=            st_ConstUnit.st_HotKeys[PLanguageIndex];

 AddToElectorat.Caption :=        st_ConstUnit.st_ElectoratPlus[PLanguageIndex];
 DelFromElectorat.Caption :=      st_ConstUnit.st_ElectoratMinus[PLanguageIndex];
 //lables
 dxBarStatic4.Caption :=      st_ConstUnit.st_FilterBtn_Caption[PLanguageIndex];
 dxBarStatic3.Caption :=      st_ConstUnit.st_FilterZBtn_Caption[PLanguageIndex];
 cxLabel3.Caption :=          st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
 cxLabel2.Caption :=          st_ConstUnit.st_footer_Category[PLanguageIndex];
 cxLabel5.Caption :=          st_ConstUnit.st_Status[PLanguageIndex];
 cxLabel4.Caption :=          st_ConstUnit.st_Dog[PLanguageIndex];
 cxLabel1.Caption :=          st_ConstUnit.st_Propuk[PLanguageIndex];

 // Грид
 cxGridDBTableView1.Columns[0].Caption:= st_ConstUnit.st_grid_FIO_Column[PLanguageIndex];
 cxGridDBTableView1.Columns[1].Caption:= st_ConstUnit.st_footer_Faculty[PLanguageIndex];
 cxGridDBTableView1.Columns[2].Caption:= st_ConstUnit.st_footer_Kurs[PLanguageIndex];
 cxGridDBTableView1.Columns[4].Caption:= st_ConstUnit.st_grid_Hostel[PLanguageIndex];
 cxGridDBTableView1.Columns[5].Caption:= st_ConstUnit.st_grid_HostelRoom[PLanguageIndex];
 cxGridDBTableView1.Columns[7].Caption:= st_ConstUnit.st_grid_Num_Nalog_Column[PLanguageIndex];
end;

procedure TRegistration_Form.AcademicYearPropiska(Kurs : smallint) ;
var NowDate: TDateTime;
    Now_Year, Now_Month, Now_Day: Word;
    End_Year, End_Month, End_Day: Word;
    AddOn:Smallint;
begin
NowDate :=DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;

DecodeDate(NowDate,Now_Year,Now_Month,Now_Day);

{когда на 4 года прописка
case Kurs of
  1: AddOn := 4;
  2: AddOn := 3;
  3: AddOn := 2;
  4: AddOn := 1;
  5: AddOn := 0;
else AddOn := 0;
end; }

{когда на 5 лет прописка}
case Kurs of
  1: AddOn := 5;
  2: AddOn := 4;
  3: AddOn := 3;
  4: AddOn := 2;
  5: AddOn := 1;
else AddOn := 0;
end;

if Now_Month >=7 then begin
Now_Day:=1;
Now_Month:=9;
End_Day:=15;
End_Month:=6;
End_Year := Now_Year;

frmPropiska.prp_prp_DateEndPropi.Date:=EncodeDate(End_Year+AddOn,End_Month,End_Day);
end
else begin
Now_Day:=1;
Now_Month:=9;
End_Day:=15;
End_Month:=6;
End_Year := Now_Year;
frmPropiska.prp_prp_DateEndPropi.Date:= EncodeDate(End_Year+AddOn,End_Month,End_Day);
end;
end;



procedure TRegistration_Form.AcademicYear ;
var NowDate: TDateTime;
    Now_Year, Now_Month, Now_Day: Word;
    End_Year, End_Month, End_Day: Word;
begin
NowDate :=DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
DecodeDate(NowDate,Now_Year,Now_Month,Now_Day);
if Now_Month >=7 then begin
Now_Day:=1;
Now_Month:=9;
End_Day:=1;
End_Month:=7;
End_Year := Now_Year+1;
DateBegEdit.Date:=EncodeDate(Now_Year,Now_Month,Now_Day);
DateEndEdit.Date:=EncodeDate(End_Year,End_Month,End_Day);
end
else begin
Now_Day:=1;
Now_Month:=9;
End_Day:=1;
End_Month:=7;
End_Year := Now_Year;
DateBegEdit.Date:=EncodeDate(Now_Year-1,Now_Month,Now_Day);
DateEndEdit.Date:=EncodeDate(End_Year,End_Month,End_Day);
end;
end;

procedure TRegistration_Form.SelectAll;
begin
with Registration_Form.DataSet do begin
if Active then close;
Open;
end;
Registration_Form.Progress.Properties.Max:=Registration_Form.DataSet.RecordCount+10;
end;

procedure TRegistration_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action :=caFree;
MainForm.N9.enabled:=true;
MainForm.CloseAllWindows;
end;

function TRegistration_Form.DecodeDateToNomerDogovor : string;
var
  Short_Year , Num, NN: string;
begin
  ShortDateFormat:= 'yy';
  Short_Year:= FormatDateTime(ShortDateFormat, DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP);
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select EXIST_YEAR from ST_DT_PFIO_N_DOGOVOR_Check ('+''''+ Short_Year+'''' +')';
  ReadDataSet.Open;
  Progress.Position:=50;
  Progress.Update;
  if  ReadDataSet['EXIST_year'] = 0 then begin
  WriteProc.StoredProcName := 'SYS_ST_YEAR_OPTIONS_INS_DOG_SYS';
  //start_sql_monitor;
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('YEAR_IN').AsString := Short_Year;
  WriteProc.ExecProc;
  try
    WriteProc.Transaction.commit;
    except
     on E:Exception do
       begin
        stShowMessage('Error in SYS_ST_YEAR_OPTIONS_INS_DOG_SYS',e.Message,mtError,[mbOK]);
        WriteProc.Transaction.Rollback;
        //Send_mail(e.Message);
       end;
   end;
  //stop_sql_monitor;
  WriteProc.Close;
  end;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select * from ST_DT_PFIO_N_DOGOVOR_SELECT ('+''''+ Short_Year+'''' +')';
  ReadDataSet.Open;
  Progress.Position:=80;
  Progress.Update;
  Num:= inttostr(ReadDataSet['dogovor_sys']);
  NN:=  inttostr(ReadDataSet ['NOMENKLATUR_NOMER']);
  ReadDataSet.Close;
  Progress.Position:=90;
  Progress.Update;
  Result:= Short_Year+ '/' + Num + '-' + NN;
  ShortDateFormat:='dd/mm/yyyy';
end;

procedure TRegistration_Form.AddButton1Click(Sender: TObject);
var
  new_id    : Int64;
  Short_Year : string;
  ViewForm_first_add : TRegistration_Form_First_Add;
begin
  if not is_admin then
  if fibCheckPermission('/ROOT/Studcity/LiversWork','Add') <> 0 then
   begin
    messagebox(handle,
    pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
    +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
    pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
    exit;
   end;

  Progress.Position:=5;
  Progress.Update;
  Screen.Cursor:=crHourGlass;
  ViewForm_first_add := TRegistration_Form_First_Add.Create(Self, DataModule1.DB.Handle);

  ViewForm_first_add.is_admin := is_admin;
  Progress.Position:=10;
  Progress.Update;

  ViewForm_first_add.Dogovor_DateEdit.Date := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
  ViewForm_first_add.Nomer_Dogovora.Text   := DecodeDateToNomerDogovor;
  ViewForm_first_add.DateBorn_Edit.Date    := strtodate('01.01.1900');

  Progress.Position:=100;
  Progress.Update;

  ViewForm_first_add.ShowModal;

  if ViewForm_first_add.ModalResult = mrOK then
   begin
    Screen.Cursor:=crHourGlass;

    Progress.Position:=5;
    Progress.Update;

    Registration_Form.Update;

  //Добавляем основные сведения по проживающему
  //start_sql_monitor;
  WriteProc.StoredProcName := 'ST_DT_PFIO_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;

  if Progress.Position <> 100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.update;
   end;

  WriteProc.ParamByName('NUM_DOG').AsString := ViewForm_first_add.Nomer_Dogovora.Text;
  WriteProc.ParamByName('DATE_DOG').AsDate := ViewForm_first_add.Dogovor_DateEdit.EditValue;
  WriteProc.ParamByName('ARCHIV').AsInteger:=0;
  WriteProc.ParamByName('DATE_REG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
  WriteProc.ParamByName('DATE_EDIT').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
  WriteProc.ParamByName('TN').AsString:= ViewForm_first_add.Tabel_Edit.Text;
  WriteProc.ParamByName('ID_N_NALOG').AsString:= ViewForm_first_add.Nalog_Edit.Text;

  WriteProc.ParamByName('FAMILIA').AsString   := ViewForm_first_add.Familia_Edit.Text; //rus
  WriteProc.ParamByName('IMYA').AsString      := ViewForm_first_add.Name_Edit .Text;
  WriteProc.ParamByName('OTCHESTVO').AsString := ViewForm_first_add.Otch_Edit.Text;

  WriteProc.ParamByName('FAM_UK').AsString  := ViewForm_first_add.Fam_ukr; //ukr
  WriteProc.ParamByName('IMYA_UK').AsString := ViewForm_first_add.name_ukr;
  WriteProc.ParamByName('OT_UK').AsString   := ViewForm_first_add.Otch_ukr;
  
  WriteProc.ParamByName('DATA_R').AsDate := ViewForm_first_add.DateBorn_Edit.Date;
  if ViewForm_first_add.Pol_ComboBox.ItemIndex=0 then WriteProc.ParamByName('POL').AsString := 'м' else WriteProc.ParamByName('POL').AsString := 'ж';
  if ViewForm_first_add.Inostranez_CheckBox.Checked then WriteProc.ParamByName('INOSTRANEZ').AsInteger := 1 else WriteProc.ParamByName('INOSTRANEZ').AsInteger := 0;

  WriteProc.ParamByName('ID_MAN').AsInt64 := ViewForm_first_add.ID_MAN;
//---факультеты-----------------------------------

  if ViewForm_first_add.id_group <>-1 then
  WriteProc.ParamByName('ID_GROUP').AsInt64 := ViewForm_first_add.id_group;


  if ViewForm_first_add.Id_department <>-1 then
  WriteProc.ParamByName('N_FAK').AsInt64 :=ViewForm_first_add.Id_department;

  if ViewForm_first_add.id_spec <>-1 then
  WriteProc.ParamByName('id_SPEC').AsInt64 := ViewForm_first_add.id_spec;

  if ViewForm_first_add.Spec_ComboBox.Visible then
  WriteProc.ParamByName('SPEC').AsString:= ViewForm_first_add.Spec_ComboBox.Text;

  if  ((ViewForm_first_add.Kurs_ComboBox.Visible) and (ViewForm_first_add.Kurs_ComboBox.ItemIndex <> -1)) then
  case ViewForm_first_add.Kurs_ComboBox.ItemIndex of
  0:   WriteProc.ParamByName('KURS').AsInteger := 1;
  1:   WriteProc.ParamByName('KURS').AsInteger := 2;
  2:   WriteProc.ParamByName('KURS').AsInteger := 3;
  3:   WriteProc.ParamByName('KURS').AsInteger := 4;
  4:   WriteProc.ParamByName('KURS').AsInteger := 5;
  5:   WriteProc.ParamByName('KURS').AsInteger := 6;
  else
  WriteProc.ParamByName('KURS').AsInteger := 0;
  end;
   if Progress.Position<>100 then begin
  Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
  Progress.update;
  end;
  //WriteProc.ParamByName('TYPE_PROPI').AsInteger := ;

  if ViewForm_first_add.Propiska_CheckBox.Checked then WriteProc.ParamByName('PROPISKA_EXIST').AsInteger := 1 else WriteProc.ParamByName('PROPISKA_EXIST').AsInteger := 0;
  if ViewForm_first_add.Propusk_CheckBox.Checked then WriteProc.ParamByName('PRIN_NPASS').AsInteger := 1 else WriteProc.ParamByName('PRIN_NPASS').AsInteger := 0;

  WriteProc.ExecProc;

  new_id := WriteProc[KeyField].AsInt64; //Новый ключ для проживающего

  //----------------------------------------------------------------------------
  //Добавление информации из справочника физ.лиц.
  WriteProc.StoredProcName := 'ST_DT_PFIO_FIZ_INF';
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KOD').AsInt64 := new_id;
  WriteProc.ParamByName('ID_MAN').AsInt64 := ViewForm_first_add.ID_MAN;
  WriteProc.ExecProc;

  // заполняю СТАТУС
  WriteProc.StoredProcName := 'ST_DT_PFIO_STATUS_INSERT';
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_KOD').AsInt64 := new_id;
  if ViewForm_first_add.Propiska_CheckBox.Checked
   then WriteProc.ParamByName('TYPE_PROPI').AsInteger := 2
   else WriteProc.ParamByName('TYPE_PROPI').AsInteger := 1;
  WriteProc.ExecProc;

  // после того, как данные введены -
  // генерирую следущее знаение DOGOVOR_SYS в таблице Year_sys через хранимую процедуру
  // (используя генератор через update поля, где год совпадает)
  // приходится экстрактить год заново :(
  ShortDateFormat:= 'yy';
  Short_Year:= FormatDateTime(ShortDateFormat, DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP);
  WriteProc.StoredProcName := 'SYS_ST_YEAR_OPTIONS_UPD_DOG_SYS';
  WriteProc.Prepare;
  WriteProc.ParamByName('SYS_YEAR').AsString := Short_Year ;
  WriteProc.ExecProc;
  if Progress.Position<>100 then begin
  Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
  Progress.update;
  end;
  ShortDateFormat:= 'dd/mm/yyyy';
// добавление проживания
   WriteProc.StoredProcName := 'ST_DT_HROOM_INSERT';
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KOD').AsInt64    := new_id;
   WriteProc.ParamByName('KOD_BUILD').AsInt64 := ViewForm_first_add.ID_Build ;
   WriteProc.ParamByName('N_ROOM').AsString   := ViewForm_first_add.Nomer_Komnat_Edit.text ;
   WriteProc.ParamByName('Type_Room').AsInt64 := ViewForm_first_add.ID_Type_Room_Select;
   WriteProc.ParamByName('BEG_DATE').AsDate   := ViewForm_first_add.Build_Beg_DateEdit.Date;
   WriteProc.ParamByName('END_DATE').AsDate   := ViewForm_first_add.Build_End_DateEdit.Date;
   WriteProc.ExecProc;
    if Progress.Position<>100 then
     begin
      Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
      Progress.update;
     end;

  WriteProc.StoredProcName := 'ST_DT_HROOM_EXCHANGE_ADD';
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInt64 := new_id;
  WriteProc.ExecProc;

// добавление  категории оплаты
   WriteProc.StoredProcName := 'ST_DT_PFKAT_INSERT';
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KOD').AsInt64 := new_id;
   WriteProc.ParamByName('KATEGORIYA').AsInt64 := ViewForm_first_add.ID_Category;
   WriteProc.ParamByName('BEG_DATE').AsDate :=    ViewForm_first_add.Build_Beg_DateEdit.Date;
   WriteProc.ParamByName('END_DATE').AsDate :=    ViewForm_first_add.Build_End_DateEdit.Date;
   WriteProc.ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
   WriteProc.ParamByName('USE_END').AsDateTime := SYS_MAX_TIMESTAMP;
   WriteProc.ExecProc;
    if Progress.Position<>100 then
     begin
      Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
      Progress.update;
     end;

 // добавление  информации о пользователе
   WriteProc.StoredProcName := 'ST_DT_PFIO_RECORD_CONTROL';
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KOD').AsInt64 :=     new_id;
   WriteProc.ParamByName('LOGIN_INS').AsString:=  AccessResult.Name_user;
   WriteProc.ParamByName('LOGIN_UPT').AsVariant:= null;
   WriteProc.ExecProc;

// добавление номера ордера

   WriteProc.StoredProcName := 'ST_DT_PFIO_ORDER_NUM_INS';
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KOD').AsInt64 :=     new_id;
   WriteProc.ParamByName('KOD_BUILD').AsInt64:= strtoint(ViewForm_first_add.TypeEdit.Text) ;
   WriteProc.ExecProc;
   try
    WriteProc.Transaction.Commit;
    except
     on E:Exception do
       begin
        stShowMessage('Error in ST_DT_PFIO_ORDER_NUM_INS',e.Message,mtError,[mbOK]);
        WriteProc.Transaction.Rollback;
        //Send_mail(e.Message);
       end;
   end;
  //stop_sql_monitor;

 ViewForm_first_add.Free;
 Progress.Position:= 99;
 Progress.update;

 Screen.Cursor:=crDefault;
 Progress.Position:= 100;
 Progress.update;

  DataSet.SQLs.InsertSQL.Text:='execute procedure z_empty_proc';
  DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(new_id)+')';
  DataSet.Insert;
  DataSet.Post;

  if DataSet['UK_FIO_COMBO'] <> null then PIB_Label.Text := DataSet['UK_FIO_COMBO'];
  if DataSet['SHORT_NAME_CATEGORY'] <> null then Category_Label.Text := DataSet['SHORT_NAME_CATEGORY'] ;
  if DataSet['NUM_DOG'] <> null then Dogovor_Label.Text:=DataSet['NUM_DOG'] ;
  if DataSet['STATUS'] <> null then Status_Edit.Text:=DataSet['STATUS'] ;

  exit;
end;
 Screen.Cursor:=crDefault;
 ViewForm_first_add.Free;
 ShortDateFormat:= 'dd/mm/yyyy'; // на всякий случай
end;

procedure TRegistration_Form.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TRegistration_Form.FormCreate(Sender: TObject);
var
  i : integer;
begin
  Registration_Form_AddViewMode := false;

  DataSet.SelectSQL.Text := 'Select * from ST_DT_PFIO_SELECT';

  Pfio_SelectThread:= TPfio_SelectThread.Create(True);
  Pfio_SelectThread.FreeOnTerminate:=true;
  Pfio_SelectThread.Resume;
  KeyField := 'ID_KOD';

  Subsidy_Edit:=false;
  Lgots_Edit:=false;

  IsStatusOnFilter := false;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select NAME_PROPI from ST_INI_PROPI_TYPE_Select';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;

  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    Status_ComboBox.Properties.Items.Add(ReadDataSet['NAME_PROPI']);
    ReadDataSet.Next;
   end;

  Status_ComboBox.ItemIndex:=0;
  ReadDataSet.Close;
  FormIniLanguage;

  id_session_filter := -1;
  WriteProc.StoredProcName := 'ST_DT_REPORTS_TRANSACTION';
  WriteProc.Transaction.StartTransaction;
  WriteProc.ExecProc;
  id_session_filter := WriteProc.ParamByName('ID_TRANSACTION').AsInt64;
  try
   WriteProc.Transaction.Commit;
   except
    WriteProc.Transaction.Rollback;
    raise;
  end; 
end;

procedure TRegistration_Form.FormShow(Sender: TObject);
begin
  AcademicYear ;
  Nomer_CheckBox.BringToFront;
  FIO_CheckBox.BringToFront;
  Filter_BarEdit.BringToFront;
  Filter_Button.BringToFront;
  CancelFiltr_Button.BringToFront;
  DateBegEdit.BringToFront;
  DateEndEdit.BringToFront;
  Po_Label.BringToFront;
  Filter_Kat_Button.BringToFront;
  Cancel_Filter_Kat_Button.BringToFront;
  Status_ComboBox.BringToFront;
  Status_Label.BringToFront;
end;

procedure TRegistration_Form.DataSetAfterOpen(DataSet: TDataSet);
begin
if MainForm.WaitFormHandle then SQL_Wait_Form.Wait_RecordCount:=DataSet.RecordCount;
dxStatusBar1.Panels[5].Text:= 'Кіль-сть записів: ' + inttostr(DataSet.RecordCount);

if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
  end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
  end;
if  DataSet.RecordCount<> 0 then begin
if DataSet['UK_FIO_COMBO'] <> null then PIB_Label.Text := DataSet['UK_FIO_COMBO'];
if DataSet['SHORT_NAME_CATEGORY'] <> null then Category_Label.Text := DataSet['SHORT_NAME_CATEGORY'] ;
if DataSet['NUM_DOG'] <> null then Dogovor_Label.Text:=DataSet['NUM_DOG'] ;
if DataSet['STATUS'] <> null then Status_Edit.Text:=DataSet['STATUS'] ;
if Dataset['NUM_PROP'] <> null then
begin
Propusk_Label.Text:=Dataset['NUM_PROP'];
if Dataset['DATE_PRINT_PASS'] <> null then
Propusk_Label.Text:= Propusk_Label.Text + '  ('+ datetostr(Dataset['DATE_PRINT_PASS'])+')';
if Dataset['NUM_PROP'] =-1 then
Propusk_Label.Text:=' номер не визначено';
end;
end;
end;

procedure TRegistration_Form.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
dxStatusBar1.Panels[5].Text:= 'Кіль-сть записів: ' + inttostr(DataSet.RecordCount);
if DataSet['UK_FIO_COMBO'] <> null then PIB_Label.Text := DataSet['UK_FIO_COMBO'];
if DataSet['SHORT_NAME_CATEGORY'] <> null then Category_Label.Text := DataSet['SHORT_NAME_CATEGORY'] ;
if DataSet['NUM_DOG'] <> null then Dogovor_Label.Text:=DataSet['NUM_DOG'] ;
if DataSet['STATUS'] <> null then Status_Edit.Text:=DataSet['STATUS'] ;
if Dataset['NUM_PROP'] <> null then
begin
Propusk_Label.Text:=Dataset['NUM_PROP'];
if Dataset['DATE_PRINT_PASS'] <> null then
Propusk_Label.Text:= Propusk_Label.Text + '  ('+ datetostr(Dataset['DATE_PRINT_PASS'])+')';

if Dataset['NUM_PROP'] =-1 then
Propusk_Label.Text:=' номер не визначено';
end;
end;

procedure TRegistration_Form.RefreshButtonClick(Sender: TObject);
begin
Progress.Position:=11;
Progress.Update;

Screen.Cursor:=crSQLWait;
 //RowSelected := -1;
// if DataSet.RecordCount <> 0 then RowSelected := DataSet[KeyField];
 DataSet.close;
 DataSet.SelectSQL.Clear;
 DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_SELECT';
Progress.Position:=40;
Progress.Update;
 SelectAll;
 Filter_BarEdit.Text:='';
// DataSet.Locate(KeyField, RowSelected, []);
// cxGridDBTableView1.DataController.FocusedRowIndex := RowSelected;

Progress.Position:=Progress.Properties.Max;
Progress.Update;
Progress.Properties.Max:=100;
Progress.Position:=100;

Filter_BarEdit.Style.Font.Color := clWindowText;
Status_ComboBox.Style.Font.Color := clWindowText;
DateBegEdit.Style.Font.Color := clWindowText;
DateEndEdit.Style.Font.Color := clWindowText;
Status_ComboBox.ItemIndex:=0;

Screen.Cursor:=crDefault;
end;

procedure TRegistration_Form.DeleteButtonClick(Sender: TObject);
var
  id_kod_checker, id_session_pay   : int64;
  stUplSum,stSumDoc : Currency;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/LiversWork','Del') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  If not cxGrid2.IsFocused then exit;

  If cxGridDBTableView1.DataController.RecordCount = 0 then exit;

  // проверка существования данного ид.кода
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  id_kod_checker:= DataSet[KeyField];
  ReadDataSet.SelectSQL.Text:='select EXIST from ST_DT_PFIO_ID_KOD_EXIST_CHECK('+ IntToStr(id_kod_checker) +')';
  ReadDataSet.Open;
  if ReadDataSet['EXIST'] = 0 then
   begin
    ShowMessage('Данной записи больше не сущствует. Возможно, она удалена другим клиентским приложением во время вашей сессии. Нажмите "Обновить".');
    ReadDataSet.close;
    Screen.Cursor:=crDefault;
    exit;
   end;
  ReadDataSet.close;
  Screen.Cursor:=crDefault;

  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  With WriteProc do
   begin
    try
     // --------------запуск процедуры st_pay------------------------------
     // платил ли зарегистрированный? если да - то нельзя удалять
     StoredProcName := 'ST_PAY';
     ////start_sql_monitor;
     Transaction.StartTransaction;
     Prepare;
     ParamByName('ID_DOG_STUD').AsInt64 := self.DataSet[KeyField];
     ParamByName('DATE_PROV_CHECK').AsShort := 1;
     ParamByName('IS_DOC_GEN').AsShort := 1;
     ParamByName('IS_PROV_GEN').AsShort := 1;
     ParamByName('IS_SMET_GEN').AsShort := 1;
     ExecProc;

     stUplSum:=ParamByName('STUPLSUM').AsCurrency;
     stSumDoc:=ParamByName('SUMMA_ALL').AsCurrency;

     id_session_pay:= ParamByName('ID_SESSION').AsInt64;

     try
      Transaction.Commit;
      except
      on E:Exception do
       begin
        stShowMessage('Error in ST_PAY',e.Message,mtError,[mbOK]);
        Transaction.Rollback;
        //Send_mail(e.Message);
       end;
     end;
     //stop_sql_monitor;
     Close;

     except
      Transaction.Rollback;
      showmessage('Ошибка при выполнении процедуры ST_PAY!. Обратитесь к Администратору.');
      raise;
    end;
   end;

  WriteProc.StoredProcName := 'ST_PAY_TMP_CLEAR';
  //start_sql_monitor;
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

  if abs(stUplSum+stSumDoc)>0 then
   Begin
    ShowMessage('Не можливо видалити запис, є оплати!');
    exit;
   End;

  Screen.Cursor:=crSQLWait;
  WriteProc.StoredProcName := 'ST_DT_PFIO_DELETE';
  //start_sql_monitor;
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInt64 := DataSet[KeyField];
  WriteProc.ExecProc;
  try
   WriteProc.Transaction.Commit;
   WriteProc.Close;
   except
    WriteProc.Transaction.Rollback;
    WriteProc.Close;
    raise;
  end;

  DataSet.SQLs.DeleteSQL.Text:='execute procedure z_empty_proc';
  DataSet.delete;

  Screen.Cursor:=crDefault ;
end;

procedure TRegistration_Form.EditButtonClick(Sender: TObject );
var
 ActionStr, ActionKeyStr      : string;
 i, j : integer;
 id_pfsub : Int64;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/LiversWork','Edit') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if cxGridDBTableView1.DataController.RecordCount = 0 then exit;

  edit_item_id := DataSet[KeyField];

  // проверка существования данного ид.кода
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select EXIST from ST_DT_PFIO_ID_KOD_EXIST_CHECK('+ IntToStr(edit_item_id) +')';
  ReadDataSet.Open;
  if ReadDataSet['EXIST'] = 0 then
   begin
    ShowMessage('Данной записи больше не сущствует. Возможно, она удалена другим клиентским приложением во время вашей сессии. Нажмите "Обновить".');
    ReadDataSet.close;
    Screen.Cursor:=crDefault;
    exit;
   end;
  ReadDataSet.close;
  Screen.Cursor:=crDefault;

  progress.Properties.ShowText := true;
  Progress.Position:=5;
  update;

  Screen.Cursor:=crHourGlass;
  Registration_Form_Add := TRegistration_Form_Add.Create(Self);
  Registration_Form_Add.edit_item_id := edit_item_id;
  Registration_Form_Add.is_admin := is_admin;

  //берем настроики из системной таблици
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select st_end_month from SYS_OPTIONS';
  ReadDataSet.Open;
  if ReadDataSet['ST_END_MONTH'] <> null
   then Registration_Form_Add.st_end_month := ReadDataSet['ST_END_MONTH']
   else Registration_Form_Add.st_end_month := 0;
  ReadDataSet.close;
  Screen.Cursor:=crDefault;

  if Registration_Form_AddViewMode then
   begin
    Registration_Form_Add.ViewMode := true;
    Registration_Form_AddViewMode  := false;
   end;

  Progress.Position:=7;
  update;
  Registration_Form_Add.id_kod:=edit_item_id;


  // проверяю в sys_options - показывать ли вкладку Входящего остатка
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select Show_ost from ST_INSOST_SHOW_CHECK';
  ReadDataSet.Open;
  if Progress.Position<>100 then
   begin
    Progress.Position:=10;
    Progress.update;
   end;

  if ReadDataSet['Show_ost']=0
   then Registration_Form_Add.cxTabSheet6.TabVisible:= false
   else
    begin
     // выбираем историю по входящему остатку (если есть)
     ReadDataSet.close;
     ReadDataSet.SelectSQL.Clear;
     ReadDataSet.SelectSQL.Text:='select * from ST_RELSM_SELECT('+ inttostr(edit_item_id)+')';
     ReadDataSet.Open;
     ReadDataSet.FetchAll;
     if ReadDataSet.RecordCount <> 0 then
      begin
       Registration_Form_Add.cxGrid1TableView1.DataController.RecordCount := ReadDataSet.RecordCount;
       for i := 0 to ReadDataSet.RecordCount-1  do
        begin
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 0] := vartostr(ReadDataSet['Number_sm'])+'.'+vartostr(ReadDataSet['Number_razd'])+'.'+vartostr(ReadDataSet['Number_st'])+'.'+vartostr(ReadDataSet['Number_kekv']);
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 1] := ReadDataSet['SUMMA'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 2]:=  ReadDataSet['KOD_SM'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 3]:=  ReadDataSet['KOD_RAZD'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 4]:=  ReadDataSet['KOD_ST'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 5]:=  ReadDataSet['KOD_KEKV'];
         ReadDataSet.Next;
         if Progress.Position<>100 then
          begin
           Progress.Position:=Progress.Position+1;
           Progress.update;
          end;
        end;
       ReadDataSet.close;
       ReadDataSet.SelectSQL.Clear;
       ReadDataSet.SelectSQL.Text:='select * from ST_DT_PFIO_INSOST_SELECT('+ inttostr(edit_item_id)+')';
       ReadDataSet.Open;
       Registration_Form_Add.SummaEdit.Value:=ReadDataSet['SUM_DOC_J1'];
       ReadDataSet.close;
       ReadDataSet.SelectSQL.Clear;
       Registration_Form_Add.Sum_Result.Value:=0;
       If Progress.Position<>100 then
        begin
         Progress.Position:=30;
         Progress.update;
        end;
       for i:=0 to  Registration_Form_Add.cxGrid1TableView1.DataController.RecordCount-1 do
        begin
         Registration_Form_Add.Sum_Result.Value:= Registration_Form_Add.Sum_Result.Value + Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 1];
         if Progress.Position<>100 then
          begin
           Progress.Position:=Progress.Position+1;
           Progress.update;
          end;
        end;
      end
      else
       begin
        ReadDataSet.close;
        ReadDataSet.SelectSQL.Clear;
       end;
    end;

  ReadDataSet.close;
  ReadDataSet.SelectSQL.Clear;

  // забираю номер ордера и показываю
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFIO_ORDER_NUM_SEL(' + inttostr(edit_item_id)+')';
  ReadDataSet.Open;
  if ReadDataSet['ORDER_NUM'] <> null
   then Registration_Form_Add.OrderNum_Edit.Text := ReadDataSet['ORDER_NUM'];
  ReadDataSet.close;

  Registration_Form_Add.Familia_Edit.Text := DataSet['Familia'];
  Registration_Form_Add.Name_Edit.Text := DataSet['Imya'];
  Registration_Form_Add.Otch_Edit.Text := DataSet['Otchestvo'];
  if Registration_Form_Add.Otch_Edit.Text <>'' then
  Registration_Form_Add.Without_Otch_CheckBox.Checked:=false
  else Registration_Form_Add.Without_Otch_CheckBox.Checked:=true;

  if DataSet['Data_R']<> null
   then Registration_Form_Add.DateBorn_Edit.date := DataSet['Data_R'];
  if DataSet['Pol']='м'
   then Registration_Form_Add.Pol_ComboBox.ItemIndex:=0
   else Registration_Form_Add.Pol_ComboBox.ItemIndex:=1;
  if DataSet['Pol']='М'
   then Registration_Form_Add.Pol_ComboBox.ItemIndex:=0;
  if DataSet['Pol']='Ж'
   then Registration_Form_Add.Pol_ComboBox.ItemIndex:=1;
  if DataSet['Kurs'] <> null
   then Registration_Form_Add.Kurs_ComboBox.ItemIndex := DataSet['Kurs'] - 1;

  if DataSet['Date_Dog'] <> null
   then Registration_Form_Add.Dogovor_DateEdit.Date:=DataSet['Date_Dog'];
  if DataSet['Num_Dog'] <> null
   then Registration_Form_Add.Nomer_Dogovora.Text:= DataSet['Num_Dog'];

  Registration_Form_Add.Tabel_Edit.Text:= DataSet['TN'];
  Registration_Form_Add.Nalog_Edit.Text:= DataSet['Id_N_Nalog'];

  if Progress.Position<>100 then
   begin
    Progress.Position:=50;
    Progress.update;
   end;

  if DataSet['inostranez']=1
   then Registration_Form_Add.Inostranez_CheckBox.Checked:=true
   else Registration_Form_Add.Inostranez_CheckBox.Checked:=false;
  if DataSet['PROPISKA_EXIST']=1
   then Registration_Form_Add.Propiska_CheckBox.Checked:=true
   else Registration_Form_Add.Propiska_CheckBox.Checked:=false;
  if DataSet['PRIN_NPASS']=1
   then Registration_Form_Add.Propusk_CheckBox.Checked:=true
   else Registration_Form_Add.Propusk_CheckBox.Checked:=false;

  if DataSet['Fam_Uk']<> null
   then  Registration_Form_Add.Familia_Ukr.Text:=DataSet['Fam_Uk'];
  if DataSet['Imya_Uk']<> null
   then Registration_Form_Add.Name_Ukr.Text:=DataSet['Imya_Uk'];
  if DataSet['Ot_Uk']<> null
   then  Registration_Form_Add.Otch_Ukr.Text:=DataSet['Ot_Uk'];

  // Выбираем историю категорий проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFKAT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView1.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 0] := ReadDataSet['NUM_KATEGORIYA'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 3] := ReadDataSet['KATEGORIYA'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 4] := ReadDataSet['SHORT_NAME_CATEGORY'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 6] := ReadDataSet['PAY_SUM'];
    ReadDataSet.Next;
    if Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData;

  // Выбираем дополнительные услуги
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFDOP_SERV_SELECT(:id_kod)';
  ReadDataSet.ParamByName('id_kod').AsInt64 := edit_item_id;
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGrid_dop_servTableView4.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 0] := ReadDataSet['NUM_KAT'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 3] := ReadDataSet['ID_KAT'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 4] := ReadDataSet['SHORT_NAME_KAT'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 6] := ReadDataSet['PAY_SUM'];
    ReadDataSet.Next;

    if Progress.Position <> 100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData_dop_serv;

  // Выбираем историю проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_HROOM_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView_of_Live.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 0] := ReadDataSet['NUM_BUILD'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 1] := ReadDataSet['Room_Combo'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 2] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 3] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 4] := ReadDataSet['Kod_Build'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 5] := ReadDataSet['N_Room'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 6] := ReadDataSet['Type_Room'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 7] := ReadDataSet['SHORT_NAME'];
    ReadDataSet.Next;
    if Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData_Live;

  // выбираем историю субсидий
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFSUB_SELECT(' + IntToStr(edit_item_id) + ') order by BEG_DATE desc';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView2.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 0] := ReadDataSet['NAME_SERVES'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 3] := ReadDataSet['SUMMA'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 4] := ReadDataSet['CNT_MONTH'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 5] := ReadDataSet['NAME_STATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 6] := ReadDataSet['ID_SUBSIDY'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 7] := ReadDataSet['ID_STATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 8] := ReadDataSet['COMMENT'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 9] := ReadDataSet['FULL_NAME'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 10] := ReadDataSet['SHORT_NAME'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 12] := ReadDataSet['ID_KEY'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 13] := ReadDataSet['ID_SERVES'];
    ReadDataSet.Next;
    If Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;

  ReadDataSet.Close;
  // выбираем историю льгот
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_PFLGOT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView3.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 0] := ReadDataSet['Num_Lg'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 3] := ReadDataSet['ID_LG'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 4] := ReadDataSet['NAME_LG'];
    if ReadDataSet['DATE_PRIKAZA']<> null
     then Registration_Form_Add.cxGridTableView3.DataController.Values[i, 6] := ReadDataSet['DATE_PRIKAZA'];
    if ReadDataSet['NOMER_PRIKAZA'] <> null
     then Registration_Form_Add.cxGridTableView3.DataController.Values[i, 7] := ReadDataSet['NOMER_PRIKAZA'];
    ReadDataSet.Next;
    if Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData_Lg;

  // --факультеты------------------------------------------------
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select ID_GROUP, ID_SPEC , N_FAK from ST_PFIO_GET_FACS_BY_ID_KOD('+ IntToStr(edit_item_id)+')';
  ReadDataSet.Open;
  Registration_Form_Add.Id_department:=-1;
  Registration_Form_Add.id_spec:=-1;
  Registration_Form_Add.id_group:=-1;
  if ReadDataSet['N_FAK']<> null
   then Registration_Form_Add.Id_department:= ReadDataSet['N_FAK'];
  if ReadDataSet['ID_SPEC']<> null
   Then Registration_Form_Add.id_spec:= ReadDataSet['ID_SPEC'];
  if ReadDataSet['ID_GROUP']<> null
   then Registration_Form_Add.id_group:= ReadDataSet['ID_GROUP'];
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  Registration_Form_Add.Kurs_ComboBox.Visible:=true;
  Registration_Form_Add.KursLabel.Visible:=true;
  Registration_Form_Add.GroupLabel.Visible:=true;
  Registration_Form_Add.Group_ComboBox.Visible:=true;
  Registration_Form_Add.SpecLabel.Visible:=true;
  Registration_Form_Add.Spec_ComboBox.Visible:=true;

  // устанавливаю специальность и группу в комбобоксах
  if ((Registration_Form_Add.id_group <> 0) and (Registration_Form_Add.id_group <> -1)) then
   begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select  GROUP_FULL_NAME from ST_GET_GROUPNAME_BY_ID_GROUP('+ inttostr(Registration_Form_Add.id_group)+')';
    ReadDataSet.Open;
    if ReadDataSet['GROUP_FULL_NAME']<> null
     then GroupString:=ReadDataSet['GROUP_FULL_NAME'];
    ReadDataSet.close;
   end;
  if ((Registration_Form_Add.id_spec <> 0) and (Registration_Form_Add.id_spec <> -1)) then
   begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select  SPEC_FULL_NAME from ST_GET_SPECNAME_BY_ID_GROUP('+ inttostr(Registration_Form_Add.id_spec)+')';
    ReadDataSet.Open;
    if ReadDataSet['SPEC_FULL_NAME']<> null
     then SpecString:=ReadDataSet['SPEC_FULL_NAME'];
    ReadDataSet.close;
   end;

  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select DEPARTMENT_CODE, NAME_FULL from ST_GET_DEPARTMENT_CODE('+ inttostr(Registration_Form_Add.Id_Department)+')';
  ReadDataSet.Open;
  if ReadDataSet['DEPARTMENT_CODE']<>null
   then Registration_Form_Add.Faculty_ButtonEdit.Text:= ReadDataSet['DEPARTMENT_CODE'];
  if ReadDataSet['NAME_FULL']<>null
   then Registration_Form_Add.Podrazdel_Label.Caption:=ReadDataSet['NAME_FULL'];
  ReadDataSet.Close;

  Screen.Cursor:= crHourGlass;
  //проверяем парент на 199
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select FLAG from ST_IS_IT_FACULTY('+ inttostr(Registration_Form_Add.Id_Department)+')';
  ReadDataSet.Open;


  if ReadDataSet['FLAG']=1 then
   begin    // выбираем группы и специальности, если парент =199
    ReadDataSet.Close;
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select ID_GROUP, GROUP_FULL_NAME from ST_GET_GROUP('+ inttostr(Registration_Form_Add.Id_Department)+')';
    ReadDataSet.Open;
    ReadDataSet.FetchAll;
    Registration_Form_Add.Group_ComboBox.Clear;
    for i:=0 to ReadDataSet.RecordCount-1 do
     begin
      Registration_Form_Add.Group_ComboBox.Properties.Items.Add(ReadDataSet['GROUP_FULL_NAME'] );
      ReadDataSet.Next;
     end;
    Registration_Form_Add.Group_ComboBox.ItemIndex:=-1;
    ReadDataSet.Close;

    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select ID_SPECIALNOST, NAME_SPEC from ST_GET_SPEC('+ inttostr(Registration_Form_Add.Id_Department)+')';
    ReadDataSet.Open;
    ReadDataSet.FetchAll;
    Registration_Form_Add.Spec_ComboBox.Clear;
    for i:=0 to ReadDataSet.RecordCount-1 do
     begin
      Registration_Form_Add.Spec_ComboBox.Properties.Items.Add(ReadDataSet['NAME_SPEC'] );
      ReadDataSet.Next;
     end;
    Registration_Form_Add.Spec_ComboBox.ItemIndex:=-1;
    ReadDataSet.Close;
   end;
  Screen.Cursor:=crDefault;  // ---------проверка на парент закончена------------





if ((Registration_Form_Add.id_group <> 0) and (Registration_Form_Add.id_group <> -1)) then
         for i:=0 to  Registration_Form_Add.Group_ComboBox.Properties.Items.Count-1 do
         begin
         Registration_Form_Add.Group_ComboBox.ItemIndex:=i;
         if Registration_Form_Add.Group_ComboBox.Text = GroupString then break;
         end;

 if ((Registration_Form_Add.id_spec <> 0) and (Registration_Form_Add.id_spec <> -1)) then
         for i:=0 to  Registration_Form_Add.Spec_ComboBox.Properties.Items.Count-1 do
         begin
         Registration_Form_Add.Spec_ComboBox.ItemIndex:=i;
         if Registration_Form_Add.Spec_ComboBox.Text = SpecString then break;
         end;


         // с факультетами всё

  if Registration_Form_Add.cxGridTableView1.DataController.RecordCount >0 then
  begin
  Registration_Form_Add.EditButton.Enabled:=true;
  Registration_Form_Add.DeleteButton.Enabled:=true;
  Registration_Form_Add.cxGridTableView1.DataController.FocusedRowIndex := 0;
  end;

  if Progress.Position<>100 then begin
  Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
  Progress.Update;
  end;

  if Registration_Form_Add.cxGridTableView_of_Live.DataController.RecordCount >0 then
  begin
  Registration_Form_Add.Live_EditButton.Enabled:=true;
  Registration_Form_Add.Live_DeleteButton.Enabled:=true;
  Registration_Form_Add.cxGridTableView_of_Live.DataController.FocusedRowIndex := 0;
  end;

  if Progress.Position<>100 then begin
  Progress.Position:=Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
  Progress.update;
  end;

  if Registration_Form_Add.cxGridTableView2.DataController.RecordCount >0 then
   begin
    Registration_Form_Add.Sub_EditButton.Enabled := true;
    Registration_Form_Add.Sub_DeleteButton.Enabled := true;
    Registration_Form_Add.cxGridTableView2.DataController.FocusedRowIndex := 0;
   end;

    if Progress.Position<>100 then begin
  Progress.Position:=Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
  Progress.update;
  end;

    if Registration_Form_Add.cxGridTableView3.DataController.RecordCount >0 then
  begin
  Registration_Form_Add.Lg_EditButton.Enabled:=true;
  Registration_Form_Add.Lg_DeleteButton.Enabled:=true;
  Registration_Form_Add.cxGridTableView3.DataController.FocusedRowIndex := 0;
  end;

    if Progress.Position<>100 then begin
  Progress.Position:=Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
  Progress.update;
  end;

  Screen.Cursor:=crDefault;

  //*************************************************************************************
  // начало update
  //*************************************************************************************
Progress.Position:=100;
Progress.update;

  if Registration_Form_Add.ShowModal = mrOK then
   begin
    Progress.Position:=10;
    Progress.update;
    Screen.Cursor:=crSQLWait;
    Registration_Form.Update;

    Registration_Form_Add.Redact_Check;

    // добавление  информации о пользователе
    WriteProc.StoredProcName := 'ST_DT_PFIO_RECORD_CONTROL';
    //start_sql_monitor;
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
    WriteProc.ParamByName('LOGIN_INS').AsVariant:= null;
    WriteProc.ParamByName('LOGIN_UPT').AsString:=AccessResult.Name_user;
    WriteProc.ExecProc;
    WriteProc.Transaction.Commit;
    WriteProc.Close;

    if Registration_Form_Add.Redact = true then
     With WriteProc do
      begin
       StoredProcName := 'ST_DT_PFIO_UPDATE';
       //start_sql_monitor;
       Transaction.StartTransaction;
       Prepare;

       ParamByName(KeyField).AsInt64 := edit_item_id;
       ParamByName('FAM_UK').AsString := Registration_Form_Add.Familia_Ukr.Text;
       ParamByName('imya_Uk').AsString := Registration_Form_Add.Name_Ukr.Text;
       ParamByName('OT_UK').AsString := Registration_Form_Add.Otch_Ukr.Text;
       ParamByName('NUM_DOG').AsString := Registration_Form_Add.Nomer_Dogovora.Text;
       ParamByName('DATE_DOG').AsDate := Registration_Form_Add.Dogovor_DateEdit.Date;
       ParamByName('DATE_EDIT').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
       ParamByName('TN').AsString:=Registration_Form_Add.Tabel_Edit.Text;
       ParamByName('ID_N_NALOG').AsString:= Registration_Form_Add.Nalog_Edit.Text;
       ParamByName('FAMILIA').AsString := Registration_Form_Add.Familia_Edit.Text;
       ParamByName('IMYA').AsString := Registration_Form_Add.Name_Edit .Text;
       ParamByName('OTCHESTVO').AsString := Registration_Form_Add.Otch_Edit.Text;
       ParamByName('DATA_R').AsDate := Registration_Form_Add.DateBorn_Edit.Date;
       ParamByName('ARCHIV').AsInteger:=0;

       if Registration_Form_Add.ID_MAN <> -1
        then ParamByName('ID_MAN').AsInt64 := Registration_Form_Add.ID_MAN;

       ParamByName('ID_DEPARTMENT_DOP').AsInt64 := Registration_Form_Add.id_department_dop;
       ParamByName('ID_POST_DOP').AsInt64       := Registration_Form_Add.id_post_dop;
       ParamByName('cur_work_place').AsString   := Registration_Form_Add.Cur_WorkPlace_TextEdit.Text;
       ParamByName('cur_dolgnost').AsString     := Registration_Form_Add.Cur_Posada_TextEdit.Text;

       if Registration_Form_Add.Pol_ComboBox.ItemIndex=0
        then ParamByName('POL').AsString := 'М'
        else ParamByName('POL').AsString := 'Ж';
       if Registration_Form_Add.Inostranez_CheckBox.Checked
        then ParamByName('INOSTRANEZ').AsInteger := 1
        else ParamByName('INOSTRANEZ').AsInteger := 0;
       if Registration_Form_Add.Propiska_CheckBox.Checked
        then ParamByName('PROPISKA_EXIST').AsInteger := 1
        else ParamByName('PROPISKA_EXIST').AsInteger := 0;
       if Registration_Form_Add.Propusk_CheckBox.Checked
        then ParamByName('PRIN_NPASS').AsInteger := 1
        else ParamByName('PRIN_NPASS').AsInteger := 0;

       //----факультеты----------------------------------------------------

       if Registration_Form_Add.id_group <>-1
        then WriteProc.ParamByName('ID_GROUP').AsInt64 := Registration_Form_Add.id_group;
       if Registration_Form_Add.Id_department <>-1
        then WriteProc.ParamByName('N_FAK').AsInt64 :=Registration_Form_Add.Id_department;
       if Registration_Form_Add.id_spec <>-1
        then WriteProc.ParamByName('ID_SPEC').AsInt64 := Registration_Form_Add.id_spec;
       if Registration_Form_Add.Spec_ComboBox.Text<>''
        then WriteProc.ParamByName('SPEC').AsString:= Registration_Form_Add.Spec_ComboBox.Text;
       if  ((Registration_Form_Add.Kurs_ComboBox.ItemIndex <> -1) and (Registration_Form_Add.Kurs_ComboBox.Visible))
        then ParamByName('KURS').AsInteger := Registration_Form_Add.Kurs_ComboBox.ItemIndex + 1;
       ExecProc;

       //-----------------------------------------------------------------------
       if Registration_Form_Add.Change_inf then
        Begin
         //Добавление информации из справочника физ.лиц.
         WriteProc.StoredProcName := 'ST_DT_PFIO_FIZ_INF';
         WriteProc.Prepare;
         WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
         WriteProc.ParamByName('ID_MAN').AsInt64 := Registration_Form_Add.ID_MAN;
         WriteProc.ExecProc;
        end; 

       try
        Transaction.Commit;
        Close;
        except
         Transaction.Rollback;
         close;
       end;
      end;

    if Progress.Position<>100 then
     begin
      Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
      Progress.update;
     end;

    // изменение входящего остатка
    With WriteProc do
     begin
      //start_sql_monitor;
      Transaction.StartTransaction;
      StoredProcName := 'ST_DT_PFIO_UPDATE_SUM_DOC_J1';
      Prepare;
      ParamByName(KeyField).AsInt64 := edit_item_id;
      ParamByName('SUM_DOC_J1').AsCurrency:=Registration_Form_Add.SummaEdit.Value;
      ExecProc;

      StoredProcName := 'ST_RELSM_DELETE';
      Prepare;
      ParamByName(KeyField).AsInt64 := edit_item_id;
      ExecProc;

      for i := 0 to Registration_Form_Add.cxGrid1TableView1.DataController.RecordCount - 1 do
       begin
        StoredProcName := 'ST_RELSM_INSERT';
        Prepare;
        ParamByName(KeyField).AsInt64 := edit_item_id;
        ParamByName('KOD_SM').AsInt64 := Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 2];
        ParamByName('KOD_RAZD').AsInt64 := Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 3];
        ParamByName('KOD_ST').AsInt64 := Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 4];
        ParamByName('KOD_KEKV').AsInt64 := Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 5];
        ParamByName('SUMMA').AsCurrency := Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 1];
        ExecProc;

        if Progress.Position<>100 then
         begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.update;
         end;
       end;

      StoredProcName := 'ST_RELSM_EXCHANGE_ADD';
      Prepare;
      ParamByName(KeyField).AsInt64 := edit_item_id;
      ExecProc;

      try
       Transaction.Commit;
       Close;
      except
       Transaction.Rollback;
       close;
      end;
     end;

    if Progress.Position<>100 then
     begin
      Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
      Progress.update;
     end;

    // проверка - изменялось ли что-нибудь в истории проживания

    if  Registration_Form_Add.Redact_Live=true then
    // изменение истории проживания
    // сначала удаляем по id все даты из ST_dt_HROOM (из истории проживания)
    With WriteProc do
     begin
      StoredProcName := 'ST_DT_HROOM_DELETE';
      Transaction.StartTransaction;
      Prepare;
      ParamByName(KeyField).AsInt64 := edit_item_id;
      ExecProc;
      // после чего вносим все измененные даты (в историю проживания)
      for i := 0 to Registration_Form_Add.cxGridTableView_of_Live.DataController.RecordCount - 1 do
       begin
        StoredProcName := 'ST_DT_HROOM_INSERT';
        Prepare;
        ParamByName('ID_KOD').AsInt64      := edit_item_id;
        ParamByName('KOD_BUILD').AsInteger := Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 4];
        ParamByName('N_ROOM').AsString     := Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 5];
        ParamByName('Type_Room').AsInteger :=Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 6];
        ParamByName('BEG_DATE').AsDate     := Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 2];
        ParamByName('END_DATE').AsDate     := Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 3];
        ExecProc;
        if Progress.Position<>100 then
         begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.update;
         end;
       end;
      // после выполнения вставки вызываю процедуру обмена
      StoredProcName := 'ST_DT_HROOM_EXCHANGE_ADD';
      Prepare;
      ParamByName(KeyField).AsInt64 := edit_item_id;
      ExecProc;

      try
       Transaction.Commit;
       Close;
      except
       Transaction.Rollback;
       close;
       raise;
      end;
     end;

  if Progress.Position<>100 then begin
  Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
  Progress.update;
  end;

    // проверка - не изменилось ли что-нибудь с категориями
    if  Registration_Form_Add.Redact_Category = true then
     begin
      // изменение истории категорий оплаты
      // сначала закрываем все записи по id use_end -ом
      WriteProc.StoredProcName := 'ST_DT_PFKAT_HISTORY_CLOSE';
      //start_sql_monitor;
      WriteProc.Transaction.StartTransaction;
      WriteProc.Prepare;
      WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
      WriteProc.ExecProc;

      if Progress.Position<>100 then
      begin
       Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
       Progress.update;
      end;

      // после чего заполняем ST_DT_PFKAT измененными записями с use_beg = now
      WriteProc.StoredProcName := 'ST_DT_PFKAT_INSERT';
      for i := 0 to Registration_Form_Add.cxGridTableView1.DataController.RecordCount - 1 do
       begin
        WriteProc.Prepare;
        WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
        WriteProc.ParamByName('KATEGORIYA').AsInt64 := Registration_Form_Add.cxGridTableView1.DataController.Values[i, 3];
        WriteProc.ParamByName('BEG_DATE').AsDate := Registration_Form_Add.cxGridTableView1.DataController.Values[i, 1];
        WriteProc.ParamByName('END_DATE').AsDate := Registration_Form_Add.cxGridTableView1.DataController.Values[i, 2];
        WriteProc.ParamByName('USE_BEG').AsDateTime := DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP;
        WriteProc.ParamByName('USE_END').AsDateTime := SYS_MAX_TIMESTAMP;
        WriteProc.ExecProc;

        if Progress.Position<>100 then
         begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.update;
         end;
       end;

      try
       WriteProc.Transaction.Commit;
       WriteProc.Close;
      except
       WriteProc.Transaction.Rollback;
       WriteProc.Close;
       raise;
      end;
     end;

   //------проверка на редактирование дополнителных услуг-----------------------
    if Registration_Form_Add.Redact_dop_serv then
     begin
      // изменение истории дополнительных услуг
      // сначала закрываем все записи по id use_end -ом
      WriteProc.StoredProcName := 'ST_DT_PFDOP_SERV_HISTORY_CLOSE';
      //start_sql_monitor;
      WriteProc.Transaction.StartTransaction;
      WriteProc.Prepare;
      WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
      WriteProc.ExecProc;

      if Progress.Position<>100 then
      begin
       Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
       Progress.update;
      end;

      // после чего заполняем ST_DT_PFdop_serv измененными записями с use_beg = now
      WriteProc.StoredProcName := 'ST_DT_PFDOP_SERV_INS';
      for i := 0 to Registration_Form_Add.cxGrid_dop_servTableView4.DataController.RecordCount - 1 do
       begin
        WriteProc.Prepare;
        WriteProc.ParamByName('ID_KOD').AsInt64  := edit_item_id;
        WriteProc.ParamByName('ID_KAT').AsInt64  := Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 3];
        WriteProc.ParamByName('DATE_BEG').AsDate := Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 1];
        WriteProc.ParamByName('DATE_END').AsDate := Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 2];
        WriteProc.ExecProc;

        if Progress.Position<>100 then
         begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.update;
         end;
       end;

      try
       WriteProc.Transaction.Commit;
       WriteProc.Close;
      except
       WriteProc.Transaction.Rollback;
       WriteProc.Close;
       raise;
      end;
     end;

    // проверка - не изменилось ли что-нибудь с субсидиями

    if Progress.Position<>100 then
     begin
      Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
      Progress.update;
     end;

    if  Registration_Form_Add.Redact_Subs = true then
     begin
      // изменение истории субсидий
      // сначала закрываем все записи по id use_end - ом

      WriteProc.Transaction.StartTransaction;
      
      if Registration_Form_Add.cxGridTableView2.DataController.RecordCount<>0 then
       begin
        WriteProc.StoredProcName := 'ST_DT_PFSUB_HISTORY_CLOSE';
        //start_sql_monitor;
        WriteProc.Prepare;
        WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
        WriteProc.ExecProc;
        if Progress.Position<>100 then
         begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.update;
         end;

        //после чего заполняем  измененными записями с use_beg = now

        for i := 0 to Registration_Form_Add.cxGridTableView2.DataController.RecordCount - 1 do
         begin
          WriteProc.StoredProcName := 'ST_DT_PFSUB_INSERT';
          WriteProc.Prepare;

          if Registration_Form_Add.cxGridTableView2.DataController.Values[i, 12] = -999
           then WriteProc.ParamByName('ID_KEY').AsInt64 := 0
           else WriteProc.ParamByName('ID_KEY').AsInt64 := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 12];

          WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
          WriteProc.ParamByName('ID_SUBSIDY').AsInt64 := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 6];
          WriteProc.ParamByName('BEG_DATE').AsDate := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 1];
          WriteProc.ParamByName('END_DATE').AsDate := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 2];
          WriteProc.ParamByName('AUTO').AsInteger := 1;
          WriteProc.ParamByName('SUMMA').AsDouble := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 3];
          WriteProc.ParamByName('CNT_MONTH').AsInteger := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 4];
          WriteProc.ParamByName('ID_STATE').AsInt64 := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 7];

          if Registration_Form_Add.cxGridTableView2.DataController.Values[i, 8]<> null
           then WriteProc.ParamByName('COMMENT').AsString := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 8];

          WriteProc.ParamByName('ID_SERVES').AsInt64 := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 13];

          WriteProc.ExecProc;

          id_pfsub := WriteProc.FieldByName('ID').AsInt64;

          ReadDataSet.Close;
          ReadDataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_RAZD_STAT_SERVES(:id_serves)';
          ReadDataSet.ParamByName('id_serves').asint64 := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 13];
          ReadDataSet.Open;
          ReadDataSet.FetchAll;
          ReadDataSet.First;

          WriteProc.StoredProcName := 'ST_DT_PFSUB_SMET_INS';
          for j := 0 to ReadDataSet.RecordCount - 1 do
           begin
            WriteProc.Prepare;
            WriteProc.ParamByName('ID_DT_PFSUB').AsInt64 := id_pfsub;
            WriteProc.ParamByName('ID_RZ').AsInt64 := ReadDataSet['ID_RAZD'];
            WriteProc.ParamByName('ID_ST').AsInt64 := ReadDataSet['ID_STAT'];
            if ReadDataSet['ST_OPTIONS'] = 2
             then WriteProc.ParamByName('SUMMA').AsFloat := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 3] / 6;
            if ReadDataSet['ST_OPTIONS'] = 1
             then WriteProc.ParamByName('SUMMA').AsFloat := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 3] - (Registration_Form_Add.cxGridTableView2.DataController.Values[i, 3] / 6);
            if ReadDataSet['ST_OPTIONS'] = 0
             then WriteProc.ParamByName('SUMMA').AsFloat := Registration_Form_Add.cxGridTableView2.DataController.Values[i, 3];
            WriteProc.ExecProc;

            ReadDataSet.Next;
           end;

          if Progress.Position <> 100 then
           begin
            Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
            Progress.update;
           end;
         end;
       end;

      if Registration_Form_Add.cxGridTableView2.DataController.RecordCount = 0 then
       begin
        WriteProc.StoredProcName := 'ST_DT_PFSUB_HISTORY_CLOSE';
        //start_sql_monitor;
        //WriteProc.Transaction.StartTransaction;
        WriteProc.Prepare;
        WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
        WriteProc.ExecProc;

        if Progress.Position<>100 then
         begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.update;
         end;
       end;

      try
       WriteProc.Transaction.Commit;
       WriteProc.Close;
      except
       WriteProc.Transaction.Rollback;
       WriteProc.Close;
       raise;
      end;
     end;

// проверка - не изменилось ли что-нибудь с льготами

if  Registration_Form_Add.Redact_Lgot=true then  begin
    // изменение истории льгот
   // сначала закрываем все записи по id use_end - ом

  if Registration_Form_Add.cxGridTableView3.DataController.RecordCount<>0 then
  begin
   WriteProc.StoredProcName := 'ST_PFLGOT_HISTORY_CLOSE';
   //start_sql_monitor;
   WriteProc.Transaction.StartTransaction;
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
   WriteProc.ExecProc;
    if Progress.Position<>100 then
     begin
      Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
      Progress.update;
     end;

  // после чего заполняем  измененными записями с use_beg = now
   WriteProc.StoredProcName := 'ST_PFLGOT_INSERT';
   for i := 0 to Registration_Form_Add.cxGridTableView3.DataController.RecordCount - 1 do
    begin
     WriteProc.Prepare;
     WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
     WriteProc.ParamByName('ID_LG').AsInt64 := Registration_Form_Add.cxGridTableView3.DataController.Values[i, 3];
     WriteProc.ParamByName('BEG_DATE').AsDate := Registration_Form_Add.cxGridTableView3.DataController.Values[i, 1];
     WriteProc.ParamByName('END_DATE').AsDate := Registration_Form_Add.cxGridTableView3.DataController.Values[i, 2];
     WriteProc.ParamByName('DATE_PRIKAZA').AsVariant:=null;
     WriteProc.ParamByName('NOMER_PRIKAZA').AsVariant:=null;
     if (Registration_Form_Add.cxGridTableView3.DataController.Values[i, 6] <>null) then
     if (datetostr(Registration_Form_Add.cxGridTableView3.DataController.Values[i, 6]) <> '00.00.0000')
      then WriteProc.ParamByName('DATE_PRIKAZA').AsDate := Registration_Form_Add.cxGridTableView3.DataController.Values[i, 6];

     if Registration_Form_Add.cxGridTableView3.DataController.Values[i, 7] <> null then
      if Registration_Form_Add.cxGridTableView3.DataController.Values[i, 7] <> ''
       then WriteProc.ParamByName('NOMER_PRIKAZA').Asstring := Registration_Form_Add.cxGridTableView3.DataController.Values[i, 7];
    WriteProc.ExecProc;
     if Progress.Position<>100 then
      begin
       Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
       Progress.update;
      end;
   end;
  { WriteProc.StoredProcName := 'ST_PFLGOT_EXCHANGE_ADD';
   WriteProc.Prepare;
   WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
   WriteProc.ExecProc;}
  end;

   if Registration_Form_Add.cxGridTableView3.DataController.RecordCount = 0 then
   begin
    WriteProc.StoredProcName := 'ST_PFLGOT_HISTORY_CLOSE';
    //start_sql_monitor;
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('ID_KOD').AsInt64 := edit_item_id;
    WriteProc.ExecProc;
    if Progress.Position<>100 then
     begin
      Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
      Progress.update;
     end;
   end;
try
   WriteProc.Transaction.Commit;
   WriteProc.Close;
except
  WriteProc.Transaction.Rollback;
   WriteProc.Close;
  raise;
end;
end;


  DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
  DataSet.SQLs.RefreshSQL.Text:=  'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(edit_item_id)+')';;
  DataSet.Edit;
  DataSet.Post;

  Registration_Form_Add.Free;
  Screen.Cursor:=crDefault ;
  Progress.Position:= 100;
  Progress.update;

   end;
end;

procedure TRegistration_Form.dxBarLargeButton2Click(Sender: TObject);
begin
{perchak}
{
if N3.Down then
begin
Registration_Form.Name_BarButtonClick(Sender);
Search_LgotForm := TSearch_LgotForm.Create(Self);
Search_LgotForm.Caption:='Контекстный поиск по наименованию';
 while Search_LgotForm.FindFlag = false do begin
 if Search_LgotForm.FindClosed = true then begin
 Search_LgotForm.Free;
 exit;
 end;
 if Search_LgotForm.ShowModal = mrOk then begin
 cxGridDBTableColumn8.SortOrder:= soNone;
 cxGridDBColumn1.SortOrder:= soAscending;
 if Search_LgotForm.FindFlag = true then begin
  DataSet.Locate('FIO_COMBO', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  exit;
  end
  else begin
   cxGridDBTableColumn8.SortOrder:= soNone;
   cxGridDBColumn1.SortOrder:= soAscending;
   DataSet.Locate('FIO_COMBO', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
   Search_LgotForm.showModal;
   end;
 end;
 end;
 if Search_LgotForm.FindFlag = true then begin
  cxGridDBTableColumn8.SortOrder:= soNone;
 cxGridDBColumn1.SortOrder:= soAscending;
  DataSet.Locate('FIO_COMBO', Search_LgotForm.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
  Search_LgotForm.Free;
  end;
end
// здесь закончился контекстный поиск
else begin
Search_Form:= TSearch_Form.create(self);
if Search_Form.ShowModal = mrOk then begin
Search_Form.Hide;
Registration_Form.Update;
SQL_Wait_Form:= TSQL_Wait_Form.Create(Self);
SQL_Wait_Form.Zapis_Label.Caption:='Поиск запущен.';
SQL_Wait_Form.PleaseWait_Label.Caption:='Пожалуйста, подождите ...';
SQL_Wait_Form.Show;
SQL_Wait_Form.Update;
cxGridDBTableColumn8.SortOrder:= soNone;
cxGridDBColumn1.SortOrder:= soAscending;
Registration_Form.Name_BarButtonClick(Sender);
DataSet.Locate('FIO_COMBO', Search_Form.Naim_Edit.Text, [loCaseInsensitive, loPartialKey]);
Search_Form.Free;
SQL_Wait_Form.Free;
end;
end;}
end;



procedure TRegistration_Form.dxBarLargeButton1Click(Sender: TObject);
begin
 {perchak}
 {
 Nomer_SearchForm := TNomer_SearchForm.Create(Self);
 Nomer_SearchForm.N_Label.caption:='Ид.код';
 Nomer_SearchForm.Nomer_Edit.Properties.MaxLength:=10;
 if Nomer_SearchForm.ShowModal = mrOK then begin
 cxGridDBColumn1.SortOrder:= soNone;
 cxGridDBTableColumn8.SortOrder:= soAscending;
 DataSet.Locate('ID_N_NALOG', Nomer_SearchForm.Nomer_Edit.Text, [loCaseInsensitive, loPartialKey])
 end;
 Nomer_SearchForm.Free;}
end;

procedure TRegistration_Form.Name_BarButtonClick(Sender: TObject);
begin
  DataSet.Close;
  DataSet.SelectSQL.Clear;
  DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_SELECT_ASC';
  DataSet.Open;
end;



procedure TRegistration_Form.Filter_BarEdit1Enter(Sender: TObject);
begin
GetKeyboardState(Beg_KS);
KS:=Beg_KS;
KS[020] :=  1;
SetKeyboardState(KS);
end;

procedure TRegistration_Form.Filter_BarEdit1Exit(Sender: TObject);
begin
SetKeyboardState(Beg_KS);
end;

procedure TRegistration_Form.dxBarButton5Click(Sender: TObject);
begin
if Registration_Form.dxBarButton5.Down= true then  begin
Nomer_CheckBox.Visible:=true;
FIO_CheckBox.Visible:=true;
Filter_Button.Visible:=true;
dxBarManager1.Bars[1].Visible:=true;
Nomer_CheckBox.BringToFront;
FIO_CheckBox.BringToFront;
Filter_Button.BringToFront;
end
else begin
dxBarManager1.Bars[1].Visible:=false;
Nomer_CheckBox.Visible:=false;
FIO_CheckBox.Visible:=false;
Filter_Button.Visible:=false;
end;
end;

procedure TRegistration_Form.Filter_BarEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if  key=VK_RETURN then
  begin
    Filter_ButtonClick(Self);
 //   Filter_BarEdit.SetFocus(true);
  end;
end;

procedure TRegistration_Form.FormResize(Sender: TObject);
begin
{if dxBarButton5.Down=true then
begin                          }
Nomer_CheckBox.BringToFront;
FIO_CheckBox.BringToFront;
Filter_Button.BringToFront;
CancelFiltr_Button.BringToFront;
Filter_BarEdit.BringToFront;
DateBegEdit.BringToFront;
DateEndEdit.BringToFront;
Po_Label.BringToFront;
Filter_Kat_Button.BringToFront;
Cancel_Filter_Kat_Button.BringToFront;
Calc_Button.BringToFront;
Status_ComboBox.BringToFront;
Status_Label.BringToFront;
// end;
end;

procedure TRegistration_Form.Filter_ButtonClick(Sender: TObject);
var
  persent : string;
  FIO_Search : string;
  Len_FIO, p : Integer;
begin
  Screen.Cursor:=crHourGlass;

  Dogovor_Label.Text:='';
  Propusk_Label.Text:='';
  PIB_Label.Text:='';
  Category_Label.Text:='';
  Status_Edit.Text:='';
  persent:='%';

  DataSet.Close;
  DataSet.SelectSQL.Clear;

  if FIO_CheckBox.Checked then
   begin
    FIO_Search := Filter_BarEdit.Text;
    Len_FIO := length(FIO_Search);
    p:=1;
    while p<=len_FIO do
     Begin
      If FIO_Search[p]=' '
       then
        Begin
         Insert('%',FIO_Search,p);
         p:=p+1;
         Len_fio:=len_fio+1;
        End;
      p:=p+1;
     End;

    if IsStatusOnFilter = false
     then DataSet.SelectSQL.Text:='select * from  ST_DT_PFIO_SELECT_FILTER_ASC('''+StringPrepareToQueryText(FIO_Search) + persent+''')'
     else DataSet.SelectSQL.Text:='select * from  ST_DT_PFIO_FIO_STATUS_FILTER('''+StringPrepareToQueryText(FIO_Search) + persent+''','''+ Status_ComboBox.Text+''')';
   End;

  if Nomer_CheckBox.Checked then
   if IsStatusOnFilter = false
        then
        DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_SELECT_FILT_NUM_ASC ('''+StringPrepareToQueryText(Filter_BarEdit.Text) + persent+''')'
        else
        DataSet.SelectSQL.Text:='select * from  ST_DT_PFIO_NUM_STATUS_FILTER('''+StringPrepareToQueryText(Filter_BarEdit.Text) + persent+''','''+ Status_ComboBox.Text+''')';
    if Barcode_CheckBox.Checked then
        if IsStatusOnFilter = false
        then
        DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_BY_BARCODE ('''+StringPrepareToQueryText(Filter_BarEdit.Text)+''')'
        else
        DataSet.SelectSQL.Text:='select * from  ST_DT_PFIO_NUM_STATUS_FILTER('''+StringPrepareToQueryText(Filter_BarEdit.Text) + persent+''''+','+ ''''+ Status_ComboBox.Text+''')';

    DataSet.Open;
    if Filter_BarEdit.Text <>'' then
    Filter_BarEdit.Style.Font.Color := clRed;
    DateBegEdit.Style.Font.Color := clWindowText;
    DateEndEdit.Style.Font.Color := clWindowText;

    Screen.Cursor:=crDefault;
    cxGrid2.SetFocus;
end;

procedure TRegistration_Form.CancelFiltr_ButtonClick(Sender: TObject);
begin
Registration_Form.RefreshButtonClick(Sender);
Filter_BarEdit.Text:='';
end;

procedure TRegistration_Form.Calc_ButtonClick(Sender: TObject);
var stUplSum, stSumDoc, stSNeed, SegodnyaOpl : Currency;
    STDATEOPL: TDate;
    Cur_date:TDate;
    edititem: int64;
    DATE_REG: Tdate;
begin
  St_pfio_OplataSprav_Form:= TSt_pfio_OplataSprav_Form.Create(Self);
  St_pfio_OplataSprav_Form.Caption:= st_ConstUnit.st_Form_Opl[PLanguageIndex];
  Progress.Position:=9;
  Progress.Update;
  St_pfio_OplataSprav_Form.Fac_Label.Caption:=St_pfio_OplataSprav_Form.Fac_Label.Caption+ ': '+self.DataSet['NAME_FAC'];
  if self.DataSet['KURS']<> null
   then St_pfio_OplataSprav_Form.Kurs_Label.Caption:=St_pfio_OplataSprav_Form.Kurs_Label.Caption+ ': '+inttostr(self.DataSet['KURS']);

  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  edititem:= self.DataSet[KeyField];
  ReadDataSet.SelectSQL.Text:='select Date_birn from ST_PFIO_BIRN_DATE('+ inttostr(edititem)+')' ;
  ReadDataSet.Open;

  St_pfio_OplataSprav_Form.DataRog_Label.Caption:=St_pfio_OplataSprav_Form.DataRog_Label.Caption+ ': '+ DateToStr(ReadDataSet['Date_Birn']);
  ReadDataSet.Close;

  Progress.Position:=12;
  Progress.Update;
  With WriteProc do
  begin
  try
   Progress.Position:=17;
   Progress.Update;
   // --------------запуск процедуры st_pay------------------------------
   // расчет уже уплаченной суммы

  StoredProcName := 'ST_PAY';
  //start_sql_monitor;
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_DOG_STUD').AsInt64 := self.DataSet[KeyField];
  ParamByName('DATE_PROV_CHECK').AsShort := 1;
  ParamByName('IS_DOC_GEN').AsShort := 1;
  ParamByName('IS_PROV_GEN').AsShort := 1;
  ParamByName('IS_SMET_GEN').AsShort := 1;
  ExecProc;

  Progress.Position:=Progress.Position +  ( Progress.Properties.Max - Progress.Position) div 4;
  Progress.Update;

  stUplSum:=ParamByName('STUPLSUM').AsCurrency;
  stSumDoc:=ParamByName('SUMMA_ALL').AsCurrency;

  id_session_pay:= ParamByName('ID_SESSION').AsInt64;

  Transaction.Commit;
  Close;
  if stUplSum > stSumDoc then
  St_pfio_OplataSprav_Form.St_UplSum_Edit.Value:= stUplSum
  else St_pfio_OplataSprav_Form.St_UplSum_Edit.Value:= stSumDoc;

  Progress.Position:=Progress.Position +  2;
  Progress.Update;


  // --------------запуск процедуры st_calc------------------------------
  //

  // проверяю флаг расчета на дату ф-я счета
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select DATE_REG from ST_GET_CALC_ON_CURRENT_SCH';
  ReadDataSet.Open;
  DATE_REG:= ReadDataSet['DATE_REG'];
  ReadDataSet.Close;


  StoredProcName := 'ST_CALC';
  //start_sql_monitor;
  Transaction.StartTransaction;
  Prepare;
  ParamByName(KeyField).AsInt64 := edititem;
  ParamByName('END_CHECK').AsDate := DATE_REG;

  If stUplSum > stSumDoc
   then ParamByName('STUPLSUM').AsCurrency := stUplSum
   else ParamByName('STUPLSUM').AsCurrency := stSumDoc; // это уже с уплаченной суммой
  ExecProc;

  Progress.Position:=Progress.Position +  ( Progress.Properties.Max - Progress.Position) div 4;
  Progress.Update;

  St_pfio_OplataSprav_Form.St_SNeed_Edit.Value:= ParamByName('ST_SNEED').AsCurrency;
  stSNeed:= ParamByName('ST_SNEED').AsCurrency;      //  сумма, необходимая для уплаты за весь период
  STDATEOPL:= ParamByName('STDATEOPL').AsDateTime;   // дата, по которую оплачено
  id_session_calc:= ParamByName('ID_SESSION').AsInt64;
  St_pfio_OplataSprav_Form.DateOpl_Label.Caption:= St_pfio_OplataSprav_Form.DateOpl_Label.Caption + '  '+ datetostr(STDATEOPL);
  Transaction.Commit;
  Close;

  Progress.Position:=Progress.Position +  2;
  Progress.Update;

  if stUplSum > stSumDoc then
  St_pfio_OplataSprav_Form.Zadolgnost_Edit.Value:= stSNeed - stUplSum
  else St_pfio_OplataSprav_Form.Zadolgnost_Edit.Value:= stSNeed - stSumDoc;


  StoredProcName := 'ST_CALC_TMP_CLEAR';
  //start_sql_monitor;
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  ExecProc;
  Transaction.Commit;
  Close;

  // --------------запуск процедуры st_calc------------------------------
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;

  Progress.Position:=Progress.Position +  ( Progress.Properties.Max - Progress.Position) div 4;
  Progress.Update;
 
  //
 if (STDATEOPL <= Cur_date) then begin
  StoredProcName := 'ST_CALC';
  //start_sql_monitor;
  Transaction.StartTransaction;
  Prepare;
  ParamByName(KeyField).AsInt64 := edititem;
  ParamByName('BEG_CHECK').AsVariant := STDATEOPL;
  ParamByName('STUPLSUM').AsVariant := null;
  ParamByName('END_CHECK').AsDate := Cur_date;

  ExecProc;
  SegodnyaOpl:=ParamByName('ST_SNEED').AsCurrency;
  id_session_calc:= ParamByName('ID_SESSION').AsInt64;
  Transaction.Commit;
  Close;
  end
  else
  SegodnyaOpl:=0;

  Progress.Position:=Progress.Position +  ( Progress.Properties.Max - Progress.Position) div 4;
  Progress.Update;


   St_pfio_OplataSprav_Form.Today_Opl_Edit.Value:= SegodnyaOpl;
   if SegodnyaOpl > St_pfio_OplataSprav_Form.Zadolgnost_Edit.Value then
   St_pfio_OplataSprav_Form.Today_Opl_Edit.Value:= St_pfio_OplataSprav_Form.Zadolgnost_Edit.Value ;

  if ((St_pfio_OplataSprav_Form.Zadolgnost_Edit.Value = 0) or (St_pfio_OplataSprav_Form.Zadolgnost_Edit.Value<0)) then
      St_pfio_OplataSprav_Form.Today_Opl_Edit.Value:= 0;

  Progress.Position:=Progress.Position +  1;
  Progress.Update;

  StoredProcName := 'ST_CALC_TMP_CLEAR';
  //start_sql_monitor;
  Transaction.StartTransaction;
  Prepare;
  ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  ExecProc;
  Transaction.Commit;
  Close;
  
  StoredProcName := 'ST_CALC';
  //start_sql_monitor;
  Transaction.StartTransaction;
  Prepare;
  ParamByName(KeyField).AsInt64 := edititem;
  ParamByName('BEG_CHECK').AsVariant := null;
  ParamByName('STUPLSUM').AsVariant := null;
  ParamByName('END_CHECK').AsVariant := null;

  ExecProc;
  id_session_calc:= ParamByName('ID_SESSION').AsInt64;
  Transaction.Commit;
  Close;

except
  Transaction.Rollback;
  showmessage('Произошло что-то нехорошее! Непредвиденная ошибка. Обратитесь к администратору.');
  raise;
end;
end;
St_pfio_OplataSprav_Form.FIOCOMBO_Label.Caption:= self.DataSet['FIO_COMBO'];

  Progress.Position:=100;
  Progress.Update;

  Screen.Cursor:= crDefault;
  St_pfio_OplataSprav_Form.id_session_calc:= id_session_calc;
  St_pfio_OplataSprav_Form.id_session_pay:= id_session_pay;
if St_pfio_OplataSprav_Form.ShowModal = mrOK then
begin
  WriteProc.StoredProcName := 'ST_CALC_TMP_CLEAR';
  //start_sql_monitor;
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_calc;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

  WriteProc.StoredProcName := 'ST_PAY_TMP_CLEAR';
  //start_sql_monitor;
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName('ID_SESSION').AsInt64 := id_session_pay;
  WriteProc.ExecProc;
  WriteProc.Transaction.Commit;
  WriteProc.Close;

end;

end;

procedure TRegistration_Form.Filter_BarEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if  key=VK_RETURN then
    begin
     Filter_ButtonClick(Sender);
     Progress.Position := 100;
     Progress.Update;
    end;
end;

procedure TRegistration_Form.Filter_Kat_ButtonClick(Sender: TObject);
begin
try
Screen.Cursor:= crHourGlass;
  Dogovor_Label.Text:='';
  Propusk_Label.Text:='';
  PIB_Label.Text:='';
  Category_Label.Text:='';
  Status_Edit.Text:='';
  DataSet.Close;
  DataSet.SelectSQL.Clear;
  DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_REGISTRAT_FILTER ('+''''+Filter_BarEdit.Text +''''+ ',' +''''+datetostr(DateBegEdit.Date) +''''+ ','+ ''''+datetostr(DateEndEdit.Date)+ ''''+')' ;
  DataSet.Open;

Filter_BarEdit.Style.Font.Color := clWindowText;
Status_ComboBox.Style.Font.Color := clWindowText;
Status_ComboBox.ItemIndex:=0;
IsStatusOnFilter:=false;
DateBegEdit.Style.Font.Color := clRed;
DateEndEdit.Style.Font.Color := clRed;
finally
cxGrid2.SetFocus;
Screen.Cursor:= crDefault;
end;
end;

procedure TRegistration_Form.cxGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Arect:TRect;
begin
 { if ((AViewInfo.GridRecord.Values[8]= 1) and (not AViewInfo.GridRecord.Focused )) then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=clMoneyGreen;
      ACanvas.Canvas.FillRect(Arect);
   end;
  if ((AViewInfo.GridRecord.Values[8]= 1) and (AViewInfo.GridRecord.Focused )) then  begin
      Arect:=AViewInfo.Bounds;
      ACanvas.Canvas.Brush.Color:=$0070AF70;
      ACanvas.Canvas.FillRect(Arect);
   end;
 }
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

   if MainForm.WaitFormHandle then
   if SQL_Wait_Form.Wait_RecordCount <> 0 then begin
   SQL_Wait_Form.Wait_RecordCount:=SQL_Wait_Form.Wait_RecordCount-1;
   Registration_Form.Progress.Position:=Registration_Form.Progress.Properties.Max - SQL_Wait_Form.Wait_RecordCount;
   Registration_Form.progress.update;
   end
   else begin
   SQL_Wait_Form.free;
   Screen.Cursor:= crDefault;
   Registration_Form.Progress.Properties.Max:=100;
   Registration_Form.Progress.Position:=100;
   end;
   if ((MainForm.WaitFormHandle = false) and (Registration_Form.Progress.Position<>100)) then
   Registration_Form.Progress.Position:=100;
end;

procedure TRegistration_Form.Cancel_Filter_Kat_ButtonClick(
  Sender: TObject);
begin
Registration_Form.RefreshButtonClick(Sender);
Filter_BarEdit.Text:='';
end;

procedure TRegistration_Form.PayButtonClick(Sender: TObject);
var id_kod_checker : int64;
begin
  if AccessResult.ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/Opl_Docs','View') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  // проверка существования данного ид.кода
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  id_kod_checker:= DataSet[KeyField];
  ReadDataSet.SelectSQL.Text:='select EXIST from ST_DT_PFIO_ID_KOD_EXIST_CHECK('+ IntToStr(id_kod_checker) +')';
  ReadDataSet.Open;

  if ReadDataSet['EXIST'] = 0 then
   begin
    ShowMessage('Данной записи больше не сущствует. Возможно, она удалена другим клиентским приложением во время вашей сессии. Нажмите "Обновить".');
    ReadDataSet.close;
    Screen.Cursor:=crDefault;
    exit;
   end;

  ReadDataSet.close;
  Screen.Cursor:=crDefault;

  Screen.Cursor:= crHourGlass;
  Progress.Position:=3;
  Progress.Update;

   // формирование корректных счетов и операций на сегодня
  With WriteProc do
   begin
    try
     StoredProcName:='ST_DATE_PROV_SYS_DATA_CHECK_UPT';
     Transaction.StartTransaction;
     Prepare;
     ExecProc;
     Transaction.Commit;
     Close;
      except
       Transaction.Rollback;
       ShowMessage('Произошла ошибка при выполнении процедуры ST_DATE_PROV_SYS_DATA_CHECK_UPT!'+ #13+'Сбой в работе системы.');
       raise;
    end;

   end;

 Calc_ButtonClick(Self);
end;

procedure TRegistration_Form.dxBarLargeButton4Click(Sender: TObject);
var
  id_kod_checker : int64;
begin
  if AccessResult.ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/Narushitely','View') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  // проверка существования данного ид.кода
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  id_kod_checker:= DataSet[KeyField];
  ReadDataSet.SelectSQL.Text:='select EXIST from ST_DT_PFIO_ID_KOD_EXIST_CHECK('+ IntToStr(id_kod_checker) +')';
  ReadDataSet.Open;

  if ReadDataSet['EXIST'] = 0 then
   begin
    ShowMessage('Данной записи больше не сущствует. Возможно, она удалена другим клиентским приложением во время вашей сессии. Нажмите "Обновить".');
    ReadDataSet.close;
    Screen.Cursor:=crDefault;
    exit;
   end;

  ReadDataSet.close;
  Screen.Cursor:=crDefault;

  LoadPackegeStudCity.LoadWorkWithNarush(self,DataModule1.DB.Handle,self.DataSet[KeyField],AccessResult.ID_User);
end;

procedure TRegistration_Form.PrintButtonClick(Sender: TObject);
begin
  if DataSet.RecordCount = 0 then Exit;
  
  LoadPackegeStudCity.LoadViewDocPrint(self, DataModule1.DB.Handle, self.DataSet[KeyField], 1);

  DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
  DataSet.SQLs.RefreshSQL.Text:=  'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(edit_item_id)+')';;
  DataSet.Edit;
  DataSet.Post;

end;

procedure TRegistration_Form.SearchActionExecute(Sender: TObject);
begin
Filter_BarEdit.SetFocus;
end;

procedure TRegistration_Form.cxGridDBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
if Button = mbRight then
dxBarPopupMenu1.PopupFromCursorPos;
end;

procedure TRegistration_Form.cxGridDBTableView1DblClick(Sender: TObject);
begin
Registration_Form.EditButtonClick(Sender);
end;


// вызов формы прописки
procedure TRegistration_Form.Propiska_LargeButtonClick(Sender: TObject);
var
  Probel : string;
  edititem : int64;
  i: integer;
  id_kod_checker : int64;
begin
  if AccessResult.ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/List_of_Propis','View') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  // проверка существования данного ид.кода
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  id_kod_checker:=DataSet[KeyField];
  ReadDataSet.SelectSQL.Text:='select EXIST from ST_DT_PFIO_ID_KOD_EXIST_CHECK('+ IntToStr(id_kod_checker) +')';
  ReadDataSet.Open;
  if ReadDataSet['EXIST'] = 0 then
   begin
    ShowMessage('Данной записи больше не сущствует. Возможно, она удалена другим клиентским приложением во время вашей сессии. Нажмите "Обновить".');
    ReadDataSet.close;
    Screen.Cursor:=crDefault;
    exit;
   end;
  ReadDataSet.close;
  Screen.Cursor:=crDefault;


  screen.Cursor:=crHourGlass;
  Probel:='    ';

  frmPropiska:=TfrmPropiska.Create(self);
  frmPropiska.prp_FIO_Label.Caption:= DataSet['FIO_COMBO'];

  Progress.Position:=3;
  Progress.Update;

  if DataSet['STATUS'] <> null then
   if DataSet['STATUS'] = 'Прописан'
    then frmPropiska.prp_Vipiska_LargeButton.Enabled:= True;

  if DataSet['STATUS'] <> null then
   if DataSet['STATUS'] = 'Выписан'
    then
     begin
      frmPropiska.prp_Vipiska_Sheet.TabVisible:=true;
      frmPropiska.prp_Vip_Dopolnenie_Sheet.TabVisible:=true;

      frmPropiska.prp_Prodlenie_LargeButton.Enabled:= True;
      frmPropiska.prp_prp_OkButton.Enabled:=false;
      frmPropiska.prp_dp_OkButton.Enabled:=false;

      // изменение цвета прописки
      frmPropiska.prp_prp_Country_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_Oblast_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_Oblast_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_Rayon_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_RAJ_D_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_DateIncome.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_DateBegPropi.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_DateEndPropi.Style.Color:= clBtnFace;
      frmPropiska.prp_AdresPropi_Edit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_HouseNumber_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_HOUSE_D_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_Index_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_KvartNumber_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_KVART_D_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_Selo_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_Street_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_STREET_D_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_Gorod_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_prp_DATE_PRIB_DateEdit.Style.Color:= clBtnFace;

      // изменение цвета в дополнительно
      frmPropiska.prp_dp_DateMestoUbitiya.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_ResonPriezd_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_Srok_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_ResonPereezd_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_GdeRabotal_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_KemRabotal_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_Dolgnost_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_Osvita_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_UchStepen_ComboBox.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_Gragdanstvo_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_Nazionalnost_TextEdit.Style.Color:= clBtnFace;
      frmPropiska.prp_dp_DomTelefon_MaskEdit.Style.Color:= clBtnFace;

      frmPropiska.prp_Propiska_GroupBox.Enabled:=false;
      frmPropiska.prp_Adittional_GroupBox.Enabled:=false;

      frmPropiska.Height:=frmPropiska.Height+63;
     end;

  if ((DataSet['POL'] = 'Ж') or (DataSet['POL'] = 'ж'))
   then frmPropiska.prp_Warrior_Sheet.Enabled:=false;

  // заполнение ид.кода формы прописки-----------------------------------------------------------------------
  frmPropiska.edit_item_id:=dataset[KeyField];

  // дата рождения ------------------------------------------------------------------------------------------
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  edititem:= self.DataSet[KeyField];
  ReadDataSet.SelectSQL.Text:='select Date_birn from ST_PFIO_BIRN_DATE('+ inttostr(edititem)+')' ;
  ReadDataSet.Open;
  if ReadDataSet['Date_Birn'] <> null
   then frmPropiska.prp_DateOfBorn_Label.Caption:=frmPropiska.prp_DateOfBorn_Label.Caption+ ': '+ DateToStr(ReadDataSet['Date_Birn'])+'   ';
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  // заполнение даты окончания прописки, в зависимости от курса
  // бессрочная прописка
  frmPropiska.prp_prp_DateEndPropi.Date:= StrToDate('01.01.3333');

  // заполнение кокомбобоксов - начало ------------------------------------------------------------------------------------------

  // Выбор наименований дохода и занятий
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_BUZY from ST_INI_PROPI_BUSY_SELECT';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_dp_Dolgnost_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_dp_Dolgnost_ComboBox.Properties.Items.Add(ReadDataSet['N_BUZY'] );
    ReadDataSet.Next;
   end;
  frmPropiska.prp_dp_Dolgnost_ComboBox.ItemIndex := -1;
  ReadDataSet.Close;

  if Progress.Position <> 100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  // Выбор наименований образования
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_OSVITA from ST_INI_PROPI_OSVITA_SELECT';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_dp_Osvita_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_dp_Osvita_ComboBox.Properties.Items.Add(ReadDataSet['N_OSVITA'] );

    if DataSet['STATUS'] <> null then
     if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vip_Dopolnenie_Sheet.TabVisible))
      then frmPropiska.prp_vip_Osvita_ComboBox.Properties.Items.Add(ReadDataSet['N_OSVITA'] );

    ReadDataSet.Next;
   end;
  frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=-1;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  //Выбор наименований региона
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_PUNKT from ST_INI_PROPI_PUNKT_SELECT';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_mg_Oblast_ComboBox.Clear;
  frmPropiska.prp_prp_Oblast_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_mg_Oblast_ComboBox.Properties.Items.Add(ReadDataSet['N_PUNKT'] );
    frmPropiska.prp_prp_Oblast_ComboBox.Properties.Items.Add(ReadDataSet['N_PUNKT'] );

    if DataSet['STATUS'] <> null then
     if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vipiska_Sheet.TabVisible))
      then frmPropiska.prp_vip_Oblast_ComboBox.Properties.Items.Add(ReadDataSet['N_PUNKT'] );

    ReadDataSet.Next;
   end;
  frmPropiska.prp_mg_Oblast_ComboBox.ItemIndex:=-1;
  frmPropiska.prp_prp_Oblast_ComboBox.ItemIndex:=-1;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  // Выбор наименований причин переезда\приезда
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_RESON from ST_INI_PROPI_RESON_SELECT';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_dp_ResonPereezd_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_dp_ResonPereezd_ComboBox.Properties.Items.Add(ReadDataSet['N_RESON'] );
    if DataSet['STATUS'] <> null then
     if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vip_Dopolnenie_Sheet.TabVisible))
      then frmPropiska.prp_vip_ResonPereezd_ComboBox.Properties.Items.Add(ReadDataSet['N_RESON'] );
    ReadDataSet.Next;
   end;

  frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex:=-1;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  //Выбор наименований семейного положения
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_STAN from ST_INI_PROPI_STAN_SELECT';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_fs_SimStan_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_fs_SimStan_ComboBox.Properties.Items.Add(ReadDataSet['N_STAN'] );
    ReadDataSet.Next;
   end;
  frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex:=-1;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  //Выбор наименований научных званий
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_STUPEN from ST_INI_PROPI_STUPEN_SELECT';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_dp_UchStepen_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_dp_UchStepen_ComboBox.Properties.Items.Add(ReadDataSet['N_STUPEN'] );
    if DataSet['STATUS'] <> null then
     if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vip_Dopolnenie_Sheet.TabVisible))
      then frmPropiska.prp_vip_UchStepen_ComboBox.Properties.Items.Add(ReadDataSet['N_STUPEN'] );
    ReadDataSet.Next;
   end;
  frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=-1;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  // Выбор наименований организационно-структурных единиц поселения
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_INI_PROPI_TOWN_SELECT';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_mg_GorodSeloPGT_ComboBox.Clear;
  frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_mg_GorodSeloPGT_ComboBox.Properties.Items.Add(ReadDataSet['N_TOWN'] );
    frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Properties.Items.Add(ReadDataSet['N_TOWN'] );
    if DataSet['STATUS'] <> null then
     if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vipiska_Sheet.TabVisible))
      then frmPropiska.prp_vip_GorodSeloPGT_ComboBox.Properties.Items.Add(ReadDataSet['N_TOWN'] );
    ReadDataSet.Next;
   end;
  frmPropiska.prp_mg_GorodSeloPGT_ComboBox.ItemIndex:=-1;
  frmPropiska.prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=-1;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  // Выбор наименований населенных пунктов для родителей
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_INI_PROPI_TOWN_PARENTS_SEL';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_f_GorodSeloPGT_ComboBox.Clear;
  frmPropiska.prp_m_GorodSeloPGT_ComboBox.Clear;
  for i:=0 to ReadDataSet.RecordCount-1 do
   begin
    frmPropiska.prp_f_GorodSeloPGT_ComboBox.Properties.Items.Add(ReadDataSet['N_TOWN'] );
    frmPropiska.prp_m_GorodSeloPGT_ComboBox.Properties.Items.Add(ReadDataSet['N_TOWN'] );
    ReadDataSet.Next;
   end;
  frmPropiska.prp_f_GorodSeloPGT_ComboBox.ItemIndex:=-1;
  frmPropiska.prp_m_GorodSeloPGT_ComboBox.ItemIndex:=-1;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;
  // заполнение кокомбобоксов - окончание ---------------------------------------------------------------------------------------

  // УМОЛЧАНИЯ
  frmPropiska.prp_mg_Country_TextEdit.Text:='УКРАИНА';
  frmPropiska.prp_prp_Country_TextEdit.Text:='УКРАИНА';
  frmPropiska.prp_dp_Gragdanstvo_TextEdit.Text:='УКРАИНА';
  if ((DataSet['POL'] = 'Ж') or (DataSet['POL'] = 'ж'))
   then frmPropiska.prp_dp_Nazionalnost_TextEdit.Text:='УКРАИНКА'
   else frmPropiska.prp_dp_Nazionalnost_TextEdit.Text:='УКРАИНЕЦ';

  // заполнение вкладок-----------------------------------------------------------------------------------------------------------------------

  // заполнение вкладки СЕМЕЙНОГО ПОЛОЖЕНИЯ---------------------------------------------------------------------------------------------------
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select * from ST_PROPI_CHILD_SELECT('+ inttostr(edititem)+')' ;;
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_GridTableView.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    frmPropiska.prp_GridTableView.DataController.Values[i, 0] := ReadDataSet['FAMILIYA']+' '+ReadDataSet['IMYA']+' '+ReadDataSet['OTCHESTVO'];
    frmPropiska.prp_GridTableView.DataController.Values[i, 2]:=ReadDataSet['DATE_R'];
    frmPropiska.prp_GridTableView.DataController.Values[i, 1]:=ReadDataSet['POL'];
    frmPropiska.prp_GridTableView.DataController.Values[i, 3] := ReadDataSet['IMYA'];
    frmPropiska.prp_GridTableView.DataController.Values[i, 4]:=ReadDataSet['OTCHESTVO'];
    frmPropiska.prp_GridTableView.DataController.Values[i, 5]:=ReadDataSet['FAMILIYA'];
    ReadDataSet.Next;
   end;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select * from ST_DT_FAMILY_SELECT('+ inttostr(edititem)+')' ;;
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  frmPropiska.prp_Rodstv_GridTableView.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    frmPropiska.prp_Rodstv_GridTableView.DataController.Values[i, 0] := ReadDataSet['FIO_COMBO'];
    frmPropiska.prp_Rodstv_GridTableView.DataController.Values[i, 1]:=ReadDataSet['NAME_RELATIONS'];
    frmPropiska.prp_Rodstv_GridTableView.DataController.Values[i, 2]:=ReadDataSet['ID_TYPE_FEM_REL'];
    frmPropiska.prp_Rodstv_GridTableView.DataController.Values[i, 3] := ReadDataSet['ID_FAMILY_KOD'];
    ReadDataSet.Next;
   end;
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  //--устанавливаем значения по умолчанию для новых поселенцев--
  if DataSet['STATUS'] <> null then
   if ((DataSet['STATUS'] = 'Зарегистрированный') or (DataSet['STATUS'] = 'Без прописки')) then
    begin
     ///!!!!!!--заполнение умолчаний(в дальнейшем нужно сделать настройку из базы)--
     frmPropiska.prp_prp_Oblast_TextEdit.Text:='ДОНЕЦКАЯ';
     frmPropiska.prp_mg_Oblast_TextEdit.Text:='ДОНЕЦКАЯ';
     frmPropiska.prp_dp_DateMestoUbitiya.Text:='19';
     frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=1;
     frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=1;
     frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex := 7;
     frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex := 1;
     frmPropiska.prp_dp_GdeRabotal_TextEdit.Text:='ОШ №';
     frmPropiska.prp_dp_KemRabotal_TextEdit.Text:='УЧАЩИЙСЯ';
     frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=1;
     frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=0;
     frmPropiska.prp_dp_Dolgnost_ComboBox.ItemIndex := 2;

     // мама с папой
     frmPropiska.prp_f_Familia_Edit.Text:= DataSet['FAMILIA'];
     frmPropiska.prp_m_Familia_Edit.Text:= DataSet['FAMILIA'];
     frmPropiska.prp_m_Oblast_TextEdit.Text:= 'ДОНЕЦКАЯ';
     frmPropiska.prp_f_Oblast_TextEdit.Text:= 'ДОНЕЦКАЯ';
    end;   

  // заполнение вкладки РОДИТЕЛЕЙ--------------------------------------------------------------------------------------------------------------
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select * from ST_PROPI_RODIT_SELECT('+ inttostr(edititem)+')' ;
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
          // заполнение ПАПЫ---------------
                  if ReadDataSet['F_FAM']<> null then
                  frmPropiska.prp_f_Familia_Edit.Text:=ReadDataSet['F_FAM'];
                  if ReadDataSet['F_IMYA']<> null then
                  frmPropiska.prp_f_Name_Edit.Text:= ReadDataSet['F_IMYA'];
                  if ReadDataSet['F_OT']<> null then
                  frmPropiska.prp_f_Otch_Edit.Text:= ReadDataSet['F_OT'];
                  if ReadDataSet['F_MESTO']<> null then
                  frmPropiska.prp_f_MestoRaboti_TextEdit.Text:= ReadDataSet['F_MESTO'];
                  if ReadDataSet['F_DOL']<> null then
                  frmPropiska.prp_f_Dolgnost_TextEdit.Text:= ReadDataSet['F_DOL'];
                  if ReadDataSet['F_TEL']<> null then
                  frmPropiska.prp_f_WorkTelefon_MaskEdit.Text:= ReadDataSet['F_TEL'];
                  if ReadDataSet['F_OBL']<> null then
                  frmPropiska.prp_f_Oblast_TextEdit.Text:= ReadDataSet['F_OBL'];
                  if ReadDataSet['F_RAJ']<> null then
                  frmPropiska.prp_f_Rayon_TextEdit.Text:= ReadDataSet['F_RAJ'];
                  if ReadDataSet['F_NOM_P']<> null then
                  frmPropiska.prp_F_NOM_P:=ReadDataSet['F_NOM_P'];
                  if ReadDataSet['F_PUNKT']<> null then
                  frmPropiska.prp_f_GorodSeloPGT_TextEdit.Text:= ReadDataSet['F_PUNKT'];
                  if ReadDataSet['F_STREET']<> null then
                  frmPropiska.prp_f_Street_TextEdit.Text:= ReadDataSet['F_STREET'];
                  if ReadDataSet['F_HOUSE']<> null then
                  frmPropiska.prp_f_HouseNumber_TextEdit.Text:= ReadDataSet['F_HOUSE'];
                  if ReadDataSet['F_KVART']<> null then
                  frmPropiska.prp_f_KvartNumber_TextEdit.Text:= ReadDataSet['F_KVART'];

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

          // заполнение МАМЫ---------------
                  if ReadDataSet['M_FAM']<> null then
                  frmPropiska.prp_m_Familia_Edit.Text:=ReadDataSet['M_FAM'];
                  if ReadDataSet['M_IMYA']<> null then
                  frmPropiska.prp_m_Name_Edit.Text:= ReadDataSet['M_IMYA'];
                  if ReadDataSet['M_OT']<> null then
                  frmPropiska.prp_m_Otch_Edit.Text:= ReadDataSet['M_OT'];
                  if ReadDataSet['M_MESTO']<> null then
                  frmPropiska.prp_m_MestoRaboti_TextEdit.Text:= ReadDataSet['M_MESTO'];
                  if ReadDataSet['M_DOL']<> null then
                  frmPropiska.prp_m_Dolgnost_TextEdit.Text:= ReadDataSet['M_DOL'];
                  if ReadDataSet['M_TEL']<> null then
                  frmPropiska.prp_m_WorkTelefon_MaskEdit.Text:= ReadDataSet['M_TEL'];
                  if ReadDataSet['M_OBL']<> null then
                  frmPropiska.prp_m_Oblast_TextEdit.Text:= ReadDataSet['M_OBL'];
                  if ReadDataSet['M_RAJ']<> null then
                  frmPropiska.prp_m_Rayon_TextEdit.Text:= ReadDataSet['M_RAJ'];
                  if ReadDataSet['M_NOM_P']<> null then
                  frmPropiska.prp_M_NOM_P:=ReadDataSet['M_NOM_P'];
                  if ReadDataSet['M_PUNKT']<> null then
                  frmPropiska.prp_m_GorodSeloPGT_TextEdit.Text:= ReadDataSet['M_PUNKT'];
                  if ReadDataSet['M_STREET']<> null then
                  frmPropiska.prp_m_Street_TextEdit.Text:= ReadDataSet['M_STREET'];
                  if ReadDataSet['M_HOUSE']<> null then
                  frmPropiska.prp_m_HouseNumber_TextEdit.Text:= ReadDataSet['M_HOUSE'];
                  if ReadDataSet['M_KVART']<> null then
                  frmPropiska.prp_m_KvartNumber_TextEdit.Text:= ReadDataSet['M_KVART'];

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

            ReadDataSet.Close;
           // комбо для ПАПЫ
                  if  frmPropiska.prp_F_NOM_P <> null then begin
                  Comboflag:=0;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_GET_NAME_TOWN_PARENTS_BY_ID('+ inttostr(frmPropiska.prp_F_NOM_P)+')' ;
                  ReadDataSet.Open;
                   for i:=0 to frmPropiska.prp_f_GorodSeloPGT_ComboBox.Properties.Items.Count-1 do
                    begin
                     frmPropiska.prp_f_GorodSeloPGT_ComboBox.ItemIndex:=i;
                     if frmPropiska.prp_f_GorodSeloPGT_ComboBox.Text = ReadDataSet['N_TOWN'] then
                     begin
                     Comboflag:=1;
                     break;
                     end;
                    end;
                   if Comboflag =0 then frmPropiska.prp_f_GorodSeloPGT_ComboBox.ItemIndex:=-1;
                  ReadDataSet.Close;
                  end;
           // комбо для МАМЫ
                  if  frmPropiska.prp_M_NOM_P <> null then begin
                  Comboflag:=0;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_GET_NAME_TOWN_PARENTS_BY_ID('+ inttostr(frmPropiska.prp_M_NOM_P)+')' ;
                  ReadDataSet.Open;
                   for i:=0 to frmPropiska.prp_m_GorodSeloPGT_ComboBox.Properties.Items.Count-1 do
                    begin
                     frmPropiska.prp_m_GorodSeloPGT_ComboBox.ItemIndex:=i;
                     if frmPropiska.prp_m_GorodSeloPGT_ComboBox.Text = ReadDataSet['N_TOWN'] then begin
                     Comboflag:=1;
                     break;
                     end;
                    end;
                  ReadDataSet.Close;
                  if Comboflag =0 then frmPropiska.prp_m_GorodSeloPGT_ComboBox.ItemIndex:=-1;
                  end;

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

           // информация про РОЖДЕНИЕ ------------------------------------------------------------------------
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select * from ST_DT_PFIO_R_SELECT('+ inttostr(edititem)+')' ;
                  ReadDataSet.Open;
               if ReadDataSet['INDEX_R']<> null then
               frmPropiska.prp_mg_Index_TextEdit.Text:=ReadDataSet['INDEX_R'];
               if ReadDataSet['KRAYNA_R']<> null then
               frmPropiska.prp_mg_Country_TextEdit.Text:=ReadDataSet['KRAYNA_R'];
               if ReadDataSet['RAJON_R']<> null then
               frmPropiska.prp_mg_Rayon_TextEdit.Text:=ReadDataSet['RAJON_R'];
               if ReadDataSet['NAZV_PUNKT']<> null then
               frmPropiska.prp_mg_Oblast_TextEdit.Text:=ReadDataSet['NAZV_PUNKT'];
               if ReadDataSet['NAZV_TOWN']<> null then
               frmPropiska.prp_mg_Gorod_TextEdit.Text:=ReadDataSet['NAZV_TOWN'];
               if ReadDataSet['SELO_R']<> null then
               frmPropiska.prp_mg_Selo_TextEdit.Text:=ReadDataSet['SELO_R'];
               if ReadDataSet['NOM_PUNKT']<> null then
               frmPropiska.prp_mg_NOM_PUNKT:=ReadDataSet['NOM_PUNKT'];
               if ReadDataSet['NOM_TOWN']<> null then
               frmPropiska.prp_mg_NOM_TOWN:=ReadDataSet['NOM_TOWN'];
                  ReadDataSet.Close;


          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

           // комбо для рождения
              // комбо пункта
                 if  frmPropiska.prp_mg_NOM_PUNKT <> null then begin
                  Comboflag:=0;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_PUNKT from ST_GET_NAME_PUNKT_BY_ID('+ inttostr(frmPropiska.prp_mg_NOM_PUNKT)+')' ;
                  ReadDataSet.Open;
                   for i:=0 to frmPropiska.prp_mg_Oblast_ComboBox.Properties.Items.Count-1 do
                    begin
                     frmPropiska.prp_mg_Oblast_ComboBox.ItemIndex:=i;
                     if frmPropiska.prp_mg_Oblast_ComboBox.Text = ReadDataSet['N_PUNKT'] then
                     begin
                     Comboflag:=1;
                     break;
                     end;
                    end;
                  ReadDataSet.Close;
                  if Comboflag =0 then frmPropiska.prp_mg_Oblast_ComboBox.ItemIndex:=1; //выставляю ОБЛАСТЬ по-умолчанию
                  end;


          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

              // комбо тауна
                  if  frmPropiska.prp_mg_NOM_TOWN <> null then begin
                  Comboflag:=0;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_GET_NAME_TOWN_BY_ID('+ inttostr(frmPropiska.prp_mg_NOM_TOWN)+')' ;
                  ReadDataSet.Open;
                   for i:=0 to frmPropiska.prp_mg_GorodSeloPGT_ComboBox.Properties.Items.Count-1 do
                    begin
                     frmPropiska.prp_mg_GorodSeloPGT_ComboBox.ItemIndex:=i;
                     if frmPropiska.prp_mg_GorodSeloPGT_ComboBox.Text = ReadDataSet['N_TOWN'] then
                     begin
                     Comboflag:=1;
                     break;
                     end;
                    end;
                  ReadDataSet.Close;
                  if Comboflag =0 then frmPropiska.prp_mg_GorodSeloPGT_ComboBox.ItemIndex:=0; //выставляю ГОРОД по-умолчанию
                  end;


          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

// заполнение вкладки ПАСПОРТ---------------------------------------------------------------------------------------------------
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select * from ST_DT_PASP_SELECT('+ inttostr(edititem)+')' ;
                  ReadDataSet.Open;
                  ReadDataSet.FetchAll;
              frmPropiska.prp_PaspGridTableView.DataController.RecordCount := ReadDataSet.RecordCount;
              for i := 0 to ReadDataSet.RecordCount-1  do begin
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 0] := ReadDataSet['NAME_UDOST'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 1]:=ReadDataSet['P_FAM']+' '+ReadDataSet['P_IMYA']+' '+ReadDataSet['P_OT'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 2]:=ReadDataSet['TYPE_UDOST'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 3] := ReadDataSet['P_FAM'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 4]:=ReadDataSet['P_IMYA'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 5]:=ReadDataSet['P_OT'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 6]:=ReadDataSet['PAS_VYDAN'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 7]:=ReadDataSet['DATE_VYDAN'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 8]:=ReadDataSet['SERYA'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 9]:=ReadDataSet['NOMER'];
              frmPropiska.prp_PaspGridTableView.DataController.Values[i, 10]:=ReadDataSet['OSNOVANIE'];
              ReadDataSet.Next;
              end;
                 ReadDataSet.Close;


          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;
             // про ВСЕ ОСТАЛЬНОЕ ---------------------------------------------------------------------------------------
                  ReadDataSet.Close;
                  ReadDataSet.SelectSQL.Clear;
                  ReadDataSet.SelectSQL.Text:='select * from ST_DT_PROPI_SELECT('+ inttostr(edititem)+')' ;
                  ReadDataSet.Open;
                   // про ВОЕНКОМАТ
                      if ReadDataSet['FROM_RVK']<>null then
                      frmPropiska.prp_vu_FromRVK_TextEdit.Text:=ReadDataSet['FROM_RVK'];
                      if ReadDataSet['VU_DATE_PR']<>null then
                      frmPropiska.prp_vu_PostavlenDate.Date:=ReadDataSet['VU_DATE_PR'];
                      if ReadDataSet['VU_DATE_SN']<>null then
                      frmPropiska.prp_vu_SnyatDate.Date:=ReadDataSet['VU_DATE_SN'];
                      if ReadDataSet['VU_NOTE']<>null then
                      frmPropiska.prp_vu_Notes.Text:=ReadDataSet['VU_NOTE'];


          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

                   // про ПРОПИСКУ
                      if ReadDataSet['BEFOR_STAT']<>null then
                      frmPropiska.prp_prp_Country_TextEdit.Text:=ReadDataSet['BEFOR_STAT'];
                      if ReadDataSet['BEFO_PUNKT']<>null then
                      frmPropiska.prp_prp_Oblast_TextEdit.Text:= ReadDataSet['BEFO_PUNKT'];
                      if ReadDataSet['BEFOR_RAJ']<>null then
                      frmPropiska.prp_prp_Rayon_TextEdit.Text:= ReadDataSet['BEFOR_RAJ'];
                      if ReadDataSet['BEFOR_TOWN']<>null then
                      frmPropiska.prp_prp_Gorod_TextEdit.Text:= ReadDataSet['BEFOR_TOWN'];
                      if ReadDataSet['BEFOR_IND']<>null then
                      frmPropiska.prp_prp_Index_TextEdit.Text:= ReadDataSet['BEFOR_IND'];
                      if ReadDataSet['BEFOR_SELO']<>null then
                      frmPropiska.prp_prp_Selo_TextEdit.Text:= ReadDataSet['BEFOR_SELO'];
                      if ReadDataSet['BEFOR_STR']<>null then
                      frmPropiska.prp_prp_Street_TextEdit.Text:= ReadDataSet['BEFOR_STR'];
                      if ReadDataSet['BEFOR_H']<>null then
                      frmPropiska.prp_prp_HouseNumber_TextEdit.Text:= ReadDataSet['BEFOR_H'];
                      if ReadDataSet['BEFOR_KV']<>null then
                      frmPropiska.prp_prp_KvartNumber_TextEdit.Text:= ReadDataSet['BEFOR_KV'];
                      if ReadDataSet['BEF_D_PR']<>null then
                      frmPropiska.prp_prp_DateIncome.Date:= ReadDataSet['BEF_D_PR'];
                      if ReadDataSet['KOD_BUILD']<>null then
                      frmPropiska.prp_Kod_Build:= ReadDataSet['KOD_BUILD'];

                       if readDataSet['CONT_PROPI'] = 1 then
                       begin
                       frmPropiska.prp_CurrentPropiska_GroupBox.Caption:= frmPropiska.prp_CurrentPropiska_GroupBox.Caption + ' (ПРОДЛЕНИЕ)';
                       frmPropiska.cont_propi:=1;
                       end
                       else frmPropiska.cont_propi:=-1;

                      if ReadDataSet['FROM_DON']<>null then
                          if ReadDataSet['FROM_DON'] = 1 then
                          begin
                          frmPropiska.prp_PageControl.ActivePageIndex:=3;
                          frmPropiska.prp_prp_FromDonezk_CheckBox.Checked:=true;
                          end
                          else
                          begin
                          frmPropiska.prp_PageControl.ActivePageIndex:=3;
                          frmPropiska.prp_prp_FromDonezk_CheckBox.Checked:=false;
                          end;
                      if ReadDataSet['TO_DON']<>null then
                        if ReadDataSet['TO_DON'] = 1 then
                          if frmPropiska.prp_Vipiska_Sheet.TabVisible then
                          begin
                          frmPropiska.prp_PageControl.ActivePageIndex:=0;
                          frmPropiska.prp_vip_ToDonezk_CheckBox.Checked:=true;
                          end
                        else
                          if frmPropiska.prp_Vipiska_Sheet.TabVisible then
                          begin
                          frmPropiska.prp_PageControl.ActivePageIndex:=0;
                          frmPropiska.prp_vip_ToDonezk_CheckBox.Checked:=false;
                          end;

                      if ReadDataSet['BEG_PROPIS']<>null then
                      BEGIN
                      frmPropiska.prp_BEG_PROPIS:= ReadDataSet['BEG_PROPIS'];
                      frmPropiska.prp_prp_DateBegPropi.Date:= ReadDataSet['BEG_PROPIS'];
                      END;
                      if ReadDataSet['END_PROPIS']<>null then
                      BEGIN
                      frmPropiska.prp_END_PROPIS:= ReadDataSet['END_PROPIS'];
                      frmPropiska.prp_prp_DateEndPropi.Date:= ReadDataSet['END_PROPIS'];
                      if ReadDataSet['END_PROPIS']< DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP then
                      begin
                      //frmPropiska.prp_SaveAll_LargeButton.Enabled:=false;
                      frmPropiska.prp_Prodlenie_LargeButton.Enabled:=True;
                      //frmPropiska.prp_mg_OkButton.Enabled:=false;
                      //frmPropiska.prp_prp_OkButton.Enabled:=false;
                      //frmPropiska.prp_vu_OkButton.Enabled:=false;
                      //frmPropiska.prp_dp_OkButton.Enabled:=false;
                      //frmPropiska.prp_pass_OkButton.Enabled:=false;
                      //frmPropiska.prp_f_OkButton.Enabled:=false;
                      //frmPropiska.prp_m_OkButton.Enabled:=false;
                      //frmPropiska.prp_fs_OkButton.Enabled:=false;

                      //frmPropiska.prp_FamilyStatus_GroupBox.Enabled:=false;
                      //frmPropiska.prp_BornPlace_GroupBox.Enabled:=false;
                      //frmPropiska.prp_Propiska_GroupBox.Enabled:=false;
                      //frmPropiska.prp_Adittional_GroupBox.Enabled:=false;
                      //frmPropiska.prp_Warrior_GroupBox.Enabled:=false;
                      //frmPropiska.prp_MultiPass_GroupBox.Enabled:=false;
                      //frmPropiska.prp_Daddy_GroupBox.Enabled:=false;
                      //frmPropiska.prp_Mummi_GroupBox.Enabled:=false;

                      end;
                      END;
                      if ReadDataSet['BEFOR_NOM']<>null then
                      frmPropiska.prp_prp_NOM_TOWN:= ReadDataSet['BEFOR_NOM'];
                      if ReadDataSet['NOM_PUNKT']<>null then
                      frmPropiska.prp_prp_NOM_PUNKT:= ReadDataSet['NOM_PUNKT'];

                      // про Донецк в прописке
                      if ReadDataSet['FROM_DON']<>null then
                          if ReadDataSet['FROM_DON'] = 1 then
                            begin
                              if ReadDataSet['RAJ_D']<>null then
                              frmPropiska.prp_prp_RAJ_D_TextEdit.Text:= ReadDataSet['RAJ_D'];
                              if ReadDataSet['STREET_D']<>null then
                              frmPropiska.prp_prp_STREET_D_TextEdit.Text:= ReadDataSet['STREET_D'];
                              if ReadDataSet['HOUSE_D']<>null then
                              frmPropiska.prp_prp_HOUSE_D_TextEdit.Text:= ReadDataSet['HOUSE_D'];
                              if ReadDataSet['KVART_D']<>null then
                              frmPropiska.prp_prp_KVART_D_TextEdit.Text:= ReadDataSet['KVART_D'];
                              if ReadDataSet['DATE_PRIB']<>null then
                              frmPropiska.prp_prp_DATE_PRIB_DateEdit.date:= ReadDataSet['DATE_PRIB'] ;
                            end;

                   // про ДОПОЛНИТЕЛЬНО
                      if ReadDataSet['BEFO_YEAR']<>null then
                      frmPropiska.prp_dp_DateMestoUbitiya.text:= ReadDataSet['BEFO_YEAR'];
                      if ReadDataSet['BEFO_WHERE']<>null then
                      frmPropiska.prp_dp_GdeRabotal_TextEdit.Text:=ReadDataSet['BEFO_WHERE'];
                      if ReadDataSet['BEFO_POSADA']<>null then
                      frmPropiska.prp_dp_KemRabotal_TextEdit.Text:=ReadDataSet['BEFO_POSADA'];
                      if ReadDataSet['GROMADYN']<>null then
                      frmPropiska.prp_dp_Gragdanstvo_TextEdit.Text:= ReadDataSet['GROMADYN'];
                      if ReadDataSet['NAZIONAL']<>null then
                      frmPropiska.prp_dp_Nazionalnost_TextEdit.Text:= ReadDataSet['NAZIONAL'];
                      if ReadDataSet['PHONE']<>null then
                      frmPropiska.prp_dp_DomTelefon_MaskEdit.Text:= ReadDataSet['PHONE'];
                      if ReadDataSet['BEFO_OSVITA']<>null then
                      frmPropiska.prp_dp_BEFO_OSVITA:=ReadDataSet['BEFO_OSVITA'];
                      if ReadDataSet['BEFO_STUPEN']<>null then
                      frmPropiska.prp_dp_BEFO_STUPEN:= ReadDataSet['BEFO_STUPEN'];
                      if ReadDataSet['BEFO_META']<>null then
                      frmPropiska.prp_dp_BEFO_META:=ReadDataSet['BEFO_META'];
                      if ReadDataSet['BEFO_STAN']<>null then
                      frmPropiska.prp_fs_BEFO_STAN:= ReadDataSet['BEFO_STAN'];

                      if ReadDataSet['BEFO_VMESTE']<>null then
                      if ReadDataSet['BEFO_VMESTE']=1 then
                      frmPropiska.prp_fs_Vmeste_CheckBox.Checked:=true
                      else frmPropiska.prp_fs_Vmeste_CheckBox.Checked:=false;

                      if ReadDataSet['BEFO_STROK']<>null then
                      if ReadDataSet['BEFO_STROK']=1 then
                      frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=0
                      else frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=1;

                      if ReadDataSet['BEFO_RESON']<>null then
                      if ReadDataSet['BEFO_RESON']=1 then
                      frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=0
                      else frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=1;

                      if ReadDataSet['BEFO_BUSY']<>null then
                      frmPropiska.prp_dp_BEFO_BUZY:=ReadDataSet['BEFO_BUSY'];

                      // пункты по выписке
                      if ReadDataSet['TYPE_AF_OB']<>null then
                      frmPropiska.prp_vip_NOM_PUNKT:= ReadDataSet['TYPE_AF_OB'];
                      if ReadDataSet['TYPE_AF_TO']<>null then
                      frmPropiska.prp_vip_NOM_TOWN:= ReadDataSet['TYPE_AF_TO'];
                      //--дополнительно - выписка
                      if ReadDataSet['AFTE_VYP_OSVITA']<>null then
                      frmPropiska.prp_vip_AFTE_VYP_OSVITA:= ReadDataSet['AFTE_VYP_OSVITA'];
                      if ReadDataSet['AFTE_VYP_STUPEN']<>null then
                      frmPropiska.prp_vip_AFTE_VYP_STUPEN:= ReadDataSet['AFTE_VYP_STUPEN'];
                      if ReadDataSet['AFTE_VYP_RESON']<>null then
                      frmPropiska.prp_vip_AFTE_VYP_RESON:= ReadDataSet['AFTE_VYP_RESON'];


                          if DataSet['STATUS'] <> null then
                           if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vipiska_Sheet.TabVisible))
                             then begin
                             if ReadDataSet['AFTE_OBL']<>null then
                             frmPropiska.prp_vip_Oblast_TextEdit.Text:=ReadDataSet['AFTE_OBL'];
                             if ReadDataSet['AFTE_RAJ']<>null then
                             frmPropiska.prp_vip_Rayon_TextEdit.Text:=ReadDataSet['AFTE_RAJ'];
                             if ReadDataSet['AFTE_TOWN']<>null then
                             frmPropiska.prp_vip_Gorod_TextEdit.Text:=ReadDataSet['AFTE_TOWN'];
                             if ReadDataSet['AFTE_SELO']<>null then
                             frmPropiska.prp_vip_Selo_TextEdit.Text:=ReadDataSet['AFTE_SELO'];
                             if ReadDataSet['AFTE_STREET']<>null then
                             frmPropiska.prp_vip_street_TextEdit.Text:=ReadDataSet['AFTE_STREET'];
                             IF ReadDataSet['AFTE_HOUSE']<>null then
                             frmPropiska.prp_vip_house_TextEdit.Text:=ReadDataSet['AFTE_HOUSE'];
                             IF ReadDataSet['AFTE_KVARTIRA']<>null then
                             frmPropiska.prp_vip_kvartira_TextEdit.Text:=ReadDataSet['AFTE_KVARTIRA'];
                             if ReadDataSet['DATE_VYPIS']<>null then
                             frmPropiska.prp_vip_DateIncome.date:=ReadDataSet['DATE_VYPIS'];
                            { if ReadDataSet['TYPE_AF_TO']<>null then
                             frmPropiska.prp_vip
                             if ReadDataSet['TYPE_AF_OB']<>null then
                             frmPropiska.prp_vip}
                             if ReadDataSet['AFTE_IND']<>null then
                             frmPropiska.prp_vip_Index_TextEdit.Text:= ReadDataSet['AFTE_IND'];
                             if ReadDataSet['AFTE_STAT']<>null then
                             frmPropiska.prp_vip_Country_TextEdit.Text:= ReadDataSet['AFTE_STAT'];
                            { if ReadDataSet['AFTE_N_PR']<>null then
                             frmPropiska.prp_vip}
                             if ReadDataSet['AFTE_D_PR']<>null then
                             frmPropiska.prp_prp_DateIncome.Date:=ReadDataSet['AFTE_D_PR'];
                            { if ReadDataSet['TO_DON']<>null then
                             frmPropiska.prp_vip}

                             // выписка - дополнительно
                             if ReadDataSet['AFTE_VYP_POSADA']<>null then
                             frmPropiska.prp_vip_KemRabotal_TextEdit.Text:=ReadDataSet['AFTE_VYP_POSADA'];
                             if ReadDataSet['AFTE_VYP_WHERE']<>null then
                             frmPropiska.prp_vip_GdeRabotal_TextEdit.Text:=ReadDataSet['AFTE_VYP_WHERE'];

                          if ReadDataSet['TO_DON']<>null then
                          if ReadDataSet['TO_DON'] = 1 then
                            begin
                              if ReadDataSet['RAJ_D_U']<>null then
                              frmPropiska.prp_vip_RAJ_D_TextEdit.Text:= ReadDataSet['RAJ_D_U'];
                              if ReadDataSet['STREET_D_U']<>null then
                              frmPropiska.prp_vip_STREET_D_TextEdit.Text:= ReadDataSet['STREET_D_U'];
                              if ReadDataSet['HOUSE_D_U']<>null then
                              frmPropiska.prp_vip_HOUSE_D_TextEdit.Text:= ReadDataSet['HOUSE_D_U'];
                              if ReadDataSet['KVART_D_U']<>null then
                              frmPropiska.prp_vip_KVART_D_TextEdit.Text:= ReadDataSet['KVART_D_U'];
                            end;
                             end;
                  ReadDataSet.Close;

                  if  ((frmPropiska.prp_Kod_Build<> null) and (frmPropiska.prp_Kod_Build<>0))then begin
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select TOWN, RAION, STREET, HOUSE  from ST_SP_PROPI_BUILDS_SEL_BY_KOD('+ inttostr(frmPropiska.prp_Kod_Build)+')' ;
                      ReadDataSet.Open;
                      frmPropiska.prp_AdresPropi_Edit.Text := ReadDataSet['TOWN'] + ', ' + ReadDataSet['RAION'] + ' р-н, ул. ' + ReadDataSet['STREET'] + ', дом ' + ReadDataSet['HOUSE'];
                      ReadDataSet.close;
                  end
                  else begin
                    if DataSet['STATUS'] <> null then
                    if ( (DataSet['STATUS'] = 'Зарегистрированный') or (DataSet['STATUS'] = 'Без прописки'))
                     then begin
                        // заполнение адреса прописки по-умолчанию
                                    frmPropiska.prp_AdresPropi_Edit.Text:='';
            if Dataset['N_FAK'] <> null then begin
            ReadDataSet.Close;
            ReadDataSet.SelectSQL.Clear;
            ReadDataSet.SelectSQL.Text:='select NUM_BUILD from ST_GET_BUILD_BY_FACULTY('+ inttostr(Dataset['N_FAK'])+')';
            ReadDataSet.Open;
            if ReadDataSet['NUM_BUILD']<>null then begin
            frmPropiska.prp_Kod_Build:= ReadDataSet['NUM_BUILD'];
            end;
            ReadDataSet.close;
            end;

            if frmPropiska.prp_Kod_Build <> 0 then begin
            ReadDataSet.SelectSQL.Clear;
            ReadDataSet.SelectSQL.Text:='select * from ST_SP_PROPI_BUILDS_SELECT_BY_ID('+ inttostr(frmPropiska.prp_Kod_Build)+')';
            ReadDataSet.Open;
            frmPropiska.prp_AdresPropi_Edit.Text := ReadDataSet['TOWN'] + ', ' + ReadDataSet['RAION'] + ' р-н, ул. ' + ReadDataSet['STREET'] + ', дом ' + ReadDataSet['HOUSE'];
            ReadDataSet.close;
            end;
                     end;
                  end;



          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;
                   // комбо прописки

                      if  frmPropiska.prp_prp_NOM_TOWN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_GET_NAME_TOWN_BY_ID('+ inttostr(frmPropiska.prp_prp_NOM_TOWN)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_prp_GorodSeloPGT_ComboBox.Text = ReadDataSet['N_TOWN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_prp_GorodSeloPGT_ComboBox.ItemIndex:=0;  //выставляю ГОРОД по-умолчанию
                      end;

                     if  ((frmPropiska.prp_dp_BEFO_BUZY <> null) and (frmPropiska.prp_dp_BEFO_BUZY <> 0)) then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_BUZY from ST_GET_NAME_BUSY_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_BUZY)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_Dolgnost_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_Dolgnost_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_Dolgnost_ComboBox.Text = ReadDataSet['N_BUZY'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      //if Comboflag=0 then frmPropiska.prp_dp_Dolgnost_ComboBox.ItemIndex:=0;
                      //frmPropiska.prp_dp_KemRabotal_TextEdit.Visible:=false;
                      //frmPropiska.prp_dp_Dolgnost_ComboBox.Visible:=true;
                      //frmPropiska.prp_dp_Dolgnost_Label.Caption:='Если не работал, то:';
                      //frmPropiska.prp_dp_GdeRabotal_TextEdit.Text:='';
                      //frmPropiska.prp_dp_KemRabotal_TextEdit.Text:='';
                      end;

                 //-----------------------------------------------------------------------------------------------
                      if DataSet['STATUS'] <> null then
                           if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vipiska_Sheet.TabVisible))
                             then
                             begin
                             //-----------------    комбо выписки - город
                               if  frmPropiska.prp_vip_NOM_TOWN <> null then
                                begin
                                 Comboflag:=0;
                                  ReadDataSet.SelectSQL.Clear;
                                  ReadDataSet.SelectSQL.Text:='select N_TOWN from ST_GET_NAME_TOWN_BY_ID('+ inttostr(frmPropiska.prp_vip_NOM_TOWN)+')' ;
                                  ReadDataSet.Open;
                                   for i:=0 to frmPropiska.prp_vip_GorodSeloPGT_ComboBox.Properties.Items.Count-1 do
                                    begin
                                     frmPropiska.prp_vip_GorodSeloPGT_ComboBox.ItemIndex:=i;
                                     if frmPropiska.prp_vip_GorodSeloPGT_ComboBox.Text = ReadDataSet['N_TOWN'] then
                                     begin
                                     Comboflag:=1;
                                     break;
                                     end;
                                    end;
                                 ReadDataSet.Close;
                                 if Comboflag=0 then frmPropiska.prp_vip_GorodSeloPGT_ComboBox.ItemIndex:=-1;  //выставляю ГОРОД в ноль
                                end;
                              //----------------   комбо выписки - область
                                  if  frmPropiska.prp_vip_NOM_PUNKT <> null then begin
                                    Comboflag:=0;
                                    ReadDataSet.SelectSQL.Clear;
                                    ReadDataSet.SelectSQL.Text:='select N_PUNKT from ST_GET_NAME_PUNKT_BY_ID('+ inttostr(frmPropiska.prp_vip_NOM_PUNKT)+')' ;
                                    ReadDataSet.Open;
                                     for i:=0 to frmPropiska.prp_vip_Oblast_ComboBox.Properties.Items.Count-1 do
                                      begin
                                       frmPropiska.prp_vip_Oblast_ComboBox.ItemIndex:=i;
                                       if frmPropiska.prp_vip_Oblast_ComboBox.Text = ReadDataSet['N_PUNKT'] then
                                       begin
                                       Comboflag:=1;
                                       break;
                                       end;
                                      end;
                                    ReadDataSet.Close;
                                    if Comboflag=0 then frmPropiska.prp_vip_Oblast_ComboBox.ItemIndex:=-1;   //выставляю ОБЛАСТЬ в ноль
                                    end;
                              //------------------
                        end;
                          if DataSet['STATUS'] <> null then
                           if ((DataSet['STATUS'] = 'Выписан') and (frmPropiska.prp_Vip_Dopolnenie_Sheet.TabVisible))
                             then
                             begin
                                  //----------------   комбо дополнительно - выписки -
                                   //---выписка-образование
                                  if  frmPropiska.prp_vip_AFTE_VYP_OSVITA <> null then begin
                                    Comboflag:=0;
                                    ReadDataSet.SelectSQL.Clear;
                                    ReadDataSet.SelectSQL.Text:='select N_OSVITA from ST_GET_NAME_OSVITA_BY_ID('+ inttostr(frmPropiska.prp_vip_AFTE_VYP_OSVITA)+')' ;
                                    ReadDataSet.Open;
                                     for i:=0 to frmPropiska.prp_vip_Osvita_ComboBox.Properties.Items.Count-1 do
                                      begin
                                       frmPropiska.prp_vip_Osvita_ComboBox.ItemIndex:=i;
                                       if frmPropiska.prp_vip_Osvita_ComboBox.Text = ReadDataSet['N_OSVITA'] then
                                       begin
                                       Comboflag:=1;
                                       break;
                                       end;
                                      end;
                                    ReadDataSet.Close;
                                    if Comboflag=0 then frmPropiska.prp_vip_Osvita_ComboBox.ItemIndex:=-1;   //выставляю в ноль
                                    end;
                                   //---выписка-причина
                                  if  frmPropiska.prp_vip_AFTE_VYP_RESON <> null then begin
                                    Comboflag:=0;
                                    ReadDataSet.SelectSQL.Clear;
                                    ReadDataSet.SelectSQL.Text:='select N_RESON from ST_GET_NAME_RESON_BY_ID('+ inttostr(frmPropiska.prp_vip_AFTE_VYP_RESON)+')' ;
                                    ReadDataSet.Open;
                                     for i:=0 to frmPropiska.prp_vip_ResonPereezd_ComboBox.Properties.Items.Count-1 do
                                      begin
                                       frmPropiska.prp_vip_ResonPereezd_ComboBox.ItemIndex:=i;
                                       if frmPropiska.prp_vip_ResonPereezd_ComboBox.Text = ReadDataSet['N_RESON'] then
                                       begin
                                       Comboflag:=1;
                                       break;
                                       end;
                                      end;
                                    ReadDataSet.Close;
                                    if Comboflag=0 then frmPropiska.prp_vip_ResonPereezd_ComboBox.ItemIndex:=-1;   //выставляю в ноль
                                    end;
                                   //---выписка-научная степень
                                  if  frmPropiska.prp_vip_AFTE_VYP_STUPEN <> null then begin
                                    Comboflag:=0;
                                    ReadDataSet.SelectSQL.Clear;
                                    ReadDataSet.SelectSQL.Text:='select N_STUPEN from ST_GET_NAME_STUPEN_BY_ID('+ inttostr(frmPropiska.prp_vip_AFTE_VYP_STUPEN)+')' ;
                                    ReadDataSet.Open;
                                     for i:=0 to frmPropiska.prp_vip_UchStepen_ComboBox.Properties.Items.Count-1 do
                                      begin
                                       frmPropiska.prp_vip_UchStepen_ComboBox.ItemIndex:=i;
                                       if frmPropiska.prp_vip_UchStepen_ComboBox.Text = ReadDataSet['N_STUPEN'] then
                                       begin
                                       Comboflag:=1;
                                       break;
                                       end;
                                      end;
                                    ReadDataSet.Close;
                                    if Comboflag=0 then frmPropiska.prp_vip_UchStepen_ComboBox.ItemIndex:=-1;   //выставляю в ноль
                                    end;
                              //------------------
                         end;


          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;
                      if  frmPropiska.prp_prp_NOM_PUNKT <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_PUNKT from ST_GET_NAME_PUNKT_BY_ID('+ inttostr(frmPropiska.prp_prp_NOM_PUNKT)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_prp_Oblast_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_prp_Oblast_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_prp_Oblast_ComboBox.Text = ReadDataSet['N_PUNKT'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_prp_Oblast_ComboBox.ItemIndex:=1;   //выставляю ОБЛАСТЬ по-умолчанию
                      end;

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;
                      if  frmPropiska.prp_dp_BEFO_OSVITA <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_OSVITA from ST_GET_NAME_OSVITA_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_OSVITA)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_Osvita_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_Osvita_ComboBox.Text = ReadDataSet['N_OSVITA'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=-1;

                      end;

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;
                      if  frmPropiska.prp_dp_BEFO_META <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_RESON from ST_GET_NAME_RESON_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_META)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_ResonPereezd_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_ResonPereezd_ComboBox.Text = ReadDataSet['N_RESON'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex:=-1;
                      end;

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;
                      if  frmPropiska.prp_dp_BEFO_STUPEN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_STUPEN from ST_GET_NAME_STUPEN_BY_ID('+ inttostr(frmPropiska.prp_dp_BEFO_STUPEN)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_dp_UchStepen_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_dp_UchStepen_ComboBox.Text = ReadDataSet['N_STUPEN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=-1;

                      end;

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;
                      if  frmPropiska.prp_fs_BEFO_STAN <> null then begin
                      Comboflag:=0;
                      ReadDataSet.SelectSQL.Clear;
                      ReadDataSet.SelectSQL.Text:='select N_STAN from ST_GET_NAME_STAN_BY_ID('+ inttostr(frmPropiska.prp_fs_BEFO_STAN)+')' ;
                      ReadDataSet.Open;
                       for i:=0 to frmPropiska.prp_fs_SimStan_ComboBox.Properties.Items.Count-1 do
                        begin
                         frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex:=i;
                         if frmPropiska.prp_fs_SimStan_ComboBox.Text = ReadDataSet['N_STAN'] then
                         begin
                         Comboflag:=1;
                         break;
                         end;
                        end;
                      ReadDataSet.Close;
                      if Comboflag=0 then frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex:=-1;
                      end;

         { if not frmPropiska.prp_prp_FromDonezk_CheckBox.Checked then
          frmPropiska.Height:=frmPropiska.Height+50;}

          if Progress.Position<>100 then begin
          Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
          Progress.Update;
          end;

          Progress.Position:=100;
          Progress.Update;
          screen.Cursor:=crDefault;

  {if DataSet['STATUS'] <> null then
   if ((DataSet['STATUS'] = 'Зарегистрированный') or (DataSet['STATUS'] = 'Без прописки')) then
    begin
     ///!!!!!!--заполнение умолчаний(в дальнейшем нужно сделать настройку из базы)--
     frmPropiska.prp_prp_Oblast_TextEdit.Text:='ДОНЕЦКАЯ';
     frmPropiska.prp_mg_Oblast_TextEdit.Text:='ДОНЕЦКАЯ';
     frmPropiska.prp_dp_DateMestoUbitiya.Text:='19';
     frmPropiska.prp_dp_ResonPriezd_ComboBox.ItemIndex:=1;
     frmPropiska.prp_dp_Srok_ComboBox.ItemIndex:=1;
     frmPropiska.prp_dp_ResonPereezd_ComboBox.ItemIndex := 7;
     frmPropiska.prp_fs_SimStan_ComboBox.ItemIndex := 1;
     frmPropiska.prp_dp_GdeRabotal_TextEdit.Text:='ОШ №';
     frmPropiska.prp_dp_KemRabotal_TextEdit.Text:='УЧАЩИЙСЯ';
     frmPropiska.prp_dp_Osvita_ComboBox.ItemIndex:=1;
     frmPropiska.prp_dp_UchStepen_ComboBox.ItemIndex:=0;
     frmPropiska.prp_dp_Dolgnost_ComboBox.ItemIndex := 2;

     // мама с папой
     frmPropiska.prp_f_Familia_Edit.Text:= DataSet['FAMILIA'];
     frmPropiska.prp_m_Familia_Edit.Text:= DataSet['FAMILIA'];
     frmPropiska.prp_m_Oblast_TextEdit.Text:= 'ДОНЕЦКАЯ';
     frmPropiska.prp_f_Oblast_TextEdit.Text:= 'ДОНЕЦКАЯ';
    end; }    

        if  frmPropiska.ShowModal = mrOk then
        begin

          DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
          DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(frmPropiska.edit_item_id)+')';
          DataSet.Edit;
          DataSet.Post;
          if Registration_Form.DataSet['UK_FIO_COMBO'] <> null then Registration_Form.PIB_Label.Text := Registration_Form.DataSet['UK_FIO_COMBO'];
          if Registration_Form.DataSet['SHORT_NAME_CATEGORY'] <> null then Registration_Form.Category_Label.Text := Registration_Form.DataSet['SHORT_NAME_CATEGORY'] ;
          if Registration_Form.DataSet['NUM_DOG'] <> null then Registration_Form.Dogovor_Label.Text:=Registration_Form.DataSet['NUM_DOG'] ;
          if Registration_Form.DataSet['STATUS'] <> null then Registration_Form.Status_Edit.Text:=Registration_Form.DataSet['STATUS'] ;
          
         { Registration_Form.DataSet.SQLs.RefreshSQL.Text:= 'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(frmPropiska.edit_item_id)+')';
          Registration_Form.DataSet.Refresh;
          if Registration_Form.DataSet['UK_FIO_COMBO'] <> null then Registration_Form.PIB_Label.Text := Registration_Form.DataSet['UK_FIO_COMBO'];
          if Registration_Form.DataSet['SHORT_NAME_CATEGORY'] <> null then Registration_Form.Category_Label.Text := Registration_Form.DataSet['SHORT_NAME_CATEGORY'] ;
          if Registration_Form.DataSet['NUM_DOG'] <> null then Registration_Form.Dogovor_Label.Text:=Registration_Form.DataSet['NUM_DOG'] ;
          if Registration_Form.DataSet['STATUS'] <> null then Registration_Form.Status_Edit.Text:=Registration_Form.DataSet['STATUS'] ;
          }
        end;
  frmPropiska.Free;
end;

procedure TRegistration_Form.Status_ComboBoxPropertiesCloseUp(
  Sender: TObject);
begin
  if  ((Status_ComboBox.Text = 'Не фильтровать')
   and (IsStatusOnFilter= true))
   then
    begin
     Registration_Form.RefreshButtonClick(Sender);
     IsStatusOnFilter:=false;
     exit;
    end;

  if  ((Status_ComboBox.Text = 'Не фильтровать')
   and (IsStatusOnFilter = false))
   then exit
  else
   begin
    Screen.Cursor:=crHourGlass;
    Dogovor_Label.Text:='';
    Propusk_Label.Text:='';
    PIB_Label.Text:='';
    Category_Label.Text:='';
    Status_Edit.Text:='';
    DataSet.Close;
    DataSet.SelectSQL.Clear;
    DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_STATUS_FILTER ('+ ''''+Status_ComboBox.Text+''''+')';
    DataSet.Open;
    Filter_BarEdit.Style.Font.Color := clWindowText;
    Filter_BarEdit.Text:='';
    Status_ComboBox.Style.Font.Color := clRed;
    DateBegEdit.Style.Font.Color := clWindowText;
    DateEndEdit.Style.Font.Color := clWindowText;
    IsStatusOnFilter := true;
    Screen.Cursor:=crDefault;
    cxGrid2.SetFocus;
   end;
end;

procedure TRegistration_Form.RazvorotActionExecute(Sender: TObject);
begin
Registration_Form.WindowState:= wsMaximized;
end;

procedure TRegistration_Form.calcClick(Sender: TObject);
begin
Registration_Form.PayButtonClick(Sender);
end;

procedure TRegistration_Form.PropiClick(Sender: TObject);
begin
Registration_Form.Propiska_LargeButtonClick(Sender);
end;

procedure TRegistration_Form.NarushClick(Sender: TObject);
begin
Registration_Form.dxBarLargeButton4Click(Sender);
end;

procedure TRegistration_Form.printClick(Sender: TObject);
begin
Registration_Form.PrintButtonClick(Sender);
end;

procedure TRegistration_Form.Prikaz_BarLargeButtonClick(Sender: TObject);
var id_kod: int64;
begin
  Load_Order(SELF,DataModule1.DB.Handle, dataset['ID_KOD']);

  id_kod := Dataset['ID_KOD'];

  DataSet.SQLs.UpdateSQL.Text:='execute procedure z_empty_proc';
  DataSet.SQLs.RefreshSQL.Text:=  'select  * FROM St_dt_pfio_select_by_id(' + IntToStr(id_kod)+')';
  DataSet.Edit;
  DataSet.Post;
end;

procedure TRegistration_Form.Subsidy_ModifyClick(Sender: TObject);
begin
  Subsidy_Edit:=true;
  Registration_Form.EditButtonClick(Sender);
end;

procedure TRegistration_Form.Lgots_ModifyClick(Sender: TObject);
begin
  Lgots_Edit := true;
  Registration_Form.EditButtonClick(Sender);
end;

procedure TRegistration_Form.SpyMonitorClick(Sender: TObject);
var
LoginIns, LoginUpt, DateIns, DateUpt: string;
id_kod : int64;
begin
LoginIns:='';
LoginUpt:='';
DateIns:='';
DateUpt:='';
id_kod:=Dataset['ID_KOD'];
ReadDataSet.close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.text:='SELECT * FROM ST_DT_PFIO_MONITORING_SELECT('+ IntToStr(id_kod)+')';
ReadDataSet.open;
if ReadDataset['LOGIN_INS']<> null then
LoginIns:=ReadDataset['LOGIN_INS'];
if ReadDataset['LOGIN_UPT']<> null then
LoginUpt:=ReadDataset['LOGIN_UPT'];
if ReadDataset['DATE_INS']<> null then
DateIns:=datetimetostr(ReadDataset['DATE_INS']);
if ReadDataset['DATE_UPT']<> null then
DateUpt:=datetimetostr(ReadDataset['DATE_UPT']);
ReadDataSet.close;

showmessage(st_ConstUnit.st_Zareestr[PLanguageIndex] + LoginIns
 + #13 +
st_ConstUnit.st_DateZareestr[PLanguageIndex] + DateIns
 + #13 +
st_ConstUnit.st_Izmenil[PLanguageIndex] + LoginUpt
 + #13 +
st_ConstUnit.st_DateIzmenil[PLanguageIndex] + DateUpt
            );
end;

procedure TRegistration_Form.Spy_ActionExecute(Sender: TObject);
begin
Screen.Cursor:=crHourGlass;
Registration_Form.SpyMonitorClick(Sender);
Screen.Cursor:=crDefault;
end;

procedure TRegistration_Form.Subcidy_EditActionExecute(Sender: TObject);
begin
Registration_Form.Subsidy_ModifyClick(Sender);
end;

procedure TRegistration_Form.Lgots_EditActionExecute(Sender: TObject);
begin
Registration_Form.Lgots_ModifyClick(Sender);
end;

procedure TRegistration_Form.ViewButtonClick(Sender: TObject);
var
  i : integer;
begin
  if not is_admin then
   if fibCheckPermission('/ROOT/Studcity/LiversWork','View') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  If not cxGrid2.IsFocused then exit;

  If cxGridDBTableView1.DataController.RecordCount = 0 then exit;

  Registration_Form_AddViewMode := true;

  edit_item_id := DataSet[KeyField];

  // проверка существования данного ид.кода
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select EXIST from ST_DT_PFIO_ID_KOD_EXIST_CHECK('+ IntToStr(edit_item_id) +')';
  ReadDataSet.Open;
  if ReadDataSet['EXIST'] = 0 then
   begin
    ShowMessage('Данной записи больше не сущствует. Возможно, она удалена другим клиентским приложением во время вашей сессии. Нажмите "Обновить".');
    ReadDataSet.close;
    Screen.Cursor:=crDefault;
    exit;
   end;
  ReadDataSet.close;
  Screen.Cursor:=crDefault;

  progress.Properties.ShowText := true;
  Progress.Position:=5;
  update;

  Screen.Cursor:=crHourGlass;
  Registration_Form_Add := TRegistration_Form_Add.Create(Self);
  Registration_Form_Add.edit_item_id := edit_item_id;
  Registration_Form_Add.is_admin := is_admin;

  //берем настроики из системной таблици
  Screen.Cursor:=crHourGlass;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select st_end_month from SYS_OPTIONS';
  ReadDataSet.Open;
  if ReadDataSet['ST_END_MONTH'] <> null
   then Registration_Form_Add.st_end_month := ReadDataSet['ST_END_MONTH']
   else Registration_Form_Add.st_end_month := 0;
  ReadDataSet.close;
  Screen.Cursor:=crDefault;

  if Registration_Form_AddViewMode then
   begin
    Registration_Form_Add.ViewMode := true;
    Registration_Form_AddViewMode  := false;
   end;

  Progress.Position:=7;
  update;
  Registration_Form_Add.id_kod:=edit_item_id;


  // проверяю в sys_options - показывать ли вкладку Входящего остатка
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select Show_ost from ST_INSOST_SHOW_CHECK';
  ReadDataSet.Open;
  if Progress.Position<>100 then
   begin
    Progress.Position:=10;
    Progress.update;
   end;

  if ReadDataSet['Show_ost']=0
   then Registration_Form_Add.cxTabSheet6.TabVisible:= false
   else
    begin
     // выбираем историю по входящему остатку (если есть)
     ReadDataSet.close;
     ReadDataSet.SelectSQL.Clear;
     ReadDataSet.SelectSQL.Text:='select * from ST_RELSM_SELECT('+ inttostr(edit_item_id)+')';
     ReadDataSet.Open;
     ReadDataSet.FetchAll;
     if ReadDataSet.RecordCount <> 0 then
      begin
       Registration_Form_Add.cxGrid1TableView1.DataController.RecordCount := ReadDataSet.RecordCount;
       for i := 0 to ReadDataSet.RecordCount-1  do
        begin
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 0] := vartostr(ReadDataSet['Number_sm'])+'.'+vartostr(ReadDataSet['Number_razd'])+'.'+vartostr(ReadDataSet['Number_st'])+'.'+vartostr(ReadDataSet['Number_kekv']);
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 1] := ReadDataSet['SUMMA'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 2]:=  ReadDataSet['KOD_SM'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 3]:=  ReadDataSet['KOD_RAZD'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 4]:=  ReadDataSet['KOD_ST'];
         Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 5]:=  ReadDataSet['KOD_KEKV'];
         ReadDataSet.Next;
         if Progress.Position<>100 then
          begin
           Progress.Position:=Progress.Position+1;
           Progress.update;
          end;
        end;
       ReadDataSet.close;
       ReadDataSet.SelectSQL.Clear;
       ReadDataSet.SelectSQL.Text:='select * from ST_DT_PFIO_INSOST_SELECT('+ inttostr(edit_item_id)+')';
       ReadDataSet.Open;
       Registration_Form_Add.SummaEdit.Value:=ReadDataSet['SUM_DOC_J1'];
       ReadDataSet.close;
       ReadDataSet.SelectSQL.Clear;
       Registration_Form_Add.Sum_Result.Value:=0;
       If Progress.Position<>100 then
        begin
         Progress.Position:=30;
         Progress.update;
        end;
       for i:=0 to  Registration_Form_Add.cxGrid1TableView1.DataController.RecordCount-1 do
        begin
         Registration_Form_Add.Sum_Result.Value:= Registration_Form_Add.Sum_Result.Value + Registration_Form_Add.cxGrid1TableView1.DataController.Values[i, 1];
         if Progress.Position<>100 then
          begin
           Progress.Position:=Progress.Position+1;
           Progress.update;
          end;
        end;
      end
      else
       begin
        ReadDataSet.close;
        ReadDataSet.SelectSQL.Clear;
       end;
    end;

  ReadDataSet.close;
  ReadDataSet.SelectSQL.Clear;

  // забираю номер ордера и показываю
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFIO_ORDER_NUM_SEL(' + inttostr(edit_item_id)+')';
  ReadDataSet.Open;
  if ReadDataSet['ORDER_NUM'] <> null
   then Registration_Form_Add.OrderNum_Edit.Text := ReadDataSet['ORDER_NUM'];
  ReadDataSet.close;

  Registration_Form_Add.Familia_Edit.Text := DataSet['Familia'];
  Registration_Form_Add.Name_Edit.Text := DataSet['Imya'];
  Registration_Form_Add.Otch_Edit.Text := DataSet['Otchestvo'];
  if Registration_Form_Add.Otch_Edit.Text <>'' then
  Registration_Form_Add.Without_Otch_CheckBox.Checked:=false
  else Registration_Form_Add.Without_Otch_CheckBox.Checked:=true;

  if DataSet['Data_R']<> null
   then Registration_Form_Add.DateBorn_Edit.date := DataSet['Data_R'];
  if DataSet['Pol']='м'
   then Registration_Form_Add.Pol_ComboBox.ItemIndex:=0
   else Registration_Form_Add.Pol_ComboBox.ItemIndex:=1;
  if DataSet['Pol']='М'
   then Registration_Form_Add.Pol_ComboBox.ItemIndex:=0;
  if DataSet['Pol']='Ж'
   then Registration_Form_Add.Pol_ComboBox.ItemIndex:=1;
  if DataSet['Kurs'] <> null
   then Registration_Form_Add.Kurs_ComboBox.ItemIndex := DataSet['Kurs'] - 1;

  if DataSet['Date_Dog'] <> null
   then Registration_Form_Add.Dogovor_DateEdit.Date:=DataSet['Date_Dog'];
  if DataSet['Num_Dog'] <> null
   then Registration_Form_Add.Nomer_Dogovora.Text:= DataSet['Num_Dog'];

  Registration_Form_Add.Tabel_Edit.Text:= DataSet['TN'];
  Registration_Form_Add.Nalog_Edit.Text:= DataSet['Id_N_Nalog'];

  if Progress.Position<>100 then
   begin
    Progress.Position:=50;
    Progress.update;
   end;

  if DataSet['inostranez']=1
   then Registration_Form_Add.Inostranez_CheckBox.Checked:=true
   else Registration_Form_Add.Inostranez_CheckBox.Checked:=false;
  if DataSet['PROPISKA_EXIST']=1
   then Registration_Form_Add.Propiska_CheckBox.Checked:=true
   else Registration_Form_Add.Propiska_CheckBox.Checked:=false;
  if DataSet['PRIN_NPASS']=1
   then Registration_Form_Add.Propusk_CheckBox.Checked:=true
   else Registration_Form_Add.Propusk_CheckBox.Checked:=false;

  if DataSet['Fam_Uk']<> null
   then  Registration_Form_Add.Familia_Ukr.Text:=DataSet['Fam_Uk'];
  if DataSet['Imya_Uk']<> null
   then Registration_Form_Add.Name_Ukr.Text:=DataSet['Imya_Uk'];
  if DataSet['Ot_Uk']<> null
   then Registration_Form_Add.Otch_Ukr.Text:=DataSet['Ot_Uk'];

  // Выбираем историю категорий проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFKAT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView1.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 0] := ReadDataSet['NUM_KATEGORIYA'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 3] := ReadDataSet['KATEGORIYA'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 4] := ReadDataSet['SHORT_NAME_CATEGORY'];
    Registration_Form_Add.cxGridTableView1.DataController.Values[i, 6] := ReadDataSet['PAY_SUM'];
    ReadDataSet.Next;
    if Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData;

  // Выбираем дополнительные услуги
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFDOP_SERV_SELECT(:id_kod)';
  ReadDataSet.ParamByName('id_kod').AsInt64 := edit_item_id;
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGrid_dop_servTableView4.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 0] := ReadDataSet['NUM_KAT'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 3] := ReadDataSet['ID_KAT'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 4] := ReadDataSet['SHORT_NAME_KAT'];
    Registration_Form_Add.cxGrid_dop_servTableView4.DataController.Values[i, 6] := ReadDataSet['PAY_SUM'];
    ReadDataSet.Next;

    if Progress.Position <> 100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData_dop_serv;

  // Выбираем историю проживания
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_HROOM_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView_of_Live.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 0] := ReadDataSet['NUM_BUILD'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 1] := ReadDataSet['Room_Combo'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 2] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 3] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 4] := ReadDataSet['Kod_Build'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 5] := ReadDataSet['N_Room'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 6] := ReadDataSet['Type_Room'];
    Registration_Form_Add.cxGridTableView_of_Live.DataController.Values[i, 7] := ReadDataSet['SHORT_NAME'];
    ReadDataSet.Next;
    if Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData_Live;

  // выбираем историю субсидий
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFSUB_SELECT(' + IntToStr(edit_item_id) + ') order by BEG_DATE desc';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView2.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 0] := ReadDataSet['NAME_SERVES'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 3] := ReadDataSet['SUMMA'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 4] := ReadDataSet['CNT_MONTH'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 5] := ReadDataSet['NAME_STATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 6] := ReadDataSet['ID_SUBSIDY'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 7] := ReadDataSet['ID_STATE'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 8] := ReadDataSet['COMMENT'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 9] := ReadDataSet['FULL_NAME'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 10] := ReadDataSet['SHORT_NAME'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 12] := ReadDataSet['ID_KEY'];
    Registration_Form_Add.cxGridTableView2.DataController.Values[i, 13] := ReadDataSet['ID_SERVES'];
    ReadDataSet.Next;
    If Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;

  ReadDataSet.Close;
  // выбираем историю льгот
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text := 'select * from ST_PFLGOT_SELECT(' + IntToStr(edit_item_id) + ')';
  ReadDataSet.Open;
  ReadDataSet.FetchAll;
  Registration_Form_Add.cxGridTableView3.DataController.RecordCount := ReadDataSet.RecordCount;
  for i := 0 to ReadDataSet.RecordCount-1  do
   begin
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 0] := ReadDataSet['Num_Lg'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 1] := ReadDataSet['BEG_DATE'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 2] := ReadDataSet['END_DATE'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 3] := ReadDataSet['ID_LG'];
    Registration_Form_Add.cxGridTableView3.DataController.Values[i, 4] := ReadDataSet['NAME_LG'];
    if ReadDataSet['DATE_PRIKAZA']<> null
     then Registration_Form_Add.cxGridTableView3.DataController.Values[i, 6] := ReadDataSet['DATE_PRIKAZA'];
    if ReadDataSet['NOMER_PRIKAZA'] <> null
     then Registration_Form_Add.cxGridTableView3.DataController.Values[i, 7] := ReadDataSet['NOMER_PRIKAZA'];
    ReadDataSet.Next;
    if Progress.Position<>100 then
     begin
      Progress.Position:=Progress.Position+1;
      Progress.update;
     end;
   end;
  ReadDataSet.Close;
  Registration_Form_Add.SortGridData_Lg;

  // --факультеты------------------------------------------------
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select ID_GROUP, ID_SPEC , N_FAK from ST_PFIO_GET_FACS_BY_ID_KOD('+ IntToStr(edit_item_id)+')';
  ReadDataSet.Open;
  Registration_Form_Add.Id_department:=-1;
  Registration_Form_Add.id_spec:=-1;
  Registration_Form_Add.id_group:=-1;
  if ReadDataSet['N_FAK']<> null
   then Registration_Form_Add.Id_department:= ReadDataSet['N_FAK'];
  if ReadDataSet['ID_SPEC']<> null
   Then Registration_Form_Add.id_spec:= ReadDataSet['ID_SPEC'];
  if ReadDataSet['ID_GROUP']<> null
   then Registration_Form_Add.id_group:= ReadDataSet['ID_GROUP'];
  ReadDataSet.Close;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  Registration_Form_Add.Kurs_ComboBox.Visible:=true;
  Registration_Form_Add.KursLabel.Visible:=true;
  Registration_Form_Add.GroupLabel.Visible:=true;
  Registration_Form_Add.Group_ComboBox.Visible:=true;
  Registration_Form_Add.SpecLabel.Visible:=true;
  Registration_Form_Add.Spec_ComboBox.Visible:=true;

  // устанавливаю специальность и группу в комбобоксах
  if ((Registration_Form_Add.id_group <> 0) and (Registration_Form_Add.id_group <> -1)) then
   begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select  GROUP_FULL_NAME from ST_GET_GROUPNAME_BY_ID_GROUP('+ inttostr(Registration_Form_Add.id_group)+')';
    ReadDataSet.Open;
    if ReadDataSet['GROUP_FULL_NAME']<> null
     then GroupString:=ReadDataSet['GROUP_FULL_NAME'];
    ReadDataSet.close;
   end;
  if ((Registration_Form_Add.id_spec <> 0) and (Registration_Form_Add.id_spec <> -1)) then
   begin
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select  SPEC_FULL_NAME from ST_GET_SPECNAME_BY_ID_GROUP('+ inttostr(Registration_Form_Add.id_spec)+')';
    ReadDataSet.Open;
    if ReadDataSet['SPEC_FULL_NAME']<> null
     then SpecString:=ReadDataSet['SPEC_FULL_NAME'];
    ReadDataSet.close;
   end;

  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select DEPARTMENT_CODE, NAME_FULL from ST_GET_DEPARTMENT_CODE('+ inttostr(Registration_Form_Add.Id_Department)+')';
  ReadDataSet.Open;
  if ReadDataSet['DEPARTMENT_CODE']<>null
   then Registration_Form_Add.Faculty_ButtonEdit.Text:= ReadDataSet['DEPARTMENT_CODE'];
  if ReadDataSet['NAME_FULL']<>null
   then Registration_Form_Add.Podrazdel_Label.Caption:=ReadDataSet['NAME_FULL'];
  ReadDataSet.Close;

  Screen.Cursor:= crHourGlass;
  //проверяем парент на 199
  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.SelectSQL.Text:='select FLAG from ST_IS_IT_FACULTY('+ inttostr(Registration_Form_Add.Id_Department)+')';
  ReadDataSet.Open;

  if ReadDataSet['FLAG']=1 then
   begin    // выбираем группы и специальности, если парент =199
    ReadDataSet.Close;
    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select ID_GROUP, GROUP_FULL_NAME from ST_GET_GROUP('+ inttostr(Registration_Form_Add.Id_Department)+')';
    ReadDataSet.Open;
    ReadDataSet.FetchAll;
    Registration_Form_Add.Group_ComboBox.Clear;
    for i:=0 to ReadDataSet.RecordCount-1 do
     begin
      Registration_Form_Add.Group_ComboBox.Properties.Items.Add(ReadDataSet['GROUP_FULL_NAME'] );
      ReadDataSet.Next;
     end;
    Registration_Form_Add.Group_ComboBox.ItemIndex:=-1;
    ReadDataSet.Close;

    ReadDataSet.SelectSQL.Clear;
    ReadDataSet.SelectSQL.Text:='select ID_SPECIALNOST, NAME_SPEC from ST_GET_SPEC('+ inttostr(Registration_Form_Add.Id_Department)+')';
    ReadDataSet.Open;
    ReadDataSet.FetchAll;
    Registration_Form_Add.Spec_ComboBox.Clear;
    for i:=0 to ReadDataSet.RecordCount-1 do
     begin
      Registration_Form_Add.Spec_ComboBox.Properties.Items.Add(ReadDataSet['NAME_SPEC'] );
      ReadDataSet.Next;
     end;
    Registration_Form_Add.Spec_ComboBox.ItemIndex:=-1;
    ReadDataSet.Close;
   end;
  Screen.Cursor:=crDefault;  // ---------проверка на парент закончена------------

  if ((Registration_Form_Add.id_group <> 0) and (Registration_Form_Add.id_group <> -1)) then
   for i:=0 to  Registration_Form_Add.Group_ComboBox.Properties.Items.Count-1 do
    begin
     Registration_Form_Add.Group_ComboBox.ItemIndex:=i;
     if Registration_Form_Add.Group_ComboBox.Text = GroupString then break;
    end;

  if ((Registration_Form_Add.id_spec <> 0) and (Registration_Form_Add.id_spec <> -1)) then
   for i:=0 to  Registration_Form_Add.Spec_ComboBox.Properties.Items.Count-1 do
    begin
     Registration_Form_Add.Spec_ComboBox.ItemIndex:=i;
     if Registration_Form_Add.Spec_ComboBox.Text = SpecString then break;
    end;
         // с факультетами всё

  if Registration_Form_Add.cxGridTableView1.DataController.RecordCount >0 then
   begin
    Registration_Form_Add.EditButton.Enabled:=true;
    Registration_Form_Add.DeleteButton.Enabled:=true;
    Registration_Form_Add.cxGridTableView1.DataController.FocusedRowIndex := 0;
   end;

  if Progress.Position<>100 then
   begin
    Progress.Position:= Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.Update;
   end;

  if Registration_Form_Add.cxGridTableView_of_Live.DataController.RecordCount >0 then
   begin
    Registration_Form_Add.Live_EditButton.Enabled:=true;
    Registration_Form_Add.Live_DeleteButton.Enabled:=true;
    Registration_Form_Add.cxGridTableView_of_Live.DataController.FocusedRowIndex := 0;
   end;

  if Progress.Position<>100 then
   begin
    Progress.Position:=Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.update;
   end;

  if Registration_Form_Add.cxGridTableView2.DataController.RecordCount >0 then
   begin
    Registration_Form_Add.Sub_EditButton.Enabled := true;
    Registration_Form_Add.Sub_DeleteButton.Enabled := true;
    Registration_Form_Add.cxGridTableView2.DataController.FocusedRowIndex := 0;
   end;

  if Progress.Position<>100 then
   begin
    Progress.Position:=Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.update;
   end;

  if Registration_Form_Add.cxGridTableView3.DataController.RecordCount >0 then
   begin
    Registration_Form_Add.Lg_EditButton.Enabled:=true;
    Registration_Form_Add.Lg_DeleteButton.Enabled:=true;
    Registration_Form_Add.cxGridTableView3.DataController.FocusedRowIndex := 0;
   end;

  If Progress.Position<>100 then
   begin
    Progress.Position:=Progress.Position+(Progress.Properties.Max - Progress.Position) div 4;
    Progress.update;
   end;

  Screen.Cursor:=crDefault;

  Progress.Position:=100;
  Progress.update;

  Registration_Form_Add.OkButton.Enabled := false;
  Registration_Form_Add.ShowModal;
  
  Registration_Form_Add.Free;
end;

procedure TRegistration_Form.ApostrofAddExecute(Sender: TObject);
begin
if Filter_BarEdit.Focused then
 begin
   Filter_BarEdit.Text:= Filter_BarEdit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
 end;
end;

procedure TRegistration_Form.AddToElectoratClick(Sender: TObject);
begin
 if MessageBox(Handle,PChar(st_ConstUnit.st_ElectoratQuery[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;

 Screen.Cursor:=crSQLWait;
 WriteProc.StoredProcName := 'ST_DT_PFIO_ADD_TO_ELEKTORAT';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName(KeyField).AsInt64 := DataSet[KeyField];
 WriteProc.ExecProc;
 try
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 Screen.Cursor:=crDefault;
 ShowMessage(PChar(st_ConstUnit.st_GoodAdd[PLanguageIndex]));
 except
 WriteProc.Transaction.Rollback;
 WriteProc.Close;
 Screen.Cursor:=crDefault;
 raise;
 end;
end;

procedure TRegistration_Form.Electorat_ButtonClick(Sender: TObject);
begin
Electorat_Button.DropDownMenu.PopupFromCursorPos;
end;

procedure TRegistration_Form.DelFromElectoratClick(Sender: TObject);
begin
 if MessageBox(Handle,PChar(st_ConstUnit.st_ElectoratQueryMinus[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;

 Screen.Cursor:=crSQLWait;
 WriteProc.StoredProcName := 'ST_DT_PFIO_DEL_FROM_ELEKTORAT';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName(KeyField).AsInt64 := DataSet[KeyField];
 WriteProc.ExecProc;
 try
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 Screen.Cursor:=crDefault;
 ShowMessage(PChar(st_ConstUnit.st_GoodRemove[PLanguageIndex]));
 except
 WriteProc.Transaction.Rollback;
 WriteProc.Close;
 Screen.Cursor:=crDefault;
 raise;
 end;
end;

procedure TRegistration_Form.Filter_BtnClick(Sender: TObject);
var
  ViewForm : TfrmExtraFilter;
begin
  ViewForm := TfrmExtraFilter.Create(self);
  Viewform.aHandle := DataModule1.DB.Handle;
  ViewForm.ID_SESSION_FILTER := id_session_filter;
  ViewForm.ShowModal;

  if ViewForm.ModalResult = mrok then
   Begin
    DataSet.Close;
    DataSet.SelectSQL.Clear;
    DataSet.SelectSQL.Text:='select * from  ST_SELECT_ALL_BY_FILTER_PARAM(:id_session, :date_beg_z, :date_beg_po, :date_end_z, :date_end_po)';
    DataSet.ParamByName('id_session').AsInt64 := id_session_filter;

    if ViewForm.Date_Beg_Check.Checked then
     Begin
      DataSet.ParamByName('date_beg_z').AsDate  := ViewForm.Date_beg_z.Date;
      DataSet.ParamByName('date_beg_po').AsDate := ViewForm.Date_Beg_po.Date;
     end;

    if ViewForm.Date_End_Check.Checked then
     Begin
      DataSet.ParamByName('date_end_z').AsDate  := ViewForm.Date_End_Z.Date;
      DataSet.ParamByName('date_end_po').AsDate := ViewForm.Date_End_Po.Date;
     end;

    Update;

    SQL_Wait_Form:= TSQL_Wait_Form.Create(Self);
    SQL_Wait_Form.Show;
    SQL_Wait_Form.Update;

    DataSet.Open;

    SQL_Wait_Form.PleaseWait_Label.Visible:= true;
    SQL_Wait_Form.Update;

    DataSet.FetchAll;

    dxStatusBar1.Panels[5].Text:= 'Кіль-сть записів: ' + inttostr(DataSet.RecordCount);

    Screen.Cursor := crDefault;

    SQL_Wait_Form.Free;
   end;
  ViewForm.Free;  
end;

procedure TRegistration_Form.Inc_ButtonClick(Sender: TObject);
begin
 cxGridDBTableView1.OptionsBehavior.IncSearch := Inc_Button.Down;
end;

procedure TRegistration_Form.Act_helpExecute(Sender: TObject);
begin
  Load_Help(self, DataModule1.DB.Handle, 'dt_registrashion');
end;

end.
