{***************************************************************
* uRepTempWorkers.				                               			 *
*		                                         								   *
* форма Тимчасово прийняті працівники     		                 *
* Copyright © DonNU 2007, Автор: Pidko Eugeniy  						   *
***************************************************************}



unit uAsupTempWorkers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ToolEdit, RXDBCtrl, XPMan, ComCtrls, Buttons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxLookAndFeelPainters,
  cxButtons, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,uCommonSp,
  FIBQuery, pFIBQuery, pFIBStoredProc, frxClass, frxDBSet, frxCross,
  frxChart, frxOLE, frxRich, frxDMPExport, frxGZip, frxExportPDF,
  frxExportImage, frxExportRTF,qFTools, frxExportXML, frxExportXLS, frxExportHTML,
  frxExportTXT,uFControl,uLogicCheck, qFStrings, uSpravControl, frxDesgn;

type
  TfmTempWorkers = class(TForm)
    XPManifest1: TXPManifest;
    LDepartment: TLabel;
    cxTextEdit1: TcxTextEdit;
    BDepartment: TBitBtn;
    BOk: TBitBtn;
    BNo: TBitBtn;
    pFIBDatabase1: TpFIBDatabase;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    SP: TpFIBStoredProc;
    pFIBDataSet1LOCAL_DEPARTMENT: TFIBIntegerField;
    frxDBDataset1: TfrxDBDataset;
    pFIBDataSet2: TpFIBDataSet;
    Label1: TLabel;
    DateBeg: TDateTimePicker;
    DateEnd: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    DataSource1: TDataSource;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    frxDesigner1: TfrxDesigner;
    Rep_Temp_Workers: TfrxReport;
    procedure BNoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BDepartmentClick(Sender: TObject);
    procedure BOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_department : Integer;
    { Public declarations }
  end;

var
  fmTempWorkers: TfmTempWorkers;

implementation

{$R *.dfm}

procedure TfmTempWorkers.BNoClick(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfmTempWorkers.FormCreate(Sender: TObject);
begin
    DateEnd.Date:=Date;
    

end;

procedure TfmTempWorkers.BDepartmentClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp :=  GetSprav('SpDepartment');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(pFIBDatabase1.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            //FieldValues['Root_Department'] := 2612;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;
    end;
        // показать справочник и проанализировать результат (выбор одного подр.)
    sp.Show;
    if sp.Output = nil then
        ShowMessage('BUG: Output is NIL!!!')
    else
    if not sp.Output.IsEmpty then
    BEGIN
        cxTextEdit1.Text:= sp.Output['Name_Full'];
        id_department:=sp.Output['Id_Department'];
    END;
    sp.Free;
end;


procedure TfmTempWorkers.BOkClick(Sender: TObject);
var
  Memo15,Memo17,Memo19: TfrxMemoView;
  bol: Boolean;
begin
  try
    pFIBDatabase1.Connected:=True;
    pFIBDataSet2.Active:=true;
    pFIBDataSet2.Transaction.StartTransaction;
    pFIBDataSet2.ParamByName('ID_DEPART').Value:=id_department;
    pFIBDataSet2.ParamByName('DATE_BEG_WORK').Value:=DateBeg.Date;
    pFIBDataSet2.ParamByName('DATE_END_WORK').Value:=DateEnd.Date;
    pFIBDataSet2.Transaction.Commit;
    pFIBDataSet2.Active:=true;
    bol:=  pFIBDataSet2.IsEmpty;  
    if  bol then
    begin
        qFErrorDialog('Тимчасово прийнятих працiвникiв не знайдено!');
        //qFInformDialog('Тимчасово прийнятих працiвникiв не знайдено!');
            ModalResult:=mrNone;
    end
    else
        begin
        Rep_Temp_Workers.LoadFromFile('Reports\Asup\Asup_Report_Temp_Workers.fr3');
        Memo15 := Rep_Temp_Workers.FindObject('Memo15') as TfrxMemoView;
        Memo17 := Rep_Temp_Workers.FindObject('Memo17') as TfrxMemoView;
        Memo19 := Rep_Temp_Workers.FindObject('Memo19') as TfrxMemoView;
        Memo15.Text := cxTextEdit1.Text;
        Memo17.Text := DateToStr(DateBeg.Date);
        Memo19.Text := DateToStr(DateEnd.Date);
        Rep_Temp_Workers.ShowReport;
        end;
    except on E : Exception
        do begin
            ShowMessage('Помилка при формуванні звіта: ' + e.Message);
            pFIBDataSet2.Transaction.Rollback;

        end;
  end;
  ModalResult:=mrNone;
end;

end.
