//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник категорий - добавление категории                         *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit st_sp_category_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView,
  cxGridDBTableView, cxGrid, Buttons, cxCheckBox, cxLabel, cxContainer,
  cxGroupBox, StdCtrls, cxButtons, Unit_of_Utilits, cxCurrencyEdit, St_Loader_Unit,
  FIBDataSet, pFIBDataSet, ActnList,
  St_Proc, st_ConstUnit;

type

TKatSmet = record
   id_stage : integer;
   percent  : single;
   sub_percent : single;
   summa    : currency;
   sub_summa : currency;
   kod_sm   : int64;
   kod_razd : int64;
   kod_st   : int64;
   kod_kekv: int64;
//   use_beg  : TDateTime;
//   use_end  : TDateTime;
  end;


  TCategoryFormAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    KodLabel: TcxLabel;
    ShortEdit: TcxTextEdit;
    ShortNameLabel: TcxLabel;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    KodEdit: TcxTextEdit;
    StudCheck: TcxCheckBox;
    NotliveCheck: TcxCheckBox;
    MonthCheck: TcxCheckBox;
    PropiskaCheck: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    AddButton: TSpeedButton;
    EditButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    TypeEdit: TcxButtonEdit;
    TypeLabel: TcxLabel;
    ClassEdit: TcxButtonEdit;
    ClassLabel: TcxLabel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1BEG_DATE: TcxGridColumn;
    cxGrid1TableView1END_DATE: TcxGridColumn;
    cxGrid1TableView1SUBS_SUMMA: TcxGridColumn;
    cxGrid1TableView1SUMMA_OPL: TcxGridColumn;
    cxGrid1TableView1ID_STAGE: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1TableView1Sub_Max: TcxGridColumn;
    flag: TcxGridColumn;
    ReadDataSet: TpFIBDataSet;
    Category_ActionList: TActionList;
    Add_Action: TAction;
    Edit_Action: TAction;
    Delete_Action: TAction;
    Ok_Action: TAction;
    Xerox_Button: TSpeedButton;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ClassEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure ClassEditKeyPress(Sender: TObject; var Key: Char);
    procedure SortGridData;
    procedure cxGrid1TableView1DblClick(Sender: TObject);
    procedure Add_ActionExecute(Sender: TObject);
    procedure Edit_ActionExecute(Sender: TObject);
    procedure Delete_ActionExecute(Sender: TObject);
    procedure Ok_ActionExecute(Sender: TObject);
    procedure Xerox_ButtonClick(Sender: TObject);
    procedure KodEditExit(Sender: TObject);
  private
    Cur_date: string;
    PLanguageIndex: byte;
    procedure FormIniLanguage();
    function GetMaxIdStage: integer;
  public
    id_stage          : integer;
    id_type_category  : integer;
    id_category_class : integer;
    Redact : boolean;
    Redact_Kod_Edit, Redact_Short_Edit, Redact_Name_Edit,
    Redact_Type_Edit, Redact_Class_Edit : string;
    KatSmet : array of TKatSmet;
    procedure DeleteKatSmet(const id : integer);
    procedure Redact_Check;
    procedure RedactTrue;
    procedure RedactFalse;
  end;

var
  CategoryFormAdd: TCategoryFormAdd;

implementation
uses St_sp_Category_Add_Summ_Form, DataModule1_Unit, Xerox,
  St_sp_KategoryUnit;
{$R *.dfm}
procedure TCategoryFormAdd.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

 ShortNameLabel.Caption:=    st_ConstUnit.st_ShortLable[PLanguageIndex];
 NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];
 TypeLabel.Caption :=        st_ConstUnit.st_TypeLable[PLanguageIndex];
 ClassLabel.Caption :=       st_ConstUnit.st_ClassLable[PLanguageIndex];
 // Студенческая категория
 StudCheck.Properties.Caption :=        st_ConstUnit.st_Stud_Cat[PLanguageIndex];
 // Оплата помесячно
 MonthCheck.Properties.Caption :=       st_ConstUnit.st_Month_Cat[PLanguageIndex];
 // Без проживания
 NotliveCheck.Properties.Caption :=     st_ConstUnit.st_NoLivers_Cat[PLanguageIndex];
 // Только прописка
 PropiskaCheck.Properties.Caption :=    st_ConstUnit.st_PropiOnly_Cat[PLanguageIndex];

 // грид
cxGrid1TableView1BEG_DATE.Caption :=    st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
cxGrid1TableView1END_DATE.Caption :=    st_ConstUnit.st_grid_Date_End[PLanguageIndex];
cxGrid1TableView1SUMMA_OPL.Caption :=   st_ConstUnit.st_PaySum_Cat[PLanguageIndex];
cxGrid1TableView1Sub_Max.Caption :=     st_ConstUnit.st_SubsMax_Cat[PLanguageIndex];
cxGrid1TableView1SUBS_SUMMA.Caption :=  st_ConstUnit.st_SubsSum_Cat[PLanguageIndex];
cxGroupBox2.Caption :=                  st_ConstUnit.st_Sums_Cat[PLanguageIndex];

 AddButton.Hint :=         st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Hint :=        st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Hint :=      st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];
 Xerox_Button.Hint :=      st_ConstUnit.st_CopyCells[PLanguageIndex];
end;

function TCategoryFormAdd.GetMaxIdStage: integer;
 var i, MaybeMax: integer;
 begin
 if Length(KatSmet) = 0 then
  begin
   Result:=-1;
   exit;
  end;
 MaybeMax:= KatSmet[0].id_stage;
 for i := 1 to Length(KatSmet) - 1 do
  begin
   if KatSmet[i].id_stage > MaybeMax
   then MaybeMax :=KatSmet[i].id_stage;
  end;
  Result:= MaybeMax;
 end;

procedure TCategoryFormAdd.RedactTrue;
begin
Redact:=true;
end;

procedure TCategoryFormAdd.RedactFalse;
begin
Redact:=false;
end;

procedure TCategoryFormAdd.Redact_Check;
begin
with  CategoryFormAdd do begin
if Redact_Kod_Edit <> KodEdit.Text then RedactTrue;
if Redact_Short_Edit <> ShortEdit.Text then RedactTrue;
if Redact_Name_Edit <> NameEdit.Text then RedactTrue;
if Redact_Type_Edit <> TypeEdit.Text then RedactTrue;
if Redact_Class_Edit <> ClassEdit.Text then RedactTrue;
end;
end;

procedure TCategoryFormAdd.SortGridData;
var
 i : integer;
// temp_kod_category: Smallint;
 doNew : boolean;
 temp_flag : string;
 temp_date_beg, temp_date_end : TDate;
 temp_summa_opl,temp_subs_max,temp_subs_sum  : Currency;
 temp_id_stage : int64;

begin
 if cxGrid1TableView1.DataController.RecordCount < 2 then exit;
 doNew := true;
 while doNew do
 begin
  doNew := false;
   for i := 0 to cxGrid1TableView1.DataController.RecordCount - 2 do
    begin
       if (cxGrid1TableView1.DataController.Values[i, 0] <= cxGrid1TableView1.DataController.Values[i + 1, 1])
       and (cxGrid1TableView1.DataController.Values[i, 1] < cxGrid1TableView1.DataController.Values[i + 1, 1]) then
         begin
             temp_flag :='';
             temp_date_beg := cxGrid1TableView1.DataController.Values[i, 0];
             temp_date_end := cxGrid1TableView1.DataController.Values[i, 1];
             temp_summa_opl:= cxGrid1TableView1.DataController.Values[i, 2];
             temp_subs_max := cxGrid1TableView1.DataController.Values[i, 3];
             temp_subs_sum := cxGrid1TableView1.DataController.Values[i, 4];
             temp_id_stage := cxGrid1TableView1.DataController.Values[i, 5];

             if cxGrid1TableView1.DataController.Values[i, 6]<> null then
               begin
                 temp_flag := cxGrid1TableView1.DataController.Values[i, 6];
                 cxGrid1TableView1.DataController.Values[i, 6]:= '';
               end;
             cxGrid1TableView1.DataController.Values[i, 0] := cxGrid1TableView1.DataController.Values[i + 1, 0];
             cxGrid1TableView1.DataController.Values[i, 1] := cxGrid1TableView1.DataController.Values[i + 1, 1];
             cxGrid1TableView1.DataController.Values[i, 2] := cxGrid1TableView1.DataController.Values[i + 1, 2];
             cxGrid1TableView1.DataController.Values[i, 3] := cxGrid1TableView1.DataController.Values[i + 1, 3];
             cxGrid1TableView1.DataController.Values[i, 4] := cxGrid1TableView1.DataController.Values[i + 1, 4];
             cxGrid1TableView1.DataController.Values[i, 5] := cxGrid1TableView1.DataController.Values[i + 1, 5];
             cxGrid1TableView1.DataController.Values[i, 6] := cxGrid1TableView1.DataController.Values[i + 1, 6];

             if cxGrid1TableView1.DataController.Values[i + 1, 6]<> null then
               begin
                cxGrid1TableView1.DataController.Values[i, 6] := cxGrid1TableView1.DataController.Values[i + 1, 6];
                cxGrid1TableView1.DataController.Values[i + 1, 6]:='';
               end;

             cxGrid1TableView1.DataController.Values[i + 1, 0] := temp_date_beg;
             cxGrid1TableView1.DataController.Values[i + 1, 1] := temp_date_end;
             cxGrid1TableView1.DataController.Values[i + 1, 2] := temp_summa_opl;
             cxGrid1TableView1.DataController.Values[i + 1, 3] := temp_subs_max;
             cxGrid1TableView1.DataController.Values[i + 1, 4] := temp_subs_sum;
             cxGrid1TableView1.DataController.Values[i + 1, 5] :=temp_id_stage;

             if temp_flag<>'' then  cxGrid1TableView1.DataController.Values[i + 1, 6] := temp_flag;

             doNew := true;
         end;
    end;
 end;
end;

{ Удаляет сметы у которых id_stage = id                        *
 * IN: id - идентификатор периода                              *}
procedure TCategoryFormAdd.DeleteKatSmet(const id : integer);
var
 i : integer;
begin
 if Length(KatSmet) = 0 then exit;
 i := 0;
 while i < Length(KatSmet) do begin
  if KatSmet[i].id_stage = id then begin
   KatSmet[i] := KatSmet[Length(KatSmet) - 1];
   SetLength(KatSmet, Length(KatSmet) - 1);
  end else inc(i);
 end;
end;



procedure TCategoryFormAdd.OKButtonClick(Sender: TObject);
begin
 if not IntegerCheck(KodEdit.Text) then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
  KodEdit.SetFocus;
  exit;
 end;
 if ShortEdit.Text = '' then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_ShortName_need[PLanguageIndex]));
  ShortEdit.SetFocus;
  exit;
 end;
 if NameEdit.Text = '' then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
  NameEdit.SetFocus;
  exit;
 end;
 if TypeEdit.Text = '' then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_TypeLive_need[PLanguageIndex]));
  TypeEdit.SetFocus;
  exit;
 end;
 if ClassEdit.Text = '' then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_ClassLive_need[PLanguageIndex]));
  ClassEdit.SetFocus;
  exit;
 end;
 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  ShowMessage(PChar(st_ConstUnit.st_mess_Summs_need[PLanguageIndex]));
  cxGrid1.SetFocus;
  exit;
 end;

 ModalResult := mrOK;
end;

procedure TCategoryFormAdd.CancelButtonClick(Sender: TObject);
var qYESNOCANCEL: smallint;
begin
Redact_Check;
if Redact = true then  begin
   qYESNOCANCEL:=MessageBox(Handle, PChar(st_ConstUnit.st_SafeQuery[PLanguageIndex]),PChar(st_ConstUnit.st_Query[PLanguageIndex]),MB_YESNOCANCEL or MB_ICONQUESTION);
if qYESNOCANCEL= 2 then exit;
if qYESNOCANCEL= 6 then CategoryFormAdd.OkButtonClick(Sender);
if qYESNOCANCEL= 7 then close;
end
else close;
end;

procedure TCategoryFormAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TCategoryFormAdd.TypeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
{ Sprav := TTypeCategoryForm.Create(Self);
 if id_type_category <> -1 then begin
  Sprav.SelectAll;
  Sprav.DataSet.Locate('ID_TYPE_CATEGORY', id_type_category, []);
 end;
  Sprav.SelectButton.Enabled:=true;
 if Sprav.ShowModal = mrOK then begin
  id_type_category := Sprav.DataSet['ID_TYPE_CATEGORY'];
  TypeEdit.Text := Sprav.DataSet['NAME_TYPE_CATEGORY'];
  if Sprav.DataSet['MONTH_OPL'] = 1 then begin
   MonthCheck.Checked := true;
  end else begin
   MonthCheck.Checked := false;
  end;
 end;
 Sprav.Free;}
 var
ResTypeCat:Variant;
ID: int64;
begin
 if id_type_category <> -2 then
 ID:= id_type_category
 else ID:=-2;
 ResTypeCat:= Load_st_Type_Category(self,DataModule1.pFIBDatabase1.Handle,true,false, ID);
 if VarArrayDimCount(ResTypeCat)>0 then
 begin
  id_type_category :=ResTypeCat[0];
  TypeEdit.Text    :=ResTypeCat[1];
  if ResTypeCat[2] =1 then
   MonthCheck.Checked := true
  else
   MonthCheck.Checked := false;
  end;
end;

procedure TCategoryFormAdd.FormCreate(Sender: TObject);
begin
 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[3].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[4].DataBinding.ValueTypeClass := TcxFloatValueType;
 cxGrid1TableView1.Items[5].DataBinding.ValueTypeClass := TcxIntegerValueType;
 cxGrid1TableView1.Items[6].DataBinding.ValueTypeClass := TcxStringValueType;
 id_type_category := -2;
 id_category_class  := -2;
 id_stage := 0;
 RedactFalse;
ReadDataSet.Close;
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select CUR_DATE from ST_GET_CURRENT_DATE';
ReadDataSet.Open;
Cur_date:= ReadDataSet['CUR_DATE'];
ReadDataSet.Close;
FormIniLanguage();
end;

procedure TCategoryFormAdd.ClassEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
ResClassCat:Variant;
ID: int64;
begin
 if id_category_class <> -2 then
 ID:= id_category_class
 else
 ID:=-2;
 ResClassCat:= Load_st_Class_Category(self,DataModule1.pFIBDatabase1.Handle,true,false, ID);
 if VarArrayDimCount(ResClassCat)>0 then
 begin
  id_category_class :=ResClassCat[0];
  ClassEdit.Text    :=ResClassCat[1];
 end;
 end;

procedure TCategoryFormAdd.AddButtonClick(Sender: TObject);
var
 i         : integer;
begin
 CategoryFormAddSum := TCategoryFormAddSum.Create(Self);
 CategoryFormAddSum.Caption :=  st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];

 if CategoryFormAddSum.ShowModal = mrOK then begin
  Xerox_Button.Visible:=true;
  cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 0] := CategoryFormAddSum.DateBegEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1] := CategoryFormAddSum.DateEndEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 2] := CategoryFormAddSum.SummaEdit.Value;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 3] := CategoryFormAddSum.SubsMaxEdit.Value;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 4] := CategoryFormAddSum.SubsSummaEdit.Value;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 6] := '1';
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
  //Добавляем сметы
  id_stage:= GetMaxIdStage+1;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 5] := id_stage;
  for i := 0 to CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   SetLength(KatSmet, Length(KatSmet) + 1);
   KatSmet[Length(KatSmet) - 1].id_stage := id_stage;
   KatSmet[Length(KatSmet) - 1].summa := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 3];
   KatSmet[Length(KatSmet) - 1].percent := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 4];
   KatSmet[Length(KatSmet) - 1].sub_percent := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 2];
   KatSmet[Length(KatSmet) - 1].sub_summa := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 1];
   KatSmet[Length(KatSmet) - 1].kod_sm := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 5];
   KatSmet[Length(KatSmet) - 1].kod_razd := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 6];
   KatSmet[Length(KatSmet) - 1].kod_st := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 7];
   KatSmet[Length(KatSmet) - 1].kod_kekv := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 8];
   end;
  SortGridData;
 for i:=0 to cxGrid1TableView1.DataController.RecordCount - 1 do
 if  cxGrid1TableView1.DataController.Values[i, 6] = '1' then
 begin
 cxGrid1TableView1.DataController.FocusedRowIndex:=i;
 cxGrid1TableView1.DataController.Values[i, 6] := '';
 break;
 end;
 end;

 CategoryFormAddSum.Free;
end;

procedure TCategoryFormAdd.EditButtonClick(Sender: TObject);
var
 IdToKods : string;
 id, i     : integer;
begin
 CategoryFormAddSum := TCategoryFormAddSum.Create(Self);
 CategoryFormAddSum.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];

 CategoryFormAddSum.DateBegEdit.Date   := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0];
 CategoryFormAddSum.DateEndEdit.Date   := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1];
 CategoryFormAddSum.SummaEdit.Value     := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2];
 CategoryFormAddSum.SubsMaxEdit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3];
 CategoryFormAddSum.SubsSummaEdit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 4];

   //Выбираем сметы
 if Length(KatSmet) <> 0 then begin
  id := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 5];
  for i := 0 to Length(KatSmet) - 1 do if KatSmet[i].id_stage = id then begin
 CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount := CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount + 1;

 IdToKods:='';
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(KatSmet[i].kod_sm)+ ','+kav+cur_date+kav+','+'1'+')';
 ReadDataSet.Open;
 IdToKods:=vartostr(ReadDataSet['KOD_OBJECT']);
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(KatSmet[i].kod_razd)+ ','+ kav+ cur_date +kav+','+'2'+')';
 ReadDataSet.Open;
 IdToKods:=IdToKods+'.'+inttostr(ReadDataSet['KOD_OBJECT']) ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(KatSmet[i].kod_st)+ ','+ kav+ cur_date +kav+','+'3'+')';
 ReadDataSet.Open;
 IdToKods:=IdToKods+'.'+inttostr(ReadDataSet['KOD_OBJECT']) ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KEKV_KODE from PUB_SPR_KEKV_INFO('+ inttostr(KatSmet[i].kod_kekv)+ ','+ kav+ cur_date +kav+')';
 ReadDataSet.Open;
 IdToKods:=IdToKods+'.'+inttostr(ReadDataSet['KEKV_KODE']) ;
 ReadDataSet.Close;

   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 0] := IdToKods;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 1] := KatSmet[i].sub_summa;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 2] := KatSmet[i].sub_percent;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 3] := KatSmet[i].summa;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 4] := KatSmet[i].percent;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 5] := KatSmet[i].kod_sm;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 6] := KatSmet[i].kod_razd;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 7] := KatSmet[i].kod_st;
   CategoryFormAddSum.cxGrid1TableView1.DataController.Values[CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1, 8] := KatSmet[i].kod_kekv;
   end;
 end;
  CategoryFormAddSum.Sum_subs_Result.Value:=0;
  CategoryFormAddSum.Percent_subs_Result.Value:=0;
  CategoryFormAddSum.Sum_Result.Value:=0;
  CategoryFormAddSum.Percent_Result.Value:=0;
  for i:=0 to  CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount-1 do begin
  CategoryFormAddSum.Sum_subs_Result.Value:=CategoryFormAddSum.Sum_subs_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 1];
  CategoryFormAddSum.Percent_subs_Result.Value:= CategoryFormAddSum.Percent_subs_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 2];
  CategoryFormAddSum.Sum_Result.Value:= CategoryFormAddSum.Sum_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 3];
  CategoryFormAddSum.Percent_Result.Value:= CategoryFormAddSum.Percent_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 4];
  end;

// изменение

 if CategoryFormAddSum.ShowModal = mrOK then begin
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0] := CategoryFormAddSum.DateBegEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1] := CategoryFormAddSum.DateEndEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2] := CategoryFormAddSum.SummaEdit.Value;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3] := CategoryFormAddSum.SubsMaxEdit.Value;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 4] := CategoryFormAddSum.SubsSummaEdit.Value;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 6] := '1';
  //Удаляем старые сметы
  DeleteKatSmet(id);
  //Добавляем измененные сметы
  for i := 0 to CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount - 1 do begin
   SetLength(KatSmet, Length(KatSmet) + 1);
   KatSmet[Length(KatSmet) - 1].id_stage := id;
   KatSmet[Length(KatSmet) - 1].summa := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 3];
   KatSmet[Length(KatSmet) - 1].percent := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 4];
   KatSmet[Length(KatSmet) - 1].sub_percent := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 2];
   KatSmet[Length(KatSmet) - 1].sub_summa := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 1];
   KatSmet[Length(KatSmet) - 1].kod_sm := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 5];
   KatSmet[Length(KatSmet) - 1].kod_razd := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 6];
   KatSmet[Length(KatSmet) - 1].kod_st := CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 7];
   KatSmet[Length(KatSmet) - 1].kod_kekv:=CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 8];
  end;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 5] := id;
  SortGridData;
  for i:=0 to cxGrid1TableView1.DataController.RecordCount - 1 do
  if  cxGrid1TableView1.DataController.Values[i, 6] = '1' then
  begin
  cxGrid1TableView1.DataController.FocusedRowIndex:=i;
  cxGrid1TableView1.DataController.Values[i, 6] := '';
  break;
  end;
  end;

 CategoryFormAddSum.Free;

end;

procedure TCategoryFormAdd.DeleteButtonClick(Sender: TObject);
begin
if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
cxGrid1TableView1.DataController.DeleteFocused;
 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  EditButton.Enabled := false;
  Deletebutton.Enabled := false;
 end;
end;

procedure TCategoryFormAdd.FormShow(Sender: TObject);
{var
i : integer;}
begin
  if cxGrid1TableView1.DataController.RecordCount <> 0 then begin
//  for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do if cxGrid1TableView1.DataController.Values[i, 4] > id_stage then id_stage := cxGrid1TableView1.DataController.Values[i, 4];
  cxGrid1TableView1.DataController.FocusedRecordIndex := 0;
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
  Xerox_Button.Visible:=true;
 end;
 SortGridData;
 Redact_Kod_Edit:=KodEdit.Text;
 Redact_Short_Edit:=ShortEdit.Text;
 Redact_Name_Edit:=NameEdit.text;
 Redact_Type_Edit:=TypeEdit.text;
 Redact_Class_Edit:=ClassEdit.text;
 KodEdit.SetFocus;

end;

procedure TCategoryFormAdd.KodEditKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then ShortEdit.SetFocus;
end;

procedure TCategoryFormAdd.ShortEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then NameEdit.SetFocus;
end;

procedure TCategoryFormAdd.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then TypeEdit.SetFocus;
end;

procedure TCategoryFormAdd.TypeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then ClassEdit.SetFocus;
end;

procedure TCategoryFormAdd.ClassEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OKButton.SetFocus;
end;

procedure TCategoryFormAdd.cxGrid1TableView1DblClick(Sender: TObject);
begin
if cxGrid1TableView1.DataController.RecordCount = 0 then exit;
CategoryFormAdd.EditButtonClick(Sender);
end;

procedure TCategoryFormAdd.Add_ActionExecute(Sender: TObject);
begin
CategoryFormAdd.AddButtonClick(Sender);
end;

procedure TCategoryFormAdd.Edit_ActionExecute(Sender: TObject);
begin
CategoryFormAdd.EditButtonClick(Sender);
end;

procedure TCategoryFormAdd.Delete_ActionExecute(Sender: TObject);
begin
//CategoryFormAdd.DeleteButtonClick(Sender);
end;

procedure TCategoryFormAdd.Ok_ActionExecute(Sender: TObject);
begin
CategoryFormAdd.OKButtonClick(Sender);
end;

procedure TCategoryFormAdd.Xerox_ButtonClick(Sender: TObject);
var
// IdToKods : string;
 id, i     : integer;
begin
frm_Xerox:= Tfrm_Xerox.create(self);
 frm_Xerox.xrx_DateBegEdit.Date    := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0];
 frm_Xerox.xrx_DateEndEdit.Date    := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1];
 frm_Xerox.xrx_SummaEdit.Value     := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2];
 frm_Xerox.xrx_SubsMaxEdit.Value   := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3];
 frm_Xerox.xrx_SubsSummaEdit.Value := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 4];

    //Выбираем сметы
 if Length(KatSmet) <> 0 then begin
  id := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 5];
  for i := 0 to Length(KatSmet) - 1 do if KatSmet[i].id_stage = id then begin
 frm_Xerox.cxGrid1TableView1.DataController.RecordCount := frm_Xerox.cxGrid1TableView1.DataController.RecordCount + 1;

 {
 IdToKods:='';
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(KatSmet[i].kod_sm)+ ','+kav+cur_date+kav+','+'1'+')';
 ReadDataSet.Open;
 IdToKods:=ReadDataSet['KOD_OBJECT'];
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(KatSmet[i].kod_razd)+ ','+ kav+ cur_date +kav+','+'2'+')';
 ReadDataSet.Open;
 IdToKods:=IdToKods+'.'+inttostr(ReadDataSet['KOD_OBJECT']) ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KOD_OBJECT from PUB_GET_NAME_BUDG_BY_ID('+ inttostr(KatSmet[i].kod_st)+ ','+ kav+ cur_date +kav+','+'3'+')';
 ReadDataSet.Open;
 IdToKods:=IdToKods+'.'+inttostr(ReadDataSet['KOD_OBJECT']) ;
 ReadDataSet.Close;

 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Text := 'select KEKV_KODE from PUB_SPR_KEKV_INFO('+ inttostr(KatSmet[i].kod_kekv)+ ','+ kav+ cur_date +kav+')';
 ReadDataSet.Open;
 IdToKods:=IdToKods+'.'+inttostr(ReadDataSet['KEKV_KODE']) ;
 ReadDataSet.Close;
 }

  // frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 0] := IdToKods;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 1] := KatSmet[i].sub_summa;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 2] := KatSmet[i].sub_percent;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 3] := KatSmet[i].summa;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 4] := KatSmet[i].percent;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 5] := KatSmet[i].kod_sm;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 6] := KatSmet[i].kod_razd;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 7] := KatSmet[i].kod_st;
   frm_Xerox.cxGrid1TableView1.DataController.Values[frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1, 8] := KatSmet[i].kod_kekv;
   end;
 end;
 {
  CategoryFormAddSum.Sum_subs_Result.Value:=0;
  CategoryFormAddSum.Percent_subs_Result.Value:=0;
  CategoryFormAddSum.Sum_Result.Value:=0;
  CategoryFormAddSum.Percent_Result.Value:=0;
  for i:=0 to  CategoryFormAddSum.cxGrid1TableView1.DataController.RecordCount-1 do begin
  CategoryFormAddSum.Sum_subs_Result.Value:=CategoryFormAddSum.Sum_subs_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 1];
  CategoryFormAddSum.Percent_subs_Result.Value:= CategoryFormAddSum.Percent_subs_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 2];
  CategoryFormAddSum.Sum_Result.Value:= CategoryFormAddSum.Sum_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 3];
  CategoryFormAddSum.Percent_Result.Value:= CategoryFormAddSum.Percent_Result.Value + CategoryFormAddSum.cxGrid1TableView1.DataController.Values[i, 4];
  end;
 }

 if frm_Xerox.showmodal = mrOk then
 begin
// добавление ксерокопии
        cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 0] := frm_Xerox.xrx_DateBegEdit.Date;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1] := frm_Xerox.xrx_DateEndEdit.Date;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 2] := frm_Xerox.xrx_SummaEdit.Value;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 3] := frm_Xerox.xrx_SubsMaxEdit.Value;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 4] := frm_Xerox.xrx_SubsSummaEdit.Value;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 6] := '1';

        //Добавляем сметы
        id_stage:= GetMaxIdStage+1;
        cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 5] := id_stage;
        for i := 0 to frm_Xerox.cxGrid1TableView1.DataController.RecordCount - 1 do begin
         SetLength(KatSmet, Length(KatSmet) + 1);
         KatSmet[Length(KatSmet) - 1].id_stage := id_stage;
         KatSmet[Length(KatSmet) - 1].summa := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 3];
         KatSmet[Length(KatSmet) - 1].percent := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 4];
         KatSmet[Length(KatSmet) - 1].sub_percent := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 2];
         KatSmet[Length(KatSmet) - 1].sub_summa := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 1];
         KatSmet[Length(KatSmet) - 1].kod_sm := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 5];
         KatSmet[Length(KatSmet) - 1].kod_razd := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 6];
         KatSmet[Length(KatSmet) - 1].kod_st := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 7];
         KatSmet[Length(KatSmet) - 1].kod_kekv := frm_Xerox.cxGrid1TableView1.DataController.Values[i, 8];
         end;
        SortGridData;

        for i:=0 to cxGrid1TableView1.DataController.RecordCount - 1 do
         if  cxGrid1TableView1.DataController.Values[i, 6] = '1' then
          begin
           cxGrid1TableView1.DataController.FocusedRowIndex:=i;
           cxGrid1TableView1.DataController.Values[i, 6] := '';
           break;
          end;
 end;
end;

procedure TCategoryFormAdd.KodEditExit(Sender: TObject);
begin
 if Caption = st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex] then
 if CategoryForm.DataSet.Locate('NUM_KATEGORIYA',StrToInt(KodEdit.Text), [])= true then
 begin
 ShowMessage(pchar(st_ConstUnit.st_CategoryDontAdd[PLanguageIndex]));
 KodEdit.SetFocus;
 exit;
 end;
end;

end.
