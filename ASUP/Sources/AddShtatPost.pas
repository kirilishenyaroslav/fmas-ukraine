
{ -$Id: AddShtatPost.pas,v 1.13 2007/09/27 09:11:52 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                Модуль "Добавление позиции штатного расписания"               }
{    Добавление, изменение и просмотр данных о позиции штатного расписания     }
{                                                  ответственный: Олег Волков  }

unit AddShtatPost;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, SpComboBox, ComCtrls, ExtCtrls, OrdersViewUnit,
    FieldControl, Mask, CheckEditUnit, EditControl, SpCommon,
    Db, IBCustomDataSet, IBQuery, PersonalCommon, TarDigits, Grids, DBGrids,
    AddPostBonus, PostBonus, Variants, Buffer, DateUtils, NagScreenUnit, Math,
    CheckLst;

type
    TAddShtatPostForm = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DetailsQuery: TIBQuery;
        DetailsQueryID_POST: TIntegerField;
        DetailsQueryDATE_BEG: TDateField;
        DetailsQueryDATE_END: TDateField;
        DetailsQueryOKLAD: TIBBCDField;
        DetailsQueryID_TAR_NET: TIntegerField;
        DetailsQueryNUM_DIGIT: TIntegerField;
        DetailsQueryKOL_STAVOK: TIBBCDField;
        PostQuery: TIBQuery;
        PostQueryOKL_FORK: TIBStringField;
        PostQueryOKL_MIN: TIBBCDField;
        PostQueryOKL_MAX: TIBBCDField;
        BonusQuery: TIBQuery;
        BonusSource: TDataSource;
        BonusQueryNAME_BONUS: TIBStringField;
        BonusQueryID_POST_BONUS: TIntegerField;
        BonusQueryDATE_BEG: TDateField;
        BonusQueryDATE_END: TDateField;
        BonusQueryIS_PERCENT: TIBStringField;
        BonusQueryPERCENT: TIntegerField;
        BonusQuerySUMMA: TIBBCDField;
        BonusQueryBonus: TStringField;
        DetailsQueryID_PAY_FORM: TIntegerField;
        DetailsQueryID_WORK_COND: TIntegerField;
        PostQueryID_WORK_COND: TIntegerField;
        DetailsQueryID_WORK_MODE: TIntegerField;
        PeopleQuery: TIBQuery;
        BufferQuery: TIBQuery;
        DetailsQueryCOMMENT: TIBStringField;
        DetailsQueryDONT_SHOW_IN_PLAN: TIBStringField;
        DetailsQueryDONT_SHOW_IN_FACT: TIBStringField;
        PageControl: TPageControl;
        MainPage: TTabSheet;
        AdditionalPage: TTabSheet;
        BonusPanel: TPanel;
        Label3: TLabel;
        TopPanel: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        BonusGrid: TDBGrid;
        PostLabel: TLabel;
        PostBox: TSpComboBox;
        FC_Post: TFieldControl;
        Label1: TLabel;
        DateBegPicker: TDateTimePicker;
        FC_DateBeg: TFieldControl;
        Label2: TLabel;
        DateEndPicker: TDateTimePicker;
        FC_DateEnd: TFieldControl;
        MoneyGroupBox: TGroupBox;
        RozrLabel: TLabel;
        FC_TarNet: TFieldControl;
        OkladRadio: TRadioButton;
        TarRadio: TRadioButton;
        OkladEdit: TCheckEdit;
        KolStavokLabel: TLabel;
        KolStavokEdit: TCheckEdit;
        FC_KolStavok: TFieldControl;
        WorkQuery: TIBQuery;
        Label4: TLabel;
        PayFormBox: TSpComboBox;
        FC_Pay_Form: TFieldControl;
        Label5: TLabel;
        WorkCondBox: TSpComboBox;
        FC_Work_Cond: TFieldControl;
        FC_Dont_Show_In_Fact: TFieldControl;
        FC_Dont_Show_In_Plan: TFieldControl;
        FC_Premia: TFieldControl;
        FC_Harmful_Holiday: TFieldControl;
        FC_Special_Holiday: TFieldControl;
        Dont_Show_In_Plan: TCheckBox;
        Dont_Show_In_Fact: TCheckBox;
        FC_Digit: TFieldControl;
        FC_Oklad: TFieldControl;
        Label6: TLabel;
        WorkModeBox: TSpComboBox;
        FC_Work_Mode: TFieldControl;
        FC_Comment: TFieldControl;
        Label7: TLabel;
        CommentMemo: TMemo;
        Label8: TLabel;
        PremiaEdit: TCheckEdit;
        Label9: TLabel;
        HarmfulHolidayEdit: TCheckEdit;
        AddHolidayLabel: TLabel;
        SpecialHolidayEdit: TCheckEdit;
        DetailsQueryID_SHTATRAS: TIntegerField;
        DetailsQueryNAME_POST: TIBStringField;
        DetailsQueryID_ORDER: TIntegerField;
        DetailsQueryNUM_ORDER: TIBStringField;
        DetailsQueryNUM_ITEM: TIntegerField;
        DetailsQueryNAME_TAR_NET: TIBStringField;
        DetailsQueryMONEY: TIBBCDField;
        DetailsQueryNAME_PAY_FORM: TIBStringField;
        DetailsQueryNAME_WORK_COND: TIBStringField;
        DetailsQueryNAME_WORK_MODE: TIBStringField;
        DetailsQueryPREMIA: TIntegerField;
        DetailsQueryHARMFUL_HOLIDAY: TIntegerField;
        DetailsQuerySPECIAL_HOLIDAY: TIntegerField;
        DigitsQuery: TIBQuery;
        TarNetsQuery: TIBQuery;
        Label11: TLabel;
        DigitEdit: TCheckEdit;
        Label12: TLabel;
        StavkaEdit: TCheckEdit;
        TarBox: TSpComboBox;
        RecalcButton: TBitBtn;
        PeopleQueryID_MAN_MOVING: TIntegerField;
        PeopleQueryDATE_BEG: TDateField;
        PeopleQueryDATE_END: TDateField;
        PeopleSheet: TTabSheet;
        PeopleGrid: TDBGrid;
        PeopleSource: TDataSource;
        Panel1: TPanel;
        Label13: TLabel;
        Label14: TLabel;
        WorkersLabel: TLabel;
        VacanciesLabel: TLabel;
        PeopleQueryKOL_STAVOK: TIBBCDField;
        PropertiesSheet: TTabSheet;
        PropBox: TCheckListBox;
        PropQuery: TIBQuery;
        PeopleQueryOTPUSK: TIBStringField;
        PeopleQueryBOLEET: TIBStringField;
        ChangePropQuery: TIBQuery;
        Label15: TLabel;
        StatusLabel: TLabel;
        Label16: TLabel;
        SPZBox: TSpComboBox;
        FC_SPZ: TFieldControl;
        DetailsQueryID_CATEGORY: TIntegerField;
        DetailsQueryID_SPZ: TIntegerField;
        Label17: TLabel;
        DisplayOrderEdit: TCheckEdit;
        FC_Display_Order: TFieldControl;
        DetailsQueryDISPLAY_ORDER: TIntegerField;
        PeopleQueryTN: TIntegerField;
        PeopleQueryFIO: TIBStringField;
        DetailsQueryBASED_ON: TIntegerField;
        FC_Based_On: TFieldControl;
        DetailsQueryREAL_NUM_DIGIT: TIntegerField;
        PeopleQueryCOMAND: TIBStringField;
        CheckQuery: TIBQuery;
        DataSource1: TDataSource;
        DetailsQueryBONUS1: TIBBCDField;
        DetailsQueryBONUS2: TIBBCDField;
        Label10: TLabel;
        Num_In_Smena: TCheckEdit;
        FC_NumInSmena: TFieldControl;
        DetailsQueryNUM_IN_SMENA: TIntegerField;
    Panel2: TPanel;
    Label18: TLabel;
    WorkersStyle: TComboBox;
    DetailsQueryCONTRACT: TIntegerField;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure TarRadioClick(Sender: TObject);
        procedure OkladRadioClick(Sender: TObject);
        procedure TarBoxEnter(Sender: TObject);
        procedure PostBoxChange(Sender: TObject);
        function CheckData: Boolean;
        procedure AddButtonClick(Sender: TObject);
        procedure BonusQueryCalcFields(DataSet: TDataSet);
        procedure ModifyButtonClick(Sender: TObject);
        procedure DeleteButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure TarBoxChange(Sender: TObject);
        procedure RecalcButtonClick(Sender: TObject);
        procedure StavkaEditKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PeopleGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure KolStavokEditChange(Sender: TObject);
        procedure PeopleGridDrawColumnCell(Sender: TObject; const Rect: TRect;
            DataCol: Integer; Column: TColumn; State: TGridDrawState);
        procedure PeopleQueryAfterScroll(DataSet: TDataSet);
    private
        allStavok: Double;
        Mode: TEditMode;
        FormControl: TEditControl;
        Id_Order, Num_Item: Integer;
        DateBeg, DateEnd, CurDate: TDate;
        procedure BonusRefresh;
        procedure Write;
        procedure CalcVacancies;
    public
        Id_ShtatRas: Integer;
        Id_Tar_Plan: Variant;

        constructor Create(AOwner: TComponent; Mode: TEditMode;
            Id_SR, Id_Department, Id_ShtatRas: Integer;
            Id_Order, Num_Item: Integer;
            DateBeg, DateEnd, CurDate: TDate; Id_Tar_Plan: Variant); reintroduce;
    end;

var
    AddShtatPostForm: TAddShtatPostForm;

implementation

{$R *.DFM}

uses uBuffer2;

constructor TAddShtatPostForm.Create(AOwner: TComponent;
    Mode: TEditMode; Id_SR, Id_Department, Id_ShtatRas: Integer;
    Id_Order, Num_Item: Integer;
    DateBeg, DateEnd, CurDate: TDate; Id_Tar_Plan: Variant);
var
    i: Integer;
begin
    inherited Create(AOwner);

    Self.CurDate := CurDate;
    Self.Id_Tar_Plan := Id_Tar_Plan;

    Self.Mode := Mode;
    case Mode of
        emView: Caption := 'Посада штатного розкладу: перегляд';
        emNew: Caption := 'Додати посаду до штатного розкладу';
        emModify: Caption := 'Змінити посаду штатного розкладу';
    end;

    DigitsQuery.Transaction := ReadTransaction;
    TarNetsQuery.Transaction := ReadTransaction;

    if not VarIsNull(Id_Tar_Plan) then
        TarBox.SpParams.SelectProcName := 'Sp_Tar_Net_Select_2(' +
            IntToStr(Id_Tar_Plan) + ')'
    else TarBox.SpParams.SelectProcName := 'Sp_Tar_Net_Select_2(0)';

    TarBox.BoxType := Id_Tar_Plan;
    TarBox.LoadFromRegistry;
    DigitsQuery.ParamByName('Id_Tar_Plan').AsInteger := Id_Tar_Plan;

    DigitsQuery.Open;
    TarNetsQuery.Open;

    DetailsQuery.Transaction := PersonalCommon.ReadTransaction;
    DetailsQuery.Params.ParamValues['Id_SR'] := Id_SR;
    DetailsQuery.Params.ParamValues['Id_Department'] := Id_Department;
    DetailsQuery.Params.ParamValues['Id_ShtatRas'] := Id_ShtatRas;

    if Mode <> emNew then
    begin
        DetailsQuery.Open;
        if DetailsQuery.IsEmpty then
            MessageDlg('Не вдалося знайти запис. Можливо, його вилучив інший користувач!',
                mtError, [mbOk], 0);
    end;

    PostQuery.Transaction := PersonalCommon.ReadTransaction;
    BonusQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := PersonalCommon.WriteTransaction;
    BufferQuery.Transaction := BufferTransaction;
    PeopleQuery.Transaction := ReadTransaction;

    FormControl := TEditControl.Create;
    FormControl.Add([FC_Post, FC_DateBeg, FC_DateEnd, FC_Oklad,
        FC_TarNet, FC_Digit, FC_KolStavok, FC_Pay_Form, FC_Work_Cond,
            FC_Work_Mode, FC_Comment, FC_Dont_Show_In_Plan, FC_Dont_Show_In_Fact,
            FC_Premia, FC_Harmful_Holiday, FC_Special_Holiday, FC_Spz,
            FC_NumInSmena, FC_Display_Order, FC_Based_On]);
    FormControl.Prepare(Mode);

    if ( Mode = emView ) and ( DetailsQuery['Contract'] = 1 ) then
        OkladEdit.Text := 'контракт';

    TarBoxChange(Self);

        // побороть мистический глюк
    if Mode = emModify then FC_TarNet.Value := DetailsQuery['Id_Tar_Net'];

    if (Mode = emNew) or (FC_Oklad.Value > 0) then
    begin
        OkladRadio.Checked := True;
        OkladRadioClick(Self);
    end
    else
    begin
        TarRadio.Checked := True;
        TarRadioClick(Self);
    end;

    if Mode = emNew then
    begin
        DateBegPicker.Date := DateBeg;
        DateBegPicker.ShowCheckBox := False;
        DateEndPicker.Date := DateEnd;
        DateEndPicker.ShowCheckBox := False;
    end;

    Self.Id_Order := Id_Order;
    Self.Num_Item := Num_Item;
    Self.DateBeg := DateBeg;
    Self.DateEnd := DateEnd;
    Self.Id_ShtatRas := Id_ShtatRas;
    BonusQuery.Params.ParamValues['Id_ShtatRas'] := Id_ShtatRas;
    BonusQuery.Open;

         // получить всех людей, которые работают на позиции
    PeopleQuery.Params.ParamValues['CurDate'] := CurDate;
    PeopleQuery.Params.ParamValues['Id_ShtatRas'] := Id_ShtatRas;
    PeopleQuery.Open;
    CalcVacancies;
    GridResize(PeopleGrid);

            // считать свойства
    PropQuery.Transaction := ReadTransaction;
    PropQuery.Params.ParamValues['Id_ShtatRas'] := Id_ShtatRas;
    PropQuery.Params.ParamValues['Cur_Date'] := CurDate;
    with PropQuery do
    begin
        Open;
        First;
        i := 0;
        while not Eof do
        begin
            PropBox.Items.Add(PropQuery['Name_Shtat_Prop']);
            PropBox.Checked[i] := (PropQuery['Present'] = 1);
            inc(i);
            Next;
        end;
    end;

    if Mode = emView then
    begin
        MainPage.Enabled := False;
        AdditionalPage.Enabled := False;
    end;

    if Mode = emNew then
        FC_Based_On.Value := -1;

    if Mode = emView then PropBox.Enabled := False;
end;

procedure TAddShtatPostForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
    FormControl.Free;
    PostBox.SaveIntoRegistry;
    TarBox.SaveIntoRegistry;
    SPZBox.SaveIntoRegistry;
    WorkModeBox.SaveIntoRegistry;
    WorkCondBox.SaveIntoRegistry;
    PayFormBox.SaveIntoRegistry;
end;

procedure TAddShtatPostForm.TarRadioClick(Sender: TObject);
begin
    Flip([FC_Oklad], [FC_Digit, FC_TarNet], False);
    StavkaEdit.Enabled := True;
    RecalcButton.Visible := True;
end;

procedure TAddShtatPostForm.OkladRadioClick(Sender: TObject);
begin
    Flip([FC_Oklad], [FC_Digit, FC_TarNet], True);
    StavkaEdit.Enabled := False;
    RecalcButton.Visible := False;
end;

procedure TAddShtatPostForm.TarBoxEnter(Sender: TObject);
begin
    if Sender is TWinControl then
        if (Sender as TWinControl).TabStop = False then
            OkladEdit.SetFocus;
    Curr_Tar_Plan := Id_Tar_Plan;
end;

function TAddShtatPostForm.CheckData: Boolean;
var
    s: string;
    Id_Tar_Net, Digit: Integer;
begin
    if not FormControl.CheckFill then
    begin
        Result := False;
        Exit;
    end;
    if (PostQuery['Okl_Fork'] = 'T') and OkladRadio.Checked then
        if (FC_Oklad.Value < PostQuery['Okl_Min'])
            or (FC_Oklad.Value > PostQuery['Okl_Max']) then
        begin
            MessageDlg('Згідно з встановленої вилкою окладу ' +
                'для цієї посади, значення окладу повинно бути між ' +
                IntToStr(PostQuery['Okl_Min']) + ' та ' +
                IntToStr(PostQuery['Okl_Max']), mtError, [mbOk], 0);
            Result := False;
            Exit;
        end;

    if DaysBetween(DateBegPicker.Date, DateEndPicker.Date) < 365 then
    begin
        if VarIsNull(FC_Comment.Value) then
            s := ''
        else
            s := FC_Comment.Value;

        if (Pos('з ', s) = 0) and (Pos(' по ', s) = 0) then
            FC_Comment.Value := 'з ' + DateToStr(DateBegPicker.Date) + ' по ' +
                DateToStr(DateEndPicker.Date) + ' ' + s;
    end;

    Id_Tar_Net := TarBox.GetId;
    DigitEdit.Text := Trim(DigitEdit.Text);
    if TarRadio.Checked and ((Id_Tar_Net = -1) or (DigitEdit.Text = '')) then
    begin
        MessageDlg('Не введена тарифна сітка або розряд!', mtError, [mbOk], 0);
        Result := False;
        Exit;
    end;

    try
        Digit := StrToInt(DigitEdit.Text);
    except
        Digit := 1;
    end;

    if TarRadio.Checked and (not TarNetsQuery.Locate('Id_Tar_Net', Id_Tar_Net, []) or
        not DigitsQuery.Locate('Id_Tar_Net;Num_Digit', VarArrayOf([Id_Tar_Net, Digit]), [])) then
    begin
        MessageDlg('Цей розряд тарифної сітки не було введено!', mtError, [mbOk], 0);
        Result := False;
        Exit;
    end;

    if FC_KolStavok.Value < allStavok then
    begin
        MessageDlg('Кількість ставок менше, ніж кількість фактично працюючих!', mtError, [mbOk], 0);
        Result := False;
        Exit;
    end;

    Result := True;
end;

procedure TAddShtatPostForm.PostBoxChange(Sender: TObject);
begin
    if (PostQuery.Transaction <> nil) and (PostBox.ItemIndex > 0) then
    begin
        PostQuery.Close;
        PostQuery.Params.ParamValues['Id_Post'] := PostBox.GetId;
        PostQuery.Open;
        WorkCondBox.Prepare(PostQuery['Id_Work_Cond']);
    end;
end;

procedure TAddShtatPostForm.ModifyButtonClick(Sender: TObject);
var
    form: TAddPostBonusForm;
begin
    form := TAddPostBonusForm.Create(Self, emModify, abmShtatBonus);
    form.Id_ShtatRas := Id_ShtatRas;
    form.Id_Post_Bonus := BonusQuery['Id_Post_Bonus'];
    if form.ShowModal = mrOk then
        BonusRefresh;
    form.Free;
end;

procedure TAddShtatPostForm.AddButtonClick(Sender: TObject);
var
    form: TAddPostBonusForm;
begin
    form := TAddPostBonusForm.Create(Self, emNew, abmShtatBonus);
    form.Id_ShtatRas := Id_ShtatRas;
    if form.ShowModal = mrOk then
        BonusRefresh;
    form.Free;
end;

procedure TAddShtatPostForm.OkButtonClick(Sender: TObject);
begin
    if Mode = emView then Exit;
    
    FormControl.Read;

    if CheckData then
    begin
        if (FC_DateBeg.Value < DateBeg) or (FC_DateBeg.Value > DateEnd)
            or (FC_DateEnd.Value > DateEnd)
            or (FC_DateBeg.Value >= FC_DateEnd.Value) then
        begin
            MessageDlg('Невірний період посади', mtError, [mbOk], 0);
            ModalResult := 0;
            Exit;
        end;

        if VarIsNull(FC_Digit.Value) then FC_Digit.Value := -1;
        if VarIsNull(FC_Oklad.Value) then FC_Oklad.Value := 0;
        if VarIsNull(FC_TarNet.Value) then FC_TarNet.Value := 0;

        Write;
    end
    else
        ModalResult := 0;
end;

procedure TAddShtatPostForm.Write;
var
    ok: Boolean;
    Id_S: Variant;
    ID_PBKey: Integer;
    NagScreen: TNagScreen;
    i: Integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
    WritePepDataChanges: Boolean;
begin
    NagScreen := nil;
    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Заноситься позиція штатного розкладу...');

    if Mode = emNew then
        Id_S := Null
    else
        Id_S := Id_ShtatRas;

    BufTran2 := nil;
         // начать транзакцию буфера
    if WriteTransaction.InTransaction then WriteTransaction.Rollback;
    WriteTransaction.StartTransaction;
    try
          // записать данные по позиции ШР
        ok := FormControl.ExecProc('dt_ShtatRas_Insert',
            [Id_Order, Num_Item, DetailsQuery.Params.ParamValues['Id_SR'],
            DetailsQuery.Params.ParamValues['Id_Department'], Id_S], True);

        if not ok then raise Exception.Create('');

                // записать свойства позиции ШР
        NagScreen.SetStatusText('Заносяться властивості позиції штатного розкладу...');
        ChangePropQuery.Transaction := WriteTransaction;
        i := 0;
        PropQuery.First;
        while not PropQuery.Eof do
        begin
            if PropBox.Checked[i] <> (PropQuery['Present'] = 1) then
            begin
                with ChangePropQuery.Params do
                begin
                    ParamValues['Id_ShtatRas'] := Id_ShtatRas;
                    ParamValues['Id_Shtat_Prop'] := PropQuery['Id_Shtat_Prop'];
                    ParamValues['Flag'] := 1 - PropQuery['Present'];
                    ParamValues['The_Date'] := CurDate;
                end;
                ExecQuery(ChangePropQuery);
            end;
            PropQuery.Next;
            inc(i);
        end;

        NagScreen.SetStatusText('Заносяться надбавки позиції штатного розкладу...');
                 // записать надбавки этой позиции ШР
        if Mode = emNew then
        begin
            Id_ShtatRas := EditControl.LastId;

            WorkQuery.SQL.Text := 'EXECUTE PROCEDURE ' +
                'ShtatRas_Add_Default_Bonuses ' + IntToStr(Id_ShtatRas);
            ExecQuery(WorkQuery);

            BonusQuery.Params.ParamValues['Id_ShtatRas'] :=
                Id_ShtatRas;
            BonusRefresh;
        end;

            // пишем в ДБФ, если изменения затрагивают Pep_Data
        if Mode = emModify then
        begin
            WritePepDataChanges := (FC_Oklad.Value <> DetailsQuery['Oklad'])
                or (FC_Digit.Value <> DetailsQuery['Num_Digit'])
                or (FC_Post.Value <> DetailsQuery['Id_Post'])
                or (FC_TarNet.Value <> DetailsQuery['Id_Tar_Net']);
            WritePepDataChanges := WritePepDataChanges and ok and not DontWriteToDbf;
            if WritePepDataChanges then
            begin
                Sleep(500);
                CheckQuery.Transaction := WriteTransaction;
                CheckQuery.ParamByName('Id_ShtatRas').AsInteger := Id_ShtatRas;
                CheckQuery.Open;

                BufferQuery.Transaction := WriteTransaction;
                BufferQuery.Close;
                BufferQuery.ParamByName('Id_ShtatRas').AsInteger := Id_ShtatRas;
                BufferQuery.Open;

                First_PBKey := BufferQuery['First_PBKey'];
                Last_PBKey := BufferQuery['Last_PBKey'];

                BufTran2 := TBufferTransaction2.
                    Create('PEP_DATA', 'BUFF_PEP_DATA', WriteTransaction);
                BufTran2.WriteRange(First_PBKey, Last_PBKey);
            end;
        end;
        WriteTransaction.Commit;


    except on e: Exception do
        begin
            WriteTransaction.Rollback;
            if BufTran2 <> nil then BufTran2.RollbackOnError;
            NagScreen.Free;
            ShowError(e);
            ModalResult := 0;
        end;
    end;
    if BufTran2 <> nil then BufTran2.Free;
    NagScreen.Free;
end;

procedure TAddShtatPostForm.BonusQueryCalcFields(DataSet: TDataSet);
begin
    if BonusQuery['Is_Percent'] = 'T' then
        BonusQuery['Bonus'] := IntToStr(BonusQuery['Percent']) + '%'
    else
        BonusQuery['Bonus'] := FloatToStr(BonusQuery['Summa']) + ' грн';
end;


procedure TAddShtatPostForm.DeleteButtonClick(Sender: TObject);
begin
    if Mode = emView then Exit;
    if MessageDlg('Чи справді ви бажаєте вилучити цей запис?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
        with WorkQuery.SQL do
        begin
            Clear;
            Add('EXECUTE PROCEDURE Dt_Shtat_Bonus_Delete ');
            Add(IntToStr(Id_ShtatRas) + ',');
            Add(IntToStr(BonusQuery['Id_Post_Bonus']));
        end;
        ExecQuery(WorkQuery);
        BonusRefresh;
    end;
end;

procedure TAddShtatPostForm.BonusRefresh;
begin
    BonusQuery.Close;
    BonusQuery.Open;
    GridResize(BonusGrid);
end;

procedure TAddShtatPostForm.FormActivate(Sender: TObject);
begin
    PageControl.ActivePage := MainPage;
    if Mode <> emModify then
    begin
        AddButton.Visible := False;
        ModifyButton.Visible := False;
        DeleteButton.Visible := False;
    end;
end;

procedure TAddShtatPostForm.TarBoxChange(Sender: TObject);
var
    Digit, Id_Tar_Net: Integer;
    Stavka: Double;
begin
    if DigitsQuery.IsEmpty or TarNetsQuery.IsEmpty then Exit;

    Id_Tar_Net := TarBox.GetId;
    DigitEdit.Text := Trim(DigitEdit.Text);
    if (Id_Tar_Net = -1) or (DigitEdit.Text = '') then Exit;

    StavkaEdit.Text := '';

    try
        Digit := StrToInt(DigitEdit.Text);
    except
        Digit := 1;
    end;

    if not TarNetsQuery.Locate('Id_Tar_Net', Id_Tar_Net, []) then Exit;

    if not DigitsQuery.Locate('Id_Tar_Net;Num_Digit', VarArrayOf([Id_Tar_Net, Digit]), []) then Exit;

    Stavka := SimpleRoundTo(TarNetsQuery['First_Digit'] * DigitsQuery['Koeficient']);
    StavkaEdit.Text := FloatToStr(Stavka);
end;

procedure TAddShtatPostForm.RecalcButtonClick(Sender: TObject);
var
    Stavka, nStavka: Double;
    s: string;
    digit, net: Integer;
begin
    if DigitsQuery.IsEmpty or TarNetsQuery.IsEmpty then Exit;

    s := StringReplace(StavkaEdit.Text, ',', DecimalSeparator, []);
    s := StringReplace(s, '.', DecimalSeparator, []);
    try
        Stavka := StrToFloat(s);
    except
        Exit;
    end;

    DigitsQuery.First;
    while not DigitsQuery.Eof do
    begin
        TarNetsQuery.Locate('Id_Tar_Net', DigitsQuery['Id_Tar_Net'], []);
        nStavka := SimpleRoundTo(TarNetsQuery['First_Digit'] * DigitsQuery['Koeficient']);
        if abs(Stavka - nStavka) < 0.001 then
        begin
            net := DigitsQuery['Id_Tar_Net'];
            digit := DigitsQuery['Num_Digit'];
            TarBox.Prepare(net);
            DigitEdit.Text := IntToStr(digit);
            Exit;
        end;
        DigitsQuery.Next;
    end;
    DigitEdit.Text := '';
end;

procedure TAddShtatPostForm.StavkaEditKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        RecalcButton.Click;
        Key := 0;
    end;
end;

procedure TAddShtatPostForm.PeopleGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Man_Moving: ' + IntToStr(PeopleQuery['Id_Man_Moving']));
    except
    end;
end;

procedure TAddShtatPostForm.CalcVacancies;
var
    s: string;
    st: Double;
begin
    if not PeopleQuery.Active or PeopleQuery.IsEmpty then Exit;

    allStavok := 0;
    PeopleQuery.DisableControls;
    with PeopleQuery do
    begin
        First;
        while not Eof do
        begin
            if (PeopleQuery['Otpusk'] <> 'T') and (PeopleQuery['Boleet'] <> 'T') and (PeopleQuery['Comand'] <> 'T')
                then allStavok := allStavok + PeopleQuery['Kol_Stavok'];
            Next;
        end;
    end;
    PeopleQuery.EnableControls;
    WorkersLabel.Caption := FloatToStr(allStavok);

    s := StringReplace(KolStavokEdit.Text, ',', DecimalSeparator, []);
    s := StringReplace(s, '.', DecimalSeparator, []);
    try
        st := StrToFloat(s);
    except
        st := 0;
    end;

    VacanciesLabel.Caption := FloatToStr(st - allStavok);
end;

procedure TAddShtatPostForm.KolStavokEditChange(Sender: TObject);
begin
    CalcVacancies;
end;

procedure TAddShtatPostForm.PeopleGridDrawColumnCell(Sender: TObject;
    const Rect: TRect; DataCol: Integer; Column: TColumn;
    State: TGridDrawState);
begin
    with PeopleGrid.Canvas.Brush do
        if gdSelected in State then
            Color := clBlack
        else if PeopleQuery['Boleet'] = 'T' then
            Color := clRed
        else if PeopleQuery['Otpusk'] = 'T' then
            Color := clSkyBlue
        else if PeopleQuery['Comand'] = 'T' then
            Color := clGreen
        else
            Color := clInfoBk;
    PeopleGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TAddShtatPostForm.PeopleQueryAfterScroll(DataSet: TDataSet);
begin
    if PeopleQuery['Boleet'] = 'T' then
        StatusLabel.Caption := 'хворіє'
    else if PeopleQuery['Otpusk'] = 'T' then
        StatusLabel.Caption := 'відпустка'
    else if PeopleQuery['COMAND'] = 'T' then
        StatusLabel.Caption := 'відрядження'
    else
        StatusLabel.Caption := '';
end;

end.
