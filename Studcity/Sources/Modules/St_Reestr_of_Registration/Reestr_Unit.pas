unit Reestr_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCalendar,
  cxLookAndFeelPainters, ActnList, FIBDataSet, pFIBDataSet, ImgList, dxBar,
  dxBarExtItems, StdCtrls, cxButtons, cxContainer, dxStatusBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, FIBDatabase,
  pFIBDatabase, IBase, St_Loader_Unit;

type
  Tfrm_FIO_Family = class(TForm)
    fam_Relations_Grid: TcxGrid;
    fam_Relations_GridDBTableView: TcxGridDBTableView;
    fio: TcxGridDBColumn;
    date: TcxGridDBColumn;
    kurs: TcxGridDBColumn;
    nalog_nomer: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    dxStatusBar2: TdxStatusBar;
    Filter_BarEdit: TcxTextEdit;
    Filter_Button: TcxButton;
    CancelFiltr_Button: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    dxBarManager1: TdxBarManager;
    prp_CancelAll_LargeButton: TdxBarLargeButton;
    fam_SelectLargeButton: TdxBarLargeButton;
    ImageList1: TImageList;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    ActionList1: TActionList;
    ExitAction: TAction;
    Filtration: TAction;
    SearchAction: TAction;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    procedure CancelFiltr_ButtonClick(Sender: TObject);
    procedure fam_Relations_GridDBTableViewDblClick(Sender: TObject);
    procedure Filter_BarEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Filter_ButtonClick(Sender: TObject);
    procedure fam_SelectLargeButtonClick(Sender: TObject);
    procedure prp_CancelAll_LargeButtonClick(Sender: TObject);
    procedure SearchActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_FIO_Family: Tfrm_FIO_Family;

function View_Reestr(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
exports View_Reestr;

   var  res:Variant;

implementation

{$R *.dfm}

function View_Reestr(AOwner : TComponent;DB:TISC_DB_HANDLE):Variant;stdcall;
var ViewForm: Tfrm_FIO_Family;
begin
   ViewForm:=Tfrm_FIO_Family.Create(AOwner);
   ViewForm.DB.Handle:=db;
   ViewForm.DataSet.CloseOpen(true);
   ViewForm.ShowModal;
   View_Reestr:=res;
   ViewForm.Free;
end;


procedure Tfrm_FIO_Family.CancelFiltr_ButtonClick(Sender: TObject);
begin
 DataSet.close;
 DataSet.SelectSQL.Clear;
 DataSet.SelectSQL.Text:='select * from ST_DT_PFIO_FEMILY_SELECT';
 DataSet.Open;
end;

procedure Tfrm_FIO_Family.fam_Relations_GridDBTableViewDblClick(
  Sender: TObject);
var id_kod_out: int64;
begin
Res:=VarArrayCreate([0,4],varVariant);
id_kod_out:= dataset['ID_KOD'];
Res[0]:= id_kod_out;
Res[1]:=dataset['FAMILIA'];
Res[2]:=dataset['IMYA'];
Res[3]:=dataset['OTCHESTVO'];
ModalResult:=mrOk;
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

procedure Tfrm_FIO_Family.fam_SelectLargeButtonClick(Sender: TObject);
var id_kod_out: int64;
begin
Res:=VarArrayCreate([0,4],varVariant);
id_kod_out:= dataset['ID_KOD'];
Res[0]:= id_kod_out;
Res[1]:=dataset['FAMILIA'];
Res[2]:=dataset['IMYA'];
Res[3]:=dataset['OTCHESTVO'];
ModalResult:=mrOk;
end;

procedure Tfrm_FIO_Family.prp_CancelAll_LargeButtonClick(Sender: TObject);
begin
res:=null;
DataSet.Close;
close;
end;

procedure Tfrm_FIO_Family.SearchActionExecute(Sender: TObject);
begin
Filter_BarEdit.SetFocus;
end;

procedure Tfrm_FIO_Family.FormCreate(Sender: TObject);
begin
 with  fam_Relations_GridDBTableView do begin
 Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[1].DataBinding.ValueTypeClass := TcxDateTimeValueType;
 Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 end;

end;

procedure Tfrm_FIO_Family.FormShow(Sender: TObject);
begin
Filter_BarEdit.BringToFront;
Filter_Button.BringToFront;
CancelFiltr_Button.BringToFront;
Filter_BarEdit.SetFocus;
end;

end.
