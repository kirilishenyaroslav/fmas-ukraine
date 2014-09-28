unit uMassHolidayOrderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ActnList, cxGridTableView, StdCtrls,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Buttons, uActionControl,
  dmMassHolidayOrder, uSearchFrame;

type
  TfmMassHolidayOrder = class(TForm)
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn2: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
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
    KeyList: TActionList;
    CloseAction: TAction;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    Panel3: TPanel;
    AddItemButton: TSpeedButton;
    ModifyItemButton: TSpeedButton;
    DeleteItemButton: TSpeedButton;
    InfoButton: TSpeedButton;
    ViewAction: TAction;
    CancelButton: TSpeedButton;
    ActionControl: TqFActionControl;
    fmSearch: TfmSearch;
    cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    cxGridDBTableView5DBColumn7: TcxGridDBColumn;
    CloneButton: TSpeedButton;
    CloneAction: TAction;
    SpeedButton1: TSpeedButton;
    RefreshAction: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMassHolidayOrder: TfmMassHolidayOrder;

implementation

{$R *.dfm}

procedure TfmMassHolidayOrder.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmMassHolidayOrder.FormResize(Sender: TObject);
begin
    CancelButton.Left := Width - CancelButton.Width - 10;
end;

procedure TfmMassHolidayOrder.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

end.
