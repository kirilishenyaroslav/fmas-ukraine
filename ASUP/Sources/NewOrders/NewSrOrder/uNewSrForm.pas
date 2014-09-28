unit uNewSrForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFormControl, ActnList, FIBDatabase, pFIBDatabase,
  uFControl, uInvisControl, uDateControl, uLabeledFControl, uCharControl,
  ComCtrls, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfmNewSrOrder = class(TForm)
    LocalDatabase: TpFIBDatabase;
    LocalReadTransaction: TpFIBTransaction;
    LocalWriteTransaction: TpFIBTransaction;
    KeyList: TActionList;
    OkAction: TAction;
    CancelAction: TAction;
    IdOrderType: TqFInvisControl;
    NumItem: TqFInvisControl;
    SubItem: TqFInvisControl;
    IdOrderGroup: TqFInvisControl;
    Intro: TqFInvisControl;
    IdOrder: TqFInvisControl;
    DateOrder: TqFInvisControl;
    PageControl: TPageControl;
    MainSheet: TTabSheet;
    DetSheet: TTabSheet;
    OkButton: TBitBtn;
    Note: TqFCharControl;
    DateBeg: TqFDateControl;
    BottomPanel: TPanel;
    CancelButton: TBitBtn;
    ItemsGrid: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5DBColumn1: TcxGridDBColumn;
    cxGridDBTableView5DBColumn6: TcxGridDBColumn;
    cxGridDBTableView5DBColumn3: TcxGridDBColumn;
    cxGridDBTableView5DBColumn4: TcxGridDBColumn;
    cxGridDBTableView5DBColumn5: TcxGridDBColumn;
    cxGridDBTableView5DBColumn7: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    Panel3: TPanel;
    AddItemButton: TSpeedButton;
    ModifyItemButton: TSpeedButton;
    DeleteItemButton: TSpeedButton;
    InfoButton: TSpeedButton;
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
    FormControl: TqFFormControl;
    procedure OkActionExecute(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmNewSrOrder: TfmNewSrOrder;

implementation

{$R *.dfm}

procedure TfmNewSrOrder.OkActionExecute(Sender: TObject);
begin
    FormControl.Ok;
    ModalResult := mrNone;

    if FormControl.Mode = fmAdd then begin
        IdOrder.Value := FormControl.LastId;
        FormControl.Mode := fmModify;
    end;
end;

procedure TfmNewSrOrder.CancelActionExecute(Sender: TObject);
begin
    Close;
end;

end.
