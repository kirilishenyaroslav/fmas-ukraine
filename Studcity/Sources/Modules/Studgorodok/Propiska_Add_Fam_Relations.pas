unit Propiska_Add_Fam_Relations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCalendar, dxStatusBar,
  dxBar, dxBarExtItems, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ImgList, FIBDataSet, pFIBDataSet,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxContainer, ActnList,
  DataModule1_Unit;

type
  Tfrm_FIO_Family = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    fam_Relations_Grid: TcxGrid;
    fam_Relations_GridDBTableView: TcxGridDBTableView;
    fio: TcxGridDBColumn;
    kurs: TcxGridDBColumn;
    nalog_nomer: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxBarManager1: TdxBarManager;
    prp_CancelAll_LargeButton: TdxBarLargeButton;
    fam_SelectLargeButton: TdxBarLargeButton;
    dxStatusBar2: TdxStatusBar;
    date: TcxGridDBColumn;
    ImageList1: TImageList;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    Filter_BarEdit: TcxTextEdit;
    Filter_Button: TcxButton;
    CancelFiltr_Button: TcxButton;
    ActionList1: TActionList;
    ExitAction: TAction;
    Filtration: TAction;
    SearchAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure CancelFiltr_ButtonClick(Sender: TObject);
    procedure Filter_ButtonClick(Sender: TObject);
    procedure Filter_BarEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure prp_CancelAll_LargeButtonClick(Sender: TObject);
    procedure fam_SelectLargeButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure fam_Relations_GridDBTableViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_FIO_Family: Tfrm_FIO_Family;

implementation

{$R *.dfm}

procedure Tfrm_FIO_Family.FormCreate(Sender: TObject);
begin
 with  fam_Relations_GridDBTableView do begin
 Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 end;

end;

procedure Tfrm_FIO_Family.CancelFiltr_ButtonClick(Sender: TObject);
begin
 DataSet.close;
 DataSet.SelectSQL.Clear;
 DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_FEMILY_SELECT';
 DataSet.Open;
end;

procedure Tfrm_FIO_Family.Filter_ButtonClick(Sender: TObject);
var  persent : string;
begin
 persent:='%';

 DataSet.close;
 DataSet.SelectSQL.Clear;
 DataSet.SelectSQL.Text:='select * from  ST_DT_PFIO_SELECT_FILTER_ASC('+ ''''+Filter_BarEdit.Text + persent+''''+')';
 DataSet.Open;
 fam_Relations_Grid.SetFocus;
end;

procedure Tfrm_FIO_Family.Filter_BarEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
  var  persent : string;
  begin
if  key=VK_RETURN then begin
 persent:='%';

 DataSet.close;
 DataSet.SelectSQL.Clear;
 DataSet.SelectSQL.Text:='select * from  ST_DT_PFIO_SELECT_FILTER_ASC('+ ''''+Filter_BarEdit.Text + persent+''''+')';
 DataSet.Open;
 fam_Relations_Grid.SetFocus;
 end;
end;

procedure Tfrm_FIO_Family.prp_CancelAll_LargeButtonClick(Sender: TObject);
begin
DataSet.Close;
close;
end;

procedure Tfrm_FIO_Family.fam_SelectLargeButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

procedure Tfrm_FIO_Family.FormShow(Sender: TObject);
begin
Filter_BarEdit.BringToFront;
Filter_Button.BringToFront;
CancelFiltr_Button.BringToFront;
Filter_BarEdit.SetFocus;
end;

procedure Tfrm_FIO_Family.SearchActionExecute(Sender: TObject);
begin
Filter_BarEdit.SetFocus;
end;

procedure Tfrm_FIO_Family.fam_Relations_GridDBTableViewDblClick(
  Sender: TObject);
begin
ModalResult:=mrOk;
end;

end.
