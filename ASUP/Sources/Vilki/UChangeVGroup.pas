{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Изменение группы вилок"                         }
{                 Изменение/добавление группы вилок на оклад                   }
{                                               ответственный: Тимофеев Антон  }
unit UChangeVGroup;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, FIBQuery, pFIBQuery, StdCtrls, Buttons, FieldControl, Mask,
    CheckEditUnit, ExtCtrls, PersonalCommon;

type
    TForm_Change_Group = class(TForm)
        Panel1: TPanel;
        CheckEdit_NewName: TCheckEdit;
        FC_NewName: TFieldControl;
        Label_Post: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FIBQuery_Change: TpFIBQuery;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        Id: string;
        Add: Boolean;
    { Public declarations }
    end;

var
    Form_Change_Group: TForm_Change_Group;

implementation

{$R *.dfm}

function TextOk(Txt: string): Boolean;
var p: integer;
begin
    p := Pos(' ', Txt);
    while (p <> 0) and (Length(Txt) <> 0) do
    begin
        Delete(Txt, p, 1);
        p := Pos(' ', Txt);
    end;
    if (Length(Txt) = 0)
        then Result := False
    else Result := True;
end;

procedure TForm_Change_Group.OkButtonClick(Sender: TObject);
begin
    FC_NewName.Get;
    if not (FC_NewName.Check)
        then begin
        MessageDlg('Не вірно введена назва', mtError, [mbYes], 0);
        Exit;
    end;
    if not TextOk(CheckEdit_NewName.Text)
        then begin
        MessageDlg('Не вірно введена назва', mtError, [mbYes], 0);
        Exit;
    end;
    try
        FIBQuery_Change.Database := FIBDatabase;
        FIBQuery_Change.Transaction := FIBWriteTransaction;
        FIBWriteTransaction.StartTransaction;
        if Add then
            FIBQuery_Change.SQL.Text := 'execute procedure sp_okl_min_max_group_i(''' + CheckEdit_NewName.Text + ''');'
        else FIBQuery_Change.SQL.Text := 'execute procedure sp_okl_min_max_group_u(' + Id + ', ''' + CheckEdit_NewName.Text + ''');';
        FIBQuery_Change.ExecProc;
        FIBWriteTransaction.Commit;
    except on e: Exception do
        begin
            MessageDlg('Не вдалося змінити запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
        end;
    end;
end;

procedure TForm_Change_Group.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
 {if FormStyle = fsMDIChild then }Close;
end;

end.
