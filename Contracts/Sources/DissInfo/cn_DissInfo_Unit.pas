unit cn_DissInfo_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cn_Common_Types, DM_DissInfo, StdCtrls, cxContainer, cxEdit,
  cxTextEdit, cxControls, cxGroupBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLookAndFeelPainters, cxButtons, cn_Common_Funcs, cnConsts,
  cn_Common_Messages, cnConsts_Messages, cxButtonEdit, cn_Common_Loader, Registry,
  Buttons, ibase;

type TDissInfoCookies = record
 IsIt          : Boolean;
 DateDiss      : TDate;
 OrderDate     : TDate;
 ORDER_NUM     : String;
 Type_Diss     : String;
 ID_TYPE_DISS  : Int64;
 Comments      : String;
end;

type
  TfrmDissInfo = class(TForm)
    GroupBox: TcxGroupBox;
    OrderNum_Edit: TcxTextEdit;
    OrderNum_Label: TLabel;
    Comments_Label: TLabel;
    Comments_Edit: TcxTextEdit;
    DateDiss: TcxDateEdit;
    OrderDate: TcxDateEdit;
    DateDiss_Label: TLabel;
    OrderDate_Label: TLabel;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    TypeDiss_Edit: TcxButtonEdit;
    TypeDiss_Label: TLabel;
    SpeedButton: TSpeedButton;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure TypeDiss_EditPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DateDissKeyPress(Sender: TObject; var Key: Char);
    procedure OrderDateKeyPress(Sender: TObject; var Key: Char);
    procedure OrderNum_EditKeyPress(Sender: TObject; var Key: Char);
    procedure TypeDiss_EditKeyPress(Sender: TObject; var Key: Char);
    procedure Comments_EditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButtonClick(Sender: TObject);
  private
    { Private declarations }
  private
    PLanguageIndex: byte;
    DM:TDM_Diss;
    ID_DOG_DISS: Int64;
    ID_TYPE_DISS: Int64;
    ID_DOG_ROOT : Int64;
    ID_DOG_LAST : Int64;
    ID_STUD     : Int64;
    Is_Collect  : byte;
    IsUpload: boolean;
    DissDownAllContract_local : boolean;
    EditMode : boolean;
    function  LoadCookies (): TDissInfoCookies;
    procedure SaveCookies (DissCookies: TDissInfoCookies);
    procedure FormIniLanguage;
    procedure ChangeAMode(AMode : TActionMode);
  public
    TR_DissHandle: TISC_TR_HANDLE;
    res:TDissInfo;
    is_admin : Boolean;
    constructor  Create(AParameter:TcnSimpleParamsEx);reintroduce;
  end;

var
  frmDissInfo: TfrmDissInfo;

implementation

uses FIBDatabase;

{$R *.dfm}
procedure TfrmDissInfo.ChangeAMode(AMode : TActionMode);
begin
 if AMode = View then
  begin
   OkButton.Visible := False;
   DateDiss.Properties.ReadOnly := true;
   OrderDate.Properties.ReadOnly := true;
   OrderNum_Edit.Properties.ReadOnly := true;
   Comments_Edit.Properties.ReadOnly := true;
   SpeedButton.Visible:= false;
  end;

 if AMode = Edit then
  begin
   OkButton.Visible := True;
   DateDiss.Properties.ReadOnly := False;
   OrderDate.Properties.ReadOnly := False;
   OrderNum_Edit.Properties.ReadOnly := False;
   Comments_Edit.Properties.ReadOnly := False;
   DateDiss.Style.Color := clInfoBk;
   OrderDate.Style.Color := clInfoBk;
   OrderNum_Edit.Style.Color := clInfoBk;
   Comments_Edit.Style.Color := clInfoBk;
  end;
end;

procedure TfrmDissInfo.SaveCookies (DissCookies: TDissInfoCookies);
var
  reg: TRegistry;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       if  reg.OpenKey('\Software\Contracts\Cookies\DissDog',True) then
       begin
         reg.WriteString('DateDiss',     DateToStr(DissCookies.DateDiss));
         reg.WriteString('OrderDate',    DateToStr(DissCookies.OrderDate));
         reg.WriteString('ORDER_NUM',    DissCookies.ORDER_NUM);
         reg.WriteString('Type_Diss',    DissCookies.Type_Diss);
         reg.WriteString('ID_TYPE_DISS', IntToStr(DissCookies.ID_TYPE_DISS));
         reg.WriteString('Comments',     DissCookies.Comments);
       end
      finally
       reg.Free;
     end;
end;

function  TfrmDissInfo.LoadCookies (): TDissInfoCookies;
var
  reg: TRegistry;
  DissCookies : TDissInfoCookies;
begin
     reg := TRegistry.Create;
      try
       reg.RootKey:=HKEY_CURRENT_USER;
       DissCookies.IsIt := False;
       if  reg.OpenKey('\Software\Contracts\Cookies\DissDog',False) then
       begin
         DissCookies.DateDiss  := StrToDate(reg.ReadString('DateDiss')) ;
         DissCookies.OrderDate := StrToDate(reg.ReadString('OrderDate')) ;
         DissCookies.ORDER_NUM :=           reg.ReadString('ORDER_NUM') ;
         DissCookies.Type_Diss :=           reg.ReadString('Type_Diss') ;
         DissCookies.ID_TYPE_DISS := StrToInt(reg.ReadString('ID_TYPE_DISS')) ;
         DissCookies.Comments :=            reg.ReadString('Comments') ;
         DissCookies.IsIt := True;
         Result := DissCookies;
       end
      finally
       reg.Free;
     end;
end;

constructor TfrmDissInfo.Create(AParameter:TcnSimpleParamsEx);
begin
 Screen.Cursor:=crHourGlass;
 inherited Create(AParameter.Owner);
 is_admin := AParameter.is_admin;
 if AParameter.cnParamsToPakage.DissDownAllContract <> null
  then DissDownAllContract_local := AParameter.cnParamsToPakage.DissDownAllContract
  else DissDownAllContract_local :=false;
 Is_Collect := AParameter.cnParamsToPakage.Is_collect;
 DM:=TDM_Diss.Create(Self);
 DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from sys_options'; // просто чтобы убить транзакцию галимую
 DM.DB.Handle:=AParameter.Db_Handle;
 DM.ReadDataSet.Open;
 DM.ReadDataSet.Close;
 IsUpload:= false;
 IsUpload:= AParameter.cnParamsToPakage.IsUpload;
 ID_DOG_ROOT:= AParameter.cnParamsToPakage.ID_DOG_ROOT;
 if AParameter.cnParamsToPakage.ID_STUD <> null
  then ID_STUD    := AParameter.cnParamsToPakage.ID_STUD;
 ID_DOG_LAST:= AParameter.cnParamsToPakage.ID_DOG;

 ID_DOG_DISS:=-999;
 ChangeAMode(AParameter.AMode);

 TR_DissHandle:= AParameter.TR_Handle;

 if AParameter.AMode = View then
  begin
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_DISS_SELECT('
                                      +inttostr(AParameter.cnParamsToPakage.ID_STUD) +','
                                      +inttostr(AParameter.cnParamsToPakage.ID_DOG) +')' ;
   DM.DataSet.Open;

   if DM.DataSet['ID_DOG_DISS']<> null
    then ID_DOG_DISS:= DM.DataSet['ID_DOG_DISS']
    else ID_DOG_DISS:=-999;
   ID_TYPE_DISS:= DM.DataSet['ID_TYPE_DISS'];

   if DM.DataSet['Name_Type_Diss']<> null
    then TypeDiss_Edit.Text      :=DM.DataSet['Name_Type_Diss'];
   if DM.DataSet['DATE_DISS']<> null
    then DateDiss.Date      :=DM.DataSet['DATE_DISS'];
   if DM.DataSet['ORDER_DATE']<> null
    then OrderDate.Date     :=DM.DataSet['ORDER_DATE'];
   if DM.DataSet['ORDER_NUM']<> null
    then OrderNum_Edit.Text :=DM.DataSet['ORDER_NUM'];
   if DM.DataSet['COMMENT']<> null
    then Comments_Edit.Text :=DM.DataSet['COMMENT'];
   DM.DataSet.Close;
  end;
 if AParameter.AMode = Edit then
  begin
   DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_DISS_SELECT('
                                      +inttostr(AParameter.cnParamsToPakage.ID_STUD) +','
                                      +inttostr(AParameter.cnParamsToPakage.ID_DOG) +')' ;
   DM.DataSet.Open;

   if DM.DataSet['ID_DOG_DISS']<> null
    then ID_DOG_DISS:= DM.DataSet['ID_DOG_DISS']
    else ID_DOG_DISS:=-999;

   if ID_DOG_DISS <> -999 then
    begin
     ID_TYPE_DISS:= DM.DataSet['ID_TYPE_DISS'];

     if DM.DataSet['Name_Type_Diss']<> null
      then TypeDiss_Edit.Text      :=DM.DataSet['Name_Type_Diss'];
     if DM.DataSet['DATE_DISS']<> null
      then DateDiss.Date      :=DM.DataSet['DATE_DISS'];
     if DM.DataSet['ORDER_DATE']<> null
      then OrderDate.Date     :=DM.DataSet['ORDER_DATE'];
     if DM.DataSet['ORDER_NUM']<> null
      then OrderNum_Edit.Text :=DM.DataSet['ORDER_NUM'];
     if DM.DataSet['COMMENT']<> null
      then Comments_Edit.Text :=DM.DataSet['COMMENT'];
    end;
   DM.DataSet.Close;
  end;
 Screen.Cursor:=crDefault;
 FormIniLanguage();
end;

procedure TfrmDissInfo.FormIniLanguage;
begin
 PLanguageIndex:= cn_Common_Funcs.cnLanguageIndex();
 Caption :=              cnConsts.cn_InfoDiss[PLanguageIndex];
 DateDiss_Label.Caption:=        cnConsts.cn_DateDiss[PLanguageIndex];
 OrderDate_Label.Caption:=       cnConsts.cn_DateOrderDiss[PLanguageIndex];
 OrderNum_Label.Caption:=        cnConsts.cn_NumOrderDiss[PLanguageIndex];
 Comments_Label.Caption:=        cnConsts.cn_CommentDiss[PLanguageIndex];
 TypeDiss_Label.Caption:=        cnConsts. cn_TypeDiss[PLanguageIndex];
 OkButton.Caption:=      cnConsts.cn_Accept[PLanguageIndex];
 CancelButton.Caption:=  cnConsts.cn_Cancel[PLanguageIndex];
 SpeedButton.Hint :=     cnConsts.cn_Cookies[PLanguageIndex];
end;

procedure TfrmDissInfo.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDissInfo.OkButtonClick(Sender: TObject);
 function CheckControls: boolean;
  begin
   Result:= false;
   if DateDiss.Text = ''
    then
     begin
       cnShowMessage( PChar(cnConsts_Messages.cn_Error[PLanguageIndex]),
                      PChar(cnConsts_Messages.cn_DateDiss_Need[PLanguageIndex]) ,
                      mtError,[mbYes]);
       DateDiss.SetFocus;
       Result:= true;
      exit;
    end;
   if OrderDate.Text = ''
    then
     begin
       cnShowMessage( PChar(cnConsts_Messages.cn_Error[PLanguageIndex]),
                      PChar(cnConsts_Messages.cn_DateOrder_Need[PLanguageIndex]) ,
                      mtError,[mbYes]);
       OrderDate.SetFocus;
       Result:= true;
      exit;
    end;
    if OrderNum_Edit.Text = ''
    then
     begin
       cnShowMessage( PChar(cnConsts_Messages.cn_Error[PLanguageIndex]),
                      PChar(cnConsts_Messages.cn_NumOrder_Need[PLanguageIndex]) ,
                      mtError,[mbYes]);
       OrderNum_Edit.SetFocus;
       Result:= true;
      exit;
    end;
  end;
var
  DissCookies: TDissInfoCookies;
  id_order : int64;
  DateStart :Tdate;
begin
  If CheckControls then exit;

  // проверяем дату старта системы
  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select CN_DATE_START from CN_PUB_SYS_DATA_GET_ALL';
  Dm.ReadDataSet.Open;
  if Dm.ReadDataSet['CN_DATE_START'] <> null
   then DateStart:= Dm.ReadDataSet['CN_DATE_START']
   else DateStart:= strtodate('01.01.1900');
  Dm.ReadDataSet.Close;

  Dm.ReadDataSet.Close;
  Dm.ReadDataSet.SelectSQL.Clear;
  Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_TYPEORDERDISS(' + IntToStr(ID_TYPE_DISS)+ ')';
  Dm.ReadDataSet.Open;
  if Dm.ReadDataSet['ID_ORDERTYPE'] <> null
   then id_order :=Dm.ReadDataSet['ID_ORDERTYPE']
   else
    begin
     showmessage('Тип наказу не знайдено! Перевірте "Довідник типів розірвання контракту" ');
     Dm.ReadDataSet.Close;
     exit;
    end;
  Dm.ReadDataSet.Close;

  res.Date_Diss:= DateDiss.Date;

  if not DissDownAllContract_local then
   with DM.StProc do
    try
     Transaction.StartTransaction;
     StoredProcName := 'CN_DT_DOG_DISS_ANNUL_CONTRACT';

     ParamByName('ID_DOG_ROOT').AsInt64  := ID_DOG_ROOT;
     ParamByName('ID_DOG_LAST').AsInt64  := ID_DOG_LAST;
     ParamByName('ID_STUD').AsInt64      := ID_STUD;
     ParamByName('DATE_DISS').AsDate     := DateDiss.Date;
     ParamByName('ID_TYPE_DISS').AsInt64 := ID_TYPE_DISS;
     ParamByName('ORDER_DATE').AsDate    := OrderDate.Date;
     ParamByName('ORDER_NUM').AsString   := OrderNum_Edit.text;
     ParamByName('COMMENT').AsString     := Comments_Edit.Text;
     ParamByName('IS_COLLECT').AsInteger := is_collect;
     if ID_DOG_DISS <> -999
      then ParamByName('ID_DOG_DISS_IN').AsInt64 := ID_DOG_DISS
      else
     ParamByName('ID_DOG_DISS_IN').AsVariant := null;
     Prepare;
     ExecProc;

     // добавляю все приказы по разріву контракта
     StoredProcName := 'CN_DT_ORDERS_INSERT';
     Prepare;
     ParamByName('ID_ORDER').AsInt64       := id_order;
     ParamByName('ID_STUD').AsInt64        := ID_STUD;
     ParamByName('DATE_ORDER').AsDate      := OrderDate.Date;
     ParamByName('NUM_ORDER').AsString     := OrderNum_Edit.text;
     if Comments_Edit.Text=''
      then ParamByName('COMMENTS').AsString      := 'автоматичне додавання наказу при роботі з розірванням контракту'
      else ParamByName('COMMENTS').AsString      := Comments_Edit.Text;
     ExecProc;

     Transaction.Commit;
     DissCookies.DateDiss     :=  DateDiss.Date;
     DissCookies.OrderDate    :=  OrderDate.Date;
     DissCookies.ORDER_NUM    :=  OrderNum_Edit.Text;
     DissCookies.Type_Diss    :=  TypeDiss_Edit.Text;
     DissCookies.ID_TYPE_DISS :=  ID_TYPE_DISS;
     DissCookies.Comments     :=  Comments_Edit.Text;
     SaveCookies(DissCookies);
     res.flag := 1;
    except
     on E:Exception do
      begin
       cnShowMessage(PChar(cnConsts_Messages.cn_Error[PLanguageIndex]),e.Message,mtError,[mbYes]);
       Transaction.Rollback;
       res.flag := 0;
      end;
    end

  else
   with DM.StProc do
    try
     //Transaction.StartTransaction;
     Transaction.Handle :=  TR_DissHandle;
     StoredProcName := 'CN_DT_DOG_DISSDOWN_ALL';
     ParamByName('ID_DOG_ROOT').AsInt64  := ID_DOG_ROOT;
     ParamByName('ID_DOG_LAST').AsInt64  := ID_DOG_LAST;
     ParamByName('DATE_DISS').AsDate     := DateDiss.Date;
     ParamByName('ID_TYPE_DISS').AsInt64 := ID_TYPE_DISS;
     ParamByName('ORDER_DATE').AsDate    := OrderDate.Date;
     ParamByName('ORDER_NUM').AsString   := OrderNum_Edit.text;
     ParamByName('COMMENT').AsString     := Comments_Edit.Text;
     Prepare;
     ExecProc;

     // Transaction.Commit;
     DissCookies.DateDiss     :=  DateDiss.Date;
     DissCookies.OrderDate    :=  OrderDate.Date;
     DissCookies.ORDER_NUM    :=  OrderNum_Edit.Text;
     DissCookies.Type_Diss    :=  TypeDiss_Edit.Text;
     DissCookies.ID_TYPE_DISS :=  ID_TYPE_DISS;
     DissCookies.Comments     :=  Comments_Edit.Text;
     SaveCookies(DissCookies);
     res.flag := 1;

     if IsUpload then
      begin
       //Transaction.StartTransaction;
       StoredProcName := 'CN_DT_DOG_UPLOAD_CLOSE_USE_END';
       ParamByName('ID_DOG_ROOT').AsInt64  := ID_DOG_ROOT;
       ParamByName('ID_DOG_LAST').AsInt64  := ID_DOG_LAST;
       Prepare;
       ExecProc;
       //Res.TR_Handle:= Transaction.Handle;
       //Transaction.Commit;
      end
     else
     //  Transaction.Commit;
    except
     on E:Exception do
      begin
       cnShowMessage(PChar(cnConsts_Messages.cn_Error[PLanguageIndex]),e.Message,mtError,[mbYes]);
       Transaction.Rollback;
       res.flag := 0;
      end;
    end;
  close;
end;

procedure TfrmDissInfo.TypeDiss_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
  AParameter:TcnSimpleParams;
  resUlt: Variant;
begin
  AParameter:= TcnSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
  AParameter.is_admin := is_admin;
  if ID_TYPE_DISS <> -1 then
  AParameter.ID_Locate :=  ID_TYPE_DISS;
  resUlt:= RunFunctionFromPackage(AParameter, 'Contracts\cn_sp_TypeDiss.bpl','ShowSPTypeDiss');
 if VarArrayDimCount(resUlt)>0 then
  begin
   ID_TYPE_DISS := resUlt[0];
   TypeDiss_Edit.Text := resUlt[1];
  end;
  AParameter.Free;
end;

procedure TfrmDissInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 //Dm.Free;
end;

procedure TfrmDissInfo.FormShow(Sender: TObject);
begin
DateDiss.SetFocus;
end;

procedure TfrmDissInfo.DateDissKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OrderDate.SetFocus;
end;

procedure TfrmDissInfo.OrderDateKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OrderNum_Edit.SetFocus;
end;

procedure TfrmDissInfo.OrderNum_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then TypeDiss_Edit.SetFocus;
end;

procedure TfrmDissInfo.TypeDiss_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Comments_Edit.SetFocus;
end;

procedure TfrmDissInfo.Comments_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmDissInfo.FormCreate(Sender: TObject);
begin
res.flag := 0;
res.TR_Handle := nil;
end;

procedure TfrmDissInfo.SpeedButtonClick(Sender: TObject);
var
 Cookies : TDissInfoCookies;
begin
Cookies := LoadCookies();
DateDiss.Date := Cookies.DateDiss;
OrderDate.Date := Cookies.OrderDate;
OrderNum_Edit.Text := Cookies.ORDER_NUM;
TypeDiss_Edit.Text := Cookies.Type_Diss;
Comments_Edit.Text := Cookies.Comments;
ID_TYPE_DISS       := Cookies.ID_TYPE_DISS;
end;

end.
