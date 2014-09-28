unit uShabloni_Prov;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ibase, Placemnt, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxSplitter, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ToolWin, ComCtrls,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, StdCtrls, cxLabel,
  cxContainer, cxTextEdit, cxDBEdit, ActnList, FIBQuery, pFIBQuery,
  pFIBStoredProc, Constant_for_Shabloni, ImgList, dxBar, dxBarExtItems,
  dxStatusBar;

type
  TForm_Shabloni_Prov = class(TForm)
    FormStorage1: TFormStorage;
    cxGridShabloni_ProvDBTableView1: TcxGridDBTableView;
    cxGridShabloni_ProvLevel1: TcxGridLevel;
    cxGridShabloni_Prov: TcxGrid;
    cxSplitterShabloni: TcxSplitter;
    pFIBDatabaseShabloni_Prov: TpFIBDatabase;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetShabloni_Prov: TpFIBDataSet;
    DataSourceShabloni_Prov: TDataSource;
    ColNAME_SHABLON: TcxGridDBColumn;
    ColKOD_SHABLONA: TcxGridDBColumn;
    GroupBox1: TGroupBox;
    cxLabelFioMan: TcxLabel;
    cxLabelSCH_NUMBER: TcxLabel;
    cxDBTextEditSCH_NUMBER: TcxDBTextEdit;
    cxDBTextEditSMETA_TITLE: TcxDBTextEdit;
    cxLabelSMETA_TITLE: TcxLabel;
    cxLabelRAZD_NUM: TcxLabel;
    cxLabelRAZDEL_TITLE: TcxLabel;
    cxLabelKEKV_KOD: TcxLabel;
    cxDBTextEditRAZD_NUM: TcxDBTextEdit;
    cxDBTextEditRAZDEL_TITLE: TcxDBTextEdit;
    cxDBTextEditKEKV_KOD: TcxDBTextEdit;
    cxDBTextEditKEKV_TITLE: TcxDBTextEdit;
    cxLabelKEKV_TITLE: TcxLabel;
    cxLabelKOD_DOG: TcxLabel;
    cxDBTextEditSUMMA: TcxDBTextEdit;
    cxLabelSUMMA: TcxLabel;
    ActionList1: TActionList;
    ActionADD: TAction;
    ActionChange: TAction;
    ActionDEL: TAction;
    ActionObnov: TAction;
    ActionVibrat: TAction;
    ActionOtmena: TAction;
    cxTextEditFioMan: TcxTextEdit;
    pFIBStoredProcShablon: TpFIBStoredProc;
    cxLabelSmetaKod: TcxLabel;
    cxDBTextEditSmetaKod: TcxDBTextEdit;
    cxDBTextEditStatiya_Title: TcxDBTextEdit;
    cxLabelStatiya_Title: TcxLabel;
    cxLabelStatiya_NUM: TcxLabel;
    cxDBTextEditStatiya_NUM: TcxDBTextEdit;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    dxBarManager1: TdxBarManager;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarStatic1: TdxBarStatic;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    ImageList: TImageList;
    dxBarLargeButton8: TdxBarLargeButton;
    cxTextEdit1: TcxTextEdit;
    DataSet: TpFIBDataSet;
    pFIBDataSetShabloni_ProvID_TABLE_PUB_SP_PROV: TFIBBCDField;
    pFIBDataSetShabloni_ProvNAME_SHABLON_PROVODKI: TFIBStringField;
    pFIBDataSetShabloni_ProvKOD_SHABLONA: TFIBBCDField;
    pFIBDataSetShabloni_ProvVISIBLE_KASSA: TFIBSmallIntField;
    pFIBDataSetShabloni_ProvVISIBLE_BANK: TFIBSmallIntField;
    pFIBDataSetShabloni_ProvVISIBLE_AVANCE: TFIBSmallIntField;
    pFIBDataSetShabloni_ProvID_MAN: TFIBBCDField;
    pFIBDataSetShabloni_ProvFIO_MAN: TFIBStringField;
    pFIBDataSetShabloni_ProvIMYA_MAN: TFIBStringField;
    pFIBDataSetShabloni_ProvOTCHESTVO_MAN: TFIBStringField;
    pFIBDataSetShabloni_ProvID_SCHET: TFIBBCDField;
    pFIBDataSetShabloni_ProvSCH_NUMBER: TFIBStringField;
    pFIBDataSetShabloni_ProvSCH_TITLE: TFIBStringField;
    pFIBDataSetShabloni_ProvDATE_BEG_SCH: TFIBDateField;
    pFIBDataSetShabloni_ProvDATE_END_SCH: TFIBDateField;
    pFIBDataSetShabloni_ProvID_SMETA: TFIBBCDField;
    pFIBDataSetShabloni_ProvSMETA_TITLE: TFIBStringField;
    pFIBDataSetShabloni_ProvSMETA_KOD: TFIBIntegerField;
    pFIBDataSetShabloni_ProvID_RAZDEL: TFIBBCDField;
    pFIBDataSetShabloni_ProvRAZDEL_TITLE: TFIBStringField;
    pFIBDataSetShabloni_ProvRAZDEL_NUM: TFIBIntegerField;
    pFIBDataSetShabloni_ProvID_STATIYA: TFIBBCDField;
    pFIBDataSetShabloni_ProvSTATIYA_TITLE: TFIBStringField;
    pFIBDataSetShabloni_ProvST_NUM: TFIBIntegerField;
    pFIBDataSetShabloni_ProvID_KEKV: TFIBBCDField;
    pFIBDataSetShabloni_ProvKEKV_KOD: TFIBIntegerField;
    pFIBDataSetShabloni_ProvKEKV_TITLE: TFIBStringField;
    pFIBDataSetShabloni_ProvSUMMA: TFIBBCDField;
    pFIBDataSetShabloni_ProvID_DOG: TFIBBCDField;
    pFIBDataSetShabloni_ProvKOD_DOG: TFIBBCDField;
    dxStatusBar1: TdxStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionADDExecute(Sender: TObject);
    procedure ActionChangeExecute(Sender: TObject);
    procedure ActionDELExecute(Sender: TObject);
    procedure ActionObnovExecute(Sender: TObject);
    procedure ActionVibratExecute(Sender: TObject);
    procedure ActionOtmenaExecute(Sender: TObject);
    procedure pFIBDataSetShabloni_ProvAfterScroll(DataSet: TDataSet);
    procedure Inicalisation(aVis_Kassa : Smallint; aVis_Bank : Smallint; aVis_Avanse : Smallint);
    procedure InicCaption;
  private
    DBHANDLE : TISC_DB_HANDLE;
    id_Shablona: Int64;
    Redaktirovanie: Smallint;
  public
    id_user : int64;
    ResultArray: Variant;
    Vis_Kassa, Vis_Bank, Vis_Avanse : Smallint;
    constructor Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aVis_Kassa : Smallint; aVis_Bank : Smallint; aVis_Avanse : Smallint; aRedaktirovanie :Smallint);overload;
  end;

  function ShowShabloni_Prov (AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aVis_Kassa : Smallint; aVis_Bank : Smallint; aVis_Avanse : Smallint; aRedaktirovanie :Smallint):Variant;stdcall;
  exports  ShowShabloni_Prov;


implementation
uses
    uAddShabloni_Prov, DogLoaderUnit, Un_R_file_Alex;
{$R *.dfm}

function ShowShabloni_Prov (AOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aID_USER : INT64; aVis_Kassa : Smallint; aVis_Bank : Smallint; aVis_Avanse : Smallint; aRedaktirovanie :Smallint):Variant;
var
  T : TForm_Shabloni_Prov;
begin
  T := TForm_Shabloni_Prov.Create(AOwner, aDBHANDLE, aVis_Kassa, aVis_Bank, aVis_Avanse, aRedaktirovanie);
  T.ShowModal;
  T.id_user         := aID_USER;
  T.Vis_Kassa       := aVis_Kassa;
  T.Vis_Bank        := aVis_Bank;
  T.Vis_Avanse      := aVis_Avanse;
  ShowShabloni_Prov := T.ResultArray;
  T.Free;
end;

constructor TForm_Shabloni_Prov.Create(aOwner:TComponent; aDBHANDLE : TISC_DB_HANDLE; aVis_Kassa : Smallint; aVis_Bank : Smallint; aVis_Avanse : Smallint; aRedaktirovanie :Smallint);
begin
 inherited Create(aOwner);
 if Assigned(aDBHANDLE) then
    begin
      InicCaption;
      Self.DBHANDLE       := aDBHandle;
      self.Vis_Kassa      := aVis_Kassa;
      self.Vis_Bank       := aVis_Bank;
      self.Vis_Avanse     := aVis_Avanse;
      self.Redaktirovanie := aRedaktirovanie;
      Inicalisation(aVis_Kassa,aVis_Bank,aVis_Avanse);
    end;
end;

procedure TForm_Shabloni_Prov.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   pFIBDatabaseShabloni_Prov.Close;
   if FormStyle = fsMDIChild then Action:=caFree;
end;

procedure TForm_Shabloni_Prov.ActionADDExecute(Sender: TObject);
var
  res :variant;
begin
  ResultArray:=Null;
  res:=uAddShabloni_Prov.GetParamAdd_Shabloni(self,0,-1);{0-Add,-1: Id ne peredaetsya}
  Inicalisation(Vis_Kassa,Vis_Bank,Vis_Avanse);
end;

procedure TForm_Shabloni_Prov.ActionChangeExecute(Sender: TObject);
var
   res :variant;
begin
   ResultArray:=Null;
   res:=uAddShabloni_Prov.GetParamAdd_Shabloni(self,1,id_Shablona);{1-Change}
end;

procedure TForm_Shabloni_Prov.ActionDELExecute(Sender: TObject);
begin
 if MessageBox(Handle, Pchar(nMsgBoxMsg), Pchar(nMsgBoxTitle),mb_YesNO)=mrYes
    then begin
       pFIBStoredProcShablon.Transaction.StartTransaction;
       pFIBStoredProcShablon.StoredProcName:='PUB_SP_PROV_DEL';
       pFIBStoredProcShablon.Prepare;
       pFIBStoredProcShablon.ParamByName('ID_TABLE_PUB_SP_PROV').AsInt64:=id_Shablona;
       try
          pFIBStoredProcShablon.ExecProc;
          pFIBStoredProcShablon.Transaction.Commit;
       Except
          pFIBStoredProcShablon.Transaction.Rollback;
       end;
     Inicalisation(Vis_Kassa,Vis_Bank,Vis_Avanse);
 end;
end;

procedure TForm_Shabloni_Prov.ActionObnovExecute(Sender: TObject);
begin
   Inicalisation(Vis_Kassa,Vis_Bank,Vis_Avanse);
end;

procedure TForm_Shabloni_Prov.ActionVibratExecute(Sender: TObject);
begin
   ResultArray:=VarArrayCreate([0,22], varVariant);
   ResultArray[0]:=pFIBDataSetShabloni_Prov.FieldValues['ID_TABLE_PUB_SP_PROV'];
   ResultArray[1]:=pFIBDataSetShabloni_Prov.FieldValues['NAME_SHABLON_PROVODKI'];
   ResultArray[2]:=pFIBDataSetShabloni_Prov.FieldValues['KOD_SHABLONA'];
   ResultArray[3]:=pFIBDataSetShabloni_Prov.FieldValues['ID_MAN'];
   ResultArray[4]:=pFIBDataSetShabloni_Prov.FieldValues['FIO_MAN']+' '+pFIBDataSetShabloni_Prov.FieldValues['IMYA_MAN']+' '+pFIBDataSetShabloni_Prov.FieldValues['OTCHESTVO_MAN'];
   ResultArray[5]:=pFIBDataSetShabloni_Prov.FieldValues['ID_SCHET'];
   ResultArray[6]:=pFIBDataSetShabloni_Prov.FieldValues['SCH_TITLE'];
   ResultArray[7]:=pFIBDataSetShabloni_Prov.FieldValues['SCH_NUMBER'];
   ResultArray[8]:=pFIBDataSetShabloni_Prov.FieldValues['ID_SMETA'];
   ResultArray[9]:=pFIBDataSetShabloni_Prov.FieldValues['SMETA_TITLE'];
   ResultArray[10]:=pFIBDataSetShabloni_Prov.FieldValues['SMETA_KOD'];
   ResultArray[11]:=pFIBDataSetShabloni_Prov.FieldValues['ID_RAZDEL'];
   ResultArray[12]:=pFIBDataSetShabloni_Prov.FieldValues['RAZDEL_TITLE'];
   ResultArray[13]:=pFIBDataSetShabloni_Prov.FieldValues['RAZDEL_NUM'];
   ResultArray[14]:=pFIBDataSetShabloni_Prov.FieldValues['ID_STATIYA'];
   ResultArray[15]:=pFIBDataSetShabloni_Prov.FieldValues['STATIYA_TITLE'];
   ResultArray[16]:=pFIBDataSetShabloni_Prov.FieldValues['ST_NUM'];
   ResultArray[17]:=pFIBDataSetShabloni_Prov.FieldValues['ID_KEKV'];
   ResultArray[18]:=pFIBDataSetShabloni_Prov.FieldValues['KEKV_TITLE'];
   ResultArray[19]:=pFIBDataSetShabloni_Prov.FieldValues['KEKV_KOD'];
   ResultArray[20]:=pFIBDataSetShabloni_Prov.FieldValues['SUMMA'];
   ResultArray[21]:=pFIBDataSetShabloni_Prov.FieldValues['ID_DOG'];
   ResultArray[22]:=pFIBDataSetShabloni_Prov.FieldValues['KOD_DOG'];
   Close;
end;

procedure TForm_Shabloni_Prov.ActionOtmenaExecute(Sender: TObject);
begin
   Close;
end;

procedure TForm_Shabloni_Prov.Inicalisation(aVis_Kassa : Smallint; aVis_Bank : Smallint; aVis_Avanse : Smallint);
begin
       Self.pFIBDatabaseShabloni_Prov.Close;
       pFIBDataSetShabloni_Prov.Active:=false;
       Self.pFIBDatabaseShabloni_Prov.Handle := DBHANDLE;
       Self.pFIBDatabaseShabloni_Prov.DefaultTransaction := pFIBTransactionRead;
       DataSet.Database                                  := pFIBDatabaseShabloni_Prov;
       DataSet.Transaction                               := pFIBTransactionRead;
       pFIBDataSetShabloni_Prov.SelectSQL.Clear;
       pFIBDataSetShabloni_Prov.SQLs.SelectSQL.Text :='Select * from PUB_SP_PROV_SEL_FOR_GRID (:Par_DATE_SCH, :Par_KASSA, :Par_BANK, :Par_AVANSE)';
       pFIBDataSetShabloni_Prov.ParamByName('Par_DATE_SCH').AsDate:=Date;
       pFIBDataSetShabloni_Prov.ParamByName('Par_KASSA').AsShort:=aVis_Kassa;
       pFIBDataSetShabloni_Prov.ParamByName('Par_BANK').AsShort:=aVis_Bank;
       pFIBDataSetShabloni_Prov.ParamByName('Par_AVANSE').AsShort:=aVis_Avanse;
       pFIBDataSetShabloni_Prov.CloseOpen(false);
       ActionADD.Enabled     :=true;
       ActionChange.Enabled  :=true;
       ActionDEL.Enabled     :=true;
       ActionObnov.Enabled   :=true;
       ActionVibrat.Enabled  :=true;
       ActionOtmena.Enabled  :=true;
       if (Redaktirovanie<>2) then
          begin
              ActionVibrat.Enabled:=false;
              if  pFIBDataSetShabloni_Prov.RecordCount=0
                 then begin
                   ActionDEL.Enabled:=false;
                   ActionChange.Enabled:=false;
                 end
                 else begin
                   ActionDEL.Enabled:=true;
                   ActionChange.Enabled:=true;
                 end;
          end;
       if (Redaktirovanie=2) then
          begin
              ActionADD.Enabled     :=false;
              ActionChange.Enabled  :=false;
              ActionDEL.Enabled     :=false;
              ActionObnov.Enabled   :=false;
              if  pFIBDataSetShabloni_Prov.RecordCount=0
                 then  ActionVibrat.Enabled:=false
                 else  ActionVibrat.Enabled:=true;

          end;
end;

procedure TForm_Shabloni_Prov.pFIBDataSetShabloni_ProvAfterScroll(
  DataSet: TDataSet);
var
    id_dog, kod_dog : int64;
    y, o : TSpravParams;
    dog_type : variant;
begin
    cxTextEditFioMan.Text:=VarToStr(pFIBDataSetShabloni_Prov.FieldValues['FIO_MAN'])+' '+VarToStr(pFIBDataSetShabloni_Prov.FieldValues['IMYA_MAN'])+' '+VarToStr(pFIBDataSetShabloni_Prov.FieldValues['OTCHESTVO_MAN']);
    if pFIBDataSetShabloni_Prov.FieldValues['ID_TABLE_PUB_SP_PROV']<>Null
       then id_Shablona:=pFIBDataSetShabloni_Prov.FieldValues['ID_TABLE_PUB_SP_PROV'];
    try id_dog  := StrToInt64(pFIBDataSetShabloni_Prov.FieldByName('ID_DOG').AsString)  except ID_DOG  := -1; end;
    try kod_dog := StrToInt64(pFIBDataSetShabloni_Prov.FieldByName('KOD_DOG').AsString) except kod_DOG := -1; end;
    if (id_dog > 0) and (kod_dog > 0) then
    begin
        y                    := TSpravParams.Create;
        o                    := TSpravParams.Create;
        y['DataBase']        := Integer(pFIBDatabaseShabloni_Prov.Handle);
        y['ReadTransaction'] := Integer(pFIBTransactionRead.Handle);
        y['ID_DOG']          := ID_DOG;
        y['KOD_DOG']         := KOD_DOG;
        GetDogovorInfo(Self, @y, @o);
        try dog_type   := o['DOG_TYPE']  except dog_type := -1 end;
        if dog_type = 0 then   {другие}
        begin
            cxTextEdit1.Text := 'Тип дог. ' + o['N_DOG'] + ' № ' + o['NUM_DOG'] + ' рег.н. - '+ o['REGEST_NUM'] + ' от - ' + DateToStr(o['D_DOG']) + ' Контрагент ' + o['NAME_CUSTOMER'];
        end;
        if (dog_type = 1) or (dog_type = 2) then
        begin
            cxTextEdit1.Text := 'ФИО ' + o['FIO_COMBO'] + ' № ' + o['NUM_DOG'] + ' рег.н. - '+ o['REGEST_NUM'] + ' от - ' + DateToStr(o['D_DOG']);
        end;
        y.Free;
        o.Free;
    end;
end;

procedure TForm_Shabloni_Prov.InicCaption;
begin
    TForm_Shabloni_Prov(self). Caption:=nCaptionShabloniProv;
    ActionADD.Caption:=nButt_Add;
    ActionChange.Caption:=nButt_Change;
    ActionDEL.Caption:=nButt_Del;
    ActionObnov.Caption:=nButt_Obnov;
    ActionVibrat.Caption:=nButt_Vibrat;
    ActionOtmena.Caption:=nButt_Exit;

    ActionADD.Hint:=nHintButt_Add;
    ActionChange.Hint:=nHintButt_Change;
    ActionDEL.Hint:=nHintButt_Del;
    ActionObnov.Hint:=nHintButt_Obnov;
    ActionVibrat.Hint:=nHintButt_Vibrat;
    ActionOtmena.Hint:=nHintButt_Exit;

    ColNAME_SHABLON.Caption:=nName_shablona;
    ColKOD_SHABLONA.Caption:=nKod_shablona;
    cxLabelFioMan.Caption:=nFioMan;
    cxLabelSCH_NUMBER.Caption:=nSCH_Number;
    cxLabelSMETA_TITLE.Caption:=nSmeta_title;
    cxLabelSmetaKod.Caption:=nSmeta_Kod;
    cxLabelRAZDEL_TITLE.Caption:=nRazdel_title;
    cxLabelRAZD_NUM.Caption:=nRazdel_Num;
    cxLabelStatiya_Title.Caption:=nStatiya_title;
    cxLabelStatiya_NUM.Caption:=nStatiya_Num;
    cxLabelKEKV_TITLE.Caption:=nKekv_title;
    cxLabelKEKV_KOD.Caption:=nKekv_kod;
    cxLabelKOD_DOG.Caption:=nKod_dog;
    cxLabelSUMMA.Caption:=nSumma;

    dxStatusBar1.Panels[0].Text                  := 'Ins - ' + Un_R_file_Alex.MY_BUTTON_ADD ;
    dxStatusBar1.Panels[1].Text                  := 'F2 - '  + Un_R_file_Alex.MY_BUTTON_EDIT;
    dxStatusBar1.Panels[2].Text                  := 'Del - ' + Un_R_file_Alex.MY_BUTTON_DELETE ;
    dxStatusBar1.Panels[4].Text                  := 'F5 - '  + Un_R_file_Alex.MY_BUTTON_REFRESH;
    dxStatusBar1.Panels[5].Text                  := 'Esc - ' + Un_R_file_Alex.MY_BUTTON_CLOSE;
    dxStatusBar1.Panels[3].Text                  := 'Enter - ' + Constant_for_Shabloni.Enter_button;
end;

end.
