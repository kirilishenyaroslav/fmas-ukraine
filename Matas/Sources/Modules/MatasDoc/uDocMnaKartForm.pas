unit uDocMnaKartForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, FIBDatabase,
  pFIBDatabase, RxMemDS, pFIBDataSet, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxControls,
  cxGridCustomView, cxGrid, cxClasses, cxCheckBox, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxTextEdit, cxContainer, cxDBEdit, ExtCtrls;

type
  TDocMnaKartForm = class(TForm)
    StyleRepository: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    MnaDB: TpFIBDatabase;
    KartDataSet: TpFIBDataSet;
    dsMna: TDataSource;
    dsRxMna: TDataSource;
    MnaTr: TpFIBTransaction;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1ID_MNA_KART: TIntegerField;
    RxMemoryData1MNA_INV_NUM: TStringField;
    RxMemoryData1NNUM_FULL: TStringField;
    RxMemoryData1ZAVNUM: TStringField;
    RxMemoryData1MODE: TIntegerField;
    RxMemoryData1DATE_OPR: TDateField;
    RxMemoryData1DATE_OUT: TDateField;
    RxMemoryData1DATE_OST: TDateField;
    RxMemoryData1DATE_EXPL: TDateField;
    RxMemoryData1CHECKED: TIntegerField;
    cxgrdbclmnGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxgrdbclmnGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxKolAll: TcxTextEdit;
    cxKolKart: TcxTextEdit;
    cxKolNeed: TcxTextEdit;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    KartDataSetID_MNA_KART: TFIBBCDField;
    KartDataSetMNA_INV_NUM: TFIBStringField;
    KartDataSetNNUM_FULL: TFIBStringField;
    KartDataSetZAVNUM: TFIBStringField;
    KartDataSetMODE: TFIBIntegerField;
    KartDataSetDATE_OPR: TFIBDateField;
    KartDataSetDATE_OST: TFIBDateField;
    KartDataSetDATE_EXPL: TFIBDateField;
    KartDataSetDATE_OUT: TFIBDateField;
    cxgrdbclmnGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    tmr1: TTimer;
    procedure PrepareInvKart;
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    ID_POS: integer;
    ID_OST: integer;
    KOL_KART: integer;
    KOL_CHECKED: integer;
    is_add_all:Integer;
  end;

var
  DocMnaKartForm: TDocMnaKartForm;

implementation

{$R *.dfm}

procedure TDocMnaKartForm.PrepareInvKart;
var
 npp: integer;
 fchecked: integer;
 fid_kart: integer;
 fnum, fzavnum, fnumfull: string;
 fdate_ost, fdate_opr, fdate_expl, fdate_out:string;
 fmode: integer;
 rec_kol: integer;
begin
 KartDataSet.ParamByName('ID_POS').Value:=ID_POS;
 KartDataSet.ParamByName('ID_OST').Value:=ID_OST;
 KartDataSet.CloseOpen(false);
 KartDataSet.First;
 RxMemoryData1.Open;
 npp:=0;
 rec_kol:=0;
 if KOL_KART=0 then KOL_KART:=1;
 while not KartDataSet.Eof do
 begin
  fdate_ost:='';
  fdate_opr:='';
  fdate_expl:='';
  fdate_out:='';
  if npp<KOL_KART then
   fchecked:=1
  else
   fchecked:=0;
  if  KartDataSet.FieldByName('ID_MNA_KART').Value = null then
  fid_kart:=0
  else fid_kart:=KartDataSet.FieldByName('ID_MNA_KART').Value;

  if  KartDataSet.FieldByName('MNA_INV_NUM').Value = null then
  fnum:=''
  else fnum:=KartDataSet.FieldByName('MNA_INV_NUM').Value;

  if KartDataSet.FieldByName('ZAVNUM').Value= null then
  fzavnum:=''
  else fzavnum:=KartDataSet.FieldByName('ZAVNUM').Value;

  if KartDataSet.FieldByName('NNUM_FULL').Value=null then
  fnumfull:=''
  else fnumfull:=KartDataSet.FieldByName('NNUM_FULL').Value;

  if KartDataSet.FieldByName('MODE').Value = null then
  fmode:=0
  else fmode:=KartDataSet.FieldByName('MODE').Value;

  if KartDataSet.FieldByName('DATE_OST').Value=null then
    fdate_ost:=''
  else
    fdate_ost:=KartDataSet.FieldByName('DATE_OST').Value;

  if KartDataSet.FieldByName('DATE_OPR').Value=null then
    fdate_opr:=''
  else
    fdate_opr:=KartDataSet.FieldByName('DATE_OPR').Value;

  if KartDataSet.FieldByName('DATE_EXPL').Value=null then
    fdate_expl:=''
  else
    fdate_expl:=KartDataSet.FieldByName('DATE_EXPL').Value;

  if  KartDataSet.FieldByName('DATE_OUT').Value=null then
    fdate_out:=''
  else
    fdate_out:=KartDataSet.FieldByName('DATE_OUT').Value;

  RxMemoryData1.InsertRecord([fid_kart, fnum, fnumfull, fzavnum, fmode, fdate_opr, fdate_out, fdate_ost, fdate_expl, fchecked]);
//  ShowMessage(DateToStr(RxMemoryData1DATE_OPR.Value)+' ' +DateToStr(RxMemoryData1DATE_EXPL.Value)+' ' +DateToStr(RxMemoryData1DATE_OUT.Value));
  KartDataSet.Next;
  Inc(npp);
  Inc(rec_kol);

 end;
 KOL_CHECKED:=KOL_KART;
 cxKolNeed.Text:=IntToStr(KOL_KART);
 cxKolAll.Text:=IntToStr(rec_kol);
 cxKolKart.Text:=intToStr(KOL_CHECKED);
 cxDBTextEdit1.Text:=fdate_opr;
 cxDBTextEdit2.Text:=fdate_expl;
 cxDBTextEdit3.Text:=fdate_out;

end;

procedure TDocMnaKartForm.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
 flag: integer;
begin
 flag:=0;
 if ACellViewInfo.Item.Index=0 then
 begin
  RxMemoryData1.Edit;
  if RxMemoryData1CHECKED.Value = 1 then
  begin
   RxMemoryData1CHECKED.Value:=0;
   flag:=-1;
  end
  else
  begin
   flag:=1;
   RxMemoryData1CHECKED.Value:=1;
  end;
  RxMemoryData1.Post;
 end;
 AHandled:=true;
 KOL_CHECKED:=KOL_CHECKED+flag;
 cxKolKart.Text:=intToStr(KOL_CHECKED);
 if KOL_CHECKED=KOL_KART then
  OkButton.Enabled:=true
 else
  OkButton.Enabled:=false;

end;

procedure TDocMnaKartForm.FormShow(Sender: TObject);
begin
if is_add_all = 1 then tmr1.Enabled:=True else  tmr1.Enabled:=False;
end;

procedure TDocMnaKartForm.tmr1Timer(Sender: TObject);
begin
OkButtonClick(Self);
tmr1.Enabled:=False;
end;

procedure TDocMnaKartForm.OkButtonClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

end.
