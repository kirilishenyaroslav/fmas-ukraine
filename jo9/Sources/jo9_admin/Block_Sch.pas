unit Block_Sch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, cxCheckBox, cxLookAndFeelPainters, cxGridBandedTableView,
  StdCtrls, cxButtons, IBase, tagTypes, FIBDatabase, pFIBDatabase,
  cxContainer, cxMemo, FIBQuery, pFIBQuery, DB, FIBDataSet, pFIBDataSet,
  cxCalendar;

type
  TBlock_Sch_Form = class(TForm)
    Panel1: TPanel;
    SchGrid: TcxGrid;
    SchTableView: TcxGridTableView;
    id_Sch_Column: TcxGridColumn;
    Num_Sch_Column: TcxGridColumn;
    Name_Sch_Column: TcxGridColumn;
    SchGridLevel: TcxGridLevel;
    Check_Column: TcxGridColumn;
    ApplyButton: TcxButton;
    CancelButton: TcxButton;
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
    cxStyle28: TcxStyle;
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    Database: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    InfoMemo: TcxMemo;
    Label3: TLabel;
    ReadTransaction: TpFIBTransaction;
    BlockAllButton: TcxButton;
    UnBlockAllButton: TcxButton;
    Old_Check_Column: TcxGridColumn;
    Date_Column: TcxGridColumn;
    Timer: TTimer;
    Open_Sch: TcxGridColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplyButtonClick(Sender: TObject);
    procedure BlockAllButtonClick(Sender: TObject);
    procedure UnBlockAllButtonClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    Expand    : boolean;
    MemoLines : TStringList;

    procedure CollapseInfoMemo;
    procedure ExpandInfoMemo;
    procedure FlashInfoMemo;
    procedure InitConnection(DBhandle: TISC_DB_HANDLE);
    procedure RefreshSch;
    destructor Destroy; override;
  end;

var
  Block_Sch_Form : TBlock_Sch_Form;
  SYS_INFO       : Pjo9_SYS_INFO;

function BlockSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO): variant; stdcall;
exports  BlockSch;

implementation

uses Kernel, tagLibUnit;

{$R *.dfm}

function BlockSch(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; FS : TFormStyle; INFO : Pjo9_SYS_INFO): variant; stdcall;
begin
 SYS_INFO := INFO;

 if FS = fsNormal then begin
  Block_Sch_Form := TBlock_Sch_Form.Create(AOwner);
  Block_Sch_Form.InitConnection(DBHandle);
  Block_Sch_Form.FormStyle  := FS;

  GetFormParams(Block_Sch_Form);
  Result := Block_Sch_Form.ShowModal;
  SetFormParams(Block_Sch_Form);

  Block_Sch_Form := nil;
 end
 else begin
  if Block_Sch_Form <> nil then begin
   Block_Sch_Form.Show;
   Exit;
  end;

  Block_Sch_Form := TBlock_Sch_Form.Create(AOwner);
  Block_Sch_Form.InitConnection(DBHandle);
  Block_Sch_Form.FormStyle  := FS;
  GetFormParams(Block_Sch_Form);

  Result := Block_Sch_Form.Handle;
 end;
end;

procedure TBlock_Sch_Form.FormCreate(Sender: TObject);
begin
 MemoLines := TStringList.Create;

 id_Sch_Column.DataBinding.ValueTypeClass     := TcxIntegerValueType;
 Num_Sch_Column.DataBinding.ValueTypeClass    := TcxStringValueType;
 Name_Sch_Column.DataBinding.ValueTypeClass   := TcxStringValueType;
 Check_Column.DataBinding.ValueTypeClass      := TcxBooleanValueType;
 Old_Check_Column.DataBinding.ValueTypeClass  := TcxBooleanValueType;
 Date_Column.DataBinding.ValueTypeClass       := TcxDateTimeValueType;
 Open_Sch.DataBinding.ValueTypeClass          := TcxDateTimeValueType;

 if SYS_MONTH < 10 then
  Caption := Caption + '    ' + '0' + IntToStr(SYS_INFO^._Month) + '(' + GetMonthName(SYS_INFO^._Month) + ')  ' + IntToStr(SYS_INFO^._Year) + 'p.'
 else
  Caption := Caption + '    ' + IntToStr(SYS_INFO^._Month) + '(' + GetMonthName(SYS_INFO^._Month) + ')  ' + IntToStr(SYS_INFO^._Year) + 'p.';
end;

procedure TBlock_Sch_Form.InitConnection(DBhandle: TISC_DB_HANDLE);
begin
 Database.Handle         := DBhandle;
 ReadTransaction.StartTransaction;
end;

procedure TBlock_Sch_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 ReadTransaction.Commit;

 if not (fsModal in FormState) then SetFormParams(Self);
 Action := caFree;
end;

procedure TBlock_Sch_Form.CancelButtonClick(Sender: TObject);
begin
 if fsModal in FormState then ModalResult := mrCancel
 else Close;
end;

procedure TBlock_Sch_Form.FormShow(Sender: TObject);
begin
 RefreshSch;
end;

procedure TBlock_Sch_Form.RefreshSch;
var
 i : integer;
begin
 with SchTableView.DataController do begin
  for i := 0 to Length(SYS_INFO^._Native_Sch^) - 1 do begin
   RecordCount := RecordCount + 1;

   Values[RecordCount - 1, 0] := SYS_INFO^._Native_Sch^[i]._id_Sch;
   Values[RecordCount - 1, 1] := SYS_INFO^._Native_Sch^[i]._Num_Sch;
   Values[RecordCount - 1, 2] := SYS_INFO^._Native_Sch^[i]._Name_Sch;
   Values[RecordCount - 1, 3] := SYS_INFO^._Native_Sch^[i]._Date_Beg;
   Values[RecordCount - 1, 4] := SYS_INFO^._Native_Sch^[i]._Open_Sch;
   Values[RecordCount - 1, 5] := SYS_INFO^._Native_Sch^[i]._is_Blocked;
   Values[RecordCount - 1, 6] := SYS_INFO^._Native_Sch^[i]._is_Blocked;
  end;

  if RecordCount > 0 then FocusedRecordIndex := 0;
 end;
end;

procedure TBlock_Sch_Form.ApplyButtonClick(Sender: TObject);
var
 i    : integer;
 SCH  : KERNEL_SCH_MNGR_STRUCTURE;
 RES  : RESULT_STRUCTURE;
 Flag : boolean;
begin
 MemoLines.Clear;

 Flag := False;
 WriteTransaction.StartTransaction;

 with SchTableView.DataController do begin
  for i := 0 to RecordCount - 1 do begin
   if Values[i, 4] = Values[i, 5] then Continue;

   SCH.DBHANDLE    := Database.Handle;
   SCH.TRHANDLE    := WriteTransaction.Handle;
   SCH.ID_USER     := SYS_INFO^._id_User;
   SCH.ID_SCH      := Values[i, 0];

   if Values[i, 5] then
    SCH.MODE := 3
   else
    SCH.MODE := 4;

   RES := SchManager(@SCH);

   if RES.RESULT_CODE = 0 then begin
    MemoLines.Add(Values[i, 1] + ': ' + RES.RESULT_MESSAGE);
    Flag := True;
    FocusedRecordIndex := i;
    Values[i, 5] := Values[i, 6]
   end
   else Values[i, 6] := Values[i, 5];
  end;
 end;

 if Flag then WriteTransaction.Rollback
 else begin
  WriteTransaction.Commit;
  MemoLines.Add('«м≥ни усп≥шно збережено!');
 end;

 FlashInfoMemo;
end;

procedure TBlock_Sch_Form.BlockAllButtonClick(Sender: TObject);
var
 i : integer;
begin
 with SchTableView.DataController do
  for i := 0 to RecordCount - 1 do Values[i, 5] := True;
end;

procedure TBlock_Sch_Form.UnBlockAllButtonClick(Sender: TObject);
var
 i : integer;
begin
 with SchTableView.DataController do
  for i := 0 to RecordCount - 1 do Values[i, 5] := False;
end;

procedure TBlock_Sch_Form.TimerTimer(Sender: TObject);
begin
 if Expand then ExpandInfoMemo
 else CollapseInfoMemo;
end;

procedure TBlock_Sch_Form.CollapseInfoMemo;
begin
 if InfoMemo.Height > 0 then InfoMemo.Height := InfoMemo.Height - 1
 else begin
  InfoMemo.Lines.AddStrings(MemoLines);
  Expand := True;
 end;
end;

procedure TBlock_Sch_Form.ExpandInfoMemo;
begin
 if InfoMemo.Height < 56 then InfoMemo.Height := InfoMemo.Height + 1
 else Timer.Enabled := False;
end;

procedure TBlock_Sch_Form.FlashInfoMemo;
begin
 InfoMemo.Lines.Clear;
 Expand        := False;
 Timer.Enabled := True;
end;

destructor TBlock_Sch_Form.Destroy;
begin
 Block_Sch_Form := nil;
 inherited;
end;

end.

