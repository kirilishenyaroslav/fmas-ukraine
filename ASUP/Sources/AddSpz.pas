
{                Форма редактирования для таблицы Ini_Spz ('')                    }
{ создана экспертом формы редактирования, входящим в состав библиотеки SpLib }
{                     SpLib (c) Qizz 2002-2003                               }

unit AddSpz;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon, Buffer;

type
    TAddSpzForm = class(TAddForm)
        SPZBufferWrite: TIBQuery;
        procedure FormCreate(Sender: TObject);
    published
        SPZLabel: TLabel;
        Name_SPZLabel: TLabel;
        DetailsQuery: TIBQuery;
        SPZEdit: TCheckEdit;
        DetailsQuerySPZ: TIBStringField;
        FC_SPZ: TFieldControl;
        Name_SPZEdit: TCheckEdit;
        DetailsQueryName_SPZ: TIBStringField;
        FC_Name_SPZ: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Spz: Integer;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        function GetId: Integer; override;
    end;

var
    AddSpzForm: TAddSpzForm;

implementation

{$R *.DFM}

procedure TAddSpzForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати ' + ''
    else if Mode = emModify then Caption := 'Змінити ' + ''
    else Caption := 'Додаткова інформація по ' + '';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Spz := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Spz'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_SPZ, FC_Name_SPZ]);
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddSpzForm.GetId: Integer;
begin
    Result := Id_Spz;
end;

procedure TAddSpzForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;

end;

procedure TAddSpzForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    idpbkey: Integer;

begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Mode = emNew then
        begin
            ok := FormControl.ExecProc('Ini_Spz_Insert', [], True);

            if (Version = 2) then
            begin
                BufTran.Start;
                IdPbKey := BufTran.AddRecord('NSpz', 'BUFF_NSPZ');
                SPZBufferWrite.Params.ParamValues['ID_PBKEY'] := idpbkey;
                SPZBufferWrite.Params.ParamValues['ID_ACTION'] := 1;
                SPZBufferWrite.Params.ParamValues['ID_SPZ'] := LastId;
                SPZBufferWrite.Params.ParamValues['NAME_SPZ'] := Name_SPZEdit.Text;
                SPZBufferWrite.Params.ParamValues['KOD_SPZ'] := SPZEdit.Text;

                ExecQuery(SPZBufferWrite);
                WriteToDBF('NSpz', 'BUFF_NSPZ', idpbkey);
                BufTran.Commit;
            end;

        end
        else
        begin
            ok := FormControl.ExecProc('Ini_Spz_Update', [
                DetailsQuery.Params.ParamValues['Id_Spz']]);

            if (Version = 2) then
            begin
                BufTran.Start;
                IdPbKey := BufTran.AddRecord('NSpz', 'BUFF_NSPZ');
                SPZBufferWrite.Params.ParamValues['ID_PBKEY'] := idpbkey;
                SPZBufferWrite.Params.ParamValues['ID_ACTION'] := 2;
                SPZBufferWrite.Params.ParamValues['ID_SPZ'] := Id_Spz;
                SPZBufferWrite.Params.ParamValues['NAME_SPZ'] := Name_SPZEdit.Text;
                SPZBufferWrite.Params.ParamValues['KOD_SPZ'] := SPZEdit.Text;

                ExecQuery(SPZBufferWrite);
                WriteToDBF('NSpz', 'BUFF_NSPZ', idpbkey);
                BufTran.Commit;
            end;

        end;

        if not ok then ModalResult := 0;
        if Mode = emNew then Id_Spz := LastId;
    end
    else ModalResult := 0;
end;

procedure TAddSpzForm.FormCreate(Sender: TObject);
begin
    SPZBufferWrite.Transaction := BufferTransaction;

end;

initialization
    RegisterClass(TAddSpzForm);
end.
