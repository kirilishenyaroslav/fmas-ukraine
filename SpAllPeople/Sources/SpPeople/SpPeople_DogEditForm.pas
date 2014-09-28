unit SpPeople_DogEditForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel,
    cxDropDownEdit, cxCalendar, cxMaskEdit, cxControls, cxContainer, cxEdit,
    cxTextEdit, cxButtonEdit, ActnList, SpPeople_Types, IBase, SpPeople_ZMessages,
    cxCheckBox, cxMemo;

type
    TfEditDog = class(TForm)
        BankBE: TcxButtonEdit;
        ControlIdME: TcxMaskEdit;
        NLAME: TcxMaskEdit;
        DogDE: TcxDateEdit;
        BegDE: TcxDateEdit;
        EndDE: TcxDateEdit;
        cxLabel1: TcxLabel;
        cxLabel2: TcxLabel;
        cxLabel3: TcxLabel;
        LabelBank: TcxLabel;
        cxLabel5: TcxLabel;
        InnBtn: TcxButton;
        cxLabel4: TcxLabel;
        OkButton: TcxButton;
        CancelButton: TcxButton;
        ActionList1: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        cxLabel6: TcxLabel;
        ComentM: TcxMemo;
        DogCloseCB: TcxCheckBox;
        NumDogME: TcxMaskEdit;
        cxLabel7: TcxLabel;
        procedure InnBtnClick(Sender: TObject);
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
        pID_TYPE_PAYMENT: Integer;
        pTIN: string;
        pDogInfo: TDogRec;
        pWas_Close: Integer;
        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; ADogInfo: TDogRec); reintroduce;
    end;

function GetDogInfo(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; var ADogInfo: TDogRec): Boolean;

implementation

uses DateUtils, Math;

{$R *.dfm}

function GetDogInfo(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; var ADogInfo: TDogRec): Boolean;
var
    ViewForm: TfEditDog;
begin
    Result := False;
    ViewForm := TfEditDog.Create(AOwner, ADB_Handle, AEditMode, ADogInfo);
    if ViewForm.ShowModal = mrOk then
        if (AEditMode = emNew) or (AEditMode = emModify) then
        begin
            ADogInfo.ID_TYPE_PAYMENT := ViewForm.pID_TYPE_PAYMENT;
            ADogInfo.CONTROL_ID := ViewForm.ControlIdME.Text;
            ADogInfo.NUM_LIC_ACCAUNT := ViewForm.NLAME.Text;
            ADogInfo.IS_DOG_CLOSE := IfThen(ViewForm.DogCloseCB.Checked, 1, 0);
            if (AEditMode = emNew) then
                if ADogInfo.IS_DOG_CLOSE = 0 then
                    ViewForm.EndDE.Date := EncodeDate(9999, 12, 31)
                else
                    if Date <= ViewForm.BegDE.Date then
                        ViewForm.EndDE.Date := ViewForm.BegDE.Date
                    else
                        ViewForm.EndDE.Date := Date - 1;
            if (AEditMode = emModify) then
            begin
                if (ViewForm.pWas_Close = 1) and (ADogInfo.IS_DOG_CLOSE = 0) //открыли закрытую карточку
                    then
                    ViewForm.EndDE.Date := EncodeDate(9999, 12, 31)
                else
                    if (ViewForm.pWas_Close = 0) and (ADogInfo.IS_DOG_CLOSE = 1) //закрыли открытую карточку
                        then
                        if Date <= ViewForm.BegDE.Date then
                            ViewForm.EndDE.Date := ViewForm.BegDE.Date
                        else
                            ViewForm.EndDE.Date := Date - 1;
            end;
            ADogInfo.DATE_DOG := ViewForm.DogDE.Date;
            ADogInfo.DATE_BEG := ViewForm.BegDE.Date;
            ADogInfo.DATE_END := ViewForm.EndDE.Date;
            ADogInfo.NUM_DOG := ViewForm.NumDogME.Text;
            ADogInfo.COMENT := ViewForm.ComentM.Text;

            Result := True;
        end;
    ViewForm.Free;
end;

constructor TfEditDog.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; ADogInfo: TDogRec);
begin
    inherited Create(AOwner);
    FMode := AEditMode;
    pDB_HANDLE := ADB_Handle;
    pDogInfo := ADogInfo;

    pTIN := ADogInfo.TIN;
    //******************************************************************************
    case FMode of
        emNew:
            begin
                Caption := 'Договора:Додати';
                pID_TYPE_PAYMENT := -1;
                ControlIdME.Text := pTIN;
                if Copy(pTin, 1, 1) = '-'
                    then
                    ControlIdME.Text := '';
                DogDE.Date := Today;
                BegDE.Date := Today;
                EndDE.Date := MaxDateTime;
            end;
        emModify:
            begin
                Caption := 'Договора:Редагувати';
                pID_TYPE_PAYMENT := ADogInfo.ID_TYPE_PAYMENT;
                BankBE.Text := ADogInfo.FULL_NAME_TYPE_PAYMENT;
                NLAME.Text := ADogInfo.NUM_LIC_ACCAUNT;
                ControlIdME.Text := ADogInfo.CONTROL_ID;
                DogDE.Date := ADogInfo.DATE_DOG;
                BegDE.Date := ADogInfo.DATE_BEG;
                EndDE.Date := ADogInfo.DATE_END;
                ComentM.Text := ADogInfo.COMENT;
                NumDogME.Text := ADogInfo.NUM_DOG;
                if ADogInfo.IS_DOG_CLOSE = 1 then
                    DogCloseCB.Checked := True
                else
                    DogCloseCB.Checked := False;
                pWas_Close := ADogInfo.IS_DOG_CLOSE;
            end;
    end;
    //******************************************************************************
end;

procedure TfEditDog.InnBtnClick(Sender: TObject);
begin
    NLAME.Text := pTIN;
    if Copy(pTin, 1, 1) = '-'
        then
        exit
end;

procedure TfEditDog.CancelActionExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfEditDog.OkActionExecute(Sender: TObject);
begin
    if CheckData then
        ModalResult := mrOk;
end;

procedure TfEditDog.BankBEPropertiesButtonClick(Sender: TObject;
    AButtonIndex: Integer);
const
    Func_Viplata_Name = 'View_FZ_Viplat_Sp';
const
    Bpl_Viplata_Name = 'Zarplata\Viplata.bpl';
const
    Error_Caption = 'Помилка';
const
    Load_Error = 'Файл пакета не найдено!!!';
var
    HandlePack: HModule;
    MDIFUNC: function(AOwner: TComponent; DB: TISC_DB_HANDLE; PZFormStyle: Byte {TZFormStyle}): Variant; stdcall;
    Res: Variant;
begin
    HandlePack := GetModuleHandle(Bpl_Viplata_Name);
    if HandlePack < 32
        then
    try
        Screen.Cursor := crHourGlass;
        HandlePack := LoadPackage(ExtractFilePath(Application.ExeName) + Bpl_Viplata_Name);
    finally
        Screen.Cursor := crDefault;
    end;

    if HandlePack > 0 then
    begin
        @MDIFUNC := GetProcAddress(HandlePack, PChar(Func_Viplata_Name));
        if @MDIFUNC <> nil
            then
            Res := MDIFUNC(Self, pDB_HANDLE, 0);
    end
    else
    begin
        MessageBox(TForm(Self).Handle, PChar(Load_Error + Bpl_Viplata_Name), PChar(Error_Caption), MB_OK and MB_ICONWARNING);
        Res := NULL;
    end;
    if VarIsNull(Res) then
        Exit;
    pID_TYPE_PAYMENT := Res[0];
    BankBE.Text := Res[1];
end;

function TfEditDog.CheckData: Boolean;
begin
    CheckData := True;
    if Trim(BankBE.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Банк''', mtError, [mbOk], 0);
        CheckData := False;
        BankBE.SetFocus;
        Exit;
    end;
    if Trim(DogDE.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Дата договору''', mtError, [mbOk], 0);
        CheckData := False;
        DogDE.SetFocus;
        Exit;
    end;
    if Trim(BegDE.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Дата початку договору''', mtError, [mbOk], 0);
        CheckData := False;
        BegDE.SetFocus;
        Exit;
    end;
    if Trim(EndDE.Text) = '' then
    begin
        MessageDlg('Не задано необхіднe поле ' + '''Дата кінця договору''', mtError, [mbOk], 0);
        CheckData := False;
        EndDE.SetFocus;
        Exit;
    end;
    if (BegDE.Date > EndDE.Date) then
    begin
        ZShowMessage('Помилка!', 'Дата закінчення договору має бути більшою за дату початку', mtError, [mbOK]);
        CheckData := False;
        BegDE.SetFocus;
    end;
end;

end.
