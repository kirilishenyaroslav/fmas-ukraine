unit uHistExper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, StdCtrls, Buttons,uExperDataModule;

type
  TfmHistExper = class(TForm)
    HistGrid: TcxGrid;
    HistGridDBTableView1: TcxGridDBTableView;
    HistGridDBTableView1DBColumn1: TcxGridDBColumn;
    HistGridDBTableView1DBColumn2: TcxGridDBColumn;
    HistGridDBTableView1DBColumn3: TcxGridDBColumn;
    HistGridDBTableView1DBColumn7: TcxGridDBColumn;
    HistGridDBTableView1DBColumn6: TcxGridDBColumn;
    HistGridDBTableView1DBColumn5: TcxGridDBColumn;
    HistGridLevel1: TcxGridLevel;
    DS_Hist: TDataSource;
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
    OkButton: TBitBtn;
    Panel1: TPanel;
    HistGridDBTableView1DBColumn4: TcxGridDBColumn;
    HistGridDBTableView1DBColumn8: TcxGridDBColumn;
    HistGridDBTableView1DBColumn9: TcxGridDBColumn;
    HistGridDBTableView1DBColumn10: TcxGridDBColumn;
    procedure FormActivate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    DM: TdmExper;
    idpcard:Integer;
    constructor Create(DMod: TdmExper; id_pcard, IdStaj:Integer);reintroduce;
  end;

var
  fmHistExper: TfmHistExper;

implementation

{$R *.dfm}
constructor TfmHistExper.Create(DMod: TdmExper; id_pcard, IdStaj:Integer);
begin
  inherited Create(Nil);
  Self.DM:=TdmExper.Create(Self);
  Self.DM:=DMod;
  idpcard:=id_pcard;
  DS_Hist.DataSet:=DM.HistExperSelect;
  DM.HistExperSelect.Close;
  DM.HistExperSelect.SelectSQL.Text:='SELECT * FROM ASUP_MAN_STAJ_HST_SEL(:ID_PCARD, :ID_STAJ)';
  DM.HistExperSelect.ParamByName('Id_PCard').AsInteger := idpcard;
  DM.HistExperSelect.ParamByName('ID_STAJ').AsInteger:=IdStaj;
  DM.HistExperSelect.Open;
end;

procedure TfmHistExper.FormActivate(Sender: TObject);
begin
	OkButton.SetFocus;
end;

procedure TfmHistExper.OkButtonClick(Sender: TObject);
begin
   Close;
end;

procedure TfmHistExper.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
	Action := caFree;
end;

end.
