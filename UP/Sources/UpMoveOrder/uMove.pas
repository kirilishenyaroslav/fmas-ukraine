unit uMove;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uSpravControl, uFControl, uLabeledFControl, uDateControl, uCommonSp,
    DB, FIBDatabase, pFIBDatabase, Ibase, uFormControl, uLogicCheck,
    uCharControl, uIntControl, RxMemDS, StdCtrls, Buttons, FIBDataSet,
    pFIBDataSet, cxLookAndFeelPainters, cxButtons, AppStruClasses, AccMgmt,
    FIBQuery, pFIBQuery, pFIBStoredProc, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
    ExtCtrls, cxLabel, cxContainer, cxTextEdit, cxDBEdit, Mask, DBCtrls,
    UpKernelUnit, cxCurrencyEdit, dxBar, dxBarExtItems, cxGridCardView,
    cxGridDBCardView, ImgList, cxImage, cxCheckBox, cxSplitter, cxPC,
    cxGridBandedTableView, cxGridDBBandedTableView, uWMFillGrid, cxMaskEdit;

const
    SYS_MASS_COLOR = clBlue;
    SYS_MASS_NORM_COLOR = clGreen;
    Inf_Date_End = '31.12.9999';

type
    TfrmMoveOrder = class(TForm)
        Database: TpFIBDatabase;
        WriteTransaction: TpFIBTransaction;
        WriteDataSet: TpFIBDataSet;
        ReadTransaction: TpFIBTransaction;
        ReadDataSet: TpFIBDataSet;
        StoredProc: TpFIBStoredProc;
        DataSourceMain: TDataSource;
        Query: TpFIBQuery;
        Panel2: TPanel;
        cxStyleRepository1: TcxStyleRepository;
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
        cxStyle15: TcxStyle;
        cxStyle16: TcxStyle;
        cxStyle17: TcxStyle;
        cxStyle18: TcxStyle;
        cxStyle19: TcxStyle;
        cxStyle20: TcxStyle;
        cxStyle21: TcxStyle;
        cxStyle22: TcxStyle;
        cxStyle23: TcxStyle;
        cxStyle24: TcxStyle;
        cxStyle25: TcxStyle;
        cxStyle26: TcxStyle;
        cxStyle27: TcxStyle;
        cxStyle28: TcxStyle;
        cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
        Bevel1: TBevel;
        dxBarManager1: TdxBarManager;
        btnAdd: TdxBarLargeButton;
        btnEditMass: TdxBarLargeButton;
        btnDelete: TdxBarLargeButton;
        btnView: TdxBarLargeButton;
        ImageList1: TImageList;
        cxGrid1DBTableView1: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        cxGrid1DBTableView1ID_MAN_MOVING: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_BEG: TcxGridDBColumn;
        cxGrid1DBTableView1DATE_END: TcxGridDBColumn;
        cxGrid1DBTableView1ID_ORDER_ITEM: TcxGridDBColumn;
        cxGrid1DBTableView1ID_PCARD: TcxGridDBColumn;
        cxGrid1DBTableView1ID_DEPARTMENT: TcxGridDBColumn;
        cxGrid1DBTableView1IS_TARIF: TcxGridDBColumn;
        cxGrid1DBTableView1ID_POST_SALARY_REAL: TcxGridDBColumn;
        cxGrid1DBTableView1ID_POST_SALARY: TcxGridDBColumn;
        cxGrid1DBTableView1ID_TYPE_POST: TcxGridDBColumn;
        cxGrid1DBTableView1IS_POST_MAIN: TcxGridDBColumn;
        cxGrid1DBTableView1ID_WORK_REASON: TcxGridDBColumn;
        cxGrid1DBTableView1ID_WORK_CONDITION: TcxGridDBColumn;
        cxGrid1DBTableView1ID_PAY_FORM: TcxGridDBColumn;
        cxGrid1DBTableView1ID_MAN_HOSPITAL: TcxGridDBColumn;
        cxGrid1DBTableView1ID_MAN_HOLIDAY: TcxGridDBColumn;
        cxGrid1DBTableView1TRIAL_TERM: TcxGridDBColumn;
        cxGrid1DBTableView1TRAINING_TERM: TcxGridDBColumn;
        cxGrid1DBTableView1WITH_RETURN: TcxGridDBColumn;
        cxGrid1DBTableView1FIO: TcxGridDBColumn;
        cxGrid1DBTableView1DEPARTMENT_NAME: TcxGridDBColumn;
        cxGrid1DBTableView1POST_NAME: TcxGridDBColumn;
        cxGrid1DBTableView1REAL_POST_NAME: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_WORK_REASON: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_TYPE_POST: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_WORK_COND: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_PAY_FORM: TcxGridDBColumn;
        cxGrid1DBTableView1REASON: TcxGridDBColumn;
        cxGrid1DBTableView1ID_ACCEPT_COND: TcxGridDBColumn;
        cxGrid1DBTableView1ACCEPT_BEG: TcxGridDBColumn;
        cxGrid1DBTableView1ACCEPT_END: TcxGridDBColumn;
        cxGrid1DBTableView1NAME_ACCEPT_COND: TcxGridDBColumn;
        cxGrid1DBTableView1HOLIDAY_DISPLAY_TEXT: TcxGridDBColumn;
        cxGrid1DBTableView1HOSPITAL_DISPLAY_TEXT: TcxGridDBColumn;
        cxGrid1DBTableView1NUM_SUB_ITEM: TcxGridDBColumn;
        ReadDataSet2: TpFIBDataSet;
        DataSource2: TDataSource;
        Panel1: TPanel;
        btnOk: TBitBtn;
        btnCancel: TBitBtn;
        GridCardViewStyleSheetDevExpress: TcxGridCardViewStyleSheet;
        cxStyle29: TcxStyle;
        cxStyle30: TcxStyle;
        cxStyle31: TcxStyle;
        cxStyle32: TcxStyle;
        cxStyle33: TcxStyle;
        cxStyle34: TcxStyle;
        cxStyle35: TcxStyle;
        cxStyle36: TcxStyle;
        cxStyle37: TcxStyle;
        cxStyle38: TcxStyle;
        Panel3: TPanel;
        cxPageControl1: TcxPageControl;
        cxTabSheet1: TcxTabSheet;
        cxGrid2: TcxGrid;
        cxGrid2DBCardView1: TcxGridDBCardView;
        cxGrid2DBCardView1ID_MAN_MOVING: TcxGridDBCardViewRow;
        cxGrid2DBCardView1DATE_BEG: TcxGridDBCardViewRow;
        cxGrid2DBCardView1DATE_END: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_ORDER_ITEM: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_PCARD: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_DEPARTMENT: TcxGridDBCardViewRow;
        cxGrid2DBCardView1IS_TARIF: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_POST_SALARY_REAL: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_POST_SALARY: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_TYPE_POST: TcxGridDBCardViewRow;
        cxGrid2DBCardView1IS_POST_MAIN: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_WORK_REASON: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_WORK_CONDITION: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_PAY_FORM: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_MAN_HOSPITAL: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_MAN_HOLIDAY: TcxGridDBCardViewRow;
        cxGrid2DBCardView1TRIAL_TERM: TcxGridDBCardViewRow;
        cxGrid2DBCardView1TRAINING_TERM: TcxGridDBCardViewRow;
        cxGrid2DBCardView1WITH_RETURN: TcxGridDBCardViewRow;
        cxGrid2DBCardView1FIO: TcxGridDBCardViewRow;
        cxGrid2DBCardView1DEPARTMENT_NAME: TcxGridDBCardViewRow;
        cxGrid2DBCardView1POST_NAME: TcxGridDBCardViewRow;
        cxGrid2DBCardView1REAL_POST_NAME: TcxGridDBCardViewRow;
        cxGrid2DBCardView1NAME_WORK_REASON: TcxGridDBCardViewRow;
        cxGrid2DBCardView1NAME_TYPE_POST: TcxGridDBCardViewRow;
        cxGrid2DBCardView1NAME_WORK_COND: TcxGridDBCardViewRow;
        cxGrid2DBCardView1NAME_PAY_FORM: TcxGridDBCardViewRow;
        cxGrid2DBCardView1REASON: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ID_ACCEPT_COND: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ACCEPT_BEG: TcxGridDBCardViewRow;
        cxGrid2DBCardView1ACCEPT_END: TcxGridDBCardViewRow;
        cxGrid2DBCardView1NAME_ACCEPT_COND: TcxGridDBCardViewRow;
        cxGrid2DBCardView1HOLIDAY_DISPLAY_TEXT: TcxGridDBCardViewRow;
        cxGrid2DBCardView1HOSPITAL_DISPLAY_TEXT: TcxGridDBCardViewRow;
        cxGrid2DBCardView1NUM_SUB_ITEM: TcxGridDBCardViewRow;
        cxGridLevel1: TcxGridLevel;
        cxTabSheet2: TcxTabSheet;
        cxTabSheet3: TcxTabSheet;
        DataSetSmet: TpFIBDataSet;
        DataSourceSmet: TDataSource;
        DataSetSmetNew: TpFIBDataSet;
        DataSourceSmetNew: TDataSource;
        GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
        cxStyle39: TcxStyle;
        cxStyle40: TcxStyle;
        cxStyle41: TcxStyle;
        cxStyle42: TcxStyle;
        cxStyle43: TcxStyle;
        cxStyle44: TcxStyle;
        cxStyle45: TcxStyle;
        cxStyle46: TcxStyle;
        cxStyle47: TcxStyle;
        cxStyle48: TcxStyle;
        cxStyle49: TcxStyle;
        cxStyle50: TcxStyle;
        cxStyle51: TcxStyle;
        cxStyle52: TcxStyle;
        cxStyle53: TcxStyle;
        cxStyle54: TcxStyle;
        cxGrid4: TcxGrid;
        cxGridDBBandedTableView1: TcxGridDBBandedTableView;
        cxGridDBBandedColumn1: TcxGridDBBandedColumn;
        cxGridDBBandedColumn2: TcxGridDBBandedColumn;
        cxGridDBBandedColumn3: TcxGridDBBandedColumn;
        cxGridDBBandedColumn4: TcxGridDBBandedColumn;
        cxGridDBBandedColumn5: TcxGridDBBandedColumn;
        cxGridDBBandedColumn6: TcxGridDBBandedColumn;
        cxGridDBBandedColumn7: TcxGridDBBandedColumn;
        cxGridDBBandedColumn8: TcxGridDBBandedColumn;
        cxGridDBBandedColumn9: TcxGridDBBandedColumn;
        cxGridDBBandedColumn10: TcxGridDBBandedColumn;
        cxGridDBBandedColumn11: TcxGridDBBandedColumn;
        cxGridDBBandedColumn12: TcxGridDBBandedColumn;
        cxGridLevel3: TcxGridLevel;
        cxGrid3: TcxGrid;
        cxGridDBBandedTableView2: TcxGridDBBandedTableView;
        cxGridDBBandedColumn13: TcxGridDBBandedColumn;
        cxGridDBBandedColumn14: TcxGridDBBandedColumn;
        cxGridDBBandedColumn15: TcxGridDBBandedColumn;
        cxGridDBBandedColumn16: TcxGridDBBandedColumn;
        cxGridDBBandedColumn17: TcxGridDBBandedColumn;
        cxGridDBBandedColumn18: TcxGridDBBandedColumn;
        cxGridDBBandedColumn19: TcxGridDBBandedColumn;
        cxGridDBBandedColumn20: TcxGridDBBandedColumn;
        cxGridDBBandedColumn21: TcxGridDBBandedColumn;
        cxGridDBBandedColumn22: TcxGridDBBandedColumn;
        cxGridDBBandedColumn23: TcxGridDBBandedColumn;
        cxGridDBBandedColumn24: TcxGridDBBandedColumn;
        cxGridLevel2: TcxGridLevel;
        cxGrid5: TcxGrid;
        cxGridDBBandedTableView3: TcxGridDBBandedTableView;
        cxGridLevel4: TcxGridLevel;
        DataSetNad: TpFIBDataSet;
        DataSourceNad: TDataSource;
        cxGridDBBandedTableView3DATE_BEG: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3DATE_END: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3PERCENT: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SUMMA: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3ID_RAISE: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SOVM_ID_DEPARTMENT: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SOVM_ID_POST_SALARY: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SOVM_ID_TYPE_POST: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SOVM_KOEFF_PPS: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SOVM_ID_PCARD: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3ID_ORDER_ITEM: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3ID_SMET: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3ID_SMET_PPS: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SUMMA_SM: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SUMMA_PPS: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3ID_REC: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3DATE_BEG_SM: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3DATE_END_SM: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SMETA_NAME: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3SMETA_PPS_NAME: TcxGridDBBandedColumn;
        cxGridDBBandedTableView3RAISE_NAME: TcxGridDBBandedColumn;
        cxGrid6: TcxGrid;
        cxGridDBBandedTableView4: TcxGridDBBandedTableView;
        cxGridDBBandedColumn25: TcxGridDBBandedColumn;
        cxGridDBBandedColumn26: TcxGridDBBandedColumn;
        cxGridDBBandedColumn27: TcxGridDBBandedColumn;
        cxGridDBBandedColumn28: TcxGridDBBandedColumn;
        cxGridDBBandedColumn29: TcxGridDBBandedColumn;
        cxGridDBBandedColumn30: TcxGridDBBandedColumn;
        cxGridDBBandedColumn31: TcxGridDBBandedColumn;
        cxGridDBBandedColumn32: TcxGridDBBandedColumn;
        cxGridDBBandedColumn33: TcxGridDBBandedColumn;
        cxGridDBBandedColumn34: TcxGridDBBandedColumn;
        cxGridDBBandedColumn35: TcxGridDBBandedColumn;
        cxGridDBBandedColumn36: TcxGridDBBandedColumn;
        cxGridDBBandedColumn37: TcxGridDBBandedColumn;
        cxGridDBBandedColumn38: TcxGridDBBandedColumn;
        cxGridDBBandedColumn39: TcxGridDBBandedColumn;
        cxGridDBBandedColumn40: TcxGridDBBandedColumn;
        cxGridDBBandedColumn41: TcxGridDBBandedColumn;
        cxGridDBBandedColumn42: TcxGridDBBandedColumn;
        cxGridDBBandedColumn43: TcxGridDBBandedColumn;
        cxGridDBBandedColumn44: TcxGridDBBandedColumn;
        cxGridDBBandedColumn45: TcxGridDBBandedColumn;
        cxGridLevel5: TcxGridLevel;
        DataSetNadNew: TpFIBDataSet;
        DataSourceNadNew: TDataSource;
        dxBarButton1: TdxBarButton;
        btnEdit: TdxBarLargeButton;
        Image1: TImage;
        Image2: TImage;
        TmpDataSet: TpFIBDataSet;
        DataSetShadow: TpFIBDataSet;
        UPConsts: TpFIBDataSet;
        cxGrid1DBTableView1Id_Type_Away: TcxGridDBColumn;
        cxGrid1DBTableView1Id_Pcard_Away: TcxGridDBColumn;
        cxGrid1DBTableView1Id_Key: TcxGridDBColumn;
        cxGrid2DBCardView1Id_Type_Away: TcxGridDBCardViewRow;
        cxGrid2DBCardView1Id_Pcard_Away: TcxGridDBCardViewRow;
        cxGrid2DBCardView1Id_Key: TcxGridDBCardViewRow;
        cxGrid1DBTableView1Away_Info: TcxGridDBColumn;
        cxGrid2DBCardView1Away_Info: TcxGridDBCardViewRow;
        ReasonSet: TpFIBDataSet;
    WorkModeSet: TpFIBDataSet;
    TSWorkMode: TcxTabSheet;
    cxGrid7: TcxGrid;
    cxGridLevel6: TcxGridLevel;
    cxGrid8: TcxGrid;
    cxGridLevel7: TcxGridLevel;
    WorkModeTableView1: TcxGridTableView;
    WorkModeTableView2: TcxGridTableView;
    WorkModeTableView1Column1: TcxGridColumn;
    WorkModeTableView1Column2: TcxGridColumn;
    WorkModeTableView1Column3: TcxGridColumn;
    WorkModeTableView1Column4: TcxGridColumn;
    WorkModeTableView1Column5: TcxGridColumn;
    WorkModeTableView1Column6: TcxGridColumn;
    WorkModeTableView1Column7: TcxGridColumn;
    WorkModeTableView1Column8: TcxGridColumn;
    WorkModeTableView2Column1: TcxGridColumn;
    WorkModeTableView2Column2: TcxGridColumn;
    WorkModeTableView2Column3: TcxGridColumn;
    WorkModeTableView2Column4: TcxGridColumn;
    WorkModeTableView2Column5: TcxGridColumn;
    WorkModeTableView2Column6: TcxGridColumn;
    WorkModeTableView2Column7: TcxGridColumn;
    WorkModeTableView2Column8: TcxGridColumn;
    WMDSet: TpFIBDataSet;
    WMDSetNew: TpFIBDataSet;
    Panel4: TPanel;
    lblWShiftOld: TcxLabel;
    lblWShiftNew: TcxLabel;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure btnAddClick(Sender: TObject);
        procedure btnDeleteClick(Sender: TObject);
        procedure btnOkClick(Sender: TObject);
        procedure btnEditMassClick(Sender: TObject);
        procedure btnCancelClick(Sender: TObject);
        procedure btnViewClick(Sender: TObject);
        procedure Panel3Click(Sender: TObject);
        procedure cxTabSheet2Resize(Sender: TObject);
        procedure cxGrid2Resize(Sender: TObject);
        procedure cxTabSheet3Resize(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure cxGrid1DBTableView1CustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
        procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormShow(Sender: TObject);
        procedure cxGrid2DBCardView1KeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure cxGridDBBandedTableView2KeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure cxGridDBBandedTableView1KeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure cxGridDBBandedTableView4KeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
        procedure cxGridDBBandedTableView3KeyDown(Sender: TObject;
            var Key: Word; Shift: TShiftState);
    procedure ReadDataSet2EndScroll(DataSet: TDataSet);
    procedure FormResize(Sender: TObject);
    procedure ReadDataSetEndScroll(DataSet: TDataSet);
    procedure cxGrid8Resize(Sender: TObject);
    private
        isFrame: boolean;
        function ShowFilter(id_session, id_order_type: int64): boolean;
        procedure SelectAll(IdManMoving:Integer);
    public
        PC: TFMASAppModule;
        id_user: Integer;
        Input: TrxMemoryData;
        Mode, man_mov: integer;
       // check_date_beg,check_date_end:date;
        id_session: int64;
        err_id_order_item: int64;
        IdOrderType:Integer;
        isContinue, isTemp, isEditSmet, isWorkModeEdit: boolean;
        isDepartmentEdit: Boolean;
        isChangeTeachingLoad: Boolean; //изменение пед.нагрузки
        constructor Create(AOwner: TComponent; inp: TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame: boolean); reintroduce;
    end;

    TUP_MoveOrder = class(TSprav)
    public
        frm: TfrmMoveOrder;
        constructor Create;
        procedure Show; override;
        function GetFrame: TFrame; override;
    end;

function CreateSprav: TSprav; stdcall;
exports CreateSprav;

implementation
uses BaseTypes, qFTools, uMoveAdd;
{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TUP_MoveOrder.Create;
end;

constructor TUP_MoveOrder.Create;
begin
    inherited Create;
    Input.FieldDefs.Add('id_order', ftInteger);
    Input.FieldDefs.Add('id_order_type', ftInteger);
    Input.FieldDefs.Add('id_item', ftInteger);
    Input.FieldDefs.Add('Date_Order', ftDate);
    Input.FieldDefs.Add('outer_hwnd', ftInteger);
    Input.FieldDefs.Add('mode', ftInteger);
    Input.FieldDefs.Add('num_item', ftInteger);
    Input.FieldDefs.Add('num_sub_item', ftInteger);
    PrepareMemoryDatasets;
end;

function TUP_MoveOrder.GetFrame: TFrame;
begin
    frm := TfrmMoveOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), true);
    Result := TFrame(frm);
end;

procedure TUP_MoveOrder.Show;
begin
    frm := TfrmMoveOrder.Create(Application.MainForm, Input, TISC_DB_HANDLE(integer(Input['DBHandle'])), false);
    frm.ShowModal;
    frm.Free;
end;

function TfrmMoveOrder.ShowFilter(id_session, id_order_type: int64): boolean;
var Count: Integer;
begin
    Result := false;
    //Инициализация входящих параметров
    PC.InParams.Items['AOwner'] := @self;
    PC.InParams.Items['DbHandle'] := PInteger(@Database.Handle);
    PC.InParams.Items['Id_User'] := PInteger(@id_user);
    PC.InParams.Items['Id_order_type'] := PInteger(@id_order_type);
    PC.InParams.Items['KEY_SESSION'] := PInt64(@id_session);

    (PC as IFMASTemporaryDataStorage).ClearTmpData;

    //Запуск фильтра
    (PC as IFMASModule).Run;

    if (PInteger(PC.OutParams.Items['Count'])^) = 0
        then
        agMessageDlg('Увага!', 'За встановленими настройками фільтра не знайдено жодної позиції! Спробуйте ще раз!', mtInformation, [mbOk]);

    if (PInteger(PC.OutParams.Items['Count'])^) > 0
        then
    begin
        //Получение количества записей которые вернул фильтр
        Count := PInteger(PC.OutParams.Items['Count'])^;
        Result := Count > 0;
    end;

end;

procedure TfrmMoveOrder.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    WriteDataSet.Transaction.StartTransaction;
    StoredProc.StoredProcName := 'UP_KER_CLEAR_TMP_EX';
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    StoredProc.ExecProc;
    WriteDataSet.Transaction.Commit;
    if Assigned(PC) then PC.Free;
end;

procedure TfrmMoveOrder.SelectAll(IdManMoving:Integer);
begin
    DataSetNad.Close;
    DataSetNadNew.Close;
    ReadDataSet.Close;
    ReadDataSet2.Close;
    DataSetSmet.Close;
    DataSetSmetNew.Close;
    ReadDataSet.ParamByName('ID_SESSION').AsInt64 := id_session;
    ReadDataSet2.ParamByName('ID_SESSION').AsInt64 := id_session;
    DataSetSmet.ParamByName('ID_SESSION').AsInt64 := id_session;
    DataSetSmetNew.ParamByName('ID_SESSION').AsInt64 := id_session;
    DataSetNad.ParamByName('ID_SESSION').AsInt64 := id_session;
    DataSetNadNew.ParamByName('ID_SESSION').AsInt64 := id_session;
    ReadDataSet.Open;
    ReadDataSet2.Open;
    DataSetSmet.Open;
    DataSetSmetNew.Open;
    DataSetNad.Open;
    DataSetNadNew.Open;
    If IdManMoving<>-1 then ReadDataSet.Locate('Id_Man_Moving', IdManMoving, []);
end;

procedure TfrmMoveOrder.btnAddClick(Sender: TObject);
//var
// frm : TfrmAddMoving;
begin
    if not ShowFilter(id_session, input['id_order_type']) then
    begin
        ShowMessage('Не відобрано записів');
        exit;
    end;
    StoredProc.StoredProcName := 'UP_DT_MAN_MOVING_BUFF_ADD';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_ORDER').AsInt64 := input['ID_ORDER'];
    StoredProc.ParamByName('ID_ORDER_TYPE').AsInt64 := input['ID_ORDER_TYPE'];
    StoredProc.ParamByName('ID_SESSION').AsInt64 := id_session;
    StoredProc.ParamByName('NUM_ITEM').AsInt64 := input['num_item'];
    StoredProc.ParamByName('NUM_SUB_ITEM').AsInt64 := input['num_sub_item'];
    try
        StoredProc.ExecProc;
    except
        on e: Exception do
        begin
            ShowMessage(e.Message);
            StoredProc.Transaction.Rollback;
            exit;
        end
    end;
    StoredProc.Transaction.Commit;
    SelectAll(-1);
    StoredProc.StoredProcName := 'UP_KER_DO_RENUMERATION_BUFF';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    try
        StoredProc.ExecProc;
    except
        on e: Exception do
        begin
            ShowMessage(e.Message);
            StoredProc.Transaction.Rollback;
            exit;
        end
    end;
    StoredProc.Transaction.Commit;
    // frm := TfrmAddMoving.Create(Self);
    // if frm.ShowModal
end;

procedure TfrmMoveOrder.btnDeleteClick(Sender: TObject);
begin
    if ReadDataSet.RecordCount = 0 then exit;
    StoredProc.StoredProcName := 'UP_DT_MAN_MOVING_BUFF_MOV_DEL';
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := TFIBBCDField(ReadDataSet.FBN('ID_ORDER_ITEM')).AsInt64;
    StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
    try
        StoredProc.ExecProc;
    except
        StoredProc.Transaction.Rollback;
        exit;
    end;
    StoredProc.Transaction.Commit;
    ReadDataSet.CacheDelete;
end;

procedure TfrmMoveOrder.btnOkClick(Sender: TObject);
var
    doCommit: boolean;
    st: UP_KERNEL_MODE_STRUCTURE;
begin
    doCommit := true;
    err_id_order_item := -9999;
    if Mode = 3 then btnCancelClick(Sender);

    if ReadDataSet.RecordCount <> 0 then
    begin
        ReadDataSet.First;
        WriteTransaction.StartTransaction;
        while not ReadDataSet.Eof do
        begin
            if not VarIsNull(input['id_item']) then
            begin
                StoredProc.StoredProcName := 'UP_DT_ORDER_MAIN_ITEM_UPD';
                StoredProc.prepare;
                StoredProc.ParamByName('ID_OLD').AsInt64 := input['id_item'];
                StoredProc.ParamByName('ID_NEW').AsInt64 := ReadDataSet['ID_ORDER_ITEM'];
                StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
                StoredProc.ExecProc;
                StoredProc.Close;
            end;

            st.AOWNER := self;
            st.ID_ORDER := input['ID_ORDER'];
            if not VarIsNull(input['id_item']) then
                st.ID_ORDER_ITEM_IN := input['id_item']
            else st.ID_ORDER_ITEM_IN := ReadDataSet['ID_ORDER_ITEM'];
            st.KEY_SESSION := id_session;
            st.DBHANDLE := Database.Handle;
            st.TRHANDLE := WriteTransaction.Handle;
            doCommit := UpKernelDo(@st);
            if doCommit = false then
            begin
                err_id_order_item := ReadDataSet['ID_ORDER_ITEM'];
                GetUpSessionErrors(self, Database.Handle, id_session, ReadDataSet['ID_ORDER_ITEM']);
                SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
                SelectAll(-1);
                //exit;
                Break;
                //выйти из цикла и откатить транзакзию
            end;

            DatasetShadow.Close;
            //DatasetShadow.SelectSQL.Text := 'select ID_ITEM from UP_DT_ORDER_ITEMS_BUFF where linkto = ' + IntToStr(ReadDataSet['ID_ORDER_ITEM']);
            DatasetShadow.SelectSQL.Text := 'select ID_ITEM from Up_Man_Mov_Items_Tree_Buff(:ID_ORDER,:ID_ROOT_ITEM)';
            DatasetShadow.ParamByName('ID_ORDER').AsInt64 := input['ID_ORDER'];
            DatasetShadow.ParamByName('ID_ROOT_ITEM').AsInt64 := ReadDataSet['ID_ORDER_ITEM'];

            DatasetShadow.Open;
            if DatasetShadow.RecordCount <> 0 then
            begin
                while not DatasetShadow.Eof do
                begin
                    st.AOWNER := self;
                    st.ID_ORDER := input['ID_ORDER'];
                    st.ID_ORDER_ITEM_IN := DatasetShadow['ID_ITEM'];
                    st.KEY_SESSION := id_session;
                    st.DBHANDLE := Database.Handle;
                    st.TRHANDLE := WriteTransaction.Handle;
                    doCommit := UpKernelDo(@st);
                    if doCommit = false then
                    begin
                        err_id_order_item := ReadDataSet['ID_ORDER_ITEM'];
                        //GetUpSessionErrors(self, Database.Handle, id_session, ReadDataSet['ID_ORDER_ITEM']);
                        GetUpSessionErrors(self, Database.Handle, id_session, DatasetShadow['ID_ITEM']);
                        DatasetShadow.Close;
                        ReadDataSet.Close;
                        SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_ERR, 0, 0);
                        //NagScreen.Close;
                        //NagScreen.Free;
                        SelectAll(-1);
                        //exit;
                        Break;
                        //выйти из цикла и откатить транзакзию
                    end;
                    DatasetShadow.Next;
                end; {конец цикла по DatasetShadow}
            end;
            //end;
            DatasetShadow.Close;
            //выйти из цикла и откатить транзакзию
            if doCommit = false then Break;

            ReadDataSet.Next;
        end; {конец цикла по ReadDataSet}

        if doCommit = false
            then
            WriteTransaction.Rollback
        else
        begin
            WriteTransaction.Commit;
            SendMessage(input['outer_hwnd'], FMAS_MESS_SAVE_ITEM_OK, 0, 0);
        end;
    end;

end;

constructor TfrmMoveOrder.Create(AOwner: TComponent; inp: TRxMemoryData; hnd: TISC_DB_HANDLE; in_isFrame: boolean);
var i, check:Integer;
begin
    inherited Create(AOwner);
    err_id_order_item := -9999;
    Self.isFrame := in_isFrame;
    Input := inp;
    Mode := Input['mode'];
    if isFrame then
    begin
        BorderStyle := bsNone;
        BorderIcons := [];
        Visible := true;
        SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_OK, btnOk.Handle, btnOk.Handle);
        SendMessage(input['outer_hwnd'], FMAS_MESS_GET_BUTTON_CANCEL, btnCancel.Handle, btnCancel.Handle); if isFrame then
    end;
    Database.Handle := hnd;
    //  if Mode = 0 then
    //  begin
    WriteDataSet.Transaction.StartTransaction;
    //Получаем идентификатор сессиии
    WriteDataSet.SelectSQL.Text := 'select gen_id(GEN_UP_ID_SESSION, 1) from ini_asup_consts';
    WriteDataSet.Open;
    id_session := WriteDataSet.Fields[0].Value;
    WriteDataSet.Close;
    WriteDataSet.Transaction.Commit;

    for i:=0 to WorkModeTableView1.ColumnCount-1 do
        WorkModeTableView1.Columns[i].DataBinding.ValueTypeClass:=TcxStringValueType;

    for i:=0 to WorkModeTableView2.ColumnCount-1 do
        WorkModeTableView2.Columns[i].DataBinding.ValueTypeClass:=TcxStringValueType;
        
    TSWorkMode.TabVisible:=True;
    check:=fibCheckPermission('/ROOT/Up_order_system/Up_order_types/'+IntToStr(input['id_order_type'])+
                             '_UP_ORDER_TYPE/'+IntToStr(input['id_order_type'])+'_WORKMODE_TAB', 'Edit');
    if Check<>0 then TSWorkMode.TabVisible:=False;

    WriteDataSet.Transaction.StartTransaction;
    WriteDataSet.SelectSQL.Text := 'select moving_type from UP_DT_ORDER_TYPE where id_type = ' + IntToStr(input['id_order_type']);
    WriteDataSet.Open;
    isContinue := WriteDataSet.fbn('MOVING_TYPE').AsInteger = 3; // Вызвано как продление
    isTemp := WriteDataSet.fbn('MOVING_TYPE').AsInteger = 23; // Вызвано как временный перевод
    isEditSmet := WriteDataSet.fbn('MOVING_TYPE').AsInteger = 24; // Вызвано как редактирование источников финансирования
    isWorkModeEdit := input['ID_ORDER_TYPE']=26;
    isDepartmentEdit := input['ID_ORDER_TYPE']=30;
    isChangeTeachingLoad := input['ID_ORDER_TYPE']=32; // Вызвано как изменение пед.нагрузки
    WriteDataSet.Close;
    WriteDataSet.Transaction.Commit;

    //  end;
    if (Mode = 1) or (Mode = 2) then
    begin
        btnDelete.Enabled := false;
        btnAdd.Enabled := false;
        StoredProc.Transaction.StartTransaction;
        StoredProc.StoredProcName := 'UP_DT_MAN_MOVING_BUFF_FILL';
        StoredProc.Prepare;
        //    StoredProc.ParamByName('ID_ORDER').AsInt64 := Input['ID_ORDER'];
        StoredProc.ParamByName('ID_ORDER_ITEM').AsInt64 := Input['ID_ITEM'];
        StoredProc.ParamByName('KEY_SESSION').AsInt64 := id_session;
        StoredProc.ExecProc;
        StoredProc.Transaction.Commit;
        SelectAll(-1);
    end;
    if Mode = 2 then
    begin
        btnAdd.Enabled := false;
        btnEdit.Enabled := false;
        btnDelete.Enabled := false;
        btnOk.Enabled := false;
    end;
end;

procedure TfrmMoveOrder.btnEditMassClick(Sender: TObject);
var
    frm: TfrmAddMoving;
    i, LocId: Integer;
    Res:Variant;
begin
  try
    if ReadDataSet.RecordCount > 0 then
    begin
        LocId:=ReadDataSet['Id_Man_Moving'];
        ReasonSet.Close;
        ReasonSet.SQLs.SelectSQL.Text := 'select * from UP_SYS_INI_CONSTS';
        ReasonSet.Open;

        TmpDataSet.Close;
        TmpDataSet.SQLs.SelectSQL.Text := 'select * from UP_DT_MAN_MOVING_BUFF_MOV_SEL2(:ID_SESSION, :ID_ORDER_ITEM)';
        TmpDataSet.ParamByName('ID_SESSION').AsInteger := id_session;
        TmpDataSet.ParamByName('ID_ORDER_ITEM').AsInteger := TFIBBCDField(ReadDataSet.FBN('ID_ORDER_ITEM')).AsInteger;
        TmpDataSet.Open;
        man_mov := TmpDataSet['ID_MAN_MOVING'];

        frm := TfrmAddMoving.Create(Self, Input['id_order_type']);
        frm.Database.handle := Database.Handle;
        frm.id_order_item := TFIBBCDField(ReadDataSet.FBN('ID_ORDER_ITEM')).AsInt64;
        frm.id_session := id_session;
        frm.MassEdit := Sender = btnEditMass;
        frm.cxPageControl1.ActivePageIndex := cxPageControl1.ActivePageIndex;
        frm.DSetSmet.Close;
        frm.DSetSmet.SQLs.SelectSQL.Text := 'select * from UP_DT_MAN_SMET_BUFF_MOV_SEL(:ID_SESSION, 0, :ID_MAN_MOVING, :ID_ORDER_ITEM)';
        frm.DSetSmet.ParamByName('ID_SESSION').AsInteger := id_session;
        frm.DSetSmet.ParamByName('ID_ORDER_ITEM').AsInteger := TFIBBCDField(ReadDataSet.FBN('ID_ORDER_ITEM')).AsInteger;
        frm.DSetSmet.ParamByName('ID_MAN_MOVING').AsInteger := man_mov;
        frm.DSetSmet.Open;
        //****
        frm.WriteTransaction.StartTransaction;
        frm.StoredProcSmet.Close;
        frm.StoredProcSmet.StoredProcName := 'UP_DT_ID_SH_R_BUFF_MOV_SEL';
        frm.StoredProcSmet.ParamByName('KEY_SESSION').AsInteger := id_session;
        frm.StoredProcSmet.ParamByName('IS_NEW').AsInt64 := 1;
        frm.StoredProcSmet.ParamByName('ID_MAN_MOVING').AsInteger := man_mov;
    //перекладываем данные о идентификаторах ШР во временную таблицу
        if frm.MassEdit then
            frm.StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsVariant := Null
        else
            frm.StoredProcSmet.ParamByName('ID_ORDER_ITEM').AsInteger := TFIBBCDField(ReadDataSet.FBN('ID_ORDER_ITEM')).AsInteger;
    try
        frm.StoredProcSmet.ExecProc;
        frm.StoredProcSmet.Transaction.Commit;
    except on E:Exception do
        begin
            ShowMessage(E.Message);
            frm.StoredProcSmet.Transaction.Rollback;
        end;
    end;
        frm.StoredProcSmet.Close;

        frm.rc1 := frm.DSetSmet['sum_rate_count'];
        frm.rc2 := frm.DSetSmet['sum_rate_count'];

        frm.DSetIdShR.Close;
        frm.DSetIdShR.SelectSQL.Text := 'SELECT * FROM Up_Accept_Sh_R_Tmp WHERE KEY_SESSION=:KEY_SESSION';
        frm.DSetIdShR.ParamByName('key_session').AsInt64 := id_session;
        frm.DSetIdShR.Open;
        frm.DSetIdShR.FetchAll;

        if frm.DSetIdShR.RecordCount > 0 then
        begin
            frm.DepartmentEdit.Blocked := True;

            frm.PosadOkladEdit.Blocked := True;
            frm.PersonalTypeEdit.Blocked := True;

        end;

        frm.man_m := man_mov;
        if frm.MassEdit then
        begin
            frm.cxPageControl1.Pages[1].Destroy;
            frm.cxPageControl1.Pages[1].Destroy;
        end;

        frm.isContinue := isContinue;
        frm.isTemp := isTemp;
        frm.IsEditSmet := isEditSmet;
        frm.isWorkModeEdit:=isWorkModeEdit;
        frm.isDepartmentEdit := isDepartmentEdit;
        frm.isChangeTeachingLoad :=  isChangeTeachingLoad;
        //  frm.cxPageControl1.Pages[2].Visible := not frm.MassEdit;
          // Заполняем поля данными
        ReadDataSet2.Last;
        frm.cxDateBegEdit.Date := ReadDataSet2['DATE_BEG'];
        if (DateToStr(ReadDataSet2['DATE_END']) = '31.12.9999') then
        begin
            frm.cxDateEndEdit.Visible := False;
            frm.cbNoDateEnd.Value := True;
        end;
        frm.cxDateEndEdit.Date := ReadDataSet2['DATE_END'];
        frm.Date_B := ReadDataSet2['DATE_BEG'];
        frm.Date_E := ReadDataSet2['DATE_END'];
        frm.Absent.Value := ReadDataSet2['Id_Key'];
        frm.Absent.DisplayText := ReadDataSet2['Away_Info'];
        if VarIsNull(ReadDataSet2['Id_Type_Away'])
            then frm.Id_Type_Away := -1
        else
            frm.Id_Type_Away := ReadDataSet2['Id_Type_Away'];
        if VarIsNull(ReadDataSet2['Id_PCard_Away'])
            then frm.Id_PCard_Away := -1
        else
            frm.Id_PCard_Away := ReadDataSet2['Id_PCard_Away'];

        If Not VarIsNull(ReadDataSet2['Absent_Date_Beg']) then frm.AbsentDateBeg:=ReadDataSet2['Absent_Date_Beg'];
        If Not VarIsNull(ReadDataSet2['Absent_Date_End']) then frm.AbsentDateEnd:=ReadDataSet2['Absent_Date_End'];
        if ReadDataSet2['Is_Ped_Work'] = 1 then
        begin
           frm.lblMonth.Visible := true;
           frm.cntMonth.Visible := true;
           frm.IsPedType := True;
        end;
        if (not VarIsNull(ReadDataSet2['Month_Hours_Count']))
        then frm.cntMonth.Text := IntToStr(ReadDataSet2['Month_Hours_Count'])
        else frm.cntMonth.Text := IntToStr(ReasonSet['months_count_default']);
        frm.MaxCntMonth := ReasonSet['MAX_MONTHS_COUNT'];
        frm.IdPcard := ReadDataSet2['Id_Pcard'];
        //frm.HolidayEdit.Value := ReadDataSet2['ID_MAN_HOLIDAY'];
        //frm.HolidayEdit.DisplayText := ReadDataSet2['HOLIDAY_DISPLAY_TEXT'];
        //frm.HospitalEdit.Value := ReadDataSet2['ID_MAN_HOSPITAL'];
        //frm.HospitalEdit.DisplayText := ReadDataSet2['HOSPITAL_DISPLAY_TEXT'];
        frm.DepartmentEdit.Value := ReadDataSet2['ID_DEPARTMENT'];
        frm.DepartmentEdit.DisplayText := ReadDataSet2['DEPARTMENT_NAME'];
        frm.PosadOkladEdit.Value := ReadDataSet2['ID_POST_SALARY'];
        frm.PosadOkladEdit.DisplayText := ReadDataSet2['POST_NAME'];
        frm.FactOkladEdit.Value := ReadDataSet2['ID_POST_SALARY_REAL'];
        frm.FactOkladEdit.DisplayText := ReadDataSet2['REAL_POST_NAME'];
        frm.PersonalTypeEdit.Value := ReadDataSet2['ID_TYPE_POST'];
        frm.PersonalTypeEdit.DisplayText := ReadDataSet2['NAME_TYPE_POST'];
        frm.WorkReasonEdit.Value := ReadDataSet2['ID_WORK_REASON'];
        frm.WorkReasonEdit.DisplayText := ReadDataSet2['NAME_WORK_REASON'];
        frm.WorkCondEdit.Value := ReadDataSet2['ID_WORK_CONDITION'];
        frm.WorkCondEdit.DisplayText := ReadDataSet2['NAME_WORK_COND'];
        frm.PayFormEdit.Value := ReadDataSet2['ID_PAY_FORM'];
        frm.PayFormEdit.DisplayText := ReadDataSet2['NAME_PAY_FORM'];
        //If IsEditSmet then frm.ReasonEdit.Value:=ReasonSet['REASON_WORK']
        frm.ReasonEdit.Value := ReadDataSet2['REASON'];
        frm.NoteEdit.Value := ReadDataSet2['NOTE'];
        frm.CondEdit.Value := ReadDataSet2['ID_ACCEPT_COND'];
        frm.CondEdit.DisplayText := ReadDataSet2['NAME_ACCEPT_COND'];
        if not VarIsNull(ReadDataSet2['ACCEPT_BEG']) then
            frm.cxDateBegObrEdit.Date := ReadDataSet2['ACCEPT_BEG']
        else
            frm.cxDateBegObrEdit.Text := '';
        if not VarIsNull(ReadDataSet2['ACCEPT_END']) then
            frm.cxDateEndObrEdit.Date := ReadDataSet2['ACCEPT_END']
        else
            frm.cxDateEndObrEdit.Text := '';
        frm.PayEdit.Value := ReadDataSet2['IS_TARIF'];
        frm.cbIsMainPost.Value := ReadDataSet2['IS_POST_MAIN'];
        If VarIsNull(ReadDataSet2['ID_WORK_MODE']) then frm.IdWorkMode:=Null
        else
        begin
           frm.IdWorkMode:=ReadDataSet2['ID_WORK_MODE'];
           Res:=GetWorkModeInfo(WorkModeSet, ReadDataSet2['ID_WORK_MODE']);
           If VarIsArray(Res) then
           begin
              frm.WorkModeSprav.Text:=Res[0];
              frm.MaxBound:=Res[1];
           end;
        end;
        if VarIsNull(ReadDataSet2['WORK_MODE_SHIFT']) then frm.ShiftEdit.Value:=0
        else frm.ShiftEdit.Value:=ReadDataSet2['WORK_MODE_SHIFT'];
        //if isTemp then
        //frm.cbBack.Value := 1
        //else
        //frm.cbBack.Value := 0;
        //frm.cbHosp.Value := ReadDataSet2['IS_ON_HOSPITAL'];
        //frm.cbHoliday.Value := ReadDataSet2['IS_ON_HOLIDAY'];

        if frm.cxDateEndEdit.Date = EncodeDate(3333, 12, 31) then
        begin
            frm.cbNoDateEnd.Value := True;
        end;

        if frm.MassEdit then
        begin
            TmpDataSet.Close;
            TmpDataSet.SelectSQL.Text := 'select * from UP_DT_MAN_BONUS_BUFF_DIFF_SEL(:KEY_SESSION)';
            TmpDataSet.ParamByName('KEY_SESSION').AsInt64 := id_session;
            TmpDataSet.Open;

            if TmpDataSet['DATE_BEG'] <> 1 then
            begin
                frm.cxDateBegEdit.Clear;
                frm.LblDateBegEdit.Style.Font.Color := SYS_MASS_COLOR;
            end;
            if TmpDataSet['DATE_END'] <> 1 then
            begin
                frm.cxDateEndEdit.Clear;
                frm.LblDateEndEdit.Style.Font.Color := SYS_MASS_COLOR;
            end;

            {if TmpDataSet['ID_MAN_HOLIDAY'] <> 1 then
            begin
              frm.HolidayEdit.Clear;
              frm.HolidayEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_MAN_HOSPITAL'] <> 1 then
            begin
              frm.HospitalEdit.Clear;
              frm.HospitalEdit.LabelColor := SYS_MASS_COLOR;
            end;  }
            if TmpDataSet['ID_DEPARTMENT'] <> 1 then
            begin
                frm.DepartmentEdit.Clear;
                frm.DepartmentEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_POST_SALARY'] <> 1 then
            begin
                frm.PosadOkladEdit.Clear;
                frm.PosadOkladEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_POST_SALARY_REAL'] <> 1 then
            begin
                frm.FactOkladEdit.Clear;
                frm.FactOkladEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_TYPE_POST'] <> 1 then
            begin
                frm.PersonalTypeEdit.Clear;
                frm.PersonalTypeEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_WORK_REASON'] <> 1 then
            begin
                frm.WorkReasonEdit.Clear;
                frm.WorkReasonEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_WORK_CONDITION'] <> 1 then
            begin
                frm.WorkCondEdit.Clear;
                frm.WorkCondEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_PAY_FORM'] <> 1 then
            begin
                frm.PayFormEdit.Clear;
                frm.PayFormEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['REASON'] <> 1 then
            begin
                frm.ReasonEdit.Clear;
                frm.ReasonEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['NOTE'] <> 1 then
            begin
                frm.NoteEdit.Clear;
                frm.NoteEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ID_ACCEPT_COND'] <> 1 then
            begin
                frm.CondEdit.Clear;
                frm.CondEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ACCEPT_BEG'] <> 1 then
            begin
                frm.cxDateBegObrEdit.Clear;
                frm.LblDateBegObrEdit.Style.Font.Color := SYS_MASS_COLOR;
            end;
            if TmpDataSet['ACCEPT_END'] <> 1 then
            begin
                frm.cxDateEndObrEdit.Clear;
                frm.LblDateEndObrEdit.Style.Font.Color := SYS_MASS_COLOR;
            end;
            if TmpDataSet['IS_TARIF'] <> 1 then
            begin
                frm.PayEdit.Clear;
                frm.PayEdit.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['IS_POST_MAIN'] <> 1 then
            begin
                frm.cbIsMainPost.Clear;
                frm.cbIsMainPost.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['WITH_RETURN'] <> 1 then
            begin
                //frm.cbBack.Clear;
                //frm.cbBack.LabelColor := SYS_MASS_COLOR;
            end;

            if TmpDataSet['Id_Key'] <> 1 then
            begin
                frm.Absent.Clear;
                frm.Absent.LabelColor := SYS_MASS_COLOR;
            end;
            {if TmpDataSet['IS_ON_HOSPITAL'] <> 1 then
            begin
              frm.cbHosp.Clear;
              frm.cbHosp.LabelColor := SYS_MASS_COLOR;
            end;
            if TmpDataSet['IS_ON_HOLIDAY'] <> 1 then
            begin
              frm.cbHoliday.Clear;
              frm.cbHoliday.LabelColor := SYS_MASS_COLOR;
            end; }
            TmpDataSet.close;
        end;

        if self.Mode = 2 then
        begin
            qFBlock(true, frm);
            frm.PosadOkladEdit.Blocked := True;
            frm.FactOkladEdit.Blocked := True;
            frm.PersonalTypeEdit.Blocked := True;
            frm.PosadOkladEdit.Enabled := false;
            frm.FactOkladEdit.Enabled := false;
            frm.PersonalTypeEdit.Enabled := false;
            frm.btnAdd.Enabled := false;
            frm.btnDelete.Enabled := false;
            frm.btnAdd.Enabled := false;
            frm.btnDelete.Enabled := false;
            frm.btnEditBonusSmet.Enabled:=False;
            frm.cxDateBegEdit.Enabled := false;
            frm.cxDateEndEdit.Enabled := false;
            frm.cxDateBegObrEdit.Enabled := false;
            frm.cxDateEndObrEdit.Enabled := false;
            frm.dxBarDockControl2.visible := true;
            frm.IdShr.Enabled := false;
            frm.RateCount.Enabled := false;
            frm.ShowButton.Visible := false;
            frm.FindIdShR.Visible := false;
            frm.AddIdShr.Visible := false;
            frm.DelIdShR.Visible := false;
            frm.WorkModeSprav.Enabled:=False;
            frm.ShiftEdit.Enabled:=False;
            frm.ShowModal;
        end
        else
        begin
            if ((isEditSmet) or (isWorkModeEdit) or (isDepartmentEdit) or (isChangeTeachingLoad)) then
            begin
                qFBlock(true, frm);
                frm.PosadOkladEdit.Blocked := True;
                frm.FactOkladEdit.Blocked := True;
                frm.PersonalTypeEdit.Blocked := True;
                frm.PosadOkladEdit.Enabled := false;
                frm.FactOkladEdit.Enabled := false;
                frm.PersonalTypeEdit.Enabled := false;
                frm.cxDateBegEdit.Enabled := True; //f
                frm.cxDateEndEdit.Enabled := True; //f
                frm.cxDateBegObrEdit.Enabled := false;
                frm.cxDateEndObrEdit.Enabled := false;
                frm.ReasonEdit.Enabled := true;
                frm.NoteEdit.Enabled := true;
                frm.ReasonEdit.Blocked := false;
                frm.NoteEdit.Blocked := false;

                frm.IdShr.Enabled := false;
                frm.RateCount.Enabled := false;
                frm.cntHours.Enabled := false;
                frm.cntMonth.Enabled := false;
                frm.ShowButton.Visible := false;
                frm.FindIdShR.Visible := false;
                frm.AddIdShr.Visible := false;
                frm.DelIdShR.Visible := false;
                frm.cbNoDateEnd.Blocked:=False;
            end
            else
            begin
                qFBlock(false, frm);
                frm.PosadOkladEdit.Blocked := false;
                frm.FactOkladEdit.Blocked := false;
                frm.PersonalTypeEdit.Blocked := false;
                frm.PosadOkladEdit.Enabled := True;
                frm.FactOkladEdit.Enabled := True;
                frm.PersonalTypeEdit.Enabled := True;
                frm.btnAdd.Enabled := True;
                frm.btnDelete.Enabled := True;
                frm.btnAdd.Enabled := True;
                frm.btnDelete.Enabled := True;
                frm.cxDateBegEdit.Enabled := True;
                frm.cxDateEndEdit.Enabled := True;
                frm.cxDateBegObrEdit.Enabled := True;
                frm.cxDateEndObrEdit.Enabled := True;
                frm.dxBarDockControl2.visible := true;
                frm.IdShr.Enabled := true;
                frm.RateCount.Enabled := true;
                frm.ShowButton.Visible := true;
                frm.FindIdShR.Visible := true;
                frm.AddIdShr.Visible := true;
                frm.DelIdShR.Visible := true;
            end;
            frm.WriteTransaction.StartTransaction;
            if frm.ShowModal = mrOk then
            begin
                frm.WriteTransaction.Commit;
                if self.Mode <> 2 then Selectall(LocId);
            end else frm.WriteTransaction.Rollback;
        end;
        frm.Free;
    end;
   except on e:Exception
   do ShowMessage(e.Message);
   end; 
end;

procedure TfrmMoveOrder.btnCancelClick(Sender: TObject);
begin
    if isFrame then SendMessage(input['outer_hwnd'], FMAS_MESS_CLOSE_FRAME, 0, 0) else Close;
end;

procedure TfrmMoveOrder.btnViewClick(Sender: TObject);
var
    md: integer;
begin
    md := Mode;
    Mode := 2;
    btnEditMassClick(btnEdit);
    Mode := md;
end;

procedure TfrmMoveOrder.Panel3Click(Sender: TObject);
begin
    cxPageControl1.Visible := not cxPageControl1.Visible;
    image1.Visible := cxPageControl1.Visible;
    image2.Visible := not cxPageControl1.Visible;
    panel3.Top := 0;
end;

procedure TfrmMoveOrder.cxTabSheet2Resize(Sender: TObject);
begin
    cxGrid3.Width := cxTabSheet2.ClientWidth div 2;
end;

procedure TfrmMoveOrder.cxGrid2Resize(Sender: TObject);
begin
    cxGrid2DBCardView1.OptionsView.CardWidth := cxGrid2.ClientWidth div 2 - 16;
end;

procedure TfrmMoveOrder.cxTabSheet3Resize(Sender: TObject);
begin
    cxGrid6.Width := cxTabSheet3.ClientWidth div 2;
end;

procedure TfrmMoveOrder.FormCreate(Sender: TObject);
begin
    cxPageControl1.ActivePageIndex := 0;

    id_user := AccMgmt.GetUserId;
    with TFMASAppModuleCreator.Create do
    begin
        PC := CreateFMASModule(ExtractFilePath(Application.ExeName) + 'up\', 'up_filter');
        if (PC = nil)
            then agMessageDlg('Увага!', 'Помилка при роботі з модулем up_filter.bpl', mtError, [mbOk]);
    end;
end;

procedure TfrmMoveOrder.cxGrid1DBTableView1CustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if AViewInfo.GridRecord.Values[cxGrid1DBTableView1ID_ORDER_ITEM.Index] = err_id_order_item then
    begin
        ACAnvas.Brush.Color := clRed;
    end;
end;

procedure TfrmMoveOrder.cxGrid1DBTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if key = VK_insert then btnAddClick(Self);
    if key = VK_DELETE then btnDeleteClick(Self);
    if key = VK_F2 then btnEditMassClick(Self);
    if ((ReadDataSet.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then ShowInfo(ReadDataSet);
end;

procedure TfrmMoveOrder.FormShow(Sender: TObject);
var Check:Integer;
begin
    cxGrid1.SetFocus;
    lblWShiftOld.Width:=100;
    lblWShiftNew.Width:=100;
end;

procedure TfrmMoveOrder.cxGrid2DBCardView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((ReadDataSet2.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then ShowInfo(ReadDataSet2);
end;

procedure TfrmMoveOrder.cxGridDBBandedTableView2KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((DataSetSmet.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then ShowInfo(DataSetSmet);
end;

procedure TfrmMoveOrder.cxGridDBBandedTableView1KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((DataSetSmetNew.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then ShowInfo(DataSetSmetNew);
end;

procedure TfrmMoveOrder.cxGridDBBandedTableView4KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((DataSetNad.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then ShowInfo(DataSetNad);
end;

procedure TfrmMoveOrder.cxGridDBBandedTableView3KeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if ((DataSetNadNew.RecordCount > 0) and (Key = VK_F12)
        and (ssShift in Shift)) then ShowInfo(DataSetNadNew);
end;


procedure TfrmMoveOrder.ReadDataSet2EndScroll(DataSet: TDataSet);
begin
   if ReadDataSet2['Fck_Order']=0 then
   begin
      FillWorkModeDSet(WMDSet, ReadDataSet2['Date_Beg'], ReadDataSet2['Date_End'], ReadDataSet2['Id_Work_Mode'],
                       Null, Null, ReadDataSet2['Work_Mode_Shift'], 7);
      FillWorkModeGrid(WorkModeTableView1, WMDSet);
      if ReadDataSet2['Work_Mode_Shift']=0 then
         lblWShiftOld.Caption:='Зсув: Не має'
      else lblWShiftOld.Caption:='Зсув: '+IntToStr(ReadDataSet2['Work_Mode_Shift'])+' д.'
   End;
end;

procedure TfrmMoveOrder.FormResize(Sender: TObject);
begin
   cxgrid7.Width:=Round(Self.Width/2);
end;

procedure TfrmMoveOrder.ReadDataSetEndScroll(DataSet: TDataSet);
begin
   FillWorkModeDSet(WMDSetNew, ReadDataSet['Date_Beg'], ReadDataSet['Date_End'], ReadDataSet['Id_Work_Mode'],
                    Null, Null, ReadDataSet['Work_Mode_Shift'], 7);
   FillWorkModeGrid(WorkModeTableView2, WMDSetNew);
   if ReadDataSet['Work_Mode_Shift']=0 then
      lblWShiftNew.Caption:='Зсув: Не має'
   else lblWShiftNew.Caption:='Зсув: '+IntToStr(ReadDataSet['Work_Mode_Shift'])+' д.'
end;

procedure TfrmMoveOrder.cxGrid8Resize(Sender: TObject);
begin
   lblWShiftNew.Left:=cxGrid8.Left
end;

end.

