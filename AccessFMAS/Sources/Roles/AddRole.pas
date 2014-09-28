unit AddRole;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MainDM, Role;


type
  TFormAddRole = class(TForm)
    EditName: TEdit;
    EditFullName: TEdit;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    LabelAdd: TLabel;
    LabelFullName: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FMode: Integer;
    FRole: TRole;
  public
    { Public declarations }
    FResultRole: TRole;
    function ValidData: Boolean;
    constructor Create(Owner: TComponent;  theRole: TRole; Mode: Integer);
  end;

implementation

{$R *.DFM}

constructor TFormAddRole.Create(Owner: TComponent; theRole: TRole; Mode: Integer);
begin
     inherited Create(Owner);
     FMode := Mode;
     FResultRole := nil;
     if FMode <> fmAdd then FRole := theRole;
end;

procedure TFormAddRole.FormCreate(Sender: TObject);
begin
     case FMode of
          fmEdit: begin
                       Caption := 'Редагування групи';
                       ButtonOk.Caption := 'Прийняти';
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
          EditName.Text := FRole.RoleName;
          EditFullName.Text := FRole.RoleFullName;
     end;
end;

procedure TFormAddRole.ButtonOkClick(Sender: TObject);
begin
     if not ValidData then Exit;
     case FMode of
          fmAdd : begin
                       FRole := TRole.Create(Self, DMMain.KruAccessDB);
                       FRole.NewRole(Trim(EditName.Text), Trim(EditFullName.Text));
                       if not FRole.Insert then
                          ShowErrorMessage('Не вдалось додати групу!')
                       else FResultRole := FRole;
                  end;
          fmEdit: begin
                       FRole.RoleName := Trim(EditName.Text);
                       FRole.RoleFullName := Trim(EditFullName.Text);
                       if not FRole.Update then
                          ShowErrorMessage('Не вдалось додати групу!')
                       else begin
                          FResultRole := TRole.Create(Self, DMMain.KruAccessDB);
                          FResultRole.RoleName := FRole.RoleName;
                          FResultRole.RoleFullName := FRole.RoleFullName;
                          FResultRole.RoleID := FRole.RoleID;
                       end
                  end;
     end;
     ModalResult := mrOk;
end;

procedure TFormAddRole.ButtonCancelClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

function TFormAddRole.ValidData: Boolean;
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

procedure TFormAddRole.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
     if Key in ['/','\'] then Key := #0;
end;

procedure TFormAddRole.FormDestroy(Sender: TObject);
begin
  FResultRole.Free;
end;

end.
