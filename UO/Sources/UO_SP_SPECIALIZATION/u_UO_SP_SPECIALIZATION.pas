unit u_UO_SP_SPECIALIZATION;

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
  frxExportRTF, frxDBSet;

type
  Tfm_UO_SP_SPECIALIZATION = class(TForm)
    cxGrid_uo__sp_type: TcxGrid;
    cxGrid_uo__sp_typeDBTableView1: TcxGridDBTableView;
    cxGrid_uo__sp_typeLevel1: TcxGridLevel;
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
    StoredProc_uo_sp_type: TpFIBStoredProc;
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
    DataSet_uo__sp_typeID_SP_SPECIALIZATION: TFIBBCDField;
    DataSet_uo__sp_typeID_SPEC: TFIBBCDField;
    DataSet_uo__sp_typeNAME: TFIBStringField;
    DataSet_uo__sp_typeSHORT_NAME: TFIBStringField;
    DataSet_uo__sp_typeKOD: TFIBIntegerField;
    DataSet_uo__sp_typeNPP: TFIBIntegerField;
    DataSet_uo__sp_typeSPEC: TFIBStringField;
    cxGrid_uo__sp_typeDBTableView1NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1KOD: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1NPP: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1SPEC: TcxGridDBColumn;
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
    frxReport1: TfrxReport;
    DataSet_prov_kod: TpFIBDataSet;
    DataSet_prov_npp: TpFIBDataSet;
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
  private
    { Private declarations }
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;

//    kod_get: Integer;
    good: Integer;
//    npp_get: Integer;
    goodn: Integer;
    PROCEDURE proverkakod(kod: integer);
    PROCEDURE proverkanpp(npp: integer);
  public
    temp_kod: Integer;
    temp_npp: Integer;
    temp_name: String;
    temp_short_name: String;
    temp_SP_SPECIALIZATION: Int64;
    temp_id_spec: Int64;
    temp_spec_name : String;
    type_kod: String;
    type_npp: String;
    temp_type_npp: Integer;

    cap : Integer;

    id_SP_SPECIALIZATION : Int64;
    id_SPEC_SP_SPECIALIZATION : Int64;
    Name_SP_SPECIALIZATION: String;
    Short_Name_SP_SPECIALIZATION: String;
    Kod_SP_SPECIALIZATION: Integer;
    Npp_SP_SPECIALIZATION: Integer;
    { Public declarations }
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;

  end;
procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;
var
  fm_UO_SP_SPECIALIZATION: Tfm_UO_SP_SPECIALIZATION;

implementation

uses u_UO_SP_SPECIALIZATION_EDIT;

{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
   T : Tfm_UO_SP_SPECIALIZATION;
begin
   T := Tfm_UO_SP_SPECIALIZATION.Create(aOwner, aParam);

   T.FormStyle := aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                   T.ActionVibrat.Enabled:=true;
                   T.dxBarLargeButtonVibrat.Visible := ivAlways;
                 end;
     fsMDIChild: begin
                   T.ActionVibrat.Enabled:=false;
                   T.dxBarLargeButtonVibrat.Visible := ivNever;
                 end;
     else
        T.Free;
   end;
end;

constructor Tfm_UO_SP_SPECIALIZATION.Create(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE      := PVoid(aParam['Input']['aDBHANDLE'].asInteger);

        inherited Create(aOwner);
        ResultArray   := aParam;
        DataBase_uo__sp_type.Close;
        DataBase_uo__sp_type.Handle := DBHANDLE;

        DataSet_prov_kod.Database    := DataBase_uo__sp_type;
        DataSet_prov_kod.Transaction := TransactionRead_uo__sp_type;

        DataSet_prov_npp.Database    := DataBase_uo__sp_type;
        DataSet_prov_npp.Transaction := TransactionRead_uo__sp_type;

        TransactionRead_uo__sp_type.StartTransaction;

        LoadCaption;
        DataSet_uo__sp_type.CloseOpen(false);
    end
    else ShowMessage('Ошибка Handl`a Базы');
end;

procedure Tfm_UO_SP_SPECIALIZATION.proverkakod(kod: integer);
begin
    DataSet_prov_kod.Close;
    DataSet_prov_kod.Sqls.SelectSQL.Text := 'select max(kod) as kod from UO_SP_SPECIALIZATION';
    DataSet_prov_kod.open;
    temp_kod := DataSet_prov_kod.fbn('KOD').AsInteger + 1;
    good:=1;
    DataSet_prov_kod.Close;
{if DataSet_prov_kod.IsEmpty then
begin
    temp_kod:=kod;
    good:=1;
end
else
begin
    kod_get:=1;
        DataSet_prov_kod.Active:=false;
        DataSet_prov_kod.ParamByName('KOD').Value:=kod_get;
        DataSet_prov_kod.Active:=true  ;
    while not(DataSet_prov_kod.IsEmpty) do
    begin
        kod_get:=kod_get+1;
        DataSet_prov_kod.Active:=false;
        DataSet_prov_kod.ParamByName('KOD').Value:=kod_get;
        DataSet_prov_kod.Active:=true  ;
    end;
    //ShowMessage('такий код вже існує спробуйте Код= '+IntToStr(kod_get));
    temp_kod:=kod_get;
    good:=0;
end;}
end;

PROCEDURE Tfm_UO_SP_SPECIALIZATION.proverkanpp(npp: integer);
begin
    DataSet_prov_npp.Close;
    DataSet_prov_npp.Sqls.SelectSQL.Text := 'select max(npp) as npp from UO_SP_SPECIALIZATION';
    DataSet_prov_npp.Open;
    temp_npp := DataSet_prov_npp.fbn('NPP').AsInteger + 1;
    goodn:=1;
    DataSet_prov_npp.Close;
{if DataSet_prov_npp.IsEmpty then
begin
    temp_npp:=npp;
    goodn:=1;
end
else
begin
    npp_get:=1;
        DataSet_prov_npp.Active:=false;
        DataSet_prov_npp.ParamByName('NPP').Value:=npp_get;
        DataSet_prov_npp.Active:=true  ;
    while not(DataSet_prov_npp.IsEmpty) do
    begin
        npp_get:=npp_get+1;
        DataSet_prov_npp.Active:=false;
        DataSet_prov_npp.ParamByName('NPP').Value:=npp_get;
        DataSet_prov_npp.Active:=true  ;
    end;
    //ShowMessage('такий номер вже існує спробуйте номер= '+IntToStr(npp_get));
    temp_npp:=npp_get;
    goodn:=0;
end;}
end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionADDExecute(Sender: TObject);
var
   T: Tfm_UO_SP_SPECIALIZATION_EDIT;
   TryAgain :boolean;
begin
   cap:=0;
   TryAgain:=false;
   T := Tfm_UO_SP_SPECIALIZATION_EDIT.Create(self);
   t.cxButtonEditTypeDisc.Text:='';
   proverkakod(1);
   proverkanpp(1);
   t.cxSpinEditKod.Value:=temp_kod;
   t.cxSpinEditNPP.Value:=temp_npp;
   if(HelpContext=1)then
   begin
       t.cxTextEditName.Text:=temp_name;
       t.cxTextEditShortName.Text:=temp_short_name;
       t.cxSpinEditKod.Value:=temp_kod;
       t.cxSpinEditNPP.Value:=temp_npp;
       t.cxButtonEditTypeDisc.Text:=temp_spec_name;
   end;
   if T.ShowModal=MrOk then
    begin
       proverkakod(t.cxSpinEditKod.Value);
       proverkanpp(t.cxSpinEditNPP.Value);
       if ((good=1)and(goodn=1))then
       begin
       StoredProc_uo_sp_type.Transaction.StartTransaction;
       StoredProc_uo_sp_type.StoredProcName:='UO_SP_SPECIALIZATION_ADD';
       StoredProc_uo_sp_type.Prepare;
       StoredProc_uo_sp_type.ParamByName('ID_SPEC').AsInt64       :=id_SPEC_SP_SPECIALIZATION;
       StoredProc_uo_sp_type.ParamByName('NAME').AsString         :=t.cxTextEditName.Text;
       StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString   :=t.cxTextEditShortName.Text;
       StoredProc_uo_sp_type.ParamByName('KOD').Value             :=T.cxSpinEditKod.Value;
       StoredProc_uo_sp_type.ParamByName('NPP').Value             :=T.cxSpinEditNPP.Value;
       temp_type_npp:=t.cxSpinEditNPP.Value;
       try
          StoredProc_uo_sp_type.ExecProc;
          StoredProc_uo_sp_type.Transaction.commit;
       except on e: Exception do
          begin
             {MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
             }
             ShowMessage('Неможливо додати тип!'+E.Message);
             StoredProc_uo_sp_type.Transaction.Rollback;
             TryAgain:=true;
          end;
       end;
       end
       else
       begin
            MessageDlg('такий код або номер вже існують.'#13'Сістема вже підставила потрібні!',mtInformation,mbOKCancel,0);
            TryAgain:=true;
            HelpContext:=1;
            //temp_kod:=t.cxSpinEditKod.Value;
            //temp_npp:=t.cxSpinEditNPP.Value;
            temp_name:=t.cxTextEditName.Text;
            temp_short_name:=t.cxTextEditShortName.Text;
            temp_SP_SPECIALIZATION:= id_SP_SPECIALIZATION;
            temp_id_spec:=id_SPEC_SP_SPECIALIZATION;
            temp_spec_name:=t.cxButtonEditTypeDisc.Text;
       end;

          //DataSPAdd['ID'].AsInt64:=StoredProcPrKSostPK.FieldByName('ID_OUT').AsInt64;

    end;

   T.Free;
//   T:=nil;
   if TryAgain=true
      then ActionADDExecute(sender)
   else
      HelpContext:=0;

DataSet_uo__sp_type.Active:=false;
DataSet_uo__sp_type.Active:=true;
DataSet_uo__sp_type.Locate('NPP',temp_type_npp,[]);
end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionObnovExecute(Sender: TObject);
begin
temp_SP_SPECIALIZATION:=DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsInt64;
DataSet_uo__sp_type.Active:=false;
DataSet_uo__sp_type.Active:=true;
DataSet_uo__sp_type.Locate('ID_SP_SPECIALIZATION',temp_SP_SPECIALIZATION,[]);
end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionChangeExecute(Sender: TObject);
var 
   T:Tfm_UO_SP_SPECIALIZATION_EDIT;
   TryAgain :boolean;
begin
    cap:=1;
    temp_SP_SPECIALIZATION:=DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsInt64;
    if DataSet_uo__sp_type.IsEmpty then exit;
    good:=1;
    goodn:=1;
    TryAgain:=false;
    T := Tfm_UO_SP_SPECIALIZATION_EDIT.Create(self);
    if(HelpContext=1)then
    begin
       t.cxTextEditName.Text:=temp_name;
       t.cxTextEditShortName.Text:=temp_short_name;
       t.cxSpinEditKod.Value:=temp_kod;
       t.cxSpinEditNPP.Value:=temp_npp;
       t.cxButtonEditTypeDisc.Text:=temp_spec_name;
    end
    ELSE
    begin
          T.cxTextEditName.Text:= DataSet_uo__sp_typeNAME.Value;
          T.cxTextEditShortName.Text:= DataSet_uo__sp_typeSHORT_NAME.Value;
          T.cxSpinEditKod.Value:=DataSet_uo__sp_typeKOD.Value;
          T.cxSpinEditNPP.Value:=DataSet_uo__sp_typeNPP.Value;
          T.cxButtonEditTypeDisc.Text:=DataSet_uo__sp_typeSPEC.Value;
          type_kod:=DataSet_uo__sp_typeKOD.AsString;
          type_npp:=DataSet_uo__sp_typeNPP.AsString;
          temp_kod:=StrToInt(type_kod);
          temp_npp:=StrToInt(type_npp);
          id_SPEC_SP_SPECIALIZATION:=DataSet_uo__sp_typeID_SPEC.AsInt64;
     end;
     if T.ShowModal=MrOk then
     begin
        if(type_kod<>inttostr(t.cxSpinEditKod.Value))then
            proverkakod(t.cxSpinEditKod.Value);
        if(type_npp<>inttostr(t.cxSpinEditNPP.Value))then
            proverkanpp(t.cxSpinEditNPP.Value);
        if ((good=1)and(goodn=1))then
        begin
            StoredProc_uo_sp_type.Transaction.StartTransaction;
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_SPECIALIZATION_CHANGE';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('ID_SP_SPECIALIZATION').AsInt64          :=DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsInt64;
            StoredProc_uo_sp_type.ParamByName('ID_SPEC').AsInt64          :=id_SPEC_SP_SPECIALIZATION;
            StoredProc_uo_sp_type.ParamByName('NAME').AsString         :=t.cxTextEditName.Text;
            StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString   :=t.cxTextEditShortName.Text;
            StoredProc_uo_sp_type.ParamByName('KOD').Value             :=T.cxSpinEditKod.Value;
            StoredProc_uo_sp_type.ParamByName('NPP').Value              :=t.cxSpinEditNPP.Value;
            try
                StoredProc_uo_sp_type.ExecProc;
                StoredProc_uo_sp_type.Transaction.Commit;
            except on e: Exception do
                begin
                    ShowMessage('Неможливо добавити тип!'+E.Message);
                    StoredProc_uo_sp_type.Transaction.Rollback;
                    TryAgain:=true;
                end;
            end;
        end
        else
        begin
            MessageDlg('такий код або номер вже існують.'#13'Сістема вже підставила потрібні!',mtInformation,mbOKCancel,0);
            TryAgain:=true;
            HelpContext:=1;
            temp_name:=t.cxTextEditName.Text;
            temp_short_name:=t.cxTextEditShortName.Text;
            temp_SP_SPECIALIZATION:= id_SP_SPECIALIZATION;
            temp_spec_name:=t.cxButtonEditTypeDisc.Text;
            temp_id_spec:= id_SPEC_SP_SPECIALIZATION;
        end;
    end;
    T.Free;
//    T:=nil;
    if TryAgain=true
        then ActionChangeExecute(sender)
    else
        HelpContext:=0;
    DataSet_uo__sp_type.Active:=false;
    DataSet_uo__sp_type.Active:=true;
    DataSet_uo__sp_type.Locate('ID_SP_SPECIALIZATION',temp_SP_SPECIALIZATION,[]);

end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionDELExecute(Sender: TObject);
begin
   if DataSet_uo__sp_type.IsEmpty then exit;
     if DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsString<>Null then
     begin
       if MessageDlg('Ви дійсно бажаете видалити цей запис',mtInformation,mbOKCancel,0)=mrOK then
         begin
            StoredProc_uo_sp_type.Transaction.StartTransaction;
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_SPECIALIZATION_DEL';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('ID_SP_SPECIALIZATION').AsInt64:= DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsInt64;
            try
              StoredProc_uo_sp_type.ExecProc;
              StoredProc_uo_sp_type.Transaction.Commit;
              cxGrid_uo__sp_typeDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
               begin
                 {MessageBox(Handle,Pchar(nMsgErrorTransaction[IndLangSP]+chr(13)+
                        nMsgTryAgain[IndLangSP]+nMsgOr[IndLangSP]+nMsgToAdmin[IndLangSP]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IndLangSP]),MB_OK or MB_ICONWARNING);
                 }
                 ShowMessage('Неможливо видалити тип!'+E.Message);
                 StoredProc_uo_sp_type.Transaction.Rollback;
               end;
            end;
         end;
         ActionObnovExecute(sender);
     end;
end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionViewExecute(Sender: TObject);
var
   T:Tfm_UO_SP_SPECIALIZATION_EDIT;
begin
    cap:=2;
    if DataSet_uo__sp_type.IsEmpty then exit;
    if DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsString<>Null then
    begin
        T := Tfm_UO_SP_SPECIALIZATION_EDIT.Create(self);
        T.cxTextEditName.Text:= DataSet_uo__sp_typeNAME.Value;
        T.cxTextEditShortName.Text:= DataSet_uo__sp_typeSHORT_NAME.Value;
        T.cxSpinEditKod.Value:=DataSet_uo__sp_typeKOD.Value;
        T.cxSpinEditNPP.Value:=DataSet_uo__sp_typeNPP.Value;
        t.cxButtonEditTypeDisc.Text:=DataSet_uo__sp_typeSPEC.Value;
        T.cxTextEditName.Properties.ReadOnly       :=true;
        T.cxTextEditShortName.Properties.ReadOnly      :=true;
        T.cxSpinEditKod.Properties.ReadOnly  :=true;
        T.cxSpinEditNPP.Properties.ReadOnly :=true;
        T.cxButtonEditTypeDisc.Enabled:=false;
        T.cxButtonOK.Visible:=false;
        T.cxButtonCansel.Visible:=false;
        T.ShowModal;
        T.Free;
//        T:=nil;
    end;
end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionOtmenaExecute(Sender: TObject);
begin
        Close;
end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionVibratExecute(Sender: TObject);
begin
  if DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsString<>NULL then
    begin
      if DataSet_uo__sp_typeID_SP_SPECIALIZATION.AsString='-1' then exit;
      if FormStyle=fsNormal then
      begin
              FillArrayFromDataSet(ResultArray['OutPut'], DataSet_uo__sp_type);
              Close;
      end
      else
          ModalResult:=mrOk;
    end;
end;

procedure Tfm_UO_SP_SPECIALIZATION.cxGrid_uo__sp_typeDBTableView1DblClick(
  Sender: TObject);
begin
if ActionVibrat.Visible=true then
  ActionVibratExecute(SENDER);
end;

procedure Tfm_UO_SP_SPECIALIZATION.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        ResultArray.Free;
        ResultArray := Nil;
        Action      := caFree;
    end;
end;

procedure Tfm_UO_SP_SPECIALIZATION.LoadCaption;
begin
    Caption:= 'Довідник спеціалізацій';
    ActionADD.Caption:='Додати';
    ActionChange.Caption:='Змінити';
    ActionDEL.Caption:='Видалити';
    ActionView.Caption:='Показати';
    ActionObnov.Caption:='Оновити';
    ActionVibrat.Caption:='Вибрати';
    ActionOtmena.Caption:='Відміна';

    ActionADD.Hint:='Додати';
    ActionChange.Hint:='Змінити';
    ActionDEL.Hint:='Видалити';
    ActionView.Hint:='Показати';
    ActionObnov.Hint:='Оновити';
    ActionVibrat.Hint:='Вибрати';
    ActionOtmena.Hint:='Відміна';

    ActionPrint.Caption:='Друкувати';
    ActionPrint.Hint:='Друкувати';

    cxGrid_uo__sp_typeDBTableView1NAME.Caption:='Назва';
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME.Caption:='Коротка назва';
    cxGrid_uo__sp_typeDBTableView1KOD.Caption:='Код';
    cxGrid_uo__sp_typeDBTableView1NPP.Caption:='Номер';
    cxGrid_uo__sp_typeDBTableView1SPEC.Caption:='Спеціальність';
    dxStatusBarSP.Panels[0].Text          := 'Додати - Ins';
    dxStatusBarSP.Panels[1].Text          :='Змінити - F2';
    dxStatusBarSP.Panels[2].Text          :='Видалити - Del';
    dxStatusBarSP.Panels[3].Text          :='Оновити - F5';
    dxStatusBarSP.Panels[4].Text          :='Показати - F3';
    dxStatusBarSP.Panels[5].Text          :='Вибрати - Enter';
end;

procedure Tfm_UO_SP_SPECIALIZATION.ActionPrintExecute(Sender: TObject);
var
    Memo1,Memo6,Memo7,Memo9,Memo8, Memo10: TfrxMemoView;

begin
    if DataSet_uo__sp_type.IsEmpty then exit;
    Memo1 := frxReport1.FindObject('Memo1') as TfrxMemoView;
    Memo6 := frxReport1.FindObject('Memo6') as TfrxMemoView;
    Memo7 := frxReport1.FindObject('Memo7') as TfrxMemoView;
    Memo9 := frxReport1.FindObject('Memo9') as TfrxMemoView;
    Memo8 := frxReport1.FindObject('Memo8') as TfrxMemoView;
    Memo10:= frxReport1.FindObject('Memo10')as TfrxMemoView;
    Memo1.Text:='Довідник спеціалізацій';
    Memo6.Text:='Назва';
    Memo7.Text:='Коротка назва';
    Memo8.Text:='Номер';
    Memo9.Text:='Код';
    Memo10.Text:='Спеціальність';
    frxReport1.ShowReport;

end;

end.
