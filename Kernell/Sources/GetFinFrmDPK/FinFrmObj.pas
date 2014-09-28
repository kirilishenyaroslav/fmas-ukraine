unit FinFrmObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ComCtrls, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ToolWin, ImgList, pFibDataSet,
  pFibStoredProc, FIBDataSet, cxContainer, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TfrmFinObj = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    pageControl1: TPageControl;
    TabSheet1: TTabSheet;
    SchGrid: TcxGrid;
    SchView: TcxGridDBTableView;
    SchViewDBColumn5: TcxGridDBColumn;
    SchViewDBColumn1: TcxGridDBColumn;
    SchLevel: TcxGridLevel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    ToolButton7: TToolButton;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    SchDataSet: TpFIBDataSet;
    SchDataSource: TDataSource;
    PKVDataSet: TpFIBDataSet;
    PKVDataSource: TDataSource;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    RestsDataSet: TpFIBDataSet;
    RestsDataSource: TDataSource;
    ToolButton4: TToolButton;
    Panel2: TPanel;
    Label1: TLabel;
    EdSpravDate: TcxDateEdit;
    PageControl2: TPageControl;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ToolBar3: TToolBar;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton16: TToolButton;
    PKVGrid: TcxGrid;
    PKVView: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn8: TcxGridDBColumn;
    PKVLevel: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    ToolBar4: TToolBar;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    GroupsDataSet: TpFIBDataSet;
    GroupsDataSource: TDataSource;
    PKVViewDBColumn1: TcxGridDBColumn;
    PKVViewDBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    cxGridDBTableView1DBColumn9: TcxGridDBColumn;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DelButtonClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton12Click(Sender: TObject);
    procedure ToolButton13Click(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private

    { Private declarations }

  public

    { Public declarations }

  end;



implementation

uses GlobalSpr, MainFinFrm, BaseTypes, UFinRests, cxCalc, DateUtils;

{$R *.dfm}

procedure TfrmFinObj.cxButton1Click(Sender: TObject);
begin
     ModalResult:=mrYes;
end;

procedure TfrmFinObj.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmFinObj.AddButtonClick(Sender: TObject);
  var Res:Variant;
      id_sch,id_obj:Int64;
      InsertSP:TpFibStoredProc;
begin
      Res:=GlobalSpr.GetSch(self,TfrmFinForms(Self.Owner).WorkDatabase.Handle,fsNormal,EdSpravDate.Date,1,0,0);
      if VarArrayDimCount(Res)>0
      then begin
                id_sch:=VarAsType(RES[0][0],varInt64);
                InsertSP:=TpFibStoredProc.Create(self);
                InsertSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
                InsertSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
                TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
                InsertSP.StoredProcName:='FINANCE_DT_FORM_OBJECTS_INSERT';
                InsertSP.Prepare;
                InsertSP.ParamByName('ID_FORM').AsInt64       :=StrToInt64(TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString);
                InsertSP.ParamByName('ID_TYPE_OBJECT').AsInt64:=0;
                InsertSP.ParamByName('ID_OBJECT').AsInt64     :=id_sch;
                InsertSP.ParamByName('ADDING_DATE').Value     :=EdSpravDate.Date;
                InsertSP.ExecProc;
                id_obj:=InsertSP.ParamByName('ID_FORM_OBJECT').AsInt64;
                TfrmFinForms(Self.Owner).WriteTransaction.Commit;
                InsertSP.Free;
                SchDataSet.CloseOpen(true);
                SchDataSet.Locate('ID_FORM_OBJECT',id_obj,[]);
      end;
end;

procedure TfrmFinObj.FormCreate(Sender: TObject);
begin
      PageControl1.ActivePageIndex:=0;

      SchDataSet.Database         :=TfrmFinForms(Self.Owner).WorkDatabase;
      SchDataSet.Transaction      :=TfrmFinForms(Self.Owner).ReadTransaction;
      SchDataSet.SelectSQL.Text   :='SELECT * FROM FINANCE_DT_FORM_OBJECTS_SELECT('+TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString+',0)';
      SchDataSet.Open;

      PKVDataSet.Database         :=TfrmFinForms(Self.Owner).WorkDatabase;
      PKVDataSet.Transaction      :=TfrmFinForms(Self.Owner).ReadTransaction;
      PKVDataSet.SelectSQL.Text   :='SELECT * FROM FINANCE_DT_FORM_OBJECTS_SELECT('+TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString+',1)';
      PKVDataSet.Open;

      RestsDataSet.Database       :=TfrmFinForms(Self.Owner).WorkDatabase;
      RestsDataSet.Transaction    :=TfrmFinForms(Self.Owner).ReadTransaction;
      RestsDataSet.SelectSQL.Text :='SELECT * FROM FINANCE_DT_RESTS_SELECT('+TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString+')';
      RestsDataSet.Open;

      GroupsDataSet.Database       :=TfrmFinForms(Self.Owner).WorkDatabase;
      GroupsDataSet.Transaction    :=TfrmFinForms(Self.Owner).ReadTransaction;
      GroupsDataSet.SelectSQL.Text :='SELECT * FROM FINANCE_DT_FORM_OBJECTS_SELECT('+TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString+',2)';
      GroupsDataSet.Open;

      EdSpravDate.Date               :=Date;
      
      //EdSpravDate.Properties.MinDate :=TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('DATE_BEG').AsDateTime;
      //EdSpravDate.Properties.MaxDate :=IncYear(TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('DATE_BEG').AsDateTime);
end;

procedure TfrmFinObj.DelButtonClick(Sender: TObject);
 var DeleteSP:TpFibStoredProc;
begin
     if (SchDataSet.RecordCount>0)
     then begin
               if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити рахунок?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
                         DeleteSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
                         TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
                         DeleteSP.StoredProcName:='FINANCE_DT_FORM_OBJECTS_DELETE';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('ID_FORM_OBJECT').AsInt64:=StrToInt64(SchDataSet.FieldByName('ID_FORM_OBJECT').AsString);
                         DeleteSP.ExecProc;
                         TfrmFinForms(Self.Owner).WriteTransaction.Commit;
                         DeleteSP.Free;
                         SchDataSet.CacheDelete;
               end;
     end;
end;

procedure TfrmFinObj.ToolButton7Click(Sender: TObject);
var id_obj:Int64;
begin
     id_obj:=0;
     if (SchDataSet.RecordCount>0)
     then begin
               id_obj:=StrToInt64(SchDataSet.FieldByName('ID_FORM_OBJECT').AsString);
     end;
     SchDataSet.CloseOpen(true);
     SchDataSet.Locate('ID_FORM_OBJECT',id_obj,[]);
end;

procedure TfrmFinObj.ToolButton12Click(Sender: TObject);
var  Res,ResExt:variant;
     InsertSP:TpFibStoredProc;
     id_obj:int64;
begin
     if (GroupsDataSet.RecordCount=0)
     then begin
               Res:=GlobalSpr.GetSmPKV(self,
                                       TfrmFinForms(Self.Owner).WorkDatabase.Handle,
                                       fsNormal,
                                       0);
               if (Res<>Variant(0))
               then begin
                         ResExt:=GlobalSpr.GetTypeFinance(self,
                                                          TfrmFinForms(Self.Owner).WorkDatabase.Handle,
                                                          fsNormal,
                                                          0);
                         if (ResExt<>Variant(0))
                         then begin
                                   InsertSP:=TpFibStoredProc.Create(self);
                                   InsertSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
                                   InsertSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
                                   TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
                                   InsertSP.StoredProcName:='FINANCE_DT_FORM_OBJECTS_INSERT';
                                   InsertSP.Prepare;
                                   InsertSP.ParamByName('ID_FORM').AsInt64       :=StrToInt64(TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString);
                                   InsertSP.ParamByName('ID_TYPE_OBJECT').AsInt64:=1;
                                   InsertSP.ParamByName('ID_OBJECT').AsInt64     :=VarAsType(Res,varInt64);
                                   InsertSP.ParamByName('ID_OBJECT_EXT').AsInt64 :=VarAsType(ResExt,varInt64);
                                   InsertSP.ParamByName('ADDING_DATE').Value     :=EdSpravDate.Date;
                                   InsertSP.ExecProc;
                                   id_obj:=InsertSP.ParamByName('ID_FORM_OBJECT').AsInt64;
                                   TfrmFinForms(Self.Owner).WriteTransaction.Commit;
                                   InsertSP.Free;
                                   PKVDataSet.CloseOpen(true);
                                   PKVDataSet.Locate('ID_FORM_OBJECT',id_obj,[]);
                         end;
               end;
     end
     else ShowMessage('Вже існує умова фільтрації по групі бюджетів.');
end;

procedure TfrmFinObj.ToolButton13Click(Sender: TObject);
 var DeleteSP:TpFibStoredProc;
begin
     if (PKVDataSet.RecordCount>0)
     then begin
               if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити програми?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
                         DeleteSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
                         TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
                         DeleteSP.StoredProcName:='FINANCE_DT_FORM_OBJECTS_DELETE';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('ID_FORM_OBJECT').AsInt64:=StrToInt64(PKVDataSet.FieldByName('ID_FORM_OBJECT').AsString);
                         DeleteSP.ExecProc;
                         TfrmFinForms(Self.Owner).WriteTransaction.Commit;
                         DeleteSP.Free;
                         PKVDataSet.CacheDelete;
               end;
     end;
end;

procedure TfrmFinObj.ToolButton16Click(Sender: TObject);
var id_obj:Int64;
begin
     id_obj:=0;
     if (PKVDataSet.RecordCount>0)
     then begin
               id_obj:=StrToInt64(PKVDataSet.FieldByName('ID_FORM_OBJECT').AsString);
     end;
     PKVDataSet.CloseOpen(true);
     PKVDataSet.Locate('ID_FORM_OBJECT',id_obj,[]);
end;

procedure TfrmFinObj.ToolButton1Click(Sender: TObject);
var T:TfrmGetRests;
    InsertSP:TpFibStoredProc;
    id_rest:int64;
begin
     T:=TfrmGetRests.Create(self);
     if T.ShowModal=mrYes
     then begin
               InsertSP:=TpFibStoredProc.Create(self);
               InsertSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
               InsertSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
               TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
               InsertSP.StoredProcName:='FINANCE_DT_RESTS_INSERT';
               InsertSP.Prepare;
               InsertSP.ParamByName('ID_FORM').AsInt64     :=StrToInt64(TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString);
               InsertSP.ParamByName('ID_SM').AsInt64       :=T.ID_SM;
               InsertSP.ParamByName('ID_RZ').AsInt64       :=T.ID_RZ;
               InsertSP.ParamByName('ID_ST').AsInt64       :=T.ID_ST;
               InsertSP.ParamByName('ID_KEKV').AsInt64     :=T.ID_KV;
               InsertSP.ParamByName('ID_SCH').AsInt64      :=T.ID_SCH;
               InsertSP.ParamByName('ID_ENUM').AsInt64     :=T.ID_ENUM;
               InsertSP.ParamByName('SUMMA').Value         :=T.EdSumma.Value;

               InsertSP.ParamByName('SUMMA_FV').Value      :=T.fv_summa.Value;
               InsertSP.ParamByName('SUMMA_KV').Value      :=T.kv_summa.Value;
               InsertSP.ParamByName('SUMMA_NAD').Value     :=T.Nad_summa.Value;
               InsertSP.ParamByName('SUMMA_NAR').Value     :=T.Nar_summa.Value;

               InsertSP.ExecProc;
               id_rest:=InsertSP.ParamByName('ID_REST').asInt64;
               TfrmFinForms(Self.Owner).WriteTransaction.Commit;
               InsertSP.Free;
               RestsDataSet.CloseOpen(true);
               RestsDataSet.Locate('ID_REST',id_rest,[]);
     end;
     T.Free;
end;

procedure TfrmFinObj.ToolButton3Click(Sender: TObject);
var id_rest:Int64;
begin
     id_rest:=0;

     if (RestsDataSet.RecordCount>0)
     then begin
               id_rest:=StrToInt64(RestsDataSet.FieldByName('ID_REST').AsString);
     end;

     RestsDataSet.CloseOpen(true);
     RestsDataSet.Locate('ID_REST',id_rest,[]);
end;

procedure TfrmFinObj.ToolButton2Click(Sender: TObject);
 var DeleteSP:TpFibStoredProc;
begin
     if (RestsDataSet.RecordCount>0)
     then begin
               if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити залишок?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
                         DeleteSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
                         TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
                         DeleteSP.StoredProcName:='FINANCE_DT_RESTS_DELETE';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('ID_REST').AsInt64:=StrToInt64(RestsDataSet.FieldByName('ID_REST').AsString);
                         DeleteSP.ExecProc;
                         TfrmFinForms(Self.Owner).WriteTransaction.Commit;
                         DeleteSP.Free;
                         RestsDataSet.CacheDelete;
               end;
     end;
end;

procedure TfrmFinObj.ToolButton6Click(Sender: TObject);
var InsertSP:TpFibStoredProc;
    Res:Variant;
    id_obj:Int64;
begin
     if PKVDataSet.RecordCount=0
     then begin
               Res:=GlobalSpr.GetSmGrp(self,TfrmFinForms(Self.Owner).WorkDatabase.Handle,fsNormal,-1,TfrmFinForms(Self.Owner).id_user);
               if VarArrayDimCount(Res)>0
               then begin
                         InsertSP:=TpFibStoredProc.Create(self);
                         InsertSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
                         InsertSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
                         TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
                         InsertSP.StoredProcName:='FINANCE_DT_FORM_OBJECTS_INSERT';
                         InsertSP.Prepare;
                         InsertSP.ParamByName('ID_FORM').AsInt64       :=StrToInt64(TfrmFinForms(Self.Owner).FormsDataSet.FieldByName('ID_FORM').AsString);
                         InsertSP.ParamByName('ID_TYPE_OBJECT').AsInt64:=2;
                         InsertSP.ParamByName('ID_OBJECT').AsInt64     :=VarAsType(Res[0],varInt64);
                         InsertSP.ParamByName('ADDING_DATE').Value     :=EdSpravDate.Date;
                         InsertSP.ExecProc;
                         id_obj:=InsertSP.ParamByName('ID_FORM_OBJECT').AsInt64;
                         TfrmFinForms(Self.Owner).WriteTransaction.Commit;
                         InsertSP.Free;
                         GroupsDataSet.CloseOpen(true);
                         GroupsDataSet.Locate('ID_FORM_OBJECT',id_obj,[]);
               end;
     end
     else ShowMessage('Вже існує умова фільтрації по програмі фінансування.');
end;

procedure TfrmFinObj.ToolButton8Click(Sender: TObject);
 var DeleteSP:TpFibStoredProc;
begin
     if (GroupsDataSet.RecordCount>0)
     then begin
               if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити групу бюджетів?',mtConfirmation,[mbYes,mbNo])=mrYes
               then begin
                         DeleteSP:=TpFibStoredProc.Create(self);
                         DeleteSP.Database   :=TfrmFinForms(Self.Owner).WorkDatabase;
                         DeleteSP.Transaction:=TfrmFinForms(Self.Owner).WriteTransaction;
                         TfrmFinForms(Self.Owner).WriteTransaction.StartTransaction;
                         DeleteSP.StoredProcName:='FINANCE_DT_FORM_OBJECTS_DELETE';
                         DeleteSP.Prepare;
                         DeleteSP.ParamByName('ID_FORM_OBJECT').AsInt64:=StrToInt64(GroupsDataSet.FieldByName('ID_FORM_OBJECT').AsString);
                         DeleteSP.ExecProc;
                         TfrmFinForms(Self.Owner).WriteTransaction.Commit;
                         DeleteSP.Free;
                         GroupsDataSet.CacheDelete;
               end;
     end;
end;

procedure TfrmFinObj.ToolButton5Click(Sender: TObject);
var id_obj:Int64;
begin
     id_obj:=0;
     if (GroupsDataSet.RecordCount>0)
     then begin
               id_obj:=StrToInt64(GroupsDataSet.FieldByName('ID_FORM_OBJECT').AsString);
     end;
     GroupsDataSet.CloseOpen(true);
     GroupsDataSet.Locate('ID_FORM_OBJECT',id_obj,[]);
end;

end.
