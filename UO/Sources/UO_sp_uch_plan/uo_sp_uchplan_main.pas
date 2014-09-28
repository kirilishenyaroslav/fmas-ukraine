unit uo_sp_uchplan_main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxCustomData, cxStyles, cxTL, cxMaskEdit, Menus,
  ActnList, ImgList, cxInplaceContainer, cxDBTL, cxControls, cxTLData,
  dxStatusBar, dxBar, dxBarExtItems, AArray, ibase, ib_externals,
  cxClasses, cxGridTableView, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, StdCtrls;

type
  Tfmuo_sp_uchplan_main = class(TForm)
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
    PopupMenuPapka: TPopupMenu;
    ActionAdd1: TMenuItem;
    ActionChange1: TMenuItem;
    ActionDelete1: TMenuItem;
    ActionCopy1: TMenuItem;
    ActionMoveTo1: TMenuItem;
    ActionRefresh2: TMenuItem;
    ActionFind1: TMenuItem;
    ActionPrint1: TMenuItem;
    prop1: TMenuItem;
    ActionCancel1: TMenuItem;
    dxBarManager_sp_type: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxStatusBarSP: TdxStatusBar;
    ActionTake: TAction;
    ActionView: TAction;
    ActionFullCollaps: TAction;
    ActionFullExpand: TAction;
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
    ActionAddKoren: TAction;
    dxBarLargeButton1: TdxBarLargeButton;
    DB: TpFIBDatabase;
    DS: TpFIBDataSet;
    Tr: TpFIBTransaction;
    TWr: TpFIBTransaction;
    Stored: TpFIBStoredProc;
    DataSource1: TDataSource;
    Tree: TcxDBTreeList;
    TreecxDBTreeListColumn1: TcxDBTreeListColumn;
    TreecxDBTreeListColumn2: TcxDBTreeListColumn;
    TreecxDBTreeListColumn3: TcxDBTreeListColumn;
    TreecxDBTreeListColumn4: TcxDBTreeListColumn;
    TreecxDBTreeListColumn5: TcxDBTreeListColumn;
    TreecxDBTreeListColumn6: TcxDBTreeListColumn;
    TreecxDBTreeListColumn7: TcxDBTreeListColumn;
    TreecxDBTreeListColumn9: TcxDBTreeListColumn;
    Action1: TAction;
    dxBarSubItem1: TdxBarSubItem;
    dxBarLargeButton2: TdxBarLargeButton;
    DSID_SP_UCH_PLAN: TFIBStringField;
    DSID_SP_SPEC: TFIBBCDField;
    DSID_SP_FORM_STUD: TFIBBCDField;
    DSID_SP_KAT_STUD: TFIBBCDField;
    DSID_SP_GOD_NABORA: TFIBBCDField;
    DSID_SP_STANDARD: TFIBStringField;
    DSNAME: TFIBStringField;
    DSID_SP_SROK_OP: TFIBBCDField;
    DSSPEC_NAME: TFIBStringField;
    DSFORM_STUD_NAME: TFIBStringField;
    DSGOD_NAME: TFIBStringField;
    DSKAT_NAME: TFIBStringField;
    DSSROK_NAME: TFIBStringField;
    DSMONTH_SROK: TFIBSmallIntField;
    DSYEAR_SROK: TFIBSmallIntField;
    DSID_LEVEL: TFIBIntegerField;
    DSEXISTS_DISC: TFIBIntegerField;
    dxBarLargeButton3: TdxBarLargeButton;
    AFilter: TAction;
    DFilter: TpFIBDataSet;
    Query: TpFIBQuery;
    Memo1: TMemo;
    Action2: TAction;
    dxBarSubItem2: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarButton3: TdxBarButton;
    dxBarListItem1: TdxBarListItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarCombo1: TdxBarCombo;
    dxBarListItem2: TdxBarListItem;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarPopupMenu1: TdxBarPopupMenu;
    ActionAddKorenFromLevel: TAction;
    dxBarLargeButton7: TdxBarLargeButton;
    procedure LoadCaption;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionTakeExecute(Sender: TObject);
    procedure TreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActionFullCollapsExecute(Sender: TObject);
    procedure ActionFullExpandExecute(Sender: TObject);
    procedure ActionDeleteExecute(Sender: TObject);
    procedure ActionRefreshExecute(Sender: TObject);
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionAddKorenExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionPrintManExecute(Sender: TObject);
    procedure AFilterExecute(Sender: TObject);
    procedure Filter;
    procedure Action2Execute(Sender: TObject);
    procedure ActionAddKorenFromLevelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    id_user, id_session       : int64;
    DBHANDLE      : TISC_DB_HANDLE;
    ResultArray   : TAArray;
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;
  end;

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;


implementation
uses uo_sp_uchplan_add,
     uUO_Loader,
     uo_filter_plan;

{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
    T : Tfmuo_sp_uchplan_main;
begin
    T := Tfmuo_sp_uchplan_main.Create(aOwner, aParam);

    try T.id_user := aParam['Input']['id_user'].AsVariant except T.id_user := -1; end;

    if T.id_user <= 0 then
    begin
        showmessage('Несанкціонований вхід у систему!!! Вікно буде закрито. Зверніться до сстемного адміністратору або до розробників системи!');
        T.Free;
        exit;
    end;

    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
       fsNormal:   begin
                       T.ShowModal;
                       T.ActionTake.Enabled:=true;
//                   T.dxBarLargeButtonVibrat.Visible := ivAlways;
                   end;
       fsMDIChild: begin
                       T.ActionTake.Enabled:=false;
//                   T.dxBarLargeButtonVibrat.Visible := ivNever;
                   end;
     else
        T.Free;
   end;
end;


{ Tfmuo_sp_uchplan_main }

constructor Tfmuo_sp_uchplan_main.Create(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE := PVoid(aParam['Input']['aDBHANDLE'].asInteger);

        inherited Create(aOwner);
        try id_user := aParam['Input']['id_user'].AsVariant except id_user := -1; end;
        ResultArray           := aParam;
//        DataBase_uo__sp_type.Close;
        DB.Handle             := DBHANDLE;

        Tr.DefaultDatabase    := DB;
        TWr.DefaultDatabase   := DB;

        DB.DefaultTransaction := Tr;

        DS.Database           := DB;
        DS.Transaction        := Tr;

        DFilter.Database      := DB;
        DFilter.Transaction   := Tr;

        Query.Database        := DB;
        Query.Transaction     := Tr;

        Stored.Database       := DB;
        Stored.Transaction    := TWr;

        Tr.StartTransaction;

        DecimalSeparator      := ',';
        LoadCaption;

        Filter;

        //DS.Close;
        DS.SQLs.SelectSQL.Text := 'select * from UO_SP_UCH_PLAN_SELECT';
        DS.Open;
        
    end
    else ShowMessage('Ошибка Handl`a Базы');
end;

procedure Tfmuo_sp_uchplan_main.LoadCaption;
begin
    Caption                 := 'Довідник учбових планів';
    ActionADD.Caption       := 'Додати';
    ActionAddKoren.Caption  := 'Додати кореневу гілку';
    ActionAddKorenFromLevel.Caption  := 'Додати як кореневу гілку';
    ActionChange.Caption    := 'Змінити';
    ActionDelete.Caption    := 'Видалити';
    ActionView.Caption      := 'Показати';
    ActionRefresh.Caption   := 'Оновити';
    ActionTake.Caption      := 'Вибрати';
    ActionClose.Caption     := 'Відміна';
    ActionPrintMan.Caption  := 'Друк';

    ActionADD.Hint          := 'Ins - Додати';
    ActionChange.Hint       := 'F2 - Змінити';
    ActionDelete.Hint       := 'Del - Видалити';
    ActionView.Hint         := 'F3 - Показати';
    ActionRefresh.Hint      := 'F5 - Оновити';
    ActionTake.Hint         := 'Enter - Вибрати';
    ActionClose.Hint        := 'Esc - Відміна';
    ActionPrintman.Hint     := 'Друкувати учбовий план';
    ActionAddKoren.Hint     := 'Shift+Ins - Додати кореневу гілку';
    ActionAddKorenFromLevel.Hint := 'Додати як кореневу гілку';

    dxStatusBarSP.Panels[0].Text          := 'Ins - Додати';
    dxStatusBarSP.Panels[1].Text          := 'Shift+Ins - Додати кореневу';
    dxStatusBarSP.Panels[2].Text          := 'F2 - Змінити';
    dxStatusBarSP.Panels[3].Text          := 'Del - Видалити';
    dxStatusBarSP.Panels[4].Text          := 'F5 - Оновити';
    dxStatusBarSP.Panels[5].Text          := 'F3 - Показати';
    dxStatusBarSP.Panels[6].Text          := 'Enter - Вибрати';
end;

procedure Tfmuo_sp_uchplan_main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        ResultArray.Free;
        ResultArray := Nil;
        Action      := caFree;
    end;
end;

procedure Tfmuo_sp_uchplan_main.ActionTakeExecute(Sender: TObject);
begin
    if not DS.IsEmpty then
    begin
//        if DataSet_uo__sp_typeID_SP_CIKL_PIDG.AsString='-1' then exit;
        begin
            FillArrayFromDataSet(ResultArray['OutPut'], DS);
            Close;
        end
    end;
end;

procedure Tfmuo_sp_uchplan_main.TreeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if (KEY=VK_LEFT) then
    begin
       if Tree.FocusedNode<>nil
           then Tree.FocusedNode.Collapse(true);
    end;
    if (KEY=VK_RIGHT) then
    begin
       if Tree.FocusedNode<>nil
           then Tree.FocusedNode.Expand(false);
    end;
end;

procedure Tfmuo_sp_uchplan_main.ActionFullCollapsExecute(Sender: TObject);
begin
    Tree.FullCollapse;
end;

procedure Tfmuo_sp_uchplan_main.ActionFullExpandExecute(Sender: TObject);
begin
    Tree.FullExpand;
end;

procedure Tfmuo_sp_uchplan_main.ActionDeleteExecute(Sender: TObject);
var
    id_del_l : int64;
begin
    if not DS.IsEmpty then
    begin
        if MessageBox(Handle, Pchar('Ви дійсно бажаєте видалити план ' + DS.FieldByName('NAME').AsString), Pchar('Увага!'), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_del_l           := StrToInt64(DS.FieldByName('ID_SP_STANDARD').AsString);
            Stored.Transaction := TWr;
            try
                TWr.StartTransaction;
                Stored.StoredProcName := 'UO_SP_UCH_PLAN_DEL';
                Stored.ParamByName('D_ID').AsInt64 := StrToInt64(ds.FieldByName('ID_SP_UCH_PLAN').AsString);
                Stored.ExecProc;
                TWr.Commit;
            except on E:Exception do begin
                TWr.Rollback;
                ShowMessage(E.Message);
            end end;
            ActionRefreshExecute(Sender);
            DS.Locate('ID_SP_UCH_PLAN', id_del_l, []);
        end;
    end;
end;

procedure Tfmuo_sp_uchplan_main.ActionRefreshExecute(Sender: TObject);
var
    idt : int64;
begin
    try
        idt := StrToInt64(DS.fbn('ID_SP_UCH_PLAN').AsString);
    except
        idt := -2;
    end;
    filter;
    DS.CloseOpen(false);
    DS.Locate('ID_SP_UCH_PLAN', idt, []);
end;

procedure Tfmuo_sp_uchplan_main.ActionAddExecute(Sender: TObject);
var
    T : Tfmuo_sp_uchplan_add;
    link : int64;
begin
    if not DS.IsEmpty
        then begin
            link := StrToInt64(DS.fbn('ID_SP_UCH_PLAN').AsString);
{            if StrToInt(DS.fbn('ID_LEVEL').AsString) = 2 then
            begin
                showmessage('Неможливо додати ветку 3-го рівня!');
                exit;
            end;     }
        end
        else link := -1;
    if link <> -1 then
        if DS.fbn('EXISTS_DISC').AsInteger = 0 then
        begin
            Showmessage('Неможливо додати ветку, бо під кореневой веткой не існує дисциплин');
            Exit;
        end;
    T := Tfmuo_sp_uchplan_add.Create(Self, link, self, 1);
    T.ShowModal;
    T.Free;
end;

procedure Tfmuo_sp_uchplan_main.ActionAddKorenExecute(Sender: TObject);
var
    T : Tfmuo_sp_uchplan_add;
begin
    T := Tfmuo_sp_uchplan_add.Create(Self, -1, self, 1);
    T.ShowModal;
    T.Free;
end;

procedure Tfmuo_sp_uchplan_main.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_sp_uchplan_main.ActionChangeExecute(Sender: TObject);
var
    T : Tfmuo_sp_uchplan_add;
begin
    T := Tfmuo_sp_uchplan_add.Create(Self, -1, self, 2);
    T.ShowModal;
    T.Free;
end;

procedure Tfmuo_sp_uchplan_main.ActionViewExecute(Sender: TObject);
var
    T : Tfmuo_sp_uchplan_add;
begin
    T := Tfmuo_sp_uchplan_add.Create(Self, -1, self, 3);
    T.ShowModal;
    T.Free;
end;

procedure Tfmuo_sp_uchplan_main.ActionPrintManExecute(Sender: TObject);
var
    InputParam : TAArray;
begin
    if not DS.IsEmpty then
    begin

        InputParam                                      := TAArray.Create;
        InputParam['Name_Bpl'].AsString                 := 'UO_PrtUchPlan.bpl';
        InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(DB.Handle);
//        InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
        InputParam['Input']['ID_SP_UCH_PLAN'].AsInt64   := StrToInt64(DS.fbn('ID_SP_UCH_PLAN').AsString);;
        uUO_Loader.ShowAllUOBpl(self, InputParam);
    end;
end;

procedure Tfmuo_sp_uchplan_main.AFilterExecute(Sender: TObject);
begin
    if Uo_show_filter(id_user, id_session, DB) then
    begin
        ActionRefreshExecute(Sender);
    end;
end;

procedure Tfmuo_sp_uchplan_main.Filter;
var
     flag, flag2 : boolean;
begin
    flag  := false;
    flag2 := false;

    DFilter.Close;
    DFilter.SQLs.SelectSQL.Text := 'select * from UO_FILTER_SELECT('+intToStr(0)+', '+IntToStr(id_user)+')';

    DFilter.Open;



    Query.close;
    Query.SQL.Clear;
    Query.SQL.Text := 'INSERT INTO UO_FILTER_PLAN (ID_SP_UCH_PLAN, ID_SP_SPEC, ID_SP_FORM_STUD, ID_SP_KAT_STUD, ID_SP_GOD_NABORA, ID_SP_STANDARD, NAME, ID_SP_SROK_OP)';
    Query.SQL.Add('select UO_SP_UCH_PLAN.ID_SP_UCH_PLAN, UO_SP_UCH_PLAN.ID_SP_SPEC, UO_SP_UCH_PLAN.ID_SP_FORM_STUD, UO_SP_UCH_PLAN.ID_SP_KAT_STUD, UO_SP_UCH_PLAN.ID_SP_GOD_NABORA, UO_SP_UCH_PLAN.ID_SP_STANDARD, UO_SP_UCH_PLAN.NAME, UO_SP_UCH_PLAN.ID_SP_SROK_OP');
    Query.SQL.Add('from UO_SP_UCH_PLAN');
    if (DFilter.FBN('P1').AsInteger = 1) then
    begin
        Query.SQL.Add(', pub_jn_fak_spec, pub_sp_spec, uo_filter_fak'); 
        flag := true;
    end;

    if (DFilter.FBN('P2').AsInteger = 1) then
    begin
        Query.SQL.Add(', uo_filter_spec');
        flag := true;
    end;

    if (DFilter.FBN('P3').AsInteger = 1) then
    begin
        Query.SQL.Add(', uo_filter_year_nabor');
        flag := true;
    end;

    if (DFilter.FBN('P4').AsInteger = 1) then
    begin
        Query.SQL.Add(', uo_filter_forma');
        flag := true;
    end;

    if (DFilter.FBN('P5').AsInteger = 1) then
    begin
        Query.SQL.Add(', uo_filter_kat');
        flag := true;
    end;

    if flag then
    begin
        Query.SQL.Add('where ');
        Caption := Caption + ' (фільтр)';
    end;

    if (DFilter.FBN('P1').AsInteger = 1) then
    begin
        Query.SQL.Add('UO_SP_UCH_PLAN.ID_SP_SPEC=pub_sp_spec.id_sp_uspec and pub_sp_spec.id_sp_spec=pub_jn_fak_spec.id_sp_spec and pub_jn_fak_spec.id_sp_department=uo_filter_fak.id_fak and uo_filter_fak.id_session='+IntToStr(0)+' and uo_filter_fak.id_user='+IntToStr(id_user));
        flag2 := true;
    end;

    if (DFilter.FBN('P2').AsInteger = 1) then
    begin
        if (flag2) then
        begin
            Query.SQL.Add(' and UO_SP_UCH_PLAN.ID_SP_SPEC=uo_filter_spec.ID_SPEC and uo_filter_spec.id_session='+IntToStr(0)+' and uo_filter_spec.id_user='+IntToStr(id_user));
            flag2 := true;
        end else
        begin
            Query.SQL.Add(' UO_SP_UCH_PLAN.ID_SP_SPEC=uo_filter_spec.ID_SPEC and uo_filter_spec.id_session='+IntToStr(0)+' and uo_filter_spec.id_user='+IntToStr(id_user));
            flag2 := true;
        end;
    end;

    if (DFilter.FBN('P3').AsInteger = 1) then
    begin
        if (flag2) then
        begin
     //       Query.SQL.Add(', uo_filter_year_nabor');
            Query.SQL.Add(' and UO_SP_UCH_PLAN.ID_SP_GOD_NABORA=uo_filter_year_nabor.ID_YEAR and uo_filter_year_nabor.id_session='+IntToStr(0)+' and uo_filter_year_nabor.id_user='+IntToStr(id_user));
            flag2 := true;
        end else
        begin
            Query.SQL.Add(' UO_SP_UCH_PLAN.ID_SP_GOD_NABORA=uo_filter_year_nabor.ID_YEAR and uo_filter_year_nabor.id_session='+IntToStr(0)+' and uo_filter_year_nabor.id_user='+IntToStr(id_user));
            flag2 := true;
        end;
    end;
    if (DFilter.FBN('P4').AsInteger = 1) then
    begin
        if (flag2) then
        begin
//        Query.SQL.Add(', uo_filter_forma');
            Query.SQL.Add(' and UO_SP_UCH_PLAN.ID_SP_FORM_STUD=uo_filter_forma.ID_FORMA and uo_filter_forma.id_session='+IntToStr(0)+' and uo_filter_forma.id_user='+IntToStr(id_user));
            flag2 := true;
        end else
        begin
            Query.SQL.Add(' UO_SP_UCH_PLAN.ID_SP_FORM_STUD=uo_filter_forma.ID_FORMA and uo_filter_forma.id_session='+IntToStr(0)+' and uo_filter_forma.id_user='+IntToStr(id_user));
            flag2 := true;
        end;
    end;
    if (DFilter.FBN('P5').AsInteger = 1) then
    begin
        if (flag2) then
        begin
//        Query.SQL.Add(', uo_filter_kat');
            Query.SQL.Add(' and UO_SP_UCH_PLAN.ID_SP_KAT_STUD=uo_filter_kat.ID_KAT and uo_filter_kat.id_session='+IntToStr(0)+' and uo_filter_kat.id_user='+IntToStr(id_user));
//        flag2 := true;
        end else
            Query.SQL.Add(' UO_SP_UCH_PLAN.ID_SP_KAT_STUD=uo_filter_kat.ID_KAT and uo_filter_kat.id_session='+IntToStr(0)+' and uo_filter_kat.id_user='+IntToStr(id_user));
    end;
    Query.SQL.Add('group by UO_SP_UCH_PLAN.ID_SP_UCH_PLAN, UO_SP_UCH_PLAN.ID_SP_SPEC, UO_SP_UCH_PLAN.ID_SP_FORM_STUD, UO_SP_UCH_PLAN.ID_SP_KAT_STUD, UO_SP_UCH_PLAN.ID_SP_GOD_NABORA, UO_SP_UCH_PLAN.ID_SP_STANDARD, UO_SP_UCH_PLAN.NAME, UO_SP_UCH_PLAN.ID_SP_SROK_OP');
//showmessage(Query.SQL.Text);
Memo1.text := Query.SQL.Text;
    Query.ExecQuery;

    DFilter.Close;
end;

procedure Tfmuo_sp_uchplan_main.Action2Execute(Sender: TObject);
begin
    Memo1.Visible := not Memo1.Visible; 
end;

procedure Tfmuo_sp_uchplan_main.ActionAddKorenFromLevelExecute(
  Sender: TObject);
var
    T : Tfmuo_sp_uchplan_add;
begin
    if DS.IsEmpty then exit;
    T := Tfmuo_sp_uchplan_add.Create(Self, -2, self, 1);
    T.ShowModal;
    T.Free;
end;

end.
