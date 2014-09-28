unit SpPeople_CardFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
    cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
    cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, FIBDataSet,
    pFIBDataSet, ExtCtrls, cxSplitter, Buttons, ToolWin, ComCtrls, IBase,
    cxContainer, cxCheckBox, SpPeople_z_dmCommonStyles, SpPeople_DogEditForm,
    SpPeople_Types, FIBQuery, pFIBQuery, pFIBStoredProc, SpPeople_ZMessages,
    SpPeople_CardEditForm, cxLabel, cxMemo, cxTextEdit;

type
    TframeCard = class(TFrame)
        DSetDog: TpFIBDataSet;
        DSetCard: TpFIBDataSet;
        DBFrame: TpFIBDatabase;
        ReadTransactionFrame: TpFIBTransaction;
        DSourceDog: TDataSource;
        DSourceCard: TDataSource;
        GridDogDBTableView1: TcxGridDBTableView;
        GridDogLevel1: TcxGridLevel;
        GridDog: TcxGrid;
        GridCardDBTableView1: TcxGridDBTableView;
        GridCardLevel1: TcxGridLevel;
        GridCard: TcxGrid;
        cmnSHORT_NAME_TYPE_PAYMENT: TcxGridDBColumn;
        cmnNUM_LIC_ACCAUNT: TcxGridDBColumn;
        cmnNUM_DOG: TcxGridDBColumn;
        cmnDATE_DOG: TcxGridDBColumn;
        cmnDATE_BEG: TcxGridDBColumn;
        cmnDATE_END: TcxGridDBColumn;
        cmnCONTROL_ID: TcxGridDBColumn;
        cmnIS_DOG_CLOSE: TcxGridDBColumn;
        cmnCOMENT: TcxGridDBColumn;
        PanelDog: TPanel;
        cmNUM_CARD: TcxGridDBColumn;
        cmDATE_BEG: TcxGridDBColumn;
        cmDATE_END: TcxGridDBColumn;
        cmCOMENT: TcxGridDBColumn;
        cmSHORT_NAME_TYPE_BANKCARD: TcxGridDBColumn;
        cmIS_CARD_CLOSE: TcxGridDBColumn;
        PanelCard: TPanel;
        SplitterFrame1: TcxSplitter;
        ToolBar1: TToolBar;
        AddBtn1: TSpeedButton;
        ModifyBtn1: TSpeedButton;
        DeleteBtn1: TSpeedButton;
        RefreshBtn1: TSpeedButton;
        ToolBar2: TToolBar;
        AddBtn2: TSpeedButton;
        ModifyBtn2: TSpeedButton;
        DeleteBtn2: TSpeedButton;
        RefreshBtn2: TSpeedButton;
        SelectBtn: TSpeedButton;
        OpenDogCB: TcxCheckBox;
        PanelShowAll: TPanel;
        StProc1: TpFIBStoredProc;
        WriteTransactionFrame: TpFIBTransaction;
        DSUseCardInZp: TpFIBDataSet;
        procedure RefreshBtn1Click(Sender: TObject);
        procedure RefreshBtn2Click(Sender: TObject);
        procedure AddBtn1Click(Sender: TObject);
        procedure ModifyBtn1Click(Sender: TObject);
        procedure DeleteBtn1Click(Sender: TObject);
        procedure OpenDogCBPropertiesChange(Sender: TObject);
        procedure AddBtn2Click(Sender: TObject);
        procedure ModifyBtn2Click(Sender: TObject);
        procedure DeleteBtn2Click(Sender: TObject);
        procedure WriteTransactionFrameAfterStart(Sender: TObject);
    private
        { Private declarations }

        pIdMan: Integer;
        pTIN: string;
        pStylesDM: TStylesDM;
        FMode: TEditMode;
    public
        { Public declarations }

        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; AID_MAN: Integer; ATIN: string); reintroduce;
        destructor Destroy; reintroduce;
    end;

implementation

uses StrUtils, UpKernelUnit, AllPeopleDataModule;

{$R *.dfm}

constructor TframeCard.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AEditMode: TEditMode; AID_MAN: Integer; ATIN: string);
var
    pId, counter, counter2: Integer;
    flag_use: Integer;
    str: string;
begin
    inherited Create(AOwner);
    Parent := TWinControl(AOwner);

    DBFrame.Handle := ADB_Handle;
    ReadTransactionFrame.Active := True;

    pId := -1;
    pIdMan := AID_MAN;
    pTIN := ATIN;
    RefreshBtn1Click(Self);

    {после обновления позиционируемся на карточке, которая используется в ЗП, или в Стипендии}
    if DSUseCardInZp.Active then
        DSUseCardInZp.Close;

    DSUseCardInZp.Sqls.SelectSQL.Text := 'Select * from z_get_bankcard_by_id_man(' + IntToStr(pIdMan) + ')';

    try
        DSUseCardInZp.Open;
    except on E: Exception do
            Showmessage(E.Message);
    end;

    try
        if not DSUseCardInZp.IsEmpty //точно используются карточки в ЗП/Стипендии
            then
        begin
            if not VarIsNull(DSUseCardInZp['ID_DOG_BANKCARD'])
                then
            begin
                pId := DSUseCardInZp['ID_DOG_BANKCARD'];
                DSetDog.Locate('ID_DOG_BANKCARD', pId, []);

                if VarIsNull(DSUseCardInZp['ID_SYSTEM']) then
                    flag_use := 0
                else
                    flag_use := DSUseCardInZp['ID_SYSTEM'];

                { GridDogDBTableView1.DataController.BeginLocate;
                 GridDogDBTableView1.DataController.LocateByKey(pId);
                 GridDogDBTableView1.DataController.EndLocate;
                }
                 //разворачиваем текущую ветку дерева
                GridDogDBTableView1.DataController.Groups.ChangeExpanding(GridDogDBTableView1.DataController.FocusedRowIndex, True, True);

                //позиционируемся на нужной записи (почему-то не выделена как активна, но фокусировка верна)
                GridDogDBTableView1.DataController.BeginLocate;
                GridDogDBTableView1.DataController.LocateByKey(pId);
                GridDogDBTableView1.DataController.EndLocate;

                case flag_use of
                    1: STR := 'ЗП';
                    2: str := 'ЗП та Стипендія';
                    3: Str := 'Стипендія';
                else
                    str := ' ';
                end;

            end;
        end;

    except on E: Exception do
            Showmessage(E.Message);
    end;

    //******************************************************************************
    FMode := AEditMode;
    if FMode = emView then
    begin
        AddBtn1.Enabled := False;
        ModifyBtn1.Enabled := False;
        DeleteBtn1.Enabled := False;
        AddBtn2.Enabled := False;
        ModifyBtn2.Enabled := False;
        DeleteBtn2.Enabled := False;
    end;
    //******************************************************************************
    pStylesDM := TStylesDM.Create(Self);
    GridDogDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
    GridCardDBTableView1.Styles.StyleSheet := pStylesDM.GridTableViewStyleSheetDevExpress;
    //******************************************************************************
    if not IsAccessGranted(SAP_BankCards, cEdit) then
    begin
        AddBtn1.Enabled := False;
        ModifyBtn1.Enabled := False;
        DeleteBtn1.Enabled := False;
        AddBtn2.Enabled := False;
        ModifyBtn2.Enabled := False;
        DeleteBtn2.Enabled := False;
    end;
end;

destructor TframeCard.Destroy;
begin
    ReadTransactionFrame.Active := False;
    inherited Destroy;
end;

procedure TframeCard.RefreshBtn1Click(Sender: TObject);
var
    pId, pId1: Int64;
    i: Integer;
    counter: Integer;
begin
    pId := -1;
    pId1 := -1;
    if not DSetDog.IsEmpty then
        pId := DSetDog['ID_DOG_BANKCARD'];
    if not DSetCard.IsEmpty then
        pId1 := DSetCard['ID_BANKCARD'];
    if DSetCard.Active then
        DSetCard.Close;
    if DSetDog.Active then
        DSetDog.Close;

    DSetDog.SQLs.SelectSQL.Text := 'SELECT * FROM PEOPLE_DOG_BANKCARD_SELECT('
        + IntToStr(pIdMan) + ',NULL,' + IfThen(OpenDogCB.Checked, '0', 'NULL') + ')';
    DSetCard.SQLs.SelectSQL.Text := 'SELECT * FROM PEOPLE_BANKCARD_SELECT(?ID_DOG_BANKCARD)';

    DSetDog.Open;
    DSetDog.Locate('ID_DOG_BANKCARD', pId, []);
    DSetCard.Open;
    DSetCard.Locate('ID_BANKCARD', pId1, []);
end;

procedure TframeCard.RefreshBtn2Click(Sender: TObject);
var
    pId: Int64;
begin
    pId := -1;
    if not DSetCard.IsEmpty then
        pId := DSetCard['ID_BANKCARD'];
    if DSetCard.Active then
        DSetCard.Close;
    DSetCard.SQLs.SelectSQL.Text := 'SELECT * FROM PEOPLE_BANKCARD_SELECT(?ID_DOG_BANKCARD)';
    DSetCard.Open;
    DSetCard.Locate('ID_BANKCARD', pId, []);
end;

procedure TframeCard.AddBtn1Click(Sender: TObject);
var
    DogData: TDogRec;
begin
    DogData.ID_MAN := pIdMan;
    DogData.TIN := pTIN;
    if GetDogInfo(Self, DBFrame.Handle, emNew, DogData) then
    begin
        StProc1.Transaction.StartTransaction;

        StProc1.ExecProcedure('PEOPLE_DOG_BANKCARD_ADD',
            [DogData.ID_MAN, DogData.NUM_DOG,
            DogData.DATE_DOG, DogData.DATE_BEG, DogData.DATE_END,
                DogData.COMENT, DogData.NUM_LIC_ACCAUNT, DogData.ID_TYPE_PAYMENT,
                DogData.IS_DOG_CLOSE, DogData.CONTROL_ID]);
        StProc1.Transaction.Commit;

        RefreshBtn1Click(Self);
    end;
end;

procedure TframeCard.ModifyBtn1Click(Sender: TObject);
var
    DogData: TDogRec;
begin
    if DSetDog.IsEmpty then
        Exit;
    DogData.ID_MAN := pIdMan;
    DogData.TIN := pTIN;
    DogData.ID_DOG_BANKCARD := DSetDog['ID_DOG_BANKCARD'];
    DogData.ID_TYPE_PAYMENT := DSetDog['ID_TYPE_PAYMENT'];
    DogData.FULL_NAME_TYPE_PAYMENT := DSetDog['FULL_NAME_TYPE_PAYMENT'];
    DogData.NUM_LIC_ACCAUNT := DSetDog['NUM_LIC_ACCAUNT'];
    DogData.CONTROL_ID := DSetDog['CONTROL_ID'];
    DogData.DATE_BEG := DSetDog['DATE_BEG'];
    DogData.DATE_END := DSetDog['DATE_END'];
    // ВНИМАНИЕ ЗАПЛАТКА!
    if not VarIsNull(DSetDog['DATE_DOG']) then
        DogData.DATE_DOG := DSetDog['DATE_DOG']
    else
        DogData.DATE_DOG := DogData.DATE_BEG;
    // КОНЕЦ ЗАПЛАТКИ
    DogData.NUM_DOG := DSetDog['NUM_DOG'];
    DogData.COMENT := DSetDog['COMENT'];
    DogData.IS_DOG_CLOSE := DSetDog['IS_DOG_CLOSE'];

    if GetDogInfo(Self, DBFrame.Handle, emModify, DogData) then
    begin
        StProc1.Transaction.StartTransaction;

        StProc1.ExecProcedure('PEOPLE_DOG_BANKCARD_CHANGE',
            [DSetDog['ID_DOG_BANKCARD'], DogData.ID_MAN, DogData.NUM_DOG,
            DogData.DATE_DOG, DogData.DATE_BEG, DogData.DATE_END,
                DogData.COMENT, DogData.NUM_LIC_ACCAUNT, DogData.ID_TYPE_PAYMENT,
                DogData.IS_DOG_CLOSE, DogData.CONTROL_ID]);
        StProc1.Transaction.Commit;

        RefreshBtn1Click(Self);
    end;
end;

procedure TframeCard.DeleteBtn1Click(Sender: TObject);
begin
    if DSetDog.IsEmpty then
        Exit;
    if ZShowMessage('Вилучення', 'Ви справді бажаєте вилучити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
        try
            StProc1.Transaction.StartTransaction;
            StProc1.StoredProcName := 'PEOPLE_DOG_BANKCARD_DEL';
            StProc1.Prepare;
            StProc1.ParamByName('ID_DOG_BANKCARD').AsInt64 := DSetDog['ID_DOG_BANKCARD'];
            StProc1.ExecProc;
            StProc1.Transaction.Commit;
            RefreshBtn1Click(Self);
        except
            on e: Exception do
            begin
                StProc1.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;
end;

procedure TframeCard.OpenDogCBPropertiesChange(Sender: TObject);
begin
    RefreshBtn1Click(Self);
end;

procedure TframeCard.AddBtn2Click(Sender: TObject);
var
    CardData: TCardRec;
begin
    if DSetDog.IsEmpty then
        Exit;
    CardData.ID_DOG_BANKCARD := DSetDog['ID_DOG_BANKCARD'];
    if GetCardInfo(Self, DBFrame.Handle, emNew, CardData) then
    begin
        StProc1.Transaction.StartTransaction;

        StProc1.ExecProcedure('PEOPLE_BANKCARD_ADD',
            [DSetDog['ID_DOG_BANKCARD'], CardData.NUM_CARD,
            CardData.DATE_BEG, CardData.DATE_END,
                CardData.COMENT, CardData.ID_TYPE_BANKCARD, CardData.IS_CARD_CLOSE]);
        StProc1.Transaction.Commit;

        RefreshBtn2Click(Self);
    end;
end;

procedure TframeCard.ModifyBtn2Click(Sender: TObject);
var
    CardData: TCardRec;
begin
    if DSetCard.IsEmpty then
        Exit;
    CardData.ID_DOG_BANKCARD := DSetDog['ID_DOG_BANKCARD'];
    CardData.ID_BANKCARD := DSetCard['ID_BANKCARD'];
    CardData.NUM_CARD := DSetCard['NUM_CARD'];
    CardData.DATE_BEG := DSetCard['DATE_BEG'];
    CardData.DATE_END := DSetCard['DATE_END'];
    CardData.COMENT := DSetCard['COMENT'];
    CardData.ID_TYPE_BANKCARD := DSetCard['ID_TYPE_BANKCARD'];
    CardData.NAME_TYPE_BANKCARD := DSetCard['NAME_TYPE_BANKCARD'];
    CardData.IS_CARD_CLOSE := DSetCard['IS_CARD_CLOSE'];
    if GetCardInfo(Self, DBFrame.Handle, emModify, CardData) then
    begin
        StProc1.Transaction.StartTransaction;

        StProc1.ExecProcedure('PEOPLE_BANKCARD_CHANGE',
            [DSetCard['ID_BANKCARD'], DSetDog['ID_DOG_BANKCARD'], CardData.NUM_CARD,
            CardData.DATE_BEG, CardData.DATE_END,
                CardData.COMENT, CardData.ID_TYPE_BANKCARD, CardData.IS_CARD_CLOSE]);
        StProc1.Transaction.Commit;

        RefreshBtn2Click(Self);
    end;
end;

procedure TframeCard.DeleteBtn2Click(Sender: TObject);
begin
    if DSetCard.IsEmpty then
        Exit;
    if ZShowMessage('Вилучення', 'Ви справді бажаєте вилучити запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
    begin
        try
            StProc1.Transaction.StartTransaction;
            StProc1.StoredProcName := 'PEOPLE_BANKCARD_DEL';
            StProc1.Prepare;
            StProc1.ParamByName('ID_BANKCARD').AsInteger := DSetCard['ID_BANKCARD'];
            StProc1.ExecProc;
            StProc1.Transaction.Commit;
            RefreshBtn2Click(Self);
        except
            on e: Exception do
            begin
                StProc1.Transaction.Rollback;
                ZShowMessage('Помилка', E.Message, mtError, [mbOK]);
            end;
        end;
    end;

end;

procedure TframeCard.WriteTransactionFrameAfterStart(Sender: TObject);
begin
    UpKernelUnit.StartHistory(WriteTransactionFrame);
end;

end.
