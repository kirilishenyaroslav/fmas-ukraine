{************************************************************************
* Unit KassaSystemMain.					                *
*							                *
* Описание предназначения(работы) модуля: справочник касс и счетов      *
* Copyright ©  Год 2006, Автор: Ворновских Макс                         *
*************************************************************************}
unit KassaSystemMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, dxBar, dxBarExtItems, ImgList, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxSplitter, ExtCtrls, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Buttons, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, cxContainer, cxLabel, FIBQuery, pFIBQuery, StdCtrls,
  pFIBStoredProc;

type
  TfmKassaSystemMain = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarButtonAdd: TdxBarLargeButton;
    dxBarButtonUpdate: TdxBarLargeButton;
    dxBarButtonDelete: TdxBarLargeButton;
    dxBarButtonRefresh: TdxBarLargeButton;
    dxBarButtonExit: TdxBarLargeButton;
    cxGridKassaDBTableView1: TcxGridDBTableView;
    cxGridKassaLevel1: TcxGridLevel;
    cxGridKassa: TcxGrid;
    Panel1: TPanel;
    cxSplitter1: TcxSplitter;
    Panel2: TPanel;
    pFIBDatabase1: TpFIBDatabase;
    pFIBTransactionKassa: TpFIBTransaction;
    pFIBDataSetKassa: TpFIBDataSet;
    DataSourceKassa: TDataSource;
    pFIBTransactionKassaBase: TpFIBTransaction;
    pFIBDataSetKassaID_SP_KASS: TFIBBCDField;
    pFIBDataSetKassaFULL_NAME_KASS: TFIBStringField;
    pFIBDataSetKassaSHORT_NAME_KASS: TFIBStringField;
    pFIBDataSetKassaID_SERVER: TFIBStringField;
    pFIBDataSetKassaDATE_BLOK_SALDO_END: TFIBDateTimeField;
    pFIBDataSetKassaID_USER_BLOK_SALDO_END: TFIBIntegerField;
    pFIBDataSetKassaDATE_CLOSE: TFIBDateTimeField;
    pFIBDataSetKassaID_USER_CLOSE_KASS: TFIBIntegerField;
    pFIBDataSetKassaID_USER: TFIBBCDField;
    pFIBDataSetKassaBLOCK_SALDO_END: TFIBSmallIntField;
    cxGridShetDBTableView1: TcxGridDBTableView;
    cxGridShetLevel1: TcxGridLevel;
    cxGridShet: TcxGrid;
    cxGridKassaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridKassaDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridKassaDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridShetDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridShetDBTableView1DBColumn2: TcxGridDBColumn;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
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
    dxBarDockControl1: TdxBarDockControl;
    dxBarButtonAdd1: TdxBarLargeButton;
    dxBarButtonUpdate1: TdxBarLargeButton;
    dxBarButtonDelete1: TdxBarLargeButton;
    pFIBTransactionDel: TpFIBTransaction;
    pFIBQueryDelete: TpFIBQuery;
    dxBarLargeButton1: TdxBarLargeButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ImageList: TImageList;
    pFIBDataSetSchet: TpFIBDataSet;
    pFIBTransactionSchet: TpFIBTransaction;
    DataSourceSchet: TDataSource;
    cxGridShetDBTableView1DBColumn3: TcxGridDBColumn;
    pFIBStoredProcDelete: TpFIBStoredProc;
    pFIBTransaction_SP_Delete: TpFIBTransaction;
    procedure dxBarButtonExitClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dxBarButtonAddClick(Sender: TObject);
    procedure dxBarButtonRefreshClick(Sender: TObject);
    procedure dxBarButtonUpdateClick(Sender: TObject);
    procedure dxBarButtonDeleteClick(Sender: TObject);
    procedure cxGridKassaDBTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton1Click(Sender: TObject);
    procedure Action_AddExecute(Sender: TObject);
    procedure Action_UpdateExecute(Sender: TObject);
    procedure Action_DeleteExecute(Sender: TObject);
    procedure Action_RefreshExecute(Sender: TObject);
    procedure Action_exitExecute(Sender: TObject);
    procedure Action_ChooseExecute(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    constructor Create (AOwner: TComponent; m: smallint; DB: TpFIBDatabase; reg: integer);  reintroduce;
    procedure pFIBDataSetKassaAfterScroll(DataSet: TDataSet);
    procedure dxBarButtonAdd1Click(Sender: TObject);
    procedure dxBarButtonUpdate1Click(Sender: TObject);
    function IsThereAnySchetDefault(): boolean;
    procedure dxBarButtonDelete1Click(Sender: TObject);
    procedure cxGridShetDBTableView1DBColumn3GetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure cxGridShetActiveTabChanged(Sender: TcxCustomGrid;
      ALevel: TcxGridLevel);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridShetDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);         //Возвращает истину, если у системы есть счёт по-умолчанию
  private
    {}
  public
    id_us : int64;
    resValue : variant;
    Mode:integer;
    return_full_name:String;
    return_short_name:String;
    return_date_close:String;
  end;

function KassaSys(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; m : Smallint; regim : integer) : Variant; stdcall;
    exports KassaSys;
    {regim - режим вызова формы 0 -мдиай, 1 - модальный режим
      m - 1 - вызов справочника касс с выбором кассы, 0 -просто два справочника (без выбора)}

implementation
Uses KassaAddDialog, Un_R_file_Alex, DialogSchet, Accmgmt;
{$R *.dfm}
     {После интеграции-просто удалить!!!}

{Чтоб исправить ошибку Саши -- "инициировал Mode После создания формы"}
constructor TfmKassaSystemMain.Create(AOwner: TComponent; m: smallint; DB: TpFIBDatabase; reg: integer);
begin
        inherited Create(AOwner);

        Mode:=m;
        pFIBDatabase1                            := DB;
        pFIBTransactionKassaBase.DefaultDatabase := pFIBDatabase1;
        pFIBTransactionDel.DefaultDatabase       := pFIBDatabase1;
        pFIBDatabase1.DefaultTransaction         := pFIBTransactionKassaBase;


        pFIBDataSetKassa.Database                := pFIBDatabase1;
        pFIBDataSetKassa.Transaction             := pFIBTransactionKassaBase;
        //pFIBDataSetSchet.Database                := pFIBDatabase1;
        //pFIBDataSetSchet.Transaction             := pFIBTransactionSchet;
        //pFIBTransactionSchet.DefaultDatabase     := pFIBDatabase1;
        //pFIBDataSetSchet.SQLs.SelectSQL.Text     := 'SELECT * FROM KASSA_SELECT_ALL_SCH(1200000874)';
        //pFIBDataSetSchet.CloseOpen(true);
        pFIBTransactionKassaBase.StartTransaction;

        
        pFIBDataSetKassa.CloseOpen(true);
{Иницмализирум консианты}
        dxBarLargeButton1.Caption  := Un_R_file_Alex.KASSA_CHOOSE_BUTTON_TOOLBAR;
        Caption                    := Un_R_file_Alex.KASSA_SP_AND_SCH;
        dxBarButtonExit.Caption    := Un_R_file_Alex.MY_BUTTON_CLOSE;
        dxBarButtonRefresh.Caption := Un_R_file_Alex.MY_BUTTON_REFRESH;
        dxBarButtonAdd.Caption     := Un_R_file_Alex.KASSA_ADD_KASSA;
        dxBarButtonDelete.Caption  := Un_R_file_Alex.KASSA_DELETE_KASSA;
        dxBarButtonUpdate.Caption  := Un_R_file_Alex.KASSA_CHANGE_KASSA;

        dxBarButtonAdd1.Caption    := Un_R_file_Alex.KASSA_ADD_SCH;
        dxBarButtonUpdate1.Caption := Un_R_file_Alex.KASSA_CHANGE_SCH;
        dxBarButtonDelete1.Caption := Un_R_file_Alex.KASSA_DELETE_SCH;

        cxGridKassaDBTableView1DBColumn1.Caption := Un_R_file_Alex.KASSA_SHORT_NAME;
        cxGridKassaDBTableView1DBColumn2.Caption := Un_R_file_Alex.KASSA_FULL_NAME;
        //cxGridKassaDBTableView1DBColumn4.Caption := Un_R_file_Alex.KASSA_DATE_BEGIN;

        cxGridShetDBTableView1DBColumn1.Caption  := Un_R_file_Alex.KASSA_SCH;
        cxGridShetDBTableView1DBColumn2.Caption  := Un_R_file_Alex.KASSA_SCH_NAME;
        cxGridShetDBTableView1DBColumn3.Caption  := Un_R_file_Alex.KASSA_FLAG_DEFAULT;

        cxLabel1.Caption                         := Un_R_file_Alex.KASSA_EXISTS_KASSA;
        cxLabel2.Caption                         := Un_R_file_Alex.KASSA_EXISTS_SCH;

{Выбираем режим отображения}
        Mode:=2;
        if Mode=0 then  //Режим - просмотр только кассы: (кнопка "Выбiр" неактивна, DoubleClick не работает)
        begin
                dxBarButtonAdd.Enabled:=true;
                dxBarButtonUpdate.Enabled:=true;
                dxBarButtonDelete.Enabled:=true;
                dxBarLargeButton1.Enabled:=false;
                //Настраиваем сплитер
                cxSplitter1.CloseSplitter;
                cxSplitter1.Visible:=false;
                pFIBDataSetKassa.Open;
        end;
        if Mode=1 then    //Выбор кассы: (кнопка "Выбiр" активна, DoubleClick р0аботает)
        begin
                dxBarButtonAdd.Enabled:=false;
                dxBarButtonUpdate.Enabled:=false;
                dxBarButtonDelete.Enabled:=false;
                dxBarLargeButton1.Enabled:=true;;
                cxSplitter1.CloseSplitter;
                cxSplitter1.Visible:=false;
                pFIBDataSetKassa.Open;
        end;
        if Mode=2 then    //Режим-отображается и касса и счёт
        begin
                dxBarLargeButton1.Enabled:=false;
                dxBarLargeButton1.Visible := TdxBarItemVisible(false);
                dxBarLargeButton1.AutoGrayScale := true;
                if(pFIBTransactionSchet.Active) then
                        pFIBTransactionSchet.Commit;

                dxBarLargeButton1.Enabled:=true;;
                cxSplitter1.OpenSplitter;
                cxSplitter1.Visible:=true;
                //Активизируем левый грид
                pFIBDataSetKassa.Open;
                //Активизируем правый грид
                pFIBDataSetSchet.Database               := pFIBDatabase1;
                pFIBDataSetSchet.Transaction            := pFIBTransactionSchet;
                pFIBTransactionSchet.DefaultDatabase    := pFIBDatabase1;
                DataSourceSchet.DataSet                 := pFIBDataSetSchet;
                pFIBDataSetSchet.SQLs.SelectSQL.Text    := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+pFIBDataSetKassaID_SP_KASS.AsString+')';
                pFIBDataSetSchet.CloseOpen(true);
                //pFIBTransactionSchet.Commit;
                //pFIBDataSetSchet.Open;
        end;
{Запускаем транзакции, открываем наборы}

end;

function KassaSys(AOwner:TComponent; id_user: int64; DBHandle: TpFIBDatabase; m : Smallint; regim : integer) : Variant;
var
    T : TfmKassaSystemMain;
begin
    T               := TfmKassaSystemMain.Create(AOwner, m, DBHAndle, regim);
    T.id_us         := id_user;

    T.Mode          := m;        //НЕ ВЕРНО -- ФОРМА УЖЕ ПРОИНИЦИАЛИЗИРОВАНА, => ЭТО НИЧЕГО НЕ ДАЁТ!!!
    if regim = 1 then
    begin
            T.FormStyle     := fsNormal;
            T.ShowModal;
            Result := T.resValue;
            T.Free;
    end;
    if regim = 0 then
    begin
        T.FormStyle     := fsMDIChild;
        T.Show;
    end;
    //if regim = 1 then {MDI}
    {begin
        T.FormStyle := fsNormal;
        T.ShowModal;
        Result := T.resValue;
        T.Free;
    end else
    begin
        T.FormStyle := fsMDIChild;
        T.Show;
    end;}
end;

procedure TfmKassaSystemMain.dxBarButtonExitClick(Sender: TObject);
begin
        Close;
end;

procedure TfmKassaSystemMain.FormDestroy(Sender: TObject);
begin
pFIBTransactionKassaBase.Commit;
end;

procedure TfmKassaSystemMain.dxBarButtonAddClick(Sender: TObject);
var
        KassaAddDialog: TfmKassaAddDialog;
//    new_id:String;
begin
                KassaAddDialog:=TfmKassaAddDialog.Create(self,self,'AddLeft');
                KassaAddDialog.ShowModal;

                pFIBDataSetKassa.CloseOpen(true);

                pFIBDataSetKassa.Locate('ID_SP_KASS', KassaAddDialog.local_id, []);
                {тут будут "Мозги"}
                {установка курсора в Grid-е}
                { if KassaAddDialog.local_id<>'' then
                begin
                        pFIBDataSetKassa.First;
                        while (not pFIBDataSetKassa.Eof) do
                        begin
                                pFIBDataSetKassa.Next;
                                if (pFIBDataSetKassaID_SP_KASS.AsString=KassaAddDialog.local_id) then break;

                        end;
                end;
                }
                KassaAddDialog.Free;
        
end;

procedure TfmKassaSystemMain.dxBarButtonRefreshClick(Sender: TObject);
begin
        pFIBDataSetKassa.CloseOpen(true);

end;

procedure TfmKassaSystemMain.dxBarButtonUpdateClick(Sender: TObject);
var
    KassaAddDialog:TfmKassaAddDialog;
    id_update : int64;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_EDIT), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

        KassaAddDialog := TfmKassaAddDialog.Create(self,self,'UpdateLeft');
        KassaAddDialog.ShowModal;
        id_update      :=KassaAddDialog.local_id_for_update;
        pFIBDataSetKassa.CloseOpen(true);
        pFIBDataSetKassa.Locate('ID_SP_KASS', id_update, []);
{        if(pFIBDataSetKassaID_SP_KASS.AsInteger<>id_update)then
        begin
                if id_update<>0 then
                begin
                        pFIBDataSetKassa.First;
                        while (not pFIBDataSetKassa.Eof) do
                        begin
                                pFIBDataSetKassa.Next;
                                if (pFIBDataSetKassaID_SP_KASS.AsInteger=id_update) then break;

                        end;
                end;
        end;}
        {тут будут "Мозги"}
        KassaAddDialog.Free;

end;

procedure TfmKassaSystemMain.dxBarButtonDeleteClick(Sender: TObject);
var
    ret_value_msgbox:integer;
    s : String;
    id_pred : int64;
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Del');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_DEL), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

        s := KASSA_ARE_YOU_SURE_TEXT+' "'+pFIBDataSetKassaSHORT_NAME_KASS.AsString+'"';
        ret_value_msgbox := MessageBox(self.Handle,PAnsiChar(s),PAnsiChar(KASSA_ARE_YOU_SURE_CAPTION), MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONASTERISK );
        if ret_value_msgbox = IDOK then
        begin
                {-----------ТАКОЙ СЕБЕ ТРИГГЕР------------}
                pFIBTransaction_SP_Delete.DefaultDatabase       := pFIBDatabase1;
                pFIBStoredProcDelete.Database   := pFIBDatabase1;
                pFIBStoredProcDelete.Transaction := pFIBTransaction_SP_Delete;
                pFIBStoredProcDelete.StoredProcName     := 'KASSA_SP_SCH_SYSTEM_DEL_TRIG';

                pFIBStoredProcDelete.ParamByName('D_ID').AsInt64        :=  StrToInt64(pFIBDataSetKassaID_SP_KASS.AsString);

                pFIBTransaction_SP_Delete.StartTransaction;
                        try
                                pFIBStoredProcDelete.Prepare;
                                pFIBStoredProcDelete.ExecProc;
                                pFIBTransaction_SP_Delete.Commit;
                        except on E:Exception do
                        begin
                                pFIBTransaction_SP_Delete.Rollback;
                                ShowMessage(E.Message);
                        end;
                        end;

                        pFIBDataSetSchet.CloseOpen(true);
                {-----------------------------------------}
                pFIBQueryDelete.Database    := pFIBDatabase1;
                pFIBQueryDelete.Transaction := pFIBTransactionDel;
                pFIBTransactionDel.StartTransaction;
                pFIBQueryDelete.ParamByName('id').AsInt64 := pFIBDataSetKassaID_SP_KASS.AsInt64;
                cxGridKassaDBTableView1.Controller.GoToPrev(false);
                id_pred := pFIBDataSetKassaID_SP_KASS.AsInt64;
                try
                        pFIBQueryDelete.Prepare;
                        pFIBQueryDelete.ExecQuery;
                        pFIBTransactionDel.Commit;
                except on E:Exception do
                begin
                        ShowMessage('Удаление невозможно');
                        pFIBTransactionDel.Rollback;
                end;
                end;
                pFIBDataSetKassa.CloseOpen(true);
                pFIBDataSetKassa.Locate('ID_SP_KASS', id_pred, []);

        pFIBTransactionKassaBase.Commit;
        pFIBTransactionKassaBase.StartTransaction;
        dxBarButtonRefreshClick(Sender);
        end;//ret_value_msgbox
end;

procedure TfmKassaSystemMain.cxGridKassaDBTableView1DblClick(
  Sender: TObject);
begin
     if(Mode=1)then
     begin
        resValue          := pFIBDataSetKassaID_SP_KASS.AsInt64;
        return_full_name  := pFIBDataSetKassaFULL_NAME_KASS.AsString;
        return_short_name := pFIBDataSetKassaSHORT_NAME_KASS.AsString;
        return_date_close := pFIBDataSetKassaDATE_CLOSE.AsString;
        close;

     end;
end;

procedure TfmKassaSystemMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := CaFree;
end;

procedure TfmKassaSystemMain.dxBarLargeButton1Click(Sender: TObject);
begin
{~~~~~~~~~~Редактировать при добавлениия вариантов mode~~~~~~~~~~~~~~~~~~}
       if mode<>0  then
                cxGridKassaDBTableView1DblClick(Sender);
{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}
end;

procedure TfmKassaSystemMain.Action_AddExecute(Sender: TObject);
var
    error : integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_ADD), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;
      if cxGrid1Level1.Active then
      begin
        dxBarButtonAddClick(Sender);
        cxGrid1Level1.Active := false;
        cxGridShetLevel1.Active := false;
      end;
      if cxGridShetLevel1.Active then
      begin
        dxBarButtonAdd1Click(Sender);
        cxGrid1Level1.Active := false;
        cxGridShetLevel1.Active := false;
      end;
      cxGrid1Level1.Active := true;
      cxGridShetLevel1.Active := true;
end;

procedure TfmKassaSystemMain.Action_UpdateExecute(Sender: TObject);
begin
        dxBarButtonUpdateClick(Sender);
end;

procedure TfmKassaSystemMain.Action_DeleteExecute(Sender: TObject);
begin
        dxBarButtonDeleteClick(Sender);
end;

procedure TfmKassaSystemMain.Action_RefreshExecute(Sender: TObject);
begin
        dxBarButtonRefreshClick(Sender);
end;

procedure TfmKassaSystemMain.Action_exitExecute(Sender: TObject);
begin
        dxBarButtonExitClick(Sender);
end;

procedure TfmKassaSystemMain.Action_ChooseExecute(Sender: TObject);
begin
       dxBarButtonAdd1Click(Sender);
end;

procedure TfmKassaSystemMain.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
        cxGridKassaDBTableView1DblClick(Sender);
end;

procedure TfmKassaSystemMain.pFIBDataSetKassaAfterScroll(
  DataSet: TDataSet);
begin
        if(pFIBTransactionSchet.Active) then
                pFIBTransactionSchet.Commit;
        //if Mode = 2 then
        begin
                pFIBDataSetSchet.Database               := pFIBDatabase1;
                pFIBDataSetSchet.Transaction            := pFIBTransactionSchet;
                pFIBTransactionSchet.DefaultDatabase    := pFIBDatabase1;
                DataSourceSchet.DataSet                 := pFIBDataSetSchet;
                pFIBDataSetSchet.SQLs.SelectSQL.Text    := 'SELECT * FROM KASSA_SELECT_ALL_SCH('+pFIBDataSetKassaID_SP_KASS.AsString+')';
                pFIBDataSetSchet.CloseOpen(true);
                //pFIBTransactionSchet.Commit;
        end;
end;

procedure TfmKassaSystemMain.dxBarButtonAdd1Click(Sender: TObject);
var
        DialogSchet: TfmDialogSchet;
        error : Integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Add');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_ADD), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

      DialogSchet := TfmDialogSchet.Create(self,'Insert', self, pFIBDatabase1, id_us);
      DialogSchet.ShowModal;
      //!!!! Locate
      pFIBDataSetSchet.CloseOpen(true);
      DialogSchet.Free;
end;

procedure TfmKassaSystemMain.dxBarButtonUpdate1Click(Sender: TObject);
var
        DialogSchet: TfmDialogSchet;
        error : Integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Edit');
    if error <> 0 then
    begin
        MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_EDIT), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
        exit;
    end;

     if pFIBDataSetSchet.RecordCount > 0 then
     begin
        DialogSchet := TfmDialogSchet.Create(self,'Update',self,pFIBDatabase1, id_us);
        DialogSchet.ShowModal;
        //!!!! Locate
        pFIBDataSetSchet.CloseOpen(true);
        DialogSchet.Free;
     end;

end;

{......SUPER FUNCTION.....}
function TfmKassaSystemMain.IsThereAnySchetDefault(): boolean;
var
        LookUpResult: Variant;
begin
        LookUpResult := pFIBDataSetSchet.LookUp('FLAG_DEFAULT', Variant(1), 'FLAG_DEFAULT');
        if  VarType(LookUpResult) = varNull then
                result:=false
        else
                result:=true;
end;

procedure TfmKassaSystemMain.dxBarButtonDelete1Click(Sender: TObject);
var
        ret_value_msgbox:integer;
        s : String;
        error : Integer;
begin
    error := Accmgmt.fibCheckPermission('/ROOT/Kassa/Sprav/Spr_kass_sys','Del');
    if error <> 0 then
    begin
         MessageBox(Handle, PChar(Un_R_file_Alex.MY_MESSAGE_WARNING_DEL), PChar(Un_R_file_Alex.MY_MESSAGE_WARNING), 16);
         exit;
    end;
        if pFIBDataSetSchet.RecordCount > 0 then
        begin
        s := Un_R_file_Alex.KASSA_ARE_YOU_SURE_TEXT;
        ret_value_msgbox := MessageBox(self.Handle,PAnsiChar(s),PAnsiChar(Un_R_file_Alex.KASSA_ARE_YOU_SURE_CAPTION), MB_OKCANCEL + MB_DEFBUTTON2 + MB_ICONASTERISK);
          if ret_value_msgbox = IDOK then
          begin
                pFIBTransaction_SP_Delete.DefaultDatabase       := pFIBDatabase1;
                pFIBStoredProcDelete.Database   := pFIBDatabase1;
                pFIBStoredProcDelete.Transaction := pFIBTransaction_SP_Delete;
                pFIBStoredProcDelete.StoredProcName     := 'KASSA_SP_SCH_SYSTEM_DELETE';

                pFIBStoredProcDelete.ParamByName('D_ID').AsInt64        :=  StrToInt64(pFIBDataSetSchet.FBN('ID_SP_KASS').AsString);
                pFIBStoredProcDelete.ParamByName('D_ID_SCH').AsInt64    :=  StrToInt64(pFIBDataSetSchet.FBN('ID_SCH').AsString);
                pFIBStoredProcDelete.ParamByName('D_DATE_BEGIN').AsDateTime := pFIBDataSetSchet.FBN('DATE_BEG').AsDateTime;
                pFIBStoredProcDelete.ParamByName('D_DATE_END').AsString := '31.12.2999';

                pFIBTransaction_SP_Delete.StartTransaction;
                        try
                                pFIBStoredProcDelete.Prepare;
                                pFIBStoredProcDelete.ExecProc;
                                pFIBTransaction_SP_Delete.Commit;
                        except on E:Exception do
                        begin
                                pFIBTransaction_SP_Delete.Rollback;
                                ShowMessage(E.Message);
                        end;
                        end;

                        pFIBDataSetSchet.CloseOpen(true);
           end;
        end;
end;

procedure TfmKassaSystemMain.cxGridShetDBTableView1DBColumn3GetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
        if AText = '1'then
        begin
                AText := 'По умовчанню';
        end;
        if AText = '0' then
        begin
                AText := '';
        end;
        
end;

procedure TfmKassaSystemMain.cxGridShetActiveTabChanged(
  Sender: TcxCustomGrid; ALevel: TcxGridLevel);
begin
        pFIBDataSetSchet.CloseOpen(true);
end;

procedure TfmKassaSystemMain.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if Key = VK_INSERT then
                dxBarButtonAddClick(Sender);;
        if Key = VK_DELETE then
                dxBarButtonDeleteClick(Sender);
        if Key = VK_F2 then
                dxBarButtonUpdateClick(Sender);
end;

procedure TfmKassaSystemMain.cxGridShetDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
        if Key = VK_INSERT then
                dxBarButtonAdd1Click(Sender);
        if Key = VK_DELETE then
                dxBarButtonDelete1Click(Sender);
        if Key = VK_F2 then
                dxBarButtonUpdate1Click(Sender);
end;

end.
