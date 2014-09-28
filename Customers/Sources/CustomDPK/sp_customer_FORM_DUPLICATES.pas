unit sp_customer_FORM_DUPLICATES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, FIBDataSet, pFIBDataSet, cxTL,
  cxLookAndFeelPainters, StdCtrls, cxButtons, BaseTypes;

type
  TfrmSP_CUST_DUPL = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    pFIBDataSet1: TpFIBDataSet;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
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
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    DataSource1: TDataSource;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxButton3: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
  public
    Action : TSpravAction;
  end;

var
  frmSP_CUST_DUPL: TfrmSP_CUST_DUPL;

implementation
uses sp_Customer_form, Math, dogLoaderUnit, LangUnit;
{$R *.dfm}

procedure TfrmSP_CUST_DUPL.FormCreate(Sender: TObject);
var
 frm : TFsp_customer;
begin
 LangPackApply(Self);
 frm := TFsp_customer(Owner);
 pFIBDataSet1.Database := frm.WorkDatabase;
 pFIBDataSet1.Transaction := frm.ReadTransaction;
end;

procedure TfrmSP_CUST_DUPL.cxButton1Click(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TfrmSP_CUST_DUPL.cxButton2Click(Sender: TObject);
begin
 ModalResult := mrOk;
end;

procedure TfrmSP_CUST_DUPL.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 if pFIBDataSet1.RecordCount = 0 then exit;  
 ModalResult := mrOk;
end;

procedure TfrmSP_CUST_DUPL.FormShow(Sender: TObject);
begin
 if Action = saMod then cxButton3.Caption := '«м≥нити';
 if pFIBDataSet1.RecordCount = 0 then cxButton2.Enabled := false;
end;

procedure TfrmSP_CUST_DUPL.cxButton3Click(Sender: TObject);
begin
 ModalResult := mrYes;
end;

end.
