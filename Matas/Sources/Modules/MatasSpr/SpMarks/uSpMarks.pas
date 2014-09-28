{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                                                                              }
{               (c) Шамарин Ю.В. 2004-2007                                     }
{                                                                              }
unit uSpMarks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDatabase, pFIBDatabase, Buttons,
  ExtCtrls, cxGridTableView, FIBDataSet, pFIBDataSet, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBQuery, pFIBQuery, ibase,
  uResources, Resources_unitb;

type
  TSpMarksForm = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    MarkDataSource: TDataSource;
    StyleRepository: TcxStyleRepository;
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
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Panel1: TPanel;
    OkButton: TSpeedButton;
    CancelButton: TSpeedButton;
    WorkDataBase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    MarkDataSet: TpFIBDataSet;
    MarkDataSetID_MARK: TFIBBCDField;
    MarkDataSetID_MARK_GRP: TFIBBCDField;
    MarkDataSetNAME: TFIBStringField;
    MarkDataSetSHORT_NAME: TFIBStringField;
    cxGrid1DBTableView1ID_MARK: TcxGridDBColumn;
    cxGrid1DBTableView1ID_MARK_GRP: TcxGridDBColumn;
    cxGrid1DBTableView1NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    WorkQuery: TpFIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ModifyButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    DBHANDLE: TISC_DB_HANDLE;
    ID_MARK: Int64;
    NAME_MARK, SHORT_MARK: string;
    Result: boolean;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; ID_MARK: int64);overload;
  end;

var
  SpMarksForm: TSpMarksForm;

implementation

uses uSpMarksEdit;

{$R *.dfm}

constructor TSpMarksForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; ID_USER : Int64; ID_MARK: int64);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
   Self.DBHANDLE := DBHandle;
   Self.WorkDatabase.Close;
   Self.WorkDatabase.Handle:=DBHANDLE;
 end;
 Self.ID_MARK:=ID_MARK;
end;

procedure TSpMarksForm.FormCreate(Sender: TObject);
begin
 Caption:=MAT_SYS_PREFIX+'Статьи затрат';
 MarkDataSet.CloseOpen(True);
 Result:=false;
 if ID_MARK>0 then
  if MarkDataSet.Locate('ID_MARK',ID_MARK,[]) then
  begin
   NAME_MARK:=MarkDataSet.FieldByName('NAME').AsString;
   SHORT_MARK:=MarkDataSet.FieldByName('SHORT_NAME').AsString;
  end;
end;

procedure TSpMarksForm.OkButtonClick(Sender: TObject);
begin
 if not MarkDataSet.IsEmpty then
 begin
  ID_MARK:=MarkDataSet.FieldByName('ID_MARK').AsInteger;
  NAME_MARK:=MarkDataSet.FieldByName('NAME').AsString;
  SHORT_MARK:=MarkDataSet.FieldByName('SHORT_NAME').AsString;
  Result:=true;
  Close;
 end;
end;

procedure TSpMarksForm.CancelButtonClick(Sender: TObject);
begin
 Result:=false;
 Close;
end;

procedure TSpMarksForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 OkButtonClick(self);
end;

procedure TSpMarksForm.AddButtonClick(Sender: TObject);
var
 f: TSpMarksEdit;
begin
 f:=TSpMarksEdit.Create(self);
 if f.ShowModal=mrOk then
 begin
  if f.cxName.Text<>'' then
  begin
   WorkQuery.Close;
   WorkQuery.SQL.Clear;
   WorkQuery.SQL.Add('INSERT INTO MAT_SP_MARK_BASE (ID_MARK,ID_MARK_GRP,NAME,SHORT_NAME)');
   WorkQuery.SQL.Add('VALUES (GEN_ID(mat_gen_id_mark,1),1, '+QuotedStr(f.cxName.Text)+','+QuotedStr(f.cxShort.Text)+');');
   WorkQuery.Transaction:=WriteTransaction;
   try
    WorkQuery.Transaction.StartTransaction;
    WorkQuery.Prepare;
    WorkQuery.ExecQuery;
    WorkQuery.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      WorkQuery.Transaction.Rollback;
     end;
   end;
   MarkDataSet.CloseOpen(False);
  end;
 end;
end;

procedure TSpMarksForm.ModifyButtonClick(Sender: TObject);
var
 f: TSpMarksEdit;
 id_mark: integer;
begin
 if MarkDataSet.IsEmpty then
  exit;
 id_mark:=MarkDataSetID_MARK.AsInteger;
 f:=TSpMarksEdit.Create(self);
 f.cxName.Text:=MarkDataSetNAME.AsString;
 f.cxShort.Text:=MarkDataSetSHORT_NAME.AsString;
 if f.ShowModal=mrOk then
 begin
  if f.cxName.Text<>'' then
  begin
   try
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('UPDATE MAT_SP_MARK_BASE ');
    WorkQuery.SQL.Add('SET NAME='+QuotedStr(f.cxName.Text)+', SHORT_NAME='+QuotedStr(f.cxShort.Text));
    WorkQuery.SQL.Add('WHERE ID_MARK='+IntToStr(id_mark));
    WorkQuery.Transaction:=WriteTransaction;
    WorkQuery.Transaction.StartTransaction;
    WorkQuery.Prepare;
    WorkQuery.ExecQuery;
    WorkQuery.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      WorkQuery.Transaction.Rollback;
     end;
   end;
   MarkDataSet.CloseOpen(False);
  end;
 end;
end;

procedure TSpMarksForm.DeleteButtonClick(Sender: TObject);
var
 id_mark: integer;
begin
 id_mark:=MarkDataSetID_MARK.AsInteger;
 if MessageBox(Handle,PChar('Ви действительно хотите удалить запись?'),PChar('Внимание!'),MB_YESNO or MB_ICONERROR)=idYes
  then begin
   try
    WorkQuery.Close;
    WorkQuery.SQL.Clear;
    WorkQuery.SQL.Add('DELETE FROM MAT_SP_MARK_BASE ');
    WorkQuery.SQL.Add('WHERE ID_MARK='+IntToStr(id_mark));
    WorkQuery.Transaction:=WriteTransaction;
    WorkQuery.Transaction.StartTransaction;
    WorkQuery.Prepare;
    WorkQuery.ExecQuery;
    WorkQuery.Transaction.Commit;
   except on E : Exception
    do begin
      ShowMessage(E.Message);
      WorkQuery.Transaction.Rollback;
     end;
   end;
   MarkDataSet.CloseOpen(False);
  end;
end;

end.
