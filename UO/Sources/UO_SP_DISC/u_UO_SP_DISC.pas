unit u_UO_SP_DISC;

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
  Tfm_UO_SP_DISC = class(TForm)
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
    DataSet_uo__sp_typeID_SP_DISC: TFIBBCDField;
    DataSet_uo__sp_typeNAME: TFIBStringField;
    DataSet_uo__sp_typeSHORT_NAME: TFIBStringField;
    DataSet_uo__sp_typeKOD: TFIBIntegerField;
    DataSet_uo__sp_typeNPP: TFIBIntegerField;
    DataSet_uo__sp_typeID_SP_TYPE_DISC: TFIBBCDField;
    DataSet_uo__sp_typeTYPE_DISC: TFIBStringField;
    cxGrid_uo__sp_type: TcxGrid;
    cxGrid_uo__sp_typeDBTableView1: TcxGridDBTableView;
    cxGrid_uo__sp_typeDBTableView1NPP: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1TYPE_DISC: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1KOD: TcxGridDBColumn;
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
    DataSet_uo__sp_typeFULL_NAME: TFIBStringField;
    cxGrid_uo__sp_typeDBTableView1FULL_NAME: TcxGridDBColumn;
    frxReport1: TfrxReport;
    Panel1: TPanel;
    cxLabel25: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    Action1: TAction;
    cxButton1: TcxButton;
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
    procedure Action1Execute(Sender: TObject);
    procedure cxTextEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    { Private declarations }
    kod_get: Integer;
    good: Integer;
    npp_get: Integer;
    goodn: Integer;
    PROCEDURE proverkakod(kod: integer);
    PROCEDURE proverkanpp(npp: integer);
  public 
    { Public declarations }

    temp_kod: Integer;
    temp_npp: Integer;
    temp_full_name: String;
    temp_name: String;
    temp_short_name: String;
    temp_disc: Int64;
    type_kod: String;
    type_npp: String;
    temp_type_npp: Integer;
    temp_type_disc_name: String;
    temp_type_disc: Int64;

    cap : Integer;

    id_disc : Int64;
    id_type_disc_sp_disc : Int64;
    Full_Name_Disc: String;
    Name_Disc: String;
    Short_Name_Disc: String;
    Kod_Disc: Integer;
    Npp_Disc: Integer;
    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;

  end;

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;
var
  fm_UO_SP_DISC: Tfm_UO_SP_DISC;

implementation

uses u_UO_SP_DISC_EDIT;

{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
   T : Tfm_UO_SP_DISC;
begin
   T := Tfm_UO_SP_DISC.Create(aOwner, aParam);
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

constructor Tfm_UO_SP_DISC.Create(aOwner: TComponent;
  aParam: TAArray);
begin
    if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
    begin
        DBHANDLE      := PVoid(aParam['Input']['aDBHANDLE'].asInteger);

        inherited Create(aOwner);
        ResultArray   := aParam;
        DataBase_uo__sp_type.Close;
        DataBase_uo__sp_type.Handle := DBHANDLE;

        DataSet_prov_kod.Database       := DataBase_uo__sp_type;
        DataSet_prov_kod.Transaction    := TransactionRead_uo__sp_type;

        DataSet_prov_npp.Database       := DataBase_uo__sp_type;
        DataSet_prov_npp.Transaction    := TransactionRead_uo__sp_type;

        TransactionRead_uo__sp_type.StartTransaction;


        LoadCaption;
        DataSet_uo__sp_type.CloseOpen(false);
    end
    else ShowMessage('Ошибка Handl`a Базы');
end;

procedure Tfm_UO_SP_DISC.proverkakod(kod: integer);
begin
//    DataSet_prov_kod.Active := false;
//    DataSet_prov_kod.ParamByName('KOD').Value:=kod;
//    DataSet_prov_kod.Active := true;

    DataSet_prov_kod.Close;
    DataSet_prov_kod.Sqls.SelectSQL.Text := 'select max(KOD) as KOD from UO_SP_DISC';
    DataSet_prov_kod.Open;
    temp_kod := DataSet_prov_kod.fbn('KOD').AsInteger+1;
    goodn := 1;
    good  := 1;
    DataSet_prov_kod.Close;
{    if DataSet_prov_kod.IsEmpty then
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
        temp_kod:=kod_get;
        good:=0;
    end; }
end;

PROCEDURE Tfm_UO_SP_DISC.proverkanpp(npp: integer);
begin
    DataSet_prov_npp.Close;
    DataSet_prov_npp.Sqls.SelectSQL.Text := 'select max(NPP) as NPP from UO_SP_DISC';
    DataSet_prov_npp.Open;
    temp_npp := DataSet_prov_npp.fbn('NPP').Asinteger+1;
    goodn := 1;
    good  := 1;
    DataSet_prov_npp.Close;

{    if DataSet_prov_npp.IsEmpty then
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

procedure Tfm_UO_SP_DISC.ActionADDExecute(Sender: TObject);
var
    T: Tfm_UO_SP_DISC_EDIT;
    TryAgain :boolean;
begin
    cap:=0;
    TryAgain:=false;
    T := Tfm_UO_SP_DISC_EDIT.Create(self);
    t.cxButtonEditTypeDisc.Text:='';
    proverkakod(1);
    proverkanpp(1);
    t.cxSpinEditKod.Value:=temp_kod;
    t.cxSpinEditNPP.Value:=temp_npp;
    if(HelpContext=1)then
    begin
        t.cxTextEditFullName.Text:=temp_full_name;
        t.cxTextEditName.Text:=temp_name;
        t.cxTextEditShortName.Text:=temp_short_name;
        t.cxSpinEditKod.Value:=temp_kod;
        t.cxSpinEditNPP.Value:=temp_npp;
        t.cxButtonEditTypeDisc.Text:=temp_type_disc_name;
    end;

    if T.ShowModal=MrOk then
    begin
        proverkakod(t.cxSpinEditKod.Value);
        proverkanpp(t.cxSpinEditNPP.Value);
        if ((good=1)and(goodn=1))then
        begin
            StoredProc_uo_sp_type.Transaction.StartTransaction;
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_DISC_ADD';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('FULL_NAME').AsString         := t.cxTextEditFullName.Text;
            StoredProc_uo_sp_type.ParamByName('NAME').AsString              := t.cxTextEditName.Text;
            StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString        := t.cxTextEditShortName.Text;
            StoredProc_uo_sp_type.ParamByName('KOD').Value                  := T.cxSpinEditKod.Value;
            StoredProc_uo_sp_type.ParamByName('NPP').Value                  := T.cxSpinEditNPP.Value;
            StoredProc_uo_sp_type.ParamByName('ID_SP_TYPE_DISC').AsInt64    := id_type_disc_sp_disc;
            temp_type_npp:=t.cxSpinEditNPP.Value;
            try
                StoredProc_uo_sp_type.ExecProc;
                StoredProc_uo_sp_type.Transaction.commit;
            except on e: Exception do
                begin
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
            temp_full_name:= t.cxTextEditFullName.Text;
            temp_name:=t.cxTextEditName.Text;
            temp_short_name:=t.cxTextEditShortName.Text;
            temp_disc:= id_disc;
            temp_type_disc:=id_type_disc_sp_disc;
            temp_type_disc_name:=t.cxButtonEditTypeDisc.Text;
        end;
    end;
    T.Free;
    T:=nil;
    if TryAgain=true
        then ActionADDExecute(sender)
    else
        HelpContext:=0;

    DataSet_uo__sp_type.Active:=false;
    DataSet_uo__sp_type.Active:=true;
    DataSet_uo__sp_type.Locate('NPP',temp_type_npp,[]);
end;

procedure Tfm_UO_SP_DISC.ActionObnovExecute(Sender: TObject);
begin
    temp_disc:=DataSet_uo__sp_typeID_SP_DISC.AsInt64;
    DataSet_uo__sp_type.Active:=false;
    DataSet_uo__sp_type.Active:=true;
    DataSet_uo__sp_type.Locate('ID_SP_DISC',temp_disc,[]);
end;

procedure Tfm_UO_SP_DISC.ActionChangeExecute(Sender: TObject);
var 
    T:Tfm_UO_SP_DISC_EDIT;
    TryAgain :boolean;
begin
    cap:=1;
    temp_disc:=DataSet_uo__sp_typeID_SP_DISC.AsInt64;
    if DataSet_uo__sp_type.IsEmpty then exit;
//    good:=1;
//    goodn:=1;
    TryAgain:=false;
    T := Tfm_UO_SP_DISC_EDIT.Create(self);
    if(HelpContext=1)then
    begin
        t.cxTextEditFullName.Text:=temp_full_name;
        t.cxTextEditName.Text:=temp_name;
        t.cxTextEditShortName.Text:=temp_short_name;
        t.cxSpinEditKod.Value:=temp_kod;
        t.cxSpinEditNPP.Value:=temp_npp;
        t.cxButtonEditTypeDisc.Text:=temp_type_disc_name;
    end
    ELSE
    begin
        T.cxTextEditFullName.Text:=DataSet_uo__sp_typeFULL_NAME.Value;
        T.cxTextEditName.Text:= DataSet_uo__sp_typeNAME.Value;
        T.cxTextEditShortName.Text:= DataSet_uo__sp_typeSHORT_NAME.Value;
        T.cxSpinEditKod.Value:=DataSet_uo__sp_typeKOD.Value;
        T.cxSpinEditNPP.Value:=DataSet_uo__sp_typeNPP.Value;
        T.cxButtonEditTypeDisc.Text:=DataSet_uo__sp_typeTYPE_DISC.Value;
        type_kod:=DataSet_uo__sp_typeKOD.AsString;
        type_npp:=DataSet_uo__sp_typeNPP.AsString;
        temp_kod:=StrToInt(type_kod);
        temp_npp:=StrToInt(type_npp);
        id_type_disc_sp_disc:=DataSet_uo__sp_typeID_SP_TYPE_DISC.AsInt64;
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
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_DISC_CHANGE';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('ID_SP_DISC').AsInt64          :=DataSet_uo__sp_typeID_SP_DISC.AsInt64;
            StoredProc_uo_sp_type.ParamByName('FULL_NAME').AsString         :=t.cxTextEditFullName.Text;
            StoredProc_uo_sp_type.ParamByName('NAME').AsString         :=t.cxTextEditName.Text;
            StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString   :=t.cxTextEditShortName.Text;
            StoredProc_uo_sp_type.ParamByName('KOD').Value             :=T.cxSpinEditKod.Value;
            StoredProc_uo_sp_type.ParamByName('NPP').Value              :=t.cxSpinEditNPP.Value;
            StoredProc_uo_sp_type.ParamByName('ID_SP_TYPE_DISC').AsInt64              :=id_type_disc_sp_disc;
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
            temp_full_name:=T.cxTextEditFullName.Text;
            temp_name:=t.cxTextEditName.Text;
            temp_short_name:=t.cxTextEditShortName.Text;
            temp_type_disc_name:=t.cxButtonEditTypeDisc.Text;
            temp_disc:=id_disc;
            temp_type_disc:= id_type_disc_sp_disc;
        end;
    end;
    T.Free;
    T:=nil;
    if TryAgain=true
        then ActionChangeExecute(sender)
    else
        HelpContext:=0;
    DataSet_uo__sp_type.Active:=false;
    DataSet_uo__sp_type.Active:=true;
    DataSet_uo__sp_type.Locate('ID_SP_DISC',temp_disc,[]);

end;

procedure Tfm_UO_SP_DISC.ActionDELExecute(Sender: TObject);
begin
    if DataSet_uo__sp_type.IsEmpty then exit;
    if DataSet_uo__sp_typeID_SP_TYPE_DISC.AsString<>Null then
    begin
        if MessageDlg('Ви дійсно бажаете видалити цей запис',mtInformation,mbOKCancel,0)=mrOK then
        begin
            StoredProc_uo_sp_type.Transaction.StartTransaction;
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_DISC_DEL';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('ID_SP_DISC').AsInt64:= DataSet_uo__sp_typeID_SP_DISC.AsInt64;
            try
                StoredProc_uo_sp_type.ExecProc;
                StoredProc_uo_sp_type.Transaction.Commit;
                cxGrid_uo__sp_typeDBTableView1.NavigatorButtons.Prior.Click;
            except on e :Exception do
                begin
                    ShowMessage('Неможливо видалити тип!'+E.Message);
                    StoredProc_uo_sp_type.Transaction.Rollback;
                end;
            end;
        end;
        ActionObnovExecute(sender);
    end;
end;

procedure Tfm_UO_SP_DISC.ActionViewExecute(Sender: TObject);
var
    T:Tfm_UO_SP_DISC_EDIT;
begin
    cap:=2;
    if DataSet_uo__sp_type.IsEmpty then exit;
    if DataSet_uo__sp_typeID_SP_TYPE_DISC.AsString<>Null then
    begin
        T := Tfm_UO_SP_DISC_EDIT.Create(self);
        T.cxTextEditFullName.Text:= DataSet_uo__sp_typeFULL_NAME.Value;
        T.cxTextEditName.Text:= DataSet_uo__sp_typeNAME.Value;
        T.cxTextEditShortName.Text:= DataSet_uo__sp_typeSHORT_NAME.Value;
        T.cxSpinEditKod.Value:=DataSet_uo__sp_typeKOD.Value;
        T.cxSpinEditNPP.Value:=DataSet_uo__sp_typeNPP.Value;
        t.cxButtonEditTypeDisc.Text:=DataSet_uo__sp_typeTYPE_DISC.Value;
        T.cxTextEditFullName.Properties.ReadOnly       :=true;
        T.cxTextEditName.Properties.ReadOnly       :=true;
        T.cxTextEditShortName.Properties.ReadOnly      :=true;
        T.cxButtonEditTypeDisc.Enabled:=false;
        T.cxSpinEditKod.Properties.ReadOnly  :=TRUE;
        T.cxSpinEditNPP.Properties.ReadOnly :=true;
        T.cxButtonOK.Visible:=false;
        T.cxButtonCansel.Visible:=false;
        T.ShowModal;
        T.Free;
        T:=nil;
    end;
end;

procedure Tfm_UO_SP_DISC.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure Tfm_UO_SP_DISC.ActionVibratExecute(Sender: TObject);
begin
    if DataSet_uo__sp_typeID_SP_TYPE_DISC.AsString<>NULL then
    begin
        if DataSet_uo__sp_typeID_SP_TYPE_DISC.AsString='-1' then exit;
        if FormStyle=fsNormal then
        begin
            FillArrayFromDataSet(ResultArray['OutPut'], DataSet_uo__sp_type);
            close;
        end
        else
            ModalResult:=mrOk;
    end;
end;

procedure Tfm_UO_SP_DISC.cxGrid_uo__sp_typeDBTableView1DblClick(
  Sender: TObject);
begin
    if ActionVibrat.Visible=true then
        ActionVibratExecute(SENDER);
end;

procedure Tfm_UO_SP_DISC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        ResultArray.Free;
        ResultArray := Nil;
        Action      := caFree;
    end;
end;

procedure Tfm_UO_SP_DISC.LoadCaption;
begin
    Caption:= 'Довідник дисциплін';
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

    cxGrid_uo__sp_typeDBTableView1FULL_NAME.Caption:='Повна назва';
    cxGrid_uo__sp_typeDBTableView1NAME.Caption:='Назва';
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME.Caption:='Коротка назва';
    cxGrid_uo__sp_typeDBTableView1KOD.Caption:='Код';
    cxGrid_uo__sp_typeDBTableView1TYPE_DISC.Caption:='Тип дисципліни';
    cxGrid_uo__sp_typeDBTableView1NPP.Caption:='Номер';
    dxStatusBarSP.Panels[0].Text          := 'Ins - Додати';
    dxStatusBarSP.Panels[1].Text          := 'F2 - Змінити';
    dxStatusBarSP.Panels[2].Text          := 'Del - Видалити';
    dxStatusBarSP.Panels[3].Text          := 'F5 - Оновити';
    dxStatusBarSP.Panels[4].Text          := 'F3 -Показати';
    dxStatusBarSP.Panels[5].Text          := 'Enter -Вибрати';
    dxStatusBarSP.Panels[6].Text          := 'Ctrl+F - Шв. пошук';

end;

procedure Tfm_UO_SP_DISC.ActionPrintExecute(Sender: TObject);
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
    Memo1.Text:='Довідник дисциплін';
    Memo6.Text:='Назва';
    Memo7.Text:='Коротка назва';
    Memo8.Text:='Номер';
    Memo9.Text:='Код';
    Memo10.Text:='Тип дисципліни';
    frxReport1.ShowReport;
end;

procedure Tfm_UO_SP_DISC.Action1Execute(Sender: TObject);
begin
    cxTextEdit1.SetFocus;
end;

procedure Tfm_UO_SP_DISC.cxTextEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
    begin
        cxButton1Click(Sender);
    end;
end;

procedure Tfm_UO_SP_DISC.cxButton1Click(Sender: TObject);
var
    s      : string;
    cTemp  : Char;
    flag   : boolean;
begin
        flag := true;
        if not DataSet_uo__sp_type.LocateNext('FULL_NAME', cxTextEdit1.Text, [loPartialKey]) then
        begin
            s := AnsiUpperCase(cxTextEdit1.Text);
            if DataSet_uo__sp_type.LocateNext('FULL_NAME', s, [loPartialKey])
                then begin
                    cxGrid_uo__sp_type.setFocus;
                    flag := false;
                end;
        end else begin
            cxGrid_uo__sp_type.setFocus;
            flag := false;
        end;

        if flag then
        begin
            s      := cxTextEdit1.Text;
            cTemp  := AnsiUpperCase(s)[1];
            s      := AnsiLowerCase(s);
            s[1]   := cTemp;
            if DataSet_uo__sp_type.LocateNext('FULL_NAME', s, [loPartialKey])
                then cxGrid_uo__sp_type.setFocus
                else showmessage('Пошук закінчено!');
        end;

end;

end.
