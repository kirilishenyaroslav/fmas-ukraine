{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{                  Модуль "Добавление(изменение) шаблона отчета"               }
{ Отвечает за ввод данных необходимых для добавления(изменения) шаблона отчета.}
{                                                 ответственный: Гнибеда Антон }

unit sp_report_template_form_ADD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridDBTableView, cxGrid, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxCalendar, cxImageComboBox, cxCalc,
  cxLookAndFeelPainters, cxButtons, FIBDataSet, pFIBDataSet,
  cxMaskEdit, cxButtonEdit;

type
  TFsp_report_template_form_add = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column3: TcxGridColumn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1TableView1Column4: TcxGridColumn;
    Label1: TLabel;
    Label2: TLabel;
    NameEdit: TcxTextEdit;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FullNameEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  Fsp_report_template_form_add: TFsp_report_template_form_add;

implementation
{$R *.DFM}

procedure TFsp_report_template_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFsp_report_template_form_add.OKButtonClick(Sender: TObject);
var
 i : integer;
begin
 if NameEdit.Text = '' then begin
  ShowMessage('Необхідно ввести назва шаблону.');
  exit;
 end;
{ if cxGrid1TableView1.DataController.RecordCount = 0 then begin
  ShowMessage('Необхідно заповнити інформацію про поля');
  exit;
 end;
 for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do if (cxGrid1TableView1.DataController.DisplayTexts[i, 0] = '') or (cxGrid1TableView1.DataController.DisplayTexts[i, 1] = '') then begin
  ShowMessage('Необхідно заповнити інформацію про поля');
  exit;
 end;}

 ModalResult := mrOK;
end;

procedure TFsp_report_template_form_add.FullNameEditKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key  = #13 then begin
  Key := #0;
  OKButton.SetFocus;
 end;
end;

procedure TFsp_report_template_form_add.FormCreate(Sender: TObject);
begin
 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
end;

end.
