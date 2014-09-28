unit SotrListFilterFormUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxMRUEdit, cxLookAndFeelPainters, cxButtons,
  SotrListConsts, packageLoad, IBase, Ztypes;

type
  TSotrListFilterForm = class(TForm)
    TNMaskEdit: TcxMaskEdit;
    TnLabel: TLabel;
    FamiliaEditMask: TcxMaskEdit;
    FamiliaLabel: TLabel;
    INKMaskEdit: TcxMaskEdit;
    InkLabel: TLabel;
    DepartmentMRUEdit: TcxMRUEdit;
    DepartmentLabel: TLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure TNMaskEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure OkButtonClick(Sender: TObject);
    procedure DepartmentMRUEditPropertiesButtonClick(Sender: TObject);
  private
    DB_handle:TISC_DB_HANDLE;
  public
      Fam:string;
      Tn:Integer;
      Ink:String;
      Id_Department     : Integer;
      CanSelect:Boolean;
   constructor Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE);reintroduce;
  end;

var
  SotrListFilterForm: TSotrListFilterForm;


implementation

{$R *.dfm}

constructor TSotrListFilterForm.Create(AOwner:TComponent;ADB_handle:TISC_DB_HANDLE);
begin
 inherited Create(AOwner);
 DB_handle := ADB_handle;
end;

procedure TSotrListFilterForm.FormCreate(Sender: TObject);
begin
    //Инициализация меток
     Self.Caption:=Form_SotrFilterCaption;
     TnLabel.Caption:=Tn_Label_Caption;
     FamiliaLabel.Caption:= 'Прізвище'; //Familia_Label_Caption;
     InkLabel.Caption:= 'Ідентифікаційний номер';//Ink_Label_Caption;
     DepartmentLabel.Caption:=Department_Label_Caption;
     Id_Department:=-1;
     OkButton.Caption:=YesBtn_Caption;
     CancelButton.Caption:=CancelBtn_Caption;
   //  OkButton.SetFocus;

end;
procedure TSotrListFilterForm.TNMaskEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
begin
        if Key=vk_return then  self.OkButtonClick(SEnder);
end;


procedure TSotrListFilterForm.OkButtonClick(Sender: TObject);
begin
    Fam:=Self.FamiliaEditMask.Text;
    if (Self.TNMaskEdit.Text='') then Tn:=-1
        else Tn:=StrToInt(Self.TNMaskEdit.Text);
    Ink:=Self.INKMaskEdit.Text;
    ModalResult:=mrOk;
end;


procedure TSotrListFilterForm.DepartmentMRUEditPropertiesButtonClick(
  Sender: TObject);
var Department:variant;
begin
Department := LoadDepartment(self,DB_handle,zfsModal);
if VarArrayDimCount(Department)> 0 then
 if Department[0]<> NULL then
  begin
   DepartmentMRUEdit.Text := varToStr(Department[1]);
   Id_Department          := Department[0];
  end;
end;

end.
