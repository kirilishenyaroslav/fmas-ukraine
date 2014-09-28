unit uDekretPeople;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, Buttons, ExtCtrls, cxClasses, FIBDataSet,
    pFIBDataSet, pFIBDatabase, cxGridBandedTableView, cxGridDBBandedTableView, IBase,
    ActnList, uFControl, uLabeledFControl, uDateControl;

type
    TfmDekretPeople = class(TForm)
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
        Panel1: TPanel;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        SelectButton: TSpeedButton;
        DekretPeople: TpFIBDataSet;
        DekretPeopleTN: TFIBIntegerField;
        DekretPeopleFIO: TFIBStringField;
        DekretPeopleDEPARTMENT_NAME: TFIBStringField;
        DekretPeoplePOST_NAME: TFIBStringField;
        DekretPeopleDATE_BEG: TFIBDateField;
        DekretPeopleDATE_END: TFIBDateField;
        DekretPeopleNUM_ORDER: TFIBStringField;
        DekretPeopleDATE_ORDER: TFIBDateField;
        DekretPeopleID_ORDER: TFIBIntegerField;
        DekretPeopleMAN_STRING: TFIBStringField;
        DekretPeoplePOST_STRING: TFIBStringField;
        DekretPeopleORDER_STRING: TFIBStringField;
        DekretPeopleHOL_STRING: TFIBStringField;
        DataSource1: TDataSource;
        DekretPeopleGrid: TcxGrid;
        DekretPeopleView: TcxGridDBTableView;
        DekretPeopleViewTN: TcxGridDBColumn;
        DekretPeopleViewPOST_NAME: TcxGridDBColumn;
        DekretPeopleViewFIO: TcxGridDBColumn;
        DekretPeopleViewDEPARTMENT_NAME: TcxGridDBColumn;
        DekretPeopleViewDATE_BEG: TcxGridDBColumn;
        DekretPeopleViewDATE_END: TcxGridDBColumn;
        DekretPeopleViewNUM_ORDER: TcxGridDBColumn;
        DekretPeopleViewDATE_ORDER: TcxGridDBColumn;
        DekretPeopleViewID_ORDER: TcxGridDBColumn;
        DekretPeopleViewMAN_STRING: TcxGridDBColumn;
        DekretPeopleViewPOST_STRING: TcxGridDBColumn;
        DekretPeopleViewORDER_STRING: TcxGridDBColumn;
        DekretPeopleViewHOL_STRING: TcxGridDBColumn;
        PeopleView: TcxGridDBBandedTableView;
        DekretPeopleGridLevel1: TcxGridLevel;
        PeopleViewTN: TcxGridDBBandedColumn;
        PeopleViewFIO: TcxGridDBBandedColumn;
        PeopleViewDEPARTMENT_NAME: TcxGridDBBandedColumn;
        PeopleViewPOST_NAME: TcxGridDBBandedColumn;
        PeopleViewDATE_BEG: TcxGridDBBandedColumn;
        PeopleViewDATE_END: TcxGridDBBandedColumn;
        PeopleViewNUM_ORDER: TcxGridDBBandedColumn;
        PeopleViewDATE_ORDER: TcxGridDBBandedColumn;
        PeopleViewID_ORDER: TcxGridDBBandedColumn;
        PeopleViewMAN_STRING: TcxGridDBBandedColumn;
        PeopleViewPOST_STRING: TcxGridDBBandedColumn;
        PeopleViewORDER_STRING: TcxGridDBBandedColumn;
        PeopleViewHOL_STRING: TcxGridDBBandedColumn;
        ActionList1: TActionList;
        RefreshAction: TAction;
        SelectAction: TAction;
        CloseAction: TAction;
    DekretPeopleID_MAN_MOVING: TIntegerField;
    Panel2: TPanel;
    CurDate: TqFDateControl;
        procedure PeopleViewDblClick(Sender: TObject);
        procedure RefreshActionExecute(Sender: TObject);
        procedure SelectActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    private
    { Private declarations }
    public
        constructor Create(AOwner: TComponent; tran: TpFIBTransaction; DateOrder: TDate); reintroduce;
    end;

var
    fmDekretPeople: TfmDekretPeople;

implementation

{$R *.dfm}

{ TfmDekretPeople }

constructor TfmDekretPeople.Create(AOwner: TComponent; tran: TpFIBTransaction; DateOrder: TDate);
begin
    inherited Create(AOwner);
    DekretPeople.Transaction := tran;
    CurDate.Value := DateOrder;
    RefreshAction.Execute;
end;

procedure TfmDekretPeople.PeopleViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

procedure TfmDekretPeople.RefreshActionExecute(Sender: TObject);
begin
    DekretPeople.Close;
    DekretPeople.ParamByName('Cur_Date').AsDate := CurDate.Value;
    DekretPeople.Open;
end;

procedure TfmDekretPeople.SelectActionExecute(Sender: TObject);
begin
    if not DekretPeople.IsEmpty then
        ModalResult := mrOk;
end;

procedure TfmDekretPeople.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

end.

