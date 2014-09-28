unit uPiPrepareDoc1dfMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox, cxCalendar,
  Menus, cxGridCustomPopupMenu, cxGridPopupMenu, ActnList,
  cxGridBandedTableView, cxGridTableView, dxBar, dxBarExtItems,
  cxGridDBBandedTableView, dxDockPanel, dxDockControl, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, ExtCtrls, dxStatusBar, cxSplitter, upi_resources,
  DogLoaderUnit, uPiPrepareDocAdd, uPiPrepareAddRecordDoc, cxDBLabel,
  cxContainer, cxLabel, ImgList,AccMgmt, uPiImportFilter;

type
  TfmPrepareDocMain = class(TForm)
    cxSplitter1: TcxSplitter;
    dxStatusBar1: TdxStatusBar;
    PanelPeople: TPanel;
    GridView: TcxGrid;
    GridDBView: TcxGridDBTableView;
    Grid1ClYear: TcxGridDBColumn;
    grid1ClPachka: TcxGridDBColumn;
    Grid1ClType: TcxGridDBColumn;
    GridViewLevel1: TcxGridLevel;
    dxStatusBar2: TdxStatusBar;
    dxDockSite1: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    DockPanel1: TdxDockPanel;
    Grid2: TcxGrid;
    Grid2DBBandedTableView1: TcxGridDBBandedTableView;
    Grid2ClTinPasport: TcxGridDBBandedColumn;
    Grid2ClSumNar: TcxGridDBBandedColumn;
    Grid2ClSumDoh: TcxGridDBBandedColumn;
    Grid2ClSumTaxN: TcxGridDBBandedColumn;
    Grid2ClSumTaxD: TcxGridDBBandedColumn;
    Grid2ClKod1df: TcxGridDBBandedColumn;
    Grid2ClPSoc: TcxGridDBBandedColumn;
    Grid2ClDateCame: TcxGridDBBandedColumn;
    Grid2ClDateLeave: TcxGridDBBandedColumn;
    Grid2ClFio: TcxGridDBBandedColumn;
    Grid2Level1: TcxGridLevel;
    BarDockLocate: TdxBarDockControl;
    BarManager: TdxBarManager;
    RefreshBtn: TdxBarLargeButton;
    ExitBtn: TdxBarLargeButton;
    AddPack: TdxBarLargeButton;
    InsertBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    DetailBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DelPack: TdxBarLargeButton;
    SelPack: TdxBarLargeButton;
    ImportBtn: TdxBarLargeButton;
    GenerateBtn: TdxBarLargeButton;
    DeleteTempBtn: TdxBarLargeButton;
    SettingsBtn: TdxBarLargeButton;
    Styles: TcxStyleRepository;
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
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    ActionList: TActionList;
    SystemAction: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    PopupMenu: TPopupMenu;
    PopupInsertBtn: TMenuItem;
    PopupUpdateBtn: TMenuItem;
    PopupDeleteBtn: TMenuItem;
    PopupDetailBtn: TMenuItem;
    PopupOtherManBtn: TMenuItem;
    PopupOtherWithReplBtn: TMenuItem;
    ExportDBFBtn: TMenuItem;
    ExportToXMLBtn: TMenuItem;
    PopupToCorrectBtn: TMenuItem;
    N1: TMenuItem;
    PopupExitBtn: TMenuItem;
    EditPack: TdxBarLargeButton;
    ClonButton: TdxBarLargeButton;
    AddReport: TcxGridDBColumn;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    DBLabelDoc1df: TcxDBLabel;
    LargeImages: TImageList;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    ClearBtn: TdxBarLargeButton;
    cxLabel2: TcxLabel;
    LabelCount: TcxLabel;
    procedure AddPackClick(Sender: TObject);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshBtnClick(Sender: TObject);
    procedure DelPackClick(Sender: TObject);
    procedure EditPackClick(Sender: TObject);
    procedure InsertBtnClick(Sender: TObject);
    procedure UpdateBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure ClonButtonClick(Sender: TObject);
    procedure MemoryDataHeaderAfterScroll(DataSet: TDataSet);
    procedure GridDBViewDblClick(Sender: TObject);
    procedure dxBarLargeButton2Click(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
  private
  public
    id_header_1df : variant;
    infO_1df :string;
    id_user : integer;
    res : Variant;
    constructor  Create(AParameter:TpiParamPacks);reintroduce;
  end;

var
  fmPrepareDocMain: TfmPrepareDocMain;

implementation

uses DMPIPrepareDoc1df;

{$R *.dfm}

constructor  TfmPrepareDocMain.Create(AParameter:TpiParamPacks);
begin
    Screen.Cursor := crHourGlass;

    inherited Create(AParameter.Owner);

    DM := TDM.Create(Self);
    DM.DB.Handle:=AParameter.DB_Handle;
    DM.DB.Connected := True;
    id_header_1df := AParameter.ID_Locate;
    infO_1df      := AParameter.str_text;

    GridDBView.DataController.DataSource              := DM.DataSourceHeader;
    Grid2DBBandedTableView1.DataController.DataSource := DM.DataSourceDocRecord;
    DBLabelDoc1df.DataBinding.DataSource              := DM.DataSourceHeader;

    id_user := AccMgmt.GetUserId;
    RefreshBtnClick(self);
    if not Dm.MemoryDataHeader.IsEmpty then
    Dm.MemoryDataHeader.First;

    Screen.Cursor:=crDefault;
end;

procedure TfmPrepareDocMain.MemoryDataHeaderAfterScroll(DataSet: TDataSet);
begin
    DM.DataSetDocRecord.Close;
    DM.DataSetDocRecord.SQLs.SelectSQL.Text := 'select * from PI_PREPARE_DOC_SEL (:id_doc_header)';
    DM.DataSetDocRecord.ParamByName('id_doc_header').AsVariant := DM.MemoryDataHeader['id_doc_header'];
    DM.DataSetDocRecord.Open;

    LabelCount.Caption := Inttostr(DM.DataSetDocRecord.RecordCount);
end;


procedure TfmPrepareDocMain.AddPackClick(Sender: TObject);
var
    ViewForm      : TfmPrepareDocAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmPrepareDocAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_doc_header             := null;
    ViewForm.id_type_doc               := null;
    ViewForm.DateEdit.date             := date;
    ViewForm.TextEditNum.Text          := inttostr(ViewForm.numb_pack+1);
    ViewForm.MemoNote.Text             := '';

    ViewForm.Caption                   := 'Додавання документів';

    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'PI_DOC_HEADERS_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_DOC_HEADER').AsVariant         := ViewForm.id_doc_header;
          DM.StProc.ParamByName('NUM_DOC').AsInteger               := strtoint(ViewForm.TextEditNum.Text);
          DM.StProc.ParamByName('DATE_DOC').AsDate                 := ViewForm.DateEdit.date ;
          DM.StProc.ParamByName('ID_TYPE_DOC').AsVariant           := ViewForm.id_type_doc;
          DM.StProc.ParamByName('NOTE').AsString                   := ViewForm.MemoNote.Text ;

          
          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_DOC_HEADER_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у роботі процедури PI_DOC_HEADERS_IU!');
        raise;
      end;
      end;
       RefreshBtnClick(self);
       DM.MemoryDataHeader.Locate('ID_DOC_HEADER', locate_id, []);
end;

procedure TfmPrepareDocMain.ExitBtnClick(Sender: TObject);
begin
    close;
end;

procedure TfmPrepareDocMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfmPrepareDocMain.RefreshBtnClick(Sender: TObject);
begin
    DM.MemoryDataHeader.AfterScroll := nil;
    while DM.MemoryDataHeader.RecordCount>0 do
    begin
        DM.MemoryDataHeader.Delete;
        DM.MemoryDataHeader.Next;
    end;
    if((id_header_1df=null)or(id_header_1df=0)) then
    begin
        DM.DataSetHeader.Close;
        DM.DataSetHeader.SQLs.SelectSQL.Text := 'SELECT * FROM PI_DOC_HEADERS_SEL(:id_user) order by date_doc, num_doc';
        DM.DataSetHeader.Prepare;
        DM.DataSetHeader.ParamByName('id_user').AsInteger := id_user;
        DM.DataSetHeader.Open;
    end else
    begin
        DM.DataSetHeader.Close;
        DM.DataSetHeader.SQLs.SelectSQL.Text := 'SELECT * FROM PI_DOC_HEADERS_SEL(:id_user) where id_header_1df is null or id_header_1df='+vartostr(id_header_1df)+' order by date_doc, num_doc';
        DM.DataSetHeader.Prepare;
        DM.DataSetHeader.ParamByName('id_user').AsInteger := id_user;
        DM.DataSetHeader.Open;
    end;

    DM.DataSetHeader.FetchAll;
    DM.DataSetHeader.First;

    while not DM.DataSetHeader.Eof do
    begin
        DM.MemoryDataHeader.Open;
        DM.MemoryDataHeader.Insert;
        DM.MemoryDataHeader.FieldByName('id_doc_header').Value           := DM.DataSetHeader['id_doc_header'];
        DM.MemoryDataHeader.FieldByName('num_doc').Value                 := DM.DataSetHeader['num_doc'];
        DM.MemoryDataHeader.FieldByName('date_doc').Value                := DM.DataSetHeader['date_doc'];
        DM.MemoryDataHeader.FieldByName('id_type_doc').Value             := DM.DataSetHeader['id_type_doc'];
        DM.MemoryDataHeader.FieldByName('note').Value                    := DM.DataSetHeader['note'];
        if(DM.DataSetHeader['id_header_1df']<> null) then
            DM.MemoryDataHeader.FieldByName('id_header_1df').Value       := DM.DataSetHeader['id_header_1df']
        else
            DM.MemoryDataHeader.FieldByName('id_header_1df').Value       :=0;
        DM.MemoryDataHeader.FieldByName('info_1df').Value                := DM.DataSetHeader['info_1df'];
        DM.MemoryDataHeader.FieldByName('added_in_1df').Value            := DM.DataSetHeader['added_in_1df'];
        DM.MemoryDataHeader.FieldByName('name_type_doc').Value           := DM.DataSetHeader['name_type_doc'];
        if(DM.DataSetHeader['id_prop_default']<>null)  then
        begin
            DM.MemoryDataHeader.FieldByName('id_prop_income').Value          := DM.DataSetHeader['id_prop_default'];
            DM.MemoryDataHeader.FieldByName('name_prop').Value               := DM.DataSetHeader['name_prop'];
            DM.MemoryDataHeader.FieldByName('kod_prop').Value                := DM.DataSetHeader['kod_prop'];
        end else
        begin
            DM.MemoryDataHeader.FieldByName('id_prop_income').Value          := null;
            DM.MemoryDataHeader.FieldByName('name_prop').Value               := '';
            DM.MemoryDataHeader.FieldByName('kod_prop').Value                := null;
        end;


        DM.MemoryDataHeader.Post;
        DM.DataSetHeader.Next;
    end;
    DM.MemoryDataHeader.AfterScroll := MemoryDataHeaderAfterScroll;
    if(not DM.MemoryDataHeader.Isempty) then
    DM.MemoryDataHeader.First;
end;

procedure TfmPrepareDocMain.DelPackClick(Sender: TObject);
var
    locate_id : integer;
    locate_cur, res_del : integer;
begin
      if DM.DataSetHeader.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити документ № '+inttostr(DM.MemoryDataHeader['num_doc'])+ ' від '+datetostr(DM.MemoryDataHeader['date_doc'])+ '?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          locate_cur := DM.MemoryDataHeader['ID_DOC_HEADER'];
          DM.DataSetHeader.Prior;
          locate_id := DM.MemoryDataHeader['ID_DOC_HEADER'];
          DM.MemoryDataHeader.Next;
          DM.MemoryDataHeader.Locate('ID_DOC_HEADER', locate_cur, []);

          DM.StProc.StoredProcName := 'PI_DOC_HEADERS_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_DOC_HEADER').AsInt64 := locate_cur;
          DM.StProc.ExecProc;
          res_del := DM.StProc.ParamByName('result').AsInteger;
          if(res_del=1) then
          begin
              showmessage('Неможна видалити прив''язаний документ до звіту 1дф!');
              exit;
          end;
          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури PI_SP_PROP_INCOME_DEL!');
           raise;
         end;
     end;

     RefreshBtnClick(self);
     DM.MemoryDataHeader.Locate('ID_DOC_HEADER', locate_id, []);
end;

procedure TfmPrepareDocMain.EditPackClick(Sender: TObject);
var
    ViewForm      : TfmPrepareDocAdd;
    locate_id     : integer;
begin
    if DM.DataSetHeader.RecordCount = 0 then exit;

    ViewForm                           := TfmPrepareDocAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.Caption                   := 'Редагування документів';
    ViewForm.id_doc_header             := DM.MemoryDataHeader['ID_DOC_HEADER'];
    ViewForm.id_type_doc               := DM.MemoryDataHeader['ID_TYPE_DOC'];
    ViewForm.DateEdit.date             := DM.MemoryDataHeader['DATE_DOC'];
    ViewForm.TextEditNum.Text          := DM.MemoryDataHeader['NUM_DOC'];
    ViewForm.MemoNote.Text             := DM.MemoryDataHeader['NOTE'];
    ViewForm.ButtonEditTypeDoc.Text    := DM.MemoryDataHeader['name_type_doc'];

    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'PI_DOC_HEADERS_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_DOC_HEADER').AsVariant         := ViewForm.id_doc_header;
          DM.StProc.ParamByName('NUM_DOC').AsInteger               := strtoint(ViewForm.TextEditNum.Text);
          DM.StProc.ParamByName('DATE_DOC').AsDate                 := ViewForm.DateEdit.date ;
          DM.StProc.ParamByName('ID_TYPE_DOC').AsVariant           := ViewForm.id_type_doc;
          DM.StProc.ParamByName('NOTE').AsString                   := ViewForm.MemoNote.Text ;

          DM.StProc.ExecProc;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури PI_DOC_HEADERS_IU!');
        raise;
      end;
      end;
      locate_id := DM.MemoryDataHeader['ID_DOC_HEADER'];
      RefreshBtnClick(self);
      DM.MemoryDataHeader.Locate('ID_DOC_HEADER', locate_id, []);
end;

procedure TfmPrepareDocMain.InsertBtnClick(Sender: TObject);
var
    ViewForm      : TfmAddRecordDoc;
    locate_id, locate_header    : integer;
begin
    ViewForm                           := TfmAddRecordDoc.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_doc                          := null;
    ViewForm.id_man                          := null;
    ViewForm.id_prop_pilg                    := null;
    if(DM.MemoryDataHeader['id_prop_income']<>null) then
         ViewForm.id_prop_income                  := DM.MemoryDataHeader['id_prop_income']
    else
         ViewForm.id_prop_income                  := null;
    if(DM.MemoryDataHeader['kod_prop']<>null) then
         ViewForm.ButtonEditProp.Text             := DM.MemoryDataHeader['kod_prop']
    else
         ViewForm.ButtonEditProp.Text             := '';
    ViewForm.ButtonEditFio.Text              := '';
    ViewForm.TextEditTn.Text                 := '';
    ViewForm.MaskEditSumTaxD.EditValue       := null;
    ViewForm.MaskEditSumDoh.EditValue        := null;
    ViewForm.MaskEditSumNar.EditValue        := null;
    ViewForm.MaskEditSumTaxN.EditValue       := null;
    ViewForm.DateEditCame.EditValue          := null;
    ViewForm.DateEditLeave.EditValue         := null;


    ViewForm.Caption                   := 'Додавання позицій у документ';

    ViewForm.YesBtn.Caption            := 'Додати';

    ViewForm.ShowModal;

    if ViewForm.ModalResult = mrOk then
    begin
          DM.StProc.StoredProcName := 'PI_PREPARE_DOC_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('id_doc').AsVariant         := ViewForm.id_doc;
          DM.StProc.ParamByName('id_man').AsVariant         := ViewForm.id_man;

          DM.StProc.ParamByName('id_prop_income').AsVariant := ViewForm.id_prop_income;
          DM.StProc.ParamByName('id_doc_header').AsVariant  := DM.MemoryDataHeader['id_doc_header'];
          if(ViewForm.MaskEditSumNar.Text='') then
              DM.StProc.ParamByName('sum_nar').AsFloat       := 0
          else
              DM.StProc.ParamByName('sum_nar').AsFloat       := ViewForm.MaskEditSumNar.EditValue;
          if(ViewForm.MaskEditSumDoh.Text='') then
              DM.StProc.ParamByName('sum_doh').AsFloat       := 0
          else
              DM.StProc.ParamByName('sum_doh').AsFloat       := ViewForm.MaskEditSumDoh.EditValue;
          if(ViewForm.MaskEditSumTaxN.Text='') then
              DM.StProc.ParamByName('sum_taxn').AsFloat       := 0
          else
              DM.StProc.ParamByName('sum_taxn').AsFloat      := ViewForm.MaskEditSumTaxN.EditValue;
          if(ViewForm.MaskEditSumTaxD.Text='') then
              DM.StProc.ParamByName('sum_taxd').AsFloat       := 0
          else
              DM.StProc.ParamByName('sum_taxd').AsFloat      := ViewForm.MaskEditSumTaxD.EditValue;
          DM.StProc.ParamByName('prop_pilg').AsVariant       := ViewForm.id_prop_pilg;
          if(ViewForm.DateEditCame.EditValue=null) then
              DM.StProc.ParamByName('date_accept').AsVariant  := null
          else
              DM.StProc.ParamByName('date_accept').AsDate    := ViewForm.DateEditCame.Date;
          if(ViewForm.DateEditLeave.EditValue=null) then
              DM.StProc.ParamByName('date_dismiss').AsVariant  := null
          else
              DM.StProc.ParamByName('date_dismiss').AsDate    := ViewForm.DateEditLeave.Date;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('id_doc_out').AsInteger;

      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у роботі процедури PI_PREPARE_DOC_IU!');
        raise;
      end;
      end;
       locate_header := DM.MemoryDataHeader['id_doc_header'];
       RefreshBtnClick(self);
       DM.MemoryDataHeader.Locate('id_doc_header', locate_header, []);
       DM.DataSetDocRecord.Locate('id_doc', locate_id, []);

end;


procedure TfmPrepareDocMain.UpdateBtnClick(Sender: TObject);
var
    ViewForm      : TfmAddRecordDoc;
    locate_id, locate_header    : integer;
begin
    if(DM.DataSetDocRecord.IsEmpty) then exit;
    ViewForm                           := TfmAddRecordDoc.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_doc                          := DM.DataSetDocRecord['id_doc'];
    ViewForm.id_man                          := DM.DataSetDocRecord['id_man'];
    if(DM.DataSetDocRecord['id_prop_pilg']=null) then
    begin
        ViewForm.id_prop_pilg                    := null;
        ViewForm.ButtonEditPriv.Text             := '';
    end else
    begin
        ViewForm.id_prop_pilg                    := DM.DataSetDocRecord['id_prop_pilg'];
        ViewForm.ButtonEditPriv.Text             := DM.DataSetDocRecord['kod_priv'];
    end;
    ViewForm.id_prop_income                      := DM.DataSetDocRecord['id_prop_income'];
    ViewForm.ButtonEditProp.Text                 := DM.DataSetDocRecord['name_prop'];
    ViewForm.ButtonEditFio.Text                  := DM.DataSetDocRecord['FIO'];
    ViewForm.TextEditTn.Text                     := DM.DataSetDocRecord['tin'];
    ViewForm.MaskEditSumTaxD.EditValue           := DM.DataSetDocRecord['sum_taxn'];
    ViewForm.MaskEditSumDoh.EditValue            := DM.DataSetDocRecord['sum_taxd'];
    ViewForm.MaskEditSumNar.EditValue            := DM.DataSetDocRecord['sum_nar'];
    ViewForm.MaskEditSumTaxN.EditValue           := DM.DataSetDocRecord['sum_doh'];
    if(DM.DataSetDocRecord['date_accept']=null) then
       ViewForm.DateEditCame.EditValue           := null
    else
        ViewForm.DateEditCame.EditValue          := DM.DataSetDocRecord['date_accept'];
    if(DM.DataSetDocRecord['date_dismiss']=null) then
       ViewForm.DateEditLeave.EditValue           := null
    else
       ViewForm.DateEditLeave.EditValue           := DM.DataSetDocRecord['date_dismiss'];


    ViewForm.Caption                   := 'Редагування позицій у документ';

    ViewForm.YesBtn.Caption            := 'Змінити';

    ViewForm.ShowModal;

    if ViewForm.ModalResult = mrOk then
    begin
          DM.StProc.StoredProcName := 'PI_PREPARE_DOC_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('id_doc').AsVariant           := DM.DataSetDocRecord['id_doc'];
          DM.StProc.ParamByName('id_man').AsVariant           := ViewForm.id_man;

          DM.StProc.ParamByName('id_prop_income').AsVariant   := ViewForm.id_prop_income;
          DM.StProc.ParamByName('id_doc_header').AsVariant    := DM.MemoryDataHeader['id_doc_header'];
          if(ViewForm.MaskEditSumNar.Text='') then
              DM.StProc.ParamByName('sum_nar').AsFloat        := 0
          else
              DM.StProc.ParamByName('sum_nar').AsFloat        := ViewForm.MaskEditSumNar.EditValue;
          if(ViewForm.MaskEditSumDoh.Text='') then
              DM.StProc.ParamByName('sum_doh').AsFloat        := 0
          else
              DM.StProc.ParamByName('sum_doh').AsFloat        := ViewForm.MaskEditSumDoh.EditValue;
          if(ViewForm.MaskEditSumTaxN.Text='') then
              DM.StProc.ParamByName('sum_taxn').AsFloat       := 0
          else
              DM.StProc.ParamByName('sum_taxn').AsFloat       := ViewForm.MaskEditSumTaxN.EditValue;
          if(ViewForm.MaskEditSumTaxD.Text='') then
              DM.StProc.ParamByName('sum_taxd').AsFloat       := 0
          else
              DM.StProc.ParamByName('sum_taxd').AsCurrency    := ViewForm.MaskEditSumTaxD.EditValue;
          DM.StProc.ParamByName('prop_pilg').AsVariant        := ViewForm.id_prop_pilg;
          if(ViewForm.DateEditCame.EditValue=null) then
              DM.StProc.ParamByName('date_accept').AsVariant  := null
          else
              DM.StProc.ParamByName('date_accept').AsDate     := ViewForm.DateEditCame.Date;
          if(ViewForm.DateEditLeave.EditValue=null) then
              DM.StProc.ParamByName('date_dismiss').AsVariant := null
          else
              DM.StProc.ParamByName('date_dismiss').AsDate    := ViewForm.DateEditLeave.Date;

          DM.StProc.ExecProc;

      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у роботі процедури PI_PREPARE_DOC_IU!');
        raise;
      end;
      end;
       locate_header := DM.MemoryDataHeader['id_doc_header'];
       locate_id := DM.DataSetDocRecord['id_doc'];
       RefreshBtnClick(self);
       DM.MemoryDataHeader.Locate('id_doc_header', locate_header, []);
       DM.DataSetDocRecord.Locate('id_doc', locate_id, []);

end;
procedure TfmPrepareDocMain.DeleteBtnClick(Sender: TObject);
var
    locate_id : integer;
    locate_cur,locate_header : integer;
begin
      if DM.DataSetDocRecord.RecordCount = 0 then exit;
      locate_header := DM.MemoryDataHeader['id_doc_header'];
      if MessageDlg('Увага', 'Ви дійсно хочете видалити позицію за '+DM.DataSetDocRecord['FIO']+ '?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          locate_cur := DM.DataSetDocRecord['ID_DOC'];
          DM.DataSetDocRecord.Prior;
          locate_id := DM.DataSetDocRecord['ID_DOC'];
          DM.DataSetDocRecord.Next;
          DM.DataSetDocRecord.Locate('ID_DOC', locate_cur, []);

          DM.StProc.StoredProcName := 'PI_PREPARE_DOC_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_DOC').AsInt64 := locate_cur;
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури PI_SP_PROP_INCOME_DEL!');
           raise;
         end;
     end;

     RefreshBtnClick(self);
     DM.MemoryDataHeader.Locate('id_doc_header', locate_header, []);
     DM.DataSetDocRecord.Locate('ID_DOC', locate_id, []);
end;

procedure TfmPrepareDocMain.ClonButtonClick(Sender: TObject);
var
    ViewForm      : TfmPrepareDocAdd;
    locate_id     : integer;
    id_doc, id_doc_header : variant;
begin
    if DM.MemoryDataHeader.RecordCount = 0 then exit;

    ViewForm                           := TfmPrepareDocAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.Caption                   := 'Клонування документа';
    ViewForm.id_doc_header             := null;
    ViewForm.id_type_doc               := DM.MemoryDataHeader['ID_TYPE_DOC'];
    ViewForm.DateEdit.date             := date;
    ViewForm.TextEditNum.Text          := inttostr(ViewForm.numb_pack+1);
    ViewForm.MemoNote.Text             := DM.MemoryDataHeader['NOTE'];
    ViewForm.ButtonEditTypeDoc.Text    := DM.MemoryDataHeader['name_type_doc'];
    ViewForm.OkButton.Caption          := 'Клонувати';
    ViewForm.ShowModal;
      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'PI_DOC_HEADERS_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;

          DM.StProc.ParamByName('ID_DOC_HEADER').AsVariant         := ViewForm.id_doc_header;
          DM.StProc.ParamByName('NUM_DOC').AsInteger               := strtoint(ViewForm.TextEditNum.Text);
          DM.StProc.ParamByName('DATE_DOC').AsDate                 := ViewForm.DateEdit.date ;
          DM.StProc.ParamByName('ID_TYPE_DOC').AsVariant           := ViewForm.id_type_doc;
          DM.StProc.ParamByName('NOTE').AsString                   := ViewForm.MemoNote.Text ;


          DM.StProc.ExecProc;
          id_doc_header := DM.StProc.ParamByName('ID_DOC_HEADER_OUT').AsInteger;

          DM.DataSetDocRecordTmp.Close;
          DM.DataSetDocRecordTmp.SQLs.SelectSQL.Text := 'select * from PI_PREPARE_DOC_SEL (:id_doc_header)';
          DM.DataSetDocRecordTmp.ParamByName('id_doc_header').AsVariant := DM.MemoryDataHeader['ID_DOC_HEADER'];
          DM.DataSetDocRecordTmp.Open;
          DM.DataSetDocRecordTmp.FetchAll;
          DM.DataSetDocRecordTmp.First;

          while  not DM.DataSetDocRecordTmp.Eof do
          begin
              DM.StProc.StoredProcName := 'PI_PREPARE_DOC_IU';
              DM.WriteTransaction.StartTransaction;
              DM.StProc.Prepare;
              DM.StProc.ParamByName('id_doc').AsVariant         := null;
              DM.StProc.ParamByName('id_man').AsVariant         := DM.DataSetDocRecordTmp['id_man'];

              DM.StProc.ParamByName('id_prop_income').AsVariant := DM.DataSetDocRecordTmp['id_prop_income'];
              DM.StProc.ParamByName('id_doc_header').AsVariant  := id_doc_header;
              DM.StProc.ParamByName('sum_nar').AsFloat          := DM.DataSetDocRecordTmp['sum_nar'];
              DM.StProc.ParamByName('sum_doh').AsFloat          := DM.DataSetDocRecordTmp['sum_doh'];
              DM.StProc.ParamByName('sum_taxn').AsFloat         := DM.DataSetDocRecordTmp['sum_taxn'];
              DM.StProc.ParamByName('sum_taxd').AsFloat         := DM.DataSetDocRecordTmp['sum_taxd'];
              DM.StProc.ParamByName('prop_pilg').AsVariant      := DM.DataSetDocRecordTmp['id_prop_pilg'];
              if(DM.DataSetDocRecordTmp['date_accept']=null) then
                  DM.StProc.ParamByName('date_accept').AsVariant  := null
              else
                  DM.StProc.ParamByName('date_accept').AsDate     := DM.DataSetDocRecordTmp['date_accept'];
              if(DM.DataSetDocRecordTmp['date_dismiss']=null) then
                  DM.StProc.ParamByName('date_dismiss').AsVariant := null
              else
                  DM.StProc.ParamByName('date_dismiss').AsDate    := DM.DataSetDocRecordTmp['date_dismiss'];

              DM.StProc.ExecProc;
              DM.DataSetDocRecordTmp.Next;
          end;

      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури PI_DOC_HEADERS_IU!');
        raise;
      end;
      end;
      RefreshBtnClick(self);
      DM.MemoryDataHeader.Locate('ID_DOC_HEADER', id_doc_header, []);
end;

procedure TfmPrepareDocMain.GridDBViewDblClick(Sender: TObject);
var
    locate_id : integer;
begin
    if(id_header_1df=null) or(id_header_1df=0) then exit;

    DM.MemoryDataHeader.Open;
    DM.MemoryDataHeader.Edit;
    if(DM.MemoryDataHeader['added_in_1df']=1) then
        DM.MemoryDataHeader.FieldByName('added_in_1df').Value :=0
    else
        DM.MemoryDataHeader.FieldByName('added_in_1df').Value :=1;
    DM.MemoryDataHeader.Post;
    DM.StProc.StoredProcName := 'PI_DOC_HEADER_UPD_1DF';
    DM.WriteTransaction.StartTransaction;
    DM.StProc.Prepare;
    DM.StProc.ParamByName('ID_DOC_HEADER').AsVariant         := DM.MemoryDataHeader['id_doc_header'];
    if(DM.MemoryDataHeader['added_in_1df']=1) then
    begin
        DM.StProc.ParamByName('ID_HEADER_1df').AsInt64     := id_header_1df;
    end
    else
    begin
        DM.StProc.ParamByName('ID_HEADER_1df').AsVariant     := null;
    end;

    DM.StProc.ExecProc;
    try
          DM.WriteTransaction.Commit;
    except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у роботі процедури PI_DOC_HEADER_UPD_1DF!');
        raise;
    end;
    DM.MemoryDataHeader.Open;
    DM.MemoryDataHeader.Edit;
    if(DM.MemoryDataHeader['added_in_1df']=1) then
    begin
        DM.MemoryDataHeader.FieldByName('info_1df').Value :=info_1df;
    end
    else
    begin
        DM.MemoryDataHeader.FieldByName('info_1df').Value :='';
    end;
    DM.MemoryDataHeader.Post;
end;

procedure TfmPrepareDocMain.dxBarLargeButton2Click(Sender: TObject);
var
    ViewForm      : TfmImportFilter;
    locate_id, locate_header    : integer;
begin
    ViewForm                           := TfmImportFilter.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;
    ViewForm.DateEditCame.Date         := date;
    ViewForm.DateEditLeave.Date        := date;
    ViewForm.id_sch                    := null;

    ViewForm.Caption                   := 'Імпорт позицій у документ за рахунком';
    ViewForm.YesBtn.Caption            := 'Імпортувати';
    ViewForm.ShowModal;



    if ViewForm.ModalResult = mrOk then
    begin
         if(DM.MemoryDataHeader['id_prop_income']=null)  then
          if MessageDlg('Увага', 'Не виставлена ознака за замовчуванням для даного типу документів. Продовжити додавання?', mtConfirmation, [mbYes, mbNo]) = mrNo then
          begin
              exit;
          end;

          DM.WriteTransaction.StartTransaction;
          DM.DataSetSch.Close;
          DM.DataSetSch.SQLs.SelectSQL.Text := 'select * from PI_IMPORT_KASSA (:date_beg,:date_end, :id_sch_kr)';
          DM.DataSetSch.ParamByName('date_beg').AsDate := ViewForm.DateEditCame.Date;
          DM.DataSetSch.ParamByName('date_end').AsDate := ViewForm.DateEditLeave.Date;
          DM.DataSetSch.ParamByName('id_sch_kr').AsVariant := ViewForm.id_sch;
          DM.DataSetSch.Open;
          DM.DataSetSch.FetchAll;
          DM.DataSetSch.First;
          if(DM.DataSetSch.RecordCount<1) then
               ShowMessage('Не знайдені записи за обраний період');
          while not DM.DataSetSch.Eof do
          begin
              DM.StProc.StoredProcName := 'PI_PREPARE_DOC_IU';
              DM.StProc.Prepare;
              DM.StProc.ParamByName('id_doc').AsVariant         := null;
              DM.StProc.ParamByName('id_man').AsVariant         := DM.DataSetSch['ID_MAN'];
              DM.StProc.ParamByName('id_prop_income').AsVariant := DM.MemoryDataHeader['id_prop_income'];
              DM.StProc.ParamByName('id_doc_header').AsVariant  := DM.MemoryDataHeader['id_doc_header'];
              DM.StProc.ParamByName('sum_nar').AsFloat          := 0;
              DM.StProc.ParamByName('sum_doh').AsFloat          := 0;
              DM.StProc.ParamByName('sum_taxn').AsFloat         := 0;
              DM.StProc.ParamByName('sum_taxd').AsFloat         := 0;
              DM.StProc.ParamByName('prop_pilg').AsVariant      := null;
              DM.StProc.ParamByName('date_accept').AsVariant    := null;
              DM.StProc.ParamByName('date_dismiss').AsVariant   := null;

              DM.StProc.ExecProc;
              DM.DataSetSch.Next;
          end;

          try
              DM.WriteTransaction.Commit;
          except
            DM.WriteTransaction.Rollback;
            ShowMessage('Виникли помилки у роботі процедури PI_PREPARE_DOC_IU!');
            raise;
          end;
      end;
       locate_header := DM.MemoryDataHeader['id_doc_header'];
       RefreshBtnClick(self);
       DM.MemoryDataHeader.Locate('id_doc_header', locate_header, []);
     //  DM.DataSetDocRecord.Locate('id_doc', locate_id, []);

end;
procedure TfmPrepareDocMain.ClearBtnClick(Sender: TObject);
var
    locate_id : integer;
    locate_cur,locate_header : integer;
begin
      if DM.DataSetDocRecord.RecordCount = 0 then exit;
      if MessageDlg('Увага', 'Ви дійсно хочете видалити всі позиції за '+datetostr(DM.MemoryDataHeader['date_doc'])+' № '+inttostr(DM.MemoryDataHeader['num_doc'])+ '?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          DM.DataSetDocRecord.First;
          while not Dm.DataSetDocRecord.Eof do
          begin
              locate_header := DM.MemoryDataHeader['id_doc_header'];
              locate_cur := DM.DataSetDocRecord['ID_DOC'];
              DM.DataSetDocRecord.Prior;
              locate_id := DM.DataSetDocRecord['ID_DOC'];
              DM.DataSetDocRecord.Next;
              DM.DataSetDocRecord.Locate('ID_DOC', locate_cur, []);

              DM.StProc.StoredProcName := 'PI_PREPARE_DOC_DEL';
              DM.WriteTransaction.StartTransaction;
              DM.StProc.Prepare;
              DM.StProc.ParamByName('ID_DOC').AsInt64 := locate_cur;
              DM.StProc.ExecProc;

              try
               Dm.WriteTransaction.Commit;
              except
               DM.WriteTransaction.Rollback;
               ShowMessage('Виникли помилки у роботі процедури PI_SP_PROP_INCOME_DEL!');
               raise;
             end;
             Dm.DataSetDocRecord.Next;
         end;
         RefreshBtnClick(self);
         DM.MemoryDataHeader.Locate('id_doc_header', locate_header, []);
         DM.DataSetDocRecord.Locate('ID_DOC', locate_id, []);
      end;
end;

end.
