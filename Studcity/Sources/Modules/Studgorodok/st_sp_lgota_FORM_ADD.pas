//***********************************************************************
//* Проект "Студгородок"                                                *
//* Добавление льготы                                                   * 
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit st_sp_lgota_FORM_ADD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  cxCurrencyEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxClasses, cxControls, cxGridCustomView, cxGridDBTableView, cxGrid,
  Buttons, cxCheckBox, cxTextEdit, cxLabel, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, FIBDataSet, pFIBDataSet, St_Proc, st_ConstUnit;

type
  TLgotaFormAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    KodLabel: TcxLabel;
    ShortEdit: TcxTextEdit;
    ShortNameLabel: TcxLabel;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    KodEdit: TcxTextEdit;
    GosCheck: TcxCheckBox;
    MedCheck: TcxCheckBox;
    cxGroupBox2: TcxGroupBox;
    AddButton: TSpeedButton;
    EditButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1BEG_DATE: TcxGridColumn;
    cxGrid1TableView1END_DATE: TcxGridColumn;
    cxGrid1TableView1PERCENT: TcxGridColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle3: TcxStyle;
    cxStyleRepository3: TcxStyleRepository;
    cxStyle4: TcxStyle;
    TempDataSet: TpFIBDataSet;
    cxStyle5: TcxStyle;
    cxStyleRepository4: TcxStyleRepository;
    cxStyle6: TcxStyle;
    flag: TcxGridColumn;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure KodEditKeyPress(Sender: TObject; var Key: Char);
    procedure ShortEditKeyPress(Sender: TObject; var Key: Char);
    procedure GosCheckKeyPress(Sender: TObject; var Key: Char);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure MedCheckKeyPress(Sender: TObject; var Key: Char);
    procedure DeleteButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    procedure SortGridData;
  end;

var
  LgotaFormAdd: TLgotaFormAdd;

implementation
uses Unit_of_Utilits, st_sp_lgota_ADDPersent_Form, Lgota_Unit,DataModule1_Unit;
{$R *.dfm}

procedure TLgotaFormAdd.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];
 KodLabel.Caption :=         st_ConstUnit.st_LgCode[PLanguageIndex];
 ShortNameLabel.Caption :=   st_ConstUnit.st_ShortLable[PLanguageIndex];
 NameLabel.Caption :=        st_ConstUnit.st_NameLable[PLanguageIndex];

 GosCheck.Properties.Caption := st_ConstUnit.st_Gos[PLanguageIndex];
 MedCheck.Properties.Caption := st_ConstUnit.st_Med[PLanguageIndex];
 cxGroupBox2.Caption         := st_ConstUnit.st_LgPerc[PLanguageIndex];

 AddButton.Hint:=       st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 EditButton.Hint:=      st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 DeleteButton.Hint:=    st_ConstUnit.st_DeleteBtn_Caption[PLanguageIndex];

 cxGrid1TableView1BEG_DATE.Caption :=     st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
 cxGrid1TableView1END_DATE.Caption :=     st_ConstUnit.st_grid_Date_End[PLanguageIndex];
 cxGrid1TableView1PERCENT .Caption :=     st_ConstUnit.st_PercentOnly[PLanguageIndex];

end;

procedure TLgotaFormAdd.CancelButtonClick(Sender: TObject);
begin
Close;
end;

procedure TLgotaFormAdd.FormShow(Sender: TObject);
begin
if cxGrid1TableView1.DataController.RecordCount <> 0 then begin
  cxGrid1TableView1.DataController.FocusedRecordIndex := 0;
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 end;
 KodEdit.SetFocus;
end;

procedure TLgotaFormAdd.SortGridData;
{var
 i     : integer;
 doNew : boolean;
 temp_date_beg, temp_date_end : TDate;
 temp_percent : Currency;
begin
 if cxGrid1TableView1.DataController.RecordCount < 2 then exit;
 doNew := true;
 while doNew do begin
  doNew := false;
  for i := 0 to cxGrid1TableView1.DataController.RecordCount - 2 do
  if cxGrid1TableView1.DataController.Values[i, 1] > cxGrid1TableView1.DataController.Values[i + 1, 1] then begin
   temp_date_beg := cxGrid1TableView1.DataController.Values[i, 0];
   temp_date_end := cxGrid1TableView1.DataController.Values[i, 1];
   temp_percent  := cxGrid1TableView1.DataController.Values[i, 2];
   cxGrid1TableView1.DataController.Values[i, 0] := cxGrid1TableView1.DataController.Values[i + 1, 0];
   cxGrid1TableView1.DataController.Values[i, 1] := cxGrid1TableView1.DataController.Values[i + 1, 1];
   cxGrid1TableView1.DataController.Values[i, 2] := cxGrid1TableView1.DataController.Values[i + 1, 2];
     cxGrid1TableView1.DataController.Values[i + 1, 0] := temp_date_beg;
   cxGrid1TableView1.DataController.Values[i + 1, 1] := temp_date_end;
   cxGrid1TableView1.DataController.Values[i + 1, 2] := temp_percent;
   doNew := true;
  end;
 end;
end;}
var
 i : integer;
 doNew : boolean;
 temp_flag : string;
 temp_date_beg, temp_date_end : TDate;
 temp_percent : Currency;

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
             temp_percent:= cxGrid1TableView1.DataController.Values[i, 2];

             if cxGrid1TableView1.DataController.Values[i, 3]<> null then
               begin
                 temp_flag := cxGrid1TableView1.DataController.Values[i, 3];
                 cxGrid1TableView1.DataController.Values[i, 3]:= '';
               end;
             cxGrid1TableView1.DataController.Values[i, 0] := cxGrid1TableView1.DataController.Values[i + 1, 0];
             cxGrid1TableView1.DataController.Values[i, 1] := cxGrid1TableView1.DataController.Values[i + 1, 1];
             cxGrid1TableView1.DataController.Values[i, 2] := cxGrid1TableView1.DataController.Values[i + 1, 2];

             if cxGrid1TableView1.DataController.Values[i + 1, 3]<> null then
               begin
                cxGrid1TableView1.DataController.Values[i, 3] := cxGrid1TableView1.DataController.Values[i + 1, 3];
                cxGrid1TableView1.DataController.Values[i + 1, 3]:='';
               end;

             cxGrid1TableView1.DataController.Values[i + 1, 0] := temp_date_beg;
             cxGrid1TableView1.DataController.Values[i + 1, 1] := temp_date_end;
             cxGrid1TableView1.DataController.Values[i + 1, 2] := temp_percent;

             if temp_flag<>'' then  cxGrid1TableView1.DataController.Values[i + 1, 3] := temp_flag;

             doNew := true;
         end;
    end;
 end;
end;


procedure TLgotaFormAdd.FormCreate(Sender: TObject);
begin
 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxFloatValueType;
 FormIniLanguage();
end;

procedure TLgotaFormAdd.OKButtonClick(Sender: TObject);
var
 i : integer;
begin
// проверка корректности заполнения формы
 if not IntegerCheck(KodEdit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_mess_Code_need[PLanguageIndex]));
  KodEdit.SetFocus;
  exit;
 end;

 if LgotaFormAdd.Caption = st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex] then
 begin
 TempDataSet.Active:=true;
 if TempDataSet.Locate('NUM_LG',StrToInt(KodEdit.Text), [])= true then
 begin
  ShowMessage(pchar(st_ConstUnit.st_LgCodeExists[PLanguageIndex]));
 KodEdit.SetFocus;
 TempDataSet.Active:=false;
 exit;
 end;
 TempDataSet.Active:=false;
 end;
 if ShortEdit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_mess_ShortName_need[PLanguageIndex]));
  ShortEdit.SetFocus;
  exit;
 end;
 if NameEdit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_mess_FullName_need[PLanguageIndex]));
  NameEdit.SetFocus;
  exit;
 end;
 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  ShowMessage(pchar(st_ConstUnit.st_LgPercent_need[PLanguageIndex]));
  exit;
 end;
 //Проверка замкнутости по периодам процентов
 if cxGrid1TableView1.DataController.RecordCount > 1 then for i := 0 to cxGrid1TableView1.DataController.RecordCount - 2 do
  if cxGrid1TableView1.DataController.Values[i, 1] <> cxGrid1TableView1.DataController.Values[i + 1, 0] then begin
  ShowMessage(pchar(st_ConstUnit.st_LgZamknytost[PLanguageIndex]));
   cxGrid1TableView1.DataController.FocusedRecordIndex := i;
   exit;
 end;
 ModalResult := mrOK;
end;

procedure TLgotaFormAdd.AddButtonClick(Sender: TObject);
var 
i: integer;
begin
 LgotaAddPersent_Form := TLgotaAddPersent_Form.Create(Self);
 LgotaAddPersent_Form.Caption := st_ConstUnit.st_InsertBtn_Caption[PLanguageIndex];
 if cxGrid1TableView1.DataController.RecordCount = 0 then  LgotaAddPersent_Form.AcademicYear  ;
 if cxGrid1TableView1.DataController.RecordCount <> 0 then LgotaAddPersent_Form.DateBegEdit.Date := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1];
 if LgotaAddPersent_Form.ShowModal = mrOK then begin
  cxGrid1TableView1.DataController.RecordCount := cxGrid1TableView1.DataController.RecordCount + 1;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 0] := LgotaAddPersent_Form.DateBegEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 1] := LgotaAddPersent_Form.DateEndEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 2] := LgotaAddPersent_Form.PercentEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.RecordCount - 1, 3] := '1';
 // cxGrid1TableView1.DataController.FocusedRecordIndex  := cxGrid1TableView1.DataController.RecordCount - 1;
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
  SortGridData;
  for i:=0 to cxGrid1TableView1.DataController.RecordCount - 1 do
 if  cxGrid1TableView1.DataController.Values[i, 3] = '1' then
 begin
 cxGrid1TableView1.DataController.FocusedRowIndex:=i;
 cxGrid1TableView1.DataController.Values[i, 3] := '';
 break;
 end;
 end;
 cxGrid1.SetFocus;
 LgotaAddPersent_Form.Free;
end;

procedure TLgotaFormAdd.KodEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then ShortEdit.SetFocus;
end;

procedure TLgotaFormAdd.ShortEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then NameEdit.SetFocus;
end;

procedure TLgotaFormAdd.GosCheckKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then MedCheck.SetFocus;
end;

procedure TLgotaFormAdd.NameEditKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then GosCheck.SetFocus;
end;

procedure TLgotaFormAdd.MedCheckKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then OKButton.SetFocus;
end;

procedure TLgotaFormAdd.DeleteButtonClick(Sender: TObject);
begin
if MessageBox(Handle,PChar(st_ConstUnit.st_DeletePromt[PLanguageIndex]),PChar(st_ConstUnit.st_Confirmation_Caption[PLanguageIndex]),MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
cxGrid1TableView1.DataController.DeleteFocused;
 if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  EditButton.Enabled := false;
  Deletebutton.Enabled := false;
 end;
end;

procedure TLgotaFormAdd.EditButtonClick(Sender: TObject);
var
i:integer;
begin
 LgotaAddPersent_Form := TLgotaAddPersent_Form.Create(Self);
LgotaAddPersent_Form.Caption := st_ConstUnit.st_EditBtn_Caption[PLanguageIndex];
 LgotaAddPersent_Form.DateBegEdit.Date := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0];
 LgotaAddPersent_Form.DateEndEdit.Date := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1];
 LgotaAddPersent_Form.PercentEdit.Text := cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2];
 if LgotaAddPersent_Form.ShowModal = mrOK then begin
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 0] := LgotaAddPersent_Form.DateBegEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 1] := LgotaAddPersent_Form.DateEndEdit.Date;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 2] := LgotaAddPersent_Form.PercentEdit.Text;
  cxGrid1TableView1.DataController.Values[cxGrid1TableView1.DataController.FocusedRecordIndex, 3] := '1';
  SortGridData;
  for i:=0 to cxGrid1TableView1.DataController.RecordCount - 1 do
  if  cxGrid1TableView1.DataController.Values[i, 3] = '1' then
  begin
  cxGrid1TableView1.DataController.FocusedRowIndex:=i;
  cxGrid1TableView1.DataController.Values[i, 3] := '';
  break;
  end;
 end;
 LgotaAddPersent_Form.Free;
end;

end.
