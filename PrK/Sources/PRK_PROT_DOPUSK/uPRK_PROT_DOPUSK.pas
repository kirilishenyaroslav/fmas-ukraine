unit uPRK_PROT_DOPUSK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery,
  pFIBStoredProc, Placemnt, dxBar, dxBarExtItems, ActnList, ImgList,
  dxStatusBar, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxGroupBox, cxSplitter,AArray,ibase,ib_externals, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel,
  cxCheckBox;

type
  TFormPrK_PROT_DOPUSK = class(TForm)
    dxStatusBarPi: TdxStatusBar;
    cxGroupBoxPerIspitLeft: TcxGroupBox;
    cxGridPrKPZ: TcxGrid;
    cxGridPrKPZDBTableView1: TcxGridDBTableView;
    colNOMER: TcxGridDBColumn;
    cxGridPrKPZLevel1: TcxGridLevel;
    ImageListPrk: TImageList;
    ActionListPrK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionAddPr: TAction;
    ActionChangePr: TAction;
    ActionDelPr: TAction;
    ActionViewPr: TAction;
    StyleRepositoryPrk: TcxStyleRepository;
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
    cxStyle12: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    dxBarManagerPrk: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    FormStoragePrKPZ: TFormStorage;
    TransactionWritePrK: TpFIBTransaction;
    StoredProcPrK: TpFIBStoredProc;
    DataSetPrKPZ: TpFIBDataSet;
    TransactionReadPrK: TpFIBTransaction;
    DataBasePrk: TpFIBDatabase;
    DataSourcePrKPZ: TDataSource;
    cxEditStyleControllerPrK: TcxEditStyleController;
    colDATE_FORM: TcxGridDBColumn;
    DataSetFob_Prot: TpFIBDataSet;
    DataSourceFob_Prot: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxLookupComboBoxFob_Prot: TcxLookupComboBox;
    ActionAddExistPr: TAction;
    ActionPrint: TAction;
    dxBarLargeButtonPrint: TdxBarLargeButton;
    ActionPrintPr: TAction;
    ActionAbitShow: TAction;
    ActionAbitShowPr: TAction;
    dxBarLargeButtonAbitShow: TdxBarLargeButton;
    cxLabelFob_Prot: TcxLabel;
    colDate_Beg: TcxGridDBColumn;
    colDate_End: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionADDExecute(Sender: TObject);
    procedure cxLookupComboBoxFob_ProtPropertiesChange(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionPrintExecute(Sender: TObject);
    procedure ActionPrintPrExecute(Sender: TObject);
    procedure ActionAbitShowExecute(Sender: TObject);
  private
     ID_NAME_PZ              :String;
     ID_NAME_PZ_Right        :String;
     ResultArray             :TAArray;
     DBHANDLE                :TISC_DB_HANDLE ;
     TextViewColor           :TColor;
    FSelectSQLTextPZRight: String;
    FSelectSQLTextPZ: String;
    FSelectSQLTextFobProt: String;
    procedure SetSelectSQLTextPZ(const Value: String);
    procedure SetSelectSQLTextPZRight(const Value: String);
    procedure InicCaption;
    procedure WriteIdFobProt;
    function  ReadIdFobProt: int64;
    procedure obnovit_Right(id_obnovit:int64);
    procedure obnovit(id_obnovit:int64);
    procedure SetSelectSQLTextFobProt(const Value: String);
  public
    IndLang                 :integer;
    ID_USER_GLOBAL       :Int64;
    ID_GOD_NABORA_GLOBAL :Int64;
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLTextFobProt :String read FSelectSQLTextFobProt write SetSelectSQLTextFobProt;
    Property SelectSQLTextPZ      :String read FSelectSQLTextPZ write SetSelectSQLTextPZ;
    Property SelectSQLTextPZRight :String read FSelectSQLTextPZRight write SetSelectSQLTextPZRight;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_PROT_DOPUSK: TFormPrK_PROT_DOPUSK;

implementation
uses
  uPrK_Resources,uConstants,uPrK_PROT_DOPUSK_Add,
  registry,
  uPrK_PROT_DOPUSK_Change,uPrK_Loader,uPrK_PD_Abit_Show;


  //******************************************************************
       //  Данный модуль сделан на основе  uPRK_PROT_Zach
       //  Поэтому могут возникнуть ошибки с именованием SQL процедур
       //  (т.е. могут быть отобраны не те данные)
       //
  //*******************************************************************

{$R *.dfm}
procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_PROT_DOPUSK;
begin
   T:=TFormPrK_PROT_DOPUSK.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
     fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;
{ TFormPrK_PROT_ZACH }

constructor TFormPrK_PROT_DOPUSK.Create(aOwner: TComponent; aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLang       :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER_GLOBAL'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color     := $00EBC4A4;
          cxStyleInactive.Color               := $00F7EAD9;
          cxEditStyleControllerPrK.Style.Color:= $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_PROT_DOPUSK.FormCreate(Sender: TObject);
begin
  {ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME_PZ       :='ID_DT_PROT_DOPUSK';
  //ID_NAME_PZ_Right :='ID_DT_PRIK_ZACH';

  SelectSQLTextFobProt :='Select * from PRK_SP_FOB_PROT_SELECT';
  SelectSQLTextPZ      :='Select * from PRK_DT_PROT_DOPUSK_SELECT('+IntToStr(ID_GOD_NABORA_GLOBAL)+') where ?Mas_ID_SP_FOB_PROT=ID_SP_FOB_PROT';
  //SelectSQLTextPZRight :='Select * from PRK_DT_PRIK_ZACH_SELECT('+IntToStr(ID_GOD_NABORA_GLOBAL)+') where ?Mas_ID_DT_PROT_ZACH=ID_DT_PROT_ZACH';
  InicCaption;

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

procedure TFormPrK_PROT_DOPUSK.InicCaption;
begin
   TFormPrK_PROT_DOPUSK(self).Caption := nFormPrK_PROT_DOPUSK_Caption[IndLang];
    dxBarManagerPrk.CanCustomize           :=false;
    dxBarManagerPrk.Bars[0].BorderStyle    :=bbsNone;
    dxBarManagerPrk.Bars[0].ShowMark       :=false;
    dxBarManagerPrk.Bars[0].AllowClose       :=false;
    dxBarManagerPrk.Bars[0].AllowCustomizing    :=false;
    dxBarManagerPrk.Bars[0].AllowQuickCustomizing  :=false;
    dxBarManagerPrk.Bars[0].AllowReset                :=false;

   

    ActionADD.Caption                    :=nAction_Add[IndLang];
    ActionAddExistPr.Caption             :=nActionAddExistPr[IndLang];
    ActionChange.Caption                 :=nAction_ChangeRekvizit[IndLang];
    ActionDEL.Caption                    :=nAction_Del[IndLang];
    ActionView.Caption                   :=nAction_View[IndLang];
    ActionVibrat.Caption                 :=nAction_Vibrat[IndLang];
    ActionObnov.Caption                  :=nActiont_Obnov[IndLang];
    ActionOtmena.Caption                 :=nAction_Exit[IndLang];
    ActionPrint.Caption                  :=nActiontPrint[IndLang];
    ActionAbitShow.Caption               :=nActionAbitShow[IndLang];

    ActionAddPr.Caption                   :=nAction_Add[IndLang];
    ActionChangePr.Caption                :=nAction_ChangeRekvizit[IndLang];
    ActionDelPr.Caption                   :=nAction_Del[IndLang];
    ActionViewPr.Caption                  :=nAction_View[IndLang];
    ActionPrintPr.Caption                 :=nActiontPrint[IndLang];
    ActionAbitShowPr.Caption              :=nActionAbitShow[IndLang];

    ActionADD.Hint                       :=nHintAction_Add[IndLang];
    ActionChange.Hint                    :=nHintAction_ChangeRekvizit[IndLang];
    ActionDEL.Hint                       :=nHintAction_Del[IndLang];
    ActionView.Hint                      :=nHintAction_View[IndLang];
    ActionVibrat.Hint                    :=nHintAction_Vibrat[IndLang];
    ActionObnov.Hint                     :=nHintAction_Obnov[IndLang];
    ActionOtmena.Hint                    :=nHintAction_Exit[IndLang];
    ActionPrint.Hint                     :=nHintActiontPrint[IndLang];
    ActionAbitShow.Hint                  :=nHintActionAbitShowProtokol[IndLang];

    ActionAddPr.Hint                     :=nHintAction_Add[IndLang];
    ActionChangePr.Hint                  :=nHintAction_ChangeRekvizit[IndLang];
    ActionDelPr.Hint                     :=nHintAction_Del[IndLang];
    ActionViewPr.Hint                    :=nHintAction_View[IndLang];
    ActionAbitShowPr.Hint                :=nHintActionAbitShowPrikaz[IndLang];

    dxStatusBarPi.Panels[0].Text         :=nStatBarAdd[IndLang];
    dxStatusBarPi.Panels[1].Text         :=nStatBarChange[IndLang];
    dxStatusBarPi.Panels[2].Text         :=nStatBarDel[IndLang];
    dxStatusBarPi.Panels[3].Text         :=nStatBarVibrat[IndLang];
    dxStatusBarPi.Panels[4].Text         :=nStatBarObnov[IndLang];
    dxStatusBarPi.Panels[5].Text         :=nStatBarExit[IndLang];

    cxLabelFob_Prot.Caption              :=nLabelFOB_PROT[IndLang];

    colNOMER.Caption                     :=ncolNOMER[IndLang];
    colDATE_FORM.Caption                 :=ncolDATE_FORM[IndLang];
    colDate_Beg.Caption                  :=ncolDATE_BEGIN[IndLang];
    colDate_End.Caption                  :=ncolDATE_END[IndLang];

     //colNOMER_Prikaz.Caption              :=ncolNOMER_Prikaz[IndLang];
     //colDATE_PRIKAZ.Caption               :=ncolDATE_PRIKAZ[IndLang];
     //colDATE_ZARAX.Caption                :=ncolDATE_ZARAX[IndLang];
end;

procedure TFormPrK_PROT_DOPUSK.SetSelectSQLTextFobProt(const Value: String);
begin
  FSelectSQLTextFobProt := Value;
  DataBasePrk.close;
    DataSetFob_Prot.Active                      :=false;
    DataBasePrk.Handle                          :=DBHANDLE;
    DataBasePrk.DefaultTransaction              := TransactionReadPrK;
    DataSetFob_Prot.Database                    := DataBasePrk;
    DataSetFob_Prot.Transaction                 := TransactionReadPrK;
    DataSetFob_Prot.SelectSQL.Clear;
    DataSetFob_Prot.SQLs.SelectSQL.Text         := FSelectSQLTextFobProt;
    DataSetFob_Prot.CloseOpen(false);

    DataSetFob_Prot.Locate('ID_SP_FOB_PROT',ReadIdFobProt,[]);
    if DataSetFob_Prot.FieldValues['SHORT_NAME']<>Null
     then cxLookupComboBoxFob_Prot.Text :=DataSetFob_Prot.FieldValues['SHORT_NAME'];
end;

procedure TFormPrK_PROT_DOPUSK.SetSelectSQLTextPZ(const Value: String);
begin
  FSelectSQLTextPZ := Value;
    DataSetPrKPZ.Active                         :=false;
    DataSetPrKPZ.Database                       := DataBasePrk;
    DataSetPrKPZ.Transaction                    := TransactionReadPrK;
    DataSetPrKPZ.SelectSQL.Clear;
    DataSetPrKPZ.SQLs.SelectSQL.Text            := FSelectSQLTextPZ;
    DataSetPrKPZ.CloseOpen(false);
end;

procedure TFormPrK_PROT_DOPUSK.SetSelectSQLTextPZRight(const Value: String);
begin
{  FSelectSQLTextPZRight := Value;
    DataSetPZ_Right.Active :=false;
    DataSetPZ_Right.Database             := DataBasePrk;
    DataSetPZ_Right.Transaction          := TransactionReadPrK;
    DataSetPZ_Right.SelectSQL.Clear;
    DataSetPZ_Right.SQLs.SelectSQL.Text  :=FSelectSQLTextPZRight;
    DataSetPZ_Right.CloseOpen(false); }
end;

procedure TFormPrK_PROT_DOPUSK.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPrK_PROT_DOPUSK.ActionADDExecute(Sender: TObject);
var
  T:TFormPrK_PROT_DOPUSK_Add;
  id_Locate : int64;
begin
    id_Locate:=-1;
    T:=TFormPrK_PROT_DOPUSK_Add.Create(self);
    if T.ShowModal=MrOk
     then id_Locate:=T.Id_OutPZ_Global;
    T.Free;
    T:=nil;

    if id_Locate>0 then
     begin
      DataSetPrKPZ.CloseOpen(false);
      DataSetPrKPZ.Locate(ID_NAME_PZ,id_Locate,[]);
      //DataSetPZ_Right.CloseOpen(false);
     end;
end;

procedure TFormPrK_PROT_DOPUSK.ActionChangeExecute(Sender: TObject);
var
   DataPRChange :TAArray;
   T:TFormPrK_PROT_DOPUSK_Change;
   TryAgain :boolean;
begin

    TryAgain:=false;
    if DataSetPrKPZ.FieldValues[ID_NAME_PZ]<>Null then
    begin
       DataPRChange :=TAArray.Create;
       DataPRChange['ID'].AsInt64                     :=DataSetPrKPZ.FieldValues[ID_NAME_PZ];
       DataPRChange['DATE_FORM'].AsVariant            :=DataSetPrKPZ.FieldValues['DATE_FORM'];
       DataPRChange['DATE_BEG_PERIOD'].AsVariant      :=DataSetPrKPZ.FieldValues['DATE_BEG_PERIOD'];
       DataPRChange['DATE_END_PERIOD'].AsVariant      :=DataSetPrKPZ.FieldValues['DATE_END_PERIOD'];
       DataPRChange['NOMER'].AsString                 :=DataSetPrKPZ.FieldValues['NOMER'];

       T:=TFormPrK_PROT_DOPUSK_Change.Create(self,DataPRChange);
       T.Caption :=nFormKlassSpravEdit_Change[IndLang]+' '+nFormPrK_PROT_DOPUSK_Caption_change[IndLang];

       if T.ShowModal=MrOk then
        begin
           StoredProcPrK.Transaction.StartTransaction;
           StoredProcPrK.StoredProcName:='PRK_DT_PROT_DOPUSK_CHANGE';
           StoredProcPrK.Prepare;
           StoredProcPrK.ParamByName('ID_DT_PROT_DOPUSK').AsInt64     :=DataPRChange['ID'].AsInt64;
           StoredProcPrK.ParamByName('DATE_FORM').AsDate              :=DataPRChange['DATE_FORM'].AsVariant;
           StoredProcPrK.ParamByName('DATE_BEG_PERIOD').AsDate        :=DataPRChange['DATE_BEG_PERIOD'].AsVariant;
           StoredProcPrK.ParamByName('DATE_END_PERIOD').AsDate        :=DataPRChange['DATE_END_PERIOD'].AsVariant;
           StoredProcPrK.ParamByName('NOMER').AsString                :=DataPRChange['NOMER'].AsString;
           StoredProcPrK.ParamByName('ID_USER').AsInt64               :=ID_USER_GLOBAL;
           try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
                 TryAgain:=true;
              end;
           end;
        end;

       T.Free;
       T:=nil;
      { if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right]<>null
        then DataPRChange['ID_right'].AsInt64 :=DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right]
        else DataPRChange['ID_right'].AsInt64 :=-1; }
       obnovit(DataPRChange['ID'].AsInt64);
       //obnovit_Right(DataPRChange['ID_right'].AsInt64);
       DataPRChange.Free;
       DataPRChange:=nil;
   end;
   if TryAgain=true
    then ActionChangeExecute(sender);
end;

procedure TFormPrK_PROT_DOPUSK.WriteIdFobProt;
var
  reg:   TRegistry;
begin
  if DataSetFob_Prot.FieldValues['ID_SP_FOB_PROT']<>Null then
   begin
      reg:=TRegistry.Create;
      try
          reg.RootKey :=HKEY_CURRENT_USER;
          if reg.OpenKey('\Software\PrK\DATA\',true) then
          begin
             reg.WriteString('ID_SP_FOB_PROT_ProtZach', VarToStr(DataSetFob_Prot.FieldValues['ID_SP_FOB_PROT']));
          end;
       finally
           reg.Free;
       end;
   end;
end;

procedure TFormPrK_PROT_DOPUSK.cxLookupComboBoxFob_ProtPropertiesChange(
  Sender: TObject);
begin
   WriteIdFobProt;
   if TFormPrK_PROT_DOPUSK(self).Showing=true
    then cxGridPrKPZ.SetFocus;
end;

function TFormPrK_PROT_DOPUSK.ReadIdFobProt :int64;
var
  reg               :TRegistry;
  ReadRegistryValue :string;
begin
  reg:=TRegistry.Create;
 // если '', то брать первую попавшуюся запись
  ReadRegistryValue:='';
  try
    reg.RootKey :=HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\PrK\Data\',false) then
    begin
        ReadRegistryValue :=reg.ReadString('ID_SP_FOB_PROT_ProtZach');
    end;
  finally
     reg.Free;
  end;

  If Trim(ReadRegistryValue)='' then
   begin
     Result:=-1;
   end
   else begin
     Result:=StrToInt64(ReadRegistryValue);
   end;
end;

procedure TFormPrK_PROT_DOPUSK.obnovit_Right(id_obnovit: int64);
begin
  //DataSetPZ_Right.CloseOpen(false);
  //DataSetPZ_Right.Locate(ID_NAME_PZ_Right,id_obnovit,[]);
end;

procedure TFormPrK_PROT_DOPUSK.obnovit(id_obnovit: int64);
begin
  DataSetPrKPZ.CloseOpen(false);
  DataSetPrKPZ.Locate(ID_NAME_PZ,id_obnovit,[]);
end;

procedure TFormPrK_PROT_DOPUSK.ActionObnovExecute(Sender: TObject);
var
 id_loc_right, id_loc :int64;
begin
 {  if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right]<>Null
    then id_loc_right:=StrToInt64(DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right])
    else id_loc_right:=-1;   }
   if DataSetPrKPZ.FieldValues[ID_NAME_PZ]<>Null
    then id_loc:=DataSetPrKPZ.FieldValues[ID_NAME_PZ]
    else id_loc:=-1;

   obnovit(id_loc);
  // obnovit_Right(id_loc_right);
end;

procedure TFormPrK_PROT_DOPUSK.ActionOtmenaExecute(Sender: TObject);
begin
  close;
end;

procedure TFormPrK_PROT_DOPUSK.ActionDELExecute(Sender: TObject);
begin

   if DataSetPrKPZ.FieldValues[ID_NAME_PZ]<>Null then
     begin
       if prkMessageDlg(nMsgBoxTitle[IndLang],nMsgDel[IndLang],
                        mtInformation,mbOKCancel,IndLang)=mrOK then
         begin
            StoredProcPrK.Transaction.StartTransaction;
            StoredProcPrK.StoredProcName:='PRK_DT_PROT_DOPUSK_DEL';
            StoredProcPrK.Prepare;
            StoredProcPrK.ParamByName(ID_NAME_PZ).AsInt64 := DataSetPrKPZ.FieldValues[ID_NAME_PZ];
            StoredProcPrK.ParamByName('ID_USER').AsInt64  :=ID_USER_GLOBAL;
            try
              StoredProcPrK.ExecProc;
              StoredProcPrK.Transaction.Commit;
              cxGridPrKPZDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLang]+chr(13)+
                        nMsgTryAgain[IndLang]+nMsgOr[IndLang]+nMsgToAdmin[IndLang]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLang]),MB_OK or MB_ICONWARNING);
                 StoredProcPrK.Transaction.Rollback;
               end;
            end;
            obnovit(StrToInt64(DataSetPrKPZ.FieldValues[ID_NAME_PZ]));
             /// DataSetPZ_Right.CloseOpen(false);
         end;
     end;

end;

procedure TFormPrK_PROT_DOPUSK.ActionPrintExecute(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
  Id_Input:int64;
begin
    if DataSetPrKPZ.FieldValues[ID_NAME_PZ]<>Null then
     begin
      InputParam :=TAArray.Create;
      InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
      InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrk.Handle);
      InputParam['Input']['aNameReport'].AsString         := 'PROT_DOPUSK';
      i:=1;
      InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_PROT_DOPUSK';
      InputParam['Input']['ParamValues'][i].AsVariant     := StrToint(VarToStr(DataSetPrKPZ.FieldValues[ID_NAME_PZ]));
      i:=2;
      InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_PROT_DOPUSK';
      InputParam['Input']['ParamValues'][i].AsVariant     := StrToint(VarToStr(DataSetPrKPZ.FieldValues[ID_NAME_PZ]));

      InputParam['Input']['Count_Param'].AsInteger        := 2;
      uPrK_Loader.ShowAllPrkBpl(self,InputParam);
     end;
end;

procedure TFormPrK_PROT_DOPUSK.ActionPrintPrExecute(Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
  Id_Input:int64;
begin
   { if DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right]<>Null then
     begin
      InputParam :=TAArray.Create;
      InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
      InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrk.Handle);
      InputParam['Input']['aNameReport'].AsString         := 'PRIK_ZACH';
      i:=1;
      InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_PRIK_ZACH';
      Id_Input                                            :=  DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right];
      InputParam['Input']['ParamValues'][i].AsVariant     := Id_Input;
      i:=2;
      InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_PRIK_ZACH';
      Id_Input                                            :=  DataSetPZ_Right.FieldValues[ID_NAME_PZ_Right];
      InputParam['Input']['ParamValues'][i].AsVariant     :=Id_Input;

      InputParam['Input']['Count_Param'].AsInteger        := 2;
      uPrK_Loader.ShowAllPrkBpl(self,InputParam);  
     end;   }
end;

procedure TFormPrK_PROT_DOPUSK.ActionAbitShowExecute(Sender: TObject);
var
  T:TFormPrK_PD_Abit_Show;
  InputParam :TAArray;
begin
    if DataSetPrKPZ.FieldValues['ID_DT_PROT_DOPUSK']<>Null then
    begin
      InputParam:=TAArray.Create;
      InputParam['SelectSQL_Text'].AsString      :='Select * from PRK_DT_PROT_DOPUSK_LIST_SELECT(:ID_DT_PROT_DOPUSK,:ID_SP_GOD_NABORA)';
      InputParam['SelectSQL_Text_Add'].AsString  :='Select * from PRK_DT_PROT_DOPUSK_ABIT_INS_SEL(:ID_SP_GOD_NABORA)';
      InputParam['StoredProcDelName'].AsString   :='PRK_DT_PROT_DOPUSK_ABIT_DEL';
      InputParam['StoredProcAddName'].AsString   :='PRK_DT_PROT_DOPUSK_ABIT_ADD';
      InputParam['Prot_Prikaz'].AsInteger        :=1;
      InputParam['ParamName'].AsString           :='ID_DT_PROT_DOPUSK';
      InputParam['ParamValue'].AsInt64           :=DataSetPrKPZ.FieldValues['ID_DT_PROT_DOPUSK'];
      T:=TFormPrK_PD_Abit_Show.Create(self,InputParam);
      T.Caption :=nFormPrK_PZ_Abit_ShowProtokol_Caption[IndLang];
      T.ShowModal;
      T.Free;
      T:=nil;
      InputParam.Free;
      InputParam:=nil;
    end;
end;

end.
