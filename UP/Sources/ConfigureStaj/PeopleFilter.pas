unit PeopleFilter;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uFControl, uLabeledFControl, uSpravControl,
    cxLookAndFeelPainters, StdCtrls, cxButtons, AllPeopleUnit, ActnList,
    cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
    cxDropDownEdit, cxCalendar, cxRadioGroup, GlobalSPR, AppStruClasses,
    cxButtonEdit, ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, DB,
    FIBDataSet, pFIBDataSet, IBASE;

type
    TfrmPeopleFilter = class(TForm)
        qfPeople: TqFSpravControl;
        cxCancel: TcxButton;
        cxOk: TcxButton;
        ActionList1: TActionList;
        ActOk: TAction;
        ActCancel: TAction;
        DateBegF: TcxDateEdit;
        DateEndF: TcxDateEdit;
        lblPeriod: TcxLabel;
        lblPeriodEnd: TcxLabel;
        RadioButPeople: TcxRadioButton;
        RadioButPrivateCards: TcxRadioButton;
        qFPrivateCard: TcxButtonEdit;
        Panel1: TPanel;
        lblPeriodBeg: TcxLabel;
        btnWorkDog: TcxButton;
        StorProc: TpFIBStoredProc;
        FilterDataSet: TpFIBDataSet;
        lblNumOrder: TcxLabel;
        lblDateOrder: TcxLabel;
        PNumOrderEdit: TcxTextEdit;
        PDateOrder: TcxDateEdit;
        procedure qfPeopleOpenSprav(Sender: TObject; var Value: Variant;
            var DisplayText: string);
        procedure ActOkExecute(Sender: TObject);
        procedure ActCancelExecute(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure RadioButPeopleClick(Sender: TObject);
        procedure RadioButPrivateCardsClick(Sender: TObject);
        procedure qFPrivateCardPropertiesButtonClick(Sender: TObject;
            AButtonIndex: Integer);
        procedure btnWorkDogClick(Sender: TObject);
    private
        KeySession: Int64;
        HAND: TISC_DB_HANDLE;
    { Private declarations }
    public
        PC: TFMASAppModule;
        function GetKeySession: Variant;
        procedure SetHandle(hnd: TISC_DB_HANDLE);
        function GetHandle: TISC_DB_HANDLE;
    { Public declarations }
    end;

var
    frmPeopleFilter: TfrmPeopleFilter;

implementation

{$R *.dfm}

uses PeopleInfo, BaseTypes, AccMgmt, pFIBDataBase, SelectStaj;

procedure TfrmPeopleFilter.SetHandle(hnd: TISC_DB_HANDLE);
begin
    Self.HAND := hnd;
end;

function TfrmPeopleFilter.GetHandle: TISC_DB_HANDLE;
begin
    Result := Self.HAND;
end;

function TfrmPeopleFilter.GetKeySession: Variant;
begin
    Result := Self.KeySession;
end;

procedure TfrmPeopleFilter.qfPeopleOpenSprav(Sender: TObject;
    var Value: Variant; var DisplayText: string);
var
    result: Variant;
begin
    try
        result := AllPeopleUnit.GetMan(Self, GetHandle, False, False);
        if (not VarIsNull(result)) and not (VarType(result) = varNull) and
            not (VarArrayDimCount(result) = 0) then
        begin
            Value := result[0];
            DisplayText := result[1];
        end;
    except on e: exception
        do begin
            agMessageDlg('Увага!', e.Message, mtInformation, [mbOK]);
        end;
    end;
end;

procedure TfrmPeopleFilter.ActOkExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfrmPeopleFilter.ActCancelExecute(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

procedure TfrmPeopleFilter.FormCreate(Sender: TObject);
var
    Year_, Month_, Day_: WORD;
begin
    DecodeDate(Date, Year_, Month_, Day_);
    DateBegF.Date := EncodeDate(Year_, 1, 1);
    DateEndF.Date := EncodeDate(9999, 12, 31);
    StorProc.StoredProcName := 'PUB_GET_ID_BY_GEN';
    StorProc.Transaction.StartTransaction;
    StorProc.Prepare;
    StorProc.ParamByName('GENERATOR_NAME').AsString := 'GEN_UP_KEY_SESION_TEMP_STAJ_ID';
    StorProc.ParamByName('STEP').AsInteger := 1;
    StorProc.ExecProc;
    Self.KeySession := StorProc.FieldByName('RET_VALUE').AsInt64;
    StorProc.Transaction.Commit;
    with TFMASAppModuleCreator.Create do
    begin
        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
        if (PC = nil)
            then agMessageDlg('Увага!', 'Помилка при роботі з модулем up_filter.bpl', mtError, [mbOk]);
    end;
   //DateBegF.Date:=Date;
   //DateEndF.Date:=Date;
    qfPeople.Block(False);
    qFPrivateCard.Enabled := False;
    btnWorkDog.Enabled := False;
end;

procedure TfrmPeopleFilter.RadioButPeopleClick(Sender: TObject);
begin
    if RadioButPeople.Checked then
    begin
        qfPeople.Block(False);
        qFPrivateCard.Enabled := False;
        btnWorkDog.Enabled := False;
    end
end;

procedure TfrmPeopleFilter.RadioButPrivateCardsClick(Sender: TObject);
begin
    if RadioButPrivateCards.Checked then
    begin
        qfPeople.Block(True);
        qFPrivateCard.Enabled := True;
        btnWorkDog.Enabled := True;
    end
end;

procedure TfrmPeopleFilter.qFPrivateCardPropertiesButtonClick(
    Sender: TObject; AButtonIndex: Integer);
var
    id_order_type, id_user: Integer;
    DHandle: TISC_DB_HANDLE;
    Text: string;
    i: Integer;
    frm: TfrmPeopleInfo;
begin
    try
        Text := '';
        id_user := GetUserId;
        DHandle := GetHandle;
        id_order_type := 0;
        PC.InParams.Items['AOwner'] := @Self;
        PC.InParams.Items['DbHandle'] := PInteger(@DHandle);
        PC.InParams.Items['Id_User'] := PInteger(@id_user);
        PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
        PC.InParams.Items['KEY_SESSION'] := PInt64(@Self.KeySession);

        (PC as IFMASTemporaryDataStorage).ClearTmpData;

        (PC as IFMASModule).Run;

        if (PInteger(PC.OutParams.Items['Count'])^) = 0
            then begin
            agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз?', mtInformation, [mbOk]);
        end;
        if (PInteger(PC.OutParams.Items['Count'])^) > 0
            then begin
            FilterDataSet.Close;
            FilterDataSet.SQLs.SelectSQL.Text := 'SELECT DISTINCT FIO FROM UP_KER_GET_FILTER_DATA_EX(:KEY_SESSION)';
            FilterDataSet.ParamByName('KEY_SESSION').AsInteger := GetKeySession;
            FilterDataSet.Open;
            FilterDataSet.FetchAll;
         {FilterDataSet.First;
         for i:=0 to FilterDataSet.RecordCount-1 do
         begin
             Text:=Text+DModule.FilterDataSet['FIO']+#13;
             DModule.FilterDataSet.Next;
         end; }

        end;
    except on e: Exception
        do begin
            showmessage(e.Message);
        end;
    end;
end;

procedure TfrmPeopleFilter.btnWorkDogClick(Sender: TObject);
var
    id_order_type, id_user: Integer;
    DHandle: TISC_DB_HANDLE;
    Text: string;
    i: Integer;
    frm: TfrmPeopleInfo;
begin
    try
        Text := 'Була сформована інформація по:' + #13;
        id_user := GetUserId;
        DHandle := GetHandle;
        id_order_type := 0;
        PC.InParams.Items['AOwner'] := @Self;
        PC.InParams.Items['DbHandle'] := PInteger(@DHandle);
        PC.InParams.Items['Id_User'] := PInteger(@id_user);
        PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
        PC.InParams.Items['KEY_SESSION'] := PInt64(@Self.KeySession);

        (PC as IFMASTemporaryDataStorage).ClearTmpData;

        (PC as IFMASModule).Run;

        if (PInteger(PC.OutParams.Items['Count'])^) = 0
            then begin
            agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз?', mtInformation, [mbOk]);
        end;
        if (PInteger(PC.OutParams.Items['Count'])^) > 0
            then begin
            FilterDataSet.Close;
            FilterDataSet.SQLs.SelectSQL.Text := 'SELECT DISTINCT FIO FROM UP_KER_GET_FILTER_DATA_EX(:KEY_SESSION) order by fio collate win1251_ua';
            FilterDataSet.ParamByName('KEY_SESSION').AsInteger := GetKeySession;
            FilterDataSet.Open;
            FilterDataSet.FetchAll;
            FilterDataSet.First;
            for i := 0 to FilterDataSet.RecordCount - 1 do
            begin
                Text := Text + FilterDataSet['FIO'] + #13;
                FilterDataSet.Next;
            end;
            agMessageDlg('Увага!', Text, mtInformation, [mbOk]);
         {frm:=TfrmPeopleInfo.Create(Self);
         frm.Caption:='Список співробітників сформований за даними фільтру!';
         frm.ShowModal;
         frm.Free; }
        end;
    except on e: Exception
        do begin
            showmessage(e.Message);
        end;
    end;
end;

end.
