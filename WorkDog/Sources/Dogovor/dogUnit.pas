//{$DEFINE TESTING}
unit DogUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, dogUtils, StdCtrls, LoadDogManedger, ComCtrls, Buttons,
  ToolWin, ImgList, IBase, SYS_OPTIONS, GlobalSPR, pFIBDataSet, DogLoaderUnit,
  AppEvnts, cxLookAndFeelPainters, ActiveX,cxButtons, SysAdmin, uCommonSP, dxBar, dxBarExtItems,
  MDIToolBar, Accmgmt, LoaderUnit,fib
  {$IFDEF TESTING}
  ,ShareMem, TCClient,Favour_Spr
  {$ENDIF};

type
  TMainForm = class(TForm)
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    mmLog: TMemo;
    SpeedButton2: TSpeedButton;
    ApplicationEvents1: TApplicationEvents;
    TestingLabel: TLabel;
    BarManager: TdxBarManager;
    dxBarSubItem1: TdxBarSubItem;
    miDog: TdxBarButton;
    miZayav: TdxBarButton;
    miPlat: TdxBarButton;
    miRee: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    miCust: TdxBarButton;
    miBank: TdxBarButton;
    miSprTypeDog: TdxBarButton;
    miSprGrpDoc: TdxBarButton;
    miSprBankRekv: TdxBarButton;
    dxBarButton10: TdxBarButton;
    miSprNDS: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton13: TdxBarButton;
    dxBarButton14: TdxBarButton;
    dxBarButton15: TdxBarButton;
    dxBarButton16: TdxBarButton;
    N6: TdxBarSubItem;
    dxBarSubItem4: TdxBarSubItem;
    miAdmin: TdxBarSubItem;
    dxBarButton17: TdxBarButton;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    dxBarButton21: TdxBarButton;
    ImageList2: TImageList;
    DogButton: TdxBarLargeButton;
    dxBarButton22: TdxBarButton;
    dxBarButton23: TdxBarButton;
    ZayavButton: TdxBarLargeButton;
    PlatButton: TdxBarLargeButton;
    ReeButton: TdxBarLargeButton;
    TipDogButton: TdxBarLargeButton;
    GroupDocButton: TdxBarLargeButton;
    NativeAccButton: TdxBarLargeButton;
    NdsButton: TdxBarLargeButton;
    CustButton: TdxBarLargeButton;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    Button2: TButton;
    Button1: TButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarSubItem3: TdxBarSubItem;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton9: TdxBarButton;
    dxBarButton11: TdxBarButton;
    FilterDogUrFinButton: TdxBarButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure miSprTypeDogClick(Sender: TObject);
    procedure miSprGrpDocClick(Sender: TObject);
    procedure miSprBankRekvClick(Sender: TObject);
    procedure miSprNDSClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miDogClick(Sender: TObject);
    procedure miZayavClick(Sender: TObject);
    procedure miPlatClick(Sender: TObject);
    procedure CustButtonClick(Sender: TObject);
    procedure miReeClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure miCustClick(Sender: TObject);
    procedure miBankClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ArndClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ToolBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure N7Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure iiii1Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure dxBarButton1Click(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure dxBarButton22Click(Sender: TObject);
    procedure dxBarButton3Click(Sender: TObject);
    procedure dxBarButton4Click(Sender: TObject);
    procedure dxBarButton5Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure dxBarButton9Click(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FilterDogUrFinButtonClick(Sender: TObject);
  public
    isServerApp : Boolean; //Приложение являеться сервером по отношению к др.(т.е. оно посылает сигнал всем)
    nolock      : Boolean;
    zayav_id_session : Int64;
///    TaskBar : TdsTaskBar;
//   procedure LogException(ExceptObj: TObject; ExceptAddr: Pointer; IsOS: Boolean);
  end;

var
  MainForm: TMainForm;
  hwn : THandle;
  AccResult : TResultInfo;

implementation
uses DataModule, LoadingUnit, LangUnit, FIBDatabase, Clipbrd, adminUnit, uSysL,
 dogNewsUnit, AArray, fpop_PackageLoader;

{$R *.dfm}

function GetVersion: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
 Query : TpFIBDataSet;
 mi: TdxBarButton;
 BeingAGroup : boolean;
 gr : TdxBarGroup;
begin
  {$IFDEF TESTING}
    TestingLabel.Visible := true;
  {$ENDIF}
//   JclAddExceptNotifier(LogException);
 if isSuperAdmin then miAdmin.Visible := ivAlways else miAdmin.Visible := ivNever;
 LangPackApply(Self);

// dm.Database.ConnectParams.UserName := dogUtils.DB_USER;
// dm.Database.ConnectParams.Password := dogUtils.DB_PASS;
// dm.Database.DatabaseName := dogUtils.DATABASE_PATH;
 dm.Database.Handle := accResult.DBHandle;
 dm.Database.Connected := true;
 dm.ReadTransaction.StartTransaction;
// CheckLic(dm.Database.Handle);
 LoadSysData(dm.ReadTransaction);
 if sys_is_dnepr then dxBarButton5.Visible := ivAlways;
 if sys_is_dnepr then dxBarButton6.Visible := ivAlways;
 if not SYS_IS_DONNU then
 begin
   dxBarButton3.Visible := ivNever;
   dxBarButton4.Visible := ivNever;
 end;

 Caption := Caption + ' - ' + SYS_NAME_CUSTOMER_NATIVE;
// FillBufferTable(dm.WriteTransaction, dm.Database);
// sys_ReadOptions(Self, dm.ReadTransaction);
 StatusBar1.Panels[2].Text := StatusBar1.Panels[2].Text + ' ' + DATABASE_PATH;
 StatusBar1.Panels[0].Text := StatusBar1.Panels[0].Text + ' ' + GetVersion;
// StatusBar1.Panels[0].Text := StatusBar1.Panels[0].Text + ' ' + DateToStr(FileDateToDateTime(FileAge(Application.ExeName)));

 Query := TpFIBDataSet.Create(Self);
 Query.Transaction := dm.ReadTransaction;
{ Query.SelectSQL.Text := 'SELECT  p.FAMILIA || '' '' || p.IMYA || '' '' || p.OTCHESTVO as FIO ' +
                               'from    people p, private_cards pc ' +
                               'where   p.id_man = pc.id_man and ' +
                               'pc.id_pcard = ' + IntToStr(CurrentID_PCARD);
 Query.Open;
 if Query.IsEmpty = False then FIO := Query['FIO'];}
 StatusBar1.Panels[1].Text := 'Користувач: ' + GetUserFIO;
// if isAdmin then StatusBar1.Panels[1].Text := 'Користувач: *** АДМІНІСТРАТОР ***';
 StatusBar1.Panels[1].Width := StatusBar1.Canvas.TextWidth(StatusBar1.Panels[1].Text) + 18;

 n6.Visible := ivNever;
 // Загрузка меню аренда -------------------------------------------------------
 try
 Query.Close;
 Query.SelectSQL.Text := 'select * from DOG_ARND_MENU';
 Query.Open;
 BeingAGroup := false;
 while not Query.Eof do begin
  if Query['Name_menu'] <> '-' then
  begin
   n6.Visible := ivAlways;
    mi := TdxBarButton.Create(Self);
{    with mi.BarManager.MainMenuBar.ItemLinks.Add do
    begin
     Assign(mi.links.
     BeginGroup := BeingAGroup;
    end;}
  //  mi.PaintStyle := psCaption;
    mi.Caption := Query['Name_menu'];
    mi.Tag := Query['dog_group'];
    mi.HelpContext := Query['menu_type'];
    mi.OnClick := ArndClick;
    mi.ImageIndex := 8;
    with n6.ItemLinks.Add do
    begin
       Item := mi;
       BeginGroup := BeingAGroup;

    end;
  //  N6.Add(mi);
  end else BeingAGroup := true;
  Query.Next;
 end;
  Query.Close;
  Query.Free;
 except
  ShowMessage('Не наидена информация меню "Аренда"');
 end;

 // Получаем идентификатор сессии для заявок
 dm.pFIBStoredProc1.Transaction.StartTransaction;
 dm.pFIBStoredProc1.ExecProcedure('PROC_DOG_DT_DOC_ZAYAV_GET_SES');
 zayav_id_session := dm.pFIBStoredProc1['ID_SESSION'].AsInt64;
 dm.pFIBStoredProc1.Transaction.Commit;
 dm.pFIBStoredProc1.Close;

 // ----------------------------------------------------------------------------
 miSprBankRekv.Caption := miSprBankRekv.Caption + SYS_NAME_CUSTOMER_NATIVE;
 NativeAccButton.Hint  := miSprBankRekv.Caption;
 if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Belong') = 0 then DogButton.Visible := ivAlways else DogButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Belong') = 0 then ZayavButton.Visible := ivAlways else ZayavButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Belong') = 0 then PlatButton.Visible := ivAlways else PlatButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/REE','Belong') = 0 then ReeButton.Visible := ivAlways else ReeButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUSTOMERS','Belong') = 0 then CustButton.Visible := ivAlways else CustButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/DOGOVOR','Belong') = 0 then miDog.Visible := ivAlways else miDog.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/ZAYAV','Belong') = 0 then miZayav.Visible := ivAlways else miZayav.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/PLAT','Belong') = 0 then miPlat.Visible := ivAlways else miPlat.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/REE','Belong') = 0 then miRee.Visible := ivAlways else miRee.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/CUSTOMERS','Belong') = 0 then miCust.Visible := ivAlways else miCust.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/BANKS','Belong') = 0 then miBank.Visible := ivAlways else miBank.Visible := ivNever;

 if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Belong') = 0 then TipDogButton.Visible := ivAlways else TipDogButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/NATIVE_ACCOUNT','Belong') = 0 then NativeAccButton.Visible := ivAlways else NativeAccButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Belong') = 0 then GroupDocButton.Visible := ivAlways else GroupDocButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/NDS','Belong') = 0 then NdsButton.Visible := ivAlways else NdsButton.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/TIP_DOGOVOR','Belong') = 0 then miSprTypeDog.Visible := ivAlways else miSprTypeDog.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/NATIVE_ACCOUNT','Belong') = 0 then miSprBankRekv.Visible := ivAlways else miSprBankRekv.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/GROUP_DOG','Belong') = 0 then miSprGrpDoc.Visible := ivAlways else miSprGrpDoc.Visible := ivNever;
 if fibCheckPermission('/ROOT/DOG/SPRAV/NDS','Belong') = 0 then miSprNDS.Visible := ivAlways else miSprNDS.Visible := ivNever;

 if fibCheckPermission('/ROOT/DOG/DOG_FILTR_UR_FN','Belong') = 0 then FilterDogUrFinButton.Visible := ivAlways else FilterDogUrFinButton.Visible := ivNever;
// if fibCheckPermission('/ROOT/DOG/SPR_FAV','Belong') = 0 then dxBarButton9.Visible := ivAlways else dxBarButton9.Visible := ivNever;


{ TaskBar := TdsTaskBar.Create(Self);
 TaskBar.Parent := Self;
 TaskBar.Align := alBottom;
 TaskBar.Height := 20;
 TaskBar.AutoCreateButtons := true;
 TaskBar.Flat := true;
 TaskBar.BevelInner := bvNone;
 TaskBar.BevelOuter := bvLowered;}
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
 FinalizeAdminSystem;
 if dm.ReadTransaction.active then dm.ReadTransaction.Commit;
 dm.Database.Connected := false;
 CloseConnection;
end;

procedure TMainForm.miSprTypeDogClick(Sender: TObject);
begin
 LoadDogManedger.WorkTypeDogSPR(Self, dm.Database.Handle, fsMDIChild, 'spr', Nil, 1, Nil);
end;

procedure TMainForm.miSprGrpDocClick(Sender: TObject);
begin
 LoadDogManedger.WorkGroupDoc(Self, dm.Database.Handle, fsMDIChild, 'spr');
end;

procedure TMainForm.miSprBankRekvClick(Sender: TObject);
begin
 LoadDogManedger.WorkSpMfoRsch(Self, dm.Database.Handle, fsMDIChild,'spr', -1);
end;

procedure TMainForm.miSprNDSClick(Sender: TObject);
begin
 LoadDogManedger.WorkNdsProcent(Self, dm.Database.Handle, fsMDIChild);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 if MessageDlg('Увага', 'Ви дійсно бажаєте вийти?', mtConfirmation, [mbYes, mbNo]) = mrNo then CanClose := false;
end;

procedure TMainForm.miDogClick(Sender: TObject);
var
 input : TDogInput;
 res   : TDogResult;
begin
 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := dm.Database.Handle;
 input.ReadTrans    := dm.ReadTransaction.Handle;
 input.WriteTrans   := dm.WriteTransaction.Handle;
 input.id_Group_add := SYS_ID_GROUP_DOG;
 input.id_Group     := SYS_ID_GROUP_DOG_VIEW;
 input.Filter.bUseFilter := True;
 input.Filter.bDate := True;
 res := ShowDogMain(input);
 hwn := res.handle;
end;

procedure TMainForm.miZayavClick(Sender: TObject);
var
 input : DogLoaderUnit.TDogInput;
 res   : TDogResult;
begin
 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := dm.Database.Handle;
 input.ReadTrans    := dm.ReadTransaction.Handle;
 input.WriteTrans   := dm.WriteTransaction.Handle;
 input.id_Group_add := SYS_ID_GROUP_ZAYAV;
 input.id_Group     := SYS_ID_GROUP_ZAYAV_VIEW;
 input.isZayav      := true;
 input.Values       := DogLoaderUnit.TSpravParams.Create;
 input.Values['ZAYAV_ID_SESSION'] := zayav_id_session;
 res := ShowDogMain(input);
end;

procedure TMainForm.miPlatClick(Sender: TObject);
begin
 hwn := ShowPlat(Self, dm.Database.Handle, dm.ReadTransaction.Handle, dm.WriteTransaction.Handle, fsMDIChild);
end;

procedure TMainForm.CustButtonClick(Sender: TObject);
var
  Res : Variant;
begin
  Res := ShowCustomers(Self, dm.Database.Handle, fsMDIChild, now, csmNone, -1, -1);
end;

procedure TMainForm.miReeClick(Sender: TObject);
begin
 hwn := ShowRee(Self, dm.Database.Handle, dm.ReadTransaction.Handle, dm.WriteTransaction.Handle, fsMDIChild, Nil, Nil);
end;

procedure TMainForm.N3Click(Sender: TObject);
begin
 Close;
end;

procedure TMainForm.N5Click(Sender: TObject);
begin
 LoadingForm := TLoadingForm.Create(Self);
 if LoadingForm.ShowModal <> mrOk then begin
  LoadingForm.Free;
  exit;
 end;
 LoadingForm.Free;
end;

procedure TMainForm.miCustClick(Sender: TObject);
begin
 CustButtonClick(Self);
end;

procedure TMainForm.miBankClick(Sender: TObject);
begin
 GlobalSPR.GetBanks(self, dm.Database.Handle,fsmdichild , now);
end;


(*
procedure TMainForm.LogException(ExceptObj: TObject; ExceptAddr: Pointer; IsOS: Boolean);
var
  TmpS: string;
  ModInfo: TJclLocationInfo;
  I: Integer;
  ExceptionHandled: Boolean;
  HandlerLocation: Pointer;
  ExceptFrame: TJclExceptFrame;
begin
  TmpS := 'Исключение ' + ExceptObj.ClassName;
  if ExceptObj is Exception then
    TmpS := TmpS + ': ' + Exception(ExceptObj).Message;
  if IsOS then
    TmpS := TmpS + ' (Исключение OS)';
  mmLog.Lines.Add(TmpS);
  ModInfo := GetLocationInfo(ExceptAddr);
  mmLog.Lines.Add(Format(
    '  Исключение возникло по адресу $%p (Модуль "%s", Процкдура "%s", Юнит "%s", Строка %d)',
    [ModInfo.Address,
     ModInfo.UnitName,
     ModInfo.ProcedureName,
     ModInfo.SourceName,
     ModInfo.LineNumber]));
     JclStackTrackingOptions  := JclStackTrackingOptions + [stExceptFrame];
  if stExceptFrame in JclStackTrackingOptions then
  begin
    mmLog.Lines.Add('  Дамп:');
    I := 0;
    ExceptionHandled := False;
    while (not ExceptionHandled) and
      (I < JclLastExceptFrameList.Count) do
    begin
      ExceptFrame := JclLastExceptFrameList.Items[I];
      ExceptionHandled := ExceptFrame.HandlerInfo(ExceptObj, HandlerLocation);
      if (ExceptFrame.FrameKind = efkFinally) or
          (ExceptFrame.FrameKind = efkUnknown) or
          not ExceptionHandled then
        HandlerLocation := ExceptFrame.CodeLocation;
      ModInfo := GetLocationInfo(HandlerLocation);
{      if ModInfo.LineNumber = 0 then begin
       inc(i);
       continue;
      end;} 
      TmpS := Format(
        '    По адресу $%p (type: %s',
        [ExceptFrame.ExcFrame,
         GetEnumName(TypeInfo(TExceptFrameKind), Ord(ExceptFrame.FrameKind))]);
      if ExceptionHandled then
        TmpS := TmpS + ', не обработанное исключение)'
      else
        TmpS := TmpS + ')';
      mmLog.Lines.Add(TmpS);
      if ExceptionHandled then
        mmLog.Lines.Add(Format(
          '      Обработчик по адресу $%p',
          [HandlerLocation]))
      else
        mmLog.Lines.Add(Format(
          '      Код по адресу $%p',
          [HandlerLocation]));
      mmLog.Lines.Add(Format(
        '      Модуль "%s", Процедура "%s", Юнит "%s", Строка %d',
        [ModInfo.UnitName,
         ModInfo.ProcedureName,
         ModInfo.SourceName,
         ModInfo.LineNumber]));
      Inc(I);
    end;
  end;
  mmLog.Lines.Add('');
  ShowMessage(mmLog.Text);
end;

initialization

  JclStackTrackingOptions := JclStackTrackingOptions + [stExceptFrame];
  JclStartExceptionTracking;
 *)

procedure TMainForm.N11Click(Sender: TObject);
begin
 Self.Cascade;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
 Self.TileMode := tbHorizontal;
 Self.Tile;
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
 Self.TileMode := tbVertical;
 Self.Tile;
end;

procedure TMainForm.N13Click(Sender: TObject);
begin
 if Self.MDIChildCount = 0 then exit;
 Self.ActiveMDIChild.WindowState := wsMaximized;
end;

procedure TMainForm.N15Click(Sender: TObject);
var
 i : integer;
begin
 for i:= 0 to MdiChildCount - 1 do MDIChildren[i].Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
 i : integer;
begin
 {$IFDEF TESTING}
 TCClient.RemoveClient;
 {$ENDIF}
 for i := 0 to Application.MainForm.MDIChildCount - 1 do begin
  Application.MainForm.MDIChildren[0].Close;
  Application.MainForm.MDIChildren[0].Free;
 end;
end;


procedure TMainForm.Button1Click(Sender: TObject);
var
// p, f : Currency;
// cust : TImportCustomer;
 ra : TImportCustRateAcc;
 bank : TImportBank;
 i, o : DogLoaderUnit.TSpravParams;
 i1, i2 : Integer;
 cust : TImportCustomer;
 input_1 : TDogInput;
begin
  decimalseparator     := ',';
  input_1              := SYS_DEFAULT_DOG_INPUT;
  input_1.Owner        := Self;
        input_1.DBHandle     := dm.Database.Handle;
        input_1.ReadTrans    := dm.Database.DefaultTransaction.Handle;
        input_1.WriteTrans   := dm.WriteTransaction.Handle
        ;
        input_1.FormStyle    := fsNormal;
        input_1.id_Group     :=699;
        input_1.id_Group_add := 1499;
//        input_1.Summa        := summa_dog;
        input_1.filter.bShowFilterForm := true;
        input_1.isZayav     := false;
{        input_1.arndGetPay  := 1;
        input_1.shablon_data.bUse     := true;
        input_1.shablon_data.num      := cxTextEditNum.Text;
        input_1.shablon_data.date_dog := cxDateEdit2.Date;
        input_1.shablon_data.note     := cxMemo1.Text;
        input_1.shablon_data.summa    := StrToCurr(cxTextEditSumma.Text);
        input_1.shablon_data.id_rate_account    := myform.id_account_customer;
        input_1.shablon_data.id_rate_acc_native := myform.id_ras;
        input_1.filter.SummaFrom      := StrToCurr(cxTextEditSumma.Text);
        input_1.filter.SummaTo        := StrToCurr(cxTextEditSumma.Text);
        input_1.filter.bSumma         := true;
        input_1.filter.NameCust       := myform.name_cust;
        input_1.filter.bNameCust      := true;
        input_1.filter.id_cust        := myform.id_customer;
        input_1.filter.bID_Cust       := true;
        input_1.DateSys               := cxDateEdit2.Date;
        input_1.DateDoc               := cxDateEdit2.Date;
        SYS_CURRENT_DATE      := cxDateEdit2.Date;}










        SYS_ID_USER          := 448;
        decimalseparator     := ',';
        input_1              := SYS_DEFAULT_DOG_INPUT;
        input_1.DBHandle     := dm.Database.Handle;
        input_1.ReadTrans    := dm.Database.DefaultTransaction.Handle;
        input_1.WriteTrans   := dm.WriteTransaction.Handle;
        input_1.FormStyle    := fsNormal;
//        DataSet.Close;
//        DataSet.SQLs.SelectSQL.Text := 'select * from BANK_INI';
//        DataSet.Open;
        input_1.id_Group_add := 1499;
        input_1.id_Group     :=699;
//        DataSet.Close;
        input_1.Summa        := 3000;
        input_1.filter.bShowFilterForm := true;
        input_1.isZayav     := false;
        input_1.arndGetPay  := 1;
        input_1.shablon_data.bUse     := true;
        input_1.shablon_data.num      := '18317';
        input_1.shablon_data.date_dog := StrToDate('14.03.2008');
        input_1.shablon_data.note     := 'sdfgxtgfg';
        input_1.shablon_data.summa    := 3000;
        input_1.shablon_data.id_rate_account    := 824499;
        input_1.shablon_data.id_rate_acc_native := 1056199;
        input_1.filter.SummaFrom      := 3000;
        input_1.filter.SummaTo        := 3000;
        input_1.filter.bSumma         := true;
        input_1.filter.NameCust       := 'ВОРОШИЛОВСКОЕ ОСБ № 0025';
        input_1.filter.bNameCust      := true;
        input_1.filter.id_cust        := 446799;
        input_1.filter.bID_Cust       := true;
        input_1.DateSys               := StrToDate('14.03.2008');
        input_1.DateDoc               :=StrToDate('14.03.2008');
        SYS_CURRENT_DATE      := StrToDate('14.03.2008');


        ShowDogMain(input_1);
//        if res.ModalResult = 1 then
end;

procedure TMainForm.cxButton1Click(Sender: TObject);
var
 input : TDogInput;
 res   : TDogResult;
 inp, DbDogInfo : Tspravparams;
 i : Integer;
 s : string;
begin
{                inp:=TSpravParams.Create;
                DbDogInfo:=TSpravParams.Create;
                inp['Database']:=Integer(dm.Database.Handle);
                inp['ReadTransaction']:=Integer(dm.ReadTransaction.Handle);
                inp['ID_DOG']   := 1220050830214976;
                inp['KOD_DOG']  := 23499;

                try
                      GetDogovorInfo(self,@inp,@DbDogInfo);
                except on E:Exception do
                          begin
                                ShowMessage('Ошибка при работе с информацией по договорам.');
                          end;
                end;
                ShowSpravParams(Self, DbDogInfo);}
{ input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := dm.Database.Handle;
 input.ReadTrans    := dm.ReadTransaction.Handle;
 input.WriteTrans   := dm.WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group_add := 799;
 input.id_Group     := 799;
 input.isZayav      := false;

 input.summa := 100;
 input.filter.bShowFilterForm := false;
 input.Filter.bRegNum := True;
 input.Filter.RegNum := '2/88-05';
 input.Filter.bUseFilter := True; }

 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := dm.Database.Handle;
 input.ReadTrans    := dm.ReadTransaction.Handle;
 input.WriteTrans   := dm.WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group_add := 2499;
 input.id_Group     := 2399;
 input.Summa        := 12864;
 input.isZayav      := false;
 with input.filter do begin
   bUseFilter      := false;
   bShowFilterForm := False;
   bSumma          := False;
   ShowClosed      := 1;
   bNameCust := false;
   bRegNum := True;
   RegNum := '1264/31-05';
 end;
 input.Filter.bUseFilter := True;
 input.Filter.bDate := True;

 res := ShowDogMain(input);
 s := '';
 s := s + 'ID_DOG = ' + IntToStr(res.id_dog) + ', KOD_DOG = ' + IntToStr(res.kod_dog) + #10 + #13;
 s := s + 'Присланная сумма = ' + FormatFloat('0.00', input.summa) +  #10 + #13;
 s := s + 'Договор №' + res.regest_num + ' от ' + DateToStr(res.d_dog) + ' на сумму ' + FormatFloat('0.00', res.summa) + #10 + #13;
 s := s + 'Сметы: ' + #10 + #13;
 for i := 0 to Length(res.Smets) - 1 do
 begin
   s := s + IntToStr(res.Smets[i].NumSmeta) + ' ' + IntToStr(res.Smets[i].NumRazd) + ' ' + IntToStr(res.Smets[i].NumStat) + ' ' + IntToStr(res.Smets[i].NumKekv) + '. Сумма : ' + FormatFloat('0.00', res.Smets[i].Summa) + '. Разбивка: ' + FormatFloat('0.00', res.Smets[i].NSumma) + #10 + #13;
 end;
 ShowMessage(s);
// ShowMessage(IntToStr(res.id_dog));
 hwn := res.handle;
end;

procedure TMainForm.ArndClick(Sender: TObject);
var
  input : TDogInput;
  res   : TDogResult;
begin
  if TdxBarButton(Sender).HelpContext = 1 then
    LoadDogManedger.ShowArndSch(Self, DM.Database.Handle, DM.ReadTransaction.Handle, DM.WriteTransaction.Handle, ARND_SCH_TYPE_MDI_CHILD, (Sender as TdxBarButton).Tag, -1)
  else
  begin
    input              := SYS_DEFAULT_DOG_INPUT;
    input.Owner        := Self;
    input.DBHandle     := dm.Database.Handle;
    input.ReadTrans    := dm.ReadTransaction.Handle;
    input.WriteTrans   := dm.WriteTransaction.Handle;
    input.FormStyle    := fsMDIChild;
    input.id_Group_add := (Sender as TdxBarButton).Tag;
    input.id_Group     := (Sender as TdxBarButton).Tag;
    res := ShowDogMain(input);
  end
end;

procedure TMainForm.FormShow(Sender: TObject);
var
 i : Integer;
 p : TMDITool;
begin
 p := TMDITool.Create;
 p.AddMDIToolBar(Self);

 InitializaAdminSystem(Self, dm.Database.Handle, 1, SYS_ID_USER, isSuperAdmin);

//  RegisterEventHandler(Self, dm.Database, dm.ReadTransaction, dm.WriteTransaction, 1, SYS_ID_USER);
{  if SYS_DOG_DISABLED and (not nolock) then
  begin
    frmDisabled := TfrmDisabled.Create(MainForm);
    frmDisabled.Show;
    for i := 0 to Screen.FormCount - 1 do Screen.Forms[i].Enabled := False;
    frmDisabled.Enabled := True;
    MainForm.Enabled := False;
  end;}
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
// if SYS_DOG_DISABLED then if Assigned(frmDisabled) then SetForegroundWindow(frmDisabled.Handle);
end;

procedure TMainForm.ToolBar1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
{ if (ssAlt in Shift) and (ssShift in shift) and (ssCtrl in Shift) and
 (Button = mbRight) then
 begin
   miAdmin.Visible := not miAdmin.Visible;
   cxButton1.Visible := not cxButton1.Visible;
   Button1.Visible := not Button1.Visible;
 end;}
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
 AdminShowUsers(Self);
end;

procedure TMainForm.N17Click(Sender: TObject);
begin
 AdminShowErrors(Self);
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
 i, o : TAArray;
 idx : integer;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['Database'].AsObject := dm.Database;
  i['Transaction'].AsObject := dm.WriteTransaction;
//  i['id_dog'].AsInt64 := 30375315799;
  i['d_id_tip_dog'].AsInt64 := 141599;
  i['d_d_dog'].AsVariant := Date;
  i['d_id_rate_account'].AsInt64 := 1243099;
  i['d_id_customer'].AsInt64 := 288799;
  i['d_name_customer'].AsString := 'ЫЫЫ ТЕСТ2';
  i['d_id_user'].AsInt64 := SYS_ID_USER;

  i['SMET']['COUNT'].AsInteger := 1;
  idx := 0;
  i['SMET'][idx]['d_id_smeta'].AsInt64 := 110799;
  i['SMET'][idx]['d_id_stat'].AsInt64 := 106399;
  i['SMET'][idx]['d_razd'].AsInt64 := 1139;
  i['SMET'][idx]['d_summa_sm'].AsCurrency := 666;
  i['SMET'][idx]['d_id_people'].AsInt64 := -1;
  i['SMET'][idx]['d_id_kekv'].AsInt64 := 114199;



  dog_add_dogovor_ext(i, o);
//  dog_close_dogovor_ext(i, o);
  if o['Result'].AsVariant = false then
  begin
    ShowMessage(o['Message'].AsString);
  end else ShowMessage('ВЫполнено успешно');
end;

procedure TMainForm.N18Click(Sender: TObject);
var
 af : TadminForm;
begin
 af := TadminForm.Create(Self);
 af.ShowModal;
 af.Free;
end;

procedure TMainForm.N19Click(Sender: TObject);
begin
  LoadDogManedger.BankBuffer(Self, dm.Database.Handle,dm.ReadTransaction.Handle,dm.WriteTransaction.Handle);
end;

procedure TMainForm.iiii1Click(Sender: TObject);
var
    sp: TSprav;
begin
    sp := GetSprav('SpDepartment');
    if sp <> nil then
    begin
        with sp.Input do
        begin
            Append;

            FieldValues['DBHandle'] := Integer(dm.Database.Handle);

            FieldValues['ShowStyle'] := 1;

            FieldValues['Select'] := 0;

            FieldValues['AllowEdit'] := True;
            Post;
        end;
    end;

    sp.Show;
end;


procedure TMainForm.N21Click(Sender: TObject);
var
 i, o : DogLoaderUnit.TSpravParams;
begin
 i := DogLoaderUnit.TSpravParams.Create;
 o := DogLoaderUnit.TSpravParams.Create;
 i.Values['DataBase'] := Integer(dm.Database.Handle);
 i.Values['ReadTransaction'] := Integer(dm.ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer(dm.WriteTransaction.Handle);
 i.Values['FormStyle'] := fsMDIChild;
 dogloaderunit.LoadSprav('Workdog\sp_object.bpl', Self, i, o);
// i.Free;
// o.Free;
end;

procedure TMainForm.N22Click(Sender: TObject);
var
 i, o : TSpravParams;
begin
{ i := TSpravParams.Create;
 o := TSpravParams.Create;
 i.Values['DataBase'] := Integer(dm.Database.Handle);
 i.Values['ReadTransaction'] := Integer(dm.ReadTransaction.Handle);
 i.Values['WriteTransaction'] := Integer(dm.WriteTransaction.Handle);
 i.Values['FormStyle'] := fsMDIChild;
 dogloaderunit.LoadSprav('Workdog\sp_product.bpl', Self, i, o);}
 Show_sp_Product(Self, dm.DataBase.Handle, dm.ReadTransaction.Handle, fsMDIChild);
end;


procedure TMainForm.N23Click(Sender: TObject);
begin
 ShowRep(Self, dm.Database.Handle, dm.ReadTransaction.Handle, dm.WriteTransaction.Handle, fsMDIChild);
end;

procedure TMainForm.btn1Click(Sender: TObject);
var
 c : TImportCustRateAcc;
begin
 c.id_customer := 743999;
 c.rate_account := '26005457400200';
 c.id_bank := 160499;
 c.date_beg := StrToDate('02.01.2004');
 c.date_end := StrToDate('06.12.2005');
 c.bShowInfo := true;
 c.id_type_account := 31399;
 ImportCustRateAcc(c, Self, dm.Database.Handle, dm.WriteTransaction.Handle);
end;


procedure TMainForm.N24Click(Sender: TObject);
begin
 LoadDogManedger.BankBuffer(Self, dm.Database.Handle,dm.ReadTransaction.Handle,dm.WriteTransaction.Handle);
end;

procedure TMainForm.dxBarButton1Click(Sender: TObject);
var
 news : TdogNewsForm;
begin
 CoInitialize(nil);
 news := TdogNewsForm.Create(Self);
 news.ShowModal;
 news.Free;
end;

procedure TMainForm.dxBarButton2Click(Sender: TObject);
begin
 LoadDogManedger.ReeUrzb(Self, dm.Database.Handle,dm.ReadTransaction.Handle,dm.WriteTransaction.Handle);
end;

procedure TMainForm.StatusBar1Click(Sender: TObject);

  var
    i, o : TSpravParams;
  begin
    i := TSpravParams.Create;
    o := TSpravParams.Create;
    i['DataBase']     := Integer(dm.Database.Handle);
    i['FormStyle']    := fsNormal;
    i['bMultiSelect'] := false;
    i['id_session']   := -1;
    i['SelectMode']   := selRateAccount;
    i['Show_all']   := 1;
    LoadSprav('Customer\CustPackage.bpl', Self, i, o);
    if o['ModalResult'] = mrOk then
    begin
    end;
    i.Free;
    o.Free;
  end;

procedure TMainForm.dxBarButton22Click(Sender: TObject);
var
 i, o : TAArray;
 b : TImportBank;
 input : TDogInput;
 res   : TDogResult;
begin
 input              := SYS_DEFAULT_DOG_INPUT;
 input.Owner        := Self;
 input.DBHandle     := dm.Database.Handle;
 input.ReadTrans    := dm.ReadTransaction.Handle;
 input.WriteTrans   := dm.WriteTransaction.Handle;
 input.FormStyle    := fsNormal;
 input.id_Group_add := 399;
 input.id_Group     := 499;
 input.isZayav      := false;
 res := ShowDogMain(input);
 ShowMessage(IntToStr(res.id_dog));
 { b.id_bank := 0;
 b.mfo := '377023';
 b.name := 'ДОНЕЦЬКА ФАБ"ФАКТОРIАЛ-БАНК",М.ДОНЕЦЬК';
 b.city := '';
 b.bShowInfo := true;
 ImportBank(b, Self, dm.Database.Handle, dm.WriteTransaction.Handle);}
{ i := TAArray.Create;
 o := TAArray.Create;
 ShowRee(Self, dm.Database.Handle, dm.ReadTransaction.Handle, dm.WriteTransaction.Handle, fsNormal, i, o);
 ShowMessage(o['ID_REESTR'].AsString);
 i.Free;
 o.Free;}
end;

procedure TMainForm.dxBarButton3Click(Sender: TObject);
begin
 LoadDogManedger.ReeUrzb(Self, dm.Database.Handle,dm.ReadTransaction.Handle,dm.WriteTransaction.Handle);
end;

procedure TMainForm.dxBarButton4Click(Sender: TObject);
begin
  LoadDogManedger.ReeFnzb(Self, dm.Database.Handle,dm.ReadTransaction.Handle,dm.WriteTransaction.Handle);
end;

procedure TMainForm.dxBarButton5Click(Sender: TObject);
var
 i, o : DogLoaderUnit.TSpravParams;
begin
  i := DogLoaderUnit.TSpravParams.Create;
  o := DogLoaderUnit.TSpravParams.Create;

  i['DataBase']  := Integer(dm.Database.Handle);
  i['ReadTransaction'] := Integer(dm.ReadTransaction.Handle);
  i['WriteTransaction'] := Integer(dm.WriteTransaction.Handle);
  i['FormStyle'] := fsNormal;

  DogLoaderUnit.LoadSprav('workdog\matShablons.bpl', Self, i, o);
  i.Free;
  o.Free;
end;

procedure TMainForm.dxBarButton6Click(Sender: TObject);
var
 i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Класiфiкатор продукцiї';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'PUB_SP_CLASS_SELECT';
  i['KEY_FIELD'].AsString := 'id_ist';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'shifr;name_ist;note_class';
  i['FIELDS_caption'].AsString := 'Шифр;Назва;Примітка';
  i['SearchField'].AsString := 'FIND_FIELD';
  i['AddProc'].AsString := 'PUB_SP_CLASS_ADD';
  i['DelProc'].AsString := 'PUB_SP_CLASS_DEL';
  i['UpdProc'].AsString := 'PUB_SP_CLASS_MOD';
  i['DBHandle'].AsInteger := integer(dm.Database.Handle);
//
  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
//  if o['MoadResult'].AsVariant = mrOk then
//  begin
//  end;
//  ViewArray(Self, o);

  i.Free;
  o.Free;

{  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Класіфікатор продукції';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'pub_SP_CLASS';
  i['KEY_FIELD'].AsString := 'id_ist';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'name_ist;itog';
  i['FIELDS_caption'].AsString := 'Назва;Сума';
  i['SearchField'].AsString := 'name_ist';
  i['AddProc'].AsString := 'PUB_SP_CLASS_ADD';
  i['DelProc'].AsString := 'PUB_SP_CLASS_DEL';
  i['UpdProc'].AsString := 'PUB_SP_CLASS_MOD';

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
//  ViewArray(Self, o);
  i.Free;
  o.Free;}
end;

procedure TMainForm.dxBarButton7Click(Sender: TObject);
var
  i, o : TAArray;
begin
  i := TAArray.Create;
  o := TAArray.Create;

  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Справочник оснований';
  i['CaptionEdit'].AsString := 'клас';
  i['TableName'].AsString := 'PUB_SP_OSN';
  i['KEY_FIELD'].AsString := 'id_osn';
  i['parent_field'].AsString := 'linkto';
  i['FIELDS'].AsString := 'name_osn';
  i['FIELDS_caption'].AsString := 'Наименование основания';
  i['SearchField'].AsString := 'name_osn';
  i['AddProc'].AsString := 'PUB_SP_OSN_ADD';
  i['DelProc'].AsString := 'PUB_SP_OSN_DEL';
  i['UpdProc'].AsString := 'PUB_SP_OSN_MOD';
  i['DBHandle'].AsInteger := integer(dm.Database.handle);
  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  i.Free;
  o.Free;

end;

procedure TMainForm.dxBarButton8Click(Sender: TObject);
var
 i, o : TAArray;
begin

  i := TAArray.Create;
  o := TAArray.Create;
  i['Owner'].AsObject := Self;
  i['FormStyle'].AsVariant := fsNormal;
  i['Caption'].AsString := 'Справочник типов аренды';
  i['CaptionEdit'].AsString := 'Тип аренды';
  i['TableName'].AsString := 'SP_ARND_TYPE';
  i['KEY_FIELD'].AsString := 'id_arnd_type';
  i['parent_field'].AsString := 'LINKTO';
  i['FIELDS'].AsString := 'arnd_type;kogo_predst;kto_predst;kem_uslugi;podpis;podpis_o;KOMU;';
  i['FIELDS_caption'].AsString := 'Тип оренди;Представник;Заказник;Ким предоставлено;Підпис отримувача;Підпис давача; Кому арендна плата';
  i['SearchField'].AsString := 'arnd_type';
  i['AddProc'].AsString := 'SP_ARND_TYPE_INS';
  i['DelProc'].AsString := 'SP_ARND_TYPE_DEL';
  i['UpdProc'].AsString := 'SP_ARND_TYPE_UPD';
  i['DBHandle'].AsInteger := integer(dm.Database.handle);

  LoaderUnit.LoadSprav(ExtractFilePath(Application.ExeName) + 'workdog\UnivTree.bpl', i, o);
  if o['MoadResult'].AsVariant = mrOk then
  begin

//  cxButtonEdit1.Text := o['arnd_type'].AsString;
//  id_arnd_type:=o['id_arnd_type'].AsInteger;
  end;
  i.Free;
  o.Free;

end;

procedure TMainForm.ApplicationEvents1Exception(Sender: TObject;E: Exception);
var
temp_s:string;
begin
    {if E is EFIBInterBaseError
      then begin
          if EFIBInterbaseError(E).SQLCode = -902 then
             begin
               temp_s:=EFIBInterbaseError(E).Message + 'Произошёл обрыв связи с сервером, обратитесь к администратору.';
               MessageBox(Application.Handle,Pchar(temp_s),'Внимание!',MB_OK);
               Application.Terminate;
             end
          else
             begin
               temp_s:='Ошибка: ' + EFIBInterbaseError(E).Message + 'Обратитесь к Администратору.' ;
               MessageBox(Application.Handle,Pchar(temp_s),'Внимание!',MB_OK);
               Application.Terminate;
             end;

       end


       else
       begin
                      temp_s:='Ошибка: ' + EFIBInterbaseError(E).Message + 'Обратитесь к Администратору.' ;
               MessageBox(Application.Handle,Pchar(temp_s),'Внимание!',MB_OK);
       end
             }
end;
//
procedure TMainForm.dxBarButton9Click(Sender: TObject);
var
 i, o : TSpravParams;
begin
 i := TSpravParams.Create;
 o := TSpravParams.Create;
 i['DataBase']     := Integer(dm.Database.Handle);
 i['PriznVizova']  := 'SpView';
 i['FormStyle']    := fsMDIChild;
 i['bMultiSelect'] := false;
 i['id_session']   := -1;
 i['SelectMode']   := selRateAccount;
 i['Show_all']   := 1;
 i['PeriodBeg']    := Now;
 i['PeriodEnd']    := Now;
 i['id_dog']       := 0;
 LoadSprav('WorkDog\SprFavour.bpl', Self, i, o);
 if o['ModalResult'] <> mrOk then
 begin

 end;
 i.Free;
 o.Free;
end;

procedure TMainForm.dxBarButton11Click(Sender: TObject);
var
   i, o : TSpravParams;
begin

end;

procedure TMainForm.btn4Click(Sender: TObject);
begin
    LoadDogManedger.ShowArndSch(Self,
    DM.Database.Handle,
    DM.ReadTransaction.Handle,
    DM.WriteTransaction.Handle,
    3,
    1299,
    -1)

end;

procedure TMainForm.FilterDogUrFinButtonClick(Sender: TObject);
var
  FilterUrFN:Variant;
begin
  FilterUrFN := LoadfilterDogURFNPackage(owner,DM.Database.Handle,'WorkDog\FiltrDogUrFn.bpl','View_FiltrDogUrFn');

end;

end.

