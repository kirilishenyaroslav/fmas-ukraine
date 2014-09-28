unit uSpMinGrantMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxGridTableView,
  ImgList, dxBar, dxBarExtItems, cxGridLevel, cxGridCustomTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, ucs_types,
  uSpMinGrantAdd,DogLoaderUnit,DateUtils;

type
  TfmSpMinGrantMain = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    BarManager: TdxBarManager;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
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
    GridDBViewDBColumn1: TcxGridDBColumn;
    GridDBViewDBColumn2: TcxGridDBColumn;
    GridDBViewDBColumn3: TcxGridDBColumn;
    SelButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure SelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
        res:Variant;
        constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;

var
  fmSpMinGrantMain: TfmSpMinGrantMain;

implementation

uses DM_SpMinGrant;

{$R *.dfm}

constructor  TfmSpMinGrantMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  GridDBView.DataController.DataSource := DM.DataSourceMinGrant;

  RefreshButtonClick(self);

  Screen.Cursor:=crDefault;
end;


procedure TfmSpMinGrantMain.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmSpGrantMinAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmSpGrantMinAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.TextEditMinSum.Text         := '';

    ViewForm.DateEditBeg.Date          := date;
    ViewForm.DateEditEnd.Date          := date;
    ViewForm.id_min_sum                := null;
    ViewForm.MemoNote.Text             := '';

    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin
          DM.WriteTransaction.StartTransaction;

          if(ViewForm.close_record =1) then
          begin
             DM.StProc.StoredProcName := 'CS_MIN_SUM_GR_IU';
             DM.StProc.Prepare;
             DM.StProc.ParamByName('ID_MIN_SUM').AsVariant         := DM.DataSetCheck['ID_MIN_SUM'];
             DM.StProc.ParamByName('SUMMA').AsCurrency             := DM.DataSetCheck['SUMMA'];
             DM.StProc.ParamByName('DATE_BEG').AsDate              := DM.DataSetCheck['DATE_BEG'];
             DM.StProc.ParamByName('DATE_END').AsDate              := IncDay(ViewForm.DateEditBeg.Date,-1);
             DM.StProc.ParamByName('NOTE').AsString                := DM.DataSetCheck['NOTE'];

          DM.StProc.ExecProc;
          end;
          DM.StProc.StoredProcName := 'CS_MIN_SUM_GR_IU';
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_MIN_SUM').AsVariant         := ViewForm.id_min_sum;
          DM.StProc.ParamByName('SUMMA').AsCurrency             := StrToCurr(ViewForm.TextEditMinSum.Text);
          DM.StProc.ParamByName('DATE_BEG').AsDate              := ViewForm.DateEditBeg.Date;
          DM.StProc.ParamByName('DATE_END').AsDate              := ViewForm.DateEditEnd.Date;
          DM.StProc.ParamByName('NOTE').AsString                := ViewForm.MemoNote.Text;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_MIN_SUM_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_MIN_SUM_GR_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetMinGrant.Locate('ID_MIN_SUM', locate_id, []);
end;

procedure TfmSpMinGrantMain.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSetMinGrant.Close;
    DM.DataSetMinGrant.SQLs.SelectSQL.Text := 'select * from CS_MIN_SUM_GR order by date_beg';
    DM.DataSetMinGrant.Open;
    If (DM.DataSetMinGrant.IsEmpty) then
    begin
        EditButton.Enabled         := false;
        DeleteButton.Enabled       := false;
        SelButton.Enabled  := false;
    end else
    begin
        EditButton.Enabled         := true;
        DeleteButton.Enabled       := true;
        SelButton.Enabled  := true;
    end;
end;

procedure TfmSpMinGrantMain.ExitButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmSpMinGrantMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree
end;

procedure TfmSpMinGrantMain.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmSpGrantMinAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmSpGrantMinAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.TextEditMinSum.Text         := DM.DataSetMinGrant['SUMMA'];

    ViewForm.DateEditBeg.Date          := DM.DataSetMinGrant['DATE_BEG'];
    ViewForm.DateEditEnd.Date          := DM.DataSetMinGrant['DATE_END'];
    ViewForm.id_min_sum                := DM.DataSetMinGrant['ID_MIN_SUM'];
    ViewForm.MemoNote.Text             := DM.DataSetMinGrant['NOTE'];

    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_MIN_SUM_GR_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_MIN_SUM').AsVariant         := ViewForm.id_min_sum;
          DM.StProc.ParamByName('SUMMA').AsCurrency             := StrToCurr(ViewForm.TextEditMinSum.Text);
          DM.StProc.ParamByName('DATE_BEG').AsDate              := ViewForm.DateEditBeg.Date;
          DM.StProc.ParamByName('DATE_END').AsDate              := ViewForm.DateEditEnd.Date;
          DM.StProc.ParamByName('NOTE').AsString                := ViewForm.MemoNote.Text;

          DM.StProc.ExecProc;
          locate_id := DM.DataSetMinGrant['ID_MIN_SUM'];
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_MIN_SUM_GR_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetMinGrant.Locate('ID_MIN_SUM', locate_id, []);
end;

procedure TfmSpMinGrantMain.DeleteButtonClick(Sender: TObject);
var
    locate_id, locate_cur : integer;
    result_proc : integer;
begin
      if DM.DataSetMinGrant.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити мінимальну стипендію розміром '+CurrToStr(DM.DataSetMinGrant['SUMMA']) + ' за період '+datetostr(DM.DataSetMinGrant['DATE_BEG'])+'-'+datetostr(DM.DataSetMinGrant['DATE_END'])+'?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          locate_cur := DM.DataSetMinGrant['ID_MIN_SUM'];
          DM.DataSetMinGrant.Prior;
          locate_id := DM.DataSetMinGrant['ID_MIN_SUM'];
          DM.DataSetMinGrant.Locate('ID_MIN_SUM', locate_cur, []);

          DM.StProc.StoredProcName := 'CS_MIN_SUM_GR_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_MIN_SUM').AsInt64 := DM.DataSetMinGrant['ID_MIN_SUM'];
          DM.StProc.ExecProc;

          result_proc := DM.StProc.ParamByName('DEPEND_OUT').AsInteger;
          if result_proc=1 then
          begin
              showmessage('Неможливо видалити запис. Він використовується!');
              exit;
          end;
          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури CS_MIN_SUM_GR_DEL!');
           raise;
         end;
     end;
     RefreshButtonClick(self);
     DM.DataSetMinGrant.Locate('ID_MIN_SUM', locate_id, []);
end;

procedure TfmSpMinGrantMain.SelButtonClick(Sender: TObject);
begin
    Res:=VarArrayCreate([0,3],varVariant);
    Res[0] := DM.DataSetMinGrant['ID_MIN_SUM'];
    Res[1] := DM.DataSetMinGrant['SUMMA'];
    Res[2] := DM.DataSetMinGrant['DATE_BEG'];
    Res[3] := DM.DataSetMinGrant['DATE_END'];
    ModalResult := mrOk;
end;

end.
