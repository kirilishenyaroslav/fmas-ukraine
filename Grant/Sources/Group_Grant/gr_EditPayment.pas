unit gr_EditPayment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridBandedTableView,
  cxGridTableView, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, gr_Stud_Group_DM;

type
  TFEditPayment = class(TForm)
    Grid1: TcxGrid;
    Grid1DBTableView1: TcxGridDBTableView;
    Grid1ClTin: TcxGridDBColumn;
    Grid1ClFIO: TcxGridDBColumn;
    Grid1ClCat: TcxGridDBColumn;
    Grid1ClDep: TcxGridDBColumn;
    Grid1ClFormaOb: TcxGridDBColumn;
    Grid1ClBal: TcxGridDBColumn;
    Grid1Level1: TcxGridLevel;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    AddManBtn: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    LBtnUpdate: TdxBarLargeButton;
    dxBarGroup1: TdxBarGroup;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Grid1Kod_Setup: TcxGridDBColumn;
    Grid1Kod_Vidopl: TcxGridDBColumn;
    Grid1Name_Vidopl: TcxGridDBColumn;
    Grid1DBSumma: TcxGridDBColumn;
    Grid1Kod_Smeta: TcxGridDBColumn;
    Grid1Kod_Depatment: TcxGridDBColumn;
  private
    { Private declarations }
  public
    constructor Create(AOwner:TComponent);
  end;

var
  FEditPayment: TFEditPayment;

implementation



{$R *.dfm}



constructor TFEditPayment.Create(AOwner:TComponent);
begin
      if DM.DSetEditPayment.active  then DM.DSetEditPayment.Close;
      DM.DSetEditPayment.SQLs.SelectSQL.text:='GR_EDIT_GROUP_PAYMENT_S';
      try
      except
      DM.DSetEditPayment.open;
      end;

     {DM.StProc.StoredProcName := 'GR_EDIT_GROUP_PAYMENT_S';
      DM.StProc.Prepare;
      PIdStud := Id;
      DM.StProc.ParamByName('ID_STUD').AsInt64 := Id;
      DM.StProc.ExecProc;
      EditMan.Text := DM.StProc.ParamByName('FIO').AsString;
      PId_Man := DM.StProc.ParamByName('ID_MAN').AsInteger;
      DM.StProc.Transaction.Commit;   }
end;


end.
