unit Add_Reestr;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uSpravControl, uFControl, uLabeledFControl, uCharControl,
    StdCtrls, Buttons, qFTools, uMemoControl, ExtCtrls, cxControls,
    cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, AllPeopleUnit, iBase,
    uUnivSprav, RxMemDs, cxDropDownEdit, cxCalendar, cxSpinEdit, dates, pFIBDataSet, DB;

type
    TAdd_Form = class(TForm)
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        PersDoc: TqFSpravControl;
        CommentEdit: TqFMemoControl;
        RadioGroup1: TRadioGroup;
        RadioButtonAll: TRadioButton;
        RadioButtonMan: TRadioButton;
        PeopleEdit: TqFSpravControl;
        Label1: TLabel;
        Label2: TLabel;
        MonList: TcxComboBox;
        MonList1: TcxComboBox;
        YearSpEdit: TcxSpinEdit;
        YearSpEndEdit: TcxSpinEdit;
        Panel1: TPanel;
        LblPeriod: TLabel;
        cxPeriod: TcxComboBox;
        procedure OkButtonClick(Sender: TObject);
        procedure PeopleEditOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure RadioButtonAllClick(Sender: TObject);
        procedure RadioButtonManClick(Sender: TObject);
        procedure PersDocOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure FormCreate(Sender: TObject);
        procedure PersDocChange(Sender: TObject);
        procedure YearSpEditPropertiesChange(Sender: TObject);
        procedure YearSpEndEditPropertiesChange(Sender: TObject);
        procedure cxPeriodPropertiesChange(Sender: TObject);
    private
    { Private declarations }
    public
        hand: TISC_DB_HANDLE;
        kod_setup_beg, kod_setup_end: Integer;
        ks: Integer;
        procedure GetPeriods;
    { Public declarations }
    end;
const
    YearBeg = 1995;
    MonthBeg = 1;

var
    Add_Form: TAdd_Form;
    MonList_Text: array[1..12] of string = ('Січень', 'Лютий', 'Березень', 'Квітень', 'Травень', 'Червень',
        'Липень', 'Серпень', 'Вересень', 'Жовтень', 'Листопад', 'Грудень');
    Kod_Setup1, Kod_Set, Kod_Set_Begin: Integer;


implementation

{$R *.dfm}
uses Reestr_DM, FIBDataSet, BaseTypes, uReestrZajavok;

function IfThen(AValue: Boolean; const ATrue: Variant; const AFalse: Variant): Variant; overload;
begin
    if AValue then
        IfThen := ATrue
    else
        IfThen := AFalse;
end;

procedure TAdd_Form.OkButtonClick(Sender: TObject);
var res: integer;
begin
    res := 1;
    kod_setup_beg := PeriodToKodSetup(YearSpEdit.Value, MonList.ItemIndex + 1);
    kod_setup_end := PeriodToKodSetup(YearSpEndEdit.Value, MonList1.ItemIndex + 1);
    kod_setup_beg  := kod_setup_end;

    if kod_setup_beg > kod_setup_end then
    begin
        agMessageDlg('Увага!', 'Початок періоду перерахунку не може бути більшим кінця періоду перерахунку!', mtError, [mbOK]);
        MonList.SetFocus;
        res := 0;
    end;

    if ((qFCheckAll(Self)) and (res = 1)) then ModalResult := mrOk;
end;

procedure TAdd_Form.PeopleEditOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    Result: Variant;

begin
    try
        result := AllPeopleUnit.GetMan(Self, hand, False, False);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then begin
            Value := result[0];
            DisplayText := result[1];
        end;

    except on e: Exception do begin
            qFErrorDialog('Неможливо завантажити довідник фізичних осіб! Виникла помилка: "' +
                e.Message + '"');

            exit;
        end;
    end;
end;

procedure TAdd_Form.RadioButtonAllClick(Sender: TObject);
begin
    PeopleEdit.Visible := False;
    PeopleEdit.Required := False;
end;

procedure TAdd_Form.RadioButtonManClick(Sender: TObject);
begin
    PeopleEdit.Visible := True;
    PeopleEdit.Required := True;
end;

procedure TAdd_Form.PersDocOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    Params: TUnivParams;
    OutPut: TRxMemoryData;
    str: string;
    i: integer;
begin
    if (cxPeriod.Properties.Items.Count >= 1)
        then begin

        Params.FormCaption := 'Документ персоніфікації';
        Params.ShowMode := fsmSelect;
        Params.ShowButtons := [fbExit];
        Params.TableName := 'PERSON_DOC_SEL_PER(' + IntToStr(Integer(cxPeriod.Properties.Items.Objects[cxPeriod.ItemIndex])) + ')';
        Params.Fields := 'YEAR_MONTH,REGEST_NUM,DATE_DOCUMENT,Comments,PERSON_PERIOD_BEGIN,ID_PERSON_DOCUMENT';
        Params.FieldsName := 'Період,№,Дата створення документу,Коментар';
        Params.KeyField := 'ID_PERSON_DOCUMENT';
        Params.ReturnFields := 'YEAR_MONTH,REGEST_NUM,DATE_DOCUMENT,Comments,PERSON_PERIOD_BEGIN,ID_PERSON_DOCUMENT';
        Params.DBHandle := Integer(Hand);

        Params.AddParametrs := TRxMemoryData.Create(Self);

        Params.AddParametrs.FieldDefs.Add('kod_setup', ftVariant);
        Params.AddParametrs.Open;
        Params.AddParametrs.Append;
        Params.AddParametrs['kod_setup'] := Integer(cxPeriod.Properties.Items.Objects[cxPeriod.ItemIndex]);
        Params.AddParametrs.Post;

        OutPut := TRxMemoryData.Create(self);

        if GetUnivSprav(Params, OutPut)
            then begin
            value := output['ID_PERSON_DOCUMENT'];
            Kod_Set := Integer(cxPeriod.Properties.Items.Objects[cxPeriod.ItemIndex]);
            Kod_Set_Begin := output['PERSON_PERIOD_BEGIN'];
            DisplayText := '№' + VarToStr(output['REGEST_NUM']) + ' від ' + VarToStr(output['DATE_DOCUMENT']);

            if not VarIsNull(output['ID_PERSON_DOCUMENT']) then
            begin
                YearSpEdit.Properties.MinValue := 2009; //YearMonthFromKodSetup(Kod_Set_Begin);
                YearSpEdit.Properties.MaxValue := 2011; ///YearMonthFromKodSetup(Kod_Set)+1;
                YearSpEdit.Value := 2010; //YearMonthFromKodSetup(Kod_Set);

                if (YearMonthFromKodSetup(Kod_Set_Begin) = YearMonthFromKodSetup(Kod_Set))
                    then
                begin
                    YearSpEdit.Value := YearMonthFromKodSetup(Kod_Set);
                    YearSpEdit.Properties.ReadOnly := True;
                    YearSpEndEdit.Value := YearMonthFromKodSetup(Kod_Set);
                    YearSpEndEdit.Properties.ReadOnly := True;
                end
                else
                begin
                    YearSpEdit.Properties.MinValue := YearMonthFromKodSetup(Kod_Set_Begin);
                    YearSpEdit.Properties.MaxValue := YearMonthFromKodSetup(Kod_Set);
                    YearSpEdit.Value := YearMonthFromKodSetup(Kod_Set);
                    YearSpEdit.Properties.ReadOnly := False;

                    YearSpEndEdit.Properties.MinValue := YearMonthFromKodSetup(Kod_Set_Begin);
                    YearSpEndEdit.Properties.MaxValue := YearMonthFromKodSetup(Kod_Set);
                    YearSpEndEdit.Value := YearMonthFromKodSetup(Kod_Set);
                    YearSpEndEdit.Properties.ReadOnly := False;
                end;

                str := '';
                for i := 1 to YearMonthFromKodSetup(Kod_Set, False) do
                    str := str + MonList_Text[i] + #13;
                MonList.Properties.Items.Text := str;
                MonList1.Properties.Items.Text := str;
                if Kod_Set = Kod_Set_Begin
                    then
                    //персонификация считается первый раз
                    MonList.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1
                else
                    //персонификация считается не в первый раз
                    MonList.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1;
                    MonList1.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1;
                    //MonList.ItemIndex := MonList1.ItemIndex;

                MonList.Enabled := True;
                YearSpEdit.Enabled := True;
                MonList1.Enabled := True;
                YearSpEndEdit.Enabled := True;
            end
            else
            begin
                MonList.Enabled := False;
                YearSpEdit.Enabled := False;
                MonList1.Enabled := False;
                YearSpEndEdit.Enabled := False;
            end;
        end;
    end;
end;



procedure TAdd_Form.FormCreate(Sender: TObject);
begin
    MonList.Enabled := False;
    YearSpEdit.Enabled := False;
    MonList1.Enabled := False;
    YearSpEndEdit.Enabled := False;
    PersDoc.Enabled := False;
    PersDoc.Blocked := True;
    GetPeriods;
end;

procedure TAdd_Form.GetPeriods;
var ItemsDs: TpFIBDataSet;
    i: Integer;
    ek: Boolean;
begin
    cxPeriod.Properties.Items.Clear;
    cxPeriod.Clear;
    ek := False;
    try
        ItemsDs := TpFIBDataSet.Create(self);
        ItemsDs.Database := TfrmReestrZajavok(owner).pFIBD_Reestr;
        ItemsDs.Transaction := TfrmReestrZajavok(owner).pFIBT_Read;
        ItemsDs.SelectSQL.Text := 'SELECT * FROM PERSON_DOC_SEL';
        ItemsDs.Open;
        ItemsDs.FetchAll;
        ItemsDs.First;
        for i := 0 to ItemsDs.RecordCount - 1 do
        begin
            ks := ItemsDs.FieldByName('kod_setup').Value;
            cxPeriod.Properties.Items.AddObject(ItemsDs.FieldByName('YEAR_MONTH').AsString, TObject(ks));
            if ks = Kod_Set
                then begin
                cxPeriod.ItemIndex := i;
                ek := true;
            end;

            ItemsDs.Next;
        end;

        if not ek
            then cxPeriod.ItemIndex := 0;
    except
        on e: Exception do
            agShowMessage(e.Message);
    end;

    ItemsDs.Close;
    ItemsDs.Free;
end;


procedure TAdd_Form.PersDocChange(Sender: TObject);
var str: string;
    i: integer;
begin
    if not VarIsNull(PersDoc.Value) then
    begin
        if (YearMonthFromKodSetup(Kod_Set_Begin) = YearMonthFromKodSetup(Kod_Set))
            then
        begin
            YearSpEdit.Value := YearMonthFromKodSetup(Kod_Set);
            YearSpEdit.Properties.ReadOnly := True;
            YearSpEndEdit.Value := YearMonthFromKodSetup(Kod_Set);
            YearSpEndEdit.Properties.ReadOnly := True;
        end
        else
        begin
            YearSpEdit.Properties.MinValue := YearMonthFromKodSetup(Kod_Set_Begin);
            YearSpEdit.Properties.MaxValue := YearMonthFromKodSetup(Kod_Set);
            YearSpEdit.Value := YearMonthFromKodSetup(Kod_Set);
            YearSpEdit.Properties.ReadOnly := False;

            YearSpEndEdit.Properties.MinValue := YearMonthFromKodSetup(Kod_Set_Begin);
            YearSpEndEdit.Properties.MaxValue := YearMonthFromKodSetup(Kod_Set);
            YearSpEndEdit.Value := YearMonthFromKodSetup(Kod_Set);
            YearSpEndEdit.Properties.ReadOnly := False;
        end;

        str := '';
        for i := 1 to YearMonthFromKodSetup(Kod_Set, False) do
            str := str + MonList_Text[i] + #13;
        MonList.Properties.Items.Text := str;
        MonList1.Properties.Items.Text := str;
        if Kod_Set = Kod_Set_Begin
            then
           //персонификация считается первый раз
            MonList.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1
        else
           //персонификация считается не в первый раз
            MonList.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1;
            MonList1.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1;
           // MonList1.ItemIndex := MonList.ItemIndex;

        MonList.Enabled := True;
        YearSpEdit.Enabled := True;
        MonList1.Enabled := True;
        YearSpEndEdit.Enabled := True;
    end
    else
    begin
        MonList.Enabled := False;
        YearSpEdit.Enabled := False;
        MonList1.Enabled := False;
        YearSpEndEdit.Enabled := False;
    end;
end;

procedure TAdd_Form.YearSpEditPropertiesChange(Sender: TObject);
var str: string;
    i: integer;
begin
    str := '';
    if YearSpEdit.Value <> YearMonthFromKodSetup(Kod_Set) then
        for i := 1 to 12 do
            str := str + MonList_Text[i] + #13
    else for i := 1 to YearMonthFromKodSetup(Kod_Set, False) do
            str := str + MonList_Text[i] + #13;
    MonList.Properties.Items.Text := str;
    if Kod_Set = Kod_Set_Begin
        then
   //персонификация считается первый раз
        MonList.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1
    else
   //персонификация считается не в первый раз
        MonList.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 2;
end;

procedure TAdd_Form.YearSpEndEditPropertiesChange(Sender: TObject);
var str: string;
    i: integer;
begin
    str := '';
    if YearSpEndEdit.Value <> YearMonthFromKodSetup(Kod_Set) then
        for i := 1 to 12 do
            str := str + MonList_Text[i] + #13
    else for i := 1 to YearMonthFromKodSetup(Kod_Set, False) do
            str := str + MonList_Text[i] + #13;
    MonList1.Properties.Items.Text := str;
    MonList1.ItemIndex := YearMonthFromKodSetup(Kod_Set, False) - 1;
end;

procedure TAdd_Form.cxPeriodPropertiesChange(Sender: TObject);
begin
    PersDoc.Clear;
    MonList.Enabled := False;
    YearSpEdit.Enabled := False;
    MonList1.Enabled := False;
    YearSpEndEdit.Enabled := False;

    if (cxPeriod.Properties.Items.Count >= 1)
        then
    begin
        PersDoc.Enabled := True;
        PersDoc.Blocked := False;
    end
    else
    begin
        PersDoc.Enabled := False;
        PersDoc.Blocked := True;
    end;
end;

end.

