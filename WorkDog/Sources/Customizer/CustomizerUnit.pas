unit CustomizerUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxCheckBox, StdCtrls,
  cxLookAndFeelPainters, cxCheckListBox, cxButtons, cxListBox, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, cxSplitter;

type
  TfrmDogOptions = class(TForm)
    lbAll: TcxCheckListBox;
    lbFields: TcxListBox;
    Panel1: TPanel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    Bevel1: TBevel;
    Panel3: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    lbVisible: TcxListBox;
    cxSplitter1: TcxSplitter;
    procedure lbAllClickCheck(Sender: TObject; const AIndex: Integer;
      const OldState, NewState: TcxCheckBoxState);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    fTableView : TcxGridDBTableView;
    resString  : string;
    function FindIndexByCaption(const s : string) : integer;
    procedure GetFieldsFromGrid;
    procedure ApplyChanges;
  public
    constructor Create(AOwner : TComponent; gridDBTableView : TcxGridDBTableView);
    procedure SaveToRegistry(const key, param: string);
  end;

  TagColumnCustomizer = class(TComponent)
  private
    fRegistryKey : string;
    fRegistryParam  : string;
    fTableView : TcxGridDBTableView;
    fCaption : String;
  public
    procedure Customize;
    procedure LoadFromRegistry;
  published
    property Caption : string read fCaption write fCaption;
    property TableView : TcxGridDBTableView read fTableView write fTableView;
    property RegKey : string read fRegistryKey write fRegistryKey;
    property RegParam : string read fRegistryParam write fRegistryParam;
  end;

procedure Register;

implementation
uses Registry;

{$R *.dfm}

procedure Register;
begin
  RegisterComponents('Standard', [TagColumnCustomizer]);
end;

procedure TfrmDogOptions.lbAllClickCheck(Sender: TObject;
  const AIndex: Integer; const OldState, NewState: TcxCheckBoxState);
var
 i : integer;
 vi : integer;
 s : string;
begin
 s := lbAll.Items[AIndex].Text;
 i := lbVisible.Items.IndexOf(s);
 if (i = -1) and (NewState = cbsChecked) then
 begin
   lbVisible.Items.Add(s);
   vi := fTableView.GetColumnByFieldName(lbfields.Items[FindIndexByCaption(s)]).VisibleIndex;
   if vi <> -1 then if vi < lbVisible.Count then lbVisible.Items.Move(lbVisible.Count - 1, vi);
 end;
 if (i <> -1) and (NewState = cbsUnchecked) then lbVisible.Items.Delete(lbVisible.Items.IndexOf(s));;
end;

procedure TfrmDogOptions.cxButton4Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmDogOptions.cxButton3Click(Sender: TObject);
begin
 ApplyChanges;
 ModalResult := mrOk;
end;

procedure TfrmDogOptions.cxButton1Click(Sender: TObject);
var
 i : integer;
begin
 if lbVisible.ItemIndex <> 0 then
 begin
   i := lbVisible.ItemIndex;
   lbVisible.Items.Move(lbVisible.ItemIndex, lbVisible.ItemIndex - 1);
   lbVisible.ItemIndex := i - 1;
 end;
end;

constructor TfrmDogOptions.Create(AOwner: TComponent; gridDBTableView : TcxGridDBTableView);
begin
 inherited Create(AOwner);
 fTableView := gridDBTableView;
 GetFieldsFromGrid;
end;

procedure TfrmDogOptions.GetFieldsFromGrid;
var
 i : integer;
begin
  if fTableView.ColumnCount = 0 then exit;
  lbAll.Clear;
  lbFields.Clear;
  lbVisible.Clear;
  for i := 0 to fTableView.ColumnCount - 1 do if fTableView.Columns[i].Tag = 0 then
  begin
    lbFields.Items.Add(fTableView.Columns[i].DataBinding.FieldName);
    lbAll.AddItem(fTableView.Columns[i].Caption);
    lbAll.Items[lbAll.Count - 1].Checked := fTableView.Columns[i].Visible;
    lbAllClickCheck(Self, lbAll.Count - 1, cbsUnchecked, lbAll.Items[lbAll.Count - 1].State);
  end else if fTableView.Columns[i].Visible then ShowMessage('Внимание! Колонка "' + fTableView.Columns[i].DataBinding.FieldName + '"  в гриде видима, но имеет tag = 1.');
end;

procedure TfrmDogOptions.cxButton2Click(Sender: TObject);
var
 i : integer;
begin
 if lbVisible.ItemIndex <> lbVisible.Count -1 then
 begin
   i := lbVisible.ItemIndex;
   lbVisible.Items.Move(lbVisible.ItemIndex, lbVisible.ItemIndex + 1);
   lbVisible.ItemIndex := i + 1;
 end;  
end;

function TfrmDogOptions.FindIndexByCaption(const s: string): integer;
var
 i : integer;
begin
 Result := -1;
 if lbAll.Count = 0 then exit;
 for i := 0 to lbAll.Count - 1 do if lbAll.Items[i].Text = s then
 begin
   Result := i;
   break;
 end;  
end;

procedure TfrmDogOptions.ApplyChanges;
var
 i, idx, j, col : integer;
 s : string;
 FieldName : string;
begin
 resString := '';
 for i := 0 to fTableView.ColumnCount - 1 do fTableView.Columns[i].Visible := false;
 for i := 0 to fTableView.ColumnCount - 1 do fTableView.Columns[i].VisibleIndex := -1;
 for i := 0 to lbVisible.Count - 1 do
 begin
   s := lbVisible.Items.Strings[i];
   FieldName := lbFields.Items.Strings[FindIndexByCaption(s)];
   fTableView.GetColumnByFieldName(FieldName).Visible := true;
   resString := resString + FieldName + ';';
 end;
// for i := 0 to lbVisible.Count - 1 do fTableView.GetColumnByFieldName(FieldName).VisibleIndex := i;
 resString := Copy(resString, 1, Length(resString) - 1);
end;

procedure TfrmDogOptions.SaveToRegistry(const key, param: string);
var
 reg : TRegistry;
begin
 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey(key, true);
 reg.WriteString(param, resstring);
 reg.CloseKey;
 reg.Free;
end;

{ TagColumnCustomizer }

procedure TagColumnCustomizer.Customize;
var
 f : TfrmDogOptions;
begin
 f := TfrmDogOptions.Create(Owner, TableView);
 f.Caption := Caption;
 if f.ShowModal = mrOk then f.SaveToRegistry(RegKey, RegParam);
 f.Free;
end;

procedure TagColumnCustomizer.LoadFromRegistry;
var
 reg : TRegistry;
 i, k : integer;
 s, FieldName : string;
begin
 reg := TRegistry.Create;
 reg.RootKey := HKEY_CURRENT_USER;
 reg.OpenKey(RegKey, true);
 s := reg.ReadString(RegParam);
 reg.CloseKey;
 reg.Free;
 if s = '' then exit;
 for i := 0 to TableView.ColumnCount - 1 do TableView.Columns[i].Visible := false;
 i := 0;
 while Trim(s) <> '' do
 begin
   if pos(';', s) <> 0 then
   begin
     FieldName := Copy(s, 1, pos(';', s) - 1);
     Delete(s, 1, pos(';', s));
   end
   else
   begin
     FieldName := s;
     s := '';
   end;  
   TableView.GetColumnByFieldName(FieldName).Visible := true;
//   TableView.GetColumnByFieldName(FieldName).VisibleIndex := i;
   inc(i);
 end;
end;

end.
