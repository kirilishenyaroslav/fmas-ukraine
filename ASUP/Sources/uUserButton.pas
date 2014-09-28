unit uUserButton;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, Registry, ActnList;

type
    TfrmChangeUserAction = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label1: TLabel;
        ActionsListBox: TListBox;
        procedure OkButtonClick(Sender: TObject);
        procedure ActionsListBoxDblClick(Sender: TObject);
    private
        Button: TButton;
        ActList: TActionList;
    public
        constructor Create(AOwner: TComponent; Button: TButton; ActList: TActionList);
            reintroduce;
    end;

procedure LoadUserButton(Button: TButton; ActList: TActionList);
procedure SetUserButtonAction(Button: TButton; ActList: TActionList);

var
    frmChangeUserAction: TfrmChangeUserAction;

implementation

constructor TfrmChangeUserAction.
    Create(AOwner: TComponent; Button: TButton; ActList: TActionList);
var
    i: Integer;
begin
    inherited Create(AOwner);
    Self.Button := Button;
    Self.ActList := ActList;

    for i := 0 to ActList.ActionCount - 1 do
        if ActList.Actions[i] is TAction then
            if ActList.Actions[i].Category = 'Exec' then
                ActionsListBox.Items.Add((ActList.Actions[i] as TAction).Caption);

    ActionsListBox.ItemIndex := 0;
end;

procedure SetUserButtonAction(Button: TButton; ActList: TActionList);
var
    form: TfrmChangeUserAction;
begin
    form := TfrmChangeUserAction.Create(nil, Button, ActList);
    form.ShowModal;
    form.Free;
end;

procedure LoadUserButton(Button: TButton; ActList: TActionList);
var
    reg: TRegistry;
    action: string;
    i: Integer;
begin
    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\UserButtons\' + Button.Name, False) then
        begin
            try
                action := reg.ReadString('Action');
                with ActList do
                    for i := 0 to ActionCount - 1 do
                        if Actions[i].Name = action then
                            Button.Action := Actions[i];
            except
            end;
        end;
        reg.CloseKey;
    finally
        reg.Free;
    end;
end;

{$R *.dfm}

procedure TfrmChangeUserAction.OkButtonClick(Sender: TObject);
var
    i: Integer;
    action: string;
    reg: TRegistry;
begin
    action := '';
    for i := 0 to ActList.ActionCount - 1 do
        if ActList.Actions[i] is TAction then
            if ActList.Actions[i].Category = 'Exec' then
                with ActList.Actions[i] as TAction do
                    if Caption = ActionsListBox.Items[ActionsListBox.ItemIndex] then
                        action := Name;

    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;

        if reg.OpenKey('\Software\ASUP\UserButtons\' + Button.Name, True) then
        begin
            reg.WriteString('Action', action);
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;
    Close;
end;

procedure TfrmChangeUserAction.ActionsListBoxDblClick(Sender: TObject);
begin
    OkButton.Click;
end;

end.
