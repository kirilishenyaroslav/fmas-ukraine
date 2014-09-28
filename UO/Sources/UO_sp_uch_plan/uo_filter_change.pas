unit uo_filter_change;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxLookAndFeelPainters, StdCtrls, cxButtons,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, ActnList, ImgList,
  FIBQuery, pFIBQuery, pFIBStoredProc;

type
  Tfmuo_filter_change = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    cxButton1: TcxButton;
    DataSource1: TDataSource;
    DS: TpFIBDataSet;
    DB: TpFIBDatabase;
    Tr: TpFIBTransaction;
    TWr: TpFIBTransaction;
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
    ImageListButton: TImageList;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionChange: TAction;
    ActionDelete: TAction;
    ActionClose: TAction;
    ActionPrint: TAction;
    ActionFind: TAction;
    ActionUp: TAction;
    ActionCancel: TAction;
    ActionRefresh: TAction;
    ActionProperties: TAction;
    ActionProp: TAction;
    ActionCopy: TAction;
    ActionMoveTo: TAction;
    ActionLast: TAction;
    ActionPrintMan: TAction;
    ActionTake: TAction;
    ActionView: TAction;
    ActionFullCollaps: TAction;
    ActionFullExpand: TAction;
    ActionAddKoren: TAction;
    Action1: TAction;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    StProc: TpFIBStoredProc;
    DSID_PARAM: TFIBBCDField;
    DSNAME_PARAM: TFIBStringField;
    procedure cxButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton3Click(Sender: TObject);
    procedure Refresh;
    procedure cxButton4Click(Sender: TObject);
  private
    id_u, id_ses : int64;
    rrr : integer;

  public
    { Public declarations }
  end;

function Uo_show_filter_shange (id_user, id_session : int64; DB : TpfibDatabase; reg : integer) : boolean;

implementation
uses    cn_Common_Loader,
        cn_Common_Types,
        uPrk_Loader,
        uPrK_Resources,
        uUO_Loader,
        uo_hours_add,
        uo_sp_ucplan_semhours,
        uo_control_add,
        uSpecKlassSprav,
        uCommonSp;

{$R *.dfm}

function Uo_show_filter_shange (id_user, id_session : int64; DB : TpfibDatabase; reg : integer) : boolean;
var
    T : Tfmuo_filter_change;
begin
    T        := Tfmuo_filter_change.Create(nil);
    T.id_u   := id_user;
    T.DB     := DB;
    T.Tr.DefaultDatabase    := T.DB;
    T.DB.DefaultTransaction := T.Tr;

    T.DS.Database           := T.DB;
    T.DS.Transaction        := T.Tr;

    T.Tr.StartTransaction;

    T.rrr    := reg;
    T.id_ses := 1;//id_session;

    case reg of
        1 : T.Caption := 'Вікно редагування фільтру фак-ти';
        2 : T.Caption := 'Вікно редагування фільтру спеціальності';
        3 : T.Caption := 'Вікно редагування фільтру рік набору';
        4 : T.Caption := 'Вікно редагування фільтру форма навчання';
        5 : T.Caption := 'Вікно редагування фільтру категорія навчання';
    end;
    T.Refresh;
    if T.ShowModal = mrOk then
    begin
        if T.DS.RecordCount > 0
            then Result := true
            else Result := false;
    end else
        Result := false;
    T.Free;
end;

procedure Tfmuo_filter_change.cxButton1Click(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_filter_change.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Modalresult := mrOk;
end;

procedure Tfmuo_filter_change.cxButton3Click(Sender: TObject);
begin
    if not DS.isEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити значення фільтру ' + DS.FieldByName('NAME_PARAM').AsString + '?'), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrNo then exit;
        if rrr = 1 then
        begin
            TWr.DefaultDatabase := DB;
            StProc.Database     := DB;
            StProc.Transaction  := TWr;
            try
                TWr.StartTransaction;
                StProc.StoredProcName := 'UO_FILTER_FAK_DEL';
                StProc.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                StProc.ParamByName('D_ID_USER').AsInt64         := id_u;
                StProc.ParamByName('D_ID_PARAM').AsInt64        := StrToint64(DS.fbn('ID_PARAM').AsString);
                StProc.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
        if rrr = 2 then
        begin
            TWr.DefaultDatabase := DB;
            StProc.Database     := DB;
            StProc.Transaction  := TWr;
            try
                TWr.StartTransaction;
                StProc.StoredProcName := 'UO_FILTER_SPEC_DEL';
                StProc.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                StProc.ParamByName('D_ID_USER').AsInt64         := id_u;
                StProc.ParamByName('D_ID_PARAM').AsInt64        := StrToint64(DS.fbn('ID_PARAM').AsString);
                StProc.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
        if rrr = 3 then
        begin
            TWr.DefaultDatabase := DB;
            StProc.Database     := DB;
            StProc.Transaction  := TWr;
            try
                TWr.StartTransaction;
                StProc.StoredProcName := 'UO_FILTER_YEAR_NABOR_DEL';
                StProc.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                StProc.ParamByName('D_ID_USER').AsInt64         := id_u;
                StProc.ParamByName('D_ID_PARAM').AsInt64        := StrToint64(DS.fbn('ID_PARAM').AsString);
                StProc.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
        if rrr = 4 then
        begin
            TWr.DefaultDatabase := DB;
            StProc.Database     := DB;
            StProc.Transaction  := TWr;
            try
                TWr.StartTransaction;
                StProc.StoredProcName := 'UO_FILTER_FORMA_DEL';
                StProc.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                StProc.ParamByName('D_ID_USER').AsInt64         := id_u;
                StProc.ParamByName('D_ID_PARAM').AsInt64        := StrToint64(DS.fbn('ID_PARAM').AsString);
                StProc.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
        if rrr = 5 then
        begin
            TWr.DefaultDatabase := DB;
            StProc.Database     := DB;
            StProc.Transaction  := TWr;
            try
                TWr.StartTransaction;
                StProc.StoredProcName := 'UO_FILTER_KAT_DEL';
                StProc.ParamByName('D_ID_SESSION').AsInt64      := id_ses;
                StProc.ParamByName('D_ID_USER').AsInt64         := id_u;
                StProc.ParamByName('D_ID_PARAM').AsInt64        := StrToint64(DS.fbn('ID_PARAM').AsString);
                StProc.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            Refresh;
        end;
    end;
end;

procedure Tfmuo_filter_change.Refresh;
begin
    DS.Close;
    DS.Sqls.SelectSQL.Text := 'select * from UO_FILTER_CHANGE_SELECT('+intToStr(rrr)+', '+intToStr(id_u)+', '+IntToStr(id_ses)+')';
    DS.open;
end;

procedure Tfmuo_filter_change.cxButton4Click(Sender: TObject);
var
    AParameter : TcnSimpleParams;
    Res : variant;
    sp : TSprav;
    id : int64;
begin
        if rrr = 1 then
        begin
            sp := GetSprav('SpDepartment');
            if sp <> nil then
            begin
                with sp.Input do
                begin
                    Append;
                    FieldValues['DBHandle']     := Integer(DB.Handle);
                    FieldValues['ShowStyle']    := 0;
                    FieldValues['Select']       := 1;
                    FieldValues['Actual_Date']  := date;
                    FieldValues['Id_Property']  := 77;

                    Post;
                end;
                sp.Show;
//        if sp.Output['CorrFilter']=1 then
                if (sp.Output <> nil) and not sp.Output.IsEmpty then
                begin
                    id := sp.Output['Id_Department'];
//                    DisplayText := sp.Output['Name_Full'];
                end else id := -1;
                sp.Free;


                TWr.DefaultDatabase := DB;
                StProc.Database     := DB;
                StProc.Transaction  := TWr;
                try
                    TWr.StartTransaction;
                    StProc.StoredProcName := 'UO_FILTER_FAK_INS';
                    StProc.ParamByName('ID_SESSION').AsInt64      := id_ses;
                    StProc.ParamByName('ID_USER').AsInt64         := id_u;
                    StProc.ParamByName('ID_FAK').AsInt64          := id;
                    StProc.ExecProc;
                    TWr.Commit;
                except on E:Exception do begin
                    TWr.Rollback;
                    ShowMessage(E.Message);
                end end;
                Refresh;
            end;
        end;
        if rrr = 2 then
        begin
            res := uSpecKlassSprav.ShowSprav(Self, DB.Handle, PUB_SP_USPEC, fsNormal);
            if VarArrayDimCount(res) > 0 then
            begin
//                ID_SP_SPEC              := Res[0];
//                cxButtonEdit1.Text      := VarToStr(Res[1])+' ('+VarToStr(Res[2]) + ')';
                TWr.DefaultDatabase := DB;
                StProc.Database     := DB;
                StProc.Transaction  := TWr;
                try
                    TWr.StartTransaction;
                    StProc.StoredProcName := 'UO_FILTER_SPEC_INS';
                    StProc.ParamByName('ID_SESSION').AsInt64      := id_ses;
                    StProc.ParamByName('ID_USER').AsInt64         := id_u;
                    StProc.ParamByName('ID_SPEC').AsInt64         := Res[0];
                    StProc.ExecProc;
                    TWr.Commit;
                except on E:Exception do begin
                    TWr.Rollback;
                    ShowMessage(E.Message);
                end end;
                Refresh;
            end;
        end;
        if rrr = 3 then
        begin
            Res := uPrK_Loader.ShowPrkSprav(self, DB.Handle, PrK_SP_GOD_NABORA, fsNormal);
            if VarArrayDimCount(res) > 0 then
            begin
                if Res[0] <> Null then
                begin
                    TWr.DefaultDatabase := DB;
                    StProc.Database     := DB;
                    StProc.Transaction  := TWr;
                    try
                        TWr.StartTransaction;
                        StProc.StoredProcName := 'UO_FILTER_YEAR_NABOR_INS';
                        StProc.ParamByName('ID_SESSION').AsInt64      := id_ses;
                        StProc.ParamByName('ID_USER').AsInt64         := id_u;
                        StProc.ParamByName('ID_YEAR').AsInt64         := Res[0];
                        StProc.ExecProc;
                        TWr.Commit;
                    except on E:Exception do begin
                        TWr.Rollback;
                        ShowMessage(E.Message);
                    end end;
                    Refresh;
                end;
            end;
        end;
        if rrr = 4 then
        begin
            AParameter                := TcnSimpleParams.Create;
            AParameter.Owner          := self;
            AParameter.Db_Handle      := DB.Handle;
            AParameter.Formstyle      := fsNormal;
            AParameter.WaitPakageOwner:= self;
            res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_FormStud.bpl','ShowSPFormStud');
            AParameter.Free;
            if VarArrayDimCount(res) > 0 then
            begin
                if Res[0] <> Null then
                begin
                    TWr.DefaultDatabase := DB;
                    StProc.Database     := DB;
                    StProc.Transaction  := TWr;
                    try
                        TWr.StartTransaction;
                        StProc.StoredProcName := 'UO_FILTER_FORMA_INS';
                        StProc.ParamByName('ID_SESSION').AsInt64      := id_ses;
                        StProc.ParamByName('ID_USER').AsInt64         := id_u;
                        StProc.ParamByName('ID_FORMA').AsInt64        := Res[0];
                        StProc.ExecProc;
                        TWr.Commit;
                    except on E:Exception do begin
                        TWr.Rollback;
                        ShowMessage(E.Message);
                    end end;
                    Refresh;
                end;
            end;
        end;
        if rrr = 5 then
        begin
            AParameter                := TcnSimpleParams.Create;
            AParameter.Owner          := self;
            AParameter.Db_Handle      := DB.Handle;
            AParameter.Formstyle      := fsNormal;
            AParameter.WaitPakageOwner:= self;
            res := RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_CategoryStudy.bpl','ShowSPCategoryStudy');
            AParameter.Free;
            if VarArrayDimCount(res) > 0 then
            begin
                if Res[0] <> Null then
                begin
                    TWr.DefaultDatabase := DB;
                    StProc.Database     := DB;
                    StProc.Transaction  := TWr;
                    try
                        TWr.StartTransaction;
                        StProc.StoredProcName := 'UO_FILTER_KAT_INS';
                        StProc.ParamByName('ID_SESSION').AsInt64      := id_ses;
                        StProc.ParamByName('ID_USER').AsInt64         := id_u;
                        StProc.ParamByName('ID_KAT').AsInt64          := Res[0];
                        StProc.ExecProc;
                        TWr.Commit;
                    except on E:Exception do begin
                        TWr.Rollback;
                        ShowMessage(E.Message);
                    end end;
                    Refresh;
                end;
            end;
        end;

end;

end.
