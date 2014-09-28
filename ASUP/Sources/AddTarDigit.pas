
{ -$Id: AddTarDigit.pas,v 1.2 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                 Модуль "Добавление разряда тарифной сетки"                   }
{    Добавление и изменение коэффициента, соответствующего данному разряду     }
{    данной тарифной сетки                                                     }
{                                                  ответственный: Олег Волков  }

unit AddTarDigit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, StdCtrls, Buttons, FieldControl, Mask,
    CheckEditUnit, EditControl, PersonalCommon, SpCommon, Buffer;

type
    TAddTarDigitForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DigitLabel: TLabel;
        KoeficientLabel: TLabel;
        DetailsQuery: TIBQuery;
        DigitEdit: TCheckEdit;
        KoeficientEdit: TCheckEdit;
        FC_Digit: TFieldControl;
        FC_Koeficient: TFieldControl;
        Label1: TLabel;
        CommentEdit: TCheckEdit;
        DetailsQueryNUM_DIGIT: TIntegerField;
        DetailsQueryKOEFICIENT: TIBBCDField;
        DetailsQueryCOMMENT: TIBStringField;
        FC_Comment: TFieldControl;
        PeopleQuery: TIBQuery;
        BufferQuery: TIBQuery;

        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormActivate(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);

    private
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Tar_Net: Integer;
    public
        procedure Prepare(Tar_Net, Num_Digit: Integer; Mode: TEditMode);
    { Public declarations }
    end;

var
    AddTarDigitForm: TAddTarDigitForm;

implementation

{$R *.DFM}

procedure TAddTarDigitForm.Prepare(Tar_Net, Num_Digit: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    if Mode = emNew then Caption := 'Додати розряд тарифної сітки'
    else Caption := 'Змінити розряд тарифної сітки';

    Id_Tar_Net := Tar_Net;

    if Mode = emModify then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Tar_Net'] := Id_Tar_Net;
            Params.ParamValues['Num_Digit'] := Num_Digit;
            Open;
        end;
    FormControl.Prepare(Mode);
    if Mode = emModify then DigitEdit.ReadOnly := True;

    if (Num_Digit = 1) and (Mode = emModify) then
    begin
        DigitEdit.Enabled := False;
        KoeficientEdit.Enabled := False;
    end;
end;

procedure TAddTarDigitForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
    FormControl.Free;
end;

procedure TAddTarDigitForm.FormActivate(Sender: TObject);
begin
    if DigitEdit.Enabled then DigitEdit.SetFocus;
end;

procedure TAddTarDigitForm.FormCreate(Sender: TObject);
begin
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    PeopleQuery.Transaction := ReadTransaction;
    BufferQuery.Transaction := BufferTransaction;
    FormControl := TEditControl.Create;
    FormControl.Add([FC_Digit, FC_Koeficient, FC_Comment]);
end;

procedure TAddTarDigitForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    Id_PBKey: Integer;
begin
    FormControl.Read;
    if FormControl.CheckFill then
        if Mode = emNew then
            FormControl.ExecProc('Tar_Nets_Insert', [Id_Tar_Net])
        else
        begin
            BufTran.Start;
            try
                ok := FormControl.ExecProc('Tar_Nets_Update', [Id_Tar_Net]);
                if not ok then raise Exception.Create('');

                    // записать изменения тар. ставок людей с такой сеткой
                if Version = 1 then
                begin
                    PeopleQuery.Params.ParamValues['Id_Tar_Net'] := Id_Tar_Net;
                    PeopleQuery.Params.ParamValues['Num_Digit'] := FC_Digit.Value;
                    PeopleQuery.Open;
                    PeopleQuery.First;

               // записать в буфер Pep_Data изменения тар. сетки
                    while not PeopleQuery.Eof do
                    begin
                        Id_PBKey := BufTran.AddRecord('PEP_DATA', 'BUFF_PEP_DATA');
                        BufferQuery.Close;
                        with BufferQuery.Params do
                        begin
                            ParamValues['Id_PBKey'] := Id_PBKey;
                            ParamValues['Id_Man_Moving'] := PeopleQuery['Id_Man_Moving'];
                            ParamValues['Id_Tar_Net'] := Id_Tar_Net;
                            ParamValues['Num_Digit'] := FC_Digit.Value;
                            ParamValues['Par_Version'] := 1;
                        end;
                        ExecQuery(BufferQuery);
                        WriteToDbf('Pep_Data', 'Buff_Pep_Data', Id_PBKey);
                        PeopleQuery.Next;
                    end;
                end;

            except on e: Exception do
                begin
                    ShowError(e);
                    BufTran.Rollback;
                    ModalResult := 0;
                    Exit;
                end;
            end;
            BufTran.Commit;
        end
    else ModalResult := 0;
end;

end.
