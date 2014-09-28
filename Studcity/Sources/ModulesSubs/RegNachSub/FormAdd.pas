unit FormAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxCalendar, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  cxButtons, cxCheckBox, cxGroupBox, cxLabel, cxRadioGroup, st_proc, st_constUnit;

type
  TFormRegNachSubAdd = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxCalcEdit1: TcxCalcEdit;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    DataBeg: TcxLabel;
    DataEnd: TcxLabel;
    Summa: TcxLabel;
    Formir: TcxGroupBox;
    Prop: TcxRadioButton;
    Pospis: TcxRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    PLanguageIndex:integer;
    { Public declarations }
  end;

var
  FormRegNachSubAdd: TFormRegNachSubAdd;


implementation

uses DateUtils;

{$R *.dfm}

procedure TFormRegNachSubAdd.FormCreate(Sender: TObject);
begin
 cxDateEdit1.date:=Today;
 cxDateEdit2.date:=Today;
 PLanguageIndex:=st_proc.cnLanguageIndex;
 FormRegNachSubAdd.Caption:=st_InsertBtn_Caption[PLanguageIndex]+'...';
 DataBeg.Caption:=st_grid_Date_Beg[PLanguageIndex];
 DataEnd.Caption:=st_grid_Date_End[PLanguageIndex];
 Summa.Caption:=st_Sum[PLanguageIndex];
 Formir.Caption:=st_SpravCaption[PLanguageIndex];
 OKButton.Caption:=st_Accept[PLanguageIndex];
 CancelButton.Caption:=st_Cancel[PLanguageIndex];
end;

procedure TFormRegNachSubAdd.CancelButtonClick(Sender: TObject);
begin
 close;
end;

procedure TFormRegNachSubAdd.OKButtonClick(Sender: TObject);
begin
 ModalResult:=mrOk;
end;

end.
