unit MainTwain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cn_Common_Funcs,cn_Common_Types, cnConsts, cn_DM_Twain, ibase,
  cxLookAndFeelPainters, cxButtons, DB, frxDesgn, frxClass, mcmDragDrop,
  mcmSTI, ImgList, mcmFileDialogues, Menus, ComCtrls, mcmTWAINKernel,
  mcmTWAINIntf, mcmTWAIN, umcmIntE, ToolWin, mcmImage, mcmImageFile, mcmImageTypeDef,
  mcmImageDB, mcmImageResStr, mcmPrinter, mcmImageTransform, ActnList,
  inifiles, uPwdDecrypt, cxGraphics, cxControls, dxStatusBar, cn_Common_Messages, cnConsts_Messages;

type
  TfrmTwain = class(TForm)
    ToolBar: TToolBar;
    tbNew: TToolButton;
    tbOpen: TToolButton;
    btnSave: TToolButton;
    btnRotate90: TToolButton;
    tbPrintPreview: TToolButton;
    tbSelect: TToolButton;
    tbScan: TToolButton;
    ToolButton10: TToolButton;
    lZoom: TLabel;
    tbFitInWindow: TToolButton;
    MenuImageList: TImageList;
    lblNumPLabel: TLabel;
    db_imgPicture: TmcmImageDB;
    mcmTWAIN: TmcmTWAIN;
    btn1: TToolButton;
    pmPopMenu: TPopupMenu;
    ShowUIItem: TMenuItem;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    btn6: TToolButton;
    mcmntspnNumPageSpin: TmcmIntSpin;
    btnSaveNumPage: TToolButton;
    btn7: TToolButton;
    btnClose: TToolButton;
    btn8: TToolButton;
    lNoImages: TLabel;
    actlst1: TActionList;
    actClose: TAction;
    dxstsbr1: TdxStatusBar;
    actTwain: TAction;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    NewItem: TMenuItem;
    OpenItem: TMenuItem;
    SaveItem: TMenuItem;
    AppendItem: TMenuItem;
    BrowseItem: TMenuItem;
    N1: TMenuItem;
    AcquireItem: TMenuItem;
    SourceItem: TMenuItem;
    N2: TMenuItem;
    PrintItem: TMenuItem;
    PrintPreviewItem: TMenuItem;
    PrinterSetupItem: TMenuItem;
    N3: TMenuItem;
    PreferencesItem: TMenuItem;
    AssociatefileItem: TMenuItem;
    N8: TMenuItem;
    ExitItem: TMenuItem;
    EditMenu: TMenuItem;
    CopyItem: TMenuItem;
    CopySectionItem: TMenuItem;
    PasteItem: TMenuItem;
    PasteNewImageItem: TMenuItem;
    PasteAsSectionItem: TMenuItem;
    DuplicateItem: TMenuItem;
    EmptyClipboardItem: TMenuItem;
    ImageMenu: TMenuItem;
    InformationItem: TMenuItem;
    CanvasSizeItem: TMenuItem;
    N9: TMenuItem;
    TransparentViewItem: TMenuItem;
    ColorMenu: TMenuItem;
    UsedColorsItem: TMenuItem;
    PaletteMenu: TMenuItem;
    EditPaletteItem: TMenuItem;
    InvertPaletteItem: TMenuItem;
    InvertItem: TMenuItem;
    ThresholdItem: TMenuItem;
    TuneMenu: TMenuItem;
    BrightnessContrastItem: TMenuItem;
    GammaCorrectionItem: TMenuItem;
    N4: TMenuItem;
    ConvertToMenu: TMenuItem;
    GreyScaleItem: TMenuItem;
    GreyToBayerItem: TMenuItem;
    OddOddItem: TMenuItem;
    OddEvenItem: TMenuItem;
    EvenOddItem: TMenuItem;
    EvenEvenItem: TMenuItem;
    N5: TMenuItem;
    DecColorDepthMenu: TMenuItem;
    InclWindowsPalItem: TMenuItem;
    Dec2Colors: TMenuItem;
    Dec16Colors: TMenuItem;
    Dec256Colors: TMenuItem;
    Dec32KColors: TMenuItem;
    Dec24MColors: TMenuItem;
    IncColorDepthMenu: TMenuItem;
    Inc16Colors: TMenuItem;
    Inc256Colors: TMenuItem;
    Inc32KColors: TMenuItem;
    Inc16MillColors: TMenuItem;
    Inc16MillColors32: TMenuItem;
    N6: TMenuItem;
    SplitColorMenu: TMenuItem;
    CIEMenu: TMenuItem;
    CIEXD65Item: TMenuItem;
    CIEYD65Item: TMenuItem;
    CIEZD65Item: TMenuItem;
    CMYKMenu: TMenuItem;
    CyanItem: TMenuItem;
    MagentaItem: TMenuItem;
    YellowItem: TMenuItem;
    BlackItem: TMenuItem;
    HSVMenu: TMenuItem;
    HueItem: TMenuItem;
    SaturationItem: TMenuItem;
    ValueItem: TMenuItem;
    RGBMenu: TMenuItem;
    RedItem: TMenuItem;
    GreenItem: TMenuItem;
    BlueItem: TMenuItem;
    AlphaItem: TMenuItem;
    YCbCrMenu: TMenuItem;
    YChannelItem: TMenuItem;
    CbChannelItem: TMenuItem;
    CrChannelItem: TMenuItem;
    YIQMenu: TMenuItem;
    NTSCYItem: TMenuItem;
    IChannelItem: TMenuItem;
    QChannelItem: TMenuItem;
    YUVMenu: TMenuItem;
    PALYItem: TMenuItem;
    UChannelItem: TMenuItem;
    VChannelItem: TMenuItem;
    CombineColorMenu: TMenuItem;
    CombineCIEItem: TMenuItem;
    CombineCMYKItem: TMenuItem;
    CombineHSVItem: TMenuItem;
    CombineRGBItem: TMenuItem;
    CombineYCbCrItem: TMenuItem;
    CombineYIQCItem: TMenuItem;
    CombineYUVItem: TMenuItem;
    HistogramMenu: TMenuItem;
    HistogramItem: TMenuItem;
    EqualizeItem: TMenuItem;
    EqualizeLumItem: TMenuItem;
    StretchColorItem: TMenuItem;
    FilterMenu: TMenuItem;
    FilterBrowser: TMenuItem;
    SmoothingMenu: TMenuItem;
    AverageItem: TMenuItem;
    AverageHeavyItem: TMenuItem;
    BlurItem: TMenuItem;
    BlurHeavyItem: TMenuItem;
    GaussBlurItem: TMenuItem;
    SmoothItem: TMenuItem;
    SmoothCircluarItem: TMenuItem;
    SmoothConeItem: TMenuItem;
    SmoothPyramidalItem: TMenuItem;
    SharpeningMenu: TMenuItem;
    EdgeItem: TMenuItem;
    EdgePrewittItem: TMenuItem;
    HighpassItem: TMenuItem;
    LaplacianItem: TMenuItem;
    PrewittNWItem: TMenuItem;
    PrewittSEItem: TMenuItem;
    SharpenItem: TMenuItem;
    SharpenheavyItem: TMenuItem;
    SobelNWItem: TMenuItem;
    SobelSEItem: TMenuItem;
    UnsharpMaskItem: TMenuItem;
    SpecialMenu: TMenuItem;
    DegrainItem: TMenuItem;
    EmbossItem: TMenuItem;
    MaximumItem: TMenuItem;
    MaxMinItem: TMenuItem;
    MedianItem: TMenuItem;
    MinimumItem: TMenuItem;
    MosaicItem: TMenuItem;
    LineMaskHorzItem: TMenuItem;
    LineMaskVertItem: TMenuItem;
    EdgeMenu: TMenuItem;
    MarrHildreth: TMenuItem;
    Canny: TMenuItem;
    ShenCastan: TMenuItem;
    DocumentMenu: TMenuItem;
    DespecklelightItem: TMenuItem;
    DespeckleItem: TMenuItem;
    DespeckleAltItem: TMenuItem;
    UserDefFilterItem: TMenuItem;
    TransformMenu: TMenuItem;
    AffineItem: TMenuItem;
    StretchItem: TMenuItem;
    FlipItem: TMenuItem;
    MirrorItem: TMenuItem;
    RotateItem: TMenuItem;
    RotateFixItem: TMenuItem;
    Rotate180Item: TMenuItem;
    Rotate270Item: TMenuItem;
    DeskewItem: TMenuItem;
    MathMenu: TMenuItem;
    MorphingMenu: TMenuItem;
    MorphWizardItem: TMenuItem;
    N7: TMenuItem;
    CloseMorphItem: TMenuItem;
    DilateMorphItem: TMenuItem;
    ErodeMorphItem: TMenuItem;
    OpenMorphItem: TMenuItem;
    OutlineMorhpItem: TMenuItem;
    EDMItem: TMenuItem;
    WindowsMenu: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    CloseAllItem: TMenuItem;
    HelpMenu: TMenuItem;
    AboutItem: TMenuItem;
    HelpItem: TMenuItem;
    mcmOpenDialog: TmcmOpenDialog;
    mcmSaveDialog: TmcmSaveDialog;
    rsZoom: TmcmRealSpin;
    procedure FormDestroy(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure tbSelectClick(Sender: TObject);
    procedure tbScanClick(Sender: TObject);
    procedure mcmTWAINImageReady(Sender: TObject; pBmp: Pointer;
      pBmpInfo: PBitmapInfo; hImage: HBITMAP; FilePath: String);
    procedure tbFitInWindowClick(Sender: TObject);
    procedure rsZoomChange(Sender: TObject);
    procedure tbPrintPreviewClick(Sender: TObject);
    procedure ShowUIItemClick(Sender: TObject);
    procedure tbNewClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btnSaveNumPageClick(Sender: TObject);
    procedure tbOpenClick(Sender: TObject);
    procedure btnRotate90Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actTwainExecute(Sender: TObject);
    procedure OpenItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SaveItemClick(Sender: TObject);
  private
    FScale           : double;  // Zoom factor of the active image window.
    PLanguageIndex: byte;
    DM:TDM_Twain;
    ID_DOG_twain : Int64;
    FImageIndex      : cardinal; // Number of created images
    procedure FormIniLanguage;
    procedure ReadIniFileImage; 
  public
    res:Variant;
    constructor  Create(InParams: TcnSimpleParamsEx);reintroduce;
    procedure    DataSetAfterOpen(DataSet: TDataSet);
    procedure    DataSetAfterScroll(DataSet: TDataSet);
  end;

var
  frmTwain: TfrmTwain;

implementation

uses FIBQuery, FIBDataSet, cnFormPrintPreview;


const
  PicRoot = 'Contracts\ScanPictures\';

{$R *.dfm}


procedure TfrmTwain.ReadIniFileImage;
  var
   IniFile : TIniFile;
   INI_FILENAME, APP_PATH,DB_PATH, DB_SERVER, DB_USER, DB_PASSWORD : string;
  begin
    INI_FILENAME:='config.ini';
    APP_PATH := ExtractFileDir(Application.ExeName) + '\';

        IniFile          := TIniFile.Create(APP_PATH + INI_FILENAME);
        DB_PATH          := IniFile.ReadString('IMAGE_CONNECTION', 'Path', DB_PATH);
        DB_SERVER        := IniFile.ReadString('IMAGE_CONNECTION', 'Server', DB_SERVER);
        DB_USER          := IniFile.ReadString('IMAGE_CONNECTION', 'User', DB_USER);
        DB_PASSWORD      := PwdDeCrypt(IniFile.ReadString('IMAGE_CONNECTION', 'Password_Crypted', DB_PASSWORD));
        IniFile.Free;

    with DM do
     begin
      if DB.Connected then DB.Close;
       DB.DatabaseName :=DB_SERVER+ ':'+DB_PATH;
       DB.DBParams.Values['USER_NAME']:=DB_USER;
       DB.DBparams.Values['PASSWORD'] :=DB_PASSWORD  ;
     end;
   try
     DM.DB.Open;
     dxstsbr1.Panels[0].Text := DM.DB.DatabaseName;
   except
     raise;
     MessageBox(Application.Handle,'Невідоме програмне виключення','Помилка', MB_OK +MB_ICONERROR);
   end;
end;


constructor TfrmTwain.Create(InParams: TcnSimpleParamsEx);
begin
 Screen.Cursor:=crHourGlass;
 FImageIndex :=0;
 inherited Create(InParams.Owner);
 DM:=TDM_Twain.Create(Self);
 ID_DOG_twain:= InParams.cnParamsToPakage.ID_DOG;
 DM.DB.Handle:=InParams.Db_Handle;

 // проверяю подключаться ли к другой базе
 DM.ReadDataSet.SelectSQL.Text := 'SELECT CN_IMAGE_IN_OTHER_DB FROM CN_PUB_SYS_DATA_GET_ALL';
 DM.ReadDataSet.Open;
 if DM.ReadDataSet['CN_IMAGE_IN_OTHER_DB'] =1 then
  begin
    DM.ReadDataSet.Close;
    ReadIniFileImage;
  end;
if DM.ReadDataSet.Active then DM.ReadDataSet.Close;

DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_SCAN_SELECT(' + IntToStr(InParams.cnParamsToPakage.ID_DOG) + ')';
db_imgPicture.DataSource := DM.DataSource;
DM.DataSet.AfterOpen   := DataSetAfterOpen;
DM.DataSet.AfterScroll := DataSetAfterScroll;
DM.DataSet.Open;
DM.DataSet.FetchAll;
DM.DataSet.First;

{if DM.DataSet.RecordCount > 0 then
 begin
   if not DM.DataSet.FieldByName('PICTURE').IsNull then
   begin
     Stream:= DM.DataSet.CreateBlobStream(DM.DataSet.FieldByName('PICTURE'), bmRead);
     if Assigned(Stream)
       then begin
            try
              // Load first image in the multiple paged TIFF files.
              TIFFImage.ImageIndex := 0;
              TIFFImage.LoadFromStream(Stream);
              db_imgPicture.Image.DibHandle := TIFFImage.DibHandle;

              ScrollBar1.Max := TIFFImage.NoImages - 1;
              lNoImages.Caption := 'Картинка: 1 з ' + IntToStr(TIFFImage.NoImages);
            finally
              // If the TIFF file only contains one image, then we'll close and
              // free the stream.
              if Not(TIFFImage.NoImages > 1)
              then begin
                   db_imgPicture.DataSource := DM.DataSource;
                   Stream.Free;
                   Stream := Nil;
              end;
              if (TIFFImage.Error <> EC_OK)
              then ShowMessage('Error reading file: ' + CErrorStrings[integer(TIFFImage.Error)]);
            end;
          }
           {    try
                 if FileExists(PicRoot + IntToStr(ID_DOG_twain) + '.tif') then
                    Stream := TFileStream.Create(PicRoot + IntToStr(ID_DOG_twain) + '.tif', fmOpenWrite)
                 else
                    Stream := TFileStream.Create(PicRoot + IntToStr(ID_DOG_twain) + '.tif', fmCreate);
                 SaveFile.CopyFrom(S, S.Size);
                finally
                  S.Free;
                  SaveFile.Free;
                  //Scan.Picture.LoadFromFile(PicRoot + IntToStr(ID_DOG_twain) + '.bmp');
                end;}
//       end;
//   end;
// end;

FormIniLanguage();
Screen.Cursor:=crDefault;
end;

procedure TfrmTwain.DataSetAfterOpen(DataSet: TDataSet);
begin
if DataSet.Active then
 begin
   if DataSet.RecordCount > 0 then
    begin
      lNoImages.Caption := 'Сторінка ' + IntToStr(DataSet.RecNo) + ' з ' + IntToStr(DataSet.RecordCount);
       mcmntspnNumPageSpin.Value := DataSet['NUM_PAGE'];
    end;
 end;
end;

procedure TfrmTwain.DataSetAfterScroll(DataSet: TDataSet);
begin
if DataSet.Active then
 begin
   if DataSet.RecordCount > 0 then
    begin
     lNoImages.Caption := 'Сторінка ' + IntToStr(DataSet.RecNo) + ' з ' + IntToStr(DataSet.RecordCount);
     mcmntspnNumPageSpin.Value := DataSet['NUM_PAGE'];
    end;
 end;
end;

procedure TfrmTwain.FormIniLanguage;
begin
 PLanguageIndex:=           cn_Common_Funcs.cnLanguageIndex();
 //кэпшн формы
 Caption:=                  cnConsts.cn_Twain[PLanguageIndex];
 //названия кнопок
end;


procedure TfrmTwain.FormDestroy(Sender: TObject);
begin
//  TIFFImage.Free;
//  if Assigned(Stream)
//  then Stream.Free;
end;

procedure TfrmTwain.ScrollBar1Change(Sender: TObject);
begin
{  if Assigned(Stream)
  then begin
       // The stream position must be set to the position where the multi-TIFF
       // images starts. In this example that's at position 0.
       Stream.Position := 0;
       // Set the sub-image index that we wish to retreive.
       TIFFImage.ImageIndex := ScrollBar1.Position;
       // Load sub-image.
       TIFFImage.LoadFromStream(Stream);
       lNoImages.Caption := 'Картинка: ' + IntToStr(TIFFImage.ImageIndex + 1) +
                            ' з ' + IntToStr(TIFFImage.NoImages);
       db_imgPicture.Image.DibHandle := TIFFImage.DibHandle;
  end;}
end;

procedure TfrmTwain.tbSelectClick(Sender: TObject);
begin
  mcmTWAIN.SelectSource;
end;

procedure TfrmTwain.tbScanClick(Sender: TObject);
begin
  mcmTWAIN.Acquire('');
end;

procedure TfrmTwain.mcmTWAINImageReady(Sender: TObject; pBmp: Pointer;
  pBmpInfo: PBitmapInfo; hImage: HBITMAP; FilePath: String);

var   SaveFile    : TFileStream;
      FFileFormat : TmcmFileFormat;
      tmpdir: string;
begin
  if (hImage <> 0)
  then
  begin
      db_imgPicture.Image.DibHandle := hImage;

      FImageIndex := FImageIndex +1;
      Screen.Cursor:=crHourGlass;
      tmpdir:=GetEnvironmentVariable('HOMEDRIVE')+GetEnvironmentVariable('HOMEPATH');
      SaveFile:= TFileStream.Create(tmpdir + '\cnScanerWork.tmp', fmCreate);
      FFileFormat := FF_PNG;
      db_imgPicture.Image.SaveToStreamEx(SaveFile, FFileFormat);

        with DM.StProc do
           try
            Transaction.StartTransaction;
            StoredProcName := 'CN_DT_SCAN_INSERT';
            Prepare;
            ParamByName('ID_DOG').AsInt64       := ID_DOG_twain;
            ParamByName('PICTURE').LoadFromStream(SaveFile);
            ParamByName('NUM_PAGE').AsInt64     := FImageIndex;
            ExecProc;
            SaveFile.free;
            Transaction.Commit;
           except
              Transaction.Rollback;
              Screen.Cursor:=crDefault;
              raise;
           end;
       DeleteFile(tmpdir + '\cnScanerWork.tmp');
       DM.DataSet.CloseOpen(true);
       lNoImages.Caption := 'Сторінка ' + IntToStr(DM.DataSet.RecNo) + ' з ' + IntToStr(DM.DataSet.RecordCount);
       mcmntspnNumPageSpin.Value := DM.DataSet['NUM_PAGE'];
       Screen.Cursor:=crDefault;
  end;
end;

procedure TfrmTwain.tbFitInWindowClick(Sender: TObject);
var SaveNotify : TNotifyEvent;
begin
   db_imgPicture.ScaleToFit := True;

   SaveNotify := rsZoom.OnChange;
   rsZoom.OnChange := Nil;
   FScale := db_imgPicture.Scale;
   rsZoom.Value := FScale;
   rsZoom.OnChange := SaveNotify;
end;

procedure TfrmTwain.rsZoomChange(Sender: TObject);
begin
       if (rsZoom.Text <> '')
       then begin
            if (rsZoom.Value > 0.0)
            then begin
                 FScale := rsZoom.Value;
                 db_imgPicture.Scale := FScale;
                 if (FScale < 1.0)
                 then rsZoom.Increment := FScale
                 else rsZoom.Increment := 1.0;
            end
            else begin
                 FScale := db_imgPicture.Scale;
                 FScale := FScale / 2.0;
                 rsZoom.Value := FScale;
                 rsZoom.Increment := FScale;
            end;
       end;
end; 

procedure TfrmTwain.tbPrintPreviewClick(Sender: TObject);
var FormPrintPreview: TFormPrintPreview;
    i: Integer;
begin
 FormPrintPreview := TFormPrintPreview.Create(self);
 DM.DataSet.First;
 for i:= 0 to DM.DataSet.RecordCount-1
 do begin
   FormPrintPreview.mcmPrinter.AddPage;
   FormPrintPreview.mcmPrinter.Pages[i].Assign(db_imgPicture.Image);
   DM.DataSet.Next;
 end;
   FormPrintPreview.ShowModal;
   FormPrintPreview.Free;
end;

procedure TfrmTwain.ShowUIItemClick(Sender: TObject);
begin
  ShowUIItem.Checked := Not(ShowUIItem.Checked);
  mcmTwain.ShowUI := ShowUIItem.Checked;
end;

procedure TfrmTwain.tbNewClick(Sender: TObject);
 var
  i: byte;
begin
if DM.DataSet.RecordCount = 0 then Exit;
  i:= cn_Common_Messages.cnShowMessage(cnConsts.cn_Confirmation_Caption[PLanguageIndex], cnConsts_Messages.cn_warning_Delete[PLanguageIndex], mtConfirmation, [mbYes, mbNo]);
  if ((i = 7) or (i= 2)) then exit;

Screen.Cursor:=crHourGlass;
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_SCAN_DELETE';
        Prepare;
        ParamByName('ID_PK_SCAN').AsInt64       := DM.DataSet['ID_PK_SCAN'];
        ExecProc;
        Transaction.Commit;
       except
          Transaction.Rollback;
          Screen.Cursor:=crDefault;
          raise;
       end;
       DM.DataSet.CloseOpen(true);
       if DM.DataSet.RecordCount > 0 then
        begin
        lNoImages.Caption := 'Сторінка ' + IntToStr(DM.DataSet.RecNo) + ' з ' + IntToStr(DM.DataSet.RecordCount);
        mcmntspnNumPageSpin.Value := DM.DataSet['NUM_PAGE'];
       end
        else
        begin
           lNoImages.Caption := 'Сторінок немає';
           mcmntspnNumPageSpin.Value := 0;
        end;
       Screen.Cursor:=crDefault;
end;

procedure TfrmTwain.btn2Click(Sender: TObject);
begin
DM.DataSet.First;
end;

procedure TfrmTwain.btn5Click(Sender: TObject);
begin
DM.DataSet.Last;
end;

procedure TfrmTwain.btn3Click(Sender: TObject);
begin
DM.DataSet.Prior;
end;

procedure TfrmTwain.btn4Click(Sender: TObject);
begin
DM.DataSet.Next;
end;

procedure TfrmTwain.btnSaveNumPageClick(Sender: TObject);
begin
if DM.DataSet.RecordCount = 0 then Exit;

Screen.Cursor:=crHourGlass;
     with DM.StProc do
       try
        Transaction.StartTransaction;
        StoredProcName := 'CN_DT_SCAN_UPDATE_NUM_PAGE';
        Prepare;
        ParamByName('ID_PK_SCAN').AsInt64       := DM.DataSet['ID_PK_SCAN'];
        ParamByName('NUM_PAGE').AsInt64         := mcmntspnNumPageSpin.Value;
        ExecProc;
        Transaction.Commit;
       except
          Transaction.Rollback;
          Screen.Cursor:=crDefault;
          raise;
       end;
       DM.DataSet.CloseOpen(true);
       Screen.Cursor:=crDefault;
end;

procedure TfrmTwain.tbOpenClick(Sender: TObject);
begin
 Screen.Cursor := crHourGlass;
 DM.DataSet.CloseOpen(True);
        if DM.DataSet.RecordCount > 0 then
        begin
        lNoImages.Caption := 'Сторінка ' + IntToStr(DM.DataSet.RecNo) + ' з ' + IntToStr(DM.DataSet.RecordCount);
        mcmntspnNumPageSpin.Value := DM.DataSet['NUM_PAGE'];
       end
        else
        begin
           lNoImages.Caption := 'Сторінок немає';
           mcmntspnNumPageSpin.Value := 0;
        end;
 Screen.Cursor := crDefault;
end;

procedure TfrmTwain.btnRotate90Click(Sender: TObject);
var ImageTransform : TmcmImageTransform;
begin
       ImageTransform := TmcmImageTransform.Create(Self);
       ImageTransform.SourceImage[0] :=  db_imgPicture.Image;
       ImageTransform.BKColor := $FFFFFF;
       // As we are rotating 90,180 or 270 degrees interpolation is not
       // necessary and nearest neighbour is the right choice.
       ImageTransform.Interpolate := ST_NEAREST;

       ImageTransform.Rotate(True, 90);

       if (ImageTransform.Error = EC_OK)
       then db_imgPicture.Image := ImageTransform.ResultImage
       else begin
            ImageTransform.ResultImage.Free;
            ShowMessage('Error rotating image: ' + CErrorStrings[word(ImageTransform.Error)]);
       end;

       db_imgPicture.Scale := db_imgPicture.Scale;
       ImageTransform.Free;

end;

procedure TfrmTwain.btn9Click(Sender: TObject);
//var mcmImageTransform : TmcmImageTransform;
begin
{      mcmImageTransform := TmcmImageTransform.Create(Self);
       mcmImageTransform.SourceImage[0] := db_imgPicture.Image;
       mcmImageTransform.ResultImage := db_imgPicture.Image;
       mcmImageTransform.Mirror;
       db_imgPicture.Image := mcmImageTransform.ResultImage;
       mcmImageTransform.Free;}
end;

procedure TfrmTwain.btnSaveClick(Sender: TObject);
var FormPrintPreview: TFormPrintPreview;
    i: Integer;
begin
 FormPrintPreview := TFormPrintPreview.Create(self);
 DM.DataSet.First;
 for i:= 0 to DM.DataSet.RecordCount-1
 do begin
   FormPrintPreview.mcmPrinter.AddPage;
   FormPrintPreview.mcmPrinter.Pages[i].Assign(db_imgPicture.Image);
   DM.DataSet.Next;
 end;
  if (FormPrintPreview.mcmPrinter.PageCount > 0)
  then FormPrintPreview.mcmPrinter.Print;

  FormPrintPreview.Free;
end;

procedure TfrmTwain.actCloseExecute(Sender: TObject);
begin
 DM.ReadDataSet.Close;
 DM.DataSet.Close;
 DM.DB.Close;
 DM.Free;
 Close;
end;

procedure TfrmTwain.actTwainExecute(Sender: TObject);
begin
mcmTWAIN.Acquire('');
end;

procedure TfrmTwain.OpenItemClick(Sender: TObject);
var i   : integer;
      SaveFile    : TFileStream;
      FFileFormat : TmcmFileFormat;
      tmpdir: string;
begin
  mcmOpenDialog.FileName := '';
  if (mcmOpenDialog.Execute)
  then begin
       Update;
       Screen.Cursor := crHourGlass;
       db_imgPicture.Image.FileOpen(mcmOpenDialog.FileName);

      FImageIndex := FImageIndex +1;
      tmpdir:=GetEnvironmentVariable('HOMEDRIVE')+GetEnvironmentVariable('HOMEPATH');
      SaveFile:= TFileStream.Create(tmpdir + '\cnScanerWork.tmp', fmCreate);
      FFileFormat := FF_PNG;
      db_imgPicture.Image.SaveToStreamEx(SaveFile, FFileFormat);

        with DM.StProc do
           try
            Transaction.StartTransaction;
            StoredProcName := 'CN_DT_SCAN_INSERT';
            Prepare;
            ParamByName('ID_DOG').AsInt64       := ID_DOG_twain;
            ParamByName('PICTURE').LoadFromStream(SaveFile);
            ParamByName('NUM_PAGE').AsInt64     := FImageIndex;
            ExecProc;
            SaveFile.free;
            Transaction.Commit;
           except
              Transaction.Rollback;
              Screen.Cursor:=crDefault;
              raise;
           end;
       DeleteFile(tmpdir + '\cnScanerWork.tmp');
       DM.DataSet.CloseOpen(true);
       lNoImages.Caption := 'Сторінка ' + IntToStr(DM.DataSet.RecNo) + ' з ' + IntToStr(DM.DataSet.RecordCount);
       mcmntspnNumPageSpin.Value := DM.DataSet['NUM_PAGE'];
       Screen.Cursor := crDefault;
  end;
end; 

procedure TfrmTwain.FormCreate(Sender: TObject);
begin
  mcmOpenDialog.ImageFileManager := ImageFileManager;
  mcmSaveDialog.ImageFileManager := ImageFileManager;
end;

procedure TfrmTwain.SaveItemClick(Sender: TObject);
begin
       mcmSaveDialog.FilterIndex := -1; // Image will specify the file format.
                                        // A zero or positive value will instead
                                        // select the indexed file mask.
       mcmSaveDialog.Image       := db_imgPicture.Image;
       mcmSaveDialog.FileName    := ChangeFileExt('ImageFromContracts', '');
       mcmSaveDialog.Compression := db_imgPicture.Image.Compression;
       mcmSaveDialog.Quality     := db_imgPicture.Image.Quality;
       mcmSaveDialog.Interlaced  := db_imgPicture.Image.Interlaced;

       if (mcmSaveDialog.Execute)
       then begin
            Refresh;
            Screen.Cursor := crHourGlass;
            db_imgPicture.Image.FileSave(mcmSaveDialog.FileName);
            Screen.Cursor := crDefault;

            if (ImageFileManager.Error <> EC_OK)
            then ShowMessage('Ошибка записи: ' + CErrorStrings[word(ImageFileManager.Error)]);
       end;
end;

end.
