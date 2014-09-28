unit GetProvInfoWizardBU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxLookAndFeelPainters, StdCtrls,
  cxButtons, FIBDataSet, pFIBDataSet, cxTextEdit, ActnList, cxContainer,
  Menus,GetProvInfoWizard,pFibStoredProc;

type
  TfrmChooseBUObjects = class(TForm)
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
    procedure OKButtonClick(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure cxGrid1DBTableView2DblClick(Sender: TObject);
    procedure cxGrid1DBTableView3DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BackButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cxGrid1DBTableView4DblClick(Sender: TObject);
  private
    { Private declarations }
    ID_FOR_FILTER:Int64;
  public
    { Public declarations }
    SplashEdit: ControlsArray;
    NextStep:Integer;
    CurrStep:Integer;
    Constructor Create(AOwner:TComponent;Mode:Integer;ID_FOR_LOCATION:Int64;ID_FOR_FILTER:Int64;Flag:Integer);overload;
    procedure SplashEditProcedure;
    procedure ConfigureAnGrid;
    procedure ConfigureAnGridBySch(ID_SCH:Integer;View:TcxGridDBTableView);
  end;

implementation

uses GetProvInfoWizardResources;
{$R *.dfm}

{ TfrmChooseBUObjects }

constructor TfrmChooseBUObjects.Create(AOwner: TComponent; Mode: Integer;ID_FOR_LOCATION:Int64;ID_FOR_FILTER:Int64;Flag:Integer);
begin
     inherited Create(AOwner);
     self.ID_FOR_FILTER:=ID_FOR_FILTER;
     ObjectsDataSet.Database:=TfrmProvInfoWizard(owner).WorkDatabase;
     ObjectsDataSet.Transaction:=TfrmProvInfoWizard(owner).ReadTransaction;

     if (Mode=1)
     then begin
          CurrStep:=4;
          if (Flag=0)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_SM3[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=1)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_SM2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=-1) then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_SM1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          cxGrid1Level1.Visible:=true;
          cxGrid1Level2.Visible:=false;
          cxGrid1Level3.Visible:=false;
          if (ID_FOR_FILTER=0)
          then ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_SMET_FOR_WIZARD(NULL,'+''''+DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+')'
          else ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_SMET_FOR_WIZARD('+IntToStr(ID_FOR_FILTER)+','+''''+DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+')';
          cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_SMETA';
          ObjectsDataSet.Open;
          cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
          ObjectsDataSet.Locate('ID_SMETA',ID_FOR_LOCATION,[]);
     end;

     if (Mode=2)
     then begin
          CurrStep:=5;
          if (Flag=0)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_RZ3[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=1)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_RZ2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=-1) then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_RZ1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          cxGrid1Level1.Visible:=false;
          cxGrid1Level2.Visible:=true;
          cxGrid1Level3.Visible:=false;
          ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_RAZD_ST_FOR_WIZARD('+IntToStr(ID_FOR_FILTER)+','+''''+DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+',1)';
          cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
          ObjectsDataSet.Open;
          cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
          ObjectsDataSet.Locate('ID_OBJECT',ID_FOR_LOCATION,[]);
     end;
     if (Mode=3)
     then begin
          CurrStep:=6;
          if (Flag=0)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_ST3[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=1)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_ST2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=-1) then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_ST1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          cxGrid1Level1.Visible:=false;
          cxGrid1Level2.Visible:=true;
          cxGrid1Level3.Visible:=false;
          ObjectsDataSet.SelectSQL.Text:='SELECT * FROM BU_GET_RAZD_ST_FOR_WIZARD('+IntToStr(ID_FOR_FILTER)+','+''''+DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+',2)';
          cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
          ObjectsDataSet.Open;
          cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
          ObjectsDataSet.Locate('ID_OBJECT',ID_FOR_LOCATION,[]);
     end;

     if (Mode=4)
     then begin
          CurrStep:=2;
          Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_MA_SC[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          cxGrid1Level1.Visible:=false;
          cxGrid1Level2.Visible:=true;
          cxGrid1Level3.Visible:=false;
          if TfrmProvInfoWizard(owner).PSTRU^.Mode=21
          then begin
               ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM PUB_SP_MAIN_SCH_SELECT_EX('+''''+
               DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+',1,'+IntToStr(TfrmProvInfoWizard(owner).PSTRU^.ID_FORM_UCH)+') WHERE NOT (OPEN_SCH IS NULL)';
               cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_SCH';
          end
          else begin
               ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM PUB_SP_MAIN_SCH_SELECT_EX3('+''''+
               DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+',1,'+IntToStr(TfrmProvInfoWizard(owner).PSTRU^.ID_REG_UCH)+') WHERE NOT (OPEN_SCH IS NULL)';
               cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_SCH';
          end;
          cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
          ObjectsDataSet.Open;
          cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
          ObjectsDataSet.Locate('ID_OBJECT',ID_FOR_LOCATION,[]);
     end;

     if (Mode=5)
     then begin
          CurrStep:=3;
          Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_CO_SC[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          cxGrid1Level1.Visible:=false;
          cxGrid1Level2.Visible:=true;
          cxGrid1Level3.Visible:=false;
          ObjectsDataSet.SelectSQL.Text:='SELECT ID_SCH AS ID_OBJECT, SCH_NUMBER AS OBJECT_NUM, SCH_TITLE AS OBJECT_TITLE FROM BU_GET_SCH_FOR_WIZARD_FU('+''''+
          DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+','+IntToStr(TfrmProvInfoWizard(owner).tempID_SCH)+','+IntToStr(1-TfrmProvInfoWizard(owner).PSTRU^.CR_BY_DT)+')';
          cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
          ObjectsDataSet.Open;
          cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
          ObjectsDataSet.Locate('ID_OBJECT',ID_FOR_LOCATION,[]);
     end;

     if (Mode=6)
     then begin
          CurrStep:=7;
          if (Flag=0)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_KV3[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=1)  then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_KV2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=-1) then Panel2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_CH_TITLE_KV1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          cxGrid1Level1.Visible:=false;
          cxGrid1Level2.Visible:=true;
          cxGrid1Level3.Visible:=false;
          ObjectsDataSet.SelectSQL.Text:='SELECT ID_KEKV AS ID_OBJECT, KEKV_CODE AS OBJECT_NUM, KEKV_TITLE AS OBJECT_TITLE FROM PUB_SP_KEKV_SELECT('+''''+DateTimeToStr(TfrmProvInfoWizard(owner).PSTRU^.ACTUAL_DATE)+''''+',1) WHERE ENABLED = 1';
          cxGrid1DBTableView1.DataController.KeyFieldNames:='ID_OBJECT';
          ObjectsDataSet.Open;
          cxGrid1.ActiveView.DataController.FocusedRowIndex:=0;
          ObjectsDataSet.Locate('ID_OBJECT',ID_FOR_LOCATION,[]);
     end;

     if (Mode=7)
     then begin
          CurrStep:=8;
          if (Flag=0)  then Panel2.Caption:=GetProvInfoWizardResources.ANALITIC_FORM_HEAD_PANEL2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
          if (Flag=1)  then Panel2.Caption:=GetProvInfoWizardResources.ANALITIC_FORM_HEAD_PANEL1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];

          cxGrid1Level1.Visible:=false;
          cxGrid1Level2.Visible:=false;
          cxGrid1Level3.Visible:=true;
          ConfigureAnGrid;
          ConfigureAnGridBySch(ID_FOR_FILTER,cxGrid1DBTableView4);
     end;
end;

procedure TfrmChooseBUObjects.ConfigureAnGridBySch(ID_SCH:Integer;View:TcxGridDBTableView);
var ConfigProc:TpFibStoredProc;
begin
      ConfigProc:=TpFibStoredProc.Create(self);
      ConfigProc.Database:=TfrmProvInfoWizard(owner).WorkDatabase;
      ConfigProc.Transaction:=TfrmProvInfoWizard(owner).ReadTransaction;
      ConfigProc.StoredProcName:='MBOOK_ANALITIC_CONFIGURE';
      ConfigProc.Prepare;
      ConfigProc.ParamByName('ID_SCH').AsInt64:=ID_FOR_FILTER;
      ConfigProc.ExecProc;
      if ConfigProc.ParamByName('AN1_IS_VALID').AsInteger =1
      then View.Columns[0].Visible:=true
      else View.Columns[0].Visible:=false;
      if ConfigProc.ParamByName('AN2_IS_VALID').AsInteger =1
      then View.Columns[1].Visible:=true
      else View.Columns[1].Visible:=false;
      if ConfigProc.ParamByName('AN3_IS_VALID').AsInteger =1
      then View.Columns[2].Visible:=true
      else View.Columns[2].Visible:=false;
      if ConfigProc.ParamByName('AN4_IS_VALID').AsInteger =1
      then View.Columns[3].Visible:=true
      else View.Columns[3].Visible:=false;
      if ConfigProc.ParamByName('AN5_IS_VALID').AsInteger =1
      then View.Columns[4].Visible:=true
      else View.Columns[4].Visible:=false;
      if ConfigProc.ParamByName('AN6_IS_VALID').AsInteger =1
      then View.Columns[5].Visible:=true
      else View.Columns[5].Visible:=false;
      if ConfigProc.ParamByName('AN7_IS_VALID').AsInteger =1
      then View.Columns[6].Visible:=true
      else View.Columns[6].Visible:=false;
      if ConfigProc.ParamByName('AN8_IS_VALID').AsInteger =1
      then View.Columns[7].Visible:=true
      else View.Columns[7].Visible:=false;
      if ConfigProc.ParamByName('AN9_IS_VALID').AsInteger =1
      then View.Columns[8].Visible:=true
      else View.Columns[8].Visible:=false;
      if ConfigProc.ParamByName('AN10_IS_VALID').AsInteger=1
      then View.Columns[9].Visible:=true
      else View.Columns[9].Visible:=false;
      ConfigProc.Free;
end;



procedure TfrmChooseBUObjects.ConfigureAnGrid;
var i:Integer;
begin
     ColAnInfoDataSet.Database    :=TfrmProvInfoWizard(owner).WorkDatabase;
     ColAnInfoDataSet.Transaction :=TfrmProvInfoWizard(owner).ReadTransaction;

     if ColAnInfoDataSet.Active then ColAnInfoDataSet.Close;
     ColAnInfoDataSet.SelectSQL.Text:='SELECT  *  FROM PUB_SPR_ANALITIC';
     ColAnInfoDataSet.Open;
     ColAnInfoDataSet.FetchAll;
     ColAnInfoDataSet.First;
     for i:=0 to ColAnInfoDataSet.RecordCount-1 do
     begin
          if ColAnInfoDataSet.FieldByName('ID_TYPE_ENUM').Value=NULL
          then begin
          end
          else begin
            cxGrid1DBTableView4.Columns[i].Caption:=ColAnInfoDataSet.FieldByName('NOTE').AsString;
          end;
          cxGrid1DBTableView4.Columns[i].Visible:=false;
          ColAnInfoDataSet.Next;
     end;

     ObjectsDataSet.SelectSQL.Text:=' SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX2('+IntToStr(ID_FOR_FILTER)+')';
     ObjectsDataSet.Open;
     ObjectsDataSet.FetchAll;
     ObjectsDataSet.RecordCount;

end;


procedure TfrmChooseBUObjects.OKButtonClick(Sender: TObject);
begin
     if (ObjectsDataSet.RecordCount>0)
     then begin
          NextStep:=1;
          ModalResult:=mrYes;
     end;
end;

procedure TfrmChooseBUObjects.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
   OkButtonClick(self);
end;

procedure TfrmChooseBUObjects.cxGrid1DBTableView2DblClick(Sender: TObject);
begin
   OkButtonClick(self);
end;

procedure TfrmChooseBUObjects.cxGrid1DBTableView3DblClick(Sender: TObject);
begin
   OkButtonClick(self);
end;

procedure TfrmChooseBUObjects.Action1Execute(Sender: TObject);
begin
   OkButtonClick(self);
end;

procedure TfrmChooseBUObjects.Action2Execute(Sender: TObject);
begin
      ModalResult:=mrNoToAll;
end;

procedure TfrmChooseBUObjects.FormShow(Sender: TObject);
begin
     self.Caption        :=GetProvInfoWizardResources.MAIN_FORM_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbDBtitle.Caption   :=GetProvInfoWizardResources.MAIN_FORM_DB_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbKrtitle.Caption   :=GetProvInfoWizardResources.MAIN_FORM_KR_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     BackButton.Caption  :=GetProvInfoWizardResources.MAIN_FORM_BACK_BUTTON[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     OKButton.Caption    :=GetProvInfoWizardResources.MAIN_FORM_OK_BUTTON[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     CloseButton.Caption :=GetProvInfoWizardResources.MAIN_FORM_CLOSE_BUTTON[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbSchDb.Caption     :=GetProvInfoWizardResources.MAIN_FORM_SCH_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbSchkr.Caption     :=GetProvInfoWizardResources.MAIN_FORM_SCH_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbSmDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_SMT_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbSmKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_SMT_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbRzDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_RAZ_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbRzKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_RAZ_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbStDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_STA_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbStKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_STA_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbKVDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_KVZ_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbKVKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_KVZ_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbAnDb.Caption      :=GetProvInfoWizardResources.MAIN_FORM_AN_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     lbAnKr.Caption      :=GetProvInfoWizardResources.MAIN_FORM_AN_TITLE[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];


     cxGrid1DBTableView1DBColumn1.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_GRID1_COL1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBTableView1DBColumn2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_GRID1_COL2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBTableView1DBColumn3.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_GRID1_COL3[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];

     cxGrid1DBTableView2DBColumn1.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_GRID2_COL1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBTableView2DBColumn2.Caption:=GetProvInfoWizardResources.CHOOSE_OBJ_GRID2_COL2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];



     InfoPanel.Visible:=TfrmProvInfoWizard(Owner).PSTRU^.INFO_PANEL_SH;

     if TfrmProvInfoWizard(Owner).edCr_by_dt
     then lbDBtitle.Caption:=lbDBtitle.Caption+'(!)'
     else lbKrtitle.Caption:=lbKrtitle.Caption+'(!)';

     //заполнение информации по счетам
     edDBSchNum.Text     := TfrmProvInfoWizard(Owner).edDBSchNum_x;
     edDBSchTitle.Text   := TfrmProvInfoWizard(Owner).edDBSchTitle_x;

     edKrSchNum.Text     := TfrmProvInfoWizard(Owner).edKrSchNum_x;
     edKrSchTitle.Text   := TfrmProvInfoWizard(Owner).edKrSchTitle_x;

     //заполнение информации по бюджетам
     edDBSm.Text         := TfrmProvInfoWizard(Owner).edDbSm_x;
     edDBRz.Text         := TfrmProvInfoWizard(Owner).edDbRz_x;
     edDbSt.Text         := TfrmProvInfoWizard(Owner).edDbSt_x;
     edDBKV.Text         := TfrmProvInfoWizard(Owner).edDbKV_x;

     edKrSm.Text         := TfrmProvInfoWizard(Owner).edKrSm_x;
     edKrRz.Text         := TfrmProvInfoWizard(Owner).edKrRz_x;
     edKrSt.Text         := TfrmProvInfoWizard(Owner).edKrSt_x;
     edKrKV.Text         := TfrmProvInfoWizard(Owner).edKrKV_x;

     edDBAn.Text         := TfrmProvInfoWizard(Owner).edDbAn_x;
     edKrAn.Text         := TfrmProvInfoWizard(Owner).edKrAn_x;

     if TfrmProvInfoWizard(Owner).Mode=1
     then begin
              N1.Enabled:=false;
              N2.Enabled:=false;
              N3.Enabled:=true;
              N5.Enabled:=true;
              N6.Enabled:=true;
              N7.Enabled:=true;
     end;

     if TfrmProvInfoWizard(Owner).Mode=2
     then begin
              N1.Enabled:=false;
              N2.Enabled:=true;
              N3.Enabled:=true;
              N5.Enabled:=true;
              N6.Enabled:=true;
              N7.Enabled:=true;
     end;
     if TfrmProvInfoWizard(Owner).Mode=3
     then begin
              N1.Enabled:=false;
              N2.Enabled:=false;
              N3.Enabled:=true;
              N5.Enabled:=true;
              N6.Enabled:=true;
              N7.Enabled:=true;
     end;
end;

procedure TfrmChooseBUObjects.BackButtonClick(Sender: TObject);
begin
     ModalResult:=mrNoToAll;
end;

procedure TfrmChooseBUObjects.CloseButtonClick(Sender: TObject);
begin
      ModalResult:=mrNone;
end;

procedure TfrmChooseBUObjects.N2Click(Sender: TObject);
begin
     if (CurrStep<=2)
     then ShowMessage('Невозможно вернуться к выбранному этапу')
     else begin
               NextStep:=-2;
               ModalResult:=mrYes;
     end;
end;


procedure TfrmChooseBUObjects.N3Click(Sender: TObject);
begin
     if (CurrStep<=3)
     then ShowMessage('Невозможно вернуться к выбранному этапу')
     else begin
               NextStep:=-3;
               ModalResult:=mrYes;
     end;

end;

procedure TfrmChooseBUObjects.N5Click(Sender: TObject);
begin
     if (CurrStep<=4)
     then ShowMessage('Невозможно вернуться к выбранному этапу')
     else begin
               NextStep:=-4;
               ModalResult:=mrYes;
     end;

end;

procedure TfrmChooseBUObjects.N6Click(Sender: TObject);
begin
     if (CurrStep<=5)
     then ShowMessage('Невозможно вернуться к выбранному этапу')
     else begin
               NextStep:=-5;
               ModalResult:=mrYes;
     end;

end;

procedure TfrmChooseBUObjects.N7Click(Sender: TObject);
begin
     if (CurrStep<=6)
     then ShowMessage('Невозможно вернуться к выбранному этапу')
     else begin
               NextStep:=-6;
               ModalResult:=mrYes;
     end;

end;

procedure TfrmChooseBUObjects.SplashEditProcedure;
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


procedure TfrmChooseBUObjects.Timer1Timer(Sender: TObject);
begin
          SplashEditProcedure;
end;

procedure TfrmChooseBUObjects.cxGrid1DBTableView4DblClick(Sender: TObject);
begin
   OkButtonClick(self);
end;

end.


