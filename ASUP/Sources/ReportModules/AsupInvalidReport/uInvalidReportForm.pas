unit uInvalidReportForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,dmInvalidMain, StdCtrls, Buttons, frxClass, frxDBSet, frxDesgn,
  cxDropDownEdit, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit;

type
  TReportForm = class(TForm)
    cxMEYaer: TcxMaskEdit;
    cxLabel1: TcxLabel;
    cxCBK: TcxComboBox;
    frxDesigner1: TfrxDesigner;
    FRDataSet: TfrxDBDataset;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    ZReport: TfrxReport;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    DateBeg :String ;
    DateEnd :String ;

    DataModule:TMainDM;
    DesignReport:Boolean;

  end;

var
  ReportForm: TReportForm;

implementation

{$R *.dfm}

procedure TReportForm.OkButtonClick(Sender: TObject);
var
 Y:String;
 
begin
 FRDataSet.DataSource:=DataModule.DataSource;

 if StrToInt(cxMEYaer.Text)=0 then
 begin
  ShowMessage('Рік не може бути нулем!');
  Exit;
 end;




   if cxCBK.ItemIndex = 0 then
   begin
     DateBeg :='01.01.'+cxMEYaer.Text;
     DateEnd :='31.03.'+cxMEYaer.Text;
   end;
   if cxCBK.ItemIndex = 1 then
   begin
     DateBeg :='01.04.'+cxMEYaer.Text;
     DateEnd :='30.06.'+cxMEYaer.Text;
   end;
   if cxCBK.ItemIndex = 2 then
   begin
     DateBeg :='01.07.'+cxMEYaer.Text;
     DateEnd :='30.09.'+cxMEYaer.Text;
   end;

   if cxCBK.ItemIndex = 3 then
   begin
     DateBeg :='01.10.'+cxMEYaer.Text;
     DateEnd :='31.12.'+cxMEYaer.Text;
   end;

    with DataModule do
    begin

        ReportDataSet.ParamByName('DateB').Value:=DateBeg;
        ReportDataSet.ParamByName('DateE').Value:=DateEnd;
        ReportDataSet.CloseOpen(false);
        ConstsQuery.Open;
    end;

     Y:='('+cxCBK.Text+' '+cxMEYaer.Text+' рр)';

     ZReport.LoadFromFile('Reports\Asup\AsupInvalidReport.fr3');
     ZReport.Variables['NameV']:=QuotedStr(DataModule.ConstsQuery['FIRM_NAME']);
     ZReport.Variables['Kvartal']:=QuotedStr(Y);

    
    if DesignReport=True then ZReport.DesignReport
    else ZReport.ShowReport;

end;

procedure TReportForm.FormCreate(Sender: TObject);
begin
    cxCBK.ItemIndex:=0;
end;

procedure TReportForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataModule.ConstsQuery.Close;
end;

end.
