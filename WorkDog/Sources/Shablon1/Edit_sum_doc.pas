unit Edit_sum_doc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, Mask, ToolEdit, CurrEdit,
  cxButtons, ExtCtrls;

type
  TForm_edit_sum = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    CurrencyEdit_summa: TCurrencyEdit;
    CurrencyEdit_s_nds: TCurrencyEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure CurrencyEdit_summaExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  procedure Sum_doc(sum_doc_pay , sum_nds_pay: Currency);
  constructor Create (Aowner: TComponent);
    { Public declarations }
  end;

var
  Form_edit_sum: TForm_edit_sum;
  sum_d, sum_edit, nds_edit, sum_nds: Currency;//сумма не должна быть меньше чем была!

implementation
uses
  Shablon1;

{$R *.dfm}

constructor TForm_edit_sum.Create(Aowner: TComponent);
begin
  inherited Create (Aowner);
end;

procedure TForm_edit_sum.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm_edit_sum.cxButton1Click(Sender: TObject);
var
  pr_d, pr_n: Integer;
  s_nds, s_doc: Currency;
begin
//изменение суммы документа
  if CheckBox1.Checked then
  begin
    if CurrencyEdit_summa.Text = '' then
    begin
      ShowMessage('Введіть суму!');
      exit;
    end;

    sum_edit := CurrencyEdit_summa.Value;
    if sum_edit < sum_d then
    begin
      ShowMessage('Сума документа не може бути менше оплаченої суми!');
      CurrencyEdit_summa.Text := CurrToStr(sum_d);
      exit;
    end;
  end;

//изменение НДС
  if CheckBox2.Checked then
  begin
   { if CurrencyEdit_s_nds.Text = '' then
    begin
      ShowMessage('Введіть суму ПДВ!');
      exit;
    end;
   }
    nds_edit := CurrencyEdit_s_nds.Value;
    if nds_edit < sum_nds then
    begin
      ShowMessage('Сума ПДВ не може бути менше суми оплаченого ПДВ!');
      CurrencyEdit_s_nds.Text := CurrToStr(sum_nds);
      exit;
    end;
  end;


  //НДС больше суммы
  if (CheckBox1.Checked) and (CheckBox2.Checked) then
  begin
    if nds_edit > sum_edit then
    begin
      ShowMessage('Сума ПДВ не може перевищувати суму документа!');
      Exit;
    end;
  end;

  //если 1, то нужно изменять
  if CheckBox1.Checked then pr_d := 1;
  if CheckBox2.Checked then pr_n := 1;
  s_nds := CurrencyEdit_s_nds.Value;
  s_doc := CurrencyEdit_summa.Value;

  Close;

end;

procedure TForm_edit_sum.Sum_doc(sum_doc_pay, sum_nds_pay: Currency);
begin
  sum_d := sum_doc_pay;
  sum_nds := sum_nds_pay;
end;

procedure TForm_edit_sum.CurrencyEdit_summaExit(Sender: TObject);
var
  sum_doc: Currency;
begin
{  if MessageBox(Handle,PChar('Перерахувати ПДВ відповідно до нової суми документа?'),
  'Підтвердження',MB_YesNo or MB_Iconquestion) = mrYes then
  begin
   CurrencyEdit_s_nds.Enabled := true;
   CheckBox2.Checked;
   sum_doc := CurrencyEdit_summa.Value;
   pFIBDataSet_nds_procent.Database := pFIBDatabase;
   pFIBDataSet_nds_procent.Transaction := pFIBTransactionRead;
   pFIBDataSet_nds_procent.Active := false;
   pFIBDataSet_nds_procent.ParamByName('D_D_DOG').Value := cxDateEdit_dog.Text;
   pFIBDataSet_nds_procent.Active := true;
   nds_procent := pFIBDataSet_nds_procent.FieldByName('D_NDS_PROCENT').AsVariant;
   if nds_procent<=0 then nds_procent := 20;
   sum_nds := (sum_doc*nds_procent)/(100+nds_procent);
   CurrencyEdit_nds.Text := VarToStr(sum_nds);
 end;}
end;

procedure TForm_edit_sum.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CurrencyEdit_summa.Enabled := true;
    CurrencyEdit_summa.SetFocus;
  end
  else
  CurrencyEdit_summa.Enabled := false;
end;

procedure TForm_edit_sum.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    CurrencyEdit_s_nds.Enabled := true;
    CurrencyEdit_s_nds.SetFocus;
  end
  else
  CurrencyEdit_s_nds.Enabled := false;
end;

procedure TForm_edit_sum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
