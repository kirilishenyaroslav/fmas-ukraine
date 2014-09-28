unit Sp_leaders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ComCtrls, ToolWin, ImgList, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, ActnList,Ibase, BaseTypes;

type
  TfmSp_Leaders = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    IL_Orders: TImageList;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    ContentError: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    ActionList1: TActionList;
    DataSource1: TDataSource;
    WorkDatabase: TpFIBDatabase;
    LeadersDS: TpFIBDataSet;
    ToolButton6: TToolButton;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
      post_name : string;
      id_post, id_post_prop : Integer;
      constructor Create(AOwner: TComponent; DbHandle:TISC_DB_HANDLE);reintroduce;
  end;

var
  fmSp_Leaders: TfmSp_Leaders;

implementation


{$R *.dfm}

uses  uCommonSp,  RxMemDS, uUnivSprav, pFibStoredProc, UpKernelUnit;

constructor TfmSP_LEaders.Create(AOwner: TComponent; DbHandle:TISC_DB_HANDLE);
begin

     inherited Create(AOwner);
     WorkDatabase.Handle:=DbHandle;
     ReadTransaction.StartTransaction;
end;

//uses uUnivSprav;

procedure TfmSp_Leaders.ToolButton1Click(Sender: TObject);
var
    Params : TUnivParams;
    OutPut : TRxMemoryData;
    SP:TpFibStoredProc;
begin
    Params.FormCaption    := 'Довідник посад';
    Params.ShowMode       := fsmSelect;
    Params.ShowButtons    := [fbExit];
    Params.TableName      := 'SP_POST';
    Params.Fields         := 'Name_Post,Id_Post';
    Params.FieldsName     := 'Назва посади';
    Params.KeyField       := 'Id_Post';
    Params.ReturnFields   := 'Name_Post, ID_post';
    //Params.DeleteSQL      := 'execute procedure SP_EducOrg_Delete(:Id_Post,Id_Post_prop);';
    Params.DBHandle       := Integer(WorkDatabase.Handle);

    OutPut:=TRxMemoryData.Create(self);

    if GetUnivSprav(Params,OutPut)
    then
    begin
      //  value:=output['Id_Post'];
     //   DisplayText:=VarToStr(output['Name_Post']);


     SP:=TpFibStoredProc.Create(self);
     SP.Database:=WorkDatabase;
     SP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
  //   StartHistory(WriteTransaction);
     SP.StoredProcName:='POST_PROPERTY_CHANGE';
     SP.Prepare;
     SP.ParamByName('ID_POST').Value       :=output['Id_Post'];
     //SP.ParamByName('NAME_POST').Value     := T.cxTextEdit1.Text;
     SP.ParamByName('FLAG').Value          := '1';
     SP.ExecProc;
     SP.Close;
     SP.Free;
     WriteTransaction.Commit;
        end;
end;

procedure TfmSp_Leaders.ToolButton5Click(Sender: TObject);
begin
    close;
end;

procedure TfmSp_Leaders.ToolButton6Click(Sender: TObject);
var
    Params : TUnivParams;
    OutPut : TRxMemoryData;
    SP:TpFibStoredProc;
begin
    Params.FormCaption    := 'Довідник посад';
    Params.ShowMode       := fsmSelect;
    Params.ShowButtons    := [fbExit];
    Params.TableName      := 'SP_POST';
    Params.Fields         := 'Name_Post,Id_Post';
    Params.FieldsName     := 'Назва посади';
    Params.KeyField       := 'Id_Post';
    Params.ReturnFields   := 'Name_Post, ID_post';
    //Params.DeleteSQL      := 'execute procedure SP_EducOrg_Delete(:Id_Post,Id_Post_prop);';
    Params.DBHandle       := Integer(WorkDatabase.Handle);

    OutPut:=TRxMemoryData.Create(self);

    if GetUnivSprav(Params,OutPut)
    then
    begin
        //value:=output['Id_Post'];
        //DisplayText:=VarToStr(output['Name_Post']);

     //T.cxTextEdit1.EditValue:=StajDS.FieldByName('NAME_POST').Value;

     SP:=TpFibStoredProc.Create(self);
     SP.Database:=WorkDatabase;
     SP.Transaction:=WriteTransaction;
     WriteTransaction.StartTransaction;
   //  StartHistory(WriteTransaction);
     SP.StoredProcName:='SP_LEADERS_UPDATE';
     SP.Prepare;
     SP.ParamByName('ID_POST').Value       :=output['Id_Post'];//LeadersDS.FieldByName('ID_POST').Value;
     SP.ExecProc;
     SP.Close;
     SP.Free;
     WriteTransaction.Commit;
       end;
end;

procedure TfmSp_Leaders.ToolButton2Click(Sender: TObject);
var
    Params : TUnivParams;
    OutPut : TRxMemoryData;
    SP:TpFibStoredProc;
begin
     if (LeadersDS.RecordCount>0)
     then begin
               if agMessageDlg('Увага!','Ви хочете вилучити запис?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         SP:=TpFibStoredProc.Create(self);
                         SP.Database:=WorkDatabase;
                         SP.Transaction:=WriteTransaction;
                         WriteTransaction.StartTransaction;
                         StartHistory(WriteTransaction);
                         SP.StoredProcName:='POST_PROPERTY_CHANGE';
                         SP.Prepare;
                         SP.ParamByName('ID_POST').Value       :=LeadersDS.FieldByName('ID_POST').Value;
                         SP.ParamByName('ID_POST_PROP').Value  :=LeadersDS.FieldByName('ID_POST_PROP').Value;
                         SP.ParamByName('FLAG').Value          :='0';
                         SP.ExecProc;
                         SP.Close;
                         SP.Free;
                         WriteTransaction.Commit;
                         LeadersDS.CacheDelete;
               end;
     end;
end;

procedure TfmSp_Leaders.ToolButton3Click(Sender: TObject);
begin
    LeadersDS.CloseOpen(true);
end;

procedure TfmSp_Leaders.ToolButton4Click(Sender: TObject);
begin
    if (LeadersDS.RecordCount>0)
    then begin
            // post_name    := StajDS.FieldByName('NAME_POST').AsString;
            // id_post      := StajDS.FieldByName('ID_POST').Value;
            // id_post_prop := StajDS.FieldByName('ID_POST_PROP').Value;
             ModalResult  := mrYes;
    end;
end;

end.
