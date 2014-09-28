{-$Id: OrdersEditUnit.pas,v 1.4 2009/12/01 08:58:08 mzagurskaya Exp $}
{******************************************************************************}
{               Автоматизированная система управления персоналом               }

{               (c) Донецкий национальный университет, 2002-2004               }
{******************************************************************************}

{                       Модуль "Редактирование "шапки" приказа"                        }
{    Ввод первичной информации по приказу, а также редактирование списка подписывающих }
{    Ответственный: Кропов Валентин                                                    }

unit OrdersEditUnit;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls, Buttons, SpComboBox, Db, IBCustomDataSet, IBQuery, Grids,
    DBGrids, IBDatabase, ExtCtrls, DBCtrls, EditControl, PersonalCommon,
    SpCommon, ComCtrls, GoodfunctionsUnit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
    TOrdersEditForm = class(TForm)
        OutputQuery: TIBQuery;
        InputQueryActions: TIBQuery;
        ActionDataSource: TDataSource;
        InputQuerySign: TIBQuery;
        InputQuerySignID_ORDER: TIntegerField;
        InputQuerySignID_PCARD: TIntegerField;
        InputQuerySignID_STATUS: TIntegerField;
        InputQuerySignNAME_STATUS: TStringField;
        InputQuerySignCARD_NUMBER: TIntegerField;
        InputQuerySignID_MAN: TIntegerField;
        InputQuerySignTN: TIntegerField;
        InputQuerySignFAMILIA: TStringField;
        InputQuerySignIMYA: TStringField;
        InputQuerySignOTCHESTVO: TStringField;
        SignDataSource: TDataSource;
        OutputOrderQuery: TIBQuery;
        OutputOrderQueryNEW_ID_ORDER: TIntegerField;
        WorkQuery: TIBQuery;
        WorkQuerySTANDART_ACTION: TIntegerField;
        InputQuery: TIBQuery;
        InputQueryID_ORDER: TIntegerField;
        InputQueryID_ORDER_TYPE: TIntegerField;
        InputQueryNUM_ORDER: TIBStringField;
        InputQueryDATE_ORDER: TDateField;
        InputQueryNOTE: TIBStringField;
        InputQueryID_STATUS: TIntegerField;
        InputQueryEXEC_DATETIME: TDateTimeField;
        PaperSignersQuery: TIBQuery;
        PaperSignersDataSource: TDataSource;
        VizaQuery: TIBQuery;
        VizaDataSource: TDataSource;
        KnowQuery: TIBQuery;
        KnowDataSource: TDataSource;
        AgreeQuery: TIBQuery;
        AgreeDataSource: TDataSource;
        InputQueryPRINT_NAME: TIBStringField;
        InputQueryINTRO: TIBStringField;
        PaperSignersQueryFIO: TIBStringField;
        PaperSignersQueryPOST: TIBStringField;
        PaperSignersQueryID_ORDER: TIntegerField;
        VizaQueryID_ORDER_VIZA: TIntegerField;
        VizaQueryFIO: TIBStringField;
        KnowQueryID_ORDER_KNOW: TIntegerField;
        KnowQueryFIO: TIBStringField;
        AgreeQueryID_ORDER_AGREE: TIntegerField;
        AgreeQueryFIO: TIBStringField;
        InputQueryActionsID_ADDITIONAL_ACTION: TIntegerField;
        InputQueryISPOLNITEL: TIBStringField;
        InputQueryActionsPORYADOK: TIBStringField;
        OrderEditPageControl: TPageControl;
        HeaderSheet: TTabSheet;
        SubmitPaperSheet: TTabSheet;
        TabSheet3: TTabSheet;
        TabSheet4: TTabSheet;
        OrderPanel: TPanel;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label7: TLabel;
        Label12: TLabel;
        Label13: TLabel;
        Label14: TLabel;
        NoteEdit: TEdit;
        NumberEdit: TEdit;
        SetButton: TBitBtn;
        OrderDate: TDateTimePicker;
        PrintNameEdit: TEdit;
        IntroMemo: TMemo;
        IspolnitelEdit: TEdit;
        ExistPrintNameButton: TButton;
        ExistIspolnitelButton: TButton;
        ExistIntroButton: TButton;
        SpeedButton1: TBitBtn;
        CancelButton: TBitBtn;
        TabSheet1: TTabSheet;
        TabSheet2: TTabSheet;
        TabSheet5: TTabSheet;
        Panel2: TPanel;
        AddPaperSignerButton: TSpeedButton;
        DeletePaperSignerButton: TSpeedButton;
        DBGrid6: TDBGrid;
        Panel1: TPanel;
        AddSignButton: TSpeedButton;
        ModifySignButton: TSpeedButton;
        DeleteSignButton: TSpeedButton;
        DBGrid2: TDBGrid;
        Panel6: TPanel;
        Label6: TLabel;
        NAME_STATUS_LABEL: TDBText;
        Panel3: TPanel;
        AddItemButton: TSpeedButton;
        ModifyItemButton: TSpeedButton;
        DeleteItemButton: TSpeedButton;
        DBGrid1: TDBGrid;
        Panel5: TPanel;
        AddVizaButton: TSpeedButton;
        ModifyVizaButton: TSpeedButton;
        DeleteVizaButton: TSpeedButton;
        AddExistViza: TSpeedButton;
        DBGrid4: TDBGrid;
        Panel4: TPanel;
        AddKnowButton: TSpeedButton;
        ModifyKnowButton: TSpeedButton;
        DeleteKnowButton: TSpeedButton;
        AddExistKnow: TSpeedButton;
        DBGrid3: TDBGrid;
        Panel7: TPanel;
        AddAgreeButton: TSpeedButton;
        ModifyAgreeButton: TSpeedButton;
        DeleteAgreeButton: TSpeedButton;
        AddExistAgree: TSpeedButton;
        DBGrid5: TDBGrid;
        Label4: TLabel;
        OwnerFio: TLabel;
        ChangeOwnerButton: TBitBtn;
        InputQueryOWNER_ID_PCARD: TIntegerField;
        InputQueryActionsTEXT: TIBStringField;
        ToZpCheckBox: TCheckBox;
        InputQueryZ_SHOW_IN_ZP: TIBStringField;
        CBTypeOrders: TcxLookupComboBox;
        procedure RefreshQuerys;
        procedure PrepareForm;
        procedure ClearForm;
        function CheckData: Boolean;
        procedure SetButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormResize(Sender: TObject);
        procedure DBGrid1DblClick(Sender: TObject);
        procedure DBGrid2KeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure DBGrid1KeyUp(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure AddSignButtonClick(Sender: TObject);
        procedure ModifySignButtonClick(Sender: TObject);
        procedure DeleteSignButtonClick(Sender: TObject);
        procedure DeleteItemButtonClick(Sender: TObject);
        function CheckAction(aID_ORDER: integer; aID_ORDER_TYPE: integer; aID_ACTION: integer; aNUM_ITEM: integer; EditMode: TEditMode): Boolean; // True / False
        procedure FModeToNull;
        procedure SpeedButton1Click(Sender: TObject);
        procedure ChangeButtonsState(aState: Boolean);
        procedure SpTypeComboBoxChange(Sender: TObject);
        procedure AddPaperSignerButtonClick(Sender: TObject);
        procedure PaperSignersQueryAfterOpen(DataSet: TDataSet);
        procedure DeletePaperSignerButtonClick(Sender: TObject);
        procedure AddVizaButtonClick(Sender: TObject);
        procedure DeleteVizaButtonClick(Sender: TObject);
        procedure ModifyVizaButtonClick(Sender: TObject);
        procedure AddKnowButtonClick(Sender: TObject);
        procedure ModifyKnowButtonClick(Sender: TObject);
        procedure DeleteKnowButtonClick(Sender: TObject);
        procedure AddAgreeButtonClick(Sender: TObject);
        procedure ModifyAgreeButtonClick(Sender: TObject);
        procedure DeleteAgreeButtonClick(Sender: TObject);
        procedure AddItemButtonClick(Sender: TObject);
        procedure ModifyItemButtonClick(Sender: TObject);
        procedure AddExistVizaClick(Sender: TObject);
        procedure AddExistKnowClick(Sender: TObject);
        procedure AddExistAgreeClick(Sender: TObject);
        procedure ExistPrintNameButtonClick(Sender: TObject);
        procedure ExistIntroButtonClick(Sender: TObject);
        procedure ExistIspolnitelButtonClick(Sender: TObject);
        procedure FormKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure ChangeOwnerButtonClick(Sender: TObject);
    procedure CBTypeOrdersPropertiesChange(Sender: TObject);
    procedure CBTypeOrdersPropertiesCloseUp(Sender: TObject);
    procedure CBTypeOrdersPropertiesEditValueChanged(Sender: TObject);
    private

    public
        FMode: Integer;
        ID_ORDER_TYPE: Integer;
        ID_ORDER: Integer;
        NUM_ORDER: string;
        NOTE: string;
        NAME_TYPE: string;
        PrintName: string;
        Intro: string;
        Ispolnitel: string;
        DATE_ORDER: TDate;
        ID_STATUS: Integer;
        CanEdit: Boolean;
        Is_Modified: Boolean;
        Owner_Id_PCard: Integer;
    end;

var
    OrdersEditForm: TOrdersEditForm;


implementation
uses PremiaOrderUnit, ChangeManBonusUnit, ManHolidayUnit, ToDoListUnit,
    ManPrivRemoveUnit, PrivUnit, ManBonusRemoveUnit, ManBonus, MoveManUnit,
    ManPunishingRemoveUnit, ManAwardUnit, ManPunishingUnit, DismissManUnit,
    PCardsViewUnit, MAinUnit, AcceptToWorkUnit,
    DikretHollidayOrderUnit, ManComandUnit,
    AddPaperSignerUnit, AddAdditionalActionsUnit, SpFormUnit, TextShablonsUnit,
    IncreaseOrderUnit, ManWorkModeChangeUnit, AccMGMT;
{$R *.DFM}

procedure TOrdersEditForm.ChangeButtonsState(aState: Boolean);
begin
    AddItemButton.Enabled := aState;
    ModifyItemButton.Enabled := aState;
    DeleteItemButton.Enabled := aState;

    AddSignButton.Enabled := aState;
    ModifySignButton.Enabled := aState;
    DeleteSignButton.Enabled := aState;

    AddPaperSignerButton.Enabled := aState;
    DeletePaperSignerButton.Enabled := aState;

    AddVizaButton.Enabled := aState;
    ModifyVizaButton.Enabled := aState;
    DeleteVizaButton.Enabled := aState;

    AddKnowButton.Enabled := aState;
    ModifyKnowButton.Enabled := aState;
    DeleteKnowButton.Enabled := aState;

    AddAgreeButton.Enabled := aState;
    ModifyAgreeButton.Enabled := aState;
    DeleteAgreeButton.Enabled := aState;

    AddExistViza.Enabled := aState;
    AddExistKnow.Enabled := aState;
    AddExistAgree.Enabled := aState;



    SpeedButton1.Enabled := (FMode <> 0);
end;

procedure TOrdersEditForm.FModeToNull;
begin
    FMode := 0;
    ID_STATUS := 0;
    ID_ORDER  := -1;
    NUM_ORDER := '';
    OrderDate.Date   := Date;
    Owner_Id_Pcard   := -1;
    OwnerFio.Caption := '---';

    if FMode = 0 then
    begin
        ChangeButtonsState(False);
    end;

    InputQuerySign.Close;
    InputQueryActions.Close;
end;

procedure TOrdersEditForm.ClearForm;
begin
    Caption := 'Створення нового наказу';
    //SpTypeComboBox.Prepare(-1, '');
    CBTypeOrders.Clear;
    CBTypeOrders.EditValue := -1;
    NumberEdit.Text := '';
    NoteEdit.Text   := '';
    OrderDate.Date  := Date;

    PrintNameEdit.Text := '';
    IntroMemo.Text     := '';
    IspolnitelEdit.Text := '';

    ID_ORDER := -1;
    ID_ORDER_TYPE := -1;

    SpeedButton1.Enabled := False;

    //Пока не добавят приказ, делаем недоступными все кнопки добавлени/изменения/удаления пунктов и подписывающих
    ChangeButtonsState(False);
end;

function TOrdersEditForm.CheckAction(aID_ORDER: integer; aID_ORDER_TYPE: integer; aID_ACTION: integer; aNUM_ITEM: integer; EditMode: TEditMode): Boolean; // True / False
var
    Z_SHOW_IN_ZP: Char;
begin
    CheckAction := GoodFunctionsUnit.ShowOrder(aID_ORDER,
        aID_ORDER_TYPE,
        aNUM_ITEM,
        EditMode,
        OutputQuery,
        Self,
        Date_Order,
        ID_ORDER,
        NUM_ORDER,
        NOTE);

    // Записываем печатное имя приказа и преамбулу

    if ToZpCheckBox.Checked then
        Z_SHOW_IN_ZP := 'T'
    else
        Z_SHOW_IN_ZP := 'F';

    if (id_order <> -1) then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'UPDATE ORDERS SET PRINT_NAME = ' + QuotedStr(PrintNameEdit.Text) +
            ', INTRO = ' + QuotedStr(IntroMemo.Text) +
            ', ISPOLNITEL = ' + QuotedStr(IspolnitelEdit.Text) +
            ', Z_SHOW_IN_ZP = ' + QuotedStr(Z_SHOW_IN_ZP) +
            ' WHERE ID_ORDER = ' + IntToStr(ID_ORDER);
        ExecQuery(OutputQuery);
    end;
end;

procedure TOrdersEditForm.RefreshQuerys;
begin

    InputQuerySign.Close;
    InputQuerySign.SQL.TEXT := 'SELECT * FROM GET_ORDER_SIGNS(' + IntToStr(ID_ORDER) + ');';
    InputQuerySign.Open;
  // Проверяем, если у приказа STANDART_ACTION = 0, то не даем редактировать пункты приказа

    WorkQuery.Close;
    WorkQuery.SQL.TEXT := 'SELECT STANDART_ACTION FROM ORDER_TYPE OT WHERE OT.ID_ORDER_TYPE = ' + IntToStr(ID_ORDER_TYPE);
    WorkQuery.Open;

    WorkQuery.Close;

    if ID_ORDER <> -1 then
    begin
        PaperSignersQuery.Close;
        PaperSignersQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        PaperSignersQuery.Open;

        VizaQuery.Close;
        VizaQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        VizaQuery.Open;

        KnowQuery.Close;
        KnowQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        KnowQuery.Open;

        AgreeQuery.Close;
        AgreeQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        AgreeQuery.Open;

        InputQueryActions.Close;
        InputQueryActions.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        InputQueryActions.Open;

        InputQuery.Close;
        InputQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
        InputQuery.Open;

        Owner_Id_PCard := InputQueryOWNER_ID_PCARD.Value;
        OwnerFio.Caption := GetManFio(Owner_Id_PCard);

    //ToZpCheckBox.Checked := (InputQueryZ_SHOW_IN_ZP.Value = 'T');
    end;

end;

function TOrdersEditForm.CheckData: boolean;
begin
    result := True;
  //  if (SpTypeComboBox.GetId = -1) then
    if (CBTypeOrders.EditValue = -1) then
    begin
        result := False;
        MessageDlg('Виберіть тип наказу', mtError, [mbOk], 0);
        Exit;
    end;
    if (NumberEdit.Text = '') then
    begin
        result := False;
        MessageDlg('Введіть номер наказу', mtError, [mbOk], 0);
        Exit;
    end;
    if (NoteEdit.Text = '') then
    begin
        result := False;
        MessageDlg('Введіть короткий зміст наказу', mtError, [mbOk], 0);
        Exit;
    end;
end;

procedure TOrdersEditForm.PrepareForm;
begin
   // Получаем основные данные о приказе
    InputQuery.Close;
    InputQuery.Params.ParamValues['ID_ORDER'] := ID_ORDER;
    InputQuery.Open;

    ID_ORDER_TYPE := InputQueryID_ORDER_TYPE.Value;
    ID_STATUS := InputQueryID_STATUS.Value;
    NUM_ORDER := InputQueryNUM_ORDER.Value;
    NOTE := InputQueryNOTE.Value;
    OrderDate.Date := InputQueryDATE_ORDER.Value;

    PrintName := InputQueryPRINT_NAME.Value;
    Intro := InputQueryINTRO.Value;
    Ispolnitel := InputQueryIspolnitel.Value;

    Owner_Id_PCard := InputQueryOWNER_ID_PCARD.Value;
    OwnerFio.Caption := GetManFio(Owner_Id_PCard);

    ToZpCheckBox.Checked := (InputQueryZ_SHOW_IN_ZP.Value = 'T');

    InputQuery.Close;
   //
    Caption := 'Редагування наказу №' + NUM_ORDER;
    NumberEdit.Text := NUM_ORDER;
    NoteEdit.Text := NOTE;
   // SpTypeComboBox.Prepare(ID_ORDER_TYPE, NAME_TYPE);
    CBTypeOrders.EditValue := ID_ORDER_TYPE;
    DATE_ORDER := OrderDate.Date;

    PrintNameEdit.Text := PrintName;
    IntroMemo.Text := Intro;
    IspolnitelEdit.Text := Ispolnitel;

   //В зависимости от состояния приказа, даем или не даем редактировать приказ
    if not CanEdit then
    begin
        NumberEdit.Enabled := False;
        NoteEdit.Enabled   := False;
        OrderDate.Enabled  := False;
        SetButton.Enabled  := False;
        IntroMemo.Enabled  := False;
        IspolnitelEdit.Enabled := False;
        //SpTypeComboBox.Enabled := False;
        CBTypeOrders.Enabled   := False;
        PrintNameEdit.Enabled  := False;
        Caption := 'Перегляд наказу №' + NUM_ORDER;
    end;


    if (ID_STATUS <> 1) then
    begin
        AddItemButton.Enabled := False;
        ModifyItemButton.Enabled := False;
        DeleteItemButton.Enabled := False;

        if (FMode <> 2) then
        begin
            ChangeButtonsState(False);
        end;

        NoteEdit.Enabled := False;
        OrderDate.Enabled := False;
        SetButton.Enabled := False;
        IntroMemo.Enabled := False;
        NumberEdit.Enabled := False;
        IspolnitelEdit.Enabled := False;
        PrintNameEdit.Enabled := False;
        //SpTypeComboBox.Enabled := False;
        CBTypeOrders.Enabled   := False;
        Caption := 'Перегляд наказу №' + NUM_ORDER;
    end;
   // Не давать изменять тип приказа на редактировании
  //SpTypeComboBox.Enabled :=  ID_ORDER <= 0;
    RefreshQuerys;
    if not CanEdit then
        ChangeButtonsState(False);
end;

procedure TOrdersEditForm.SetButtonClick(Sender: TObject);
var
    old_id_order_type: integer;
    Z_SHOW_IN_ZP: Char;
begin

    if (CheckData = True) then
    begin
        if (FMode = 0) then
        begin

          //ID_ORDER_TYPE := SpTypeComboBox.GetId;
            ID_ORDER_TYPE := CBTypeOrders.EditValue;
            Date_Order := OrderDate.Date;
            NUM_ORDER := NumberEdit.Text;
            Note := NoteEdit.Text;

            PrintName := PrintNAmeEdit.Text;
            Intro := IntroMemo.Text;
            Ispolnitel := IspolnitelEdit.Text;

            FMode := 1;
            ID_STATUS := 1;
      // Показываем скрытые ранее кнопки
            if CanEdit then
                ChangeButtonsState(True)
            else
                ChangeButtonsState(False);


            WorkQuery.Close;
            WorkQuery.SQL.TEXT := 'SELECT STANDART_ACTION FROM ORDER_TYPE OT WHERE OT.ID_ORDER_TYPE = ' + IntToStr(ID_ORDER_TYPE);
            WorkQuery.Open;

            if not CheckAction(ID_ORDER, ID_ORDER_TYPE, WorkQuerySTANDART_ACTION.Value, 1, emNew) then
            begin
                FModeToNull;
            end else
                RefreshQuerys;
            exit;
        end;

        if (FMode = 1) then
        begin

            old_id_order_type := id_order_type;

            //  if (id_order_type <> SpTypeComboBox.GetId) then
            if (id_order_type <> CBTypeOrders.EditValue) then
            begin
        // Удаляем информацию приказа (мувинги и т.д.) но сам приказ не удаляем
                OutputQuery.Close;
                OutputQuery.SQL.TEXT := 'EXECUTE PROCEDURE DELETE_ORDER(' + IntToStr(ID_ORDER) + ',0);';
                ExecQuery(OutputQuery);
                ID_ORDER := -1;
            end
            else
                if (ID_ORDER <> -1) then
                begin
                    OutputQuery.Close;
                    OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER(' + IntToStr(ID_ORDER) + ',' + IntToStr(CBTypeOrders.EditValue) + ',' + QuotedStr(NumberEdit.Text) + ',''' + DateToStr(OrderDate.Date) + ''',' + QuotedStr(NoteEdit.Text) + ',' + IntToStr(1) + ');';
                    ExecQuery(OutputQuery);

                  // Записываем печатное имя приказа и преамбулу
                    if (id_order <> -1) then
                    begin

                        if ToZpCheckBox.Checked then
                            Z_SHOW_IN_ZP := 'T'
                        else
                            Z_SHOW_IN_ZP := 'F';

                        OutputQuery.Close;
                        OutputQuery.SQL.Text := 'UPDATE ORDERS SET PRINT_NAME = ' + QuotedStr(PrintNameEdit.Text) +
                            ', INTRO = ' + QuotedStr(IntroMemo.Text) +
                            ', ISPOLNITEL = ' + QuotedStr(IspolnitelEdit.Text) +
                            ', Z_SHOW_IN_ZP = ' + QuotedStr(Z_SHOW_IN_ZP) +
                            ' WHERE ID_ORDER = ' + IntToStr(ID_ORDER);
                        ExecQuery(OutputQuery);
                    end;
                end;

                //ID_ORDER_TYPE := SpTypeComboBox.GetId;
                ID_ORDER_TYPE := CBTypeOrders.EditValue;
                ID_STATUS := 1;
                Date_Order := OrderDate.Date;
                Note := NoteEdit.Text;
                NUM_ORDER := NumberEdit.Text;

                PrintName := PrintNAmeEdit.Text;
                Intro := IntroMemo.Text;
                Ispolnitel := IspolnitelEdit.Text;

                WorkQuery.Close;
                WorkQuery.SQL.TEXT := 'SELECT STANDART_ACTION FROM ORDER_TYPE OT WHERE OT.ID_ORDER_TYPE = ' + IntToStr(ID_ORDER_TYPE);
                WorkQuery.Open;

                if old_id_order_type <> ID_ORDER_TYPE then
                begin
                    if not CheckAction(ID_ORDER, ID_ORDER_TYPE, WorkQuerySTANDART_ACTION.Value, 1, emNew)
                        then FModeToNull
                    else RefreshQuerys;
                end;

        end;
    end;
end;

procedure TOrdersEditForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
  //  SpTypeComboBox.SaveIntoRegistry;
    if FormStyle = fsMDIChild then
        Action := caFree;
end;

procedure TOrdersEditForm.FormCreate(Sender: TObject);
begin
   //LogOn;
    InputQuery.Transaction := PersonalCommon.ReadTransaction;
    InputQueryActions.Transaction := PersonalCommon.ReadTransaction;
    InputQuerySign.Transaction := PersonalCommon.ReadTransaction;
    OutputQuery.Transaction := PersonalCommon.WriteTransaction;
    OutputOrderQuery.Transaction := PersonalCommon.WriteTransaction;
    WorkQuery.Transaction := PersonalCommon.ReadTransaction;

    VizaQuery.Transaction := PersonalCommon.ReadTransaction;
    KnowQuery.Transaction := PersonalCommon.ReadTransaction;
    AgreeQuery.Transaction := PersonalCommon.ReadTransaction;
    PaperSignersQuery.Transaction := PersonalCommon.ReadTransaction;

   {
    DSTypeOrder.Database := Main.FIBDatabase;
    ReadTr.DefaultDatabase := Main.FIBDatabase;
    DSTypeOrder.Transaction := ReadTr;
    DSTypeOrder.Close;
    DSTypeOrder.SQLs.SelectSQL.Text := 'Select * from Asup_Type_Orders_Sel(' +
                                        IntToStr(GetUserId) + ')';
    try
        DSTypeOrder.Open;
    except
        on E:Exception do
        ShowMessage(E.Message);
    end;
   }

    CBTypeOrders.Update;
    ToZpCheckBox.Visible := (Version = 2);
end;

procedure TOrdersEditForm.FormResize(Sender: TObject);
begin
    GridResize(DBGrid1);
    GridResize(DBGrid2);
    GridResize(DBGrid3);
    GridResize(DBGrid4);
    GridResize(DBGrid5);
    GridResize(DBGrid6);
end;

procedure TOrdersEditForm.DBGrid1DblClick(Sender: TObject);
begin
    if ModifyItemButton.Enabled then
        ModifyItemButton.Click;
end;

procedure TOrdersEditForm.DBGrid2KeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if AddSignButton.Enabled then
        case Key of
            VK_DELETE: DeleteSignButton.Click;
            VK_SPACE: ModifySignButton.Click;
            VK_ADD: AddSignButton.Click;
        end;
end;

procedure TOrdersEditForm.DBGrid1KeyUp(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if AddItemButton.Enabled then
        case Key of
            VK_DELETE: DeleteItemButton.Click;
            VK_SPACE: ModifyItemButton.Click;
            VK_ADD: AddItemButton.Click;
        end;
end;

procedure TOrdersEditForm.AddSignButtonClick(Sender: TObject);
var
    TEMP: TPCardsViewForm;
    i: integer;
    IsExist: Boolean;
begin
    TEMP := TPCardsViewForm.Create(Self, False, True);
    TEMP.Select := true;
    TEMP.ShowModal;

    // после закрытия формы личных карточек
    if (Temp.ModalResult = mrOk) then
    begin

        {Проверяем, чтобы такого человека небыло уже среди подписующих}
        IsExist := False;
        InputQuerySign.FetchAll;

        if (InputQuerySign.RecordCount > 0) then
            for i := 1 to InputQuerySign.RecordCount do
            begin
                InputQuerySign.RecNo := i;
                if (InputQuerySign['ID_PCARD'] = Temp.ResultQuery['ID_PCARD']) then
                    IsExist := True;
            end;
        if (IsExist) then
            MessageDlg('Ця людина вже є серед підписуючих!', mtError, [mbOk], 0)
        else begin
            {добавляем выбранного подписывающего}
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE INSERT_ORDER_SIGN(' + IntToStr(ID_ORDER) + ',' + IntToStr(Temp.ResultQuery['ID_PCARD']) + ',' + IntToStr(2) + ');';
            ExecQuery(OutputQuery);
            InputQuerySign.Close;
            InputQuerySign.Open;
        end;
    end;

    Temp.Free;
end;

procedure TOrdersEditForm.ModifySignButtonClick(Sender: TObject);
var
    TEMP: TPCardsViewForm;
    i, OldRecNo: integer;
    IsExist: Boolean;
begin
    if InputQuerySign.IsEmpty then
    begin
        MessageDlg('Немає Підписуючих для змінення!', mtError, [mbOk], 0);
        exit;
    end
    else begin
        TEMP := TPCardsViewForm.Create(Self, False, True);
        TEMP.Select := true;
        TEMP.ShowModal;

        if (Temp.ModalResult = mrOk) then
        begin

            {Проверяем, чтобы такого человека небыло уже среди подписующих}
            IsExist := False;
            OldRecNo := InputQuerySign.RecNo;
            if (InputQuerySign.RecordCount > 0) then
                for i := 1 to InputQuerySign.RecordCount do
                begin
                    InputQuerySign.RecNo := i;

                    if (InputQuerySign['ID_PCARD'] = Temp.ResultQuery['ID_PCARD']) then
                        IsExist := True;
                end;

            InputQuerySign.RecNo := OldRecNo;

            if (IsExist) then
                MessageDlg('Ця людина вже є серед підписуючих!', mtError, [mbOk], 0)
            else begin
                {добавляем выбранного подписывающего}
                OutputQuery.Close;
                OutputQuery.SQL.Text := 'EXECUTE PROCEDURE UPDATE_ORDER_SIGN(' + IntToStr(ID_ORDER) + ',' + IntToStr(InputQuerySign['ID_PCARD']) + ',' + IntToStr(Temp.ResultQuery['ID_PCARD']) + ',' + IntToStr(2) + ');';
                ExecQuery(OutputQuery);
                InputQuerySign.Close;
                InputQuerySign.Open;
            end;
        end;
        Temp.Free;
    end;
end;

procedure TOrdersEditForm.DeleteSignButtonClick(Sender: TObject);
begin
    if InputQuerySign.IsEmpty then
    begin
        MessageDlg('Немає Підписуючих для вилучення!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цього підписуючого з наказу?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
        {Удаляем Подписующего из приказа с таким ID_ORDER и ID_PCARD}
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE DELETE_ORDER_SIGN(' + IntToStr(InputQuerySIGN['ID_ORDER']) + ',' + IntToStr(InputQuerySign['ID_PCARD']) + ');';
            ExecQuery(OutputQuery);
            InputQuerySign.Close;
            InputQuerySign.Open;
        end;
end;

procedure TOrdersEditForm.DeleteItemButtonClick(Sender: TObject);
begin
    if InputQueryActions.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цей додатковий пункт наказу?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
            then begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_ADDITIONAL_ACTION_DELETE(' + IntToStr(InputQueryActionsID_ADDITIONAL_ACTION.Value) + ')';
            ExecQuery(OutputQuery);

            InputQueryActions.Close;
            InputQueryActions.Open;
        end;
end;

procedure TOrdersEditForm.SpeedButton1Click(Sender: TObject);
var
    EditMode: TEditMode;
begin
    EditMode := emModify;

    if ID_STATUS <> 1 then
        EditMode := emView;

    if not CanEdit then
        EditMode := EmView;

    CheckAction(ID_ORDER, ID_ORDER_TYPE, ID_ORDER_TYPE, 1, EditMode)
end;

procedure TOrdersEditForm.SpTypeComboBoxChange(Sender: TObject);
begin
   { if SpTypeComboBox.GetId <> -1 then
        PrintNameEdit.Text := SpTypeComboBox.Text;  }
end;

procedure TOrdersEditForm.AddPaperSignerButtonClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(6);

    if Form.ShowModal = mrOk then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'INSERT INTO ORDER_PAPER_SIGNERS(ID_ORDER, FIO, POST)' +
            ' VALUES(' + IntToStr(ID_ORDER) + ',' +
            QuotedStr(Form.ResultQueryText1.Value) + ',' +
            QuotedStr(Form.ResultQueryText2.Value) + ')';
        ExecQuery(OutputQuery);

        PaperSignersQuery.Close;
        PaperSignersQuery.Open;
    end;

    Form.Free;
end;

procedure TOrdersEditForm.PaperSignersQueryAfterOpen(DataSet: TDataSet);
begin
    GridResize(DBGrid1);
    GridResize(DBGrid2);
    GridResize(DBGrid3);
    GridResize(DBGrid4);
    GridResize(DBGrid5);
    GridResize(DBGrid6);
end;

procedure TOrdersEditForm.DeletePaperSignerButtonClick(Sender: TObject);
begin
    if PaperSignersQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цього підписуючого?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'DELETE FROM ORDER_PAPER_SIGNERS where ID_ORDER = ' + IntToStr(PaperSignersQueryID_ORDER.Value) +
                ' AND FIO = ' + QuotedStr(PaperSignersQueryFIO.Value) +
                ' AND POST = ' + QuotedStr(PaperSignersQueryPOST.Value);

            ExecQuery(OutputQuery);

            PaperSignersQuery.Close;
            PaperSignersQuery.Open;
        end;
end;

procedure TOrdersEditForm.AddVizaButtonClick(Sender: TObject);
var
    Name: string;
begin
    if Dialogs.InputQuery('Додавання візуючого', 'ПІБ:', Name)
        and (Trim(Name) <> '') then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_VIZA_INSERT(' + QuotedStr(Name) + ',' + IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        VizaQuery.Close;
        VizaQuery.Open;
    end;
end;

procedure TOrdersEditForm.DeleteVizaButtonClick(Sender: TObject);
begin
    if VizaQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цього візуючого?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_VIZA_DELETE(' + IntToStr(VizaQueryID_ORDER_VIZA.Value) + ')';
            ExecQuery(OutputQuery);

            VizaQuery.Close;
            VizaQuery.Open;
        end;
end;

procedure TOrdersEditForm.ModifyVizaButtonClick(Sender: TObject);
var
    Name: string;
begin
    if VizaQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Name := VizaQueryFIO.Value;

    if Dialogs.InputQuery('Редагування візуючого', 'ПІБ:', Name)
        and (Trim(Name) <> '') then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_VIZA_UPDATE(' + IntToStr(VizaQueryID_ORDER_VIZA.value) + ',' +
            QuotedStr(Name) + ',' +
            IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        VizaQuery.Close;
        VizaQuery.Open;
    end;
end;

procedure TOrdersEditForm.AddKnowButtonClick(Sender: TObject);
var
    Name: string;
begin
    if Dialogs.InputQuery('Додавання ознайомленого', 'ПІБ:', Name)
        and (Trim(Name) <> '') then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_KNOW_INSERT(' + QuotedStr(Name) + ',' + IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        KnowQuery.Close;
        KnowQuery.Open;
    end;
end;

procedure TOrdersEditForm.ModifyKnowButtonClick(Sender: TObject);
var
    Name: string;
begin
    if KnowQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Name := KnowQueryFIO.Value;

    if Dialogs.InputQuery('Редагування ознайомленого', 'ПІБ:', Name)
        and (Trim(Name) <> '') then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_KNOW_UPDATE(' + IntToStr(KNOWQueryID_ORDER_KNOW.value) + ',' +
            QuotedStr(Name) + ',' +
            IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        KnowQuery.Close;
        KnowQuery.Open;
    end;
end;

procedure TOrdersEditForm.DeleteKnowButtonClick(Sender: TObject);
begin
    if KnowQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цього візуючого?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_Know_DELETE(' + IntToStr(KnowQueryID_ORDER_Know.Value) + ')';
            ExecQuery(OutputQuery);

            KnowQuery.Close;
            KnowQuery.Open;
        end;
end;

procedure TOrdersEditForm.AddAgreeButtonClick(Sender: TObject);
var
    Name: string;
begin
    if Dialogs.InputQuery('Додавання візуючого', 'ПІБ:', Name)
        and (Trim(Name) <> '') then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_Agree_INSERT(' + QuotedStr(Name) + ',' + IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        AgreeQuery.Close;
        AgreeQuery.Open;
    end;
end;

procedure TOrdersEditForm.ModifyAgreeButtonClick(Sender: TObject);
var
    Name: string;
begin
    if AgreeQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Name := AgreeQueryFIO.Value;

    if Dialogs.InputQuery('Редагування візуючого', 'ПІБ:', Name)
        and (Trim(Name) <> '') then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_Agree_UPDATE(' + IntToStr(AgreeQueryID_ORDER_Agree.value) + ',' +
            QuotedStr(Name) + ',' +
            IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        AgreeQuery.Close;
        AgreeQuery.Open;
    end;
end;

procedure TOrdersEditForm.DeleteAgreeButtonClick(Sender: TObject);
begin
    if AgreeQuery.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end else
        if (MessageDlg('Чи ви справді бажаєте вилучити цього візуючого?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
            OutputQuery.Close;
            OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_Agree_DELETE(' + IntToStr(AgreeQueryID_ORDER_Agree.Value) + ')';
            ExecQuery(OutputQuery);

            AgreeQuery.Close;
            AgreeQuery.Open;
        end;
end;

procedure TOrdersEditForm.AddItemButtonClick(Sender: TObject);
var
    Form: TAddAdditionalActionsForm;
    num: Integer;
begin
    Form := TAddAdditionalActionsForm.Create(self);

    Form.ID_TYPE := 2;

    if InputQueryActions.IsEmpty then
        num := 1
    else begin
        try
            num := StrToInt(InputQueryActionsPORYADOK.Value[1]) + 1;
        except
            num := 1;
        end;
    end;

    Form.PoryadokEdit.Text := IntToStr(num) + '.';

    if Form.ShowModal = mrOk then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_ADDITIONAL_ACTION_INSERT(' + IntToStr(ID_ORDER) + ',' +
            QuotedStr(Form.PoryadokEdit.Text) + ',' +
            QuotedStr(Form.TextEdit.Text) + ')';
        ExecQuery(OutputQuery);

        InputQueryActions.Close;
        InputQueryActions.Open;
    end;

    Form.Free;
end;

procedure TOrdersEditForm.ModifyItemButtonClick(Sender: TObject);
var
    Form: TAddAdditionalActionsForm;
begin
    if InputQueryActions.IsEmpty then
    begin
        MessageDlg('Немає записів!', mtError, [mbOk], 0);
        exit;
    end;

    Form := TAddAdditionalActionsForm.Create(self);

    Form.ID_TYPE := 2;

    Form.PoryadokEdit.Text := InputQueryActionsPORYADOK.Value;
    Form.TextEdit.Text := InputQueryActionsText.Value;

    if Form.ShowModal = mrOk then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_ADDITIONAL_ACTION_UPDATE(' + IntToStr(InputQueryActionsID_ADDITIONAL_ACTION.Value) + ',' +
            IntToStr(ID_ORDER) + ',' +
            QuotedStr(Form.PoryadokEdit.Text) + ',' +
            QuotedStr(Form.TextEdit.Text) + ')';
        ExecQuery(OutputQuery);

        InputQueryActions.Close;
        InputQueryActions.Open;
    end;

    Form.Free;
end;

procedure TOrdersEditForm.AddExistVizaClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(3);

    if Form.ShowModal = mrOk then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_VIZA_INSERT(' + QuotedStr(Form.ResultQueryTEXT1.Value) + ',' + IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        VizaQuery.Close;
        VizaQuery.Open;
    end;

    form.Free;
end;

procedure TOrdersEditForm.AddExistKnowClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(4);

    if Form.ShowModal = mrOk then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_KNOW_INSERT(' + QuotedStr(Form.ResultQueryText1.Value) + ',' + IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        KnowQuery.Close;
        KnowQuery.Open;
    end;

    form.Free;
end;

procedure TOrdersEditForm.AddExistAgreeClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(5);

    if Form.ShowModal = mrOk then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'EXECUTE PROCEDURE ORDER_Agree_INSERT(' + QuotedStr(Form.ResultQueryTEXT1.Value) + ',' + IntToStr(ID_ORDER) + ')';
        ExecQuery(OutputQuery);

        AgreeQuery.Close;
        AgreeQuery.Open;
    end;

    form.Free;
end;

procedure TOrdersEditForm.ExistPrintNameButtonClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(7);

    if Form.ShowModal = mrOk then
    begin
        PrintNameEdit.Text := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;

procedure TOrdersEditForm.ExistIntroButtonClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(8);

    if Form.ShowModal = mrOk then
    begin
        IntroMemo.Text := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;

procedure TOrdersEditForm.ExistIspolnitelButtonClick(Sender: TObject);
var
    Form: TTextShablonsForm;
begin
    form := TTextShablonsForm.Create(Self);

    form.Prepare(9);

    if Form.ShowModal = mrOk then
    begin
        IspolnitelEdit.Text := Form.ResultQueryTEXT1.Value;
    end;

    form.Free;
end;

procedure TOrdersEditForm.FormKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if Key = VK_ESCAPE then
        CancelButton.Click;
end;

procedure TOrdersEditForm.ChangeOwnerButtonClick(Sender: TObject);
var
    new_id_pcard: Integer;
begin
    if (OWNER_ID_PCARD <> CurrentID_PCARD) and (OWNER_ID_PCARD <> 0) and (not AdminMode) then
    begin
        ErrMsg('Змінювати власника наказу може тільки власник наказу!');
        exit;
    end;

    if (id_order = -1) then
    begin
        exit;
    end;

    new_id_pcard := GoodfunctionsUnit.getpcard(Date_Order, True, True);

    if new_id_pcard <> -1 then
    begin
        OutputQuery.Close;
        OutputQuery.SQL.Text := 'UPDATE ORDERS SET OWNER_ID_PCARD = '
            + IntToStr(new_id_pcard)
            + ' WHERE ID_ORDER = ' + IntToStr(Id_Order);
        ExecQuery(OutputQuery);

        Owner_Id_PCard := new_id_pcard;
        OwnerFio.Caption := GetManFio(new_id_pcard);
    end;
end;

procedure TOrdersEditForm.CBTypeOrdersPropertiesChange(Sender: TObject);
begin
    if CBTypeOrders.Text='' then
        CBTypeOrdersPropertiesEditValueChanged(Self);
    if CBTypeOrders.EditValue <> -1 then
        PrintNameEdit.Text := CBTypeOrders.Text;
end;

procedure TOrdersEditForm.CBTypeOrdersPropertiesCloseUp(Sender: TObject);
begin
    CBTypeOrdersPropertiesEditValueChanged(Self);
end;

procedure TOrdersEditForm.CBTypeOrdersPropertiesEditValueChanged(
  Sender: TObject);
begin
    if (CBTypeOrders.Properties.ListSource.DataSet.Active) and (CBTypeOrders.EditValue<>-1) then
    begin
        CBTypeOrders.Properties.ListSource.DataSet.Locate('Name_Type',CBTypeOrders.EditText,[]);
        CBTypeOrders.EditValue:=CBTypeOrders.Properties.ListSource.DataSet['Id_Order_Type'];
    end
    else
    begin
        CBTypeOrders.EditValue:=-1;
    end;
end;

end.
