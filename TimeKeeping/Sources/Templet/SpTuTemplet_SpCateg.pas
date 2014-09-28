unit SpTuTemplet_SpCateg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxLookAndFeelPainters,
  ActnList, StdCtrls, cxButtons, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, SpTuTemplet_DM,TuCommonStyles,
  TuCommonProc;

type
  TFormSpCategor = class(TForm)
    GridCat: TcxGrid;
    GridCatDBTableView1: TcxGridDBTableView;
    GridText1: TcxGridDBColumn;
    GridCatLevel1: TcxGridLevel;
    Panel1: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    DM:TDM;
  public
    id_cat:Variant;
    pStylesDM:TStyleDM;
    { Public declarations }
    constructor create(AOwner:TComponent;ActualDate:TDate);reintroduce;
  end;
function View_SpCategor(AOwner:TComponent;ActualDate:TDate):variant;


implementation

{$R *.dfm}

function View_SpCategor(AOwner:TComponent;ActualDate:TDate):variant;
var Form:TFormSpCategor;
begin

 Form:=TFormSpCategor.Create(AOwner,ActualDate);
 if Form.ShowModal= mrYes then
  result:=Form.id_cat
 else
  result:=null;
  Form.destroy;
end;
constructor  TFormSpCategor.create(AOwner:TComponent;ActualDate:TDate);
begin
  inherited create(AOwner);
  DM.DSetCat.Close;
  DM.DSetCat.SelectSQL.Text:='select * from TU_SP_CATEGORY_FILT_S('''+datetostr(ActualDate)+''')';
  DM.DSetCat.Open;
  GridCatDBTableView1.DataController.DataSource:=DM.DSourceCat;
  pStylesDM:=TStyleDM.Create(Self);
  GridCatDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
//****************************************************************************
  Caption                :=GetConst('NotUseCat','Form') ;
  ButtonYes.Caption      :=GetConst('Yes','Button');
  ButtonCancel.Caption   :=GetConst('Cancel','Button');
  GridText1.Caption      :=GetConst('NameDep','GridColumn') ;
//****************************************************************************


end;

procedure TFormSpCategor.ActionYesExecute(Sender: TObject);
begin
id_cat:=DM.DSetCat['ID_CATEGORY'];
ModalResult:=mrYes;
end;

procedure TFormSpCategor.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
