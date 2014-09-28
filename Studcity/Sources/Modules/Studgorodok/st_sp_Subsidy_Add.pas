//***********************************************************************
//* Проект "Студгородок"                                                *
//* Добавление субсидии                                                 *
//* Выполнил: Чернявский А.Э. 2004-2005 г.                              *
//***********************************************************************
unit st_sp_Subsidy_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxLabel, cxControls,
  cxContainer, cxEdit, cxGroupBox, StdCtrls, cxButtons, St_Proc, st_ConstUnit;

type
  TSubsidy_Add_Form = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    NameLabel: TcxLabel;
    NameEdit: TcxTextEdit;
    MinPerLabel: TcxLabel;
    MinPeriod_Edit: TcxTextEdit;
    MaxPerLabel: TcxLabel;
    MaxPeriod_Edit: TcxTextEdit;
    Short_NameEdit: TcxTextEdit;
    ShortLabel: TcxLabel;
    Month_Edit: TcxTextEdit;
    MonthCountLabel: TcxLabel;
    cxGroupBox: TcxGroupBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure Short_NameEditKeyPress(Sender: TObject; var Key: Char);
    procedure MinPeriod_EditKeyPress(Sender: TObject; var Key: Char);
    procedure MaxPeriod_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Month_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    PLanguageIndex: byte;
    procedure FormIniLanguage();
  public
    { Public declarations }
  end;

var
  Subsidy_Add_Form: TSubsidy_Add_Form;

implementation
uses Unit_of_Utilits;
{$R *.dfm}

procedure TSubsidy_Add_Form.FormIniLanguage();
begin
 // индекс языка (1-укр, 2 - рус)
 PLanguageIndex:=               St_Proc.cnLanguageIndex;
 //названия кнопок
 OKButton.Caption :=         st_ConstUnit.st_Accept[PLanguageIndex];
 CancelButton.Caption :=     st_ConstUnit.st_Cancel[PLanguageIndex];

 NameLabel.Caption:= st_ConstUnit.st_NameLable[PLanguageIndex];
 ShortLabel.Caption:= st_ConstUnit.st_ShortLable[PLanguageIndex];
 cxGroupBox.Caption:= st_ConstUnit.st_Periods[PLanguageIndex];
 MinPerLabel.Caption:= st_ConstUnit.st_MinPeriod[PLanguageIndex];
 MaxPerLabel.Caption:= st_ConstUnit.st_MaxPeriod[PLanguageIndex];
 MonthCountLabel.Caption:= st_ConstUnit.st_KolVoMes[PLanguageIndex];
end;

procedure TSubsidy_Add_Form.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TSubsidy_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TSubsidy_Add_Form.OKButtonClick(Sender: TObject);
begin
if NameEdit.Text='' then begin
ShowMessage(PChar(st_ConstUnit.st_SubsName_need[PLanguageIndex]));
NameEdit.SetFocus;
exit;
end;
if Short_NameEdit.Text='' then begin
ShowMessage(PChar(st_ConstUnit.st_SubsShort_need[PLanguageIndex]));
Short_NameEdit.SetFocus;
exit;
end;
if MinPeriod_Edit.Text='' then begin
ShowMessage(PChar(st_ConstUnit.st_SubsMin_need[PLanguageIndex]));
MinPeriod_Edit.SetFocus;
exit;
end;

if MaxPeriod_Edit.Text='' then begin
ShowMessage(PChar(st_ConstUnit.st_SubsMax_need[PLanguageIndex]));
MaxPeriod_Edit.SetFocus;
exit;
end;
if Month_Edit.Text='' then begin
ShowMessage(PChar(st_ConstUnit.st_SubsMonth_need[PLanguageIndex]));
Month_Edit.SetFocus;
exit;
end;
if IntegerCheck(MinPeriod_Edit.Text)=false then begin
ShowMessage(PChar(st_ConstUnit.st_SubsMinNotCorrect[PLanguageIndex]));
MinPeriod_Edit.SetFocus;
exit;
end;
if IntegerCheck(MaxPeriod_Edit.Text)=false then begin
ShowMessage(PChar(st_ConstUnit.st_SubsMaxNotCorrect[PLanguageIndex]));
MaxPeriod_Edit.SetFocus;
exit;
end;
if strtoint(MinPeriod_Edit.Text)> strtoint(MaxPeriod_Edit.Text)then begin
ShowMessage(PChar(st_ConstUnit.st_SubsMinMaxMore_need[PLanguageIndex]));
MaxPeriod_Edit.SetFocus;
exit;
end;
if IntegerCheck(Month_Edit.Text)=false then begin
ShowMessage(PChar(st_ConstUnit.st_SubsMonthNotCorrect[PLanguageIndex]));
Month_Edit.SetFocus;
exit;
end;
ModalResult:=mrOk;
end;


procedure TSubsidy_Add_Form.NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Short_NameEdit.SetFocus;
end;

procedure TSubsidy_Add_Form.Short_NameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then MinPeriod_Edit.SetFocus;
end;

procedure TSubsidy_Add_Form.MinPeriod_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then MaxPeriod_Edit.SetFocus;
end;

procedure TSubsidy_Add_Form.MaxPeriod_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then Month_Edit.SetFocus;
end;

procedure TSubsidy_Add_Form.Month_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OKButton.SetFocus;
end;

procedure TSubsidy_Add_Form.FormShow(Sender: TObject);
begin
NameEdit.SetFocus;
end;

procedure TSubsidy_Add_Form.FormCreate(Sender: TObject);
begin
FormIniLanguage();
end;

end.
