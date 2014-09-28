
{ -$Id: AddVihod.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                   Модуль "Изменение типа выхода на работу"                   }
{                     Изменение типа выхода на работу                          }
{                                                  ответственный: Олег Волков  }

unit AddVihod;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon, Buffer,
    WorkModeCentral;

type
    TAddVihodForm = class(TAddForm)
        BufferQuery: TIBQuery;
        PaidBox: TCheckBox;
        FC_Paid: TFieldControl;
        DetailsQueryIS_PAID: TIBStringField;
    published
        Name_FullLabel: TLabel;
        Name_ShortLabel: TLabel;
        DetailsQuery: TIBQuery;
        Name_FullEdit: TCheckEdit;
        DetailsQueryName_Full: TIBStringField;
        FC_Name_Full: TFieldControl;
        Name_ShortEdit: TCheckEdit;
        DetailsQueryName_Short: TIBStringField;
        FC_Name_Short: TFieldControl;
        Is_WorkBox: TCheckBox;
        DetailsQueryIs_Work: TIBStringField;
        FC_Is_Work: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Vihod: Integer;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddVihodForm: TAddVihodForm;

implementation

{$R *.DFM}

uses uBuffer2;

procedure TAddVihodForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then
        Caption := 'Додати тип вихода на роботу'
    else if Mode = emModify then
        Caption := 'Змінити тип виходи на роботу'
    else
        Caption := 'Додаткова інформація по виходу на роботу';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Vihod := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Vihod'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name_Full, FC_Name_Short, FC_Is_Work, FC_Paid]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddVihodForm.GetId: Integer;
begin
    Result := Id_Vihod;
end;

procedure TAddVihodForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;

end;

procedure TAddVihodForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    id_PBKey: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
  // запись типа выхода в буфер и Interbase
   // старт транзакции
        BufTran2 := nil;
        if WriteTransaction.InTransaction then WriteTransaction.Rollback;
        WriteTransaction.StartTransaction;
        try
   // запись наших данных
            with FormControl do
                if Mode = emNew then
                    ok := FormControl.ExecProc('Sp_Vihod_Insert', [], True)
                else
                    ok := FormControl.ExecProc('Sp_Vihod_Update', [
                        DetailsQuery.Params.ParamValues['Id_Vihod']]);
            if not ok then raise Exception.Create('');

            if Mode = emNew then Id_Vihod := LastId;

            if ok and not DontWriteToDbf then
            begin
                BufferQuery.Transaction := WriteTransaction;
                BufferQuery.Close;
                BufferQuery.ParamByName('Id_Vihod').AsInteger := Id_Vihod;
                BufferQuery.Open;

                First_PBKey := BufferQuery['First_PBKey'];
                Last_PBKey := BufferQuery['Last_PBKey'];

                BufTran2 := TBufferTransaction2.
                    Create('DAY_TYPE', 'BUFF_DAY_TYPE', WriteTransaction);
                BufTran2.WriteRange(First_PBKey, Last_PBKey);
            end;
            WriteTransaction.Commit;

        except on e: Exception do
            begin
                WriteTransaction.Rollback;
                if BufTran2 <> nil then BufTran2.RollbackOnError;
                ModalResult := 0;

                MessageDlg('При занесенні інформації виникла помилка: ' +
                    e.Message, mtError, [mbOk], 0);
            end;
        end;

        if BufTran2 <> nil then BufTran2.Free;
    end
    else ModalResult := 0;
end;

initialization
    RegisterClass(TAddVihodForm);
end.
d.
