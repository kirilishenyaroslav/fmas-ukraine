unit ReeFnzbDogProsm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxClasses, cxTL, ImgList, dxBarExtItems, dxBar, StdCtrls, cxButtons,
  ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  DB, cxDBData, FIBDataSet, pFIBDataSet, cxGridDBTableView, DBCtrls;

type
  TReeFnzbDogView = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    cxButton_cancel: TcxButton;
    cxButton_ok: TcxButton;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton_upd: TdxBarLargeButton;
    dxBarLargeButton_del: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton_print: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton_edit: TdxBarLargeButton;
    dxBarLargeButton8: TdxBarLargeButton;
    cbDBFPath: TdxBarCombo;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarContainerItem2: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    dxBarLargeButton3: TdxBarLargeButton;
    LargeImages: TImageList;
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
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet2: TcxGridTableViewStyleSheet;
    cxStyleRepository2: TcxStyleRepository;
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
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxTreeListStyleSheet2: TcxTreeListStyleSheet;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    WorkDB: TpFIBDatabase;
    Ft1: TpFIBTransaction;
    Ft2: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DS1: TpFIBDataSet;
    DataSource1: TDataSource;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1N_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1D_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CUSTOMER: TcxGridDBColumn;
    cxGrid1DBTableView1SUMMA: TcxGridDBColumn;
    cxGrid1DBTableView1MFO: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_BANK: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_CUSTOMER_NATIVE: TcxGridDBColumn;
    cxGrid1DBTableView1RATE_ACCOUNT_NATIVE: TcxGridDBColumn;
    cxGrid1DBTableView1MFO_NATIVE: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_BANK_NATIVE: TcxGridDBColumn;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    MfoCust: TDBText;
    BankCust: TDBText;
    RateCust: TDBText;
    MfoNative: TDBText;
    BankNative: TDBText;
    RateNative: TDBText;
    dxBarLargeButton6: TdxBarLargeButton;
    cxGrid1DBTableView1NAME_TIP_DOG: TcxGridDBColumn;
    cxGrid1DBTableView1REGEST_NUM: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cxButton_cancelClick(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure cxButton_okClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
   id_Dog      : int64;
   kod_Dog     : int64;
   id_Tip_Dog  : int64;
   id_Customer : Int64;
   id_rate_acc : int64;
   n_dog       : String;
   id_Sch_DB   : int64;
   id_kekv     : int64;
   kod_kekv    : integer;
   date_dog    : TDate;
   id_group:integer;
    { Public declarations }
  end;

var
  ReeFnzbDogView: TReeFnzbDogView;

implementation

uses ReeFnzbInput;

{$R *.dfm}

procedure TReeFnzbDogView.FormCreate(Sender: TObject);
begin
 WorkDB.Handle:=(Owner as TTfrmInputData).Db1.Handle;
 WorkDB.DefaultTransaction.Active:=true;
 WorkDB.DefaultUpdateTransaction.Active:=true;
 Ft1.Active:=true;
 Ft2.Active:=true;
 DS1.Active:=True;
end;

procedure TReeFnzbDogView.cxButton_cancelClick(Sender: TObject);
begin
// WorkDB.Close;
 ModalResult:=mrCancel;
end;

procedure TReeFnzbDogView.dxBarLargeButton6Click(Sender: TObject);
begin
// WorkDB.Close;
 ModalResult:=mrCancel;
end;

procedure TReeFnzbDogView.cxButton_okClick(Sender: TObject);
begin
 {(Owner as TTfrmInputData).id_Dog            := DS1.FieldValues['T_ID_DOG'];
 (Owner as TTfrmInputData).kod_Dog           := DS1.FieldValues['KOD_DOG'];
 (Owner as TTfrmInputData).id_rate_acc       := DS1.FieldValues['ID_RATE_ACCOUNT'];
 (Owner as TTfrmInputData).n_dog             := DS1.FieldValues['N_DOG'];
 (Owner as TTfrmInputData).date_dog          := DS1.FieldValues['D_DOG'];
 (Owner as TTfrmInputData).id_Customer       := DS1.FieldValues['ID_CUSTOMER'];
 (Owner as TTfrmInputData).NoteMemo.Text     := DS1.FieldValues['DOG_NOTE'];
 (Owner as TTfrmInputData).RegNumEdit.Text   := DS1.FieldValues['REGEST_NUM'];
 (Owner as TTfrmInputData).NameCustEdit.Text := DS1.FieldValues['NAME_CUSTOMER'];
 (Owner as TTfrmInputData).RateAccEdit.Text  := DS1.FieldValues['RATE_ACCOUNT'];
 (Owner as TTfrmInputData).DogNameEdit.Text  := DS1.FieldValues['N_DOG'];
 (Owner as TTfrmInputData).DateDogEdit.Text  := DS1.FieldValues['MFO'];   } 
// WorkDB.Close;
 ModalResult:=mrOk;
end;

procedure TReeFnzbDogView.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 cxButton_okClick(Self);
// WorkDB.Close;
end;

end.
