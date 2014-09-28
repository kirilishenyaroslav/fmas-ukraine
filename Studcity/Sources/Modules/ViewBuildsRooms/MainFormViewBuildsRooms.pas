unit MainFormViewBuildsRooms;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IBase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  StdCtrls, ComCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridTableView, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridDBTableView,
  cxGrid, ExtCtrls,StudcityConst, ActnList, ImgList, dxBar, dxBarExtItems,
  St_ser_function;

type
  TfrmMainFormViewBuildsRooms = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Database: TpFIBDatabase;
    pFIBDataSetAllRooms: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    DataSourceAll: TDataSource;
    cxGridNameuildRoom: TcxGrid;
    cxGridNameuildRoomDBTableView1: TcxGridDBTableView;
    cxGridNameuildRoomLevel1: TcxGridLevel;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    cxStyleSilver: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    NameBR: TcxGridDBColumn;
    cxGridPeopleT1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGridPeopleT2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    PanelT1: TPanel;
    PanelT2: TPanel;
    pFIBDataSetGetRoom: TpFIBDataSet;
    pFIBDataSetPeopleRoomT1: TpFIBDataSet;
    pFIBDataSetPeopleRoomT2: TpFIBDataSet;
    DataSourceRoomT1: TDataSource;
    DataSourceRoomT2: TDataSource;
    FIOT1: TcxGridDBColumn;
    CAT_PAYT1: TcxGridDBColumn;
    KURST1: TcxGridDBColumn;
    FIOT2: TcxGridDBColumn;
    CAT_PAYT2: TcxGridDBColumn;
    KURST2: TcxGridDBColumn;
    FAKT1: TcxGridDBColumn;
    FAKT2: TcxGridDBColumn;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    AddRoomButton: TdxBarLargeButton;
    DeleteRoomButton: TdxBarLargeButton;
    EditRoomButton: TdxBarLargeButton;
    AddRoomButton2: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    Search_Button: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    ActionList1: TActionList;
    RefreshAction: TAction;
    ExitAction: TAction;
    ViewAction: TAction;
    dxBarEditFIO: TdxBarEdit;
    FindAction: TAction;
    dxBarStatic1: TdxBarStatic;
    pFIBDataSetGetRoomByID: TpFIBDataSet;
    pFIBDataSetGetIDBYFIO: TpFIBDataSet;
    dxBarStatic2: TdxBarStatic;
    dxBarStaticPrev: TdxBarStatic;
    ActionPrior: TAction;
    ActionNext: TAction;
    dxBarContainerItem1: TdxBarContainerItem;
    Button_print: TdxBarLargeButton;
    Action_print: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSetAllRoomsAfterScroll(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure Search_ButtonClick(Sender: TObject);
    procedure ViewActionExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure FindActionExecute(Sender: TObject);
    procedure dxBarEditFIOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxBarStaticPrevClick(Sender: TObject);
    procedure dxBarStatic2Click(Sender: TObject);
    procedure ActionNextExecute(Sender: TObject);
    procedure ActionPriorExecute(Sender: TObject);
    procedure Action_printExecute(Sender: TObject);
  private
    Constructor Create(AOwner : TComponent;DB:TISC_DB_HANDLE);overload;
    { Private declarations }
  public
    Lang:Integer;
    { Public declarations }
  end;

function LoadViewBuildsRooms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;stdcall;
exports LoadViewBuildsRooms;

var
  frmMainFormViewBuildsRooms: TfrmMainFormViewBuildsRooms;
  visible_room:Integer;

implementation

uses SearchRoom, uFilter_print;
{$R *.dfm}

function LoadViewBuildsRooms(AOwner : TComponent;DB:TISC_DB_HANDLE):Integer;
var
  view:TfrmMainFormViewBuildsRooms;
begin
  view:=TfrmMainFormViewBuildsRooms.Create(AOwner,DB);
end;

Constructor TfrmMainFormViewBuildsRooms.Create(AOwner : TComponent;DB:TISC_DB_HANDLE);
begin
  inherited Create(AOwner);
  Database.Handle:=DB;

  Lang:=ST_serLanguageIndex(DB);

  Caption:=StudcityConst.Studcity_BuildsRooms_NameForm_EX[Lang];
  ExitButton.Caption:=StudcityConst.Studcity_ACTION_CLOSE_CONST_EX[lang];

  NameBR.Caption:=StudcityConst.Studcity_BuildsRooms_BuildRoom_EX[lang];

  FIOT1.Caption:=StudcityConst.Studcity_BuildsRooms_FIO_EX[lang];
  CAT_PAYT1.Caption:=StudcityConst.Studcity_BuildsRooms_CatPay_EX[lang];
  KURST1.Caption:=StudcityConst.Studcity_BuildsRooms_Kurs_EX[lang];
  FAKT1.Caption:=StudcityConst.Studcity_BuildsRooms_Fak_EX[lang];
  FIOT2.Caption:=StudcityConst.Studcity_BuildsRooms_FIO_EX[lang];
  CAT_PAYT2.Caption:=StudcityConst.Studcity_BuildsRooms_CatPay_EX[lang];
  KURST2.Caption:=StudcityConst.Studcity_BuildsRooms_Kurs_EX[lang];
  FAKT2.Caption:=StudcityConst.Studcity_BuildsRooms_Fak_EX[lang];
  dxBarStatic1.Caption:=StudcityConst.Studcity_BuildsRooms_FIO_FIND_EX[lang];
  dxBarStaticPrev.Caption:=StudcityConst.Studcity_BuildsRooms_PREV_EX[lang];
  dxBarStatic2.Caption:=StudcityConst.Studcity_BuildsRooms_NEXT_EX[lang];
  Search_Button.Caption:=StudcityConst.Studcity_BuildsRooms_FIND_NUM_EX[lang];

  visible_room:=0;
  pFIBDataSetAllRooms.Active:=false;
  pFIBDataSetAllRooms.Active:=true;
end;

procedure TfrmMainFormViewBuildsRooms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMainFormViewBuildsRooms.pFIBDataSetAllRoomsAfterScroll(
  DataSet: TDataSet);
begin
  if visible_room = 0 then exit;

  PanelT1.Caption:='';
  PanelT2.Caption:='';

  pFIBDataSetGetRoom.Active:=false;
  pFIBDataSetGetRoom.ParamByName('param_room').Value := pFIBDataSetAllRooms.FieldByName('id_room').AsVariant;
  pFIBDataSetGetRoom.ParamByName('param_builds').Value := pFIBDataSetAllRooms.FieldByName('id_build').AsVariant;
  pFIBDataSetGetRoom.Active := true;
  pFIBDataSetGetRoom.FetchAll;

  If pFIBDataSetGetRoom.RecordCount=2 then
    begin
      //два типа комнаты
      pFIBDataSetPeopleRoomT1.Active:=false;
      pFIBDataSetPeopleRoomT1.ParamByName('param_room').Value:=pFIBDataSetGetRoom.FieldValues['room'];
      pFIBDataSetPeopleRoomT1.ParamByName('param_build').Value:=pFIBDataSetGetRoom.FieldValues['id_build'];
      pFIBDataSetPeopleRoomT1.ParamByName('param_type_room').Value:=1;
      pFIBDataSetPeopleRoomT1.Active:=true;

      PanelT1.Caption:=pFIBDataSetPeopleRoomT1.FieldByName('TYPE_ROOM').AsString;
      pFIBDataSetPeopleRoomT2.Active:=false;
      pFIBDataSetPeopleRoomT2.ParamByName('param_room').Value:=pFIBDataSetGetRoom.FieldValues['room'];
      pFIBDataSetPeopleRoomT2.ParamByName('param_build').Value:=pFIBDataSetGetRoom.FieldValues['id_build'];
      pFIBDataSetPeopleRoomT2.ParamByName('param_type_room').Value:=2;
      pFIBDataSetPeopleRoomT2.Active:=true;
      PanelT2.Caption:=pFIBDataSetPeopleRoomT2.FieldByName('TYPE_ROOM').AsString;
    end
    else
    begin
      //один тип комнаты
      pFIBDataSetPeopleRoomT2.Active:=false;
      pFIBDataSetPeopleRoomT1.Active:=false;
      pFIBDataSetPeopleRoomT1.ParamByName('param_room').Value:=pFIBDataSetGetRoom.FieldValues['room'];
      pFIBDataSetPeopleRoomT1.ParamByName('param_build').Value:=pFIBDataSetGetRoom.FieldValues['id_build'];
      pFIBDataSetPeopleRoomT1.ParamByName('param_type_room').Value:=pFIBDataSetGetRoom.FieldValues['id_type_room'];
      pFIBDataSetPeopleRoomT1.Active:=true;
      PanelT1.Caption:=pFIBDataSetPeopleRoomT1.FieldByName('TYPE_ROOM').AsString;
    end;
end;

procedure TfrmMainFormViewBuildsRooms.FormActivate(Sender: TObject);
begin
  visible_room:=1;
end;

procedure TfrmMainFormViewBuildsRooms.Button1Click(Sender: TObject);
begin
  frmSearchRoom := TfrmSearchRoom.Create(Self,Lang);
  if frmSearchRoom.ShowModal = mrOK then
   begin
    // собственно сам поиск
    pFIBDataSetAllRooms.Locate('NUM_BUILDS;NUM_ROOMS',VarArrayOf([strtoint(frmSearchRoom.N_Build_TextEdit.Text),strtoint(frmSearchRoom.N_komnat_TextEdit.Text)]) ,[loCaseInsensitive, loPartialKey]) ;
   end;
end;

procedure TfrmMainFormViewBuildsRooms.ExitButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainFormViewBuildsRooms.Search_ButtonClick(Sender: TObject);
begin
  frmSearchRoom := TfrmSearchRoom.Create(Self,Lang);
  if frmSearchRoom.ShowModal = mrOK then
   begin
    // собственно сам поиск
    pFIBDataSetAllRooms.Locate('NUM_BUILDS;NUM_ROOMS',VarArrayOf([strtoint(frmSearchRoom.N_Build_TextEdit.Text), frmSearchRoom.N_komnat_TextEdit.Text]) ,[loCaseInsensitive, loPartialKey]) ;
   end;
end;

procedure TfrmMainFormViewBuildsRooms.ViewActionExecute(Sender: TObject);
begin
  Search_ButtonClick(self);
end;

procedure TfrmMainFormViewBuildsRooms.ExitActionExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmMainFormViewBuildsRooms.FindActionExecute(Sender: TObject);
begin
  dxBarEditFIO.SetFocus(true);
end;

procedure TfrmMainFormViewBuildsRooms.dxBarEditFIOKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  kod_b : Integer;
  N_room : string;
  fio_search : string;
  Len_FIO, p : Integer;
begin
  if (Key = VK_RETURN) then
   begin
    FIO_Search := dxBarEditFIO.Text;
    Len_FIO    := length(FIO_Search);
    p := 1;
    while (p <= len_FIO) do
     Begin
      If FIO_Search[p] = ' ' then
       Begin
        Insert('%',FIO_Search,p);
        p := p + 1;
        Len_fio := len_fio + 1;
       End;
      p:=p+1;
     End;

    pFIBDataSetGetIDBYFIO.Active := False;
    pFIBDataSetGetIDBYFIO.ParamByName('param_fio').AsString := AnsiUpperCase(FIO_Search) + '%';
    pFIBDataSetGetIDBYFIO.Active:=true;
    pFIBDataSetGetIDBYFIO.FetchAll;
    pFIBDataSetGetIDBYFIO.First;

    if pFIBDataSetGetIDBYFIO.FieldByName('ID_KOD').AsVariant <> null then
     begin
      pFIBDataSetGetRoomByID.Close;
      pFIBDataSetGetRoomByID.ParamByName('param_people').AsInt64 := pFIBDataSetGetIDBYFIO.FieldByName('ID_KOD').asVariant;
      pFIBDataSetGetRoomByID.Open;

      kod_b  := pFIBDataSetGetRoomByID.FieldByName('KOD_BUILD').AsInteger;

      N_room := pFIBDataSetGetRoomByID.FieldByName('N_ROOM').AsString;

      pFIBDataSetAllRooms.Locate('ID_BUILD;NUM_ROOMS',VarArrayOf([kod_b, N_room]) ,[loCaseInsensitive, loPartialKey]) ;
     end
   end;
end;

procedure TfrmMainFormViewBuildsRooms.dxBarStaticPrevClick(Sender: TObject);
begin
 if pFIBDataSetGetIDBYFIO.RecordCount > 0 then
  begin
    pFIBDataSetGetIDBYFIO.Prior;

    pFIBDataSetGetRoomByID.Active:=false;
    pFIBDataSetGetRoomByID.ParamByName('param_people').AsInt64:=pFIBDataSetGetIDBYFIO.FieldByName('ID_KOD').asVariant;
    pFIBDataSetGetRoomByID.Active:=true;

    pFIBDataSetAllRooms.Locate('ID_BUILD;NUM_ROOMS',VarArrayOf([pFIBDataSetGetRoomByID.FieldByName('KOD_BUILD').AsInteger, pFIBDataSetGetRoomByID.FieldByName('N_ROOM').AsString]) ,[loCaseInsensitive, loPartialKey]) ;
  end;
end;

procedure TfrmMainFormViewBuildsRooms.dxBarStatic2Click(Sender: TObject);
begin
if pFIBDataSetGetIDBYFIO.RecordCount>0 then
  begin
    pFIBDataSetGetIDBYFIO.Next;

    pFIBDataSetGetRoomByID.Active:=false;
    pFIBDataSetGetRoomByID.ParamByName('param_people').AsInt64:=pFIBDataSetGetIDBYFIO.FieldByName('ID_KOD').asVariant;
    pFIBDataSetGetRoomByID.Active:=true;

    pFIBDataSetAllRooms.Locate('ID_BUILD;NUM_ROOMS',VarArrayOf([pFIBDataSetGetRoomByID.FieldByName('KOD_BUILD').AsInteger, pFIBDataSetGetRoomByID.FieldByName('N_ROOM').AsString]) ,[loCaseInsensitive, loPartialKey]) ;
  end;
end;

procedure TfrmMainFormViewBuildsRooms.ActionNextExecute(Sender: TObject);
begin
  dxBarStatic2Click(self);
end;

procedure TfrmMainFormViewBuildsRooms.ActionPriorExecute(Sender: TObject);
begin
  dxBarStaticPrevClick(self);
end;

procedure TfrmMainFormViewBuildsRooms.Action_printExecute(Sender: TObject);
var
  ViewForm : TfrmFilter_print;
begin
  ViewForm := TfrmFilter_print.Create(Self);
  ViewForm.ShowModal;
  ViewForm.Free;
end;

end.
