{******************************************************************************}
{*              Автоматизированная система «Учет и анализ договорных          *}
{*                         обязательств ГПП «Укрпромводчермет»                *}
{*              (c) Донецкий национальный университет, 2002-2003              *}
{******************************************************************************}

{                  Модуль "Добавление(изменение) отчета"                       }
{ Отвечает за ввод данных необходимых для добавления(изменения) отчета.        }
{                                                 ответственный: Гнибеда Антон }

unit sp_report_FORM_ADD;

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
  TFsp_report_form_add = class(TForm)
    Label1: TLabel;
    NameEdit: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1TableView1: TcxGridTableView;
    cxGrid1TableView1Column1: TcxGridColumn;
    cxGrid1TableView1Column2: TcxGridColumn;
    cxGrid1TableView1Column3: TcxGridColumn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxButton1: TcxButton;
    cxGrid1TableView1Column4: TcxGridColumn;
    pFIBDataSet1: TpFIBDataSet;
    Label2: TLabel;
    DLLEdit: TcxButtonEdit;
    OpenDialog1: TOpenDialog;
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxButton2: TcxButton;
    cxCheckBox1: TcxCheckBox;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1TableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxButton1Click(Sender: TObject);
    procedure DLLEditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fsp_report_form_add: TFsp_report_form_add;

implementation
uses sp_report_sel_table_FORM;
{$R *.DFM}

procedure TFsp_report_form_add.CancelButtonClick(Sender: TObject);
begin
 ModalResult := mrCancel;
end;

procedure TFsp_report_form_add.OKButtonClick(Sender: TObject);
var
 i : integer;
begin
 if NameEdit.Text = '' then begin
  ShowMessage('Необхідно ввести назва звіту.');
  exit;
 end;
 if not FileExists(ExtractFilePath(Application.ExeName) + 'Reports\' + DLLEdit.Text) then begin
  ShowMessage('Файл "' + DLLEdit.Text +  '" не існує. Вкажіть інший файл.');
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

procedure TFsp_report_form_add.FormShow(Sender: TObject);
begin
 NameEdit.SetFocus;
end;

procedure TFsp_report_form_add.FormCreate(Sender: TObject);
begin
 cxGrid1TableView1.Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 cxGrid1TableView1.DataController.RecordCount := 1;
 cxGrid1TableView1.DataController.Values[0, 0] := '';
 cxGrid1TableView1.DataController.Values[0, 2] := 'char';
 cxGrid1TableView1.DataController.Values[0, 3] := 'True';
end;

procedure TFsp_report_form_add.cxGrid1TableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if AFocusedRecord = NIL then exit;
 if cxGrid1TableView1.DataController.DisplayTexts[AFocusedRecord.Index, 2] = '' then begin
  cxGrid1TableView1.DataController.Values[AFocusedRecord.Index, 2] := 'char';
  cxGrid1TableView1.DataController.Values[AFocusedRecord.Index, 3] := 'True';
 end;
end;

procedure TFsp_report_form_add.cxButton1Click(Sender: TObject);
var
 str : string;
 table_name : string;
 i   : integer;
begin
 str := '';
 SelTableFrom := TSelTableFrom.Create(Self);

 //Получаем список всех таблиц
 pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from PROC_SYS_SELECT_ALL_TABLES';
 pFIBDataSet1.Active := true;
 while not pFIBDataSet1.Eof do begin
  SelTableFrom.cxComboBox1.Properties.Items.Add(pFIBDataSet1['TABLE_NAME']);
  pFIBDataSet1.Next;
 end;
 pFIBDataSet1.Active := false;

 if SelTableFrom.ShowModal = mrCancel then exit;
 table_name := UPPERCASE(SelTableFrom.cxComboBox1.Text);
 SelTableFrom.Free;
 pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ' + table_name;
 pFIBDataSet1.Active := true;
 //Получаем список всех полей
 if pFIBDataSet1.FieldCount <> 0 then begin
  cxGrid1TableView1.DataController.RecordCount := pFIBDataSet1.FieldCount;
  for i := 0 to pFIBDataSet1.FieldCount - 1 do begin
   cxGrid1TableView1.DataController.Values[i, 0] := pFIBDataSet1.Fields[i].FieldName;
   cxGrid1TableView1.DataController.Values[i, 1] := pFIBDataSet1.Fields[i].FieldName;
   case pFIBDataSet1.Fields[i].DataType of
    ftString: str := 'char';
    ftSmallint, ftInteger, ftWord, ftLargeint: str := 'integer';
    ftFloat, ftCurrency: str := 'numeric';
    ftDate: str := 'date';
    ftTime: str := 'time';
    ftDateTime: str := 'timestamp';
    else str := 'char';
   end;
   cxGrid1TableView1.DataController.Values[i, 2] := str;
   cxGrid1TableView1.DataController.Values[i, 3] := 'True';
  end;
 end;
 pFIBDataSet1.Active := false;

 //Получаем описание полей
 if cxCheckBox1.Checked then if cxGrid1TableView1.DataController.RecordCount <> 0 then begin
  pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from RDB$RELATION_FIELDS where (RDB$RELATION_NAME = ''' + table_name + ''')';
  pFIBDataSet1.Active := true;
  while not pFIBDataSet1.eof do begin
   for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do if cxGrid1TableView1.DataController.Values[i, 1] = pFIBDataSet1['RDB$FIELD_NAME'] then begin
    cxGrid1TableView1.DataController.Values[i, 0] := pFIBDataSet1['RDB$DESCRIPTION'];
    break;
   end;
   pFIBDataSet1.Next;
  end;
 end;
 pFIBDataSet1.Active := false;
end;

procedure TFsp_report_form_add.DLLEditPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
 OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'Reports\';
 if not OpenDialog1.Execute then exit;
 DLLEdit.Text := ExtractFileName(OpenDialog1.FileName);
end;

procedure TFsp_report_form_add.cxButton2Click(Sender: TObject);
var
 str : string;
 table_name : string;
 i   : integer;
begin
 str := '';
 SelTableFrom := TSelTableFrom.Create(Self);
 SelTableFrom.Caption := 'Ім''я процедури';

 //Получаем список всех процедур
 pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from PROC_SYS_SELECT_ALL_PROCEDURES';
 pFIBDataSet1.Active := true;
 while not pFIBDataSet1.Eof do begin
  SelTableFrom.cxComboBox1.Properties.Items.Add(pFIBDataSet1['NAME_PROCEDURE']);
  pFIBDataSet1.Next;
 end;
 pFIBDataSet1.Active := false;

 if SelTableFrom.ShowModal = mrCancel then exit;
 table_name := UPPERCASE(SelTableFrom.cxComboBox1.Text);
 SelTableFrom.Free;
 pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from ' + table_name;
 pFIBDataSet1.Active := true;
 //Получаем список всех полей
 if pFIBDataSet1.FieldCount <> 0 then begin
  cxGrid1TableView1.DataController.RecordCount := pFIBDataSet1.FieldCount;
  for i := 0 to pFIBDataSet1.FieldCount - 1 do begin
   cxGrid1TableView1.DataController.Values[i, 0] := pFIBDataSet1.Fields[i].FieldName;
   cxGrid1TableView1.DataController.Values[i, 1] := pFIBDataSet1.Fields[i].FieldName;
   case pFIBDataSet1.Fields[i].DataType of
    ftString: str := 'char';
    ftSmallint, ftInteger, ftWord, ftLargeint: str := 'integer';
    ftFloat, ftCurrency: str := 'numeric';
    ftDate: str := 'date';
    ftTime: str := 'time';
    ftDateTime: str := 'timestamp';
    else str := 'char';
   end;
   cxGrid1TableView1.DataController.Values[i, 2] := str;
   cxGrid1TableView1.DataController.Values[i, 3] := 'True';
  end;
 end;
 pFIBDataSet1.Active := false;

 //Получаем описание полей
 if cxCheckBox1.Checked then if cxGrid1TableView1.DataController.RecordCount <> 0 then begin
  pFIBDataSet1.SQLs.SelectSQL.Text := 'select * from RDB$PROCEDURE_PARAMETERS where (RDB$PROCEDURE_NAME = ''' + table_name + ''')';
  pFIBDataSet1.Active := true;
  while not pFIBDataSet1.eof do begin
   for i := 0 to cxGrid1TableView1.DataController.RecordCount - 1 do if cxGrid1TableView1.DataController.Values[i, 1] = pFIBDataSet1['RDB$FIELD_NAME'] then begin
    cxGrid1TableView1.DataController.Values[i, 0] := pFIBDataSet1['RDB$DESCRIPTION'];
    break;
   end;
   pFIBDataSet1.Next;
  end;
 end;
 pFIBDataSet1.Active := false;
end;

end.
