{******************************************************************************}
{               Автоматизированная система «Формирование планов основного      }
{                          производства ГПП «Укрпромводчермет»                 }
{               (c) Донецкий национальный университет, 2002-2003               }
{******************************************************************************}

{                      Модуль "Добавление продукции продукции"                 }
{       Добавление и изменение продукции и ее единицы измерения в план}
{                                               ответственный: Андрей Таганский}

unit AddProduct;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FIBQuery, pFIBQuery, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons;

type
  TAddProductForm = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Query: TpFIBQuery;
    NameProduct: TcxButtonEdit;
    NameUnitMeas: TcxButtonEdit;
    NameCatCust: TcxTextEdit;
    Button1: TcxButton;
    Button2: TcxButton;
    procedure NameProductButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure NameUnitMeasButtonClick(Sender: TObject; AButtonIndex: Integer);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
   id_Product      : integer;
   id_Cat_Cust     : integer;
   Name_Product    : string;
   Name_Cat_Cust   : string;
   Need_Cat_Cust   : boolean;
   Need_Objects    : boolean;

   id_Unit_Meas    : integer;
   Name_Unit_Meas  : string;
   Coefficient     : integer;
   DispOrder_Prod  : integer;
   Display_Order   : integer;

   id_Group_UnitM  : integer;
  end;

var
 AddProductForm  : TAddProductForm;

implementation

{$R *.DFM}

uses tagSys_Options, tagBaseTypes, Add_Product, PlanEditor, DataModule, fpop_PackageLoader;

procedure TAddProductForm.NameProductButtonClick(Sender: TObject; AButtonIndex: Integer);
var
 opt            : TSpravOptions;
 Result         : TResultArray;
 i              : integer;
 k              : integer;

 Flag           : boolean;
begin
 Opt.canSelect     := True;
 Opt.canDelete     := True;
 Opt.HideButtons   := False;
 Opt.isModal       := True;

 Result := Add_Product_Form.tagShow(opt);
 if Length(Result) = 0 then Exit;

 id_Product     := Result[0];
 Name_Product   := Result[1];
 id_Cat_Cust    := Result[2];
 Name_Cat_Cust  := Result[3];
 Need_Cat_Cust  := Result[5];
 Need_Objects   := Result[6];
 DispOrder_Prod := Result[9];
 Display_Order  := Result[10];

 NameProduct.Text := Name_Product;
 if Need_Cat_Cust then
  NameCatCust.Text := Name_Cat_Cust
 else
  NameCatCust.Text := 'Не потребує категорію споживачів';

 Flag := True;
 for i := 0 to PlanEditorForm.ProductTreeList.Count - 2 do
  if PlanEditorForm.ProductTreeList.Items[i].Values[0] = id_Product then begin
   Flag := False;

   NameUnitMeas.Text    := PlanEditorForm.ProductTreeList.Items[i].Values[4];
   Name_Unit_Meas       := PlanEditorForm.ProductTreeList.Items[i].Values[4];
   id_Unit_Meas         := PlanEditorForm.ProductTreeList.Items[i].Values[7];
   Coefficient          := PlanEditorForm.ProductTreeList.Items[i].Values[8];
   NameUnitMeas.Enabled := False;

   Break;
  end;

 if Flag then begin
  NameUnitMeas.Enabled := True;

  id_Unit_Meas   := Result[7];
  Name_Unit_Meas := Result[4];
  Coefficient    := Result[8];

  NameUnitMeas.Text := Name_Unit_Meas;

  Query.SQL.Text := 'select id_Group_UnitM from ini_Unit_Meas where id_Unit_Meas='
  + IntToStr(id_Unit_Meas);
  Query.ExecQuery;

  k := Query.RecordCount;
  Query.Close;

  if k = 0 then Exit;

  id_Group_UnitM := Query.Fields[0].AsInteger;
 end;
end;

procedure TAddProductForm.NameUnitMeasButtonClick(Sender: TObject; AButtonIndex: Integer);
var
 i, o  : TSpravParams;
begin
 if (NameProduct.Text = '') or (id_Group_UnitM < 0) then Exit;

 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer(dm.Database.Handle);
 i.Values['ReadTransaction'] := Integer(dm.ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer(dm.WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('FPOP\ini_unit_meas.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  id_unit_meas   := o.Values['ID_UNIT_MEAS'];
  Name_Unit_Meas := o.Values['NAME_UNIT_MEAS'];
  Coefficient    := o.Values['KOEF'];
 end;

 NameUnitMeas.Text := Name_Unit_Meas;
end;

procedure TAddProductForm.Button2Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TAddProductForm.Button1Click(Sender: TObject);
begin
 if NameProduct.Text = '' then begin
  ShowMessage('Ви не обрали продукцію, що додавати!');
  Exit;
 end;

 if NameUnitMeas.Text = '' then begin
  ShowMessage('Ви не обрали одиницю виміру продукції!');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure TAddProductForm.FormCreate(Sender: TObject);
begin
 id_Group_UnitM := -1;
end;

end.
