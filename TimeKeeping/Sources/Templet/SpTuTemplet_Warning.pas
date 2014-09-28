unit SpTuTemplet_Warning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, ActnList, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMemo, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid,SpTuTemplet_DM, cxGroupBox;

type
  TFormWarning = class(TForm)
    Panel1: TPanel;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionCancel: TAction;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    DM:TDM;
  public
   constructor create (Aowner:TComponent;ADM:TDM);reintroduce;
  end;



implementation

{$R *.dfm}

{ TFormWarning }

constructor TFormWarning.create(Aowner: TComponent;ADM:TDM);
begin
  inherited create(Aowner);
  DM:=ADM;
  cxGrid1DBTableView1.DataController.DataSource:=DM.DSourceEditWarning;
end;

procedure TFormWarning.ActionYesExecute(Sender: TObject);
begin
ModalResult:=mrYes;
end;

procedure TFormWarning.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel
end;

end.
