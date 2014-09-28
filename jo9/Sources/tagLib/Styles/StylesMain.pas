unit StylesMain;

interface

uses
  Windows, Messages, Forms, SysUtils, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxEdit, DB, cxDBData, Dialogs, cxGridCustomPopupMenu, cxGridPopupMenu,
  Classes, ActnList, ImgList, Controls, Menus, StdCtrls, ExtCtrls,
  cxButtons, cxGridLevel, cxGridCustomTableView, cxGridTableView, cxData,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ComCtrls, cxContainer, cxRadioGroup, cxListBox, cxDataStorage,
  cxLookAndFeelPainters, cxGroupBox, cxLookAndFeels, IBase, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, Variants, dxStatusBar, cxSplitter,
  FIBQuery, pFIBQuery, pFIBStoredProc, dxBar, dxBarExtItems, cxTextEdit,
  cxMaskEdit, cxDropDownEdit;

type
  TStylesMainForm = class(TForm)
    lbDescrip: TLabel;
    pnlLeft: TPanel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    gbUserDefined: TcxGroupBox;
    gbPredefined: TcxGroupBox;
    lbPredefinedStyleSheets: TcxListBox;
    pnlCurrentStyleSheet: TPanel;
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    DataSource: TDataSource;
    DataSet: TpFIBDataSet;
    cxSplitter1: TcxSplitter;
    StatusBar: TdxStatusBar;
    BottomPanel: TPanel;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
    UDataSet: TpFIBDataSet;
    AutoDataSource: TDataSource;
    StoredProc: TpFIBStoredProc;
    BarComboBox: TcxComboBox;
    BarManager: TdxBarManager;
    RightPanel: TPanel;
    Grid: TcxGrid;
    TableView: TcxGridDBTableView;
    AutoTableView: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DelButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    Label1: TLabel;
    GridComboBox: TcxComboBox;
    Label2: TLabel;
    StatusBarComboBox: TcxComboBox;
    Label3: TLabel;
    TableViewID_GROUP_UNITM: TcxGridDBColumn;
    TableViewNAME_GROUP_UNITM: TcxGridDBColumn;
    AutoTableViewID_GROUP_UNITM: TcxGridDBColumn;
    AutoTableViewID_UNIT_MEAS: TcxGridDBColumn;
    AutoTableViewNAME_UNIT_MEAS: TcxGridDBColumn;
    AutoTableViewSHORT_NAME: TcxGridDBColumn;
    AutoTableViewCOEFFICIENT: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure StatusBarComboBoxPropertiesChange(Sender: TObject);
    procedure GridComboBoxPropertiesChange(Sender: TObject);
    procedure BarComboBoxPropertiesChange(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lbPredefinedStyleSheetsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    SYS_ID_USER : integer;

    function  GetCurrentStyleSheet: TcxGridTableViewStyleSheet;
    procedure CreatePredefinedStyleSheetsList;
    procedure UpdateGridStyleSheets(const AStyleSheet: TcxGridTableViewStyleSheet);
    procedure SetPredefinedStyleSheets;

    procedure InitConnection(DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE);
  end;

function ShowChangeStyle(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; fs : TFormStyle; _id_User : integer): Variant; stdcall;
exports ShowChangeStyle;

var
  StylesMainForm: TStylesMainForm;

implementation

{$R *.dfm}

uses s_DM_Styles;

const
  cNone = 0;
  cPredefined = 1;
  cUserDefined = 2;

function ShowChangeStyle(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; RTrans : TISC_TR_HANDLE; fs : TFormStyle; _id_User : integer): Variant; stdcall;
var
  f : TStylesMainForm;
begin
 if fs = fsNormal then begin
  f := TStylesMainForm.Create(AOwner);
  f.InitConnection(DBHandle, RTrans);

  f.SYS_ID_USER := _id_User;

  if f.ShowModal <> mrOk then begin
   Result := False;
   Exit;
  end
  else begin
   Result := False;
  end;
 end
 else if fs = fsMDIChild then begin
  f := TStylesMainForm.Create(AOwner);
  f.InitConnection(DBHandle, RTrans);

  f.SYS_ID_USER := _id_User;

  f.FormStyle := FS;
  f.Show;
 end;
end;

procedure TStylesMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  SetFormParams(Self);
  Action := caFree;
end;

procedure TStylesMainForm.FormCreate(Sender: TObject);
begin
 CreatePredefinedStyleSheetsList;

 if not VarIsNull(DM_Styles.StyleIndex)     then lbPredefinedStyleSheets.ItemIndex := DM_Styles.StyleIndex;
 if not VarIsNull(DM_Styles.BarStyleIndex)  then BarComboBox.ItemIndex  := DM_Styles.BarStyleIndex;
 if not VarIsNull(DM_Styles.GridStyleIndex) then GridComboBox.ItemIndex := DM_Styles.GridStyleIndex;
 if not VarIsNull(DM_Styles.StatusBarStyle) then StatusBarComboBox.ItemIndex := DM_Styles.GridStyleIndex;

 SetPredefinedStyleSheets;
end;

procedure TStylesMainForm.FormShow(Sender: TObject);
begin
// GetFormParams(Self);
end;

procedure TStylesMainForm.CreatePredefinedStyleSheetsList;
var
  I: Integer;
begin
  with DM_Styles.GridPredefined do
  begin
    lbPredefinedStyleSheets.Clear;
    for I := 0 to StyleSheetCount - 1 do
      lbPredefinedStyleSheets.Items.AddObject(StyleSheets[I].Caption, StyleSheets[I]);
    lbPredefinedStyleSheets.ItemIndex := 0;
  end;
end;

procedure TStylesMainForm.UpdateGridStyleSheets(const AStyleSheet: TcxGridTableViewStyleSheet);

  procedure UpdateView(const AView: TcxGridDBTableView);
  begin
    with AView do
    begin
      BeginUpdate;
      Styles.StyleSheet := AStyleSheet;
      EndUpdate;
    end;
  end;

begin
  if GetCurrentStyleSheet = AStyleSheet then
    Exit;
  UpdateView(TableView);
  UpdateView(AutoTableView);
  TableView.DataController.ClearDetails;  // refresh detail level

  if AStyleSheet <> nil then
    pnlCurrentStyleSheet.Caption := AStyleSheet.Caption
  else
    pnlCurrentStyleSheet.Caption := '';
end;

procedure TStylesMainForm.BarComboBoxPropertiesChange(Sender: TObject);
begin
 case BarComboBox.ItemIndex of
  0 : BarManager.Style := bmsEnhanced;
  1 : BarManager.Style := bmsFlat;
  2 : BarManager.Style := bmsOffice11;
  3 : BarManager.Style := bmsStandard;
  4 : BarManager.Style := bmsUseLookAndFeel;
  5 : BarManager.Style := bmsXP;
 end;
end;

procedure TStylesMainForm.CancelButtonClick(Sender: TObject);
begin
 if FormStyle = fsNormal then ModalResult := mrCancel
 else Close;
end;

procedure TStylesMainForm.SetPredefinedStyleSheets;
begin
  with lbPredefinedStyleSheets do
    if Items.Count > 0 then
      UpdateGridStyleSheets(TcxGridTableViewStyleSheet(Items.Objects[ItemIndex]));
end;

procedure TStylesMainForm.StatusBarComboBoxPropertiesChange(Sender: TObject);
begin
 case StatusBarComboBox.ItemIndex of
  0 : StatusBar.PaintStyle := stpsFlat;
  1 : StatusBar.PaintStyle := stpsOffice11;
  2 : StatusBar.PaintStyle := stpsStandard;
  3 : StatusBar.PaintStyle := stpsUseLookAndFeel;
  4 : StatusBar.PaintStyle := stpsXP;
 end;
end;

procedure TStylesMainForm.lbPredefinedStyleSheetsClick(
  Sender: TObject);
begin
  SetPredefinedStyleSheets;
end;

procedure TStylesMainForm.ApplyButtonClick(Sender: TObject);
begin
 DM_Styles.StyleIndex     := lbPredefinedStyleSheets.ItemIndex;
 DM_Styles.BarStyleIndex  := BarComboBox.ItemIndex;
 DM_Styles.GridStyleIndex := GridComboBox.ItemIndex;
 DM_Styles.StatusBarStyle := StatusBarComboBox.ItemIndex;

 StoredProc.Transaction.StartTransaction;

 StoredProc.ExecProcedure('S_USER_STYLES_UPD', [SYS_ID_USER, lbPredefinedStyleSheets.ItemIndex,
 BarComboBox.ItemIndex, GridComboBox.ItemIndex, StatusBarComboBox.ItemIndex]);

 StoredProc.Transaction.Commit;

 if FormStyle = fsNormal then ModalResult := mrOk
 else Close;
end;

function TStylesMainForm.GetCurrentStyleSheet: TcxGridTableViewStyleSheet;
begin
  Result := TcxGridTableViewStyleSheet(TableView.Styles.StyleSheet);
end;

procedure TStylesMainForm.GridComboBoxPropertiesChange(Sender: TObject);
begin
 case GridComboBox.ItemIndex of
  0 : Grid.LookAndFeel.Kind := lfFlat;
//  1 : Grid.LookAndFeel.Kind := lfOffice11;
  2 : Grid.LookAndFeel.Kind := lfStandard;
  3 : Grid.LookAndFeel.Kind := lfUltraFlat;
 end;
end;

procedure TStylesMainForm.InitConnection(DBHandle: TISC_DB_HANDLE;
  RTrans: TISC_TR_HANDLE);
begin
  Database.Handle        := DBHandle;
  ReadTransaction.Handle := RTrans;

  DataSet.Open;
  UDataSet.Open;
end;

procedure TStylesMainForm.FormActivate(Sender: TObject);
begin
  OpenDialog.InitialDir := ExtractFileDir(Application.ExeName);
  SaveDialog.InitialDir := OpenDialog.InitialDir;
end;

end.
