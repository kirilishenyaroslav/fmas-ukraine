unit Object_Scheme;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, Buttons, FIBQuery, pFIBQuery, StdCtrls,
  tagBaseTypes, tagSYS_Options, cxInplaceContainer, cxTL, cxControls, cxGraphics,
  cxCustomData, cxStyles, cxTextEdit, cxContainer, cxEdit, cxRadioGroup,
  cxSplitter, ActnList, FR_DSet, FR_Class, dxBar, dxBarExtItems;

type
  TObject_Scheme_Form = class(TForm)
    LeftPanel: TPanel;
    RightPanel: TPanel;
    Query: TpFIBQuery;
    TreeList1: TcxTreeList;
    id_Object_Column1: TcxTreeListColumn;
    Name_Object_Column1: TcxTreeListColumn;
    TreeList2: TcxTreeList;
    id_Object_Column2: TcxTreeListColumn;
    Name_Object_Column2: TcxTreeListColumn;
    Splitter: TcxSplitter;
    Panel3: TPanel;
    RadioGroup: TcxRadioGroup;
    ActionList: TActionList;
    ActionMod: TAction;
    ActionDel: TAction;
    ActionAdd: TAction;
    ActionSel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    Name_Dep_Column1: TcxTreeListColumn;
    Name_Dep_Column2: TcxTreeListColumn;
    Report: TfrReport;
    RowDataset: TfrUserDataset;
    BarManager: TdxBarManager;
    RefreshButton: TdxBarLargeButton;
    CloseButton: TdxBarLargeButton;
    PreviewButton: TdxBarLargeButton;
    PrintButton: TdxBarLargeButton;
    procedure CloseButtonClick(Sender: TObject);
    procedure SelectFirstLevel;
    procedure SelectLastLevel;
    procedure SelectNext(Node : TcxTreeListNode);
    procedure SelectPrev(Node : TcxTreeListNode);
    procedure FormShow(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure RadioGroupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeList1ChangeNode(Sender: TObject; OldNode,
      Node: TcxTreeListNode);
    procedure ActionExitExecute(Sender: TObject);
    function BeforePrint: boolean;
    procedure PreviewButtonClick(Sender: TObject);
    procedure ReportGetValue(const ParName: String; var ParValue: Variant);
    procedure PrintButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    destructor Destroy; override;
    function tagShow(SpravOptions: TSpravOptions): TResultArray;
    { Public declarations }
  end;

var
  Object_Scheme_Form: TObject_Scheme_Form;

implementation

uses DataModule, Variants;

{$R *.DFM}

var
 Options : TSpravOptions;
 
destructor TObject_Scheme_Form.Destroy;
begin
 Object_Scheme_Form := nil;
 inherited;
end;

function TObject_Scheme_Form.tagShow(SpravOptions : TSpravOptions) : TResultArray;
var
 mr      : integer;
begin
 if Object_Scheme_Form <> nil then begin
  if not SpravOptions.isModal then Object_Scheme_Form.Show;
  Exit;
 end;

 Options := SpravOptions;

 Application.CreateForm(TObject_Scheme_Form, Object_Scheme_Form);

 SetLength(Result, 0);
 if SpravOptions.isModal then begin
  mr := Object_Scheme_Form.ShowModal;
  if mr = mrOK then begin
{   SetLength(Result, 3);
   Result[0] := idVar;
   Result[1] := TextVar;
   Result[2] := CoefVar;}
  end;
 end else begin
  Object_Scheme_Form.FormStyle := fsMDIChild;
  Object_Scheme_Form.Show;
 end;
end;

procedure TObject_Scheme_Form.CloseButtonClick(Sender: TObject);
begin
 Close;
end;

procedure TObject_Scheme_Form.SelectFirstLevel;
var
 id_Object   : integer;
 Name_Object : string;
 Name_Dep    : string;

 Node        : TcxTreeListNode;
begin
 Query.SQL.Text := 'select * from PROC_DT_PAIR_SCHEME_SEL_FIRST('
 + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';

 Query.ExecQuery;

 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  id_Object   := Query['ID_OBJECT'].AsInteger;
  Name_Object := Query['NAME_OBJECT'].AsString;
  Name_Dep    := Query['NAME_DEP'].AsString;

  Node := TreeList1.Add;

  Node.Values[0] := id_Object;
  Node.Values[1] := Name_Object;
  Node.Values[2] := Name_Dep;

  Query.Next;
 end;

 Query.Close;
end;

procedure TObject_Scheme_Form.SelectLastLevel;
var
 id_Object   : integer;
 Name_Object : string;
 Name_Dep    : string;

 Node        : TcxTreeListNode;
begin
 Query.SQL.Text := 'select * from PROC_DT_PAIR_SCHEME_SEL_LAST('
 + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';

 Query.ExecQuery;

 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  id_Object   := Query['ID_OBJECT'].AsInteger;
  Name_Object := Query['NAME_OBJECT'].AsString;
  Name_Dep    := Query['NAME_DEP'].AsString;

  Node := TreeList1.Add;

  Node.Values[0] := id_Object;
  Node.Values[1] := Name_Object;
  Node.Values[2] := Name_Dep;

  Query.Next;
 end;

 Query.Close;
end;

procedure TObject_Scheme_Form.SelectNext(Node : TcxTreeListNode);
var
 id_Object   : integer;
 Name_Object : string;
 Name_Dep    : string;

 Child       : TcxTreeListNode;

 i           : integer;
begin
 Query.SQL.Text := 'select * from PROC_DT_PAIR_SCHEME_SEL_NEXT('
 + IntToStr(Node.Values[0]) + ',' + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';

 Query.ExecQuery;

 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  id_Object   := Query['ID_OBJECT_PARAM'].AsInteger;
  Name_Object := Query['NAME_OBJECT_PARAM'].AsString;
  Name_Dep    := Query['NAME_DEP_PARAM'].AsString;

  Child := Node.AddChild;

  Child.Values[0] := id_Object;
  Child.Values[1] := Name_Object;
  Child.Values[2] := Name_Dep;

  Query.Next;
 end;

 Query.Close;

 for i := 0 to Node.Count - 1 do SelectNext(Node.Items[i]);
end;

procedure TObject_Scheme_Form.SelectPrev(Node: TcxTreeListNode);
var
 id_Object   : integer;
 Name_Object : string;
 Name_Dep    : string;

 Child       : TcxTreeListNode;

 i           : integer;
begin
 Query.SQL.Text := 'select * from PROC_DT_PAIR_SCHEME_SEL_PREV('
 + IntToStr(Node.Values[0]) + ',' + #39 + DateTimeToStr(SYS_MAX_TIMESTAMP) + #39 + ')';

 Query.ExecQuery;

 if Query.RecordCount = 0 then begin
  Query.Close;
  Exit;
 end;

 while not Query.Eof do begin
  id_Object   := Query['ID_OBJECT_PARAM'].AsInteger;
  Name_Object := Query['NAME_OBJECT_PARAM'].AsString;
  Name_Dep    := Query['NAME_DEP_PARAM'].AsString;

  Child := Node.AddChild;

  Child.Values[0] := id_Object;
  Child.Values[1] := Name_Object;
  Child.Values[2] := Name_Dep;

  Query.Next;
 end;

 Query.Close;

 for i := 0 to Node.Count - 1 do SelectPrev(Node.Items[i]);
end;

procedure TObject_Scheme_Form.FormShow(Sender: TObject);
begin
 RefreshButtonClick(Sender);
 Splitter.CloseSplitter;
end;

procedure TObject_Scheme_Form.RefreshButtonClick(Sender: TObject);
var
 i : integer;
begin
 TreeList1.Clear;

 if RadioGroup.ItemIndex = 0 then begin
  SelectFirstLevel;
  for i := 0 to TreeList1.Count - 1 do SelectNext(TreeList1.Items[i]);
 end
 else begin
  SelectLastLevel;
  for i := 0 to TreeList1.Count - 1 do SelectPrev(TreeList1.Items[i]);
 end;

 TreeList1.FullExpand;

 TreeList1ChangeNode(Sender, TreeList1.FocusedNode, TreeList1.FocusedNode);
end;

procedure TObject_Scheme_Form.RadioGroupClick(Sender: TObject);
begin
 RefreshButtonClick(Sender);
end;

procedure TObject_Scheme_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TObject_Scheme_Form.TreeList1ChangeNode(Sender: TObject; OldNode,
  Node: TcxTreeListNode);
var
 Child : TcxTreeListNode;
begin
 if Node = nil then begin
  TreeList2.Clear;
  Exit;
 end;

 TreeList2.Clear;

 Child := TreeList2.Add;
 Child.Values[0] := Node.Values[0];
 Child.Values[1] := Node.Values[1];

 if RadioGroup.ItemIndex = 0 then SelectPrev(Child)
 else SelectNext(Child);

 TreeList2.FullExpand;
end;

procedure TObject_Scheme_Form.ActionExitExecute(Sender: TObject);
begin
 CloseButtonClick(Sender);
end;

procedure TObject_Scheme_Form.PreviewButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.ShowReport;
end;

function TObject_Scheme_Form.BeforePrint: boolean;
var
 i : integer;
 k : integer;
begin
 if TreeList1.Count <= 0 then begin
  ShowMessage('Неможна друкувати порожній документ!');
  Result := False;
  Exit;
 end;

 Report.LoadFromFile('Reports\FPOP\Object_Scheme.frf');

 k := 0;
 for i := 0 to TreeList1.LastNode.AbsoluteIndex do
  if not VarIsNull(TreeList1.Nodes.AbsoluteItems[i].Values[0]) or not VarIsNull(TreeList1.Nodes.AbsoluteItems[i].Values[1]) then inc(k);

 RowDataset.RangeEnd      := reCount;
 RowDataset.RangeEndCount := k;

 Result := True;
end;

procedure TObject_Scheme_Form.ReportGetValue(const ParName: String;
  var ParValue: Variant);
var
 s    : string;
 i    : integer;
begin
 if ParName = 'NameObject' then begin
  s := '';
  for i := 0 to TreeList1.Nodes.AbsoluteItems[RowDataset.RecNo].Level do s := s + '  ';

  ParValue := s + TreeList1.Nodes.AbsoluteItems[RowDataset.RecNo].Values[1];
 end
 else if ParName = 'NameDep' then
   ParValue := TreeList1.Nodes.AbsoluteItems[RowDataset.RecNo].Values[2];
end;

procedure TObject_Scheme_Form.PrintButtonClick(Sender: TObject);
begin
 if not BeforePrint then Exit;

 Report.PrepareReport;
 Report.PrintPreparedReportDlg;
end;

end.

