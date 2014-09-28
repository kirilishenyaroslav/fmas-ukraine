unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FIBDatabase, pFIBDatabase, uMonuLoader, dxBar,
  dxBarExtItems, AArray, LoaderUnit, IniFiles, cxControls, cxContainer,
  cxEdit, cxLabel, ImgList, ExtCtrls, cxGraphics, dxStatusBar;

type
  TfrmMain = class(TForm)
    Database: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    dxBarManager1: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    LargeImageList: TImageList;
    LargeImageListDis: TImageList;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    Image1: TImage;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    Panel1: TPanel;
    PaintBox1: TPaintBox;
    dxBarButtonDate: TdxBarButton;
    dxStatusBar1: TdxStatusBar;
    ImageList1: TImageList;
    lbSystem: TLabel;
    Image2: TImage;
    dxBarLargeButton8: TdxBarLargeButton;
    dxBarLargeButton9: TdxBarLargeButton;
    dxBarLargeButton10: TdxBarLargeButton;
    dxBarLargeButton11: TdxBarLargeButton;
    dxBarLargeButtonPrint: TdxBarLargeButton;
    dxBarLargeButton12: TdxBarLargeButton;
    dxBarLargeButton13: TdxBarLargeButton;
    dxBarLargeButton14: TdxBarLargeButton;
    dxBarLargeButton15: TdxBarLargeButton;
    dxBarSubItem4: TdxBarSubItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
    procedure dxBarLargeButton5Click(Sender: TObject);
    procedure dxBarLargeButton6Click(Sender: TObject);
    procedure dxBarLargeButton7Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure dxBarLargeButton8Click(Sender: TObject);
    procedure dxBarLargeButton9Click(Sender: TObject);
    procedure dxBarLargeButton10Click(Sender: TObject);
    procedure dxBarLargeButton11Click(Sender: TObject);
    procedure dxBarLargeButtonPrintClick(Sender: TObject);
    procedure dxBarLargeButton12Click(Sender: TObject);
    procedure dxBarLargeButton13Click(Sender: TObject);
    procedure dxBarLargeButton14Click(Sender: TObject);
    procedure dxBarLargeButton15Click(Sender: TObject);
  private
    bmp : TBitmap;
  public
    procedure ShowSprav(const spr_file : string; const isTree : boolean = false);
    procedure WMMDICREATE(var msg : TMessage); message wm_mdicreate;
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Database.Handle := MON_DB_HANDLE;
  ReadTransaction.StartTransaction;
  LoadMonuData(ReadTransaction);
  dxStatusBar1.Panels[0].Text := MON_USER;
  dxStatusBar1.Panels[1].Text := MON_DP_PATH;
  lbSystem.Caption := SYS_NAME;

  //ShortTimeFormat := 'HH:mm:ss';
  //  LongTimeFormat := 'HH:mm:ss';
  //  LongDateFormat :=   'dd.mm.YYYY HH:mm:ss';

  if MON_USE_LOGOFF_SCR then
  begin
    bmp := TBitmap.Create;
    bmp.Width := Screen.Width;
    bmp.Height := Screen.Height;
    bmp.PixelFormat := pf32bit;
  end;

  dxBarButtonDate.Caption := FormatDateTime('dd mmmm yyyyр.', date);
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  if MON_USE_LOGOFF_SCR then bmp.Free;
  ReadTransaction.Commit;
  Database.Connected := false;
end;

procedure TfrmMain.dxBarButton3Click(Sender: TObject);
var
 rec : TRect;
 x, y : integer;
 p : PByteArray;
 r, g, b : integer;
 w, h : integer;
begin
  if MON_USE_LOGOFF_SCR then
  begin
    Panel1.Align := alClient;
    Panel1.Realign;
    dxBarManager1.HideAll;
    rec := image1.BoundsRect;{ClientRect};
    rec.TopLeft := ClientToScreen(rec.TopLeft);
    rec.BottomRight := ClientToScreen(rec.BottomRight);
    BitBlt(bmp.Canvas.Handle, 0, 0, rec.Right - rec.Left, rec.Bottom - rec.Top, GetDC(GetDesktopWindow), rec.left, rec.top, SRCCopy);
    w := rec.Right - rec.Left;
    h := rec.Bottom - rec.Top;
    for y := 0 to h - 1 do
    begin
      p := bmp.ScanLine[y];
      for x := 0 to w - 1 do
      begin
        r := p[x * 4];
        g := p[x * 4 + 1];
        b := p[x * 4 + 2];
        r := (r + g + b) div 3;
        p[x * 4] := r;
        p[x * 4 + 1] := r;
        p[x * 4 + 2] := r;
      end;
    end;
    Panel1.Visible := true;
//    dxBarManager1.Bars[0].Visible := false;
//    dxBarManager1.Bars[1].Visible := false;
    PaintBox1.Repaint;
  end;
  if ShowMessageYN('Ви дійсно бажаєте вийти?') = mrYes then Close;
  Panel1.Visible := false;
//  dxBarManager1.Bars[1].Visible := true;
//  dxBarManager1.Bars[0].Visible := true;
end;

procedure TfrmMain.dxBarLargeButton2Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['ImportForm'].AsVariant := 1;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'monu\MonuImport.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.ShowSprav(const spr_file: string; const isTree : boolean = false);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i.LoadFromFile(ExtractFilePath(Application.ExeName) + 'monu\sprav\' + spr_file, 'Main');
  if isTree then LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o)
            else LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivLinear.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButton3Click(Sender: TObject);
begin
  ShowSprav('mon_sp_type_org.spr');
end;

procedure TfrmMain.dxBarLargeButton4Click(Sender: TObject);
begin
  ShowSprav('mon_sp_form_code.spr');
end;

procedure TfrmMain.dxBarLargeButton5Click(Sender: TObject);
begin
  ShowSprav('mon_sp_type_form.spr');
end;

procedure TfrmMain.dxBarLargeButton1Click(Sender: TObject);
begin
  ShowSprav('mon_sp_kvk.spr', true);
end;
   
procedure TfrmMain.dxBarLargeButton6Click(Sender: TObject);
begin
  ShowSprav('mon_sp_program.spr', true);
end;

procedure TfrmMain.dxBarLargeButton7Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['ImportForm'].AsVariant := 2;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'monu\MonuImport.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.WMMDICREATE(var msg: TMessage);
//var
// ms : ^tagMDICREATESTRUCTA;
begin
// integer(ms) := msg.LParam;
// ms^.style := WS_MAXIMIZE;
end;

procedure TfrmMain.PaintBox1Paint(Sender: TObject);
begin
 if MON_USE_LOGOFF_SCR then PaintBox1.Canvas.Draw(0, 0, bmp);
end;

procedure TfrmMain.dxBarLargeButton8Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  i['Caption'].AsString := 'Дизайнер форм';
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\MonuDesignColum.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButton9Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\ImportStatistics.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButton10Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\NotImport.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButton11Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\Organizations.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButtonPrintClick(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  i['Caption'].AsString := 'Отчеты';
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\MonuViewReport.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButton12Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['ImportForm'].AsVariant := 3;
  LoadSprav(ExtractFilePath(Application.ExeName) + 'monu\MonuImport.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButton13Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  i['Caption'].AsString := 'Отчеты';
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\MonuVewReportSV.bpl', i, o);
  i.Free;
  o.Free;
end;


procedure TfrmMain.dxBarLargeButton14Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  i['Caption'].AsString := 'Отчеты';
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\MonuReport1.bpl', i, o);
  i.Free;
  o.Free;
end;

procedure TfrmMain.dxBarLargeButton15Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['DBHandle'].AsInteger := integer(Database.Handle);
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsMDIChild;
  i['Caption'].AsString := 'Отчеты';
  LoadSprav(ExtractFilePath(Application.ExeName) + 'Monu\MonuReportAccepted.bpl', i, o);
  i.Free;
  o.Free;
end;

end.

