unit UWizardGetInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxLookAndFeelPainters, StdCtrls,
  cxButtons, FIBDataSet, pFIBDataSet, cxTextEdit, ActnList, cxContainer,
  Menus,UWizardMain,pFibStoredProc, Kernel, Placemnt;

type
  TfrmGetData = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel1: TPanel;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn5: TcxGridDBColumn;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    Panel2: TPanel;
    OKButton: TcxButton;
    ObjectsDataSet: TpFIBDataSet;
    ObjectsDataSource: TDataSource;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    cxStyle2: TcxStyle;
    InfoPanel: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    Bevel1: TBevel;
    Bevel2: TBevel;
    lbDBtitle: TLabel;
    lbSchDb: TLabel;
    edDBSchNum: TcxTextEdit;
    edDBSchTitle: TcxTextEdit;
    edKrSchTitle: TcxTextEdit;
    edKrSchNum: TcxTextEdit;
    lbSchKr: TLabel;
    lbKRtitle: TLabel;
    lbSmDb: TLabel;
    edDBSm: TcxTextEdit;
    lbRzDb: TLabel;
    lbStDb: TLabel;
    edDBRz: TcxTextEdit;
    edDbSt: TcxTextEdit;
    edKrSm: TcxTextEdit;
    lbSMkr: TLabel;
    lbRzKr: TLabel;
    lbStKr: TLabel;
    edKrSt: TcxTextEdit;
    edKrRz: TcxTextEdit;
    lbKVdb: TLabel;
    edDBKV: TcxTextEdit;
    lbKVKr: TLabel;
    edKrKV: TcxTextEdit;
    BackButton: TcxButton;
    CloseButton: TcxButton;
    Timer1: TTimer;
    lbAnDb: TLabel;
    lbAnKr: TLabel;
    edKrAn: TcxTextEdit;
    edDBAn: TcxTextEdit;
    cxGrid1Level3: TcxGridLevel;
    cxGrid1DBTableView4: TcxGridDBTableView;
    cxGrid1DBTableView4DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn5: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn6: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn7: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn8: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn9: TcxGridDBColumn;
    cxGrid1DBTableView4DBColumn10: TcxGridDBColumn;
    ColAnInfoDataSet: TpFIBDataSet;
    cxStyle3: TcxStyle;
    FacedLevel: TcxGridLevel;
    FacedProvsView: TcxGridDBTableView;
    FacedProvsViewDBColumn1: TcxGridDBColumn;
    FacedProvsViewDBColumn2: TcxGridDBColumn;
    FacedProvsViewDBColumn3: TcxGridDBColumn;
    FacedProvsViewDBColumn4: TcxGridDBColumn;
    FacedProvsViewDBColumn5: TcxGridDBColumn;
    FacedProvsViewDBColumn6: TcxGridDBColumn;
    FormStorage1: TFormStorage;
    procedure OKButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView2DblClick(Sender: TObject);
    procedure cxGrid1DBTableView3DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxGrid1DBTableView4DblClick(Sender: TObject);
  private
    { Private declarations }
    LOCAL_STRU : WIZARD_GET_PROV_INFO;
  public
    { Public declarations }

    SplashEdit: ControlsArray;

    Constructor Create(AOwner:TComponent;Mode:Integer;LOCAL_STRU:WIZARD_GET_PROV_INFO;FLAG:Integer);reintroduce;

    procedure SplashEditProcedure;

    procedure SetDataToClient(const LOCAL_STRU:WIZARD_GET_PROV_INFO);
  end;

implementation

uses UWizardResources;
{$R *.dfm}

{ TfrmChooseBUObjects }

constructor TfrmGetData.Create(AOwner: TComponent; Mode: Integer;LOCAL_STRU:WIZARD_GET_PROV_INFO; FLAG:Integer);
begin
     inherited Create(AOwner);
     ObjectsDataSet.Database    :=TfrmProvInfoWizard1(owner).WorkDatabase;
     ObjectsDataSet.Transaction :=TfrmProvInfoWizard1(owner).ReadTransaction;
     InfoPanel.Visible          :=LOCAL_STRU.INFO_PANEL_SH;
     Self.LOCAL_STRU            :=LOCAL_STRU;

     if (Mode=1)
     then begin
                if (Flag= 0)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_SM3[LOCAL_STRU.ID_LANGUAGE];
                if (Flag= 1)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_SM2[LOCAL_STRU.ID_LANGUAGE];
                if (Flag=-1)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_SM1[LOCAL_STRU.ID_LANGUAGE];

                cxGrid1Level1.Visible:=true;
                cxGrid1Level2.Visible:=false;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=false;

                if (LOCAL_STRU.ID_SCH_IN=0)
                then ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_SMET_FOR_WIZARD(NULL,'+''''+DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+')'
                else ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_SMET_FOR_WIZARD('+IntToStr(LOCAL_STRU.ID_SCH_IN)+','+''''+DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+')';

                //ShowMessage(ObjectsDataSet.SelectSQL.Text);

                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_SMETA';
                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;

     if (Mode=2)
     then begin
                if (Flag=0)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_RZ3[LOCAL_STRU.ID_LANGUAGE];
                if (Flag=1)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_RZ2[LOCAL_STRU.ID_LANGUAGE];
                if (Flag=-1) then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_RZ1[LOCAL_STRU.ID_LANGUAGE];
                cxGrid1Level1.Visible:=false;
                cxGrid1Level2.Visible:=true;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=false;
                ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_RAZD_ST_FOR_WIZARD('+IntToStr(LOCAL_STRU.ID_SCH_IN)+','+''''+DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+',1,NULL)';
                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;


     if (Mode=3)
     then begin
                if (Flag=0)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_ST3[LOCAL_STRU.ID_LANGUAGE];
                if (Flag=1)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_ST2[LOCAL_STRU.ID_LANGUAGE];
                if (Flag=-1) then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_ST1[LOCAL_STRU.ID_LANGUAGE];
                cxGrid1Level1.Visible:=false;
                cxGrid1Level2.Visible:=true;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=false;

                ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_RAZD_ST_FOR_WIZARD('+IntToStr(LOCAL_STRU.ID_SCH_IN)+','+''''+DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+',2,'+IntToStr(LOCAL_STRU.ID_OPER)+')';
                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;

     if (Mode=4)
     then begin
                Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_MA_SC[LOCAL_STRU.ID_LANGUAGE];
                cxGrid1Level1.Visible:=false;
                cxGrid1Level2.Visible:=true;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=false;

                if (LOCAL_STRU.Mode=21)
                then begin
                           if (LOCAL_STRU.ID_FORM_UCH<>1)
                           then ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM PUB_SP_MAIN_SCH_SELECT_EX('+''''+
                                DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+',1,'+IntToStr(LOCAL_STRU.ID_FORM_UCH)+') WHERE NOT (OPEN_SCH IS NULL)'
                           else ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM PUB_SP_MAIN_SCH_SELECT('+''''+
                                DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+',1) WHERE NOT (OPEN_SCH IS NULL)';

                           cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_SCH';
                end
                else begin
                           ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM PUB_SP_MAIN_SCH_SELECT_EX3('+''''+
                           DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+',1,'+IntToStr(LOCAL_STRU.ID_REG_UCH)+') WHERE NOT (OPEN_SCH IS NULL)';
                           cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_SCH';
                end;
                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';

                //showmessage(ObjectsDataSet.SelectSQL.Text);

                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;

     if (Mode=5)
     then begin
                Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_CO_SC[LOCAL_STRU.ID_LANGUAGE];
                cxGrid1Level1.Visible:=false;
                cxGrid1Level2.Visible:=true;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=false;

                ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM BU_GET_SCH_FOR_WIZARD_FU('+''''+
                DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+','+IntToStr(LOCAL_STRU.ID_SCH_IN)+','+IntToStr(1-LOCAL_STRU.CR_BY_DT)+')';
                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';

                //showmessage(ObjectsDataSet.SelectSQL.Text);

                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;

     if (Mode=6)
     then begin
                if (Flag=0)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_KV3[LOCAL_STRU.ID_LANGUAGE];
                if (Flag=1)  then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_KV2[LOCAL_STRU.ID_LANGUAGE];
                if (Flag=-1) then Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_KV1[LOCAL_STRU.ID_LANGUAGE];
                cxGrid1Level1.Visible:=false;
                cxGrid1Level2.Visible:=true;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=false;

                if (Flag= 0) then ObjectsDataSet.SelectSQL.Text:='SELECT ID_KEKV AS ID_OBJECT, KEKV_CODE AS OBJECT_NUM, KEKV_TITLE AS OBJECT_TITLE FROM PUB_WIZARD_KEKV_SELECT('+''''+DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+','+IntToStr(LOCAL_STRU.KR_ID_SMETA)+')';
                if (Flag= 1) then ObjectsDataSet.SelectSQL.Text:='SELECT ID_KEKV AS ID_OBJECT, KEKV_CODE AS OBJECT_NUM, KEKV_TITLE AS OBJECT_TITLE FROM PUB_WIZARD_KEKV_SELECT('+''''+DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+','+IntToStr(LOCAL_STRU.DB_ID_SMETA)+')';
                if (Flag=-1) then ObjectsDataSet.SelectSQL.Text:='SELECT ID_KEKV AS ID_OBJECT, KEKV_CODE AS OBJECT_NUM, KEKV_TITLE AS OBJECT_TITLE FROM PUB_WIZARD_KEKV_SELECT('+''''+DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+','+IntToStr(LOCAL_STRU.DB_ID_SMETA)+')';

                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;



     if (Mode=7)
     then begin
                Panel2.Caption:=UWizardResources.CHOOSE_OBJ_CH_TITLE_MA_SC[LOCAL_STRU.ID_LANGUAGE];
                cxGrid1Level1.Visible:=false;
                cxGrid1Level2.Visible:=true;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=false;

                ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM PUB_SP_MAIN_SCH_SELECT('+''''+
                DateTimeToStr(LOCAL_STRU.ACTUAL_DATE)+''''+',1) WHERE NOT (OPEN_SCH IS NULL)';
                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_SCH';
                cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;

     if (Mode=8)
     then begin
                Panel2.Caption:=UWizardResources.FACED_FORM_CAPTION[LOCAL_STRU.ID_LANGUAGE];

                cxGrid1Level1.Visible:=false;
                cxGrid1Level2.Visible:=false;
                cxGrid1Level3.Visible:=false;
                FacedLevel.Visible:=true;

                ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_FACED_INFO_FOR_WIZARD('+IntToStr(LOCAL_STRU.ID_OPER)+','+''''+DateToStr(LOCAL_STRU.ACTUAL_DATE)+''''+')';
                ObjectsDataSet.Open;
                cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
     end;
end;

procedure TfrmGetData.OKButtonClick(Sender: TObject);
begin
     if (ObjectsDataSet.RecordCount>0) then ModalResult:=mrYes;
end;

procedure TfrmGetData.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
     OkButtonClick(self);
end;

procedure TfrmGetData.cxGrid1DBTableView2DblClick(Sender: TObject);
begin
     OkButtonClick(self);
end;

procedure TfrmGetData.cxGrid1DBTableView3DblClick(Sender: TObject);
begin
     OkButtonClick(self);
end;

procedure TfrmGetData.Action1Execute(Sender: TObject);
begin
     OkButtonClick(self);
end;

procedure TfrmGetData.Action2Execute(Sender: TObject);
begin
     ModalResult:=mrNoToAll;
end;

procedure TfrmGetData.FormShow(Sender: TObject);
begin
     self.Caption        :=MAIN_FORM_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbDBtitle.Caption   :=MAIN_FORM_DB_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbKrtitle.Caption   :=MAIN_FORM_KR_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     BackButton.Caption  :=MAIN_FORM_BACK_BUTTON[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     OKButton.Caption    :=MAIN_FORM_OK_BUTTON[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     CloseButton.Caption :=MAIN_FORM_CLOSE_BUTTON[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbSchDb.Caption     :=MAIN_FORM_SCH_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbSchkr.Caption     :=MAIN_FORM_SCH_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbSmDb.Caption      :=MAIN_FORM_SMT_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbSmKr.Caption      :=MAIN_FORM_SMT_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbRzDb.Caption      :=MAIN_FORM_RAZ_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbRzKr.Caption      :=MAIN_FORM_RAZ_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbStDb.Caption      :=MAIN_FORM_STA_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbStKr.Caption      :=MAIN_FORM_STA_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbKVDb.Caption      :=MAIN_FORM_KVZ_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbKVKr.Caption      :=MAIN_FORM_KVZ_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbAnDb.Caption      :=MAIN_FORM_AN_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     lbAnKr.Caption      :=MAIN_FORM_AN_TITLE[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];

     cxGrid1DBTableView1DBColumn1.Caption:=CHOOSE_OBJ_GRID1_COL1[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     cxGrid1DBTableView1DBColumn2.Caption:=CHOOSE_OBJ_GRID1_COL2[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     cxGrid1DBTableView1DBColumn3.Caption:=CHOOSE_OBJ_GRID1_COL3[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];

     cxGrid1DBTableView2DBColumn1.Caption:=CHOOSE_OBJ_GRID2_COL1[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];
     cxGrid1DBTableView2DBColumn2.Caption:=CHOOSE_OBJ_GRID2_COL2[TfrmProvInfoWizard1(owner).LOCAL_STRU.ID_LANGUAGE];

     InfoPanel.Visible:=TfrmProvInfoWizard1(Owner).LOCAL_STRU.INFO_PANEL_SH;
     SetDataToClient(LOCAL_STRU);
end;

procedure TfrmGetData.BackButtonClick(Sender: TObject);
begin
     ModalResult:=mrNoToAll;
end;

procedure TfrmGetData.CloseButtonClick(Sender: TObject);
begin
     ModalResult:=mrCancel;
end;

procedure TfrmGetData.SplashEditProcedure;
var i:Integer;
begin
     for i:=0 to Length(SplashEdit)-1 do
     begin
          if SplashEdit[i].Style.Color=clInactiveCaptionText
          then SplashEdit[i].Style.Color:=clInfoBk
          else SplashEdit[i].Style.Color:=clInactiveCaptionText;
          SplashEdit[i].Update;
     end;
end;


procedure TfrmGetData.Timer1Timer(Sender: TObject);
begin
     SplashEditProcedure;
end;

procedure TfrmGetData.cxGrid1DBTableView4DblClick(Sender: TObject);
begin
     OkButtonClick(self);
end;

procedure TfrmGetData.SetDataToClient(const LOCAL_STRU:WIZARD_GET_PROV_INFO);
var I:Integer;
begin
     Caption:=Caption+'('+DateToStr(LOCAL_STRU.ACTUAL_DATE)+')';

     edDBSchNum.Text   :=LOCAL_STRU.DB_ID_SCH_KOD;
     edDBSchTitle.Text :=LOCAL_STRU.DB_ID_SCH_TIT;

     edKrSchNum.Text   :=LOCAL_STRU.KR_ID_SCH_KOD;
     edKrSchTitle.Text :=LOCAL_STRU.KR_ID_SCH_TIT;

     if (LOCAL_STRU.DB_TITLE_SMETA<>'') then edDBSm.Text       :=IntToStr(LOCAL_STRU.DB_KOD_SMETA)+' "'+LOCAL_STRU.DB_TITLE_SMETA+'"';
     if (LOCAL_STRU.kr_TITLE_SMETA<>'') then edKrSm.Text       :=IntToStr(LOCAL_STRU.KR_KOD_SMETA)+' "'+LOCAL_STRU.KR_TITLE_SMETA+'"';

     if (LOCAL_STRU.DB_TITLE_RAZD<>'') then edDBRz.Text       :=IntToStr(LOCAL_STRU.DB_KOD_RAZD)+' "'+LOCAL_STRU.DB_TITLE_RAZD+'"';
     if (LOCAL_STRU.KR_TITLE_RAZD<>'') then edKrRz.Text       :=IntToStr(LOCAL_STRU.KR_KOD_RAZD)+' "'+LOCAL_STRU.KR_TITLE_RAZD+'"';

     if (LOCAL_STRU.DB_TITLE_STAT<>'') then edDBSt.Text       :=IntToStr(LOCAL_STRU.DB_KOD_STAT)+' "'+LOCAL_STRU.DB_TITLE_STAT+'"';
     if (LOCAL_STRU.KR_TITLE_STAT<>'') then edKrSt.Text       :=IntToStr(LOCAL_STRU.KR_KOD_STAT)+' "'+LOCAL_STRU.KR_TITLE_STAT+'"';

     if (LOCAL_STRU.DB_KEKV_TITLE<>'') then edDBKV.Text       :=IntToStr(LOCAL_STRU.DB_KOD_KEKV)+' "'+LOCAL_STRU.DB_KEKV_TITLE+'"';
     if (LOCAL_STRU.KR_KEKV_TITLE<>'') then edKrKV.Text       :=IntToStr(LOCAL_STRU.KR_KOD_KEKV)+' "'+LOCAL_STRU.KR_KEKV_TITLE+'"';

     For I:=0 to Length(SplashEdit)-1 do TcxTextEdit(SplashEdit[i]).Text:='';
end;

end.


