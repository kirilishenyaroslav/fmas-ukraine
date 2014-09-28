unit uPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxSpinEdit, cxCheckBox, ActnList,
  cxLookAndFeelPainters, cxButtons, DateUtils, uMainPerem;

type
  TPrintForm = class(TForm)
    cxReport: TcxComboBox;
    lbl1: TLabel;
    chbPrinter: TcxCheckBox;
    chbChoosePrinter: TcxCheckBox;
    lbl2: TLabel;
    cxCopies: TcxSpinEdit;
    cxCheckEdit: TcxCheckBox;
    actlst1: TActionList;
    act1: TAction;
    btn1: TcxButton;
    btn2: TcxButton;
    actOk: TAction;
    actClose: TAction;
    cxBeg: TcxSpinEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    cxEnd: TcxSpinEdit;
    cxMonthEnd: TcxComboBox;
    cxMonthBeg: TcxComboBox;
    procedure FormCreate(Sender: TObject);
    procedure act1Execute(Sender: TObject);
    procedure actOkExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure cxReportPropertiesChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrintForm: TPrintForm;

implementation

{$R *.dfm}

procedure TPrintForm.FormCreate(Sender: TObject);
var month, year:Word;
begin
 cxReport.ItemIndex:=0;
 cxCopies.Value:=1;
 cxCheckEdit.Visible:=False;
 month:=MonthOf(PERS_PAY_PERIOD);
 year:=YearOf(PERS_PAY_PERIOD);
 cxMonthBeg.ItemIndex:=month-1;
 cxBeg.value:=year;
 cxMonthEnd.ItemIndex:=month-1;
 cxEnd.value:=year;

 cxMonthEnd.Enabled:=False;
 cxMonthBeg.Enabled:=False;
 cxBeg.Enabled:=False;
 cxEnd.Enabled:=False;
 lbl3.Enabled:=False;
 lbl4.Enabled:=False;

 chbChoosePrinter.Checked:=True;
 if ID_SYSTEM = 'STUD_CITY' then cxReport.Properties.Items.Add('Список боржників за період');
end;

procedure TPrintForm.act1Execute(Sender: TObject);
begin
 cxCheckEdit.Visible:=not(cxCheckEdit.Visible);
end;



procedure TPrintForm.actOkExecute(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

procedure TPrintForm.actCloseExecute(Sender: TObject);
begin
 Close;
end;

procedure TPrintForm.cxReportPropertiesChange(Sender: TObject);
begin
 if ((cxReport.ItemIndex =  3) or (cxReport.ItemIndex = 4) or (cxReport.ItemIndex = 6))
 then
 begin
   cxMonthEnd.Enabled:=True;
   cxMonthBeg.Enabled:=True;
   cxBeg.Enabled:=True;
   cxEnd.Enabled:=True;
   lbl3.Enabled:=True;
   lbl4.Enabled:=True;
 end
 else
 begin
   cxMonthEnd.Enabled:=False;
   cxMonthBeg.Enabled:=False;
   cxBeg.Enabled:=False;
   cxEnd.Enabled:=False;
   lbl3.Enabled:=False;
   lbl4.Enabled:=False;
 end;
end;

end.
