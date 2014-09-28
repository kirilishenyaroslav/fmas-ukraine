unit sp_Product_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxCheckBox, cxRadioGroup, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, dogLoaderUnit;

type
  Tsp_Product_Add_Form = class(TForm)
    Label1: TLabel;
    NameEdit: TcxTextEdit;
    KindRadioGroup: TcxRadioGroup;
    LevelRadioGroup: TcxRadioGroup;
    Bevel1: TBevel;
    CancelButton: TcxButton;
    OkButton: TcxButton;
    CheckBox1: TcxCheckBox;
    CheckBox2: TcxCheckBox;
    CheckBox3: TcxCheckBox;
    CheckBox4: TcxCheckBox;
    Bevel2: TBevel;
    NameUnitMeasLabel: TLabel;
    NameUnitMeasEdit: TcxButtonEdit;
    procedure KindRadioGroupPropertiesChange(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure NameUnitMeasEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
   id_unit_meas : integer;
   is_Edit      : boolean; // Признак того, что форма открыта в режиме редактирования или добавления
   destructor Destroy; override;
  end;

var
  sp_Product_Add_Form: Tsp_Product_Add_Form;

implementation

{$R *.dfm}

uses sp_Product_Form;

procedure Tsp_Product_Add_Form.KindRadioGroupPropertiesChange(
  Sender: TObject);
begin
 if KindRadioGroup.ItemIndex = 0 then begin
  if is_Edit then Caption := 'Змінити тип продукції' else Caption := 'Додати тип продукції';
  Label1.Caption := 'Назва типу продукції';
  CheckBox1.Visible := False;
  CheckBox2.Visible := False;
  CheckBox3.Visible := False;
  CheckBox4.Visible := False;
  Bevel2.Visible    := False;
  Bevel1.Height     := 138;

  LevelRadioGroup.Top := 57;
  KindRadioGroup.Top  := 57;

  NameUnitMeasEdit.Visible  := False;
  NameUnitMeasLabel.Visible := False;

  Height            := 216;
 end
 else begin
  if is_Edit then Caption := 'Змінити продукцію' else Caption := 'Додати продукцію';
  Label1.Caption := 'Назва продукції';
  CheckBox1.Visible := True;
  CheckBox2.Visible := True;
  CheckBox3.Visible := True;
  CheckBox4.Visible := True;
  Bevel2.Visible    := True;
  Bevel1.Height     := 170;

  LevelRadioGroup.Top := 88;
  KindRadioGroup.Top  := 88;

  NameUnitMeasEdit.Visible  := True;
  NameUnitMeasLabel.Visible := True;

  Height            := 329;
 end;

 if is_Edit then Exit;

 if sp_product_form1.TreeList.FocusedNode = nil then begin
  KindRadioGroup.ItemIndex  := 0;
  LevelRadioGroup.ItemIndex := 0;
 end
 else if not VarIsNull(sp_product_form1.TreeList.FocusedNode.Values[1]) then begin
  LevelRadioGroup.ItemIndex := 0;
 end;
end;

procedure Tsp_Product_Add_Form.OkButtonClick(Sender: TObject);
begin
 if NameEdit.Text = '' then begin
  if KindRadioGroup.ItemIndex = 0 then ShowMessage('Заповніть поле із назвою типу продукції')
  else if KindRadioGroup.ItemIndex = 1 then ShowMessage('Заповніть поле із назвою продукції');

  Exit;
 end;

 if (KindRadioGroup.ItemIndex = 1) and (NameUnitMeasEdit.Text = '') then begin
  ShowMessage('Оберіть одиницю виміру продукції');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure Tsp_Product_Add_Form.NameUnitMeasEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer((Owner as Tsp_product_form1).WorkDatabase.Handle);
 i.Values['ReadTransaction'] := Integer((Owner as Tsp_product_form1).ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer((Owner as Tsp_product_form1).WriteTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('WorkDog\ini_unit_meas.bpl', Self, i, o);
 if o.Values['ModalResult'] = mrOk then begin
  NameUnitMeasEdit.Text := o.Values['name_Unit_Meas'];
  id_unit_meas        := o.Values['id_Unit_Meas'];
 end;
end;

destructor Tsp_Product_Add_Form.Destroy;
begin
  sp_Product_Add_Form := nil;
  inherited;
end;

procedure Tsp_Product_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

end.
