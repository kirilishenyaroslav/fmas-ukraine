unit MainUView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DataModule, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGridLevel, cxGrid, FIBDataSet, pFIBDataSet,
  cxCheckBox, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxMemo, cxLookAndFeelPainters, StdCtrls, cxButtons, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, FIBQuery, pFIBQuery, Buttons,
  cxSplitter, ExtCtrls;

type
  TFieldLinksRecord = packed record
   _Name_Field : string;
   _Value      : string;
  end;

  TFieldLinksArray = array of TFieldLinksRecord;

  TMainForm = class(TForm)
    TableDataSet: TpFIBDataSet;
    TableDataSource: TDataSource;
    DateEdit: TcxDateEdit;
    DateCheckBox: TcxCheckBox;
    DataSet: TpFIBDataSet;
    ServersPopupEdit: TcxPopupEdit;
    ServerCheckBox: TcxCheckBox;
    ServGrid: TcxGrid;
    TableView: TcxGridDBTableView;
    ID_SERVER_COLUMN: TcxGridDBColumn;
    NAME_SERVER_COLUMN: TcxGridDBColumn;
    NAME_DEPARTMENT_COLUMN: TcxGridDBColumn;
    ServGridLevel: TcxGridLevel;
    ServersDataSet: TpFIBDataSet;
    ServersDataSource: TDataSource;
    SubjGrid: TcxGrid;
    SubjectTableView: TcxGridDBTableView;
    SubjGridLevel: TcxGridLevel;
    SubjectDataSet: TpFIBDataSet;
    SubjectDataSource: TDataSource;
    ID_SUBJECT_AREA_COLUMN: TcxGridDBColumn;
    NAME_SUBJECT_AREA_COLUMN: TcxGridDBColumn;
    SubjectPopupEdit: TcxPopupEdit;
    SubjectCheckBox: TcxCheckBox;
    Query: TpFIBQuery;
    SelectButton: TSpeedButton;
    Panel: TPanel;
    DataTreeList: TcxTreeList;
    NameTableTreeList: TcxDBTreeList;
    ID_SUBJECT_AREA_PARAM_COLUMN: TcxDBTreeListColumn;
    LINK_TO_PARAM_COLUMN: TcxDBTreeListColumn;
    NAME_TABLE_PARAM_COLUMN: TcxDBTreeListColumn;
    COUNT_PARAM_COLUMN: TcxDBTreeListColumn;
    EXPRESSION_FIELDS_PARAM_COLUMN: TcxDBTreeListColumn;
    IS_USE_END_PARAM_COLUMN: TcxDBTreeListColumn;
    cxSplitter1: TcxSplitter;
    COMMENT_COLUMN: TcxDBTreeListColumn;
    WaitPanel: TPanel;
    Image1: TImage;
    Bevel1: TBevel;
    Label1: TLabel;
    cxStyleRepository1: TcxStyleRepository;
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
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure DataTableViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ServersPopupEditPropertiesPopup(Sender: TObject);
    procedure ServersPopupEditPropertiesCloseUp(Sender: TObject);
    procedure SubjectPopupEditPropertiesPopup(Sender: TObject);
    procedure SubjectPopupEditPropertiesCloseUp(Sender: TObject);
    procedure DateCheckBoxPropertiesChange(Sender: TObject);
    procedure ServerCheckBoxPropertiesChange(Sender: TObject);
    procedure SubjectCheckBoxPropertiesChange(Sender: TObject);
    procedure NameTableTreeListFocusedNodeChanged(Sender: TObject;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure SelectButtonClick(Sender: TObject);
    procedure TableViewDblClick(Sender: TObject);
    procedure SubjectTableViewDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
   procedure SelectAll;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

var
 id_Server : integer;
 id_Subj   : integer;

function CreateFieldLinks(Fields, Values : string) : TFieldLinksArray;
var
 i          : integer;
 k, p       : integer;
 TempArray  : TFieldLinksArray;
 TempArray2 : TFieldLinksArray;
begin
 TempArray  := nil;
 TempArray2 := nil;

 if Length(Fields) = 0 then Exit;

 SetLength(TempArray, 1);
 k := pos(';', Fields);
 p := pos(';', Values);

 if k = 0 then
  TempArray[0]._Name_Field := Fields
 else
  TempArray[0]._Name_Field := Copy(Fields, 1, k - 1);

 if p = 0 then
  TempArray[0]._Value      := Values
 else
  TempArray[0]._Value      := Copy(Values, 1, p - 1);

 if k = 0 then begin
  Result := TempArray;
  Exit;
 end;

 TempArray2 := nil;
 TempArray2 := CreateFieldLinks(Copy(Fields, k + 1, Length(Fields) - 1), Copy(Values, p + 1, Length(Values) - 1));

 for i := 0 to Length(TempArray2) - 1 do begin
  SetLength(TempArray, Length(TempArray) + 1);
  TempArray[Length(TempArray) - 1] := TempArray2[i];
 end;

 Result := TempArray;

end;

procedure TMainForm.DataTableViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var
 NameTable  : string;
 ExprFields : string;
begin
 if AFocusedRecord = nil then Exit;

 NameTable  := AFocusedRecord.Values[0];
 ExprFields := AFocusedRecord.Values[2];
end;

procedure TMainForm.SelectAll;
var
 QueryText : string;
begin
 WaitPanel.Visible := True;
 Application.ProcessMessages;

 TableDataSet.Close;

 QueryText := 'select * from EXCH_PROC_VIEW_COUNT(';

 if DateCheckBox.Checked then
  QueryText := QueryText + QuotedStr(DateToStr(DateEdit.Date)) + ','
 else
  QueryText := QueryText + 'null,';

 if ServerCheckBox.Checked then
  QueryText := QueryText + IntToStr(id_Server) + ','
 else
  QueryText := QueryText + 'null,';

 if SubjectCheckBox.Checked then
  QueryText := QueryText + IntToStr(id_Subj) + ')'
 else
  QueryText := QueryText + 'null)';

 TableDataSet.SelectSQL.Text := QueryText;
 TableDataSet.Open;
 
 WaitPanel.Visible := False;
end;

procedure TMainForm.ServersPopupEditPropertiesPopup(Sender: TObject);
begin
 ServersDataSet.Open;
end;

procedure TMainForm.ServersPopupEditPropertiesCloseUp(Sender: TObject);
begin
 if TableView.DataController.FocusedRecordIndex < 0 then Exit;

 id_Server             := TableView.ViewData.Records[TableView.DataController.FocusedRecordIndex].Values[0];
 ServersPopupEdit.Text := TableView.ViewData.Records[TableView.DataController.FocusedRecordIndex].Values[1];

 ServersDataSet.Close;
end;

procedure TMainForm.SubjectPopupEditPropertiesPopup(Sender: TObject);
begin
 SubjectDataSet.Open;
end;

procedure TMainForm.SubjectPopupEditPropertiesCloseUp(Sender: TObject);
begin
 if SubjectTableView.DataController.FocusedRecordIndex < 0 then Exit;

 id_Subj               := SubjectTableView.ViewData.Records[SubjectTableView.DataController.FocusedRecordIndex].Values[0];
 SubjectPopupEdit.Text := SubjectTableView.ViewData.Records[SubjectTableView.DataController.FocusedRecordIndex].Values[1];

 SubjectDataSet.Close;
end;

procedure TMainForm.DateCheckBoxPropertiesChange(Sender: TObject);
begin
 DateEdit.Enabled := DateCheckBox.Checked;  
end;

procedure TMainForm.ServerCheckBoxPropertiesChange(Sender: TObject);
begin
 ServersPopupEdit.Enabled := ServerCheckBox.Checked;
end;

procedure TMainForm.SubjectCheckBoxPropertiesChange(Sender: TObject);
begin
 SubjectPopupEdit.Enabled := SubjectCheckBox.Checked;
end;

procedure TMainForm.NameTableTreeListFocusedNodeChanged(Sender: TObject;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var
 QueryText   : string;
 NameTable   : string;
 ExprFields  : string;
 is_Use_End  : boolean;

 ValueExpr   : string;
 Server      : string;

 j           : integer;

 Node        : TcxTreeListNode;
 LinksArray  : TFieldLinksArray;
begin
 DataTreeList.Clear;
 DataTreeList.DeleteAllColumns;

 if AFocusedNode = nil then Exit;
 if VarIsNull(AFocusedNode.Values[3]) then Exit;

 WaitPanel.Visible := True;
 Application.ProcessMessages;

 DataTreeList.BeginUpdate;

 NameTable  := AFocusedNode.Values[2];
 ExprFields := AFocusedNode.Values[4];
 is_Use_End := ('1' = AFocusedNode.Values[6]);

 QueryText := 'select * from EXCH_PROC_INI_LOG_REC_SEL_VIEW(';

 if DateCheckBox.Checked then
  QueryText := QueryText + QuotedStr(DateToStr(DateEdit.Date)) + ','
 else
  QueryText := QueryText + 'null,';

 if ServerCheckBox.Checked then
  QueryText := QueryText + IntToStr(id_Server) + ','
 else
  QueryText := QueryText + 'null,';

 QueryText := QueryText + QuotedStr(NameTable) + ')';

 DataSet.Close;
 DataSet.SelectSQL.Text := QueryText;
 DataSet.Open;

 while not DataSet.Eof do begin
  ValueExpr := DataSet['VALUE_EXPRESSIONS_PARAM'];
  Server    := DataSet['NAME_SERVER_PARAM'];

  QueryText := 'select * from ' + UpperCase(NameTable) + ' where ';

  LinksArray := CreateFieldLinks(ExprFields, ValueExpr);

  if Length(LinksArray) = 0 then begin
   DataSet.Next;
   Continue;
  end;

  for j := 0 to Length(LinksArray) - 1 do begin
   if j > 0 then QueryText := QueryText + ' and ';

   QueryText := QueryText + UpperCase(LinksArray[j]._Name_Field) + '='
   + QuotedStr(LinksArray[j]._Value);
  end;

  if is_Use_End then QueryText := QueryText + ' and ' + QuotedStr(DateTimeToStr(Now)) + ' between USE_BEG and USE_END';

  Query.SQL.Text := QueryText;
  Query.ExecQuery;

  if Query.RecordCount = 0 then begin
   Query.Close;
   DataSet.Next;
   Continue;
  end;

  if DataTreeList.ColumnCount <= 0 then begin
   for j := 0 to Query.FieldCount - 1 do
    with DataTreeList.CreateColumn do begin
     Name              := Query.Fields[j].Name;
     Caption.Text      := Query.Fields[j].Name;
     Caption.AlignHorz := taCenter;
    end;

   with DataTreeList.CreateColumn do begin
    Name              := 'NameServer';
    Caption.Text      := 'Від серверу';
    Caption.AlignHorz := taCenter;
   end;
  end;

  while not Query.Eof do begin
   Node := DataTreeList.Add;
   for j := 0 to Query.FieldCount - 1 do
    Node.Values[j] := Query.Fields[j].AsVariant;

   Node.Values[DataTreeList.ColumnCount - 1] := Server;

   Query.Next;
  end;
  Query.Close;

  DataSet.Next;
 end;
 DataSet.Close;

 DataTreeList.EndUpdate;
 
 WaitPanel.Visible := False;
end;

procedure TMainForm.SelectButtonClick(Sender: TObject);
begin
 SelectAll;
end;

procedure TMainForm.TableViewDblClick(Sender: TObject);
begin
 ServersPopupEdit.DroppedDown := False;
end;

procedure TMainForm.SubjectTableViewDblClick(Sender: TObject);
begin
 SubjectPopupEdit.DroppedDown := False;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
 WaitPanel.Left := (Width - WaitPanel.Width) div 2;
 WaitPanel.Top  := (Height - WaitPanel.Height) div 2;
end;

end.
