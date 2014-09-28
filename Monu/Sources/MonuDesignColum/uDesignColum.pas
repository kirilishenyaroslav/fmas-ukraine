unit uDesignColum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AArray, dxBar, dxBarExtItems, DB, FIBDataSet, pFIBDataSet,
  cxGraphics, cxCustomData, cxStyles, cxTL, cxControls, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit, FIBDatabase, pFIBDatabase, ImgList,
  cxGridTableView, cxClasses, ExtCtrls, cxLabel, cxContainer, cxEdit,
  cxTextEdit, FIBQuery, pFIBQuery, pFIBStoredProc, Ib_externals,
  cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ActnList, uMonuLoader,
  uMonuLoaderDM,  cxMemo, cxSplitter, cxCalendar, cxLookAndFeelPainters,
  StdCtrls, cxButtons, Menus;
type
  THeaderRect = record
    x, y    : integer;
    w, h    : integer;
    text    : string;
    parent  : integer;
    percent : integer;
    index   : integer;
    code    : Integer;
    visible : Integer;
  end;

const
 edit_margin = 16;

type
  TfrmDesignColum = class(TForm)
    dxBarManager1: TdxBarManager;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    DataSet: TpFIBDataSet;
    DataSource: TDataSource;
    pFIBDatabase1: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    LargeImages: TImageList;
    WriteTransaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    ScrollBox1: TScrollBox;
    pb: TPaintBox;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    dxBarDockControl1: TdxBarDockControl;
    dxBarLargeButtonSave: TdxBarLargeButton;
    bAdd: TdxBarLargeButton;
    bAddChild: TdxBarLargeButton;
    Panel1: TPanel;
    bDown: TdxBarLargeButton;
    bUp: TdxBarLargeButton;
    bLeft: TdxBarLargeButton;
    bright: TdxBarLargeButton;
    cxTextEdit1: TcxMemo;
    bDelete: TdxBarLargeButton;
    ActionClon: TAction;
    Panel2: TPanel;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxSplitter2: TcxSplitter;
    PeriodsDataSet: TpFIBDataSet;
    PeriodsDataSource: TDataSource;
    GridDBTableView1DBColumn1: TcxGridDBColumn;
    GridDBTableView1DBColumn2: TcxGridDBColumn;
    Panel3: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButton3: TcxButton;
    dxBarButton1: TdxBarButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
    procedure TreeDblClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure TreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure pbPaint(Sender: TObject);
    procedure pbDblClick(Sender: TObject);
    procedure pbMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cxTextEdit1_KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure dxBarButtonAddColumLinkClick(Sender: TObject);
    procedure dxBarLargeButtonSaveClick(Sender: TObject);
    procedure DataSetAfterScroll(DataSet: TDataSet);
    procedure bAddClick(Sender: TObject);
    procedure bDownClick(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure brightClick(Sender: TObject);
    procedure bLeftClick(Sender: TObject);
    procedure GridDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure cxTextEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bDeleteClick(Sender: TObject);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure ActionClonExecute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure pbMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    input, output : TAArray;
    bmp : TBitmap;
    rects : array of THeaderRect;
    selected : integer;
    id_form_code : Int64;
    FCurrentDrawFormCode:string;
    procedure SelectAll;
    procedure Draw;
    procedure AddRect(x, y, w, h, parent : integer; const text : string; code:Integer; Vis:Integer);
    procedure DeleteRect(const index : integer);
    function rCount : integer;
    procedure DrawRect(r : THeaderRect);
    function inRect(x, y : integer; rect : THeaderRect) : boolean;
    procedure AlignToParent(var r : THeaderRect);
    procedure AlignParents(p : THeaderRect);
    procedure SaveChild(parentRect,parentDB:Int64);
    procedure RecalcRootPositions;
    procedure LoadChild(id_colum,index_rec:Int64);
    procedure AddRectParent(w,h,parent : Integer ;const text : string;code:Integer;Vis:Integer);
    procedure AddRectChild(w,h,percent,parent : Integer ;const text : string;code:Integer;Vis:Integer);
  end;

var
  frmDesignColum: TfrmDesignColum;

  function Load(input, res : TAArray) : boolean;

  exports
   Load;

implementation

uses Math,
     uDesignClon, uGetPeriod;

var
 step : integer = 32;

{$R *.dfm}

function Load(input, res : TAArray) : boolean;
var
 frm : TfrmDesignColum;
begin
  Result := true;
  frm := TfrmDesignColum.Create(TComponent(input['Owner'].asObject));
  frm.input := TAArray.Create;
  input.CopyTo(frm.input);
  frm.output := res;
  frm.FormStyle := frm.input['FormStyle'].AsVariant;
  frm.Caption := frm.input['Caption'].AsString;
  frm.pFIBDatabase1.Handle := pvoid(frm.input['DBHandle'].asInteger);

  frm.SelectAll;


  if frm.FormStyle = fsNormal then
  begin
    frm.output['MoadResult'].AsVariant := frm.ShowModal;
    frm.Free;
  end
  else
  begin

  end;
end;


{ TfrmSpravTree }


procedure TfrmDesignColum.SelectAll;
begin
 Dataset.Close;
 Dataset.SelectSQL.Text := 'select * from MON_SP_FORM_CODE';
 Dataset.Open;
end;

procedure TfrmDesignColum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
end;

procedure TfrmDesignColum.ExitButtonClick(Sender: TObject);
begin
 close;
end;

procedure TfrmDesignColum.SelButtonClick(Sender: TObject);
var
 i : integer;
begin
 if DataSet.RecordCount <> 0 then
 begin
   for i := 0 to DataSet.FieldCount - 1 do output[DataSet.Fields[i].FieldName].AsVariant := DataSet.Fields[i].Value;
 end;
 ModalResult := mrOk;
end;

procedure TfrmDesignColum.TreeDblClick(Sender: TObject);
begin
 SelButtonClick(Self);
end;


procedure TfrmDesignColum.RefreshButtonClick(Sender: TObject);
var
 i : integer;
begin
  i := GridDBTableView1.DataController.FocusedRowIndex;
  SelectAll;
  GridDBTableView1.DataController.FocusedRowIndex := i;
end;


procedure TfrmDesignColum.TreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key = VK_RETURN then SelButtonClick(Self);
 if key = VK_f5 then RefreshButtonClick(Self);
end;

procedure TfrmDesignColum.FormDestroy(Sender: TObject);
begin
  input.Free;
end;

function TfrmDesignColum.rCount : integer;
begin
  Result := Length(rects);
end;

procedure TfrmDesignColum.pbPaint(Sender: TObject);
begin
     Draw;
end;

procedure TfrmDesignColum.pbDblClick(Sender: TObject);
var r : THeaderRect;
begin
     if selected = -1 then exit;
     r := Rects[selected];
     cxTextEdit1.Left    := pb.Left + r.x;
     cxTextEdit1.Top     := pb.Top + r.y;
     cxTextEdit1.Width   := r.w;
     cxTextEdit1.Height  := r.h;
     cxTextEdit1.Visible := true;
     cxTextEdit1.Text    := r.text;
     cxTextEdit1.SetFocus;
end;

procedure TfrmDesignColum.pbMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
 i : integer;
 key : word;
begin
  key := VK_RETURN;
  if cxTextEdit1.Visible then exit;//cxTextEdit1KeyDown(Self, key, []);
  selected := -1;
  for i := 0 to Length(rects) - 1 do if inRect(x, y, rects[i]) then selected := i;
  if selected = -1 then
  begin
    bAddChild.Enabled := false;
    bUp.Enabled := false;
    bDown.Enabled := false;
    bLeft.Enabled := false;
    bRight.Enabled := false;
    bDelete.Enabled := false;
  end
  else
  begin
    bAddChild.Enabled := true;
    bUp.Enabled := true;
    bDown.Enabled := true;
    bLeft.Enabled := true;
    bRight.Enabled := true;
    bDelete.Enabled := true;
  end;
  Draw;
end;

procedure TfrmDesignColum.Draw;
var
  i : integer;
  j : integer;
  r : THeaderRect;
  n : string;
  cnt : integer;
  p : integer;
  h : integer;
  s : string;
begin
  bmp.Canvas.Brush.Color := MON_BLUE_SKY;
  bmp.Canvas.FillRect(Rect(0, 0, bmp.Width, bmp.Height));
  bmp.Canvas.Pen.Width := 1;
  bmp.Canvas.Pen.Color := clBlack;
  if DataSet.RecordCount <> 0 then n := 'Код форми: ' + FCurrentDrawFormCode;
  bmp.Canvas.Font.Size := 18;
  bmp.Canvas.Font.Style := [fsBold];
  bmp.Canvas.Brush.Style := bsClear;
  bmp.Canvas.TextOut(10, 10, n);
  bmp.Canvas.Font.Size := 8;

  bmp.Canvas.Brush.Style := bsSolid;
  bmp.Canvas.Brush.Color := clSilver;

  for i := 0 to Length(rects) - 1 do
  begin
    if selected = i then bmp.Canvas.Pen.Color := clRed else bmp.Canvas.Pen.Color := clBlack;
    r := rects[i];
    DrawRect(r);
    cnt := 0;
    bmp.Canvas.Brush.Style := bsClear;
    if r.text <> '' then for j := 1 to Length(r.text) do if r.text[j] = #13 then inc(cnt);
    if cnt = 0 then bmp.Canvas.TextRect(rect(r.x+1, r.y+1, r.x + r.w-2, r.y + r.h-2), r.x + r.w div 2 - bmp.Canvas.TextWidth(r.text) div 2, r.y + r.h div 2 - bmp.Canvas.TextHeight(r.text) div 2, r.text)
    else
    begin
      h := bmp.Canvas.TextHeight(r.text) * (cnt + 1) div 2;
      n := r.text;
      while true do
      begin
        p := pos(#13, n);
        if p = 0 then p := Length(n) + 1;
        if p <> 0 then
        begin
           s := Copy(n, 1, p - 1);
           bmp.Canvas.TextRect(rect(r.x+1, r.y+1, r.x + r.w-2, r.y + r.h-2), r.x + r.w div 2 - bmp.Canvas.TextWidth(s) div 2, r.y + r.h div 2 - h, s);
           h := h - bmp.Canvas.TextHeight(n);
           n := Copy(n, p+2, Length(n) - p - 1);
        end;
        if n = '' then break;
      end;
    end;
  end;
  pb.Canvas.Draw(0, 0, bmp);
end;


procedure TfrmDesignColum.AddRect(x, y, w, h, parent : integer; const text : string; code:Integer; Vis:Integer);
begin
      SetLength(Rects, rCount + 1);
      rects[Length(rects) - 1].x      := x;
      rects[Length(rects) - 1].y      := y;
      rects[Length(rects) - 1].w      := w;
      rects[Length(rects) - 1].h      := h;
      rects[Length(rects) - 1].parent := parent;
      rects[Length(rects) - 1].text   := text;
      rects[Length(rects) - 1].index  := Length(rects) - 1;
      rects[Length(rects) - 1].code   := code;
      rects[Length(rects) - 1].visible:= Vis;
end;

function TfrmDesignColum.inRect(x, y: integer; rect: THeaderRect): boolean;
begin
     Result := (x > rect.x) and (x < rect.x + rect.w) and (y > rect.y) and (y < rect.y + rect.h)
end;

procedure TfrmDesignColum.AlignToParent(var r: THeaderRect);
var
  p : THeaderRect;
  i : integer;
  cnt : integer;
begin
  if r.parent = -1 then exit;
  p := rects[r.parent];
  r.y := p.y + p.h;
  cnt := 0;
  if r.w = 0 then
  begin
    for i := 0 to rCount - 1 do if (rects[i].parent = r.parent) then inc(cnt);
    if cnt = 0 then
    begin
      r.w := p.w;
      r.percent := 100;
    end
    else
    begin
      r.w := round(p.w * 1/cnt);
      r.percent := Round(100/cnt);
      for i := 0 to rCount - 1 do if (rects[i].parent = r.parent) and (i <> r.index) then
      begin
        rects[i].w := round(r.w * 1/cnt);
        rects[i].percent := Round(100/cnt);
      end;
      AlignParents(rects[r.parent]);
    end;
   end;
end;

procedure TfrmDesignColum.AlignParents(p: THeaderRect);
var
 i : integer;
 w : integer;
 last : integer;
begin
  w := p.x;
  last := -1;
  for i := 0 to rCount - 1 do if (rects[i].parent = p.index) then
  begin
        rects[i].x := w;
        rects[i].y := p.y + p.h;
        rects[i].w := Round(rects[i].percent/100 * p.w);
        w := w + rects[i].w;
        last := i;
        AlignParents(rects[i]);
  end;
  if last <> -1 then
  begin
    w := (p.x + p.w) - rects[last].x;
    rects[last].w := IfThen(w < 0, 0, w);
    AlignParents(rects[last]);
  end;
end;

procedure TfrmDesignColum.cxTextEdit1_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    rects[selected].text := cxTextEdit1.Text;
    cxTextEdit1.Hide;
    Action1.Enabled := true;
    Draw;
  end;
  if Key = VK_ESCAPE then
  begin
    Action1.Enabled := true;
    cxTextEdit1.Hide;
    Draw;
  end;
end;

procedure TfrmDesignColum.FormCreate(Sender: TObject);
begin
     PeriodsDataSet.SelectSQL.Text:='SELECT * FROM MON_SP_COLUMNS_PERIODS WHERE ID_FORM_CODE=:ID_FORM_CODE';

     bmp := TBitmap.Create;
     bmp.Width := pb.Width;
     bmp.Height := pb.Height;
     selected := -1;

     if (DataSet.RecordCount>0)
     then FCurrentDrawFormCode:=DataSet.FieldByName('NAME_FORM_CODE').AsString
     else FCurrentDrawFormCode:='';

     Draw;
end;

procedure TfrmDesignColum.dxBarButtonAddColumLinkClick(Sender: TObject);
begin
     if selected = -1 then exit;
     AddRect(20,20,0,64, selected, '', StrToInt(InputBox('Увага!','Треба ввести код стовбця.','0')), 1);
     AlignToParent(rects[rCount -1]);
     Draw;
end;

procedure TfrmDesignColum.dxBarLargeButtonSaveClick(Sender: TObject);
var
  i : Integer;
  pubparentDB : Int64;
  wSize       : Integer;
  wPercent    : Integer;
  Percent     : Integer;
begin

  WriteTransaction.StartTransaction;
  StoredProc.StoredProcName                      :='MON_SP_COLUMNS_DEL';
  StoredProc.ParamByName('ID_FORM_CODE').AsInt64 := id_form_code;
  StoredProc.ParamByName('ID_PERIOD').AsInt64    := TFIBBCDField(PeriodsDataSet.FieldByName('ID_PERIOD')).AsInt64;
  StoredProc.Prepare;
  try
    StoredProc.ExecProc;
  except
    begin
      WriteTransaction.Rollback;
      Exit;
    end;
   end;


  wSize := 0;
  wPercent := 0;
  for i := 0 to rCount-1 do
    begin
      if rects[i].parent = -1 then
        begin
          wSize := wSize + rects[i].w;
        end;
     end;

  for i := 0 to rCount-1 do
    begin
      if rects[i].parent = -1 then
        begin
          WriteTransaction.StartTransaction;
          StoredProc.StoredProcName:='MON_SP_COLUMNS_INS';
          StoredProc.ParamByName('linkto').AsInt64          :=-1;
          StoredProc.ParamByName('id_form_code').AsInt64    :=id_form_code;
          StoredProc.ParamByName('name_column').AsString    :=rects[i].text;
          StoredProc.ParamByName('width_colum').AsInteger   :=rects[i].w;
          StoredProc.ParamByName('height_colum').AsInteger  :=rects[i].h;
          StoredProc.ParamByName('code').AsInteger          :=rects[i].code;
          StoredProc.ParamByName('ID_PERIOD').AsInt64       :=TFIBBCDField(PeriodsDataSet.FieldByName('ID_PERIOD')).AsInt64;
          StoredProc.ParamByName('VISIBLE').AsInteger       :=rects[i].visible;

          Percent := round(rects[i].w/wSize*100);
          if i <> (rcount -1) then
            begin
              StoredProc.ParamByName('PERCENT_COLUM').AsInteger := Percent;
              wPercent := wPercent + Percent;
            end
            else
            begin
              StoredProc.ParamByName('PERCENT_COLUM').AsInteger := 100 - wPercent;
            end;

          StoredProc.Prepare;
          try
            StoredProc.ExecProc;
          except
            begin
              WriteTransaction.Rollback;
              Exit;
            end;
           end;
          pubparentDB := StoredProc.FieldByName('OUT_ID_COLUM').AsInt64;
          WriteTransaction.Commit;
          SaveChild(rects[i].index,pubparentDB);
        end;
    end;
end;


procedure TfrmDesignColum.SaveChild(parentRect,parentDB:Int64);
var
  i : Integer;
  pubparentDB : Int64;
begin
     for i := 0 to rCount-1 do
     begin
          if rects[i].parent = parentRect
          then begin
                    WriteTransaction.StartTransaction;
                    StoredProc.StoredProcName:='MON_SP_COLUMNS_INS';
                    StoredProc.ParamByName('linkto').AsInt64          := parentDB;
                    StoredProc.ParamByName('id_form_code').AsInt64    := id_form_code;
                    StoredProc.ParamByName('name_column').AsString    := rects[i].text;
                    StoredProc.ParamByName('percent_colum').AsInteger := rects[i].percent;
                    StoredProc.ParamByName('HEIGHT_COLUM').AsInteger  := rects[i].h;
                    StoredProc.ParamByName('CODE').AsInteger          := rects[i].code;
                    StoredProc.ParamByName('ID_PERIOD').AsInt64       := TFIBBCDField(PeriodsDataSet.FieldByName('ID_PERIOD')).AsInt64;
                    StoredProc.ParamByName('VISIBLE').AsInteger       := rects[i].visible;
                    StoredProc.Prepare;
                    try
                         StoredProc.ExecProc;
                    except
                    begin
                         WriteTransaction.Rollback;
                         Exit;
                    end;
                    end;
                    pubparentDB := StoredProc.FieldByName('OUT_ID_COLUM').AsInt64;
                    WriteTransaction.Commit;
                    SaveChild(rects[i].index,pubparentDB);
          end;
     end;
end;


procedure TfrmDesignColum.DataSetAfterScroll(DataSet: TDataSet);
begin
  id_form_code := DataSet.FieldByName('id_form_code').AsInteger;
end;

procedure TfrmDesignColum.bAddClick(Sender: TObject);
var
 x, i : integer;
begin
     if PeriodsDataSet.RecordCount>0
     then begin
               x := 32;
               for i := 0 to rCount - 1 do if rects[i].parent = -1 then x := x + rects[i].w;
               AddRect(x, step * 2, step * 5, 32, -1, '',StrToInt(InputBox('Увага!','Треба ввести код стовбця.','0')),1);
               pbMouseDown(Self, mbLeft, [], rects[rCount - 1].x + 1, rects[rCount - 1].y + 1);
               Draw;
     end
end;

procedure TfrmDesignColum.DrawRect(r: THeaderRect);
var CurColor:TColor;
begin
      if r.visible=0
      then bmp.Canvas.Brush.Color := clInactiveBorder
      else bmp.Canvas.Brush.Color := $FADAB6;

      bmp.Canvas.FillRect(rect(r.x, r.y, r.x + r.w, r.y + r.h));

      if selected = r.index
      then begin
                bmp.Canvas.Pen.Width := 2;
                bmp.Canvas.Pen.Color := clRed;
      end
      else begin
                bmp.Canvas.Pen.Width := 1;
                bmp.Canvas.Pen.Color := clBlack;
      end;

      bmp.Canvas.Rectangle(rect(r.x, r.y, r.x + r.w, r.y + r.h));

      CurColor:=bmp.Canvas.Pen.Color;
      bmp.Canvas.Pen.Color:=clRed;
      bmp.Canvas.TextOut(r.x+2,r.y+2,IntToStr(r.code));
      bmp.Canvas.Pen.Color:=CurColor;
end;

procedure TfrmDesignColum.bDownClick(Sender: TObject);
begin
 rects[selected].h := rects[selected].h + step;
 AlignPArents(rects[selected]);
 Draw;
end;

procedure TfrmDesignColum.bUpClick(Sender: TObject);
begin
 rects[selected].h := rects[selected].h - step;
 if rects[selected].h <= 0 then rects[selected].h := step;
 AlignPArents(rects[selected]);
 Draw;
end;

procedure TfrmDesignColum.brightClick(Sender: TObject);
var
 i : integer;
 x : integer;
begin
  if rects[selected].parent = -1 then
  begin
    rects[selected].w := rects[selected].w + step;
    x := rects[selected].x + rects[selected].w;
    if selected <> rCount - 1 then
    begin
      for i := selected + 1 to rCount - 1 do if rects[i].parent = -1 then
      begin
        rects[i].x := x;
        x := x + rects[i].w;
      end;
    end;
  end  
  else
  begin
    rects[selected].percent := rects[selected].percent + 10;
    if rects[selected].percent > 100 then rects[selected].percent := 100;
    AlignPArents(rects[rects[selected].parent]);
  end;
  AlignParents(rects[selected]);
  Draw;
end;

procedure TfrmDesignColum.bLeftClick(Sender: TObject);
var
 i : integer;
 x : integer;
begin
  if rects[selected].parent = -1 then
  begin
    rects[selected].w := rects[selected].w - step;
    if rects[selected].w <= 0 then rects[selected].w := step;
    x := rects[selected].x + rects[selected].w;
    if selected <> rCount - 1 then
    begin
      for i := selected + 1 to rCount - 1 do if rects[i].parent = -1 then
      begin
        rects[i].x := x;
        x := x + rects[i].w;
      end;
    end;
  end
  else
  begin
    rects[selected].percent := rects[selected].percent - 10;
    if rects[selected].percent <= 0 then rects[selected].percent := 10;
    AlignPArents(rects[rects[selected].parent]);
  end;
  AlignPArents(rects[selected]);
  Draw;
end;

procedure TfrmDesignColum.GridDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  Draw;
end;

procedure TfrmDesignColum.cxTextEdit1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) and (ssCtrl in Shift) then
  begin
    rects[selected].text := cxTextEdit1.Text;
    cxTextEdit1.Hide;
    Action1.Enabled := true;
    Draw;
  end;
  if Key = VK_ESCAPE then
  begin
    Action1.Enabled := true;
    cxTextEdit1.Hide;
    Draw;
  end;
end;

procedure TfrmDesignColum.bDeleteClick(Sender: TObject);
begin
     DeleteRect(selected);
     Selected := -1;
     bDelete.Enabled := false;
     RecalcRootPositions;
     Draw;
end;

procedure TfrmDesignColum.DeleteRect(const index: integer);
var
 i, j : integer;
begin
  i := 0;
  while i < Length(rects) do if rects[i].parent = index then
  begin
    DeleteRect(i);
    i := 0;
  end else i := i + 1;
  if (Length(rects) >= 2) and (index <> Length(rects) - 1) then for i := index to Length(rects) - 2 do
  begin

    for j := 0 to rCount - 1 do if rects[j].parent = i then rects[j].parent := rects[j].parent - 1;
    rects[i] := rects[i + 1];
    rects[i].index := rects[i].index - 1; 
  end;
  SetLength(rects, rCount - 1);
end;

procedure TfrmDesignColum.RecalcRootPositions;
var
 i : integer;
 x : integer;
begin
 x := 32;
 for i := 0 to rCount - 1 do if rects[i].parent = -1 then
 begin
   rects[i].x := x;
   x := x + rects[i].w;
   AlignParents(rects[i]);
 end;  
end;

procedure TfrmDesignColum.LoadChild(id_colum,index_rec:Int64);
var
  select    : TpFIBDataSet;
  i         : Integer;
  curSelect : Integer;
begin
  select                                     := TpFIBDataSet.Create(self);
  select.Database                            := pFIBDatabase1;
  select.Transaction                         := ReadTransaction;
  select.SelectSQL.Text                      := 'select * from MON_SP_COLUMNS where id_form_code=:id_form_code and linkto=:ID_COLUMN and ID_COLUMN<>:ID_COLUMN';
  select.ParamByName('id_form_code').AsInt64 := id_form_code;
  select.ParamByName('ID_COLUMN').AsInt64 := id_colum;
  select.Active := True;
  select.FetchAll;

  curSelect := rCount - 1;

  pbMouseDown(Self, mbLeft, [], rects[curSelect].x + 1, rects[curSelect].y + 1);
  for i := 0 to select.RecordCount -1 do
    begin
      pbMouseDown(Self, mbLeft, [], rects[curSelect].x + 1, rects[curSelect].y + 1);
      AddRectChild(select.FieldByName('WIDTH_COLUM').AsInteger,
                   select.FieldByName('HEIGHT_COLUM').AsInteger,
                   select.FieldByName('PERCENT_COLUM').AsInteger,
                   selected,select.FieldByName('NAME_COLUMN').asVariant,
                   select.FieldByName('CODE').asVariant,
                   select.FieldByName('VISIBLE').asInteger);

      LoadChild(select.FieldByName('ID_COLUMN').asVariant,rects[i].index);
      select.Next;
    end;
  select.Active := False;
  select.Destroy;
end;

procedure TfrmDesignColum.AddRectParent(w,h,parent : Integer ;const text : string; code:integer;Vis:integer);
var
 x, i : integer;
begin
  x := 32;
  for i := 0 to rCount - 1 do if rects[i].parent = -1 then x := x + rects[i].w;
  AddRect(x, step * 2, w, h, -1, text, code, vis);
  pbMouseDown(Self, mbLeft, [], rects[rCount - 1].x + 1, rects[rCount - 1].y + 1);
  Draw;
end;

procedure TfrmDesignColum.AddRectChild(w,h,percent,parent : Integer ;const text : string; code:integer; Vis:integer);
begin
     if selected = -1 then exit;
     AddRect(20,20,0,h, parent, text, code, vis);
     rects[rCount -1].percent := percent;
     AlignToParent(rects[rCount -1]);
     Draw;
end;

procedure TfrmDesignColum.GridDBTableView1DblClick(Sender: TObject);
var
  select : TpFIBDataSet;
  i : Integer;
  code:Integer;
begin
     selected:=-1;
     if ((DataSet.RecordCount>0) and (PeriodsDataSet.RecordCount>0))
     then begin
            FCurrentDrawFormCode:=DataSet.FieldByName('NAME_FORM_CODE').AsString + 'за період '+PeriodsDataSet.FieldByName('DATE_BEG').AsString+' - '+PeriodsDataSet.FieldByName('DATE_END').AsString;

            rects := nil;
            Draw;

            select                                     := TpFIBDataSet.Create(self);
            select.Database                            := pFIBDatabase1;
            select.Transaction                         := ReadTransaction;
            select.SelectSQL.Text                      := 'select * from MON_SP_COLUMNS where id_form_code=:id_form_code and linkto=id_column and id_period='+PeriodsDataSet.FieldByName('ID_PERIOD').AsString;
            select.ParamByName('id_form_code').AsInt64 := id_form_code;

            select.Active := True;
            select.FetchAll;

            for i := 0 to select.RecordCount -1 do
            begin
                 if select.FieldByName('CODE').asVariant<>NULL
                 then code:=select.FieldByName('CODE').asVariant
                 else  code:=0;

                 AddRectParent(select.FieldByName('WIDTH_COLUM').AsInteger,
                               select.FieldByName('HEIGHT_COLUM').AsInteger,
                               -1,
                               select.FieldByName('NAME_COLUMN').asVariant,
                               code,
                               select.FieldByName('Visible').asInteger);

                 LoadChild(select.FieldByName('ID_COLUMN').asVariant,rects[i].index);
                 select.Next;
            end;

            select.Active := False;
            select.Destroy;
     end
     else begin
               FCurrentDrawFormCode:='';
     end
end;

procedure TfrmDesignColum.ActionClonExecute(Sender: TObject);
var
  Clon  : TfrmDesignClon;
  new_f : int64;
begin
  Clon  := TfrmDesignClon.Create(self);
  new_f := Clon.GetNewReport;
  if new_f > -1 then
    begin
      id_form_code := new_f;
      dxBarLargeButtonSaveClick(Self);      
    end;

  Clon.Free;
end;

procedure TfrmDesignColum.cxButton1Click(Sender: TObject);
var T:TfrmGetPeriod;
    InsertSP:TpFIBStoredProc;
    id:Int64;
begin
     if (DataSet.RecordCount>0)
     then begin
               T:=TfrmGetPeriod.Create(self);
               if T.ShowModal=mrYes
               then begin
                         InsertSP:=TpFIBStoredProc.Create(self);
                         InsertSP.Database:=pFIBDatabase1;
                         InsertSP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='MON_SP_COLUMNS_PERIODS_INSERT';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_FORM_CODE').Value:=DataSet.FieldByName('ID_FORM_CODE').Value;
                         InsertSP.ParamByName('DATE_BEG').Value    :=T.cxDateEditBeg.EditValue;
                         InsertSP.ParamByName('DATE_END').Value    :=T.cxDateEditEnd.EditValue;
                         InsertSP.ExecProc;
                         id:=InsertSP.ParamByName('ID_PERIOD').AsInt64;
                         WriteTransaction.Commit;
                         Grid.BeginUpdate;
                         PeriodsDataSet.CloseOpen(true);
                         PeriodsDataSet.Locate('id_period',id,[]);
                         Grid.EndUpdate;
                         InsertSP.Close;
                         InsertSP.Free;
               end;
               T.Free;
     end;
end;

procedure TfrmDesignColum.cxButton3Click(Sender: TObject);
  var T:TfrmGetPeriod;
    InsertSP:TpFIBStoredProc;
    id:Int64;
begin
     if (DataSet.RecordCount>0)
     then begin
               if (PeriodsDataSet.RecordCount>0)
               then begin
                         T:=TfrmGetPeriod.Create(self);
                         T.cxDateEditBeg.EditValue:=PeriodsDataSet.FieldByName('DATE_BEG').Value;
                         T.cxDateEditEnd.EditValue:=PeriodsDataSet.FieldByName('DATE_END').Value;

                         if T.ShowModal=mrYes
                         then begin
                                   InsertSP:=TpFIBStoredProc.Create(self);
                                   InsertSP.Database:=pFIBDatabase1;
                                   InsertSP.Transaction:=WriteTransaction;
                                   WriteTransaction.StartTransaction;
                                   InsertSP.StoredProcName:='MON_SP_COLUMNS_PERIODS_UPDATE';
                                   InsertSP.Prepare;
                                   id:=PeriodsDataSet.FieldByName('ID_PERIOD').Value;
                                   InsertSP.ParamByName('ID_PERIOD').Value   :=PeriodsDataSet.FieldByName('ID_PERIOD').Value;
                                   InsertSP.ParamByName('ID_FORM_CODE').Value:=DataSet.FieldByName('ID_FORM_CODE').Value;
                                   InsertSP.ParamByName('DATE_BEG').Value    :=T.cxDateEditBeg.EditValue;
                                   InsertSP.ParamByName('DATE_END').Value    :=T.cxDateEditEnd.EditValue;
                                   InsertSP.ExecProc;

                                   WriteTransaction.Commit;
                                   Grid.BeginUpdate;
                                   PeriodsDataSet.CloseOpen(true);
                                   PeriodsDataSet.Locate('id_period',id,[]);
                                   Grid.EndUpdate;
                                   InsertSP.Close;
                                   InsertSP.Free;
                         end;
                         T.Free;
               end;
     end;
end;

procedure TfrmDesignColum.cxButton2Click(Sender: TObject);
var InsertSP:TpFIBStoredProc;
begin
     if (PeriodsDataSet.RecordCount>0)
     then begin
               InsertSP:=TpFIBStoredProc.Create(self);
               InsertSP.Database:=pFIBDatabase1;
               InsertSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='MON_SP_COLUMNS_PERIODS_DELETE';
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_PERIOD').Value   :=PeriodsDataSet.FieldByName('ID_PERIOD').Value;
               InsertSP.ExecProc;
               WriteTransaction.Commit;
               Grid.BeginUpdate;
               PeriodsDataSet.CloseOpen(true);
               Grid.EndUpdate;
               InsertSP.Close;
               InsertSP.Free;
     end;
end;

procedure TfrmDesignColum.pbMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
     if (selected>-1)
     then begin
               if inRect(X,Y, Rects[selected])
               then begin
                         pb.PopupMenu:=PopupMenu1;
               end
               else begin
                         pb.PopupMenu:=nil;
               end;
     end
     else pb.PopupMenu:=nil;
end;

procedure TfrmDesignColum.PopupMenu1Popup(Sender: TObject);
begin
      if (selected>-1)
      then begin
                if (Rects[selected].visible=1)
                then begin
                          PopupMenu1.Items[0].Caption:='Не друкувати в звіті';
                          PopupMenu1.Items[0].Tag:=1;
                end
                else begin
                          PopupMenu1.Items[0].Caption:='Друкувати в звіті';
                          PopupMenu1.Items[0].Tag:=0;
                end;
      end;
end;

procedure TfrmDesignColum.N1Click(Sender: TObject);
begin
     if (selected>-1)
     then begin
               Rects[selected].visible:=1-PopupMenu1.Items[0].Tag;
               Draw;
     end;
end;

procedure TfrmDesignColum.N2Click(Sender: TObject);
begin
     if (selected>-1)
     then begin
               Rects[selected].code:=StrToInt(InputBox('Увага!','Треба ввести код стовбця.',IntToStr(Rects[selected].code)));
               Draw;
     end;
end;

end.

