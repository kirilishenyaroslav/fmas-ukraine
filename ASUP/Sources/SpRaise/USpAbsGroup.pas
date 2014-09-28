unit USpAbsGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxControls, cxGridCustomView, cxGrid,
  cxClasses, Buttons, ExtCtrls, U_SPRaise_DataModule, pFibStoredProc,
  cxTextEdit, cxCheckBox;

type
  TfrmGetSpGroup = class(TForm)
    Panel1: TPanel;
    SBAdd: TSpeedButton;
    SBModif: TSpeedButton;
    SBDelete: TSpeedButton;
    SBClose: TSpeedButton;
    cxSR: TcxStyleRepository;
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
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    DBGrid: TcxGrid;
    groupsView: TcxGridDBTableView;
    groupsViewDBColumn9: TcxGridDBColumn;
    DBGridLevel1: TcxGridLevel;
    cxgrdbclmnViewDBColumn1: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SBCloseClick(Sender: TObject);
    procedure SBAddClick(Sender: TObject);
    procedure SBModifClick(Sender: TObject);
    procedure SBDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses U_SP_Raise, USpAbsGroupEdit, BaseTypes;

{$R *.dfm}

procedure TfrmGetSpGroup.FormCreate(Sender: TObject);
begin
       if TSP_Raise(owner).DMod.AbsorbeDataSet.Active
       then TSP_Raise(owner).DMod.AbsorbeDataSet.Close;
       TSP_Raise(owner).DMod.AbsorbeDataSet.Open;
       groupsView.DataController.DataSource:=TSP_Raise(owner).DMod.AbsorbeDataSource;
end;

procedure TfrmGetSpGroup.FormDestroy(Sender: TObject);
begin
     TSP_Raise(owner).DMod.AbsorbeDataSet.Close;
end;

procedure TfrmGetSpGroup.SBCloseClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmGetSpGroup.SBAddClick(Sender: TObject);
var T:TfrmGetAbsGroupName;
    InsertSp:TpFibStoredProc;
    id_:integer;
begin
     T:=TfrmGetAbsGroupName.Create(self);
     if T.ShowModal=mrYes
     then begin
               InsertSp:=TpFibStoredProc.Create(nil);
               InsertSp.Database:=TSP_Raise(owner).DMod.FIBDatabase;
               InsertSp.Transaction:=TSP_Raise(owner).DMod.FIBWriteTransaction;
               TSP_Raise(owner).DMod.FIBWriteTransaction.StartTransaction;
               InsertSp.StoredProcName:='UP_DT_ABSORBE_GROUP_INS';
               InsertSp.Prepare;
               InsertSp.ParamByName('GROUP_TITLE').Value:=T.CE_Name.Text;
               InsertSp.ParamByName('IS_ABSORBING').Value:=Integer(T.cxchckbxIS_ABSORBING.Checked);
               InsertSp.ExecProc;
               id_:=InsertSp.ParamByName('ID_ABSORBE_GROUP').Value;
               InsertSp.Close;
               InsertSp.Free;
               TSP_Raise(owner).DMod.FIBWriteTransaction.Commit;
               TSP_Raise(owner).DMod.AbsorbeDataSet.CloseOpen(true);
               TSP_Raise(owner).DMod.AbsorbeDataSet.Locate('ID_ABSORBE_GROUP',id_,[]);
     end;
     T.Free;
end;

procedure TfrmGetSpGroup.SBModifClick(Sender: TObject);
var T:TfrmGetAbsGroupName;
    InsertSp:TpFibStoredProc;
    id_:integer;
begin
     if TSP_Raise(owner).DMod.AbsorbeDataSet.RecordCount>0
     then begin
               T:=TfrmGetAbsGroupName.Create(self);

               T.CE_Name.Text:=TSP_Raise(owner).DMod.AbsorbeDataSet.FieldByName('GROUP_TITLE').ASString;
               T.cxchckbxIS_ABSORBING.Checked:=Boolean(TSP_Raise(owner).DMod.AbsorbeDataSet.FieldByName('IS_ABSORBING').ASInteger);
               if T.ShowModal=mrYes
               then begin
                         InsertSp:=TpFibStoredProc.Create(nil);
                         InsertSp.Database:=TSP_Raise(owner).DMod.FIBDatabase;
                         InsertSp.Transaction:=TSP_Raise(owner).DMod.FIBWriteTransaction;
                         TSP_Raise(owner).DMod.FIBWriteTransaction.StartTransaction;
                         InsertSp.StoredProcName:='UP_DT_ABSORBE_GROUP_UPD';
                         InsertSp.Prepare;
                         InsertSp.ParamByName('GROUP_TITLE').Value:=T.CE_Name.Text;
                         InsertSp.ParamByName('IS_ABSORBING').Value:=Integer(T.cxchckbxIS_ABSORBING.Checked);
                         id_:=TSP_Raise(owner).DMod.AbsorbeDataSet.FieldByName('ID_ABSORBE_GROUP').Value;
                         InsertSp.ParamByName('ID_ABSORBE_GROUP').Value:=TSP_Raise(owner).DMod.AbsorbeDataSet.FieldByName('ID_ABSORBE_GROUP').Value;
                         InsertSp.ExecProc;
                         InsertSp.Close;
                         InsertSp.Free;
                         TSP_Raise(owner).DMod.FIBWriteTransaction.Commit;
                         TSP_Raise(owner).DMod.AbsorbeDataSet.CloseOpen(true);
                         TSP_Raise(owner).DMod.AbsorbeDataSet.Locate('ID_ABSORBE_GROUP',id_,[]);
               end;
               T.Free;
       end;
end;

procedure TfrmGetSpGroup.SBDeleteClick(Sender: TObject);
var InsertSp:TpFibStoredProc;
begin
     if (TSP_Raise(owner).DMod.AbsorbeDataSet.RecordCount>0)
     then begin
               try
                       InsertSp:=TpFibStoredProc.Create(nil);
                       InsertSp.Database:=TSP_Raise(owner).DMod.FIBDatabase;
                       InsertSp.Transaction:=TSP_Raise(owner).DMod.FIBWriteTransaction;
                       TSP_Raise(owner).DMod.FIBWriteTransaction.StartTransaction;
                       InsertSp.StoredProcName:='UP_DT_ABSORBE_GROUP_DEL';
                       InsertSp.Prepare;
                       InsertSp.ParamByName('ID_ABSORBE_GROUP').Value:=TSP_Raise(owner).DMod.AbsorbeDataSet.FieldByName('ID_ABSORBE_GROUP').Value;
                       InsertSp.ExecProc;
                       InsertSp.Close;
                       InsertSp.Free;
                       TSP_Raise(owner).DMod.FIBWriteTransaction.Commit;
                       TSP_Raise(owner).DMod.AbsorbeDataSet.CacheDelete;
               except on E:Exception do
                       begin
                            agShowMessage(E.Message);
                       end;
               end;
       end;
end;

end.
