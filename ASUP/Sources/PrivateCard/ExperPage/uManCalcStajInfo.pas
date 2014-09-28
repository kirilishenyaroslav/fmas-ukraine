unit uManCalcStajInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, uExperDataModule, cxContainer, cxLabel,
  ExtCtrls, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit, cxTextEdit;

type
  TfrmManCalcStajInfo = class(TForm)
    ManCalcStajGridDBView: TcxGridDBTableView;
    ManCalcStajGridLevel: TcxGridLevel;
    ManCalcStajGrid: TcxGrid;
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
    ManCalcStajGridDBViewDBColumn1: TcxGridDBColumn;
    ManCalcStajGridDBViewDBColumn2: TcxGridDBColumn;
    ManCalcStajGridDBViewDBColumn3: TcxGridDBColumn;
    ManCalcStajGridDBViewDBColumn4: TcxGridDBColumn;
    ManCalcStajGridDBViewDBColumn5: TcxGridDBColumn;
    ManCalcStajGridDBViewDBColumn6: TcxGridDBColumn;
    ManCalcStajGridDBViewDBColumn7: TcxGridDBColumn;
    ManCalcStajDS: TDataSource;
    pnlInfo: TPanel;
    lblInfoCaption: TcxLabel;
    lblNumDocument: TcxLabel;
    lblDocument: TcxLabel;
    DocumentEdit: TcxDBTextEdit;
    NumDocument: TcxDBTextEdit;
    DateEdit: TcxDBDateEdit;
    lblDate: TcxLabel;
  private
  public
    constructor Create(AOwner:TComponent; DMMan:TdmExper; IdMan:Int64; IdStaj:Integer);reintroduce;

  end;

var
  frmManCalcStajInfo: TfrmManCalcStajInfo;

implementation

uses DateUtils;

{$R *.dfm}


constructor TfrmManCalcStajInfo.Create(AOwner:TComponent; DMMan:TdmExper; IdMan:Int64; IdStaj:Integer);
begin
   inherited Create(AOwner);
   With DMMan do
   begin
      if ManCalcStajDSet.Active then ManCalcStajDSet.Close;
      ManCalcStajDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM UP_MAN_STAJ_CALC_INFO(:ID_MAN, :ID_STAJ)';
      ManCalcStajDSet.ParamByName('ID_MAN').AsInt64:=IdMan;
      ManCalcStajDSet.ParamByName('ID_STAJ').AsInteger:=IdStaj;
      ManCalcStajDSet.Open;
      ManCalcStajDS.DataSet:=ManCalcStajDSet;
      ManCalcStajGridDBView.ViewData.Expand(True);
   end;
end;

end.
