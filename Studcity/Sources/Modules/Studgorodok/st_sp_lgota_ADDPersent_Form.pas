//***********************************************************************
//* Проект "Студгородок"                                                *
//* Справочник льгот - добавление процента                              *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit st_sp_lgota_ADDPersent_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxControls, cxContainer, cxEdit, cxGroupBox,
  StdCtrls, cxButtons, cxCurrencyEdit, St_Proc, st_ConstUnit;

type
  TLgotaAddPersent_Form = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    PercentEdit: TcxCurrencyEdit;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure PercentEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    procedure AcademicYear ;
    { Public declarations }
  end;

var
  LgotaAddPersent_Form: TLgotaAddPersent_Form;

implementation
uses Unit_of_Utilits, DataModule1_Unit;
{$R *.dfm}

procedure TLgotaAddPersent_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

 cxLabel1.Caption :=     st_ConstUnit.st_grid_Date_Beg[PLanguageIndex];
 cxLabel2.Caption :=     st_ConstUnit.st_grid_Date_End[PLanguageIndex];
 cxLabel3.Caption :=     st_ConstUnit.st_PercentOnly[PLanguageIndex];
end;

procedure TLgotaAddPersent_Form.AcademicYear ;
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
LgotaAddPersent_Form.DateBegEdit.Date:=EncodeDate(Now_Year,Now_Month,Now_Day);
LgotaAddPersent_Form.DateEndEdit.Date:=EncodeDate(End_Year,End_Month,End_Day);
end
else begin
Now_Day:=1;
Now_Month:=9;
End_Day:=1;
End_Month:=7;
End_Year := Now_Year;
LgotaAddPersent_Form.DateBegEdit.Date:=EncodeDate(Now_Year-1,Now_Month,Now_Day);
LgotaAddPersent_Form.DateEndEdit.Date:=EncodeDate(End_Year,End_Month,End_Day);
end;
end;

procedure TLgotaAddPersent_Form.OKButtonClick(Sender: TObject);
begin
if DateBegEdit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_CatAddBegDate_need[PLanguageIndex]));
  DateBegEdit.SetFocus;
  exit;
 end;
 if DateEndEdit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_CatAddEndDate_need[PLanguageIndex]));
  DateEndEdit.SetFocus;
  exit;
 end;
 if DateBegEdit.Date >= DateEndEdit.Date then begin
  ShowMessage(pchar(st_ConstUnit.st_CatAddBegMoreEnd_need[PLanguageIndex]));
  DateEndEdit.SetFocus;
  exit;
 end;
 if PercentEdit.Text = '' then begin
  ShowMessage(pchar(st_ConstUnit.st_Percent_need[PLanguageIndex]));
  PercentEdit.SetFocus;
  exit;
 end;
 if not FloatCheck(PercentEdit.Text) then begin
  ShowMessage(pchar(st_ConstUnit.st_PercentNotCorrect[PLanguageIndex]));
  PercentEdit.SetFocus;
  exit;
 end;
  if PercentEdit.Value > 100.00001 then begin
  ShowMessage(pchar(st_ConstUnit.st_PercentMoreCTONotCorrect[PLanguageIndex]));
  PercentEdit.SetFocus;
  exit;
 end;
 ModalResult := mrOK;
end;

procedure TLgotaAddPersent_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TLgotaAddPersent_Form.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if Key = #13 then DateEndEdit.SetFocus;
end;

procedure TLgotaAddPersent_Form.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then PercentEdit.SetFocus;
end;

procedure TLgotaAddPersent_Form.PercentEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then OKButton.SetFocus;
end;

procedure TLgotaAddPersent_Form.FormShow(Sender: TObject);
begin
PercentEdit.SetFocus;
end;

procedure TLgotaAddPersent_Form.FormCreate(Sender: TObject);
begin
FormIniLanguage();
end;

end.
