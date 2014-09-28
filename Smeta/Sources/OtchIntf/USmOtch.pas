unit USmOtch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, ImgList, ComCtrls, ToolWin, ExtCtrls, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls, cxContainer, cxTextEdit, cxDBEdit,
  FIBDataSet, pFIBDataSet,pFibStoredProc, cxCheckBox, FIBDatabase,
  pFIBDatabase,Ibase, cxLookAndFeelPainters, cxButtons, cxMaskEdit,
  cxDropDownEdit, cxCalendar, Placemnt;

type
  TfrmSmOtch = class(TForm)
    Panel2: TPanel;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    CloseButton: TToolButton;
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    StDoxod: TcxStyle;
    StRasxod: TcxStyle;
    MarkSummStyle: TcxStyle;
    cxGrid3: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    OtchView: TcxGridDBBandedTableView;
    OtchViewDBBandedColumn1: TcxGridDBBandedColumn;
    OtchViewDBBandedColumn2: TcxGridDBBandedColumn;
    OtchViewDBBandedColumn3: TcxGridDBBandedColumn;
    OtchViewDBBandedColumn4: TcxGridDBBandedColumn;
    OtchViewDBBandedColumn5: TcxGridDBBandedColumn;
    OtchViewDBBandedColumn6: TcxGridDBBandedColumn;
    OtchViewDBBandedColumn7: TcxGridDBBandedColumn;
    OtchViewDBBandedColumn8: TcxGridDBBandedColumn;
    ToolButton1: TToolButton;
    OtchDataSet: TpFIBDataSet;
    OtchDataSource: TDataSource;
    cxStyle1: TcxStyle;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    OtchViewDBBandedColumn9: TcxGridDBBandedColumn;
    Panel3: TPanel;
    ToolButton2: TToolButton;
    cxDateEdit1: TcxDateEdit;
    Label3: TLabel;
    cxButton1: TcxButton;
    FormStorage1: TFormStorage;
    ToolButton3: TToolButton;
    cxCheckBox1: TcxCheckBox;
    OtchViewDBBandedColumn10: TcxGridDBBandedColumn;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure OtchViewDblClick(Sender: TObject);
  private
    { Private declarations }
    first:Boolean;
  public
    { Public declarations }
    IdPlan:Int64;
    IdUser:Integer;
    ActualDate:TDateTime;
    Constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_PLAN:Int64;ID_USER:Integer;FS:TFormStyle);overload;
  end;

  Procedure GetOtchIntf(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_PLAN:Int64;ID_USER:Integer;FS:TFormStyle);stdcall;
  Exports GetOtchIntf;

implementation

uses USmOtchEdit, BaseTypes, UGetWorkDateO, cxCalc;
{$R *.dfm}

Procedure GetOtchIntf(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;ID_PLAN:Int64;ID_USER:Integer;FS:TFormStyle);
var i:Integer;
    f:Boolean;
    T:TfrmSmOtch;
Begin
    if FS=fsMdiChild
    then begin
              f :=true;
              for i:=0 to Application.MainForm.MDIChildCount-1 do
              begin
                   if (Application.MainForm.MDIChildren[i] is TfrmSmOtch)
                   then begin
                                     Application.MainForm.MDIChildren[i].BringToFront;
                                     f:=false;
                   end;
              end;
              if f then TfrmSmOtch.Create(AOwner,DBHandle,ID_PLAN,ID_USER,FS);
    end
    else begin
              T:=TfrmSmOtch.Create(AOwner,DBHandle,ID_PLAN,ID_USER,FS);
              T.ShowModal;
              T.Free;
    end;
End;



procedure TfrmSmOtch.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmSmOtch.FormCreate(Sender: TObject);
begin
     first:=true;
     OtchDataSet.Database:=WorkDatabase;
     OtchDataSet.Transaction:=ReadTransaction;
     OtchDataSet.SelectSQL.Text:=' SELECT * FROM BU_SMET_OTCHISL_SELECT('+IntToStr(IdPlan)+','+''''+DateToStr(ActualDate)+''''+','+IntToStr(Self.IdUser)+')';
     OtchDataSet.Open;
end;

procedure TfrmSmOtch.AddButtonClick(Sender: TObject);
var T:TfrmEditOtch;
    InsertStoredProc:TpFibStoredProc;
    New_Id:Integer;
    InfoQuery:TpFibDataSet;
begin
          T:=TfrmEditOtch.Create(self,-1, Date, Date);
          {Если работа ведется по конкретному плану}
          if (IdPlan>0)
          then begin
                    InfoQuery:=TpFibDataSet.Create(self);
                    InfoQuery.Database:=WorkDatabase;
                    InfoQuery.Transaction:=ReadTransaction;
                    InfoQuery.SelectSQL.Text:=' SELECT SS.SMETA_KOD, SP.Date_Beg, SP.Date_End '+
                                              '   FROM PUB_SPR_SMETA SS, BU_SMET_PLUS_PERIODS SP '+
                                              '  WHERE SP.ID_PLAN ='+IntToStr(IdPlan)+
                                              '    AND SP.ID_SMETA = SS.ID_SMETA ';
                    InfoQuery.Open;
                    InfoQuery.FetchAll;
                    if InfoQuery.RecordCount>0
                    then begin
                              T.EdSourceBudget.Text  :=InfoQuery.FieldByName('SMETA_KOD').AsString;
                              T.SOURCE_F_Id_Plan:=IdPlan;
                    end;
                    T.EdSourceBudget.Properties.Buttons[0].Visible:=false;
                    T.EdSourceBudget.Style.Color:=clSilver;
                    InfoQuery.Close;
                    InfoQuery.Free;
          end
          else begin
                    T.EdSourceBudget.Properties.Buttons[0].Visible:=true;
                    T.EdSourceBudget.Style.Color:=clInfoBk;
          end;
          if T.ShowModal=mrYes
          then begin
               InsertStoredProc:=TpFibStoredProc.Create(self);
               InsertStoredProc.Database:=WorkDatabase;
               InsertStoredProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               InsertStoredProc.StoredProcName:='BU_SMET_OTCHISL_INSERT';
               InsertStoredProc.Prepare;
               InsertStoredProc.ParamByName('SOURCE_ID_PLAN').AsInt64    :=T.SOURCE_F_Id_Plan;
               InsertStoredProc.ParamByName('TARGET_ID_PLAN').AsInt64    :=T.TARGET_ID_PLAN;
               InsertStoredProc.ParamByName('SOURCE_F_ID_OBJECT').AsInt64:=T.SOURCE_F_ID_OBJECT;
               InsertStoredProc.ParamByName('SOURCE_T_ID_OBJECT').AsInt64:=T.SOURCE_T_ID_OBJECT;
               InsertStoredProc.ParamByName('TARGET_ID_OBJECT').asInt64  :=T.TARGET_ID_STAT;
               InsertStoredProc.ParamByName('ENABLE').Value              :=Integer(T.Enable.Checked);
               InsertStoredProc.ExecProc;
               New_Id:=InsertStoredProc.ParamByName('ID_OTCH').value;
               WriteTransaction.Commit;
               OtchDataSet.CloseOpen(true);
               OtchView.DataController.LocateByKey(New_Id);
          end;
          T.Free;
end;

procedure TfrmSmOtch.DelButtonClick(Sender: TObject);
var DeleteStoredProc:TpFibStoredProc;
    New_id:Integer;
begin
if (OtchDataSet.RecordCount>0)
then begin
     if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити формулу?',mtWarning,[mbYes,mbNo])=mrYes
     then begin
               DeleteStoredProc:=TpFibStoredProc.Create(self);
               DeleteStoredProc.Database:=WorkDatabase;
               DeleteStoredProc.Transaction:=WriteTransaction;
               WriteTransaction.StartTransaction;
               DeleteStoredProc.StoredProcName:='BU_SMET_OTCHISL_DELETE';
               DeleteStoredProc.Prepare;
               New_id:=OtchDataSet.FieldByName('ID_OTCH').Value;
               DeleteStoredProc.ParamByName('ID_OTCH').Value    :=OtchDataSet.FieldByName('ID_OTCH').Value;
               DeleteStoredProc.ExecProc;
               WriteTransaction.Commit;
               OtchDataSet.CloseOpen(true);
               OtchView.DataController.LocateByKey(New_Id);
     end;
end;
end;

procedure TfrmSmOtch.ToolButton1Click(Sender: TObject);
var UpdateStoredProc:TpFibStoredProc;
    New_id:Integer;
    T:TfrmEditOtch;
begin
if (OtchDataSet.RecordCount>0)
then begin
          T:=TfrmEditOtch.Create(self,
                                 OtchDataSet.FieldByName('ID_OTCH').Value,
                                 OtchDataSet.FieldByName('DATE_MIN').Value,
                                 OtchDataSet.FieldByName('DATE_MAX').Value);

          T.SOURCE_F_Id_Plan  :=TFIBBCDField(OtchDataSet.FieldByName('SOURCE_ID_PLAN_OUT')).AsInt64;
          T.TARGET_ID_PLAN    :=TFIBBCDField(OtchDataSet.FieldByName('TARGET_ID_PLAN')).AsInt64;
          T.SOURCE_F_ID_OBJECT:=TFIBBCDField(OtchDataSet.FieldByName('SOURCE_F_ID_OBJECT')).AsInt64;
          T.SOURCE_T_ID_OBJECT:=TFIBBCDField(OtchDataSet.FieldByName('SOURCE_T_ID_OBJECT')).AsInt64;
          T.TARGET_ID_STAT    :=TFIBBCDField(OtchDataSet.FieldByName('TARGET_ID_OBJECT')).asInt64;
          T.Enable.Checked    :=Boolean(OtchDataSet.FieldByName('ENABLED').AsInteger);


          T.EdSourceBudget.Text:=OtchDataSet.FieldByName('SOURCE_SMETA_NUM').AsString+' '+OtchDataSet.FieldByName('SOURCE_SMETA_TITLE').AsString;
          T.EdSourceFRazdel.Text:=OtchDataSet.FieldByName('SOURCE_F_RAZDEL_NUM').AsString+' '+OtchDataSet.FieldByName('SOURCE_F_RAZDEL_TITLE').AsString;
          T.EdSourceFSt.Text:=OtchDataSet.FieldByName('SOURCE_F_ST_NUM').AsString+' '+OtchDataSet.FieldByName('SOURCE_F_ST_TITLE').AsString;

          T.EdSourceTRazdel.Text:=OtchDataSet.FieldByName('SOURCE_T_RAZDEL_NUM').AsString+' '+OtchDataSet.FieldByName('SOURCE_T_RAZDEL_TITLE').AsString;
          T.EdSourceTSt.Text:=OtchDataSet.FieldByName('SOURCE_T_ST_NUM').AsString+' '+OtchDataSet.FieldByName('SOURCE_T_ST_TITLE').AsString;

          T.EdTargetBudget.Text:=OtchDataSet.FieldByName('TARGET_SMETA_KOD').AsString+' '+OtchDataSet.FieldByName('TARGET_SMETA_TITLE').AsString;

          T.EdTargetRazdel.Text:=OtchDataSet.FieldByName('TARGET_RAZDEL_NUM').AsString+' '+OtchDataSet.FieldByName('TARGET_RAZDEL_TITLE').AsString;
          T.EdTargetSt.Text:=OtchDataSet.FieldByName('TARGET_ST_NUM').AsString+' '+OtchDataSet.FieldByName('TARGET_ST_TITLE').AsString;

          if T.ShowModal=mrYes
          then begin
                     UpdateStoredProc:=TpFibStoredProc.Create(self);
                     UpdateStoredProc.Database:=WorkDatabase;
                     UpdateStoredProc.Transaction:=WriteTransaction;
                     WriteTransaction.StartTransaction;
                     UpdateStoredProc.StoredProcName:='BU_SMET_OTCHISL_UPDATE';
                     UpdateStoredProc.Prepare;
                     New_id:=OtchDataSet.FieldByName('ID_OTCH').Value;
                     UpdateStoredProc.ParamByName('ID_OTCH').Value    :=OtchDataSet.FieldByName('ID_OTCH').Value;
                     UpdateStoredProc.ParamByName('SOURCE_ID_PLAN').AsInt64    :=T.SOURCE_F_Id_Plan;
                     UpdateStoredProc.ParamByName('TARGET_ID_PLAN').AsInt64    :=T.TARGET_ID_PLAN;
                     UpdateStoredProc.ParamByName('SOURCE_F_ID_OBJECT').AsInt64:=T.SOURCE_F_ID_OBJECT;
                     UpdateStoredProc.ParamByName('SOURCE_T_ID_OBJECT').AsInt64:=T.SOURCE_T_ID_OBJECT;
                     UpdateStoredProc.ParamByName('TARGET_ID_OBJECT').asInt64  :=T.TARGET_ID_STAT;
                     UpdateStoredProc.ParamByName('ENABLED').Value              :=Integer(T.Enable.Checked);
                     UpdateStoredProc.ExecProc;
                     WriteTransaction.Commit;
                     OtchDataSet.CloseOpen(true);
                     OtchView.DataController.LocateByKey(New_Id);
          end;
          T.Free;
end;
end;

constructor TfrmSmOtch.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE;
  ID_PLAN: Int64; ID_USER: Integer;FS:TFormStyle);
var T:TfrmGetWorkdate;
begin
  inherited Create(AOwner);
  self.FormStyle:=FS;
  self.IdPlan:=ID_PLAN;
  self.IDUser:=id_user;
  //showmessage(inttostr(self.IDUser));
  WorkDatabase.Handle:=DBHandle;
  ReadTransaction.StartTransaction;
  T:=TfrmGetWorkdate.Create(self,Date);
  T.ShowModal;
  ActualDate:=T.ActualDate;
  cxDateEdit1.Date:=ActualDate;
  T.Free;
end;

procedure TfrmSmOtch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TfrmSmOtch.ToolButton2Click(Sender: TObject);
var T:TfrmGetWorkdate;
begin
  T:=TfrmGetWorkdate.Create(self,Date);
  T.ShowModal;
  ActualDate:=T.ActualDate;
  cxDateEdit1.Date:=ActualDate;
  OtchDataSet.Close;
  //OtchDataSet.SelectSQL.Text:=' SELECT * FROM BU_SMET_OTCHISL_SELECT('+IntToStr(IdPlan)+','+''''+DateToStr(ActualDate)+''''+')';
  OtchDataSet.SelectSQL.Text:=' SELECT * FROM BU_SMET_OTCHISL_SELECT('+IntToStr(IdPlan)+','+''''+DateToStr(ActualDate)+''''+','+IntToStr(self.IDUser)+')';
  //ShowMessage(OtchDataSet.SelectSQL.Text);
  OtchDataSet.Open;
  T.Free;
end;

procedure TfrmSmOtch.cxButton1Click(Sender: TObject);
begin
  ToolButton2Click(self);
end;

procedure TfrmSmOtch.ToolButton3Click(Sender: TObject);
var I:Integer;
begin
     for i:=0 to OtchView.ColumnCount-1 do OtchView.Columns[i].Options.Filtering:=ToolButton3.Down;

end;

procedure TfrmSmOtch.cxCheckBox1PropertiesChange(Sender: TObject);
begin
     OtchView.OptionsView.GroupByBox:=cxCheckBox1.Checked;
end;

procedure TfrmSmOtch.OtchViewDblClick(Sender: TObject);
begin
     ToolButton1Click(self);
end;

end.

