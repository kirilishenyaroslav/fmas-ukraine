unit AddObject;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, AccessObject, MainDM, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TFormAddObject = class(TForm)
    LabelAdd: TLabel;
    LabelFullName: TLabel;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    Systems: TcxLookupComboBox;
    Label1: TLabel;
    EditFullName: TcxTextEdit;
    EditName: TcxTextEdit;
    procedure ButtonCancelClick(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    FParentObject: TAccessObject;
    FMode: Integer;
    FResultObject: TAccessObject;
    function ValidData: Boolean;
    constructor Create(Owner: TComponent; ParentObject: TAccessObject; Mode: Integer);
  end;

implementation

{$R *.DFM}

constructor TFormAddObject.Create(Owner: TComponent;  ParentObject: TAccessObject; Mode: Integer);
begin
     inherited Create(Owner);
     FResultObject := nil;
     FParentObject := ParentObject;
     FMode := Mode;
     if not Assigned(FParentObject) then FMode := fmAdd;
end;

procedure TFormAddObject.ButtonCancelClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TFormAddObject.ButtonOkClick(Sender: TObject);
var
   accObj: TAccessObject;
   mes:    string;
begin
     if not ValidData then Exit;
     case FMode of
          fmAdd : begin
                       accObj := TAccessObject.Create(DMMain.KruAccessDB);
                       accObj.NewObject(
                                        Trim(EditName.Text),
                                        Trim(EditFullName.Text),
                                        Systems.EditValue,
                                        FParentObject.ParentObjectID);
                       if not accObj.InsertObject(mes) then
                          ShowErrorMessage('Не вдалось додати об`єкт!'+#13+mes)
                       else FResultObject := accObj;
                  end;
          fmEdit: begin
                       accObj := FParentObject;
                       accObj.ObjectName := Trim(EditName.Text);
                       accObj.ObjectFullName := Trim(EditFullName.Text);
                       accObj.Id_system      :=Systems.EditValue;
                       if not accObj.UpdateObject(mes) then
                          ShowErrorMessage('Не вдалось оновити об`єкт !'+#13+mes)
                       else FResultObject := accObj;
                  end;
          fmView: begin
                       FResultObject := accObj;
                  end;
     end;
     ModalResult := mrOk;
end;

procedure TFormAddObject.FormCreate(Sender: TObject);
begin
     case FMode of
          fmEdit: begin
                       ButtonOk.Caption := 'Примінити';
                  end;
          fmView: begin
                       ButtonOk.Caption := 'ОК';
                       ButtonCancel.Caption := 'Вийти';
                       EditName.Enabled := false;
                       EditFullName.Enabled := false;
                  end;
     end;
     if (FMode = fmEdit) or (FMode = fmView) then
     begin
          EditName.Text := FParentObject.ObjectName;
          EditFullName.Text := FParentObject.ObjectFullName;
     end;
end;

function TFormAddObject.ValidData: Boolean;
begin
     Result := false;
     if Trim(EditName.Text) = '' then
     begin
          EditName.SetFocus;
          Exit;
     end;
     if Trim(EditFullName.Text) = '' then
     begin
          EditFullName.SetFocus;
          Exit;
     end;
     Result := true;
end;

procedure TFormAddObject.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
     if Key in ['/','\'] then Key := #0;
end;

end.
