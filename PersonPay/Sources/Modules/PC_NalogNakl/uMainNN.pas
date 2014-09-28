unit uMainNN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ibase, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, uMainPerem, DateUtils,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, StdCtrls, ExtCtrls, cxLookAndFeelPainters, cxButtons,
  cxCheckBox, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxDBData, cxDBEdit, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, FIBQuery, pFIBQuery, pFIBStoredProc, uWate,
  frxClass, frxDBSet, frxDesgn, ActnList;

type
  TNNMainForm = class(TForm)
    DatabaseWork: TpFIBDatabase;
    DataSetWork: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    pnl1: TPanel;
    lbl1: TLabel;
    cxDateBeg: TcxDateEdit;
    lbl2: TLabel;
    Itogs: TcxCheckBox;
    pnl2: TPanel;
    cxButtonAdd: TcxButton;
    cxButtonDelete: TcxButton;
    cxButtonShow: TcxButton;
    cxButtonPrint: TcxButton;
    cxButtonExit: TcxButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    StyleRepository: TcxStyleRepository;
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
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn4: TcxGridDBColumn;
    pnl3: TPanel;
    lbl3: TLabel;
    cxDBUser: TcxDBTextEdit;
    lbl4: TLabel;
    cxDBNote: TcxDBTextEdit;
    Ds_itog: TpFIBDataSet;
    DataSetWorkID_NN_ALL: TFIBBCDField;
    DataSetWorkDATE_NN: TFIBDateField;
    DataSetWorkSUMMA: TFIBBCDField;
    DataSetWorkSUMMA_NDS: TFIBBCDField;
    DataSetWorkNDS: TFIBStringField;
    DataSetWorkNOTE: TFIBStringField;
    DataSetWorkID_USER: TFIBBCDField;
    DataSetWorkUSER_NAME: TFIBStringField;
    Ds_itogID_NN_ALL: TFIBBCDField;
    Ds_itogDATE_NN: TFIBDateField;
    Ds_itogSUMMA: TFIBBCDField;
    Ds_itogSUMMA_NDS: TFIBBCDField;
    Ds_itogNDS: TFIBStringField;
    Ds_itogNOTE: TFIBStringField;
    Ds_itogID_USER: TFIBBCDField;
    Ds_itogUSER_NAME: TFIBStringField;
    ds1: TDataSource;
    cxButton1: TcxButton;
    StorProc: TpFIBStoredProc;
    ReadTr: TpFIBTransaction;
    frxReport: TfrxReport;
    frxDesigner: TfrxDesigner;
    cxCheckEdit: TcxCheckBox;
    actlst1: TActionList;
    act1: TAction;
    cxDateEnd: TcxDateEdit;
    lbl5: TLabel;
    ds_user: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    procedure ItogsPropertiesChange(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonExitClick(Sender: TObject);
    procedure cxButtonShowClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxButtonDeleteClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
    procedure cxButtonPrintClick(Sender: TObject);
    procedure act1Execute(Sender: TObject);
  private

  public
    DBHANDLE : TISC_DB_HANDLE;
    ID_REG_1, USER_ID  : Integer;
    main_period:TDateTime;
    constructor Create(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  PERS_PAY_PERIOD:TDateTime; ID_REG:Integer; ID_USER:Integer);overload;
  end;
  procedure ShowNaklForm(AOwner:TComponent; DBHANDLE : TISC_DB_HANDLE;  PERS_PAY_PERIOD:TDateTime; ID_REG:Integer; ID_USER:Integer); stdcall;
  exports ShowNaklForm;
var
  NNMainForm: TNNMainForm;

implementation

{$R *.dfm}
 uses uShowNN, uDelNN, uAddNN;
constructor TNNMainForm.Create(AOwner:TComponent;DBHANDLE : TISC_DB_HANDLE; PERS_PAY_PERIOD:TDateTime; ID_REG:Integer; ID_USER:Integer);
begin
 inherited Create(AOwner);
 if Assigned(DBHandle)
 then begin
  Self.DBHANDLE := DBHandle;
  Self.DatabaseWork.Close;
  Self.DatabaseWork.Handle:=DBHANDLE;
  Self.cxDateBeg.EditValue:=PERS_PAY_PERIOD;
  Self.cxDateEnd.EditValue:=EndOfTheMonth(PERS_PAY_PERIOD);
  Self.main_period:=PERS_PAY_PERIOD;
  Self.DataSetWork.Close;
  Self.DataSetWork.Prepare;
  Self.DataSetWork.ParamByName('DATE_BEG').asDate:=cxDateBeg.EditValue;
  Self.DataSetWork.ParamByName('DATE_END').asDate:=cxDateEnd.EditValue;
  Self.DataSetWork.ParamByName('ID_REG').AsInteger:=ID_REG;
  Self.DataSetWork.CloseOpen(False);
  Self.cxCheckEdit.Visible:=False;
  self.ID_REG_1:=ID_REG;
  Self.USER_ID:=ID_USER;
 end;
end;

procedure ShowNaklForm(AOwner:TComponent;  DBHANDLE : TISC_DB_HANDLE; PERS_PAY_PERIOD:TDateTime; ID_REG:Integer; ID_USER:Integer);stdcall;
var
 form : TNNMainForm;
begin
 form := TNNMainForm.Create(AOwner, DBHANDLE, PERS_PAY_PERIOD, ID_REG, ID_USER);
 Form.Show;
end;
procedure TNNMainForm.ItogsPropertiesChange(Sender: TObject);
begin
if Itogs.Checked = True then
begin
  ds1.DataSet:=Ds_itog;
  Ds_itog.Close;
  Ds_itog.Prepare;
  Ds_itog.ParamByName('DATE_BEG').asDate:=cxDateBeg.EditValue;
  Ds_itog.ParamByName('DATE_END').asDate:=cxDateEnd.EditValue;
  Ds_itog.ParamByName('ID_REG').AsInteger:=ID_REG_1;
  Ds_itog.CloseOpen(False);
end
else
begin
  ds1.DataSet:=DataSetWork;
  DataSetWork.Close;
  DataSetWork.Prepare;
  DataSetWork.ParamByName('DATE_BEG').asDate:=cxDateBeg.EditValue;
  DataSetWork.ParamByName('DATE_END').asDate:=cxDateEnd.EditValue;
  DataSetWork.ParamByName('ID_REG').AsInteger:=ID_REG_1;
  DataSetWork.CloseOpen(False);
end;
end;

procedure TNNMainForm.cxButton1Click(Sender: TObject);
begin
 if ds1.DataSet=Ds_itog then
 begin
 Ds_itog.Close;
  Ds_itog.Prepare;
  Ds_itog.ParamByName('DATE_BEG').asDate:=cxDateBeg.EditValue;
  Ds_itog.ParamByName('DATE_END').asDate:=cxDateEnd.EditValue;
  Ds_itog.ParamByName('ID_REG').AsInteger:=ID_REG_1;
  Ds_itog.CloseOpen(False);
 end;
 if ds1.DataSet=DataSetWork then
 begin
   DataSetWork.Close;
  DataSetWork.Prepare;
  DataSetWork.ParamByName('DATE_BEG').asDate:=cxDateBeg.EditValue;
  DataSetWork.ParamByName('DATE_END').asDate:=cxDateEnd.EditValue;
  DataSetWork.ParamByName('ID_REG').AsInteger:=ID_REG_1;
  DataSetWork.CloseOpen(False);
 end;
end;

procedure TNNMainForm.cxButtonExitClick(Sender: TObject);
begin
Close;
end;

procedure TNNMainForm.cxButtonShowClick(Sender: TObject);
var f:TShowNNForm;
ff:TWateForm;
    date_nn:TDateTime;
    user_name:string;
begin
if ds1.DataSet= DataSetWork then
date_nn:=DataSetWorkDATE_NN.AsDateTime
else
date_nn:=Ds_itogDATE_NN.AsDateTime;

ds_user.Close;
ds_user.SelectSQL.Text:='select first(1) full_name from users where id_user='+inttostr(USER_ID);
ds_user.Prepare;
ds_user.CloseOpen(False);
ds_user.FetchAll;
user_name:=ds_user.FieldValues['full_name'];

f:=TShowNNForm.Create(Self);
 ff:=TWateForm.Create(Self);
 ff.Show;
 ff.Update;
f.lbl1.Caption:='Податкова накладна за '+DateTostr(date_nn);
f.cxCheckEdit.Checked:=False;
f.cxCheckEdit.Visible:=False;
f.pFIBDataSet.Close;
if Itogs.Checked = False then
f.pFIBDataSet.SelectSQL.Text:='select * from PC_NN_DOG_SELECT(:id_reg, :date_nn) order by name_customer, fio, sm_kod, rz_kod, st_kod, kekv_kod'
else
f.pFIBDataSet.SelectSQL.Text:='select * from PC_NN_DOG_ALL_SELECT(:id_reg, :date_nn) order by name_customer, fio, sm_kod, rz_kod, st_kod, kekv_kod';
f.pFIBDataSet.Prepare;
f.pFIBDataSet.ParamByName('ID_REG').AsInteger:=ID_REG_1;
f.pFIBDataSet.ParamByName('DATE_NN').AsDate:=date_nn;
f.pFIBDataSet.CloseOpen(False);
f.FIO_USER:= user_name;
f.ShowModal;
FF.free;
f.free;
end;

procedure TNNMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TNNMainForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    cxButtonShowClick(Self);
end;

procedure TNNMainForm.cxButtonDeleteClick(Sender: TObject);
var f:TDelNNForm;
ff:TWateForm;
    date_nn:TDateTime;
begin
  if (ds1.DataSet=DataSetWork) and (DataSetWork.IsEmpty) then Exit;
    if (ds1.DataSet=Ds_itog) and (Ds_itog.IsEmpty) then Exit;
 f:=TDelNNForm.Create(Self);
 if ds1.DataSet=DataSetWork then
 date_nn:= DataSetWorkDATE_NN.AsDateTime
 else  date_nn:= Ds_itogDATE_NN.AsDateTime;

 f.lbl2.Caption:=  DatetoStr(date_nn);

 f.ShowModal;
 if f.ModalResult=mrOk then
 begin
 ff:=TWateForm.Create(Self);
 ff.Show;
 ff.Update;
  try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_NN_DELETE';
 StorProc.Prepare;
 StorProc.ParamByName('ID_REG').AsInteger:=ID_REG_1;
 StorProc.ParamByName('DATE_NN').AsDate:=date_nn;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
 end;
 if ds1.DataSet=DataSetWork then
 DataSetWork.CloseOpen(False)
 else  Ds_itog.CloseOpen(False);
 ff.free;
 end;

 f.Free;
end;

procedure TNNMainForm.cxButtonAddClick(Sender: TObject);
var f:TAddNNForm;
    ff:TWateForm;
begin
 f:=TAddNNForm.Create(self);
 f.cxDateEdit1.EditValue:=main_period;
 f.ID_DOG:=0;
 f.DBHandle:=DatabaseWork.Handle;
 f.ShowModal;
 if f.ModalResult = mrok then
 begin
 ff:=TWateForm.Create(Self);
 ff.Show;
 ff.Update;
 try
 StorProc.Close;
 StorProc.Transaction := ReadTr;
 StorProc.Transaction.StartTransaction;
 StorProc.StoredProcName:='PC_NN_CHECK';
 StorProc.Prepare;
 StorProc.ParamByName('ID_REG').AsInteger:=ID_REG_1;
 StorProc.ParamByName('DATE_NN').AsDate:=f.cxDateEdit1.EditValue;
 if f.cxIsCloseSch.Checked = True then
 StorProc.ParamByName('IS_CLOSE_SCH').AsInteger:=1
 else StorProc.ParamByName('IS_CLOSE_SCH').AsInteger:=0;
 StorProc.ParamByName('NOTE').AsString:=f.cxTextEdit1.Text;
 StorProc.ParamByName('ID_USER').AsInteger:=USER_ID;
// StorProc.ParamByName('DOG_NUM').AsString:=f.cxDogEdit.Text;
 StorProc.ExecProc;
 StorProc.Transaction.Commit;
 except on E : Exception
 do begin
  ShowMessage(E.Message);
  StorProc.Transaction.Rollback;
  exit;
    end;
 end;
 if ds1.DataSet=DataSetWork then
 DataSetWork.CloseOpen(False)
 else  Ds_itog.CloseOpen(False);
 ff.Free;
 end;

 f.Free;
end;

procedure TNNMainForm.cxButtonPrintClick(Sender: TObject);
begin
frxReport.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS+ '/print_nn.fr3');
frxReport.Variables['DATE_NN']:=''''+DataSetWorkDATE_NN.AsString+'''';
frxReport.Variables['USER']:=''''+DataSetWorkUSER_NAME.AsString+'''';
frxReport.Variables['NOTE']:=''''+DataSetWorkNOTE.AsString+'''';
frxReport.Variables['SUMMA']:=''''+DataSetWorkSUMMA.AsString+'''';
frxReport.Variables['SUMMA_NDS']:=''''+DataSetWorkSUMMA_NDS.AsString+'''';
frxReport.PrepareReport;
frxReport.PrintOptions.ShowDialog:=True;
if cxCheckEdit.Checked then  frxReport.DesignReport
else frxReport.ShowReport;
end;

procedure TNNMainForm.act1Execute(Sender: TObject);
begin
 if cxCheckEdit.Visible = False then cxCheckEdit.Visible:=True
 else cxCheckEdit.Visible:=False;
end;

end.
