unit UGetTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid;

type
  TfrmGetTemplate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses UDocDetail;
{$R *.dfm}

procedure TfrmGetTemplate.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mryes;
end;

procedure TfrmGetTemplate.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrno;
end;

procedure TfrmGetTemplate.FormCreate(Sender: TObject);
begin
     if TfrmDocDetail(Owner).TemplatesDataSet.Active then TfrmDocDetail(Owner).TemplatesDataSet.Close;
     TfrmDocDetail(Owner).TemplatesDataSet.SelectSQL.Text:='SELECT * FROM BU_SPRAV_TEMPLATE_SELECT_EX';
     TfrmDocDetail(Owner).TemplatesDataSet.Open;
     cxGrid1DBTableView1.DataController.DataSource:=TfrmDocDetail(Owner).TemplatesDataSource;
end;

procedure TfrmGetTemplate.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     if (TfrmDocDetail(Owner).TemplatesDataSet.RecordCount>0)
     then ModalResult:=mrYes;
end;

end.
