unit KorrUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ProvUnit, dogPayFulfilUnit, DB, FIBDataSet, pFIBDataSet,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, cxLabel,
  cxGroupBox, cxMemo, cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TfrmKorr = class(TForm)
    DataSet: TpFIBDataSet;
    DataSource1: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxLabel3: TcxLabel;
    cxGroupBox3: TcxGroupBox;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxLabel4: TcxLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxLabel5: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxLabel6: TcxLabel;
    cxGroupBox4: TcxGroupBox;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxLabel7: TcxLabel;
    cxDBTextEdit12: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    cxDBMemo2: TcxDBMemo;
    cxLabel10: TcxLabel;
    cxDBTextEdit15: TcxDBTextEdit;
    cxDBTextEdit16: TcxDBTextEdit;
    cxDBTextEdit17: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxDBTextEdit18: TcxDBTextEdit;
    cxLabel15: TcxLabel;
    cxDBTextEdit19: TcxDBTextEdit;
    cxLabel16: TcxLabel;
    cxDBTextEdit20: TcxDBTextEdit;
    cxLabel17: TcxLabel;
    cxDBTextEdit21: TcxDBTextEdit;
    cxLabel18: TcxLabel;
    cxDBTextEdit22: TcxDBTextEdit;
    cxGroupBox5: TcxGroupBox;
    cxDBTextEdit23: TcxDBTextEdit;
    cxDBTextEdit24: TcxDBTextEdit;
    cxDBTextEdit25: TcxDBTextEdit;
    cxDBTextEdit26: TcxDBTextEdit;
    cxDBTextEdit27: TcxDBTextEdit;
    cxDBTextEdit28: TcxDBTextEdit;
    cxDBTextEdit29: TcxDBTextEdit;
    cxDBTextEdit30: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxLabel20: TcxLabel;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxGroupBox6: TcxGroupBox;
    cxDBTextEdit31: TcxDBTextEdit;
    cxDBTextEdit32: TcxDBTextEdit;
    cxDBTextEdit33: TcxDBTextEdit;
    cxDBTextEdit34: TcxDBTextEdit;
    cxDBTextEdit35: TcxDBTextEdit;
    cxDBTextEdit36: TcxDBTextEdit;
    cxDBTextEdit37: TcxDBTextEdit;
    cxDBTextEdit38: TcxDBTextEdit;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxLabel25: TcxLabel;
    cxLabel26: TcxLabel;
    cxButton1: TcxButton;
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    id_prov : Int64;
    procedure SelectAll;
  end;

var
  frmKorr: TfrmKorr;

implementation

{$R *.dfm}

{ TfrmKorr }

procedure TfrmKorr.SelectAll;
begin
  DataSet.Close;
  DataSet.ParamByName('ID_PROV').AsInt64 := id_prov;
  DataSet.Open;
end;

procedure TfrmKorr.cxButton1Click(Sender: TObject);
begin
 Close;
end;

end.
