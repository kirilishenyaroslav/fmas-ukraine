unit uDesignClon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxLabel, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxDBEdit,
  DB, FIBDataSet, pFIBDataSet, DBCtrls;

type
  TfrmDesignClon = class(TForm)
    cxButtonOk: TcxButton;
    cxButtonCancel: TcxButton;
    cxLabel1: TcxLabel;
    pFIBDataSetTypeForm: TpFIBDataSet;
    DataSource1: TDataSource;
    DBLookupComboBoxNew: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure cxButtonCancelClick(Sender: TObject);
    procedure cxButtonOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    function GetNewReport():Variant;
    { Public declarations }
  end;

var
  frmDesignClon : TfrmDesignClon;
  res           : Variant;
implementation
uses
  uDesignColum;
{$R *.dfm}

function TfrmDesignClon.GetNewReport():Variant;
begin
  ShowModal;
  GetNewReport := res;
end;



procedure TfrmDesignClon.FormCreate(Sender: TObject);
begin
  pFIBDataSetTypeForm.Active         := False;
  pFIBDataSetTypeForm.Database       := TfrmDesignColum(self.Owner).pFIBDatabase1;
  pFIBDataSetTypeForm.Transaction    := TfrmDesignColum(self.Owner).ReadTransaction;
  pFIBDataSetTypeForm.SelectSQL.Text := 'select * from MON_SP_FORM_CODE';
  pFIBDataSetTypeForm.Active         := True;
  pFIBDataSetTypeForm.FetchAll;

  
end;

procedure TfrmDesignClon.cxButtonCancelClick(Sender: TObject);
begin
  res := -1;
  close;
end;

procedure TfrmDesignClon.cxButtonOkClick(Sender: TObject);
begin
  res := DBLookupComboBoxNew.KeyValue;
  close;
end;

end.
