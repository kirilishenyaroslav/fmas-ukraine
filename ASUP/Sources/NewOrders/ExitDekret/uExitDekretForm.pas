unit uExitDekretForm;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, cxGridLevel,
    cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, FIBDataSet, pFIBDataSet,
    FIBDatabase, pFIBDatabase, uActionControl, ActnList, IBase;

type
    TfmExitDekretOrderForm = class(TForm)
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
        ExitDekretGrid: TcxGrid;
        ExitDekretView: TcxGridDBTableView;
        ExitDekretGridLevel1: TcxGridLevel;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        Panel3: TPanel;
        SelectByOrder: TpFIBDataSet;
        DB: TpFIBDatabase;
        ReadTransaction: TpFIBTransaction;
        Source: TDataSource;
        ActionControl: TqFActionControl;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
        DefaultTransaction: TpFIBTransaction;
    InsertNewOrder: TpFIBDataSet;
        WriteTransaction: TpFIBTransaction;
    TNColumn: TcxGridDBColumn;
    NumItemColumn: TcxGridDBColumn;
    FIOColumn: TcxGridDBColumn;
    DateRemoveColumn: TcxGridDBColumn;
    DepartmentColumn: TcxGridDBColumn;
    PostNameColumn: TcxGridDBColumn;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
        procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
        procedure FormCreate(Sender: TObject);
    private
        Date_Order: TDate;
        Id_Order: Integer;

    public
        procedure Prepare(Id_Order: Integer; Date_Order: TDate;
            Id_Order_Type: Integer; Num_Order: String; Note_Order: String;
            Handle: TISC_DB_HANDLE);

    end;

var
    fmExitDekretOrderForm: TfmExitDekretOrderForm;

implementation

{$R *.dfm}

uses uAddManExitDekret, qFTools;

procedure TfmExitDekretOrderForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmExitDekretOrderForm.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmExitDekretOrderForm.ActionControlBeforePrepare(Sender: TObject;
    Form: TForm);
begin
    if Form is TfmAddManExitDekret then
        (Form as TfmAddManExitDekret).Prepare(ReadTransaction, Id_Order, Date_Order);
end;

procedure TfmExitDekretOrderForm.FormCreate(Sender: TObject);
begin
    ActionControl.Database := DB;
end;

procedure TfmExitDekretOrderForm.Prepare(Id_Order: Integer;
    Date_Order: TDate; Id_Order_Type: Integer; Num_Order: String; Note_Order: String;
    Handle: TISC_DB_HANDLE);
begin
    Self.Id_Order := Id_Order;
    Self.Date_Order := Date_Order;

    DB.Handle := Handle;

    if Id_Order = -1 then
    begin
        if InsertNewOrder.Transaction.Active then
            InsertNewOrder.Transaction.Rollback;

        InsertNewOrder.Transaction.StartTransaction;

        try
            InsertNewOrder.Close;
            InsertNewOrder.ParamByName('Id_Order').AsInteger := 0;
            InsertNewOrder.ParamByName('Id_Order_Type').AsInteger := Id_Order_Type;
            InsertNewOrder.ParamByName('Num_Order').AsString := Num_Order;
            InsertNewOrder.ParamByName('Date_Order').AsDate := Date_Order;
            InsertNewOrder.ParamByName('Note').AsString := Note_Order;
            InsertNewOrder.ParamByName('Id_Status').AsInteger := 1;
            InsertNewOrder.Open;
            Self.Id_Order := InsertNewOrder['NEW_ID_ORDER'];

        except on E: Exception do
        begin
                InsertNewOrder.Transaction.Rollback;
                qFErrorDialog('Виникла помилка при додаванні наказу:"' + E.message + '"');
                exit;
            end;
        end;

       InsertNewOrder.Transaction.Commit;
    end;

    SelectByOrder.Close;
    SelectByOrder.ParamByName('Id_Order').AsInteger := Self.Id_Order;
    SelectByOrder.Open;
end;

end.

