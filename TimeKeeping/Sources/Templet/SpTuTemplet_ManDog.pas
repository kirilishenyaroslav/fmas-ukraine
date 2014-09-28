unit SpTuTemplet_ManDog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, ActnList,
  StdCtrls, cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls,SpTuTemplet_DM;

type
  TFormMan = class(TForm)
    Panel1: TPanel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    GridDogovora: TcxGrid;
    GridDogDBTableView1: TcxGridDBTableView;
    GridDogovoraColumnTN: TcxGridDBColumn;
    GridDogovoraColumnFIO: TcxGridDBColumn;
    GridDogovoraColumnKolStavok: TcxGridDBColumn;
    GridDogovoraColumnDateBeg: TcxGridDBColumn;
    GridDogovoraColumnDateEnd: TcxGridDBColumn;
    GridDogovoraColumnPost: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    procedure ActionCancelExecute(Sender: TObject);
    procedure ActionYesExecute(Sender: TObject);
  private
    { Private declarations }
  public
    KodSetup:integer;
   constructor create (Aowner:TComponent;AKodSetup:integer);reintroduce;
  end;

function ViewSpManContract(Aowner:TComponent;AKodSetup:integer):variant;

implementation

{$R *.dfm}
function ViewSpManContract(Aowner:TComponent; AKodSetup:integer):variant;
var Form:TFormMan;
begin
Result:=VarArrayCreate([0,1], varInteger);
Form:=TFormMan.create(Aowner,AKodSetup);
if Form.ShowModal=mrYes then
begin
 Result[0]:=DM.DSetWorkContract['RMOVING'];
 Result[1]:=DM.DSetWorkContract['ID_POST_MOVING'];
end;
Form.free;
end;
constructor TFormMan.create (Aowner:TComponent;AKodSetup:integer);
begin
inherited create (Aowner);
KodSetup:=AKodSetup;
if DM.DSetWorkContract.active  then DM.DSetWorkContract.close;
DM.DSetWorkContract.SQLs.SelectSQL.Text:='select * from TU_WORK_CONTRACT_S('+inttostr(KodSetup)+')';
DM.DSetWorkContract.open;
GridDogDBTableView1.DataController.DataSource:=DM.DSourceWorkContract;
end;

procedure TFormMan.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFormMan.ActionYesExecute(Sender: TObject);
begin
ModalResult:=mrYes;
end;

end.
