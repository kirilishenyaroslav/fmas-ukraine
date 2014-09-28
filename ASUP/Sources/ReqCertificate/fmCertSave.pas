unit fmCertSave;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, uCharControl, uFloatControl, uFControl, uLabeledFControl,
    uDateControl,cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
    StdCtrls, Buttons, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters,
    cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, DB,
    cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, cxButtons,
    cxImage, cxDBEdit, ExtCtrls, FIBDataSet, pFIBDataSet, cxCheckBox, IBase, AccMgmt,
    pFIBDatabase, IniFiles, FIBDatabase, ActnList, FIBQuery, pFIBQuery, UpKernelUnit,
  pFIBStoredProc, AppStruClasses,uCommonSp,DateUtils;

type
    TfrmCertSave = class(TForm)
        GenearlInfoGroupBox: TGroupBox;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label4: TLabel;
        Label5: TLabel;
        Label6: TLabel;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        Label7: TLabel;
        Label8: TLabel;
        Label9: TLabel;
        Label10: TLabel;
        cxDateEdit1: TcxDateEdit;
        cxDateEdit2: TcxDateEdit;
        Label11: TLabel;
        Label12: TLabel;
        FotoPanel: TPanel;
        FotoImage: TcxDBImage;
        SaveAsBtn: TcxButton;
        DSourceFoto: TDataSource;
        DSetFoto: TpFIBDataSet;
        FIBTrans: TpFIBTransaction;
        DBaseFoto: TpFIBDatabase;
        EditFamUkr: TcxTextEdit;
        EditImyaUkr: TcxTextEdit;
        EditOtchUkr: TcxTextEdit;
        EditFamRus: TcxTextEdit;
        EditImyaRus: TcxTextEdit;
        EditOtchRus: TcxTextEdit;
        EditPost: TcxTextEdit;
        EditDep: TcxTextEdit;
        EditShtrichKod: TcxTextEdit;
        EditNomerPosv: TcxTextEdit;
    ActionList1: TActionList;
    ActionExit: TAction;
    ActionOk: TAction;
    FIOUkr: TcxTextEdit;
    FIORus: TcxTextEdit;
    StProcFoto: TpFIBStoredProc;
    SaveDialog: TSaveDialog;
    FotoGrid: TcxGrid;
    FotoGridDBTableView1: TcxGridDBTableView;
    cmnID_FOTO: TcxGridDBColumn;
    cmnDATE_FOTO: TcxGridDBColumn;
    cmnACTUALWIDTH: TcxGridDBColumn;
    cmnACTUALHEIGHT: TcxGridDBColumn;
    FotoGridLevel1: TcxGridLevel;
        procedure SaveAsBtnClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
    procedure CopyFIOBtnClick(Sender: TObject);
    procedure CopyFioRusBtnClick(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure EditFamUkrClick(Sender: TObject);
    procedure EditImyaUkrClick(Sender: TObject);
    procedure EditOtchUkrClick(Sender: TObject);
    procedure FIOUkrClick(Sender: TObject);
    procedure EditFamRusClick(Sender: TObject);
    procedure EditImyaRusClick(Sender: TObject);
    procedure EditOtchRusClick(Sender: TObject);
    procedure FIORusClick(Sender: TObject);
    procedure EditPostClick(Sender: TObject);
    procedure EditDepClick(Sender: TObject);
    procedure cxDateEdit1Click(Sender: TObject);
    procedure cxDateEdit2Click(Sender: TObject);
    procedure EditShtrichKodClick(Sender: TObject);
    procedure EditNomerPosvClick(Sender: TObject);
    procedure EditFamUkrFocusChanged(Sender: TObject);
    procedure EditImyaUkrFocusChanged(Sender: TObject);
    procedure EditOtchUkrFocusChanged(Sender: TObject);
    procedure FIOUkrFocusChanged(Sender: TObject);
    procedure EditFamRusFocusChanged(Sender: TObject);
    procedure EditImyaRusFocusChanged(Sender: TObject);
    procedure EditOtchRusFocusChanged(Sender: TObject);
    procedure FIORusFocusChanged(Sender: TObject);
    procedure EditPostFocusChanged(Sender: TObject);
    procedure EditDepFocusChanged(Sender: TObject);
    procedure cxDateEdit1FocusChanged(Sender: TObject);
    procedure cxDateEdit2FocusChanged(Sender: TObject);
    procedure EditShtrichKodFocusChanged(Sender: TObject);
    procedure EditNomerPosvFocusChanged(Sender: TObject);
    private
        procedure InitFoto(AImageDB_Handle: TISC_DB_HANDLE);
        procedure RefreshFoto;
    public
        IdMan: Integer;
        FIO_Ukr: String;
        constructor Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; {AImageDB_Handle:TISC_DB_HANDLE;} AIdMan: Integer = -1); reintroduce;
    end;

var
    frmCertSave: TfrmCertSave;

implementation

{$R *.dfm}
uses fmReqCertificateUnit, Clipbrd, BaseTypes, fmHistSigns;

function GetImageDBHandle(MAIN_DB_HANDLE: TISC_DB_HANDLE): TISC_DB_HANDLE;
var
    CurrUserInfo: AccMgmt.TUserInfo;
    ResultInfo: AccMgmt.TResultInfo;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSet: TpFIBDataSet;
    pShowFoto: Variant;
    F: TIniFile;
    ImagePath: string;
begin
    CurrUserInfo := AccMgmt.fibGetCurrentUserInfo;
{ Первый шаг проверки - разрешено ли использование пакета фотографий,
  второй шаг - проверка на наличие базы, т.к. мало ли что можно отметить в таблице}
// Первый шаг

    Result := nil;
    DB := TpFIBDatabase.Create(nil);
    ReadTransaction := TpFIBTransaction.Create(nil);
    DSet := TpFIBDataSet.Create(nil);

    ReadTransaction.DefaultDatabase := DB;
    DB.DefaultTransaction := ReadTransaction;
    DSet.Database := DB;
    DSet.Transaction := ReadTransaction;

    DB.Handle := MAIN_DB_HANDLE;
    ReadTransaction.Active := True;
    DSet.SQLs.SelectSQL.Text := 'SELECT SHOW_FOTO FROM PUB_SYS_DATA';
    DSet.Open;
    pShowFoto := DSet['SHOW_FOTO'];

    ReadTransaction.Active := False;
    DSet.Free;
    ReadTransaction.Free;
    DB.Free;

    if pShowFoto <> 1 then Exit; // Не повезло.

// Второй шаг

// Проверяем на наличие базы по ее пути в config.ini
    F := TIniFile.Create(ExtractFileDir(Application.ExeName) + '\config.ini');
    try
        ImagePath := F.ReadString('IMAGE_CONNECTION', 'Path', '');
    finally;
        F.Free;
    end;

    if ImagePath = '' then Exit; // Не повезло.

// Пытаемся установить подключение
    ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
    if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка
        if ResultInfo.ErrorCode = -12 then
    {... т.е. если ошибка "Невірне ім'я або пароль"(а она появляется при повторной
    загрузке справочника физических лиц, то мы вызываем fibInitImageConnection
    снова и база, закрытая предыдущим вызовом, вновь открывается. Вот так вот,
    и не надо нигде запоминать хэндл базы.}
        begin
            ResultInfo := AccMgmt.fibInitImageConnection(CurrUserInfo.UserName, CurrUserInfo.Password);
            if ResultInfo.ErrorCode <> ACCMGMT_OK then // ошибка, мало ли чего...
                Result := nil
            else
                Result := ResultInfo.DBHandle;
        end
        else
            Result := nil
    else
        Result := ResultInfo.DBHandle;
end;


procedure TfrmCertSave.SaveAsBtnClick(Sender: TObject);
Var
    id_foto: Integer;
begin
   
    StProcFoto.StoredProcName:='FOTO_GET_BY_ID'; // Процедура вставки записи в таблицу
    StProcFoto.Transaction.StartTransaction;
    StProcFoto.Prepare;
    StProcFoto.ParamByName('IN_ID_FOTO').AsInteger:=DSetFoto.fbn('ID_FOTO').AsInteger;
    id_foto := DSetFoto.fbn('ID_FOTO').AsInteger;
    StProcFoto.ExecProc;                                // выполняем
  try

   with SaveDialog do
   begin
    FileName:=FIORus.Text;
    if not SaveDialog.Execute then Exit else
    begin
        StProcFoto.FieldByName('FOTO').SaveToFile(FileName);
        StProcFoto.Transaction.Commit;
    end;
   end;
   //if not SaveDialog.Execute then Exit;
  except
    on E:Exception do
    begin
      StProcFoto.Transaction.Rollback;
      agMessageDlg('Помилка',E.Message,mtError,[mbOK]);
    end;
  end;
  RefreshFoto;
  DSetFoto.Locate('ID_FOTO', id_foto, [])
end;

procedure TfrmCertSave.FormCreate(Sender: TObject);
//var pStylesDM:TStylesDM;
begin
//  pStylesDM:=TStylesDM.Create(Self);
//  FotoGridDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress;
    EditFamUkr.Text := '';
    EditImyaUkr.Text := '';
    EditOtchUkr.Text := '';
    EditFamRus.Text := '';
    EditImyaRus.Text := '';
    EditOtchRus.Text := '';
    EditPost.Text := '';
    EditDep.Text := '';
    EditShtrichKod.Text := '';
    EditNomerPosv.Text := '';
    FIOUkr.Text :='';
    FIORus.Text :='';
    if  DSetFoto.IsEmpty then  SaveAsBtn.Enabled:=false
    else SaveAsBtn.Enabled:=true;
end;

procedure TfrmCertSave.InitFoto(AImageDB_Handle: TISC_DB_HANDLE);
begin
    if AImageDB_Handle = nil then
    // не показываем панели с фотографиями, но и не выводим никакого сообщения
    begin
        FotoPanel.Hide;
        Width := Width - 160;
    end
    else
    // в случае, если все пучком, - подключаемся к базе
    begin
        DBaseFoto.Handle := AImageDB_Handle;
        FIBTrans.Active := True;
        if IdMan <> -1 then
        RefreshFoto;
    end;
end;

procedure TfrmCertSave.RefreshFoto;
begin
    if DSetFoto.Active then DSetFoto.Close;
    DSetFoto.SQLs.SelectSQL.Text := 'SELECT * FROM FOTO_ICON_GET_BY_ID_MAN('+IntToStr(IdMan)+') ORDER BY DATE_FOTO DESCENDING, ID_FOTO DESCENDING'; // Т.к. ID_FOTO присваивается по мере добавления в БД, следовательно, более поздние фото имеют больший ID
    DSetFoto.Open;
    DSetFoto.First;
end;

constructor TfrmCertSave.Create(AOwner: TComponent; ADB_Handle: TISC_DB_HANDLE; AIdMan: Integer = -1);
var
    AImageDB_Handle: TISC_DB_HANDLE;
begin
    inherited Create(AOwner);
    IdMan := AIdMan;
//******************************************************************************
    AImageDB_Handle := GetImageDBHandle(ADB_Handle);
    InitFoto(AImageDB_Handle);
 {   if not IsAccessGranted(SAP_Foto,cEdit) then
    begin
      AddFotoBtn.Enabled:=False;
      DelFotoBtn.Enabled:=False;
      if not IsAccessGranted(SAP_Foto,cView) then
        begin
          FotoPanel.Hide;
          Width:=Width-155;
        end;
    end;
    }
end;

function IsAccessGranted(AObjectName, AActionName: string): Boolean;
begin
    Result := False;
    if AccMgmt.fibCheckPermission(AObjectName, AActionName) = 0 then
        Result := True;
end;

procedure TfrmCertSave.CopyFIOBtnClick(Sender: TObject);
begin
  ClipBoard.AsText :=  EditFamUkr.Text+' '+EditImyaUkr.Text+' '+EditOtchUkr.Text;
end;

procedure TfrmCertSave.CopyFioRusBtnClick(Sender: TObject);
begin
  ClipBoard.AsText :=  EditFamRus.Text+' '+EditImyaRus.Text+' '+EditOtchRus.Text;
end;

procedure TfrmCertSave.ActionExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCertSave.ActionOkExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCertSave.EditFamUkrClick(Sender: TObject);
begin
    Clipboard.AsText:=EditFamUkr.Text;
end;

procedure TfrmCertSave.EditImyaUkrClick(Sender: TObject);
begin
    Clipboard.AsText:=EditImyaUkr.text;
end;

procedure TfrmCertSave.EditOtchUkrClick(Sender: TObject);
begin
    Clipboard.AsText:=EditOtchUkr.text;
end;

procedure TfrmCertSave.FIOUkrClick(Sender: TObject);
begin
    Clipboard.AsText:=FIOUkr.Text;
end;

procedure TfrmCertSave.EditFamRusClick(Sender: TObject);
begin
    Clipboard.AsText:=EditFamRus.Text;
end;

procedure TfrmCertSave.EditImyaRusClick(Sender: TObject);
begin
    Clipboard.AsText:=EditImyaRus.Text;
end;

procedure TfrmCertSave.EditOtchRusClick(Sender: TObject);
begin
    Clipboard.AsText:=EditOtchRus.Text;
end;

procedure TfrmCertSave.FIORusClick(Sender: TObject);
begin
    Clipboard.AsText:=FIORus.Text;
end;

procedure TfrmCertSave.EditPostClick(Sender: TObject);
begin
    Clipboard.AsText:=EditPost.Text;
end;

procedure TfrmCertSave.EditDepClick(Sender: TObject);
begin
    Clipboard.AsText:=EditDep.Text;
end;

procedure TfrmCertSave.cxDateEdit1Click(Sender: TObject);
begin
    Clipboard.AsText:=cxDateEdit1.Text;
end;

procedure TfrmCertSave.cxDateEdit2Click(Sender: TObject);
begin
    Clipboard.AsText:=cxDateEdit2.Text;
end;

procedure TfrmCertSave.EditShtrichKodClick(Sender: TObject);
begin
    Clipboard.AsText:=EditShtrichKod.Text;
end;

procedure TfrmCertSave.EditNomerPosvClick(Sender: TObject);
begin
    Clipboard.AsText:=EditNomerPosv.Text;
end;

procedure TfrmCertSave.EditFamUkrFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditFamUkr.Text;
end;

procedure TfrmCertSave.EditImyaUkrFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditImyaUkr.text;
end;

procedure TfrmCertSave.EditOtchUkrFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditOtchUkr.text;
end;

procedure TfrmCertSave.FIOUkrFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=FIOUkr.Text;
end;

procedure TfrmCertSave.EditFamRusFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditFamRus.Text;
end;

procedure TfrmCertSave.EditImyaRusFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditImyaRus.Text;
end;

procedure TfrmCertSave.EditOtchRusFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditOtchRus.Text;
end;

procedure TfrmCertSave.FIORusFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=FIORus.Text;
end;

procedure TfrmCertSave.EditPostFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditPost.Text;
end;

procedure TfrmCertSave.EditDepFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditDep.Text;
end;

procedure TfrmCertSave.cxDateEdit1FocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=cxDateEdit1.Text;
end;

procedure TfrmCertSave.cxDateEdit2FocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=cxDateEdit2.Text;
end;

procedure TfrmCertSave.EditShtrichKodFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditShtrichKod.Text;
end;

procedure TfrmCertSave.EditNomerPosvFocusChanged(Sender: TObject);
begin
    Clipboard.AsText:=EditNomerPosv.Text;
end;

end.

