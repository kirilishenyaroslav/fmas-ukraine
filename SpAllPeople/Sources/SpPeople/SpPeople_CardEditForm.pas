unit SpPeople_CardEditForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
    cxDropDownEdit, cxCalendar, cxMaskEdit, cxControls, cxContainer, cxEdit,
    cxTextEdit, cxButtonEdit, ActnList, SpPeople_Types, IBase, SpPeople_ZMessages,
    cxCheckBox, cxMemo;

type
    TfEditCard = class(TForm)
        TypeBankCardBE: TcxButtonEdit;
        NumCardME: TcxMaskEdit;
        BegDE: TcxDateEdit;
        EndDE: TcxDateEdit;
        cxLabel1: TcxLabel;
        cxLabel3: TcxLabel;
        LabelBank: TcxLabel;
        cxLabel5: TcxLabel;
        cxLabel4: TcxLabel;
        OkButton: TcxButton;
        CancelButton: TcxButton;
        ActionList1: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        ComentM: TcxMemo;
        CardCloseCB: TcxCheckBox;
        procedure CancelActionExecute(Sender: TObject);
        procedure OkActionExecute(Sender: TObject);
        procedure BankBEPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
    private
        { Private declarations }
        pDB_HANDLE: TISC_DB_HANDLE;
        FMode: TEditMode;
        function CheckData: Boolean;
    public
        { Public declarations }
        pID_TYPE_BANKCARD: Integer;
        pCardInfo: TCardRec;
        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; ACardInfo: TCardRec); reintroduce;
    end;

function GetCardInfo(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; var ACardInfo: TCardRec): Boolean;

implementation

uses DateUtils, Math;

{$R *.dfm}

function GetCardInfo(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; var ACardInfo: TCardRec): Boolean;
var
    ViewForm: TfEditCard;
begin
    Result := False;
    ViewForm := TfEditCard.Create(AOwner, ADB_Handle, AEditMode, ACardInfo);
    if ViewForm.ShowModal = mrOk then
        if (AEditMode = emNew) or (AEditMode = emModify) then
        begin
            ACardInfo.ID_TYPE_BANKCARD := ViewForm.pID_TYPE_BANKCARD;
            ACardInfo.NUM_CARD := ViewForm.NumCardME.Text;
            ACardInfo.IS_CARD_CLOSE := IfThen(ViewForm.CardCloseCB.Checked, 1, 0);
            ACardInfo.DATE_BEG := ViewForm.BegDE.Date;
            ACardInfo.DATE_END := ViewForm.EndDE.Date;
            ACardInfo.COMENT := ViewForm.ComentM.Text;
            Result := True;
        end;
    ViewForm.Free;
end;

constructor TfEditCard.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; ACardInfo: TCardRec);
begin
    inherited Create(AOwner);
    FMode := AEditMode;
    pDB_HANDLE := ADB_Handle;
    pCardInfo := ACardInfo;

    //******************************************************************************
    case FMode of
        emNew:
            begin
                Caption := 'Банківськи картки:Додати';
                pID_TYPE_BANKCARD := -1;
                BegDE.Date := Today;
                EndDE.Date := MaxDateTime;
            end;
        emModify:
            begin
                Caption := 'Банківськи картки:Редагувати';
                pID_TYPE_BANKCARD := ACardInfo.ID_TYPE_BANKCARD;
                TypeBankCardBE.Text := ACardInfo.NAME_TYPE_BANKCARD;
                NumCardME.Text := ACardInfo.NUM_CARD;
                ComentM.Text := ACardInfo.COMENT;
                if ACardInfo.IS_CARD_CLOSE = 1 then
                    CardCloseCB.Checked := True
                else
                    CardCloseCB.Checked := False;
                BegDE.Date := ACardInfo.DATE_BEG;
                EndDE.Date := ACardInfo.DATE_END;
            end;
    end;
    //******************************************************************************
end;

procedure TfEditCard.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfEditCard.OkActionExecute(Sender: TObject);
begin
    if CheckData then
        ModalResult := mrOk;
end;

procedure TfEditCard.BankBEPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
const
    Func_Name = 'ViewPeopleTypeBankCard';
const
    Bpl_Name = 'SpSpec.bpl';
const
    Error_Caption = 'Помилка';
const
    Load_Error = 'Файл пакета не найдено!!!';
var
    HandlePack: HModule;
    MDIFUNC: function(AOwner: TComponent; DB: TISC_DB_HANDLE; PZFormStyle: Byte {TZFormStyle}): Variant; stdcall;
    Res: Variant;
begin
    HandlePack := GetModuleHandle(Bpl_Name);
    if HandlePack < 32
        then
    try
        Screen.Cursor := crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Bpl_Name);
    finally
        Screen.Cursor := crDefault;
    end;

    if HandlePack > 0 then
    begin
        @MDIFUNC := GetProcAddress(HandlePack, PChar(Func_Name));
        if @MDIFUNC <> nil
            then
            Res := MDIFUNC(Self, pDB_HANDLE, 0);
    end
    else
    begin
        MessageBox(TForm(Self).Handle, PChar(Load_Error + Bpl_Name), PChar(Error_Caption), MB_OK and MB_ICONWARNING);
        Res := NULL;
    end;
    if VarIsNull(Res) then
        Exit;
    pID_TYPE_BANKCARD := Res[0];
    TypeBankCardBE.Text := Res[1];
end;

function TfEditCard.CheckData: Boolean;
begin
    CheckData := True;
    if Trim(TypeBankCardBE.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Тип картки''', mtError, [mbOk], 0);
        CheckData := False;
        TypeBankCardBE.SetFocus;
        Exit;
    end;
    if Trim(NumCardME.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Номер картки''', mtError, [mbOk], 0);
        CheckData := False;
        NumCardME.SetFocus;
        Exit;
    end;
    if Trim(BegDE.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Дата початку дїі картки''', mtError, [mbOk], 0);
        CheckData := False;
        BegDE.SetFocus;
        Exit;
    end;
    if Trim(EndDE.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Дата закінчення дїі картки''', mtError, [mbOk], 0);
        CheckData := False;
        EndDE.SetFocus;
        Exit;
    end;
    if (BegDE.Date > EndDE.Date) then
    begin
        ZShowMessage('Помилка!', 'Дата закінчення дїі картки має бути більшою за дату початку', mtError, [mbOK]);
        CheckData := False;
        BegDE.SetFocus;
    end;
end;

end.
