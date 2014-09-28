unit uDocWorkSchKekv;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, uDocWorkProv, cxCheckBox, ActnList, Buttons,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TDocWorkSchKekvForm = class(TForm)
    cxGridPosDBTableView1: TcxGridDBTableView;
    cxGridPosLevel1: TcxGridLevel;
    cxGridPos: TcxGrid;
    ID_SCH: TcxGridDBColumn;
    SCH_NUMBER: TcxGridDBColumn;
    SCH_TITLE: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn8: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn9: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn10: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn11: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn12: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn13: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn14: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn15: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn16: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn17: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn18: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn19: TcxGridDBColumn;
    cxGridPosDBTableView1DBColumn20: TcxGridDBColumn;
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    ActionList1: TActionList;
    Ok: TAction;
    Cancel: TAction;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    procedure btnCancelClick(Sender: TObject);
    procedure OkExecute(Sender: TObject);
    procedure CancelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocWorkSchKekvForm: TDocWorkSchKekvForm;

implementation

{$R *.dfm}

procedure TDocWorkSchKekvForm.btnCancelClick(Sender: TObject);
begin
Close;
end;

procedure TDocWorkSchKekvForm.OkExecute(Sender: TObject);
begin
Modalresult:=mrOk;
end;

procedure TDocWorkSchKekvForm.CancelExecute(Sender: TObject);
begin
Modalresult:=mrCancel;
Close;
end;

procedure TDocWorkSchKekvForm.FormCreate(Sender: TObject);
begin
Height:=347;
Width:=512;
end;

end.
