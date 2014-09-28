{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                        Модуль работы с документами                           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uDocWorkInvKartForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RxMemDS,
  uMatasUtils, uResources, uMatasVars, cxCheckBox, cxContainer, cxTextEdit,
  cxDBEdit, ExtCtrls;

type
  TDocWorkInvKartForm = class(TForm)
    OkButton: TcxButton;
    CancelButton: TcxButton;
    WorkDatabase: TpFIBDatabase;
    WorkTransaction: TpFIBTransaction;
    KartDataSet: TpFIBDataSet;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
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
    KartDataSetID_INV_KART: TFIBBCDField;
    KartDataSetINV_NUM_FULL: TFIBStringField;
    KartDataSetZAVNUM: TFIBStringField;
    KartDataSetMODE: TFIBIntegerField;
    KartDataSource: TDataSource;
    RxMemoryData1: TRxMemoryData;
    RxDataSource: TDataSource;
    cxGrid1DBTableView1CHECKED: TcxGridDBColumn;
    cxGrid1DBTableView1INV_NUM_FULL: TcxGridDBColumn;
    cxGrid1DBTableView1ZAVNUM: TcxGridDBColumn;
    Label1: TLabel;
    cxKolKart: TcxTextEdit;
    Label3: TLabel;
    cxKolAll: TcxTextEdit;
    Label5: TLabel;
    cxKolNeed: TcxTextEdit;
    KartDataSetKARTNUM: TFIBIntegerField;
    KartDataSetTIP_KART: TFIBStringField;
    KartDataSetBEG_PRICE: TFIBIntegerField;
    KartDataSetBEG_IZNOS: TFIBIntegerField;
    KartDataSetOST_PRICE: TFIBIntegerField;
    KartDataSetOST_IZNOS: TFIBIntegerField;
    fbdtfldKartDataSetDATE_OST: TFIBDateField;
    fbdtfldKartDataSetDATE_OPR: TFIBDateField;
    fbdtfldKartDataSetDATE_EXPL: TFIBDateField;
    fbdtfldKartDataSetDATE_UPDATE: TFIBDateField;
    fbdtfldKartDataSetDATE_OUT: TFIBDateField;
    KartDataSetGRPNUM: TFIBStringField;
    KartDataSetBAL_PRICE: TFIBIntegerField;
    lbl13: TLabel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl10: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    RxMemoryData1FID_INV_KART: TBCDField;
    RxMemoryData1FINV_NUM_FULL: TStringField;
    RxMemoryData1FZAVNUM: TStringField;
    RxMemoryData1FMODE: TIntegerField;
    RxMemoryData1FKARTNUM: TIntegerField;
    RxMemoryData1FTIP_KART: TStringField;
    RxMemoryData1FBEG_PRICE: TIntegerField;
    RxMemoryData1FBEG_IZNOS: TIntegerField;
    RxMemoryData1FOST_PRICE: TIntegerField;
    RxMemoryData1FOST_IZNOS: TIntegerField;
    RxMemoryData1FDATE_OST: TDateField;
    RxMemoryData1FDATE_OPR: TDateField;
    RxMemoryData1FDATE_EXPL: TDateField;
    RxMemoryData1FDATE_UPDATE: TDateField;
    RxMemoryData1FDATE_OUT: TDateField;
    RxMemoryData1FGRPNUM: TStringField;
    RxMemoryData1FBAL_PRICE: TIntegerField;
    RxMemoryData1CHECKED: TBooleanField;
    lbl14: TLabel;
    cxDBTextEdit14: TcxDBTextEdit;
    KartDataSetNOTE: TFIBStringField;
    RxMemoryData1NOTE: TStringField;
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
  DocWorkInvKartForm: TDocWorkInvKartForm;

implementation

{$R *.dfm}

procedure TDocWorkInvKartForm.PrepareInvKart;
var
 w: TForm;
 npp: integer;
 fchecked: boolean;
 fid_kart, fkartnum: integer;
 finv_num, fzavnum, ftip_kart, fgrnum: string;
 fbeg_price, fbeg_iznos, fost_price, fost_iznos, fbal_price: double;
 fdate_ost, fdate_opr, fdate_expl, fdate_update, fdate_out, f_note:string;
 fmode: integer;
 rec_kol: integer;
begin
 w:=ShowWaitWindow(self);
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
  fbeg_price:=0;
  fbeg_iznos:=0;
  fost_price:=0;
  fost_iznos:=0;
  fbal_price:=0;
  fdate_ost:='';
  fdate_opr:='';
  fdate_expl:='';
  fdate_update:='';
  fdate_out:='';
  if npp<KOL_KART then
   fchecked:=true
  else
   fchecked:=false;
  fid_kart:=KartDataSet.FieldByName('ID_INV_KART').Value;
  finv_num:=KartDataSet.FieldByName('INV_NUM_FULL').Value;
  fzavnum:=KartDataSet.FieldByName('ZAVNUM').Value;
  fmode:=KartDataSet.FieldByName('MODE').Value;
  fkartnum:=KartDataSet.FieldByName('KARTNUM').Value;
  ftip_kart:=KartDataSet.FieldByName('TIP_KART').Value;
  if KartDataSet.FieldByName('NOTE').Value=null then
  f_note:=''
  else
  f_note:= KartDataSet.FieldByName('NOTE').AsString;
  if  KartDataSet.FieldByName('BEG_PRICE').Value=null then
    fbeg_price:=0
  else
    fbeg_price:=KartDataSet.FieldByName('BEG_PRICE').Value;
  if KartDataSet.FieldByName('BEG_IZNOS').Value=null  then
    fbeg_iznos:=0
  else
    fbeg_iznos:=KartDataSet.FieldByName('BEG_IZNOS').Value;
  if KartDataSet.FieldByName('OST_PRICE').Value=null then
    fost_price:=0
  else
    fost_price:=KartDataSet.FieldByName('OST_PRICE').Value;
  if KartDataSet.FieldByName('OST_IZNOS').Value=null then
    fost_iznos:=0
  else
    fost_iznos:=KartDataSet.FieldByName('OST_IZNOS').Value;
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
  if  KartDataSet.FieldByName('DATE_UPDATE').Value=null then
    fdate_update:=''
  else
    fdate_update:=KartDataSet.FieldByName('DATE_UPDATE').Value;
  if  KartDataSet.FieldByName('DATE_OUT').Value=null then
    fdate_out:=''
  else
    fdate_out:=KartDataSet.FieldByName('DATE_OUT').Value;
  fgrnum:=KartDataSet.FieldByName('GRPNUM').Value;
  if KartDataSet.FieldByName('BAL_PRICE').Value=null then
    fbal_price:=0
  else
    fbal_price:=KartDataSet.FieldByName('BAL_PRICE').Value;
  RxMemoryData1.InsertRecord([fchecked, fid_kart, finv_num, fzavnum, fmode, fkartnum, ftip_kart, fbeg_price, fbeg_iznos, fost_price, fost_iznos, fdate_ost, fdate_opr, fdate_expl, fdate_update, fdate_out, fgrnum, fbal_price, f_note]);
  KartDataSet.Next;
  Inc(npp);
  Inc(rec_kol);
 
 end;
 KOL_CHECKED:=KOL_KART;
 cxKolNeed.Text:=IntToStr(KOL_KART);
 cxKolAll.Text:=IntToStr(rec_kol);
 cxKolKart.Text:=intToStr(KOL_CHECKED);
 CloseWaitWindow(w);

end;

procedure TDocWorkInvKartForm.cxGrid1DBTableView1CellClick(
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
  if RxMemoryData1CHECKED.Value then
  begin
   RxMemoryData1CHECKED.Value:=false;
   flag:=-1;
  end
  else
  begin
   flag:=1;
   RxMemoryData1CHECKED.Value:=true;
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

procedure TDocWorkInvKartForm.FormShow(Sender: TObject);
begin
if is_add_all = 1 then tmr1.Enabled:=True else  tmr1.Enabled:=False;
end;

procedure TDocWorkInvKartForm.tmr1Timer(Sender: TObject);
begin
OkButtonClick(Self);
tmr1.Enabled:=False;
end;

procedure TDocWorkInvKartForm.OkButtonClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

end.
