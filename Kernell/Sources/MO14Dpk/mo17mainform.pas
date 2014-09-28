unit MO17MainForm;

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
  frxExportXML, frxExportXLS, cxDropDownEdit, AppStruClasses, cxCheckBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGridDBTableView,
  cxSplitter, frxDesgn;

type
  TTMo14MainForm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    ResultsDataSet: TpFIBDataSet;
    frxXLSExport1: TfrxXLSExport;
    frxXMLExport1: TfrxXMLExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    frxHTMLExport1: TfrxHTMLExport;
    RegsDataSet: TpFIBDataSet;
    RegsDataSource: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel4: TPanel;
    Label3: TLabel;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxGrid1: TcxGrid;
    RegsView: TcxGridDBTableView;
    RegsViewDBColumn5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxCheckBox1: TcxCheckBox;
    Panel2: TPanel;
    cxSplitter1: TcxSplitter;
    RegsViewDBColumn1: TcxGridDBColumn;
    cxCheckBox2: TcxCheckBox;
    Ds_for_DB: TpFIBDataSet;
    DS_for_Kr: TpFIBDataSet;
    ds_vibor: TpFIBDataSet;
    frxDS_DB: TfrxDBDataset;
    frxDS_KR: TfrxDBDataset;
    frxDesigner1: TfrxDesigner;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
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
     SysInfo:TpFibDataSet;
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;

     SysInfo:=TpFibDataSet.Create(self);
     SysInfo.Database:=WorkDatabase;
     SysInfo.Transaction:=ReadTransaction;
     SysInfo.SelectSQL.Text:='select * from pub_sys_data';
     SysInfo.Open;
     if (SysInfo.RecordCount>0)
     then begin
               if SysInfo.FieldByName('main_book_date').Value<>null
               then self.ActualDate:=SysInfo.FieldByName('main_book_date').Value
               else self.ActualDate:=Date;
     end
     else begin
               self.ActualDate:=Date;
     end;
     SysInfo.Close;
     SysInfo.Free;

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

     for i:=2000 to YearOf(IncYear(ActualDate,3)) do
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

     RegsDataSet.SelectSQL.Text:='SELECT * FROM PUB_SP_REG_UCH WHERE ID_FORM_UCH=1';
     RegsDataSet.Open;
     RegsDataSet.FetchAll;
end;

procedure TTMo14MainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;


procedure TTMo14MainForm.cxButton1Click(Sender: TObject);
var date_str, tip_form, name_mo:string;
    flag:Boolean;
    i:Integer;
begin
    Screen.Cursor:=crHourGlass;
    ActualDate:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);

    if cbMonthBeg.ItemIndex = 0 then date_str:='січень ' + cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 1 then date_str:='лютий '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 2 then date_str:='березень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 3 then date_str:='квітень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 4 then date_str:='травень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 5 then date_str:='липень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 6 then date_str:='червень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 7 then date_str:='серпень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 8 then date_str:='вересень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 9 then date_str:='жовтень '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 10 then date_str:='листопад '+ cbYearBeg.Text;
    if cbMonthBeg.ItemIndex = 11 then date_str:='грудень '+ cbYearBeg.Text;

    name_mo:=RegsDataSet.FieldByName('REG_TITLE').AsString;

    flag:=True;
    i:=1;
    tip_form:='';
    while ((flag) and(i<=Length(name_mo))) do
    begin
      //Showmessage(Copy(name_mo, i, 1));
     if Copy(name_mo, i, 1)='№' then
     begin
       // Showmessage(Copy(name_mo, i, 3));
       if ((Copy(name_mo, i, 3)='№14')or(Copy(name_mo, i, 4)='№ 14')) then  begin tip_form:='14'; flag:=False; end;
       if ((Copy(name_mo, i, 3)='№17') or(Copy(name_mo, i, 4)='№ 17')) then  begin tip_form:='17'; flag:=False; end;
     end;
     inc(i);
    end;
      //showmessage(tip_form);

    if ResultsDataSet.Active then ResultsDataSet.Close;

    ResultsDataSet.SelectSQL.Text:='SELECT * from MBOOK_MO_GET_DATA_EXT('+''''+DateToStr(ActualDate)+''''+',0'+','+IntToStr(id_pkv)+','+IntToStr(id_type_finance)+','
    +VarToStr(RegsView.DataController.Values[RegsView.DataController.FocusedRecordIndex,1])+','+IntToStr(Integer(cxCheckBox2.checked))+')';

    //ShowMessage(ResultsDataSet.SelectSQL.Text);

    //Mardar
     Ds_for_DB.Close;
     Ds_for_DB.SelectSQL.Clear;
     Ds_for_DB.SelectSQL.Add('select DB_NUMBER, Sum(Summa) from MBOOK_MO_GET_DATA_EXT('+''''+DateToStr(ActualDate)+''''+',0'+','+IntToStr(id_pkv)+','+IntToStr(id_type_finance)+','   +VarToStr(RegsView.DataController.Values[RegsView.DataController.FocusedRecordIndex,1])+','+IntToStr(Integer(cxCheckBox2.checked))+')group by 1');
     Ds_for_Db.CloseOpen(False);

     Ds_for_KR.Close;
     Ds_for_KR.SelectSQL.Clear;
     DS_for_Kr.SelectSQL.Add('select KR_NUMBER, Sum(Summa) from MBOOK_MO_GET_DATA_EXT('+''''+DateToStr(ActualDate)+''''+',0'+','+IntToStr(id_pkv)+','+IntToStr(id_type_finance)+','   +VarToStr(RegsView.DataController.Values[RegsView.DataController.FocusedRecordIndex,1])+','+IntToStr(Integer(cxCheckBox2.checked))+')group by 1');
     DS_for_Kr.CloseOpen(False);

    //

    ResultsDataSet.Open;

    if cxCheckBox2.checked
    then
    begin
     if tip_form='14' then frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportMO14_byMardar.fr3',true)
     else
     frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportMO17.fr3',true)
    end
    else frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Mbook\ReportMO17Full.fr3',true);

    //Maradar 06.12.12
    ds_vibor.close;
    ds_vibor.SelectSQL.Clear;
    ds_vibor.SelectSQL.Add('select c.NAME_CUSTOMER, c.SHORT_NAME, c.KOD_EDRPOU from pub_sp_customer c, pub_sys_data d where C.ID_CUSTOMER = d.organization');
    ds_vibor.CloseOpen(False);
    //

    frxReport1.Variables['NUM']     :=''''+RegsDataSet.FBN('REG_TITLE').Value+'''';
    frxReport1.Variables['DATA']    :=''''+date_str+'''';
    frxReport1.Variables['ORG_NAME_FULL']:=''''+ds_vibor.fieldbyname('NAME_CUSTOMER').AsString+'''';
    frxReport1.Variables['OKPO']:=''''+ds_vibor.fieldbyname('KOD_EDRPOU').AsString+'''';
    if tip_form='14' then
    frxReport1.Variables['num_form']:=''''+'409'+''''
    else
    frxReport1.Variables['num_form']:=''''+'274'+'''';
    frxReport1.PrepareReport(true);
    Screen.Cursor:=crDefault;
   // frxReport1.DesignReport;
    frxReport1.ShowReport;

    ds_vibor.Close;
end;

procedure TTMo14MainForm.cxButton2Click(Sender: TObject);
begin
     Close;
end;

procedure TTMo14MainForm.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     Panel2.Visible:=cxCheckBox1.Checked;

     if Panel2.Visible
     then cxSplitter1.Top:=Panel2.Top+1;
end;

end.
