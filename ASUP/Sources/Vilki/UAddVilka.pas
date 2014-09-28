{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Добавление вилок"                               }
{                 Добавление вилок на оклад                                    }
{                                               ответственный: Тимофеев Антон  }
unit UAddVilka;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, StdCtrls, SpComboBox, DB,
    IBCustomDataSet, IBQuery, Buttons, FieldControl, ExtCtrls, Mask,
    CheckEditUnit, PersonalCommon, EditControl, SpCommon, fib;

type
    TForm_Add_Vilka = class(TForm)
        Panel1: TPanel;
        SpComboBox_Post: TSpComboBox;
        FC_Post: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        CheckEdit_Max: TCheckEdit;
        Label_Min: TLabel;
        Label_Max: TLabel;
        CheckEdit_Min: TCheckEdit;
        SpComboBox_Group: TSpComboBox;
        Label_Post: TLabel;
        FC_Group: TFieldControl;
        Label_Group: TLabel;
        FIBQuery_Add: TpFIBQuery;
        FC_Min: TFieldControl;
        FC_Max: TFieldControl;
        procedure OkButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure CheckEdit_MaxKeyPress(Sender: TObject; var Key: Char);
    private
    { Private declarations }
    public
        FormControl: TEditControl;
        DS: char;
    end;

var
    Form_Add_Vilka: TForm_Add_Vilka;

implementation

{$R *.dfm}


//function CommaIntoDot()


procedure TForm_Add_Vilka.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;

    if not FormControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;

    if StrToFloat(CheckEdit_Min.Text) > StrToFloat(CheckEdit_Max.Text) then
    begin
        MessageDlg('Мінімум повинен бути не більшим за максимум!', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

    try
        FIBQuery_Add.Transaction := FIBWriteTransaction;
        FIBQuery_Add.Database := FIBDatabase;
        FIBWriteTransaction.StartTransaction;
        FIBQuery_Add.SQL.Text := 'execute procedure sp_okl_min_max_i(' +
            IntToStr(SpComboBox_Group.GetId) + ', ' +
            IntToStr(SpComboBox_Post.GetId) + ', ' +
            CheckEdit_Min.Text + ', ' + CheckEdit_Max.Text + ');';
        FIBQuery_Add.ExecProc;
        FIBWriteTransaction.Commit;
    except on e: EFIBInterBaseError do
        begin
            if (e.IBErrorCode = 335544665)
                then MessageDlg('В цій групі така вилка вже існує', mtError, [mbYes], 0)
            else MessageDlg('Не вдалося додати запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
        end;
    end;
end;

procedure TForm_Add_Vilka.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
 {if FormStyle = fsMDIChild then }Close;
end;

procedure TForm_Add_Vilka.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;

    SpComboBox_Group.SaveIntoRegistry;
    SpComboBox_Post.SaveIntoRegistry;
    DecimalSeparator := DS;
end;

procedure TForm_Add_Vilka.FormCreate(Sender: TObject);
begin
    SpComboBox_Group.LoadFromRegistry;
    SpComboBox_Post.LoadFromRegistry;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Group, FC_Post, FC_Min, FC_Max]);

    FormControl.Prepare(emNew);

    DS := DecimalSeparator;
    DecimalSeparator := '.';
end;

procedure TForm_Add_Vilka.CheckEdit_MaxKeyPress(Sender: TObject;
    var Key: Char);
begin
    if (Key = ',') then Key := '.';
end;

end.
