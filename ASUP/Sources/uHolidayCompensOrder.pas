unit uHolidayCompensOrder;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, uActionControl, cxGridTableView,
    FIBDataSet, pFIBDataSet, RxMemDS, ActnList, FIBDatabase, pFIBDatabase,
    StdCtrls, Buttons, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
    cxClasses, cxControls, cxGridCustomView, cxGrid, ExtCtrls, PersonalCommon,
    SpCommon, qFTools, uHolidayCompensAdd;

type
    TfmHolidayCompensOrder = class(TForm)
        Panel3: TPanel;
        AddItemButton: TSpeedButton;
        ModifyItemButton: TSpeedButton;
        DeleteItemButton: TSpeedButton;
        InfoButton: TSpeedButton;
        ItemsGrid: TcxGrid;
        cxGridDBTableView5: TcxGridDBTableView;
        cxGridDBTableView5DBColumn1: TcxGridDBColumn;
        cxGridDBTableView5DBColumn6: TcxGridDBColumn;
        cxGridDBTableView5DBColumn3: TcxGridDBColumn;
        cxGridDBTableView5DBColumn4: TcxGridDBColumn;
        cxGridDBTableView5DBColumn5: TcxGridDBColumn;
        cxGridLevel5: TcxGridLevel;
        KeyList: TActionList;
        OkAction: TAction;
        CancelAction: TAction;
        AddCompens: TAction;
        ModifyCompens: TAction;
        DeleteCompens: TAction;
        ViewCompens: TAction;
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
        ActionControl: TqFActionControl;
        ResultQuery: TpFIBDataSet;
        ResultQueryID_HOLIDAY_COMPENS: TFIBIntegerField;
        ResultQueryPERIOD_BEG: TFIBDateField;
        ResultQueryPERIOD_END: TFIBDateField;
        ResultQueryDAYS_COUNT: TFIBIntegerField;
        ResultQueryREASON: TFIBStringField;
        ResultQueryID_MAN_MOVING: TFIBIntegerField;
        ResultQueryNUM_ITEM: TFIBIntegerField;
        ResultQueryFIO: TFIBStringField;
        ResultQueryDEPARTMENT: TFIBStringField;
        ResultQueryPOST: TFIBStringField;
        ResultQueryTN: TFIBIntegerField;
        DataSource: TDataSource;
        cxGridDBTableView5DBColumn2: TcxGridDBColumn;
        CloseButton: TSpeedButton;
        procedure FormResize(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure ActionControlAfterPrepare(Sender: TObject; Form: TForm);
        procedure CancelActionExecute(Sender: TObject);
    private
    { Private declarations }
    public
        Id_Order: Integer;
    end;

var
    fmHolidayCompensOrder: TfmHolidayCompensOrder;

implementation

{$R *.dfm}

procedure TfmHolidayCompensOrder.FormResize(Sender: TObject);
begin
    CloseButton.Left := Width - CloseButton.Width - 10;
end;

procedure TfmHolidayCompensOrder.FormCreate(Sender: TObject);
begin
    ResultQuery.Transaction := FibReadTransaction;
    ActionControl.Database := PersonalCommon.FIBDatabase;
end;

procedure TfmHolidayCompensOrder.ActionControlAfterPrepare(Sender: TObject;
    Form: TForm);
begin
//    ActionControl.AddKeys := Id_Order;

    (Form as TfmHolidayCompensAdd).Id_Order := Id_ORder;

    (Form as TfmHolidayCompensAdd).FormControl.InsertSQL.Text := StringReplace((Form as TfmHolidayCompensAdd).FormControl.InsertSQL.Text,
        ':id_order', IntToStr(Id_ORder), []);
    (Form as TfmHolidayCompensAdd).FormControl.UpdateSQL.Text := StringReplace((Form as TfmHolidayCompensAdd).FormControl.UpdateSQL.Text,
        ':id_order', IntToStr(Id_ORder), []);
end;

procedure TfmHolidayCompensOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

end.
