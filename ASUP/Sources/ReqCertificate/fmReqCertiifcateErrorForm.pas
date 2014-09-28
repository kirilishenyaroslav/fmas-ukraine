unit fmReqCertiifcateErrorForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, Buttons, cxTextEdit, cxCheckBox, FIBDataSet,
  pFIBDataSet, cxButtonEdit, StdCtrls, ActnList;

type
  TErrorForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    ErorrSource: TDataSource;
    cxGrid: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    ActionList: TActionList;
    okAction: TAction;
    BitBtn1: TBitBtn;
    DataSet1: TpFIBDataSet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure okActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ErrorForm: TErrorForm;

implementation
 uses fmReqCertificateUnit,fmAddReqCertificateUnit,fmHistSigns;
{$R *.dfm}

procedure TErrorForm.SpeedButton1Click(Sender: TObject);
begin
close;
end;

procedure TErrorForm.Button1Click(Sender: TObject);
begin
close;
end;

procedure TErrorForm.okActionExecute(Sender: TObject);
begin
close;
end;

end.
