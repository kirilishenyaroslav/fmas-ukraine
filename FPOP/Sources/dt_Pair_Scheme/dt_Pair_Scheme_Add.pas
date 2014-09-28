unit dt_Pair_Scheme_Add;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxButtonEdit, cxLookAndFeelPainters, cxButtons,
  Variants;

type
  Tdt_Pair_Scheme_Add_Form = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label4: TLabel;
    ObjectEdit: TcxButtonEdit;
    ProductEdit: TcxButtonEdit;
    PercentOutEdit: TcxSpinEdit;
    PercentInEdit: TcxSpinEdit;
    Button1: TcxButton;
    Button2: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjectEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ProductEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
  public
    Cap : string;
    id_Object   : integer;
    id_Product  : integer;
    Kind        : byte;
    destructor Destroy; override;
  end;

const
 aINPUT  = 0;
 aOUTPUT = 1;

var
  dt_Pair_Scheme_Add_Form: Tdt_Pair_Scheme_Add_Form;

implementation

uses tagSYS_Options, tagBaseTypes, sp_Object_Form, dt_Pair_Scheme,
  datamodule, fpop_PackageLoader;

{$R *.DFM}

destructor Tdt_Pair_Scheme_Add_Form.Destroy;
begin
 dt_Pair_Scheme_Add_Form := nil;
 inherited;
end;

procedure Tdt_Pair_Scheme_Add_Form.FormShow(Sender: TObject);
begin
 Caption := Cap + ' об''єкту';
end;

procedure Tdt_Pair_Scheme_Add_Form.Button1Click(Sender: TObject);
begin
 if ObjectEdit.Text = '' then begin
  ShowMessage('Оберіть об''єкт водопостачання!');
  Exit;
 end;

 if ProductEdit.Text = '' then begin
  ShowMessage('Оберіть вид продукції, що постачає об''єкт!');
  Exit;
 end;

 ModalResult := mrOk;
end;

procedure Tdt_Pair_Scheme_Add_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure Tdt_Pair_Scheme_Add_Form.ObjectEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 opt         : TSpravOptions;
 Result      : TResultArray;
 i           : integer;
begin
 opt.canAdd      := true;
 opt.canEdit     := true;
 opt.canDelete   := true;
 opt.canSelect   := true;
 opt.HideButtons := False;
 opt.isModal     := true;

 sp_Object_Form.PanelVisible := False;

 Result := sp_Object_Form1.tagShow(opt);
 if Length(Result) > 0 then begin
  if Result[0] = dt_Pair_Scheme_Form.id_Object_Sel then begin
   ShowMessage('Неможно з''єднати об''єкт ' + #39 + dt_Pair_Scheme_Form.Name_Object_Sel
   + #39 + ' з самим собою!');
   Exit;
  end;

  if Kind = aINPUT then begin
   for i := 0 to dt_Pair_Scheme_Form.InputTreeList.Count - 1 do
    if dt_Pair_Scheme_Form.InputTreeList.Items[i].Values[2] = Result[0] then begin
     ShowMessage('Неможно з''єднати об''єкт ' + #39 + dt_Pair_Scheme_Form.Name_Object_Sel
     + #39 + ' з об''єктом ' + #39 + Result[1] + #39 + ', тому що вони вже зв''язані!');
     Exit;
    end;
  end
  else if Kind = aOUTPUT then begin
   for i := 0 to dt_Pair_Scheme_Form.OutputTreeList.Count - 1 do
    if dt_Pair_Scheme_Form.OutputTreeList.Items[i].Values[2] = Result[0] then begin
     ShowMessage('Неможно з''єднати об''єкт ' + #39 + dt_Pair_Scheme_Form.Name_Object_Sel
     + #39 + ' з об''єктом ' + #39 + Result[1] + #39 + ', тому що вони вже зв''язані!');
     Exit;
    end;
  end;

  id_Object       := Result[0];
  ObjectEdit.Text := Result[1];
 end
 else Exit;
end;

procedure Tdt_Pair_Scheme_Add_Form.ProductEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
 Opt : TSpravOptions;
 Result : variant;
begin
 opt.canAdd        := True;
 opt.canEdit       := True;
 Opt.canSelect     := True;
 Opt.canDelete     := True;
 Opt.HideButtons   := False;
 Opt.isModal       := True;

 Result := Show_sp_Product(Self, dm.DataBase.Handle, dm.ReadTransaction.Handle, fsNormal);

 if not VarIsNull(Result) then begin
  id_Product       := Result[0];
  ProductEdit.Text := Result[1];
 end;
end;

end.
