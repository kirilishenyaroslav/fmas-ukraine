unit AGComponents;

interface
uses Windows, Messages, Classes, StdCtrls, DB, pFIBDataSet, Controls, Menus,
     DBGrids;

type
 TFilterMethod = (fmOnEnterPressed, fmOnKeyPressed);

 TFilterEdit = class(TEdit)
  private
//   fDataSet    : TpFIBDataSet;
   fDBGrid     : TDBGrid;
   fFieldName  : string;
   fOptions    : TLocateOptions;
   fFilterMethod : TFilterMethod;
   fFocusedControl : TWinControl;
   fMenu       : TPopupMenu;
//   fSearchField : integer;
   procedure MY_WM_KEYUP(var msg : TWMKey); message WM_KEYUP;
   procedure MY_WM_KEYDOWN(var msg : TWMKey); message WM_KEYDOWN;
//   procedure MY_WM_KEYDOWN(var msg : TWMKey); message WM_KEYDOWN;
   procedure My_WM_CHAR(var msg : TWMChar);message WM_CHAR;
//   procedure WMMENUPOPUP(var msg : WM_INITMENUPOPUP
//   procedure CBNDROPDOWN(var msg : TMessage); message CBN_DROPDOWN;
   procedure WMFocus(var msg : TMessage); message WM_SETFOCUS;
   procedure WMMouseDown(var msg : TMessage); message WM_RBUTTONDOWN;
   procedure UpdateMenu;
//   procedure SetDataSet(ds : TpFIBDataSet);
   procedure MenuClick(Sender : TObject);
  public
   constructor Create(AOwner : TComponent); override;
  published
   property Align;
//   property DataSet   : TpFIBDataSet read fDataSet write SetDataSet;
   property DBGrid : TDBGrid read fDBGrid write fDBGrid;
   property FieldName : string read fFieldName write fFieldName;
   property FilterMethod : TFilterMethod read fFilterMethod write fFilterMethod;
   property FocusedControl : TWinControl read fFocusedControl write fFocusedControl;
   property Options   : TLocateOptions read fOptions write fOptions;
 end;

procedure Register;

implementation

procedure Register;
begin
 RegisterComponents('Anton', [TFilterEdit]);
end;

constructor TFilterEdit.Create(AOwner : TComponent);
begin
 inherited;
 fOptions := [loCaseInsensitive, loPartialKey];
 fFilterMethod := fmOnEnterPressed;
 fMenu := TPopupMenu.Create(Self.Owner);
 PopupMenu := fMenu;
 UpdateMenu;
end;

procedure TFilterEdit.WMFocus(var msg : TMessage);
begin
 UpdateMenu;
 inherited;
end;

procedure TFilterEdit.WMMouseDown(var msg : TMessage);
begin
 UpdateMenu;
 inherited;
end;

procedure TFilterEdit.MY_WM_KEYUP(var msg : TWMKey);
begin
 inherited;
 UpdateMenu;
 if fFilterMethod = fmOnKeyPressed then begin
//  fDBGrid.DataSource.DataSet.First;
  if fDBGrid.DataSource.DataSet.Locate(fFieldName, Text, fOptions) then fDBGrid.Options := fDBGrid.Options + [dgAlwaysShowSelection] else fDBGrid.Options := fDBGrid.Options - [dgAlwaysShowSelection];	
 end;
end;

procedure TFilterEdit.MY_WM_KEYDOWN(var msg : TWMKey);
begin
 inherited;
 if msg.CharCode = 13 then begin
  if fFocusedControl <> NIL then fFocusedControl.SetFocus;
 end;
end;

procedure TFilterEdit.My_WM_CHAR(var msg : TWMChar);
begin
 if fFilterMethod = fmOnEnterPressed then if msg.CharCode = 13 then begin
  fDBGrid.DataSource.DataSet.First;
  fDBGrid.DataSource.DataSet.Locate(fFieldName, Text, fOptions);
//  msg.CharCode := 0;
 end;
 inherited;
end;
{
procedure TFilterEdit.CBNDROPDOWN(var msg : TMessage);
var
 i : integer;
begin
 Items.Clear;
 if fDataSet <> NIL then if fDataSet.FieldCount <> 0 then for i := 0 to fDataSet.FieldCount - 1 do Items.Add(fDataSet.Fields[i].name);
 inherited;
end;
                }
procedure TFilterEdit.UpdateMenu;
var
 i : integer;
 item : TMenuItem;
begin
 fMenu.Items.Clear;
 if fDBGrid <> NIL then if fDBGrid.FieldCount <> 0 then for i := 0 to fDBGrid.Columns.Count  - 1 do if fDBGrid.Columns.Items[i].Visible then begin
  item := TMenuItem.Create(fMenu);
  item.tag := i;
  item.Caption := fDBGrid.Columns.Items[i].Title.Caption;
  item.OnClick := MenuClick;
  fMenu.Items.Add(item);
 end; 
end;

{procedure TFilterEdit.SetDataSet(ds : TpFIBDataSet);
begin
 fDataSet := ds;
 UpdateMenu;
end;}

procedure TFilterEdit.MenuClick(Sender : TObject);
begin
 if fDBGrid <> NIL then fFieldName := fDBGrid.Columns.Items[(Sender as TComponent).tag].FieldName; 
end;

end.
