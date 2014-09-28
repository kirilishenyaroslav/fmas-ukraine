unit uselect_valute;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTL, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ImgList, dxBar, dxBarExtItems, DM,
  iBase, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase;

type
  Tfrmselect_valute = class(TForm)
    BarManager: TdxBarManager;
    SelectBtn: TdxBarLargeButton;
    ImageList1: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    dxBarLargeButton1: TdxBarLargeButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    columne_code: TcxGridDBColumn;
    columne_title: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    testColorStyle: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    DataSource: TDataSource;
    ReadDataSet: TpFIBDataSet;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransaction1: TpFIBTransaction;
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure SelectBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    DM : TDM_Contracts;
    { Private declarations }
  public
    id_valute : Int64;
    code_valute : string;
    constructor Create(aowner : TComponent; aHandle : TISC_DB_HANDLE);reintroduce;
    { Public declarations }
  end;

var
  frmselect_valute: Tfrmselect_valute;

implementation

{$R *.dfm}

constructor Tfrmselect_valute.Create(aowner: TComponent;
  aHandle: TISC_DB_HANDLE);
begin
  Inherited Create(AOwner);

  pFIBDatabase1.Handle := aHandle;
  pFIBDatabase1.Connected := True;
  pFIBTransaction1.StartTransaction;
  ReadDataSet.Close;
  ReadDataSet.SQLs.SelectSQL.Text := 'select * from PUB_SP_VALUTE';
  ReadDataSet.Open;
end;

procedure Tfrmselect_valute.dxBarLargeButton1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmselect_valute.SelectBtnClick(Sender: TObject);
begin
  if ReadDataSet.RecordCount = 0 then Exit;

  id_valute   := ReadDataSet['id_valute'];
  code_valute := ReadDataSet['code_valute'];

  ModalResult := mrOk;
end;

procedure Tfrmselect_valute.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.Free;
end;

end.
