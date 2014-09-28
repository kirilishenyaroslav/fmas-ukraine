
{ -$Id: ManHospital.pas,v 1.1 2007/01/22 14:44:04 oleg Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                     Модуль "Список больничных листов"                        }
{         Отображение списка личных карточек сотрудников и соответствующих
{         больничных листов. Вызов формы для редактирования больничного листа  }
{         Ответственный: Данил Збуривский                                      }

unit ManHospital;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBCustomDataSet, IBQuery, ExtCtrls, Buttons, Grids,
    DBGrids, EditHosp, SpCommon, PersonalCommon, StdCtrls, Buffer, ComCtrls,
    GoodFunctionsUnit, NagScreenUnit, DepartmentsViewUnit;

type
    TManHospitalForm = class(TForm)
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
        DateFilter: TBitBtn;
        CancelButton: TSpeedButton;
    PCardViewQueryID_PCARD: TIntegerField;
    PCardViewQueryTN: TIntegerField;
    PCardViewQueryFAMILIA: TIBStringField;
    PCardViewQueryIMYA: TIBStringField;
    PCardViewQueryOTCHESTVO: TIBStringField;
    PCardViewQueryID_MAN: TIntegerField;
    PCardViewQueryFIO: TStringField;
    PCardCountLabel: TLabel;
    PCardViewQueryTIN: TIBStringField;
    OkButton: TSpeedButton;
    BufferQuery: TIBQuery;
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
    private
        UseFilter: Boolean;
        Id_Filter_Department: Integer; // подразделение, по которому фильтровать
        procedure ApplyFilter;
        procedure FocusGrid;
    public
        IDPCARD: INTEGER;
        InOpen: Boolean;
    end;

var
    ManHospitalForm: TManHospitalForm;

implementation

{$R *.DFM}

uses uBuffer2;

procedure TManHospitalForm.FormCreate(Sender: TObject);
begin
    PCardViewQuery.Transaction := PersonalCommon.ReadTransaction;
    HospQuery.Transaction := PersonalCommon.ReadTransaction;
    WorkQuery.Transaction := BufferTransaction;

    UseFilter := False;

    Id_Filter_Department := Consts_Query['LOCAL_DEPARTMENT'];
    DepartmentEdit.Text := DepNameQuery['NAME_SHORT'];
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

procedure TManHospitalForm.ApplyFilter;
var
    NagScreen: TNagScreen;
begin
    if not UseFilter then Exit;

    NagScreen := TNagScreen.Create(self);
    NagScreen.Show;
    NagScreen.SetStatusText('Отримується дані...');

    with PCardViewQuery do
    begin
        Close;
        ParamByName('Cur_Date').AsDate := CurDateBox.Date;
        if WorkingBox.Checked then
            ParamByName('Only_Working').AsInteger := 1
        else ParamByName('Only_Working').AsInteger := 0;
        ParamByName('Id_Department').AsInteger := Id_Filter_Department;
        Open;
        FetchAll;
        PCardCountLabel.Caption := 'Кількість карток: ' +
            IntToStr(RecordCount);
    end;
    PCardViewQuery.First;
    GridResize(PCardsGrid);

    NagScreen.Free;
    FocusGrid;
end;

procedure TManHospitalForm.AddButtonClick(Sender: TObject);
var
    form: TEditHospForm;

begin
    if not PCardViewQuery.IsEmpty then
    begin
        form := TEditHospForm.Create(Self);
        form.ID_MAN := PCardViewQuery['ID_MAN'];
        form.IDPCARD := PCardViewQuery['ID_PCARD'];
        form.TNUM := PCardViewQuery['TN'];
//        form.TIN := PCardViewQuery['TIN'];
        form.Prepare(emNew, -1);
        if form.ShowModal = mrOk then
        begin
            HospQuery.Close;
            HospQuery.Open;
            GridResize(HospGrid);
        end;
    end;
end;

procedure TManHospitalForm.ModifyButtonClick(Sender: TObject);
var
    form: TEditHospForm;
    id_man_hosp: Integer;
begin

    if not HospQuery.IsEmpty then
    begin
        id_man_hosp := HospQuery['ID_MAN_HOSP'];
        form := TEditHospForm.Create(Self);
        form.ID_MAN := PCardViewQuery['ID_MAN'];
        form.IDPCARD := PCardViewQuery['ID_PCARD'];
        form.TNUM := PCardViewQuery['TN'];
//        form.TIN := PCardViewQuery['TIN'];
        form.Prepare(emModify, HospQuery['ID_MAN_HOSP']);
        if form.ShowModal = mrOk then
        begin
            HospQuery.Close;
            HospQuery.Open;
            HospQuery.Locate('Id_Man_Hosp', id_man_hosp, []);
            GridResize(HospGrid);
        end;
    end;

end;

procedure TManHospitalForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TManHospitalForm.DetailsButtonClick(Sender: TObject);
var
    form: TEditHospForm;

begin
    if not HospQuery.IsEmpty then
    begin
        form := TEditHospForm.Create(Self);
        form.IDPCARD := PCardViewQuery['ID_PCARD'];
        form.Prepare(emView, HospQuery['ID_MAN_HOSP']);
        if form.ShowModal = mrOk then
        begin
            HospQuery.Close;
            HospQuery.Open;
            GridResize(HospGrid);
        end;
    end;
end;

procedure TManHospitalForm.Splitter1Moved(Sender: TObject);
begin
    GridResize(HospGrid);
    GridResize(PCardsGrid);
{    Bevel2.Left := Splitter1.Left;
    AddButton.Left := Splitter1.Left + 5;
    ModifyButton.Left := AddButton.Left + AddButton.Width + 2;
    DetailsButton.Left := ModifyButton.Left + ModifyButton.Width + 2;
    DeleteButton.Left := DetailsButton.Left + DetailsButton.Width + 2;}
end;

procedure TManHospitalForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
        Action := caFree;

end;

procedure TManHospitalForm.FormResize(Sender: TObject);
begin
    OkButton.Left := OkButton.Parent.Width - OkButton.Width;

    GridResize(HospGrid);
    GridResize(PCardsGrid);
end;

procedure TManHospitalForm.PcardsSourceDataChange(Sender: TObject;
    Field: TField);
begin
    HospQuery.Close;
end;

procedure TManHospitalForm.PCardsGridKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if Key = VK_BACK then SearchEdit.Text := '';
    if Key = VK_F11 then
    try
        ShowMessage('Id_PCard: ' + IntToStr(HospQuery['Id_PCard']));
    except
    end;
end;

procedure TManHospitalForm.SearchEditChange(Sender: TObject);
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

procedure TManHospitalForm.PCardsGridKeyPress(Sender: TObject;
    var Key: Char);
begin
    if ord(Key) > 31 then
        SearchEdit.Text := SearchEdit.Text + Key;
end;

procedure TManHospitalForm.DeleteButtonClick(Sender: TObject);
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
                    Create('HOSPITAL','BUF_HOSPITAL', WriteTransaction);
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

procedure TManHospitalForm.PCardViewQueryAfterScroll(DataSet: TDataSet);
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

procedure TManHospitalForm.HospQueryENDINGGetText(Sender: TField;
    var Text: string; DisplayText: Boolean);
begin
    if HospQuery.IsEmpty then Exit;
    if HospQueryENDING.Value = 2 then
        Text := 'Ні (2)'
    else Text := 'Так (' + IntToStr(HospQueryENDING.Value) + ')';
end;

procedure TManHospitalForm.HospQueryCalcFields(DataSet: TDataSet);
begin
    if HospQuery.IsEmpty then Exit;
    if HospQuery['Id_Parent'] <> -1 then HospQuery['Primary'] := 'Так (2)'
    else HospQuery['Primary'] := 'Ні (1)';
end;

procedure TManHospitalForm.PCardsGridCellClick(Column: TColumn);
begin
    SearchEdit.Text := '';
end;

procedure TManHospitalForm.HospGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if (Key = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_PCard: ' + IntToStr(PCardViewQuery['Id_PCard']) + '; ID_MAN_HOSPITAL : ' + IntToStr(HospQueryID_MAN_HOSP.Value));
    except
    end;
end;

procedure TManHospitalForm.HospQueryAfterScroll(DataSet: TDataSet);
begin
    if HospQuery.Bof then
        HospQueryCalcFields(HospQuery);
end;

procedure TManHospitalForm.FormShow(Sender: TObject);
begin
    if CheckAccess('/ROOT/Hosp', 'Edit') <> 0 then
    begin
        AddButton.Visible := False;
        ModifyButton.Visible := False;
        DeleteButton.Visible := False;
//        DetailsButton.Left := Bevel2.Left + 17;
    end;
end;

procedure TManHospitalForm.FocusGrid;
begin
    if Visible and Enabled and PCardsGrid.Enabled and PCardsGrid.Visible then
        PCardsGrid.SetFocus;
end;

procedure TManHospitalForm.FilterPanelResize(Sender: TObject);
begin
    CancelButton.Left := FilterPanel.ClientWidth - CancelButton.Width;
    
    DateFilter.Left := CancelButton.Left - DateFilter.Width - 5;
    CurDateBox.Left := DateFilter.Left - CurDateBox.Width - 5;
    CurDateLabel.Left := CurDateBox.Left - CurDateLabel.Width - 20;
    DepartmentButton.Left := CancelButton.Left - DepartmentButton.Width;
    DepartmentEdit.Width := CancelButton.Left - DepartmentEdit.Left;
end;

procedure TManHospitalForm.DateFilterClick(Sender: TObject);
begin
    WorkingBox.Checked;
    ApplyFilter;
end;

procedure TManHospitalForm.DepartmentButtonClick(Sender: TObject);
var
    form: TDepartmentsViewForm;
begin
    form := TDepartmentsViewForm.Create(Self);
    form.Buhg := False;
    form.Prepare(True, Date);
    form.CanSelectRoot := True;
    if form.ShowModal = mrOk then
        with form do
        begin
            Id_Filter_Department := Selected_Id;
            if Id_Filter_Department = -1 then
                DepartmentEdit.Text := Consts_Query['Firm_Name']
            else DepartmentEdit.Text := ResultQuery['Name_Short'];

            UseFilter := False;
            WorkingBox.Checked := True;
            UseFilter := True;
            ApplyFilter;
        end;
    form.Free;
end;

procedure TManHospitalForm.WorkingBoxClick(Sender: TObject);
begin
    ApplyFilter;
    CurDateBox.Visible := WorkingBox.Checked;
    CurDateLabel.Visible := WorkingBox.Checked;
    DateFilter.Visible := WorkingBox.Checked;
end;

procedure TManHospitalForm.PCardViewQueryCalcFields(DataSet: TDataSet);
begin
    DataSet['FIO'] := DataSet['Familia'] + ' ' + DataSet['Imya'] + ' ' +
        DataSet['Otchestvo'];
end;

procedure TManHospitalForm.OkButtonClick(Sender: TObject);
begin
    if (HospQuery.IsEmpty) then begin
        ErrMsg('Немає записів!');
        exit;
    end;

    ModalResult := mrOk;
end;

procedure TManHospitalForm.HospGridDblClick(Sender: TObject);
begin
    if OkButton.Visible then OkButton.Click;
end;

end.

