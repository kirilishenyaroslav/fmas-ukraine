unit UrFnDogFilterDogUrFn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxTL, cxContainer, cxLabel,
  cxDBLabel, StdCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, cxTextEdit;

type
  TUrFnDogForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    Panel6: TPanel;
    cxGridUrObDBTableView1: TcxGridDBTableView;
    cxGridUrObLevel1: TcxGridLevel;
    cxGridUrOb: TcxGrid;
    Panel7: TPanel;
    cxGridFnObDBTableView1: TcxGridDBTableView;
    cxGridFnObLevel1: TcxGridLevel;
    cxGridFnOb: TcxGrid;
    Panel8: TPanel;
    cxGridPlatDBTableView1: TcxGridDBTableView;
    cxGridPlatLevel1: TcxGridLevel;
    cxGridPlat: TcxGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ContragentDBLabel: TcxDBLabel;
    SUMMA_DOG_DBLabel: TcxDBLabel;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGridUrObDBTableView1DB_number_urzb: TcxGridDBColumn;
    cxGridUrObDBTableView1DB_date_urzb: TcxGridDBColumn;
    cxGridUrObDBTableView1DB_summa: TcxGridDBColumn;
    cxGridFnObDBTableView1DB_number_fnzb: TcxGridDBColumn;
    cxGridFnObDBTableView1DB_date_fnzb: TcxGridDBColumn;
    cxGridFnObDBTableView1DB_summa: TcxGridDBColumn;
    cxGridPlatDBTableView1DB_num_pl: TcxGridDBColumn;
    cxGridPlatDBTableView1DB_date_pl: TcxGridDBColumn;
    cxGridPlatDBTableView1DB_summa_doc: TcxGridDBColumn;
    cxGridPlatDBTableView1DB_is_in_all_prov: TcxGridDBColumn;
    N_DOG_DBLabel: TcxDBLabel;
    Label4: TLabel;
    DateDogDBLabel: TcxDBLabel;
    cxGridUrObDBTableView1DB_ID_KEKV_NUM: TcxGridDBColumn;
    cxGridFnObDBTableView1DB_ID_KEKV_NUM: TcxGridDBColumn;
    cxGridPlatDBTableView1DB_KEKV: TcxGridDBColumn;
    cxGridPlatDBTableView1DB_summa_kekv: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UrFnDogForm: TUrFnDogForm;

implementation

uses FiltrDogUrFn_DM;

{$R *.dfm}

procedure TUrFnDogForm.FormCreate(Sender: TObject);
begin
  cxGridUrObDBTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourceUrOb;
  cxGridFnObDBTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourceFnOb;
  cxGridPlatDBTableView1.DataController.DataSource := FiltrDogUrFnDM.DSourcePlat;
end;

end.
