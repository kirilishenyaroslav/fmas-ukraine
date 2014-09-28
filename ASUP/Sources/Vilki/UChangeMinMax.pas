{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Изменение вилок"                                }
{                 Изменение вилок на оклад                                     }
{                                               ответственный: Тимофеев Антон  }
unit UChangeMinMax;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, FIBQuery, pFIBQuery, StdCtrls, Buttons, FieldControl, Mask,
    CheckEditUnit, ExtCtrls, PersonalCommon;

type
    TForm_ChangeMinMax = class(TForm)
        Panel1: TPanel;
        Label_Min: TLabel;
        Label_Max: TLabel;
        CheckEdit_Max: TCheckEdit;
        CheckEdit_Min: TCheckEdit;
        FC_Min: TFieldControl;
        FC_Max: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        FIBQuery_Change: TpFIBQuery;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure CheckEdit_MaxKeyPress(Sender: TObject; var Key: Char);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
    private
    { Private declarations }
    public
        Id: string;
        DS: char;
    { Public declarations }
    end;

var
    Form_ChangeMinMax: TForm_ChangeMinMax;

implementation

{$R *.dfm}

procedure TForm_ChangeMinMax.OkButtonClick(Sender: TObject);
begin
    FC_Min.Get;
    FC_Max.Get;
    if (FC_Min.Check) and (FC_Max.Check) and
        (StrToFloat(CheckEdit_Min.Text) < StrToFloat(CheckEdit_Max.Text))
        then begin
        try
            FIBQuery_Change.Database := FIBDatabase;
            FIBQuery_Change.Transaction := FIBWriteTransaction;

            FIBWriteTransaction.StartTransaction;
            FIBQuery_Change.SQL.Text := 'execute procedure sp_okl_min_max_update(' +
                Id + ', ' + CheckEdit_Min.Text + ', ' +
                CheckEdit_Max.Text + ');';
            FIBQuery_Change.ExecProc;
            FIBWriteTransaction.Commit;
        except on e: Exception do
            begin
                MessageDlg('Не вдалося змінити запис: ' + e.Message, mtError, [mbYes], 0);
                FIBWriteTransaction.RollBack;
            end;
        end;
    end
    else MessageDlg('Не вірно введені дані', mtError, [mbYes], 0)
end;

procedure TForm_ChangeMinMax.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    if FormStyle = fsMDIChild then Close;
end;

procedure TForm_ChangeMinMax.CheckEdit_MaxKeyPress(Sender: TObject;
    var Key: Char);
begin
    if (Key = ',') then Key := '.';
end;

procedure TForm_ChangeMinMax.FormCreate(Sender: TObject);
begin
    DS := DecimalSeparator;
    DecimalSeparator := '.';
end;

procedure TForm_ChangeMinMax.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    DecimalSeparator := DS;
end;

end.
