unit UFinRests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxDropDownEdit, cxCalc, cxTextEdit,
  cxButtonEdit, StdCtrls, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxButtons, ExtCtrls,
  DB, FIBDataSet, pFIBDataSet, pFibStoredProc;

type
  TfrmGetRests = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    EDSch: TcxLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    EdSm: TcxLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    EdSt: TcxButtonEdit;
    Label5: TLabel;
    EdKV: TcxButtonEdit;
    EdRazdel: TcxTextEdit;
    EdSumma: TcxCalcEdit;
    Label6: TLabel;
    SchDataSet: TpFIBDataSet;
    SchDataSource: TDataSource;
    SmDataSet: TpFIBDataSet;
    SmDataSource: TDataSource;
    Label8: TLabel;
    Nar_summa: TcxCalcEdit;
    Label9: TLabel;
    Nad_summa: TcxCalcEdit;
    Label10: TLabel;
    kv_summa: TcxCalcEdit;
    Label11: TLabel;
    fv_summa: TcxCalcEdit;
    Label7: TLabel;
    cxButtonEdit1: TcxButtonEdit;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    function CheckData:Boolean;
  public
    { Public declarations }
    ID_SCH  : Int64;
    ID_SM   : Int64;
    ID_RZ   : Int64;
    ID_ST   : Int64;
    ID_KV   : Int64;
    ID_ENUM : Int64;
  end;

implementation

uses MainFinFrm, GlobalSpr;
{$R *.dfm}

procedure TfrmGetRests.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then begin
               ID_SCH:=EDSch.EditValue;
               ID_SM :=EdSm.EditValue;
               ModalResult:=mrYes;
     end;
end;

procedure TfrmGetRests.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetRests.FormCreate(Sender: TObject);
begin
     SchDataSet.Database:=TfrmFinForms(Self.Owner.Owner).WorkDatabase;
     SchDataSet.Transaction:=TfrmFinForms(Self.Owner.Owner).ReadTransaction;
     SchDataSet.SelectSQL.Text:='SELECT * FROM FINANCE_DT_FORM_OBJECTS_SELECT('+TfrmFinForms(Self.Owner.Owner).FormsDataSet.FieldByName('ID_FORM').AsString+',0)';
     SchDataSet.Open;
     SchDataSet.FetchAll;

     SmDataSet.Database:=TfrmFinForms(Self.Owner.Owner).WorkDatabase;
     SmDataSet.Transaction:=TfrmFinForms(Self.Owner.Owner).ReadTransaction;
     SmDataSet.SelectSQL.Text:='SELECT * FROM FINANCE_GET_SM_BY_PR_EX('+TfrmFinForms(Self.Owner.Owner).FormsDataSet.FieldByName('ID_FORM').AsString+')';
     SmDataSet.Open;
     SmDataSet.FetchAll;
end;

procedure TfrmGetRests.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Result:Variant;
    InfoStoredProc:TpFibStoredProc;
begin
      Result:=GlobalSpr.GetRazdStSpr(self,
                                     TfrmFinForms(Self.Owner.Owner).WorkDatabase.Handle,
                                     fsNormal,
                                     Date,
                                     0,
                                     allEnable,
                                     cmSt);
      if (Result<>Null)
      then begin
                ID_ST:=VarAsType(Result,VarInt64);
                InfoStoredProc:=TpFibStoredProc.Create(self);
                InfoStoredProc.Database:=TfrmFinForms(Self.Owner.Owner).WorkDatabase;
                InfoStoredProc.Transaction:=TfrmFinForms(Self.Owner.Owner).ReadTransaction;
                InfoStoredProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
                InfoStoredProc.Prepare;
                InfoStoredProc.ParamByName('ID_RAZD_ST_IN').asInt64:=ID_ST;
                InfoStoredProc.ExecProc;
                ID_RZ:=VarAsType(InfoStoredProc.ParamByName('LINKTO').Value,VarInt64);
                EdSt.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';

                InfoStoredProc.Prepare;
                InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=ID_RZ;
                InfoStoredProc.ExecProc;
                EdRazdel.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';
                InfoStoredProc.Close;
                InfoStoredProc.Free;
    end;

end;

procedure TfrmGetRests.cxButtonEdit3PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:variant;
begin
    Res:=GlobalSpr.GetKEKVSpr(self,TfrmFinForms(Self.Owner.Owner).WorkDatabase.Handle,fsNormal,Date,1);
    if VarArrayDimCount(Res)>0
    then begin
               ID_KV:=VarAsType(RES[0][0],varInt64);
               EdKV.Text:=VarToStr(RES[0][3])+' "'+VarToStr(RES[0][1])+'"';
    end;
end;

function TfrmGetRests.CheckData: Boolean;
var res:Boolean;
begin
    res:=true;
    if (EDSch.Text='') or (EdSm.Text='') or (EdRazdel.Text='') or (EdSt.Text='') or (EdKV.Text='')
    then begin
              ShowMessage('Треба ввести всі атрибути залишка.');
              res:=false;
    end;

    if EdSumma.EditValue=0
    then begin
              ShowMessage('Не можна ввести нульовий залишок.');
              res:=false;
    end;

    Result:=Res;
end;

procedure TfrmGetRests.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
     Res:=GlobalSPR.GetEnums(self,TfrmFinForms(Self.Owner.Owner).WorkDatabase.Handle,fsNormal);

     if VarArrayDimCount(Res)>0
     then begin
               cxButtonEdit1.Text:=VarAsType(Res[2], varString)+'"'+VarAsType(Res[1], varString)+'"';
               ID_ENUM:=Res[0];
     end;
end;

end.
