unit fmSpPochasTarifUnit;

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
  TfmSpPochasTarif = class(TForm)
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    KeyList: TActionList;
    Ok: TAction;
    Cancel: TAction;
    SmetSource: TDataSource;
    Add: TAction;
    Modify: TAction;
    Delete: TAction;
    View: TAction;
    WorkQuery: TpFIBDataSet;
    WorkQueryID_MAN_MOV_SMET: TFIBIntegerField;
    WorkQueryID_MAN_MOVING: TFIBIntegerField;
    WorkQueryKOD_SM: TFIBIntegerField;
    WorkQueryKOD_SM_PPS: TFIBIntegerField;
    WorkQueryKOEFF_PPS: TFIBFloatField;
    WorkQueryOKLAD: TFIBFloatField;
    WorkQueryOKLAD_PPS: TFIBFloatField;
    WorkQueryKOL_STAVOK: TFIBFloatField;
    WorkQueryDATE_BEG: TFIBDateField;
    WorkQueryDATE_END: TFIBDateField;
    WorkQueryOKLAD_BASE: TFIBFloatField;
    WorkQuerySM_TITLE: TFIBStringField;
    WorkQuerySM_PPS_TITLE: TFIBStringField;
    ResultQuery: TpFIBDataSet;
    Panel3: TPanel;
    AddItemButton: TSpeedButton;
    ModifyItemButton: TSpeedButton;
    DeleteItemButton: TSpeedButton;
    InfoButton: TSpeedButton;
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel5: TcxGridLevel;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    CancelButton: TSpeedButton;
    SelectButton: TSpeedButton;
    ResultQueryID_POCHAS_TARIF: TFIBIntegerField;
    ResultQueryPERIOD_BEG: TFIBDateField;
    ResultQueryPERIOD_END: TFIBDateField;
    ResultQueryTARIF: TFIBBCDField;
    ResultQueryID_TARIF_TYPE: TFIBIntegerField;
    ResultQueryKOD_SM: TFIBIntegerField;
    ResultQuerySM_TITLE: TFIBStringField;
    ResultQueryTARIF_TYPE_NAME: TFIBStringField;
    ResultQueryPERIOD_STR: TFIBStringField;
    ActionControl: TqFActionControl;
    RefreshButton: TSpeedButton;
    Refresh: TAction;
    SelectTarifType: TpFIBDataSet;
    SelectTarifTypeID_TARIF_TYPE: TFIBIntegerField;
    SelectTarifTypeTARIF_TYPE_NAME: TFIBStringField;
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
    procedure CancelExecute(Sender: TObject);
    procedure OkExecute(Sender: TObject);
    procedure cxGridDBTableView5DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    dmShtatUtils : TdmShtatUtils;
    SpDate : TDate;
  end;

  type
    TPochasTarifSprav = class(TSprav)
    private
        IsConnected: Boolean;
        Form : TfmSpPochasTarif;
    public
        constructor Create;
        destructor  Destroy;override;
        procedure   Show;override;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

var
  fmSpPochasTarif : TfmSpPochasTarif;

implementation

{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TPochasTarifSprav.Create;
end;

constructor TPochasTarifSprav.Create;
begin
    inherited Create;

    // создание входных/выходных полей
    Input.FieldDefs.Add('SpDate', ftDate);
    Input.FieldDefs.Add('SpMode', ftInteger);

    Output.FieldDefs.Add('Id_Tarif', ftInteger);
    Output.FieldDefs.Add('Tarif', ftFloat);
    Output.FieldDefs.Add('KOD_SM', ftInteger);
    Output.FieldDefs.Add('SM_TITLE', ftString, 255);

    Input.Open;
end;

destructor TPochasTarifSprav.Destroy;
begin
    inherited Destroy;
end;

procedure TPochasTarifSprav.Show;
var
    hnd : Integer;
begin
    Form := TfmSpPochasTarif.Create(Application.MainForm);

    Form.LocalReadTransaction.Active := False;
    Form.LocalWriteTransaction.Active := False;

    if Form.LocalDatabase.Connected then Form.LocalDatabase.Close;

    hnd := Input['DBHANDLE'];
    Form.LocalDatabase.Handle := TISC_DB_HANDLE(hnd);
    Form.SpDate := Input['SpDate'];
    Form.dmShtatUtils := TdmShtatUtils.Create(Application.MainForm, hnd, Form.SpDate);
    Form.ResultQuery.CloseOpen(True);

    fmSpPochasTarif := Form;

    if form.ShowModal = mrOk then begin
        Output.Open;
        Output.Append;
        Output['Id_Tarif'] := Form.ResultQueryID_POCHAS_TARIF.Value;
        Output['Tarif'] := Form.ResultQueryTARIF.Value;
        Output['KOD_SM'] := Form.ResultQueryKOD_SM.Value;
        Output['SM_TITLE'] := Form.ResultQuerySM_TITLE.Value;
        Output.Post;
    end;

    form.Free;
end;

procedure TfmSpPochasTarif.CancelExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSpPochasTarif.OkExecute(Sender: TObject);
begin
    if ResultQuery.IsEmpty then begin
        qFErrorDialog('Немає записів!');
        exit;
    end;

    ModalResult := mrOk;
end;

procedure TfmSpPochasTarif.cxGridDBTableView5DblClick(Sender: TObject);
begin
    Ok.Execute;
end;

end.
