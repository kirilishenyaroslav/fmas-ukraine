unit uPost_choose;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ImgList, dxBar, dxBarExtItems,
  FIBDataSet, pFIBDataSet;

type
  TfrmPost_choose = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    Search_BarEdit: TdxBarEdit;
    ImageListOfCategory: TImageList;
    PopupImageList: TImageList;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_SHORT: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_department_dop : Int64;
    id_post_dop : Int64;
    name_post : string;
  end;

var
  frmPost_choose: TfrmPost_choose;

implementation

{$R *.dfm}
uses DataModule1_Unit;

procedure TfrmPost_choose.ExitButtonClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPost_choose.FormShow(Sender: TObject);
begin
  RefreshButtonClick(self); 
end;

procedure TfrmPost_choose.RefreshButtonClick(Sender: TObject);
begin
  pFIBDataSet1.Close;
  pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ST_GET_NAME_POS_DOP(:ID_DEPARTMENT)';
  pFIBDataSet1.ParamByName('ID_DEPARTMENT').AsInt64 := id_department_dop;
  pFIBDataSet1.Open;
end;

procedure TfrmPost_choose.SelectButtonClick(Sender: TObject);
begin
  if pFIBDataSet1.RecordCount = 0 then exit;

  id_post_dop := pFIBDataSet1['ID_POST'];
  name_post := pFIBDataSet1['POST_NAME'];

  ModalResult := mrOk;
end;

end.
