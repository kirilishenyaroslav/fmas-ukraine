unit EditSumDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, Mask, ToolEdit, CurrEdit,
  cxButtons, ExtCtrls, LoadDogManedger;

type
  TFrmEditSum = class(TForm)
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
  end;

  function EditSum(AOwner : TComponent;  is_nds: Integer; sum_pay, nds_pay, sum_dog, sum_nds: Currency):Variant; stdcall;
  exports EditSum;


var
  FrmEditSum: TFrmEditSum;
  sum_edit, nds_edit: Currency;//сумма не должна быть меньше чем была!
  p_sum_pay, p_nds_pay, p_sum_dog, p_sum_nds: Currency;
  p_is_nds: Integer;
  ResultValue: Variant;

implementation

{$R *.dfm}

function EditSum(AOwner : TComponent;  is_nds: Integer; sum_pay, nds_pay, sum_dog, sum_nds: Currency):Variant;
var
  frm: TFrmEditSum;
  Res: Variant;
begin
  frm := TFrmEditSum.Create(Aowner);
  p_sum_pay := sum_pay;
  p_nds_pay := nds_pay;
  p_sum_dog := sum_dog;
  p_sum_nds := sum_nds;
  p_is_nds  := is_nds;
  frm.CurrencyEdit_summa.Value := sum_dog;
  frm.CurrencyEdit_s_nds.Value := sum_nds;
  //1-есть НДС 2-нет НДС
  if is_nds = 2 then
  begin
    frm.CheckBox2.Visible := false;
    frm.CurrencyEdit_s_nds.Visible := false;
  end;
  if frm.ShowModal = mrYes then
    begin
      Res := ResultValue;
      EditSum := Res;
    end;
  frm.Free;
end;


procedure TFrmEditSum.cxButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmEditSum.cxButton1Click(Sender: TObject);
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
    if sum_edit < p_sum_pay then
    begin
      ShowMessage('Сума документа не може бути менше оплаченої суми!');
      CurrencyEdit_summa.Text := CurrToStr(p_sum_pay);
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
    if nds_edit < p_nds_pay then
    begin
      ShowMessage('Сума ПДВ не може бути менше суми оплаченого ПДВ!');
      CurrencyEdit_s_nds.Text := CurrToStr(p_nds_pay);
      exit;
    end;
  end;


  //НДС больше суммы
//  if (CheckBox1.Checked) and (CheckBox2.Checked) then
//  begin
    if nds_edit > sum_edit then
    begin
      ShowMessage('Сума ПДВ не може перевищувати суму документа!');
      Exit;
    end;
//  end;

  //если 1, то нужно изменять
  ResultValue  := VarArrayCreate([0,1],varVariant);
  if CheckBox1.Checked then
  begin
    ResultValue[0] := CurrencyEdit_summa.Value;
  end
  else
  begin
    ResultValue[0] := -1;
  end;

  if CheckBox2.Checked then
  begin
    ResultValue[1] := CurrencyEdit_s_nds.Value;
  end
  else
  begin
    ResultValue[1] := -1;
  end;
  ModalResult := mrYes;
end;

procedure TFrmEditSum.CurrencyEdit_summaExit(Sender: TObject);
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

procedure TFrmEditSum.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    CurrencyEdit_summa.Enabled := true;
    CurrencyEdit_summa.SetFocus;
  end
  else
  CurrencyEdit_summa.Enabled := false;
end;

procedure TFrmEditSum.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    CurrencyEdit_s_nds.Enabled := true;
    CurrencyEdit_s_nds.SetFocus;
  end
  else
  CurrencyEdit_s_nds.Enabled := false;
end;

procedure TFrmEditSum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
