unit UCardGetConfigure;

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
  cxProgressBar, cxDBProgressBar,FibQuery, cxMaskEdit,
  cxDropDownEdit, cxLookAndFeelPainters, cxButtons, cxSpinEdit, cxTimeEdit,
  cxCalendar, cxButtonEdit, frxClass, frxDBSet, cxSplitter;



type
  TfrmConfigureFrm = class(TForm)
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ACardsParamsDataSet: TpFIBDataSet;
    ACardsDataSource: TDataSource;
    WriteTransaction: TpFIBTransaction;
    Panel1: TPanel;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    SchDataSet: TpFIBDataSet;
    SchDataSource: TDataSource;
    SchDataSetF: TpFIBDataSet;
    SchDataSourceF: TDataSource;
    Panel2: TPanel;
    SchGrid: TcxGrid;
    SchView: TcxGridDBTableView;
    SchViewDBColumn5: TcxGridDBColumn;
    SchViewDBColumn1: TcxGridDBColumn;
    SchLevel: TcxGridLevel;
    Panel3: TPanel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    Label1: TLabel;
    Label7: TLabel;
    cxDateEdit1: TcxDateEdit;
    Panel4: TPanel;
    cxSplitter1: TcxSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel5: TPanel;
    Panel6: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel7: TPanel;
    Label8: TLabel;
    cxButton6: TcxButton;
    cxButton7: TcxButton;
    cxButton1: TcxButton;
    cxSplitter2: TcxSplitter;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDateEdit2: TcxDateEdit;
    cxDateEdit3: TcxDateEdit;
    cxButton2: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton7Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxDateEdit2PropertiesCloseUp(Sender: TObject);
  private
    { Private declarations }
    function Checkdata:Boolean;
  public
     id_user    : Int64;
     id_pkv   : int64;
     pkv_kod  : String;
     pkv_title: string;
     id_tfin   : int64;
     tfin_kod  : String;
     tfin_title: string;     date_beg   : TDateTime;
     date_end   : TDateTime;
     { Public declarations }
     constructor Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; id_user:Integer);reintroduce;
  end;


implementation

uses UFormKassaResults, UParamsEx, UFormFactResults;

{$R *.dfm}
constructor TfrmConfigureFrm.Create(AOwner:TComponent; DBHandle:TISC_DB_HANDLE; id_user:Integer);
begin
      inherited Create(AOwner);
      WorkDatabase.Handle:=DBHandle;
      ReadTransaction.StartTransaction;
      id_pkv   :=-1;
      id_tfin  :=-1;

      ACardsParamsDataSet.SelectSQL.Text:='select * from ACARDS_PRE_FORM_PARAMS_SEL(2) ';
      ACardsParamsDataSet.Open;
      SchDataSet.SelectSQL.Text:='select * from ACARDS_PRE_FORMS_SCH_SEL(:ID_PARAM_SET)';
      cxDateEdit2.Date:=Date;
      cxDateEdit3.Date:=EndOfTheYear(Date);
      SchDataSetF.SelectSQL.Text:='select * from ACARDS_PRE_FORMS_SCHF_SEL2(:ID_PARAM_SET,'+''''+cxDateEdit2.Text+''''+','+''''+cxDateEdit2.Text+''''+',:ID_PKV,:ID_TF,0) '+
                                  '  union  '+
                                  'select * from ACARDS_PRE_FORMS_SCHF_SEL2(:ID_PARAM_SET,'+''''+cxDateEdit2.Text+''''+','+''''+cxDateEdit2.Text+''''+',:ID_PKV,:ID_TF,1) ';              ;
end;

procedure TfrmConfigureFrm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;



procedure TfrmConfigureFrm.cxButton1Click(Sender: TObject);
begin
     if checkdata
     then begin
               TfrmGetResults.Create(Application.MainForm,
                                       WorkDatabase.Handle,
                                       id_user,
                                       ACardsParamsDataSet.FieldByName('ID_PARAM_SET').Value);
     end
     else ShowMessage('Не введені всі параметри для розрахунку картки!');
end;

procedure TfrmConfigureFrm.FormCreate(Sender: TObject);
begin
      cxDateEdit1.Date:=Date;
end;

procedure TfrmConfigureFrm.cxButton3Click(Sender: TObject);
 var Res:Variant;
      id_sch:Int64;
      InsertSP:TpFibStoredProc;
begin
      if (ACardsParamsDataSet.RecordCount>0)
      then begin
                Res:=GlobalSpr.GetSch(self,
                                      WorkDatabase.Handle,
                                      fsNormal,cxDateEdit1.Date,1,0,0);
                if VarArrayDimCount(Res)>0
                then begin
                          id_sch:=VarAsType(RES[0][0],varInt64);
                          InsertSP:=TpFibStoredProc.Create(self);
                          InsertSP.Database   :=WorkDatabase;
                          InsertSP.Transaction:=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          InsertSP.StoredProcName:='ACARDS_PRE_FORMS_SCH_INS';
                          InsertSP.Prepare;
                          InsertSP.ParamByName('ID_PARAM_SET').Value        :=ACardsParamsDataSet.FieldByName('ID_PARAM_SET').Value;
                          InsertSP.ParamByName('ID_SCH').AsInt64            :=id_sch;
                          InsertSP.ParamByName('ACTUAL_DATE').Value         :=cxDateEdit1.Date;
                          InsertSP.ExecProc;
                          WriteTransaction.Commit;
                          InsertSP.Free;
                          SchDataSet.CloseOpen(true);
                end;
      end
      else ShowMessage('Ви не ввели ще жодного шаблону!');
end;

function TfrmConfigureFrm.Checkdata: Boolean;
begin
     if  (SchDataSet.RecordCount>0)
     and (ACardsParamsDataSet.RecordCount>0)
     then Result:=true
     else Result:=false;
end;

procedure TfrmConfigureFrm.cxButton6Click(Sender: TObject);
var F:TfrmEditMainParams;
    InsertSP:TpFIBStoredProc;
    id_set:Integer;
begin
     F:=TfrmEditMainParams.Create(self,WorkDatabase,ReadTransaction,id_user);
     if F.ShowModal=mrYes
     then begin
               InsertSP:=TpFIBStoredProc.Create(self);
               InsertSP.Database:=WorkDatabase;
               InsertSP.Transaction:=WriteTransaction;
               InsertSP.StoredProcName:='ACARDS_PRE_FORM_PARAMS_INS';
               WriteTransaction.StartTransaction;
               InsertSP.Prepare;
               InsertSP.ParamByName('id_acard_type').Value:=2;
               InsertSP.ParamByName('param_set_name').Value:=F.cxMemo1.Text;
               InsertSP.ParamByName('id_pkv').Value:=f.id_pkv;
               InsertSP.ParamByName('id_tf').Value:=f.id_tfin;
               InsertSP.ExecProc;
               id_set:=InsertSP.ParamByName('id_param_set').Value;
               WriteTransaction.Commit;
               ACardsParamsDataSet.CloseOpen(true);
               ACardsParamsDataSet.Locate('id_param_set',id_set,[]);
               InsertSP.Free;
     end;
     F.Free;
end;

procedure TfrmConfigureFrm.cxButton4Click(Sender: TObject);
var DeleSP:TpFIBStoredProc;
begin
     if (SchDataSet.RecordCount>0)
     then begin
               DeleSP:=TpFIBStoredProc.Create(self);
               DeleSP.Database:=WorkDatabase;
               DeleSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               DeleSP.StoredProcName:='ACARDS_PRE_FORMS_SCH_DEL';
               DeleSP.Prepare;
               DeleSP.ParamByName('ID_REC').Value:=SchDataSet.FieldByname('id_rec').Value;
               DeleSP.ExecProc;
               WriteTransaction.Commit;
               SchDataSet.CacheDelete;
               DeleSP.Free;
     end;
end;

procedure TfrmConfigureFrm.cxButton7Click(Sender: TObject);
var
    DeleSp:TpFIBStoredProc;
begin
     if (ACardsParamsDataSet.RecordCount>0)
     then begin
               DeleSP:=TpFIBStoredProc.Create(self);
               DeleSP.Database:=WorkDatabase;
               DeleSP.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               DeleSP.StoredProcName:='ACARDS_PRE_FORM_PARAMS_DEL';
               DeleSP.Prepare;
               DeleSP.ParamByName('id_param_set').Value:=ACardsParamsDataSet.FieldByname('id_param_set').Value;
               DeleSP.ExecProc;
               WriteTransaction.Commit;
               ACardsParamsDataSet.CacheDelete;
               DeleSP.Free;
     end;

end;

procedure TfrmConfigureFrm.cxButton2Click(Sender: TObject);
begin
     if checkdata
     then begin
               TfrmGetFactResults.Create(Application.MainForm,
                                       WorkDatabase.Handle,
                                       id_user,
                                       ACardsParamsDataSet.FieldByName('ID_PARAM_SET').Value);
     end
     else ShowMessage('Не введені всі параметри для розрахунку картки!');

end;

procedure TfrmConfigureFrm.cxDateEdit2PropertiesCloseUp(Sender: TObject);
begin
      if SchDataSetF.Active then SchDataSetF.Close;
     SchDataSetF.SelectSQL.Text:='select * from ACARDS_PRE_FORMS_SCHF_SEL2(:ID_PARAM_SET,'+''''+cxDateEdit2.Text+''''+','+''''+cxDateEdit3.Text+''''+',:ID_PKV,:ID_TF,0)';
     SchDataSetF.Open;
end;

end.
