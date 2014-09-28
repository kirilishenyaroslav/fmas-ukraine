unit UoVidNRobit_Main;

interface
                         // tfibbcdfield
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxContainer,
  ActnList, ImgList,  FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, dxStatusBar,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid, StdCtrls,
  Buttons, ExtCtrls, AArray, ibase, ib_externals, frxClass, frxExportPDF,
  frxExportImage, frxExportXML, frxExportHTML, frxExportXLS, frxExportTXT,
  frxExportRTF, frxDBSet, cxTextEdit, cxLabel, cxLookAndFeelPainters,
  cxButtons, cxMemo, cxSplitter;


type
  TfmUoVidNRobit_Main = class(TForm)
    dxStatusBarSP: TdxStatusBar;
    StyleRepository_sp_type: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyleSkyBlue: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    DataBase_uo__sp_type: TpFIBDatabase;
    TransactionRead_uo__sp_type: TpFIBTransaction;
    TransactionWrite_uo_sp_type: TpFIBTransaction;
    St: TpFIBStoredProc;
    DS: TpFIBDataSet;
    DataSource_uo__sp_type: TDataSource;
    ImageList_sp_type: TImageList;
    cxEditStyleController_uo__sp_type: TcxEditStyleController;
    ActionList_uo__sp_type: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    dxBarManager_sp_type: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonPrint: TdxBarLargeButton;
    frxDBDataset1: TfrxDBDataset;
    frxRTFExport1: TfrxRTFExport;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport1: TfrxXLSExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxXMLExport1: TfrxXMLExport;
    frxTIFFExport1: TfrxTIFFExport;
    frxPDFExport1: TfrxPDFExport;
    Action1: TAction;
    Action2: TAction;
    Panel1: TPanel;
    Panel2: TPanel;
    cxGrid_uo__sp_type: TcxGrid;
    cxGrid_uo__sp_typeDBTableView1: TcxGridDBTableView;
    cxGrid_uo__sp_typeDBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid_uo__sp_typeLevel1: TcxGridLevel;
    cxSplitter1: TcxSplitter;
    cxMemo1: TcxMemo;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxStyle7: TcxStyle;
    cxGrid_uo__sp_typeDBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridDBTableView1DBColumn4: TcxGridDBColumn;
    cxGridDBTableView1DBColumn5: TcxGridDBColumn;
    cxGridDBTableView1DBColumn6: TcxGridDBColumn;
    cxGridDBTableView1DBColumn7: TcxGridDBColumn;
    cxGridDBTableView1DBColumn8: TcxGridDBColumn;
    DSRight: TpFIBDataSet;
    DataSource1: TDataSource;
    DSRightID_SP_VID_NAVCH_ROBIT_NORM: TFIBBCDField;
    DSRightID_SP_FORM_OBUCH_KATEGORY: TFIBBCDField;
    DSRightID_SP_TYPE_KAT_STUD: TFIBBCDField;
    DSRightVAL_MAX_KONT: TFIBFloatField;
    DSRightVAL_MIN_KONT: TFIBFloatField;
    DSRightVAL_MAX_GROUP: TFIBFloatField;
    DSRightVAL_MIN_GROUP: TFIBFloatField;
    DSRightVAL_MAX_PERCENT: TFIBFloatField;
    DSRightVAL_MIN_PERCENT: TFIBFloatField;
    DSRightSHORT_NAME_KAT_STUD: TFIBStringField;
    DSRightNAME_KAT_STUD: TFIBStringField;
    DSRightNAME_OBUCH_KATEGORY: TFIBStringField;
    DSRightSHORT_NAME_OBUCH_KATEGORY: TFIBStringField;
    frxReport1: TfrxReport;
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionViewExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure cxGrid_uo__sp_typeDBTableView1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LoadCaption;
    procedure ActionPrintExecute(Sender: TObject);
    procedure cxTextEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SelectLang;
    procedure Action2Execute(Sender: TObject);
    procedure cxGrid_uo__sp_typeDBTableView1KeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure DSAfterScroll(DataSet: TDataSet);
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
//    index_lang : smallint;
  public
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;

  end;

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports ShowAllUoBpl;

implementation

uses UoVidNRobit_Add, {UWResourcesUnit,} Registry;

{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
   T : TfmUoVidNRobit_Main;
begin
    T := TfmUoVidNRobit_Main.Create(aOwner, aParam);

//    try T.id_user := aParam['Input']['id_user'].AsVariant except T.id_user := -1; end;

{    if T.id_user <= 0 then
    begin
        showmessage('Несанкціонований вхід у систему!!! Вікно буде закрито. Зверніться до сстемного адміністратору або до розробників системи!');
        T.Free;
        exit;
    end;
 }
    T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
    case T.FormStyle of
       fsNormal : begin
                      T.ShowModal;
                      T.ActionVibrat.Enabled            := true;
                      T.dxBarLargeButtonVibrat.Visible  := ivAlways;
                  end;
       fsMDIChild : begin
                        T.ActionVibrat.Enabled              := false;
                        T.dxBarLargeButtonVibrat.Visible    := ivNever;
                    end;
    else
        T.Free;
    end;
end;

constructor TfmUoVidNRobit_Main.Create(aOwner: TComponent;
  aParam: TAArray);
var
    s : string;
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE      := PVoid(aParam['Input']['aDBHANDLE'].asInteger);
        inherited Create(aOwner);

        ResultArray   := aParam;
        DataBase_uo__sp_type.Close;
        DataBase_uo__sp_type.Handle := DBHANDLE;

        DS.Database            := DataBase_uo__sp_type;
        DS.Transaction         := TransactionRead_uo__sp_type;

        DSRight.Database       := DataBase_uo__sp_type;
        DSRight.Transaction    := TransactionRead_uo__sp_type;

        TransactionRead_uo__sp_type.StartTransaction;

        LoadCaption;
        DSRight.Sqls.SelectSQL.Text := 'SELECT * FROM UO_SP_VID_NAVCH_ROBIT_NORM_SEL(?ID_SP_VID_NAVCH_ROBIT)';
        DS.close;
        DS.Sqls.SelectSQL.Text := 'SELECT * FROM UO_SP_VID_NAVCH_ROBIT_SEL';
        DS.Open;
    end
    else begin
        s := 'Помилка при з''єднанні з базою даних';//UWResourcesUnit.MY_BASE_HANDLE_ERROR[index_lang];
        ShowMessage(s);
    end;
end;


procedure TfmUoVidNRobit_Main.ActionADDExecute(Sender: TObject);
var
    T : TfmUWspTypeViplatAdd;
begin
    T := TfmUWspTypeViplatAdd.Create(Self, DataBase_uo__sp_type, 1, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmUoVidNRobit_Main.ActionObnovExecute(Sender: TObject);
var
    id : int64;
begin
    TRY ID := StrToInt64(DS.fbn('ID_SP_VID_NAVCH_ROBIT').AsString); except id := -1; end;
    DS.CloseOpen(false);
    DS.Locate('ID_SP_VID_NAVCH_ROBIT', id, []);
end;

procedure TfmUoVidNRobit_Main.ActionChangeExecute(Sender: TObject);
var
    T : TfmUWspTypeViplatAdd;
begin
    if DS.IsEmpty then exit;
    T := TfmUWspTypeViplatAdd.Create(Self, DataBase_uo__sp_type, 2, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmUoVidNRobit_Main.ActionDELExecute(Sender: TObject);
var
    id_del_l, id_del_t : int64;
    s1, s2 : string;
begin
    if not DS.IsEmpty then
    begin
        s1 := 'Ви дійсно бажаєте видалити вид ';//UWResourcesUnit.V2_TYPE_DELETE[index_lang];
        s2 := 'Увага!';//UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(s1 + ' ' + DS.FieldByName('NAME').AsString + '?'), Pchar(s2), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_del_t           := StrToInt64(DS.FieldByName('ID_SP_VID_NAVCH_ROBIT').AsString);
            cxGrid_uo__sp_typeDBTableView1.Controller.GoToPrev(false);
            id_del_l           := StrToInt64(DS.FieldByName('ID_SP_VID_NAVCH_ROBIT').AsString);
            St.Database        := DataBase_uo__sp_type;
            St.Transaction     := TransactionWrite_uo_sp_type;
            try
                TransactionWrite_uo_sp_type.StartTransaction;
                St.StoredProcName := 'UO_SP_VID_NAVCH_ROBIT_DEL';
                St.ParamByName('ID_SP_VID_NAVCH_ROBIT').AsInt64 := id_del_t;
                St.ExecProc;
                TransactionWrite_uo_sp_type.Commit;
            except on E:Exception do begin
                TransactionWrite_uo_sp_type.Rollback;
                ShowMessage(E.Message);
            end end;
            ActionObnovExecute(Sender);
            DS.Locate('ID_SP_VID_NAVCH_ROBIT', id_del_l, []);
        end;
    end;
end;

procedure TfmUoVidNRobit_Main.ActionViewExecute(Sender: TObject);
var
    T : TfmUWspTypeViplatAdd;
begin
    if DS.IsEmpty then exit;
    T := TfmUWspTypeViplatAdd.Create(Self, DataBase_uo__sp_type, 3, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmUoVidNRobit_Main.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TfmUoVidNRobit_Main.ActionVibratExecute(Sender: TObject);
begin
    if not DS.IsEmpty then
    begin
        if FormStyle = fsNormal then
        begin
//            FillArrayFromDataSet(ResultArray['OutPut'], DS);
            ResultArray['OutPut']['ID_SP_VID_NAVCH_ROBIT'].AsInt64      := strToInt64(DS.fbn('ID_SP_VID_NAVCH_ROBIT').AsString);
            ResultArray['OutPut']['NAME'].AsString                      := DS.fbn('NAME').AsString;
            ResultArray['OutPut']['ID_SP_VID_NAVCH_ROBIT_NORM'].AsInt64 := strToInt64(DSRight.fbn('ID_SP_VID_NAVCH_ROBIT_NORM').AsString);
            ResultArray['OutPut']['ID_SP_FORM_OBUCH_KATEGORY'].AsInt64  := strToInt64(DSRight.fbn('ID_SP_FORM_OBUCH_KATEGORY').AsString);
            ResultArray['OutPut']['ID_SP_TYPE_KAT_STUD'].AsInt64        := strToInt64(DSRight.fbn('ID_SP_TYPE_KAT_STUD').AsString);
            ResultArray['OutPut']['VAL_MAX_KONT'].AsString              := DSRight.fbn('VAL_MAX_KONT').AsString;
            ResultArray['OutPut']['VAL_MIN_KONT'].AsString              := DSRight.fbn('VAL_MIN_KONT').AsString;
            ResultArray['OutPut']['VAL_MAX_GROUP'].AsString             := DSRight.fbn('VAL_MAX_GROUP').AsString;
            ResultArray['OutPut']['VAL_MIN_GROUP'].AsString             := DSRight.fbn('VAL_MIN_GROUP').AsString;
            ResultArray['OutPut']['VAL_MAX_PERCENT'].AsString           := DSRight.fbn('VAL_MAX_PERCENT').AsString;
            ResultArray['OutPut']['VAL_MIN_PERCENT'].AsString           := DSRight.fbn('VAL_MIN_PERCENT').AsString;
            ResultArray['OutPut']['NAME_KAT_STUD'].AsString             := DSRight.fbn('NAME_KAT_STUD').AsString;
            ResultArray['OutPut']['NAME_OBUCH_KATEGORY'].AsString       := DSRight.fbn('NAME_OBUCH_KATEGORY').AsString;
            Close;


            close;
        end
        else
            ModalResult := mrOk;
    end;
end;

procedure TfmUoVidNRobit_Main.cxGrid_uo__sp_typeDBTableView1DblClick(
  Sender: TObject);
begin
    if ActionVibrat.Visible then ActionVibratExecute(SENDER);
end;

procedure TfmUoVidNRobit_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        ResultArray.Free;
        Action      := caFree;
    end;
end;

procedure TfmUoVidNRobit_Main.LoadCaption;
//var
//    reg : TRegistry;
begin
{    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\', False) then
        begin
            index_lang := StrToInt(reg.ReadString('index'));
        end else
            index_lang := 1;
    finally
        reg.Free;
    end;
 }
    Caption                 := 'Довідник типів навчальних робіт';//UWResourcesUnit.V2_TYPE_NAME_CAPTION[index_lang];
    ActionADD.Caption       := 'Додати';//UWResourcesUnit.MY_CONST_ADD[index_lang];
    ActionChange.Caption    := 'Змінити';//UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ActionDEL.Caption       := 'Видалити';//UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ActionView.Caption      := 'Переглянути';//UWResourcesUnit.MY_CONST_SHOW[index_lang];
    ActionObnov.Caption     := 'Оновити';//UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ActionVibrat.Caption    := 'Вибрати';//UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    ActionOtmena.Caption    := 'Відмінити';//UWResourcesUnit.MY_CONST_VIH[index_lang];

    ActionADD.Hint          := 'Додати вид навчальних робіт';//UWResourcesUnit.MY_CONST_ADD[index_lang];
    ActionChange.Hint       := 'Змінити вид навчальних робіт';//UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ActionDEL.Hint          := 'Видалити вид навчальних робіт';//UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ActionView.Hint         := 'Переглянути вид навчальних робіт';//UWResourcesUnit.MY_CONST_SHOW[index_lang];
    ActionObnov.Hint        := 'Оновити данні з серверу';//UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ActionVibrat.Hint       := 'Вибрати вид навчальних робіт';//UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    ActionOtmena.Hint       := 'Закрити довідник';//UWResourcesUnit.MY_CONST_VIH[index_lang];

    ActionPrint.Caption     := 'Друкувати';//UWResourcesUnit.MY_CONST_PRINT[index_lang];
    ActionPrint.Hint        := 'Друкувати реєстр видів навчальних робіт';//UWResourcesUnit.MY_CONST_PRINT[index_lang];

//    cxGrid_uo__sp_typeDBTableView1DBColumn1.Caption := '';//UWResourcesUnit.V2_TYPE_NAME_TYPE[index_lang];

    dxStatusBarSP.Panels[0].Text          := 'Ins - '   + 'Додати';//UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBarSP.Panels[1].Text          := 'F2 - '    + 'Змінити';//UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBarSP.Panels[2].Text          := 'Del - '   + 'Видалити';//UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBarSP.Panels[3].Text          := 'F5 - '    + 'Оновити';//UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBarSP.Panels[4].Text          := 'F3 - '    + 'Переглянути';//UWResourcesUnit.MY_CONST_SHOW[index_lang];
    dxStatusBarSP.Panels[5].Text          := 'Enter - ' + 'Вибрати';//UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
//    dxStatusBarSP.Panels[6].Text          := 'Ctrl+F - Шв. пошук';

end;

procedure TfmUoVidNRobit_Main.ActionPrintExecute(Sender: TObject);
//var
//    Memo1, Memo6{, Memo7, Memo9, Memo8, Memo10}: TfrxMemoView;
begin
{    if DS.IsEmpty then exit;
    Memo1 := frxReport1.FindObject('Memo1') as TfrxMemoView;
    Memo6 := frxReport1.FindObject('Memo6') as TfrxMemoView;
    Memo1.Text := 'Довідник типів виплат';
    Memo6.Text := 'Назва';
    frxReport1.ShowReport;}
end;

procedure TfmUoVidNRobit_Main.cxTextEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        ActionVibratExecute(Sender);
    end;
end;

procedure TfmUoVidNRobit_Main.SelectLang;
//var
//    reg : TRegistry;
begin
{    reg := TRegistry.Create;
    try
        reg.RootKey := HKEY_CURRENT_USER;
        if  reg.OpenKey('\Software\12303706759837\gnal\v\',true) then
        begin
            if index_lang + 1 > UWResourcesUnit.IndexLang
                then reg.writeString('index', '1')
                else reg.writeString('index', IntToStr(index_lang + 1));
            reg.CloseKey;
        end
    finally
        reg.Free;
    end;

    LoadCaption;}
end;

procedure TfmUoVidNRobit_Main.Action2Execute(Sender: TObject);
begin
    SelectLang;
end;

procedure TfmUoVidNRobit_Main.cxGrid_uo__sp_typeDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then ActionVibratExecute(Sender);

end;

procedure TfmUoVidNRobit_Main.DSAfterScroll(DataSet: TDataSet);
begin
    try cxMemo1.Text := 'Примітка: ' + DS.fbn('NOTE').asString except cxMemo1.Text := 'Примітка: '; end;

end;

end.
