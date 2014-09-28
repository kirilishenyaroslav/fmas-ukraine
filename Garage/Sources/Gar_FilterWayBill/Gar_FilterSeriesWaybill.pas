unit Gar_FilterSeriesWaybill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, ExtCtrls,
  Gar_DMFilterWaybill,gr_uCommonLoader,gar_Types, gr_uMessage,
  gr_uCommonConsts, gr_uCommonProc,gar_Consts, Gar_FilterSeriesWaybillResult;

type
  TFormFilterSeriesWaybill = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    DateBegDateEdit: TcxDateEdit;
    DateEndDateEdit: TcxDateEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    constructor Create(Param:TgrSimpleParam);reintroduce;
  end;

var
  FormFilterSeriesWaybill: TFormFilterSeriesWaybill;

implementation

{$R *.dfm}
constructor TFormFilterSeriesWaybill.Create(Param:TgrSimpleParam);
begin
 DMFilterWaybill:=TDMFilterWaybill.Create(Param);
 inherited Create(Param.Owner);
 DateBegDateEdit.text := '';
 DateEndDateEdit.text := '';
end;

procedure TFormFilterSeriesWaybill.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFormFilterSeriesWaybill.Button1Click(Sender: TObject);
var
  ViewForm : TFormFilterSeriesWaybillResult;
begin
  if (DateBegDateEdit.Text = '') then
  begin
    ShowMessage('Заповніть дату');
    DateBegDateEdit.SetFocus;
    Exit;
  end;

  if (DateEndDateEdit.Text = '') then
  begin
    ShowMessage('Заповніть дату');
    DateEndDateEdit.SetFocus;
    Exit;
  end;


  DMFilterWaybill.FilterSeriesWaybillDSet.Close;
  DMFilterWaybill.FilterSeriesWaybillDSet.SelectSQL.Text := 'select * from GAR_COUNT_SERIES(:d1,:d2)';
  DMFilterWaybill.FilterSeriesWaybillDSet.ParamByName('d1').AsDate := DateBegDateEdit.Date;
  DMFilterWaybill.FilterSeriesWaybillDSet.ParamByName('d2').AsDate := DateEndDateEdit.Date;
  DMFilterWaybill.FilterSeriesWaybillDSet.Open;
  DMFilterWaybill.FilterSeriesWaybillDSet.FetchAll;


  if (DMFilterWaybill.FilterSeriesWaybillDSet.IsEmpty = True) then
    begin
      ShowMessage('За такими параметрами немає інформації');
    end
  else
  begin
    ViewForm := TFormFilterSeriesWaybillResult.Create(Self);
    ViewForm.FilterSeriesWaybillGridDBTableView1.DataController.DataSource := DMFilterWaybill.FilterSeriesWaybillDSource;
    ViewForm.FilterSeriesWaybillGrid.Refresh;
    ViewForm.ShowModal;
    viewForm.Free;
    Close;
  end;
end;

end.
