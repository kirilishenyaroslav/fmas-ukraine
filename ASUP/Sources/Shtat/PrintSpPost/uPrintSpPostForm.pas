unit uPrintSpPostForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uDateControl,
  uSpravControl, uPrintSpPostData, frxClass, frxDBSet, frxDesgn,
  frxExportPDF, frxExportRTF, frxExportXML, frxExportXLS, frxExportHTML,
  frxExportTXT;

type
  TfmPrintSpPost = class(TForm)
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    Cur_Date: TqFDateControl;
    PostDS: TfrxDBDataset;
    PostReport: TfrxReport;
    frxDesigner1: TfrxDesigner;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
     DM: TdmPrintSpPost;
     Design: Boolean;
  public
    constructor Create(AOwner: TComponent; DM: TdmPrintSpPost); reintroduce;
  end;

var
  fmPrintSpPost: TfmPrintSpPost;

implementation

{$R *.dfm}

uses qFTools;

constructor TfmPrintSpPost.Create(AOwner: TComponent; DM: TdmPrintSpPost);
begin
     inherited Create(AOwner);
     Self.DM := DM;
     Cur_Date.Value := Date;
end;

procedure TfmPrintSpPost.OkButtonClick(Sender: TObject);
begin
     DM.ReportDS.Close;
     DM.ReportDS.ParamByName('Cur_Date').AsDate := Cur_Date.Value;
     DM.ReportDS.ParamByName('R1').AsInteger := 199;
     DM.ReportDS.ParamByName('R2').AsInteger := 299;
     DM.ReportDS.ParamByName('R3').AsInteger := 399;
     DM.ReportDS.ParamByName('R4').AsInteger := 499;
     DM.ReportDS.ParamByName('R5').AsInteger := 599;
     DM.ReportDS.ParamByName('R6').AsInteger := 699;
     DM.ReportDS.ParamByName('R7').AsInteger := 799;
     DM.ReportDS.ParamByName('R8').AsInteger := 899;
     DM.ReportDS.ParamByName('R9').AsInteger := 999;
     DM.ReportDS.Open;

     PostReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'Reports\Asup\AsupPostSalary2.fr3');
     PostReport.Variables['Cur_Date'] := QuotedStr(DateToStr(Cur_Date.Value));

     if Design then PostReport.DesignReport
     else PostReport.ShowReport;
end;

procedure TfmPrintSpPost.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPrintSpPost.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    qFAutoSaveIntoRegistry(Self, nil);
end;

procedure TfmPrintSpPost.FormShow(Sender: TObject);
begin
    qFAutoLoadFromRegistry(Self, nil);
end;

procedure TfmPrintSpPost.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
    if ( ssCtrl in Shift) and ( ssAlt in Shift ) and ( ssShift in Shift ) then
        Design := not Design;
end;

end.
