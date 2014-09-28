
{ -$Id: PeopleDetailsUnit.pas,v 1.10 2009/03/26 08:49:41 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Информация о физическом лице"                    }
{   Отображении,редактирование и добавление информации о физическом лице        }
{         Ответственный: Данил Збуривский                                      }

unit PeopleDetailsUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ComCtrls, StdCtrls, Buttons, Db, IBCustomDataSet, IBTable,
    DBCtrls, Mask, IBQuery, IBDatabase, CheckEditUnit, Grids, DBGrids,
    FieldControl, EditControl, PersonalCommon, ToolWin,
    SpCommon, AddManFamily, Halcn6db, ImportPeople, Variants, Buffer,
    PassVidanUnit, uCommonSp;

type
    TPeopleDetailsForm = class(TForm)
        DetailsPageControl: TPageControl;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        MainPage: TTabSheet;
        PassPage: TTabSheet;
        FamilyPage: TTabSheet;
        SexTable: TIBTable;
        SexSource: TDataSource;
        SexTableID_SEX: TIntegerField;
        SexTableFULL_NAME: TIBStringField;
        SexTableSHORT_NAME: TIBStringField;
        Label4: TLabel;
        BirthPlaceLabel: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        BirthButton: TButton;
        Label7: TLabel;
        AdressLabel: TLabel;
        AdressButton: TButton;
        Label9: TLabel;
        Label11: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        PrevPassButton: TBitBtn;
        NextPassButton: TBitBtn;
        NewPassButton: TBitBtn;
        PassFamiliaEdit: TCheckEdit;
        FamiliaEdit: TCheckEdit;
        ImyaEdit: TCheckEdit;
        OtchestvoEdit: TCheckEdit;
        TinEdit: TCheckEdit;
        PassImyaEdit: TCheckEdit;
        PassOtchestvoEdit: TCheckEdit;
        SeriaEdit: TCheckEdit;
        NumberEdit: TCheckEdit;
        PassQuery: TIBQuery;
        VidanEdit: TCheckEdit;
        ModifyPassButton: TBitBtn;

        Label18: TLabel;
        VoidLabel: TLabel;
        DateEndLabel: TLabel;
        PassQueryNUMBER: TIBStringField;
        PassQuerySERIA: TIBStringField;
        PassQueryDATE_BEG: TDateField;
        PassQueryDATE_END: TDateField;
        PassQueryVIDAN: TIBStringField;
        PassQueryFAMILIA: TIBStringField;
        PassQueryIMYA: TIBStringField;
        PassQueryOTCHESTVO: TIBStringField;
        RusImyaEdit: TCheckEdit;
        RusOtchestvoEdit: TCheckEdit;
        RusFamiliaEdit: TCheckEdit;
        Label22: TLabel;
        PassRusFamiliaEdit: TCheckEdit;
        Label23: TLabel;
        PassRusImyaEdit: TCheckEdit;
        Label24: TLabel;
        PassRusOtchestvoEdit: TCheckEdit;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label19: TLabel;
        Label20: TLabel;
        Label21: TLabel;
        PassQueryRUS_FAMILIA: TIBStringField;
        PassQueryRUS_IMYA: TIBStringField;
        PassQueryRUS_OTCHESTVO: TIBStringField;
        FC_Familia: TFieldControl;
        FC_Imya: TFieldControl;
        FC_Otchestvo: TFieldControl;
        FC_RusFamilia: TFieldControl;
        FC_RusImya: TFieldControl;
        FC_RusOtchestvo: TFieldControl;
        FC_Sex: TFieldControl;
        FC_BirthDate: TFieldControl;
        FC_Tin: TFieldControl;
        FC_PassFamilia: TFieldControl;
        FC_PassRusFamilia: TFieldControl;
        FC_PassImya: TFieldControl;
        FC_PassRusImya: TFieldControl;
        FC_PassOtchestvo: TFieldControl;
        FC_PassRusOtchestvo: TFieldControl;
        FC_Seria: TFieldControl;
        FC_Number: TFieldControl;
        FC_DateBeg: TFieldControl;
        FC_Vidan: TFieldControl;
        SexBox: TDBLookupComboBox;
        BirthDatePicker: TDateTimePicker;
        DateBegPicker: TDateTimePicker;
        Employee: TRadioButton;
        Another: TRadioButton;
        FC_Adress: TFieldControl;
        FC_Birth_Place: TFieldControl;
        DetailsQuery: TIBQuery;
        DetailsQueryBIRTH_DATE: TDateField;
        DetailsQueryID_BIRTH_PLACE: TIntegerField;
        DetailsQueryID_ADRESS: TIntegerField;
        DetailsQueryTIN: TIBStringField;
        DetailsQueryID_SEX: TIntegerField;
        DetailsQueryRUS_FAMILIA: TIBStringField;
        DetailsQueryRUS_IMYA: TIBStringField;
        DetailsQueryRUS_OTCHESTVO: TIBStringField;
        DetailsQueryFAMILIA: TIBStringField;
        DetailsQueryIMYA: TIBStringField;
        DetailsQueryOTCHESTVO: TIBStringField;
        FamilyGrid: TDBGrid;
        ToolBar1: TToolBar;
        AddButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        ToolButton1: TToolButton;
        FamilyQuery: TIBQuery;
        FamilySourse: TDataSource;
        PassCountQuery: TIBQuery;
        PassCountQueryCOUNT: TIntegerField;
        TotalPassLabel: TLabel;
        NumPassLabel: TLabel;
        FamilyQueryFIO: TIBStringField;
        FamilyQueryNAME_RELATION: TIBStringField;
        DeleteFamilyQuery: TIBQuery;
        GetIdManQuery: TIBQuery;
        GetIdManQueryIDMAN: TIntegerField;
        BufInfoQuery: TIBQuery;
        BufInfoQueryID_PBKEY: TIntegerField;
        BufInfoQueryCUR_DATE: TDateField;
        BufInfoQueryCUR_TIME: TTimeField;
        BufCopyQuery: TIBQuery;
        FamilyQueryBIRTH_DATE: TDateField;
        WorkQuery: TIBQuery;
        PassDeleteButton: TBitBtn;
        ModifyButton: TSpeedButton;
        SelectVidanButton: TSpeedButton;
        AdrQuery: TIBQuery;
        AdrQueryADR: TIBStringField;
        DetailsQueryFOREIGN_W: TIBStringField;
        BufferQuery: TIBQuery;
        PassQueryID_PAS_DATA: TLargeintField;
        procedure OkButtonClick(Sender: TObject);
        procedure AdressButtonClick(Sender: TObject);
        procedure PrevPassButtonClick(Sender: TObject);
        procedure NextPassButtonClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure NewPassButtonClick(Sender: TObject);
        procedure ModifyPassButtonClick(Sender: TObject);
        procedure SexTableAfterOpen(DataSet: TDataSet);
        procedure PassPageEnter(Sender: TObject);
        procedure SexBoxEnter(Sender: TObject);
        procedure DetailsPageControlChange(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure EditMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure PassEditMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer);
        procedure AddButtonClick(Sender: TObject);
 // показывает форму редактирования данных о человеке
        procedure ShowChangeForm(Mode: TEditMode);
 // удаляет родственника из семьи
        procedure DeleteButtonClick(Sender: TObject);
        procedure PassQueryAfterPost(DataSet: TDataSet);
        procedure FamilyGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FillBufCopy;
        procedure FamilyPageEnter(Sender: TObject);
        procedure PassDellButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure SelectVidanButtonClick(Sender: TObject);
        procedure BirthButtonClick(Sender: TObject);
    private
        NewPass: Boolean;
        ModifyPass: Boolean;
        function CheckData: Boolean;
        procedure PrepareDateEnd;
        procedure SetFIO;
        procedure ShowNumPass(Id: Integer);
    public
        AddSecond: Boolean;
        id1: Integer;
        Mode: TEditMode;
        MainEditControl: TEditControl;
        PassEditControl: TEditControl;
        IDMAN: Integer;
        Id_Pas_Data: Integer;
        procedure Prepare(id: Integer; mode: TEditMode);
    end;

var
    PeopleDetailsForm: TPeopleDetailsForm;

implementation

{$R *.DFM}

uses MainUnit, uBuffer2;

procedure TPeopleDetailsForm.FillBufCopy;
var
    FIO, FIOU, SEX: string;

begin
    FIOU := PassFamiliaEdit.Text + ' ' + PassImyaEdit.Text + ' ' +
        PassOtchestvoEdit.Text;
    FIO := PassRusFamiliaEdit.Text + ' ' + PassRusImyaEdit.Text + ' ' +
        PassRusOtchestvoEdit.Text;

    if SexBox.KeyValue = 1 then SEX := 'T'
    else SEX := 'F';

    BufCopyQuery.Params.ParamValues['FIOU'] := FIOU;
    BufCopyQuery.Params.ParamValues['FIO'] := FIO;
    BufCopyQuery.Params.ParamValues['Sex'] := SEX;
    BufCopyQuery.Params.ParamValues['BirthDay'] := BirthDatePicker.DateTime;
    BufCopyQuery.Params.ParamValues['SEria'] := SeriaEdit.Text;
    BufCopyQuery.Params.ParamValues['Nomer'] := NumberEdit.Text;
    BufCopyQuery.Params.ParamValues['DateV'] := DateBegPicker.DateTime;
    BufCopyQuery.Params.ParamValues['Mesto'] := VidanEdit.Text;
    BufCopyQuery.Params.ParamValues['Ink'] := TinEdit.Text;
end;

procedure TPeopleDetailsForm.Prepare(id: Integer; Mode: TEditMode);
begin
    Self.Mode := Mode;
    IDMAN := id;
    with DetailsQuery do
    begin
        Close;
        Params.ParamValues['Id_Man'] := id;
        Open;
    end;

    with PassQuery do
    begin
        Close;
        Params.ParamValues['Id_Man'] := id;
        Open;
    end;

    PassQuery.Locate('DATE_END', StrToDate('01.01.3000'), []);

    case Mode of
        emNew:
            Caption := 'Довідник фізичних осіб: Додати';
        emModify:
            Caption := 'Довідник фізичних осіб: Змінити';
        emView:
            Caption := 'Довідник фізичних осіб: Інформація';
    end;

    NewPass := (Mode = emNew);
    ModifyPass := False;

    if PassQuery.IsEmpty then

        PassEditControl.Prepare(emNew)
    else PassEditControl.Prepare(Mode);

    PassEditControl.SetReadOnly(Mode = emView);

    MainEditControl.Prepare(Mode);
    PassEditControl.Prepare(Mode);

    PrepareDateEnd;

    MainEditControl.SetReadOnly(Mode = emView);
    PassEditControl.SetReadOnly(Mode <> emNew);

    BirthButton.Enabled := (Mode <> emView);
    AdressButton.Enabled := (Mode <> emView);

    PassDeleteButton.Enabled := (Mode <> emView);

    NewPassButton.Enabled := (Mode <> emView);
    ModifyPassButton.Enabled := (Mode = emModify);
    NextPassButton.Enabled := (Mode <> emNew);
    PrevPassButton.Enabled := (Mode <> emNew);
    FamiliaEdit.ReadOnly := (Mode <> emNew);
    ImyaEdit.ReadOnly := (Mode <> emNew);
    OtchestvoEdit.ReadOnly := (Mode <> emNew);
    RusFamiliaEdit.ReadOnly := (Mode <> emNew);
    RusImyaEdit.ReadOnly := (Mode <> emNew);
    RusOtchestvoEdit.ReadOnly := (Mode <> emNew);

 //	Employee.Visible := (Mode = emNew);
 //	Another.Visible := (Mode = emNew);

    FamilyQuery.Params.ParamValues['Id_Man'] := Id;
    FamilyQuery.Active := True;
    if Mode = emNew then
    begin
        FamilyPage.TabVisible := False;
        AddSecond := False;
    end
    else
    begin
        FamilyPage.TabVisible := True;
        AddSecond := False;
    end;
    if Mode = emView then
    begin
        AddButton.Visible := False;
        DeleteButton.Visible := False;
        ModifyButton.Visible := False;

    end;
    GridResize(FamilyGrid);
    if PassQuery.IsEmpty then
    begin
        ModifyPassButton.Enabled := False;
        PrevPassButton.Enabled := False;
    end;

    NextPassButton.Enabled := False;

        // показ количества паспортов
    ShowNumPass(ID);

    if (Mode <> emNew) then
    begin
        AdrQuery.SQL.Text := 'select full_name as Adr from ADR_ADRESS_SEL(:ID)';
        AdrQuery.Params.ParamValues['ID'] := DetailsQuery['ID_ADRESS'];
        AdrQuery.Open;
        if (not AdrQueryADR.IsNull) then
            AdressLabel.Caption := AdrQuery['Adr'];
        AdrQuery.Close;

        AdrQuery.SQL.Text := ' select full_name as Adr from adr_get_by_id_place(:ID)';
        AdrQuery.Params.ParamValues['ID'] := DetailsQuery['ID_BIRTH_PLACE'];
        AdrQuery.Open;
        if (not AdrQueryADR.IsNull) then
            BirthPlaceLabel.Caption := AdrQuery['Adr'];
        AdrQuery.Close;
        
        if (DetailsQuery['TIN'] < 0) then TINEdit.Text := '';

    end;
end;

function TPeopleDetailsForm.CheckData: Boolean;
var
    TIN: LongInt;
    Razn: Extended;
    Date1: TDate;
    Date2: TDate;

begin
    SetFIO;
    Date2 := 1;
 //Date2:=StrToDate('01.01.1900');
    Date1 := BirthDatePicker.DateTime;

    if Trim(TinEdit.Text) <> '' then
    try
        TIN := StrToInt(Copy(TinEdit.Text, 1, 5));
        Razn := Round(Date1 - Date2);
        if TIN <> Razn
            then
            if
                (MessageDlg('Дата народження не співпадає з податковим номером! Додати цю інформацію?'
                , mtConfirmation, [mbYes, mbNo], 0) = mrNo)
                then

            begin
                Result := False;
                Exit;
            end;
    except
    end;

    MainEditControl.Read;

    if not MainEditControl.CheckFill then
    begin
        Result := False;
        Exit;
    end;

    PassEditControl.Read;

    Result := True;

    if Employee.Checked = False then Exit;

    if not PassEditControl.CheckFill then
    begin
        DetailsPageControl.ActivePage := PassPage;
        SeriaEdit.SetFocus;
        PrepareDateEnd;
        Result := False;
        Exit;
    end;
end;

procedure TPeopleDetailsForm.OkButtonClick(Sender: TObject);
var
    FIO, FIOU: string;
    IdPbKey: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
        // если режим просмотра, не делать ничего
    if Mode = emView then
    begin
        Close;
        Exit;
    end;

        // если чего-то с данными не то, забить
    if not CheckData then Exit;

    if not AddSecond then
        if Mode = emNew then
            IDMAN := ExecQuery(GetIdManQuery)
        else IDMAN := DetailsQuery.Params.ParamValues['Id_Man'];

    BufTran2 := nil;
    if WriteTransaction.Active then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;
    try
        if (Mode = emNew) and AddSecond and PassEditControl.Changed then
        begin
            SetFIO;
            PassEditControl.Read;
        end;

        if (Mode = emNew) and not AddSecond then
            MainEditControl.ExecProc('People_Insert', [IDMAN]);

        if (Mode = emModify) or ((Mode = emNew) and AddSecond
            and MainEditControl.Changed)
            then MainEditControl.ExecProc('People_Update', [IDMAN]);

        if (NewPass = True) then
            if ModifyPass then
                PassEditControl.ExecProc('Pass_Data_Update', [IDMAN, ID_PAS_DATA])
            else PassEditControl.ExecProc('Pass_Data_Insert', [IDMAN]);

        PassEditControl.Read;

              // если получилось, пишем в дублирующий буфер в Interbase
        if not DontWriteToDbf then
        begin
            BufferQuery.Transaction := WriteTransaction;
            BufferQuery.Close;
            BufferQuery.ParamByName('Id_Man').AsInteger := IDMAN;
            BufferQuery.Open;
            First_PBKey := BufferQuery['First_PBKey'];
            Last_PBKey := BufferQuery['Last_PBKey'];

            BufTran2 := TBufferTransaction2.
                Create('PEP_DATA', 'BUFF_PEP_DATA', WriteTransaction);
            BufTran2.WriteRange(First_PBKey, Last_PBKey);
        end;
        WriteTransaction.Commit;
        NewPass := False;

    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if not DontWriteToDbf then BufTran2.RollbackOnError;

            MessageDlg('При занесенні інформації виникла помилка: ' +
                e.Message, mtError, [mbOk], 0);
        end;
    end;
    if BufTran2 <> nil then BufTran2.Free;

    if (Mode = emModify) or ((Mode = emNew) and AddSecond) then
    begin
        ModalResult := mrOk;
        Exit;
    end;

    if (Mode = emNew) and not AddSecond then
    begin
        AddSecond := True;
        MessageDlg('Основні данні занесені.Внесіть додаткову інформацію.',
            mtInformation, [mbOk], 0);
        FamilyPage.TabVisible := True;
        Exit;
    end;
end;

procedure TPeopleDetailsForm.AdressButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
    DetailsQuery.Params.ParamValues['ID_MAN'] := IDMAN;
    DetailsQuery.Open;
    // создать справочник (указать правильный путь)
    sp := GetSprav('Adresses.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
          // хэндл базы
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
          // идентификатор адреса для редактирования либо Null для нового адреса
            FieldValues['id_adress'] := DetailsQueryID_BIRTH_PLACE.Value;
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 3;
            Post;
          // Признак адреса места рождения
        end;

            // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
             // в этом поле строковая форма адреса
            BirthPlaceLabel.Caption := sp.Output['Name_Adr'];
          // идентификатор адреса, если он был добавлен
            FC_BIRTH_PLACE.Value := IntToStr(sp.Output['Id_Adress']);
        end;

        sp.Free;
    end;









   {
                // создать справочник (указать правильный путь)
    sp := GetSprav('Address_Linear.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
          // хэндл базы
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
          // идентификатор адреса для редактирования либо Null для нового адреса
            FieldValues['Id_Address'] := DetailsQueryID_BIRTH_PLACE.Value;
          // Признак адреса места рождения
            FieldValues['bone_adrr'] := 'ba';
            Post;
        end;

            // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
             // в этом поле строковая форма адреса
            BirthPlaceLabel.Caption := sp.Output['Address_String'];
          // идентификатор адреса, если он был добавлен
            FC_BIRTH_PLACE.Value := IntToStr(sp.Output['Ret_Address']);
        end;
        sp.Free;
    end;
    }
    DetailsQuery.Close;
end;

procedure TPeopleDetailsForm.PrepareDateEnd;
begin
    DateEndLabel.Caption := '';
    if NewPass then VoidLabel.Visible := False
    else
        with PassQuery do
        begin
            if IsEmpty then VoidLabel.Visible := False
            else
            begin
                DateEndLabel.Caption :=
                    FieldByName('Date_End').AsString;
                if DateEndLabel.Caption = '01.01.3000' then
                begin
                    VoidLabel.Visible := False;
                    DateEndLabel.Caption := '';
                end
                else
                    VoidLabel.Visible := True;
            end;
        end;
end;

procedure TPeopleDetailsForm.PrevPassButtonClick(Sender: TObject);
begin
    PassQuery.Prior;
    PassEditControl.Prepare(Mode);
    PrepareDateEnd;
    PassQuery.Prior;
    if PassQuery.BOF then
    begin
        PrevPassButton.Enabled := False;
        NextPassButton.Enabled := True;
    end
    else
    begin
        PrevPassButton.Enabled := True;
        NextPassButton.Enabled := True;
        PassQuery.Next;
    end;
end;

procedure TPeopleDetailsForm.NextPassButtonClick(Sender: TObject);
begin

    PassQuery.Next;
    PassEditControl.Prepare(Mode);
    PrepareDateEnd;
    PassQuery.Next;
    if PassQuery.EOF then
    begin
        NextPassButton.Enabled := False;
        PrevPassButton.Enabled := True;
    end

    else
    begin
        NextPassButton.Enabled := True;
        PrevPassButton.Enabled := True;
        PassQuery.Prior;
    end;

end;

procedure TPeopleDetailsForm.FormCreate(Sender: TObject);
begin
    AdrQuery.Transaction := ReadTransaction;
    WorkQuery.Transaction := WriteTransaction;
    SexTable.Transaction := ReadTransaction;
    DetailsQuery.Transaction := ReadTransaction;
    PassQuery.Transaction := ReadTransaction;
    GetIdManQuery.Transaction := ReadTransaction;
    FamilyQuery.Transaction := ReadTransaction;
    PassCountQuery.Transaction := ReadTransaction;
    DeleteFamilyQuery.Transaction := WriteTransaction;
    BufCopyQuery.Transaction := BufferTransaction;

    SexTable.Open;
    PassQuery.Open;

    MainEditControl := TEditControl.Create;
    MainEditControl.Add([FC_Familia, FC_Imya, FC_Otchestvo, FC_RusFamilia,
        FC_RusImya, FC_RusOtchestvo, FC_Sex, FC_BirthDate, FC_Tin,
            FC_Birth_Place, FC_Adress]);

    PassEditControl := TEditControl.Create;
    PassEditControl.Add([FC_PassFamilia, FC_PassImya, FC_PassOtchestvo,
        FC_PassRusFamilia, FC_PassRusImya, FC_PassRusOtchestvo, FC_Seria,
            FC_Number, FC_DateBeg, FC_Vidan]);
    TotalPassLabel.Visible := False;
    NumPassLabel.Visible := False;
    AddSecond := False;

end;

procedure TPeopleDetailsForm.NewPassButtonClick(Sender: TObject);
begin
    NewPass := True;
    PassEditControl.Prepare(emNew);
    PassEditControl.SetReadOnly(False);
    PrepareDateEnd;
end;

procedure TPeopleDetailsForm.ModifyPassButtonClick(Sender: TObject);
begin
    NewPass := True;
    ModifyPass := True;
    PassEditControl.Prepare(emModify);
    PassEditControl.SetReadOnly(False);
    PrevPassButton.Enabled := False;
    NextPassButton.Enabled := False;
    Id_Pas_Data := PassQuery['Id_Pas_Data'];
    PrepareDateEnd;
end;

 // забирает все данные из таблицы полов

procedure TPeopleDetailsForm.SexTableAfterOpen(DataSet: TDataSet);
begin
    SexTable.FetchAll;
end;

procedure TPeopleDetailsForm.PassPageEnter(Sender: TObject);
begin
    if NewPass then
    begin
        if PassFamiliaEdit.Text = '' then
            PassFamiliaEdit.Text := FamiliaEdit.Text;
        if PassImyaEdit.Text = '' then
            PassImyaEdit.Text := ImyaEdit.Text;
        if PassOtchestvoEdit.Text = '' then
            PassOtchestvoEdit.Text := OtchestvoEdit.Text;
        if PassRusFamiliaEdit.Text = '' then
            PassRusFamiliaEdit.Text := RusFamiliaEdit.Text;
        if PassRusImyaEdit.Text = '' then
            PassRusImyaEdit.Text := RusImyaEdit.Text;
        if PassRusOtchestvoEdit.Text = '' then
            PassRusOtchestvoEdit.Text := RusOtchestvoEdit.Text;
    end;
    if (Mode = emNew) and not DateBegPicker.Checked then
        if BirthDatePicker.Checked then
        begin
            DateBegPicker.Date := IncMonth(BirthDatePicker.Date, 12 *
                PersonalCommon.Consts_Query['PASS_AGE']);
            DateBegPicker.Checked := False;
        end;

end;

procedure TPeopleDetailsForm.SetFIO;
begin
    if PassFamiliaEdit.Text <> '' then
        FamiliaEdit.Text := PassFamiliaEdit.Text;
    if PassImyaEdit.Text <> '' then
        ImyaEdit.Text := PassImyaEdit.Text;
    if PassOtchestvoEdit.Text <> '' then
        OtchestvoEdit.Text := PassOtchestvoEdit.Text;
    if PassRusFamiliaEdit.Text <> '' then
        RusFamiliaEdit.Text := PassRusFamiliaEdit.Text;
    if PassRusImyaEdit.Text <> '' then
        RusImyaEdit.Text := PassRusImyaEdit.Text;
    if PassRusOtchestvoEdit.Text <> '' then
        RusOtchestvoEdit.Text := PassRusOtchestvoEdit.Text;
end;

procedure TPeopleDetailsForm.SexBoxEnter(Sender: TObject);
begin
    if Sender is TWinControl then
        if (Sender as TWinControl).TabStop = False then
            OkButton.SetFocus;
end;

procedure TPeopleDetailsForm.DetailsPageControlChange(Sender: TObject);
begin
    if DetailsPageControl.ActivePage = PassPage then
        PassPageEnter(Sender);
end;

procedure TPeopleDetailsForm.FormActivate(Sender: TObject);
begin
    DetailsPageControl.ActivePage := MainPage;
    if Employee.Visible then Employee.SetFocus
    else FamiliaEdit.SetFocus;
end;

procedure TPeopleDetailsForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TPeopleDetailsForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    MainEditControl.Free;
    PassEditControl.Free;
    Action := caFree;
end;

procedure TPeopleDetailsForm.EditMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if Mode = emModify then
    begin
        MessageDlg('Ці поля змінюються тільки з новим паспортом',
            mtWarning, [mbOk], 0);
        DetailsPageControl.ActivePage := PassPage;

    end;
end;

procedure TPeopleDetailsForm.PassEditMouseDown(Sender: TObject;
    Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if (Mode = emModify) and not NewPass then
    begin
        MessageDlg('Ці поля змінюються тільки з новим паспортом',
            mtWarning, [mbOk], 0);

    end;
end;

procedure TPeopleDetailsForm.ShowChangeForm(Mode: TEditMode);
var
    form: TAddManFamilyForm;
begin
    if Mode = emView then Exit;

    form := TAddManFamilyForm.Create(Self);

    if Mode = emModify then form.FIO := FamilyQuery['FIO'];
    form.Prepare(Mode, IDMAN);

    if form.ShowModal = mrOk then
    begin
        FamilyQuery.Params.ParamValues['ID_MAN'] := IDMAN;
        FamilyQuery.Close;
        FamilyQuery.Open;

        GridResize(FamilyGrid);
    end;
    form.Free;
end;

procedure TPeopleDetailsForm.AddButtonClick(Sender: TObject);
begin
    if Mode = emView then Exit;
    ShowChangeForm(emNew);
end;

procedure TPeopleDetailsForm.DeleteButtonClick(Sender: TObject);
begin
    if Mode = emView then Exit;

    if FamilyQuery.IsEmpty then
    begin
        MessageDlg('Нема чого вилучати!', mtError, [mbOk], 0);
        Exit;
    end;

    if MessageDlg('Чи ви справді бажаєте вилучити запис ' +
        FamilyQuery['FIO'] + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then
        with DeleteFamilyQuery do
        begin
            Params.ParamValues['Id_Man'] :=
                FamilyQuery.Params.ParamValues[('ID_MAN')];
            Params.ParamValues['FIO'] := FamilyQuery['FIO'];

            try
                ExecQuery(DeleteFamilyQuery);
            except on E: Exception do
                begin
                    MessageDlg('При вилучанні з бази даних виникла помилка: '
                        + E.Message, mtError, [mbOk], 0);
                    Exit;
                end;
            end;

            QueryRefresh(FamilyQuery);
            GridResize(FamilyGrid);
        end;
end;

procedure TPeopleDetailsForm.PassQueryAfterPost(DataSet: TDataSet);
begin
    if PassQuery.IsEmpty then
    begin
        ModifyPassButton.Enabled := False;
        NextPassButton.Enabled := False;
        PrevPassButton.Enabled := False;
    end;
end;

procedure TPeopleDetailsForm.FamilyGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Mode = emView then exit;
    case Key of
        VK_DELETE: DeleteButton.Click;
        VK_ADD: AddButton.Click;
    end;
end;

procedure TPeopleDetailsForm.FamilyPageEnter(Sender: TObject);
begin
    FamilyQuery.Params.ParamValues['ID_MAN'] := IDMAN;
    FamilyQuery.Close;
    FamilyQuery.Open;

end;

procedure TPeopleDetailsForm.PassDellButtonClick(Sender: TObject);
begin
    if (not PassQuery.IsEmpty) then
    begin
        if MessageDlg('Чи ви справді бажаєте вилучити паспортні данні?'
            , mtConfirmation, [mbYes, mbNo], 0) = mrYes
            then
        begin
            WorkQuery.SQL.Text := 'EXECUTE PROCEDURE PASS_DATA_DELETE ' +
                IntToStr(IDMAN) + ',''' + DateToStr(PassQuery['DATE_BEG']) +
                ''', ' + IntToStr(PassQuery['Id_Pas_Data']);
            PassQuery.Close;
            ExecQuery(WorkQuery);
            PassQuery.Params.ParamValues['ID_MAN'] := IDMAN;

            PassQuery.Open;
            PassEditControl.Prepare(Mode);
            ModifyPassButton.Enabled := False;
            ShowNumPass(IDMAN);
        end;
    end;

end;

procedure TPeopleDetailsForm.ModifyButtonClick(Sender: TObject);
begin
    if Mode = emView then Exit;

    if FamilyQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        Exit;
    end;
    ShowChangeForm(emModify);

end;

procedure TPeopleDetailsForm.SelectVidanButtonClick(Sender: TObject);
var
    Form: TPassVidanForm;
begin
    if (NewPass = True) or (ModifyPass = True) then
    begin
        form := TPassVidanForm.Create(Self);

        if Form.ShowModal = mrOk then
        begin
            VidanEdit.Text := form.ResultQuery['VIDAN'];
        end;

        form.Free;
    end;
end;

procedure TPeopleDetailsForm.BirthButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
    DetailsQuery.Params.ParamValues['ID_MAN'] := IDMAN;
    DetailsQuery.Open;
    // создать справочник (указать правильный путь)
    sp := GetSprav('Adresses.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
          // хэндл базы
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
          // идентификатор адреса для редактирования либо Null для нового адреса
            FieldValues['id_adress'] := DetailsQueryID_ADRESS.Value;
            FieldValues['Select'] := 1;
            FieldValues['ShowStyle'] := 4;
            Post;
          // Признак адреса места рождения
        end;

            // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
             // в этом поле строковая форма адреса
            AdressLabel.Caption := sp.Output['Name_Adr'];
          // идентификатор адреса, если он был добавлен
            FC_ADRESS.Value := IntToStr(sp.Output['Id_Adress']);
        end;
        sp.Free;
    end;

   {         // создать справочник (указать правильный путь)
    sp := GetSprav('Address_Linear.bpl');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
          // хэндл базы
            FieldValues['DBHandle'] := Integer(FIBDatabase.Handle);
          // идентификатор адреса для редактирования либо Null для нового адреса
            FieldValues['Id_Address'] := DetailsQueryID_ADRESS.Value;
          // Признак адреса места рождения
            FieldValues['bone_adrr'] := 'lp';
            Post;
        end;

            // показать справочник и проанализировать результат
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
             // в этом поле строковая форма адреса
            AdressLabel.Caption := sp.Output['Address_String'];
          // идентификатор адреса, если он был добавлен
            FC_ADRESS.Value := IntToStr(sp.Output['Ret_Address']);
        end;
        sp.Free;    }
   // end;

    DetailsQuery.Close;
end;

procedure TPeopleDetailsForm.ShowNumPass(Id: Integer);
begin
    if Id <> -1 then
    begin
        PassCountQuery.Close;
        PassCountQuery.Params.ParamValues['Id_Man'] := Id;
        PassCountQuery.Open;
        if PassCountQuery['COUNT'] = 1 then PrevPassButton.Enabled := False;
        if PassCountQuery['COUNT'] > 1 then
        begin
            TotalPassLabel.Visible := True;
            NumPassLabel.Visible := True;
            NumPassLabel.Caption := IntToStr(PassCountQuery['COUNT']);
        end;
    end;
end;

end.

