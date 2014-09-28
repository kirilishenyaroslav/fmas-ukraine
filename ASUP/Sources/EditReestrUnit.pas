unit EditReestrUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ComCtrls, Buttons, DB, IBCustomDataSet, IBQuery,
    FieldControl, EditControl, SpCommon, PersonalCommon;

type
    TEditReestrForm = class(TForm)
        Label1: TLabel;
        Label2: TLabel;
        NumReestrEdit: TEdit;
        DateReestrPicker: TDateTimePicker;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DetailsQuery: TIBQuery;
        DetailsQueryID_REESTR: TIntegerField;
        DetailsQueryNUM_REESTR: TIBStringField;
        DetailsQueryDATE_REESTR: TDateField;
        FC_NUM_REESTR: TFieldControl;
        FC_DATE_REESTR: TFieldControl;
        Label3: TLabel;
        DateEndPicker: TDateTimePicker;
        DetailsQueryDATE_END: TDateField;
        FC_DATE_END: TFieldControl;
        procedure FormCreate(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
    private
    { Private declarations }
    public
        procedure Prepare(Mode: TEditMode; IdReestr: Integer);
    end;

var
    EditReestrForm: TEditReestrForm;
    FMode: TEditMode;
    ReestrEditControl: TEditControl;
    Id_Reestr: Integer;

implementation
{$R *.dfm}

procedure TEditReestrForm.Prepare(Mode: TEditMode; IdReestr: Integer);
begin
    FMode := Mode;
    Id_Reestr := IdReestr;
    if (FMode = emNew) then Self.Caption := 'Додати новий реєстр';
    if (FMode = emModify) then Self.Caption := 'Змінти реєстр';

    if Mode = emModify then
    begin
        DetailsQuery.Params.ParamByName('ID_REESTR').Value := IdReestr;
        DetailsQuery.Open;
    end;





    ReestrEditControl.Prepare(FMode);
end;

procedure TEditReestrForm.FormCreate(Sender: TObject);
begin
    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    ReestrEditControl := TEditControl.Create;
    ReestrEditControl.Add([FC_NUM_REESTR, FC_DATE_REESTR, FC_DATE_END]);

end;

procedure TEditReestrForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
begin
    ReestrEditControl.Read;

    if ReestrEditControl.CheckFill then
    begin

        if FMode = emNew then
        begin
            PersonalCommon.WriteTransaction.StartTransaction;
            ok := ReestrEditControl.ExecProc('DT_HOSP_REESTR_INSERT', []);
            if not ok then
            begin
                PersonalCommon.WriteTransaction.Rollback;
                Exit;
            end;
            PersonalCommon.WriteTransaction.Commit;
        end;

        if FMode = emModify then
        begin
            PersonalCommon.WriteTransaction.StartTransaction;
            ok := ReestrEditControl.ExecProc('DT_HOSP_REESTR_UPDATE', [Id_Reestr]);
            if not ok then
            begin
                PersonalCommon.WriteTransaction.Rollback;
                Exit;
            end;
            PersonalCommon.WriteTransaction.Commit;
        end;


    end;
end;



end.
