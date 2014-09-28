//***********************************************************************
//* Проект "Студгородок"                                                *
//* Форма регистрации проживающих - изменение данных по субсидиям       *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit St_Pfsub_Add_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, DB, FIBDataSet, pFIBDataSet,
  cxDropDownEdit, cxTextEdit, cxButtonEdit, StdCtrls, cxButtons, cxLabel,
  cxMaskEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxGroupBox,
  St_Proc, st_ConstUnit, DataModule1_Unit, cxCurrencyEdit, st_common_types,
  st_common_loader;

type
  TPfSub_Add_Form = class(TForm)
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    cxGroupBox1: TcxGroupBox;
    DateBegEdit: TcxDateEdit;
    cxLabel1: TcxLabel;
    DateEndEdit: TcxDateEdit;
    cxLabel2: TcxLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Sub_State_ComboBox: TcxComboBox;
    ReadDataSet: TpFIBDataSet;
    Comment_Edit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxLabel7: TcxLabel;
    serves_ButtonEdit: TcxButtonEdit;
    TypeEdit: TcxButtonEdit;
    summa_edit: TcxCurrencyEdit;
    month_edit: TcxCurrencyEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure TypeEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure OkButtonClick(Sender: TObject);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
    procedure Summa_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Month_EditKeyPress(Sender: TObject; var Key: Char);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure Comment_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure Sub_State_ComboBoxKeyPress(Sender: TObject; var Key: Char);
    procedure serves_ButtonEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure serves_ButtonEditKeyPress(Sender: TObject; var Key: Char);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    ID_SUBSIDY : integer;
    ID_STATE   : integer;
    fullname   : string;
    id_serves  : Int64; 
  end;

var
  PfSub_Add_Form: TPfSub_Add_Form;

implementation
uses st_sp_Subsidy, Unit_of_Utilits, St_Pfio_Add_Form;
{$R *.dfm}

procedure TPfSub_Add_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OkButton.Caption :=            st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=        st_ConstUnit.st_Cancel[PLanguageIndex];
 //Тип субсидии
 Label16.Caption :=             st_ConstUnit.st_SubType[PLanguageIndex];
 //Сумма
 Label18.Caption :=             st_ConstUnit.st_Sum[PLanguageIndex];
 //Состояние
 Label19.Caption :=             st_ConstUnit.st_State[PLanguageIndex];
 //Кол-во месяцев
 Label1.Caption :=              st_ConstUnit.st_KolVoMes[PLanguageIndex];
 //С
 cxLabel1.Caption :=            st_ConstUnit.st_Z[PLanguageIndex];
 //По
 cxLabel2.Caption :=            st_ConstUnit.st_Po[PLanguageIndex];
 //Комментарий
 Label2.Caption :=              st_ConstUnit.st_Comments[PLanguageIndex];
end;

procedure TPfSub_Add_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TPfSub_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TPfSub_Add_Form.FormCreate(Sender: TObject);
var i, flag : integer;
begin
// забиваем комб состояниями
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFSUB_ADD_STATE_SELECT';
ReadDataSet.Open;
ReadDataSet.FetchAll;
Sub_State_ComboBox.Clear;
for i:=0 to ReadDataSet.RecordCount-1 do begin
Sub_State_ComboBox.Properties.Items.Add(ReadDataSet['NAME'] );
ReadDataSet.Next;
end;
ReadDataSet.Close;
Sub_State_ComboBox.ItemIndex:= 0;
// делаем по умолчанию 'Оформлена'
flag:=-1;
for i:=0 to Sub_State_ComboBox.Properties.Items.Count-1 do
begin
if Sub_State_ComboBox.Properties.Items[i]= 'ОФОРМЛЕНА'
then
begin
flag:=i;
break;
end;
end;
if flag<> -1 then Sub_State_ComboBox.ItemIndex:=flag
else Sub_State_ComboBox.ItemIndex:= 0;
// далее запрос на субсидию по умолчанию к базе
// н-р, 'Государственная'
// пихаем ее и запоминаем ID
ReadDataSet.SelectSQL.Clear;
ReadDataSet.SelectSQL.Text := 'select * from ST_SP_SUBSIDY_SYS_PRIOR_SEL';
ReadDataSet.Open;
TypeEdit.Text:= ReadDataSet['Short_name'] ;
ID_SUBSIDY:= strtoint(ReadDataSet['SUBSIDY_PRIORITY']);
fullname:= ReadDataSet['FULL_NAME'];
ReadDataSet.close;
FormIniLanguage();
end;

procedure TPfSub_Add_Form.TypeEditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
 Sprav : TSubsidy_Form;
begin
  Sprav := TSubsidy_Form.Create(Self);

  if TypeEdit.Text <> ''
   then Sprav.DataSet.Locate('ID_SUBSIDY', ID_SUBSIDY,[]);

  Sprav.SelectButton.Enabled := true;

  if Sprav.ShowModal = mrOK then
   begin
    TypeEdit.Text:=Sprav.DataSet['SHORT_NAME'];
    ID_SUBSIDY:=Sprav.DataSet['ID_SUBSIDY'];
    fullname:=Sprav.DataSet['full_name'];
   end;
end;

procedure TPfSub_Add_Form.OkButtonClick(Sender: TObject);

  function DifferenceDateCheck   : boolean;
   var  yyyyDateEnd, yyyyDateBeg : string;
        mmDateBeg, mmDateEnd     : string;
        yyyyDifference, Differ, MonthCount : integer;
  begin
   Result := true;

   ReadDataSet.SelectSQL.Clear;
   ReadDataSet.Close;
   ReadDataSet.SelectSQL.Text := 'select * from ST_DT_PFSUB_MINMAXPERIOD_SEL('+inttostr(ID_SUBSIDY)+')';
   ReadDataSet.Open;

   yyyyDateEnd:=FormatDateTime('yyyy', DateEndEdit.Date);
   yyyyDateBeg:=FormatDateTime('yyyy', DateBegEdit.Date);
   mmDateBeg:=FormatDateTime('mm', DateBegEdit.Date);
   mmDateEnd:=FormatDateTime('mm', DateEndEdit .Date);
   yyyyDifference := strtoint(yyyyDateEnd)-strtoint(yyyyDateBeg);

   if yyyyDifference = 0 then
   if not ((ReadDataSet['min_period']<=(strtoint(mmDateEnd)-strtoint(mmDateBeg))) and (ReadDataSet['max_period']>=(strtoint(mmDateEnd)-strtoint(mmDateBeg))))
    then
     begin
      Result := false;
      ReadDataSet.Close;
      exit;
     end;

   if yyyyDifference <> 0 then
    begin
     Differ:=yyyyDifference-1;
     MonthCount:=12- strtoint(mmDateBeg)+strtoint(mmDateEnd)+ 12 * Differ;
     if not ((ReadDataSet['min_period']<=MonthCount) and (ReadDataSet['max_period']>=MonthCount)) then
      begin
       Result:=false;
       ReadDataSet.Close;
       exit;
      end;
    end;
   ReadDataSet.Close;
  end;

begin
  if ((serves_ButtonEdit.Text = '') or (id_serves = -1)) then
   begin
    Showmessage('Необхідно обрати послугу!');
    serves_ButtonEdit.SetFocus;
    Exit;
   end;
   
  if TypeEdit.Text='' then
   begin
    ShowMessage('Необходимо ввести тип субсидии');
    TypeEdit.SetFocus;
    exit;
   end;

  if Summa_Edit.Text='' then
   begin
    ShowMessage('Необходимо ввести сумму субсидии');
    Summa_Edit.SetFocus;
    exit;
   end;

  if DateBegEdit.Text='' then
   begin
    ShowMessage('Необходимо ввести дату начала');
    DateBegEdit.SetFocus;
    exit;
   end;

  if DateEndEdit.Text='' then
   begin
    ShowMessage('Необходимо ввести дату окончания');
    DateEndEdit.SetFocus;
    exit;
   end;

  if DateBegEdit.Date > DateEndEdit.Date then
   begin
    ShowMessage('Дата начала должна быть меньше даты окончания');
    DateEndEdit.SetFocus;
    exit;
   end;

  if FloatCheck(FloatToStr(abs(StrToFloat(Summa_Edit.Text))))=false then
   begin
    ShowMessage('Сумма субсидии введена неверно');
    Summa_Edit.SetFocus;
    exit;
   end;

  if ((Month_Edit.Visible=true)and (Month_Edit.Text<>'') and (IntegerCheck(Month_Edit.Text)=false)) then
   begin
    ShowMessage('Кол-во месяцев введено неверно');
    Month_Edit.SetFocus;
    exit;
   end;

  ReadDataSet.SelectSQL.Clear;
  ReadDataSet.Close;
  ReadDataSet.SelectSQL.Text := 'select * from ST_SP_SUB_STATE_ID_STATE_SELECT('+''''+Sub_State_ComboBox.Text+''''+')';
  ReadDataSet.Open;
  ID_STATE:=strtoint(ReadDataSet['ID_STATE'] );
  ReadDataSet.Close;

  Registration_Form_Add.Redact_Subs:=true;

  ModalResult := mrOk;
end;

procedure TPfSub_Add_Form.TypeEditKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then Summa_Edit.SetFocus;
end;

procedure TPfSub_Add_Form.Summa_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Sub_State_ComboBox.SetFocus;
end;

procedure TPfSub_Add_Form.Month_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then DateBegEdit.SetFocus;
end;

procedure TPfSub_Add_Form.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then DateEndEdit.SetFocus;
end;

procedure TPfSub_Add_Form.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Comment_Edit.SetFocus;
end;

procedure TPfSub_Add_Form.Comment_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OkButton.SetFocus;
end;

procedure TPfSub_Add_Form.FormShow(Sender: TObject);
begin
DateBegEdit.SetFocus;
end;

procedure TPfSub_Add_Form.Sub_State_ComboBoxKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then DateBegEdit.SetFocus;
end;

procedure TPfSub_Add_Form.serves_ButtonEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  aParameter : TstSimpleParams;
  res : Variant;
begin
  aParameter                 := TstSimpleParams.Create;
  aParameter.Owner           := self;
  aParameter.Db_Handle       := DataModule1.DB.Handle;
  AParameter.Formstyle       := fsNormal;
  AParameter.WaitPakageOwner := self;
  //aParameter.is_admin        := is_admin;

  res := RunFunctionFromPackage(aParameter, 'Studcity\st_services.bpl', 'getServices');

  If VarArrayDimCount(res) <>0 then
   begin
     id_serves              := res[0];
     serves_ButtonEdit.Text := res[1];

     ReadDataSet.Close;
     ReadDataSet.SQLs.SelectSQL.Text := 'Select * from ST_SERVICE_DETAIL where id_service = :id_serves and st_options = 2';
     ReadDataSet.ParamByName('ID_SERVES').AsInt64 := id_serves;
     ReadDataSet.Open;
     ReadDataSet.FetchAll;

    ReadDataSet.Close;
   end;

  aParameter.Free;
end;

procedure TPfSub_Add_Form.serves_ButtonEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then 
end;

end.
