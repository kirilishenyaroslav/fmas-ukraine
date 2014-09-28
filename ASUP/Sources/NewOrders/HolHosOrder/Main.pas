unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  Buttons, ExtCtrls, ActnList, cxClasses, dm, AddDate,uFormControl,
  StdCtrls, Mask, ToolEdit, uFControl, uInvisControl, FIBDataSet,
  pFIBDataSet;

type
  TMain_Form = class(TForm)
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
    KeyList: TActionList;
    CancelAction: TAction;
    ModifyAction: TAction;
    RefreshAction: TAction;
    DataSource1: TDataSource;
    Panel1: TPanel;
    ModifyButton: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn10: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn11: TcxGridDBColumn;
    RefreshFilterAction: TAction;
    InvisControl1: TqFInvisControl;
    InvisControl2: TqFInvisControl;
    GroupBox1: TGroupBox;
    AcceptFilterButton: TSpeedButton;
    FilterDateBeg: TCheckBox;
    FilterDateEnd: TCheckBox;
    DateEnd: TDateEdit;
    DateBeg: TDateEdit;
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure ModifyActionExecute(Sender: TObject);
    procedure RefreshFilterActionExecute(Sender: TObject);
    procedure DateBegKeyPress(Sender: TObject; var Key: Char);
    procedure DateEndKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

{$R *.dfm}

procedure TMain_Form.RefreshActionExecute(Sender: TObject);
begin
   data.SelectOrder.CloseOpen(False);
end;

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  Data.DB.Open;
  Data.SelectOrder.CloseOpen(False);
  Data.SelectOrder.First;
end;

procedure TMain_Form.CancelActionExecute(Sender: TObject);
begin
  close;
end;

procedure TMain_Form.ModifyActionExecute(Sender: TObject);
var
  DateAdd: TAdd_Date;
  id_moving : Integer;
begin
     DateAdd:= TAdd_Date.Create(fmModify, Data.SelectOrder['id_man_moving']);
     id_moving := Data.SelectOrder['id_man_moving'];
     Data.SelectOrder.Close;
     Data.SelectOrder.Open;
     Data.SelectOrder.Locate('id_man_moving',id_moving,[]);
end;

procedure TMain_Form.RefreshFilterActionExecute(Sender: TObject);
begin
  Data.SelectOrder.Close;
  if FilterDateBeg.Checked = True then
     InvisControl1.Value := DateBeg.Date
  else
     InvisControl1.Value := 2;
  if FilterDateEnd.Checked = True then
     InvisControl2.Value := DateEnd.Date
  else
     InvisControl2.Value := 219512;
  Data.SelectOrder.ParamByName('Filter_date_beg').AsDate := InvisControl1.Value;
  Data.SelectOrder.ParamByName('Filter_date_end').AsDate := InvisControl2.Value;
  Data.SelectOrder.Open;
end;

procedure TMain_Form.DateBegKeyPress(Sender: TObject; var Key: Char);
begin
  if DateBeg.Text = '  .  .    ' then
     FilterDateBeg.Checked := False
  else
     FilterDateBeg.Checked := True;
end;

procedure TMain_Form.DateEndKeyPress(Sender: TObject; var Key: Char);
begin
  if DateEnd.Text = '  .  .    ' then
     FilterDateEnd.Checked := False
  else
     FilterDateEnd.Checked := True;
end;

end.
