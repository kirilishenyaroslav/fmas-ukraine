unit St_sp_Hostel_Form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxTextEdit, cxContainer,
  cxLabel, ExtCtrls, ActnList, dxBar, dxBarExtItems, FIBQuery, pFIBQuery,
  pFIBStoredProc, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ImgList, Menus, StdCtrls,
  FIBDatabase, pFIBDatabase, IBase, St_Proc, cxCurrencyEdit, dxStatusBar;

  type
  TBuildsInfo = record
  id_build : Int64;
  N_Room  : string;
  end;

  type
  TBuildsForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SELECT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SIZE: TcxGridDBColumn;
    cxGrid1DBTableView1FLOORS: TcxGridDBColumn;
    cxGrid1DBTableView1CHIEF: TcxGridDBColumn;
    cxGrid1DBTableView1OBLAST: TcxGridDBColumn;
    cxGrid1DBTableView1RAION: TcxGridDBColumn;
    cxGrid1DBTableView1TOWN: TcxGridDBColumn;
    cxGrid1DBTableView1STREET: TcxGridDBColumn;
    cxGrid1DBTableView1HOUSE: TcxGridDBColumn;
    cxGrid1DBTableView1INDEX: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1ROOM: TcxGridDBColumn;
    cxGridDBTableView1ID_TYPE_ROOM: TcxGridDBColumn;
    cxGridDBTableView1NAME_TYPE_ROOM: TcxGridDBColumn;
    cxGridDBTableView1ROOM_COMPARED: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DataSource: TDataSource;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    AddRoomButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    DeleteRoomButton: TdxBarLargeButton;
    EditRoomButton: TdxBarLargeButton;
    AddRoomButton2: TdxBarLargeButton;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    DataSource1: TDataSource;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    ShortNameLabel: TEdit;
    AddressLabel: TEdit;
    dxBarLargeButton1: TdxBarLargeButton;
    Search_Button: TdxBarLargeButton;
    Splitter1: TSplitter;
    PopupMenu1: TdxBarPopupMenu;
    PopupImageList: TImageList;
    dxBarPopupMenu1: TdxBarPopupMenu;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSet: TpFIBDataSet;
    WriteProc: TpFIBStoredProc;
    ReadDataSet: TpFIBDataSet;
    RoomDataSet: TpFIBDataSet;
    ViewAction: TAction;
    HotKey_StatusBar: TdxStatusBar;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ViewButtonClick(Sender: TObject);
    procedure RoomDataSetAfterScroll(DataSet: TDataSet);
    procedure RefreshButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure AddRoomButtonClick(Sender: TObject);
    procedure DeleteRoomButtonClick(Sender: TObject);
    procedure EditRoomButtonClick(Sender: TObject);
    procedure AddRoomButton2Click(Sender: TObject);
    procedure SelectButtonClick(Sender: TObject);
    procedure Search_ButtonClick(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGridDBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxGrid1DBTableView1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    KeyField : string;
    CanSelect : boolean;
    ShowRooms : boolean;
    constructor Create (AOwner: TComponent; DB_Handle:TISC_DB_HANDLE;IsChild: boolean; RoomShow: boolean);reintroduce;
    procedure SelectAll;
  end;

function View_st_Builds_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; ShowRooms: boolean; BuildsInfo : TBuildsInfo):Variant;stdcall;
exports View_st_Builds_Sp;

  var
  BuildsForm: TBuildsForm;
  res:Variant;

implementation
uses St_sp_Hostel_Form_Add, St_sp_Hostel_Add_Room ,
  St_sp_Hostel_Add_Many_Room, Nomer_Search_Build;
{$R *.dfm}

function View_st_Builds_Sp(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; ShowRooms: boolean; BuildsInfo : TBuildsInfo):Variant;stdcall;
var ViewForm:TBuildsForm;
begin
 if not IsMDIChildFormShow(TBuildsForm) then
   if ShowModal=false then   begin
      ViewForm:=TBuildsForm.Create(AOwner,DB, true, true);
      ViewForm.ShowRooms:=true;
      ViewForm.selectall;
      View_st_Builds_Sp:=res;
      end
   else begin
   if (not ShowRooms) then
     begin
      ViewForm:=TBuildsForm.Create(AOwner,DB, false, false);
      ViewForm.ShowRooms:=false;
      ViewForm.selectall;
      ViewForm.ShowModal;
      View_st_Builds_Sp:=res;
     end
     else
     begin
      ViewForm:=TBuildsForm.Create(AOwner,DB, false, true);
      ViewForm.ShowRooms:=true;
      ViewForm.selectall;
      if BuildsInfo.id_build <> null then ViewForm.DataSet.Locate('ID_BUILD', BuildsInfo.id_build,[]) ;
      if BuildsInfo.N_Room <>'' then ViewForm.RoomDataSet.Locate('ROOM_COMPARED',BuildsInfo.N_Room,[]) ;
      ViewForm.ShowModal;
      View_st_Builds_Sp:=res;

     end;
     end;
end;


constructor TBuildsForm.Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE; IsChild: boolean; RoomShow: boolean);
begin
 inherited Create(AOwner);
 Screen.Cursor:= crHourGlass;
 DB.Handle:=DB_Handle;
 if IsChild then begin
 Formstyle:=fsMDIChild;
 end
 else begin
 if RoomShow then begin
 Formstyle:=fsNormal;
 SelectButton.Enabled:=true;
 end
 else begin
 Formstyle:=fsNormal;
 SelectButton.Enabled:=true;
 Search_Button.Enabled:=false;
 //cxGrid1DBTableView1.OptionsSelection.MultiSelect:=true;
 dxBarManager1.Bars[1].Visible := false;
 cxGrid2.Visible := false;
 Splitter1.Visible := false;
 cxGrid1.Align := alClient;
 end;
 end;
  Screen.Cursor:= crDefault;
end;



procedure TBuildsForm.SelectAll;
begin
 RoomDataSet.Close;
 DataSet.Close;
 DataSet.Open;
 if ShowRooms then RoomDataSet.Open;
 if RoomDataSet.RecordCount = 0 then begin
  DeleteRoomButton.Enabled := false;
  EditRoomButton.Enabled := false;
 end else begin
  DeleteRoomButton.Enabled := true;
  EditRoomButton.Enabled := true;
 end;
end;


procedure TBuildsForm.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TBuildsForm.FormCreate(Sender: TObject);
begin
KeyField := 'ID_BUILD';
ShowRooms := true;
with  cxGridDBTableView1 do begin
 Items[0].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[1].DataBinding.ValueTypeClass := TcxIntegerValueType;
 Items[2].DataBinding.ValueTypeClass := TcxStringValueType;
 Items[3].DataBinding.ValueTypeClass := TcxStringValueType;
 end;

if not DataSet.Active then SelectAll;
end;

procedure TBuildsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
Action  :=caFree;
{MainForm.N8.Enabled:=true;
MainForm.CloseAllWindows;}
end;

procedure TBuildsForm.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
 ShortNameLabel.Text := DataSet['SHORT_NAME'];
 AddressLabel.Text := 'г.' + DataSet['TOWN'] + ', ' + DataSet['RAION'] + ' р-н, ул. ' + DataSet['STREET'] + ', дом ' + DataSet['HOUSE'];
end;

procedure TBuildsForm.DataSetAfterOpen(DataSet: TDataSet);
begin
 if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
  SelectButton.Enabled := false;
  ViewButton.Enabled := false;
  AddRoomButton.Enabled := false;
  AddRoomButton2.Enabled := false;
  DeleteRoomButton.Enabled := false;
  EditRoomButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 // SelectButton.Enabled := CanSelect;
  ViewButton.Enabled := true;
  AddRoomButton.Enabled := true;
  AddRoomButton2.Enabled := true;
 end;
end;

procedure TBuildsForm.FormShow(Sender: TObject);
begin
{if not ShowRooms then begin
  dxBarManager1.Bars[1].Visible := false;
  cxGrid2.Visible := false;
  Splitter1.Visible := false;
  cxGrid1.Align := alClient;
 end;}
// cxGrid1DBTableView1.Items[0].DataBinding.ValueTypeClass := TcxIntegerValueType;
// if AllowMultiSelect then cxGrid1DBTableView1.Columns[0].Visible := true;
end;

procedure TBuildsForm.ViewButtonClick(Sender: TObject);
var
 ActionStr : string;
// id        : integer;
 BuildsFormAdd: TBuildsFormAdd;
begin
// id := DataSet[KeyField];
 ActionStr := 'Просмотреть';
 BuildsFormAdd := TBuildsFormAdd.Create(Self);
 BuildsFormAdd.Caption := ActionStr + ' ' + BuildsFormAdd.Caption;
 BuildsFormAdd.OKButton.Caption := ActionStr;
 BuildsFormAdd.NumEdit.Text := DataSet['NUM_BUILD'];
 BuildsFormAdd.ShortEdit.Text := DataSet['SHORT_NAME'];
 BuildsFormAdd.NameEdit.Text := DataSet['NAME_BUILD'];
 BuildsFormAdd.SizeEdit.Text := DataSet['SIZE'];
 BuildsFormAdd.FloorEdit.Text := DataSet['FLOORS'];
 BuildsFormAdd.ChiefEdit.Text := DataSet['CHIEF'];
 BuildsFormAdd.OblastEdit.Text := DataSet['OBLAST'];
 BuildsFormAdd.RaionEdit.Text := DataSet['RAION'];
 BuildsFormAdd.TownEdit.Text := DataSet['TOWN'];
 BuildsFormAdd.StreetEdit.Text := DataSet['STREET'];
 BuildsFormAdd.HouseEdit.Text := DataSet['HOUSE'];
 BuildsFormAdd.IndexEdit.Text := DataSet['INDEX'];
 BuildsFormAdd.cxGroupBox1.Enabled := false;
 BuildsFormAdd.cxGroupBox2.Enabled := false;
 BuildsFormAdd.OKButton.Visible := false;
 BuildsFormAdd.ShowModal;
 BuildsFormAdd.Free;

end;

procedure TBuildsForm.RoomDataSetAfterScroll(DataSet: TDataSet);
begin
if RoomDataSet.RecordCount = 0 then begin
  DeleteRoomButton.Enabled := false;
  EditRoomButton.Enabled := false;
 end else begin
  DeleteRoomButton.Enabled := true;
  EditRoomButton.Enabled := true;
 end;
end;

procedure TBuildsForm.RefreshButtonClick(Sender: TObject);
var
 selected, id_type_room : integer;
 room : string;
begin
 Screen.Cursor:=crHourGlass;
 selected := -1;
 room := '';
 id_type_room := -1;
 if DataSet.RecordCount <> 0 then selected := DataSet[KeyField];
 if ShowRooms then if RoomDataSet.RecordCount <> 0 then begin
  room := RoomDataSet['ROOM'];
  id_type_room := RoomDataSet['ID_TYPE_ROOM'];
 end;
 SelectAll;
 DataSet.Locate(KeyField, selected, []);
 if ShowRooms then RoomDataSet.Locate('ROOM;ID_TYPE_ROOM', VarArrayOf([room, id_type_room]), []);
 Screen.Cursor:=crDefault;
end;

procedure TBuildsForm.DeleteButtonClick(Sender: TObject);
var
 selected : integer;
begin
 Screen.Cursor:=crHourGlass;
 ReadDataSet.Close;
 ReadDataSet.SelectSQL.Clear;
 ReadDataSet.SelectSQL.Text:='select CAN from ST_SP_BUILDS_CAN_DELETE('+ inttostr(DataSet[KeyField])+')';
 ReadDataSet.Open;
 if ReadDataSet['Can']=0 then begin
 Screen.Cursor:=crDefault;
 ShowMessage('Невозможно удалить наименование. Данное наименование используется.');
 ReadDataSet.Close;
 exit;
 end;
 ReadDataSet.Close;
 Screen.Cursor:=crDefault;
//if MessageBox(Handle,PChar('Вы действительно хотите удалить общежитие "' + DataSet.FieldByName('NAME_BUILD').AsString + ' "?'),'Подтвердите ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 if MessageBox(Handle,PChar('Вы действительно хотите удалить запись ?'),'Подтверждение удаления ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 // удаляем
 WriteProc.StoredProcName := 'ST_SP_BUILDS_DELETE';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName(KeyField).AsInteger := DataSet[KeyField];
 WriteProc.ExecProc;
 try
 WriteProc.Transaction.Commit;
 WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
 selected := cxGrid1DBTableView1.DataController.FocusedRowIndex-1;
 SelectAll;
 cxGrid1DBTableView1.DataController.FocusedRowIndex := selected;

end;

procedure TBuildsForm.AddButtonClick(Sender: TObject);
var
 ActionStr : string;
 new_id    : integer;
 New_KOD_BUILD: integer;
 BuildsFormAdd: TBuildsFormAdd;
begin
 ActionStr := 'Добавить';
 BuildsFormAdd := TBuildsFormAdd.Create(Self);
 BuildsFormAdd.Caption := ActionStr + ' ' + BuildsFormAdd.Caption;
 BuildsFormAdd.OKButton.Caption := ActionStr;
 if BuildsFormAdd.ShowModal = mrOK then
  begin
   if MessageBox(Handle,PChar('Добавить эти же данные в Справочник адресов прописки?'),'Подтверждение ...',MB_YESNO or MB_ICONQUESTION)= mrYes then
   Begin
    WriteProc.StoredProcName := 'ST_SP_PROPI_BUILDS_INSERT';
    WriteProc.Transaction.StartTransaction;
    WriteProc.Prepare;
    WriteProc.ParamByName('NUM_BUILD').AsInteger := StrToInt(BuildsFormAdd.NumEdit.Text);
    WriteProc.ParamByName('NAME_BUILD').AsString := BuildsFormAdd.NameEdit.Text;
    WriteProc.ParamByName('SHORT_NAME').AsString := BuildsFormAdd.ShortEdit.Text;
    WriteProc.ParamByName('P_SIZE').AsFloat := StrToFloat(BuildsFormAdd.SizeEdit.Text);
    WriteProc.ParamByName('FLOORS').AsInteger := StrToInt(BuildsFormAdd.FloorEdit.Text);
    WriteProc.ParamByName('CHIEF').AsString := BuildsFormAdd.ChiefEdit.Text;
    WriteProc.ParamByName('OBLAST').AsString := BuildsFormAdd.OblastEdit.Text;
    WriteProc.ParamByName('RAION').AsString := BuildsFormAdd.RaionEdit.Text;
    WriteProc.ParamByName('TOWN').AsString := BuildsFormAdd.TownEdit.Text;
    WriteProc.ParamByName('STREET').AsString := BuildsFormAdd.StreetEdit.Text;
    WriteProc.ParamByName('HOUSE').AsString := BuildsFormAdd.HouseEdit.Text;
    WriteProc.ParamByName('P_INDEX').AsInteger := StrToInt(BuildsFormAdd.IndexEdit.Text);
    WriteProc.ExecProc;
    New_KOD_BUILD := writeProc['KOD_BUILD'].AsInteger;
    try
     WriteProc.Transaction.Commit;
     WriteProc.Close;
    except
     WriteProc.Transaction.Rollback;
     WriteProc.Close;
     raise;
    end;
   End;
  // добавляем
   WriteProc.StoredProcName := 'ST_SP_BUILDS_INSERT';
   WriteProc.Transaction.StartTransaction;
   WriteProc.Prepare;
   WriteProc.ParamByName('NUM_BUILD').AsInteger := StrToInt(BuildsFormAdd.NumEdit.Text);
   WriteProc.ParamByName('NAME_BUILD').AsString := BuildsFormAdd.NameEdit.Text;
   WriteProc.ParamByName('SHORT_NAME').AsString := BuildsFormAdd.ShortEdit.Text;
   WriteProc.ParamByName('SIZE').AsFloat := StrToFloat(BuildsFormAdd.SizeEdit.Text);
   WriteProc.ParamByName('FLOORS').AsInteger := StrToInt(BuildsFormAdd.FloorEdit.Text);
   WriteProc.ParamByName('CHIEF').AsString := BuildsFormAdd.ChiefEdit.Text;
   WriteProc.ParamByName('OBLAST').AsString := BuildsFormAdd.OblastEdit.Text;
   WriteProc.ParamByName('RAION').AsString := BuildsFormAdd.RaionEdit.Text;
   WriteProc.ParamByName('TOWN').AsString := BuildsFormAdd.TownEdit.Text;
   WriteProc.ParamByName('STREET').AsString := BuildsFormAdd.StreetEdit.Text;
   WriteProc.ParamByName('HOUSE').AsString := BuildsFormAdd.HouseEdit.Text;
   WriteProc.ParamByName('INDEX').AsInteger := StrToInt(BuildsFormAdd.IndexEdit.Text);
   WriteProc.ParamByName('KOD_BUILD').AsInteger := New_KOD_BUILD;
   WriteProc.ExecProc;
   new_id := WriteProc[KeyField].AsInteger;
   try
    WriteProc.Transaction.Commit;
    WriteProc.Close;
   except
    WriteProc.Transaction.Rollback;
    WriteProc.Close;
    raise;
   end;
    SelectAll;
    DataSet.Locate(KeyField, new_id, []);
  end;
 BuildsFormAdd.Free;
end;

procedure TBuildsForm.EditButtonClick(Sender: TObject);
var
 ActionStr, ActionKeyStr : string;
 id        : integer;
 KOD_BUILD : integer; 
 BuildsFormAdd: TBuildsFormAdd;
begin
 id := DataSet[KeyField];
 ActionStr := 'Изменить';
 ActionKeyStr:='Принять';
 BuildsFormAdd := TBuildsFormAdd.Create(Self);
 BuildsFormAdd.Caption := ActionStr + ' ' + BuildsFormAdd.Caption;
 BuildsFormAdd.OKButton.Caption := ActionKeyStr;
 BuildsFormAdd.NumEdit.Text := DataSet['NUM_BUILD'];
 BuildsFormAdd.ShortEdit.Text := DataSet['SHORT_NAME'];
 BuildsFormAdd.NameEdit.Text := DataSet['NAME_BUILD'];
 BuildsFormAdd.SizeEdit.Text := DataSet['SIZE'];
 BuildsFormAdd.FloorEdit.Text := DataSet['FLOORS'];
 BuildsFormAdd.ChiefEdit.Text := DataSet['CHIEF'];
 BuildsFormAdd.OblastEdit.Text := DataSet['OBLAST'];
 BuildsFormAdd.RaionEdit.Text := DataSet['RAION'];
 BuildsFormAdd.TownEdit.Text := DataSet['TOWN'];
 BuildsFormAdd.StreetEdit.Text := DataSet['STREET'];
 BuildsFormAdd.HouseEdit.Text := DataSet['HOUSE'];
 BuildsFormAdd.IndexEdit.Text := DataSet['INDEX'];

 if BuildsFormAdd.ShowModal = mrOK then
  begin
   IF dataSet['KOD_BUILD']<>null then
     Begin
      KOD_BUILD:=dataSet['KOD_BUILD'];
      If MessageBox(Handle,PChar('Изменить эти же данные в Справочнике адресов прописки?'),'Подтверждение ...',MB_YESNO or MB_ICONQUESTION)= mrYes then
       Begin
        WriteProc.StoredProcName := 'ST_SP_PROPI_BUILDS_UPDATE';
        WriteProc.Transaction.StartTransaction;
        WriteProc.Prepare;
        WriteProc.ParamByName('KOD_BUILD').AsInteger := KOD_BUILD;
        WriteProc.ParamByName('NUM_BUILD').AsInteger := StrToInt(BuildsFormAdd.NumEdit.Text);
        WriteProc.ParamByName('NAME_BUILD').AsString := BuildsFormAdd.NameEdit.Text;
        WriteProc.ParamByName('SHORT_NAME').AsString := BuildsFormAdd.ShortEdit.Text;
        WriteProc.ParamByName('P_SIZE').AsFloat := StrToFloat(BuildsFormAdd.SizeEdit.Text);
        WriteProc.ParamByName('FLOORS').AsInteger := StrToInt(BuildsFormAdd.FloorEdit.Text);
        WriteProc.ParamByName('CHIEF').AsString := BuildsFormAdd.ChiefEdit.Text;
        WriteProc.ParamByName('OBLAST').AsString := BuildsFormAdd.OblastEdit.Text;
        WriteProc.ParamByName('RAION').AsString := BuildsFormAdd.RaionEdit.Text;
        WriteProc.ParamByName('TOWN').AsString := BuildsFormAdd.TownEdit.Text;
        WriteProc.ParamByName('STREET').AsString := BuildsFormAdd.StreetEdit.Text;
        WriteProc.ParamByName('HOUSE').AsString := BuildsFormAdd.HouseEdit.Text;
        WriteProc.ParamByName('P_INDEX').AsInteger := StrToInt(BuildsFormAdd.IndexEdit.Text);
        WriteProc.ExecProc;
        try
         WriteProc.Transaction.Commit;
         WriteProc.Close;
        except
         WriteProc.Transaction.Rollback;
         WriteProc.Close;
        raise;
        end;
       End;
     End;
   // изменяем
   WriteProc.StoredProcName := 'ST_SP_BUILDS_UPDATE';
   WriteProc.Transaction.StartTransaction;
   WriteProc.Prepare;
   WriteProc.ParamByName(KeyField).AsInteger := id;
   WriteProc.ParamByName('NUM_BUILD').AsInteger := StrToInt(BuildsFormAdd.NumEdit.Text);
   WriteProc.ParamByName('NAME_BUILD').AsString := BuildsFormAdd.NameEdit.Text;
   WriteProc.ParamByName('SHORT_NAME').AsString := BuildsFormAdd.ShortEdit.Text;
   WriteProc.ParamByName('SIZE').AsFloat := StrToFloat(BuildsFormAdd.SizeEdit.Text);
   WriteProc.ParamByName('FLOORS').AsInteger := StrToInt(BuildsFormAdd.FloorEdit.Text);
   WriteProc.ParamByName('CHIEF').AsString := BuildsFormAdd.ChiefEdit.Text;
   WriteProc.ParamByName('OBLAST').AsString := BuildsFormAdd.OblastEdit.Text;
   WriteProc.ParamByName('RAION').AsString := BuildsFormAdd.RaionEdit.Text;
   WriteProc.ParamByName('TOWN').AsString := BuildsFormAdd.TownEdit.Text;
   WriteProc.ParamByName('STREET').AsString := BuildsFormAdd.StreetEdit.Text;
   WriteProc.ParamByName('HOUSE').AsString := BuildsFormAdd.HouseEdit.Text;
   WriteProc.ParamByName('INDEX').AsInteger := StrToInt(BuildsFormAdd.IndexEdit.Text);
   WriteProc.ExecProc;
   try
    WriteProc.Transaction.Commit;
    WriteProc.Close;
   except
    WriteProc.Transaction.Rollback;
    WriteProc.Close;
    raise;
   end;
   SelectAll;
   DataSet.Locate(KeyField, id, []);
  end;
 BuildsFormAdd.Free;
end;

procedure TBuildsForm.AddRoomButtonClick(Sender: TObject);
var
 ActionStr : string;
 id        : integer;
begin
 id := DataSet[KeyField];
 ActionStr := 'Принять';
 BuildsFormAddRoom := TBuildsFormAddRoom.Create(Self);
 BuildsFormAddRoom.Caption := ActionStr + ' ' + BuildsFormAddRoom.Caption;
 BuildsFormAddRoom.OKButton.Caption := ActionStr;
 if BuildsFormAddRoom.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_SP_ROOMS_INSERT';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInteger := id;
  WriteProc.ParamByName('ROOM').AsString := BuildsFormAddRoom.RoomEdit.Text;
  WriteProc.ParamByName('ID_TYPE_ROOM').AsInteger := BuildsFormAddRoom.id_type_room;
  WriteProc.ExecProc;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  WriteProc.Close;
  raise;
  end;
  RoomDataSet.Close;
  DataSet.Open;
  DataSet.Locate(KeyField, id, []);
  RoomDataSet.Open;
  RoomDataSet.Locate('ROOM;ID_TYPE_ROOM', VarArrayOf([BuildsFormAddRoom.RoomEdit.Text, BuildsFormAddRoom.id_type_room]), []);
  DeleteRoomButton.Enabled := true;
 end;
 BuildsFormAddRoom.Free;

end;

procedure TBuildsForm.DeleteRoomButtonClick(Sender: TObject);
var
 id, id_type_room, selected : integer;
 room : string;
begin
if MessageBox(Handle,PChar('Вы действительно хотите удалить запись ?'),'Подтверждение удаления ...',MB_YESNO or MB_ICONQUESTION)= mrNo then exit;
 id := DataSet[KeyField];
 room := RoomDataSet['ROOM'];
 id_type_room := RoomDataSet['ID_TYPE_ROOM'];
 selected := cxGridDBTableView1.DataController.FocusedRowIndex;
// if MessageDlg('Вы действительно хотите удалить комнату "' + RoomDataSet['ROOM_COMPARED'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then exit;
 WriteProc.StoredProcName := 'ST_SP_ROOMS_DELETE';
 WriteProc.Transaction.StartTransaction;
 WriteProc.Prepare;
 WriteProc.ParamByName(KeyField).AsInteger := DataSet[KeyField];
 WriteProc.ParamByName('ROOM').Asstring := room;
 WriteProc.ParamByName('ID_TYPE_ROOM').AsInteger := id_type_room;
 WriteProc.ExecProc;
 try
 WriteProc.Transaction.Commit;
 WriteProc.Close;
 except
 WriteProc.Transaction.Rollback;
 WriteProc.Close;
 raise;
 end;
 DataSet.Open;
 DataSet.Locate(KeyField, id, []);
 RoomDataSet.Close;
 RoomDataSet.Open;
 if RoomDataSet.RecordCount = 0 then begin
  DeleteRoomButton.Enabled := false;
  EditRoomButton.Enabled := false;
 end else begin
  DeleteRoomButton.Enabled := true;
  EditRoomButton.Enabled := true;
 end;
  cxGridDBTableView1.DataController.FocusedRowIndex := selected;

end;

procedure TBuildsForm.EditRoomButtonClick(Sender: TObject);
var
 ActionStr : string;
 id, room, id_type_room : integer;
begin
 id := DataSet[KeyField];
 room := RoomDataSet['ROOM'];
 id_type_room := RoomDataSet['ID_TYPE_ROOM'];
 ActionStr := 'Принять';
 BuildsFormAddRoom := TBuildsFormAddRoom.Create(Self);
 BuildsFormAddRoom.Caption := ActionStr + ' ' + BuildsFormAddRoom.Caption;
 BuildsFormAddRoom.OKButton.Caption := ActionStr;
 BuildsFormAddRoom.id_type_room := id_type_room;
 BuildsFormAddRoom.RoomEdit.Text := IntToStr(room);
 if BuildsFormAddRoom.ShowModal = mrOK then begin
  WriteProc.StoredProcName := 'ST_SP_ROOMS_UPDATE';
  WriteProc.Transaction.StartTransaction;
  WriteProc.Prepare;
  WriteProc.ParamByName(KeyField).AsInteger := id;
  WriteProc.ParamByName('ROOM_OLD').AsInteger:= room;
  WriteProc.ParamByName('ID_TYPE_ROOM_OLD').AsInteger := id_type_room;
  WriteProc.ParamByName('ROOM_NEW').AsString := BuildsFormAddRoom.RoomEdit.Text;
  WriteProc.ParamByName('ID_TYPE_ROOM_NEW').AsInteger := BuildsFormAddRoom.id_type_room;
  WriteProc.ExecProc;
  try
  WriteProc.Transaction.Commit;
  WriteProc.Close;
  except
  WriteProc.Transaction.Rollback;
  raise;
  end;
  DataSet.Open;
  DataSet.Locate(KeyField, id, []);
  RoomDataSet.Close;
  RoomDataSet.Open;
  RoomDataSet.Locate('ROOM;ID_TYPE_ROOM', VarArrayOf([BuildsFormAddRoom.RoomEdit.Text, BuildsFormAddRoom.id_type_room]), []);
  DeleteRoomButton.Enabled := true;
  EditRoomButton.Enabled := true;
 end;
 BuildsFormAddRoom.Free;

end;

procedure TBuildsForm.AddRoomButton2Click(Sender: TObject);
var
 id, i, j : integer;
begin
  id := DataSet[KeyField];
  BuildsFormAddRoom2 := TBuildsFormAddRoom2.Create(Self);
  if BuildsFormAddRoom2.ShowModal = mrOK then
   begin
    for i := StrToInt(BuildsFormAddRoom2.FromEdit.Text) to StrToInt(BuildsFormAddRoom2.ToEdit.Text) do
     begin
      if BuildsFormAddRoom2.cxCheckBox1.Checked then
       begin
        for j := 0 to BuildsFormAddRoom2.cxGrid2TableView1.DataController.RecordCount - 1 do
         begin
          WriteProc.StoredProcName := 'ST_SP_ROOMS_INSERT';
          WriteProc.Transaction.StartTransaction;
          WriteProc.Prepare;
          WriteProc.ParamByName(KeyField).AsInteger := id;
          WriteProc.ParamByName('ROOM').AsInteger := i;
          WriteProc.ParamByName('ID_TYPE_ROOM').AsInteger := BuildsFormAddRoom2.cxGrid2TableView1.DataController.Values[j, 0];
          WriteProc.ExecProc;
         end;
       end
      else
       begin
        WriteProc.StoredProcName := 'ST_SP_ROOMS_INSERT';
        WriteProc.Transaction.StartTransaction;
        WriteProc.Prepare;
        WriteProc.ParamByName(KeyField).AsInteger := id;
        WriteProc.ParamByName('ROOM').AsInteger := i;
        WriteProc.ParamByName('ID_TYPE_ROOM').AsInteger := BuildsFormAddRoom2.id_type_room;
        WriteProc.ExecProc;
       end;
     end;
    try
     WriteProc.Transaction.Commit;
     WriteProc.Close;
    except
     WriteProc.Transaction.Rollback;
     WriteProc.Close;
     raise;
    end;
   end;
  RefreshButtonClick(Self);
  BuildsFormAddRoom2.Free;
end;

procedure TBuildsForm.SelectButtonClick(Sender: TObject);
var
  i : integer;
  RecMultiSelected : integer;
begin
  if ((RoomDataSet.RecordCount = 0) and (ShowRooms)) then
   begin
    ShowMessage('Необхідно обрати кімнату!');
    exit;
   end;

  if cxGrid1DBTableView1.OptionsSelection.MultiSelect = true then
   begin
    RecMultiSelected := cxGrid1DBTableView1.DataController.GetSelectedCount;
    res := VarArrayCreate([0,RecMultiSelected-1],varVariant);

    for i:=0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
     res[i]:=cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1];

   end;

  if cxGrid1DBTableView1.OptionsSelection.MultiSelect=false then
   begin
    res:=VarArrayCreate([0,6],varVariant);
    res[0]:=DataSet['ID_BUILD'];
    res[1]:=DataSet['NUM_BUILD'];
    res[2]:=DataSet['NAME_BUILD'];
    res[3]:=DataSet['Short_Name'];
    if ShowRooms then
     Begin
      res[4]:=RoomDataSet['ROOM'];
      res[5]:=RoomDataSet['ID_TYPE_ROOM'];
     End 
   end;

  ModalResult:=mrOk;
end;

procedure TBuildsForm.Search_ButtonClick(Sender: TObject);
begin
 Nomer_Search_BuildForm := TNomer_Search_BuildForm.Create(Self);
 if Nomer_Search_BuildForm.ShowModal = mrOK then begin
 // собственно сам поиск
   DataSet.Locate('NUM_BUILD',strtoint(Nomer_Search_BuildForm.N_Build_TextEdit.Text) ,[loCaseInsensitive, loPartialKey]) ;
   RoomDataSet.Locate('ROOM_COMPARED',Nomer_Search_BuildForm.N_komnat_TextEdit.Text ,[loCaseInsensitive, loPartialKey]) ;
 end;
end;

procedure TBuildsForm.cxGridDBTableView1DblClick(Sender: TObject);
 var i : integer;
    RecMultiSelected : integer;
begin
    if cxGrid1DBTableView1.OptionsSelection.MultiSelect=true then
    begin
      RecMultiSelected:=cxGrid1DBTableView1.DataController.GetSelectedCount;
      res:=VarArrayCreate([0,RecMultiSelected-1],varVariant);
      for i:=0 to cxGrid1DBTableView1.DataController.GetSelectedCount-1 do
        begin
          res[i]:=cxGrid1DBTableView1.Controller.SelectedRecords[i].Values[1];
        end;
     end;

     if cxGrid1DBTableView1.OptionsSelection.MultiSelect=false then
    begin
      res:=VarArrayCreate([0,6],varVariant);
      res[0]:=DataSet['ID_BUILD'];
      res[1]:=DataSet['NUM_BUILD'];
      res[2]:=DataSet['Short_Name'];
      res[3]:=DataSet['Short_Name'];
      res[4]:=RoomDataSet['ROOM'];
      res[5]:=RoomDataSet['ID_TYPE_ROOM'] ;
    end;

    if FormStyle = fsMDIChild then  EditRoomButtonClick(Sender);
    
ModalResult:=mrOk;
end;

procedure TBuildsForm.cxGridDBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button = mbRight then
  dxBarPopupMenu1.PopupFromCursorPos;
end;

procedure TBuildsForm.cxGrid1DBTableView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button = mbRight then
  PopupMenu1.PopupFromCursorPos;
end;

procedure TBuildsForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
if FormStyle = fsMDIChild then  EditButtonClick(Sender);
end;

end.
