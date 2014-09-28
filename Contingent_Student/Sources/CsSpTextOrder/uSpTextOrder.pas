unit uSpTextOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, ucs_Types, ibase,
  uSpAddTextOrder,DogLoaderUnit;

type
  TfmSpTextOrderMain = class(TForm)
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
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
    dxBarLargeButton4: TdxBarLargeButton;
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
    procedure RefreshButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure ExitButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
      res:Variant;
      constructor  Create(AParameter:TcsParamPacks);reintroduce;
  end;



implementation

uses DM_SpTextOrder;

{$R *.dfm}

constructor  TfmSpTextOrderMain.Create(AParameter:TcsParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  GridDBView.DataController.DataSource := DM.DataSourceTextOrder;

  RefreshButtonClick(self);

  Screen.Cursor:=crDefault;
end;

procedure TfmSpTextOrderMain.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSetTextOrder.Close;
    DM.DataSetTextOrder.SQLs.SelectSQL.Text := 'select * from CS_DT_TEXT_SHABLONS';
    DM.DataSetTextOrder.Open;
end;

procedure TfmSpTextOrderMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfmSpTextOrderMain.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmSpAddTextOrder;
    locate_id     : integer;
begin
    ViewForm                           := TfmSpAddTextOrder.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_shablon                := null;
    ViewForm.MemoText.Text             := '';

    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_DT_TEXT_SHABLONS_INS_UPD';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('id_shablon_in').AsVariant         := ViewForm.id_shablon;
          DM.StProc.ParamByName('text').AsString                   := ViewForm.MemoText.Text;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('id_shablon').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_DT_TEXT_SHABLONS_INS_UPD!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetTextOrder.Locate('ID_SHABLON', locate_id, []);
end;


procedure TfmSpTextOrderMain.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmSpAddTextOrder;
    locate_id     : integer;
begin
    ViewForm                           := TfmSpAddTextOrder.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_shablon                := DM.DataSetTextOrder['id_shablon'];
    ViewForm.MemoText.Text             := DM.DataSetTextOrder['text'];

    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'CS_DT_TEXT_SHABLONS_INS_UPD';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('id_shablon_in').AsVariant       := ViewForm.id_shablon;
          DM.StProc.ParamByName('text').AsString                 := ViewForm.MemoText.Text;

          DM.StProc.ExecProc;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури CS_DT_TEXT_SHABLONS_INS_UPD!');
        raise;
      end;
      end;
      locate_id := DM.StProc.ParamByName('id_shablon').AsInteger;
       RefreshButtonClick(self);
       DM.DataSetTextOrder.Locate('id_shablon', locate_id, []);
end;

procedure TfmSpTextOrderMain.ExitButtonClick(Sender: TObject);
begin
     close;
end;

procedure TfmSpTextOrderMain.DeleteButtonClick(Sender: TObject);
var
    locate_id : integer;
begin
      if DM.DataSetTextOrder.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити цей текст вступу '+DM.DataSetTextOrder['text']+'?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          DM.StProc.StoredProcName := 'CS_DT_TEXT_SHABLONS_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('id_shablon').AsInt64 := DM.DataSetTextOrder['id_shablon'];
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури CS_DT_TEXT_SHABLONS_DEL!');
           raise;
         end;
     end;
     locate_id := DM.DataSetTextOrder['id_shablon'];
     RefreshButtonClick(self);
     DM.DataSetTextOrder.Locate('id_shablon', locate_id, []);
end;

procedure TfmSpTextOrderMain.dxBarLargeButton4Click(Sender: TObject);
begin
    Res:=VarArrayCreate([0,1],varVariant);
    Res[0] := DM.DataSetTextOrder['id_shablon'];
    Res[1] := DM.DataSetTextOrder['text'];
    ModalResult := mrOk;
end;

end.
