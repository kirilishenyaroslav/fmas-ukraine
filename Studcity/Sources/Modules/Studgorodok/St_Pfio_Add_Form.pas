//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма регистрации проживающих                                       *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_Pfio_Add_Form;

interface       

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxCheckBox,
  StdCtrls, cxRadioGroup, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGroupBox, cxPC, cxLookAndFeelPainters, cxButtons, cxButtonEdit,
  cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet, cxCurrencyEdit,
  Buttons, ExtCtrls, uCommonSp, ActnList, AccMGMT, St_Proc, st_ConstUnit,
  AllPeopleUnit, Main, uPost_choose, st_Common_Messages,st_common_types, st_common_loader;

type
  TRegistration_Form_Add = class(TForm)
    Otch_Edit: TcxTextEdit;
    Name_Edit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxGroupBox2: TcxGroupBox;
    Label4: TLabel;
    Inostranez_CheckBox: TcxCheckBox;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet3: TcxTabSheet;
    Label13: TLabel;
    Familia_Ukr: TcxTextEdit;
    Label14: TLabel;
    Name_Ukr: TcxTextEdit;
    Label15: TLabel;
    Otch_Ukr: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cxGroupBox4: TcxGroupBox;
    TypeRoom_Selecter_DataSet: TpFIBDataSet;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    DeleteButton: TSpeedButton;
    AddButton: TSpeedButton;
    EditButton: TSpeedButton;
    Live_AddButton: TSpeedButton;
    Live_EditButton: TSpeedButton;
    Live_DeleteButton: TSpeedButton;
    cxGrid2: TcxGrid;
    cxGridTableView_of_Live: TcxGridTableView;
    cxGridColumn1: TcxGridColumn;
    cxGridColumn2: TcxGridColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridColumn0: TcxGridColumn;
    cxGridColumn3: TcxGridColumn;
    cxPageControl1: TcxPageControl;
    cxGridColumn4: TcxGridColumn;
    cxGridColumn5: TcxGridColumn;
    cxGridColumn6: TcxGridColumn;
    cxGridColumn7: TcxGridColumn;
    Full_Build_Label: TLabel;
    Label10: TLabel;
    cxGrid1: TcxGrid;
    cxGridTableView1: TcxGridTableView;
    cxGridLevel2: TcxGridLevel;
    cxGridTableView1Column1: TcxGridColumn;
    cxGridTableView1Column2: TcxGridColumn;
    cxGridTableView1Column3: TcxGridColumn;
    Full_Cat_Label: TLabel;
    cxGridTableView1Column4: TcxGridColumn;
    cxGridTableView1Column7: TcxGridColumn;
    cxTabSheet4: TcxTabSheet;
    cxGroupBox5: TcxGroupBox;
    Sub_DeleteButton: TSpeedButton;
    Sub_AddButton: TSpeedButton;
    Sub_EditButton: TSpeedButton;
    Sub_Type_Label: TLabel;
    cxGrid3: TcxGrid;
    cxGridTableView2: TcxGridTableView;
    cxGridLevel3: TcxGridLevel;
    cxGridTableView2Column1: TcxGridColumn;
    cxGridTableView2Column2: TcxGridColumn;
    cxGridTableView2Column3: TcxGridColumn;
    cxGridTableView2Column4: TcxGridColumn;
    cxGridTableView2Column5: TcxGridColumn;
    cxGridTableView2Column6: TcxGridColumn;
    cxGridTableView2Column7: TcxGridColumn;
    cxGridTableView2Column8: TcxGridColumn;
    cxGridTableView2Column9: TcxGridColumn;
    cxGridTableView2Column10: TcxGridColumn;
    cxTabSheet5: TcxTabSheet;
    cxGroupBox6: TcxGroupBox;
    Lg_DeleteButton: TSpeedButton;
    Lg_AddButton: TSpeedButton;
    Lg_EditButton: TSpeedButton;
    Lgot_Full_Label: TLabel;
    cxGrid4: TcxGrid;
    cxGridTableView3: TcxGridTableView;
    cxGridColumn8: TcxGridColumn;
    cxGridColumn9: TcxGridColumn;
    cxGridColumn13: TcxGridColumn;
    cxGridColumn16: TcxGridColumn;
    cxGridLevel4: TcxGridLevel;
    cxGridTableView3Column1: TcxGridColumn;
    cxGroupBox7: TcxGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Nomer_Dogovora: TcxTextEdit;
    cxGroupBox8: TcxGroupBox;
    Propiska_CheckBox: TcxCheckBox;
    Propusk_CheckBox: TcxCheckBox;
    cxGroupBox9: TcxGroupBox;
    Label9: TLabel;
    Label8: TLabel;
    Tabel_Edit: TcxTextEdit;
    cxGroupBox10: TcxGroupBox;
    flag: TcxGridColumn;
    flag2: TcxGridColumn;
    flag3: TcxGridColumn;
    flag4: TcxGridColumn;
    Pol_ComboBox: TcxComboBox;
    DateBorn_Edit: TcxDateEdit;
    Dogovor_DateEdit: TcxDateEdit;
    cxTabSheet6: TcxTabSheet;
    cxGroupBox11: TcxGroupBox;
    Insost_AddButton: TSpeedButton;
    Insost_EditButton: TSpeedButton;
    Insost_DeleteButton: TSpeedButton;
    Image1: TImage;
    cxGrid5: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    IstFinance: TcxGridColumn;
    Summa: TcxGridColumn;
    id_razdel: TcxGridColumn;
    id_stat: TcxGridColumn;
    id_kekv: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    Sum_Result: TcxCurrencyEdit;
    id_smeta: TcxGridColumn;
    SummaEdit: TcxCurrencyEdit;
    SummaLabel: TLabel;
    cxButton1: TcxButton;
    Podrazdel_Label: TLabel;
    Faculty_ButtonEdit: TcxButtonEdit;
    Label5: TLabel;
    KursLabel: TLabel;
    Kurs_ComboBox: TcxComboBox;
    Group_ComboBox: TcxComboBox;
    GroupLabel: TLabel;
    Spec_ComboBox: TcxComboBox;
    SpecLabel: TLabel;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    date_prikaza: TcxGridColumn;
    nomer_prikaza: TcxGridColumn;
    Label11: TLabel;
    Label12: TLabel;
    ApostrofAction: TAction;
    Familia_Edit: TcxButtonEdit;
    OrderNum_Edit: TcxTextEdit;
    OrderNum_Label: TLabel;
    id_key: TcxGridColumn;
    EditFizLizo_Btn: TSpeedButton;
    ClearButton: TSpeedButton;
    btnSaveFIO: TSpeedButton;
    Cur_WorkPlace_TextEdit: TcxButtonEdit;
    Cur_Posada_TextEdit: TcxButtonEdit;
    Nalog_Edit: TcxCurrencyEdit;
    cxGridTableView1Column5: TcxGridColumn;
    cxTabSheet7: TcxTabSheet;
    cxGroupBox12: TcxGroupBox;
    delButton_dop_serv: TSpeedButton;
    addButton_dop_serv: TSpeedButton;
    editbutton_dop_serv: TSpeedButton;
    Full_cat_dop_serv_lable: TLabel;
    cxGrid_dop_serv: TcxGrid;
    cxGrid_dop_servTableView4: TcxGridTableView;
    cxGridColumn10: TcxGridColumn;
    cxGridColumn11: TcxGridColumn;
    cxGridColumn12: TcxGridColumn;
    cxGridColumn14: TcxGridColumn;
    cxGridColumn15: TcxGridColumn;
    flag_dop_serv: TcxGridColumn;
    cxGridColumn18: TcxGridColumn;
    cxGridLevel5: TcxGridLevel;
    cxGrid_id_serves_sub: TcxGridColumn;
    cxGrid_name_serves: TcxGridColumn;
    Without_Otch_CheckBox: TcxCheckBox;
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure Familia_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Otch_EditKeyPress(Sender: TObject; var Key: Char);
    procedure DateBorn_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Kurs_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Dogovor_DateEditKeyPress(Sender: TObject; var Key: Char);
    procedure Nomer_DogovoraKeyPress(Sender: TObject; var Key: Char);
    procedure Tabel_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Nalog_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Name_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Familia_UkrKeyPress(Sender: TObject; var Key: Char);
    procedure Name_UkrKeyPress(Sender: TObject; var Key: Char);
    procedure AddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure Live_AddButtonClick(Sender: TObject);
    procedure Live_EditButtonClick(Sender: TObject);
    procedure Live_DeleteButtonClick(Sender: TObject);
    procedure cxGridTableView_of_LiveFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Sub_AddButtonClick(Sender: TObject);
    procedure cxGridTableView2FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure Sub_EditButtonClick(Sender: TObject);
    procedure Sub_DeleteButtonClick(Sender: TObject);
    procedure Lg_AddButtonClick(Sender: TObject);
    procedure Lg_EditButtonClick(Sender: TObject);
    procedure Lg_DeleteButtonClick(Sender: TObject);
    procedure cxGridTableView3FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxGridTableView_of_LiveCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridTableView2CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure cxGridTableView3CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure Insost_AddButtonClick(Sender: TObject);
    procedure Insost_DeleteButtonClick(Sender: TObject);
    procedure Insost_EditButtonClick(Sender: TObject);
    procedure SummaEditKeyPress(Sender: TObject; var Key: Char);
    procedure cxTabSheet6Show(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxGrid1TableView1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Faculty_ButtonEditKeyPress(Sender: TObject; var Key: Char);
    procedure Faculty_ButtonEditExit(Sender: TObject);
    procedure Faculty_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
    procedure cxGridTableView_of_LiveDblClick(Sender: TObject);
    procedure cxGridTableView1DblClick(Sender: TObject);
    procedure cxGridTableView2DblClick(Sender: TObject);
    procedure cxGridTableView3DblClick(Sender: TObject);
    procedure cxGrid1TableView1DblClick(Sender: TObject);
    procedure Pol_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Inostranez_CheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Propiska_CheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Propusk_CheckBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Group_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Spec_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure Add_ActionExecute(Sender: TObject);
    procedure Edit_ActionExecute(Sender: TObject);
    procedure cxTabSheet1Show(Sender: TObject);
    procedure cxTabSheet2Show(Sender: TObject);
    procedure cxTabSheet4Show(Sender: TObject);
    procedure cxTabSheet5Show(Sender: TObject);
    procedure Otch_UkrKeyPress(Sender: TObject; var Key: Char);
    procedure Cur_WorkPlace_TextEditKeyPress(Sender: TObject;
      var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ApostrofExecute(Sender: TObject);
    procedure Familia_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EditFizLizo_BtnClick(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
    procedure Kurs_ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Group_ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Spec_ComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveFIOClick(Sender: TObject);
    procedure Cur_WorkPlace_TextEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Cur_Posada_TextEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTabSheet7Show(Sender: TObject);
    procedure addButton_dop_servClick(Sender: TObject);
    procedure editbutton_dop_servClick(Sender: TObject);
    procedure delButton_dop_servClick(Sender: TObject);
    procedure cxGrid_dop_servTableView4DblClick(Sender: TObject);
    procedure cxGrid_dop_servTableView4FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);

  private
    cur_date : string;
    PLanguageIndex: byte;
    procedure FormIniLanguage();
    procedure DisableControls(Disable: boolean);
  public
    id_kod : Int64;
    Redact : boolean;
    Redact_Live, Redact_Category, Redact_Subs, Redact_Lgot, Redact_dop_serv: boolean;

    Inostranez_Redact, Propiska_Redact, Propusk_Redact : boolean;
    Id_department, id_group, id_spec : int64;

    Id_department_Redact,  id_group_Redact, id_spec_Redact : int64;

    Date_Born_Redact, Dogovor_DateEdit_Redact : TDateTime;
    Familia_Reduct, Name_Redact, Otch_Redact, Pol_Redact,
    Nomer_Dogovora_Redact,  Tabel_Edit_Redact, Nalog_Edit_Redact,
    Kurs_Redact, Familia_UKR_Reduct, Name_UKR_Redact, Otch_UKR_Redact,
    cur_work_place, cur_posada : string;

    ViewMode : boolean;
    ID_MAN   : int64;

    id_department_dop : Int64;
    id_post_dop : Int64;

    edit_item_id : Int64;

    Change_inf : boolean;
    is_admin : Boolean;
    st_end_month : Integer;

    procedure GroupVisible (Mode : boolean);
    procedure SortGridData;
    procedure SortGridData_dop_serv;
    procedure SortGridData_Live;
    procedure SortGridData_Subsidy;
    procedure SortGridData_Lg;
    procedure RedactTrue;
    procedure Redact_Check;
  end;

var
  Registration_Form_Add: TRegistration_Form_Add;
  const kav = '''';

implementation

uses Unit_of_Utilits, DateUtils, St_Registration_Date_Add_2,
  st_Registration_Date_Add, St_Pfsub_Add_Form, St_PfLg_Add_Form,
  St_Ptio_Registration, DataModule1_Unit, St_InsOst_Add_Istoch_Form, Math;

{$R *.dfm}

procedure TRegistration_Form_Add.DisableControls(Disable: boolean);
begin
  Familia_Edit.Properties.ReadOnly := Disable;
  Name_Edit.Properties.ReadOnly := Disable;
  Otch_Edit.Properties.ReadOnly := Disable;
  DateBorn_Edit.Properties.ReadOnly := Disable;
  Nalog_Edit.Properties.ReadOnly := Disable;
end;

procedure TRegistration_Form_Add.GroupVisible (Mode : boolean);
begin
  if Mode then
   begin
    KursLabel.Visible:=true;
    Kurs_ComboBox.Visible:=true;
    GroupLabel.Visible:=true;
    Group_ComboBox.Visible:=true;
    SpecLabel.Visible:=true;
    Spec_ComboBox.Visible:=true;
   end
 else
  begin
   KursLabel.Visible:=false;
   Kurs_ComboBox.Visible:=false;
   GroupLabel.Visible:=false;
   Group_ComboBox.Visible:=false;
   SpecLabel.Visible:=false;
   Spec_ComboBox.Visible:=false;

   id_group:=-1;
   id_spec:=-1;
  end;
end;



procedure TRegistration_Form_Add.RedactTrue;
begin
  Redact:=true;
end;

procedure TRegistration_Form_Add.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 Caption:=                       st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 OkButton.Caption :=             st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=         st_ConstUnit.st_Cancel[PLanguageIndex];

 cxGroupBox2.Caption :=         st_ConstUnit.st_FIOUser[PLanguageIndex];
 cxGroupBox7.Caption :=         st_ConstUnit.st_Dog[PLanguageIndex];

 Label1.Caption:=               st_ConstUnit.st_Fam[PLanguageIndex];
 Label2.Caption:=               st_ConstUnit.st_Name[PLanguageIndex];
 Label3.Caption:=               st_ConstUnit.st_Otch[PLanguageIndex];
 Without_Otch_CheckBox.Properties.Caption := st_ConstUnit.st_Without_Otch[PLanguageIndex];
 Label4.Caption:=               st_ConstUnit.st_DateBorn[PLanguageIndex];
 Label10.Caption:=              st_ConstUnit.st_Sex[PLanguageIndex];
 Inostranez_CheckBox.Properties.Caption:=  st_ConstUnit.st_Inostr[PLanguageIndex];
 Propiska_CheckBox.Properties.Caption:=    st_ConstUnit.st_WithPropi[PLanguageIndex];
 Propusk_CheckBox.Properties.Caption:=     st_ConstUnit.st_PropPrint[PLanguageIndex];
 Label6.Caption:=               st_ConstUnit.st_DogNomer[PLanguageIndex];
 Label7.Caption:=               st_ConstUnit.st_DogDate[PLanguageIndex];

 OrderNum_Label.Caption :=      st_ConstUnit.st_dt_OrderNum[PLanguageIndex];

 cxTabSheet1.Caption :=         st_ConstUnit.st_Live[PLanguageIndex];
 cxTabSheet2.Caption :=         st_ConstUnit.st_CategoryAll[PLanguageIndex];
 cxTabSheet3.Caption :=         st_ConstUnit.st_Aditional[PLanguageIndex];
 cxTabSheet4.Caption :=         st_ConstUnit.st_SubsAll[PLanguageIndex];
 cxTabSheet5.Caption :=         st_ConstUnit.st_LgotsAll[PLanguageIndex];
 cxTabSheet6.Caption :=         st_ConstUnit.st_EntryRest[PLanguageIndex];
 cxTabSheet7.Caption :=         st_ConstUnit.st_Dop_SERV[PLanguageIndex];


 cxGroupBox9.Caption:=          st_ConstUnit.st_Identify[PLanguageIndex];
 Label8.Caption:=               st_ConstUnit.st_TabNomer[PLanguageIndex];
 Label9.Caption:=               st_ConstUnit.st_NalogNomer[PLanguageIndex];

 cxGroupBox10.Caption:=         st_ConstUnit.st_Study[PLanguageIndex];
 KursLabel.Caption:=            st_ConstUnit.st_footer_Kurs[PLanguageIndex];
 GroupLabel.Caption:=           st_ConstUnit.st_footer_Group[PLanguageIndex];
 SpecLabel.Caption:=            st_ConstUnit.st_footer_Spec[PLanguageIndex];
 Label5.Caption:=               st_ConstUnit.st_Pidrozdil[PLanguageIndex];

 Live_AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 Live_EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 Live_DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 Sub_AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 Sub_EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 Sub_DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 Lg_AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 Lg_EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 Lg_DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 Insost_AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 Insost_EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 Insost_DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 // gridColumns
 // общ
 cxGridColumn3.Caption :=        st_ConstUnit.st_grid_Hostel[PLanguageIndex];
 // Комната
 cxGridColumn0.Caption :=        st_ConstUnit.st_Room[PLanguageIndex];
 //Дата начала
 cxGridColumn1.Caption :=        st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
 //Дата окончания
 cxGridColumn2.Caption :=        st_ConstUnit.st_grid_Date_End[PLanguageIndex];
 //Код категории
 cxGridTableView1Column1.Caption :=   st_ConstUnit.st_CategoryCode[PLanguageIndex];
 //Дата начала
 cxGridTableView1Column2.Caption :=   st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
 //Дата окончания
 cxGridTableView1Column3.Caption :=   st_ConstUnit.st_grid_Date_End[PLanguageIndex];
 // начало
 cxGridTableView2Column1.Caption :=   st_ConstUnit.st_Begin[PLanguageIndex];
 // окончание
 cxGridTableView2Column2.Caption :=   st_ConstUnit.st_End[PLanguageIndex];
 // сумма
 cxGridTableView2Column3.Caption :=   st_ConstUnit.st_Sum[PLanguageIndex];
 // кол-во мес.
 cxGridTableView2Column4.Caption :=   st_ConstUnit.st_KolVoMes[PLanguageIndex];
 // состояние
 cxGridTableView2Column5.Caption :=   st_ConstUnit.st_State[PLanguageIndex];
 //Код льготы
 cxGridTableView3Column1.Caption :=   st_ConstUnit.st_LgCode[PLanguageIndex];
 //Дата начала
 cxGridColumn8.Caption :=   st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
 //Дата окончания
 cxGridColumn9.Caption :=   st_ConstUnit.st_grid_Date_End[PLanguageIndex];
 //Дата приказа
 date_prikaza.Caption :=   st_ConstUnit.st_PikazDate[PLanguageIndex];
 //Номер приказа
 nomer_prikaza.Caption :=   st_ConstUnit.st_PrikazNomer[PLanguageIndex];
 //
 Label11.Caption       :=   st_ConstUnit.st_WorkPlace[PLanguageIndex];
 Label12.Caption       :=   st_ConstUnit.st_WorkPosada[PLanguageIndex];
 SummaLabel.Caption    :=   st_ConstUnit.st_Sum[PLanguageIndex];
 cxButton1.Caption     :=   st_ConstUnit.st_Rasch[PLanguageIndex];
 // сумма
 Summa.Caption     :=   st_ConstUnit.st_Sum[PLanguageIndex];
 //Источники финансирования
 IstFinance.Caption     :=   st_ConstUnit.st_IstFinance[PLanguageIndex];
 cxButton1.Hint        :=   st_ConstUnit.st_IstFinanceHint[PLanguageIndex];
end;

function Categories_Lives_Hole_Check: boolean;
var
  i : integer;
  Span_lives, Span_Cat : double;
  date_beg, date_end : TDate;
  flag_result : Boolean;
begin
  flag_result := True;

  With Registration_Form_Add do
   Begin
    {For i := 0 to cxGridTableView_of_Live.DataController.RecordCount - 2 do
     begin
      date_beg := StrToDate(cxGridTableView_of_Live.DataController.Values[i, 2]);
      date_end := StrToDate(cxGridTableView_of_Live.DataController.Values[i+1, 3]) + st_end_month;
      If (date_beg <> date_end) then Flag_result := False;
     End;

    For i := 0 to cxGridTableView1.DataController.RecordCount - 2 do
     begin
      date_beg := StrToDate(cxGridTableView1.DataController.Values[i, 1]);
      date_end := StrToDate(cxGridTableView1.DataController.Values[i+1, 2]) + st_end_month;
      If (date_beg <> date_end) then Flag_result := False;
     End;}

    if cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 2] <> cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 1]
     then flag_result := False;

    if cxGridTableView_of_Live.DataController.Values[0, 3] <> cxGridTableView1.DataController.Values[0, 2]
     then flag_result := False;
   End;

  Result := Flag_result;
  {With Registration_Form_Add do
   begin
    if cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 2] <> cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 1]
     then exit;
    if cxGridTableView_of_Live.DataController.Values[0, 3] <> cxGridTableView1.DataController.Values[0, 2]
     then exit;


    Span_lives:=0;
    for i:=0 to cxGridTableView_of_Live.DataController.RecordCount - 1 do
     Span_lives:= DaySpan(cxGridTableView_of_Live.DataController.Values[i, 2],cxGridTableView_of_Live.DataController.Values[i, 3])+Span_lives;

    Span_Cat:=0;
    for i:=0 to cxGridTableView1.DataController.RecordCount - 1 do
     Span_Cat:= DaySpan(cxGridTableView1.DataController.Values[i, 1],cxGridTableView1.DataController.Values[i, 2])+Span_Cat;

    if Span_lives = Span_Cat
     then Result := true;
  end;}
end;

//--------------------------------------------------------------------------------------------
function Subsidy_State_No_Cross_of_OFORMENA: boolean;
var
 i,k: integer;
 //--
 function Sub_State_Checker : boolean;
  begin
   result:=false;
   if ((Registration_Form_Add.cxGridTableView2.DataController.Values[k, 4]='ОФОРМЛЕНА')
       and (Registration_Form_Add.cxGridTableView2.DataController.Values[i, 4]='ОФОРМЛЕНА'))
   then  result:=true;
  end;
//--
begin
  result:=false;
  with Registration_Form_Add do
   begin
    if cxGridTableView2.DataController.RecordCount = 1 then
     begin
      result:=true;
      exit;
     end;

    if cxGridTableView2.DataController.RecordCount > 1 then
     for i := 0 to cxGridTableView2.DataController.RecordCount - 1 do
     for k := 0 to cxGridTableView2.DataController.RecordCount - 1 do
      begin
       if i<>k then
       if (cxGridTableView2.DataController.Values[k, 1] >= cxGridTableView2.DataController.Values[i, 1]) and
          (cxGridTableView2.DataController.Values[k, 1] < cxGridTableView2.DataController.Values[i, 2])
       then
        if Sub_State_Checker then
         begin
          ShowMessage('Вкладка СУБСИДИИ: Периоды: '+ datetostr(cxGridTableView2.DataController.Values[i, 1])+'-'+ datetostr(cxGridTableView2.DataController.Values[i, 2])+ ' и ' +
                  datetostr(cxGridTableView2.DataController.Values[k, 1])+'-'+ datetostr(cxGridTableView2.DataController.Values[k, 2])+
                  ' не могут быть внесены в базу данных, т.к. в эти периоды пересекаются по состояниям субсидий ОФОРМЛЕНА. Внесите изменения.');
          cxPageControl1.ActivePageIndex := 3;//cубсидии
          cxGridTableView2.DataController.FocusedRecordIndex := k;
          exit;
         end;
      end;
   end;
  result:=true;
end;
//--------------------------------------------------------------------------------------------

function Subsidy_State_No_Cross_of_oformlena_naznachena: boolean;
var
i,k: integer;
  function Sub_State_Checker : boolean;
   begin
    result:=false;
  with Registration_Form_Add do begin
    if (cxGridTableView2.DataController.Values[k, 5]='ОФОРМЛЕНА') and (cxGridTableView2.DataController.Values[i, 5]='НАЗНАЧЕНА') then  result:=true;
    if (cxGridTableView2.DataController.Values[k, 5]='НАЗНАЧЕНА') and (cxGridTableView2.DataController.Values[i, 5]='ОФОРМЛЕНА') then  result:=true;
  end;
   end;
begin
result:=false;
with Registration_Form_Add do begin
if cxGridTableView2.DataController.RecordCount = 1 then begin
result:=true;
exit;
end;
if cxGridTableView2.DataController.RecordCount > 1 then
for i := 0 to cxGridTableView2.DataController.RecordCount - 1 do
for k := 0 to cxGridTableView2.DataController.RecordCount - 1 do
 begin
 if i<>k then
 if (cxGridTableView2.DataController.Values[k, 1] >= cxGridTableView2.DataController.Values[i, 1]) and
    (cxGridTableView2.DataController.Values[k, 1] <  cxGridTableView2.DataController.Values[i, 2])
 then
  if Sub_State_Checker then
  begin
  ShowMessage('Вкладка СУБСИДИИ: Периоды: '+ datetostr(cxGridTableView2.DataController.Values[i, 1])+'-'+ datetostr(cxGridTableView2.DataController.Values[i, 2])+ ' и ' +
  datetostr(cxGridTableView2.DataController.Values[k, 1])+'-'+ datetostr(cxGridTableView2.DataController.Values[k, 2])+
  ' не могут быть внесены в базу данных, т.к. в эти периоды пересекаются состояния субсидий ОФОРМЛЕНА\НАЗНАЧЕНА. Внесите изменения.');
  cxPageControl1.ActivePageIndex := 3; //субсидии
  cxGridTableView2.DataController.FocusedRecordIndex := k;
  exit;
  end;
 end;
 end;
result:=true;
end;



function Lgota_Type_No_Cross: boolean;
var
i,k: integer;

begin
result:=false;
with Registration_Form_Add do begin
if cxGridTableView3.DataController.RecordCount = 1 then begin
result:=true;
exit;
end;
if cxGridTableView3.DataController.RecordCount > 1 then
for i := 0 to cxGridTableView3.DataController.RecordCount - 1 do
for k := 0 to cxGridTableView3.DataController.RecordCount - 1 do
 begin
 if i<>k then
 if (cxGridTableView3.DataController.Values[k, 1] >= cxGridTableView3.DataController.Values[i, 1]) and
    (cxGridTableView3.DataController.Values[k, 1] <  cxGridTableView3.DataController.Values[i, 2])
 then
  if cxGridTableView3.DataController.Values[i,3]=cxGridTableView3.DataController.Values[k,3] then
  begin
  ShowMessage('Вкладка ЛЬГОТЫ: Периоды: '+ datetostr(cxGridTableView3.DataController.Values[i, 1])+
  '-'+ datetostr(cxGridTableView3.DataController.Values[i, 2])+ ' и ' +
  datetostr(cxGridTableView3.DataController.Values[k, 1])+'-'+ datetostr(cxGridTableView3.DataController.Values[k, 2])+
  ' пересекаются по типу  ('+cxGridTableView3.DataController.Values[k, 4]+') . Внесите изменения.');
  cxPageControl1.ActivePageIndex := 4; //льгота
  cxGridTableView3.DataController.FocusedRecordIndex := k;
  exit;
  end;
 end;
 end;
result:=true;
end;



function Subsidy_Type_No_Cross: boolean;
var
i,k: integer;

begin
result:=false;
with Registration_Form_Add do begin
if cxGridTableView2.DataController.RecordCount = 1 then begin
result:=true;
exit;
end;
if cxGridTableView2.DataController.RecordCount > 1 then
for i := 0 to cxGridTableView2.DataController.RecordCount - 1 do
for k := 0 to cxGridTableView2.DataController.RecordCount - 1 do
 begin
 if i<>k then
 if (cxGridTableView2.DataController.Values[k, 1] >= cxGridTableView2.DataController.Values[i, 1]) and
    (cxGridTableView2.DataController.Values[k, 1] <  cxGridTableView2.DataController.Values[i, 2])
 then
  if cxGridTableView2.DataController.Values[i,6]=cxGridTableView2.DataController.Values[k,6] then
  begin
  ShowMessage('Вкладка СУБСИДИИ: Периоды: '+ datetostr(cxGridTableView2.DataController.Values[i, 1])+'-'+ datetostr(cxGridTableView2.DataController.Values[i, 2])+ ' и ' +
  datetostr(cxGridTableView2.DataController.Values[k, 1])+'-'+ datetostr(cxGridTableView2.DataController.Values[k, 2])+
  ' пересекаются по типу субсидии ('+cxGridTableView2.DataController.Values[k, 9]+') . Внесите изменения.');
  cxPageControl1.ActivePageIndex := 3; //субсидии
  cxGridTableView2.DataController.FocusedRecordIndex := k;
  exit;
  end;
 end;
 end;
result:=true;
end;

procedure TRegistration_Form_Add.SortGridData;
var
  i : integer;
  temp_kod_category : integer;
  doNew : boolean;
  temp_date_beg, temp_date_end : TDate;
  temp_Kategoriya : integer;
  temp_flag, temp_SHORT_NAME_CATEGORY : string;
  temp_sum : Double;
begin
  if cxGridTableView1.DataController.RecordCount < 2 then exit;

  doNew := true;
  while doNew do
   begin
    doNew := false;
    for i := 0 to cxGridTableView1.DataController.RecordCount - 2 do
     begin
      if (cxGridTableView1.DataController.Values[i, 1] <= cxGridTableView1.DataController.Values[i + 1, 2]) and
         (cxGridTableView1.DataController.Values[i, 2] < cxGridTableView1.DataController.Values[i + 1, 2]) then
       begin
        temp_flag                :='';
        temp_kod_category        := cxGridTableView1.DataController.Values[i, 0];
        temp_date_beg            := cxGridTableView1.DataController.Values[i, 1];
        temp_date_end            := cxGridTableView1.DataController.Values[i, 2];
        temp_Kategoriya          := cxGridTableView1.DataController.Values[i, 3];
        temp_SHORT_NAME_CATEGORY := cxGridTableView1.DataController.Values[i, 4];
        temp_sum                 := cxGridTableView1.DataController.Values[i, 6];

        If cxGridTableView1.DataController.Values[i, 5] <> null then
         begin
          temp_flag := cxGridTableView1.DataController.Values[i, 5];
          cxGridTableView1.DataController.Values[i, 5]:= '';
         end;

        cxGridTableView1.DataController.Values[i, 0] := cxGridTableView1.DataController.Values[i + 1, 0];
        cxGridTableView1.DataController.Values[i, 1] := cxGridTableView1.DataController.Values[i + 1, 1];
        cxGridTableView1.DataController.Values[i, 2] := cxGridTableView1.DataController.Values[i + 1, 2];
        cxGridTableView1.DataController.Values[i, 3] := cxGridTableView1.DataController.Values[i + 1, 3];
        cxGridTableView1.DataController.Values[i, 4] := cxGridTableView1.DataController.Values[i + 1, 4];
        cxGridTableView1.DataController.Values[i, 6] := cxGridTableView1.DataController.Values[i + 1, 6];
        if cxGridTableView1.DataController.Values[i + 1, 5] <> null then
         begin
          cxGridTableView1.DataController.Values[i, 5] := cxGridTableView1.DataController.Values[i + 1, 5];
          cxGridTableView1.DataController.Values[i + 1, 5]:='';
         end;

        cxGridTableView1.DataController.Values[i + 1, 0] := temp_kod_category;
        cxGridTableView1.DataController.Values[i + 1, 1] := temp_date_beg;
        cxGridTableView1.DataController.Values[i + 1, 2] := temp_date_end;
        cxGridTableView1.DataController.Values[i + 1, 3] := temp_Kategoriya;
        cxGridTableView1.DataController.Values[i + 1, 4] := temp_SHORT_NAME_CATEGORY;
        cxGridTableView1.DataController.Values[i + 1, 6] := temp_sum;
        if temp_flag <> '' then cxGridTableView1.DataController.Values[i + 1, 5] := temp_flag;
        doNew := true;
       end;
     end;
   end;
end;

procedure TRegistration_Form_Add.SortGridData_Live;
var
 i, temp_Type_Room, temp_kod_build     : integer;
 doNew : boolean;
 temp_date_beg, temp_date_end : TDate;
 temp_flag,temp_obsh, temp_komnata, temp_N_Room, temp_Short_Name_Build: string;
 begin
 if cxGridTableView_of_Live.DataController.RecordCount < 2 then exit;
 doNew := true;
 while doNew do begin
  doNew := false;
  for i := 0 to cxGridTableView_of_Live.DataController.RecordCount - 2 do
  begin
  if (cxGridTableView_of_Live.DataController.Values[i, 2] <= cxGridTableView_of_Live.DataController.Values[i + 1, 3])
     and (cxGridTableView_of_Live.DataController.Values[i, 3] < cxGridTableView_of_Live.DataController.Values[i + 1, 3]) then begin
  temp_flag :='';
   temp_obsh:= cxGridTableView_of_Live.DataController.Values[i, 0];
   temp_komnata:= cxGridTableView_of_Live.DataController.Values[i, 1];
   temp_date_beg := cxGridTableView_of_Live.DataController.Values[i, 2];
   temp_date_end := cxGridTableView_of_Live.DataController.Values[i, 3];
   temp_kod_build:= cxGridTableView_of_Live.DataController.Values[i, 4];
   temp_N_Room:= cxGridTableView_of_Live.DataController.Values[i, 5];
   temp_Type_Room := cxGridTableView_of_Live.DataController.Values[i, 6];
   temp_Short_Name_Build := cxGridTableView_of_Live.DataController.Values[i,7];
 if cxGridTableView_of_Live.DataController.Values[i, 8]<> null then
begin
   temp_flag := cxGridTableView_of_Live.DataController.Values[i, 8];
   cxGridTableView_of_Live.DataController.Values[i, 8]:= '';
end;
   cxGridTableView_of_Live.DataController.Values[i, 0] := cxGridTableView_of_Live.DataController.Values[i + 1, 0];
   cxGridTableView_of_Live.DataController.Values[i, 1] := cxGridTableView_of_Live.DataController.Values[i + 1, 1];
   cxGridTableView_of_Live.DataController.Values[i, 2] := cxGridTableView_of_Live.DataController.Values[i + 1, 2];
   cxGridTableView_of_Live.DataController.Values[i, 3] := cxGridTableView_of_Live.DataController.Values[i + 1, 3];
   cxGridTableView_of_Live.DataController.Values[i, 4] := cxGridTableView_of_Live.DataController.Values[i + 1, 4];
   cxGridTableView_of_Live.DataController.Values[i, 5] := cxGridTableView_of_Live.DataController.Values[i + 1, 5];
   cxGridTableView_of_Live.DataController.Values[i, 6] := cxGridTableView_of_Live.DataController.Values[i + 1, 6];
   cxGridTableView_of_Live.DataController.Values[i, 7] := cxGridTableView_of_Live.DataController.Values[i + 1, 7];
 if cxGridTableView_of_Live.DataController.Values[i + 1, 8]<> null then
begin
   cxGridTableView_of_Live.DataController.Values[i, 8] := cxGridTableView_of_Live.DataController.Values[i + 1, 8];
   cxGridTableView_of_Live.DataController.Values[i + 1, 8]:='';
   end;

   cxGridTableView_of_Live.DataController.Values[i + 1, 0] := temp_obsh;
   cxGridTableView_of_Live.DataController.Values[i + 1, 1] := temp_komnata;
   cxGridTableView_of_Live.DataController.Values[i + 1, 2] := temp_date_beg;
   cxGridTableView_of_Live.DataController.Values[i + 1, 3] := temp_date_end;
   cxGridTableView_of_Live.DataController.Values[i + 1, 4] := temp_kod_build;
   cxGridTableView_of_Live.DataController.Values[i + 1, 5] := temp_N_Room;
   cxGridTableView_of_Live.DataController.Values[i + 1, 6] := temp_Type_Room;
   cxGridTableView_of_Live.DataController.Values[i + 1, 7] := temp_Short_Name_Build;
if temp_flag<>'' then  cxGridTableView_of_Live.DataController.Values[i + 1, 8] := temp_flag;
   doNew := true;
   end;
  end;
 end;
end;


procedure TRegistration_Form_Add.SortGridData_Subsidy;

var
 i  ,temp_id_subsidy, temp_id_state    : integer;
 doNew : boolean;
 temp_date_beg, temp_date_end : TDate;
 temp_summa, temp_kol_month, temp_sostoyanie, temp_Comment, temp_fullname, temp_short_name, temp_id_key : string;
 temp_name_serves, temp_id_serves : string;
 temp_flag : string;
begin
  if cxGridTableView2.DataController.RecordCount < 2 then exit;

  doNew := true;
  while doNew do
   begin
    doNew := false;
    for i := 0 to cxGridTableView2.DataController.RecordCount - 2 do
     begin
      temp_flag :='';
      if (cxGridTableView2.DataController.Values[i, 0] < cxGridTableView2.DataController.Values[i + 1, 0]) then
       begin
        temp_name_serves := cxGridTableView2.DataController.Values[i, 0];
        temp_date_beg    := cxGridTableView2.DataController.Values[i, 1];
        temp_date_end    := cxGridTableView2.DataController.Values[i, 2];
        temp_summa       := cxGridTableView2.DataController.Values[i, 3];
        temp_kol_month   := cxGridTableView2.DataController.Values[i, 4];
        temp_sostoyanie  := cxGridTableView2.DataController.Values[i, 5];
        temp_id_subsidy  := cxGridTableView2.DataController.Values[i, 6];
        temp_id_state    := cxGridTableView2.DataController.Values[i, 7];

        if cxGridTableView2.DataController.Values[i, 8] <> null
         then temp_Comment := cxGridTableView2.DataController.Values[i, 8]
         else temp_Comment :='';

        temp_fullname   := cxGridTableView2.DataController.Values[i, 9];
        temp_short_name := cxGridTableView2.DataController.Values[i, 10];

        if cxGridTableView2.DataController.Values[i, 11]<> null then
         begin
          temp_flag := cxGridTableView2.DataController.Values[i, 11];
          cxGridTableView2.DataController.Values[i, 11] := '';
         end;

        if cxGridTableView2.DataController.Values[i, 12] <> null
         then temp_id_key:= cxGridTableView2.DataController.Values[i, 12];

        temp_id_serves := cxGridTableView2.DataController.Values[i, 13];

        cxGridTableView2.DataController.Values[i, 0] := cxGridTableView2.DataController.Values[i + 1, 0];
        cxGridTableView2.DataController.Values[i, 1] := cxGridTableView2.DataController.Values[i + 1, 1];
        cxGridTableView2.DataController.Values[i, 2] := cxGridTableView2.DataController.Values[i + 1, 2];
        cxGridTableView2.DataController.Values[i, 3] := cxGridTableView2.DataController.Values[i + 1, 3];
        cxGridTableView2.DataController.Values[i, 4] := cxGridTableView2.DataController.Values[i + 1, 4];
        cxGridTableView2.DataController.Values[i, 5] := cxGridTableView2.DataController.Values[i + 1, 5];
        cxGridTableView2.DataController.Values[i, 6] := cxGridTableView2.DataController.Values[i + 1, 6];
        cxGridTableView2.DataController.Values[i, 7] := cxGridTableView2.DataController.Values[i + 1, 7];
        cxGridTableView2.DataController.Values[i, 8] := cxGridTableView2.DataController.Values[i + 1, 8];
        cxGridTableView2.DataController.Values[i, 9] := cxGridTableView2.DataController.Values[i + 1, 9];
        cxGridTableView2.DataController.Values[i, 10] := cxGridTableView2.DataController.Values[i + 1, 10];

        if cxGridTableView2.DataController.Values[i + 1, 11] <> null then
         begin
          cxGridTableView2.DataController.Values[i, 11] := cxGridTableView2.DataController.Values[i + 1, 11];
          cxGridTableView2.DataController.Values[i + 1, 11] := '';
         end;

        cxGridTableView2.DataController.Values[i, 12] := cxGridTableView2.DataController.Values[i + 1, 12];
        cxGridTableView2.DataController.Values[i, 13] := cxGridTableView2.DataController.Values[i + 1, 13];


        cxGridTableView2.DataController.Values[i + 1, 0] := temp_name_serves;
        cxGridTableView2.DataController.Values[i + 1, 1] := temp_date_beg;
        cxGridTableView2.DataController.Values[i + 1, 2] := temp_date_end;
        cxGridTableView2.DataController.Values[i + 1, 3] := temp_summa;
        cxGridTableView2.DataController.Values[i + 1, 4] := temp_kol_month;
        cxGridTableView2.DataController.Values[i + 1, 5] := temp_sostoyanie;
        cxGridTableView2.DataController.Values[i + 1, 6] := temp_id_subsidy;
        cxGridTableView2.DataController.Values[i + 1, 7] := temp_id_state;
        cxGridTableView2.DataController.Values[i + 1, 8] := temp_Comment;
        cxGridTableView2.DataController.Values[i + 1, 9] := temp_fullname;
        cxGridTableView2.DataController.Values[i + 1, 10] := temp_short_name;

        if temp_flag <> ''
         then cxGridTableView2.DataController.Values[i + 1, 11] := temp_flag;

        cxGridTableView2.DataController.Values[i + 1, 12] := temp_id_key;
        cxGridTableView2.DataController.Values[i + 1, 13] := temp_id_serves;

        doNew := true;
       end;
     end;
   end;
end;

procedure TRegistration_Form_Add.SortGridData_Lg;

var
 i  ,temp_id_lg , temp_kod_lg  : integer;
 doNew : boolean;
 temp_date_beg, temp_date_end, temp_date_prikaza : TDate;
 temp_flag, temp_fullname, temp_nomer_prikaza : string  ;
 begin
 if cxGridTableView3.DataController.RecordCount < 2 then exit;
 doNew := true;
 while doNew do begin
  doNew := false;
  for i := 0 to cxGridTableView3.DataController.RecordCount - 2 do
  begin
  temp_flag :='';
  temp_date_prikaza:=strtodate('01.01.1900');
  temp_nomer_prikaza:='';
  if cxGridTableView3.DataController.Values[i, 1] <= cxGridTableView3.DataController.Values[i + 1, 2]
  and (cxGridTableView3.DataController.Values[i, 2] < cxGridTableView3.DataController.Values[i + 1, 2]) then begin
   temp_kod_lg   := cxGridTableView3.DataController.Values[i, 0];
   temp_date_beg := cxGridTableView3.DataController.Values[i, 1];
   temp_date_end := cxGridTableView3.DataController.Values[i, 2];
   temp_id_lg    := cxGridTableView3.DataController.Values[i, 3];
   temp_fullname := cxGridTableView3.DataController.Values[i, 4];
   if cxGridTableView3.DataController.Values[i, 6]<>null then
   temp_date_prikaza:= cxGridTableView3.DataController.Values[i, 6];
   if cxGridTableView3.DataController.Values[i, 7] <> null then
   temp_nomer_prikaza:=cxGridTableView3.DataController.Values[i, 7];
if cxGridTableView3.DataController.Values[i, 5]<> null then
begin
   temp_flag := cxGridTableView3.DataController.Values[i, 5];
   cxGridTableView3.DataController.Values[i, 5]:= '';
end;
   cxGridTableView3.DataController.Values[i, 0] := cxGridTableView3.DataController.Values[i + 1, 0];
   cxGridTableView3.DataController.Values[i, 1] := cxGridTableView3.DataController.Values[i + 1, 1];
   cxGridTableView3.DataController.Values[i, 2] := cxGridTableView3.DataController.Values[i + 1, 2];
   cxGridTableView3.DataController.Values[i, 3] := cxGridTableView3.DataController.Values[i + 1, 3];
   cxGridTableView3.DataController.Values[i, 4] := cxGridTableView3.DataController.Values[i + 1, 4];
   cxGridTableView3.DataController.Values[i, 6] := cxGridTableView3.DataController.Values[i + 1, 6];
   cxGridTableView3.DataController.Values[i, 7] := cxGridTableView3.DataController.Values[i + 1, 7];
if cxGridTableView3.DataController.Values[i + 1, 5]<> null then
begin
   cxGridTableView3.DataController.Values[i, 5] := cxGridTableView3.DataController.Values[i + 1, 5];
   cxGridTableView3.DataController.Values[i + 1, 5]:='';
   end;

   cxGridTableView3.DataController.Values[i + 1, 0] := temp_kod_lg;
   cxGridTableView3.DataController.Values[i + 1, 1] := temp_date_beg;
   cxGridTableView3.DataController.Values[i + 1, 2] := temp_date_end;
   cxGridTableView3.DataController.Values[i + 1, 3] := temp_id_lg;
   cxGridTableView3.DataController.Values[i + 1, 4] := temp_fullname;
   if temp_date_prikaza <> strtodate('01.01.1900') then
   cxGridTableView3.DataController.Values[i + 1, 6] := temp_date_prikaza;
   if temp_nomer_prikaza<> '' then 
   cxGridTableView3.DataController.Values[i + 1, 7] := temp_nomer_prikaza;
 if temp_flag<>'' then  cxGridTableView3.DataController.Values[i + 1, 5] := temp_flag;
   doNew := true;
   end;
  end;
 end;
end;

procedure TRegistration_Form_Add.FormShow(Sender: TObject);
begin
  TypeRoom_Selecter_DataSet.Close;
  TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select * from ST_DT_PFIO_POSADA_BY_ID_SELECT(:id_kod)';
  TypeRoom_Selecter_DataSet.ParamByName('id_kod').AsInt64 := edit_item_id;
  TypeRoom_Selecter_DataSet.Open;
  If TypeRoom_Selecter_DataSet['CUR_WORK_PLACE']<> null then
   begin
    Cur_WorkPlace_TextEdit.Text:= TypeRoom_Selecter_DataSet['CUR_WORK_PLACE'];
    cur_work_place:= TypeRoom_Selecter_DataSet['CUR_WORK_PLACE'];
   end;

  If TypeRoom_Selecter_DataSet['ID_DEPARTMENT_DOP']<> null
   then id_department_dop := TypeRoom_Selecter_DataSet['ID_DEPARTMENT_DOP']
   else id_department_dop := -1;

  If TypeRoom_Selecter_DataSet['CUR_DOLGNOST']<> null then
   begin
    Cur_Posada_TextEdit.Text:= TypeRoom_Selecter_DataSet['CUR_DOLGNOST'];
    cur_posada:= TypeRoom_Selecter_DataSet['CUR_DOLGNOST'];
   end;

  If TypeRoom_Selecter_DataSet['ID_POST_DOP']<> null
   then id_post_dop := TypeRoom_Selecter_DataSet['ID_POST_DOP']
   else id_post_dop := -1;
  TypeRoom_Selecter_DataSet.Close;

  cxPageControl1.ActivePageIndex := 0;

  if Familia_Edit.Properties.Buttons[0].Visible then
   begin
    TypeRoom_Selecter_DataSet.SelectSQL.Clear;
    TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select * from ST_GET_ID_MAN_FROM_PFIO_BY_ID('+ inttostr(id_kod) + ')';
    TypeRoom_Selecter_DataSet.Open;
    if TypeRoom_Selecter_DataSet['ID_MAN'] <> null
     then ID_MAN := TypeRoom_Selecter_DataSet['ID_MAN']
     else ID_MAN := -1;
    TypeRoom_Selecter_DataSet.Close;
   end;

  if ViewMode then
   begin
    Caption:='Просмотр';
    OkButton.Visible:=false;
    cxGroupBox2.Enabled:=false;
    cxGroupBox7.Enabled:=false;
    cxGroupBox9.Enabled:=false;
    cxGroupBox10.Enabled:=false;
    cxGroupBox8.Enabled:=false;
    // на гриде
    cxGroupBox1.Enabled:=false;
    cxGroupBox4.Enabled:=false;
    cxGroupBox5.Enabled:=false;
    cxGroupBox6.Enabled:=false;
    cxGroupBox3.Enabled:=false;
    cxGroupBox11.Enabled:=false;

    Ok_Action.Enabled:=false;
   end;

  if cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7] <> null
   then Full_Build_Label.Caption:=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7];

  if cxGridTableView2.DataController.RecordCount = 0
   then Sub_Type_Label.Caption:='';

  if cxGridTableView3.DataController.RecordCount = 0
   then Lgot_Full_Label.Caption:='';

  if cxGrid1TableView1.DataController.RecordCount <> 0 then
   begin
    Insost_EditButton.Enabled:= true;
    Insost_DeleteButton.Enabled:= true;
   end;

  Inostranez_Redact:=Inostranez_CheckBox.Checked;
  Propiska_Redact:= Propiska_CheckBox.Checked;
  Propusk_Redact:=Propusk_CheckBox.Checked;
  Date_Born_Redact:=  DateBorn_Edit.Date;
  Dogovor_DateEdit_Redact := Dogovor_DateEdit.Date;
  Kurs_Redact:= Kurs_ComboBox.Text;
  Familia_Reduct:= Familia_Edit.Text;
  Name_Redact:=  Name_Edit.Text;
  Otch_Redact:=  Otch_Edit.Text;
  Pol_Redact:= Pol_ComboBox.Text;
  Nomer_Dogovora_Redact:=  Nomer_Dogovora.Text;
  Tabel_Edit_Redact:= Tabel_Edit.Text;
  Nalog_Edit_Redact:= Nalog_Edit.Text;
  Familia_UKR_Reduct:= Familia_Ukr.Text;
  Name_UKR_Redact:=Name_Ukr.Text;
  Otch_UKR_Redact:=Otch_Ukr.Text;
  Id_department_Redact :=Id_department;
  id_group_Redact:=id_group;
  id_spec_Redact:=id_spec;

  // проверяем факультеты
  Screen.Cursor:= crHourGlass;

  //проверяем парент на 199
  TypeRoom_Selecter_DataSet.SelectSQL.Clear;
  TypeRoom_Selecter_DataSet.SelectSQL.Text:='select FLAG from ST_IS_IT_FACULTY('+ inttostr(Id_Department)+')';
  TypeRoom_Selecter_DataSet.Open;
  if TypeRoom_Selecter_DataSet['FLAG']<>1 then
   begin   // убиваем группы и специальности, если парент <> 199
    Kurs_ComboBox.Visible:=false;
    Group_ComboBox.Visible:=false;
    Spec_ComboBox.Visible:=false;
    KursLabel.Visible:=false;
    GroupLabel.Visible:=false;
    SpecLabel.Visible:=false;
   end;

  TypeRoom_Selecter_DataSet.close;
  Screen.Cursor:= crDefault;

  if not ViewMode then Familia_edit.SetFocus;

  if Registration_Form.Subsidy_Edit then
   begin
    cxPageControl1.ActivePageIndex := 3; //субсидии
    cxGrid3.SetFocus;
   end;

  if Registration_Form.Lgots_Edit then
   begin
    cxPageControl1.ActivePageIndex := 4; //льгота
    cxGrid4.SetFocus;
   end;
end;

procedure TRegistration_Form_Add.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TRegistration_Form_Add.OkButtonClick(Sender: TObject);
var
  i, j: integer;
  flag_beg, flag_end, flag_error : Boolean;
begin
  //Основные данные
  if Familia_Edit.Text ='' then
   begin
    ShowMessage('Необходимо ввести фамилию!');
    Familia_Edit.SetFocus;
    exit;
   end;

  if Name_Edit.Text ='' then
   begin
    ShowMessage('Необходимо ввести имя!');
    Name_Edit.SetFocus;
    exit;
   end;

  if (Otch_Edit.Text ='') and not(Without_Otch_CheckBox.Checked) then
   begin
    ShowMessage('Необходимо ввести отчество!');
    Otch_Edit.SetFocus;
    exit;
   end;

  if DateBorn_Edit.Text = '' then
   begin
    ShowMessage('Необходимо ввести дату рождения!');
    DateBorn_Edit.SetFocus;
    exit;
   end;

  if Dogovor_DateEdit.Text = '' then
   begin
    ShowMessage('Необходимо ввести дату договора!');
    Dogovor_DateEdit.SetFocus;
    exit;
   end;

  if Nomer_Dogovora.Text ='' then
   begin
    ShowMessage('Необходимо ввести номер договора!');
    Nomer_Dogovora.SetFocus;
    exit;
   end;

  If Nalog_Edit.Text = '' then
   begin
    i := st_Common_Messages.stShowMessage(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex], 'ИНН не введен! Продолжить сохранение?', mtConfirmation, [mbYes, mbNo]);
    if ((i = 7) or (i= 2)) then
     Begin
      Nalog_Edit.SetFocus;
      exit;
     end;
    Nalog_Edit.Text := '-1';
   end;

  if ((Nalog_Edit.Text <> '') and (Nalog_Edit.Text <> '-1')) then
   if IntegerCheck(Nalog_Edit.Text) = false then
    begin
     ShowMessage('Идентификационный налоговый номер введен неверно!' + #13#10 + 'ИНН не целое число!');
     Nalog_Edit.SetFocus;
     exit;
    end;

  // проверка налогового номера - первых 5-ти цифр
  if DateBorn_Edit.Date <> StrToDate('01.01.1900') then
  if ((Nalog_Edit.Text <> '') and (Nalog_Edit.Text <> '-1')) then
  if NalogNomerChecker( Nalog_Edit.Text, DateBorn_Edit.Date)= false then
   begin
    ShowMessage('Идентификационный налоговый номер введен неверно!' + #13#10 + 'Не соответствие с датой рождения!');
    Nalog_Edit.SetFocus;
    exit;
   end;

  // проверка налогового номера на дублируемость в базе данных
  // если есть совпадения - месседж с номером и фамилией
  if  ((Nalog_Edit.Text <> '') and (Nalog_Edit.Text <> '-1')) then
   begin
    TypeRoom_Selecter_DataSet.Close;
    TypeRoom_Selecter_DataSet.SelectSQL.Clear;
    TypeRoom_Selecter_DataSet.SelectSQL.Text:='select * from ID_NALOG_CAN_DO(:number, :id_kod)';
    TypeRoom_Selecter_DataSet.ParamByName('number').AsString := Nalog_Edit.Text;
    TypeRoom_Selecter_DataSet.ParamByName('ID_KOD').AsInt64  := id_kod;
    TypeRoom_Selecter_DataSet.Open;
    if TypeRoom_Selecter_DataSet['Can']=0 then
     begin
      ShowMessage('Обнаружено совпадение. Данный налоговый номер уже используется: '+ TypeRoom_Selecter_DataSet['FIO_COMBO']+ ' - '+ Nalog_Edit.Text);
      TypeRoom_Selecter_DataSet.Close;
      Nalog_Edit.SetFocus;
      exit;
     end;
   end;
  TypeRoom_Selecter_DataSet.Close;
  if  Nalog_Edit.Text = '-1' then Nalog_Edit.Text := '';


  if cxGridTableView1.DataController.RecordCount = 0 then
   begin
    ShowMessage('Вкладка КАТЕГОРИИ: необходимо заполнить периоды (даты начала и окончания).');
    cxPageControl1.ActivePageIndex:=1;
    exit;
   end;

  if cxGridTableView_of_Live.DataController.RecordCount = 0 then
   begin
    ShowMessage('Вкладка Проживание: необходимо заполнить периоды (даты начала и окончания).');
    cxPageControl1.ActivePageIndex:=0;
    exit;
   end;

  If Categories_Lives_Hole_Check = false then
   begin
    ShowMessage('Вкладки ПРОЖИВАНИЕ и КАТЕГОРИИ: нарушена соответствие между периодами проживания и периодами категорий проживания. (Существуют " дыры "). Внесите изменения.');
    if cxPageControl1.ActivePageIndex = 0 then cxPageControl1.ActivePageIndex:=0 ;
    if cxPageControl1.ActivePageIndex = 1 then cxPageControl1.ActivePageIndex:=1
     else cxPageControl1.ActivePageIndex:=0 ;
    exit;
   end;

  //--проверка доп. услух-------------------------------------------------------
  flag_error := False;
  For i := 0 to cxGrid_dop_servTableView4.DataController.RecordCount - 1 do
   begin
    flag_beg := False;
    flag_end := False;
    for j := 0 to cxGridTableView_of_Live.DataController.RecordCount - 1 do
     begin
      If cxGrid_dop_servTableView4.DataController.Values[i, 1] >= cxGridTableView_of_Live.DataController.Values[j, 2] then flag_beg := True;
      If cxGrid_dop_servTableView4.DataController.Values[i, 2] <= cxGridTableView_of_Live.DataController.Values[j, 3] then flag_end := True;
     end;
    if not flag_beg or not flag_end then flag_error := True;
   end;

  If flag_error then
   begin
    ShowMessage('Період дії додаткової послуги виходить за період проживання!!!');
    cxPageControl1.ActivePageIndex := 2;
    Exit;
   end;

  // проверка пересечений по типам льгот
 if cxGridTableView3.DataController.RecordCount <>0 then
  if Lgota_Type_No_Cross=false then exit;

 // проверка входящего остатка
 if ((cxGrid1TableView1.DataController.RecordCount=0) and (SummaEdit.Value<>0)) then
 begin
 ShowMessage('Для суммы входящего остатка необходимо внести источники финансирования.');
 cxPageControl1.ActivePageIndex:=7;
 cxGrid5.SetFocus;
 exit;
 end;
 if (abs (Sum_Result.Value-SummaEdit.Value)> 0.00001) then
 begin
 ShowMessage('Сумма входящего остатка должна равняться сумме по всем источникам финансирования.');
 cxPageControl1.ActivePageIndex:=7;
 cxGrid5.SetFocus;
 exit;
 end;

  if ((Group_ComboBox.ItemIndex <>-1)and (Group_ComboBox.Visible)) then
   begin
    TypeRoom_Selecter_DataSet.SelectSQL.Clear;
    TypeRoom_Selecter_DataSet.SelectSQL.Text:= 'select ID_GROUP from ST_GET_ID_GROUP_BY_NAME('+ IntToStr(Id_department) +
                                           ','+ kav + Group_ComboBox.Text + kav + ')';
    TypeRoom_Selecter_DataSet.Open;
    id_group:=TypeRoom_Selecter_DataSet['ID_GROUP'];
    TypeRoom_Selecter_DataSet.Close;
   end
  else id_group:=-1;

  if ((Spec_ComboBox.ItemIndex <>-1)and(Spec_ComboBox.Visible)) then
   begin
    TypeRoom_Selecter_DataSet.SelectSQL.Clear;
    TypeRoom_Selecter_DataSet.SelectSQL.Text:= 'select ID_SPECIALNOST from ST_GET_ID_SPEC_BY_NAME('+ kav + Spec_ComboBox.Text + kav + ')';
    TypeRoom_Selecter_DataSet.Open;
    id_spec:=TypeRoom_Selecter_DataSet['ID_SPECIALNOST'];
    TypeRoom_Selecter_DataSet.Close;
   end
  else id_spec:=-1;

  //проверка на необходимость менять информацию о проживающем относительно данных из справочника физ.лиц.
  If Change_inf then
   begin
    i := st_Common_Messages.stShowMessage(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex], 'Змінити інформацію проживаючого щодо паспорта, місце народження та адреси попереднього місця реєстрації?', mtConfirmation, [mbYes, mbNo, mbCancel]);
    case i of
     2 : Begin exit; End; //cancel
     6 : Begin Change_inf := true;  End;//yes
     7 : Begin change_inf := false; End;//no
    end;
   end;   

 Cursor := crSQLWait;
 
 ModalResult := mrOk;
end;

procedure TRegistration_Form_Add.Familia_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Name_Edit.SetFocus;
end;

procedure TRegistration_Form_Add.Otch_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then DateBorn_Edit.SetFocus;
end;

procedure TRegistration_Form_Add.DateBorn_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Pol_ComboBox.SetFocus;
end;

procedure TRegistration_Form_Add.Kurs_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
if Group_ComboBox.CanFocusEx then Group_ComboBox.SetFocus
else cxPageControl1.SetFocus;
end;

procedure TRegistration_Form_Add.Dogovor_DateEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Tabel_Edit.SetFocus;
end;

procedure TRegistration_Form_Add.Nomer_DogovoraKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Dogovor_DateEdit.SetFocus;
end;

procedure TRegistration_Form_Add.Tabel_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Nalog_Edit.SetFocus;
end;

procedure TRegistration_Form_Add.Nalog_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then Faculty_ButtonEdit.SetFocus;
end;

procedure TRegistration_Form_Add.Name_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Otch_Edit.SetFocus;
end;

procedure TRegistration_Form_Add.Familia_UkrKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Name_Ukr.SetFocus;
end;

procedure TRegistration_Form_Add.Name_UkrKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Otch_Ukr.SetFocus;
end;


procedure TRegistration_Form_Add.AddButtonClick(Sender: TObject);
var
  i: integer;
  ActionStr : string;
begin
  ActionStr:= st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  Registration_Date_Add_Form_2 := TRegistration_Date_Add_Form_2.Create(Self);
  Registration_Date_Add_Form_2.Caption := ActionStr;

  if cxGridTableView1.DataController.RecordCount <> 0
   then Registration_Date_Add_Form_2.DateBegEdit.Date := cxGridTableView1.DataController.Values[0, 2];

  if Registration_Date_Add_Form_2.ShowModal = mrOK then
   begin
    cxGridTableView1.DataController.RecordCount := cxGridTableView1.DataController.RecordCount + 1;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 0] := Registration_Date_Add_Form_2.Category_ButtonEdit.Text;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 1] := Registration_Date_Add_Form_2.DateBegEdit.Date;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 2] := Registration_Date_Add_Form_2.DateEndEdit.Date;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 3] := Registration_Date_Add_Form_2.ID_Category;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 4] := Registration_Date_Add_Form_2.Short_Name_Category;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 5] := '1';

    TypeRoom_Selecter_DataSet.Close;
    TypeRoom_Selecter_DataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_KAT_SUM_BY_PERIOD(:id_kod, :date_beg, :date_end)';
    TypeRoom_Selecter_DataSet.ParamByName('id_kod').AsInt64  := Registration_Date_Add_Form_2.ID_Category;
    TypeRoom_Selecter_DataSet.ParamByName('date_beg').AsDate := Registration_Date_Add_Form_2.DateBegEdit.Date;
    TypeRoom_Selecter_DataSet.ParamByName('date_end').AsDate := Registration_Date_Add_Form_2.DateEndEdit.Date;
    TypeRoom_Selecter_DataSet.Open;
    if TypeRoom_Selecter_DataSet['PAY_SUM'] <> null
     then cxGridTableView1.DataController.Values[cxGridTableView1.DataController.RecordCount - 1, 6] := TypeRoom_Selecter_DataSet['PAY_SUM'];

    EditButton.Enabled := true;
    DeleteButton.Enabled := true;
    SortGridData;

    for i:=0 to cxGridTableView1.DataController.RecordCount - 1 do
     if cxGridTableView1.DataController.Values[i, 5] = '1' then
      begin
       cxGridTableView1.DataController.FocusedRowIndex:=i;
       cxGridTableView1.DataController.Values[i, 5] := '';
       break;
      end;
   end;
  Registration_Date_Add_Form_2.Free;
end;

procedure TRegistration_Form_Add.FormCreate(Sender: TObject);
begin
  id_department_dop := -1;
  
  with  cxGridTableView_of_Live do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[4].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxIntegerValueType;;
    Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
   end;

  with  cxGridTableView1 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxFloatValueType;
   end;
  //доп услуги
  with  cxGrid_dop_servTableView4 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxSmallintValueType;
    Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxFloatValueType;
   end;

  //субсидии 
  with cxGridTableView2 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[7].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[8].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[9].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[10].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[11].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[12].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[13].DataBinding.ValueTypeClass := TcxIntegerValueType;
   end;

  with cxGridTableView3 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxSmallintValueType;
    Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[2].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[4].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[5].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[6].DataBinding.ValueTypeClass := TcxDateTimeValueType;
    Items[7].DataBinding.ValueTypeClass := TcxStringValueType;
   end;

  with cxGrid1TableView1 do
   begin
    Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
    Items[1].DataBinding.ValueTypeClass := TcxFloatValueType;
    Items[2].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[3].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[4].DataBinding.ValueTypeClass := TcxIntegerValueType;
    Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
   end;

  TypeRoom_Selecter_DataSet.Close;
  TypeRoom_Selecter_DataSet.SelectSQL.Clear;
  TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
  TypeRoom_Selecter_DataSet.Open;
  Cur_date:= TypeRoom_Selecter_DataSet['CUR_DATE'];
  TypeRoom_Selecter_DataSet.Close;

  Redact          := false;
  Redact_Live     := false;
  Redact_Category := false;
  Redact_dop_serv := False;
  Redact_Subs     := false;
  Redact_Lgot     := false;

  FormIniLanguage();

  ID_MAN:= -1;
  Change_inf := false;
end;

procedure TRegistration_Form_Add.EditButtonClick(Sender: TObject);
var
  ActionStr: string;
  i : integer;
begin
  ActionStr:= st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  Registration_Date_Add_Form_2 := TRegistration_Date_Add_Form_2.Create(Self);

  Registration_Date_Add_Form_2.Caption := ActionStr;
  Registration_Date_Add_Form_2.Category_ButtonEdit.Text:=cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 0];
  Registration_Date_Add_Form_2.DateBegEdit.Date := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 1];
  Registration_Date_Add_Form_2.DateEndEdit.Date := cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2];
  Registration_Date_Add_Form_2.ID_Category:= cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 3];
  Registration_Date_Add_Form_2.Short_Name_Category:= cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4];
  Registration_Date_Add_Form_2.Full_Cat_Label.Caption:=cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4];

  if Registration_Date_Add_Form_2.ShowModal = mrOK then
   begin
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 0] := Registration_Date_Add_Form_2.Category_ButtonEdit.Text;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 1] := Registration_Date_Add_Form_2.DateBegEdit.Date;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 2] := Registration_Date_Add_Form_2.DateEndEdit.Date;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 3] := Registration_Date_Add_Form_2.ID_Category;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4] := Registration_Date_Add_Form_2.Short_Name_Category;
    cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 5] := '1';

    TypeRoom_Selecter_DataSet.Close;
    TypeRoom_Selecter_DataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_SUM_BY_PERIOD(:id_kod, :date_beg, :date_end)';
    TypeRoom_Selecter_DataSet.ParamByName('id_kod').AsInt64  := id_kod;//Registration_Date_Add_Form_2.ID_Category;;
    TypeRoom_Selecter_DataSet.ParamByName('date_beg').AsDate := Registration_Date_Add_Form_2.DateBegEdit.Date;
    TypeRoom_Selecter_DataSet.ParamByName('date_end').AsDate := Registration_Date_Add_Form_2.DateEndEdit.Date;
    TypeRoom_Selecter_DataSet.Open;
    if TypeRoom_Selecter_DataSet['PAY_SUM'] <> null
     then cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 6] := TypeRoom_Selecter_DataSet['PAY_SUM'];

    SortGridData;

    for i:=0 to cxGridTableView1.DataController.RecordCount - 1 do
     if  cxGridTableView1.DataController.Values[i, 5] = '1' then
      begin
       cxGridTableView1.DataController.FocusedRowIndex:=i;
       cxGridTableView1.DataController.Values[i, 5] := '';
       break;
      end;
     Full_Cat_Label.Caption:=cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4];
   end;
  Registration_Date_Add_Form_2.Free;
end;

procedure TRegistration_Form_Add.DeleteButtonClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  cxGridTableView1.DataController.DeleteFocused;
  cxGridTableView1.DataController.FocusedRowIndex := cxGridTableView1.DataController.RecordCount - 1;
  if cxGridTableView1.DataController.RecordCount = 0 then
   begin
    Full_Cat_Label.Caption := '';
    EditButton.Enabled := false;
    DeleteButton.Enabled := false;
   end;

  Redact_Category:=True;
end;

procedure TRegistration_Form_Add.Live_AddButtonClick(Sender: TObject);
var
 ActionStr : string;
  i:integer;
begin
  ActionStr := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  Registration_Date_Add_Form := TRegistration_Date_Add_Form.Create(Self);
  Registration_Date_Add_Form.Caption := ActionStr;
  if cxGridTableView_of_Live.DataController.RecordCount <> 0
   then Registration_Date_Add_Form.DateBegEdit.Date := cxGridTableView_of_Live.DataController.Values[0, 3];
  if Registration_Date_Add_Form.ShowModal = mrOK then
   begin
    cxGridTableView_of_Live.DataController.RecordCount := cxGridTableView_of_Live.DataController.RecordCount + 1;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 0] := Registration_Date_Add_Form.TypeEdit.Text;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 1] := Registration_Date_Add_Form.ComboRoom;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 2] := Registration_Date_Add_Form.DateBegEdit.Date;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 3] := Registration_Date_Add_Form.DateEndEdit.Date;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 4] := Registration_Date_Add_Form.Id_Build;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 5] := Registration_Date_Add_Form.Nomer_Komnat_Edit.Text;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 6] := Registration_Date_Add_Form.Id_Type_Room;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 7] := Registration_Date_Add_Form.Short_Name_Build ;
    cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.RecordCount - 1, 8] := '1';
    Live_EditButton.Enabled   := true;
    Live_DeleteButton.Enabled := true;
    SortGridData_Live;
    for i:=0 to cxGridTableView_of_Live.DataController.RecordCount - 1 do
     if  cxGridTableView_of_Live.DataController.Values[i, 8] = '1' then
      begin
       cxGridTableView_of_Live.DataController.FocusedRowIndex:=i;
       cxGridTableView_of_Live.DataController.Values[i, 8] := '';
       break;
      end;
   end;
  Registration_Date_Add_Form.Free;
end;

procedure TRegistration_Form_Add.Live_EditButtonClick(Sender: TObject);
var ActionStr: string;
i: integer;
begin
 ActionStr:= st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 Registration_Date_Add_Form := TRegistration_Date_Add_Form.Create(Self);
 Registration_Date_Add_Form.Caption := ActionStr;

  Registration_Date_Add_Form.ReadDataSet.SelectSQL.Clear;
  Registration_Date_Add_Form.ReadDataSet.SelectSQL.Text := 'select * from st_DT_pfio_type_room_select(' + inttostr(cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 6]) + ')';
  Registration_Date_Add_Form.ReadDataSet.Open;
 for i:=0 to Registration_Date_Add_Form.Type_Room_ComboBox.Properties.Items.Count-1 do begin
if Registration_Date_Add_Form.Type_Room_ComboBox.Properties.Items[i]= Registration_Date_Add_Form.ReadDataSet['NAME_TYPE_ROOM']
then Registration_Date_Add_Form.Type_Room_ComboBox.ItemIndex:=i;
 end;
 Registration_Date_Add_Form.ReadDataSet.Close;

 Registration_Date_Add_Form.TypeEdit.Text:=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 0];
 Registration_Date_Add_Form.Nomer_Komnat_Edit.Text:=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 5];
 Registration_Date_Add_Form.DateBegEdit.Date := cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 2];
 Registration_Date_Add_Form.DateEndEdit.Date := cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 3];
 Registration_Date_Add_Form.Id_Build :=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 4];
 Registration_Date_Add_Form.Id_Type_Room :=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 6];
 Registration_Date_Add_Form.Short_Name_Build:=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7];
 Registration_Date_Add_Form.ComboRoom:=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 1];
 if Registration_Date_Add_Form.ShowModal = mrOK then begin
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 0] := Registration_Date_Add_Form.TypeEdit.Text;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 1] := Registration_Date_Add_Form.ComboRoom;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 2] := Registration_Date_Add_Form.DateBegEdit.Date;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 3] := Registration_Date_Add_Form.DateEndEdit.Date;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 4] := Registration_Date_Add_Form.Id_Build;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 5] := Registration_Date_Add_Form.Nomer_Komnat_Edit.Text;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 6] := Registration_Date_Add_Form.Id_Type_Room;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7] := Registration_Date_Add_Form.Short_Name_Build ;
  cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 8] := '1';
  SortGridData_Live;
  for i:=0 to cxGridTableView_of_Live.DataController.RecordCount - 1 do
 if  cxGridTableView_of_Live.DataController.Values[i, 8] = '1' then
 begin
 cxGridTableView_of_Live.DataController.FocusedRowIndex:=i;
 cxGridTableView_of_Live.DataController.Values[i, 8] := '';
 break;
 end;
   Full_Build_Label.Caption:= cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7];
  end;
 Registration_Date_Add_Form.Free;
end;

procedure TRegistration_Form_Add.Live_DeleteButtonClick(Sender: TObject);
begin
if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
cxGridTableView_of_Live.DataController.DeleteFocused;
cxGridTableView_of_Live.DataController.FocusedRowIndex:=cxGridTableView_of_Live.DataController.RecordCount - 1;
 if cxGridTableView_of_Live.DataController.RecordCount = 0 then begin
  Full_Build_Label.Caption:='';
  Live_EditButton.Enabled := false;
  Live_DeleteButton.Enabled := false;
end;
//RedactTrue;
Redact_Live:=True;
end;

procedure TRegistration_Form_Add.cxGridTableView_of_LiveFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7] <> null then
Full_Build_Label.Caption:=cxGridTableView_of_Live.DataController.Values[cxGridTableView_of_Live.DataController.FocusedRecordIndex, 7];
end;

procedure TRegistration_Form_Add.cxGridTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4] <> null
   then Full_Cat_Label.Caption:=cxGridTableView1.DataController.Values[cxGridTableView1.DataController.FocusedRecordIndex, 4];
end;

procedure TRegistration_Form_Add.Sub_AddButtonClick(Sender: TObject);
var
 i: integer;
 ActionStr : string;

 procedure PfSub_Default_Subsidy_On_Add;
 var
  Beg_Date : Tdatetime;
  Max_period :integer;
  Max_period_date: Tdatetime;
 begin
  Beg_Date:= EncodeDate(strtoint(FormatDateTime('yyyy', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP)),strtoint(FormatDateTime('mm', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP)), 1) ;
  PfSub_Add_Form.DateBegEdit.date:= Beg_Date;
  PfSub_Add_Form.ReadDataSet.Close;
  PfSub_Add_Form.ReadDataSet.SelectSQL.Clear;
  PfSub_Add_Form.ReadDataSet.SelectSQL.Text:='select * from ST_DT_PFSUB_DEFAULT_DATE_ADD ('+ inttostr(PfSub_Add_Form.ID_SUBSIDY)+ ')';
  PfSub_Add_Form.ReadDataSet.Open;
  Max_period:= PfSub_Add_Form.ReadDataSet['Max_period'];
  PfSub_Add_Form.ReadDataSet.Close;
  if (strtoint(FormatDateTime('mm', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP))+ Max_period <= 12)
   then Max_period_date:=EncodeDate(strtoint(FormatDateTime('yyyy', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP)), strtoint(FormatDateTime('mm', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP))+Max_period , 1) ;
  if (strtoint(FormatDateTime('mm', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP))+ Max_period > 12)
   then Max_period_date:=EncodeDate(strtoint(FormatDateTime('yyyy', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP))+1,strtoint(FormatDateTime('mm', DataModule1_Unit.DataModule1.CURRENT_TIMESTAMP))+Max_period - 12, 1) ;
  PfSub_Add_Form.DateEndEdit.Date:= Max_period_date ;
 end;
 
begin
  if AccessResult.ID_User <> -999
   then if fibCheckPermission('/ROOT/Studcity/List_Subs','Add') <> 0
         then
          Begin
           messagebox(handle,
           pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
           +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
           pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
           exit;
          end;

  TypeRoom_Selecter_DataSet.SelectSQL.Clear;
  TypeRoom_Selecter_DataSet.SelectSQL.text:='select RESULT from ST_DOCHECKORNOT_PASP';
  TypeRoom_Selecter_DataSet.open;
  If TypeRoom_Selecter_DataSet['RESULT'] = 1
   then
    begin
     TypeRoom_Selecter_DataSet.close;
     TypeRoom_Selecter_DataSet.SelectSQL.Clear;
     TypeRoom_Selecter_DataSet.SelectSQL.text:='select RESULT from ST_PASP_CONTROL('+inttostr(id_kod)+')';
     TypeRoom_Selecter_DataSet.open;
     if TypeRoom_Selecter_DataSet['RESULT'] = 0
      then
       begin
        TypeRoom_Selecter_DataSet.close;
        showmessage('Отсутствуют паспортные данные. Внесение периодов субсидий невозможно.');
        exit;
       end;
     TypeRoom_Selecter_DataSet.close;
    end;
  TypeRoom_Selecter_DataSet.close;

  ActionStr:= st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  PfSub_Add_Form := TPfSub_Add_Form.Create(Self);
  PfSub_Add_Form.Caption:= ActionStr;
  PfSub_Add_Form.Label1.Visible:=true;
  PfSub_Add_Form.Month_Edit.Visible:=true;
  PfSub_Add_Form.Month_Edit.Text:='0';
  PfSub_Add_Form.Month_Edit.Visible:=false;
  PfSub_Add_Form.Label1.Visible:=false;
  PfSub_Add_Form.Summa_Edit.Text:='0';
  PfSub_Default_Subsidy_On_Add;

  if PfSub_Add_Form.ShowModal = mrOK then
   begin
    cxGridTableView2.DataController.RecordCount := cxGridTableView2.DataController.RecordCount + 1;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 0]  := PfSub_Add_Form.serves_ButtonEdit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 1]  := PfSub_Add_Form.DateBegEdit.Date;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 2]  := PfSub_Add_Form.DateEndEdit.Date;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 3]  := PfSub_Add_Form.Summa_Edit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 4]  := PfSub_Add_Form.Month_Edit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 5]  := PfSub_Add_Form.Sub_State_ComboBox.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 6]  := PfSub_Add_Form.ID_SUBSIDY;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 7]  := PfSub_Add_Form.ID_STATE;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 8]  := PfSub_Add_Form.Comment_Edit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 9]  := PfSub_Add_Form.fullname;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 10] := PfSub_Add_Form.TypeEdit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 11] := '1';
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 12] := -999; // новый ид_кей
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.RecordCount - 1, 13] := PfSub_Add_Form.id_serves;

    Sub_EditButton.Enabled := true;
    Sub_DeleteButton.Enabled := true;
    SortGridData_Subsidy;
    for i:=0 to cxGridTableView2.DataController.RecordCount - 1 do
     if  cxGridTableView2.DataController.Values[i, 11] = '1'
      then
       begin
        cxGridTableView2.DataController.FocusedRowIndex:=i;
        cxGridTableView2.DataController.Values[i, 11] := '';
        break;
       end;
    Sub_Type_Label.Caption:=cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 9];
   end;
end;

procedure TRegistration_Form_Add.cxGridTableView2FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 9] <> null
   then Sub_Type_Label.Caption:=cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 9];
end;

procedure TRegistration_Form_Add.Sub_EditButtonClick(Sender: TObject);
var
  ActionStr : string;
  i : integer;
begin
  if AccessResult.ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/List_Subs','Edit') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  ActionStr:=st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  PfSub_Add_Form := TPfSub_Add_Form.Create(Self);

  PfSub_Add_Form.Caption := ActionStr;
  PfSub_Add_Form.Label1.Visible:=false;
  PfSub_Add_Form.Month_Edit.Visible:=false;

  PfSub_Add_Form.TypeEdit.Text:=cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 10];
  PfSub_Add_Form.serves_ButtonEdit.Text := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 0];
  PfSub_Add_Form.DateBegEdit.Date := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 1];
  PfSub_Add_Form.DateEndEdit.Date := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 2];
  PfSub_Add_Form.Month_Edit.Text:=cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 4];
  PfSub_Add_Form.Summa_Edit.Text:=cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 3];

  if cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 8] <> null
   then PfSub_Add_Form.Comment_Edit.Text := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 8];

  For i:=0 to PfSub_Add_Form.Sub_State_ComboBox.Properties.Items.Count-1 do
   begin
    if PfSub_Add_Form.Sub_State_ComboBox.Properties.Items[i] = cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 5]
     then PfSub_Add_Form.Sub_State_ComboBox.ItemIndex := i;
   end;

  PfSub_Add_Form.ID_SUBSIDY := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 6];
  PfSub_Add_Form.ID_STATE   := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 7];
  PfSub_Add_Form.fullname   := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 9];
  PfSub_Add_Form.id_serves  := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 13];

  if PfSub_Add_Form.ShowModal = mrOK then
   begin
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 0] := PfSub_Add_Form.serves_ButtonEdit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 1] := PfSub_Add_Form.DateBegEdit.Date;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 2] := PfSub_Add_Form.DateEndEdit.Date;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 3] := PfSub_Add_Form.Summa_Edit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 4] := PfSub_Add_Form.Month_Edit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 5] := PfSub_Add_Form.Sub_State_ComboBox.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 6] := PfSub_Add_Form.ID_SUBSIDY;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 7] := PfSub_Add_Form.ID_STATE;

    if PfSub_Add_Form.Comment_Edit.Text <> ''
     then cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 8] := PfSub_Add_Form.Comment_Edit.Text;

    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 9]  := PfSub_Add_Form.fullname;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 10] := PfSub_Add_Form.TypeEdit.Text;
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 11] := '1';
    cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 13] := PfSub_Add_Form.id_serves;

    SortGridData_Subsidy;
    For i:=0 to cxGridTableView2.DataController.RecordCount - 1 do
     if  cxGridTableView2.DataController.Values[i, 11] = '1' then
      begin
       cxGridTableView2.DataController.FocusedRowIndex:=i;
       cxGridTableView2.DataController.Values[i, 11] := '';
       break;
      end;
    Sub_Type_Label.Caption := cxGridTableView2.DataController.Values[cxGridTableView2.DataController.FocusedRecordIndex, 9];
   end;
   
  PfSub_Add_Form.Free;
end;

procedure TRegistration_Form_Add.Sub_DeleteButtonClick(Sender: TObject);
begin
  if AccessResult.ID_User <> -999 then
   if fibCheckPermission('/ROOT/Studcity/List_Subs','Del') <> 0 then
    begin
     messagebox(handle,
     pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
     +#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
     pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
     exit;
    end;

  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  cxGridTableView2.DataController.DeleteFocused;
  cxGridTableView2.DataController.FocusedRowIndex := cxGridTableView2.DataController.RecordCount - 1;

  if cxGridTableView2.DataController.RecordCount = 0 then
   begin
    Sub_Type_Label.Caption   := '';
    Sub_EditButton.Enabled   := False;
    Sub_DeleteButton.Enabled := False;
   end;

  Redact_Subs:=True;
end;

procedure TRegistration_Form_Add.Lg_AddButtonClick(Sender: TObject);
var
 ActionStr : string;
 i:integer;
begin
 if AccessResult.ID_User <> -999 then
if fibCheckPermission('/ROOT/Studcity/List_Lgotniki','Add') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;

 ActionStr:=st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 PfLg_Add_Form := TPfLg_Add_Form.Create(Self);
 PfLg_Add_Form.is_admin := is_admin;
 PfLg_Add_Form.Caption:= ActionStr; 
 if cxGridTableView3.DataController.RecordCount <> 0 then PfLg_Add_Form.DateBegEdit.Date := cxGridTableView3.DataController.Values[0, 2];
 if PfLg_Add_Form.ShowModal = mrOK then begin
  cxGridTableView3.DataController.RecordCount := cxGridTableView3.DataController.RecordCount + 1;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 0] := PfLg_Add_Form.TypeEdit.Text;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 1] := PfLg_Add_Form.DateBegEdit.Date;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 2] := PfLg_Add_Form.DateEndEdit.Date;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 3] := PfLg_Add_Form.ID_LG;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 4] := PfLg_Add_Form.fullname;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 5] := '1';
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 6] := PfLg_Add_Form.DataPrikaza_Edit.Date;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.RecordCount - 1, 7] := PfLg_Add_Form.NomerPrikaza_Edit.Text;
  Lg_EditButton.Enabled := true;
  Lg_DeleteButton.Enabled := true;
  SortGridData_Lg;
 for i:=0 to cxGridTableView3.DataController.RecordCount - 1 do
 if  cxGridTableView3.DataController.Values[i, 5] = '1' then
 begin
 cxGridTableView3.DataController.FocusedRowIndex:=i;
 cxGridTableView3.DataController.Values[i, 5] := '';
 break;
 end;
  Lgot_Full_Label.Caption:=cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4];
 end;
end;

procedure TRegistration_Form_Add.Lg_EditButtonClick(Sender: TObject);
var ActionStr: string;
i:integer;
begin
 if AccessResult.ID_User <> -999 then
if fibCheckPermission('/ROOT/Studcity/List_Lgotniki','Edit') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;

ActionStr:='Изменение';
 PfLg_Add_Form := TPfLg_Add_Form.Create(Self);
 PfLg_Add_Form.OKButton.Caption := 'Принять';
 PfLg_Add_Form.is_admin := is_admin;
 PfLg_Add_Form.ReadDataSet.SelectSQL.Clear;
 PfLg_Add_Form.ReadDataSet.Close;
 PfLg_Add_Form.ReadDataSet.SelectSQL.Text := 'select * from ST_PFLGOT_NUMLGOT_SELECT('+ inttostr(cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 3])+')';
 PfLg_Add_Form.ReadDataSet.Open;
 PfLg_Add_Form.TypeEdit.Text:= PfLg_Add_Form.ReadDataSet['Num_lg'] ;
 PfLg_Add_Form.ReadDataSet.Close;
 PfLg_Add_Form.Full_LG_Label.Caption:=cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4];
 PfLg_Add_Form.DateBegEdit.Date := cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 1];
 PfLg_Add_Form.DateEndEdit.Date := cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 2];
 PfLg_Add_Form.ID_LG:= cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 3];
 PfLg_Add_Form.fullname:= cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4];
 if cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 6] <> null then
 PfLg_Add_Form.DataPrikaza_Edit.Date:= cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 6];
 if cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 7] <> null then
 PfLg_Add_Form.NomerPrikaza_Edit.Text:=cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 7];

 if PfLg_Add_Form.ShowModal = mrOK then begin
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 0] := PfLg_Add_Form.TypeEdit.Text;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 1] := PfLg_Add_Form.DateBegEdit.Date;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 2] := PfLg_Add_Form.DateEndEdit.Date;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 3] := PfLg_Add_Form.ID_LG;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4] := PfLg_Add_Form.fullname;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 6] :=  PfLg_Add_Form.DataPrikaza_Edit.Date;
  cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 7] :=  PfLg_Add_Form.NomerPrikaza_Edit.Text;
  SortGridData_Lg;

 for i:=0 to cxGridTableView3.DataController.RecordCount - 1 do
 if  cxGridTableView3.DataController.Values[i, 5] = '1' then
 begin
 cxGridTableView3.DataController.FocusedRowIndex:=i;
 cxGridTableView3.DataController.Values[i, 5] := '';
 break;
 end;

  Lgot_Full_Label.Caption:=cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4];
 end;
 PfLg_Add_Form.Free;
 end;


 procedure TRegistration_Form_Add.Lg_DeleteButtonClick(Sender: TObject);
begin
 if AccessResult.ID_User <> -999 then
if fibCheckPermission('/ROOT/Studcity/List_Lgotniki','Del') <> 0 then
begin
messagebox(handle,
pchar(st_ConstUnit.st_NotHaveRights[PLanguageIndex]
+#13+ st_ConstUnit.st_GoToAdmin[PLanguageIndex]),
pchar(st_ConstUnit.st_ActionDenied[PLanguageIndex]), MB_ICONWARNING or mb_Ok);
exit;
end;
if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
cxGridTableView3.DataController.DeleteFocused;
cxGridTableView3.DataController.FocusedRowIndex:=cxGridTableView3.DataController.RecordCount - 1;
 if cxGridTableView3.DataController.RecordCount = 0 then begin
  Lgot_Full_Label.Caption:='';
  Lg_EditButton.Enabled := false;
  Lg_DeleteButton.Enabled := false;
end;
//RedactTrue;
Redact_Lgot:=True;
end;

procedure TRegistration_Form_Add.cxGridTableView3FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
if cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4] <> null then
Lgot_Full_Label.Caption:=cxGridTableView3.DataController.Values[cxGridTableView3.DataController.FocusedRecordIndex, 4];
end;

procedure TRegistration_Form_Add.Redact_Check;
begin
with  Registration_Form_Add do begin
if    Inostranez_Redact <> Inostranez_CheckBox.Checked then Redact:=true;
if    Propiska_Redact   <> Propiska_CheckBox.Checked   then Redact:=true;
if    Propusk_Redact    <> Propusk_CheckBox.Checked    then Redact:=true;
if    Date_Born_Redact  <> DateBorn_Edit.Date          then Redact:=true;
if    Dogovor_DateEdit_Redact <> Dogovor_DateEdit.Date then Redact:=true;
if    Kurs_Redact       <> Kurs_ComboBox.Text          then Redact:=true;
if    Familia_Reduct    <> Familia_Edit.Text           then Redact:=true;
if    Name_Redact       <> Name_Edit.Text              then Redact:=true;
if    Otch_Redact       <> Otch_Edit.Text              then Redact:=true;
if    Pol_Redact        <> Pol_ComboBox.Text           then Redact:=true;
if    Nomer_Dogovora_Redact   <> Nomer_Dogovora.Text   then Redact:=true;
if    Tabel_Edit_Redact <> Tabel_Edit.Text             then Redact:=true;
if    Nalog_Edit_Redact <> Nalog_Edit.Text             then Redact:=true;
if    Familia_UKR_Reduct   <> Familia_Ukr.Text         then Redact:=true;
if    Name_UKR_Redact <> Name_Ukr.Text                 then Redact:=true;
if    Otch_UKR_Redact <> Otch_Ukr.Text                 then Redact:=true;
if    Id_department_Redact <> Id_department  then Redact:=true;
if    id_group_Redact <> id_group  then Redact:=true;
if    id_spec_Redact <> id_spec  then Redact:=true;
if    cur_work_place <> Cur_WorkPlace_TextEdit.Text then Redact:=true;
if    cur_posada <> Cur_Posada_TextEdit.Text then Redact:=true;

end;
end;



procedure TRegistration_Form_Add.cxGridTableView_of_LiveCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
Registration_Form_Add.Live_EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGridTableView1CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
Registration_Form_Add.EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGridTableView2CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
Registration_Form_Add.Sub_EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGridTableView3CellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
Registration_Form_Add.Lg_EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.Insost_AddButtonClick(Sender: TObject);
var
i: integer;
begin
 St_InsOst_Form := TSt_InsOst_Form.Create(Self);
 St_InsOst_Form.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 if St_InsOst_Form.ShowModal = mrok then begin
  cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 0] := St_InsOst_Form.Smeta_Edit.Text+'.'+St_InsOst_Form.Razdel_Edit.Text+'.'+ St_InsOst_Form.Stat_Edit.Text+'.'+St_InsOst_Form.Kekv_Edit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1] := St_InsOst_Form.SummaEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 2] := St_InsOst_Form.id_smeta;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 3] := St_InsOst_Form.id_razdel;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 4] := St_InsOst_Form.id_stat;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 5] := St_InsOst_Form.id_kekv;

  Sum_Result.Value:=0;
  for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do begin
  Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
  end;
  cxGrid1TableView1.DataController.FocusedRowIndex:=cxGrid1TableView1.DataController.RecordCount - 1;
  Insost_EditButton.Enabled := true;
   Insost_DeleteButton.Enabled := true;
 end;
 St_InsOst_Form.Free;
end;

procedure TRegistration_Form_Add.Insost_DeleteButtonClick(Sender: TObject);
var i: integer;
begin
if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
cxGrid1TableView1.DataController.DeleteFocused;
  Sum_Result.Value:=0;
  for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do begin
  Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
  end;
 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  Insost_EditButton.Enabled := false;
  Insost_DeleteButton.Enabled := false;
end;
end;

procedure TRegistration_Form_Add.Insost_EditButtonClick(Sender: TObject);
var
ActionStr:string;
i: integer;
begin
 ActionStr:=st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 Screen.Cursor:=crHourGlass;
 St_InsOst_Form := TSt_InsOst_Form.Create(Self);
 St_InsOst_Form.id_smeta:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2];
 St_InsOst_Form.id_razdel:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3];
 St_InsOst_Form.id_stat:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 4];
 St_InsOst_Form.id_kekv:= cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 5];
 St_InsOst_Form.Caption := ActionStr;
 // нужно пихнуть номера смет, разд... извлечь по ид
 TypeRoom_Selecter_DataSet.Close;
 TypeRoom_Selecter_DataSet.SelectSQL.Clear;
 TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(St_InsOst_Form.id_smeta)+ ','+kav+cur_date+kav+','+'1'+')';
 TypeRoom_Selecter_DataSet.Open;
 St_InsOst_Form.Smeta_Label.Caption:=TypeRoom_Selecter_DataSet['TITLE_OBJECT'] ;
 St_InsOst_Form.Smeta_Edit.Text:= TypeRoom_Selecter_DataSet['KOD_OBJECT'];
 TypeRoom_Selecter_DataSet.Close;

 TypeRoom_Selecter_DataSet.SelectSQL.Clear;
 TypeRoom_Selecter_DataSet.Close;
 TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(St_InsOst_Form.id_razdel)+ ','+ kav+ cur_date +kav+','+'2'+')';
 TypeRoom_Selecter_DataSet.Open;
 St_InsOst_Form.Razdel_Label.Caption:=TypeRoom_Selecter_DataSet['TITLE_OBJECT'] ;
 St_InsOst_Form.Razdel_Edit.Text:= TypeRoom_Selecter_DataSet['KOD_OBJECT'] ;
 TypeRoom_Selecter_DataSet.Close;

 TypeRoom_Selecter_DataSet.SelectSQL.Clear;
 TypeRoom_Selecter_DataSet.Close;
 TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select KOD_OBJECT, TITLE_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(St_InsOst_Form.id_stat)+ ','+ kav+ cur_date +kav+','+'3'+')';
 TypeRoom_Selecter_DataSet.Open;
 St_InsOst_Form.Stat_Label.Caption:=TypeRoom_Selecter_DataSet['TITLE_OBJECT'] ;
 St_InsOst_Form.Stat_Edit.Text:= TypeRoom_Selecter_DataSet['KOD_OBJECT'] ;
 TypeRoom_Selecter_DataSet.Close;

 TypeRoom_Selecter_DataSet.SelectSQL.Clear;
 TypeRoom_Selecter_DataSet.Close;
 TypeRoom_Selecter_DataSet.SelectSQL.Text := 'select KEKV_KODE, KEKV_TITLE from PUB_SPR_KEKV_INFO('+ inttostr(St_InsOst_Form.id_kekv)+ ','+ kav+ cur_date +kav+')';
 TypeRoom_Selecter_DataSet.Open;
 St_InsOst_Form.Kekv_Label.Caption:=TypeRoom_Selecter_DataSet['KEKV_TITLE'] ;
 St_InsOst_Form.Kekv_Edit.Text:= TypeRoom_Selecter_DataSet['KEKV_KODE'] ;
 TypeRoom_Selecter_DataSet.Close;

 St_InsOst_Form.SummaEdit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1];
 Screen.Cursor:=crDefault;
 if  St_InsOst_Form.ShowModal = mrOk then begin
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0] := St_InsOst_Form.Smeta_Edit.Text+'.'+St_InsOst_Form.Razdel_Edit.Text+'.'+ St_InsOst_Form.Stat_Edit.Text+'.'+St_InsOst_Form.Kekv_Edit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1] := St_InsOst_Form.SummaEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2] := St_InsOst_Form.id_smeta;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3] := St_InsOst_Form.id_razdel;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 4] := St_InsOst_Form.id_stat;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 5] := St_InsOst_Form.id_kekv;

  Sum_Result.Value:=0;
  for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do begin
  Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
  end;
  cxGrid1TableView1.DataController.FocusedRowIndex:=cxGrid1TableView1.DataController.FocusedRecordIndex;
  Insost_EditButton.Enabled := true;
  Insost_DeleteButton.Enabled := true;

  St_InsOst_Form.Free;
 end;
end;

procedure TRegistration_Form_Add.SummaEditKeyPress(Sender: TObject;
  var Key: Char);
  var
  i:integer;
  beg_date, kategoriya, ID_STAGE : string;
  MaxSum : Currency;
  MaxIndex : Integer;
  begin
if SummaEdit.Value = 0 then exit;
if key=#13 then begin
if cxGrid1TableView1.DataController.RecordCount<>0 then
for i:=cxGrid1TableView1.DataController.RecordCount-1 downto 0 do
cxGrid1TableView1.DataController.DeleteRecord(i);

Screen.Cursor:=crHourGlass;
TypeRoom_Selecter_DataSet.Close;
TypeRoom_Selecter_DataSet.SelectSQL.Clear;
TypeRoom_Selecter_DataSet.SelectSQL.Text:='select BEG_DATE , KATEGORIYA from ST_DT_INSOST_PFKAT_SELECT('+inttostr(id_kod)+')';
TypeRoom_Selecter_DataSet.Open;
beg_date:= TypeRoom_Selecter_DataSet['BEG_DATE'];
kategoriya:= TypeRoom_Selecter_DataSet['KATEGORIYA'];
TypeRoom_Selecter_DataSet.Close;

TypeRoom_Selecter_DataSet.Close;
TypeRoom_Selecter_DataSet.SelectSQL.Clear;
TypeRoom_Selecter_DataSet.SelectSQL.Text:='select ID_STAGE  from ST_SP_INSOST_KAT_SUM_SELECT('+kategoriya+','+kav+beg_date+kav+')';
TypeRoom_Selecter_DataSet.Open;
ID_STAGE:= TypeRoom_Selecter_DataSet['ID_STAGE'];
TypeRoom_Selecter_DataSet.Close;

TypeRoom_Selecter_DataSet.Close;
TypeRoom_Selecter_DataSet.SelectSQL.Clear;
TypeRoom_Selecter_DataSet.SelectSQL.Text:='select * from ST_SP_INSOST_KAT_SMET_SELECT('+ID_STAGE+')';
TypeRoom_Selecter_DataSet.Open;
TypeRoom_Selecter_DataSet.FetchAll;

for i:=0 to TypeRoom_Selecter_DataSet.RecordCount-1 do begin
 cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
 cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 0] := inttostr(TypeRoom_Selecter_DataSet['Nomer_sm'])+'.'+inttostr(TypeRoom_Selecter_DataSet['Nomer_razd'])+'.'+
                                                                                                 inttostr(TypeRoom_Selecter_DataSet['Nomer_st'])+'.'+inttostr(TypeRoom_Selecter_DataSet['Nomer_kekv']);
 cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1] := RoundTo(SummaEdit.Value*TypeRoom_Selecter_DataSet['PERCENT']/100, -2);
 cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 2] := TypeRoom_Selecter_DataSet['KOD_SM'];
 cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 3] := TypeRoom_Selecter_DataSet['KOD_RAZD'];;
 cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 4] := TypeRoom_Selecter_DataSet['KOD_ST'];;
 cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 5] := TypeRoom_Selecter_DataSet['KOD_KEKV'];;
 TypeRoom_Selecter_DataSet.Next;
end;
if cxGrid1TableView1.DataController.RecordCount<>0 then begin
 Insost_EditButton.Enabled:=true;
 Insost_DeleteButton.Enabled:=true;
end;

Sum_Result.Value:=0;
 for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do
 begin
  Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
 end;

 // проверяем на соответствие разбивки, если сумма не совпадает - ищем макс статью и кидаем разницу в нее
 if SummaEdit.Value <> Sum_Result.Value then
  begin
     MaxSum:= 0;
     MaxIndex:= -1;
    for i:= 0 to cxGrid1TableView1.DataController.RecordCount-1 do
     begin
       if Abs(cxGrid1TableView1.DataController.Values[i, 1]) > MaxSum then
         begin
           MaxSum := cxGrid1TableView1.DataController.Values[i, 1];
           MaxIndex := i;
         end;
     end;
      cxGrid1TableView1.DataController.Values[MaxIndex, 1] := cxGrid1TableView1.DataController.Values[MaxIndex, 1] + (SummaEdit.Value - Sum_Result.Value);

      Sum_Result.Value:=0;
      for i:=0 to  cxGrid1TableView1.DataController.RecordCount-1 do
       begin
        Sum_Result.Value:= Sum_Result.Value + cxGrid1TableView1.DataController.Values[i, 1];
       end;
  end;

 
 cxGrid5.SetFocus;
 cxGrid1TableView1.DataController.FocusedRowIndex:=cxGrid1TableView1.DataController.RecordCount - 1;
 TypeRoom_Selecter_DataSet.Close;
 screen.Cursor:=crDefault;
end;
end;

procedure TRegistration_Form_Add.cxTabSheet6Show(Sender: TObject);
begin
if cxGrid5.CanFocusEx then
cxGrid5.SetFocus;
if cxGrid1TableView1.DataController.RecordCount<>0 then
cxGrid1TableView1.DataController.FocusedRowIndex:=0;
if SummaEdit.CanFocusEx then
SummaEdit.SetFocus;
end;

procedure TRegistration_Form_Add.cxButton1Click(Sender: TObject);
var enter: char;
begin
enter:=#13;
Registration_Form_Add.SummaEditKeyPress(Sender, enter);
end;

procedure TRegistration_Form_Add.cxGrid1TableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TRegistration_Form_Add.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var qYESNOCANCEL: smallint;
    AllRedacts: boolean;
begin
  if ViewMode then exit;
  if  ModalResult=mrOk then exit;

  AllRedacts :=false;
  Redact_Check;

  if Redact = true then AllRedacts :=true;
  if Redact_Live = true then AllRedacts :=true;
  if Redact_Category = true then AllRedacts :=true;
  if Redact_dop_serv = true then AllRedacts :=true;
  if Redact_Subs = true then AllRedacts :=true;
  if Redact_Lgot = true then AllRedacts :=true;

  if AllRedacts = true then
   begin
    qYESNOCANCEL:=MessageBox(Handle,pchar(st_ConstUnit.st_SafeData[PLanguageIndex]),pchar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNOCANCEL or MB_ICONQUESTION);
    if qYESNOCANCEL= 2 then CanClose:=false;
    if qYESNOCANCEL= 6 then Registration_Form_Add.OkButtonClick(Sender);
    if qYESNOCANCEL= 7 then CanClose:=true;
   end
  else CanClose:=true;
end;

procedure TRegistration_Form_Add.Faculty_ButtonEditKeyPress(
  Sender: TObject; var Key: Char);
begin
if key = #13 then
if Kurs_ComboBox.Visible then Kurs_ComboBox.SetFocus
else cxPageControl1.SetFocus;
end;

procedure TRegistration_Form_Add.Faculty_ButtonEditExit(Sender: TObject);
  var
  i: integer;
  begin
Podrazdel_Label.Caption:='';
if Faculty_ButtonEdit.Text='' then exit;
with Registration_Form_Add do begin
if IntegerCheck(Faculty_ButtonEdit.Text)=false then
begin
ShowMessage('Номер подразделения введен неверно!');
Faculty_ButtonEdit.SetFocus;
exit;
end;
TypeRoom_Selecter_DataSet.Close;
TypeRoom_Selecter_DataSet.SelectSQL.Clear;
TypeRoom_Selecter_DataSet.SelectSQL.Text:='select * from ST_FACULTY_EXITCONTROL ( '+ Faculty_ButtonEdit.Text+ ')';
TypeRoom_Selecter_DataSet.Open;
if  TypeRoom_Selecter_DataSet['CODE_CORRECT']=0 then  begin
ShowMessage('Номер подразделения введен неверно, т.к. записи в базе данных "Студгородок" с указанным номером не существует.');
Faculty_ButtonEdit.SetFocus;
TypeRoom_Selecter_DataSet.Close;
exit;
end
else begin
Podrazdel_Label.Caption:= TypeRoom_Selecter_DataSet['NAME_FULL'] ;
id_department:= TypeRoom_Selecter_DataSet['id_department'];
end;
TypeRoom_Selecter_DataSet.Close;

Screen.Cursor:= crHourGlass;
     //проверяем парент на 199
      TypeRoom_Selecter_DataSet.SelectSQL.Clear;
      TypeRoom_Selecter_DataSet.SelectSQL.Text:='select FLAG from ST_IS_IT_FACULTY('+ inttostr(id_department)+')';
      TypeRoom_Selecter_DataSet.Open;

      if TypeRoom_Selecter_DataSet['FLAG']=1 then begin    // выбираем группы и специальности, если парент =199

            TypeRoom_Selecter_DataSet.Close;
            TypeRoom_Selecter_DataSet.SelectSQL.Clear;
            TypeRoom_Selecter_DataSet.SelectSQL.Text:='select ID_GROUP, GROUP_FULL_NAME from ST_GET_GROUP('+ inttostr(id_department)+')';
            TypeRoom_Selecter_DataSet.Open;
            TypeRoom_Selecter_DataSet.FetchAll;
            Group_ComboBox.Properties.Items.Clear;
             for i:=0 to TypeRoom_Selecter_DataSet.RecordCount-1 do begin
              Group_ComboBox.Properties.Items.Add(TypeRoom_Selecter_DataSet['GROUP_FULL_NAME'] );
              TypeRoom_Selecter_DataSet.Next;
            end;
            Group_ComboBox.ItemIndex:=-1;
            TypeRoom_Selecter_DataSet.Close;

            TypeRoom_Selecter_DataSet.SelectSQL.Clear;
            TypeRoom_Selecter_DataSet.SelectSQL.Text:='select ID_SPECIALNOST, NAME_SPEC from ST_GET_SPEC('+ inttostr(id_department)+')';
            TypeRoom_Selecter_DataSet.Open;
            TypeRoom_Selecter_DataSet.FetchAll;
            Spec_ComboBox.Properties.Items.Clear;
            for i:=0 to TypeRoom_Selecter_DataSet.RecordCount-1 do begin
              Spec_ComboBox.Properties.Items.Add(TypeRoom_Selecter_DataSet['NAME_SPEC'] );
              TypeRoom_Selecter_DataSet.Next;
            end;
            Spec_ComboBox.ItemIndex:=-1;
            TypeRoom_Selecter_DataSet.Close;

            GroupVisible(true);
      end
      else 
      GroupVisible(false);
Screen.Cursor:=crDefault;
TypeRoom_Selecter_DataSet.Close;

end;
end;

procedure TRegistration_Form_Add.Faculty_ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    sp: TSprav;
    i: integer;

begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DataModule1.DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 1;
                // единичная выборка
            FieldValues['Select'] := 1;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
       begin
    // выбираем код факультета

  Id_department:= sp.Output['Id_Department'];

       TypeRoom_Selecter_DataSet.SelectSQL.Clear;
       TypeRoom_Selecter_DataSet.SelectSQL.Text:='select DEPARTMENT_CODE from ST_GET_DEPARTMENT_CODE('+ inttostr(sp.Output['Id_Department'])+')';
       TypeRoom_Selecter_DataSet.Open;
       Faculty_ButtonEdit.Text:= TypeRoom_Selecter_DataSet['DEPARTMENT_CODE'];
       TypeRoom_Selecter_DataSet.Close;
       Podrazdel_Label.Caption:=sp.Output['Name_Full'];

     Screen.Cursor:= crHourGlass;
     //проверяем парент на 199
      TypeRoom_Selecter_DataSet.SelectSQL.Clear;
      TypeRoom_Selecter_DataSet.SelectSQL.Text:='select FLAG from ST_IS_IT_FACULTY('+ inttostr(sp.Output['Id_Department'])+')';
      TypeRoom_Selecter_DataSet.Open;

      if TypeRoom_Selecter_DataSet['FLAG']=1 then begin    // выбираем группы и специальности, если парент =199

            TypeRoom_Selecter_DataSet.Close;
            TypeRoom_Selecter_DataSet.SelectSQL.Clear;
            TypeRoom_Selecter_DataSet.SelectSQL.Text:='select ID_GROUP, GROUP_FULL_NAME from ST_GET_GROUP('+ inttostr(sp.Output['Id_Department'])+')';
            TypeRoom_Selecter_DataSet.Open;
            TypeRoom_Selecter_DataSet.FetchAll;
            Group_ComboBox.Clear;
            for i:=0 to TypeRoom_Selecter_DataSet.RecordCount-1 do begin
              Group_ComboBox.Properties.Items.Add(TypeRoom_Selecter_DataSet['GROUP_FULL_NAME'] );
              TypeRoom_Selecter_DataSet.Next;
            end;
            Group_ComboBox.ItemIndex:=-1;
            TypeRoom_Selecter_DataSet.Close;

            TypeRoom_Selecter_DataSet.SelectSQL.Clear;
            TypeRoom_Selecter_DataSet.SelectSQL.Text:='select ID_SPECIALNOST, NAME_SPEC from ST_GET_SPEC('+ inttostr(sp.Output['Id_Department'])+')';
            TypeRoom_Selecter_DataSet.Open;
            TypeRoom_Selecter_DataSet.FetchAll;
            Spec_ComboBox.Clear;
            for i:=0 to TypeRoom_Selecter_DataSet.RecordCount-1 do begin
              Spec_ComboBox.Properties.Items.Add(TypeRoom_Selecter_DataSet['NAME_SPEC'] );
              TypeRoom_Selecter_DataSet.Next;
            end;
            Spec_ComboBox.ItemIndex:=-1;
            TypeRoom_Selecter_DataSet.Close;
       sp.Free;
            GroupVisible(true);
      end
      else begin
      sp.Free;
      GroupVisible(false);
      end;
      Screen.Cursor:=crDefault;
  end  // если справочник вернул
  else  sp.Free;
TypeRoom_Selecter_DataSet.Close;
end;

procedure TRegistration_Form_Add.Action1Execute(Sender: TObject);
begin
Registration_Form_Add.OkButtonClick(Sender);
end;

procedure TRegistration_Form_Add.Ok_ActionExecute(Sender: TObject);
begin
Registration_Form_Add.OkButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGridTableView_of_LiveDblClick(
  Sender: TObject);
begin
if cxGridTableView_of_Live.DataController.RecordCount = 0 then exit;
Registration_Form_Add.Live_EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGridTableView1DblClick(Sender: TObject);
begin
  if cxGridTableView1.DataController.RecordCount = 0
   then exit;

  Registration_Form_Add.EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGridTableView2DblClick(Sender: TObject);
begin
if cxGridTableView2.DataController.RecordCount = 0 then exit;
Registration_Form_Add.Sub_EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGridTableView3DblClick(Sender: TObject);
begin
if cxGridTableView3.DataController.RecordCount = 0 then exit;
Registration_Form_Add.Lg_EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.cxGrid1TableView1DblClick(
  Sender: TObject);
begin
if cxGrid1TableView1.DataController.RecordCount = 0 then exit;
Registration_Form_Add.Insost_EditButtonClick(Sender);
end;

procedure TRegistration_Form_Add.Pol_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Inostranez_CheckBox.SetFocus;
end;

procedure TRegistration_Form_Add.Inostranez_CheckBoxKeyPress(
  Sender: TObject; var Key: Char);
begin
if Key = #13 then Propiska_CheckBox.SetFocus;
end;

procedure TRegistration_Form_Add.Propiska_CheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Propusk_CheckBox.SetFocus;
end;

procedure TRegistration_Form_Add.Propusk_CheckBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Nomer_Dogovora.SetFocus;
end;

procedure TRegistration_Form_Add.Group_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Spec_ComboBox.SetFocus;
end;

procedure TRegistration_Form_Add.Spec_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then
begin
cxPageControl1.SetFocus;
if cxGrid2.CanFocusEx then
cxGrid2.SetFocus;
end;
end;

procedure TRegistration_Form_Add.Add_ActionExecute(Sender: TObject);
begin
    if cxGrid2.IsFocused then
    begin
     Registration_Form_Add.Live_AddButtonClick(Sender);
     exit;
    end;    // проживание

    if cxGrid1.IsFocused then
    begin
     Registration_Form_Add.AddButtonClick(Sender);
     exit;
    end;   // категории

    if cxGrid3.IsFocused then
    begin
     Registration_Form_Add.Sub_AddButtonClick(Sender);
     exit;
    end;   // субсидии

    if cxGrid4.IsFocused then
    begin
     Registration_Form_Add.Lg_AddButtonClick(Sender);
     exit;
    end;  // льготы

    if cxGrid5.IsFocused then
    begin
     Registration_Form_Add.Insost_AddButtonClick(Sender);
     exit;
    end; // остаток
end;

procedure TRegistration_Form_Add.Edit_ActionExecute(Sender: TObject);
begin
    if cxGrid2.IsFocused then
    begin
    if cxGridTableView_of_Live.DataController.RecordCount = 0 then exit;
     Registration_Form_Add.Live_EditButtonClick(Sender);
     exit;
    end;    // проживание

    if cxGrid1.IsFocused then
    begin
        if cxGridTableView1.DataController.RecordCount = 0 then exit;
     Registration_Form_Add.EditButtonClick(Sender);
     exit;
    end;   // категории

    if cxGrid3.IsFocused then
    begin
     if cxGridTableView2.DataController.RecordCount = 0 then exit;
     Registration_Form_Add.Sub_EditButtonClick(Sender);
     exit;
    end;   // субсидии

    if cxGrid4.IsFocused then
    begin
      if cxGridTableView3.DataController.RecordCount = 0 then exit;
     Registration_Form_Add.Lg_EditButtonClick(Sender);
     exit;
    end;  // льготы

    if cxGrid5.IsFocused then
    begin
      if cxGrid1TableView1.DataController.RecordCount = 0 then exit;
     Registration_Form_Add.Insost_EditButtonClick(Sender);
     exit;
    end; // остаток
end;

procedure TRegistration_Form_Add.cxTabSheet1Show(Sender: TObject);
begin
  if cxGrid2.CanFocusEx
   then cxGrid2.SetFocus;
end;

procedure TRegistration_Form_Add.cxTabSheet2Show(Sender: TObject);
begin
if cxGrid1.CanFocusEx then
cxGrid1.SetFocus;
end;

procedure TRegistration_Form_Add.cxTabSheet4Show(Sender: TObject);
begin
if cxGrid3.CanFocusEx then
cxGrid3.SetFocus;
end;

procedure TRegistration_Form_Add.cxTabSheet5Show(Sender: TObject);
begin
if cxGrid4.CanFocusEx then
cxGrid4.SetFocus;
end;

procedure TRegistration_Form_Add.Otch_UkrKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then Cur_WorkPlace_TextEdit.SetFocus;
end;

procedure TRegistration_Form_Add.Cur_WorkPlace_TextEditKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then Cur_Posada_TextEdit.SetFocus;
end;

procedure TRegistration_Form_Add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Registration_Form.Lgots_Edit:=false;
Registration_Form.Subsidy_Edit:=false;
end;

procedure TRegistration_Form_Add.ApostrofExecute(Sender: TObject);
begin
if Familia_Edit.Focused then
 begin
   Familia_Edit.Text:= Familia_Edit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
 end;

if Name_Edit.Focused then
 begin
   Name_Edit.Text:= Name_Edit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
 end;

 if Otch_Edit.Focused then
 begin
   Otch_Edit.Text:= Otch_Edit.Text + '''';
   keybd_event(VK_END, 0, 0, GetMessageExtraInfo);
 end;
end;

procedure TRegistration_Form_Add.Familia_EditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Massiv: Variant;
begin
  Massiv := AllPeopleUnit.GetManForASUP(Self, DataModule1.DB.Handle, False, True, ID_MAN);

  if VarArrayDimCount(Massiv)>0 then
   begin
    ID_MAN := -1; // обнуление

    ID_MAN := Massiv[0];
    DisableControls(False);

    Familia_Edit.Text   := Massiv[5]; //Фамилия на рус
    Name_Edit.Text      := Massiv[6]; //Имя на рус
    Otch_Edit.Text      := Massiv[7]; //Отчество на рус

    Familia_Ukr.Text    := Massiv[2]; //Фамилия на рус
    Name_Ukr.Text       := Massiv[3]; //Имя на рус
    Otch_Ukr.Text       := Massiv[4]; //Отчество на рус

    If Massiv[8] <> null
     then DateBorn_Edit.Date  := Massiv[8]
     else DateBorn_Edit.Date  := StrToDate('01.01.1900');

    TypeRoom_Selecter_DataSet.Close;
    TypeRoom_Selecter_DataSet.SelectSQL.Clear;
    TypeRoom_Selecter_DataSet.SelectSQL.Text := 'SELECT * FROM ST_GET_SEX_PEOPLE_BY_ID(' + inttostr(ID_MAN)+ ')' ;
    TypeRoom_Selecter_DataSet.Open;

    if TypeRoom_Selecter_DataSet['ID_SEX'] = 1
     then Pol_ComboBox.ItemIndex := 0;

    if TypeRoom_Selecter_DataSet['ID_SEX'] = 2
     then Pol_ComboBox.ItemIndex := 1;

    TypeRoom_Selecter_DataSet.Close;

    If Massiv[9] > 0
     then Nalog_Edit.text  := Massiv[9]
     else Nalog_Edit.text  := '';
     
    DisableControls(False);

    Change_inf := True;
   end;
end;

procedure TRegistration_Form_Add.EditFizLizo_BtnClick(Sender: TObject);
begin
  if ID_MAN <> -1 then ShowManEditForm(Self,  DataModule1.DB.Handle , ID_MAN,  True);
end;

procedure TRegistration_Form_Add.ClearButtonClick(Sender: TObject);
begin
  Group_ComboBox.ItemIndex:= -1;
  Spec_ComboBox.ItemIndex := -1;
  Kurs_ComboBox.ItemIndex := -1;
end;

procedure TRegistration_Form_Add.Kurs_ComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key= vk_delete
  then Kurs_ComboBox.ItemIndex := -1;
end;

procedure TRegistration_Form_Add.Group_ComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key= vk_delete
  then Group_ComboBox.ItemIndex := -1;
end;

procedure TRegistration_Form_Add.Spec_ComboBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key= vk_delete
  then Spec_ComboBox.ItemIndex := -1;
end;

procedure TRegistration_Form_Add.btnSaveFIOClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Registration_Form.WriteProc.StoredProcName := 'ST_DT_PFIO_FIO_UPDATE';
  Registration_Form.WriteProc.Transaction.StartTransaction;
  Registration_Form.WriteProc.Prepare;
   Registration_Form.WriteProc.ParamByName('FAMILIA').AsString   := Familia_Edit.Text;
   Registration_Form.WriteProc.ParamByName('IMYA').AsString      := Name_Edit .Text;
   Registration_Form.WriteProc.ParamByName('OTCHESTVO').AsString := Otch_Edit.Text;
   Registration_Form.WriteProc.ParamByName('ID_KOD').AsInt64     := id_kod;
   Registration_Form.WriteProc.ExecProc;
  Registration_Form.WriteProc.Transaction.Commit;
  Screen.Cursor := crDefault;
end;

procedure TRegistration_Form_Add.Cur_WorkPlace_TextEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  sp: TSprav;
begin
  // создать справочник
  sp :=  GetSprav('SpDepartment');
  If sp <> nil then
   begin
    // заполнить входные параметры
    with sp.Input do
     begin
      Append;
      FieldValues['DBHandle'] := Integer(DataModule1.DB.Handle);
      // модальный показ
      FieldValues['ShowStyle'] := 0;
      // единичная выборка
      FieldValues['Select'] := 1;
      Post;
     end;
   end;
  // показать справочник и проанализировать результат (выбор одного подр.)
  sp.Show;

  If ( sp.Output <> nil ) and not sp.Output.IsEmpty then
   begin
    id_department_dop := sp.Output['Id_Department'];
    Cur_WorkPlace_TextEdit.Text := sp.Output['Name_Full'];
   end;

  sp.Free;
end;

procedure TRegistration_Form_Add.Cur_Posada_TextEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
{var
  ViewForm : TfrmPost_choose;
begin
 if id_department_dop = -1 then
   begin
    ShowMessage('Необхідно обрати підрозділ!!!');
    exit;
   end;

  ViewForm := TfrmPost_choose.Create(self);
  ViewForm.id_department_dop := id_department_dop;
  ViewForm.ShowModal;

  If ViewForm.ModalResult = mrOk then
   begin
    id_post_dop := ViewForm.id_post_dop;
    Cur_Posada_TextEdit.Text := ViewForm.name_post;
   end;
   
  ViewForm.Free; }
  var
  aParameter : TstSimpleParams;
  res : Variant;
begin

  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_sp_post.bpl', 'ShowSPPost');
  if VarArrayDimCount(res) <>0 then
   begin
     id_post_dop := res[0];
     Cur_Posada_TextEdit.Text    := res[1];
   end;

  aParameter.Free;
end;


procedure TRegistration_Form_Add.cxTabSheet7Show(Sender: TObject);
begin
  if cxGrid_dop_serv.CanFocusEx
   then cxGrid_dop_serv.SetFocus;
end;

procedure TRegistration_Form_Add.addButton_dop_servClick(
  Sender: TObject);
var
  i: integer;
  ActionStr : string;
begin
  ActionStr := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
  Registration_Date_Add_Form_2 := TRegistration_Date_Add_Form_2.Create(Self);
  Registration_Date_Add_Form_2.Caption := ActionStr;

  if cxGrid_dop_servTableView4.DataController.RecordCount <> 0
   then Registration_Date_Add_Form_2.DateBegEdit.Date := cxGrid_dop_servTableView4.DataController.Values[0, 2];

  if Registration_Date_Add_Form_2.ShowModal = mrOK then
   begin
    cxGrid_dop_servTableView4.DataController.RecordCount := cxGrid_dop_servTableView4.DataController.RecordCount + 1;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 0] := Registration_Date_Add_Form_2.Category_ButtonEdit.Text;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 1] := Registration_Date_Add_Form_2.DateBegEdit.Date;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 2] := Registration_Date_Add_Form_2.DateEndEdit.Date;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 3] := Registration_Date_Add_Form_2.ID_Category;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 4] := Registration_Date_Add_Form_2.Short_Name_Category;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 5] := '1';

    TypeRoom_Selecter_DataSet.Close;
    TypeRoom_Selecter_DataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_SUM_BY_PERIOD(:id_kod, :date_beg, :date_end)';
    TypeRoom_Selecter_DataSet.ParamByName('id_kod').AsInt64  := id_kod;//Registration_Date_Add_Form_2.ID_Category;;
    TypeRoom_Selecter_DataSet.ParamByName('date_beg').AsDate := Registration_Date_Add_Form_2.DateBegEdit.Date;
    TypeRoom_Selecter_DataSet.ParamByName('date_end').AsDate := Registration_Date_Add_Form_2.DateEndEdit.Date;
    TypeRoom_Selecter_DataSet.Open;
    if TypeRoom_Selecter_DataSet['PAY_SUM'] <> null
     then cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 6] := TypeRoom_Selecter_DataSet['PAY_SUM'];

    editbutton_dop_serv.Enabled := true;
    delButton_dop_serv.Enabled  := true;

    SortGridData_dop_Serv;

    for i:=0 to cxGrid_dop_servTableView4.DataController.RecordCount - 1 do
     if cxGrid_dop_servTableView4.DataController.Values[i, 5] = '1' then
      begin
       cxGrid_dop_servTableView4.DataController.FocusedRowIndex:=i;
       cxGrid_dop_servTableView4.DataController.Values[i, 5] := '';
       break;
      end;

    Redact_dop_serv := True;  
   end;
  Registration_Date_Add_Form_2.Free;
end;

procedure TRegistration_Form_Add.SortGridData_dop_serv;
var
  i : integer;
  temp_kod_category : Smallint;
  doNew : boolean;
  temp_date_beg, temp_date_end : TDate;
  temp_Kategoriya : integer;
  temp_flag, temp_SHORT_NAME_CATEGORY : string;
  temp_sum : Double;
begin
  if cxGrid_dop_servTableView4.DataController.RecordCount < 2 then exit;

  doNew := true;
  while doNew do
   begin
    doNew := false;
    for i := 0 to cxGrid_dop_servTableView4.DataController.RecordCount - 2 do
     begin
      if (cxGrid_dop_servTableView4.DataController.Values[i, 1] <= cxGrid_dop_servTableView4.DataController.Values[i + 1, 2]) and
         (cxGrid_dop_servTableView4.DataController.Values[i, 2] < cxGrid_dop_servTableView4.DataController.Values[i + 1, 2]) then
       begin
        temp_flag                :='';
        temp_kod_category        := cxGrid_dop_servTableView4.DataController.Values[i, 0];
        temp_date_beg            := cxGrid_dop_servTableView4.DataController.Values[i, 1];
        temp_date_end            := cxGrid_dop_servTableView4.DataController.Values[i, 2];
        temp_Kategoriya          := cxGrid_dop_servTableView4.DataController.Values[i, 3];
        temp_SHORT_NAME_CATEGORY := cxGrid_dop_servTableView4.DataController.Values[i, 4];
        temp_sum                 := cxGrid_dop_servTableView4.DataController.Values[i, 6];

        If cxGrid_dop_servTableView4.DataController.Values[i, 5] <> null then
         begin
          temp_flag := cxGrid_dop_servTableView4.DataController.Values[i, 5];
          cxGrid_dop_servTableView4.DataController.Values[i, 5]:= '';
         end;

        cxGrid_dop_servTableView4.DataController.Values[i, 0] := cxGrid_dop_servTableView4.DataController.Values[i + 1, 0];
        cxGrid_dop_servTableView4.DataController.Values[i, 1] := cxGrid_dop_servTableView4.DataController.Values[i + 1, 1];
        cxGrid_dop_servTableView4.DataController.Values[i, 2] := cxGrid_dop_servTableView4.DataController.Values[i + 1, 2];
        cxGrid_dop_servTableView4.DataController.Values[i, 3] := cxGrid_dop_servTableView4.DataController.Values[i + 1, 3];
        cxGrid_dop_servTableView4.DataController.Values[i, 4] := cxGrid_dop_servTableView4.DataController.Values[i + 1, 4];
        cxGrid_dop_servTableView4.DataController.Values[i, 6] := cxGrid_dop_servTableView4.DataController.Values[i + 1, 6];
        if cxGrid_dop_servTableView4.DataController.Values[i + 1, 5] <> null then
         begin
          cxGrid_dop_servTableView4.DataController.Values[i, 5] := cxGrid_dop_servTableView4.DataController.Values[i + 1, 5];
          cxGrid_dop_servTableView4.DataController.Values[i + 1, 5]:='';
         end;

        cxGrid_dop_servTableView4.DataController.Values[i + 1, 0] := temp_kod_category;
        cxGrid_dop_servTableView4.DataController.Values[i + 1, 1] := temp_date_beg;
        cxGrid_dop_servTableView4.DataController.Values[i + 1, 2] := temp_date_end;
        cxGrid_dop_servTableView4.DataController.Values[i + 1, 3] := temp_Kategoriya;
        cxGrid_dop_servTableView4.DataController.Values[i + 1, 4] := temp_SHORT_NAME_CATEGORY;
        cxGrid_dop_servTableView4.DataController.Values[i + 1, 6] := temp_sum;
        if temp_flag <> '' then  cxGrid_dop_servTableView4.DataController.Values[i + 1, 5] := temp_flag;
        doNew := true;
       end;
     end;
   end;
end;

procedure TRegistration_Form_Add.editbutton_dop_servClick(Sender: TObject);
var
  ActionStr: string;
  i : integer;
begin
  ActionStr:= st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
  Registration_Date_Add_Form_2 := TRegistration_Date_Add_Form_2.Create(Self);

  Registration_Date_Add_Form_2.Caption                  := ActionStr;
  Registration_Date_Add_Form_2.Category_ButtonEdit.Text := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 0];
  Registration_Date_Add_Form_2.DateBegEdit.Date         := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 1];
  Registration_Date_Add_Form_2.DateEndEdit.Date         := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 2];
  Registration_Date_Add_Form_2.ID_Category              := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 3];
  Registration_Date_Add_Form_2.Short_Name_Category      := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 4];
  Registration_Date_Add_Form_2.Full_Cat_Label.Caption   := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 4];

  if Registration_Date_Add_Form_2.ShowModal = mrOK then
   begin
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 0] := Registration_Date_Add_Form_2.Category_ButtonEdit.Text;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 1] := Registration_Date_Add_Form_2.DateBegEdit.Date;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 2] := Registration_Date_Add_Form_2.DateEndEdit.Date;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 3] := Registration_Date_Add_Form_2.ID_Category;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 4] := Registration_Date_Add_Form_2.Short_Name_Category;
    cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 5] := '1';

    TypeRoom_Selecter_DataSet.Close;
    TypeRoom_Selecter_DataSet.SQLs.SelectSQL.Text := 'select * from ST_GET_SUM_BY_PERIOD(:id_kod, :date_beg, :date_end)';
    TypeRoom_Selecter_DataSet.ParamByName('id_kod').AsInt64  := id_kod;//Registration_Date_Add_Form_2.ID_Category;;
    TypeRoom_Selecter_DataSet.ParamByName('date_beg').AsDate := Registration_Date_Add_Form_2.DateBegEdit.Date;
    TypeRoom_Selecter_DataSet.ParamByName('date_end').AsDate := Registration_Date_Add_Form_2.DateEndEdit.Date;
    TypeRoom_Selecter_DataSet.Open;
    if TypeRoom_Selecter_DataSet['PAY_SUM'] <> null
     then cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.RecordCount - 1, 6] := TypeRoom_Selecter_DataSet['PAY_SUM'];


    SortGridData_dop_serv;
    
    for i:=0 to cxGrid_dop_servTableView4.DataController.RecordCount - 1 do
     if  cxGrid_dop_servTableView4.DataController.Values[i, 5] = '1' then
      begin
       cxGrid_dop_servTableView4.DataController.FocusedRowIndex:=i;
       cxGrid_dop_servTableView4.DataController.Values[i, 5] := '';
       break;
      end;
     Full_Cat_Label.Caption := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 4];
    Redact_dop_serv := True;
   end;
   
  Registration_Date_Add_Form_2.Free;
end;

procedure TRegistration_Form_Add.delButton_dop_servClick(Sender: TObject);
begin
  if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo
   then exit;

  cxGrid_dop_servTableView4.DataController.DeleteFocused;
  cxGrid_dop_servTableView4.DataController.FocusedRowIndex := cxGrid_dop_servTableView4.DataController.RecordCount - 1;
  if cxGrid_dop_servTableView4.DataController.RecordCount = 0 then
   begin
    Full_cat_dop_serv_lable.Caption := '';
    editbutton_dop_serv.Enabled := false;
    delButton_dop_serv.Enabled := false;
   end;

  Redact_dop_serv := True;
end;

procedure TRegistration_Form_Add.cxGrid_dop_servTableView4DblClick(
  Sender: TObject);
begin
  if cxGrid_dop_servTableView4.DataController.RecordCount = 0
   then exit;

  Registration_Form_Add.editbutton_dop_servClick(Sender);
end;

procedure TRegistration_Form_Add.cxGrid_dop_servTableView4FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 4] <> null
   then Full_cat_dop_serv_lable.Caption := cxGrid_dop_servTableView4.DataController.Values[cxGrid_dop_servTableView4.DataController.FocusedRecordIndex, 4];
end;

end.
