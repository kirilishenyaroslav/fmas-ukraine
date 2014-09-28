unit OrderList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, IBDatabase, DB, IBCustomDataSet, IBQuery, StdCtrls,
  ComCtrls, Buttons, DBCtrls, ExtCtrls, Grids, DBGrids,
  uActionControl, ActnList, FIBDataSet, pFIBDataSet,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, Clipbrd, ShellApi, Mask,
  ToolEdit, uFControl, uLabeledFControl, uSpravControl, uBoolControl,
  uInvisControl, IBase, OrderListDM, uCommonSp;

type
    TOrderList = class(TSprav)
    public
        constructor Create;
        procedure Show;
    end;

function CreateSprav: TSprav;stdcall;
exports CreateSprav;

type
  TOrderListForm = class(TForm)
    Panel1: TPanel;
    SearchPanel: TPanel;
    SearchLabel: TLabel;
    Label5: TLabel;
    SearchNextButton: TSpeedButton;
    AllLabel: TLabel;
    SearchEdit: TEdit;
    ButtonsPanel: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SignButton: TSpeedButton;
    StopButton: TSpeedButton;
    DoButton: TSpeedButton;
    FormButton: TSpeedButton;
    CancelButton: TSpeedButton;
    UnFormButton: TSpeedButton;
    SelectButton: TSpeedButton;
    FilterBox: TGroupBox;
    FilterDateEnd: TCheckBox;
    FilterDateBeg: TCheckBox;
    SortMenu: TPopupMenu;
    N1: TMenuItem;
    Nomer: TMenuItem;
    Typ: TMenuItem;
    DateSort: TMenuItem;
    DateSort2: TMenuItem;
    N3: TMenuItem;
    ActionList: TActionList;
    AddOrder: TAction;
    ModifyOrder: TAction;
    DeleteOrder: TAction;
    ViewOrder: TAction;
    PrintOrder: TAction;
    CloseForm: TAction;
    RefreshList: TAction;
    OrderGrid: TcxGrid;
    OrderGridDBTableView1: TcxGridDBTableView;
    OrderGridLevel1: TcxGridLevel;
    OrderGridDBTableView1DBColumn1: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn2: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn3: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn4: TcxGridDBColumn;
    Label1: TLabel;
    StatusText: TDBText;
    InfoButton: TSpeedButton;
    AcceptFilterButton: TSpeedButton;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    OrderGridDBTableView1DBColumn5: TcxGridDBColumn;
    RefreshFilterAction: TAction;
    OrderGridDBTableView1DBColumn6: TcxGridDBColumn;
    OrderGridDBTableView1DBColumn7: TcxGridDBColumn;
    Label2: TLabel;
    PrintName: TDBText;
    DateBeg: TDateEdit;
    DateEnd: TDateEdit;
    Fio: TqFSpravControl;
    FilterFio: TCheckBox;
    FilterShowDeleted: TqFBoolControl;
    IdUser: TqFInvisControl;
    procedure FormResize(Sender: TObject);
    constructor Create(aOwner : TComponent; DM:TOrderList_Dm); reintroduce;
    procedure FilterAccept;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CloseFormExecute(Sender: TObject);
    procedure OrdersActionControlBeforePrepare(Sender: TObject;
      Form: TForm);
    procedure DoButtonClick(Sender: TObject);
    procedure OrderGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure InputQueryAfterScroll(DataSet: TDataSet);
    procedure UnFormButtonClick(Sender: TObject);
    procedure FormButtonClick(Sender: TObject);
    procedure PrintOrderExecute(Sender: TObject);
    procedure InputQueryAfterOpen(DataSet: TDataSet);
    procedure SearchEditChange(Sender: TObject);
    procedure SearchNextButtonClick(Sender: TObject);
    procedure AllLabelClick(Sender: TObject);
    procedure OrderGridDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure RefreshFilterActionExecute(Sender: TObject);
    procedure FioOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure FilterFioClick(Sender: TObject);
  private
    id_server, Id_PCard : Integer;
    
  public
    DModule:TOrderList_Dm;
  end;

implementation

uses FIBDatabase;

//uses ;

{$R *.dfm}

function CreateSprav: TSprav;
begin
    Result := TOrderList.Create;
end;

constructor TOrderList.Create;
begin
  inherited Create;
 // создание входных/выходных полей
  Input.FieldDefs.Add('DBHandle', ftInteger);
  Input.FieldDefs.Add('ShowMod', ftInteger);

  OutPut.FieldDefs.Add('Id_order', ftLargeint);
 // подготовить параметры
  PrepareMemoryDatasets;
end;

procedure TOrderList.Show;
var
    DM: TOrderList_Dm;
    hnd: Integer;
    OrderListForm: TOrderListForm;
begin
  DM := TOrderList_Dm.Create(Application.MainForm);
  hnd := Input['DBHandle'];
  DM.pFIBD_OrderList.Handle := TISC_DB_Handle(hnd);
  OrderListForm:=TOrderListForm.Create(Application.MainForm, DM);
  if VarIsNull(Input['ShowMod']) then
   if Input['ShowMod']=0
    then begin
      if OrderListForm.ShowModal=mrOk
       then begin
         //Забираем идентификатор выбранного приказа
       end;
      OrderListForm.Free;
    end
    else begin
      OrderListForm.FormStyle:=fsMDIChild;
    end
   else if OrderListForm.ShowModal=mrOk
         then begin
           //Забираем идентификатор выбранного приказа
         end;
end;

constructor TOrderListForm.Create(aOwner : TComponent; DM:TOrderList_Dm);
begin
  inherited Create(aOwner);
  DModule:=DM;
end;

procedure TOrderListForm.FilterAccept;
begin
//
end;

procedure TOrderListForm.FormResize(Sender: TObject);
begin
//
end;

procedure TOrderListForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsMDIChild then
   Action := caFree;
end;

procedure TOrderListForm.CloseFormExecute(Sender: TObject);
begin
  Close;
end;

procedure TOrderListForm.OrdersActionControlBeforePrepare(
  Sender: TObject; Form: TForm);
begin
//
end;

procedure TOrderListForm.DoButtonClick(Sender: TObject);
begin
//
end;

procedure TOrderListForm.OrderGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//
end;

procedure TOrderListForm.InputQueryAfterScroll(DataSet: TDataSet);
var Modif, Info: Boolean;

begin
//
end;

procedure TOrderListForm.UnFormButtonClick(Sender: TObject);
begin
//
end;

procedure TOrderListForm.FormButtonClick(Sender: TObject);
var
   OLD_ID_ORDER : integer;
begin
//
end;

procedure TOrderListForm.PrintOrderExecute(Sender: TObject);
var
    sp: TSprav;
begin
  try
    // создать справочник
    sp :=  GetSprav('up\PrintOrder');
    if sp <> nil
     then begin
       // заполнить входные параметры
       with sp.Input do
       begin
         Append;
         FieldValues['DBHandle'] := Integer(DModule.pFIBD_OrderList.Handle);
         FieldValues['id_order'] := DModule.pFIBDS_OrderList['id_order'];
         Post;
       end;
       // показать справочник и проанализировать результат (выбор одного подр.)
       sp.Show;
       sp.Free;
    end
    else ShowMessage('Ця частина ще знаходиться в розробці!');
  except on e:Exception do
    MessageDlg('Помилка: '+e.Message,mtError,[mbOk],0);
  end;
end;

procedure TOrderListForm.InputQueryAfterOpen(DataSet: TDataSet);
begin
//
end;

procedure TOrderListForm.SearchEditChange(Sender: TObject);
begin
//
end;

procedure TOrderListForm.SearchNextButtonClick(Sender: TObject);
begin
//
end;

procedure TOrderListForm.AllLabelClick(Sender: TObject);
begin
//
end;

procedure TOrderListForm.OrderGridDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
//
end;

procedure TOrderListForm.RefreshFilterActionExecute(Sender: TObject);
begin
//
end;

procedure TOrderListForm.FioOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
var
    sp: TSprav;
begin
  // создать справочник
  sp :=  GetSprav('asup\PCardsList');
  if sp <> nil then
  begin
    // заполнить входные параметры
    with sp.Input do
    begin
      Append;
      FieldValues['DBHandle'] := Integer(DModule.pFIBD_OrderList.Handle);
      FieldValues['ActualDate'] := Date;
      FieldValues['SecondDate'] := 0;
      FieldValues['ShowWorking'] := True;
      FieldValues['CanRemoveFilter'] := True;
      Post;
    end;
    // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if ( sp.Output <> nil ) and not sp.Output.IsEmpty then
    begin
      Value := sp.Output['ID_PCARD'];
      DisplayText := sp.Output['FIO'];
    end;
    sp.Free;
  end;
end;

procedure TOrderListForm.FilterFioClick(Sender: TObject);
begin
  if not FilterFio.Checked
   then begin
     Fio.Blocked := True;
     Fio.Value := null;
     Fio.DisplayText := '';
   end
   else begin
     Fio.Blocked := False;
     Fio.OpenSprav;
   end;
end;

end.
