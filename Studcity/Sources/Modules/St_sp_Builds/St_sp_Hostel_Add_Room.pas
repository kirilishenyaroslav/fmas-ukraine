unit St_sp_Hostel_Add_Room;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet,
  pFIBDataSet, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxMaskEdit, cxDropDownEdit, cxTextEdit, cxLabel, cxContainer, cxGroupBox,
  StdCtrls, cxButtons, cxCheckBox, St_sp_Hostel_Form, cxCurrencyEdit;

type
  TBuildsFormAddRoom = class(TForm)
    OKButton: TcxButton;
    CancelButton: TcxButton;
    cxGroupBox1: TcxGroupBox;
    RoomLabel: TcxLabel;
    RoomEdit: TcxTextEdit;
    cxLabel1: TcxLabel;
    TypeEdit: TcxPopupEdit;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_TYPE_ROOM: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_TYPE_ROOM: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1MAX_PEOPLE_COUNT: TcxGridDBColumn;
    cxGrid1DBTableView1SIZE: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    pFIBDataSet1: TpFIBDataSet;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure OKButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_type_room_original : integer;
    room_original : String;
    isModify : boolean;
    id_type_room : integer;
  end;

var
  BuildsFormAddRoom: TBuildsFormAddRoom;

implementation
 //uses  DataModule1_Unit, Unit_of_Utilits, St_sp_Hostel_Form;
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

procedure TBuildsFormAddRoom.FormCreate(Sender: TObject);
begin
id_type_room := -1;
end;

procedure TBuildsFormAddRoom.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TBuildsFormAddRoom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 pFIBDataSet1.Close;
 action:=caFree;
end;

procedure TBuildsFormAddRoom.FormShow(Sender: TObject);
begin
if RoomEdit.Text <> '' then room_original := RoomEdit.Text else room_original := '-1';
 id_type_room_original := id_type_room;

 pFIBDataSet1.Open;

 if id_type_room <> -1 then begin
  pFIBDataSet1.Locate('ID_TYPE_ROOM', id_type_room, []);
  TypeEdit.Text := pFIBDataSet1['NAME_TYPE_ROOM'];
  end;

  if id_type_room = -1 then begin
 pFIBDataSet1.First;
 TypeEdit.Text := pFIBDataSet1['NAME_TYPE_ROOM'];
 id_type_room :=  pFIBDataSet1['ID_TYPE_ROOM'];
 end;

  RoomEdit.SetFocus;                                                                          
end;

procedure TBuildsFormAddRoom.cxGrid1DBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
TypeEdit.DroppedDown := false;
 id_type_room := pFIBDataSet1['ID_TYPE_ROOM'];
 TypeEdit.Text := pFIBDataSet1['NAME_TYPE_ROOM'];
end;

procedure TBuildsFormAddRoom.OKButtonClick(Sender: TObject);
begin
 {if not IntegerCheck(RoomEdit.Text) then begin
  ShowMessage('Комната введена неверно.');
  RoomEdit.SetFocus;
  exit;
 end;}

 if id_type_room = -1 then begin
  ShowMessage('Необходимо указать тип комнаты.');
  exit;
 end;
 if TBuildsForm(Owner).RoomDataSet.Locate('ROOM;ID_TYPE_ROOM', VarArrayOf([RoomEdit.Text, id_type_room]), []) then begin
  if (TBuildsForm(Owner).RoomDataSet['ROOM'] <> room_original) or (TBuildsForm(Owner).RoomDataSet['ID_TYPE_ROOM'] <> id_type_room_original) then begin
   ShowMessage('Данная комната уже существует.');
   exit;
  end; 
 end;
 ModalResult := mrOK;
end;

end.
