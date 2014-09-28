unit AddUser;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  user, MainDM, StdCtrls, IBQuery, DomainUser, DB, IBCustomDataSet;

type
//  TFunc=procedure (ResultQuery: TIBQuery; Database: TIBDatabase); stdcall;

  TFormAddUser = class(TForm)
    Label1: TLabel;
    EditUserName: TEdit;
    EditUserFullName: TEdit;
    Label2: TLabel;
    EditPasswd: TEdit;
    Label3: TLabel;
    ButtonOk: TButton;
    ButtonCancel: TButton;
    Button1: TButton;
    WorkQuery: TIBQuery;
    Label4: TLabel;
    edNote: TMemo;
    Label5: TLabel;
    EditEMAIL: TEdit;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure ButtonCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EditTnKeyPress(Sender: TObject; var Key: Char);
    procedure EditTnDblClick(Sender: TObject);
    procedure ButtonCallPeopleSprClick(Sender: TObject);
  private
    { Private declarations }
    FMode: Integer;
    FUser: TUser;
  public
    { Public declarations }
    FResultUser: TUser;
    id_pcard : Integer;
    id_user : Integer;
    StrMD5:function (Buffer : shortString): shortstring; stdcall;
    DLLInstance:THandle;

    function ValidData: Boolean;
    constructor Create(Owner: TComponent;  theUser: TUser; Mode: Integer); overload;
  end;

implementation

uses PCardsViewUnit;

{$R *.DFM}

{ TFormAddUser }

constructor TFormAddUser.Create(Owner: TComponent; theUser: TUser;
  Mode: Integer);
begin
     inherited Create(Owner);
     FMode := Mode;
     FResultUser := nil;
     if FMode <> fmAdd then FUser := theUser;
end;

function TFormAddUser.ValidData: Boolean;
begin
     Result := false;

     if Trim(EditUserName.Text) = '' then
     begin
        MessageDlg('Введіть ім`я користувача!', mtError, [mbOk], 0);
        EditUserName.SetFocus;
        Exit;
     end;

     if Id_PCard = -1 then
     begin
        MessageDlg('Виберіть особисту картку користувача!', mtError, [mbOk], 0);
          EditUserFullName.SetFocus;
          Exit;
     end;

     if Trim(EditPasswd.Text) = '' then
     begin
        MessageDlg('Введіть пароль користувача!', mtError, [mbOk], 0);
        EditPasswd.SetFocus;
        Exit;
     end;

     Result := true;
end;

procedure TFormAddUser.FormCreate(Sender: TObject);
begin
    if FileExists('Md5dll.dll')
    then begin
              DLLInstance := LoadLibrary('Md5dll.dll');
              @StrMD5  :=GetProcAddress(DLLInstance, 'StrMD5');
    end;



     case FMode of
          fmEdit: begin
                       Caption := 'Редагування користувача';
                       ButtonOk.Caption := 'Применить';
                  end;
          fmView: begin
                       ButtonOk.Caption := 'ОК';
                       ButtonCancel.Caption := 'Вихід';
                       EditUserName.Enabled := false;
                       EditUserFullName.Enabled := false;
                  end;
          fmAdd : begin
                Id_PCard := -1;
                Id_User := -1;
          end;
     end;

     if (FMode = fmEdit) or (FMode = fmView) then
     begin
          EditUserName.Text     := FUser.UserName;
          EditUserFullName.Text := FUser.UserFullName;
          edNote.Text           := FUser.Note;
          EditEmail.Text        := FUser.Email;

          if not DMMAin.UseMD5 then
            EditPasswd.Text := FUser.Password;
     end;

     WorkQuery.Transaction := MainDM.DMMain.WriteTransaction;
end;

procedure TFormAddUser.ButtonOkClick(Sender: TObject);
begin
    //
    if Not ValidData then exit;

    try
        if fMode = fmAdd then begin

            WorkQuery.Close;

            if not DMMain.UseMD5 then
                WorkQuery.SQL.Text := 'SELECT PID_USER FROM INSERT_USER (' + QuotedStr(EditUserName.Text) + ',' +
                                                             QuotedStr(EditUserFullName.Text) + ',' +
                                                             QuotedStr(EditPasswd.Text) + ',' +
                                                             IntToStr(Id_PCard) + ',' +
                                                             QuotedStr(EditEMAIL.Text) + ')'
            else
                WorkQuery.SQL.Text := 'SELECT PID_USER FROM INSERT_USER2 (' + QuotedStr(EditUserName.Text) + ',' +
                                                             QuotedStr(EditUserFullName.Text) + ',' +
                                                             QuotedStr(StrMD5(EditPasswd.Text)) + ',' +
                                                             IntToStr(Id_PCard) + ','+
                                                             QuotedStr(edNote.Text)+',' +
                                                             QuotedStr(EditEMAIL.Text) + ')';

            WorkQuery.Open;

            id_user := WorkQuery['PID_USER'];
        end;

        if fMode = fmEdit then begin
            WorkQuery.Close;

            if not DMMain.UsEMD5 then
                WorkQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_USER (' + IntToStr(id_user) + ',' +
                                                             QuotedStr(EditUserName.Text) + ',' +
                                                             QuotedStr(EditUserFullName.Text) + ',' +
                                                             QuotedStr(EditPasswd.Text) + ',' +
                                                             IntToStr(Id_PCard) + ',' +
                                                             QuotedStr(EditEMAIL.Text) + ')'
            else
                WorkQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_USER2 (' + IntToStr(id_user) + ',' +
                                                             QuotedStr(EditUserName.Text) + ',' +
                                                             QuotedStr(EditUserFullName.Text) + ',' +
                                                             QuotedStr(StrMD5(EditPasswd.Text)) + ',' +
                                                             IntToStr(Id_PCard) + ','+
                                                             QuotedStr(edNote.Text)+ ',' +
                                                             QuotedStr(EditEMAIL.Text) + ')';

            WorkQuery.Open;
        end;
    except on E:Exception do begin
            MessageDlg(E.Message, mtError, [mbOk], 0);
            WorkQuery.Transaction.Rollback;
            exit;
        end;
    end;

    WorkQuery.Transaction.Commit;

    ModalResult := mrOk;
end;

procedure TFormAddUser.ButtonCancelClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TFormAddUser.FormDestroy(Sender: TObject);
begin
     FResultUser.Free;
end;

procedure TFormAddUser.EditTnKeyPress(Sender: TObject; var Key: Char);
begin
     if not(Key in ['0'..'9', #8]) then Key := #0;
end;

procedure TFormAddUser.EditTnDblClick(Sender: TObject);
begin
     ButtonCallPeopleSprClick(Self);
end;

procedure TFormAddUser.ButtonCallPeopleSprClick(Sender: TObject);
var
  Form : TPCardsViewForm;
begin
    Form := TPCardsViewForm.Create(Self);

    if Form.ShowModal = mrOk then begin
        id_pcard := Form.ResultQueryID_PCARD.Value;
        EditUserFullName.Text := Form.ResultQueryFIO.Value;
    end;

    Form.Free;
end;

end.
