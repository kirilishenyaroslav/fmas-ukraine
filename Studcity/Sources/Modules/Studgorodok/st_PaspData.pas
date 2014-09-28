unit st_PaspData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ImgList, dxBar, dxBarExtItems,
  cxSplitter, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DataModule1_Unit, FIBDataSet, pFIBDataSet, st_ConstUnit, ActnList,
  cxContainer, cxTextEdit, StdCtrls, cxLookAndFeelPainters, cxButtons,
  cxLabel, ExtCtrls, Menus, cxCheckBox, St_proc;

type
  TfrmPaspData = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    ImageList1: TImageList;
    ImageList2: TImageList;
    DS_PaspData: TpFIBDataSet;
    DataSource1: TDataSource;
    grid_P_FAM: TcxGridDBColumn;
    grid_P_IMYA: TcxGridDBColumn;
    grid_P_OT: TcxGridDBColumn;
    grid_SERYA: TcxGridDBColumn;
    grid_NOMER: TcxGridDBColumn;
    grid_PAS_VYDAN: TcxGridDBColumn;
    grid_DATE_VYDAN: TcxGridDBColumn;
    grid_DATE_REC: TcxGridDBColumn;
    grid_OSNOVANIE: TcxGridDBColumn;
    grid_NAME_UDOST: TcxGridDBColumn;
    gridd_P_FAM: TcxGridDBColumn;
    gridd_P_IMYA: TcxGridDBColumn;
    gridd_P_OT: TcxGridDBColumn;
    gridd_SERYA: TcxGridDBColumn;
    gridd_NOMER: TcxGridDBColumn;
    gridd_PAS_VYDAN: TcxGridDBColumn;
    gridd_DATE_VYDAN: TcxGridDBColumn;
    gridd_DATE_REC: TcxGridDBColumn;
    gridd_OSNOVANIE: TcxGridDBColumn;
    gridd_NAME_UDOST: TcxGridDBColumn;
    DS_history: TpFIBDataSet;
    DataSource2: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    Panel1: TPanel;
    staticFIO: TcxLabel;
    FilterText: TcxTextEdit;
    BtnFilter: TcxButton;
    CheckBoxHistory: TcxCheckBox;
    procedure cxSplitter1AfterOpen(Sender: TObject);
    procedure cxSplitter1AfterClose(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CheckBoxHistoryClick(Sender: TObject);
    procedure BtnFilterClick(Sender: TObject);
    procedure FilterTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public
    lang: Integer;
    constructor Create(AOwner: TComponent);reintroduce;
  end;

  procedure getPaspData(AOwner: TComponent)stdcall;
  exports getPaspData;

implementation

{$R *.dfm}

constructor TfrmPaspData.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  cxSplitter1.CloseSplitter;
  lang := St_proc.cnLanguageIndex;

  staticFIO.Caption           := st_FIOUser[lang];
  CheckBoxHistory.Properties.Caption:= st_History[lang];
  BtnFilter.Hint              := st_GoFilter_Hint[lang];
  self.Caption                := st_PaspDataCaption[lang];

  grid_P_FAM.Caption          := st_Fam[lang];
  grid_P_IMYA.Caption         := st_Name[lang];
  grid_P_OT.Caption           := st_Otch[lang];
  grid_SERYA.Caption          := st_prp_pass_Seriya[lang];
  grid_NOMER.Caption          := st_prp_pass_Nomer[lang];
  grid_PAS_VYDAN.Caption      := st_prp_Kem[lang];
  grid_DATE_VYDAN.Caption     := st_prp_Kogda[lang];
  grid_NAME_UDOST.Caption     := st_prp_TypeDoc[lang];
  grid_DATE_REC.Caption       := 'Дата внесения данных';
  grid_OSNOVANIE.Caption      := st_prp_Pidstava[lang];

  gridd_P_FAM.Caption         := st_Fam[lang];
  gridd_P_IMYA.Caption        := st_Name[lang];
  gridd_P_OT.Caption          := st_Otch[lang];
  gridd_SERYA.Caption         := st_prp_pass_Seriya[lang];
  gridd_NOMER.Caption         := st_prp_pass_Nomer[lang];
  gridd_PAS_VYDAN.Caption     := st_prp_Kem[lang];
  gridd_DATE_VYDAN.Caption    := st_prp_Kogda[lang];
  gridd_NAME_UDOST.Caption    := st_prp_TypeDoc[lang];
  gridd_DATE_REC.Caption      := 'Дата внесения данных';
  gridd_OSNOVANIE.Caption     := st_prp_Pidstava[lang];

  DS_PaspData.Close;
  DS_PaspData.SelectSQL.Text:='select p.*, u.name_udost from ST_DT_PASP p left join ST_INI_TYPE_UDOST u on p.type_udost=u.type_udost order by p.P_FAM, p.P_IMYA, p.P_OT collate win1251_ua';
  DS_PaspData.Open;
  DS_history.Close;
  DS_history.SelectSQL.Text :='select p.*, u.name_udost from ST_DT_PASP p left join ST_INI_TYPE_UDOST u on p.type_udost=u.type_udost where p.id_kod=?ID_KOD';
  DS_history.Open;
end;

procedure getPaspData(AOwner: TComponent)stdcall;
begin
    Screen.Cursor:=crHourGlass;
    TfrmPaspData.Create(AOwner);
    Screen.Cursor:=crDefault;
end;

procedure TfrmPaspData.cxSplitter1AfterOpen(Sender: TObject);
begin
    CheckBoxHistory.Checked:=True;
end;

procedure TfrmPaspData.cxSplitter1AfterClose(Sender: TObject);
begin
    CheckBoxHistory.Checked:=False;
end;

procedure TfrmPaspData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    action:=caFree;
end;

procedure TfrmPaspData.CheckBoxHistoryClick(Sender: TObject);
begin
    if CheckBoxHistory.Checked then cxSplitter1.OpenSplitter
    else                            cxSplitter1.CloseSplitter;
end;

procedure TfrmPaspData.BtnFilterClick(Sender: TObject);
var
  Len_FIO,p: Integer;
  FIO_Search: string;
begin
    try
        FIO_Search:=FilterText.Text+'%';
        Len_FIO:=length(FIO_Search);
        p:=1;
        while p<=len_FIO do begin
            If FIO_Search[p]=' ' then begin
                                   Insert('%',FIO_Search,p);
                                   Inc(p);
                                   Inc(Len_fio);
                                 end;
            Inc(p);
           end;
        if FilterText.Text<>'' then
        begin
            DS_history.Close;
            DS_PaspData.Close;
            DS_PaspData.SelectSQL.Text:='select p.*, u.name_udost from ST_DT_PASP p '+
                                        'left join ST_INI_TYPE_UDOST u on p.type_udost=u.type_udost '+
                                        'where p.p_fam||'' ''||p.p_imya||'' ''||p.p_ot like '''+FIO_Search+''' '+
                                        'order by p.P_FAM, p.P_IMYA, p.P_OT collate win1251_ua';
            DS_PaspData.Open;
            DS_history.Open;
        end else begin
            DS_history.Close;
            DS_PaspData.Close;
            DS_PaspData.SelectSQL.Text:='select p.*, u.name_udost from ST_DT_PASP p '+
                                        'left join ST_INI_TYPE_UDOST u on p.type_udost=u.type_udost '+
                                        ' order by p.P_FAM, p.P_IMYA, p.P_OT collate win1251_ua';
            DS_PaspData.Open;
            DS_history.Open;
        end;
    except on E:exception
      do ShowMessage(E.Message);
    end;
end;

procedure TfrmPaspData.FilterTextKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key=13 then BtnFilterClick(Sender);
end;

end.
