{******************************************************************************}
{               Автоматизированная система управления персоналом               }
{                                                                              }
{               (c) Донецкий национальный университет, 2002-2005               }
{******************************************************************************}

{                      Пакет "Справочник должностей"                           }
{                 Главный справочник                                           }
{                                               ответственный: Тимофеев Антон  }
unit U_SPPost;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, Grids, DBGrids, cxControls, cxSplitter, Buttons, IBase,
    Menus, dxsbar, U_SPPost_DataModule, DB, SpCommon, uSearchFrame, ComCtrls,
    StdCtrls, RXMemDS, U_SP_Post_Add, U_SP_Post_AddType, U_SP_Post_AddTypes,
    U_SP_Post_AddPosts, U_SP_Post_AddCat, U_SP_Post_ChType, U_SP_Post_ChPost,
    ActnList, dxBar, dxBarExtItems, ImgList, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
    cxGridLevel, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, cxCurrencyEdit, uFControl,
    uBoolControl, cxPropertiesStore, FIBSQLMonitor, cxContainer,
  cxTextEdit, cxMemo, AccMGMT;

type
    TSP_Post = class(TForm)
        cxSplitter1: TcxSplitter;
        CategoryGrid: TDBGrid;
        Panel1: TPanel;
        Panel2: TPanel;
        Panel3: TPanel;
        cxSplitter2: TcxSplitter;
        Panel4: TPanel;
        DBGrid3: TDBGrid;
        SBRefresh: TSpeedButton;
        SBSelect: TSpeedButton;
        SBClose: TSpeedButton;
        LeftPanel: TPanel;
        CatDatePanel: TPanel;
        SpeedButton4: TSpeedButton;
        SpeedButton6: TSpeedButton;
        CategorySource: TDataSource;
        PostDataSource: TDataSource;
        TypePostSource: TDataSource;
        DP_Date: TDateTimePicker;
        SpeedButton7: TSpeedButton;
        SpeedButton9: TSpeedButton;
        Label1: TLabel;
        SpeedButtonDown: TSpeedButton;
        SpeedButtonUp: TSpeedButton;
        ActionList1: TActionList;
        Add: TAction;
        Change: TAction;
        Delete: TAction;
        Refresh: TAction;
        dxBarDockControl1: TdxBarDockControl;
        dxBarManager1: TdxBarManager;
        dxBPM_Add: TdxBarPopupMenu;
        dxBLB_Add: TdxBarLargeButton;
        dxBarButton1: TdxBarButton;
        dxBarButton3: TdxBarButton;
        dxBarButton4: TdxBarButton;
        dxBarButton5: TdxBarButton;
        dxBarButton6: TdxBarButton;
        dxBPM_Change: TdxBarPopupMenu;
        dxBLB_Change: TdxBarLargeButton;
        dxBarButton2: TdxBarButton;
        dxBarButton7: TdxBarButton;
        dxBarButton8: TdxBarButton;
        dxBarButton9: TdxBarButton;
        dxBarLargeButton1: TdxBarLargeButton;
        dxBPM_Delete: TdxBarPopupMenu;
        dxBarButton10: TdxBarButton;
        dxBarButton11: TdxBarButton;
        dxBarButton12: TdxBarButton;
        dxBarButton13: TdxBarButton;
        dxBarButton14: TdxBarButton;
        AddCatA: TAction;
        AddPostA: TAction;
        AddTypeA: TAction;
        AddPostCatA: TAction;
        AddPostTypeA: TAction;
        ChangeCatA: TAction;
        ChangePostA: TAction;
        ChangeTypeA: TAction;
        ChangePostCatA: TAction;
        DelCatA: TAction;
        DelPostA: TAction;
        DelTypeA: TAction;
        DelCatPostA: TAction;
        DelTypePostA: TAction;
        dxBarControlContainerItem1: TdxBarControlContainerItem;
        dxBarControlContainerItem2: TdxBarControlContainerItem;
        dxBarControlContainerItem3: TdxBarControlContainerItem;
        dxBarControlContainerItem4: TdxBarControlContainerItem;
        dxBarControlContainerItem5: TdxBarControlContainerItem;
        dxBarControlContainerItem6: TdxBarControlContainerItem;
        ImageList1: TImageList;
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
        qizzStyle: TcxGridTableViewStyleSheet;
        PostGrid: TcxGrid;
        PostView: TcxGridDBTableView;
        PostGridLevel1: TcxGridLevel;
        PostViewPOST_CODE: TcxGridDBColumn;
        PostViewNAME_POST: TcxGridDBColumn;
        PostViewADDITIONAL: TcxGridDBColumn;
        PostViewID_POST: TcxGridDBColumn;
        PostViewNOT_DIGIT: TcxGridDBColumn;
        PostViewDISPLAY_ORDER: TcxGridDBColumn;
        PostViewID_POST_CATEGORY: TcxGridDBColumn;
        PostViewDATE_BEG: TcxGridDBColumn;
        PostViewDATE_END: TcxGridDBColumn;
        PostViewID_GROUP: TcxGridDBColumn;
        PostViewNAME_GROUP: TcxGridDBColumn;
        Panel7: TPanel;
        Label2: TLabel;
        FilterEdit: TEdit;
        CatFilter: TqFBoolControl;
        cxPropertiesStore1: TcxPropertiesStore;
        cxMemo1: TcxMemo;
        FIBSQLMonitor1: TFIBSQLMonitor;
        procedure LeftPanelResize(Sender: TObject);
        procedure Panel3Resize(Sender: TObject);
        procedure N1Click(Sender: TObject);
        procedure N2Click(Sender: TObject);
        procedure N3Click(Sender: TObject);
        procedure N4Click(Sender: TObject);
        procedure N5Click(Sender: TObject);
        procedure N6Click(Sender: TObject);
        procedure N7Click(Sender: TObject);
        procedure N8Click(Sender: TObject);
        procedure N9Click(Sender: TObject);
        procedure SBAddClick(Sender: TObject);
        procedure SBModifClick(Sender: TObject);
        procedure SBDeleteClick(Sender: TObject);
        procedure CategoryGridEnter(Sender: TObject);
        procedure DBGrid2Enter(Sender: TObject);
        procedure DBGrid3Enter(Sender: TObject);
        procedure SpeedButton4Click(Sender: TObject);
        procedure SpeedButton6Click(Sender: TObject);
        procedure DP_DateChange(Sender: TObject);
        procedure SpeedButton7Click(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure SpeedButton8Click(Sender: TObject);
        procedure SpeedButton9Click(Sender: TObject);
        procedure SBRefreshClick(Sender: TObject);
        procedure SpeedButtonDownClick(Sender: TObject);
        procedure SpeedButtonUpClick(Sender: TObject);
        procedure SBCloseClick(Sender: TObject);
        procedure SBSelectClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure DBGrid2DblClick(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure CategoryGridKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure FormActivate(Sender: TObject);
        procedure FilterEditChange(Sender: TObject);
        procedure PostViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
        procedure CatFilterChange(Sender: TObject);
    procedure FIBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
    private
        id_session_log:Integer;
        procedure AddPost;
        procedure AddCategory;
        procedure AddType;
        procedure ModifPost;
        procedure ModifCategory;
        procedure ModifType;
        procedure DelPost;
        procedure DelCategory;
        procedure DelType;
        procedure RefreshCategory;
        procedure RefreshPost;
        procedure LogEventNoCommitTransaction;
        procedure LogEventNoCommitTransactionSave(Name_event:string);
        function PostViewIsSorted: Boolean;
    public
        DMod: TDMSPPost; { Public declarations }
        Input: TRxMemoryData;
        Output: TRxMemoryData;
        constructor Create(AOwner: TComponent; DataModule: TDMSPPost;
        Input: TRxMemoryData = nil; Output: TRxMemoryData = nil); reintroduce;
    end;

type TShowMode = (smShowMod, smShowMChild, smSelMod, smMSelMod);
    TFormBtn = (fbAdd, fbModif, fbDel);
    TFormButtons = set of TFormBtn;

const fbAll = [fbAdd, fbModif, fbDel];

var
    SP_Post: TSP_Post;

function ShowPost(AOwner: TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; ActDate: TDate; Buttons: TFormButtons = fbAll): Boolean;
procedure PostSelect(AOwner: TComponent; Handle: TISC_DB_Handle; var Value: Variant; var DisplayText: string);


implementation

uses cxGridViewData, uSelectForm, qFTools, UpKernelUnit;

{$R *.dfm}

constructor TSP_Post.Create(AOwner: TComponent; DataModule: TDMSPPost; Input: TRxMemoryData = nil; Output: TRxMemoryData = nil);
begin
    inherited Create(AOwner);
    Self.DMod := DataModule;
//    Self.freeDM := FreeDataModule;
    Self.Input := Input;
    Self.Output := Output;

    if Input <> nil then
    begin
        SBSelect.Visible := (Input['Select'] <> 0);
        if Input['Select'] = 2 then
            PostView.OptionsSelection.MultiSelect := True;
    end;

    DataModule.PubSysData.Close;
    DataModule.PubSysData.Open;

    try
        Infinity_Date := DataModule.PubSysData['INFINITY_DATE'];
    except
        Infinity_Date := StrToDate('31.12.9999');
    end;

    id_session_log:=-1;
//    CancelButton.Align := alRight;
//	SelectButton.Align := alRight;
end;

procedure PostSelect(AOwner: TComponent; Handle: TISC_DB_Handle; var Value: Variant; var DisplayText: string);
var Output: TRxMemoryData;
begin
    Output := TRxMemoryData.Create(AOwner);
    Output.FieldDefs.Add('Id_Post', ftInteger);
    Output.FieldDefs.Add('Name_Post', ftString, 50);
    if not ShowPost(AOwner, Handle, smSelMod, Output, Date) then Exit;
    Value := Output['Id_post']; DisplayText := Output['name_post'];
end;

function ShowPost(AOwner: TComponent; Handle: TISC_DB_Handle; SM: TShowMode; var Output: TRxMemoryData; ActDate: TDate; Buttons: TFormButtons = fbAll): Boolean;
var
    RForm: TSP_Post;
    ModRes: TModalResult;
begin
    RForm := TSP_Post.Create(AOwner, nil);
    RForm.DMod := TDMSPPost.Create(RForm);
    RForm.DMod.FIBDatabase.Handle := Handle;

    if not RForm.DMod.FIBDatabase.Connected then
        RForm.DMod.FIBDatabase.Open;


    RForm.DP_Date.Date := ActDate;
    RForm.DMod.FIBDS_SPPost.ParamByName('ActDate').AsDate := ActDate;
    RForm.DMod.FIBDS_SPCategory.Open;
    RForm.Output := Output;

    if (SM = smShowMChild) or (SM = smShowMod)
        then RForm.SBSelect.Visible := False;

{  if fbAdd in Buttons then
   begin
     for i:=0 to RForm.ActionList1.ActionCount-1 do
       if RForm.ActionList1.Actions[i].Category='AddCat'
        then RForm.ActionList1.Actions[i].Enabled:=False;
   end  else
   begin
     for i:=0 to RForm.ActionList1.ActionCount-1 do
       if RForm.ActionList1.Actions[i].Category='AddCat'
        then RForm.ActionList1.Actions[i].Enabled:=True;
   end;

  if fbModif in Buttons then
   begin
     for i:=0 to RForm.ActionList1.ActionCount-1 do
       if RForm.ActionList1.Actions[i].Category='ChangeCat'
        then RForm.ActionList1.Actions[i].Enabled:=False;
   end  else
   begin
     for i:=0 to RForm.ActionList1.ActionCount-1 do
       if RForm.ActionList1.Actions[i].Category='ChangeCat'
        then RForm.ActionList1.Actions[i].Enabled:=True;
   end;

  if fbDel in Buttons then
   begin
     for i:=0 to RForm.ActionList1.ActionCount-1 do
       if RForm.ActionList1.Actions[i].Category='DelCat'
        then RForm.ActionList1.Actions[i].Enabled:=False;
   end  else
   begin
     for i:=0 to RForm.ActionList1.ActionCount-1 do
       if RForm.ActionList1.Actions[i].Category='DelCat'
        then RForm.ActionList1.Actions[i].Enabled:=True;
   end;

 }if (SM = smMSelMod) or (SM = smSelMod) then
        RForm.DP_Date.Enabled := False;

    if (SM = smMSelMod) then
        RForm.PostView.OptionsSelection.MultiSelect := True;

    if (SM = smShowMChild)
        then RForm.FormStyle := fsMDIChild
    else
    begin
        RForm.FormStyle := fsNormal;
        RForm.Visible := False;
        ModRes := RForm.ShowModal;
    end;

    if (SM = smMSelMod) or (SM = smSelMod) then
    begin
        if ModRes = mrCancel
            then
        begin
            Result := False;
         //SPDone;
            RForm.Free;
            Exit;
        end;
        Output := RForm.Output;
    end;
    Result := True;
end;

procedure TSP_Post.LeftPanelResize(Sender: TObject);
begin
    GridResize(CategoryGrid);
end;

procedure TSP_Post.Panel3Resize(Sender: TObject);
begin
    GridResize(DBGrid3)
end;

procedure TSP_Post.AddPost;
var AForm: TSP_Post_Add;
begin

    LogEventNoCommitTransaction;

    AForm := TSP_Post_Add.Create(Self);
    AForm.Add := True;
//  AForm.SpCB_Cat.Prepare(DMod.FIBDS_SPCategory['id_category'],DMod.FIBDS_SPCategory['name_category']);
    AForm.DMod := DMod;
    AForm.Prepare;
    if AForm.ShowModal = mrOk then
    begin
        RefreshPost;
        DMod.FIBDS_SPCategory.Locate('id_category', AForm.RxMD_Cat['id_category'], []);
        DP_Date.Date := AForm.RxMD_Cat['date_beg'];
        DP_DateChange(nil);
    end;
    AForm.Free;

    LogEventNoCommitTransactionSave('Додати посаду');

end;

procedure TSP_Post.AddCategory;
var AForm: TSP_Post_AddCat;
begin
    LogEventNoCommitTransaction;
    AForm := TSP_Post_AddCat.Create(Self);
    AForm.Add := True;
    AForm.DMod := DMod;
    AForm.ShowModal;
    AForm.Free;
    RefreshPost;
    LogEventNoCommitTransactionSave('Додати категорію');
end;

procedure TSP_Post.AddType;
var AForm: TSP_Post_AddType;
begin
    LogEventNoCommitTransaction;
    AForm := TSP_Post_AddType.Create(Self);
    AForm.DMod := DMod;
    AForm.ShowModal;
    AForm.Free;
    DMod.FIBDS_SPTypePost.Close;
    DMod.FIBDS_SPTypePost.Open;
    LogEventNoCommitTransactionSave('Додати тип');
end;

procedure TSP_Post.ModifPost;
var AForm: TSP_Post_Add;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPPost.IsEmpty
        then begin
        MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPPost['Id_post'] = Null)
        then begin
        MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
        exit;
    end;

    AForm := TSP_Post_Add.Create(Self);
    AForm.Add := False;
    AForm.DMod := DMod;
    AForm.id := DMod.FIBDS_SPPost['id_post'];
    AForm.CE_Name.Text := DMod.FIBDS_SPPost['name_post'];
    AForm.CE_Code.Text := DMod.FIBDS_SPPost['post_code'];
    if VarIsNull(DMod.FIBDS_SPPost['additional']) then
        AForm.CE_Additional.Text := ''
    else AForm.CE_Additional.Text := DMod.FIBDS_SPPost['additional'];

    AForm.Group.Value := DMod.FIBDS_SPPost['id_group'];
    AForm.Group.DisplayText := DMod.FIBDS_SPPost['name_group'];

    AForm.CE_Code.Text := DMod.FIBDS_SPPost['post_code'];
    if DMod.FIBDS_SPPost['Not_digit'] = 'T'
        then AForm.CB_Spec.Checked := True;
    AForm.Caption := 'Змінити посаду';
    AForm.RxMD_Type.Open;
    DMod.FIBDS_SPTypePost.First;
    while not DMod.FIBDS_SPTypePost.Eof do
    begin
        AForm.RxMD_Type.Append;
        AForm.RxMD_Type['id_type_post'] := DMod.FIBDS_SPTypePost['id_type_post'];
        AForm.RxMD_Type['name_type_post'] := DMod.FIBDS_SPTypePost['name_type_post'];
        AForm.RxMD_Type.Post;
        DMod.FIBDS_SPTypePost.Next;
    end;
    AForm.Prepare;
    AForm.ShowModal;
    AForm.Free;
    RefreshPost;
    LogEventNoCommitTransactionSave('Змінити посаду');
end;

procedure TSP_Post.ModifCategory;
var AForm: TSP_Post_AddCat;
begin
    if DMod.FIBDS_SPCategory.IsEmpty
        then begin
        MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPCategory['Id_category'] = Null)
        then begin
        MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
        exit;
    end;

    AForm := TSP_Post_AddCat.Create(Self);
    AForm.DMod := DMod;
    AForm.Add := False;
    AForm.CE_Name.Text := DMod.FIBDS_SPCategory['name_category'];
    AForm.id := IntToStr(DMod.FIBDS_SPCategory['id_category']);
    if DMod.FIBDS_SPCategory['VYSLUGA'] = 'T'
        then AForm.CB_v.Checked := True;
    if DMod.FIBDS_SPCategory['ozdorovlenie'] = 'T'
        then AForm.CB_o.Checked := True;
     if DMod.FIBDS_SPCategory['IS_NPP'] = 'T'
         then AForm.IS_NPP.Checked:=True;
     if DMod.FIBDS_SPCategory['IS_P'] = 'T'
         then AForm.IS_P.Checked:=True;
    AForm.Caption := 'Змінити категорію';
    AForm.ShowModal;
    AForm.Free;
    RefreshPost;
end;

procedure TSP_Post.ModifType;
var AForm: TSP_Post_ChType;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPTypePost.IsEmpty
        then begin
        MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPTypePost['Id_type_post'] = Null)
        then begin
        MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
        exit;
    end;

    AForm := TSP_Post_ChType.Create(Self);
    AForm.DMod := DMod;
    AForm.table := 'SP_TYPE_POST_';
    AForm.CE_Name.Text := DMod.FIBDS_SPTypePost['name_type_post'];
    AForm.id := IntToStr(DMod.FIBDS_SPTypePost['Id_type_post']);
    AForm.ShowModal;
    AForm.Free;

    DMod.FIBDS_SPTypePost.Close;
    DMod.FIBDS_SPTypePost.Open;
    LogEventNoCommitTransactionSave('Змінити тип');
end;

procedure TSP_Post.DelPost;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPPost.IsEmpty
        then begin
        MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPPost['Id_post'] = Null)
        then begin
        MessageDlg('Не можливо видалити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if (MessageDlg('Чи ви справді бажаєте вилучити посаду "' +
        DMod.FIBDS_SPPost['Name_post'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
    with DMod do
    try
        FIBWriteTransaction.StartTransaction;
        UpKernelUnit.StartHistory(FIBWriteTransaction);
        FIBQuery.SQL.Text := 'execute procedure SP_post_Delete(' + IntToStr(FIBDS_SPPost['Id_post']) + ');';
        FIBQuery.ExecProc;

        IntegrityDS.Close;
        IntegrityDS.Sqls.SelectSQL.Text:='SELECT * FROM ASUP_POST_CHECK('''+'D'+''','+'NULL'+','+'NULL'+')';
        IntegrityDS.Database := FIBWriteTransaction.DefaultDatabase;
        IntegrityDS.Transaction := FIBWriteTransaction;
        IntegrityDS.Open;
        if IntegrityDS.IsEmpty then
            FIBWriteTransaction.Commit
        else
        begin
            MessageDlg('Помилка! Порушена цілісність даних!' + #13 + 'Наступна інформація повинна бути передана адміністратору програми "Штатний розклад"!', mtError, [mbYes], 0);
            qSelect(IntegrityDS, 'Помилки у базі даних');
            FIBWriteTransaction.RollBack;
            error:=True;
            ModalResult := 0;
        end;

    except on e: Exception do
        begin
            MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
                error:=True;
        end;
    end;
    RefreshPost;
    LogEventNoCommitTransactionSave('Видилити посаду');
end;

procedure TSP_Post.DelCategory;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPCategory.IsEmpty
        then begin
        MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPCategory['Id_CATEGORY'] = Null)
        then begin
        MessageDlg('Не можливо видалити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if (MessageDlg('Чи ви справді бажаєте вилучити категорію "' +
        DMod.FIBDS_SPCategory['Name_category'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
    with DMod do
    try
        FIBWriteTransaction.StartTransaction;
        FIBQuery.SQL.Text := 'execute procedure SP_category_Delete(' + IntToStr(FIBDS_SPCategory['Id_category']) + ');';
        FIBQuery.ExecProc;
        FIBWriteTransaction.Commit;
    except on e: Exception do
        begin
            MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
                error:=True;
        end;
    end;
    RefreshPost;
    LogEventNoCommitTransactionSave('Видалити категорію');
end;

procedure TSP_Post.DelType;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPTypePost.IsEmpty
        then begin
        MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPTypePost['Id_type_post'] = Null)
        then begin
        MessageDlg('Не можливо видалити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if (MessageDlg('Чи ви справді бажаєте вилучити тип "' +
        DMod.FIBDS_SPTypePost['name_type_post'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
    with DMod do
    try
        FIBWriteTransaction.StartTransaction;
        FIBQuery.SQL.Text := 'execute procedure SP_type_post_Delete(' + IntToStr(FIBDS_SPTypePost['Id_type_post']) + ');';
        FIBQuery.ExecProc;
        FIBWriteTransaction.Commit;
    except on e: Exception do
        begin
            MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
                error:=True;
        end;
    end;
    DMod.FIBDS_SPTypePost.Close;
    DMod.FIBDS_SPTypePost.Open;
    LogEventNoCommitTransactionSave('Видилити тип');
end;

procedure TSP_Post.N1Click(Sender: TObject);
begin
    AddCategory;
end;

procedure TSP_Post.N2Click(Sender: TObject);
begin


    AddPost;
    
end;

procedure TSP_Post.N3Click(Sender: TObject);
begin
    AddType;
end;

procedure TSP_Post.N4Click(Sender: TObject);
begin
    LogEventNoCommitTransaction;
    ModifCategory;
    LogEventNoCommitTransactionSave('Змінити категорію');
end;

procedure TSP_Post.N5Click(Sender: TObject);
begin
    ModifPost;
end;

procedure TSP_Post.N6Click(Sender: TObject);
begin
    ModifType;
end;

procedure TSP_Post.N7Click(Sender: TObject);
begin
    DelCategory;
end;

procedure TSP_Post.N8Click(Sender: TObject);
begin
    DelPost;
end;

procedure TSP_Post.N9Click(Sender: TObject);
begin
    DelType;
end;

procedure TSP_Post.SBAddClick(Sender: TObject);
begin
    if CategoryGrid.Focused
        then AddCategory
    else
        if PostView.Focused
            then AddPost
        else
            if DBGrid3.Focused
                then AddType;
end;

procedure TSP_Post.SBModifClick(Sender: TObject);
begin
    if CategoryGrid.Focused
        then ModifCategory
    else
        if PostView.Focused
            then ModifPost
        else
            if DBGrid3.Focused
                then ModifType;
end;

procedure TSP_Post.SBDeleteClick(Sender: TObject);
begin
    if CategoryGrid.Focused
        then DelCategory
    else
        if PostView.Focused
            then DelPost
        else
            if DBGrid3.Focused
                then DelType;
end;

procedure TSP_Post.CategoryGridEnter(Sender: TObject);
begin
{  SBAdd.Hint:='Додати категорію';
  SBModif.Hint:='Змінити категорію';
  SBDelete.Hint:='Видалити категорію';
 }
    SpeedButtonDown.Enabled := True;
    SpeedButtonUp.Enabled := True;
end;

procedure TSP_Post.DBGrid2Enter(Sender: TObject);
begin
{  SBAdd.Hint:='Додати посаду';
  SBModif.Hint:='Змінити посаду';
  SBDelete.Hint:='Видалити посаду';
 }
    SpeedButtonDown.Enabled := True;
    SpeedButtonUp.Enabled := True;
end;

procedure TSP_Post.DBGrid3Enter(Sender: TObject);
begin
 { SBAdd.Hint:='Додати тип';
  SBModif.Hint:='Змінити тип';
  SBDelete.Hint:='Видалити тип';
  }
    SpeedButtonDown.Enabled := False;
    SpeedButtonUp.Enabled := False;
end;

procedure TSP_Post.SpeedButton4Click(Sender: TObject);
var AForm: TSP_Post_AddTypes;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPPost.IsEmpty
        then begin
        MessageDlg('Не можливо додати типи бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPPost['Id_post'] = Null)
        then begin
        MessageDlg('Не можливо додати типи', mtError, [mbYes], 0);
        exit;
    end;
    AForm := TSP_Post_AddTypes.Create(Self);
    AForm.DMod := DMod;
    AForm.id := DMod.FIBDS_SPPost['Id_post'];
    AForm.ShowModal;
    AForm.Free;
    DMod.FIBDS_SPTypePost.Close;
    DMod.FIBDS_SPTypePost.Open;
    LogEventNoCommitTransactionSave('Додати тип до посади');
end;

procedure TSP_Post.SpeedButton6Click(Sender: TObject);
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPTypePost.IsEmpty
        then begin
        MessageDlg('Не можливо видалити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPTypePost['Id_type_post'] = Null)
        then begin
        MessageDlg('Не можливо видалити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if (MessageDlg('Чи ви справді бажаєте вилучити запис "' +
        DMod.FIBDS_SPTypePost['name_type_post'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
    with DMod do
    try
        FIBWriteTransaction.StartTransaction;
        FIBQuery.SQL.Text := 'execute procedure jn_post_type_D(' + IntToStr(FIBDS_SPTypePost['Id_type_post']) + ',' + IntToStr(FIBDS_SPPost['Id_post']) + ');';
        FIBQuery.ExecProc;
        FIBWriteTransaction.Commit;
    except on e: Exception do
        begin
            MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
                error:=True;
        end;
    end;
    DMod.FIBDS_SPTypePost.Close;
    DMod.FIBDS_SPTypePost.Open;
    LogEventNoCommitTransactionSave('Видалити тип з посади');
end;

procedure TSP_Post.DP_DateChange(Sender: TObject);
begin
    DMod.FIBDS_SPPost.Close;
    DMod.FIBDS_SPPost.ParamByName('ActDate').AsDate := DP_Date.Date;
    DMod.FIBDS_SPPost.Open;
end;

procedure TSP_Post.SpeedButton7Click(Sender: TObject);
var AForm: TSP_Post_AddPosts;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPCategory.IsEmpty
        then begin
        MessageDlg('Не можливо додати посади бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPCategory['Id_category'] = Null)
        then begin
        MessageDlg('Не можливо додати посади', mtError, [mbYes], 0);
        exit;
    end;
    AForm := TSP_Post_AddPosts.Create(Self);
    AForm.SpCB_Cat.Prepare(DMod.FIBDS_SPCategory['Id_category'], DMod.FIBDS_SPCategory['Name_category']);
    AForm.DMod := DMod;
    AForm.ShowModal;
    AForm.Free;
    RefreshPost;
    LogEventNoCommitTransactionSave('Додати посаду до категорії');
end;

procedure TSP_Post.RefreshCategory;
var id: integer;
begin
    DMod.FIBDS_SPCategory.DisableControls;

    if DMod.FIBDS_SPCategory['Id_category'] = Null then
    begin
        DMod.FIBDS_SPCategory.Close;
        DMod.FIBDS_SPCategory.Open;
        DMod.FIBDS_SPCategory.EnableControls;
        Exit;
    end;

    id := DMod.FIBDS_SPCategory['Id_category'];

    DMod.FIBDS_SPCategory.Close;
    DMod.FIBDS_SPCategory.Open;

    DMod.FIBDS_SPCategory.Locate('Id_category', Id, []);

    DMod.FIBDS_SPCategory.EnableControls;
end;

procedure TSP_Post.FormClose(Sender: TObject; var Action: TCloseAction);
begin

    if (id_session_log <>-1) and not DMod.error then
    with DMod do
    begin
      StProInsertLog.StoredProcName:='UP_DT_LOG_EVENT_D';
      StProInsertLog.Transaction.StartTransaction;
      StProInsertLog.ParamByName('id_session').AsInt64:=id_session_log;
      StProInsertLog.Prepare;
      StProInsertLog.ExecProc;
      StProInsertLog.Transaction.Commit;
    end;


    if FormStyle = fsMDIChild then
    begin
        DMod.FIBReadTransaction.Commit;
     //SPDone;
        DMod.FIBDatabase.Close;
        Action := caFree;
    end;
end;

procedure TSP_Post.FormCreate(Sender: TObject);
begin
//  SearchFrame.Prepare(DMod.FIBDS_SPCategory,nil);
end;

procedure TSP_Post.SpeedButton8Click(Sender: TObject);
var AForm: TSP_Post_ChPost;
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPPost.IsEmpty
        then begin
        MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPPost['Id_post'] = Null)
        then begin
        MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if DMod.FIBDS_SPCategory.IsEmpty
        then begin
        MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPCategory['Id_CATEGORY'] = Null)
        then begin
        MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    AForm := TSP_Post_ChPost.Create(Self);
    AForm.DMod := DMod;
    AForm.SpCB_Cat.Prepare(DMod.FIBDS_SPCategory['Id_CATEGORY'], DMod.FIBDS_SPCategory['name_CATEGORY']);
    AForm.id_post := DMod.FIBDS_SPPost['Id_post'];
    AForm.id := DMod.FIBDS_SPPost['Id_post_category'];
    AForm.Caption := AForm.Caption + ': ' + DMod.FIBDS_SPPost['name_post'];
    AForm.DTP_Beg.Date := DMod.FIBDS_SPPost['date_beg'];
    AForm.DTP_End.Date := DMod.FIBDS_SPPost['date_end'];
    AForm.ShowModal;
    DP_Date.Date := AForm.DTP_Beg.Date;
    DP_DateChange(Sender);
    AForm.Free;
    RefreshPost;
    LogEventNoCommitTransactionSave('Змінити приналежність посади до типу');
end;

procedure TSP_Post.SpeedButton9Click(Sender: TObject);
begin
    LogEventNoCommitTransaction;
    if DMod.FIBDS_SPPost.IsEmpty
        then begin
        MessageDlg('Не можливо вилучити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPPost['Id_post'] = Null)
        then begin
        MessageDlg('Не можливо вилучити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if DMod.FIBDS_SPCategory.IsEmpty
        then begin
        MessageDlg('Не можливо вилучити запис бо довідник пустий', mtError, [mbYes], 0);
        exit;
    end;
    if (DMod.FIBDS_SPCategory['Id_CATEGORY'] = Null)
        then begin
        MessageDlg('Не можливо вилучити пустий запис', mtError, [mbYes], 0);
        exit;
    end;
    if (MessageDlg('Чи ви справді бажаєте вилучити запис "' + DMod.FIBDS_SPCategory['name_category'] +
        ' : ' + DMod.FIBDS_SPPost['name_post'] + '"?', mtConfirmation, [mbYes, mbNo], 0) = mrNo) then Exit;
    with DMod do
    try
        FIBWriteTransaction.StartTransaction;
        FIBQuery.SQL.Text := 'execute procedure sp_post_category_delete(' + IntToStr(FIBDS_SPPost['Id_post_category']) + ');';
        FIBQuery.ExecProc;
        FIBWriteTransaction.Commit;
    except on e: Exception do
        begin
            MessageDlg('Не вдалося вилучити запис: ' + e.Message, mtError, [mbYes], 0);
            FIBWriteTransaction.RollBack;
                error:=True;
        end;
    end;
    RefreshPost;
    LogEventNoCommitTransactionSave('Видалити посаду з категорії');
end;

procedure TSP_Post.RefreshPost;
var id: integer;
begin
    if DMod.FIBDS_SPPost['Id_post'] = Null then
    begin
        RefreshCategory;
        DMod.FIBDS_SPPost.Close;
        //всегда смотрим на дату фильтрации
        DMod.FIBDS_SPPost.ParamByName('ActDate').AsDate := DP_Date.Date;
        DMod.FIBDS_SPPost.Open;
        PostView.DataController.Refresh;
        Exit;
    end;

    id := DMod.FIBDS_SPPost['Id_post'];

    RefreshCategory;

    DMod.FIBDS_SPPost.Close;
    //всегда смотрим на дату фильтрации
    DMod.FIBDS_SPPost.ParamByName('ActDate').AsDate := DP_Date.Date;
    DMod.FIBDS_SPPost.Open;
    PostView.DataController.Refresh;

    DMod.FIBDS_SPPost.Locate('Id_post', Id, []);
end;

procedure TSP_Post.SBRefreshClick(Sender: TObject);
begin
    RefreshPost;
end;

procedure TSP_Post.SpeedButtonDownClick(Sender: TObject);
var id1, id2, do1, do2: integer;
begin
    if CategoryGrid.Focused then
    begin
        if DMod.FIBDS_SPCategory.IsEmpty then
        begin
            MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
            exit;
        end;
        if (DMod.FIBDS_SPCategory['Id_CATEGORY'] = Null) then
        begin
            MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
            exit;
        end;

        id1 := DMod.FIBDS_SPCategory['Id_CATEGORY'];
        do1 := DMod.FIBDS_SPCategory['display_order'];
        DMod.FIBDS_SPCategory.Next;
        id2 := DMod.FIBDS_SPCategory['Id_CATEGORY'];
        do2 := DMod.FIBDS_SPCategory['display_order'];

        if (id1 = id2) then
        begin
            MessageDlg('Не можливо змінити порядок на менший, бо цей запис останній', mtError, [mbYes], 0);
            exit;
        end;

        DMod.FIBDS_SPCategory.Prior;

        with DMod do
        try
            FIBWriteTransaction.StartTransaction;
            FIBQuery.SQL.Text := 'execute procedure sp_category_chorder(' + IntToStr(id1) + ',' + IntToStr(id2) + ',' + IntToStr(do1) + ',' + IntToStr(do2) + ');';
            FIBQuery.ExecProc;
            FIBWriteTransaction.Commit;
        except on e: Exception do
            begin
                MessageDlg('Не вдалося змінити порядок: ' + e.Message, mtError, [mbYes], 0);
                FIBWriteTransaction.RollBack;
                    error:=True;
            end;
        end;

        RefreshCategory;
    end
    else
        if PostView.Focused then
        begin
            if DMod.FIBDS_SPPost.IsEmpty then
            begin
                MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
                exit;
            end;
            if (DMod.FIBDS_SPPost['Id_post'] = Null) then
            begin
                MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
                exit;
            end;
            if PostViewIsSorted then
            begin
                qFErrorDialog('Для того, щоб змінити упорядкування посад, потрібно зробити стандартне сортування');
                Exit;
            end;

            id1 := DMod.FIBDS_SPPost['Id_post'];
            do1 := DMod.FIBDS_SPPost['display_order'];
            DMod.FIBDS_SPPost.Next;
            id2 := DMod.FIBDS_SPPost['Id_post'];
            do2 := DMod.FIBDS_SPPost['display_order'];

            if (id1 = id2) then
            begin
                MessageDlg('Не можливо змінити порядок на менший, бо цей запис останній', mtError, [mbYes], 0);
                exit;
            end;

            DMod.FIBDS_SPPost.Prior;

            with DMod do
            try
                FIBWriteTransaction.StartTransaction;
                FIBQuery.SQL.Text := 'execute procedure sp_post_chorder(' + IntToStr(id1) + ',' + IntToStr(id2) + ',' + IntToStr(do1) + ',' + IntToStr(do2) + ');';
                FIBQuery.ExecProc;
                FIBWriteTransaction.Commit;
            except on e: Exception do
                begin
                    MessageDlg('Не вдалося змінити порядок: ' + e.Message, mtError, [mbYes], 0);
                    FIBWriteTransaction.RollBack;
                        error:=True;
                end;
            end;

            RefreshPost;
        end;
end;

procedure TSP_Post.SpeedButtonUpClick(Sender: TObject);
var id1, id2, do1, do2: integer;
begin
    if CategoryGrid.Focused then
    begin
        if DMod.FIBDS_SPCategory.IsEmpty then
        begin
            MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
            exit;
        end;
        if (DMod.FIBDS_SPCategory['Id_CATEGORY'] = Null) then
        begin
            MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
            exit;
        end;

        id1 := DMod.FIBDS_SPCategory['Id_CATEGORY'];
        do1 := DMod.FIBDS_SPCategory['display_order'];
        DMod.FIBDS_SPCategory.Prior;
        id2 := DMod.FIBDS_SPCategory['Id_CATEGORY'];
        do2 := DMod.FIBDS_SPCategory['display_order'];

        if (id1 = id2) then
        begin
            MessageDlg('Не можливо змінити порядок на більший, бо цей запис перший', mtError, [mbYes], 0);
            exit;
        end;

        DMod.FIBDS_SPCategory.Next;

        with DMod do
        try
            FIBWriteTransaction.StartTransaction;
            FIBQuery.SQL.Text := 'execute procedure sp_category_chorder(' + IntToStr(id1) + ',' + IntToStr(id2) + ',' + IntToStr(do1) + ',' + IntToStr(do2) + ');';
            FIBQuery.ExecProc;
            FIBWriteTransaction.Commit;
        except on e: Exception do
            begin
                MessageDlg('Не вдалося змінити порядок: ' + e.Message, mtError, [mbYes], 0);
                FIBWriteTransaction.RollBack;
                    error:=True;
            end;
        end;

        RefreshCategory;
    end
    else
        if PostView.Focused then
        begin
            if DMod.FIBDS_SPPost.IsEmpty then
            begin
                MessageDlg('Не можливо змінити запис бо довідник пустий', mtError, [mbYes], 0);
                exit;
            end;
            if (DMod.FIBDS_SPPost['Id_post'] = Null) then
            begin
                MessageDlg('Не можливо змінити пустий запис', mtError, [mbYes], 0);
                exit;
            end;

            if PostViewIsSorted then
            begin
                qFErrorDialog('Для того, щоб змінити упорядкування посад, потрібно зробити стандартне сортування');
                Exit;
            end;



            id1 := DMod.FIBDS_SPPost['Id_post'];
            do1 := DMod.FIBDS_SPPost['display_order'];
            DMod.FIBDS_SPPost.Prior;
            id2 := DMod.FIBDS_SPPost['Id_post'];
            do2 := DMod.FIBDS_SPPost['display_order'];

            if (id1 = id2) then
            begin
                MessageDlg('Не можливо змінити порядок на більший, бо цей запис перший', mtError, [mbYes], 0);
                exit;
            end;

            DMod.FIBDS_SPPost.Next;

            with DMod do
            try
                FIBWriteTransaction.StartTransaction;
                FIBQuery.SQL.Text := 'execute procedure sp_post_chorder(' + IntToStr(id1) + ',' + IntToStr(id2) + ',' + IntToStr(do1) + ',' + IntToStr(do2) + ');';
                FIBQuery.ExecProc;
                FIBWriteTransaction.Commit;
            except on e: Exception do
                begin
                    MessageDlg('Не вдалося змінити порядок: ' + e.Message, mtError, [mbYes], 0);
                    FIBWriteTransaction.RollBack;
                        error:=True;
                end;
            end;
            RefreshPost;
        end;
end;

procedure TSP_Post.SBCloseClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TSP_Post.SBSelectClick(Sender: TObject);
var i: integer;
begin
    if DMod.FIBDS_SPPost.IsEmpty then
    begin
        ModalResult := mrCancel;
    end;
    Output.Open;
    if PostView.Controller.SelectedRowCount > 0 then
        with DMod.FIBDS_SPPost do
            for i := 0 to PostView.Controller.SelectedRowCount - 1 do
            begin
                Output.Append;
                {Output['Id_post'] := StrToInt(DMod.FIBDS_SPPost['ID_Post']);
                Output['Name_Post'] := DMod.FIBDS_SPPost['Name_post'];
                Output['Id_Category'] := StrToInt(DMod.FIBDS_SPCategory['ID_Category']);
                Output['Name_Category'] := DMod.FIBDS_SPCategory['Name_Category'];}
                Output['Id_Post'] := PostView.Controller.SelectedRecords[i].Values[PostViewID_POST.Index];
                Output['Name_Post'] := PostView.Controller.SelectedRecords[i].Values[PostViewName_POST.Index];
                Output['Id_Category'] := DMod.FIBDS_SPCategory['ID_Category'];
                Output['Name_Category'] := DMod.FIBDS_SPCategory['Name_Category'];
                Output.Post;
            end
    else
    begin
        Output.Append;
        Output['Id_post'] := StrToInt(DMod.FIBDS_SPPost['ID_Post']);
        Output['Name_Post'] := DMod.FIBDS_SPPost['Name_post'];
        Output['Id_Category'] := StrToInt(DMod.FIBDS_SPCategory['ID_Category']);
        Output['Name_Category'] := DMod.FIBDS_SPCategory['Name_Category'];
        Output.Post;
    end;
    ModalResult := mrOk;
end;

procedure TSP_Post.FormShow(Sender: TObject);
begin
    CategorySource.DataSet := DMod.FIBDS_SPCategory;
    PostDataSource.DataSet := DMod.FIBDS_SPPost;
    TypePostSource.DataSet := DMod.FIBDS_SPTypePost;
    if Input <> nil then
    begin
        DP_Date.Date := Input['Actual_Date'];
        DP_DateChange(Sender);
    end;

    if not DMod.FIBDatabase.Connected then
    begin
        DMod.FIBDatabase.Open;
    end;
    if not DMod.FIBDS_SPCategory.Active then
        DMod.FIBDS_SPCategory.Open;
    SPInit(DMod.FIBDatabase.Handle);
end;

procedure TSP_Post.DBGrid2DblClick(Sender: TObject);
begin
    if SBSelect.Visible then
        SBSelect.Click;
end;

procedure TSP_Post.FormDestroy(Sender: TObject);
begin
  //SPDone;
    DMod.Free;
end;

procedure TSP_Post.CategoryGridKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
var Text: string;
    i: integer;
begin
    if (Key = VK_F12) and (ssShift in Shift) then
    try

        if CategoryGrid.Focused then
        begin
            text := '';
            for i := 1 to DMod.FIBDS_SPCategory.Fields.Count do
                text := text + DMod.FIBDS_SPCategory.Fields[i - 1].FieldName + ' : ' + DMod.FIBDS_SPCategory.Fields[i - 1].DisplayText + #13;
        end;

        if PostView.Focused then
        begin
            text := '';
            for i := 1 to DMod.FIBDS_SPPost.Fields.Count do
                text := text + DMod.FIBDS_SPPost.Fields[i - 1].FieldName + ' : ' + DMod.FIBDS_SPPost.Fields[i - 1].DisplayText + #13;
        end;

        if DBGrid3.Focused then
        begin
            text := '';
            for i := 1 to DMod.FIBDS_SPTypePost.Fields.Count do
                text := text + DMod.FIBDS_SPTypePost.Fields[i - 1].FieldName + ' : ' + DMod.FIBDS_SPTypePost.Fields[i - 1].DisplayText + #13;
        end;

        ShowMessage(text);

    except
    end;
end;

procedure TSP_Post.FormActivate(Sender: TObject);
begin
    if CatFilter.Value then
    begin
        CategoryGrid.SetFocus;

        if DMod.FIBDS_SPCategory.IsEmpty then Exit;

        DMod.FIBDS_SPPost.Close; 
        //всегда смотрим на дату фильтрации
        DMod.FIBDS_SPPost.ParamByName('Id_Category').AsInteger := DMod.FIBDS_SPCategory['Id_Category'];
        DMod.FIBDS_SPPost.ParamByName('ActDate').AsDate := DP_Date.Date;
        DMod.FIBDS_SPPost.Open;
    end
    else PostGrid.SetFocus;
end;

procedure TSP_Post.FilterEditChange(Sender: TObject);
begin
    if Trim(FilterEdit.Text) = '' then DMod.FIBDS_SPPost.Filtered := False
    else
    begin
        DMod.FIBDS_SPPost.Filtered := False;
        DMod.FIBDS_SPPost.Filter := ' Name_Post LIKE ''%' + FilterEdit.Text + '%''';
        DMod.FIBDS_SPPost.Filtered := True;
    end;
end;

procedure TSP_Post.PostViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    case Key of
        ord('Z'):
            if (ssAlt in Shift) and (ssShift in Shift) and (ssCtrl in Shift) then
            try
                ShowMessage(IntToStr(DMod.FIBDS_SPPost['Id_Post']));
            except
            end;
    end;
end;

procedure TSP_Post.CatFilterChange(Sender: TObject);
begin
    if CatFilter.Value then
    begin
        LeftPanel.Visible := True;

        if DMod.FIBDS_SPCategory.IsEmpty then Exit;

        DMod.FIBDS_SPPost.Close;   
        //всегда смотрим на дату фильтрации
        DMod.FIBDS_SPPost.ParamByName('Id_Category').AsInteger := DMod.FIBDS_SPCategory['Id_Category'];
        DMod.FIBDS_SPPost.ParamByName('ActDate').AsDate := DP_Date.Date;
        DMod.FIBDS_SPPost.Open;
    end
    else
    begin
        LeftPanel.Visible := False;

        DMod.FIBDS_SPPost.Close;
        //всегда смотрим на дату фильтрации
        DMod.FIBDS_SPPost.ParamByName('Id_Category').AsVariant := Null;
        DMod.FIBDS_SPPost.ParamByName('ActDate').AsDate := DP_Date.Date;
        DMod.FIBDS_SPPost.Open;
    end;
end;

function TSP_Post.PostViewIsSorted: Boolean;
var
    i: Integer;
    s: string;
begin
    Result := False;

    for i := 0 to PostView.ColumnCount - 1 do
    begin
        if PostView.Columns[i].SortOrder <> soNone then
        begin
            Result := True;
            break;
        end;
    end;
end;

procedure TSP_Post.FIBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
begin
  cxMemo1.Lines.Append(EventText);
end;

procedure TSP_Post.LogEventNoCommitTransaction();
begin
{  FIBSQLMonitor1.Active:=True;
  with DMod do
  begin
    StProInsertLog.StoredProcName:='GEN_UP_DT_LOG_EVENT_ID_SESS_S';
    StProInsertLog.Transaction.StartTransaction;
    StProInsertLog.Prepare;
    StProInsertLog.ExecProc;
    id_session_log:=StProInsertLog.ParamByName('id_session').AsInt64;
    StProInsertLog.Transaction.Commit;
  end; }
end;

procedure TSP_Post.LogEventNoCommitTransactionSave(Name_event:string);
var Stream : TMemoryStream;
begin
 {
  FIBSQLMonitor1.Active:=False;
  with DMod do
  begin
    //if FIBWriteTransaction.Active then FIBWriteTransaction.Rollback;//для того чтобы если ошибки были не пытаться комитить
    Stream := TMemoryStream.Create;
    TcxMemo(cxMemo1).Lines.SaveToStream(Stream);
    StProInsertLog.StoredProcName:='UP_DT_LOG_EVENT_I';
    StProInsertLog.Transaction.StartTransaction;
    StProInsertLog.Prepare;
    StProInsertLog.ParamByName('ID_SESSION').AsInt64:=id_session_log;
    StProInsertLog.ParamByName('FIO_USER').AsString:=AccMGMT.GetUserFIO;
    StProInsertLog.ParamByName('EVENT_DATA').AsDate:=Date;
    StProInsertLog.ParamByName('EVENT_TIME').AsTime:=Time;
    StProInsertLog.ParamByName('NAME_MODUL').AsString:='SP_POST';
    StProInsertLog.ParamByName('EVENT_TEXT').LoadFromStream(Stream);
    StProInsertLog.ParamByName('ID_SESSION').AsInt64:=id_session_log;
    StProInsertLog.ExecProc;
    StProInsertLog.Transaction.Commit;
  end;    }
end;

end.

