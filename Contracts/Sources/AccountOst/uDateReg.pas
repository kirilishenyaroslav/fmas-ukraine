unit uDateReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  cn_common_types, cn_common_funcs,cnConsts;

type
  TfrmDateReg = class(TForm)
    ButtonOk: TcxButton;
    ButtonCansel: TcxButton;
    cxLabel1: TcxLabel;
    ComboBox_month: TcxComboBox;
    ComboBox_year: TcxComboBox;
    constructor Create(AParameter:TcnSimpleParams); overload;
    procedure ButtonCanselClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    is_admin:boolean;
    { Private declarations }
  public
    PLanguageIndex:byte;
    pParameter:TcnSimpleParams;
    { Public declarations }
  end;

  function ShowAccountOst(AParameter:TcnSimpleParams):Variant;stdcall;
  exports ShowAccountOst;

var
  frmDateReg: TfrmDateReg;

implementation

uses DateUtils, uAccountOst_Main;

{$R *.dfm}
function ShowAccountOst(AParameter:TcnSimpleParams):Variant;stdcall;
var ViewForm:TfrmDateReg;
begin
 ViewForm := TfrmDateReg.Create(AParameter);
 ViewForm.ShowModal;
 ViewForm.Free;
end;

Constructor TfrmDateReg.Create(AParameter:TcnSimpleParams);
Const
  month:array[1..12,1..2]of string=(('Січень','Январь'),('Лютий','Февраль'),('Березень','Март'),('Квітень','Апрель'),('Травень','Май'),('Липень','Июнь'),('Червень','Июль'),('Серпень','Август'),('Вересень','Сентябрь'),('Жовтень','Октябрь'),('Листопад','Ноябрь'),('Грудень','Декабрь'));
Var
  i:integer;
  year:word;
Begin
  inherited create(AParameter.Owner);
  
  pParameter:=AParameter;
  caption:='';

  PLanguageIndex:=cn_Common_Funcs.cnLanguageIndex();
  year:=YearOf(date);
  ComboBox_year.Properties.Items.Clear;
  for i:=year-5 to year+5 do
   ComboBox_year.Properties.Items.Add(IntToStr(i));
  ComboBox_year.ItemIndex:=5;

  ComboBox_month.Properties.Items.Clear;
  for i:=1 to 12 do
   ComboBox_month.Properties.Items.Add(month[i,PLanguageIndex]);
  ComboBox_month.ItemIndex:=MonthOf(date)-1;

  cxLabel1.Caption:=cn_Borg[PLanguageIndex]+' на';
End;

procedure TfrmDateReg.ButtonCanselClick(Sender: TObject);
begin
  close;
end;

procedure TfrmDateReg.ButtonOkClick(Sender: TObject);
Var
 T:TfrmAccountOst_main;
 D:TDate;
begin
  D:=StrToDate('01.'+IntToStr(ComboBox_month.ItemIndex+1)+'.'+ComboBox_year.Text);
  T:=TfrmAccountOst_main.Create(pParameter,D);
  T.ShowModal;
  T.Free;
  Close;  
end;

procedure TfrmDateReg.FormCreate(Sender: TObject);
begin
  caption:='';
  ButtonOk.Caption:= cn_accept[PLanguageIndex];
  ButtonOk.Hint:= cn_accept[PLanguageIndex];

  ButtonCansel.Caption:= cn_cancel[PLanguageIndex];
  ButtonCansel.Hint:= cn_cancel[PLanguageIndex];
end;

end.
