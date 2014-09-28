unit MO14MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, FIBDatabase, pFIBDatabase, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, ComCtrls, ToolWin, ImgList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridBandedTableView,
  cxGridDBBandedTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  pFibDataSet, cxLookAndFeelPainters, cxContainer, cxRadioGroup, StdCtrls,
  cxButtons, ExtCtrls, cxMaskEdit, cxButtonEdit, FIBDataSet, frxClass,
  frxDBSet, frxExportHTML, frxExportPDF, frxExportRTF,
  frxExportXML, frxExportXLS, cxDropDownEdit, AppStruClasses, cxCheckBox;

type
  TTMo14MainForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    ResultsDataSet: TpFIBDataSet;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    Panel4: TPanel;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    Label3: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    Label4: TLabel;
    cxButtonEdit3: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
    ActualDate:TDateTime;
  public
    { Public declarations }
    id_sch:Int64;
    id_pkv:int64;
    id_type_finance:int64;
    constructor Create(AOwner:TComponent;DbHandle:TISC_DB_HANDLE;id_User:Int64);reintroduce;
  end;

implementation

uses GlobalSpr, BaseTypes, Resources_unitb, DateUtils;

{$R *.dfm}

{ TTMoMainForm }

constructor TTMo14MainForm.Create(AOwner: TComponent;
  DbHandle: TISC_DB_HANDLE; id_User: Int64);
var  I:Integer;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;

     self.ActualDate:=Date;

     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_12));

     for i:=2000 to YearOf(ActualDate) do
     begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(i)));
     end;

     cbMonthBeg.ItemIndex:=MonthOf(ActualDate)-1;
     for i:=0 to cbYearBeg.Properties.Items.Count-1 do
     begin
         if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(ActualDate)))>0
         then begin
                   cbYearBeg.ItemIndex:=i;
                   break;
         end;
     end;
end;

procedure TTMo14MainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;


procedure TTMo14MainForm.cxButton1Click(Sender: TObject);
begin
    ActualDate:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);

    if ResultsDataSet.Active then ResultsDataSet.Close;

    if not cxCheckBox1.Checked
    then begin
              ResultsDataSet.SelectSQL.Text:='SELECT * from MBOOK_MO14_GET_DATA('+''''+DateToStr(ActualDate)+''''+',0,'+IntToStr(id_sch)+','+IntToStr(id_pkv)+','+IntToStr(id_type_finance)+')';
    end
    else begin
              ResultsDataSet.SelectSQL.Text:='SELECT * from MBOOK_MO14_GET_DATA('+''''+DateToStr(ActualDate)+''''+',1,'+IntToStr(id_sch)+','+IntToStr(id_pkv)+','+IntToStr(id_type_finance)+')';
    end;

    ResultsDataSet.Open;

    frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportMO14.fr3',true);
    frxReport1.Variables['DATA']    :=ActualDate;
    frxReport1.Variables['SCH_DATA']  :=''''+cxButtonEdit1.Text+'''';
    frxReport1.Variables['PKV_DATA']  :=''''+cxButtonEdit2.Text+'''';
    frxReport1.Variables['TYPEF_DATA']:=''''+cxButtonEdit3.Text+'''';
    frxReport1.PrepareReport(true);
    frxReport1.ShowPreparedReport;
end;

procedure TTMo14MainForm.cxButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TTMo14MainForm.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var   PC: TFMASAppModule;
      FS:Integer;
      Root:Integer;
      tmp:Integer;
begin
      with TFMASAppModuleCreator.Create do
      begin
              PC :=CreateFMASModule(ExtractFilePath(Application.ExeName)+'Kernell\','SchPackage');
              if (PC<>nil)
              then begin
                        FS  :=1;
                        Root:=-7;
                        tmp :=0;

                        PC.InParams.items['Book_date']:=PDateTime(@ActualDate);
                        PC.InParams.items['FS']       :=PInteger(@FS);
                        PC.InParams.Items['DBhandle'] :=PInteger(@WorkDatabase.Handle);
                        PC.InParams.items['AOwner']   :=@self;
                        PC.InParams.items['Root']     :=PInteger(@Root);
                        PC.InParams.items['ID_FU']    :=PInteger(@tmp);
                        PC.InParams.items['id_sch']   :=PInteger(@id_sch);

                        (PC as IFMASModule).Run;

                        if (PC.OutParams.Items['Result'])<>nil
                        then begin
                                  id_sch             :=VarAsType((PVariant(PC.OutParams.Items['Result'])^)[0][0], varInt64);
                                  cxButtonEdit1.Text :=VarToStr((PVariant(PC.OutParams.Items['Result'])^)[0][3])+' "'+
                                                       VarToStr((PVariant(PC.OutParams.Items['Result'])^)[0][1]);
                        end;
              end
              else agMessageDlg('Увага!','Помилка при работі з бібліотекою SchPackage.bpl',mtError,[mbOk]);
      end;
end;

procedure TTMo14MainForm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
      label2.Enabled:=cxCheckBox1.Checked;
      label4.Enabled:=cxCheckBox1.Checked;
      cxButtonEdit2.Enabled:=cxCheckBox1.Checked;
      cxButtonEdit3.Enabled:=cxCheckBox1.Checked;
end;

end.
