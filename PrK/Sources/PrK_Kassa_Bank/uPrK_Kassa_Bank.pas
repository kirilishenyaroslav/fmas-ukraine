unit uPrK_Kassa_Bank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxContainer, dxBar, dxBarExtItems,
  ActnList, ImgList, Placemnt, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, dxStatusBar,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RxMemDS,ibase,ib_externals,
  AArray, cxGroupBox, cxSplitter, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLabel, cxDBEdit,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TFormPrK_Kassa_Bank = class(TForm)
    dxStatusBarPrK: TdxStatusBar;
    StyleRepositoryPrK: TcxStyleRepository;
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
    DataBasePrK: TpFIBDatabase;
    TransactionReadPrK: TpFIBTransaction;
    TransactionWritePrK: TpFIBTransaction;
    StoredProcPrK: TpFIBStoredProc;
    DataSetPrKKB: TpFIBDataSet;
    DataSourcePrKKB: TDataSource;
    FormStoragePrK: TFormStorage;
    ImageListPrK: TImageList;
    ActionListPrK: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    dxBarManagerPrK: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonChange: TdxBarLargeButton;
    dxBarLargeButtonVibrat: TdxBarLargeButton;
    dxBarLargeButtonObnov: TdxBarLargeButton;
    dxBarLargeButtonOtmena: TdxBarLargeButton;
    dxBarLargeButtonView: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    cxEditStyleControllerPrK: TcxEditStyleController;
    RxMemoryDataPrKKB: TRxMemoryData;
    DataSetPrKInfo: TpFIBDataSet;
    DataSourcePrKInfo: TDataSource;
    cxGridPrKInfo: TcxGrid;
    cxGridPrKInfoDBTableView1: TcxGridDBTableView;
    colFIO: TcxGridDBColumn;
    colSHORT_NAME_FAK: TcxGridDBColumn;
    colSHORT_NAME_SPEC: TcxGridDBColumn;
    colSHORT_NAME_FORM_STUD: TcxGridDBColumn;
    cxGridPrKInfoLevel1: TcxGridLevel;
    cxSplitterContracts: TcxSplitter;
    cxGroupBoxKassaBank: TcxGroupBox;
    cxGridPrKKB: TcxGrid;
    cxGridPrKKBDBTableView1: TcxGridDBTableView;
    colSRS: TcxGridDBColumn;
    colSumma: TcxGridDBColumn;
    cxGridPrKKBLevel1: TcxGridLevel;
    cxGroupBoxFiltr: TcxGroupBox;
    cxLabelGodNabora: TcxLabel;
    cxLookupComboBoxGodNabora: TcxLookupComboBox;
    DataSetGodNabora: TpFIBDataSet;
    DataSourceGodNabora: TDataSource;
    cxGroupBox1: TcxGroupBox;
    cxDBTextEditNAME_Smeta: TcxDBTextEdit;
    cxLabelNAME_Smeta: TcxLabel;
    cxLabelName_Statiya: TcxLabel;
    cxDBTextEditNAME_Statiya: TcxDBTextEdit;
    cxLabelName_Razdel: TcxLabel;
    cxDBTextEditName_Razdel: TcxDBTextEdit;
    cxLabelFiltrOnFio: TcxLabel;
    cxTextEditFiltrOnFio: TcxTextEdit;
    cxButtonFiltrOK: TcxButton;
    ActionFiltrOK: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cxLookupComboBoxGodNaboraPropertiesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure cxTextEditFiltrOnFioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxTextEditFiltrOnFioEnter(Sender: TObject);
    procedure cxTextEditFiltrOnFioExit(Sender: TObject);
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    TextViewColor           :TColor;
    IndLang                 :integer;
    FSelectSQLTextSRS: string;
    FSelectSQLTextInfo: string;
    FSelectSQLTextGodN: string;
    Layout: array[0.. KL_NAMELENGTH] of char;
    procedure SetSelectSQLTextInfo(const Value: string);
    procedure SetSelectSQLTextSRS(const Value: string);
    procedure SetSelectSQLTextGodN(const Value: string);
    procedure WriteIdCodNabKB;
    procedure ReadIdCodNabKB;
    procedure InicCaption;
   public
     ID_USER_GLOBAL       :Int64;
     constructor Create(aOwner: TComponent;aParam :TAArray);overload;
     Property SelectSQLTextInfo   :string read FSelectSQLTextInfo write SetSelectSQLTextInfo;
     Property SelectSQLTextSRS    :string read FSelectSQLTextSRS write SetSelectSQLTextSRS;
     Property SelectSQLTextGodN   :string read FSelectSQLTextGodN write SetSelectSQLTextGodN;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;

var
  FormPrK_Kassa_Bank: TFormPrK_Kassa_Bank;

implementation
uses
  uPrK_Resources,uConstants,registry;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Kassa_Bank;
begin
   T:=TFormPrK_Kassa_Bank.Create(aOwner,aParam);

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

constructor TFormPrK_Kassa_Bank.Create(aOwner: TComponent;
  aParam: TAArray);
begin
  if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLang       :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
          cxEditStyleControllerPrK.Style.Color      := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_Kassa_Bank.FormCreate(Sender: TObject);
begin
  InicCaption;
  cxTextEditFiltrOnFio.Text :='';
  SelectSQLTextGodN         :='Select * from PRK_SP_GOD_NABORA_SELECT';
  SelectSQLTextInfo         :='Select * from PRK_INFO_FOR_KASSA_BANK_SELECT(:ID_SP_GOD_NABORA) where upper(FIO) like upper(:FIO_FILTR)';
  SelectSQLTextSRS          :='Select * from PRK_INI_KASSA_BANK_SELECT';
end;

procedure TFormPrK_Kassa_Bank.SetSelectSQLTextGodN(const Value: string);
begin
  FSelectSQLTextGodN := Value;
    DataBasePrK.close;
    DataSetGodNabora.Active                         :=false;
    DataBasePrK.Handle                              :=DBHANDLE;
    DataBasePrK.DefaultTransaction                  := TransactionReadPrK;
    DataSetGodNabora.Database                       := DataBasePrK;
    DataSetGodNabora.Transaction                    := TransactionReadPrK;
    DataSetGodNabora.SelectSQL.Clear;
    DataSetGodNabora.SQLs.SelectSQL.Text            := FSelectSQLTextGodN;
    DataSetGodNabora.CloseOpen(false);
end;

procedure TFormPrK_Kassa_Bank.SetSelectSQLTextInfo(const Value: string);
begin
  FSelectSQLTextInfo := Value;
    DataSetPrKInfo.Active                         :=false;
    DataSetPrKInfo.Database                       := DataBasePrK;
    DataSetPrKInfo.Transaction                    := TransactionReadPrK;
    DataSetPrKInfo.SelectSQL.Clear;
    DataSetPrKInfo.SQLs.SelectSQL.Text            := FSelectSQLTextInfo;
 {   if Trim(cxLookupComboBoxGodNabora.Text)=''
     then DataSetPrKInfo.ParamByName('ID_SP_GOD_NABORA').AsInt64  :=-1
     else DataSetPrKInfo.ParamByName('ID_SP_GOD_NABORA').AsInt64  :=ResultArray['Input']['ID_SP_GOD_NABORA'].AsInt64;
    DataSetPrKInfo.CloseOpen(false); }
end;

procedure TFormPrK_Kassa_Bank.SetSelectSQLTextSRS(const Value: string);
begin
  FSelectSQLTextSRS := Value;
    DataSetPrKKB.Active                         :=false;
    DataSetPrKKB.Database                       := DataBasePrK;
    DataSetPrKKB.Transaction                    := TransactionReadPrK;
    DataSetPrKKB.SelectSQL.Clear;
    DataSetPrKKB.SQLs.SelectSQL.Text            := FSelectSQLTextSRS;
    DataSetPrKKB.CloseOpen(true);
    RxMemoryDataPrKKB.LoadFromDataSet(DataSetPrKKB,DataSetPrKKB.RecordCount,lmCopy);
    DataSetPrKKB.Active :=false;

    RxMemoryDataPrKKB.First;
    while not RxMemoryDataPrKKB.Eof do
     begin
      RxMemoryDataPrKKB.Edit;
      RxMemoryDataPrKKB.FieldByName('PROCENT').AsCurrency :=RxMemoryDataPrKKB.FieldByName('PROCENT').AsCurrency*ResultArray['Input']['Summa'].AsCurrency/100;
      RxMemoryDataPrKKB.Post;
      RxMemoryDataPrKKB.Next;
     end;
end;

procedure TFormPrK_Kassa_Bank.cxLookupComboBoxGodNaboraPropertiesChange(
  Sender: TObject);
begin
  if TFormPrK_Kassa_Bank(self).Showing= false
   then exit;
  DataSetPrKInfo.Active                                 :=false;
  DataSetPrKInfo.ParamByName('ID_SP_GOD_NABORA').AsInt64:=DataSetGodNabora.FieldValues['ID_SP_GOD_NABORA'];
  DataSetPrKInfo.ParamByName('FIO_FILTR').AsString      :=cxTextEditFiltrOnFio.text;
  DataSetPrKInfo.CloseOpen(false);
  WriteIdCodNabKB;
  cxGridPrKInfo.SetFocus;
end;

procedure TFormPrK_Kassa_Bank.WriteIdCodNabKB;
var
  reg:   TRegistry;
begin
  reg:=TRegistry.Create;
  try
      reg.RootKey :=HKEY_CURRENT_USER;
      if reg.OpenKey('\Software\PrK\DATA\',true) then
      begin
         reg.WriteString('ID_SP_GOD_NABORA_KassaBank', VarToStr(DataSetGodNabora.FieldValues['ID_SP_GOD_NABORA']));
      end;
   finally
       reg.Free;
   end;
end;

procedure TFormPrK_Kassa_Bank.ReadIdCodNabKB;
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
        ReadRegistryValue :=reg.ReadString('ID_SP_GOD_NABORA_KassaBank');
    end;
  finally
     reg.Free;
  end;

  If Trim(ReadRegistryValue)='' then
   begin
     DataSetGodNabora.First;
     cxLookupComboBoxGodNabora.Text :=DataSetGodNabora.FieldValues['SHORT_NAME'];
   end
   else begin
     DataSetGodNabora.Locate('ID_SP_GOD_NABORA',StrToInt64(ReadRegistryValue),[]);
     cxLookupComboBoxGodNabora.Text :=DataSetGodNabora.FieldValues['SHORT_NAME'];
   end;

  DataSetPrKInfo.Active                             :=false;
  DataSetPrKInfo.ParamByName('FIO_FILTR').AsString  :='';
  DataSetPrKInfo.ParamByName('ID_SP_GOD_NABORA').AsInt64:=DataSetGodNabora.fieldValues['ID_SP_GOD_NABORA'];
  DataSetPrKInfo.CloseOpen(false);
end;

procedure TFormPrK_Kassa_Bank.InicCaption;
begin
    TFormPrK_Kassa_Bank(self).Caption      :=nFormPrK_Kassa_Bank_Caption[IndLang];
    ActionVibrat.Caption                   :=nAction_Vibrat[IndLang];
    ActionObnov.Caption                    :=nActiont_Obnov[IndLang];
    ActionOtmena.Caption                   :=nAction_Exit[IndLang];
    ActionFiltrOK.Caption                  :='';

    ActionVibrat.Hint                      :=nHintAction_Vibrat[IndLang];
    ActionObnov.Hint                       :=nHintAction_Obnov[IndLang];
    ActionOtmena.Hint                      :=nHintAction_Exit[IndLang];
    ActionFiltrOK.Hint                     :=nHintActionFiltrOK[IndLang];

    dxStatusBarPrK.Panels[0].Text          :=nStatBarVibrat[IndLang];
    dxStatusBarPrK.Panels[1].Text          :=nStatBarObnov[IndLang];
    dxStatusBarPrK.Panels[2].Text          :=nStatBarExit[IndLang];

    colFIO.Caption                         :=ncolFIO[IndLang];
    colSHORT_NAME_FAK.Caption              :=ncolNAME_FAK[IndLang];
    colSHORT_NAME_SPEC.Caption             :=ncolNAME_SPEC[IndLang];
    colSHORT_NAME_FORM_STUD.Caption        :=ncolSHORT_NAME_CN_FORM_STUD[IndLang];

    colSRS.Caption                         :=ncolSmRSt[IndLang];
    colSumma.Caption                       :=ncolSumma[IndLang];

    cxLabelFiltrOnFio.Caption              :=nLabelFiltrOnFio[IndLang];
    cxLabelGodNabora.Caption               :=nLabelGodNabora[IndLang];
    cxLabelNAME_Smeta.Caption              :=nLabel_Smeta[IndLang];
    cxLabelName_Statiya.Caption            :=nLabel_Statiya[IndLang];
    cxLabelName_Razdel.Caption             :=nLabel_Razdel[IndLang];
end;

procedure TFormPrK_Kassa_Bank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
    end;
end;

procedure TFormPrK_Kassa_Bank.FormShow(Sender: TObject);
begin
                                       {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLang]),KLF_ACTIVATE);
    ReadIdCodNabKB;
    cxTextEditFiltrOnFio.SetFocus;
end;

procedure TFormPrK_Kassa_Bank.ActionOtmenaExecute(Sender: TObject);
begin
 close;
end;

procedure TFormPrK_Kassa_Bank.ActionObnovExecute(Sender: TObject);
begin
  DataSetPrKInfo.ParamByName('FIO_FILTR').AsString      :=cxTextEditFiltrOnFio.text+'%';
  DataSetPrKInfo.CloseOpen(false);
  cxGridPrKInfo.SetFocus;
end;

procedure TFormPrK_Kassa_Bank.ActionVibratExecute(Sender: TObject);
var
 i:Integer;
begin
      if DataSetPrKInfo.FieldValues['ID_DT_ABIT']=Null then exit;
        FillArrayFromDataSet(ResultArray['Output'],DataSetPrKInfo);
      ResultArray['Output']['SRS']['size_SRS'].AsInteger:=RxMemoryDataPrKKB.RecordCount;
      i:=1;
      RxMemoryDataPrKKB.First;
      while not RxMemoryDataPrKKB.Eof do
       begin
         FillArrayFromDataSet(ResultArray['Output']['SRS'][i],RxMemoryDataPrKKB);
         RxMemoryDataPrKKB.Next;
         i:=i+1;
       end;
        ViewArray(self,ResultArray);
        close;
end;

procedure TFormPrK_Kassa_Bank.cxTextEditFiltrOnFioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key=13
      then ActionObnovExecute(Sender);
end;

procedure TFormPrK_Kassa_Bank.cxTextEditFiltrOnFioEnter(Sender: TObject);
begin
   ActionVibrat.ShortCut:=0;
end;

procedure TFormPrK_Kassa_Bank.cxTextEditFiltrOnFioExit(Sender: TObject);
begin
   ActionVibrat.ShortCut:=13;
end;

end.
