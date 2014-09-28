unit St_sp_Hostel_Add_Many_Room;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
  pFIBDataSet, cxCheckBox, Buttons, cxMaskEdit, cxDropDownEdit,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxLabel,
  cxContainer, cxGroupBox, StdCtrls, cxButtons, St_sp_Hostel_Form,
  cxCurrencyEdit;

type
  TBuildsFormAddRoom2 = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    FromEdit: TcxTextEdit;
    cxLabel2: TcxLabel;
    ToEdit: TcxTextEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_TYPE_ROOM: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_ROOM: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1MAX_PEOPLE_COUNT: TcxGridDBColumn;
    cxGrid1DBTableView1SIZE: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox2: TcxGroupBox;
    cxLabel3: TcxLabel;
    TypeEdit: TcxPopupEdit;
    cxGroupBox3: TcxGroupBox;
    AddButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    DownButton: TSpeedButton;
    UpButton: TSpeedButton;
    cxGrid2: TcxGrid;
    cxGrid2TableView1: TcxGridTableView;
    cxGrid2TableView1ID_ROOM_TYPE: TcxGridColumn;
    cxGrid2TableView1NAME_ROOM_TYPE: TcxGridColumn;
    cxGrid2Level1: TcxGridLevel;
    cxCheckBox1: TcxCheckBox;
    DataSource1: TDataSource;
    pFIBDataSet1: TpFIBDataSet;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyleRepository2: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure AddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure UpButtonClick(Sender: TObject);
    procedure DownButtonClick(Sender: TObject);
    procedure cxGrid2TableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure OKButtonClick(Sender: TObject);
    procedure FromEditKeyPress(Sender: TObject; var Key: Char);
    procedure ToEditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeEditKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     id_type_room : integer;
    procedure CheckUpDownButtons;
  end;

var
  BuildsFormAddRoom2: TBuildsFormAddRoom2;

implementation
//uses DataModule1_Unit, Unit_of_Utilits;
{$R *.dfm}


function IntegerCheck(const s : string) : boolean;
var
 i : integer;
 k : char;
begin
 Result := false;
 if s = '' then exit;
 for i := 1 to Length(s) do begin
  k := s[i];
  if not (k in ['0'..'9',#8, #13]) then k := #0;
  if k = #0 then exit;
 end;
 Result := true;
end;

procedure TBuildsFormAddRoom2.CheckUpDownButtons;
begin
 if cxGrid2TableView1.DataController.RecordCount = 0 then begin
  UpButton.Enabled := false;
  DownButton.Enabled := false;
  exit;
 end;
 if cxGrid2TableView1.DataController.FocusedRecordIndex > 0 then UpButton.Enabled := true else UpButton.Enabled := false;
 if cxGrid2TableView1.DataController.FocusedRecordIndex < cxGrid2TableView1.DataController.RecordCount - 1 then DownButton.Enabled := true else DownButton.Enabled := false;
end;
procedure TBuildsFormAddRoom2.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TBuildsFormAddRoom2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 pFIBDataSet1.Close;
 action:=cafree;
end;

procedure TBuildsFormAddRoom2.FormShow(Sender: TObject);
begin
  pFIBDataSet1.Open;

  pFIBDataSet1.First;
  TypeEdit.Text := pFIBDataSet1['NAME_TYPE_ROOM'];
  id_type_room := pFIBDataSet1['ID_TYPE_ROOM'];

  FromEdit.SetFocus;
end;

procedure TBuildsFormAddRoom2.cxCheckBox1Click(Sender: TObject);
begin
cxGroupBox3.Visible := cxCheckBox1.Checked;
 if cxGroupBox3.Visible then Height := 290 else Height := 145;
end;

procedure TBuildsFormAddRoom2.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
TypeEdit.DroppedDown := false;
 id_type_room := pFIBDataSet1['ID_TYPE_ROOM'];
 TypeEdit.Text := pFIBDataSet1['NAME_TYPE_ROOM'];
end;

procedure TBuildsFormAddRoom2.AddButtonClick(Sender: TObject);
begin
if id_type_room = -1 then begin
  ShowMessage('Перед добавлением необходимо указать тип комнаты.');
  exit;
 end;
 cxGrid2TableView1.DataController.RecordCount := cxGrid2TableView1.DataController.RecordCount + 1;
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 0] := id_type_room;
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.RecordCount - 1, 1] := TypeEdit.Text;
 cxGrid2TableView1.DataController.FocusedRecordIndex := cxGrid2TableView1.DataController.RecordCount - 1;
 DeleteButton.Enabled := true;
 CheckUpDownButtons;
end;

procedure TBuildsFormAddRoom2.FormCreate(Sender: TObject);
begin
  id_type_room := -1;
  cxGrid2TableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
  cxGrid2TableView1.Items[1].DataBinding.ValueTypeClass := TcxStringValueType;
end;

procedure TBuildsFormAddRoom2.DeleteButtonClick(Sender: TObject);
begin
cxGrid2TableView1.DataController.DeleteFocused;
 if cxGrid2TableView1.DataController.RecordCount = 0 then DeleteButton.Enabled := false;
 CheckUpDownButtons;
end;

procedure TBuildsFormAddRoom2.UpButtonClick(Sender: TObject);
var
 tmp_id   : integer;
 tmp_type : string;
begin
 tmp_id := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 0];
 tmp_type := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 1];
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 0] := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex - 1, 0];
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 1] := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex - 1, 1];
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex - 1, 0] := tmp_id;
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex - 1, 1] := tmp_type;
 cxGrid2TableView1.DataController.FocusedRecordIndex := cxGrid2TableView1.DataController.FocusedRecordIndex - 1;
 CheckUpDownButtons;

end;

procedure TBuildsFormAddRoom2.DownButtonClick(Sender: TObject);
var
 tmp_id   : integer;
 tmp_type : string;
begin
 tmp_id := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 0];
 tmp_type := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 1];
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 0] := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex + 1, 0];
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex, 1] := cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex + 1, 1];
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex + 1, 0] := tmp_id;
 cxGrid2TableView1.DataController.Values[cxGrid2TableView1.DataController.FocusedRecordIndex + 1, 1] := tmp_type;
 cxGrid2TableView1.DataController.FocusedRecordIndex := cxGrid2TableView1.DataController.FocusedRecordIndex + 1;
 CheckUpDownButtons;

end;

procedure TBuildsFormAddRoom2.cxGrid2TableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
 CheckUpDownButtons;
end;

procedure TBuildsFormAddRoom2.OKButtonClick(Sender: TObject);
begin
if not IntegerCheck(FromEdit.Text) then begin
  ShowMessage('Начало интервала введено неверно.');
  FromEdit.SetFocus;
  exit;
 end;
 if not IntegerCheck(ToEdit.Text) then begin
  ShowMessage('Конец интервала введен неверно.');
   ToEdit.SetFocus;
  exit;
 end;
 if StrToInt(FromEdit.Text) >= StrToInt(ToEdit.Text) then begin
  ShowMessage('Значение начала интервала должно быть меньше значения конца интервала.');
  ToEdit.SetFocus;
  exit;
 end;
 if cxCheckBox1.Checked then begin
  if cxGrid2TableView1.DataController.RecordCount = 0 then begin
   ShowMessage('Необходимо добавит хотя бы один тип комнаты.');
   exit;
  end;
 end else begin
  if id_type_room = -1 then begin
   ShowMessage('Необходимо указать тип комнаты.');
   exit;
  end;
 end;
 ModalResult := mrOk;
end;

procedure TBuildsFormAddRoom2.FromEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then ToEdit.SetFocus;
end;

procedure TBuildsFormAddRoom2.ToEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then TypeEdit.SetFocus;
end;

procedure TBuildsFormAddRoom2.TypeEditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then OKButton.SetFocus;
end;

end.
