unit UWspTypeViplatMain;

interface

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
  cxButtons;

type
  TfmUWspTypeViplatMain = class(TForm)
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
    DataSet_uo__sp_type: TpFIBDataSet;
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
    DataSource_prov_kod: TDataSource;
    DataSource_prov_npp: TDataSource;
    cxGrid_uo__sp_type: TcxGrid;
    cxGrid_uo__sp_typeDBTableView1: TcxGridDBTableView;
    cxGrid_uo__sp_typeLevel1: TcxGridLevel;
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
    DataSet_prov_kod: TpFIBDataSet;
    DataSet_prov_npp: TpFIBDataSet;
    Action2: TAction;
    frxReport1: TfrxReport;
    cxGrid_uo__sp_typeDBTableView1DBColumn1: TcxGridDBColumn;
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
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    index_lang : smallint;
  public
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;

  end;

procedure ShowAllUwBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports ShowAllUwBpl;

implementation

uses UWspTypeViplatAdd, UWResourcesUnit, Registry;

{$R *.dfm}

procedure ShowAllUwBpl(aOwner: TComponent; aParam : TAArray);
var
   T : TfmUWspTypeViplatMain;
begin
    T := TfmUWspTypeViplatMain.Create(aOwner, aParam);

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

constructor TfmUWspTypeViplatMain.Create(aOwner: TComponent;
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

        DataSet_uo__sp_type.Database       := DataBase_uo__sp_type;
        DataSet_uo__sp_type.Transaction    := TransactionRead_uo__sp_type;

        TransactionRead_uo__sp_type.StartTransaction;

        LoadCaption;
        DataSet_uo__sp_type.close;
        DataSet_uo__sp_type.Sqls.SelectSQL.Text := 'SELECT * FROM UW_SP_TYPE_VIPLAT_SEL';
        DataSet_uo__sp_type.Open;
    end
    else begin
        s := UWResourcesUnit.MY_BASE_HANDLE_ERROR[index_lang];
        ShowMessage(s);
    end;
end;


procedure TfmUWspTypeViplatMain.ActionADDExecute(Sender: TObject);
var
    T : TfmUWspTypeViplatAdd;
begin
    T := TfmUWspTypeViplatAdd.Create(Self, DataBase_uo__sp_type, 1, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmUWspTypeViplatMain.ActionObnovExecute(Sender: TObject);
var
    id : int64;
begin
    TRY ID := StrToInt64(DataSet_uo__sp_type.fbn('ID_SP_TYPE_VIPLAT').AsString); except id := -1; end;
    DataSet_uo__sp_type.CloseOpen(false);
    DataSet_uo__sp_type.Locate('ID_SP_TYPE_VIPLAT', id, []);
end;

procedure TfmUWspTypeViplatMain.ActionChangeExecute(Sender: TObject);
var
    T : TfmUWspTypeViplatAdd;
begin
    if DataSet_uo__sp_type.IsEmpty then exit;
    T := TfmUWspTypeViplatAdd.Create(Self, DataBase_uo__sp_type, 2, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmUWspTypeViplatMain.ActionDELExecute(Sender: TObject);
var
    id_del_l, id_del_t : int64;
    s1, s2 : string;
begin
    if not DataSet_uo__sp_type.IsEmpty then
    begin
        s1 := UWResourcesUnit.V2_TYPE_DELETE[index_lang];
        s2 := UWResourcesUnit.MY_CONST_MESSAGE_WARNING[index_lang];
        if MessageBox(Handle, Pchar(s1 + ' ' + DataSet_uo__sp_type.FieldByName('NAME_TYPE').AsString + '?'), Pchar(s2), MB_YESNO + MB_DEFBUTTON2)=mrYes then
        begin
            id_del_t           := StrToInt64(DataSet_uo__sp_type.FieldByName('ID_SP_TYPE_VIPLAT').AsString);
            cxGrid_uo__sp_typeDBTableView1.Controller.GoToPrev(false);
            id_del_l           := StrToInt64(DataSet_uo__sp_type.FieldByName('ID_SP_TYPE_VIPLAT').AsString);
            cxGrid_uo__sp_typeDBTableView1.Controller.GoToNext(false);
            St.Database        := DataBase_uo__sp_type;
            St.Transaction     := TransactionWrite_uo_sp_type;
            try
                TransactionWrite_uo_sp_type.StartTransaction;
                St.StoredProcName := 'UW_SP_TYPE_VIPLAT_DEL';
                St.ParamByName('ID_SP_TYPE_VIPLAT').AsInt64 := id_del_t;
                St.ExecProc;
                TransactionWrite_uo_sp_type.Commit;
            except on E:Exception do begin
                TransactionWrite_uo_sp_type.Rollback;
                ShowMessage(E.Message);
            end end;
            ActionObnovExecute(Sender);
            DataSet_uo__sp_type.Locate('ID_SP_TYPE_VIPLAT', id_del_l, []);
        end;
    end;
end;

procedure TfmUWspTypeViplatMain.ActionViewExecute(Sender: TObject);
var
    T : TfmUWspTypeViplatAdd;
begin
    if DataSet_uo__sp_type.IsEmpty then exit;
    T := TfmUWspTypeViplatAdd.Create(Self, DataBase_uo__sp_type, 3, Self);
    T.ShowModal;
    T.Free;
end;

procedure TfmUWspTypeViplatMain.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure TfmUWspTypeViplatMain.ActionVibratExecute(Sender: TObject);
begin
    if not DataSet_uo__sp_type.IsEmpty then
    begin
        if FormStyle = fsNormal then
        begin
//            FillArrayFromDataSet(ResultArray['OutPut'], DataSet_uo__sp_type);
            ResultArray['OutPut']['ID_SP_TYPE_VIPLAT'].AsInt64          := strToInt64(DataSet_uo__sp_type.fbn('ID_SP_TYPE_VIPLAT').AsString);
            ResultArray['OutPut']['NAME_TYPE'].AsString                 := DataSet_uo__sp_type.fbn('NAME_TYPE').AsString;
            Close;


            close;
        end
        else
            ModalResult := mrOk;
    end;
end;

procedure TfmUWspTypeViplatMain.cxGrid_uo__sp_typeDBTableView1DblClick(
  Sender: TObject);
begin
    if ActionVibrat.Visible then ActionVibratExecute(SENDER);
end;

procedure TfmUWspTypeViplatMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        ResultArray.Free;
        Action      := caFree;
    end;
end;

procedure TfmUWspTypeViplatMain.LoadCaption;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
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

    Caption                 := UWResourcesUnit.V2_TYPE_NAME_CAPTION[index_lang];
    ActionADD.Caption       := UWResourcesUnit.MY_CONST_ADD[index_lang];
    ActionChange.Caption    := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ActionDEL.Caption       := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ActionView.Caption      := UWResourcesUnit.MY_CONST_SHOW[index_lang];
    ActionObnov.Caption     := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ActionVibrat.Caption    := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    ActionOtmena.Caption    := UWResourcesUnit.MY_CONST_VIH[index_lang];

    ActionADD.Hint          := UWResourcesUnit.MY_CONST_ADD[index_lang];
    ActionChange.Hint       := UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    ActionDEL.Hint          := UWResourcesUnit.MY_CONST_DELETE[index_lang];
    ActionView.Hint         := UWResourcesUnit.MY_CONST_SHOW[index_lang];
    ActionObnov.Hint        := UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    ActionVibrat.Hint       := UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
    ActionOtmena.Hint       := UWResourcesUnit.MY_CONST_VIH[index_lang];

    ActionPrint.Caption     := UWResourcesUnit.MY_CONST_PRINT[index_lang];
    ActionPrint.Hint        := UWResourcesUnit.MY_CONST_PRINT[index_lang];

    cxGrid_uo__sp_typeDBTableView1DBColumn1.Caption := UWResourcesUnit.V2_TYPE_NAME_TYPE[index_lang];

    dxStatusBarSP.Panels[0].Text          := 'Ins - '   + UWResourcesUnit.MY_CONST_ADD[index_lang];
    dxStatusBarSP.Panels[1].Text          := 'F2 - '    + UWResourcesUnit.MY_CONST_UPDATE[index_lang];
    dxStatusBarSP.Panels[2].Text          := 'Del - '   + UWResourcesUnit.MY_CONST_DELETE[index_lang];
    dxStatusBarSP.Panels[3].Text          := 'F5 - '    + UWResourcesUnit.MY_CONST_REFRESH[index_lang];
    dxStatusBarSP.Panels[4].Text          := 'F3 - '    + UWResourcesUnit.MY_CONST_SHOW[index_lang];
    dxStatusBarSP.Panels[5].Text          := 'Enter - ' + UWResourcesUnit.MY_CONST_CHOOSE[index_lang];
//    dxStatusBarSP.Panels[6].Text          := 'Ctrl+F - Шв. пошук';

end;

procedure TfmUWspTypeViplatMain.ActionPrintExecute(Sender: TObject);
var
    Memo1, Memo6{, Memo7, Memo9, Memo8, Memo10}: TfrxMemoView;
begin
    if DataSet_uo__sp_type.IsEmpty then exit;
    Memo1 := frxReport1.FindObject('Memo1') as TfrxMemoView;
    Memo6 := frxReport1.FindObject('Memo6') as TfrxMemoView;
    Memo1.Text := 'Довідник типів виплат';
    Memo6.Text := 'Назва';
    frxReport1.ShowReport;
end;

procedure TfmUWspTypeViplatMain.cxTextEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        ActionVibratExecute(Sender);
    end;
end;

procedure TfmUWspTypeViplatMain.SelectLang;
var
    reg : TRegistry;
begin
    reg := TRegistry.Create;
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

    LoadCaption;
end;

procedure TfmUWspTypeViplatMain.Action2Execute(Sender: TObject);
begin
    SelectLang;
end;

procedure TfmUWspTypeViplatMain.cxGrid_uo__sp_typeDBTableView1KeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
    if key = vk_return then ActionVibratExecute(Sender);

end;

end.
