{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                      Модуль "Добавление и изменение стоимости продукции"     }
{       Добавление и изменение стоимости продукции, входящей в заданный        }
{       прейскурант                                                            }
{                                               ответственный: Андрей Таганский}

unit dt_Cost_Product_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, tagBaseTypes,  ActnList, tagSys_Options, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons,
  FIBQuery, pFIBQuery, cxDropDownEdit, cxCurrencyEdit, cxCalendar, Variants;

type
  Tdt_Cost_Product_Form_Add = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label2: TLabel;
    ActionList1: TActionList;
    ActionExit: TAction;
    Label7: TLabel;
    Name_Cat_Cust: TcxButtonEdit;
    Name_Unit_Meas: TcxTextEdit;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    Query: TpFIBQuery;
    qnt_unit_meas: TcxComboBox;
    Name_Product: TcxTextEdit;
    TotalEdit: TcxCurrencyEdit;
    Cost_nds: TcxCurrencyEdit;
    Cost: TcxCurrencyEdit;
    NDS_Edit: TcxCurrencyEdit;
    DateBegEdit: TcxDateEdit;
    DateEndEdit: TcxDateEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label8: TLabel;
    Label9: TLabel;
    procedure ApplyButtonClick(Sender: TObject);
    procedure qnt_unit_measKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure costKeyPress(Sender: TObject; var Key: Char);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Name_Cat_CustPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TotalEditKeyPress(Sender: TObject; var Key: Char);
    procedure CostPropertiesChange(Sender: TObject);
    procedure TotalEditPropertiesChange(Sender: TObject);
    procedure DateBegEditKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
   PK_ID          : variant;

   _id_product    : integer;
   _id_cat_cust   : variant;
   _qnt_unit_meas : integer;
   _cost          : currency;
   _cost_nds      : currency;
   _date_beg      : TDate;
   _date_end      : TDate;
  end;

var
  dt_Cost_Product_Form_Add : Tdt_Cost_Product_Form_Add;

implementation

uses sp_Product, fpop_PackageLoader, Math;

{$R *.DFM}

procedure Tdt_Cost_Product_Form_Add.ApplyButtonClick(Sender: TObject);
var
 s : string;
begin
 if Name_Cat_Cust.Text = '' then begin
  ShowMessage('Ви не обрали категорію споживачів!');
  Name_Cat_Cust.SetFocus;
  Exit;
 end;

 if DateBegEdit.Text = '' then begin
  ShowMessage('Вкажіть дату початку періоду!');
  DateBegEdit.SetFocus;
  Exit;
 end;

 if DateEndEdit.Text = '' then begin
  ShowMessage('Вкажіть дату закінчення періоду!');
  DateEndEdit.SetFocus;
  Exit;
 end;

 if DateBegEdit.Date > DateEndEdit.Date then begin
  ShowMessage('Дата початку періоду не може бути більше ніж дата його закінчення!');
  DateBegEdit.SetFocus;
  Exit;
 end;

 Query.Transaction := (Owner as Tsp_Product_Form).ReadTransaction;

 s := 'select * from PL_CHECK_COST_PRODUCT_STAGE(' + IntToStr(_id_Product) + ',';

 if VarIsNull(_id_Cat_Cust) then s := s + ' null, '
 else s := s + IntToStr(_id_Cat_Cust) + ',';

 s := s + QuotedStr(DateToStr(DateBegEdit.Date)) + ','
 + QuotedStr(DateToStr(DateEndEdit.Date)) + ',';

 if VarIsNull(PK_ID) then s := s + ' null'
 else s := s + IntToStr(PK_ID);

 s := s + ')';

 Query.SQL.Text := s;

 Query.ExecQuery;

 if Query['Result'].AsInteger = 1 then begin
  ShowMessage('Неможна додати вартість продукції [' + Name_Product.Text
  + '] у заданому періоді, тому що є інші періоди, що перетинають його!');

  Query.Close;
  Exit;
 end
 else Query.Close;

 if qnt_unit_meas.Text = '' then begin
  ShowMessage('Заповніть графу кількістю одиниць виміру');
  Exit;
 end;

 if (Name_Product.Text = '') or (Name_Cat_Cust.Text = '') then begin
  ShowMessage('Ви не вказали вартість продукції!');
  Exit;
 end;

 _qnt_unit_meas := StrToInt(qnt_unit_meas.Text);
 _cost     := cost.Value;
 _cost_nds := TotalEdit.Value;
 _date_beg := DateBegEdit.Date;
 _date_end := DateEndEdit.Date;

 ModalResult := mrOk;
end;

procedure Tdt_Cost_Product_Form_Add.qnt_unit_measKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #9]) then Key := #0;
 if Key = #13 then cost.SetFocus;
end;

procedure Tdt_Cost_Product_Form_Add.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Cost_Product_Form_Add.costKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  TotalEdit.SetFocus;
 end;
end;

procedure Tdt_Cost_Product_Form_Add.TotalEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  DateBegEdit.SetFocus;
 end;
end;

procedure Tdt_Cost_Product_Form_Add.ActionExitExecute(Sender: TObject);
begin
 CancelButtonClick(Sender);
end;

procedure Tdt_Cost_Product_Form_Add.FormCreate(Sender: TObject);
begin
 if (SYS_NDS > 0) and (SYS_NDS < 1) then NDS_Edit.Text := FloatToStrF(SYS_NDS, ffFixed, 12, 2)
 else NDS_Edit.Text := '0';
end;

procedure Tdt_Cost_Product_Form_Add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure Tdt_Cost_Product_Form_Add.Name_Cat_CustPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 opt    : TSpravOptions;
 Result : variant;
begin
 if Name_Product.Text = '' then Exit;

 opt.canAdd     := true;
 opt.canEdit    := true;
 opt.canDelete  := true;
 opt.canSelect  := true;
 opt.HideButtons := false;
 opt.isModal := true;

 Result := ShowCatCustomer(Self, (Owner as Tsp_Product_Form).DataBase.Handle,
 (Owner as Tsp_Product_Form).ReadTransaction.Handle, fsNormal);

 if VarIsNull(Result) then Exit;

 _id_cat_cust       := Result[0];
 Name_Cat_Cust.Text := Result[1];
end;

procedure Tdt_Cost_Product_Form_Add.CostPropertiesChange(Sender: TObject);
begin
 TotalEdit.Properties.OnChange := nil;

 Cost_nds.Text  := FloatToStrF(Cost.Value * NDS_Edit.Value, ffFixed, 100, 6);
 TotalEdit.Text := FloatToStrF(Cost.Value + Cost_nds.Value, ffFixed, 100, 6);

 TotalEdit.Properties.OnChange := TotalEditPropertiesChange;
end;

procedure Tdt_Cost_Product_Form_Add.TotalEditPropertiesChange(
  Sender: TObject);
begin
 Cost.Properties.OnChange := nil;

 cost_nds.Text := FloatToStrF(TotalEdit.Value - TotalEdit.Value / (NDS_Edit.Value + 1), ffFixed, 100, 6);
 Cost.Text     := FloatToStrF(TotalEdit.Value - cost_nds.Value, ffFixed, 100, 6);

 Cost.Properties.OnChange := CostPropertiesChange;
end;

procedure Tdt_Cost_Product_Form_Add.DateBegEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  DateEndEdit.SetFocus;
 end;
end;

procedure Tdt_Cost_Product_Form_Add.DateEndEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then begin
  Key := #0;
  ApplyButton.SetFocus;
 end;
end;

procedure Tdt_Cost_Product_Form_Add.FormShow(Sender: TObject);
begin
 Cost.Properties.OnChange := CostPropertiesChange;
 TotalEdit.Properties.OnChange := TotalEditPropertiesChange;
end;

end.
