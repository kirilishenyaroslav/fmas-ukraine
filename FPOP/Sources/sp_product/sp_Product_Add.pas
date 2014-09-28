unit sp_Product_Add;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons,
  ExtCtrls, cxCheckBox, cxRadioGroup, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit;

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
    NameDepartmentEdit: TcxButtonEdit;
    NameDepartmentLabel: TLabel;
    procedure KindRadioGroupPropertiesChange(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure NameUnitMeasEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NameDepartmentEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   id_unit_meas  : integer;
   id_Department : integer;
   is_Edit       : boolean; // Признак того, что форма открыта в режиме редактирования или добавления
   destructor Destroy; override;
  end;

var
  sp_Product_Add_Form: Tsp_Product_Add_Form;

implementation

{$R *.dfm}

uses sp_Product, tagBaseTypes, {uDepartmentsMain,} tagSYS_Options, fpop_PackageLoader;

procedure Tsp_Product_Add_Form.KindRadioGroupPropertiesChange(
  Sender: TObject);
begin
 if KindRadioGroup.ItemIndex = 0 then begin
  if is_Edit then Caption := 'Змінити тип продукції' else Caption := 'Додати тип продукції';

  Label1.Caption    := 'Назва типу продукції';
  CheckBox1.Visible := False;
  CheckBox2.Visible := False;
  CheckBox3.Visible := False;
  CheckBox4.Visible := False;
  Bevel2.Visible    := False;

  NameUnitMeasEdit.Visible  := False;
  NameUnitMeasLabel.Visible := False;

  NameDepartmentEdit.Visible  := True;
  NameDepartmentLabel.Visible := True;

  NameDepartmentEdit.Left := NameUnitMeasEdit.Left;
  NameDepartmentEdit.Top  := NameUnitMeasEdit.Top;

  NameDepartmentLabel.Left := NameUnitMeasLabel.Left;
  NameDepartmentLabel.Top  := NameUnitMeasLabel.Top;

  Height            := 250;
 end
 else begin
  if is_Edit then Caption := 'Змінити продукцію' else Caption := 'Додати продукцію';
  Label1.Caption := 'Назва продукції';
  CheckBox1.Visible := True;
  CheckBox2.Visible := True;
  CheckBox3.Visible := True;
  CheckBox4.Visible := True;
  Bevel2.Visible    := True;

  NameUnitMeasEdit.Visible  := True;
  NameUnitMeasLabel.Visible := True;

  NameDepartmentEdit.Visible  := False;
  NameDepartmentLabel.Visible := False;

  Height            := 329;
 end;

 if is_Edit then Exit;

 if sp_product_form.TreeList.FocusedNode = nil then begin
  KindRadioGroup.ItemIndex  := 0;
  LevelRadioGroup.ItemIndex := 0;
 end
 else if not VarIsNull(sp_product_form.TreeList.FocusedNode.Values[1]) then begin
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
  ShowMessage('Оберіть одиницю виміру продукції!');
  Exit;
 end;

 if (KindRadioGroup.ItemIndex = 0) and (NameDepartmentEdit.Text = '') then begin
  ShowMessage('Оберіть підрозділ типу продукції!');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure Tsp_Product_Add_Form.NameUnitMeasEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 i, o  : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer((Owner as Tsp_Product_Form).Database.Handle);
 i.Values['ReadTransaction'] := Integer((Owner as Tsp_Product_Form).ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer((Owner as Tsp_Product_Form).WTransaction.Handle);
 i.Values['FormStyle'] := fsNormal;
 LoadSprav('FPOP\ini_unit_meas.bpl', Self, i, o);
 if o['ModalResult'] = mrOk then begin
  id_unit_meas          := o.Values['ID_UNIT_MEAS'];
  NameUnitMeasEdit.Text := o.Values['NAME_UNIT_MEAS'];
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

procedure Tsp_Product_Add_Form.NameDepartmentEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
//var
//    sp: TDepartmentsSprav;
begin
     // создать справочник
{ sp :=  TDepartmentsSprav.Create;
 if sp <> nil then begin
         // заполнить входные параметры
  with sp.Input do begin
   Append;
   FieldValues['DBHandle'] := Integer(DM.Database.Handle);
       // модальный показ
   FieldValues['ShowStyle'] := 0;
       // единичная выборка
   FieldValues['Select'] := 1;

   FieldValues['Root_Department'] := 2612;
   FieldValues['Actual_Date'] := Date;
   Post;
  end;
 end;
     // показать справочник и проанализировать результат (выбор одного подр.)
 sp.Show;

 if sp.Output = nil then ShowMessage('Ошибка!: Выходные параметры пусты!!!')
 else
 if not sp.Output.IsEmpty then begin
  Id_Department        := sp.Output['Id_Department'];
  if not VarIsNull(sp.Output['Name_Short'])  then NameDepartmentEdit.Text := sp.Output['Name_Short'];
 end;

 sp.Free;}
end;

procedure Tsp_Product_Add_Form.FormShow(Sender: TObject);
begin
 if NameDepartmentEdit.Text = '' then begin
  NameDepartmentEdit.Text := SYS_DEF_NAME_DEPARTMENT;
  id_Department           := SYS_DEF_ID_DEPARTMENT;
 end;
end;

end.
