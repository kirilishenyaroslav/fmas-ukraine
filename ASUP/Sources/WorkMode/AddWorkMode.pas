
{ -$Id: AddWorkMode.pas,v 1.4 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                      Модуль "Добавление режима работы"                       }
{             Добавление и изменение базовых данных о режиме работы            }
{                                                  ответственный: Олег Волков  }

unit AddWorkMode;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon, ComCtrls,
    Buffer, SpTimeUtils, WorkModeCentral;

type
    TAddWorkModeForm = class(TAddForm)
        BufferQuery: TIBQuery;
        Label1: TLabel;
        NomerEdit: TCheckEdit;
        DetailsQueryNOMER: TIntegerField;
        DetailsQueryNIGHT_BEG: TTimeField;
        DetailsQueryNIGHT_END: TTimeField;
        FC_Nomer: TFieldControl;
        Label2: TLabel;
        NightBegPicker: TDateTimePicker;
        FC_NightBeg: TFieldControl;
        Label3: TLabel;
        NightEndPicker: TDateTimePicker;
        FC_NightEnd: TFieldControl;
        SmenaBox: TCheckBox;
        FC_Smena: TFieldControl;
        DetailsQueryID_WORK_MODE: TIntegerField;
        DetailsQueryIS_SMENA: TIBStringField;
        procedure Name_ShortEditEnter(Sender: TObject);
    published
        NameLabel: TLabel;
        Name_ShortLabel: TLabel;
        DetailsQuery: TIBQuery;
        NameEdit: TCheckEdit;
        DetailsQueryName: TIBStringField;
        FC_Name: TFieldControl;
        Name_ShortEdit: TCheckEdit;
        DetailsQueryName_Short: TIBStringField;
        FC_Name_Short: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
        procedure WriteData;
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Work_Mode: Integer;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddWorkModeForm: TAddWorkModeForm;

implementation

{$R *.DFM}

uses uBuffer2;

procedure TAddWorkModeForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати режим праці'
    else if Mode = emModify then Caption := 'Змінити режим праці'
    else Caption := 'Додаткова інформація по режиму праці';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    BufferQuery.Transaction := BufferTransaction;

    Id_Work_Mode := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Work_Mode'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Nomer, FC_Name, FC_Name_Short, FC_NightBeg, FC_NightEnd,
        FC_Smena]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    if Mode = emNew then
    begin
        SetPickerTime(NightBegPicker, Consts_Query['Default_Night_Beg']);
        SetPickerTime(NightEndPicker, Consts_Query['Default_Night_End']);
    end;

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddWorkModeForm.GetId: Integer;
begin
    Result := Id_Work_Mode;
end;

procedure TAddWorkModeForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TAddWorkModeForm.OkButtonClick(Sender: TObject);
begin
    FormControl.Read;
    if FormControl.CheckFill then WriteData
    else ModalResult := 0;
end;

procedure TAddWorkModeForm.WriteData;
var
    ok: Boolean;
    Id_PBKey: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;

    BufTran2 := nil;
    try
        if Mode = emNew then
            ok := FormControl.ExecProc('Dt_Work_Mode_Insert', [], True)
        else ok := FormControl.ExecProc('Dt_Work_Mode_Update', [
                DetailsQuery.Params.ParamValues['Id_Work_Mode']]);
        if not ok then raise Exception.Create('');
        if Mode = emNew then Id_Work_Mode := LastId;

        if ok and not DontWriteToDbf then
        begin
            BufferQuery.Transaction := WriteTransaction;
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_Work_Mode').AsInteger := Id_Work_mode;
            BufferQuery.Open;

            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('SP_TIME', 'BUFF_SP_TIME', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;

    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;

            MessageDlg('При занесенні інформації виникла помилка: ' +
                e.Message, mtError, [mbOk], 0);
        end;
    end;
    if BufTran2 <> nil then BufTran2.Free;

    WorkModeCenter.ReLoad;
end;

procedure TAddWorkModeForm.Name_ShortEditEnter(Sender: TObject);
begin
    if Name_ShortEdit.Text = '' then
        Name_ShortEdit.Text :=
            Copy(NameEdit.Text, 1, Name_ShortEdit.MaxLength);
end;

initialization
    RegisterClass(TAddWorkModeForm);
end.
