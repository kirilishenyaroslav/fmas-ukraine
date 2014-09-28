unit u_UO_SP_TYPE_DISC;

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
  Tfm_UO_SP_TYPE_DISC = class(TForm)
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
    cxGrid_uo__sp_typeDBTableView1NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1KOD: TcxGridDBColumn;
    cxGrid_uo__sp_typeDBTableView1NPP: TcxGridDBColumn;
    ActionList_uo__sp_type: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    DataSet_uo__sp_typeID_SP_TYPE_DISC: TFIBBCDField;
    DataSet_uo__sp_typeNAME: TFIBStringField;
    DataSet_uo__sp_typeSHORT_NAME: TFIBStringField;
    DataSet_uo__sp_typeKOD: TFIBIntegerField;
    DataSet_uo__sp_typeNPP: TFIBIntegerField;
    DataSource_prov_kod: TDataSource;
    DataSource_prov_npp: TDataSource;
    DataSource_del: TDataSource;
    pFIBDataSet_del: TpFIBDataSet;
    pFIBDataSet_delID_SP_TYPE_DISC: TFIBBCDField;
    pFIBDataSet_delNAME: TFIBStringField;
    pFIBDataSet_delSHORT_NAME: TFIBStringField;
    pFIBDataSet_delKOD: TFIBIntegerField;
    pFIBDataSet_delNPP: TFIBIntegerField;
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
    pFIBDataSet_delNORM_HOURS: TFIBIntegerField;
    DataSet_uo__sp_typeNORM_HOURS: TFIBIntegerField;
    frxReport1: TfrxReport;
    cxGrid_uo__sp_typeDBTableView1DBColumn1: TcxGridDBColumn;
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

    kod_get: Integer;
    good: Integer;
    npp_get: Integer;
    goodn: Integer;
    PROCEDURE proverkakod(kod: integer);
    PROCEDURE proverkanpp(npp: integer);
  public
    temp_kod: Integer;
    temp_npp: Integer;
    temp_name: String;
    temp_short_name: String;
    temp_type_disc: Int64;
    type_kod: String;
    type_npp: String;
    temp_type_npp: Integer;
    cap : Integer;

    id_type_disc : Int64;
    Name_Type_Disc: String;
    Short_Name_Type_Disc: String;
    Kod_Type_Disc: Integer;
    Npp_Type_Disc: Integer;


    constructor Create(aOwner: TComponent; aParam : TAArray); reintroduce; overload;
  end;

procedure ShowAllUoBpl (aOwner: TComponent; aParam : TAArray); stdcall;
  exports   ShowAllUoBpl;

implementation

uses u_UO_SP_TYPE_DISC_EDIT;

{$R *.dfm}

procedure ShowAllUoBpl(aOwner: TComponent; aParam : TAArray);
var
    T : Tfm_UO_SP_TYPE_DISC;
begin
    T :=Tfm_UO_SP_TYPE_DISC.Create(aOwner, aParam);

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

constructor Tfm_UO_SP_TYPE_DISC.Create(aOwner: TComponent;
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

procedure Tfm_UO_SP_TYPE_DISC.proverkakod(kod: integer);
begin
    DataSet_prov_kod.Close;
    DataSet_prov_kod.Sqls.SelectSQL.Text := 'select max(kod) aS kod from UO_SP_TYPE_DISC';
    DataSet_prov_kod.Open;
    temp_kod := DataSet_prov_kod.fbn('KOD').Asinteger + 1;
    good:=1;
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
    //ShowMessage('такий код вже існує спробуйте Код= '+IntToStr(kod_get));
        temp_kod:=kod_get;
        good:=0;
    end;  }
end;

PROCEDURE Tfm_UO_SP_TYPE_DISC.proverkanpp(npp: integer);
begin
    DataSet_prov_npp.Close;
    DataSet_prov_npp.Sqls.SelectSQL.Text := 'select max(NPP) as NPP from UO_SP_TYPE_DISC';
    DataSet_prov_npp.Open;
    temp_npp := DataSet_prov_npp.fbn('NPP').AsInteger + 1;
    goodn:=1;
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
    temp_npp:=npp_get;
    goodn:=0;
end;}
end;

procedure Tfm_UO_SP_TYPE_DISC.ActionADDExecute(Sender: TObject);
var
    T: Tfm_UO_SP_TYPE_DISC_EDIT;
    TryAgain :boolean;
begin
    cap:=0;
    TryAgain:=false;
  { if DataSetPrKSostPK.FieldValues[ID_NAME]<>Null
      then DataSPAdd['ID'].AsInt64:=StrToInt64(DataSetPrKSostPK.FieldValues[ID_NAME]);
    }
    T := Tfm_UO_SP_TYPE_DISC_EDIT.Create(self);
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
    end;
    if T.ShowModal=MrOk then
    begin
        proverkakod(t.cxSpinEditKod.Value);
        proverkanpp(t.cxSpinEditNPP.Value);
        if ((good=1)and(goodn=1))then
        begin
            StoredProc_uo_sp_type.Transaction.StartTransaction;
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_TYPE_DISC_ADD';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('NAME').AsString         := T.cxTextEditName.Text;
            StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString   := T.cxTextEditShortName.Text;
            StoredProc_uo_sp_type.ParamByName('KOD').Value             := T.cxSpinEditKod.Value;
            StoredProc_uo_sp_type.ParamByName('NPP').Value             := T.cxSpinEditNPP.Value;
            StoredProc_uo_sp_type.ParamByName('NORM_HOURS').Value      := StrToInt(T.cxTextEdit1.Text);
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
            temp_name:=t.cxTextEditName.Text;
            temp_short_name:=t.cxTextEditShortName.Text;
            temp_type_disc:= id_type_disc;
        end;
          //DataSPAdd['ID'].AsInt64:=StoredProcPrKSostPK.FieldByName('ID_OUT').AsInt64;

    end;

    T.Free;
    if TryAgain=true
        then ActionADDExecute(sender)
    else
        HelpContext:=0;

    DataSet_uo__sp_type.Active:=false;
    DataSet_uo__sp_type.Active:=true;
    DataSet_uo__sp_type.Locate('NPP',temp_type_npp,[]);
end;

procedure Tfm_UO_SP_TYPE_DISC.ActionObnovExecute(Sender: TObject);
begin
    temp_type_disc:=DataSet_uo__sp_typeID_SP_TYPE_DISC.AsInt64;
    DataSet_uo__sp_type.Active:=false;
    DataSet_uo__sp_type.Active:=true;
    DataSet_uo__sp_type.Locate('ID_SP_TYPE_DISC',temp_type_disc,[]);
end;

procedure Tfm_UO_SP_TYPE_DISC.ActionChangeExecute(Sender: TObject);
var 
    T:Tfm_UO_SP_TYPE_DISC_EDIT;
    TryAgain :boolean;
begin
    cap:=1;
    temp_type_disc:=DataSet_uo__sp_typeID_SP_TYPE_DISC.AsInt64;

    if DataSet_uo__sp_type.IsEmpty then exit;
    good:=1;
    goodn:=1;
    TryAgain:=false;
    T := Tfm_UO_SP_TYPE_DISC_EDIT.Create(self);
    if(HelpContext=1)then
    begin
        t.cxTextEditName.Text:=temp_name;
        t.cxTextEditShortName.Text:=temp_short_name;
        t.cxSpinEditKod.Value:=temp_kod;
        t.cxSpinEditNPP.Value:=temp_npp;
    end
    ELSE
    begin
        T.cxTextEditName.Text:= DataSet_uo__sp_typeNAME.Value;
        T.cxTextEditShortName.Text:= DataSet_uo__sp_typeSHORT_NAME.Value;
        T.cxSpinEditKod.Value := DataSet_uo__sp_typeKOD.Value;
        T.cxSpinEditNPP.Value := DataSet_uo__sp_typeNPP.Value;
        T.cxTextEdit1.Text    := DataSet_uo__sp_type.fbn('NORM_HOURS').AsString;
        type_kod:=DataSet_uo__sp_typeKOD.AsString;
        type_npp:=DataSet_uo__sp_typeNPP.AsString;
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
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_TYPE_DISC_CHANGE';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('ID_SP_TYPE_DISC').AsInt64          :=DataSet_uo__sp_typeID_SP_TYPE_DISC.AsInt64;
            StoredProc_uo_sp_type.ParamByName('NAME').AsString         :=t.cxTextEditName.Text;
            StoredProc_uo_sp_type.ParamByName('SHORT_NAME').AsString   :=t.cxTextEditShortName.Text;
            StoredProc_uo_sp_type.ParamByName('KOD').Value             :=T.cxSpinEditKod.Value;
            StoredProc_uo_sp_type.ParamByName('NPP').Value             :=t.cxSpinEditNPP.Value;
            StoredProc_uo_sp_type.ParamByName('NORM_HOURS').AsInteger  := StrToInt(T.cxTextEdit1.Text);
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
            temp_npp:=t.cxSpinEditNPP.Value;
            temp_name:=t.cxTextEditName.Text;
            temp_short_name:=t.cxTextEditShortName.Text;
            temp_type_disc:= id_type_disc;
        end;
    end;
    T.Free;
    if TryAgain=true then
        ActionChangeExecute(sender)
    else
        HelpContext:=0;
    DataSet_uo__sp_type.Active:=false;
    DataSet_uo__sp_type.Active:=true;
    DataSet_uo__sp_type.Locate('ID_SP_TYPE_DISC',temp_type_disc,[]);
end;

procedure Tfm_UO_SP_TYPE_DISC.ActionDELExecute(Sender: TObject);
begin
    if DataSet_uo__sp_type.IsEmpty then exit;

    if DataSet_uo__sp_typeID_SP_TYPE_DISC.AsString<>Null then
    begin
        if MessageDlg('Ви дійсно бажаете видалити цей запис',mtInformation,mbOKCancel,0)=mrOK then
        begin
            StoredProc_uo_sp_type.Transaction.StartTransaction;
            StoredProc_uo_sp_type.StoredProcName:='UO_SP_TYPE_DISC_DEL';
            StoredProc_uo_sp_type.Prepare;
            StoredProc_uo_sp_type.ParamByName('ID_SP_TYPE_DISC').AsInt64:= DataSet_uo__sp_typeID_SP_TYPE_DISC.AsInt64;
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

procedure Tfm_UO_SP_TYPE_DISC.ActionViewExecute(Sender: TObject);
var
   T:Tfm_UO_SP_TYPE_DISC_EDIT;
begin
    cap:=2;
   if DataSet_uo__sp_type.IsEmpty then exit;
   if DataSet_uo__sp_typeID_SP_TYPE_DISC.AsString<>Null then
   begin
        T := Tfm_UO_SP_TYPE_DISC_EDIT.Create(self);
        T.cxTextEditName.Text:= DataSet_uo__sp_typeNAME.Value;
        T.cxTextEditShortName.Text:= DataSet_uo__sp_typeSHORT_NAME.Value;
        T.cxSpinEditKod.Value:=DataSet_uo__sp_typeKOD.Value;
        T.cxSpinEditNPP.Value:=DataSet_uo__sp_typeNPP.Value;
        T.cxTextEdit1.Text    := DataSet_uo__sp_type.fbn('NORM_HOURS').AsString;

        T.cxTextEditName.Properties.ReadOnly       :=true;
        T.cxTextEdit1.Properties.ReadOnly          :=true;
        T.cxTextEditShortName.Properties.ReadOnly      :=true;
        T.cxSpinEditKod.Properties.ReadOnly  :=true;
        T.cxSpinEditNPP.Properties.ReadOnly :=true;
        T.cxButtonOK.Visible:=false;
        T.cxButtonCansel.Visible:=false;
        T.ShowModal;
        T.Free;
    end;
end;

procedure Tfm_UO_SP_TYPE_DISC.ActionOtmenaExecute(Sender: TObject);
begin
    close;
end;

procedure Tfm_UO_SP_TYPE_DISC.ActionVibratExecute(Sender: TObject);
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

procedure Tfm_UO_SP_TYPE_DISC.cxGrid_uo__sp_typeDBTableView1DblClick(
  Sender: TObject);
begin
    if ActionVibrat.Visible=true then
        ActionVibratExecute(SENDER);
end;

procedure Tfm_UO_SP_TYPE_DISC.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then
    begin
        ResultArray.Free;
        ResultArray := Nil;
        Action      := caFree;
    end;
end;
procedure Tfm_UO_SP_TYPE_DISC.LoadCaption;
begin
    Caption:= 'Довідник типів дисциплін';
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

    cxGrid_uo__sp_typeDBTableView1NAME.Caption       := 'Назва';
    cxGrid_uo__sp_typeDBTableView1SHORT_NAME.Caption := 'Коротка назва';
    cxGrid_uo__sp_typeDBTableView1KOD.Caption        := 'Код';
    cxGrid_uo__sp_typeDBTableView1NPP.Caption        := 'Номер';
    cxGrid_uo__sp_typeDBTableView1DBColumn1.Caption  := 'Кіл-ть годин';
    dxStatusBarSP.Panels[0].Text                     := 'Додати - Ins';
    dxStatusBarSP.Panels[1].Text          :='Змінити - F2';
    dxStatusBarSP.Panels[2].Text          :='Видалити - Del';
    dxStatusBarSP.Panels[3].Text          :='Оновити - F5';
    dxStatusBarSP.Panels[4].Text          :='Показати - F3';
    dxStatusBarSP.Panels[5].Text          :='Вибрати - Enter';
end;
procedure Tfm_UO_SP_TYPE_DISC.ActionPrintExecute(Sender: TObject);
var
    Memo1,Memo6,Memo7,Memo9,Memo8: TfrxMemoView;

begin
    if DataSet_uo__sp_type.IsEmpty then exit;
    Memo1 := frxReport1.FindObject('Memo1') as TfrxMemoView;
    Memo6 := frxReport1.FindObject('Memo6') as TfrxMemoView;
    Memo7 := frxReport1.FindObject('Memo7') as TfrxMemoView;
    Memo9 := frxReport1.FindObject('Memo9') as TfrxMemoView;
    Memo8 := frxReport1.FindObject('Memo8') as TfrxMemoView;
    Memo1.Text:='Довідник типів дисциплін';
    Memo6.Text:='Назва';
    Memo7.Text:='Коротка назва';
    Memo8.Text:='Номер';
    Memo9.Text:='Код';
    frxReport1.ShowReport;

end;

end.
