unit frmArrayUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxTextEdit,
  cxInplaceContainer, ExtCtrls, cxControls, cxTLData, AArray,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxClasses, Clipbrd, ImgList;

type
  TfrmArray = class(TForm)
    Panel1: TPanel;
    tl: TcxTreeList;
    tlcxTreeListColumn1: TcxTreeListColumn;
    tlcxTreeListColumn2: TcxTreeListColumn;
    cxStyleRepository1: TcxStyleRepository;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
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
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SaveDialog1: TSaveDialog;
    cxButton3: TcxButton;
    tlcxTreeListColumn3: TcxTreeListColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure tlKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton2Click(Sender: TObject);
    procedure tlCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure FormShow(Sender: TObject);
  private
    fArray : TAArray;
    procedure BuildTreeN(a : TAArray; root : TcxTreeListNode);
  public
    procedure BuildTree(a : TAArray);
  end;

implementation
{$R *.dfm}

{ TfrmArray }

procedure TfrmArray.BuildTreeN(a: TAArray; root : TcxTreeListNode);
var
  I : Integer;
  n : TcxTreeListNode;
begin
  for i := 0 to a.Count - 1 do
  begin
    n := root.AddChild;
    n.Values[0] := a.Names[i];
    n.Values[1] := a[a.Names[i]].AsString;
    if a[a.Names[i]].AsObject <> nil then n.Values[2] := 'TObject'
                                     else n.Values[2] := VarTypeAsText(VarType(a[a.Names[i]].AsVariant));
    BuildTreeN(a[a.Names[i]], root.Items[i]);
  end;
end;

procedure TfrmArray.BuildTree(a: TAArray);
begin
  fArray := a;
  tl.BeginUpdate;
  tl.Clear;
  BuildTreeN(a, tl.Nodes.Root);
  tl.EndUpdate
end;

procedure TfrmArray.cxButton1Click(Sender: TObject);
begin
 Close;
end;

procedure TfrmArray.tlKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if tl.FocusedNode = nil then Exit;
 if (Key = Ord('C')) and (ssCtrl in Shift) then
 begin
   Clipboard.AsText := tl.FocusedNode.Values[1];
 end;
end;

procedure TfrmArray.cxButton2Click(Sender: TObject);
begin
 if not SaveDialog1.Execute then Exit;
 if TcxButton(Sender).Tag = 1 then fArray.SaveToFile2(SaveDialog1.FileName) else fArray.SaveToFile(SaveDialog1.FileName);
end;

procedure TfrmArray.tlCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
 if (AViewInfo.Node.Values[1] = AARRAY_NULL_STRING) and (AViewInfo.Node.Count = 0) then
 begin
   ACanvas.Font.Color := clGray;
 end;
 if AViewInfo.Column.ItemIndex = 1 then if (AViewInfo.Node.Values[1] = AARRAY_NULL_STRING) then
 begin
   ACanvas.Font.Color := clGray;
 end;
end;

procedure TfrmArray.FormShow(Sender: TObject);
begin
 tl.SetFocus;
end;

end.
