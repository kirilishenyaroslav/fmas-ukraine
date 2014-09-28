unit uOrderItems;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, Buttons, ExtCtrls, FIBDataSet,
    pFIBDataSet, pFIBDatabase, ActnList, uActionControl, FIBDatabase,
    IBase;

type
    TfmOrderItems = class(TForm)
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
        OrderViewGrid: TcxGrid;
        OrderItemsView: TcxGridDBTableView;
        OrderViewGridLevel1: TcxGridLevel;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        ItemsSelect: TpFIBDataSet;
        SelectButton: TSpeedButton;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
        ItemsDataSource: TDataSource;
        ActionControl: TqFActionControl;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        SelectAction: TAction;
        NumItem: TcxGridDBColumn;
        Text: TcxGridDBColumn;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
        procedure SelectActionExecute(Sender: TObject);
        procedure OrderItemsViewDblClick(Sender: TObject);
    private
        Id_Order: Integer;
    public
        Num_Item: Integer;
        constructor Create(AOWner: TComponent; Id_Order: Integer;
            Handle: TISC_DB_HANDLE); reintroduce;
    end;

var
    fmOrderItems: TfmOrderItems;

implementation

{$R *.dfm}

uses uOrderItemEdit;

{ TfmOrderItems }

constructor TfmOrderItems.Create(AOWner: TComponent; Id_Order: Integer;
    Handle: TISC_DB_HANDLE);
begin
    inherited Create(AOwner);

    DB.Handle := Handle;
    Self.Id_Order := Id_Order;
    ActionControl.Database := DB;

    ItemsSelect.Close;
    ItemsSelect.ParamByName('Id_Order').AsInteger := Id_Order;
    ItemsSelect.Open;
end;

procedure TfmOrderItems.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmOrderItems.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmOrderItems.ActionControlBeforePrepare(Sender: TObject;
    Form: TForm);
begin
    if (Form is TfmOrderItemEdit) then
        (Form as TfmOrderItemEdit).Prepare(Id_Order);
end;

procedure TfmOrderItems.SelectActionExecute(Sender: TObject);
begin
    if not ItemsSelect.IsEmpty then
    begin
        Num_Item := ItemsSelect['Num_Item'];
        ModalResult := mrOk;
    end;
end;

procedure TfmOrderItems.OrderItemsViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

end.

