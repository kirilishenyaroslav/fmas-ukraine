unit DelivInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, cxTextEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxCalc,
  StdCtrls, cxButtons, Ibase, FIBDatabase, pFIBDatabase, pFibStoredProc,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, RxMemDS, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxCurrencyEdit;

type
  TfrmDelivInfo = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    Koeff: TcxCalcEdit;
    MinSum: TcxCalcEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton3: TcxButton;
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    cxButton4: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    RxMemoryData1: TRxMemoryData;
    DataSource1: TDataSource;
    Styles: TcxStyleRepository;
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
    cxButton2: TcxButton;
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Fid_reestr:Integer;
    FDelivStoredProc:TpFibStoredProc;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;id_reestr:Integer;db_handle:TISC_DB_HANDLE);reintroduce;
  end;



implementation

{$R *.dfm}

{ TfrmDelivInfo }

constructor TfrmDelivInfo.Create(AOwner: TComponent; id_reestr: Integer; db_handle: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     Fid_reestr:=id_reestr;
     WorkDatabase.Handle:=db_handle;
     ReadTransaction.StartTransaction;

     FDelivStoredProc:=TpFibStoredProc.Create(self);
     FDelivStoredProc.Database:=WorkDatabase;
     FDelivStoredProc.Transaction:=WriteTransaction;
end;

procedure TfrmDelivInfo.cxButton3Click(Sender: TObject);
var tSUMMA_NACH_REESTR:Double;
    tSUMMA_NACH_REESTR_NEW:Double;
    tSUMMA_NACH_REESTR_RAZN:Double;
    tSUMMA_DED_REESTR:Double;
    tSUMMA_DED_REESTR_NEW:Double;
    tSUMMA_DED_REESTR_RAZN:Double;
begin
     if not WriteTransaction.InTransaction
     then begin
               WriteTransaction.StartTransaction;
               FDelivStoredProc.StoredProcName:='UV_REE_VED_CORR_SHEET';
               FDelivStoredProc.Prepare;
               FDelivStoredProc.ParamByName('ID_REESTR').Value:=self.Fid_reestr;
               FDelivStoredProc.ParamByName('KOEF').Value     :=Koeff.EditValue;
               FDelivStoredProc.ParamByName('MIN_SUM').Value  :=MinSum.EditValue;
               FDelivStoredProc.ExecProc;

               {SUMMA_NACH_REESTR.Enabled:=True;
               SUMMA_NACH_REESTR_NEW.Enabled:=True;
               SUMMA_NACH_REESTR_RAZN.Enabled:=True;
               SUMMA_DED_REESTR.Enabled:=True;
               SUMMA_DED_REESTR_NEW.Enabled:=True;
               SUMMA_DED_REESTR_RAZN.Enabled:=True;

               cxLabel3.Enabled:=True;
               cxLabel4.Enabled:=True;
               cxLabel5.Enabled:=True;
               cxLabel6.Enabled:=True;
               cxLabel7.Enabled:=True;
               cxLabel8.Enabled:=True;

               SUMMA_NACH_REESTR.EditValue:=FDelivStoredProc.ParamByName('SUMMA_NACH_REESTR').Value;
               SUMMA_NACH_REESTR_NEW.EditValue:=FDelivStoredProc.ParamByName('SUMMA_NACH_REESTR_NEW').Value;
               SUMMA_NACH_REESTR_RAZN.EditValue:=FDelivStoredProc.ParamByName('SUMMA_NACH_REESTR_RAZN').Value;
               SUMMA_DED_REESTR.EditValue:=FDelivStoredProc.ParamByName('SUMMA_DED_REESTR').Value;
               SUMMA_DED_REESTR_NEW.EditValue:=FDelivStoredProc.ParamByName('SUMMA_DED_REESTR_NEW').Value;
               SUMMA_DED_REESTR_RAZN.EditValue:=FDelivStoredProc.ParamByName('SUMMA_DED_REESTR_RAZN').Value; }

               tSUMMA_NACH_REESTR:=FDelivStoredProc.ParamByName('SUMMA_NACH_REESTR').Value;
               tSUMMA_NACH_REESTR_NEW:=FDelivStoredProc.ParamByName('SUMMA_NACH_REESTR_NEW').Value;
               tSUMMA_NACH_REESTR_RAZN:=FDelivStoredProc.ParamByName('SUMMA_NACH_REESTR_RAZN').Value;
               tSUMMA_DED_REESTR:=FDelivStoredProc.ParamByName('SUMMA_DED_REESTR').Value;
               tSUMMA_DED_REESTR_NEW:=FDelivStoredProc.ParamByName('SUMMA_DED_REESTR_NEW').Value;
               tSUMMA_DED_REESTR_RAZN:=FDelivStoredProc.ParamByName('SUMMA_DED_REESTR_RAZN').Value;


               cxButton4.Enabled:=True;
               cxButton1.Enabled:=True;
               cxButton3.Enabled:=False;

               RxMemoryData1:=TRxMemoryData.Create(Application);
               DataSource1.Dataset:=RxMemoryData1;
               cxGrid1DBTableView1.datacontroller.Datasource:=DataSource1;
               RxMemoryData1.Close;
               RxMemoryData1.FieldDefs.Clear;
               RxMemoryData1.FieldDefs.Add('REESTR',ftString,20,True);
               RxMemoryData1.FieldDefs.Add('NACH',ftString,16,True);
               RxMemoryData1.FieldDefs.Add('UDERG',ftString,16,True);
               RxMemoryData1.FieldDefs.Add('KVIPL',ftString,16,True);
               RxMemoryData1.Open;

               RxMemoryData1.Append;
               RxMemoryData1.Edit;
               RxMemoryData1['REESTR']:='Ðåºñòð íà ðîçïîä³ë';
               RxMemoryData1['NACH']:=tSUMMA_NACH_REESTR;
               RxMemoryData1['UDERG']:=tSUMMA_DED_REESTR;
               RxMemoryData1['KVIPL']:=tSUMMA_NACH_REESTR-tSUMMA_DED_REESTR;
               RxMemoryData1.Post;

               RxMemoryData1.Append;
               RxMemoryData1.Edit;
               RxMemoryData1['REESTR']:='Ðåºñòð1';
               RxMemoryData1['NACH']:=tSUMMA_NACH_REESTR_NEW;
               RxMemoryData1['UDERG']:=tSUMMA_DED_REESTR_NEW;
               RxMemoryData1['KVIPL']:=tSUMMA_NACH_REESTR_NEW-tSUMMA_DED_REESTR_NEW;
               RxMemoryData1.Post;

               RxMemoryData1.Append;
               RxMemoryData1.Edit;
               RxMemoryData1['REESTR']:='Ðåºñòð2';
               RxMemoryData1['NACH']:=tSUMMA_NACH_REESTR_RAZN;
               RxMemoryData1['UDERG']:=tSUMMA_DED_REESTR_RAZN;
               RxMemoryData1['KVIPL']:=tSUMMA_NACH_REESTR_RAZN-tSUMMA_DED_REESTR_RAZN;
               RxMemoryData1.Post;




     end;
end;

procedure TfrmDelivInfo.cxButton4Click(Sender: TObject);
begin

  if WriteTransaction.active then   WriteTransaction.Rollback;

     {SUMMA_NACH_REESTR.Enabled:=false;
     SUMMA_NACH_REESTR_NEW.Enabled:=false;
     SUMMA_NACH_REESTR_RAZN.Enabled:=false;
     SUMMA_DED_REESTR.Enabled:=false;
     SUMMA_DED_REESTR_NEW.Enabled:=false;
     SUMMA_DED_REESTR_RAZN.Enabled:=false;

     cxLabel3.Enabled:=false;
     cxLabel4.Enabled:=false;
     cxLabel5.Enabled:=false;
     cxLabel6.Enabled:=false;
     cxLabel7.Enabled:=false;
     cxLabel8.Enabled:=false;      }
     RxMemoryData1.close;
     cxButton4.Enabled:=false;
     cxButton1.Enabled:=false;
     cxButton3.Enabled:=true;
end;

procedure TfrmDelivInfo.cxButton1Click(Sender: TObject);
begin
     WriteTransaction.Commit;

     {SUMMA_NACH_REESTR.Enabled:=false;
     SUMMA_NACH_REESTR_NEW.Enabled:=false;
     SUMMA_NACH_REESTR_RAZN.Enabled:=false;
     SUMMA_DED_REESTR.Enabled:=false;
     SUMMA_DED_REESTR_NEW.Enabled:=false;
     SUMMA_DED_REESTR_RAZN.Enabled:=false;

     cxLabel3.Enabled:=false;
     cxLabel4.Enabled:=false;
     cxLabel5.Enabled:=false;
     cxLabel6.Enabled:=false;
     cxLabel7.Enabled:=false;
     cxLabel8.Enabled:=false; }

     cxButton4.Enabled:=false;
     cxButton1.Enabled:=false;
     cxButton3.Enabled:=true;

     Close;

end;

procedure TfrmDelivInfo.cxButton2Click(Sender: TObject);
begin
  cxButton4Click(Sender);
  Close;
end;

procedure TfrmDelivInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cxButton4Click(Sender);
end;

end.
