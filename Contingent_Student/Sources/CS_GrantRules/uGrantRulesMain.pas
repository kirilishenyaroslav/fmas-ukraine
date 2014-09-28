unit uGrantRulesMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, uCS_types, uGrantRulesAdd,
  ibase, DogLoaderUnit;

type
  TfmGrantRulesMain = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridDBViewDBColumn1: TcxGridDBColumn;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarButton1: TdxBarButton;
    dxBarLargeButton3: TdxBarLargeButton;
    DisabledLargeImages: TImageList;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
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
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    GridDBViewDBColumn2: TcxGridDBColumn;
    GridDBViewDBColumn3: TcxGridDBColumn;
    GridDBViewDBColumn4: TcxGridDBColumn;
    GridDBViewDBColumn5: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

{var
  fmGrantRulesMain: TfmGrantRulesMain; }

implementation

uses DM_GrantRules;

{$R *.dfm}

constructor  TfmGrantRulesMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  GridDBView.DataController.DataSource := DM.DataSourceGrantRules;

  RefreshButtonClick(self);

  Screen.Cursor:=crDefault;
end;

procedure TfmGrantRulesMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmGrantRulesMain.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSeTGrantRules.Close;
    DM.DataSetGrantRules.SQLs.SelectSQL.Text := 'select * from CS_GRANT_RULES r'+
                                                ' left join  CS_GRANT_SUBTYPE s on r.id_grant_subtype=s.Id_grant_subtype  '+
                                                ' left join  CS_MIN_SUM_GR g on r.ID_MIN_SUM=g.ID_MIN_SUM';
    DM.DataSetGrantRules.Open;
end;

procedure TfmGrantRulesMain.ExitButtonClick(Sender: TObject);
begin
     close;
end;

procedure TfmGrantRulesMain.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmGrantRulesAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmGrantRulesAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_min_sum                := null;
    ViewForm.id_grant_subType          := null;
    ViewForm.id_grant_rules            := null;
    ViewForm.MemoNote.Text             := '';
    ViewForm.DateEditBeg.Date          := date;
    ViewForm.DateEditEnd.Date          := date;
    ViewForm.TextEditAddSum.Text       := '0';
    ViewForm.TextEditKoef.Text         := '1';
    ViewForm.TextEditAllSum.Text       := '0';


    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_GRANT_RULES_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_RULES').AsVariant     := ViewForm.id_grant_rules;
          DM.StProc.ParamByName('ID_GRANT_SUBTYPE').AsVariant   := ViewForm.id_grant_subType;
          DM.StProc.ParamByName('ID_MIN_SUM').AsVariant         := ViewForm.id_min_sum;
          DM.StProc.ParamByName('KOEFF').AsFloat                := strtofloat(ViewForm.TextEditKoef.Text);
          DM.StProc.ParamByName('ADD_SUM').AsCurrency           := strtocurr(ViewForm.TextEditAddSum.Text);
          DM.StProc.ParamByName('DATE_BEG').AsDate              := ViewForm.DateEditBeg.Date;
          DM.StProc.ParamByName('DATE_END').AsDate              := ViewForm.DateEditEnd.Date;
          DM.StProc.ParamByName('NOTE').AsString                := ViewForm.MemoNote.Text;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_GRANT_RULES_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_GRANT_RULES_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetGrantRules.Locate('ID_GRANT_RULES', locate_id, []);
end;

procedure TfmGrantRulesMain.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmGrantRulesAdd;
    locate_id     : integer;
    summa_all     : double;
begin

    ViewForm                           := TfmGrantRulesAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_min_sum                := DM.DataSetGrantRules['ID_MIN_SUM'];
    ViewForm.id_grant_subType          := DM.DataSetGrantRules['ID_GRANT_SUBTYPE'];
    ViewForm.ButtonEditSubType.Text    := DM.DataSetGrantRules['NAME_SUBTYPE'];
    ViewForm.ButtonEditMinGrant.Text   := floattostr(DM.DataSetGrantRules['SUMMA']);
    ViewForm.id_grant_rules            := DM.DataSetGrantRules['ID_GRANT_RULES'];
    ViewForm.MemoNote.Text             := DM.DataSetGrantRules['NOTE'];
    ViewForm.DateEditBeg.Date          := DM.DataSetGrantRules['DATE_BEG'];
    ViewForm.DateEditEnd.Date          := DM.DataSetGrantRules['DATE_END'];
    ViewForm.TextEditAddSum.Text       := floattostr(DM.DataSetGrantRules['ADD_SUM']);
    ViewForm.TextEditKoef.Text         := floattostr(DM.DataSetGrantRules['KOEFF']);

    summa_all := strtofloat(ViewForm.ButtonEditMinGrant.Text)*strtofloat(ViewForm.TextEditKoef.Text)+ strtofloat(ViewForm.TextEditAddSum.Text);
    ViewForm.TextEditAllSum.Text := floattostr(summa_all);

    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_GRANT_RULES_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_RULES').AsVariant     := ViewForm.id_grant_rules;
          DM.StProc.ParamByName('ID_GRANT_SUBTYPE').AsVariant   := ViewForm.id_grant_subType;
          DM.StProc.ParamByName('ID_MIN_SUM').AsVariant         := ViewForm.id_min_sum;
          DM.StProc.ParamByName('KOEFF').AsFloat                := strtofloat(ViewForm.TextEditKoef.Text);
          DM.StProc.ParamByName('ADD_SUM').AsCurrency           := strtocurr(ViewForm.TextEditAddSum.Text);
          DM.StProc.ParamByName('DATE_BEG').AsDate              := ViewForm.DateEditBeg.Date;
          DM.StProc.ParamByName('DATE_END').AsDate              := ViewForm.DateEditEnd.Date;
          DM.StProc.ParamByName('NOTE').AsString                := ViewForm.MemoNote.Text;

          DM.StProc.ExecProc;
          locate_id := DM.DataSetGrantRules['ID_GRANT_RULES'];
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_GRANT_RULES_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetGrantRules.Locate('ID_GRANT_RULES', locate_id, []);
end;


procedure TfmGrantRulesMain.DeleteButtonClick(Sender: TObject);
var
    locate_id : integer;
begin
      if DM.DataSetGrantRules.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити стипендію '+DM.DataSetGrantRules['NAME_SUBTYPE'] + ' за період '+datetostr(DM.DataSetGrantRules['DATE_BEG'])+'-'+datetostr(DM.DataSetGrantRules['DATE_END'])+'?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          DM.StProc.StoredProcName := 'CS_GRANT_RULES_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_GRANT_RULES').AsInt64 := DM.DataSetGrantRules['ID_GRANT_RULES'];
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури CS_GRANT_RULES_DEL!');
           raise;
         end;
     end;
     locate_id := DM.DataSetGrantRules['ID_MIN_SUM'];
     RefreshButtonClick(self);
     DM.DataSetGrantRules.Locate('ID_MIN_SUM', locate_id, []);
end;

end.
