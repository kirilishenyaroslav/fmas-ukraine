unit PassEditUnit;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, StdCtrls,
    cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
    ExtCtrls, DB, FIBDataSet, pFIBDataSet, cxLookupEdit, IBase,
    cxDBLookupEdit, cxDBLookupComboBox, SpPeople_Types, FIBDatabase,
    pFIBDatabase, UPasVidanSprav, ActnList, FIBQuery, pFIBQuery,
    pFIBStoredProc;

type
    TfPassEdit = class(TForm)
        OkButton: TcxButton;
        CancelButton: TcxButton;
        PasportPanel: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        VidanDateEdit: TcxDateEdit;
        Label9: TLabel;
        Label8: TLabel;
        Label7: TLabel;
        Label10: TLabel;
        VidanEdit: TcxTextEdit;
        FamiliaEdit: TcxMaskEdit;
        ImyaEdit: TcxMaskEdit;
        OtchestvoEdit: TcxMaskEdit;
        RusOtchEdit: TcxMaskEdit;
        RusImyaEdit: TcxMaskEdit;
        RusFamEdit: TcxMaskEdit;
        NomerEdit: TcxMaskEdit;
        SeriaEdit: TcxMaskEdit;
        Label11: TLabel;
        PassTypeComboBox: TcxLookupComboBox;
        PassTypeDataSet: TpFIBDataSet;
        PassTypeDataSetID_PASS_TYPE: TFIBIntegerField;
        PassTypeDataSetPASS_TYPE_NAME: TFIBStringField;
        PassTypeDataSource: TDataSource;
        SelectVidanBtn: TcxButton;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        GrantPanel: TPanel;
        ActionList1: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        StoredProc: TpFIBStoredProc;
        procedure SelectVidanBtnClick(Sender: TObject);
        procedure OkActionExecute(Sender: TObject);
        procedure CancelActionExecute(Sender: TObject);
        procedure FamiliaEditKeyPress(Sender: TObject; var Key: Char);
        procedure ImyaEditKeyPress(Sender: TObject; var Key: Char);
        procedure OtchestvoEditKeyPress(Sender: TObject; var Key: Char);
        procedure RusFamEditKeyPress(Sender: TObject; var Key: Char);
        procedure RusImyaEditKeyPress(Sender: TObject; var Key: Char);
        procedure RusOtchEditKeyPress(Sender: TObject; var Key: Char);
        procedure SeriaEditKeyPress(Sender: TObject; var Key: Char);
        procedure NomerEditKeyPress(Sender: TObject; var Key: Char);
        procedure VidanDateEditKeyPress(Sender: TObject; var Key: Char);
        procedure PassTypeComboBoxKeyPress(Sender: TObject; var Key: Char);
        procedure PassTypeComboBoxPropertiesChange(Sender: TObject);
    private
        pWithOutOtchestvo: Boolean;
        LengthNomer: Integer;
        MaskNomer: string;
        function CheckData: Boolean;
        function IsFIOCorrect: Boolean;
    public
        FMode: TEditMode;
        pPassInfo: TPassRec;
        pUpdateFIO: Boolean; // Нужно  ли корректировать ФИО в случае несовпадения
        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; APassInfo: TPassRec); reintroduce;
    end;

function GetPassInfo(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; var APassInfo: TPassRec): Boolean;
// Возвращает TRUE, если изменения приняты, и в APassInfo - новые значения,
// иначе - FALSE.

implementation

uses DateUtils;

{$R *.dfm}

function GetPassInfo(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; var APassInfo: TPassRec): Boolean;
var
    ViewForm: TfPassEdit;
begin
    Result := False;
    ViewForm := TfPassEdit.Create(AOwner, ADB_Handle, AEditMode, APassInfo);
    if ViewForm.ShowModal = mrOk then
        if (AEditMode = emNew) or (AEditMode = emModify) then
        begin
            APassInfo.Familia := ViewForm.FamiliaEdit.Text;
            APassInfo.Imya := ViewForm.ImyaEdit.Text;
            APassInfo.Otchestvo := ViewForm.OtchestvoEdit.Text;
            APassInfo.RusFamilia := ViewForm.RusFamEdit.Text;
            APassInfo.RusImya := ViewForm.RusImyaEdit.Text;
            APassInfo.RusOtchestvo := ViewForm.RusOtchEdit.Text;
            APassInfo.Seria := ViewForm.SeriaEdit.Text;
            APassInfo.Number := ViewForm.NomerEdit.Text;
            APassInfo.IdPassType := ViewForm.PassTypeComboBox.EditValue;
            APassInfo.GrantDate := ViewForm.VidanDateEdit.Date;
            APassInfo.GrantedBy := ViewForm.VidanEdit.Text;
            APassInfo.UpdateFIO := ViewForm.pUpdateFIO;
            APassInfo.WithOutOtchestvo := ViewForm.pWithOutOtchestvo;
            Result := True;
        end;
    ViewForm.Free;
end;

constructor TfPassEdit.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; APassInfo: TPassRec);
begin
    inherited Create(AOwner);
    //******************************************************************************
    DB.Handle := ADB_Handle;
    FMode := AEditMode;
    //******************************************************************************
    PassTypeDataSet.Open;
    if FMode = emView then
    begin
        PasportPanel.Enabled := False;
        OkButton.Visible := False;
    end;
    LengthNomer := 6; // по умолчанию длина серии - 6 символов
    { if FMode=emModify then              // редактирование даты выдачи паспорта возможно
      begin
          VidanDateEdit.Properties.ReadOnly:=True;
      end; }
   //******************************************************************************
    case FMode of
        emNew: Caption := 'Паспортні дані:Додати';
        emModify: Caption := 'Паспортні дані:Редагувати';
        emView:
            begin
                Caption := 'Паспортні дані:Перегляд';
                PasportPanel.Enabled := False;
            end;
    end;
    //******************************************************************************
    FamiliaEdit.Text := APassInfo.Familia;
    ImyaEdit.Text := APassInfo.Imya;
    OtchestvoEdit.Text := APassInfo.Otchestvo;
    RusFamEdit.Text := APassInfo.RusFamilia;
    RusImyaEdit.Text := APassInfo.RusImya;
    RusOtchEdit.Text := APassInfo.RusOtchestvo;
    SeriaEdit.Text := APassInfo.Seria;
    NomerEdit.Text := APassInfo.Number;
    if (FMode <> emNew) then
        VidanDateEdit.Date := APassInfo.GrantDate;
    VidanEdit.Text := APassInfo.GrantedBy;
    PassTypeComboBox.EditValue := APassInfo.IdPassType;
    pWithOutOtchestvo := APassInfo.WithoutOtchestvo;
    pPassInfo := APassInfo;
end;

function TfPassEdit.IsFIOCorrect: Boolean;
var
    ViewMessageForm: TForm;
    i: integer;
begin
    Result := True;
    pUpdateFIO := False;

    StoredProc.StoredProcName := 'PEOPLE_PASS_FIO_EQUAL';
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_MAN').AsInteger := pPassInfo.ID_MAN;
    StoredProc.ParamByName('ID_PAS_DATA').AsInt64 := pPassInfo.ID_PAS_DATA;
    case FMode of
        emNew: StoredProc.ParamByName('EDIT_MODE').AsInteger := 0;
        emModify: StoredProc.ParamByName('EDIT_MODE').AsInteger := 1;
    end;

    StoredProc.ParamByName('FAMILIA').AsString := FamiliaEdit.Text;
    StoredProc.ParamByName('IMYA').AsString := ImyaEdit.Text;
    StoredProc.ParamByName('OTCHESTVO').AsString := OtchestvoEdit.Text;
    StoredProc.ExecProc;
    if StoredProc.FN('IS_EQUAL').AsInteger = 0 then
    begin
        Result := False;
        ViewMessageForm := CreateMessageDialog('Змінити ПІБ у даних фізичної особи?' + #13 +
            'Увага!!! Якщо Ви відповісте "ТАК", то у всіх вихідних документах,' + #13 +
            'де вона зустрічається, її ПІБ буде записане як:' + #13 +
            FamiliaEdit.Text + ' ' + ImyaEdit.Text + ' ' + OtchestvoEdit.Text, mtWarning, [mbYes, mbNo, mbCancel]);
        with ViewMessageForm do
        begin
            for i := 0 to ComponentCount - 1 do
                if (Components[i].ClassType = TButton) then
                begin
                    if UpperCase((Components[i] as TButton).Caption) = '&YES' then
                    begin
                        (Components[i] as TButton).Left := 70;
                        (Components[i] as TButton).Caption := 'Так';
                        (Components[i] as TButton).Width := 45;
                    end;
                    if UpperCase((Components[i] as TButton).Caption) = '&NO' then
                    begin
                        (Components[i] as TButton).Left := 120;
                        (Components[i] as TButton).Caption := 'Ні';
                        (Components[i] as TButton).Width := 45;
                    end;
                    if UpperCase((Components[i] as TButton).Caption) = 'CANCEL' then
                    begin
                        (Components[i] as TButton).Left := 170;
                        (Components[i] as TButton).Caption := 'Повернутися до редагування';
                        (Components[i] as TButton).Width := 170;
                    end;
                end;
            Caption := 'Увага';
            i := ShowModal;
            Free;
        end;
        case i of
            mrYes:
                begin
                    Result := True;
                    pUpdateFIO := True;
                end;
            mrNo:
                begin
                    Result := True;
                end;
            mrCancel:
                begin
                    Result := False;
                end;
        end;
    end;
end;

function TfPassEdit.CheckData: Boolean;
begin
    CheckData := True;
    if FamiliaEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле' + ''' Фамілія''', mtError, [mbOk], 0);
        CheckData := False;
        FamiliaEdit.SetFocus;
        Exit;
    end;

    if ImyaEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле' + ''' Ім''я''', mtError, [mbOk], 0);
        CheckData := False;
        ImyaEdit.SetFocus;
        Exit;
    end;

    if OtchestvoEdit.Text = '' then
    begin
        if not pWithOutOtchestvo then
        begin
            MessageDlg('Не задано необхіднe поле' + ''' По батькові''', mtError, [mbOk], 0);
            CheckData := False;
            OtchestvoEdit.SetFocus;
            Exit;
        end;
    end;

    if RusFamEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле' + ''' Фамилия''', mtError, [mbOk], 0);
        CheckData := False;
        RusFamEdit.SetFocus;
        Exit;
    end;

    if RusImyaEdit.Text = '' then
    begin
        MessageDlg('Не задано необхіднe поле' + ''' Имя''', mtError, [mbOk], 0);
        CheckData := False;
        RusImyaEdit.SetFocus;
        Exit;
    end;

    if RusOtchEdit.Text = '' then
    begin
        if not pWithOutOtchestvo then
        begin
            MessageDlg('Не задано необхіднe поле' + ''' Отчество''', mtError, [mbOk], 0);
            CheckData := False;
            RusOtchEdit.SetFocus;
            Exit;
        end;
    end;

    if (SeriaEdit.Text = '') and (PassTypeComboBox.EditValue = 1) then
    begin
        MessageDlg('Не задано необхіднe поле' + ''' Серія''', mtError, [mbOk], 0);
        CheckData := False;
        SeriaEdit.SetFocus;
        Exit;
    end;
    if (NomerEdit.Text = '') and (PassTypeComboBox.EditValue = 1) then
    begin
        MessageDlg('Не задано необхіднe поле' + ''' Номер''', mtError, [mbOk], 0);
        CheckData := False;
        NomerEdit.SetFocus;
        Exit;
    end;

    if (VidanEdit.Text = '') and (PassTypeComboBox.EditValue = 1) then
    begin
        MessageDlg('Не задано необхіднe поле' + ''' Ким виданий''', mtError, [mbOk], 0);
        CheckData := False;
        RusOtchEdit.SetFocus;
        Exit;
    end;

    if (Length(NomerEdit.Text) > LengthNomer) then
    begin
        MessageDlg('Номер паспорту повинен містити не більше ' + IntToStr(LengthNomer) + ' символів. Перевірте правильність введеної інформації!', mtError, [mbOk], 0);
        CheckData := False;
        NomerEdit.SetFocus;
        Exit;
    end;
end;

procedure TfPassEdit.SelectVidanBtnClick(Sender: TObject);
var
    s, pas_vidan: string;
begin
    pas_vidan := VidanEdit.Text;
    s := GetVidanPlace(Self, DB.Handle, pas_vidan);
    if s <> '' then
        VidanEdit.Text := s;
end;

procedure TfPassEdit.OkActionExecute(Sender: TObject);
begin
    if CheckData = True then
        if IsFIOCorrect then
        begin
            ModalResult := mrOk;
        end;
end;

procedure TfPassEdit.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfPassEdit.FamiliaEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        ImyaEdit.SetFocus;
end;

procedure TfPassEdit.ImyaEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        OtchestvoEdit.SetFocus;
end;

procedure TfPassEdit.OtchestvoEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        RusFamEdit.SetFocus;
end;

procedure TfPassEdit.RusFamEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        RusImyaEdit.SetFocus;
end;

procedure TfPassEdit.RusImyaEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        RusOtchEdit.SetFocus;
end;

procedure TfPassEdit.RusOtchEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        SeriaEdit.SetFocus;
end;

procedure TfPassEdit.SeriaEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        NomerEdit.SetFocus;
end;

procedure TfPassEdit.NomerEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        VidanDateEdit.SetFocus;
end;

procedure TfPassEdit.VidanDateEditKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
        PassTypeComboBox.SetFocus;
end;

procedure TfPassEdit.PassTypeComboBoxKeyPress(Sender: TObject;
    var Key: Char);
begin
    if Key = #13 then
        FamiliaEdit.SetFocus;
end;

procedure TfPassEdit.PassTypeComboBoxPropertiesChange(Sender: TObject);
begin
    //Внимание!  ID_PASS_TYPE = 6 - інший документ, значит можно в номер вводить до 10 символов,
    //не обязательно цифр
    if (PassTypeComboBox.Properties.ListSource.Dataset['ID_PASS_TYPE'] = 6) then
    begin
        LengthNomer := 10;
        MaskNomer := '.+';
    end
    else
    begin
        LengthNomer := 6;
        MaskNomer := '[0-9]+';
    end;
    NomerEdit.Properties.EditMask := MaskNomer;
end;

end.
