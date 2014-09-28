unit Category_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, Menus, dxBar, ActnList,
  ImgList, FIBDataSet, pFIBDataSet, dxStatusBar, ComCtrls, ToolWin,
  StdCtrls, cxContainer, cxLabel, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, ibase;

type
  Tfrm_Category = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1ID_KATEGORIYA: TcxGridDBColumn;
    NUM_KATEGORIYA: TcxGridDBColumn;
    NAME_KATEGORIYA: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1CLASS_KATEGOR: TcxGridDBColumn;
    cxGrid1DBTableView1SUBCLASS: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE_PROJ: TcxGridDBColumn;
    cxGrid1DBTableView1TYPE_KAT: TcxGridDBColumn;
    cxGrid1DBTableView1STUDENT: TcxGridDBColumn;
    cxGrid1DBTableView1NOT_LIVE: TcxGridDBColumn;
    cxGrid1DBTableView1BEZ_KOMN: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    ShortNameLabel: TEdit;
    TypeLabel: TEdit;
    ClassLabel: TEdit;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    EditButton: TToolButton;
    DeleteButton: TToolButton;
    RefreshButton: TToolButton;
    SelectButton: TToolButton;
    SearchButton_Nomer: TToolButton;
    SearchButton_Naim: TToolButton;
    ExitButton: TToolButton;
    HotKey_StatusBar: TdxStatusBar;
    DataSet: TpFIBDataSet;
    DataSetSELECTED: TIntegerField;
    DataSetID_KATEGORIYA: TFIBIntegerField;
    DataSetNUM_KATEGORIYA: TFIBSmallIntField;
    DataSetNAME_KATEGORIYA: TFIBStringField;
    DataSetSHORT_NAME: TFIBStringField;
    DataSetID_CATEGORY_CLASS: TFIBIntegerField;
    DataSetID_TYPE_CATEGORY: TFIBIntegerField;
    DataSetTYPE_KAT: TFIBSmallIntField;
    DataSetSTUDENT: TFIBSmallIntField;
    DataSetNOT_LIVE: TFIBSmallIntField;
    DataSetBEZ_KOMN: TFIBSmallIntField;
    DataSetNAME_CATEGORY_CLASS: TFIBStringField;
    DataSetNAME_TYPE_CATEGORY: TFIBStringField;
    DataSource: TDataSource;
    ImageListOfCategory: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    ActionList1: TActionList;
    AddAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ImageList1: TImageList;
    dxBarManager1: TdxBarManager;
    N1: TdxBarButton;
    N2: TdxBarButton;
    DeleteAction1: TdxBarButton;
    RefreshAction1: TdxBarButton;
    N3: TdxBarButton;
    PopupMenu1: TdxBarPopupMenu;
    PopupImageList: TImageList;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ToolButton1: TToolButton;
    Select_Action: TAction;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshActionExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure DataSetAfterOpen(DataSet: TDataSet);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Select_ActionExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  private
   constructor Create (AOwner: TComponent; DB_Handle:TISC_DB_HANDLE;IsChild: boolean; AllowMultiSelect: boolean);reintroduce;
  public
   procedure SelectAll;
  end;
function View_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean):variant;stdcall;
exports View_Category;
var
  frm_Category: Tfrm_Category;
  res:Variant;

implementation

{$R *.dfm}
constructor Tfrm_Category.Create(AOwner: TComponent; DB_Handle:TISC_DB_HANDLE; IsChild: boolean; AllowMultiSelect: boolean);
begin
 inherited Create(AOwner);
Screen.Cursor:= crHourGlass;
 DB.Handle:=DB_Handle;
 if IsChild then begin
 Formstyle:=fsMDIChild;
 SelectButton.Enabled:=false;
 end
 else begin
 if AllowMultiSelect then
 begin
 Formstyle:=fsNormal;
 SelectButton.Enabled:=true;
 cxGrid1DBTableView1.OptionsSelection.MultiSelect:=true;
 end
 else begin
 Formstyle:=fsNormal;
 SelectButton.Enabled:=true;
  cxGrid1DBTableView1.OptionsSelection.MultiSelect:=false;
 end;
 end;
 Screen.Cursor:= crDefault;
end;

function View_Category(AOwner : TComponent;DB:TISC_DB_HANDLE; ShowModal: boolean; MultiSelect: boolean):variant;stdcall;
var ViewForm:Tfrm_Category;
begin
   if ShowModal=false then   begin
      ViewForm:=Tfrm_Category.Create(AOwner,DB, true, false);
      ViewForm.selectall;
      View_Category:=res;
      end
   else begin
   if (not MultiSelect) then
     begin
      ViewForm:=Tfrm_Category.Create(AOwner,DB, false, false);
      ViewForm.selectall;
      ViewForm.ShowModal;
      View_Category:=res;
     end
     else
     begin
      ViewForm:=Tfrm_Category.Create(AOwner,DB, false, true);
      ViewForm.selectall;
      ViewForm.ShowModal;
      View_Category:=res;
     end;
     end;
end;

procedure Tfrm_Category.SelectAll;
begin
 DataSet.Close;
 DataSet.Open;
end;

procedure Tfrm_Category.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure Tfrm_Category.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure Tfrm_Category.RefreshActionExecute(Sender: TObject);
begin
dataset.CloseOpen(true);
end;

procedure Tfrm_Category.ExitActionExecute(Sender: TObject);
begin
res:=null;
close;
end;

procedure Tfrm_Category.DataSetAfterOpen(DataSet: TDataSet);
begin
 if DataSet.RecordCount = 0 then begin
  EditButton.Enabled := false;
  DeleteButton.Enabled := false;
 end else begin
  EditButton.Enabled := true;
  DeleteButton.Enabled := true;
 end;
end;

procedure Tfrm_Category.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.RecordCount = 0 then exit;
 ShortNameLabel.Text := DataSet['SHORT_NAME'];
 TypeLabel.Text := DataSet['NAME_TYPE_CATEGORY'];
 ClassLabel.Text := DataSet['NAME_CATEGORY_CLASS'];
end;

procedure Tfrm_Category.FormShow(Sender: TObject);
begin
 cxGrid1.SetFocus;
end;

procedure Tfrm_Category.Select_ActionExecute(Sender: TObject);
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
      res:=VarArrayCreate([0,1],varVariant);
      res[0]:=DataSet['ID_KATEGORIYA'];
     end;
ModalResult := mrOK;

end;

procedure Tfrm_Category.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
Select_Action.Execute;
end;

end.
