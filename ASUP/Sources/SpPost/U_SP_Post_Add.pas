{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Модуль добавления/изменения должностей                       }
{                                               ответственный: Тимофеев Антон  }
unit U_SP_Post_Add;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    EditControl, Dialogs, StdCtrls, ExtCtrls, FieldControl, Mask, CheckEditUnit,
    Buttons, U_SPPost_DataModule, SpCommon, ComCtrls, SpComboBox, DB, FIBDataSet,
    pFIBDataSet, Grids, DBGrids, U_SP_Post_AddType, Halcn6db, RxMemDS,
    U_SP_Post_Add_Dates, U_SP_Post_Salary_Sum, U_SP_Post_Holliday_Add,
    U_Sp_Post_Salary, cxControls, cxSplitter, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
    cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxGrid, CheckLst, FIBQuery, pFIBQuery,
    cxCurrencyEdit, Placemnt, U_SP_Post_BS_Add, FIBDatabase, pFIBDatabase,
    uFControl, uLabeledFControl, uSpravControl, ActnList, uDateControl,
    cxPropertiesStore;

const
    STDStatus = 'Занести посаду: F10 або Ctrl+End, відмінити: Esc';

type
    TSP_Post_Add = class(TForm)
        CE_Name: TCheckEdit;
        Label5: TLabel;
        SbOk: TBitBtn;
        SbCancel: TBitBtn;
        PageControl1: TPageControl;
        TabSheet1: TTabSheet;
        FC_Code: TFieldControl;
        Label4: TLabel;
        Label1: TLabel;
        Label3: TLabel;
        CE_Code: TCheckEdit;
        CB_Spec: TCheckBox;
        FC_Name: TFieldControl;
        TabSheet2: TTabSheet;
        TypeGrid: TDBGrid;
        DataSource1: TDataSource;
        Panel1: TPanel;
        Panel2: TPanel;
        TabSheet3: TTabSheet;
        Panel3: TPanel;
        CategoryGrid: TDBGrid;
        Panel4: TPanel;
        DataSource2: TDataSource;
        RxMD_Cat: TRxMemoryData;
        RxMD_Type: TRxMemoryData;
        DeleteCategoryButton: TSpeedButton;
        ModifyCategoryButton: TSpeedButton;
        AddCategoryButton: TSpeedButton;
        DeleteTypePostButton: TSpeedButton;
        AddTypePostButton: TSpeedButton;
        Panel6: TPanel;
        HolidayGrid: TDBGrid;
        HolidaysSource: TDataSource;
        HolidaySelect: TpFIBDataSet;
        Panel8: TPanel;
        BaseSalarySource: TDataSource;
        fibBaseSalaries: TpFIBDataSet;
        PropertiesPanel: TPanel;
        Label10: TLabel;
        Panel11: TPanel;
        PropGrid: TDBGrid;
        DataSource5: TDataSource;
        SBAdd: TSpeedButton;
        SBModif: TSpeedButton;
        SBDelete: TSpeedButton;
        SB_Add_Prop: TSpeedButton;
        SB_Del_Prop: TSpeedButton;
        PostSalaryButton: TSpeedButton;
        SB_Add_Hol: TSpeedButton;
        SB_Modif_Hol: TSpeedButton;
        SB_Del_Hol: TSpeedButton;
        RxMD_IPP: TRxMemoryData;
        pFIBDS_IPP: TpFIBDataSet;
        RxBaseSalaries: TRxMemoryData;
        CheckBox1: TCheckBox;
        Panel5: TPanel;
        RxMD_Raises: TRxMemoryData;
        Panel7: TPanel;
        Panel9: TPanel;
        RxMD_Hollidays: TRxMemoryData;
        pFIBDS_Raises: TpFIBDataSet;
        pFIBDS_Cat: TpFIBDataSet;
        RxMD_All_IPP: TRxMemoryData;
        BaseSalaryPanel: TPanel;
        cxSplitter1: TcxSplitter;
        BaseSalaryView: TcxGridDBTableView;
        BaseSalaryGridLevel1: TcxGridLevel;
        BaseSalaryGrid: TcxGrid;
        BaseSalaryNameColumn: TcxGridDBColumn;
        BaseSalaryViewDBColumn2: TcxGridDBColumn;
        BaseSalaryViewDBColumn3: TcxGridDBColumn;
        BaseSalaryViewDBColumn4: TcxGridDBColumn;
        BaseSalaryViewDBColumn5: TcxGridDBColumn;
        BaseSalaryViewDBColumn6: TcxGridDBColumn;
        cxStyleRepository1: TcxStyleRepository;
        TabSheet4: TTabSheet;
        DataSource6: TDataSource;
        pFIBDS_Prop: TpFIBDataSet;
        PropListBox: TCheckListBox;
        AddButton: TSpeedButton;
        Panel13: TPanel;
        pFIBDS_AllProp: TpFIBDataSet;
        WritePropQuery: TpFIBQuery;
        cxStyle1: TcxStyle;
        cxStyle2: TcxStyle;
        cxStyle3: TcxStyle;
        cxStyle4: TcxStyle;
        cxStyle5: TcxStyle;
        cxStyle6: TcxStyle;
        cxStyle7: TcxStyle;
        cxStyle8: TcxStyle;
        cxStyle9: TcxStyle;
        cxStyle10: TcxStyle;
        cxStyle11: TcxStyle;
        cxStyle12: TcxStyle;
        cxStyle13: TcxStyle;
        cxStyle14: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        DigitsData: TRxMemoryData;
        DigitsDataId_Jn_Post_Digits: TIntegerField;
        DigitsDataId_Post_Base_Salary: TIntegerField;
        DigitsDataNum_Digit: TIntegerField;
        DigitsDataDate_Beg: TDateField;
        DigitsDataDate_End: TDateField;
        RxMD_Raisesid_post_base_salary: TIntegerField;
        RxMD_Raisesname_post_salary: TVariantField;
        RxMD_Raisespps_koef: TStringField;
        RxMD_Raisesid_raise: TIntegerField;
        RxMD_Raisesid_post_salary: TIntegerField;
        RxMD_Raisesdate_beg: TDateField;
        RxMD_Raisesdate_end: TDateField;
        RxMD_Raisespercent: TFloatField;
        RxMD_Raisesname: TStringField;
        fibPostDigits: TpFIBDataSet;
        fibDigitsInsert: TpFIBDataSet;
        CE_Additional: TCheckEdit;
        Label2: TLabel;
        fibDigitsDelete: TpFIBQuery;
        BaseSalaryViewDBColumn1: TcxGridDBColumn;
        OldOkladColumn: TcxGridDBColumn;
        ShowOldBox: TCheckBox;
        Panel14: TPanel;
        Group: TqFSpravControl;
        ActionList1: TActionList;
        AcceptAction: TAction;
        InsertAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        StatusPanel: TPanel;
        CancelAction: TAction;
        PostSalaryAction: TAction;
        BaseDate: TqFDateControl;
        cxPropertiesStore1: TcxPropertiesStore;
        fibPostTarif: TpFIBDataSet;
        TarifData: TRxMemoryData;
        IntegerField2: TIntegerField;
        DateField1: TDateField;
        DateField2: TDateField;
        TarifDataID_CAT_TARIF_GRID: TIntegerField;
        TarifDataStavka: TCurrencyField;
        fibTarifsInsert: TpFIBDataSet;
        fibTarifDelete: TpFIBQuery;
        TarifDataNUM: TIntegerField;
        TarifDataId_Jn_Post_Tarif: TIntegerField;
        BaseSalaryViewDBColumn7: TcxGridDBColumn;
        TarifDataName_Tarif: TStringField;
        TarifDataId_Category_tarif: TIntegerField;
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure SBCancelClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure AddTypePostButtonClick(Sender: TObject);
        procedure DeleteTypePostButtonClick(Sender: TObject);
        procedure AddCategoryButtonClick(Sender: TObject);
        procedure DeleteCategoryButtonClick(Sender: TObject);
        procedure ModifyCategoryButtonClick(Sender: TObject);
        procedure CE_NameChange(Sender: TObject);
        procedure SpCB_HolidayChange(Sender: TObject);
        procedure RB_CorClick(Sender: TObject);
        procedure PostSalaryButtonClick(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure SB_Add_PropClick(Sender: TObject);
        procedure SB_Del_PropClick(Sender: TObject);
        procedure SBAddClick(Sender: TObject);
        procedure SBDeleteClick(Sender: TObject);
        procedure SBModifClick(Sender: TObject);
        procedure DBGrid4TitleClick(Column: TColumn);
        procedure CategoryGridTitleClick(Column: TColumn);
        procedure HolidaySelectAfterOpen(DataSet: TDataSet);
        procedure HolidayGridTitleClick(Column: TColumn);
        procedure fibBaseSalariesAfterOpen(DataSet: TDataSet);
        procedure RxBaseSalariesAfterScroll(DataSet: TDataSet);
        procedure pFIBDS_IPPAfterOpen(DataSet: TDataSet);
        procedure RxBaseSalariesAfterOpen(DataSet: TDataSet);
        procedure pFIBDS_RaisesAfterOpen(DataSet: TDataSet);
        procedure SB_Add_HolClick(Sender: TObject);
        procedure SB_Del_HolClick(Sender: TObject);
        procedure SB_Modif_HolClick(Sender: TObject);
        procedure pFIBDS_CatAfterOpen(DataSet: TDataSet);
        procedure PropertiesPanelResize(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure BaseSalaryViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure PropGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure CategoryGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure TypeGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ShowOldBoxClick(Sender: TObject);
        procedure GroupOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure AcceptActionExecute(Sender: TObject);
        procedure InsertActionExecute(Sender: TObject);
        procedure ModifyActionExecute(Sender: TObject);
        procedure DeleteActionExecute(Sender: TObject);
        procedure CategoryGridEnter(Sender: TObject);
        procedure TypeGridEnter(Sender: TObject);
        procedure CategoryGridExit(Sender: TObject);
        procedure TypeGridExit(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure BaseSalaryGridExit(Sender: TObject);
        procedure BaseSalaryGridEnter(Sender: TObject);
        procedure PostSalaryActionExecute(Sender: TObject);
        procedure PropGridExit(Sender: TObject);
        procedure PropGridEnter(Sender: TObject);
        procedure HolidayGridExit(Sender: TObject);
        procedure HolidayGridEnter(Sender: TObject);
        procedure PropListBoxExit(Sender: TObject);
        procedure PropListBoxEnter(Sender: TObject);
        procedure CE_NameExit(Sender: TObject);
        procedure CE_CodeEnter(Sender: TObject);
        procedure BaseDateChange(Sender: TObject);
    private
    { Private declarations }
        IsNameCh, IsHolidayCh, IsOklCh, IsRaiseAdd: Boolean;
        procedure RebuildPropList;
        procedure PreparePropList;
        procedure WriteProperties;
        procedure SincIdBS(old_id: integer; new_id: integer);
        function IsDatesCorrect: string;

        procedure Form_GetBaseSalary(AForm: TSP_PBS_Add; Id_Base_Salary: Integer);
        procedure AddBaseSalariesToIB;
        procedure RefreshDigitSTR;

        procedure AddDefaultPostSalary(Id_Post_Base_Salary: Integer);
        procedure AddDefaultCategory;
    public
        FormControl: TEditControl;
        Add: Boolean;
        id, id_bs, id_pbs, id_s: integer;
        DMod: TDMSPPost;
        Beg_Date: TDate;

        procedure Prepare;
    end;

var
    SP_Post_Add: TSP_Post_Add;

implementation

{$R *.dfm}

uses U_SP_Cat, U_SP_TypePost, U_SPPost, SpFormUnit, qFTools,
    Math, DateUtils, uSelectForm, uSpPostGroup, Registry, UpKernelUnit;

procedure TSP_Post_Add.RebuildPropList;
begin
    PropListBox.Clear;
    with pFIBDS_AllProp do
    begin
        Close;
        Open;
        First;
        while not Eof do
        begin
            PropListBox.Items.Add(FieldValues['Name_Post_Prop']);
            Next;
        end;
    end;
    if not Add then
        with pFIBDS_Prop do
        begin
            Close;
            Open;
            PreparePropList;
        end;
end;

procedure TSP_Post_Add.PreparePropList;
var
    i: Integer;
begin
    pFIBDS_Prop.Close;
    pFIBDS_Prop.ParamByName('Id_Post').AsInteger := Id;
    pFIBDS_Prop.Open;
    if Add then Exit;
    with PropListBox do
        for i := 0 to Items.Count - 1 do
            if pFIBDS_Prop.Locate('Name_Post_Prop', Items[i], []) then
                PropListBox.Checked[i] := True;
end;

procedure TSP_Post_Add.WriteProperties;
var
    i, Ch: Integer;
begin
    WritePropQuery.ParamByName('Id_Post').AsInteger := Id;

    with PropListBox do
        for i := 0 to PropListBox.Items.Count - 1 do
        begin
            if Checked[i] then
                Ch := 1
            else
                Ch := 0;

            pFIBDS_AllProp.Locate('Name_Post_Prop', Items[i], []);

            with WritePropQuery do
            begin
                ParamByName('Id_Post_Prop').AsInteger := pFIBDS_AllProp['Id_Post_Prop'];
                ParamByName('Flag').AsInteger := Ch;
            end;
            WritePropQuery.ExecProc;
        end;
end;

function TSP_Post_Add.IsDatesCorrect: string;
var idcat, idhol, idbs, i, j: integer;
    date_beg, date_end: TDate;
    bookmark: TBookmark;
begin
    Result := '';

    RxMD_Cat.Open;
    RxMD_Cat.First;
    while not RxMD_Cat.Eof do
    begin
        Date_beg := RxMD_Cat['date_beg'];
        Date_end := RxMD_Cat['date_end'];
        idcat := RxMD_Cat['id_category'];
        RxMD_Cat.Next;
        while not RxMD_Cat.Eof do
        begin
            if (Date_beg >= RxMD_Cat['date_beg']) and (Date_beg <= RxMD_Cat['date_end']) then
                Result := 'періоди категорій';
            if (Date_end >= RxMD_Cat['date_beg']) and (Date_end <= RxMD_Cat['date_end']) then
                Result := 'періоди категорій';
            RxMD_Cat.Next;
        end;
        RxMD_Cat.First;
        RxMD_Cat.Locate('id_category', idcat, []);
        RxMD_Cat.Next;
    end;

    RxMD_Hollidays.Open;
    RxMD_Hollidays.First;
    while not RxMD_Hollidays.Eof do
    begin
        Date_beg := RxMD_Hollidays['date_beg'];
        Date_end := RxMD_Hollidays['date_end'];
        idhol := RxMD_Hollidays['id_post_holiday'];
        bookmark := RxMD_Hollidays.GetBookmark;
        RxMD_Hollidays.Next;
        while not RxMD_Hollidays.Eof do
        begin
            if RXMD_Hollidays['id_post_holiday'] = idhol then
            begin
                if (Date_beg >= RxMD_Hollidays['date_beg']) and (Date_beg <= RxMD_Hollidays['date_end']) then
                    Result := 'періоди відпусток';
                if (Date_end >= RxMD_Hollidays['date_beg']) and (Date_end <= RxMD_Hollidays['date_end']) then
                    Result := 'періоди відпусток';
            end;
            RxMD_Hollidays.Next;
        end;
        RxMD_Hollidays.GotoBookmark(bookmark);
        //RxMD_Hollidays.First;
        //RxMD_Hollidays.Locate('id_post_holiday', idhol, []);
        RxMD_Hollidays.Next;
    end;


    if (CheckBox1.Checked) and (not Add) then
    begin
        RxBaseSalaries.Open;
        RxBaseSalaries.SortOnFields('id_post_base_salary');
        RxBaseSalaries.First;
        while not RxBaseSalaries.Eof do
        begin
            idbs := RxBaseSalaries['id_post_base_salary']; i := 0;
            while (not RxBaseSalaries.Eof) and (idbs = RxBaseSalaries['id_post_base_salary']) do
            begin
                Date_beg := RxBaseSalaries['date_beg'];
                Date_end := RxBaseSalaries['date_end'];
                RxBaseSalaries.Next; i := i + 1;
                while (not RxBaseSalaries.Eof) and (idbs = RxBaseSalaries['id_post_base_salary']) do
                begin
                    if (Date_beg >= RxBaseSalaries['date_beg']) and (Date_beg <= RxBaseSalaries['date_end']) then
                        Result := 'періоди базових окладів';
                    if (Date_end >= RxBaseSalaries['date_beg']) and (Date_end <= RxBaseSalaries['date_end']) then
                        Result := 'періоди базових окладів';
                    RxBaseSalaries.Next; i := i + 1;
                end;
                RxBaseSalaries.First;
                RxBaseSalaries.Locate('id_post_base_salary', idbs, []);
                for j := 1 to i do
                    RxBaseSalaries.Next;
            end;
        end;
    end;
end;

procedure TSP_Post_Add.SincIdBS(old_id: integer; new_id: integer);
begin
    RxBaseSalaries.Open;
    while RxBaseSalaries.Locate('id_post_base_salary', old_id, []) do
    begin
        RxBaseSalaries.Edit;
        RxBaseSalaries['id_post_base_salary'] := new_id;
    end;
    RxBaseSalaries.First;
    RxBaseSalaries.Locate('id_post_base_salary', new_id, []);

    RxMD_All_IPP.Open;
    while RxMD_All_IPP.Locate('id_post_base_salary', old_id, []) do
    begin
        RxMD_All_IPP.Edit;
        RxMD_All_IPP['id_post_base_salary'] := new_id;
    end;

    RxMD_Raises.Open;
    while RxMD_Raises.Locate('id_post_base_salary', old_id, []) do
    begin
        RxMD_Raises.Edit;
        RxMD_Raises['id_post_base_salary'] := new_id;
    end;

        // обновляем разряды
    if DigitsData.Active then
        while DigitsData.Locate('Id_Post_Base_Salary', old_id, []) do
        begin
            DigitsData.Edit;
            DigitsData['Id_Post_Base_Salary'] := new_id;
            DigitsData.Post;
        end;
    if TarifData.Active then
        while TarifData.Locate('Id_Post_Base_Salary', old_id, []) do
        begin
            TarifData.Edit;
            TarifData['Id_Post_Base_Salary'] := new_id;
            TarifData.Post;
        end;
end;

procedure TSP_Post_Add.AddBaseSalariesToIB;
begin
    RxBaseSalaries.First;

    with DMod do
    begin
        FIBDS_Insert.Close;
        FIBDS_Insert.SelectSQL.Text :=
            'select * from sp_post_base_salary_insert(:id_pbs_i,' +
            ':name_post_base_salary,:id_post,:bs_min,:bs_max,:date_beg,' +
            ':date_end, :old_oklad, :use_digit, :ref_base_salary, :koeff);';

        while not RxBaseSalaries.Eof do
        begin
            FIBDS_Insert.ParamByName('id_post').AsInteger := id;
            FIBDS_Insert.ParamByName('name_post_base_salary').AsString := RxBaseSalaries['name_post_base_salary'];
            FIBDS_Insert.ParamByName('bs_min').AsDouble := RxBaseSalaries['base_salary_min'];
            FIBDS_Insert.ParamByName('bs_max').AsDouble := RxBaseSalaries['base_salary_max'];
            FIBDS_Insert.ParamByName('date_beg').AsDate := RxBaseSalaries['date_beg'];
            FIBDS_Insert.ParamByName('date_end').AsDate := RxBaseSalaries['date_end'];
            FIBDS_Insert.ParamByName('old_oklad').AsInteger := RxBaseSalaries['old_oklad'];
            FIBDS_Insert.ParamByName('use_digit').AsInteger := RxBaseSalaries['use_digit'];
            FIBDS_Insert.ParamByName('ref_base_salary').AsVariant := RxBaseSalaries['ref_base_salary'];
            FIBDS_Insert.ParamByName('koeff').AsVariant := RxBaseSalaries['koeff'];
            if RxBaseSalaries['id_post_base_salary'] < 0 then
            begin
                FIBDS_Insert.ParamByName('id_pbs_i').AsVariant := null;
                FIBDS_Insert.Open;
                id_bs := FIBDS_Insert['id_post_base_salary'];
                FIBDS_Insert.Close;
                SincIdBS(RxBaseSalaries['id_post_base_salary'], id_bs);
            end
            else
            begin
                FIBDS_Insert.ParamByName('id_pbs_i').AsInteger := RxBaseSalaries['id_post_base_salary'];
                FIBDS_Insert.Open;
                id_bs := FIBDS_Insert['id_post_base_salary'];
                FIBDS_Insert.Close;
            end;
            RxBaseSalaries.Next;
        end;
    end;
end;

procedure TSP_Post_Add.AcceptActionExecute(Sender: TObject);
var
    form: TSpForm;
    PropParams: TSpParams;
    spec, s, ps_name, dates_bug: string;
    id_session: integer;
    Category_End, BSalary_End: TDate;
    ModeCheck :string;
begin
    FormControl.Read;

    if not FormControl.CheckFill then
    begin
        ModalResult := 0;
        Exit;
    end;

    if Group.Check <> '' then
    begin
        qFErrorDialog(Group.Check);
        ModalResult := 0;
        Exit;
    end;

    if (RxMD_Cat.IsEmpty) then
    begin
        MessageDlg('Повинна бути обрана категорія', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

    if (RxMD_Type.IsEmpty) then
    begin
        MessageDlg('Повинен бути обраний тип', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

        // иначе невозможно сделать должность без базовых окладов
        // а тогда ее не удалить :)
  {  if (RxBaseSalaries.IsEmpty) then
    begin
        MessageDlg('Повинен бути заданий базовий оклад', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;}

    if (RxMD_Hollidays.IsEmpty) then
    begin
        MessageDlg('Повинна бути обрана відпустка', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

    if not TextOk(CE_Name.Text) then
    begin
        MessageDlg('Не вірно введена назва', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

    if (not Add) and (IsOklCh) and (not CheckBox1.Checked) then
    begin
        CheckBox1.Checked := MessageDlg('Були внесені але не підтверджені зміни в базові оклади!' + #13 + 'Бажаєте підтвердити?', mtConfirmation, [mbYes, mbNo], 0) = mrYes;
    end;
    spec := 'F';
    if CB_Spec.Checked then spec := 'T';

    dates_bug := IsDatesCorrect;
    if dates_bug <> '' then
    begin
        MessageDlg('Не вірно введені дати (' + dates_bug + ')', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;

            // конец категории
    Category_End := EncodeDate(1900, 1, 1);
    RxMD_Cat.First;
    while not RxMD_Cat.Eof do
    begin
        if RxMD_Cat['Date_End'] > Category_End then
            Category_End := RxMD_Cat['Date_End'];
        RxMD_Cat.Next;
    end;

        // конец базовых окладов
    BSalary_End := EncodeDate(1900, 1, 1);
    RxBaseSalaries.DisableControls;
    RxBaseSalaries.First;
    while not RxBaseSalaries.Eof do
    begin
        if RxBaseSalaries['Date_End'] > BSalary_End then
            BSalary_End := RxBaseSalaries['Date_End'];
        RxBaseSalaries.Next;
    end;
    RxBaseSalaries.EnableControls;

    if BSalary_End > Category_End then
    begin
        qFErrorDialog('Не задана категорія на дату ''' + DateToStr(BSalary_End) + '''!');
        ModalResult := 0;
        Exit;
    end;



    with DMod do
    try
        RxBaseSalaries.DisableControls;
        FIBWriteTransaction.StartTransaction;
        StartHistory(DMod.FIBWriteTransaction);
        if Add then
        begin
            FIBDS_Insert.SelectSQL.Text := 'select * from sp_post_univer_insert(' + QuotedStr(CE_Name.Text) + ',' +
                QuotedStr(CE_Code.Text) + ',' + QuotedStr(spec) + ',' + QuotedStr(CE_Additional.Text) + ',' +
                IntToStr(Group.Value) + ');';
            FIBDS_Insert.Open;
            id := FIBDS_Insert['id'];

 //Добавляем должность в категории  (Add)
            FIBQuery.SQL.Text := 'execute procedure sp_post_category_insert(:id_post,:id_category,:date_beg,:date_end);';
            FIBQuery.ParamByName('id_post').AsInteger := id;
            RxMD_Cat.First;
            while not RxMD_Cat.Eof do
            begin
                FIBQuery.ParamByName('id_category').AsInteger := RxMD_Cat['id_category'];
                FIBQuery.ParamByName('date_beg').AsDate := RxMD_Cat['date_beg'];
                FIBQuery.ParamByName('date_end').AsDate := RxMD_Cat['date_end'];
                FIBQuery.ExecProc;
                RxMD_Cat.Next;
            end;

 //Добавляем должность к типам      (Add)
            FIBQuery.SQL.Text := 'execute procedure jn_post_type_i(:id_type_post,:id_post);';
            FIBQuery.ParamByName('id_post').AsInteger := id;
            RxMD_Type.First;
            while not RxMD_Type.Eof do
            begin
                FIBQuery.ParamByName('id_type_post').AsInteger := RxMD_Type['id_type_post'];
                FIBQuery.ExecProc;
                RxMD_Type.Next;
            end;

 //Добавляем к должности базовые оклады    (Add)
            AddBaseSalariesToIB;

 //Добавляем к базовым окладам надбавки  (Add)
            if IsRaiseAdd then
            begin

                RxMD_Raises.SortOnFields('id_post_salary');
                RxMD_Raises.First;
                pFIBDS_GetSession.Open;
                id_session := pFIBDS_GetSession['ret_value'];
                pFIBDS_GetSession.Close;
                FIBQuery.SQL.Text := 'execute procedure SHTAT_SP_POST_SALARY_RAISE_EXCH(:id_raise,:id_session,:percent,:date_beg,:date_end);';
                FIBQuery.ParamByName('id_session').AsInteger := id_session;
                while not RxMD_Raises.Eof do
                begin
                    if not (RxMD_Raises['id_raise'] = -1) then
                    begin
                        FIBQuery.ParamByName('id_raise').AsInteger := RxMD_Raises['id_raise'];
                        FIBQuery.ParamByName('percent').AsDouble := RxMD_Raises['percent'];
                        FIBQuery.ParamByName('date_beg').AsDate := RxMD_Raises['date_beg'];
                        FIBQuery.ParamByName('date_end').AsDate := RxMD_Raises['date_end'];
                        FIBQuery.ExecProc;
                    end;
                    spec := RxMD_Raises['pps_koef'];

                    if VarIsNull(RxMD_Raises['name_post_salary']) then
                        ps_name := ' '
                    else
                        ps_name := RxMD_Raises['name_post_salary'];

                    id_bs := RxMD_Raises['id_post_base_salary'];
                    id_s := RxMD_Raises['id_post_salary'];
                    RxMD_Raises.Next;
                    if (RxMD_Raises['id_post_salary'] <> id_s) or RxMD_Raises.Eof then
                    begin
                        FIBQuery.SQL.Text := 'select * from sp_post_salary_insert(:id_post_base_salary,:name_post_salary,:pps_koef,:id_i,:id_session);';
                        FIBQuery.ParamByName('id_session').AsInteger := id_session;
                        FIBQuery.ParamByName('id_post_base_salary').AsInteger := id_bs;
                        FIBQuery.ParamByName('name_post_salary').AsString := ps_name;
                        FIBQuery.ParamByName('pps_koef').AsString := spec;

                        if id_s < 0 then
                            FIBQuery.ParamByName('id_i').AsVariant := null
                        else
                            FIBQuery.ParamByName('id_i').AsInteger := id_s;

                        FIBQuery.ExecQuery;

                        id_s := FIBQuery.FieldByName('ID_POST_SALARY').AsInteger; //for check
                        FIBQuery.Close;

                        FIBQuery.SQL.Text := 'execute procedure ASUP_PSALARY_RAISE_EXCH_CLEAR(:id_session);';
                        FIBQuery.ParamByName('id_session').AsInteger := id_session;
                        FIBQuery.ExecProc;

                        pFIBDS_GetSession.Open;
                        id_session := pFIBDS_GetSession['ret_value'];
                        pFIBDS_GetSession.Close;

                        FIBQuery.SQL.Text := 'execute procedure SHTAT_SP_POST_SALARY_RAISE_EXCH(:id_raise,:id_session,:percent,:date_beg,:date_end);';
                        FIBQuery.ParamByName('id_session').AsInteger := id_session;
                    end;
                end;
            end;
 // Добавляем к базовым окладам разряды   (Add)
                // добавляем новые разряды...
            if RxBaseSalaries['use_digit'] = 1 then
            begin
                if DigitsData.Active then
                begin
                    DigitsData.First;
                    while not DigitsData.Eof do
                    begin
                        if (DigitsData['Id_Post_Base_Salary'] = RxBaseSalaries['Id_Post_Base_Salary']) then
                        begin
                            fibDigitsInsert.Close;
                            with fibDigitsInsert do
                            begin
                                ParamByName('Id_Jn_Post_Digits').AsVariant := DigitsData['Id_Jn_Post_Digits'];
                                ParamByName('Id_Post_Base_Salary').AsInteger := DigitsData['Id_Post_Base_Salary'];
                                ParamByName('Num_Digit').AsInteger := DigitsData['Num_Digit'];
                                ParamByName('Date_Beg').AsDate := DigitsData['Date_Beg'];
                                ParamByName('Date_End').AsDate := DigitsData['Date_End'];
                            end;
                            fibDigitsInsert.Open;
                        end;
                        DigitsData.Next;
                    end;
                end;
            end
            else if RxBaseSalaries['use_digit'] = 2 then
            begin

                if not TarifData.Active then TarifData.Open;
                begin
                    TarifData.First;
                    while ( not TarifData.Eof {* and
                     TarifData['Id_Post_Base_Salary'] = RxBaseSalaries['Id_Post_Base_Salary']*}) do
                    begin
                        fibTarifsInsert.Close;
                        with fibTarifsInsert do
                        begin
                            ParamByName('Id_Jn_Post_Tarif').AsVariant    := TarifData['Id_Jn_Post_Tarif'];
                            ParamByName('Date_Beg').AsDate               := TarifData['Date_Beg'];
                            ParamByName('Date_End').AsDate               := TarifData['Date_End'];
                            ParamByName('Id_Post_Base_Salary').AsInteger := TarifData['Id_Post_Base_Salary'];
                            ParamByName('Id_Category_Tarif').AsInteger   := TarifData['Id_Category_Tarif'];
                        end;
                        fibTarifsInsert.Open;
                        TarifData.Next;
                    end;
                end;
            end;

 //Добавляем к должности отпуска   (Add)
            FIBQuery.SQL.Text := 'execute procedure jn_post_holiday_insert(:id_post,:id_post_holiday,:date_beg,:date_end);';
            RxMD_Hollidays.Open;
            RxMD_Hollidays.First;
            while not RxMD_Hollidays.Eof do
            begin
                FIBQuery.ParamByName('id_post').AsInteger := id;
                FIBQuery.ParamByName('id_post_holiday').AsInteger := RxMD_Hollidays['id_post_holiday'];
                FIBQuery.ParamByName('date_beg').AsDate := RxMD_Hollidays['date_beg'];
                FIBQuery.ParamByName('date_end').AsDate := RxMD_Hollidays['date_end'];
                FIBQuery.ExecProc;
                RxMD_Hollidays.Next;
            end;

  //Добавляем к базовым окладам свойства  (Add)
            FIBQuery.SQL.Text := 'execute procedure jn_post_bsalary_prop_insert(:id_post_base_salary,:id_properties);';
            RxMD_All_IPP.First;
            while not RxMD_All_IPP.Eof do
            begin
                FIBQuery.ParamByName('id_post_base_salary').AsInteger := RxMD_All_IPP['id_post_base_salary'];
                FIBQuery.ParamByName('id_properties').AsInteger := RxMD_All_IPP['id_properties'];
                FIBQuery.ExecProc;
                RxMD_All_IPP.Next;
            end;
        end
        else
//Если открыто на изменение  (Modify)
        begin
//Проверка идет в случае даже если базовые оклады не меняли для должности. Теоретически их могли удалить
            id_s  := RxMD_Raises['id_post_salary'];

            if IsNameCh then
            begin
                FIBQuery.SQL.Text := 'execute procedure sp_post_univer_update(' + QuotedStr(CE_Name.Text) + ',' +
                    QuotedStr(CE_Code.Text) + ',' + QuotedStr(spec) + ',' + IntToStr(Id) + ',' + QuotedStr(CE_Additional.Text) + ',' + IntToStr(Group.Value) + ');';
                FIBQuery.ExecProc;
            end;

 //Добавляем должность в категории  (Modify)
            FIBQuery.SQL.Text := 'execute procedure sp_post_category_clear(:id_post);';
            FIBQuery.ParamByName('id_post').AsInteger := id;
            FIBQuery.ExecProc;
            FIBQuery.SQL.Text := 'execute procedure sp_post_category_insert(:id_post,:id_category,:date_beg,:date_end);';
            FIBQuery.ParamByName('id_post').AsInteger := id;
            RxMD_Cat.First;
            while not RxMD_Cat.Eof do
            begin
                FIBQuery.ParamByName('id_category').AsInteger := RxMD_Cat['id_category'];
                FIBQuery.ParamByName('date_beg').AsDate := RxMD_Cat['date_beg'];
                FIBQuery.ParamByName('date_end').AsDate := RxMD_Cat['date_end'];
                FIBQuery.ExecProc;
                RxMD_Cat.Next;
            end;

 //Добавляем должность к типам   (Modify)
            FIBQuery.SQL.Text := 'execute procedure sp_post_type_clear(:id_post);';
            FIBQuery.ParamByName('id_post').AsInteger := id;
            FIBQuery.ExecProc;
            FIBQuery.SQL.Text := 'execute procedure jn_post_type_i(:id_type_post,:id_post);';
            FIBQuery.ParamByName('id_post').AsInteger := id;
            RxMD_Type.First;
            while not RxMD_Type.Eof do
            begin
                FIBQuery.ParamByName('id_type_post').AsInteger := RxMD_Type['id_type_post'];
                FIBQuery.ExecProc;
                RxMD_Type.Next;
            end;

            if CheckBox1.Checked then
            begin

 //изменяем должностные базовые оклады    (Modify)
                FIBQuery.SQL.Text := 'execute procedure sp_post_base_salary_clear(:id_post);';
                FIBQuery.ParamByName('id_post').AsInteger := id;
                FIBQuery.ExecProc;

                AddBaseSalariesToIB;

 //Изменяем к базовым окладам надбавки     (Modify)
                if (not RxMD_Raises.IsEmpty) then
                begin
                    RxMD_Raises.SortOnFields('id_post_salary');
                    RxMD_Raises.First;

                    pFIBDS_GetSession.Open;
                    id_session := pFIBDS_GetSession['ret_value'];
                    pFIBDS_GetSession.Close;

                    FIBQuery.SQL.Text := 'execute procedure SHTAT_SP_POST_SALARY_RAISE_EXCH(:id_raise,:id_session,:percent,:date_beg,:date_end);';
                    FIBQuery.ParamByName('id_session').AsInteger := id_session;
                    while not RxMD_Raises.Eof do
                    begin
                        if not (RxMD_Raises['id_raise'] = -1) then
                        begin
                            FIBQuery.ParamByName('id_raise').AsInteger := RxMD_Raises['id_raise'];
                            FIBQuery.ParamByName('percent').AsDouble := RxMD_Raises['percent'];
                            FIBQuery.ParamByName('date_beg').AsDate := RxMD_Raises['date_beg'];
                            FIBQuery.ParamByName('date_end').AsDate := RxMD_Raises['date_end'];
                            FIBQuery.ExecProc;
                        end;
                        spec := RxMD_Raises['pps_koef'];
                        if VarIsNull(RxMD_Raises['name_post_salary']) then
                            ps_name := ' '
                        else
                            ps_name := RxMD_Raises['name_post_salary'];
                        id_bs := RxMD_Raises['id_post_base_salary'];
                        id_s  := RxMD_Raises['id_post_salary'];
                        RxMD_Raises.Next;
                        if ((RxMD_Raises['id_post_salary'] <> id_s) or (RxMD_Raises.Eof)) then
                        begin
//             ShowInfo(RxMD_Raises);
                            FIBQuery.SQL.Text := 'select * from sp_post_salary_insert(:id_post_base_salary,:name_post_salary,:pps_koef,:id_i,:id_session);';
                            FIBQuery.ParamByName('id_session').AsInteger := id_session;
                            FIBQuery.ParamByName('id_post_base_salary').AsInteger := id_bs;
                            FIBQuery.ParamByName('name_post_salary').AsString := ps_name;
                            FIBQuery.ParamByName('pps_koef').AsString := spec;

                            if id_s < 0 then
                                FIBQuery.ParamByName('id_i').AsVariant := null
                            else
                                FIBQuery.ParamByName('id_i').AsInteger := id_s;

                            FIBQuery.ExecQuery;
                            FIBQuery.Close;

                            FIBQuery.SQL.Text := 'execute procedure ASUP_PSALARY_RAISE_EXCH_CLEAR(:id_session);';
                            FIBQuery.ParamByName('id_session').AsInteger := id_session;
                            FIBQuery.ExecProc;

                            pFIBDS_GetSession.Open;
                            id_session := pFIBDS_GetSession['ret_value'];
                            pFIBDS_GetSession.Close;

                            FIBQuery.SQL.Text := 'execute procedure SHTAT_SP_POST_SALARY_RAISE_EXCH(:id_raise,:id_session,:percent,:date_beg,:date_end);';
                            FIBQuery.ParamByName('id_session').AsInteger := id_session;
                        end;
                    end;
                end;

 //Изменяем к базовым окладам свойства   (Modify)
                FIBQuery.Close;
                FIBQuery.SQL.Text := 'execute procedure jn_post_bsalary_prop_clear(:id_post);';
                FIBQuery.ParamByName('id_post').AsInteger := id;
                try
                FIBQuery.ExecProc;
                except
                    on E: Exception do showmessage(E.Message);
                end;
                try
                FIBQuery.Close;
                FIBQuery.SQL.Text := 'execute procedure jn_post_bsalary_prop_insert(:id_post_base_salary,:id_properties);';
                except
                    on E: Exception do showmessage(E.Message);
                end;
                RxMD_All_IPP.First;
                while not RxMD_All_IPP.Eof do
                begin
                    FIBQuery.ParamByName('id_post_base_salary').AsInteger := RxMD_All_IPP['id_post_base_salary'];
                    FIBQuery.ParamByName('id_properties').AsInteger := RxMD_All_IPP['id_properties'];
                    FIBQuery.ExecProc;
                    RxMD_All_IPP.Next;
                end;
            end;

             // Добавляем к базовым окладам разряды  (Modify)
                // сначала удаляем то, что было раньше
            RxBaseSalaries.First;
            while not RxBaseSalaries.Eof do
            begin
                if RxBaseSalaries['use_digit'] = '1' then
                begin
                    fibDigitsDelete.ParamByName('Id_Post_Base_Salary').AsInteger :=
                        RxBaseSalaries['Id_Post_Base_Salary'];
                    fibDigitsDelete.ExecQuery;

                end
                else if RxBaseSalaries['use_digit'] = '2' then
                begin
                    try
                    fibTarifDelete.ParamByName('Id_Post_Base_Salary').AsInteger :=
                        RxBaseSalaries['Id_Post_Base_Salary'];
                    fibTarifDelete.ExecQuery;
                    except  on E: Exception do showmessage(E.Message);
                    end;
                end;

                // добавляем новые разряды...    (Modify)
            if RxBaseSalaries['use_digit'] = 1 then
            begin
                DigitsData.First;
                while not DigitsData.Eof do
                begin
                    if (DigitsData['Id_Post_Base_Salary'] = RxBaseSalaries['Id_Post_Base_Salary']) then
                    begin
                        fibDigitsInsert.Close;
                        with fibDigitsInsert do
                        begin
                            ParamByName('Id_Jn_Post_Digits').AsVariant := DigitsData['Id_Jn_Post_Digits'];
                            ParamByName('Id_Post_Base_Salary').AsInteger := DigitsData['Id_Post_Base_Salary'];
                            ParamByName('Num_Digit').AsInteger := DigitsData['Num_Digit'];
                            ParamByName('Date_Beg').AsDate := DigitsData['Date_Beg'];
                            ParamByName('Date_End').AsDate := DigitsData['Date_End'];
                        end;
                        fibDigitsInsert.Open;
                    end;
                    DigitsData.Next;
                end;

            end
            else if RxBaseSalaries['use_digit'] = 2 then
            begin
                if TarifData.Active then
                begin
                    TarifData.First;
                    while not TarifData.Eof do
                    begin
                        fibTarifsInsert.Close;
                        with fibTarifsInsert do
                        begin
                            ParamByName('Id_Jn_Post_Tarif').AsVariant    := TarifData['Id_Jn_Post_Tarif'];
                            ParamByName('Date_Beg').AsDate               := TarifData['Date_Beg'];
                            ParamByName('Date_End').AsDate               := TarifData['Date_End'];
                            ParamByName('Id_Post_Base_Salary').AsInteger := TarifData['Id_Post_Base_Salary'];
                            ParamByName('Id_Category_Tarif').AsInteger   := TarifData['Id_Category_Tarif'];
                        end;
                        fibTarifsInsert.Open;
                        TarifData.Next;
                    end;
                end;
            end;
               RxBaseSalaries.Next;
            end;
 //Изменяем должностные отпуска    (Modify)
            if IsHolidayCh then
            begin
                FIBQuery.SQL.Text := 'execute procedure jn_post_holiday_clear(:id_post);';
                FIBQuery.ParamByName('id_post').AsInteger := id;
                FIBQuery.ExecProc;
                FIBQuery.SQL.Text := 'execute procedure jn_post_holiday_insert(:id_post,:id_post_holiday,:date_beg,:date_end);';
                RxMD_Hollidays.Open;
                RxMD_Hollidays.First;
                while not RxMD_Hollidays.Eof do
                begin
                    FIBQuery.ParamByName('id_post').AsInteger := id;
                    FIBQuery.ParamByName('id_post_holiday').AsInteger := RxMD_Hollidays['id_post_holiday'];
                    FIBQuery.ParamByName('date_beg').AsDate := RxMD_Hollidays['date_beg'];
                    FIBQuery.ParamByName('date_end').AsDate := RxMD_Hollidays['date_end'];
                    FIBQuery.ExecProc;
                    RxMD_Hollidays.Next;
                end;
            end;
        end;
        WriteProperties;

            // выполняем действия после изменения должности
        SpPostAfterEdit.ParamByName('Id_Post').AsInteger := Id;
        SpPostAfterEdit.ExecQuery;
        if    IsRaiseAdd then   ModeCheck := 'I'
        else ModeCheck := 'U';
           //+varToStrDef(id, 'NULL')+','
        IntegrityDS.Sqls.SelectSQL.Text:='SELECT * FROM ASUP_POST_CHECK('''+ModeCheck+''','+varToStrDef(id_bs,'NULL')+','+varToStrDef(id_s,'NULL')+')';
        IntegrityDS.Database := FIBWriteTransaction.DefaultDatabase;
        IntegrityDS.Transaction := FIBWriteTransaction;
        IntegrityDS.Open;    ///SELECT * FROM ASUP_POST_INTEGRITY_CHECK
        if IntegrityDS.IsEmpty then
            FIBWriteTransaction.Commit
        else
        begin
            MessageDlg('Помилка! Порушена цілісність даних!' + #13 + 'Наступна інформація повинна бути передана адміністратору програми "Штатний розклад"!', mtError, [mbYes], 0);
            qSelect(IntegrityDS, 'Помилки у базі даних');
            FIBWriteTransaction.RollBack;
            ModalResult := 0;
            error:=True;
        end;
    except on e: Exception do
        begin
            if Add then
                s := 'додати'
            else
                s := 'змінити';
            MessageDlg('Не вдалося ' + s + ' запис: ' + #13 + e.Message, mtError, [mbYes], 0);
            RxBaseSalaries.EnableControls;
            FIBWriteTransaction.RollBack;
            error:=True;
            ModalResult := 0;
            Exit;
        end;
    end;
    DMod.FIBDS_Insert.Close;

    ModalResult := mrOk;
end;

procedure TSP_Post_Add.FormCreate(Sender: TObject);
begin
    DMod := TDMSPPost.Create(Self);
    FormControl := TEditControl.Create;
    FormControl.Add([FC_Name, FC_Code]);
    FormControl.Prepare(emNew);
    id_pbs := -1;
    id_s := -1;
    StatusPanel.Caption := StdStatus;
    Beg_Date := DMod.Base_Date;
end;

procedure TSP_Post_Add.FormClose(Sender: TObject;
    var Action: TCloseAction);
var
    Registry: TRegistry;
begin
    FormControl.Free;
        // сохранить в реестр дату добавления
    Registry := TRegistry.Create(KEY_WRITE);
    try
        Registry.RootKey := HKEY_CURRENT_USER;
        Registry.OpenKey('Software\Asup\SpPost', True);
        Registry.WriteDate('Base_Date', Beg_Date);
    finally
        Registry.Free;
    end;
end;

procedure TSP_Post_Add.SBCancelClick(Sender: TObject);
begin
    if qFConfirm('Відмінити редагування посади?') then
    begin
        ModalResult := mrCancel;
        Close;
    end;
end;

procedure TSP_Post_Add.FormShow(Sender: TObject);
begin
    GridResize(HolidayGrid);
    GridResize(CategoryGrid);
    GridResize(TypeGrid);
//  GridResize(DBGrid4);
    BaseSalaryNameColumn.width := 400;
    GridResize(PropGrid);
    SPInit(DMod.FIBDatabase.Handle);
    HolidaySelect.Database := DMod.FIBDatabase;
    fibBaseSalaries.Database := DMod.FIBDatabase;
    pFIBDS_IPP.Database := DMod.FIBDatabase;
    pFIBDS_Raises.Database := DMod.FIBDatabase;
    pFIBDS_Cat.Database := DMod.FIBDatabase;
    pFIBDS_Prop.Database := DMod.FIBDatabase;
    pFIBDS_AllProp.Database := DMod.FIBDatabase;
    WritePropQuery.Database := DMod.FIBDatabase;
    WritePropQuery.Transaction := DMod.FIBWriteTransaction;
    fibPostDigits.Database := DMod.FIBDatabase;
    fibPostDigits.Transaction := DMod.FIBReadTransaction;
    fibPostTarif.Database := DMod.FIBDatabase;
    fibPostTarif.Transaction := DMod.FIBReadTransaction;
    fibDigitsDelete.Database := DMod.FIBDatabase;
    fibDigitsDelete.Transaction := DMod.FIBWriteTransaction;
    fibDigitsInsert.Database := DMod.FIBDatabase;
    fibDigitsInsert.Transaction := DMod.FIBWriteTransaction;
    fibTarifsInsert.Database := DMod.FIBDatabase;
    fibTarifsInsert.Transaction := DMod.FIBWriteTransaction;
    fibTarifDelete.Database := DMod.FIBDatabase;
    fibTarifDelete.Transaction := DMod.FIBWriteTransaction;

    if not Add then
    begin
        HolidaySelect.ParamByName('id_post').AsInteger := ID;
        HolidaySelect.Open;
        HolidaySelect.Close;
        fibBaseSalaries.ParamByName('id_post').AsInteger := ID;
        fibBaseSalaries.Open;
        fibBaseSalaries.Close;
        pFIBDS_IPP.ParamByName('id_post').AsInteger := ID;
        pFIBDS_IPP.Open;
        pFIBDS_IPP.Close;
        pFIBDS_Raises.ParamByName('id_post').AsInteger := ID;
        pFIBDS_Raises.Open;
        pFIBDS_Raises.Close;
        pFIBDS_Cat.ParamByName('id_post').AsInteger := ID;
        pFIBDS_Cat.Open;
        pFIBDS_Cat.Close;

            // загружаем данные о разрядах
        fibPostDigits.Close;
        fibPostDigits.ParamByName('Id_Post').AsInteger := ID;
        fibPostDigits.Open;

            // копируем данные о разрядах в RX
        DigitsData.Open;
        fibPostDigits.First;
        while not fibPostDigits.Eof do
        begin
            DigitsData.Append;
            DigitsData['Id_Jn_Post_Digits'] := fibPostDigits['Id_Jn_Post_Digits'];
            DigitsData['Id_Post_Base_Salary'] := fibPostDigits['Id_Post_Base_Salary'];
            DigitsData['Num_Digit'] := fibPostDigits['Num_Digit'];
            DigitsData['Date_Beg'] := fibPostDigits['Date_Beg'];
            DigitsData['Date_End'] := fibPostDigits['Date_End'];
            
            DigitsData.Post;
            fibPostDigits.Next;
        end;

          // загружаем данные о разрядах
        fibPostTarif.Close;
        fibPostTarif.ParamByName('Id_Post').AsInteger := ID;
        fibPostTarif.Open;

        TarifData.Open;
        fibPostTarif.First;
        while not fibPostTarif.Eof do
        begin
            TarifData.Append;
            TarifData['Id_Jn_Post_Tarif']    := fibPostTarif['Id_Jn_Post_Tarif'];
            TarifData['Id_Post_Base_Salary'] := fibPostTarif['Id_Post_Base_Salary'];
            TarifData['Name_Tarif']          := fibPostTarif['Name_Tarif'];
            TarifData['Date_Beg']            := fibPostTarif['Date_Beg'];
            TarifData['Date_End']            := fibPostTarif['Date_End'];
            TarifData['Id_Cat_Tarif_Grid']   := fibPostTarif['Id_Cat_Tarif_Grid'];
            TarifData['Id_Category_tarif']   := fibPostTarif['Id_Category_tarif'];
            TarifData.Post;
            fibPostTarif.Next;
        end;
    end;



    RebuildPropList;

    BaseSalaryView.DataController.Filter.Clear;
    BaseSalaryView.DataController.Filter.AddItem(nil, OldOkladColumn, foEqual, '0', '0');
    BaseSalaryView.DataController.Filter.Active := True;

    IsNameCh := False; IsOklCh := False; IsHolidayCh := False; IsRaiseAdd := False;
    PageControl1.ActivePage := TabSheet1;
    cxSplitter1.CloseSplitter;
end;

procedure TSP_Post_Add.AddTypePostButtonClick(Sender: TObject);
begin
    if ShowTypePost(Self, DMod.FIBDatabase.Handle, smMSelMod, RxMD_Type) then
    begin
        RxMD_Type.Open;
        TypeGrid.Refresh;
    end;
end;

procedure TSP_Post_Add.DeleteTypePostButtonClick(Sender: TObject);
begin
    if RxMD_Type.IsEmpty then
        Exit;
    RxMD_Type.Delete;
    TypeGrid.Refresh;
end;

procedure TSP_Post_Add.AddCategoryButtonClick(Sender: TObject);
var i: integer;
begin
    if ShowCat(Self, DMod.FIBDatabase.Handle, smMSelMod, RxMD_Cat) then
    begin
        RxMD_Cat.Open;
        RxMD_Cat.First;
        i := 0;
        while not RxMD_Cat.Eof do
        begin
            RxMD_Cat.Edit;
            RxMD_Cat['date_beg'] := DMod.Base_Date + i;
            RxMD_Cat['date_end'] := DMod.Base_Date + i + 30;
            i := i + 31;
            RxMD_Cat.Next;
        end;
        RxMD_Cat.Last;
        RxMD_Cat.Edit;
        RxMD_Cat['date_end'] := Infinity_Date;
        CategoryGrid.Refresh;
    end;
    RxMD_Cat.Open;
    CategoryGrid.Refresh;
end;

procedure TSP_Post_Add.DeleteCategoryButtonClick(Sender: TObject);
begin
    if RxMD_Cat.IsEmpty then
        Exit;
    RxMD_Cat.Delete;
    CategoryGrid.Refresh;
end;

procedure TSP_Post_Add.ModifyCategoryButtonClick(Sender: TObject);
var AForm: TFDates;
begin
    if RxMD_Cat.IsEmpty then
    begin
        MessageDlg('Спочатку оберіть категорії', mtError, [mbYes], 0);
        ModalResult := 0;
        Exit;
    end;
    AForm := TFDates.Create(self);
    AForm.Label5.Caption := RxMD_Cat['name_category'];
    AForm.DTP_Beg.Date := RxMD_Cat['date_beg'];
    AForm.DTP_End.Date := RxMD_Cat['date_end'];
    if AForm.ShowModal = mrOk then
    begin
//     id:=RxMD_Cat['id_category'];
        RxMD_Cat.Edit;
//     RxMD_Cat.Locate('id_category',id,[]);
        RxMD_Cat['date_beg'] := AForm.DTP_Beg.Date;
        RxMD_Cat['date_end'] := AForm.DTP_End.Date;
    end;
    AForm.Free;
end;

procedure TSP_Post_Add.CE_NameChange(Sender: TObject);
begin
    IsNameCh := True;
end;

procedure TSP_Post_Add.SpCB_HolidayChange(Sender: TObject);
begin
    IsHolidayCh := True;
end;

procedure TSP_Post_Add.RB_CorClick(Sender: TObject);
begin
{  HolidaySelect.Last;
  if RB_Cor.Checked then
   begin
     DTP_Beg.Date:=HolidaySelect['Date_beg'];
     DTP_End.Date:=HolidaySelect['Date_end'];
   end;
  if RB_Edit.Checked then
   begin
     if HolidaySelect['Date_end']<>Infinity_Date then
     DTP_Beg.Date:=HolidaySelect['Date_end'] else
     DTP_Beg.Date:=Date;
     DTP_End.Date:=Infinity_Date;
   end;
  SpCB_Holiday.Prepare(HolidaySelect['id_post_holiday'],HolidaySelect['holiday_long']);
  SpCB_HolidayChange(Sender);}
end;

procedure TSP_Post_Add.PostSalaryButtonClick(Sender: TObject);
var
    MForm: TSP_Post_salary;
begin
    ;
    if RxBaseSalaries.IsEmpty then
        Exit;

    MForm := TSP_Post_salary.Create(Self);
    MForm.DMod := DMod;
    MForm.Add := Add;
    MForm.id := id_s;

    RxBaseSalaries.Open;
    id_bs := RxBaseSalaries['id_post_base_salary'];
    MForm.id_bs := id_bs;
    RxBaseSalaries.First;
    while not RxBaseSalaries.Eof do
    begin //Бочина! Не передаются групы надбавок и собственно надбавки!
        MForm.RxBaseSalaries.Open;
        if RxBaseSalaries['id_post_base_salary'] = id_bs then
        begin
            MForm.RxBaseSalaries.Append;
            MForm.RxBaseSalaries['date_beg'] := RxBaseSalaries['date_beg'];
            MForm.RxBaseSalaries['date_end'] := RxBaseSalaries['date_end'];
            MForm.RxBaseSalaries['base_salary_min'] := RxBaseSalaries['base_salary_min'];
            MForm.RxBaseSalaries['base_salary_max'] := RxBaseSalaries['base_salary_max'];
            MForm.RxBaseSalaries['name_post_base_salary'] := RxBaseSalaries['name_post_base_salary'];
//            MForm.RxBaseSalaries['Old_Oklad'] := RxBaseSalaries['Old_Oklad'];
            MForm.RxBaseSalaries.Post;
        end;
        RxBaseSalaries.Next;
    end;

    RxBaseSalaries.First;
    RxBaseSalaries.Locate('id_post_base_salary', id_bs, []);

    RxMD_Raises.Open;
    RxMD_Raises.First;
    while not RxMD_Raises.Eof do
    begin
        MForm.RxMD_Raises.Open;
        if RxMD_Raises['id_post_base_salary'] = id_bs then
        begin
            MForm.RxMD_Raises.Append;
            MForm.RxMD_Raises['id_raise'] := RxMD_Raises['id_raise'];
            MForm.RxMD_Raises['pps_koef'] := RxMD_Raises['pps_koef'];
            if VarIsNull(RxMD_Raises['name_post_salary']) then
                MForm.RxMD_Raises['name_post_salary'] := ' '
            else
                MForm.RxMD_Raises['name_post_salary'] := RxMD_Raises['name_post_salary'];
            MForm.RxMD_Raises['id_post_salary'] := RxMD_Raises['id_post_salary'];
            MForm.RxMD_Raises['id_post_base_salary'] := id_bs;
            if RxMD_Raises['id_raise'] <> -1 then
            begin
                MForm.RxMD_Raises['date_beg'] := RxMD_Raises['date_beg'];
                MForm.RxMD_Raises['date_end'] := RxMD_Raises['date_end'];
                MForm.RxMD_Raises['name'] := RxMD_Raises['name'];
                MForm.RxMD_Raises['percent'] := RxMD_Raises['percent'];
            end;
            MForm.RxMD_Raises.Post;
 //           ShowInfo(RxMD_Raises);
        end;
        RxMD_Raises.Next;
    end;
//  MForm.Refresh;

    if MForm.ShowModal = mrOk then
    begin
        id_s := MForm.id;
        RxMD_Raises.Open;
        while RxMD_Raises.Locate('id_post_base_salary', id_bs, []) do
            RxMD_Raises.Delete;
        MForm.RxMD_Raises.Open;
        MForm.RxMD_Raises.First;
        while not MForm.RxMD_Raises.Eof do
        begin
            RxMD_Raises.Append;
            RxMD_Raises['pps_koef'] := MForm.RxMD_Raises['pps_koef'];
            if VarIsNull(MForm.RxMD_Raises['name_post_salary']) then
                RxMD_Raises['name_post_salary'] := ''
            else
                RxMD_Raises['name_post_salary'] := MForm.RxMD_Raises['name_post_salary'];
            RxMD_Raises['id_post_base_salary'] := id_bs;

            if not VarIsNull(MForm.RxMD_Raises['id_raise']) then
                RxMD_Raises['id_raise'] := MForm.RxMD_Raises['id_raise'];

            RxMD_Raises['id_post_salary'] := MForm.RxMD_Raises['id_post_salary'];
            if MForm.RxMD_Raises['id_raise'] <> -1 then
            begin
                RxMD_Raises['date_beg'] := MForm.RxMD_Raises['date_beg'];
                RxMD_Raises['date_end'] := MForm.RxMD_Raises['date_end'];
                RxMD_Raises['name'] := MForm.RxMD_Raises['name'];
                RxMD_Raises['percent'] := MForm.RxMD_Raises['percent'];
            end;
            RxMD_Raises.Post;
//       ShowInfo(MForm.RxMD_Raises);
            MForm.RxMD_Raises.Next;
        end;
        IsRaiseAdd := True;
        IsOklCh := True;
    end;

    MForm.Free;
end;

procedure TSP_Post_Add.FormDestroy(Sender: TObject);
begin
  //SPDone;
end;

procedure TSP_Post_Add.SB_Add_PropClick(Sender: TObject);
var Output: TRxMemoryData;

begin
    Output := TRxMemoryData.Create(self);
    Output.CopyStructure(RxMD_IPP);
    if ShowSalaryProp(Self, DMod.FIBDatabase.Handle, smMSelMod, Output) then
    begin
        RxMD_All_IPP.Open;
        if not Output.IsEmpty then
        begin
            Output.Open;
            Output.First;
            while not Output.Eof do
            begin
                RxMD_All_IPP.Append;
                RxMD_All_IPP['id_properties'] := Output['id_properties'];
                RxMD_All_IPP['name_properties'] := Output['name_properties'];
                RxMD_All_IPP['id_post_base_salary'] := RxBaseSalaries['id_post_base_salary'];
                RxMD_All_IPP.Post;
                Output.Next;
            end;
            RxBaseSalariesAfterScroll(RxBaseSalaries);
        end;
        PropGrid.Refresh;
        GridResize(PropGrid);
        IsOklCh := True;
    end;
    Output.Free;
end;

procedure TSP_Post_Add.SB_Del_PropClick(Sender: TObject);
begin
    if RxMD_IPP.IsEmpty then
        Exit;
    RxMD_All_IPP.Open;
    RxMD_All_IPP.First;
    while not RxMD_All_IPP.Eof do
    begin
        if (RxMD_All_IPP['id_post_base_salary'] = RxMD_IPP['id_post_base_salary']) and
            (RxMD_All_IPP['id_properties'] = RxMD_IPP['id_properties']) then
            RxMD_All_IPP.Delete;
        RxMD_All_IPP.Next;
    end;

    RxMD_IPP.Delete;
    PropGrid.Refresh;
    GridResize(PropGrid);
    IsOklCh := True;
end;

procedure TSP_Post_Add.SBAddClick(Sender: TObject);
var
    AForm: TSP_PBS_Add;
begin
    AForm := TSP_PBS_Add.Create(Self);
    AForm.DM := DMod;

    AForm.RadioButton1.Visible := False;
    AForm.RadioButton2.Visible := False;
    AForm.Prepare;
    if AForm.ShowModal = mrOk then
    begin

        RxBaseSalaries.Open;
        if AForm.Use_Digit = 1 then
            begin
                  // копируем разряды базового оклада
                if not AForm.DigitsData.Active then AForm.DigitsData.Open;

                AForm.DigitsData.First;
                while not AForm.DigitsData.Eof do
                begin
                  //  Showmessage('Use_digit = 1') ;
                    if not DigitsData.Active then DigitsData.Open;
                    DigitsData.Append;
                    DigitsData['Id_Post_Base_Salary'] := id_pbs - 1;
                    DigitsData['Id_Jn_Post_Digits']   := AForm.DigitsData['Id_Jn_Post_Digits'];
                    DigitsData['Num_Digit']           := AForm.DigitsData['Num_Digit'];
                    DigitsData['Date_Beg']            := AForm.DigitsData['Date_Beg'];
                    DigitsData['Date_End']            := AForm.DigitsData['Date_End'];
                    Beg_Date := AForm.DigitsData['Date_Beg'];
                    DigitsData.Post;
                    AForm.DigitsData.Next;
                end;
        end
        else if AForm.Use_Digit = 2 then
            begin
                if not AForm.TarifData.Active then AForm.TarifData.Open;

                AForm.TarifData.First;
                while not AForm.TarifData.Eof do
                begin
                    if not TarifData.Active then TarifData.Open;
                    //забираем данные о тарифах
                    //********
                    TarifData.Append;
                    TarifData['Id_Jn_Post_Tarif']    := AForm.TarifData['Id_Jn_Post_Tarif'];
                    TarifData['Id_Post_Base_Salary'] := id_pbs - 1;
                    TarifData['Id_Cat_Tarif_Grid']   := AForm.TarifData['Id_Cat_Tarif_Grid'];
                    TarifData['Id_Category_tarif']   := AForm.TarifData['Id_Category_tarif'];
                    TarifData['Date_Beg']            := AForm.TarifData['Date_Beg'];
                    TarifData['Date_End']            := AForm.TarifData['Date_End'];
                    TarifData['Name_Tarif']          := AForm.TarifData['Name_tarif'];
                    Beg_Date := AForm.TarifData['Date_Beg'];
                    TarifData.Post;
                    //********
                    AForm.TarifData.Next;
                end;
            end;

        Form_GetBaseSalary(AForm, id_pbs - 1);
       // Showmessage('111');
        BaseSalaryView.DataController.BeginUpdate;
        RxBaseSalaries.SortOnFields('Date_Beg');
        IsOklCh := True;



        RefreshDigitSTR;
        BaseSalaryView.DataController.EndUpdate;
        BaseSalaryView.ViewData.Expand(False);
        //Showmessage('222');

        id_pbs := id_pbs - 1;
        AddDefaultPostSalary(id_pbs);
    end;

    AForm.Free;

end;

procedure TSP_Post_Add.SBDeleteClick(Sender: TObject);
begin
    if RxBaseSalaries.IsEmpty then
        Exit;
    id_bs := RxBaseSalaries['Id_Post_Base_Salary'];

    RxBaseSalaries.Delete;

    if not RxBaseSalaries.Locate('Id_Post_Base_Salary', id_bs, []) then
    begin
        if not RxMD_IPP.Active then RxMD_IPP.Open;
        while RxMD_IPP.Locate('Id_Post_Base_Salary', id_bs, []) do
            RxMD_IPP.Delete;

        if not RxMD_Raises.Active then RxMD_Raises.Open;
        while RxMD_Raises.Locate('Id_Post_Base_Salary', id_bs, []) do
            RxMD_Raises.Delete;

        if not DigitsData.Active then DigitsData.Open;
        while DigitsData.Locate('Id_Post_Base_Salary', id_bs, []) do
            DigitsData.Delete;

        if not TarifData.Active then TarifData.Open;
        while TarifData.Locate('Id_Post_Base_Salary', id_bs, []) do
            TarifData.Delete;

    end;

    IsOklCh := True;
end;

procedure TSP_Post_Add.Form_GetBaseSalary(AForm: TSP_PBS_Add; Id_Base_Salary: Integer);
var
    Num_Digit: Integer;
    Dig_Beg, Dig_End, db, de: TDate;
    Id_Cat_Tarif_Grid, Id_Category_Tarif: Integer;
    use_digit: Integer;
    s : string;
begin
    use_digit := AForm.Use_Digit;
    if ((use_digit = 0) or (use_digit = 4)) then
    begin
       // if not DigitsData.Active or not DigitsData.Locate('Id_Post_Base_Salary', Id_Base_Salary, []) then
       // begin // если не разрядная должность - добавим, и все
            if use_digit = 4 then s := 'Тар. ' else s := '';
            try
            RxBaseSalaries.Append;
            RxBaseSalaries['name_post_base_salary'] := AForm.CE_Name.Text;
            RxBaseSalaries['base_salary_min'] := StrToFloat(AForm.CE_Min.Text);
            RxBaseSalaries['base_salary_max'] := StrToFloat(AForm.CE_Max.Text);
            RxBaseSalaries['base_salary_min_text'] := s + (AForm.CE_Min.Text);
            RxBaseSalaries['base_salary_max_text'] := s + (AForm.CE_Max.Text);
            RxBaseSalaries['date_beg'] := AForm.DT_DateBeg.Date;
            RxBaseSalaries['date_end'] := AForm.DT_DateEnd.Date;
            RxBaseSalaries['id_post_base_salary'] := Id_Base_Salary;
            if AForm.Old_Oklad.Checked then
                RxBaseSalaries['Old_Oklad'] := 1
            else
                RxBaseSalaries['Old_Oklad'] := 0;
            RxBaseSalaries['Use_Digit'] := AForm.Use_Digit;
            RxBaseSalaries['Koeff'] := AForm.Koeff.Value;
            RxBaseSalaries['Ref_Base_Salary'] := AForm.Ref_Base_Salary.Value;
            RxBaseSalaries['Ref_Salary_Name'] := AForm.Ref_Base_Salary.DisplayText;
            RxBaseSalaries['Digit_STR'] := AForm.Digit_STR;
            RxBaseSalaries.Post;
            except on E:Exception do Showmessage(E.Message) end;
      //  end
    end
    else if (use_digit = 1) then  // если разрядная, может быть нужно добавить несколько записей
        begin
            DMod.DigitsSelect.Close;
            DMod.DigitsSelect.Open;

                    // по установленным разрядам
            while not DigitsData.Eof and
                (DigitsData['Id_Post_Base_Salary'] = Id_Base_Salary) do
            begin
                Num_Digit := DigitsData['Num_Digit'];
                DMod.DigitsSelect.Locate('Num_Digit', Num_Digit, []);

                Dig_Beg := DigitsData['Date_Beg'];
                Dig_End := DigitsData['Date_End'];

                while not DMod.DigitsSelect.Eof and (DMod.DigitsSelect['Num_Digit'] = Num_Digit) do
                begin
                    db := DMod.DigitsSelect['Date_Beg'];
                    de := DMod.DigitsSelect['Date_End'];

                    if ( Dig_Beg > db ) then db := Dig_Beg;
                    if ( Dig_End < de ) then de := Dig_End;
                    if ( AForm.DT_DateBeg.Date > db ) then
                        db := AForm.DT_DateBeg.Date;
                    if ( AForm.DT_DateEnd.Date < de ) then
                        de := AForm.DT_DateEnd.Date;

                    if ( db <= de ) then
                    begin
                        RxBaseSalaries.Append;
                        RxBaseSalaries['name_post_base_salary'] := AForm.CE_Name.Text;
                        RxBaseSalaries['base_salary_min'] := DMod.DigitsSelect['Summa'];
                        RxBaseSalaries['base_salary_max'] := DMod.DigitsSelect['Summa'];
                        RxBaseSalaries['base_salary_max_text'] := DMod.DigitsSelect['Summa'];
                        RxBaseSalaries['base_salary_max_text'] := DMod.DigitsSelect['Summa'];
                        RxBaseSalaries['date_beg'] := db;
                        RxBaseSalaries['date_end'] := de;
                        RxBaseSalaries['id_post_base_salary'] := Id_Base_Salary;
                        if AForm.Old_Oklad.Checked then
                            RxBaseSalaries['Old_Oklad'] := 1
                        else
                            RxBaseSalaries['Old_Oklad'] := 0;
                        RxBaseSalaries['Use_Digit'] := 1;
                        RxBaseSalaries['Koeff'] := AForm.Koeff.Value;
                        RxBaseSalaries['Ref_Base_Salary'] := AForm.Ref_Base_Salary.Value;
                        RxBaseSalaries['Ref_Salary_Name'] := AForm.Ref_Base_Salary.DisplayText;
                        RxBaseSalaries['Digit_STR'] := AForm.Digit_STR;
                        RxBaseSalaries.Post;
                    end;
                    DMod.DigitsSelect.Next;
                end;

                DigitsData.Next;
            end
        end
        else if Use_Digit = 2 then
            begin
                DMod.TarifSelect.Close;
                DMod.TarifSelect.Open;
                if not TarifData.Active then TarifData.Open;

               // TarifData.First;
                    // по установленным тарифам
            while not TarifData.Eof and
                (TarifData['Id_Post_Base_Salary'] = Id_Base_Salary) do
            begin


                Id_Category_Tarif := TarifData['Id_Category_Tarif'];
                Id_Cat_Tarif_Grid := TarifData['Id_Cat_Tarif_Grid'];
                DMod.TarifSelect.Locate('Id_Cat_Tarif_Grid', Id_Cat_Tarif_Grid, []);

                Dig_Beg := TarifData['Date_Beg'];
                Dig_End := TarifData['Date_End'];

                //DMod.TarifSelect.First;
                while not DMod.TarifSelect.Eof and (DMod.TarifSelect['Id_Category_Tarif'] = Id_Category_Tarif) do
                begin
                    db := DMod.TarifSelect['Date_Beg'];
                    de := DMod.TarifSelect['Date_End'];

                    if ( Dig_Beg > db ) then db := Dig_Beg;
                    if ( Dig_End < de ) then de := Dig_End;
                    if ( AForm.DT_DateBeg.Date > db ) then
                        db := AForm.DT_DateBeg.Date;
                    if ( AForm.DT_DateEnd.Date < de ) then
                        de := AForm.DT_DateEnd.Date;

                    if ( db <= de ) then
                    begin
                        RxBaseSalaries.Append;
                        RxBaseSalaries['name_post_base_salary'] := AForm.CE_Name.Text;

                        RxBaseSalaries['base_salary_min'] := StrToFloat(AForm.CE_Min.Text);
                        RxBaseSalaries['base_salary_max'] := StrToFloat(AForm.CE_Min.Text);

                        RxBaseSalaries['base_salary_min_text'] := 'Тар. ' + AForm.CE_Min.Text;
                        RxBaseSalaries['base_salary_max_text'] := 'Тар. ' + AForm.CE_Min.Text;

                        RxBaseSalaries['date_beg'] := db;
                        RxBaseSalaries['date_end'] := de;
                        RxBaseSalaries['id_post_base_salary'] := Id_Base_Salary;
                        if AForm.Old_Oklad.Checked then
                            RxBaseSalaries['Old_Oklad'] := 1
                        else
                            RxBaseSalaries['Old_Oklad'] := 0;
                        RxBaseSalaries['Use_Digit'] := 2;
                        RxBaseSalaries['Koeff'] := AForm.Koeff.Value;
                        RxBaseSalaries['Ref_Base_Salary'] := AForm.Ref_Base_Salary.Value;
                        RxBaseSalaries['Ref_Salary_Name'] := AForm.Ref_Base_Salary.DisplayText;
                        RxBaseSalaries['Digit_STR'] := AForm.Digit_STR;
                        RxBaseSalaries.Post;
                    end;
                    DMod.TarifSelect.Next;
                end;

                TarifData.Next;
            end;
        end;
end;

procedure TSP_Post_Add.SBModifClick(Sender: TObject);
var AForm: TSP_PBS_Add;
begin
    AForm := TSP_PBS_Add.Create(Self);
    AForm.DM := DMod;

    if (RxBaseSalaries['name_post_base_salary'] = Null) then
        AForm.CE_Name.Text := ' '
    else
        AForm.CE_Name.Text := RxBaseSalaries['name_post_base_salary'];

    AForm.DT_DateBeg.Date := RxBaseSalaries['date_beg'];
    AForm.DT_DateEnd.Date := RxBaseSalaries['date_end'];
    AForm.DBeg := RxBaseSalaries['date_beg'];
    AForm.DEnd := RxBaseSalaries['date_end'];
    AForm.Ref_Base_Salary.Value := RxBaseSalaries['Ref_Base_Salary'];
    AForm.Ref_Base_Salary.DisplayText := RxBaseSalaries['Ref_Salary_Name'];
    AForm.Koeff.Value := RxBaseSalaries['Koeff'];
    if (RxBaseSalaries['Ref_Base_Salary'] = null) then
    begin
        AForm.RBRozryad.Enabled := True;
        AForm.RBTarif.Enabled   := True;
        AForm.SpeedButton7.Enabled := True;
        AForm.SpeedButton8.Enabled := True;
        AForm.SpeedButton9.Enabled := True;
    end
    else begin
        AForm.RBRozryad.Enabled := False;
        AForm.RBTarif.Enabled   := False;
        AForm.SpeedButton7.Enabled := False;
        AForm.SpeedButton8.Enabled := False;
        AForm.SpeedButton9.Enabled := False;
    end;

    AForm.Use_Digit := RxBaseSalaries['Use_Digit'];

    id_bs := RxBaseSalaries['id_post_base_salary'];
    AForm.Id_Bs := id_bs;

    if (AForm.Use_Digit = 2) then
    begin
        AForm.DigitsView.DataController.DataSource := AForm.TarifSource;
        AForm.DigitsViewId_Jn_Post_Digits.DataBinding.FieldName := 'Id_Jn_Post_Tarif';
        AForm.DigitsViewId_Post_Base_Salary.DataBinding.FieldName := 'Id_Post_Base_Salary';
        AForm.DigitsViewNum_Digit.DataBinding.FieldName := 'Num';
        AForm.DigitsViewDate_Beg.DataBinding.FieldName := 'Date_Beg';
        AForm.DigitsViewDate_End.DataBinding.FieldName := 'Date_End';
        AForm.DigitsViewNum_Digit.Caption := 'Тариф';
        AForm.DigitsViewStavka.Visible := False;
        AForm.DigitsViewStavka.Caption := 'Ставка';
        Aform.RBTarif.Checked := true;
        Aform.RBTarif.Visible := true;
        Aform.RBTarif.Enabled := True;
        AForm.RBRozryad.Enabled := False;
        AForm.RBTarif.Visible := True;
    end;
    if RxBaseSalaries['Old_Oklad'] = 1 then
        AForm.Old_Oklad.Checked := True
    else
        AForm.Old_Oklad.Checked := False;

    // передаем данные о разрядах
    if (RxBaseSalaries['Use_Digit'] = 1) then
    begin
        AForm.DigitsData.EmptyTable;
        AForm.DigitsData.Open;
        DigitsData.First;
        while not DigitsData.Eof do
        begin
            if DigitsData['Id_Post_Base_Salary'] = id_bs then
            begin
                AForm.DigitsData.Append;
                AForm.DigitsData['Id_Jn_Post_Digits'] := DigitsData['Id_Jn_Post_Digits'];
                AForm.DigitsData['Id_Post_Base_Salary'] := DigitsData['Id_Post_Base_Salary'];
                AForm.DigitsData['Num_Digit'] := DigitsData['Num_Digit'];
                AForm.DigitsData['Date_Beg'] := DigitsData['Date_Beg'];
                AForm.DigitsData['Date_End'] := DigitsData['Date_End'];
                AForm.DigitsData.Post;
                AForm.RBTarif.Enabled := False;
            end;
            DigitsData.Next;
        end;
    end
    else if RxBaseSalaries['Use_Digit'] = 2 then
    begin
        AForm.TarifData.EmptyTable;
        AForm.TarifData.Open;
        TarifData.First;
        while not TarifData.Eof do
        begin
            if TarifData['Id_Post_Base_Salary'] = id_bs then
            begin
                AForm.TarifData.Append;
                AForm.TarifData['Id_Jn_Post_Tarif']    := TarifData['Id_Jn_Post_Tarif'];
                AForm.TarifData['Id_Post_Base_Salary'] := TarifData['Id_Post_Base_Salary'];
                AForm.TarifData['Name_tarif']          := TarifData['Name_Tarif'];
                AForm.TarifData['Date_Beg']            := TarifData['Date_Beg'];
                AForm.TarifData['Date_End']            := TarifData['Date_End'];
                AForm.TarifData['Id_Category_tarif']   := TarifData['Id_Category_tarif'];
                AForm.TarifData['Id_Cat_Tarif_Grid']   := TarifData['Id_Cat_Tarif_Grid'];
                AForm.TarifData.Post;
                AForm.RBTarif.Enabled := True;
                AForm.RBTarif.Visible := True;
            end;
            TarifData.Next;
        end;
    end;
    AForm.CE_Min.Text := RxBaseSalaries['base_salary_min'];
    AForm.CE_Max.Text := RxBaseSalaries['base_salary_max'];


    if not VarIsNull(RxBaseSalaries['Ref_Base_Salary']) then
    begin
        DMod.RefSalarySelect.Close;
        DMod.RefSalarySelect.ParamByName('Cur_Date').AsDate := RxBaseSalaries['date_beg'];
        DMod.RefSalarySelect.Open;
        DMod.RefSalarySelect.Locate('Id_Post_Base_Salary',
            RxBaseSalaries['Ref_Base_Salary'], []);
        AForm.Ref_Salary_Val := DMod.RefSalarySelect['Base_Oklad'];
    end;

    //AForm.Prepare;

    if AForm.ShowModal = mrOk then
    begin
            // обновляем сведения о разрядах
                // удаляем старые разряды
        if AForm.Use_Digit = 1 then
        begin
            DigitsData.First;
            while not DigitsData.Eof do
            begin
                if DigitsData['Id_Post_Base_Salary'] = id_bs then
                    DigitsData.Delete;
                DigitsData.Next;
            end;
                    // добавляем разряды из формы
            AForm.DigitsData.First;
            while not AForm.DigitsData.Eof do
            begin
                DigitsData.Append;
                DigitsData['Id_Jn_Post_Digits'] := AForm.DigitsData['Id_Jn_Post_Digits'];
                DigitsData['Id_Post_Base_Salary'] := AForm.DigitsData['Id_Post_Base_Salary'];
                DigitsData['Num_Digit'] := AForm.DigitsData['Num_Digit'];
                DigitsData['Date_Beg'] := AForm.DigitsData['Date_Beg'];
                DigitsData['Date_End'] := AForm.DigitsData['Date_End'];
                DigitsData.Post;
                AForm.DigitsData.Next;
            end;
        end else if AForm.Use_Digit = 2 then
            begin
                TarifData.First;
                while not TarifData.Eof do
                begin
                    if TarifData['Id_Post_Base_Salary'] = id_bs then
                        TarifData.Delete;
                    TarifData.Next;
                end;
                        // добавляем разряды из формы
                AForm.TarifData.First;
                while not AForm.TarifData.Eof do
                begin
                    TarifData.Append;
                    TarifData['Id_Jn_Post_Tarif']    := AForm.TarifData['Id_Jn_Post_Tarif'];
                    TarifData['Id_Post_Base_Salary'] := AForm.TarifData['Id_Post_Base_Salary'];
                    TarifData['Name_Tarif']          := AForm.TarifData['Name_Tarif'];
                    TarifData['Date_Beg']            := AForm.TarifData['Date_Beg'];
                    TarifData['Date_End']            := AForm.TarifData['Date_End'];
                    TarifData['Id_Category_tarif']   := AForm.TarifData['Id_Category_tarif'];
                    TarifData['Id_Cat_Tarif_Grid']   := AForm.TarifData['Id_Cat_Tarif_Grid'];
                    TarifData.Post;

                    AForm.TarifData.Next;
                end;
            end;

        RxBaseSalaries.Open;
        if AForm.RadioButton1.Checked then
        begin
            RxBaseSalaries.Delete;
            Form_GetBaseSalary(AForm, id_bs);
        end
        else
        begin
            RxBaseSalaries.Edit;
            RxBaseSalaries['date_end'] := AForm.DT_DateBeg.Date - 1;
            Form_GetBaseSalary(AForm, id_bs);
        end;
        RxBaseSalaries.SortOnFields('date_beg');
        BaseSalaryView.ViewData.Expand(False);
        RefreshDigitSTR;
        IsOklCh := True;
    end;
    AForm.Free;
end;

procedure TSP_Post_Add.DBGrid4TitleClick(Column: TColumn);
begin
    if not RxBaseSalaries.IsEmpty then
        RxBaseSalaries.SortOnFields(Column.FieldName);
end;

procedure TSP_Post_Add.CategoryGridTitleClick(Column: TColumn);
begin
    if not RxMD_Cat.IsEmpty then
        RxMD_Cat.SortOnFields(Column.FieldName);
end;

procedure TSP_Post_Add.HolidaySelectAfterOpen(DataSet: TDataSet);
begin
    RxMD_Hollidays.Open;
    DataSet.First;
    while not DataSet.Eof do
    begin
        RxMD_Hollidays.Append;
        RxMD_Hollidays['id_post_holiday'] := DataSet['id_post_holiday'];
        RxMD_Hollidays['holiday_long'] := DataSet['holiday_long'];
        RxMD_Hollidays['holiday_name'] := DataSet['holiday_name'];
        RxMD_Hollidays['date_beg'] := DataSet['date_beg'];
        RxMD_Hollidays['date_end'] := DataSet['date_end'];
        RxMD_Hollidays.Post;
        DataSet.Next;
    end;
end;

procedure TSP_Post_Add.HolidayGridTitleClick(Column: TColumn);
begin
    if not RxMD_Hollidays.IsEmpty then
        RxMD_Hollidays.SortOnFields(Column.FieldName);
end;

procedure TSP_Post_Add.fibBaseSalariesAfterOpen(DataSet: TDataSet);
begin
    DataSet.First;
    RxBaseSalaries.Open;
    while not DataSet.Eof do
    begin
        RxBaseSalaries.Append;
        RxBaseSalaries['base_salary_min'] := DataSet['base_salary_min'];
        RxBaseSalaries['base_salary_max'] := Dataset['base_salary_max'];
        RxBaseSalaries['base_salary_min_text'] := DataSet['base_salary_min_text'];
        RxBaseSalaries['base_salary_max_text'] := Dataset['base_salary_max_text'];
        RxBaseSalaries['date_beg'] := Dataset['date_beg'];
        RxBaseSalaries['date_end'] := Dataset['date_end'];
        RxBaseSalaries['name_post_base_salary'] := Dataset['name_post_base_salary'];
        RxBaseSalaries['id_post_base_salary'] := Dataset['id_post_base_salary'];
        RxBaseSalaries['Old_Oklad'] := DataSet['Old_Oklad'];
        RxBaseSalaries['Digit_STR'] := DataSet['Digit_STR'];
        RxBaseSalaries['Koeff'] := DataSet['Koeff'];
        RxBaseSalaries['Use_Digit'] := DataSet['Use_Digit'];
        RxBaseSalaries['Ref_Base_Salary'] := DataSet['Ref_Base_Salary'];
        RxBaseSalaries['Ref_Salary_Name'] := DataSet['Ref_Salary_Name'];
        RxBaseSalaries.Post;
        DataSet.Next;
    end;
    if not DataSet.IsEmpty then id_bs := Dataset['id_post_base_salary'];
end;

procedure TSP_Post_Add.RxBaseSalariesAfterScroll(DataSet: TDataSet);
begin
    if (DataSet['id_post_base_salary'] <> Null) then
    begin
        RxMD_IPP.Open;
        RxMD_IPP.First;
        RxMD_IPP.EmptyTable;
 {    while not RxMD_IPP.Eof do
     begin
       RxMD_IPP.Delete;
       RxMD_IPP.First;
     end;}

        RxMD_All_IPP.Open;
        RxMD_All_IPP.First;
        while not RxMD_All_IPP.Eof do
        begin
            if RxMD_All_IPP['id_post_base_salary'] = DataSet['id_post_base_salary'] then
            begin
                RxMD_IPP.Append;
                RxMD_IPP['name_properties'] := RxMD_All_IPP['name_properties'];
                RxMD_IPP['id_post_base_salary'] := RxMD_All_IPP['id_post_base_salary'];
                RxMD_IPP['id_properties'] := RxMD_All_IPP['id_properties'];
                RxMD_IPP.Post;
            end;
            RxMD_All_IPP.Next;
        end;
    end;
    PropGrid.Refresh;
end;

procedure TSP_Post_Add.pFIBDS_IPPAfterOpen(DataSet: TDataSet);
begin
    DataSet.First;
    RxMD_All_IPP.Open;
    while not DataSet.Eof do
    begin
        RxMD_All_IPP.Append;
        RxMD_All_IPP['name_properties'] := Dataset['name_properties'];
        RxMD_All_IPP['id_post_base_salary'] := Dataset['id_post_base_salary'];
        RxMD_All_IPP['id_properties'] := Dataset['id_properties'];
        RxMD_All_IPP.Post;
        DataSet.Next;
    end;
    RxBaseSalariesAfterScroll(RxBaseSalaries);
end;

procedure TSP_Post_Add.RxBaseSalariesAfterOpen(DataSet: TDataSet);
begin
//  GridResize(DBGrid4);
end;

procedure TSP_Post_Add.pFIBDS_RaisesAfterOpen(DataSet: TDataSet);
var flag: Boolean;
begin
    RxMD_Raises.Open;
    DataSet.First;
    while not DataSet.Eof do
    begin
        RxMD_Raises.First;
        flag := true;
        while (not RxMD_Raises.Eof) and flag do
        begin
            if ((RxMD_Raises['id_post_base_salary'] = DataSet['id_post_base_salary']) and
                (RxMD_Raises['id_raise'] = DataSet['id_raise']) and
                (RxMD_Raises['id_post_salary'] = DataSet['id_post_salary']) and
                (RxMD_Raises['Date_Beg'] = DataSet['Date_Beg']) and
                (RxMD_Raises['Date_End'] = DataSet['Date_End']))
                then flag := false;
            RxMD_Raises.Next;
        end;
        if flag then
        begin
            RxMD_Raises.Append;
            RxMD_Raises['pps_koef'] := Dataset['pps_koef'];
            RxMD_Raises['name_post_salary'] := DataSet['name_post_salary'];
            RxMD_Raises['id_post_salary'] := DataSet['id_post_salary'];
            RxMD_Raises['id_post_base_salary'] := DataSet['id_post_base_salary'];
            if VarIsNull(DataSet['id_raise']) then
                RxMD_Raises['id_raise'] := -1
            else
                RxMD_Raises['id_raise'] := DataSet['id_raise'];
            RxMD_Raises['date_beg'] := DataSet['date_beg'];
            RxMD_Raises['date_end'] := DataSet['date_end'];
            RxMD_Raises['name'] := DataSet['name'];
            RxMD_Raises['percent'] := DataSet['percent'];
 //           ShowInfo(DataSet);
            RxMD_Raises.Post;
        end;
        DataSet.Next;
    end;
end;

procedure TSP_Post_Add.SB_Add_HolClick(Sender: TObject);
var AForm: TSP_post_holiday_Add;
begin
    AForm := TSP_post_holiday_Add.Create(Self);
    AForm.Visible := False;
    AForm.DM := DMod;
    qFAutoLoadFromRegistry(AForm);
    AForm.Prepare;
//  AForm.ShowModal;
    if AForm.ShowModal = mrOk then
    begin
        RxMD_Hollidays.Open;
        RxMD_Hollidays.Append;
        RxMD_Hollidays['holiday_long'] := AForm.HolidayLong;
        RxMD_Hollidays['holiday_name'] := AForm.IdPostHoliday.DisplayText;
        RxMD_Hollidays['id_post_holiday'] := AForm.IdPostHoliday.Value;
        RxMD_Hollidays['date_beg'] := AForm.Date_Beg.Value;
        RxMD_Hollidays['date_end'] := AForm.Date_End.Value;
        RxMD_Hollidays.Post;
    end;
    AForm.Free;
    IsHolidayCh := True;
end;

procedure TSP_Post_Add.SB_Del_HolClick(Sender: TObject);
begin
    if not RxMD_Hollidays.IsEmpty then
        RxMD_Hollidays.Delete;
    IsHolidayCh := True;
end;

procedure TSP_Post_Add.SB_Modif_HolClick(Sender: TObject);
var AForm: TSP_post_holiday_Add;
begin
    if RxMD_Hollidays.IsEmpty then
        Exit;

    AForm := TSP_post_holiday_Add.Create(Self);
    AForm.Visible := False;
    AForm.IdPostHoliday.Value := RxMD_Hollidays['id_post_holiday'];
    AForm.IdPostHoliday.DisplayText := RxMD_Hollidays['holiday_name'];
    AForm.HolidayLong := RxMD_Hollidays['holiday_long'];
    AForm.HolidayName := RxMD_Hollidays['holiday_name'];
    AForm.DM := DMod;
    AForm.Prepare;

    AForm.Date_Beg.Value := RxMD_Hollidays['date_beg'];
    AForm.Date_End.Value := RxMD_Hollidays['date_end'];

    if AForm.ShowModal = mrOk then
    begin
        RxMD_Hollidays.Delete;
        RxMD_Hollidays.Open;
        RxMD_Hollidays.Append;
        RxMD_Hollidays['holiday_long'] := AForm.HolidayLong;
        RxMD_Hollidays['holiday_name'] := AForm.HolidayName + '(' +
            IntToStr(RxMD_Hollidays['holiday_long']) + ')';
        RxMD_Hollidays['id_post_holiday'] := AForm.IdPostHoliday.Value;
        RxMD_Hollidays['date_beg'] := AForm.Date_Beg.Value;
        RxMD_Hollidays['date_end'] := AForm.Date_End.Value;
        RxMD_Hollidays.Post;
    end;
    AForm.Free;
    IsHolidayCh := True;
end;

procedure TSP_Post_Add.pFIBDS_CatAfterOpen(DataSet: TDataSet);
begin
    DataSet.First;
    RxMD_Cat.Open;
    while not DataSet.Eof do
    begin
        RxMD_Cat.Append;
        RxMD_Cat['name_category'] := Dataset['name_category'];
        RxMD_Cat['id_category'] := Dataset['id_category'];
        RxMD_Cat['date_beg'] := Dataset['date_beg'];
        RxMD_Cat['date_end'] := Dataset['date_end'];
        RxMD_Cat.Post;
        DataSet.Next;
    end;
end;

procedure TSP_Post_Add.PropertiesPanelResize(Sender: TObject);
begin
//  GridResize(DBGrid4);
    GridResize(PropGrid);
end;

procedure TSP_Post_Add.AddButtonClick(Sender: TObject);
var
    form: TSpForm;
    PropParams: TSpParams;
begin
    form := TSpForm.Create(Self);
    PropParams := TSpParams.Create;
    with PropParams do
    begin
        Table := 'Sp_Post_Prop';
        Title := 'Властивості посад';
        IdField := 'Id_Post_Prop';
        SpFields := 'Name_Post_Prop';
        ColumnNames := 'Властивість посади';
        InsertProcName := 'Sp_Post_Prop_Insert';
        UpdateProcName := 'Sp_Post_Prop_Update';
        DeleteProcName := 'Sp_Post_Prop_Delete';
        SelectProcName := 'Sp_Post_Prop_Select';
        SpMode := spmNormal;
    end;

    form.Init(PropParams);
    form.ShowModal;
    RebuildPropList;
    form.Free;
    PropParams.Free;
end;

procedure TSP_Post_Add.BaseSalaryViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (Key = VK_F12) and (ssShift in Shift) then
        ShowInfo(BaseSalaryView.DataController.DataSource.DataSet);
end;

procedure TSP_Post_Add.PropGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_F12) and (ssShift in Shift) then
        ShowInfo(PropGrid.DataSource.DataSet);
end;

procedure TSP_Post_Add.CategoryGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_F12) and (ssShift in Shift) then
        ShowInfo(CategoryGrid.DataSource.DataSet);
end;

procedure TSP_Post_Add.TypeGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = VK_F12) and (ssShift in Shift) then
        ShowInfo(TypeGrid.DataSource.DataSet);
end;

procedure TSP_Post_Add.ShowOldBoxClick(Sender: TObject);
begin
    BaseSalaryView.DataController.Filter.Active := not ShowOldBox.Checked;
end;

procedure TSP_Post_Add.RefreshDigitSTR;
var
    First_Date: TDate;
begin
    RxBaseSalaries.First;
    while not RxBaseSalaries.Eof do
    begin
        // Showmessage('RxBaseSalaries[Use_Digit] = ' + VarToStr(RxBaseSalaries['Use_Digit']));
        if RxBaseSalaries['Use_Digit'] = 1 then
        begin
          //  Showmessage('111111');
            DigitsData.First;
            First_Date := DigitsData['Date_Beg'];
            while not DigitsData.Eof do
            begin
                if (DigitsData['Id_Post_Base_Salary'] =
                    RxBaseSalaries['Id_Post_Base_Salary']) then
                    if ( VarIsNull(RxBaseSalaries['Ref_Base_Salary'])
                        and (DigitsData['Date_Beg'] <= Max(First_Date, RxBaseSalaries['Date_Beg']))
                        and (DigitsData['Date_End'] >= RxBaseSalaries['Date_Beg'])) then
                    begin
                        DMod.DigitSalary.Close;
                        DMod.DigitSalary.ParamByName('Num_Digit').AsInteger := DigitsData['Num_Digit'];
                        DMod.DigitSalary.ParamByName('Cur_Date').AsDate := RxBaseSalaries['Date_Beg'];
                        DMod.DigitSalary.Open;
                        RxBaseSalaries.Edit;
                        RxBaseSalaries['Digit_STR'] := IntToStr(DigitsData['Num_Digit']);
                        RxBaseSalaries['Base_Salary_Min'] := DMod.DigitSalary['Base_Salary'];
                        RxBaseSalaries['Base_Salary_Max'] := DMod.DigitSalary['Base_Salary'];
                        RxBaseSalaries['base_salary_min_text'] := DMod.DigitSalary['Base_Salary'];
                        RxBaseSalaries['base_salary_max_text'] := DMod.DigitSalary['Base_Salary'];
                        RxBaseSalaries.Post;
                      //   Showmessage('DigitsData[Id_Post_Base_Salary] = ' + VarToStr(DigitsData['Id_Post_Base_Salary']));
                      //          Showmessage('RxBaseSalaries[Date_Beg] = ' + DateToStr(RxBaseSalaries['Date_Beg']));

                    end;

                DigitsData.Next;
            end
        end
            else if RxBaseSalaries['Use_Digit'] = 2 then
                begin
                 //   Showmessage('2222222');
                    TarifData.First;
                    First_Date := TarifData['Date_Beg'];
                    while not TarifData.Eof do
                    begin
                        if (TarifData['Id_Post_Base_Salary'] =
                            RxBaseSalaries['Id_Post_Base_Salary']) then
                            if (VarIsNull(RxBaseSalaries['Ref_Base_Salary'])
                                and (TarifData['Date_Beg'] <= Max(First_Date, RxBaseSalaries['Date_Beg']))
                                and (TarifData['Date_End'] >= RxBaseSalaries['Date_Beg'])) then
                            begin
                          //      Showmessage('TarifData[Id_Post_Base_Salary] = ' + VarToStr(TarifData['Id_Post_Base_Salary']));
                          //      Showmessage('RxBaseSalaries[Date_Beg] = ' + DateToStr(RxBaseSalaries['Date_Beg']));
                                DMod.TarifSalary.Close;
                                DMod.TarifSalary.ParamByName('Id_Category_tarif').AsInteger := TarifData['Id_Category_tarif'];
                                DMod.TarifSalary.ParamByName('Cur_Date').AsDate := RxBaseSalaries['Date_Beg'];
                                DMod.TarifSalary.Open;
                                RxBaseSalaries.Edit;
                                RxBaseSalaries['Digit_STR']       := DMod.TarifSalary['Name_Tarif'];
                                RxBaseSalaries['Base_Salary_Min'] := DMod.TarifSalary['Base_Salary'];
                                RxBaseSalaries['Base_Salary_Max'] := DMod.TarifSalary['Base_Salary'];
                                RxBaseSalaries['Base_Salary_Min_Text'] := 'Тар. ' + FloatToStr(DMod.TarifSalary['Base_Salary']);
                                RxBaseSalaries['Base_Salary_Max_Text'] := 'Тар. ' + FloatToStr(DMod.TarifSalary['Base_Salary']);
                                RxBaseSalaries.Post;
                            end;

                        TarifData.Next;
                    end;
                end;
        RxBaseSalaries.Next;
    end;
end;

procedure TSP_Post_Add.GroupOpenSprav(Sender: TObject; var Value: Variant;
    var DisplayText: string);
var
    groupForm: TfmSpPostGroup;
begin
    groupForm := TfmSpPostGroup.Create(Self);
    groupForm.ActionControl.Database := DMod.FIBDatabase;
    DMod.SpGroupDS.Close;
    DMod.SpGroupDS.Open;
    groupForm.ActionControl.SelectDataSet := DMod.SpGroupDS;
    groupForm.PostGroupView.DataController.DataSource := DMod.GroupDataSource;
    groupForm.PostGroupView.DataController.CreateAllItems;
    if groupForm.ShowModal = mrOk then
    begin
        Value := DMod.SpGroupDS['Id_Post_Group'];
        DisplayText := DMod.SpGroupDS['Name_Post_Group'];
    end;
    groupForm.Free;
    IsNameCh := True;
end;

procedure TSP_Post_Add.InsertActionExecute(Sender: TObject);
begin
    if CategoryGrid.Focused then
    begin
        AddCategoryButtonClick(Sender);
    end;
    if TypeGrid.Focused then
    begin
        AddTypePostButtonClick(Sender);
    end;
    if BaseSalaryView.Focused and (PageControl1.ActivePage = TabSheet2) then
    begin
        SBAdd.Click;
    end;
    if PropGrid.Focused then SB_Add_Prop.Click;
    if HolidayGrid.Focused then SB_Add_Hol.Click;
    if PropListBox.Focused then AddButton.Click;
end;

procedure TSP_Post_Add.ModifyActionExecute(Sender: TObject);
begin
    if CategoryGrid.Focused then ModifyCategoryButtonClick(Sender);

    if BaseSalaryView.Focused and (PageControl1.ActivePage = TabSheet2) then SBModif.Click;

    if HolidayGrid.Focused then SB_Modif_Hol.Click;
end;

procedure TSP_Post_Add.DeleteActionExecute(Sender: TObject);
begin
    if CategoryGrid.Focused then
    begin
        DeleteCategoryButtonClick(Sender);
    end;
    if TypeGrid.Focused then
    begin
        DeleteTypePostButtonClick(Sender);
    end;
    if BaseSalaryView.Focused and (PageControl1.ActivePage = TabSheet2) then SBDelete.Click;
    if PropGrid.Focused then SB_Del_Prop.Click;
    if HolidayGrid.Focused then SB_Del_Hol.Click;
end;

procedure TSP_Post_Add.CategoryGridEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Категорії посади: Ins - додати, F2 - Змінити, Del - вилучити';
end;

procedure TSP_Post_Add.TypeGridEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Типи посади: Ins - додати, F2 - Змінити, Del - вилучити';
end;

procedure TSP_Post_Add.CategoryGridExit(Sender: TObject);
begin
    StatusPanel.Caption := StdStatus;
end;

procedure TSP_Post_Add.TypeGridExit(Sender: TObject);
begin
    StatusPanel.Caption := StdStatus;
end;

procedure TSP_Post_Add.CancelActionExecute(Sender: TObject);
begin
    SbCancel.Click;
end;

procedure TSP_Post_Add.BaseSalaryGridExit(Sender: TObject);
begin
    StatusPanel.Caption := STDStatus;
end;

procedure TSP_Post_Add.BaseSalaryGridEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Базові оклади: Ins - додати, F2 - Змінити, Del - вилучити, F9 - відкрити посадові оклади';
end;

procedure TSP_Post_Add.PostSalaryActionExecute(Sender: TObject);
begin
    if BaseSalaryView.Focused and (PageControl1.ActivePage = TabSheet2) then PostSalaryButton.Click;
end;

procedure TSP_Post_Add.PropGridExit(Sender: TObject);
begin
    StatusPanel.Caption := STDStatus;
end;

procedure TSP_Post_Add.PropGridEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Властивості базових окладів: Ins - додати, Del - вилучити';
end;

procedure TSP_Post_Add.HolidayGridExit(Sender: TObject);
begin
    StatusPanel.Caption := STDStatus;
end;

procedure TSP_Post_Add.HolidayGridEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Відпустки до посад: Ins - додати, F2 - Змінити, Del - вилучити';
end;

procedure TSP_Post_Add.PropListBoxExit(Sender: TObject);
begin
    StatusPanel.Caption := STDStatus;
end;

procedure TSP_Post_Add.PropListBoxEnter(Sender: TObject);
begin
    StatusPanel.Caption := 'Властивості посади: Ins - додати';
end;

procedure TSP_Post_Add.CE_NameExit(Sender: TObject);
begin
    DeleteAction.Enabled := true;
end;

procedure TSP_Post_Add.CE_CodeEnter(Sender: TObject);
begin
    DeleteAction.Enabled := False;
end;

procedure TSP_Post_Add.AddDefaultPostSalary(Id_Post_Base_Salary: Integer);
begin
    if not RxMD_Raises.Active then RxMD_Raises.Open;

    RxMD_Raises.Append;
    RxMD_Raises['name_post_salary'] := ' ';
    RxMD_Raises['id_post_base_salary'] := Id_Post_Base_Salary;
    RxMD_Raises['id_raise'] := -1;
    RxMD_Raises['pps_koef'] := 0;
    id_s := id_s - 1;
    RxMD_Raises['id_post_salary'] := id_s;
    RxMD_Raises.Post;

    IsRaiseAdd := True;
    IsOklCh := True;
end;

procedure TSP_Post_Add.AddDefaultCategory;
begin
    if not DMod.FIBDS_SPCategory.IsEmpty then
    begin
        RxMD_Cat.Open;
        RxMD_Cat.Append;
        RxMD_Cat['Id_Category'] := DMod.FIBDS_SPCategory['Id_Category'];
        RxMD_Cat['date_beg'] := DMod.Base_Date;
        RxMD_Cat['date_end'] := Infinity_Date;
        RxMD_Cat['Name_Category'] := DMod.FIBDS_SPCategory['Name_Category'];
        RxMD_Cat.Post;
        CategoryGrid.Refresh;

    end;
end;

procedure TSP_Post_Add.BaseDateChange(Sender: TObject);
begin
    DMod.Base_Date := BaseDate.Value;
end;

procedure TSP_Post_Add.Prepare;
begin
    if Add then AddDefaultCategory;

    BaseDate.Visible := Add;
    if Add then BaseDate.Value := DMod.Base_Date;
end;

end.

