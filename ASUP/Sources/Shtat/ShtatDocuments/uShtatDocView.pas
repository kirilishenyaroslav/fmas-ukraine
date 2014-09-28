unit uShtatDocView;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uShtatDocMain, cxClasses, cxStyles, cxGridTableView,
    uActionControl, ActnList, Buttons, ExtCtrls, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
    cxControls, cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
    cxGrid, FIBDatabase, pFIBDatabase, uFormControl;

type
    TfmShtatDocView = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
        QuitAction: TAction;
        ActionControl: TqFActionControl;
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
        ShtatDocTableView: TcxGridDBTableView;
        cxGrid1Level1: TcxGridLevel;
        cxGrid1: TcxGrid;
        SelectButton: TSpeedButton;
        SelectAction: TAction;
        CloneAction: TAction;
        PrintAction: TAction;
        Panel2: TPanel;
        PlanValuesButton: TSpeedButton;
        PlanValuesAction: TAction;
        PrintButton: TSpeedButton;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        NewDoc: TSpeedButton;
        SpeedButton3: TSpeedButton;
    ShtatDocTableViewID_SR: TcxGridDBColumn;
    ShtatDocTableViewNAME: TcxGridDBColumn;
    ShtatDocTableViewDATE_BEG: TcxGridDBColumn;
    ShtatDocTableViewDATE_END: TcxGridDBColumn;
    ShtatDocTableViewIS_PLAN: TcxGridDBColumn;
    ShtatDocTableViewIS_PROD: TcxGridDBColumn;
    ShtatDocTableViewID_TAR_PLAN: TcxGridDBColumn;
    ShtatDocTableViewNAME_TAR_PLAN: TcxGridDBColumn;
    ShtatDocTableViewNAME_DEPARTMENT: TcxGridDBColumn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormDestroy(Sender: TObject);
        procedure QuitActionExecute(Sender: TObject);
        procedure SelectActionExecute(Sender: TObject);
        procedure ShtatDocTableViewDblClick(Sender: TObject);
        procedure PrintActionExecute(Sender: TObject);
        procedure PlanValuesActionExecute(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        procedure SpeedButton2Click(Sender: TObject);
        procedure NewDocClick(Sender: TObject);
        procedure SpeedButton3Click(Sender: TObject);
        procedure ShtatDocTableViewCustomDrawCell(
            Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
            AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure ActionControlBeforeDelete(Sender: TObject; Form: TForm;
      Mode: TFormMode; Transaction: TFIBTransaction);
    private
        Sprav: TShtatDoc;
    public
        constructor Create(AOwner: TComponent; sprav: TShtatDoc); reintroduce;
    end;

var
    fmShtatDocView: TfmShtatDocView;

implementation

uses uShtatDocData, uCommonSp, uShtatFunds, uShtatDefaultSmeta, uSmetaSplit,
    uFormNewShtat, uSRSmetaFilter, UpKernelUnit;

{$R *.dfm}

constructor TfmShtatDocView.Create(AOwner: TComponent; sprav: TShtatDoc);
begin
    inherited Create(AOwner);
    Self.Sprav := sprav;

    ActionControl.SelectDataSet := sprav.Data.ShtatDocSelect;
    sprav.Data.ShtatDocSelect.Close;
    sprav.Data.ShtatDocSelect.Open;
    sprav.Data.ShtatDocSelect.Last;

    ShtatDocTableView.DataController.DataSource := sprav.Data.ShtatDocSource;

    CancelButton.Align := alRight;
    SelectButton.Align := alRight;

    ActionControl.Database := sprav.Data.DB;
    ActionControl.SelectDataSet := sprav.Data.ShtatDocSelect;
end;

procedure TfmShtatDocView.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmShtatDocView.FormDestroy(Sender: TObject);
begin
    if FormStyle = fsMDIChild then Sprav.Free;
end;

procedure TfmShtatDocView.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatDocView.SelectActionExecute(Sender: TObject);
begin
    if Sprav.Data.ShtatDocSelect.IsEmpty then Exit;

    if (sprav.Output <> nil) and
        (not sprav.Data.ShtatDocSelect.IsEmpty) then
        with sprav.Output do
        begin
            Open;
            Append;
            FieldByName('Id_SR').AsInteger := sprav.Data.ShtatDocSelect['Id_SR'];
            FieldByName('Name').AsString := sprav.Data.ShtatDocSelect['Name'];
            FieldByName('Date_Beg').AsDateTime := sprav.Data.ShtatDocSelect['Date_Beg'];
            FieldByName('Date_End').AsDateTime := sprav.Data.ShtatDocSelect['Date_End'];
        end;
    ModalResult := mrOk;
end;

procedure TfmShtatDocView.ShtatDocTableViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

procedure TfmShtatDocView.PrintActionExecute(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\ShtatReport');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
                // присвоить хэндл базы данных
            FieldValues['DBHandle'] := Integer(sprav.Data.DB.Handle);
            Post;
        end;
    end;
        // просто показать справочник
    sp.Show;
end;

procedure TfmShtatDocView.PlanValuesActionExecute(Sender: TObject);
var
    form: TfmShtatSRFund;
begin
    if Sprav.Data.ShtatDocSelect.IsEmpty then Exit;

    form := TfmShtatSRFund.Create(Self, Sprav.Data);
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatDocView.SpeedButton1Click(Sender: TObject);
var
    form: TfmDefaultSmeta;
begin
    form := TfmDefaultSmeta.Create(Self, Sprav.Data);
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatDocView.SpeedButton2Click(Sender: TObject);
var
    form: TfmSmetaSplit;
begin
    form := TfmSmetaSplit.Create(Self);
    form.Data := Sprav.Data;
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatDocView.NewDocClick(Sender: TObject);
var
    form: TfmFormNewShtat;
begin
    form := TfmFormNewShtat.Create(Self);
    form.FormControl.Prepare(sprav.Data.DB, fmAdd, Null, Null);
    form.OLD_SR.Value := sprav.Data.ShtatDocSelect['Id_SR'];
    form.ShowModal;
    form.Free;
    RefreshAction.Execute;
end;

procedure TfmShtatDocView.SpeedButton3Click(Sender: TObject);
var
    form: TfmSrSmetaFilter;
begin
    form := TfmSrSmetaFilter.Create(Self, Sprav.Data);
    form.ShowModal;
    form.Free;
end;

procedure TfmShtatDocView.ShtatDocTableViewCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    if Sprav.Data.ShtatDocSelect.IsEmpty then Exit;

    if not AViewInfo.Selected then
        if (AViewInfo.GridRecord.Values[ShtatDocTableViewDATE_BEG.Index] <= Date)
            and (Date <= AViewInfo.GridRecord.Values[ShtatDocTableViewDATE_END.Index]) then
            ACanvas.Brush.Color := clSkyBlue
        else ACanvas.Brush.Color := clInfoBk
    else ACanvas.Brush.Color := clMoneyGreen;
end;

procedure TfmShtatDocView.ActionControlBeforeDelete(Sender: TObject;
  Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
begin
    UpKernelUnit.StartHistory(TpFIBTransaction(Transaction));
end;

end.

