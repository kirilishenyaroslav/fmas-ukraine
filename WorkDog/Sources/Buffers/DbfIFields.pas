unit DbfIFields;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, DB, Halcn6db,
  cxControls, cxContainer, cxListBox, cxCheckListBox;

type
  TfrmDbfFields = class(TForm)
    Label1: TLabel;
    HalcyonDataSet: THalcyonDataSet;
    cxButton1: TcxButton;
    cxCheckListBox1: TcxCheckListBox;
    cxButton2: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    types : array of string;
    { Public declarations }
  end;

implementation
uses
  BuffRelations;

{$R *.dfm}
function GetIBType(HalcyonField : TField): String;
begin
  if HalcyonField.DataType = ftString then
  begin
    Result := 'VARCHAR ' + '(' + IntToStr(HalcyonField.DataSize - 1) + ')';
  end;
  if HalcyonField.DataType = ftInteger then Result := 'INTEGER';
  if HalcyonField.DataType = ftSmallint then Result := 'SMALLINT';
  if HalcyonField.DataType = ftWord then Result := 'INTEGER';
  if HalcyonField.DataType = ftBoolean then Result := 'INTEGER';
  if HalcyonField.DataType = ftFloat then Result := 'NUMERIC(16,2)';
  if HalcyonField.DataType = ftCurrency then Result := 'NUMERIC(16,2)';
  if HalcyonField.DataType = ftDate then Result := 'DATE';
  if HalcyonField.DataType = ftTime then Result := 'TIME';
  if HalcyonField.DataType = ftDateTime then Result := 'TIMESTAMP';
end;


procedure TfrmDbfFields.FormCreate(Sender: TObject);
var
  sl : TStringList;
  path_buff: String;
  i : integer;
begin
  Caption := 'Поля ' + TfrmRelations(Self.Owner).alias;
  path_buff := TfrmRelations(Self.Owner).path + '\' + TfrmRelations(Self.Owner).alias;
  HalcyonDataSet.Close;
  HalcyonDataSet.DatabaseName := ExtractFilePath(path_buff);
  HalcyonDataSet.TableName := ExtractFileName(path_buff);
  try
    HalcyonDataSet.Open;
  except
    ShowMessage(TfrmRelations(Self.Owner).alias + ' по пути ' +  TfrmRelations(Self.Owner).path +  ' не найден');
    Close;
    Exit;
  end;
  sl := TStringList.Create;
  HalcyonDataSet.GetFieldNames(sl);
  for i := 0 to sl.Count - 1 do cxCheckListBox1.Items.Add.Text := sl.Strings[i];
  SetLength(types, cxCheckListBox1.Items.Count);
  for i := 0 to cxCheckListBox1.Items.Count - 1 do types[i] := GetIBType(HalcyonDataSet.fieldbyname(cxCheckListBox1.Items[i].Text));
//  cxCheckListBox1.Items[0].Checked
  sl.Free;

end;


procedure TfrmDbfFields.cxButton1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDbfFields.cxButton2Click(Sender: TObject);
begin
  Close;
end;

end.
