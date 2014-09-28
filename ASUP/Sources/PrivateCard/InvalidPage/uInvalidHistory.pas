unit uInvalidHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ActnList, StdCtrls, Buttons, DB, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  FIBDataSet, pFIBDataSet, cxTextEdit;

type
  TfrmInvalidHistory = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    InvalidHistSource: TDataSource;
    BtnOk: TBitBtn;
    ActionList1: TActionList;
    InvalidHistGrid: TcxGrid;
    InvalidHistView: TcxGridDBTableView;
    InvalidHistGridLevel1: TcxGridLevel;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    okAct: TAction;
    InvalidHistSet: TpFIBDataSet;
    InvalidHistViewDBColumn1: TcxGridDBColumn;
    InvalidHistViewDBColumn2: TcxGridDBColumn;
    InvalidHistViewDBColumn3: TcxGridDBColumn;
    InvalidHistViewDBColumn4: TcxGridDBColumn;
    InvalidHistViewDBColumn5: TcxGridDBColumn;
    InvalidHistViewDBColumn6: TcxGridDBColumn;
    InvalidHistViewDBColumn7: TcxGridDBColumn;
    procedure okActExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInvalidHistory: TfrmInvalidHistory;

implementation

uses uInvalidDataModule,uInvalidFrame;

{$R *.dfm}

procedure TfrmInvalidHistory.okActExecute(Sender: TObject);
begin
    close;
end;

end.
