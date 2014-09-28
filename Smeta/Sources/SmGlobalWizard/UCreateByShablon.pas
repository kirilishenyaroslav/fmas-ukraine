unit UCreateByShablon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxSpinEdit, StdCtrls, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxButtons,
  ExtCtrls, cxDropDownEdit, cxCalc, DB, FIBDataSet, pFIBDataSet,
  FIBDatabase, pFIBDatabase, Ibase,pFibStoredProc;

type
  TfrmCreateSmByShablon = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    cxSpinEdit1: TcxSpinEdit;
    Label3: TLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxCalcEdit1: TcxCalcEdit;
    Label5: TLabel;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    pFIBDataSet1: TpFIBDataSet;
    cxTextEdit1: TcxTextEdit;
    Label6: TLabel;
    WriteTransaction: TpFIBTransaction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
    LocalId_user:Int64;
    BaseIdPlan:Int64;
    IdSmeta:Int64;
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;



implementation

uses GlobalSpr, DateUtils, BaseTypes;

{$R *.dfm}

constructor TfrmCreateSmByShablon.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; id_user: Int64);
begin
     inherited Create(AOwner);

     BaseIdPlan:=-1;
     IdSmeta   :=-1;

     WorkDatabase.Handle:=DBHandle;
     ReadTransaction.StartTransaction;

     cxSpinEdit1.Value:=YearOf(Date);

     LocalId_user:=id_user;
end;

procedure TfrmCreateSmByShablon.cxButton1Click(Sender: TObject);
var CreateSp:TpFibStoredProc;
begin
     if ((BaseIdPlan>0) and (IdSmeta>0))
     then begin
               CreateSp:=TpFibStoredProc.Create(self);
               CreateSp.Database:=WorkDatabase;
               CreateSp.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               CreateSp.StoredProcName:='BU_CREATE_PLAN_BY_SHABLON';
               CreateSp.Prepare;
               CreateSp.ParamByName('BASE_ID_PLAN').AsInt64 :=BaseIdPlan;
               CreateSp.ParamByName('NEW_ID_BUDGET').AsInt64:=IdSmeta;
               CreateSp.ParamByName('NEW_YEAR').Value       :=cxSpinEdit1.EditValue;
               CreateSp.ParamByName('ID_USER').AsInt64      :=LocalId_user;
               CreateSp.ParamByName('NOTE').Value           :=cxTextEdit1.EditValue;
               CreateSp.ParamByName('KOEFF').Value          :=cxCalcEdit1.EditValue;
               CreateSp.ExecProc;
               WriteTransaction.Commit;
               CreateSp.Close;
               CreateSp.Free;

               agShowMessage('Увага! Варіант бюджету створено успішно!');

               ModalResult:=mrYes;
     end
     else agShowMessage('Увага! Не введені всі настройки для створення!');
end;

procedure TfrmCreateSmByShablon.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmCreateSmByShablon.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Res:Variant;
    Filter:TSmetaFilterValues;
    GetInfoDataSet:TpFibDataSet;
begin
     Res:=NULL;
     Filter.DateFilter:=false;
     Filter.GroupFilter:=false;
     Filter.NOTEqual:=-1;
     Res:=GlobalSpr.WIZARD_GetPlan(self,
                      WorkDatabase.Handle,
                      fsNormal,
                      Date,
                      Filter,
                      LocalId_user);
     if Res>0
     then begin
               GetInfoDataSet:=TpFibDataSet.Create(self);
               GetInfoDataSet.Database:=WorkDatabase;
               GetInfoDataSet.Transaction:=ReadTransaction;
               GetInfoDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_INFO_BY_PLAN('+VarToStr(Res)+')';
               GetInfoDataSet.Open;
               if (GetInfoDataSet.RecordCount>0)
               then begin
                         cxButtonEdit2.Text:=GetInfoDataSet.FieldByName('RESULT_STRING').AsString;
                         BaseIdPlan:=VarAsType(Res,varInt64);
               end;
               GetInfoDataSet.Close;
               GetInfoDataSet.Free;
     end;
end;

procedure TfrmCreateSmByShablon.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var Filter:TSmetaFilterValues;
    Res:Variant;
    GetInfoDataSet:TpFIBDataSet;
begin
       Filter.DateFilter  :=false;
       Filter.GroupFilter :=false;
       Filter.NOTEqual    :=-1;
       Res:=GlobalSpr.GetSmetaSpr(self,
                        WorkDatabase.Handle,
                        fsNormal,
                        Date,
                        Filter,
                        LocalId_user);
        if (Res>0)
        then begin
                   GetInfoDataSet:=TpFibDataSet.Create(self);
                   GetInfoDataSet.Database:=WorkDatabase;
                   GetInfoDataSet.Transaction:=ReadTransaction;
                   GetInfoDataSet.SelectSQL.Text:='SELECT * FROM PUB_SPR_SMETA WHERE ID_SMETA='+VarToStr(Res);
                   GetInfoDataSet.Open;
                   if (GetInfoDataSet.RecordCount>0)
                   then begin
                             cxButtonEdit1.Text:=GetInfoDataSet.FieldByName('SMETA_TITLE').AsString;
                             IdSmeta:=VarAsType(Res,varInt64);
                   end;
                   GetInfoDataSet.Close;
                   GetInfoDataSet.Free;
        end;
end;

end.
