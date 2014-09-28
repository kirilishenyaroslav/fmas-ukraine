unit uPRK_DT_ISPIT_OCENKA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxMaskEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, FIBDataSet, pFIBDataSet,
  cxGroupBox,AArray, Placemnt, RxMemDS, cxLabel, cxContainer, cxDBLabel,
  StdCtrls, cxLookAndFeelPainters, ActnList, cxButtons,
  cxDBExtLookupComboBox, cxDBLookupComboBox, cxSplitter, dxBar,
  dxBarExtItems, ImgList;

type
  TFormPRK_DT_ISPIT_OCENKA = class(TForm)
    cxGridPrK_ISPIT_OCENKA: TcxGrid;
    cxGridPrK_ISPIT_OCENKADBTableView1: TcxGridDBTableView;
    cxGridPrK_ISPIT_OCENKALevel1: TcxGridLevel;
    DataSetPrK_ISPIT_OCENKA: TpFIBDataSet;
    cxGroupBoxShapka: TcxGroupBox;
    colFIO: TcxGridDBColumn;
    FormStorageIspitOcenka: TFormStorage;
    RxMemoryDataIspitOcenka: TRxMemoryData;
    colKOLVO_BALLOV: TcxGridDBColumn;
    cxLabelFormStudy: TcxLabel;
    cxLabelPredmet: TcxLabel;
    cxDBLabelDergZakaz: TcxDBLabel;
    cxDBLabelFormStudy: TcxDBLabel;
    Label1: TLabel;
    cxDBLabelPREDM: TcxDBLabel;
    cxLabelSpec: TcxLabel;
    cxDBLabelSpec: TcxDBLabel;
    cxLabelEKZ_DATE: TcxLabel;
    cxDBLabelEKZ_DATE: TcxDBLabel;
    Label2: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxButtonCansel: TcxButton;
    cxButtonOK: TcxButton;
    cxButtonDelVedom: TcxButton;
    cxButtonPrint: TcxButton;
    ActionListEkzVedomOcen: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    ActionDelVedom: TAction;
    ActionPrintVedom: TAction;
    colNAME_OCENKA: TcxGridDBColumn;
    DataSetOcenka: TpFIBDataSet;
    DataSourceOcenka: TDataSource;
    colOCENKA_NUM: TcxGridDBColumn;
    colNPP: TcxGridDBColumn;
    colNOMER_DELA: TcxGridDBColumn;
    cxGridPrKKolVoOcenok: TcxGrid;
    cxGridPrKKolVoOcenokDBTableView1: TcxGridDBTableView;
    cxGridPrKKolVoOcenokLevel1: TcxGridLevel;
    colNAME_OCENKA_KolVo: TcxGridDBColumn;
    RxMemoryDataSumKolVoOcenok: TRxMemoryData;
    DataSourceSumKolVoOcenok: TDataSource;
    cxLabelSHIFR: TcxLabel;
    cxDBLabelSHIFR: TcxDBLabel;
    cxLabelKatStud: TcxLabel;
    cxDBLabelKat_Stud: TcxDBLabel;
    cxLabelFac: TcxLabel;
    cxDBLabelFac: TcxDBLabel;
    colKolVo: TcxGridDBColumn;
    colOCENKA_NUM_KolVo: TcxGridDBColumn;
    cxSplitterContracts: TcxSplitter;
    ImageListIspitOcenka: TImageList;
    ActionListIspitOcenka: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionView: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    ActionPrint: TAction;
    dxBarManagerIspitOcenka: TdxBarManager;
    dxBarLargeButtonAdd: TdxBarLargeButton;
    dxBarLargeButtonDel: TdxBarLargeButton;
    DataSourcePrK_ISPIT_OCENKA: TDataSource;
    ActionPrintTitul: TAction;
    cxButton1: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure ActionPrintVedomExecute(Sender: TObject);
    procedure colKolVoCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure colNAME_OCENKAPropertiesEditValueChanged(Sender: TObject);
    procedure colOCENKA_NUMPropertiesEditValueChanged(Sender: TObject);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionDelVedomExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionPrintTitulExecute(Sender: TObject);
  private
    FSelectSQLTextIO: string;
    FSelectSQLTextOcenka: string;
    Layout: array[0.. KL_NAMELENGTH] of char;
    Second_Calc  :Boolean;
    First_Open   :Boolean;
    procedure SetSelectSQLTextIO(const Value: string);
    procedure InicCaption;
    procedure SetSelectSQLTextOcenka(const Value: string);
    procedure CalcKolVoOcenok;
    procedure Obnovit;
  public
    IOLangEdit :integer;
    DataIO :TAArray;
    constructor Create(aOwner: TComponent;aDataIO :TAArray);overload;
    Property SelectSQLTextIO     :string read FSelectSQLTextIO write SetSelectSQLTextIO;
    Property SelectSQLTextOcenka :string read FSelectSQLTextOcenka write SetSelectSQLTextOcenka;
  end;

var
  FormPRK_DT_ISPIT_OCENKA: TFormPRK_DT_ISPIT_OCENKA;

implementation
uses
   uPrK_Resources,uConstants,uPrK_Ekz_Vedom,uISPIT_VEDOM_ABIT_ADD,
   uPrK_Loader;
{$R *.dfm}

{ TFormPRK_DT_ISPIT_OCENKA }

constructor TFormPRK_DT_ISPIT_OCENKA.Create(aOwner: TComponent;
  aDataIO: TAArray);
begin
  DataIO     :=aDataIO;
  IOLangEdit :=SelectLanguage;
  inherited Create(aOwner);
  Second_Calc :=False;
  First_Open  :=true;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.FormCreate(Sender: TObject);
begin
   cxDBLabelDergZakaz.DataBinding.DataSource   :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;
   cxDBLabelFormStudy.DataBinding.DataSource   :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;
   cxDBLabelPREDM.DataBinding.DataSource       :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;
   cxDBLabelSpec.DataBinding.DataSource        :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;
   cxDBLabelEKZ_DATE.DataBinding.DataSource    :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;
   cxDBLabelSHIFR.DataBinding.DataSource       :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;
   cxDBLabelKat_Stud.DataBinding.DataSource    :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;
   cxDBLabelFac.DataBinding.DataSource         :=TFormPrK_Ekz_Vedom(Self.Owner).DataSourcePrKEkzVedom;

   case RejimPrK(DataIO['Input']['Rejim'].AsVariant) of
   ChangePrK: begin
               ActionDelVedom.Enabled   :=false;
              end;
   ViewPrK:   begin
               ActionADD.Enabled        :=false;
               ActionDel.Enabled        :=false;

               ActionDelVedom.Enabled   :=false;
               ActionSave.Enabled       :=false;

               cxGridPrK_ISPIT_OCENKADBTableView1.OptionsSelection.CellSelect  :=false;
               cxGridPrK_ISPIT_OCENKADBTableView1.OptionsSelection.InvertSelect:=true;
              end;
   DelPrK:    begin
               ActionADD.Enabled        :=false;
               ActionDel.Enabled        :=false;

               ActionSave.Enabled       :=false;
               ActionPrintVedom.Enabled :=false;
              end;
  end;

   SelectSQLTextOcenka :='Select * from PRK_SP_OCENKA_SELECT where IS_SPIVBESIDA=:IS_SPIVBESIDA and IS_ZALIK=:IS_ZALIK or OCENKA_NUM=0';
   SelectSQLTextIO     :='Select * from PRK_DT_ISPIT_OCENKA_SELECT(:ID_DT_ISPIT_VEDOM)';
   InicCaption;
   if ((TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['IS_SPIVBESIDA']=1)  or
       (TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['IS_ZALIK']=1     )  or
       (TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['IS_KOLVO_BALLOV']=0)  ) then
   begin
       colKOLVO_BALLOV.Visible       :=false;
   end;

end;

procedure TFormPRK_DT_ISPIT_OCENKA.InicCaption;
begin
   cxGridPrK_ISPIT_OCENKADBTableView1.Styles.Header     :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleHeader;
   cxGridPrK_ISPIT_OCENKADBTableView1.Styles.Background :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleSkyBlue;
   cxGridPrK_ISPIT_OCENKADBTableView1.Styles.Content    :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleSkyBlue;
   cxGridPrK_ISPIT_OCENKADBTableView1.Styles.Selection  :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleSelection;
   cxGridPrK_ISPIT_OCENKADBTableView1.Styles.Inactive   :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleInactive;

   cxGridPrKKolVoOcenokDBTableView1.Styles.Header     :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleHeader;
   cxGridPrKKolVoOcenokDBTableView1.Styles.Background :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleBackGround_Content;
   cxGridPrKKolVoOcenokDBTableView1.Styles.Content    :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleBackGround_Content;
   cxGridPrKKolVoOcenokDBTableView1.Styles.Selection  :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleSelection;
   cxGridPrKKolVoOcenokDBTableView1.Styles.Inactive   :=TFormPrK_Ekz_Vedom(Self.Owner).cxStyleInactive;

   TFormPRK_DT_ISPIT_OCENKA(self).Caption             :=nFormPRK_DT_ISPIT_OCENKA_Caption[IOLangEdit];
   cxLabelFormStudy.Caption  :=nLabelCnFormStud[IOLangEdit];
   cxLabelKatStud.Caption    :=nLabelCnKatStud[IOLangEdit];
   cxLabelPredmet.Caption    :=nLabelPredm[IOLangEdit];
   cxLabelSpec.Caption       :=nLabelNameSpec[IOLangEdit];
   cxLabelFac.Caption        :=nLabelNameCnFak[IOLangEdit];
   cxLabelSHIFR.Caption      :=nLabelSHIFR[IOLangEdit];
   cxLabelEKZ_DATE.Caption   :=nLabelEKZ_DATE[IOLangEdit];

   ActionDelVedom.Caption                 :=nAction_DelVedom[IOLangEdit];
   ActionSave.Caption                     :=nActionSaveOcenka[IOLangEdit];
   ActionExit.Caption                     :=nActionExit[IOLangEdit];
   ActionPrintVedom.Caption               :=nActiontPrint[IOLangEdit];
   ActionPrintTitul.Caption               :=nActiontPrintTitul[IOLangEdit];

   ActionSave.Hint                        :=nHintActionSave[IOLangEdit];
   ActionPrintVedom.Hint                  :=nHintActiontPrint[IOLangEdit];
   ActionPrintTitul.Hint                  :=nHintActiontPrintTitul[IOLangEdit];

   ActionADD.Caption                      :=nAction_Add[IOLangEdit];
   ActionDEL.Caption                      :=nAction_Del[IOLangEdit];
   ActionADD.Hint                         :=nHintAction_Add_PiV[IOLangEdit];
   ActionDEL.Hint                         :=nAction_Del_PiV[IOLangEdit];

   colNPP.Caption                         :=ncolNPP[IOLangEdit];
   colFIO.Caption                         :=ncolFIO[IOLangEdit];
   colNOMER_DELA.Caption                  :=ncolNOMER_DELA[IOLangEdit];
   colOCENKA_NUM.Caption                  :=ncolOCENKA[IOLangEdit];
   colNAME_OCENKA.Caption                 :=ncolOCENKA[IOLangEdit];
   colKOLVO_BALLOV.Caption                :=ncolKOLVO_BALLOV[IOLangEdit];
   colNAME_OCENKA_KolVo.Caption           :=ncolOCENKA[IOLangEdit];
   colOCENKA_NUM_KolVo.Caption            :=ncolOCENKA[IOLangEdit];
   colKolVo.Caption                       :=ncolKolVo[IOLangEdit];

end;

procedure TFormPRK_DT_ISPIT_OCENKA.SetSelectSQLTextIO(const Value: string);
begin
  FSelectSQLTextIO := Value;
    DataSetPrK_ISPIT_OCENKA.Database                       :=TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetPrK_ISPIT_OCENKA.Transaction                    :=TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetPrK_ISPIT_OCENKA.SelectSQL.Clear;
    DataSetPrK_ISPIT_OCENKA.SQLs.SelectSQL.Text            :=FSelectSQLTextIO;
    DataSetPrK_ISPIT_OCENKA.ParamByName('ID_DT_ISPIT_VEDOM').AsInt64 :=DataIO['input']['ID_DT_ISPIT_VEDOM'].AsInt64;
    DataSetPrK_ISPIT_OCENKA.CloseOpen(false);
    DataSetPrK_ISPIT_OCENKA.FetchAll;
    RxMemoryDataIspitOcenka.LoadFromDataSet(DataSetPrK_ISPIT_OCENKA,DataSetPrK_ISPIT_OCENKA.RecordCount,lmCopy);
    DataSetPrK_ISPIT_OCENKA.Active:=false;
    CalcKolVoOcenok;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.SetSelectSQLTextOcenka(
  const Value: string);
begin

  FSelectSQLTextOcenka := Value;
  DataSetOcenka.Database                    :=TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom;
    DataSetOcenka.Transaction               :=TFormPrK_Ekz_Vedom(self.Owner).TransactionReadPrKEkzVedom;
    DataSetOcenka.SelectSQL.Clear;
    DataSetOcenka.SQLs.SelectSQL.Text       :=FSelectSQLTextOcenka;
    DataSetOcenka.ParamByName('IS_SPIVBESIDA').AsInteger     :=TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['IS_SPIVBESIDA'];
    DataSetOcenka.ParamByName('IS_ZALIK').AsInteger          :=TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['IS_ZALIK'];
    DataSetOcenka.CloseOpen(false);
    DataSetOcenka.FetchAll;
    RxMemoryDataSumKolVoOcenok.LoadFromDataSet(DataSetOcenka,DataSetOcenka.RecordCount,lmCopy);
end;

procedure TFormPRK_DT_ISPIT_OCENKA.ActionPrintVedomExecute(
  Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'VEDOMOST';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ISPIT_VEDOM';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ISPIT_VEDOM';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
    InputParam['Input']['Count_Param'].AsInteger        := 2;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

procedure TFormPRK_DT_ISPIT_OCENKA.colNAME_OCENKAPropertiesEditValueChanged(
  Sender: TObject);
begin
  if DataSetPrK_ISPIT_OCENKA.Active=false then
   begin
    // чтобы не было двойного пересчета - из-за этого ошибка
    // двойного пересчета возникает при  RxMemoryDataIspitOcenka.Post или DataSourcePrK_ISPIT_OCENKA.Enabled:=false;
    if Second_Calc=false  then CalcKolVoOcenok;
    ActionPrintVedom.Enabled:=false;
    Second_Calc:=false;
   end;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.colOCENKA_NUMPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (DataSetPrK_ISPIT_OCENKA.Active=false)then
   begin
    // чтобы не было двойного пересчета - из-за этого ошибка
    // двойного пересчета возникает при  RxMemoryDataIspitOcenka.Post или DataSourcePrK_ISPIT_OCENKA.Enabled:=false;
    if Second_Calc=false  then CalcKolVoOcenok;
    ActionPrintVedom.Enabled:=false;
    Second_Calc:=false;
   end;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.CalcKolVoOcenok;
var
  id_KolVoOcenok_Locate, ID_DT_ISPIT_OCENKA_Locate : int64;
  SumKolVo :Integer;
begin
  id_KolVoOcenok_Locate      :=RxMemoryDataSumKolVoOcenok.FieldValues['ID_SP_OCENKA'];
  ID_DT_ISPIT_OCENKA_Locate  :=RxMemoryDataIspitOcenka.FieldValues['ID_DT_ISPIT_OCENKA'];

  DataSourceOcenka.Enabled            :=false;
  DataSourceSumKolVoOcenok.Enabled    :=false;

 // cxGridPrK_ISPIT_OCENKADBTableView1.OptionsView.ScrollBars :=ssNone;
  if First_Open=false
     then   Second_Calc :=true
     else   First_Open  :=false;

  RxMemoryDataIspitOcenka.Edit;
  RxMemoryDataIspitOcenka.Post;
  DataSourcePrK_ISPIT_OCENKA.Enabled  :=false;

  RxMemoryDataSumKolVoOcenok.First;
  while not RxMemoryDataSumKolVoOcenok.Eof do
  begin
    SumKolVo:=0;
    RxMemoryDataIspitOcenka.First;
    while not RxMemoryDataIspitOcenka.Eof do
    begin
      if RxMemoryDataSumKolVoOcenok.FieldValues['ID_SP_OCENKA']=RxMemoryDataIspitOcenka.FieldValues['ID_SP_OCENKA']
       then SumKolVo:=SumKolVo+1;
      RxMemoryDataIspitOcenka.Next;
    end;
    RxMemoryDataSumKolVoOcenok.Edit;
    RxMemoryDataSumKolVoOcenok.FieldValues['NPP']:=SumKolVo;
    RxMemoryDataSumKolVoOcenok.Post;
    RxMemoryDataSumKolVoOcenok.Next;
  end;

  RxMemoryDataSumKolVoOcenok.Locate('ID_SP_OCENKA',id_KolVoOcenok_Locate,[]);
  RxMemoryDataIspitOcenka.Locate('ID_DT_ISPIT_OCENKA',ID_DT_ISPIT_OCENKA_Locate,[]);

  // cxGridPrK_ISPIT_OCENKADBTableView1.OptionsView.ScrollBars :=ssBoth;
  DataSourcePrK_ISPIT_OCENKA.Enabled    :=true;
  DataSourceSumKolVoOcenok.Enabled     :=true;
  DataSourceOcenka.Enabled              :=true;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.colKolVoCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
   if (AviewInfo.GridRecord.Values[cxGridPrKKolVoOcenokDBTableView1.IndexOfItem(
          cxGridPrKKolVoOcenokDBTableView1.FindItemByName('colKolVo'))]) = 0 then
   begin
           ACanvas.FillRect(AViewInfo.Bounds);
           ADone := True;
   end;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.ActionADDExecute(Sender: TObject);
var
 T:TFormISPIT_VEDOM_ABIT_ADD;
begin
   T := TFormISPIT_VEDOM_ABIT_ADD.Create(self);
   if T.ShowModal=MrOk then
    begin
       Obnovit;
    end;
   T.Free;
   T:=Nil;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.Obnovit;
Var
   id_Obnov:Int64;
begin
   id_Obnov :=RxMemoryDataIspitOcenka.FieldValues['ID_DT_ISPIT_OCENKA'];
   DataSetPrK_ISPIT_OCENKA.CloseOpen(false);
   DataSetPrK_ISPIT_OCENKA.FetchAll;
   RxMemoryDataIspitOcenka.LoadFromDataSet(DataSetPrK_ISPIT_OCENKA,DataSetPrK_ISPIT_OCENKA.RecordCount,lmCopy);
   DataSetPrK_ISPIT_OCENKA.Active:=false;
   RxMemoryDataIspitOcenka.Locate('ID_DT_ISPIT_OCENKA',id_Obnov,[]);
end;

procedure TFormPRK_DT_ISPIT_OCENKA.ActionDELExecute(Sender: TObject);
begin
   if RxMemoryDataIspitOcenka.FieldValues['ID_DT_ISPIT_OCENKA']<>Null then
   begin
     if prkMessageDlg(nMsgBoxTitle[IOLangEdit],nMsgDel[IOLangEdit],
                        mtInformation,mbOKCancel,IOLangEdit)=mrOK then
     begin
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.StartTransaction;
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.StoredProcName:='PRK_DT_ISPIT_OCENKA_DEL';
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Prepare;
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_DT_ISPIT_OCENKA').AsInt64  :=RxMemoryDataIspitOcenka.FieldValues['ID_DT_ISPIT_OCENKA'];
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_USER').AsInt64             :=TFormPrK_Ekz_Vedom(self.Owner).ID_USER_GLOBAL;
           try
              TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ExecProc;
              TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Commit;
           except on e: Exception do
              begin
                 MessageBox(Handle,Pchar(nMsgErrorTransaction[IOLangEdit]+chr(13)+
                            nMsgTryAgain[IOLangEdit]+nMsgOr[IOLangEdit]+nMsgToAdmin[IOLangEdit]+chr(13)+
                            e.Message),Pchar(nMsgBoxTitle[IOLangEdit]),MB_OK or MB_ICONWARNING);
                 TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Rollback;
                 Exit;
              end;
           end;
           Obnovit;
     end;
   end;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.ActionSaveExecute(Sender: TObject);
var
 id_locate:int64;
begin
    id_locate:= rxMemoryDataIspitOcenka.FieldValues['ID_DT_ISPIT_OCENKA'];
    rxMemoryDataIspitOcenka.First;
    TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.StartTransaction;
    while not rxMemoryDataIspitOcenka.Eof do
    begin
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.StoredProcName:='PRK_DT_ISPIT_OCENKA_CHANGE';
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Prepare;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_DT_ISPIT_OCENKA').AsInt64  :=RxMemoryDataIspitOcenka.FieldValues['ID_DT_ISPIT_OCENKA'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_DT_ISPIT_VEDOM').AsInt64   :=DataIO['input']['ID_DT_ISPIT_VEDOM'].AsInt64;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_DT_ABIT').AsInt64          :=RxMemoryDataIspitOcenka.FieldValues['ID_DT_ABIT'];
      if( (RxMemoryDataIspitOcenka.FieldValues['ID_SP_OCENKA']=Null)              or
          (Trim(VarToStr(RxMemoryDataIspitOcenka.FieldValues['ID_SP_OCENKA']))='')  )
          then  TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_SP_OCENKA').AsInt64        :=-1
          else  TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_SP_OCENKA').AsInt64        :=RxMemoryDataIspitOcenka.FieldValues['ID_SP_OCENKA'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('KOLVO_BALLOV').AsInteger      :=RxMemoryDataIspitOcenka.FieldValues['KOLVO_BALLOV'];
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('IS_ABIT_SELECT').AsInteger    :=1;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_USER').AsInt64             :=TFormPrK_Ekz_Vedom(self.Owner).ID_USER_GLOBAL;

       try
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ExecProc;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IOLangEdit]+chr(13)+
                        nMsgTryAgain[IOLangEdit]+nMsgOr[IOLangEdit]+nMsgToAdmin[IOLangEdit]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IOLangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Rollback;
             Exit;
          end;
       end;
       rxMemoryDataIspitOcenka.Next;
    end;

   try
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Commit;
   except on e: Exception do
      begin
         MessageBox(Handle,Pchar(nMsgErrorTransaction[IOLangEdit]+chr(13)+
                    nMsgTryAgain[IOLangEdit]+nMsgOr[IOLangEdit]+nMsgToAdmin[IOLangEdit]+chr(13)+
                    e.Message),Pchar(nMsgBoxTitle[IOLangEdit]),MB_OK or MB_ICONWARNING);
         TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Rollback;
         Exit;
      end;
   end;
   ShowMessage(nMsgSaveAbitVedomOcenkaWasOk[IOLangEdit]);
   rxMemoryDataIspitOcenka.Locate('ID_DT_ISPIT_OCENKA',id_locate,[]);
   Obnovit;
   ActionPrintVedom.Enabled:=true;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.ActionExitExecute(Sender: TObject);
begin
    close;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then Action:=caFree;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.ActionDelVedomExecute(Sender: TObject);
begin
   if prkMessageDlg(nMsgBoxTitle[IOLangEdit],nMsgDelVedom[IOLangEdit],
                        mtInformation,mbOKCancel,IOLangEdit)=mrOK then
   begin
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.StartTransaction;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.StoredProcName:='PRK_DT_ISPIT_VEDOM_DEL';
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Prepare;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_DT_ISPIT_VEDOM').AsInt64   :=DataIO['input']['ID_DT_ISPIT_VEDOM'].AsInt64;
      TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ParamByName('ID_USER').AsInt64             :=TFormPrK_Ekz_Vedom(self.Owner).ID_USER_GLOBAL;
       try
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.ExecProc;
          TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Commit;
       except on e: Exception do
          begin
             MessageBox(Handle,Pchar(nMsgErrorTransaction[IOLangEdit]+chr(13)+
                        nMsgTryAgain[IOLangEdit]+nMsgOr[IOLangEdit]+nMsgToAdmin[IOLangEdit]+chr(13)+
                        e.Message),Pchar(nMsgBoxTitle[IOLangEdit]),MB_OK or MB_ICONWARNING);
             TFormPrK_Ekz_Vedom(self.Owner).StoredProcPrKEkzVedom.Transaction.Rollback;
             Exit;
          end;
       end;

      close;
   end;
end;

procedure TFormPRK_DT_ISPIT_OCENKA.FormShow(Sender: TObject);
begin
                                         {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IOLangEdit]),KLF_ACTIVATE);
end;

procedure TFormPRK_DT_ISPIT_OCENKA.ActionPrintTitulExecute(
  Sender: TObject);
var
  InputParam :TAArray;
  i: integer;
begin
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_rptLoader.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(TFormPrK_Ekz_Vedom(self.Owner).DataBasePrKEkzVedom.Handle);
    InputParam['Input']['aNameReport'].AsString         := 'TITUL_TEST';
    i:=1;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ISPIT_VEDOM';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
    i:=2;
    InputParam['Input']['ParamNames'][i].AsString       := 'ID_DT_ISPIT_VEDOM';
    InputParam['Input']['ParamValues'][i].AsVariant     := TFormPrK_Ekz_Vedom(self.Owner).DataSetPrKEkzVedom.FieldValues['ID_DT_ISPIT_VEDOM'];
    InputParam['Input']['Count_Param'].AsInteger        := 2;
  uPrK_Loader.ShowAllPrkBpl(self,InputParam);
end;

end.
