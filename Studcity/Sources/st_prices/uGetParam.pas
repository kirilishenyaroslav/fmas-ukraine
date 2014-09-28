unit uGetParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ComCtrls,
  cxGridTableView, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
  ImgList, dxBar, dxBarExtItems, ActnList, RxMemDS, iBase, uPrices_DM;

type
  TfrmGetFacult = class(TForm)
    StatusBar1: TStatusBar;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButtonRefresh: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    LargeImages: TImageList;
    ActionList1: TActionList;
    ActionF10: TAction;
    MarkAll: TAction;
    UnMarkAll: TAction;
    InvertAll: TAction;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    Grid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    NameField: TcxGridDBColumn;
    Name_ID: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
  private
    DM : Tfrm_price_DM;
  public
    id_ : Int64;
    Name : string;
    Constructor Create (AOwnwer : TComponent; aHandle : TISC_DB_HANDLE; ParamFilter : Integer; id_session : Int64); overload;
  end;

var
  frmGetFacult: TfrmGetFacult;
  Res:Variant;
  PFilter, PType:Integer;

implementation

{$R *.dfm}

constructor TfrmGetFacult.Create (AOwnwer : TComponent; aHandle : TISC_DB_HANDLE; ParamFilter : Integer; id_session : Int64);
begin
  inherited Create(AOwnwer);

  DM := Tfrm_price_DM.Create(self);
  DM.DB.Handle := aHandle;
  DM.DB.Connected := true;
  DM.Transaction_Read.StartTransaction;

  PFilter := ParamFilter;
  //Pid_session := id_session;

  DM.DataSet_read.Close;
  case PFilter of
    3: DM.DataSet_read.SQLs.SelectSQL.Text := 'select id_build as id, upper(name_build) as name  from ST_SP_Builds order by name collate win1251_ua';
    4: DM.DataSet_read.SQLs.SelectSQL.Text := 'select r.id_type_room as id, upper(name_type_room) as name from ST_INI_TYPE_ROOM r order by name collate win1251_ua';
    5: DM.DataSet_read.SQLs.SelectSQL.Text := 'select id_type_category as id, upper(name_type_category) as name from ST_INI_TYPE_CATEGORY order by name collate win1251_ua desc';
    6: DM.DataSet_read.SQLs.SelectSQL.Text := 'select id_category_class as id, upper(name_category_class) as name from ST_INI_CATEGORY_CLASS order by name collate win1251_ua desc';
  end;

  DM.DataSet_read.Open;
  DM.DataSet_read.FetchAll;
  DM.DataSet_read.First;

  cxGridDBTableView1.DataController.DataSource := DM.DataSource_read;
end;

procedure TfrmGetFacult.cxGridDBTableView1DblClick(Sender: TObject);
begin
  if Dm.DataSet_read.RecordCount = 0 then exit;

  id_  := DM.DataSet_read['ID'];     
  Name := DM.DataSet_read['NAME'];

  ModalResult := mrOK;
end;

procedure TfrmGetFacult.dxBarLargeButton7Click(Sender: TObject);
begin
  close;
end;

procedure TfrmGetFacult.dxBarLargeButton6Click(Sender: TObject);
begin
  cxGridDBTableView1DblClick(self);
end;

end.
