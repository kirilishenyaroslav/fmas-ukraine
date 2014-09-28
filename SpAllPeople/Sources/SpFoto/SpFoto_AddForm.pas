unit SpFoto_AddForm;
{ Нужны:
     - ширина;
     - высота;
     - кол-во пикселей на см по Х;  \  чтобы получить размер
     - кол-во пикселей на см по У;  /  в см для печати
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxSplitter, ExtCtrls, cxControls, cxContainer, cxEdit, cxImage,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxShellDlgs, IBase,
  cxShellBrowserDialog, DB, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, ExtDlgs, FIBQuery, pFIBQuery, pFIBStoredProc, FIBMiscellaneous,
  SpFoto_ZMessages, cxTextEdit, cxMaskEdit, cxSpinEdit, SpFoto_Classes,
  cxLabel, cxCheckBox, SpFoto_ImgSize, SpFoto_JpegInfo, Jpeg,
  cxDropDownEdit, cxCalendar, IniFiles, uPwdDecrypt;

const cScale=1.5;

type
  TfmAddFoto = class(TForm)
    SourcePanel: TPanel;
    MainPanel: TPanel;
    ResultPanel: TPanel;
    ToolsPanel: TPanel;
    OpenBtn: TcxButton;
    SaveBtn: TcxButton;
    DB: TpFIBDatabase;
    DSet1: TpFIBDataSet;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    DSource1: TDataSource;
    OpenDialog: TOpenPictureDialog;
    StoredProc: TpFIBStoredProc;
    DSet1ID_FOTO: TFIBIntegerField;
    DSet1ID_MAN: TFIBIntegerField;
    DSet1FOTO: TFIBBlobField;
    DSet1DATE_FOTO: TFIBDateField;
    DSet1DATE_BEG: TFIBDateField;
    DSet1DATE_END: TFIBDateField;
    MEActualWidth: TcxMaskEdit;
    MEActualHeight: TcxMaskEdit;
    cxLabel2: TcxLabel;
    LblActual: TcxLabel;
    ActualSizeBtn: TcxButton;
    FitBtn: TcxButton;
    ResultImage: TImage;
    ScrollBox1: TScrollBox;
    ExitBtn: TcxButton;
    cxLabel3: TcxLabel;
    FotoDE: TcxDateEdit;
    AdjustBtn: TcxButton;
    ActualSizePanel: TPanel;
    MainDB: TpFIBDatabase;
    MainTrans: TpFIBTransaction;
    MainStorProc: TpFIBStoredProc;
    procedure OpenBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure ActualSizeBtnClick(Sender: TObject);
    procedure FitBtnClick(Sender: TObject);
    procedure SourcePanelResize(Sender: TObject);
    procedure SourcePanelEnter(Sender: TObject);
    procedure ScrollBox1MouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AdjustBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    pIdMan:Integer;
    pJpegConvector:TJPEGImage;

//    pFrame:TFotoFrame;
    SourceImage:TSelectImage;
    pFrameObject:TFrameObject;

    pFirstTime:Boolean;
    pOnceOpened:Boolean;
    procedure AdjustFrame(pX,Py:Word);
  public

    { Public declarations }
    sFile : TFileName;
    constructor Create(AOwner:TComponent;MDB_HANDLE, ADB_HANDLE:TISC_DB_HANDLE;AIdMan:Integer=-1);reintroduce;
  end;

implementation

uses cxGraphics;

{$R *.dfm}

constructor TfmAddFoto.Create(AOwner:TComponent;MDB_HANDLE, ADB_HANDLE:TISC_DB_HANDLE;AIdMan:Integer=-1);
var DB_PATH, DB_SERVER, DB_USER, DB_PASS, DB_CHARSET, DB_SQLD:String;
begin
  inherited Create(AOwner);
  DB.Handle:=ADB_HANDLE;
  ReadTransaction.Active:=True;
  MainDB.Handle:=MDB_HANDLE;
//******************************************************************************
  pIdMan:=AIdMan;

  pFirstTime:=True;
  pOnceOpened:=False;
{  SourceImage:=TSelectImage.Create(ScrollBox1,ResultImage,clRed,clBlue);
  SourceImage.Align:=alClient;
  SourceImage.Properties.Stretch:=True;
  SourceImage.Show;

  lFrameRect.Left:=20;
  lFrameRect.Top:=20;
  lFrameRect.Right:=100;
  lFrameRect.Bottom:=100;
  pFrameObject:=TFrameObject.Create(SourceImage,lFrameRect);

  pJpegConvector:=TJPEGImage.Create;

  OpenBtnClick(Self);}
{  pFrame:=TFotoFrame.Create(Self,SourceImage,100,100,200,200);
  pFrame.Show;  }
end;

procedure TfmAddFoto.OpenBtnClick(Sender: TObject);
var pX,pY:Word;
  pTimer:TTimer;
begin
  Refresh;
  if not OpenDialog.Execute then
   begin
    if not pOnceOpened then
     begin
      pTimer:=TTimer.Create(Self);
      pTimer.OnTimer:=ExitBtnClick;
      pTimer.Interval:=10;
     end;
    Exit;
   end;
  pOnceOpened:=True;
  Refresh;
  SourceImage.Picture.LoadFromFile(OpenDialog.FileName);
  sFile := OpenDialog.FileName;
  GetJPGSize(OpenDialog.FileName,px,py);
  MEActualWidth.EditValue:=pX;
  MEActualHeight.EditValue:=pY;
  FotoDE.EditValue:=FileDateToDateTime(FileAge(OpenDialog.FileName));
  AdjustFrame(pX,pY);

end;

procedure TfmAddFoto.SaveBtnClick(Sender: TObject);
var pIdFoto:Integer;
    S: TMemoryStream;
    S1: TMemoryStream;
    pJpegConvectorFull: TJPEGImage;
begin
  pJpegConvector.Assign(ResultImage.Picture.Bitmap);  // pJpegConvector:TJPEGImage
  pJpegConvectorFull := TJPEGImage.Create;
  pJpegConvectorFull.CompressionQuality := 100;
  pJpegConvectorFull.Assign(SourceImage.Picture.Bitmap);
  try
    StoredProc.StoredProcName:='FOTO_MAIN_I'; // Процедура вставки записи в таблицу
    StoredProc.Transaction.StartTransaction;
    StoredProc.Prepare;
    StoredProc.ParamByName('ID_MAN').AsInteger:=pIdMan;
    StoredProc.ParamByName('DATE_FOTO').AsDate:=FotoDE.Date;
    S  :=TMemoryStream.Create;            // создаем
    S1 :=TMemoryStream.Create;            // создаем
    pJpegConvector.SaveToStream(S);     // сохраняем
    pJpegConvectorFull.SaveToStream(S1);
    StoredProc.ParamByName('FOTO_ICON').LoadFromStream(S);   // загружаем в BLOB-поле процедры из потока
    StoredProc.ParamByName('FOTO').LoadFromFile(Sfile);   // загружаем в BLOB-поле процедры из потока
    StoredProc.ParamByName('ACTUALWIDTH').AsInteger := MEActualWidth.EditValue;
    StoredProc.ParamByName('ACTUALHEIGHT').AsInteger := MEActualHeight.EditValue;
    StoredProc.ExecProc;                                // выполняем
    pIdFoto:=StoredProc.ParamByName('ID_FOTO').AsInteger;
    S.Free;                                             // освобождаем
    S1.Free;                                             // освобождаем
    MainStorProc.StoredProcName:='UP_DT_CERT_MAN_FOTO_I_D';
    MainStorProc.Transaction.StartTransaction;
    MainStorProc.Prepare;
    MainStorProc.ParamByName('ID_FOTO').AsInt64:=pIdFoto;
    MainStorProc.ParamByName('ID_MAN').AsInt64:=pIdMan;
    MainStorProc.ParamByName('DATE_BEG').AsDate:=FotoDE.Date;
    MainStorProc.ParamByName('IS_INSERT').AsInteger:=1;
    MainStorProc.ExecProc;
    StoredProc.Transaction.Commit;
    MainStorProc.Transaction.Commit;
    ExitBtnClick(Self);
    except on E:Exception do
    begin
      StoredProc.Transaction.Rollback;
      MainStorProc.Transaction.Rollback;
      S.Free;
      S1.Free;                                             // освобождаем
      ZShowMessage('Помилка',E.Message,mtError,[mbOK]);
    end;
  end;
end;

procedure TfmAddFoto.ActualSizeBtnClick(Sender: TObject);
begin
  SourceImage.ShowActualSize;
  ScrollBox1.HorzScrollBar.Range:=SourceImage.Width;
  ScrollBox1.HorzScrollBar.Visible:=True;
  ScrollBox1.VertScrollBar.Range:=SourceImage.Height;
  ScrollBox1.VertScrollBar.Visible:=True;
end;

procedure TfmAddFoto.FitBtnClick(Sender: TObject);
begin
  ScrollBox1.HorzScrollBar.Range:=ScrollBox1.Width;
  ScrollBox1.VertScrollBar.Range:=ScrollBox1.Height;
  ScrollBox1.HorzScrollBar.Visible:=False;
  ScrollBox1.VertScrollBar.Visible:=False;
  SourceImage.FitOnParent;
end;

procedure TfmAddFoto.SourcePanelResize(Sender: TObject);
begin
 // SourceImage.Proportional:=False;
end;

procedure TfmAddFoto.SourcePanelEnter(Sender: TObject);
begin
 // SourceImage.Proportional:=True;

end;

procedure TfmAddFoto.ScrollBox1MouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if Shift=[ssCtrl] then
    begin
      SourceImage.SizeMinus;
      if ScrollBox1.HorzScrollBar.Visible then
        ScrollBox1.HorzScrollBar.Range:=SourceImage.Width
      else
        ScrollBox1.HorzScrollBar.Range:=0;
      if ScrollBox1.VertScrollBar.Visible then
        ScrollBox1.VertScrollBar.Range:=SourceImage.Height
      else
        ScrollBox1.VertScrollBar.Range:=0;
    end;
end;

procedure TfmAddFoto.ExitBtnClick(Sender: TObject);
begin
// Может быть вызвано таймером, потому пробуем его убрать
  if Sender is TTimer then
    TTimer(Sender).Free;
//******************************************************************************
  Close;
end;

procedure TfmAddFoto.FormShow(Sender: TObject);
var lFrameRect:TRect;
begin
  SourceImage:=TSelectImage.Create(ScrollBox1,ResultImage,clRed,clBlue);
  SourceImage.Align:=alClient;
  SourceImage.Properties.Stretch:=True;
  SourceImage.Show;

  lFrameRect.Left:=0;
  lFrameRect.Top:=0;
  lFrameRect.Right:=SourceImage.Width;
  lFrameRect.Bottom:=SourceImage.Height;
  pFrameObject:=TFrameObject.Create(SourceImage,lFrameRect);

  pJpegConvector:=TJPEGImage.Create;
end;

procedure TfmAddFoto.FormActivate(Sender: TObject);
begin
  if not pFirstTime then Exit;
  pFirstTime:=False;
  pFrameObject.DrawRect;
  OpenBtnClick(Self);
end;

procedure TfmAddFoto.AdjustFrame(pX,Py:Word);
var x,y,x1,x2,y1,y2:Integer;
begin
  x:=SourceImage.Width-2*SourceImage.pBorderWidth;
  y:=SourceImage.Height-2*SourceImage.pBorderWidth;

  if X/pX<Y/pY then
    begin
      x:=SourceImage.Width-2*SourceImage.pBorderWidth;
      y:=Round(pY*x/pX);
      x1:=SourceImage.pBorderWidth;
      x2:=SourceImage.Width-SourceImage.pBorderWidth;
      y1:=(SourceImage.Height+2-y) div 2;
      y2:=(SourceImage.Height-2+y) div 2;
    end
  else
    begin
      y:=SourceImage.Height-2*SourceImage.pBorderWidth;
      x:=Round(pX*y/pY);
      y1:=SourceImage.pBorderWidth;
      y2:=SourceImage.Height-SourceImage.pBorderWidth;
      x1:=(SourceImage.Width+2-x) div 2;
      x2:=(SourceImage.Width-2+x) div 2;
    end;
    Refresh;
  pFrameObject.SelectRect(x1,y1,x2,y2);
end;

procedure TfmAddFoto.AdjustBtnClick(Sender: TObject);
begin
  AdjustFrame(MEActualWidth.EditValue,MEActualHeight.EditValue);
end;

procedure TfmAddFoto.FormClose(Sender: TObject; var Action: TCloseAction);
var i:Integer;
begin
  pFrameObject.Free;
  SourceImage.Free;
  pJpegConvector.Free;
  if MainTrans.Active then MainTrans.Rollback;
  for i:=0 to MainDB.ActiveTransactionCount-1 do
      MainDB.Transactions[i].Active:=False;
end;

end.
