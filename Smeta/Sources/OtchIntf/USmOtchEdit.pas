unit USmOtchEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxCalendar, cxMaskEdit,
  cxDropDownEdit, cxCalc, cxButtonEdit,pFibStoredProc,FIBDataSet,
  pFibDataSet, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxCheckBox;

type
  TfrmEditOtch = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    EdSourceFRazdel: TcxTextEdit;
    EdSourceTRazdel: TcxTextEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    EdTargetRazdel: TcxTextEdit;
    Label9: TLabel;
    Label10: TLabel;
    EdSourceFSt: TcxButtonEdit;
    EdTargetSt: TcxButtonEdit;
    EdTargetBudget: TcxButtonEdit;
    EdSourceTSt: TcxButtonEdit;
    EdSourceBudget: TcxButtonEdit;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    cxGrid1: TcxGrid;
    PkvView: TcxGridDBTableView;
    PkvViewDBColumn2: TcxGridDBColumn;
    PkvViewDBColumn1: TcxGridDBColumn;
    PkvViewDBColumn5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    PercentsDataSet: TpFIBDataSet;
    PercentsDataSource: TDataSource;
    cxButton5: TcxButton;
    Enable: TcxCheckBox;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure EdSourceFStPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure EdSourceBudgetPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
  private
    { Private declarations }
    LocMinDate:TDateTime;
    LocMaxDate:TDateTime;
    function CheckData:Boolean;
  public
     id_user:Integer;
     TARGET_ID_PLAN  : Int64;
     TARGET_ID_SMETA : Int64;
     TARGET_ID_STAT  : Int64;
     SOURCE_F_Id_Plan    : Int64;
     SOURCE_ID_SMETA     : Integer;
     SOURCE_F_ID_OBJECT  : Int64;
     SOURCE_T_ID_OBJECT  : Int64;
     loc_id_otch         : Int64;
    { Public declarations }
    constructor Create(AOwner:TComponent;id_otch:Int64;MinDate,MaxDate:TDateTime);reintroduce;
  end;

implementation

uses GlobalSpr, USmOtch, USmOtchVal, BaseTypes;
{$R *.dfm}

procedure TfrmEditOtch.cxButton1Click(Sender: TObject);
begin
     if CheckData
     then ModalResult:=mrYes;
end;

procedure TfrmEditOtch.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmEditOtch.EdSourceFStPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Result:Variant;
    InfoStoredProc:TpFibStoredProc;
    ID_RAZD_ST:Int64;
begin
      Result:=GlobalSpr.GetRazdStSpr(self,
                                     TfrmSmOtch(Owner).WorkDatabase.Handle,
                                     fsNormal,
                                     Date,
                                     SOURCE_F_Id_Plan,
                                     allEProfitUnderBudget,
                                     cmSt);
      if Result<>null
      then begin
                SOURCE_F_ID_OBJECT:=VarAsType(Result,VarInt64);
                InfoStoredProc:=TpFibStoredProc.Create(self);
                InfoStoredProc.Database:=TfrmSmOtch(Owner).WorkDatabase;
                InfoStoredProc.Transaction:=TfrmSmOtch(Owner).ReadTransaction;
                InfoStoredProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
                InfoStoredProc.Prepare;
                InfoStoredProc.ParamByName('ID_RAZD_ST_IN').asInt64:=SOURCE_F_ID_OBJECT;
                InfoStoredProc.ExecProc;
                ID_RAZD_ST:=VarAsType(InfoStoredProc.ParamByName('LINKTO').Value,VarInt64);
                EdSourceFSt.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';

                InfoStoredProc.Prepare;
                InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=ID_RAZD_ST;
                InfoStoredProc.ExecProc;
                EdSourceFRazdel.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';
                InfoStoredProc.Close;


                //Получаем информацию о проценте по умолчанию
                InfoStoredProc.StoredProcName:='BU_GET_OTCH_PER_BY_DEF';
                InfoStoredProc.Prepare;
                InfoStoredProc.ParamByName('ID_STAT').AsInt64:=SOURCE_F_ID_OBJECT;
                InfoStoredProc.ParamByName('ID_PLAN').AsInt64:=SOURCE_F_ID_PLAN;
                InfoStoredProc.ExecProc;
                InfoStoredProc.Close;
                InfoStoredProc.Free;
    end;
end;

procedure TfrmEditOtch.EdPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Result:Variant;
    InfoStoredProc:TpFibStoredProc;
    ID_RAZD_ST:Int64;
begin
  Result:=GlobalSpr.GetRazdStSpr(self,
                         TfrmSmOtch(Owner).WorkDatabase.Handle,
                         fsNormal,
                         Date,
                         SOURCE_F_Id_Plan,
                         allEProfitUnderBudget,
                         cmSt);
  if Result<>null
  then begin
              SOURCE_T_ID_OBJECT:=VarAsType(Result,VarInt64);
              InfoStoredProc:=TpFibStoredProc.Create(self);
              InfoStoredProc.Database:=TfrmSmOtch(Owner).WorkDatabase;
              InfoStoredProc.Transaction:=TfrmSmOtch(Owner).ReadTransaction;
              InfoStoredProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=SOURCE_T_ID_OBJECT;
              InfoStoredProc.ExecProc;
              ID_RAZD_ST:=InfoStoredProc.ParamByName('LINKTO').AsInt64;
              EdSourceTSt.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';

              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=ID_RAZD_ST;
              InfoStoredProc.ExecProc;
              EdSourceTRazdel.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';

              InfoStoredProc.Free;
  end;
end;

procedure TfrmEditOtch.cxButtonEdit2PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var  
     Res:Variant;
     InfoQuery:TpFibDataSet;
begin
    EdTargetRazdel.Enabled:=false;
    EdTargetSt.Enabled:=false;

    Res:=GlobalSPR.GetSmets(self,
                       TfrmSmOtch(Owner).WorkDatabase.Handle,
                       TfrmSmOtch(Owner).ActualDate,
                       psmSmet);
    if (VarArrayDimCount(Res)>0)
    then begin
                        TARGET_ID_PLAN:=0;
                        TARGET_ID_SMETA:=Res[0];
                        EdTargetBudget.Text:=VarToStr(Res[3])+' "'+VarToStr(Res[2])+'"';

                        InfoQuery:=TpFibDataSet.Create(self);
                        InfoQuery.Database:=TfrmSmOtch(Owner).WorkDatabase;
                        InfoQuery.Transaction:=TfrmSmOtch(Owner).ReadTransaction;
                        InfoQuery.SelectSQL.Text:=' SELECT SP.Date_Beg, SP.Date_End, SP.ID_PLAN '+
                                                  '   FROM BU_SMET_PLUS_PERIODS SP '+
                                                  '  WHERE SP.DATE_BEG <='+''''+DateToStr(TfrmSmOtch(Owner).ActualDate)+''''+
                                                  '    AND SP.DATE_END  >'+''''+DateToStr(TfrmSmOtch(Owner).ActualDate)+''''+
                                                  '    AND SP.ID_SMETA  ='+ IntToStr(TARGET_ID_SMETA);
                        InfoQuery.Open;
                        InfoQuery.FetchAll;
                        if InfoQuery.RecordCount>0
                        then begin
                                  TARGET_ID_PLAN      :=StrToInt64(InfoQuery.FieldByName('ID_PLAN').AsString);
                        end;
                        InfoQuery.Close;
                        InfoQuery.Free;

                        if (TARGET_ID_PLAN=0)
                        then ShowMessage('Відрахування повинні відбуватися у кошторис із однаковим періодом функціонування')
                        else begin
                             EdTargetRazdel.Enabled:=true;
                             EdTargetSt.Enabled:=true;
                        end;
    end;
end;

procedure TfrmEditOtch.FormCreate(Sender: TObject);
begin
     if (self.loc_id_otch<>-1)
     then begin
               PercentsDataSet.Database   :=TfrmSmOtch(Owner).WorkDatabase;
               PercentsDataSet.Transaction:=TfrmSmOtch(Owner).ReadTransaction;
               PercentsDataSet.SelectSQL.Text:='SELECT * FROM bu_smet_otchisl_ where id_otch='+IntTostr(self.loc_id_otch);
               PercentsDataSet.Open;
     end
     else begin
               GroupBox1.Visible:=False;
               self.Height:=self.Height-GroupBox1.Height;
     end;

     TARGET_ID_PLAN  :=0;
     TARGET_ID_SMETA :=0;

end;

procedure TfrmEditOtch.cxButtonEdit1PropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Result:Variant;
    InfoStoredProc:TpFibStoredProc;
    ID_RAZD_ST:Int64;
begin
  Result:=GlobalSpr.GetRazdStSpr(self,
                         TfrmSmOtch(Owner).WorkDatabase.Handle,
                         fsNormal,
                         Date,
                         TARGET_ID_PLAN,
                         allEProfitUnderBudget,
                         cmSt);
  if Result<>null
  then begin
              TARGET_ID_STAT:=VarAsType(Result,VarInt64);
              InfoStoredProc:=TpFibStoredProc.Create(self);
              InfoStoredProc.Database:=TfrmSmOtch(Owner).WorkDatabase;
              InfoStoredProc.Transaction:=TfrmSmOtch(Owner).ReadTransaction;
              InfoStoredProc.StoredProcName:='PUB_SPR_RAZD_ST_INFO';
              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=TARGET_ID_STAT;
              InfoStoredProc.ExecProc;
              ID_RAZD_ST:=InfoStoredProc.ParamByName('LINKTO').AsInt64;
              EdTargetSt.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';

              InfoStoredProc.Prepare;
              InfoStoredProc.ParamByName('ID_RAZD_ST_IN').AsInt64:=ID_RAZD_ST;
              InfoStoredProc.ExecProc;
              EdTargetRazdel.Text:=InfoStoredProc.ParamByName('RAZD_ST_NUM').AsString+' "'+InfoStoredProc.ParamByName('RAZD_ST_TITLE').AsString+'"';

              InfoStoredProc.Free;
  end;
end;

function TfrmEditOtch.CheckData: Boolean;
var Res:Boolean;
begin
    Res:=true;

    if (EdSourceFSt.Text='') and Res
    then begin
              ShowMessage('Необхідно вибрати доходну статтю');
              EdSourceFSt.SetFocus;
              Res:=false;
    end;
    if (EdSourcetSt.Text='') and Res
    then begin
              ShowMessage('Необхідно вибрати видаткову статтю');
              EdSourcetSt.SetFocus;
              Res:=false;
    end;
    if (EdTargetSt.Text='') and Res
    then begin
              ShowMessage('Необхідно вибрати доходну статтю');
              EdTargetSt.SetFocus;
              Res:=false;
    end;

    Result:=res;
end;

procedure TfrmEditOtch.EdSourceBudgetPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
    InfoQuery:TfibDataSet;
    CheckSP:TpFIBStoredProc;
begin
    Res:=GlobalSPR.GetSmets(self,
                       TfrmSmOtch(Owner).WorkDatabase.Handle,
                       TfrmSmOtch(Owner).ActualDate,
                       psmSmet);
    if (VarArrayDimCount(Res)>0)
    then begin
              //Проверяем имеет ли пользователь право работать с этим бюджетом
              SOURCE_ID_SMETA:=Res[0];

              CheckSP:=TpFIBStoredProc.Create(self);
              CheckSP.Database:=TfrmSmOtch(Owner).WorkDatabase;
              CheckSP.Transaction:=TfrmSmOtch(Owner).ReadTransaction;
              CheckSP.StoredProcName:='BU_CHECK_SMETA_BY_USER';
              CheckSP.Prepare;
              CheckSP.ParamByName('ID_USER').Value:=TfrmSmOtch(Owner).IdUser;
              CheckSP.ParamByName('ID_SM').Value  :=SOURCE_ID_SMETA;
              CheckSP.ExecProc;

              if checksp.ParamByName('RESULT').Value=1
              then begin
                          EdSourceBudget.Text:=VarToStr(Res[3])+' "'+VarToStr(Res[2])+'"';
                          InfoQuery:=TpFibDataSet.Create(self);
                          InfoQuery.Database:=TfrmSmOtch(Owner).WorkDatabase;
                          InfoQuery.Transaction:=TfrmSmOtch(Owner).ReadTransaction;
                          InfoQuery.SelectSQL.Text:=' SELECT SP.Date_Beg, SP.Date_End, SP.ID_PLAN '+
                                                    '   FROM BU_SMET_PLUS_PERIODS SP '+
                                                    '  WHERE SP.DATE_BEG <='+''''+DateToStr(TfrmSmOtch(Owner).ActualDate)+''''+
                                                    '    AND SP.DATE_END  >'+''''+DateToStr(TfrmSmOtch(Owner).ActualDate)+''''+
                                                    '    AND SP.ID_SMETA  ='+ IntToStr(SOURCE_ID_SMETA);
                          InfoQuery.Open;
                          InfoQuery.FetchAll;
                          if InfoQuery.RecordCount>0
                          then begin
                                    SOURCE_F_Id_Plan     :=StrToInt64(InfoQuery.FieldByName('ID_PLAN').AsString);
                          end;
                          InfoQuery.Close;
                          InfoQuery.Free;
              end
              else ShowMessage('Ви не маєте повноважень для роботи з вибраним бюджетом!');

              CheckSP.Close;
              CheckSP.Free;
    end;
end;

procedure TfrmEditOtch.cxButton3Click(Sender: TObject);
var T:TfrmGetOtchislVal;
    InsertSP:TpFibStoredProc;
    new_id:Int64;
begin
     T:=TfrmGetOtchislVal.Create(self,LocMinDate,LocMaxDate, Date, Date);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database   :=TfrmSmOtch(Owner).WorkDatabase;
               InsertSP.Transaction:=TfrmSmOtch(Owner).WriteTransaction;
               TfrmSmOtch(Owner).WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='BU_SMET_OTCHISL_INS';
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_OTCH').asInt64:=Self.loc_id_otch;
               InsertSP.ParamByName('DATE_BEG').Value :=T.DateBeg;
               InsertSP.ParamByName('DATE_END').Value :=T.DateEnd;
               InsertSP.ParamByName('PERCENT').Value  :=T.cxCalcEdit1.Value;
               InsertSP.ExecProc;
               new_id:=InsertSP.ParamByName('ID_OTCH_VALUE').asInt64;
               TfrmSmOtch(Owner).WriteTransaction.Commit;
               PercentsDataSet.CloseOpen(true);
               PercentsDataSet.Locate('id_otch_value',new_id,[]);
               InsertSP.Close;
               InsertSP.Free;
     end;
     T.Free;
end;

constructor TfrmEditOtch.Create(AOwner: TComponent; id_otch: Int64;MinDate,MaxDate:TDateTime);
begin
     inherited Create(AOwner);
     Loc_id_otch:=id_otch;
     LocMinDate:=MinDate;
     LocMaxDate:=MaxDate;
end;

procedure TfrmEditOtch.cxButton4Click(Sender: TObject);
var DropSP:TpFibStoredProc;
begin
     if PercentsDataSet.RecordCount>0
     then begin
               if agMessageDlg('Увага!','Ви хочете видалити запис?',mtConfirmation, [mbYes,mbNo])=mrYes
               then begin
                         DropSP:=TpFibStoredProc.Create(self);
                         DropSP.Database   :=TfrmSmOtch(Owner).WorkDatabase;
                         DropSP.Transaction:=TfrmSmOtch(Owner).WriteTransaction;
                         TfrmSmOtch(Owner).WriteTransaction.StartTransaction;
                         DropSP.StoredProcName:='BU_SMET_OTCHISL_DEL';
                         DropSP.Prepare;
                         DropSP.ParamByName('ID_OTCH_VALUE').asInt64:=TFibBCDField(PercentsDataSet.FieldByName('ID_OTCH_VALUE')).AsInt64;
                         DropSP.ExecProc;
                         TfrmSmOtch(Owner).WriteTransaction.Commit;
                         PercentsDataSet.CacheDelete;
                         DropSP.Close;
                         DropSP.Free;
               end;
     end;
end;

procedure TfrmEditOtch.cxButton5Click(Sender: TObject);
var T:TfrmGetOtchislVal;
    InsertSP:TpFibStoredProc;
    new_id:Int64;
begin
     if PercentsDataSet.RecordCount>0
     then begin
               T:=TfrmGetOtchislVal.Create(self,LocMinDate,LocMaxDate,PercentsDataSet['Date_Beg'],PercentsDataSet['Date_End']);
               T.cxCalcEdit1.Value:=PercentsDataSet.FieldByName('PERCENT').Value;
               new_id:=TFibBCDField(PercentsDataSet.FieldByName('ID_OTCH_VALUE')).asInt64;
               if T.ShowModal=mrYes
               then begin
                         InsertSP:=TpFibStoredProc.Create(self);
                         InsertSP.Database   :=TfrmSmOtch(Owner).WorkDatabase;
                         InsertSP.Transaction:=TfrmSmOtch(Owner).WriteTransaction;
                         TfrmSmOtch(Owner).WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='BU_SMET_OTCHISL_UPD';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_OTCH').asInt64:=Self.loc_id_otch;
                         InsertSP.ParamByName('ID_OTCH_VALUE').asInt64:=new_id;
                         InsertSP.ParamByName('DATE_BEG').Value :=T.DateBeg;
                         InsertSP.ParamByName('DATE_END').Value :=T.DateEnd;
                         InsertSP.ParamByName('PERCENT').Value  :=T.cxCalcEdit1.Value;
                         InsertSP.ExecProc;
                         TfrmSmOtch(Owner).WriteTransaction.Commit;
                         PercentsDataSet.CloseOpen(true);
                         PercentsDataSet.Locate('id_otch_value',new_id,[]);
                         InsertSP.Close;
                         InsertSP.Free;
               end;
               T.Free;
     end;
end;

end.
