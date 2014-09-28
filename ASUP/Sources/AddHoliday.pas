
{ -$Id: AddHoliday.pas,v 1.3 2007/01/30 15:48:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

                       {                       Модуль "Информация по видам отпусков"                  }
{    Отображение, редактирование и добавлении информации по видам отпусков.    }
{    Ответственный:Данил Збуривский                                            }

unit AddHoliday;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, SpComboBox, Mask, CheckEditUnit, Buttons, Db, IBCustomDataSet,
    IBQuery, FieldControl, EditControl, SpCommon, PersonalCommon, CheckLst;

type
    TAddHolidayForm = class(TAddForm)
        HolidayPropList: TCheckListBox;
        AllPropQuery: TIBQuery;
        WorkQuery: TIBQuery;
        HolPropQuery: TIBQuery;
        AllPropQueryID_PROP: TIntegerField;
        AllPropQueryNAME_PROP: TIBStringField;
        HolPropQueryID_PROP: TIntegerField;
        HolPropQueryNAME_PROP: TIBStringField;
        DetailsQueryNAME_HOLIDAY: TIBStringField;
        Label1: TLabel;
        VoplComboBox: TSpComboBox;
        FC_VOPL: TFieldControl;
        Label2: TLabel;
        DetailsQueryID_VIDOPL: TIntegerField;
        VihodBox: TSpComboBox;
        Label3: TLabel;
        FC_Vihod: TFieldControl;
        DetailsQueryVIHOD_TYPE: TIntegerField;
        Label4: TLabel;
        DontCalcHolidays: TCheckBox;
        FC_DontCalcHolidays: TFieldControl;
        DetailsQueryDONT_CALC_HOLIDAYS: TIBStringField;
        procedure FormCreate(Sender: TObject);
    published
        Name_HolidayLabel: TLabel;
        Is_MainLabel: TLabel;
        Default_TermLabel: TLabel;
        Is_PayLabel: TLabel;
        DetailsQuery: TIBQuery;
        Name_HolidayEdit: TCheckEdit;
        FC_Name_Holiday: TFieldControl;
        Is_MainBox: TCheckBox;
        DetailsQueryIs_Main: TIBStringField;
        FC_Is_Main: TFieldControl;
        Default_TermEdit: TCheckEdit;
        DetailsQueryDefault_Term: TIntegerField;
        FC_Default_Term: TFieldControl;
        Is_PayBox: TCheckBox;
        DetailsQueryIs_Pay: TIBStringField;
        FC_Is_Pay: TFieldControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure OkButtonClick(Sender: TObject);
    public
        FormControl: TEditControl;
        Mode: TEditMode;
        Id_Holiday: Integer;

        procedure Prepare(Mode: TEditMode; id: Integer); override;
        procedure BuildPropList;
        procedure ReBuildPropList;
        function GetId: Integer; override;
    end;

var
    AddHolidayForm: TAddHolidayForm;

implementation

{$R *.DFM}

procedure TAddHolidayForm.BuildPropList;
begin
    HolidayPropList.Clear;
    with AllPropQuery do
    begin
        Close;
        Open;
        First;
        while not Eof do
        begin

            HolidayPropList.Items.Add(FieldValues['Name_Prop']);
            Next;
        end;
    end;
    with HolPropQuery do
    begin

        Params.ParamValues['id_holiday'] := ID_HOLIDAY;

        Close;
        Open;
        ReBuildPropList;
    end;


end;

procedure TAddHolidayForm.ReBuildPropList;

var
    i: Integer;
begin
    for i := 0 to HolidayPropList.Items.Count - 1 do
        HolidayPropList.Checked[i] := False;
    if Mode <> emNew then
    begin

        with HolidayPropList do
            for i := 0 to Items.Count - 1 do
            begin
                if HolPropQuery.Locate('Name_Prop', Items[i], []) then
                    HolidayPropList.Checked[i] := True;


            end;
    end;
end;


procedure TAddHolidayForm.Prepare(Mode: TEditMode; id: Integer);
begin
    Self.Mode := Mode;

    if Mode = emNew then Caption := 'Додати відпустку'
    else if Mode = emModify then Caption := 'Змінити відпустку'
    else Caption := 'Додаткова інформація по відпустці';

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;

    Id_Holiday := id;

    if Mode <> emNew then
        with DetailsQuery do
        begin
            Close;
            Params.ParamValues['Id_Holiday'] := id;
            Open;
            if DetailsQuery.IsEmpty then
                MessageDlg('Не вдалося знайти запис. ' +
                    'Можливо, його вилучив інший користувач!',
                    mtError, [mbOk], 0);
        end;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name_Holiday, FC_Is_Main, FC_Default_Term, FC_Is_Pay, FC_VOPL,
        FC_Vihod, FC_DontCalcHolidays]);
    BuildPropList;
    FormControl.Prepare(Mode);
    FormControl.SetReadOnly(Mode = emView);

    OkButton.OnClick := OkButtonClick;
    OnClose := FormClose;
end;

function TAddHolidayForm.GetId: Integer;
begin
    Result := Id_Holiday;
end;

procedure TAddHolidayForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    VoplComboBox.SaveIntoRegistry;
    FormControl.Free;
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TAddHolidayForm.OkButtonClick(Sender: TObject);
var
    ok: Boolean;
    ch, i: Integer;
begin
    FormControl.Read;
    if FormControl.CheckFill then
    begin
        if Mode = emNew then
            ok := FormControl.ExecProc('Sp_Holiday_Insert', [], True)
        else ok := FormControl.ExecProc('Sp_Holiday_Update', [
                DetailsQuery.Params.ParamValues['Id_Holiday']]);
        if not ok then ModalResult := 0;
        if Mode = emNew then Id_Holiday := LastId;


        with HolidayPropList do
            for i := 0 to Items.Count - 1 do
            begin
                if Checked[i] then Ch := 1
                else Ch := 0;
                with WorkQuery.SQL do
                begin
                    Clear;
                    AllPropQuery.Locate('Name_Prop', Items[i], []);
                    Add('EXECUTE PROCEDURE HOLIDAY_PROP_UPDATE ' +
                        IntToStr(AllPropQuery['Id_Prop']) + ',' + IntToStr(ID_HOLIDAY) + ',' +
                        IntToStr(Ch));
                end;
                ExecQuery(WorkQuery);
            end;


    end
    else ModalResult := 0;
end;

procedure TAddHolidayForm.FormCreate(Sender: TObject);
begin
    AllPropQuery.Transaction := PersonalCommon.ReadTransaction;
    HolPropQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;

end;

initialization
    RegisterClass(TAddHolidayForm);
end.
