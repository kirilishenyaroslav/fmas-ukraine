unit ExtendedReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, StdCtrls, ComCtrls, ToolWin,

  cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,

  Ibase,Menus, FIBDatabase, pFIBDatabase,DateUtils,
  FIBDataSet, pFIBDataSet,pFibStoredProc, ExtCtrls, Buttons,IB_Externals,RegUnit,
  cxCheckBox, cxTextEdit, Resources_unitb, GlobalSpr,
  cxGridBandedTableView, cxGridDBBandedTableView, cxContainer, cxDBEdit,
  cxProgressBar, cxDBProgressBar,FibQuery, UPrBar, cxMaskEdit,
  cxDropDownEdit, cxLookAndFeelPainters, cxButtons, cxSpinEdit, cxTimeEdit,
  cxCalendar, cxButtonEdit, frxClass, frxDBSet;



type
  TfrmSmetaSpr = class(TForm)
    WorkDatabase: TpFIBDatabase;
    WriteTransaction: TpFIBTransaction;
    ReadTransaction: TpFIBTransaction;
    ReportDataSet: TpFIBDataSet;
    SmetaSource: TDataSource;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cxButtonEdit1: TcxButtonEdit;
    cbMonthEnd: TcxComboBox;
    cbYearEnd: TcxComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxDateEdit1: TcxDateEdit;
    cxTimeEdit1: TcxTimeEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    frxDBDataset1: TfrxDBDataset;
    RestDataSet: TpFIBDataSet;
    frxDBDataset2: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
  private
    { Private declarations }
    id_smeta   : int64;
    smeta_kod  : integer;
    smeta_title: string;
    function CheckData:Boolean;
  public
     INFINITY_DATE:TdateTime;
     ResultValue:Variant;
     { Public declarations }
     constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE);reintroduce;
  end;


implementation




{$R *.dfm}
constructor TfrmSmetaSpr.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE);
var i:Integer;
begin
      inherited Create(AOwner);
      Self.WorkDatabase.Handle:=DBHAndle;
      ReadTransaction.StartTransaction;
      cxDateEdit1.Date:=Date;
      cxTimeEdit1.Time:=Time;

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

      for i:=0 to YEARS_COUNT do
      begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      cbMonthBeg.ItemIndex:=MonthOf(Date)-1;
      for i:=0 to cbYearBeg.Properties.Items.Count-1 do
      begin
           if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(Date)))>0
           then begin
                     cbYearBeg.ItemIndex:=i;
                     break;
           end;
      end;


      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_01));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_02));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_03));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_04));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_05));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_06));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_07));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_08));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_09));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_10));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_11));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_12));

      for i:=0 to YEARS_COUNT do
      begin
          cbYearEnd.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      cbMonthEnd.ItemIndex:=MonthOf(IncMonth(Date,1))-1;
      for i:=0 to cbYearEnd.Properties.Items.Count-1 do
      begin
           if pos(cbYearEnd.Properties.Items[i],IntToStr(YearOf(IncMonth(Date,1))))>0
           then begin
                     cbYearEnd.ItemIndex:=i;
                     break;
           end;
      end;

end;

procedure TfrmSmetaSpr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;



procedure TfrmSmetaSpr.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
     Res:=GlobalSpr.GetSmets(self,
                             WorkDatabase.Handle,
                             Date,
                             psmSmet);
     if VarArrayDimCount(Res)>0
     then begin
               id_smeta   :=VarAsType(Res[0],varInt64);;
               smeta_kod  :=Res[3];
               smeta_title:=VarToStr(Res[2]);
               cxButtonEdit1.Text:=VarToStr(Res[3])+' "'+VarToStr(Res[2])+'"';
               cxButton1.Enabled:=true;
     end;
end;

procedure TfrmSmetaSpr.cxButton1Click(Sender: TObject);
var DateBeg,DateEnd:TDateTime;
begin
       if checkData
       then begin
                 DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
                 DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);

                 Screen.Cursor:=crHourGlass;
                 if RestDataSet.Active then RestDataSet.Close;
                 RestDataSet.SelectSQL.Text:=' SELECT * FROM BU_GET_BUDGET_FVALUES_RESTS('+IntToStr(id_smeta)+' ,'+
                                                                                         ''''+DateToStr(DateBeg)+''''+','+
                                                                                         ''''+DateToStr(DateEnd)+''''+')';
                 RestDataSet.Open;

                 If ReportDataSet.Active then ReportDataSet.Close;
                 ReportDataSet.SelectSQL.Text:=' SELECT * FROM BU_GET_BUDGET_FVALUES('+IntToStr(id_smeta)+' ,'+
                                                                                     ''''+DateToStr(DateBeg)+''''+','+
                                                                                     ''''+DateToStr(DateEnd)+''''+')  ORDER BY PROFIT_FLAG DESC, SHOW_POSITION, SHOW_NUM';

                 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\Reports\Budgeting\ExtendedReport.fr3',true);
                 frxReport1.Variables['TITLE']:=''''+IntToStr(smeta_kod)+' "'+smeta_title+'"('+DateToStr(DateBeg)+'-'+DateToStr(DateEnd)+')'+'''';
                 frxReport1.Variables['DATE_DATA']:=Date;
                 frxReport1.PrepareReport(true);
                 Screen.Cursor:=crDefault;
                 frxReport1.ShowPreparedReport;
       end
       else ShowMessage('Не можна сформувати звіт, бо бюджет має внутрішні бюджети в заданому періоді!');
end;

procedure TfrmSmetaSpr.cxButton2Click(Sender: TObject);
begin
     Close;
end;

function TfrmSmetaSpr.CheckData: Boolean;
var CheckStoredProc:TpFibStoredProc;
    DateBeg,DateEnd:TDateTime;
    Res:Boolean;
begin
     DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
     DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);

     CheckStoredProc            :=TpFibStoredProc.Create(self);
     CheckStoredProc.Database   :=WorkDatabase;
     CheckStoredProc.Transaction:=ReadTransaction;
     CheckStoredProc.StoredProcName:='BU_GET_BUDGET_FVALUES_CHECK';
     CheckStoredProc.Prepare;
     CheckStoredProc.ParamByName('ID_SM').Value   :=id_smeta;
     CheckStoredProc.ParamByName('DATE_BEG').Value:=DateBeg;
     CheckStoredProc.ParamByName('DATE_END').Value:=DateEnd;
     CheckStoredProc.ExecProc;
     Res:=Boolean(CheckStoredProc.ParamByName('RESULT').AsInteger);
     CheckStoredProc.Close;
     CheckStoredProc.Free;
     Result:=Res;
end;

end.
