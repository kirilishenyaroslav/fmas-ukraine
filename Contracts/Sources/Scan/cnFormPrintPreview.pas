unit cnFormPrintPreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, mcmPrinter, ComCtrls, ToolWin, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxEdit, cxLabel, cxImage,
  StdCtrls, umcmIntE, ImgList;

type
  TFormPrintPreview = class(TForm)
    mcmPrinter: TmcmPrinter;
    mcmPrintPreview: TmcmPrintPreview;
    StatusBar: TStatusBar;
    ToolBar: TToolBar;
    tbClose: TToolButton;
    tbPageMargin: TToolButton;
    tbPrint: TToolButton;
    tbSetupPrinter: TToolButton;
    tbFirstPage: TToolButton;
    ToolButton5: TToolButton;
    tbPreviousPage: TToolButton;
    tbNextPage: TToolButton;
    tbLastPage: TToolButton;
    ToolButton3: TToolButton;
    tbCentre: TToolButton;
    ToolButton2: TToolButton;
    tbFitToPage: TToolButton;
    PrinterSetupDialog: TPrinterSetupDialog;
    ToolButton1: TToolButton;
    cbZoom: TcxComboBox;
    lZoom: TcxLabel;
    eScaleImage: TmcmIntSpin;
    MenuImageList: TImageList;
    procedure tbCloseClick(Sender: TObject);
    procedure cbZoomChange(Sender: TObject);
    procedure tbFirstPageClick(Sender: TObject);
    procedure tbPreviousPageClick(Sender: TObject);
    procedure tbNextPageClick(Sender: TObject);
    procedure tbLastPageClick(Sender: TObject);
    procedure tbPrintClick(Sender: TObject);
    procedure tbSetupPrinterClick(Sender: TObject);
    procedure PrinterSetupDialogClose(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mcmPrinterNewPage(Sender: TObject);
    procedure tbCentreClick(Sender: TObject);
    procedure tbFitToPageClick(Sender: TObject);
    procedure seScaleImageChange(Sender: TObject);
    procedure tbPageMarginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses cnFormMargin;

//uses uFormMargin;

{$R *.DFM}

procedure TFormPrintPreview.FormCreate(Sender : TObject);
begin
  cbZoom.ItemIndex := 0;
  mcmPrintPreview.ZoomToFit;

  // Initialise browser buttons.
  tbFirstPage.Enabled    := False;
  tbPreviousPage.Enabled := False;
  tbNextPage.Enabled     := (mcmPrinter.PageCount > 1);
  tbLastPage.Enabled     := (mcmPrinter.PageCount > 1);
  StatusBar.SimpleText   := 'Сторінка ' + IntToStr(mcmPrintPreview.PageIndex) +
                            ' з ' + IntToStr(mcmPrinter.PageCount);
  mcmPrinter.ImageFitToPage := True;
  mcmPrinter.ImageCenter := True;
       mcmPrinter.ForceMargin  := true;
       mcmPrinter.MarginLeft   := 0;
       mcmPrinter.MarginTop    := 0;
       mcmPrinter.MarginRight  := 0;
       mcmPrinter.MarginBottom := 0;
end;

procedure TFormPrintPreview.tbCloseClick(Sender : TObject);
begin
  Close;
end; // TFormPrintPreview.tbCloseClick.

procedure TFormPrintPreview.cbZoomChange(Sender : TObject);
begin
  // Change zoom factor for preview window.
  case cbZoom.ItemIndex of
  0 : mcmPrintPreview.ZoomToFit;
  1 : mcmPrintPreview.ZoomToWidth;
  2 : mcmPrintPreview.ZoomToHeight;
  3 : mcmPrintPreview.ZoomPercent := 25;
  4 : mcmPrintPreview.ZoomPercent := 50;
  5 : mcmPrintPreview.ZoomPercent := 75;
  6 : mcmPrintPreview.ZoomPercent := 100;
  7 : mcmPrintPreview.ZoomPercent := 150;
  8 : mcmPrintPreview.ZoomPercent := 200;
  end;
end;


procedure TFormPrintPreview.tbFirstPageClick(Sender: TObject);
begin
  // Go to first page.
  mcmPrintPreview.PageIndex := 1;
  tbFirstPage.Enabled    := False;
  tbPreviousPage.Enabled := False;
  tbNextPage.Enabled     := (mcmPrinter.PageCount > 1);
  tbLastPage.Enabled     := (mcmPrinter.PageCount > 1);
end;


procedure TFormPrintPreview.tbPreviousPageClick(Sender: TObject);
begin
  // Got to previous page.
  if (mcmPrintPreview.PageIndex > 1)
  then begin
       mcmPrintPreview.PageIndex := mcmPrintPreview.PageIndex - 1;

       tbNextPage.Enabled := True;
       tbLastPage.Enabled := True;
       if (mcmPrintPreview.PageIndex = 1)
       then begin
            tbFirstPage.Enabled    := False;
            tbPreviousPage.Enabled := False;
       end;
  end;
  StatusBar.SimpleText   := 'Page ' + IntToStr(mcmPrintPreview.PageIndex) +
                            ' of ' + IntToStr(mcmPrinter.PageCount);
end;

procedure TFormPrintPreview.tbNextPageClick(Sender: TObject);
begin
  // Go to next page.
  if (mcmPrintPreview.PageIndex <= mcmPrinter.PageCount)
  then begin
       mcmPrintPreview.PageIndex := mcmPrintPreview.PageIndex + 1;

       tbFirstPage.Enabled    := True;
       tbPreviousPage.Enabled := True;
       if (mcmPrintPreview.PageIndex = mcmPrinter.PageCount)
       then begin
            tbNextPage.Enabled := False;
            tbLastPage.Enabled := False;
       end;
  end;
  StatusBar.SimpleText   := 'Page ' + IntToStr(mcmPrintPreview.PageIndex) +
                            ' of ' + IntToStr(mcmPrinter.PageCount);
end;

procedure TFormPrintPreview.tbLastPageClick(Sender: TObject);
begin
  // Go to last page.
  mcmPrintPreview.PageIndex := mcmPrinter.PageCount;
  tbFirstPage.Enabled    := (mcmPrintPreview.PageIndex > 1);
  tbPreviousPage.Enabled := (mcmPrintPreview.PageIndex > 1);
  tbNextPage.Enabled := False;
  tbLastPage.Enabled := False;
  StatusBar.SimpleText   := 'Page ' + IntToStr(mcmPrintPreview.PageIndex) +
                            ' of ' + IntToStr(mcmPrinter.PageCount);
end;

procedure TFormPrintPreview.tbPrintClick(Sender: TObject);
begin
  // Print pages.
  if (mcmPrinter.PageCount > 0)
  then mcmPrinter.Print;
end;

procedure TFormPrintPreview.tbSetupPrinterClick(Sender: TObject);
begin
  // Access printer set-up dialogue.
  if PrinterSetupDialog.Execute
  then mcmPrinter.RefreshProperties;
  InvalidateRect(Handle, Nil, True);
end;

procedure TFormPrintPreview.PrinterSetupDialogClose(Sender: TObject);
begin
//  mcmPrinter.
end;

procedure TFormPrintPreview.mcmPrinterNewPage(Sender : TObject);
begin
  tbNextPage.Enabled := (mcmPrinter.PageCount > 1);
  tbLastPage.Enabled := (mcmPrinter.PageCount > 1);
  StatusBar.SimpleText   := 'Page ' + IntToStr(mcmPrintPreview.PageIndex) +
                            ' of ' + IntToStr(mcmPrinter.PageCount);
end;

procedure TFormPrintPreview.tbCentreClick(Sender : TObject);
begin
{$IFDEF DCB3_6}
  tbCentre.Down := Not tbCentre.Down;
{$ENDIF}
  mcmPrinter.ImageCenter := tbCentre.Down;
end;

procedure TFormPrintPreview.tbFitToPageClick(Sender : TObject);
begin
{$IFDEF DCB3_6}
  tbFitToPage.Down := Not tbFitToPage.Down;
{$ENDIF}
  mcmPrinter.ImageFitToPage := tbFitToPage.Down;
end;

procedure TFormPrintPreview.seScaleImageChange(Sender : TObject);
begin
  try
    if (eScaleImage.Text <> '') and Assigned(mcmPrinter)
    then mcmPrinter.ImageScale := eScaleImage.Value;
  except
  end;
end;

procedure TFormPrintPreview.tbPageMarginClick(Sender: TObject);
begin

  FormPageMargin := TFormPageMargin.Create(Self);
  FormPageMargin.ForceMargin  := mcmPrinter.ForceMargin;
  FormPageMargin.MarginLeft   := mcmPrinter.MarginLeft;
  FormPageMargin.MarginTop    := mcmPrinter.MarginTop;
  FormPageMargin.MarginRight  := mcmPrinter.MarginRight;
  FormPageMargin.MarginBottom := mcmPrinter.MarginBottom;

  if (FormPageMargin.ShowModal = mrOK)
  then begin
       mcmPrinter.ForceMargin  := FormPageMargin.ForceMargin;
       mcmPrinter.MarginLeft   := FormPageMargin.MarginLeft;
       mcmPrinter.MarginTop    := FormPageMargin.MarginTop;
       mcmPrinter.MarginRight  := FormPageMargin.MarginRight;
       mcmPrinter.MarginBottom := FormPageMargin.MarginBottom;
  end;
  FormPageMargin.Free;
end;


end.
