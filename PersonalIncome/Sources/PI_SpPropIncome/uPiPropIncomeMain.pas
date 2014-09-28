unit uPiPropIncomeMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, ImgList, dxBar,
  dxBarExtItems, cxGridLevel, cxGridCustomTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, upi_resources, uPiPropIncomeAdd,
  DogLoaderUnit;

type
  TfmPropIncome = class(TForm)
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
    GridDBViewDBColumn2: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitButtonClick(Sender: TObject);
    procedure RefreshButtonClick(Sender: TObject);
    procedure dxBarLargeButton3Click(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure dxBarLargeButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
      res : Variant;
      constructor  Create(AParameter:TpiParamPacks);reintroduce;
  end;

var
  fmPropIncome: TfmPropIncome;

implementation
uses DMPiPropIncome;

{$R *.dfm}

constructor  TfmPropIncome.Create(AParameter:TpiParamPacks);
begin
  Screen.Cursor := crHourGlass;

  inherited Create(AParameter.Owner);

  DM := TDM.Create(Self);
  DM.DB.Handle:=AParameter.DB_Handle;
  DM.DB.Connected := True;

  GridDBView.DataController.DataSource := DM.DataSourceProp;

  RefreshButtonClick(self);

  Screen.Cursor:=crDefault;
end;

procedure TfmPropIncome.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then action:=caFree;
end;

procedure TfmPropIncome.ExitButtonClick(Sender: TObject);
begin
     close;
end;

procedure TfmPropIncome.RefreshButtonClick(Sender: TObject);
begin
    DM.DataSetProp.Close;
    DM.DataSetProp.SQLs.SelectSQL.Text := 'select * from PI_SP_PROP_INCOME order by kod_prop';
    DM.DataSetProp.Open;
end;

procedure TfmPropIncome.dxBarLargeButton3Click(Sender: TObject);
var
    ViewForm      : TfmPropIncomeAdd;
    locate_id     : integer;
begin
    ViewForm                           := TfmPropIncomeAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.id_prop                   := null;
    ViewForm.TextEditKod.Text          := '';
    ViewForm.MemoName.Text             := '';

    ViewForm.Caption                   := 'Додавання ознаки дохода';

    ViewForm.OkButton.Caption          := 'Додати';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'PI_SP_PROP_INCOME_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_PROP_INCOME').AsVariant         := ViewForm.id_prop;
          DM.StProc.ParamByName('KOD_PROP').AsInteger               := strtoint(ViewForm.TextEditKod.Text);
          DM.StProc.ParamByName('NAME_PROP').AsString               := ViewForm.MemoName.Text ;

          DM.StProc.ExecProc;
          locate_id := DM.StProc.ParamByName('ID_PROP_INCOME_OUT').AsInteger;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури PI_SP_PROP_INCOME_IU!');
        raise;
      end;
      end;
       RefreshButtonClick(self);
       DM.DataSetProp.Locate('ID_PROP_INCOME', locate_id, []);
end;


procedure TfmPropIncome.EditButtonClick(Sender: TObject);
var
    ViewForm      : TfmPropIncomeAdd;
    locate_id     : integer;
begin
    if DM.DataSetProp.RecordCount = 0 then exit;

    ViewForm                           := TfmPropIncomeAdd.Create(self);
    ViewForm.DB_handle                 := DM.DB.Handle;

    ViewForm.Caption                   := 'Редагування ознаки дохода';

    ViewForm.id_prop                   := DM.DataSetProp['ID_PROP_INCOME'];
    ViewForm.TextEditKod.Text          := DM.DataSetProp['KOD_PROP'];
    ViewForm.MemoName.Text             := DM.DataSetProp['NAME_PROP'];

    ViewForm.OkButton.Caption          := 'Змінити';

    ViewForm.ShowModal;

      if ViewForm.ModalResult = mrOk then
      begin

          DM.StProc.StoredProcName := 'PI_SP_PROP_INCOME_IU';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_PROP_INCOME').AsVariant        := ViewForm.id_prop;
          DM.StProc.ParamByName('KOD_PROP').AsInteger              := strtoint(ViewForm.TextEditKod.Text);
          DM.StProc.ParamByName('NAME_PROP').AsString              := ViewForm.MemoName.Text;

          DM.StProc.ExecProc;
      try
          DM.WriteTransaction.Commit;
      except
        DM.WriteTransaction.Rollback;
        ShowMessage('Виникли помилки у работі процедури PI_SP_PROP_INCOME_IU!');
        raise;
      end;
      end;
      locate_id := DM.DataSetProp['ID_PROP_INCOME'];
      RefreshButtonClick(self);
      DM.DataSetProp.Locate('ID_PROP_INCOME', locate_id, []);
end;

procedure TfmPropIncome.DeleteButtonClick(Sender: TObject);
var
    locate_id : integer;
    locate_cur : integer;
begin
      if DM.DataSetProp.RecordCount = 0 then exit;

      if MessageDlg('Увага', 'Ви дійсно хочете видалити ознаку доходу під кодом № '+inttostr(DM.DataSetProp['KOD_PROP'])+'?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          locate_cur := DM.DataSetProp['ID_PROP_INCOME'];
          DM.DataSetProp.Prior;
          locate_id := DM.DataSetProp['ID_PROP_INCOME'];
          DM.DataSetProp.Next;
          DM.DataSetProp.Locate('ID_PROP_INCOME', locate_cur, []);

          DM.StProc.StoredProcName := 'PI_SP_PROP_INCOME_DEL';
          DM.WriteTransaction.StartTransaction;
          DM.StProc.Prepare;
          DM.StProc.ParamByName('ID_PROP_INCOME').AsInt64 := locate_cur;
          DM.StProc.ExecProc;

          try
           Dm.WriteTransaction.Commit;
          except
           DM.WriteTransaction.Rollback;
           ShowMessage('Виникли помилки у роботі процедури PI_SP_PROP_INCOME_DEL!');
           raise;
         end;
     end;

     RefreshButtonClick(self);
     DM.DataSetProp.Locate('ID_PROP_INCOME', locate_id, []);
end;

procedure TfmPropIncome.dxBarLargeButton4Click(Sender: TObject);
begin
    if DM.DataSetProp.RecordCount = 0 then exit;
    Res:=VarArrayCreate([0,2],varVariant);
    Res[0] := DM.DataSetProp['ID_PROP_INCOME'];
    Res[1] := DM.DataSetProp['KOD_PROP'];
    Res[2] := DM.DataSetProp['NAME_PROP'];
    ModalResult := mrOk;
end;

end.
