unit st_ReportShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxRadioGroup, cxButtons,
  cxControls, cxGroupBox, DB, FIBDataSet, pFIBDataSet, frxClass, frxDesgn,
  frxDBSet, ActnList, ExtCtrls;

type
  TfrmReportShow = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    frxDBDataset1: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    pFIBDataSetReport: TpFIBDataSet;
    frxReport: TfrxReport;
    ActionList1: TActionList;
    ActionDesigned: TAction;
    Image1: TImage;
    procedure cxButton1Click(Sender: TObject);
    procedure ActionDesignedExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReportShow: TfrmReportShow;
  DesignedRep:Integer;
implementation

uses DataModule1_Unit;

{$R *.dfm}

procedure TfrmReportShow.cxButton1Click(Sender: TObject);
begin
pFIBDataSetReport.Active:=false;
pFIBDataSetReport.Database:=DataModule1.DB;
if cxRadioButton1.Checked=true then
   begin
     pFIBDataSetReport.SelectSQL.Text:='select * from ST_SPRAV_REESTR_SELECT';
     pFIBDataSetReport.Active:=true;
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\RST_Sprav.fr3');
   end
   else
   begin
     pFIBDataSetReport.SelectSQL.Text:='select * from ST_SPRAV_SVOD_SELECT'; 
     pFIBDataSetReport.Active:=true;
     frxReport.Clear;
     frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Studcity\SvST_Sprav.fr3');
   end;
if DesignedRep=1 then
  begin
    frxReport.DesignReport;
  end
  else
  begin
    frxReport.ShowReport(true);
  end;
end;

procedure TfrmReportShow.ActionDesignedExecute(Sender: TObject);
begin
  if DesignedRep=0 then
    begin
      DesignedRep:=1;
    end
    else
    begin
      DesignedRep:=0;
    end;
end;

procedure TfrmReportShow.FormCreate(Sender: TObject);
begin
  DesignedRep:=0;
end;

procedure TfrmReportShow.cxButton2Click(Sender: TObject);
begin
close;
end;

end.
