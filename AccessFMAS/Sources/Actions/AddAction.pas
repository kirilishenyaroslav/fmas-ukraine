unit AddAction;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, MainDM, Action;


type
  TFormAddAction = class(TForm)
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
    FObjectAction: TObjectAction;
  public
    { Public declarations }
    FResultObjectAction: TObjectAction;
    function ValidData: Boolean;
    constructor Create(Owner: TComponent;  ObjectAction: TObjectAction; Mode: Integer);
  end;

implementation

{$R *.DFM}

constructor TFormAddAction.Create(Owner: TComponent; ObjectAction: TObjectAction; Mode: Integer);
begin
     inherited Create(Owner);
     FMode := Mode;
     FResultObjectAction := nil;
     if FMode <> fmAdd then FObjectAction := ObjectAction;
end;

procedure TFormAddAction.FormCreate(Sender: TObject);
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
          EditName.Text := FObjectAction.ActionName;
          EditFullName.Text := FObjectAction.ActionFullName;
     end;
end;

procedure TFormAddAction.ButtonOkClick(Sender: TObject);
begin
     if not ValidData then Exit;
     case FMode of
          fmAdd : begin
                       FObjectAction := TObjectAction.Create(Self, DMMain.KruAccessDB);
                       FObjectAction.NewAction(Trim(EditName.Text), Trim(EditFullName.Text));
                       if not FObjectAction.Insert then
                          ShowErrorMessage('Не вдалось додати дію!')
                       else FResultObjectAction := FObjectAction;
                  end;
          fmEdit: begin
                       FObjectAction.ActionName := Trim(EditName.Text);
                       FObjectAction.ActionFullName := Trim(EditFullName.Text);
                       if not FObjectAction.Update then
                          ShowErrorMessage('Не вдалось додати дію!')
                       else begin
                          FResultObjectAction := TObjectAction.Create(Self, DMMain.KruAccessDB);
                          FResultObjectAction.ActionName := FObjectAction.ActionName;
                          FResultObjectAction.ActionFullName := FObjectAction.ActionFullName;
                          FResultObjectAction.ActionID := FObjectAction.ActionID;
                       end;
                  end;
     end;
     ModalResult := mrOk;
end;

procedure TFormAddAction.ButtonCancelClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

function TFormAddAction.ValidData: Boolean;
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

procedure TFormAddAction.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
     if Key in ['/','\'] then Key := #0;
end;

procedure TFormAddAction.FormDestroy(Sender: TObject);
begin
  FResultObjectAction.Free;
end;

end.
