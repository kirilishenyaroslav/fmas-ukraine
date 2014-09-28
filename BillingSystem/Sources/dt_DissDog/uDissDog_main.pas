unit uDissDog_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCommon_Types, uDissDog_DM, StdCtrls, cxContainer, cxEdit,
  cxTextEdit, cxControls, cxGroupBox, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxLookAndFeelPainters, cxButtons, uCommon_Funcs, uConsts,
  uCommon_Messages, uConsts_Messages, cxButtonEdit, uCommon_Loader, Registry,
  Buttons, ibase;

type
  TfrmDissDog_Main = class(TForm)
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
  private
    { Private declarations }
  private
    PLanguageIndex: byte;
    DM : TfrmDissDog_DM;
    ID_DOG_DISS: Int64;
    ID_TYPE_DISS: Int64;
    ID_DOG_ROOT : Int64;
    ID_DOG_LAST : Int64;
    ID_STUD     : Int64;
    Is_Collect  : byte;
    IsUpload: boolean;
    DissDownAllContract_local : boolean;
    EditMode : boolean;
    procedure FormIniLanguage;
    procedure ChangeAMode(AMode : TActionMode);
  public
    TR_DissHandle: TISC_TR_HANDLE;
    res : Variant;
    constructor  Create(AParameter:TbsSimpleParamsEx);reintroduce;
  end;

var
  frmDissDog_Main: TfrmDissDog_Main;

implementation

uses FIBDatabase;

{$R *.dfm}
procedure TfrmDissDog_Main.ChangeAMode(AMode : TActionMode);
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

constructor TfrmDissDog_Main.Create(AParameter:TbsSimpleParamsEx);
begin
  Screen.Cursor:=crHourGlass;
  inherited Create(AParameter.Owner);
  if AParameter.bsParamsToPakage.DissDownAllContract <> null then
  DissDownAllContract_local := AParameter.bsParamsToPakage.DissDownAllContract
  else DissDownAllContract_local :=false;
  Is_Collect := AParameter.bsParamsToPakage.Is_collect;

  DM:=TfrmDissDog_DM.Create(Self);
  DM.ReadDataSet.SQLs.SelectSQL.Text := 'select * from sys_options'; // просто чтобы убить транзакцию галимую
  DM.DB.Handle:=AParameter.Db_Handle;
  DM.ReadDataSet.Open;
  DM.ReadDataSet.Close;
  IsUpload:= false;
  IsUpload:= AParameter.bsParamsToPakage.IsUpload;
  ID_DOG_ROOT:= AParameter.bsParamsToPakage.ID_DOG_ROOT;
  if AParameter.bsParamsToPakage.ID_STUD <> null then
  ID_STUD     := AParameter.bsParamsToPakage.ID_STUD;
  ID_DOG_LAST := AParameter.bsParamsToPakage.ID_DOG;

  ID_DOG_DISS:=-999;
  ChangeAMode(AParameter.AMode);

  //Res:=VarArrayCreate([0,3],varVariant);

  TR_DissHandle:= AParameter.TR_Handle;

if AParameter.AMode = View then
begin
    DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_DISS_SELECT('
                                      +inttostr(AParameter.bsParamsToPakage.ID_STUD) +','
                                      +inttostr(AParameter.bsParamsToPakage.ID_DOG) +')' ;
    DM.DataSet.Open;

     if DM.DataSet['ID_DOG_DISS']<> null then
     ID_DOG_DISS:= DM.DataSet['ID_DOG_DISS']
     else ID_DOG_DISS:=-999;
     ID_TYPE_DISS:= DM.DataSet['ID_TYPE_DISS'];

    if DM.DataSet['Name_Type_Diss']<> null then
    TypeDiss_Edit.Text      :=DM.DataSet['Name_Type_Diss'];
    if DM.DataSet['DATE_DISS']<> null then
    DateDiss.Date      :=DM.DataSet['DATE_DISS'];
    if DM.DataSet['ORDER_DATE']<> null then
    OrderDate.Date     :=DM.DataSet['ORDER_DATE'];
    if DM.DataSet['ORDER_NUM']<> null then
    OrderNum_Edit.Text :=DM.DataSet['ORDER_NUM'];
    if DM.DataSet['COMMENT']<> null then
    Comments_Edit.Text :=DM.DataSet['COMMENT'];
    DM.DataSet.Close;
end;
if AParameter.AMode = Edit then
begin
    DM.DataSet.SQLs.SelectSQL.Text := 'select * from CN_DT_DOG_DISS_SELECT('
                                      +inttostr(AParameter.bsParamsToPakage.ID_STUD) +','
                                      +inttostr(AParameter.bsParamsToPakage.ID_DOG) +')' ;
    DM.DataSet.Open;

     if DM.DataSet['ID_DOG_DISS']<> null then
     ID_DOG_DISS:= DM.DataSet['ID_DOG_DISS']
     else ID_DOG_DISS:=-999;

   if ID_DOG_DISS <> -999 then
   begin
    ID_TYPE_DISS:= DM.DataSet['ID_TYPE_DISS'];

    if DM.DataSet['Name_Type_Diss']<> null then
    TypeDiss_Edit.Text      :=DM.DataSet['Name_Type_Diss'];
    if DM.DataSet['DATE_DISS']<> null then
    DateDiss.Date      :=DM.DataSet['DATE_DISS'];
    if DM.DataSet['ORDER_DATE']<> null then
    OrderDate.Date     :=DM.DataSet['ORDER_DATE'];
    if DM.DataSet['ORDER_NUM']<> null then
    OrderNum_Edit.Text :=DM.DataSet['ORDER_NUM'];
    if DM.DataSet['COMMENT']<> null then
    Comments_Edit.Text :=DM.DataSet['COMMENT'];
    end;
    DM.DataSet.Close;
end;
Screen.Cursor:=crDefault;
FormIniLanguage();
end;

procedure TfrmDissDog_Main.FormIniLanguage;
begin
 PLanguageIndex:= uCommon_Funcs.bsLanguageIndex();
 Caption :=              uConsts.bs_InfoDiss[PLanguageIndex];
 DateDiss_Label.Caption:=        uConsts.bs_DateDiss[PLanguageIndex];
 OrderDate_Label.Caption:=       uConsts.bs_DateOrderDiss[PLanguageIndex];
 OrderNum_Label.Caption:=        uConsts.bs_NumOrderDiss[PLanguageIndex];
 Comments_Label.Caption:=        uConsts.bs_CommentDiss[PLanguageIndex];
 TypeDiss_Label.Caption:=        uConsts. bs_TypeDiss[PLanguageIndex];
 OkButton.Caption:=      uConsts.bs_Accept[PLanguageIndex];
 CancelButton.Caption:=  uConsts.bs_Cancel[PLanguageIndex];
 SpeedButton.Hint :=     uConsts.bs_Cookies[PLanguageIndex];
end;

procedure TfrmDissDog_Main.CancelButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmDissDog_Main.OkButtonClick(Sender: TObject);
 function CheckControls: boolean;
  begin
   Result:= false;
   if DateDiss.Text = ''
    then
     begin
       bsShowMessage( PChar(uConsts_Messages.bs_Error[PLanguageIndex]),
                      PChar(uConsts_Messages.bs_DateDiss_Need[PLanguageIndex]) ,
                      mtError,[mbYes]);
       DateDiss.SetFocus;
       Result:= true;
      exit;
    end;
   if OrderDate.Text = ''
    then
     begin
       bsShowMessage(PChar(uConsts_Messages.bs_Error[PLanguageIndex]),
                      PChar(uConsts_Messages.bs_DateOrder_Need[PLanguageIndex]) ,
                      mtError,[mbYes]);
       OrderDate.SetFocus;
       Result:= true;
      exit;
    end;
    if OrderNum_Edit.Text = ''
    then
     begin
       bsShowMessage(PChar(uConsts_Messages.bs_Error[PLanguageIndex]),
                      PChar(uConsts_Messages.bs_NumOrder_Need[PLanguageIndex]) ,
                      mtError,[mbYes]);
       OrderNum_Edit.SetFocus;
       Result:= true;
      exit;
    end;
  end;
var
  id_order : int64;
  DateStart :Tdate;
begin
    if CheckControls then exit;

 // провер€ем дату старта системы
 Dm.ReadDataSet.Close;
 Dm.ReadDataSet.SelectSQL.Clear;
 Dm.ReadDataSet.SelectSQL.Text := 'select CN_DATE_START from CN_PUB_SYS_DATA_GET_ALL';
 Dm.ReadDataSet.Open;
 if Dm.ReadDataSet['CN_DATE_START'] <> null then
  DateStart:= Dm.ReadDataSet['CN_DATE_START']
 else
  DateStart:= strtodate('01.01.1900');
 Dm.ReadDataSet.Close;

  // провер€ю период- не даю добавл€ть до даты старта
 if (DateDiss.Date < DateStart) then
  begin
   showmessage(bs_PeriodsLessDateStart[PLanguageIndex]);
   DateDiss.SetFocus;
   exit;
  end;


     Dm.ReadDataSet.Close;
     Dm.ReadDataSet.SelectSQL.Clear;
     Dm.ReadDataSet.SelectSQL.Text := 'select * from CN_GET_TYPEORDERDISS(' + IntToStr(ID_TYPE_DISS)+ ')';
     Dm.ReadDataSet.Open;
     if Dm.ReadDataSet['ID_ORDERTYPE'] <> null then
     id_order :=Dm.ReadDataSet['ID_ORDERTYPE']
     else
     begin
       showmessage('“ип наказу не знайдено! ѕерев≥рте "ƒов≥дник тип≥в роз≥рванн€ контракту" ');
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
          if ID_DOG_DISS <> -999 then
            ParamByName('ID_DOG_DISS_IN').AsInt64 := ID_DOG_DISS
          else
            ParamByName('ID_DOG_DISS_IN').AsVariant := null;
        Prepare;
        ExecProc;


          {  // удал€ю все приказы
            StoredProcName := 'CN_DT_ORDERS_DEL_BY_TYPE';
            Prepare;
            ParamByName('ID_ORDER').AsInt64 := id_order;
            ParamByName('ID_STUD').AsInt64 := ID_STUD;
            ExecProc;}

            // добавл€ю все приказы по разр≥ву контракта
                StoredProcName := 'CN_DT_ORDERS_INSERT';
                Prepare;
                ParamByName('ID_ORDER').AsInt64       := id_order;
                ParamByName('ID_STUD').AsInt64        := ID_STUD;
                ParamByName('DATE_ORDER').AsDate      := OrderDate.Date;
                ParamByName('NUM_ORDER').AsString     := OrderNum_Edit.text;
                if Comments_Edit.Text=''
                 then ParamByName('COMMENTS').AsString      := 'автоматичне додаванн€ наказу при робот≥ з роз≥рванн€м контракту'
                 else ParamByName('COMMENTS').AsString      := Comments_Edit.Text;
                ExecProc;
           
        Transaction.Commit;
        res.flag := 1;
        except
        on E:Exception do
         begin
          LogException;
          bsShowMessage(PChar(uConsts_Messages.bs_Error[PLanguageIndex]),e.Message,mtError,[mbYes]);
          Transaction.Rollback;
          res.flag := 0;
         end;
       end

       else //DissDownAllContract_local = true
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
//        Transaction.Commit;
        res.flag := 1;

           if IsUpload then
            begin
//             Transaction.StartTransaction;
              StoredProcName := 'CN_DT_DOG_UPLOAD_CLOSE_USE_END';
                ParamByName('ID_DOG_ROOT').AsInt64  := ID_DOG_ROOT;
                ParamByName('ID_DOG_LAST').AsInt64  := ID_DOG_LAST;
              Prepare;
              ExecProc;
             // Res.TR_Handle:= Transaction.Handle;

             //Transaction.Commit;
            end
            else
          //  Transaction.Commit;

        except
        on E:Exception do
         begin
          LogException;
          bsShowMessage(PChar(uConsts_Messages.bs_Error[PLanguageIndex]),e.Message,mtError,[mbYes]);
          Transaction.Rollback;
          res.flag := 0;
         end;
       end;

  close;
end;

procedure TfrmDissDog_Main.TypeDiss_EditPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
  var
  AParameter:TbsSimpleParams;
  resUlt: Variant;
 begin
  AParameter:= TbsSimpleParams.Create;
  AParameter.Owner:=self;
  AParameter.Db_Handle:= DM.DB.Handle;
  AParameter.Formstyle:=fsNormal;
  AParameter.WaitPakageOwner:=self;
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

procedure TfrmDissDog_Main.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 //Dm.Free;
end;

procedure TfrmDissDog_Main.FormShow(Sender: TObject);
begin
DateDiss.SetFocus;
end;

procedure TfrmDissDog_Main.DateDissKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OrderDate.SetFocus;
end;

procedure TfrmDissDog_Main.OrderDateKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then OrderNum_Edit.SetFocus;
end;

procedure TfrmDissDog_Main.OrderNum_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then TypeDiss_Edit.SetFocus;
end;

procedure TfrmDissDog_Main.TypeDiss_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then Comments_Edit.SetFocus;
end;

procedure TfrmDissDog_Main.Comments_EditKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then OkButton.SetFocus;
end;

procedure TfrmDissDog_Main.FormCreate(Sender: TObject);
begin
res.flag := 0;
res.TR_Handle := nil;
end;

end.
