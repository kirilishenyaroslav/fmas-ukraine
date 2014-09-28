unit UZEmailHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxSplitter, ExtCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxHyperLinkEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxClasses, Ibase,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, cxContainer,
  cxTextEdit, cxMemo, cxDBEdit, cxLookAndFeelPainters, StdCtrls, cxButtons,
  frxClass, frxDBSet, DateUtils, dates, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCheckBox, cxButtonEdit, PackageLoad, frxExportPDF,
  frxExportImage, frxExportRTF, frxExportXML, frxExportXLS, frxExportHTML,
  frxExportTXT;

type
  TfrmZEmailHistory = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    Styles: TcxStyleRepository;
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
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    MailsDataSet: TpFIBDataSet;
    MailItemsDataSet: TpFIBDataSet;
    MailsDataSource: TDataSource;
    MailItemsDataSource: TDataSource;
    Panel3: TPanel;
    cxDBMemo1: TcxDBMemo;
    cxGridDBTableView2DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    Panel4: TPanel;
    cxButton1: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView2DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    frxReport1: TfrxReport;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    Panel5: TPanel;
    frxTXTExport1: TfrxTXTExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDateEdit1Exit(Sender: TObject);
    procedure cxDateEdit2Exit(Sender: TObject);
    procedure cxButtonEdit1Exit(Sender: TObject);
  private
    { Private declarations }
    Man:Variant;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

{ TfrmZEmailHistory }

constructor TfrmZEmailHistory.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     cxDateEdit1.Date:=date-90;
     cxDateEdit2.Date:=date+1;
     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;
     MailsDataSet.SelectSQL.Text:='select * from Z_EMAIL_LOGS_SEL(:par1, :par2, :par3) order by datetime';
     MailsDataSet.Prepare;
     MailsDataSet.ParamByName('par1').Value:=cxDateEdit1.Date;
     MailsDataSet.ParamByName('par2').Value:=cxDateEdit2.Date;
     MailsDataSet.ParamByName('par3').Value:=-1;
     MailsDataSet.Open;
     MailsDataSet.Last;
     MailItemsDataSet.SelectSQL.Text:='select * from Z_EMAIL_PROTOCOL_SEL2(?ID_LOG) order by fio';
     SendMessage(self.Handle,WM_SIZE,SIZE_MAXIMIZED,0);
end;

procedure TfrmZEmailHistory.cxButton1Click(Sender: TObject);
begin
     if (MailsDataSet.RecordCount>0)
     then begin
               cxGrid2.BeginUpdate;

               frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Zarplata\ZEmailHistory.fr3',true);
               frxReport1.Variables['PR_DATE']:=''''+MailsDataSet.FieldByName('datetime').AsString+'''';
               frxReport1.Variables['PR_NUMBER']:=''''+MailsDataSet.FieldByName('id_log').AsString+'''';

               if MailsDataSet.FieldByName('log_type').Value=1 then frxReport1.Variables['PR_TYPE']:=''''+' розсилки відомостей заробітної плати '+'''';
               if MailsDataSet.FieldByName('log_type').Value=2 then frxReport1.Variables['PR_TYPE']:=''''+' інформаційної розсилки '+'''';
               if MailsDataSet.FieldByName('log_type').Value=3 then frxReport1.Variables['PR_TYPE']:=''''+' розсилки парольної інформації '+'''';

               frxReport1.Variables['USER_NAME']:=''''+MailsDataSet.FieldByName('USER_NAME').AsString+'''';
               frxReport1.Variables['IP']:=''''+MailsDataSet.FieldByName('IP').AsString+'''';
               frxReport1.Variables['COMPUTER_NAME']:=''''+MailsDataSet.FieldByName('COMPUTER_NAME').AsString+'''';

               frxReport1.PrepareReport(true);
               frxReport1.ShowPreparedReport;
               cxGrid2.EndUpdate;
     end;
end;

procedure TfrmZEmailHistory.cxButton2Click(Sender: TObject);
begin
     if MailsDataSet.Active then MailsDataSet.Close;
     MailsDataSet.SelectSQL.Clear;
     MailsDataSet.SelectSQL.Text:='select * from Z_EMAIL_LOGS_SEL(:par1, :par2, :par3) order by datetime';
     MailsDataSet.Prepare;
     MailsDataSet.ParamByName('par1').Value:=cxDateEdit1.Date;
     MailsDataSet.ParamByName('par2').Value:=cxDateEdit2.Date;

     if VarArrayDimCount(Man)> 0
     then begin
               If (cxCheckBox1.Checked)
               then begin
                         MailsDataSet.ParamByName('par3').Value:=Man[0];
               end
               else MailsDataSet.ParamByName('par3').Value:=-1;
     end
     else MailsDataSet.ParamByName('par3').Value:=-1;

     MailsDataSet.Open;
     MailsDataSet.Last;

end;

procedure TfrmZEmailHistory.cxCheckBox1Click(Sender: TObject);
begin
     cxButtonEdit1.Enabled:=cxCheckBox1.Checked;
     cxButton2Click(self);
end;

procedure TfrmZEmailHistory.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
     Man:=LoadPeopleModal(Self,WorkDatabase.Handle);
     if VarArrayDimCount(Man)> 0
     then begin
               If (Man[0]<>NULL)
               then begin
                         cxButtonEdit1.Text := VarToStr(Man[1])+' '+VarToStr(Man[2])+' '+VarToStr(Man[3]);

               end;
     end;
end;

procedure TfrmZEmailHistory.cxDateEdit1Exit(Sender: TObject);
begin
cxButton2Click(self);
end;

procedure TfrmZEmailHistory.cxDateEdit2Exit(Sender: TObject);
begin
cxButton2Click(self);
end;

procedure TfrmZEmailHistory.cxButtonEdit1Exit(Sender: TObject);
begin
cxButton2Click(self);
end;

end.
