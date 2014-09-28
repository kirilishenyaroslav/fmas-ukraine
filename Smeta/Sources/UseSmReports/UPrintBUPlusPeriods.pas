unit UPrintBUPlusPeriods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, FIBDatabase, pFIBDatabase, Ibase, frxClass, frxDBSet, DB,
  FIBDataSet, pFIBDataSet, cxRadioGroup, cxCheckBox, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, ComCtrls, cxButtonEdit,pFibStoredProc;

type
  TfrmPrintSmetPlusPeriods = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    SmPlusPeriodsDataset: TfrxDBDataset;
    SmetPlusPeriodsDataSet: TpFIBDataSet;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxCheckBox1: TcxCheckBox;
    GroupBox1: TGroupBox;
    cxCheckBox2: TcxCheckBox;
    cxCheckBox3: TcxCheckBox;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    cxDateEdit3: TcxDateEdit;
    Label6: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    Label7: TLabel;
    Label8: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label9: TLabel;
    cxButtonEdit3: TcxButtonEdit;
    frxReport1: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
    procedure cxCheckBox3PropertiesChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    ID_PKV:Integer;
    id_type_finance: Integer;
    id_sm_group:Integer;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE);overload;
  end;


implementation

uses GlobalSpr;

{$R *.dfm}

constructor TfrmPrintSmetPlusPeriods.Create(AOwner: TComponent;
  DB_HANDLE: TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     WorkDatabase.Handle:=DB_HANDLE;
     ReadTransaction.StartTransaction;
end;

procedure TfrmPrintSmetPlusPeriods.FormCreate(Sender: TObject);
begin
     cxDateEdit1.Date:=Date;
     cxDateEdit2.Date:=Date;
     cxDateEdit3.Date:=Date;
end;

procedure TfrmPrintSmetPlusPeriods.cxButton1Click(Sender: TObject);
var str:string;
begin
            if SmetPlusPeriodsDataSet.Active then SmetPlusPeriodsDataSet.Close;

            if RadioButton1.Checked
            then begin
                        SmetPlusPeriodsDataSet.SelectSQL.Text:=' SELECT * FROM BU_GET_BUDGETS_UNDER_PKV2('+
                        IntToStr(ID_PKV)+','+
                        IntToStr(id_type_finance)+','+
                        ''''+DateTimeToStr(cxDateEdit3.Date)+''''+') ORDER BY SMETA_KOD';
                        SmetPlusPeriodsDataSet.Open;
                        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmPkv_BU.fr3',true);
                        frxReport1.Variables['PKV']:=''''+'програма '+cxButtonEdit1.Text+'''';
                        frxReport1.Variables['TF']:=''''+'тип коштів '+cxButtonEdit2.Text+'''';
                        frxReport1.Variables['DD']:=''''+' на дату '+DateToStr(cxDateEdit3.Date)+'''';

            end
            else begin
                        SmetPlusPeriodsDataSet.SelectSQL.Text:=' SELECT * FROM BU_GET_BUDGETS_UNDER_PKV3('+
                        IntToStr(id_sm_group)+','+
                        ''''+DateTimeToStr(cxDateEdit3.Date)+''''+') ORDER BY SMETA_KOD';

                        SmetPlusPeriodsDataSet.Open;
                        frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ReportSmPkv_BU.fr3',true);
                        frxReport1.Variables['PKV']:=''''+'група бюджетів '+cxButtonEdit3.Text+'''';
                        frxReport1.Variables['TF']:=''''+'-'+'''';
                        frxReport1.Variables['DD']:=''''+' на дату '+DateToStr(cxDateEdit3.Date)+'''';
            end;
            frxReport1.PrepareReport(true);
            Screen.Cursor:=crDefault;
            frxReport1.ShowPreparedReport;



end;

procedure TfrmPrintSmetPlusPeriods.cxCheckBox1PropertiesChange(
  Sender: TObject);
begin
  if cxCheckBox1.Checked
  then begin
     cxCheckBox2.Enabled:=true;
     cxCheckBox3.Enabled:=true;
  end
  else begin
     cxCheckBox2.Enabled:=false;
     cxCheckBox3.Enabled:=false;
  end;
end;

procedure TfrmPrintSmetPlusPeriods.cxCheckBox2PropertiesChange(
  Sender: TObject);
begin
  if cxCheckBox2.Checked
  then begin
     cxLookupComboBox1.Enabled:=true;
  end
  else begin
     cxLookupComboBox1.Enabled:=false;
  end;

end;

procedure TfrmPrintSmetPlusPeriods.cxCheckBox3PropertiesChange(
  Sender: TObject);
begin
  if cxCheckBox3.Checked
  then begin
     cxLookupComboBox2.Enabled:=true;
  end
  else begin
     cxLookupComboBox2.Enabled:=false;
  end;

end;

procedure TfrmPrintSmetPlusPeriods.cxButton2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmPrintSmetPlusPeriods.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmPrintSmetPlusPeriods.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var res:variant;
    PKVInfoSP:TpFibDataSet;
begin
    Res:=GlobalSpr.GetSmPKV(self, WorkDatabase.Handle, fsNormal, id_pkv);
    if Res<>null
    then begin
              id_pkv:= VarAsType(res,varInteger);
              PKVInfoSP:=TpFibDataSet.Create(Self);
              PKVInfoSP.Database:=WorkDatabase;
              PKVInfoSP.Transaction:=ReadTransaction;
              PKVInfoSP.SelectSQL.Text:='SELECT * FROM PUB_SP_SM_PKV WHERE ID_PKV='+IntToStr(ID_PKV);
              PKVInfoSP.Open;
              PKVInfoSP.FetchAll;
              cxButtonEdit1.Text:=PKVInfoSP.FieldByName('PKV_KOD').AsString+' "'+PKVInfoSP.FieldByName('PKV_TITLE').AsString+'"';
              PKVInfoSP.Close;
              PKVInfoSP.Free;
    end;
end;

procedure TfrmPrintSmetPlusPeriods.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    PKVInfo:TpFibDataSet;
begin
    Res:=GlobalSpr.GetTypeFinance(self,WorkDatabase.Handle,fsNormal,0);
    if Res<>Variant(0)
    then begin
               id_type_finance:=VarAsType(Res,varInteger);
               PKVInfo:=TpFibDataSet.Create(self);
               PKVInfo.Database:=WorkDatabase;
               PKVInfo.Transaction:=ReadTransaction;
               PKVInfo.SelectSQL.Text:='SELECT * FROM PUB_SP_TYPE_FINANCE WHERE ID_TYPE_FINANCE='+IntToStr(id_type_finance);
               PKVInfo.Open;
               PKVInfo.FetchAll;
               if (PKVInfo.RecordCount>0)
               then begin
                         cxButtonEdit2.Text:=PKVInfo.FieldByName('TYPE_FINANCE_NAME').AsString;
               end;
               PKVInfo.Close;
               PKVInfo.Free;
    end;
end;

procedure TfrmPrintSmetPlusPeriods.RadioButton1Click(Sender: TObject);
begin
     Label9.Enabled:=not RadioButton1.Checked;
     cxButtonEdit3.Enabled:=not RadioButton1.Checked;

     Label7.Enabled:=RadioButton1.Checked;
     Label8.Enabled:=RadioButton1.Checked;
     cxButtonEdit1.Enabled:=RadioButton1.Checked;
     cxButtonEdit2.Enabled:=RadioButton1.Checked;
end;

procedure TfrmPrintSmetPlusPeriods.RadioButton2Click(Sender: TObject);
begin
     Label9.Enabled:=RadioButton2.Checked;
     cxButtonEdit3.Enabled:=RadioButton2.Checked;

     Label7.Enabled:=not RadioButton2.Checked;
     Label8.Enabled:=not RadioButton2.Checked;
     cxButtonEdit1.Enabled:=not RadioButton2.Checked;
     cxButtonEdit2.Enabled:=not RadioButton2.Checked;

end;

procedure TfrmPrintSmetPlusPeriods.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
begin
    Res:=GlobalSpr.GetSmGrp(self,WorkDatabase.Handle,fsNormal,0,458);
    if VarArrayDimCount(Res)>0
    then begin
               id_sm_group       :=Res[0];
               cxButtonEdit3.Text     :=VarToStr(Res[1]);
    end;
end;

end.
