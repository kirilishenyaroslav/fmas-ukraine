unit NeosnovnieMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ImgList, dxBar, ExtCtrls,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  dxBarExtItems, cxSplitter, ActnList, FIBDatabase, pFIBDatabase,
  FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, pFIBStoredProc;

type
  TfmNeosnovnieMain = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButtonAdd: TdxBarLargeButton;
    dxBarButtonUpdate: TdxBarLargeButton;
    dxBarButtonDelete: TdxBarLargeButton;
    dxBarButtonRefresh: TdxBarLargeButton;
    dxBarButtonExit: TdxBarLargeButton;
    dxBarButtonAdd1: TdxBarLargeButton;
    dxBarButtonUpdate1: TdxBarLargeButton;
    dxBarButtonDelete1: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    dxBarDockControl1: TdxBarDockControl;
    dxBarSubItem2: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    ImageList: TImageList;
    cxSplitter1: TcxSplitter;
    StyleRepository: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    dxBarLargeButton4: TdxBarLargeButton;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDel: TAction;
    ActionRefresh: TAction;
    ActionExit: TAction;
    ActionTake: TAction;
    ActionAddPr: TAction;
    ActionChangePr: TAction;
    ActionDelPr: TAction;
    dxBarLargeButton5: TdxBarLargeButton;
    Database: TpFIBDatabase;
    DataSetMain: TpFIBDataSet;
    TransactionRead: TpFIBTransaction;
    DataSourceMain: TDataSource;
    DataSetProv: TpFIBDataSet;
    DataSourceProv: TDataSource;
    DataSetDef: TpFIBDataSet;
    StoredProcAdd: TpFIBStoredProc;
    TransactionWr: TpFIBTransaction;
    Query: TpFIBQuery;
    Procedure ShowF(d : TpFibDataBase; td : Tdate);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionTakeExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionAddPrExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure ActionDelPrExecute(Sender: TObject);
    procedure ActionChangePrExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDelExecute(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGrid2DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    VarRes : variant;
  public
    DDate : TDate;
  end;

function Show_Neosnov(AO : TComponent; d : TpfibDatabase; style : TFormStyle; dd : Tdate) : Variant; stdcall;
    exports Show_Neosnov;

implementation
uses NeosnovnieAdd, GlobalSPR, NeosnovniePerSum, Un_R_file_Alex, Un_Progress_form;

{$R *.dfm}

{ TfmNeosnovnieMain }

function Show_Neosnov(AO : TComponent; d : TpfibDatabase; style : TFormStyle; dd : Tdate) : Variant;
Var
    T : TfmNeosnovnieMain;
begin
    T := TfmNeosnovnieMain.Create(AO);
    T.FormStyle := style;
    T.ddate     := dd;
    T.ShowF(d, dd);
    if style = fsNormal then
    begin
         if T.ShowModal=mrOk then
         begin
             Result := T.VarRes;
         end;
         T.Free;
    end else
    begin
        T.ActionTake.Enabled := false; 
        Result := -1;
    end;
end;

procedure TfmNeosnovnieMain.ShowF(d: TpFibDataBase; td : Tdate);
begin
    Database                        := D;
    TransactionRead.DefaultDatabase := Database;
    TransactionWr.DefaultDatabase   := Database;
    Database.DefaultTransaction     := TransactionRead;

    DataSetMain.Database            := DataBase;
    DataSetMain.Transaction         := TransactionRead;
    DataSetProv.Database            := DataBase;
    DataSetProv.Transaction         := TransactionRead;
    DataSetDef.Database             := DataBase;
    DataSetDef.Transaction          := TransactionRead;

    TransactionRead.StartTransaction;

    Caption                              := Un_R_file_Alex.J4_CAPTION;
    cxGrid1DBTableView1DBColumn1.Caption := Un_R_file_Alex.J4_NEOSNOV_KOD;
    cxGrid1DBTableView1DBColumn2.Caption := Un_R_file_Alex.J4_NEOSNOV_FULL_NAME;
    cxGrid2DBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_SCH;
    cxGrid2DBTableView1DBColumn2.Caption := Un_R_file_Alex.MY_PROV;
    cxGrid2DBTableView1DBColumn3.Caption := Un_R_file_Alex.J4_NEOSNOV_PERSEND;
    ActionAdd.Caption                    := Un_R_file_Alex.MY_ACTION_ADD_CONST;
    ActionChange.Caption                 := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
    ActionDel.Caption                    := Un_R_file_Alex.MY_ACTION_DELETE_CONST;
    ActionRefresh.Caption                := Un_R_file_Alex.MY_ACTION_REFRESH_CONST;
    ActionExit.Caption                   := Un_R_file_Alex.MY_ACTION_CLOSE_VIH;
    ActionTake.Caption                   := Un_R_file_Alex.MY_ACTION_CHOOSE_CONST;
    ActionAddPr.Caption                  := Un_R_file_Alex.J4_ADD_PROV;
    ActionChangePr.Caption               := Un_R_file_Alex.J4_UPDATE_PROV;
    ActionDelPr.Caption                  := Un_R_file_Alex.J4_DEL_PROV;

    DataSetProv.Sqls.SelectSQL.Text := 'select * from J4_SELECT_NEOSNOV_PROV_MAIN(?KOD, '''+DateToStr(td)+''')';
    DataSetMain.Close;
    DataSetMain.Sqls.SelectSQL.Text := 'select distinct KOD, SHORT_NAME, FULL_NAME from J4_DT_NEOSNOVNIE_PROV';
    DataSetMain.Open;
end;

procedure TfmNeosnovnieMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmNeosnovnieMain.ActionTakeExecute(Sender: TObject);
var
    kod  : integer;
    name : string;
begin
    kod    := DataSetMain.FBN('KOD').AsInteger;
    name   := DataSetMain.FBN('SHORT_NAME').AsString;
    VarRes := VarArrayOf([kod, name]);
    ModalResult := mrOk;
end;

procedure TfmNeosnovnieMain.ActionExitExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmNeosnovnieMain.ActionAddExecute(Sender: TObject);
var
    kod, name, full_name : string;
    id_sch, id_smeta, id_razd, id_state, id_kekv : int64;
    Res, ResSM, ResKekv : variant;
    sum : Currency;
begin
    kod       := '';
    name      := '';
    full_name := '';
    if Add_neosnov(kod, name, full_name)=1 then
    begin
        Res := GetSch(Self, Database.Handle, fsNormal, DDate, 1, 0, 0);
        if VarArrayDimCount(Res) > 0 then
        begin
            id_sch := res[0][0];
//            cxMRUEditSch.Text := res[0][3];
//            cxLabel10.Caption := res[0][2];
            DataSetDef.Close;
            DataSetDef.sqls.selectSql.Text := 'SELECT * FROM MBOOK_INI_DATA';
            DataSetDef.Open;
            if DataSetDef.FBN('USE_DEFAULT_VALUES').AsInteger = 0 then
            begin
                ResSM := GlobalSPR.GetSmets(self, Database.Handle, DDate, psmRazdSt);
                if VarArrayDimCount(ResSM) > 0 then
                begin
                    if ResSM[0] <> 0 then
                    begin
                        id_smeta    := resSM[0];
                        id_razd     := resSM[1];
                        id_state    := resSM[2];
{                        cxMRUEditSmeta.Text := res[9];
                        cxLabel6.Visible    := true;
                        cxLabel6.Caption     := res[6];
                        cxMRUEditRazd.Text  := res[7];
                        cxLabel7.Visible    := true;
                        cxLabel7.Caption    := res[4];
                        cxMRUEditState.text := res[8];
                        cxLabel8.Visible    := true;
                        cxLabel8.Caption    := res[5];
}                   end;
                end else
                begin
                    Exit;
                end;
            end else
            begin
                id_smeta   := StrToInt64(DataSetDef.FBN('DEFAULT_SMETA').AsString);
                id_razd    := StrToInt64(DataSetDef.FBN('DEFAULT_RAZD').AsString);
                id_state   := StrToInt64(DataSetDef.FBN('DEFAULT_ST').AsString);
            end;
            if DataSetDef.FBN('USE_DEFAULT_KEKV').AsInteger = 0 then
            begin
                ResKekv := GlobalSPR.GetKEKVSpr(self, Database.Handle, fsNormal, DDate, 1);
                if VarArrayDimCount(res) > 0 then
                begin
                    if (ResKekv[0][0]<>null) and (ResKekv[0][1]<>null) then
                    begin
                        id_kekv             := ResKekv[0][0];
//                        cxMRUEditKekv.Text  := res[0][2];
//                        cxLabel9.Caption    := res[0][1];;
                    end;
                end else
                begin
                    Exit;
                end;
            end else
            begin
                id_kekv := StrToInt64(DataSetDef.FBN('DEFAULT_KEKV').AsString);
            end;
            if Sel_Sum_Neosn(sum) then
            begin
                try
                StoredProcAdd.Database    := Database;
                StoredProcAdd.Transaction := TransactionWr;
                TransactionWr.StartTransaction;
                StoredProcAdd.StoredProcName := 'J4_INSERT_NEOSNOV_PROV';
                StoredProcAdd.Prepare;
                StoredProcAdd.ParamByName('D_KOD').AsInteger        := StrToInt(kod);
                StoredProcAdd.ParamByName('D_SHORT_NAME').AsString  := name;
                StoredProcAdd.ParamByName('D_FULL_NAME').AsString   := full_name;
                StoredProcAdd.ParamByName('D_ID_SMETA').AsInt64     := id_smeta;
                StoredProcAdd.ParamByName('D_ID_SCH_KOR').AsInt64   := id_sch;
                StoredProcAdd.ParamByName('D_ID_RAZD').AsInt64      := id_razd;
                StoredProcAdd.ParamByName('D_ID_STATE').AsInt64     := id_state;
                StoredProcAdd.ParamByName('D_ID_KEKV').AsInt64      := id_kekv;
                StoredProcAdd.ParamByName('D_PER_SUMMA').AsCurrency := sum;
//                StoredProcAdd.ParamByName('D_CREATE_GEN').AsInteger := 1;
                StoredProcAdd.ExecProc;
                TransactionWr.Commit;
                ActionRefreshExecute(self);
                except on E:Exception do
                    begin
                        TransactionWr.Rollback;
                        ShowMessage(E.Message);
                        exit;
                    end
                end;
            DataSetDef.Close;
            end else
            begin
                Exit;
            end;
        end;
    end;
end;

procedure TfmNeosnovnieMain.ActionAddPrExecute(Sender: TObject);
var
    kod, name, full_name : string;
    id_sch, id_smeta, id_razd, id_state, id_kekv : int64;
    Res, ResSM, ResKekv : variant;
    sum : Currency;
begin
    if not DataSetMain.IsEmpty then
    begin
        Res := GetSch(Self, Database.Handle, fsNormal, DDate, 1, 0, 0);
        if VarArrayDimCount(Res) > 0 then
        begin
            id_sch := res[0][0];
            DataSetDef.Close;
            DataSetDef.sqls.selectSql.Text := 'SELECT * FROM MBOOK_INI_DATA';
            DataSetDef.Open;
            if DataSetDef.FBN('USE_DEFAULT_VALUES').AsInteger = 0 then
            begin
                ResSM := GlobalSPR.GetSmets(self, Database.Handle, DDate, psmRazdSt);
                if VarArrayDimCount(ResSM) > 0 then
                begin
                    if ResSM[0] <> 0 then
                    begin
                        id_smeta    := resSM[0];
                        id_razd     := resSM[1];
                        id_state    := resSM[2];
                    end;
                end else
                begin
                    Exit;
                end;
            end else
            begin
                id_smeta   := StrToInt64(DataSetDef.FBN('DEFAULT_SMETA').AsString);
                id_razd    := StrToInt64(DataSetDef.FBN('DEFAULT_RAZD').AsString);
                id_state   := StrToInt64(DataSetDef.FBN('DEFAULT_ST').AsString);
            end;
            if DataSetDef.FBN('USE_DEFAULT_KEKV').AsInteger = 0 then
            begin
                ResKekv := GlobalSPR.GetKEKVSpr(self, Database.Handle, fsNormal, DDate, 1);
                if VarArrayDimCount(res) > 0 then
                begin
                    if (ResKekv[0][0]<>null) and (ResKekv[0][1]<>null) then
                    begin
                        id_kekv             := ResKekv[0][0];
                    end;
                end else
                begin
                    Exit;
                end;
            end else
            begin
                id_kekv := StrToInt64(DataSetDef.FBN('DEFAULT_KEKV').AsString);
            end;
            if Sel_Sum_Neosn(sum) then
            begin
                try
                kod       := DataSetMain.FieldByName('KOD').AsString;
                name      := DataSetMain.FieldByName('SHORT_NAME').AsString;
                full_name := DataSetMain.FieldByName('FULL_NAME').AsString;
                StoredProcAdd.Database    := Database;
                StoredProcAdd.Transaction := TransactionWr;
                TransactionWr.StartTransaction;
                StoredProcAdd.StoredProcName := 'J4_INSERT_NEOSNOV_PROV';
                StoredProcAdd.Prepare;
                StoredProcAdd.ParamByName('D_KOD').AsInteger        := StrToInt(kod);
                StoredProcAdd.ParamByName('D_SHORT_NAME').AsString  := name;
                StoredProcAdd.ParamByName('D_FULL_NAME').AsString   := full_name;
                StoredProcAdd.ParamByName('D_ID_SMETA').AsInt64     := id_smeta;
                StoredProcAdd.ParamByName('D_ID_SCH_KOR').AsInt64   := id_sch;
                StoredProcAdd.ParamByName('D_ID_RAZD').AsInt64      := id_razd;
                StoredProcAdd.ParamByName('D_ID_STATE').AsInt64     := id_state;
                StoredProcAdd.ParamByName('D_ID_KEKV').AsInt64      := id_kekv;
                StoredProcAdd.ParamByName('D_PER_SUMMA').AsCurrency := sum;
//                StoredProcAdd.ParamByName('D_CREATE_GEN').AsInteger := 1;
                StoredProcAdd.ExecProc;
                TransactionWr.Commit;
                ActionRefreshExecute(self);
                except on E:Exception do
                    begin
                        TransactionWr.Rollback;
                        ShowMessage(E.Message);
                        exit;
                    end
                end;
            end else
            begin
                Exit;
            end;
        end;
    end;
end;

procedure TfmNeosnovnieMain.ActionRefreshExecute(Sender: TObject);
begin
    DataSetMain.CloseOpen(false);
end;

procedure TfmNeosnovnieMain.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ActionTakeExecute(sender);
end;

procedure TfmNeosnovnieMain.ActionDelPrExecute(Sender: TObject);
var
    id_p : int64;
    T : TfmUn_Progress_form;
begin
    if not DataSetProv.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.J4_DEL_NEOSNOV + DataSetProv.FBN('KOD_SCH').AsString + ' ?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_DELETE_DATA);
            T.Show;
            T.UpDate;
            Query.Database    := Database;
            Query.Transaction := TransactionWr;
            TransactionWr.StartTransaction;
            try
                id_p := StrToInt64(DataSetProv.FBN('J4_ID').AsString);
                Query.close;
                Query.SQL.Clear;
                Query.SQL.Text := 'DELETE FROM J4_DT_NEOSNOVNIE_PROV WHERE J4_DT_ID_PROV='+IntToStr(id_p)+'';
                Query.ExecQuery;
                TransactionWr.Commit;
                ActionRefreshExecute(Sender);
                T.Free;
            except on E:Exception do begin
                TransactionWr.Rollback;
                T.Free;
                ShowMessage(E.Message);
            end;
            end
        end;
    end;
end;

procedure TfmNeosnovnieMain.ActionChangePrExecute(Sender: TObject);
var
    kod, name, full_name : string;
    id_sch, id_smeta, id_razd, id_state, id_kekv, id_p : int64;
    Res, ResSM, ResKekv : variant;
    sum : Currency;
begin
    if not DataSetMain.IsEmpty then
    begin
        Res := GetSch(Self, Database.Handle, fsNormal, DDate, 1, 0, 0);
        if VarArrayDimCount(Res) > 0 then
        begin
            id_sch := res[0][0];
            DataSetDef.Close;
            DataSetDef.sqls.selectSql.Text := 'SELECT * FROM MBOOK_INI_DATA';
            DataSetDef.Open;
            if DataSetDef.FBN('USE_DEFAULT_VALUES').AsInteger = 0 then
            begin
                ResSM := GlobalSPR.GetSmets(self, Database.Handle, DDate, psmRazdSt);
                if VarArrayDimCount(ResSM) > 0 then
                begin
                    if ResSM[0] <> 0 then
                    begin
                        id_smeta    := resSM[0];
                        id_razd     := resSM[1];
                        id_state    := resSM[2];
                    end;
                end else
                begin
                    Exit;
                end;
            end else
            begin
                id_smeta   := StrToInt64(DataSetDef.FBN('DEFAULT_SMETA').AsString);
                id_razd    := StrToInt64(DataSetDef.FBN('DEFAULT_RAZD').AsString);
                id_state   := StrToInt64(DataSetDef.FBN('DEFAULT_ST').AsString);
            end;
            if DataSetDef.FBN('USE_DEFAULT_KEKV').AsInteger = 0 then
            begin
                ResKekv := GlobalSPR.GetKEKVSpr(self, Database.Handle, fsNormal, DDate, 1);
                if VarArrayDimCount(res) > 0 then
                begin
                    if (ResKekv[0][0]<>null) and (ResKekv[0][1]<>null) then
                    begin
                        id_kekv             := ResKekv[0][0];
                    end;
                end else
                begin
                    Exit;
                end;
            end else
            begin
                id_kekv := StrToInt64(DataSetDef.FBN('DEFAULT_KEKV').AsString);
            end;
            if Sel_Sum_Neosn(sum) then
            begin
                try
                kod       := DataSetMain.FieldByName('KOD').AsString;
                name      := DataSetMain.FieldByName('SHORT_NAME').AsString;
                full_name := DataSetMain.FieldByName('FULL_NAME').AsString;
                id_p      := StrToInt64(DataSetProv.FBN('J4_ID').AsString);
                StoredProcAdd.Database    := Database;
                StoredProcAdd.Transaction := TransactionWr;
                TransactionWr.StartTransaction;
                StoredProcAdd.StoredProcName := 'J4_UPDATE_NEOSNOV_PROV';
                StoredProcAdd.Prepare;
                StoredProcAdd.ParamByName('D_ID_SMETA').AsInt64     := id_smeta;
                StoredProcAdd.ParamByName('D_ID_SCH_KOR').AsInt64   := id_sch;
                StoredProcAdd.ParamByName('D_ID_RAZD').AsInt64      := id_razd;
                StoredProcAdd.ParamByName('D_ID_STATE').AsInt64     := id_state;
                StoredProcAdd.ParamByName('D_ID_KEKV').AsInt64      := id_kekv;
                StoredProcAdd.ParamByName('D_PER_SUMMA').AsCurrency := sum;
                StoredProcAdd.ParamByName('D_J4_ID').AsInt64        := id_p;
                StoredProcAdd.ExecProc;
                TransactionWr.Commit;
                ActionRefreshExecute(self);
                except on E:Exception do
                    begin
                        TransactionWr.Rollback;
                        ShowMessage(E.Message);
                        exit;
                    end
                end;
            end else
            begin
                Exit;
            end;
        end;
    end;
end;

procedure TfmNeosnovnieMain.ActionChangeExecute(Sender: TObject);
var
    id_p, kod, name, full_name : string;
    T : TfmUn_Progress_form;
    id_sch, id_smeta, id_razd, id_state, id_kekv : int64;
    Res, ResSM, ResKekv : variant;
begin
    if not DataSetMain.IsEmpty then
    begin
        kod       := DataSetMain.FieldByName('KOD').AsString;
        id_p      := kod;
        name      := DataSetMain.FieldByName('SHORT_NAME').AsString;
        full_name := DataSetMain.FieldByName('FULL_NAME').AsString;
        if Add_neosnov(kod, name, full_name)=1 then
        begin
            T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_UPDATE_DATA);
            T.Show;
            T.UpDate;
            StoredProcAdd.Database    := Database;
            StoredProcAdd.Transaction := TransactionWr;
            TransactionWr.StartTransaction;
            try
            StoredProcAdd.StoredProcName := 'J4_UPDATE_NEOSNOV_PROV_NAME';
            StoredProcAdd.Prepare;
            StoredProcAdd.ParamByName('D_OLD_KOD').AsString    := id_p;
            StoredProcAdd.ParamByName('D_NEW_KOD').AsString    := kod;
            StoredProcAdd.ParamByName('D_SHORT_NAME').AsString := name;
            StoredProcAdd.ParamByName('D_FULL_NAME').AsString  := full_name;
            StoredProcAdd.ExecProc;
            TransactionWr.Commit;
            T.Free;
            ActionRefreshExecute(self);
            except on E:Exception do
                begin
                    TransactionWr.Rollback;
                    T.Free;
                    ShowMessage(E.Message);
                    exit;
                end
            end;
        end;
    end;
end;

procedure TfmNeosnovnieMain.ActionDelExecute(Sender: TObject);
var
    id_p : string;
    T : TfmUn_Progress_form;
begin
    if not DataSetMain.IsEmpty then
    begin
        if MessageBox(Handle, Pchar(Un_R_file_Alex.J4_DEL_ALL_NEOSNOV + DataSetMain.FBN('KOD').AsString + ' ?'), Pchar(Un_R_file_Alex.KASSA_LOOK_FOR), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            T := TfmUn_Progress_form.Create(nil, wait_, Un_R_file_Alex.WAIT_DELETE_DATA);
            T.Show;
            T.UpDate;
            Query.Database    := Database;
            Query.Transaction := TransactionWr;
            TransactionWr.StartTransaction;
            try
                id_p := DataSetMain.FBN('KOD').AsString;
                Query.close;
                Query.SQL.Clear;
                Query.SQL.Text := 'DELETE FROM J4_DT_NEOSNOVNIE_PROV WHERE KOD='''+id_p+'''';
                Query.ExecQuery;
                TransactionWr.Commit;
                ActionRefreshExecute(Sender);
                T.Free;
            except on E:Exception do
            begin
                TransactionWr.Rollback;
                T.Free;
                ShowMessage(E.Message);
            end;
            end
        end;
    end;
end;

procedure TfmNeosnovnieMain.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_INSERT  then ActionAddExecute(self);
    if key = VK_F2	    then ActionChangeExecute(Self);
    if key = Vk_Delete	then ActionDelExecute(Self);
end;

procedure TfmNeosnovnieMain.cxGrid2DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if key = VK_INSERT  then ActionAddPrExecute(self);
    if key = VK_F2	    then ActionChangePrExecute(Self);
    if key = VK_Delete	then ActionDelPrExecute(Self);
end;

end.
