{               "Учет товарно-материальных ценностей, ОС, МНА и МБП"           }
{                              Инвентарная картотека                           }
{                                                                              }
{               (c) Шамарин Ю.В., Данильченко А.Н.     2004-2007               }
{                                                                              }
unit uShowAllVedPereoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxLookAndFeelPainters, StdCtrls,
  cxButtons, ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, ActnList,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, cxClasses,
  ibase, Placemnt, cxSplitter, FR_DSet,
  FR_DBSet, FR_Class, cxContainer, cxCheckBox, uMatasVars, GlobalSpr,
  ClassInvKart, uResources;

type
  TfmPereocVed = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyleYellow: TcxStyle;
    cxStyleFontBlack: TcxStyle;
    cxStyleMalin: TcxStyle;
    cxStyleBorder: TcxStyle;
    cxStylemalinYellow: TcxStyle;
    cxStyleGrid: TcxStyle;
    ForHaeder: TcxStyle;
    AfterSelection: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    DBasePereoc: TpFIBDatabase;
    DSPereocLook: TpFIBDataSet;
    DataSourcePromej: TDataSource;
    ActionList1: TActionList;
    ActionLetsDo: TAction;
    cxGridPokaz: TcxGrid;
    cxGridPokazDBTableView1: TcxGridDBTableView;
    cxGridPokazDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridPokazLevel1: TcxGridLevel;
    PanelBotton: TPanel;
    cxButtonVibor: TcxButton;
    cxButtonGariOno: TcxButton;
    TransRead: TpFIBTransaction;
    cxGridPokazDBTableView1DBColumn2: TcxGridDBColumn;
    Panel1: TPanel;
    GridDatailInfo: TcxGrid;
    GDBTView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    DataSourceDatail: TDataSource;
    DSDatail: TpFIBDataSet;
    GDBTViewDB_NAME_NOMN: TcxGridDBColumn;
    SplitDatailContr: TcxSplitter;
    DSPereocLookID_PEREOC_VED: TFIBBCDField;
    DSPereocLookDATE_PEREOC: TFIBDateField;
    DSPereocLookPUB_ID_DOC: TFIBBCDField;
    DSPereocLookSAVED: TFIBBooleanField;
    DSPereocLookID_DOC: TFIBBCDField;
    DSDatailNAME_NOMN: TFIBStringField;
    DSDatailID_MO: TFIBBCDField;
    DSDatailFIO_MOL: TFIBStringField;
    DSDatailNAME_DEPARTMENT: TFIBStringField;
    GDBTViewDB_FIO_MOL: TcxGridDBColumn;
    GDBTViewDB_NAME_DEPARTMENT: TcxGridDBColumn;
    GDBTViewDB_summa_oper: TcxGridDBColumn;
    DSDatailSUMMA_OPER: TFIBBCDField;
    frReportGoVedPrint: TfrReport;
    frDBDataSet_Print_Ved: TfrDBDataSet;
    cxCheckBoxDisain: TcxCheckBox;
    DSDatailOST_PR_OLD: TFIBBCDField;
    DSDatailOST_IZ_OLD: TFIBBCDField;
    DSDatailOST_PR_NEW: TFIBBCDField;
    DSDatailOST_IZ_NEW: TFIBBCDField;
    DSDatailID_SCH: TFIBBCDField;
    DSDatailNUM_SCH: TFIBStringField;
    DSDatailINV_NUM_FULL: TFIBStringField;
    frDBDataSet_Zagal: TfrDBDataSet;
    ButtonDesmission: TcxButton;
    StornOperation: TAction;
    DSDatailID_USER: TFIBBCDField;
    DSDatailPUB_ID_DOC: TFIBBCDField;
    DSDatailID_KART: TFIBBCDField;
    DSDatailID_OPER: TFIBBCDField;
    TransactionGlobal: TpFIBTransaction;
    WhatWeHave: TAction;
    cxGridPokazDBTableView1DBColumn3: TcxGridDBColumn;
    DSPereocLookDT_VED: TFIBDateTimeField;
    DSDatailBAL_PRICE_OLD: TFIBBCDField;
    DSDatailBAL_PRICE_NEW: TFIBBCDField;
    frDBDataSet3: TfrDBDataSet;
    DSPereocLookCOEF: TFIBBCDField;
    procedure cxButtonGariOnoClick(Sender: TObject);
    procedure ActionLetsDoExecute(Sender: TObject);
    procedure StornOperationExecute(Sender: TObject);
    procedure WhatWeHaveExecute(Sender: TObject);
  private
    { Private declarations }
  public
    ResultArray : Variant;
  end;
    function ShowAllVedPereoc(DB_handel_send: TISC_DB_HANDLE) : variant;
var
  fmPereocVed: TfmPereocVed;

implementation

uses Kernel, uSelectShablon;

{$R *.dfm}

function ShowAllVedPereoc(DB_handel_send: TISC_DB_HANDLE) : variant;
var
   WP : TfmPereocVed;
begin
    WP := TfmPereocVed.Create(nil);
    WP.DBasePereoc.Handle        := DB_handel_send;

    WP.Caption                   := MAT_INV_system_name + MAT_INV_look;
    WP.cxButtonVibor.Caption     := MAT_INV_Print;
    WP.cxButtonGariOno.Caption   := MAT_INV_Cansel;

    WP.cxGridPokazDBTableView1DBColumn1.Caption := MAT_INV_date_create_pereoc;
    WP.cxGridPokazDBTableView1DBColumn2.Caption := MAT_INV_obj_koef;
    WP.cxGridPokazDBTableView1DBColumn3.Caption := MAT_INV_DT_oper;

    WP.GDBTViewDB_NAME_NOMN.Caption             := MAT_INV_Name;
    WP.GDBTViewDB_FIO_MOL.Caption               := MAT_INV_MOL;
    WP.GDBTViewDB_NAME_DEPARTMENT.Caption       := MAT_INV_dep_name;
    WP.GDBTViewDB_summa_oper.Caption            := MAT_INV_obj_sum;

    WP.DSPereocLook.Close;

    WP.DSDatail.Close;
    WP.DSDatail.SQLs.SelectSQL.Clear;
    WP.DSDatail.SQLs.SelectSQL.Add('select * from MAT_INV_SEL_DATAIL_PEREOC(?ID_PEREOC_VED)');
    WP.DSDatail.SQLs.SelectSQL.Add('order by NUM_SCH, FIO_MOL, NAME_DEPARTMENT, NAME_NOMN');
    WP.DSPereocLook.SQLs.SelectSQL.Text := 'select * from MAT_DT_PEREOC_VED';
    WP.DSPereocLook.Open;
    WP.DSDatail.Open;

    WP.ShowModal;
    ShowAllVedPereoc := WP.ResultArray;
    WP.Free;

end;

procedure TfmPereocVed.cxButtonGariOnoClick(Sender: TObject);
begin
    close;
end;

procedure TfmPereocVed.ActionLetsDoExecute(Sender: TObject);
var
    res : Variant;
    chyavo_delat_to : integer;
begin
    res := USelectShablon.SetShablon(self, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        chyavo_delat_to := res[0];
    end;

    if chyavo_delat_to = 0 then
    begin
        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKPO']            := _ORG_KOD_OKPO;

        frReportGoVedPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + 'mat_inv_ved_pereoc.frf');
        frReportGoVedPrint.ShowReport;
        if cxCheckBoxDisain.Checked then
        begin
           frReportGoVedPrint.DesignReport;
        end;
    end;
    if chyavo_delat_to = 1 then
    begin
        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKPO']            := _ORG_KOD_OKPO;

        frReportGoVedPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + 'mat_inv_ved_pereoc_2.frf');
        frReportGoVedPrint.ShowReport;
        if cxCheckBoxDisain.Checked then
        begin
           frReportGoVedPrint.DesignReport;
        end;
    end;
    if chyavo_delat_to = 2 then
    begin
        frVariables['ustanova']        := _ORG_FULL_NAME;
        frVariables['OKPO']            := _ORG_KOD_OKPO;

        frReportGoVedPrint.LoadFromFile(ExtractFilePath(Application.ExeName)+ _PATH_REPORTS + '\' + 'mat_inv_ved_pereoc_3.frf');
        frReportGoVedPrint.ShowReport;
        if cxCheckBoxDisain.Checked then
        begin
           frReportGoVedPrint.DesignReport;
        end;
    end;
    if chyavo_delat_to = 255 then
    begin
        Exit;
    end;
end;

procedure TfmPereocVed.StornOperationExecute(Sender: TObject);
var
   STRU                       :KERNEL_MODE_STRUCTURE;
   DoResult                   :Boolean;

   PUB_ID_DOC, PUB_ID_DOC_OLD : Int64;
   id_oper, id_kart, tipok    : int64;
   id_user                    : int64;
begin
    PUB_ID_DOC_OLD := 0;
    if MessageBox(Handle, Pchar('Ви впевненнi, що бажаєте видалити відомість з усіма проводками?' ), Pchar(MAT_INV_Attention),mb_YesNO)=mrYes then
    begin
     DSDatail.First;
     While not DSDatail.Eof do
     begin
         PUB_ID_DOC              := StrToInt64(DSDatail.FieldByName('pub_id_doc').AsString);
         id_oper                 := StrToInt64(DSDatail.FieldByName('id_oper').AsString);
         id_kart                 := StrToInt64(DSDatail.FieldByName('id_kart').AsString);
         id_user                 := StrToInt64(DSDatail.FieldByName('id_user').AsString);
         tipok                   := 7;

         if (PUB_ID_DOC <> PUB_ID_DOC_OLD) then
         begin
             TransactionGlobal.Active:= true;
             STRU.DBHANDLE      := DBasePereoc.Handle;
             STRU.TRHANDLE      := TransactionGlobal.Handle;
             STRU.WORKDATE      := _MATAS_PERIOD;
             STRU.KERNEL_ACTION := 2;
             STRU.KEY_SESSION   := DBasePereoc.Gen_Id('KERNEL_GEN_ID_SESSION', 1);
             STRU.id_user       := id_user;
             STRU.PK_ID         := PUB_ID_DOC;
             DoResult:=Kernel.KernelDo(@STRU);
             if DoResult then
             begin
                 TransactionGlobal.Commit;
             end else
             begin
                 TransactionGlobal.Rollback;
                 ShowMessage('Виникла помилка! Можливо обрано не той перiод...');
             end;
             PUB_ID_DOC_OLD     := PUB_ID_DOC;
             Delete_prov_from_doc_mass(PUB_ID_DOC);
         end;

         //Delete_prov_from_doc(PUB_ID_DOC);
         //Un_Pereocenka(id_kart, id_oper, tipok);
         //Un_all_Operacii(id_kart, id_oper);

         DSDatail.Next;
     end;
     DSDatail.CloseOpen(false);
     DSPereocLook.CloseOpen(false);
     ResultArray := VarArrayCreate([0,1], varVariant);
     ResultArray[0] := 1;
    end; 
end;

procedure TfmPereocVed.WhatWeHaveExecute(Sender: TObject);
begin
    showmessage('id_oper=' + DSDatail.FieldByName('id_oper').AsString + ', id_kart=' + DSDatail.FieldByName('id_kart').AsString);
end;

end.
