unit fmPochasOrderUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, RxMemDS, uCommonSp, uFormControl, Buttons, Grids, Spin,
  StdCtrls, SpComboBox, DBGrids, ExtCtrls, Mask, CheckEditUnit, ComCtrls,
  uFControl, uLabeledFControl, uSpravControl, uDateControl, uEnumControl,
  uCharControl, uIntControl, uBoolControl, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, ibase, uSelectForm, uFloatControl,
  uShtatUtils, ActnList, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, uActionControl, uLogicCheck,
  uSimpleCheck, qFTools;

type
  TfmPochasOrder = class(TForm)
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    PochasViewQuery: TRxMemoryData;
    SmetSource: TDataSource;
    AddPochas: TAction;
    ModifyPochas: TAction;
    DeletePochas: TAction;
    ViewPochas: TAction;
    WorkQuery: TpFIBDataSet;
    Panel3: TPanel;
    AddItemButton: TSpeedButton;
    ModifyItemButton: TSpeedButton;
    DeleteItemButton: TSpeedButton;
    InfoButton: TSpeedButton;
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    BottomPanel: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    PochasViewQueryID_POCHAS_PLAN: TIntegerField;
    PochasViewQueryPERIOD_BEG: TDateField;
    PochasViewQueryPERIOD_END: TDateField;
    PochasViewQueryKOL_HOURS: TFloatField;
    PochasViewQueryID_MAN: TIntegerField;
    PochasViewQueryID_TARIF: TIntegerField;
    PochasViewQueryId_Department: TIntegerField;
    PochasViewQueryKOD_SM: TIntegerField;
    PochasViewQueryFIO: TStringField;
    PochasViewQuerySM_TITLE: TStringField;
    PochasViewQueryTARIF: TFloatField;
    PochasViewQueryNAME_DEPARTMENT: TStringField;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    cxGridDBTableView5DBColumn7: TcxGridDBColumn;
    InsertOrderQuery: TpFIBDataSet;
    InsertOrderQueryID_ORDER: TFIBIntegerField;
    WorkQueryID_POCHAS_PLAN: TFIBIntegerField;
    WorkQueryPERIOD_BEG: TFIBDateField;
    WorkQueryPERIOD_END: TFIBDateField;
    WorkQueryKOL_HOURS: TFIBBCDField;
    WorkQueryID_MAN: TFIBIntegerField;
    WorkQueryID_TARIF: TFIBIntegerField;
    WorkQueryID_DEPARTMENT: TFIBIntegerField;
    WorkQueryKOD_SM: TFIBIntegerField;
    WorkQueryFIO: TFIBStringField;
    WorkQuerySM_TITLE: TFIBStringField;
    WorkQueryTARIF: TFIBBCDField;
    WorkQueryNAME_DEPARTMENT: TFIBStringField;
    PochasViewQueryID_POCHAS_TYPE: TIntegerField;
    PochasViewQueryPOCHAS_TYPE_NAME: TStringField;
    WorkQueryID_POCHAS_TYPE: TFIBIntegerField;
    WorkQueryPOCHAS_TYPE_NAME: TFIBStringField;
    PochasViewQueryREASON: TStringField;
    WorkQueryREASON: TFIBStringField;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    procedure WritePochas(FMode : TFormMode);
    procedure ReadPochas;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure ShowChangePochasForm(FMode : TFormMode);
    procedure AddPochasExecute(Sender: TObject);
    procedure ModifyPochasExecute(Sender: TObject);
    procedure ViewPochasExecute(Sender: TObject);
    procedure DeletePochasExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    Date_Order : TDate;
    Id_Order : Integer;
    Id_Man_Moving : Integer;

    Id_Order_Type, NUM_ITEM, SUB_ITEM, ID_ORDER_GROUP : Integer;
    INTRO : String;

    dmShtatUtils : TdmShtatUtils;

    Mode : TFormMode;
  end;

  type
    TPochasOrderSprav = class(TSprav)
    private
        IsConnected: Boolean;
        Form : TfmPochasOrder;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

var
  fmPochasOrder : TfmPochasOrder;

implementation

uses fmAddPochasUnit;

{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TPochasOrderSprav.Create;
end;

constructor TPochasOrderSprav.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('Id_Order_Type', ftInteger);
    Input.FieldDefs.Add('Id_Order', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);
    Input.FieldDefs.Add('Num_Item', ftInteger);
    Input.FieldDefs.Add('Sub_Item', ftInteger);
    Input.FieldDefs.Add('Id_Order_Group', ftInteger);
    Input.FieldDefs.Add('Intro', ftString, 4096);

    Output.FieldDefs.Add('New_Id_Order', ftInteger);
end;

destructor TPochasOrderSprav.Destroy;
begin
    inherited Destroy;
end;

procedure TPochasOrderSprav.Show;
var
    hnd : Integer;
begin
    Form := TfmPochasOrder.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);

    Form.Id_Order := Input['Id_Order'];
    Form.Id_Order_Type := Input['Id_Order_Type'];
    Form.Date_Order := Input['Date_Order'];
    Form.NUM_ITEM := Input['Num_Item'];
    Form.SUB_ITEM := Input['Sub_Item'];
    Form.ID_ORDER_GROUP := Input['Id_Order_Group'];

    if not VarIsNull(Input['Intro']) then
        Form.INTRO := Input['Intro'];

    fmPochasOrder := Form;

    if not Form.PochasViewQuery.Active then Form.PochasViewQuery.Active := True;

    case Input['SpMode'] of
        1 : Form.Mode := fmAdd;
        2 : Form.Mode := fmModify;
        3 : Form.Mode := fmInfo;
    end;

    Form.AddItemButton.Enabled := (Form.Mode <> fmInfo);
    Form.ModifyItemButton.Enabled := (Form.Mode <> fmInfo);
    Form.DeleteItemButton.Enabled := (Form.Mode <> fmInfo);

    Form.ReadPochas;

    form.ShowModal;

    if Form.Id_Order <> -1 then begin
        Output.Open;
        Output.Append;
        Output['New_Id_Order'] := Form.Id_Order;
        Output.Post;
    end;

    form.Free;
end;

procedure TfmPochasOrder.WritePochas(FMode : TFormMode);
begin
    if (FMode = fmInfo) then exit;

    WorkQuery.Transaction.StartTransaction;

    try

        if FMode = fmAdd then begin
            InsertOrderQuery.Close;
            InsertOrderQuery.SelectSQL.Text := 'select id_order ' +
                                               'from ASUP_INSERT_ORDER (' +
                                        IntToStr(ID_ORDER_TYPE) + ',' +
                                        IntToStr(NUM_ITEM) + ',' +
                                        IntToStr(SUB_ITEM) + ',' +
                                        IntToStr(ID_ORDER_GROUP) + ',' +
                                        QuotedStr(INTRO) + ')';
            InsertOrderQuery.Open;

            Id_Order := InsertOrderQueryID_ORDER.Value;

            if Id_Order = 0 then begin
                qFErrorDialog('Виникла помилка: неможливо додати пункт наказу! (id_order = 0)');
                WorkQuery.Transaction.Rollback;
                exit;
            end;
        end;

        WorkQuery.Close;

        // Пишем новые и обновляем старые записи
        PochasViewQuery.First;

        while not PochasViewQuery.Eof do begin
            WorkQuery.QInsert.Close;
            WorkQuery.QInsert.ParamByName('ID_POCHAS_PLAN').AsInteger := PochasViewQueryID_POCHAS_PLAN.Value;
            WorkQuery.QInsert.ParamByName('PERIOD_BEG').AsDate := PochasViewQueryPERIOD_BEG.Value;
            WorkQuery.QInsert.ParamByName('PERIOD_END').AsDate := PochasViewQueryPERIOD_END.Value;
            WorkQuery.QInsert.ParamByName('KOL_HOURS').AsFloat := PochasViewQueryKOL_HOURS.Value;
            WorkQuery.QInsert.ParamByName('ID_MAN').AsInteger := PochasViewQueryID_MAN.Value;
            WorkQuery.QInsert.ParamByName('ID_ORDER').AsInteger := Id_Order;
            WorkQuery.QInsert.ParamByName('ID_TARIF').AsInteger := PochasViewQueryID_TARIF.Value;
            WorkQuery.QInsert.ParamByName('ID_DEPARTMENT').AsInteger := PochasViewQueryID_DEPARTMENT.Value;
            WorkQuery.QInsert.ParamByName('KOD_SM').AsInteger := PochasViewQueryKOD_SM.Value;
            WorkQuery.QInsert.ParamByName('ID_POCHAS_TYPE').AsInteger := PochasViewQueryID_POCHAS_TYPE.Value;
            WorkQuery.QInsert.ParamByName('REASON').AsString := PochasViewQueryREASON.Value;
            WorkQuery.QInsert.ExecQuery;
            PochasViewQuery.Next;
        end;
        
    except on E:Exception do begin
            qFErrorDialog('При занесенні даних про погодинну працю виникла помилка: "' + E.Message + '"');
            WorkQuery.Transaction.Rollback;
            exit;
        end;
    end;

    WorkQuery.Transaction.Commit;
end;

procedure TfmPochasOrder.ReadPochas;
begin
    WorkQuery.Close;
    WorkQuery.ParamByName('ID_ORDER').AsInteger := Id_Order;
    WorkQuery.Open;

    While not WorkQuery.Eof do begin
        PochasViewQuery.Append;
        PochasViewQuery['ID_POCHAS_PLAN'] := WorkQueryID_POCHAS_PLAN.Value;
        PochasViewQuery['PERIOD_BEG'] := WorkQueryPERIOD_BEG.Value;
        PochasViewQuery['PERIOD_END'] := WorkQueryPERIOD_END.value;
        PochasViewQuery['KOL_HOURS'] := WorkQueryKOL_HOURS.value;
        PochasViewQuery['ID_MAN'] := WorkQueryID_MAN.value;
        PochasViewQuery['ID_TARIF'] := WorkQueryID_TARIF.value;
        PochasViewQuery['ID_DEPARTMENT'] := WorkQueryID_DEPARTMENT.value;
        PochasViewQuery['KOD_SM'] := WorkQueryKOD_SM.value;
        PochasViewQuery['FIO'] := WorkQueryFIO.value;
        PochasViewQuery['SM_TITLE'] := WorkQuerySM_TITLE.value;
        PochasViewQuery['TARIF'] := WorkQueryTARIF.value;
        PochasViewQuery['NAME_DEPARTMENT'] := WorkQueryNAME_DEPARTMENT.value;
        PochasViewQuery['ID_POCHAS_TYPE'] := WorkQueryID_POCHAS_TYPE.Value;
        PochasViewQuery['POCHAS_TYPE_NAME'] := WorkQueryPOCHAS_TYPE_NAME.Value;
        PochasViewQuery['REASON'] := WorkQueryREASON.Value;

        PochasViewQuery.Post;
        WorkQuery.Next;
    end;

    WorkQuery.Close;
end;

procedure TfmPochasOrder.OkActionExecute(Sender: TObject);
begin
    WritePochas(Mode);
    ModalResult := mrOk;
end;

procedure TfmPochasOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmPochasOrder.ShowChangePochasForm(FMode : TFormMode);
var
    Form : TfmAddPochas;
begin
    if (FMode <> fmAdd) and (PochasViewQuery.IsEmpty) then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    Form := TfmAddPochas.Create(Self);
    Form.FMode := FMode;

        // отображение полей, при редактировании или просмотре
    if (FMode = fmModify) or (FMode = fmInfo) then with Form do begin
        Form.Man.Value := PochasViewQueryID_MAN.Value;
        Form.Man.DisplayText := PochasViewQueryFIO.Value;
        Form.Department.Value := PochasViewQueryId_Department.Value;
        Form.Department.DisplayText := PochasViewQueryNAME_DEPARTMENT.Value;
        Form.Smeta.Value := PochasViewQueryKOD_SM.Value;
        Form.Smeta.DisplayText := PochasViewQuerySM_TITLE.Value;
        Form.PeriodBeg.Value := PochasViewQueryPERIOD_BEG.Value;
        Form.PeriodEnd.Value := PochasViewQueryPERIOD_END.Value;
        Form.KolHours.Value := PochasViewQueryKOL_HOURS.Value;
        Form.Tarif.Value := PochasViewQueryID_TARIF.Value;
        Form.Tarif.DisplayText := PochasViewQueryTARIF.AsString;
        Form.PochasType.Value := PochasViewQueryID_POCHAS_TYPE.Value;
        Form.PochasType.DisplayText := PochasViewQueryPOCHAS_TYPE_NAME.Value;
        Form.Reason.Value := PochasViewQueryREASON.Value;
    end;

    Form.Prepare;

    if (Form.ShowModal = mrOk) and (FMode <> fmInfo) then begin

        if FMode = fmAdd then
            PochasViewQuery.Append;

        if FMode = fmModify then
            PochasViewQuery.Edit;

        PochasViewQuery['ID_MAN'] := Form.Man.Value;
        PochasViewQuery['FIO'] := Form.Man.DisplayText;
        PochasViewQuery['ID_DEPARTMENT'] := Form.Department.Value;
        PochasViewQuery['NAME_DEPARTMENT'] := Form.Department.DisplayText;
        PochasViewQuery['KOD_SM'] := Form.Smeta.Value;
        PochasViewQuery['SM_TITLE'] := Form.Smeta.DisplayText;
        PochasViewQuery['PERIOD_BEG'] := Form.PeriodBeg.Value;
        PochasViewQuery['PERIOD_END'] := Form.PeriodEnd.Value;
        PochasViewQuery['KOL_HOURS'] := Form.KolHours.Value;
        PochasViewQuery['ID_TARIF'] := Form.Tarif.Value;
        PochasViewQuery['TARIF'] := StrToFloat(Form.Tarif.DisplayText);
        PochasViewQuery['POCHAS_TYPE_NAME'] := Form.PochasType.DisplayText;
        PochasViewQuery['ID_POCHAS_TYPE'] := Form.PochasType.Value;
        PochasViewQuery['REASON'] := Form.Reason.Value;

        PochasViewQuery.Post;
    end;

    Form.Free;
end;

procedure TfmPochasOrder.AddPochasExecute(Sender: TObject);
begin
    ShowChangePochasForm(fmAdd);
end;

procedure TfmPochasOrder.ModifyPochasExecute(Sender: TObject);
begin
    ShowChangePochasForm(fmModify);
end;

procedure TfmPochasOrder.ViewPochasExecute(Sender: TObject);
begin
    ShowChangePochasForm(fmInfo);
end;

procedure TfmPochasOrder.DeletePochasExecute(Sender: TObject);
begin
    if (PochasViewQuery.IsEmpty) then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    if not qFConfirm('Ви справді бажаєте вилучити цей запис?') then
        exit;

    if PochasViewQueryID_POCHAS_PLAN.Value <> 0 then begin
        WorkQuery.QDelete.Close;
        WorkQuery.QDelete.ParamByName('ID_POCHAS_PLAN').AsInteger := PochasViewQueryID_POCHAS_PLAN.Value;
        WorkQuery.QDelete.ExecQuery;
    end;

    PochasViewQuery.Delete;
end;

procedure TfmPochasOrder.FormResize(Sender: TObject);
begin
    // перемещаем кнопки
    OkButton.Left := Trunc(Width/2) - 50 - OkButton.Width;
    CancelButton.Left := Trunc(Width/2) + 50;    
end;

end.
