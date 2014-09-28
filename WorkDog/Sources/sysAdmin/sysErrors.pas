unit sysErrors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, FIBDataSet, pFIBDataSet,
  pFIBStoredProc, FIBQuery, pFIBQuery, cxGridTableView, cxTL, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxContainer, cxLabel, ToolWin, ComCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, FIBDatabase, pFIBDatabase, cxCheckBox, ExtCtrls,
  Jpeg, cxImage, cxDBEdit, cxSplitter, cxLookAndFeelPainters, StdCtrls,
  cxButtons, frxClass, frxDBSet, ImgList, frxChBox;

type
  TfrmSysErrors = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1ID_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1ID_USER: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_SYSTEM: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_USER: TcxGridDBColumn;
    cxGrid1DBTableView1COMPUTER_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1COMPUTER_IP: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
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
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    TreeListStyleSheetDevExpress: TcxTreeListStyleSheet;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    Query1: TpFIBQuery;
    StoredProc: TpFIBStoredProc;
    ErrorsDataSet: TpFIBDataSet;
    ErrorsDataSource: TDataSource;
    SystemsDataSet: TpFIBDataSet;
    SystemsDataSource: TDataSource;
    cxGrid1DBTableView1ERROR_TEXT: TcxGridDBColumn;
    cxGrid1DBTableView1ERROR_TIME: TcxGridDBColumn;
    Panel2: TPanel;
    ScrDataSet: TpFIBDataSet;
    ScrDataSource: TDataSource;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cbSystems: TcxLookupComboBox;
    ShowScreenButton: TcxButton;
    cbToday: TcxCheckBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxButton2: TcxButton;
    ExportButton: TcxButton;
    SaveDialog1: TSaveDialog;
    FixButton: TcxButton;
    cxGrid1DBTableView1FIXED: TcxGridDBColumn;
    ImageList1: TImageList;
    cxGrid1DBTableView1FIXED_BY_ID_USER: TcxGridDBColumn;
    cxLabel4: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cbShowFixed: TcxCheckBox;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    cxLabel5: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTodayClick(Sender: TObject);
    procedure ShowScreenButtonClick(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure ExportButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid1DBTableView1FIXEDCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure FixButtonClick(Sender: TObject);
    procedure cbShowFixedClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
  public
    procedure SelectAll;
  end;

implementation
uses SysScrViewUnit, SysAdmin;
{$R *.dfm}

procedure TfrmSysErrors.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caFree;
 ErrorsDataSet.Close;
 SystemsDataSet.Close;
end;

procedure TfrmSysErrors.SelectAll;
var
 i : Integer;
begin
  i := -1;
  if ErrorsDataSet.RecordCount <> 0 then i := ErrorsDataSet['ID_ERROR'];
  ErrorsDataSet.Close;
  ErrorsDataSet.ParamByName('FILTER_DATE').AsDate := StrToDate('01.01.1900');
  if cbShowFixed.Checked then ErrorsDataSet.ParamByName('SHOW_FIXED').AsInteger := 1
                         else ErrorsDataSet.ParamByName('SHOW_FIXED').AsInteger := 0;
  if cbToday.Checked then ErrorsDataSet.ParamByName('FILTER_DATE').AsDate := date;
  ErrorsDataSet.Open;
  if i <> -1 then ErrorsDataSet.Locate('ID_ERROR', i, [loCaseInsensitive]);
  ScrDataSet.Open;
end;

procedure TfrmSysErrors.cbTodayClick(Sender: TObject);
begin
  SelectAll;
end;

procedure TfrmSysErrors.ShowScreenButtonClick(Sender: TObject);
var
 frm : TfrmScrView;
 jpg : TJPEGImage;
 st  : TMemoryStream;
begin
 if ErrorsDataSet.RecordCount = 0 then Exit;
 ScrDataSet.Close;
 ScrDataSet.ParamByName('ID_ERROR').AsInt64 := ErrorsDataSet['ID_ERROR'];
 ScrDataSet.Open;
 frm := TfrmScrView.Create(Self);
 frm.Image1.Picture.Bitmap.Width := 0;
 frm.Image1.Picture.Bitmap.Height := 0;
 if ScrDataSet.RecordCount = 0 then
 begin
   ScrDataSet.Close;
   Exit;
 end;
 jpg := TJPEGImage.Create;
 st := TMemoryStream.Create;
 if not VarIsNull(ScrDataSet.FieldByName('SCREENSHOT').Value) then
 begin
   TBlobField(ScrDataSet.FieldByName('SCREENSHOT')).SaveToStream(st);
   st.Seek(0, soBeginning);
   jpg.LoadFromStream(st);
   frm.Image1.Width :=  jpg.Width;
   frm.Image1.Height := jpg.Height;
   //frm.Image1.Picture.Bitmap := TBitmap.Create;
   frm.Image1.Picture.Bitmap.Width :=  jpg.Width;
   frm.Image1.Picture.Bitmap.Height :=  jpg.Height;
   frm.Image1.Picture.Bitmap.Canvas.Draw(0, 0, jpg);
 end;
 st.Free;
 jpg.Free;
 ScrDataSet.Close;
 frm.ShowModal;
 frm.Free;
end;

procedure TfrmSysErrors.cxButton2Click(Sender: TObject);
begin
 frxReport1.ShowReport();
end;

procedure TfrmSysErrors.ExportButtonClick(Sender: TObject);
var
 sl : TStringList;
begin
 if not SaveDialog1.Execute then Exit;
 sl := TStringList.Create;
 sl.Add('<html>');
 sl.Add('  <head>');
 sl.Add('    <title>');
 sl.Add('Перечень ошибок "' + SystemsDataSet['NAME_SYSTEM'] + '"');
 sl.Add('    </title>');
 sl.Add('  </head>');
 sl.Add('  <body>');
 sl.Add('    <h2><center>Перечень ошибок "' + SystemsDataSet['NAME_SYSTEM'] + '"</center>');
 sl.Add('    <table width = "100%" bordercolor = "#666666" cellSpacing=0 cellPadding=0 border=1>');
 sl.Add('      <tr>');
 sl.Add('        <td><center>Пользователь</center></td>');
 sl.Add('        <td><center>Ошибка</center></td>');
 sl.Add('        <td><center>Время ошибки</center></td>');
 sl.Add('        <td><center>Компьютер/IP</center></td>');
 sl.Add('      </tr>');

 ErrorsDataSet.First;
 while not ErrorsDataSet.Eof do
 begin
   sl.Add('      <tr>');
   sl.Add('        <td>' + ErrorsDataSet['NAME_USER'] + '</td>');
   sl.Add('        <td>' + ErrorsDataSet['ERROR_TEXT'] + '</td>');
   sl.Add('        <td>' + DateTimeToStr(ErrorsDataSet['ERROR_TIME']) + '</td>');
   sl.Add('        <td>' + ErrorsDataSet['COMPUTER_NAME'] + '<br>' + ErrorsDataSet['COMPUTER_IP'] +  '</td>');
   sl.Add('      </tr>');
   ErrorsDataSet.Next;
 end;
 sl.Add('    </table>');
 sl.Add('  </body>');
 sl.Add('</html>');
 sl.SaveToFile(SaveDialog1.FileName);
 sl.Free;
 ShowMessage('Файл успешно сохранен!');
end;

procedure TfrmSysErrors.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (Key = VK_F2) or (Key = VK_RETURN) then ShowScreenButtonClick(Self);
 if Key = VK_escape then Close;
end;

procedure TfrmSysErrors.cxGrid1DBTableView1FIXEDCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if VarIsNull(AViewInfo.GridRecord.Values[cxGrid1DBTableView1FIXED_BY_ID_USER.Index]) then begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 1);
    ADone := true;
  end
  else
  begin
    ACanvas.FillRect(AViewInfo.Bounds);
    ImageList1.Draw(ACanvas.Canvas, AViewInfo.Bounds.Left + 1, AViewInfo.Bounds.Top, 0);
    ADone := true;
  end;
end;

procedure TfrmSysErrors.FixButtonClick(Sender: TObject);
var
 s : string;
begin
 if ErrorsDataSet.RecordCount = 0 then Exit;
 s := '';
 if not InputQuery('Пометить как исправленную', 'Введи текст коментария', s) then Exit;
 StoredProc.Transaction.StartTransaction;
 StoredProc.ExecProcedure('PROC_SYS_ERRORS_FIX_UPDATE', [ErrorsDataSet['ID_ERROR'], ADMIN_VAR_ID_USER, s]);
 StoredProc.Transaction.Commit;
 SelectAll;
end;

procedure TfrmSysErrors.cbShowFixedClick(Sender: TObject);
begin
 SelectAll;
end;

procedure TfrmSysErrors.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
 if VarName = 'SYS' then Value := SystemsDataSet['NAME_SYSTEM'];
end;

procedure TfrmSysErrors.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
 ShowScreenButtonClick(Self);
end;

end.
