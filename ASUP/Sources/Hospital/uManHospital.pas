
{ -$Id: uManHospital.pas,v 1.11 2009/08/25 12:02:06 gala Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Список больничных листов"                        }
{         Отображение списка личных карточек сотрудников и соответствующих
{         больничных листов. Вызов формы для редактирования больничного листа  }

unit uManHospital;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, ExtCtrls, Buttons, Grids,
    DBGrids, uEditHosp, SpCommon, StdCtrls, Buffer, ComCtrls,
    NagScreenUnit, uCommonSp, ActnList, uFControl, uBoolControl;

type
    TfmManHospital = class(TForm)
        PCardViewQuery: TIBQuery;
        PcardsSource: TDataSource;
        HospQuery: TIBQuery;
        HospQueryID_MAN_HOSP: TIntegerField;
        HospQuerySERIA: TIBStringField;
        HospQueryNOMER: TIBStringField;
        HospQueryILNESS_NOTES: TIBStringField;
        HospQueryDATE_BEG: TDateField;
        HospQueryDATE_END: TDateField;
        HospSource: TDataSource;
        Splitter1: TSplitter;
        HospQueryVOPL: TIntegerField;
        SearchPanel: TPanel;
        Label2: TLabel;
        SearchEdit: TEdit;
        WorkQuery: TIBQuery;
        Label3: TLabel;
        HospQueryID_PARENT: TIntegerField;
        HospQueryPERCENT: TIBBCDField;
        HospQueryKOD: TIBStringField;
        HospQueryILLNESS_TYPE: TIntegerField;
        HospQueryENDING: TIntegerField;
        HospQueryPRIMARY: TStringField;
        PeoplePanel: TPanel;
        HospPanel: TPanel;
        PCardsGrid: TDBGrid;
        HospGrid: TDBGrid;
        Splitter2: TSplitter;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DetailsButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        FilterPanel: TPanel;
        CurDateLabel: TLabel;
        Label1: TLabel;
        WorkingBox: TCheckBox;
        DepartmentEdit: TEdit;
        DepartmentButton: TBitBtn;
        CurDateBox: TDateTimePicker;
        CancelButton: TSpeedButton;
        OkButton: TSpeedButton;
        BufferQuery: TIBQuery;
        Label4: TLabel;
        FioFilterBox: TCheckBox;
        FioEdit: TEdit;
    FilterButton: TBitBtn;
        actlst1: TActionList;
        act1: TAction;
    UseRusFio: TqFBoolControl;
    act2: TAction;
        procedure FormCreate(Sender: TObject);
        procedure AddButtonClick(Sender: TObject);
        procedure ModifyButtonClick(Sender: TObject);
        procedure CancelButtonClick(Sender: TObject);
        procedure DetailsButtonClick(Sender: TObject);
        procedure Splitter1Moved(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormResize(Sender: TObject);
        procedure PcardsSourceDataChange(Sender: TObject; Field: TField);
        procedure PCardsGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure SearchEditChange(Sender: TObject);
        procedure PCardsGridKeyPress(Sender: TObject; var Key: Char);
        procedure DeleteButtonClick(Sender: TObject);
        procedure PCardViewQueryAfterScroll(DataSet: TDataSet);
        procedure HospQueryENDINGGetText(Sender: TField; var Text: string;
            DisplayText: Boolean);
        procedure HospQueryCalcFields(DataSet: TDataSet);
        procedure PCardsGridCellClick(Column: TColumn);
        procedure HospGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure HospQueryAfterScroll(DataSet: TDataSet);
        procedure FormShow(Sender: TObject);
        procedure FilterPanelResize(Sender: TObject);
        procedure DateFilterClick(Sender: TObject);
        procedure DepartmentButtonClick(Sender: TObject);
        procedure WorkingBoxClick(Sender: TObject);
        procedure PCardViewQueryCalcFields(DataSet: TDataSet);
        procedure OkButtonClick(Sender: TObject);
        procedure HospGridDblClick(Sender: TObject);
        procedure FilterButtonClick(Sender: TObject);
        procedure act1Execute(Sender: TObject);
    procedure act2Execute(Sender: TObject);
    private
        UseFilter: Boolean;
        Id_Filter_Department: Integer; // подразделение, по которому фильтровать
        procedure ApplyFilter;
        procedure FocusGrid;
    public
        IDPCARD: INTEGER;
        InOpen: Boolean;
        SpHospital: TSprav;
        NewVersion: Variant;

        constructor Create(AOwner: TComponent; Sp: TSprav;
            FilterString: string; RusFIO: Boolean; NewVersion: Variant); reintroduce;
    end;

var
    fmManHospital: TfmManHospital;

implementation

{$R *.DFM}

uses uBuffer2, uHospitalMain, qFTools, Variants;

constructor TfmManHospital.Create(AOwner: TComponent; Sp: TSprav;
           FilterString: string; RusFIO: Boolean; NewVersion: Variant);
var
    where_str: String;
begin
    inherited Create(AOwner);
    Self.NewVersion := NewVersion;

    SpHospital := Sp;
    if Sp.Input['NewVersion'] then
        PCardViewQuery.SQL.Text := 'SELECT FIO, Id_PCard, TN, Familia, Imya, ' +
            'Otchestvo, Id_Man, TIN FROM PCard_List_4(:Cur_Date, ' +
            ':Only_Working, :Id_Department, :TN_Filter, :Fio_Filter, ' +
            ':Type_Post_Filter, :Id_Level, :Show_Dropped_Workers, :Rus_Filter_FIO)'
    else PCardViewQuery.SQL.Text := 'SELECT FIO, Id_PCard, TN, Familia, Imya, ' +
        'Otchestvo, Id_Man, TIN FROM PCard_List_2(:Cur_Date, ' +
            ':Only_Working, :Id_Department, :TN_Filter, :Fio_Filter, ' +
            ':Type_Post_Filter)';

    if not VarIsNull(Sp.Input['Input_Id_Pcard']) then
    begin
        where_str := ' WHERE Id_PCard = ' + IntToStr(Sp.Input['Input_Id_Pcard']);
        PCardViewQuery.SQL.Text := PCardViewQuery.SQL.Text + where_str;
    end;

    if not Sp.Input['NewVersion'] then UseRusFio.Visible := False;

    if FilterString <> '' then
    begin
        FioFilterBox.Checked := True;
        FioEdit.Text := FilterString;
    end;
    UseRusFio.Value := RusFIO;
end;

procedure TfmManHospital.FormCreate(Sender: TObject);
begin
    PCardViewQuery.Transaction := ReadTransaction;
    HospQuery.Transaction := ReadTransaction;
    WorkQuery.Transaction := BufferTransaction;

    UseFilter := False;

    Id_Filter_Department := DepNameQuery['ID_DEPARTMENT'];
    DepartmentEdit.Text := DepNameQuery['NAME_full'];
    WorkingBox.Checked := True;
    CurDateBox.Date := Date;

    UseFilter := True;
    ApplyFilter;

    if not PCardViewQuery.IsEmpty then
    begin
        IDPCARD := PCardViewQuery['ID_PCARD'];
        HospQuery.Params.ParamValues['ID_PCARD'] := IDPCARD;
        HospQuery.Close;
        HospQuery.Open;
        GridResize(HospGrid);
    end;

    CancelButton.Align := alRight;
end;

procedure TfmManHospital.ApplyFilter;
var
    NagScreen: TNagScreen;
    TN_Filter: Integer;
    FIO_Filter: String;
begin
    if not UseFilter then Exit;

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримується дані...');

    if FioFilterBox.Checked then
    begin
        try
            TN_Filter := StrToInt(FioEdit.Text);
        except
            TN_Filter := -1;
        end;

        if TN_Filter = -1 then
            Fio_Filter := FioEdit.Text;
    end
    else
    begin
        Tn_Filter := -1;
        Fio_Filter := '';
    end;

    with PCardViewQuery do
    begin
        Close;
        ParamByName('Cur_Date').AsDate := CurDateBox.Date;
        if WorkingBox.Checked then
            ParamByName('Only_Working').AsInteger := 1
        else ParamByName('Only_Working').AsInteger := 0;
        ParamByName('Id_Department').AsInteger := Id_Filter_Department;
        ParamByName('Tn_Filter').AsInteger := Tn_Filter;
        ParamByName('Fio_Filter').AsString := Fio_Filter;

        if SpHospital.Input['NewVersion'] then
            if UseRusFio.Value then ParamByName('Rus_Filter_Fio').AsInteger := 1;

        Open;
    end;
    PCardViewQuery.First;
    GridResize(PCardsGrid);

    NagScreen.Free;
    FocusGrid;
end;

procedure TfmManHospital.AddButtonClick(Sender: TObject);
var
    form: TfmEditHosp;

begin
    if not PCardViewQuery.IsEmpty then
    begin
        form := TfmEditHosp.Create(Self);
        form.ID_MAN := PCardViewQuery['ID_MAN'];
        form.IDPCARD := PCardViewQuery['ID_PCARD'];
        form.TNUM := PCardViewQuery['TN'];
//        form.TIN := PCardViewQuery['TIN'];
        form.Prepare(emNew, -1, NewVersion);
        if form.ShowModal = mrOk then
        begin
            HospQuery.Close;
            HospQuery.Open;
            GridResize(HospGrid);
        end;
    end;
end;

procedure TfmManHospital.ModifyButtonClick(Sender: TObject);
var
    form: TfmEditHosp;
    id_man_hosp: Integer;
begin

    if not HospQuery.IsEmpty then
    begin
        id_man_hosp := HospQuery['ID_MAN_HOSP'];
        form := TfmEditHosp.Create(Self);
        form.ID_MAN := PCardViewQuery['ID_MAN'];
        form.IDPCARD := PCardViewQuery['ID_PCARD'];
        form.TNUM := PCardViewQuery['TN'];
//        form.TIN := PCardViewQuery['TIN'];
        form.Prepare(emModify, HospQuery['ID_MAN_HOSP'], NewVersion);
        if form.ShowModal = mrOk then
        begin
            HospQuery.Close;
            HospQuery.Open;
            HospQuery.Locate('Id_Man_Hosp', id_man_hosp, []);
            GridResize(HospGrid);
        end;
    end;

end;

procedure TfmManHospital.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmManHospital.DetailsButtonClick(Sender: TObject);
var
    form: TfmEditHosp;
begin
    if not HospQuery.IsEmpty then
    begin
        form := TfmEditHosp.Create(Self);
        form.IDPCARD := PCardViewQuery['ID_PCARD'];
        form.Prepare(emView, HospQuery['ID_MAN_HOSP'], NewVersion);
        if form.ShowModal = mrOk then
        begin
            HospQuery.Close;
            HospQuery.Open;
            GridResize(HospGrid);
        end;
    end;
end;

procedure TfmManHospital.Splitter1Moved(Sender: TObject);
begin
    GridResize(HospGrid);
    GridResize(PCardsGrid);
{    Bevel2.Left := Splitter1.Left;
    AddButton.Left := Splitter1.Left + 5;
    ModifyButton.Left := AddButton.Left + AddButton.Width + 2;
    DetailsButton.Left := ModifyButton.Left + ModifyButton.Width + 2;
    DeleteButton.Left := DetailsButton.Left + DetailsButton.Width + 2;}
end;

procedure TfmManHospital.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        Action := caFree;
        SpHospital.Free;
    end;
end;

procedure TfmManHospital.FormResize(Sender: TObject);
begin
    OkButton.Left := OkButton.Parent.Width - OkButton.Width;

    GridResize(HospGrid);
    GridResize(PCardsGrid);
end;

procedure TfmManHospital.PcardsSourceDataChange(Sender: TObject;
    Field: TField);
begin
    HospQuery.Close;
end;

procedure TfmManHospital.PCardsGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if Key = VK_F11 then
    try
        ShowMessage('Id_PCard: ' + IntToStr(HospQuery['Id_PCard']));
    except
    end;
end;

procedure TfmManHospital.SearchEditChange(Sender: TObject);
var
    TN: Integer;
begin
    try
        TN := StrToInt(SearchEdit.Text);
    except
        TN := 0;
    end;

    PCardViewQuery.AfterScroll := nil;
    if TN <> 0 then
        PCardViewQuery.Locate('TN', SearchEdit.Text, [loPartialKey])
    else
        PCardViewQuery.Locate('FIO', SearchEdit.Text, [loPartialKey,
            loCaseInsensitive]);
    PCardViewQuery.AfterScroll := PCardViewQueryAfterScroll;
    PCardViewQueryAfterScroll(PCardViewQuery);
end;

procedure TfmManHospital.PCardsGridKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TfmManHospital.DeleteButtonClick(Sender: TObject);
var
    idpbkey: integer;
    BufTran2: TBufferTransaction2;
    First_PBKey, Last_PBKey: Integer;
begin
    if MessageDlg('Ви справді бажаєте вилучити цей лист непрацездатності?',
        mtConfirmation, [mbYes, mbNo], 0) = mrNo then Exit;
    if not HospQuery.IsEmpty then
    begin
        if WriteTransaction.InTransaction then
            WriteTransaction.Rollback;
        WriteTransaction.StartTransaction;
        try
            WorkQuery.Params.ParamValues['ID_MAN_HOSP'] := HospQuery['ID_MAN_HOSP'];
            ExecQuery(WorkQuery);

            if not DontWriteToDbf then
            begin
                BufferQuery.Transaction := WriteTransaction;
                BufferQuery.Close;
                BufferQuery.ParamByName('Id_Man_Hosp').AsInteger := HospQuery['ID_MAN_HOSP'];
                BufferQuery.Open;

                First_PBKey := BufferQuery['First_PBKey'];
                Last_PBKey := BufferQuery['Last_PBKey'];

                BufTran2 := TBufferTransaction2.
                    Create('HOSPITAL', 'BUF_HOSPITAL', WriteTransaction);
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

        HospQuery.Close;
        HospQuery.Open;
        GridResize(HospGrid);
    end;
end;

procedure TfmManHospital.PCardViewQueryAfterScroll(DataSet: TDataSet);
begin
    if InOpen then exit;

    if not PCardViewQuery.IsEmpty then
    begin
        HospQuery.Close;
        IDPCARD := PCardViewQuery['ID_PCARD'];
        HospQuery.Params.ParamValues['ID_PCARD'] := IDPCARD;
        HospQuery.Open;
        HospQueryCalcFields(HospQuery);
        GridResize(HospGrid);
    end;
end;

procedure TfmManHospital.HospQueryENDINGGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if HospQuery.IsEmpty then Exit;
    if HospQueryENDING.Value = 2 then
        Text := 'Ні (2)'
    else Text := 'Так (' + IntToStr(HospQueryENDING.Value) + ')';
end;

procedure TfmManHospital.HospQueryCalcFields(DataSet: TDataSet);
begin
    if HospQuery.IsEmpty then Exit;
    if HospQuery['Id_Parent'] <> -1 then HospQuery['Primary'] := 'Так (2)'
    else HospQuery['Primary'] := 'Ні (1)';
end;

procedure TfmManHospital.PCardsGridCellClick(Column: TColumn);
begin
    SearchEdit.Text := '';
end;

procedure TfmManHospital.HospGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_PCard: ' + IntToStr(PCardViewQuery['Id_PCard']) + '; ID_MAN_HOSPITAL : ' + IntToStr(HospQueryID_MAN_HOSP.Value));
    except
    end;
end;

procedure TfmManHospital.HospQueryAfterScroll(DataSet: TDataSet);
begin
  //  if HospQuery.Bof then
        HospQueryCalcFields(HospQuery);
end;

procedure TfmManHospital.FormShow(Sender: TObject);
begin
    if CheckAccess('/ROOT/Hosp', 'Edit') <> 0 then
    begin
        AddButton.Visible := False;
        ModifyButton.Visible := False;
        DeleteButton.Visible := False;
//        DetailsButton.Left := Bevel2.Left + 17;
    end;
end;

procedure TfmManHospital.FocusGrid;
begin
    if Visible and Enabled and PCardsGrid.Enabled and PCardsGrid.Visible then
        PCardsGrid.SetFocus;
end;

procedure TfmManHospital.FilterPanelResize(Sender: TObject);
begin
    CancelButton.Left := FilterPanel.ClientWidth - CancelButton.Width;
    FilterButton.Left := CancelButton.Left - FilterButton.Width;

    CurDateBox.Left := FilterButton.Left - CurDateBox.Width - 5;
    CurDateLabel.Left := FilterButton.Left - CurDateLabel.Width - 20;
    DepartmentButton.Left := FilterButton.Left - DepartmentButton.Width;
    DepartmentEdit.Width := FilterButton.Left - DepartmentEdit.Left;
end;

procedure TfmManHospital.DateFilterClick(Sender: TObject);
begin
    WorkingBox.Checked;
    ApplyFilter;
end;

procedure TfmManHospital.DepartmentButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(uHospitalMain.DB.Handle);
            FieldValues['Actual_Date'] := CurDateBox.Date;
            Post;
        end;

                // показать справочник и проанализировать результат (выбор одного подр.)
        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
            Id_Filter_Department := sp.Output['Id_Department'];
            DepartmentEdit.Text := sp.Output['Name_Full'];

            UseFilter := False;
            WorkingBox.Checked := True;
            UseFilter := True;
            ApplyFilter;
        end;
        sp.Free;
    end;
end;

procedure TfmManHospital.WorkingBoxClick(Sender: TObject);
begin
    ApplyFilter;
    CurDateBox.Visible := WorkingBox.Checked;
    CurDateLabel.Visible := WorkingBox.Checked;
//    DateFilter.Visible := WorkingBox.Checked;
end;

procedure TfmManHospital.PCardViewQueryCalcFields(DataSet: TDataSet);
begin
    {DataSet['FIO'] := DataSet['Familia'] + ' ' + DataSet['Imya'] + ' ' +
        DataSet['Otchestvo']; }
end;

procedure TfmManHospital.OkButtonClick(Sender: TObject);
begin
    if (HospQuery.IsEmpty) then
    begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    with SpHospital.Output do
    begin
        Append;
        FieldValues['Id_Man_Hosp'] := HospQuery['Id_Man_Hosp'];
        FieldValues['Date_Beg'] := HospQuery['Date_Beg'];
        FieldValues['Date_End'] := HospQuery['Date_End'];
        FieldValues['Seria'] := HospQuery['Seria'];
        FieldValues['Nomer'] := HospQuery['Nomer'];
        FieldValues['Id_PCard'] := PCardViewQuery['Id_PCard'];
        FieldValues['TN'] := PCardViewQuery['TN'];
        FieldValues['FIO'] := PCardViewQuery['FIO'];
        FieldValues['DisplayText'] := FieldValues['FIO'] + ', ' +
            FieldValues['Seria'] + ' №' + FieldValues['Nomer'] + ' від "' +
            DateToStr(FieldValues['Date_Beg']) + '"';
        FieldValues['Ending'] := HospQuery['Ending'];
        Post;
    end;

    ModalResult := mrOk;
end;

procedure TfmManHospital.HospGridDblClick(Sender: TObject);
begin
    if OkButton.Visible then OkButton.Click;
end;

procedure TfmManHospital.FilterButtonClick(Sender: TObject);
begin
    ApplyFilter;
end;

procedure TfmManHospital.act1Execute(Sender: TObject);
begin
    ApplyFilter;
end;

procedure TfmManHospital.act2Execute(Sender: TObject);
begin
    ApplyFilter;
end;

end.

